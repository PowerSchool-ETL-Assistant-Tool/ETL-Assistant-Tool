var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "EARLY_LEARNING";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
		try {

			var signatureFormatName = signature.getFormat().getFormatName();
			print("Loading using signature file ${signatureFormatName}\n");


			//Initialize path and lineage variables.
			var normalizedFile = AppUtil.createResultsFile(file);

			print("Normalized file: ${normalizedFile}");

			var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
			var lineNumber = 0;
			const fileFullName = file.getFullName();

			//Process data file records.
			_dataflow.create("RECORD BUILD")
				.input("INPUT", AppUtil.getInputDataflow(file, signature))
				.transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {

					json.LINEAGE_FILE = fileFullName;
					json.LINEAGE_LINE = (++lineNumber).toString();
					output.RECORDS.put(json);
				})
				.group_by("ADMINISTRATION GROUPING" , function(one, two){

					try {
						var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
						var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

						return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
					}

				})
				.transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
					try{
						if(!multipleRowsPerGroupingExpected && rows.length > 1){

							//Report error for each row
							rows.forEach(function(row){
								AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
							});

						} else {
							output.RECORDS.put(rows);
						}
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
					}
				})
				.transform("NORMALIZE RECORDS", ["RECORDS"],
					function(output, rows) {
						try{

							var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

							normalizedRecords.forEach(function(record){
								output.RECORDS.put(record);
							});

						} catch(exception) {
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
						}


					})
				.transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
					try {
						var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

						// Report when no scores are found.
						if(mappingObject.SCORE_MAPPINGS.length === 0){
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
						} else {
							output.RECORDS.put(row);
						}
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
					}
				})
				.output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
				.execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

			return normalizedFile;

		} catch(exception) {
			throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
		}n
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function(file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

     //TODO update scoresToMap
    var scoresToMap = [
        {TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_SCR_PN", FIELD: "EARLY_LITERACY+/PICTURE_NAMING/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_PN", FIELD: "EARLY_LITERACY+/PICTURE_NAMING/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_SCR_PN", FIELD: "EARLY_LITERACY+/PICTURE_NAMING/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_PN", FIELD: "EARLY_LITERACY+/PICTURE_NAMING/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_SCR_PN", FIELD: "EARLY_LITERACY+/PICTURE_NAMING/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_PN", FIELD: "EARLY_LITERACY+/PICTURE_NAMING/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_SCR_PN", FIELD: "EARLY_LITERACY+/PICTURE_NAMING/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_PN", FIELD: "EARLY_LITERACY+/PICTURE_NAMING/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_SCR_RHY", FIELD: "EARLY_LITERACY+/RHYMING/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_RHY", FIELD: "EARLY_LITERACY+/RHYMING/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_SCR_RHY", FIELD: "EARLY_LITERACY+/RHYMING/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_RHY", FIELD: "EARLY_LITERACY+/RHYMING/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_SCR_RHY", FIELD: "EARLY_LITERACY+/RHYMING/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_RHY", FIELD: "EARLY_LITERACY+/RHYMING/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_SCR_RHY", FIELD: "EARLY_LITERACY+/RHYMING/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_RHY", FIELD: "EARLY_LITERACY+/RHYMING/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_SCR_SI", FIELD: "EARLY_LITERACY+/SOUND_ID/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_SI", FIELD: "EARLY_LITERACY+/SOUND_ID/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_SCR_SI", FIELD: "EARLY_LITERACY+/SOUND_ID/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_SI", FIELD: "EARLY_LITERACY+/SOUND_ID/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_SCR_SI", FIELD: "EARLY_LITERACY+/SOUND_ID/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_SI", FIELD: "EARLY_LITERACY+/SOUND_ID/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_SCR_SI", FIELD: "EARLY_LITERACY+/SOUND_ID/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_SI", FIELD: "EARLY_LITERACY+/SOUND_ID/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_SCR_WODB", FIELD: "EARLY_LITERACY+/WODB/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_WODB", FIELD: "EARLY_LITERACY+/WODB/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_SCR_WODB", FIELD: "EARLY_LITERACY+/WODB/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_WODB", FIELD: "EARLY_LITERACY+/WODB/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_SCR_WODB", FIELD: "EARLY_LITERACY+/WODB/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_WODB", FIELD: "EARLY_LITERACY+/WODB/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_SCR_WODB", FIELD: "EARLY_LITERACY+/WODB/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_WODB", FIELD: "EARLY_LITERACY+/WODB/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_SCR_ITR", FIELD: "EARLY_LITERACY+/ALLITERATION/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"FALL_ITR", FIELD: "EARLY_LITERACY+/ALLITERATION/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_SCR_ITR", FIELD: "EARLY_LITERACY+/ALLITERATION/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"WINTER_ITR", FIELD: "EARLY_LITERACY+/ALLITERATION/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_SCR_ITR", FIELD: "EARLY_LITERACY+/ALLITERATION/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SPRING_ITR", FIELD: "EARLY_LITERACY+/ALLITERATION/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_SCR_ITR", FIELD: "EARLY_LITERACY+/ALLITERATION/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_LIT", CODE:"SUMMER_ITR", FIELD: "EARLY_LITERACY+/ALLITERATION/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"FALL_SCR_ORC", FIELD: "EARLY_NUMERACY/ORAL_COUNTING/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"FALL_ORC", FIELD: "EARLY_NUMERACY/ORAL_COUNTING/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"WINTER_SCR_ORC", FIELD: "EARLY_NUMERACY/ORAL_COUNTING/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"WINTER_ORC", FIELD: "EARLY_NUMERACY/ORAL_COUNTING/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SPRING_SCR_ORC", FIELD: "EARLY_NUMERACY/ORAL_COUNTING/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SPRING_ORC", FIELD: "EARLY_NUMERACY/ORAL_COUNTING/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SUMMER_SCR_ORC", FIELD: "EARLY_NUMERACY/ORAL_COUNTING/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SUMMER_ORC", FIELD: "EARLY_NUMERACY/ORAL_COUNTING/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"FALL_SCR_QCM", FIELD: "EARLY_NUMERACY/QUANTITY_COMPARISON/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"FALL_QCM", FIELD: "EARLY_NUMERACY/QUANTITY_COMPARISON/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"WINTER_SCR_QCM", FIELD: "EARLY_NUMERACY/QUANTITY_COMPARISON/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"WINTER_QCM", FIELD: "EARLY_NUMERACY/QUANTITY_COMPARISON/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SPRING_SCR_QCM", FIELD: "EARLY_NUMERACY/QUANTITY_COMPARISON/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SPRING_QCM", FIELD: "EARLY_NUMERACY/QUANTITY_COMPARISON/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SUMMER_SCR_QCM", FIELD: "EARLY_NUMERACY/QUANTITY_COMPARISON/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SUMMER_QCM", FIELD: "EARLY_NUMERACY/QUANTITY_COMPARISON/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"FALL_SCR_NUM", FIELD: "EARLY_NUMERACY/NUMBER_NAMING/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"FALL_NUM", FIELD: "EARLY_NUMERACY/NUMBER_NAMING/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"WINTER_SCR_NUM", FIELD: "EARLY_NUMERACY/NUMBER_NAMING/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"WINTER_NUM", FIELD: "EARLY_NUMERACY/NUMBER_NAMING/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SPRING_SCR_NUM", FIELD: "EARLY_NUMERACY/NUMBER_NAMING/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SPRING_NUM", FIELD: "EARLY_NUMERACY/NUMBER_NAMING/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SUMMER_SCR_NUM", FIELD: "EARLY_NUMERACY/NUMBER_NAMING/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SUMMER_NUM", FIELD: "EARLY_NUMERACY/NUMBER_NAMING/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"FALL_SCR_COR", FIELD: "EARLY_NUMERACY/1-TO-1_CORRESPONDENCE_COUNTING/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"FALL_COR", FIELD: "EARLY_NUMERACY/1-TO-1_CORRESPONDENCE_COUNTING/FALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"WINTER_SCR_COR", FIELD: "EARLY_NUMERACY/1-TO-1_CORRESPONDENCE_COUNTING/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"WINTER_COR", FIELD: "EARLY_NUMERACY/1-TO-1_CORRESPONDENCE_COUNTING/WINTER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SPRING_SCR_COR", FIELD: "EARLY_NUMERACY/1-TO-1_CORRESPONDENCE_COUNTING/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SPRING_COR", FIELD: "EARLY_NUMERACY/1-TO-1_CORRESPONDENCE_COUNTING/SPRING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SUMMER_SCR_COR", FIELD: "EARLY_NUMERACY/1-TO-1_CORRESPONDENCE_COUNTING/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_EARLY_NUM", CODE:"SUMMER_COR", FIELD: "EARLY_NUMERACY/1-TO-1_CORRESPONDENCE_COUNTING/SUMMER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"FALL_SCR_SCEM", FIELD: "PROLADR/SOCIAL_AND_EMOTIONAL/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"WINTER_SCR_SCEM", FIELD: "PROLADR/SOCIAL_AND_EMOTIONAL/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SPRING_SCR_SCEM", FIELD: "PROLADR/SOCIAL_AND_EMOTIONAL/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SUMMER_SCR_SCEM", FIELD: "PROLADR/SOCIAL_AND_EMOTIONAL/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"FALL_SCR_L&L", FIELD: "PROLADR/LANGUAGE_AND_LITERACY/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"WINTER_SCR_L&L", FIELD: "PROLADR/LANGUAGE_AND_LITERACY/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SPRING_SCR_L&L", FIELD: "PROLADR/LANGUAGE_AND_LITERACY/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SUMMER_SCR_L&L", FIELD: "PROLADR/LANGUAGE_AND_LITERACY/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"FALL_SCR_COG", FIELD: "PROLADR/COGNITIVE/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"WINTER_SCR_COG", FIELD: "PROLADR/COGNITIVE/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SPRING_SCR_COG", FIELD: "PROLADR/COGNITIVE/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SUMMER_SCR_COG", FIELD: "PROLADR/COGNITIVE/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"FALL_SCR_P&M", FIELD: "PROLADR/PHYSICAL_AND_MOTOR/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"WINTER_SCR_P&M", FIELD: "PROLADR/PHYSICAL_AND_MOTOR/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SPRING_SCR_P&M", FIELD: "PROLADR/PHYSICAL_AND_MOTOR/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SUMMER_SCR_P&M", FIELD: "PROLADR/PHYSICAL_AND_MOTOR/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"FALL_SCR_APTL", FIELD: "PROLADR/APPROACHES_TO_LEARNING/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"WINTER_SCR_APTL", FIELD: "PROLADR/APPROACHES_TO_LEARNING/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SPRING_SCR_APTL", FIELD: "PROLADR/APPROACHES_TO_LEARNING/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SUMMER_SCR_APTL", FIELD: "PROLADR/APPROACHES_TO_LEARNING/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"FALL_SCR_C&AR", FIELD: "PROLADR/CREATIVITY_AND_THE_ARTS/FALL_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"WINTER_SCR_C&AR", FIELD: "PROLADR/CREATIVITY_AND_THE_ARTS/WINTER_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SPRING_SCR_C&AR", FIELD: "PROLADR/CREATIVITY_AND_THE_ARTS/SPRING_SCREENING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EARLY_LEARN_PROLADR", CODE:"SUMMER_SCR_C&AR", FIELD: "PROLADR/CREATIVITY_AND_THE_ARTS/SUMMER_SCREENING", MAP_FUNCTION: mapScaledScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "10": "10",
        "Grade 10": "10",
        "11": "11",
        "Grade 11": "11",
        "12": "12",
        "Grade 12": "12",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
       "Adv" : "Advanced"
       , "Advanced" : "Advanced"
       ,"Bas" : "Basic"
       ,"Basic" : "Basic"
       ,"Bel" : "Below Basic"
       ,"Below Basic" : "Below Basic"
       ,"Pro" : "Proficient"
       ,"Proficient" : "Proficient"
       ,"" : null
       ,null : null
      };

    var passDecode = {
       "Adv" : "Yes"
       ,"Advanced" : "Yes"
       ,"Bas" : "No"
       ,"Basic" : "No"
       ,"Bel" : "No"
       ,"Below Basic" : "No"
       ,"Pro" : "Yes"
       ,"Proficient" : "Yes"
       ,"" : null
       ,null : null
      };
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/

    /**
     * Maps normalized records for given group of rows.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param rows A JSON array of record objects being processed
     * @returns {Array}
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        var record = mapNormalizedRecord(signature, hierarchy, row);

        AppUtil.nullSafePush(normalizedRecords, record);

        return normalizedRecords;
    }

    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     * @returns {Object}
     */
    function mapNormalizedRecord(signature, hierarchy, row) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
            }
        });

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
    }

    /***********************************************************************************
     Assessment-specific administration functions
     ***********************************************************************************/

    /**
     * Maps normalized administration fields based on a given set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     */
    var period;
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var recentDate;
        if(period === "FALL") {
            recentDate = "09/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
        } else if(period === "WINTER") {
            recentDate = "01/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
        } else if(period ==="SPRING") {
            recentDate = "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
        } else if(period ==="SUMMER") {
            recentDate = "06/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
        }
        else {
            recentDate = "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
        }
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                    break;
                case "SYS_PARTITION_VALUE":
                    record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                    break;
                case "TENANT_CODE":
                    record.TENANT_CODE = AssessmentLoader.config.TENANT_CODE;
                    break;
                case "DISTRICT_CODE":
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = _util.coalesce(period,hierarchy.REPORTING_PERIOD);
//                    print("${period}\n");
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = recentDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;

                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(row) {
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        }
        admin.TEST_INTERVENTION_DESC  = row.getField("INTERVENTION_CODE");
        
        return admin;
    }
    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testFall = (testMetadata.CODE.indexOf("FALL")>-1);
        var testWinter = (testMetadata.CODE.indexOf("WINTER")>-1);
        var testSpring = (testMetadata.CODE.indexOf("SPRING")>-1);
        var testSummer = (testMetadata.CODE.indexOf("SUMMER")>-1);
        var numVal;
//iterating a loop of 1 to 4 & giving the no. to only those fields which doesn't have "SCREENING" to match logical name
        for(var i=1; i<5; i++) {
            testMetadata.FIELD.indexOf("SCREENING")>-1 ? numVal = "" : numVal = "_"+i;
            var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + numVal;
            var scaleScore = row.getField(testMetadata.FIELD + numVal + "/SCALED_SCORE");
            var rawScore = row.getField(testMetadata.FIELD + numVal + "/RAW_SCORE");
            var DateOfAdmin = row.getField(testMetadata.FIELD + numVal +  "/DATE_OF_ADMINISTRATION");
            var tier = row.getField(testMetadata.FIELD + numVal +  "/TIER");
        }

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === "n/a") {
            return null;
        }

        if(testFall){
            period = "FALL";
        }else if(testWinter){
            period = "WINTER";
        }else if(testSpring){
            period = "SPRING";
        }else if(testSummer){
            period = "SUMMER";
        }else{
            period = "ALL";
        }
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(rawScore)){
            score["TEST_RAW_SCORE"] = rawScore;
        }
        score["TEST_SCORE_ATTRIBUTES"] = DateOfAdmin;
    	score["TEST_PRIMARY_RESULT"] = tier;


        return score;
    }

//    print(testMetadata.CODE + "\n");
    /***************************************************************************
     Utility Functions
     ***************************************************************************/
    /**
     * Determines if two assessment records are for the same assessment admin
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param one The first assessment record being compared
     * @param two The second assessment record being compared
     * @returns {number}
     */
    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {
        try {
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);

            if(assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }
        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }
    }

    function getTestAdminDate(row, year) {
        if((row.getField("TEST_DATE")!==undefined) && (row.getField("TEST_DATE") !== null)){
            if(row.getField("TEST_DATE").indexOf("/") >-1){
                return AppUtil.getDateObjByPattern(row.getField("TEST_DATE"), "MM/dd/yyyy").STANDARD_DATE;
            }else if(row.getField("TEST_DATE").indexOf("-") >-1){
                return AppUtil.getDateObjByPattern(row.getField("TEST_DATE"), "yyyy-MM-dd").STANDARD_DATE;
            }
        }
          else {
            return '05/15/' + year.substring(5, 9);
          }
        }
    /**
     * Generates an Assessment Admin Key using a combination of hierarchy values and natural keys from an assessment signature
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param srcRecord The assessment record being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());