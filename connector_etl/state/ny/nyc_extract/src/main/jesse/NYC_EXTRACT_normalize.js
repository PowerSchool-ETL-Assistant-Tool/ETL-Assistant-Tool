var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "nyc_extract";
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
			print("Loading using signature file ${signatureFormatName}");


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
		}
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
        {TEST: "NYC_EXTRACT", CODE:"ELA", FIELD: "ELA_", MAP_FUNCTION: mapScore}
        ,{TEST: "NYC_EXTRACT", CODE:"STM", FIELD: "MATH_", MAP_FUNCTION: mapScore}
        ,{TEST: "NYC_EXTRACT", CODE:"SCI", FIELD: "SCI_", MAP_FUNCTION: mapScore}
        ,{TEST: "NYC_EXTRACT", CODE:"LIS", FIELD: "_LISTENING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYC_EXTRACT", CODE:"SP", FIELD: "_SPEAKING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYC_EXTRACT", CODE:"RD", FIELD: "_READING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYC_EXTRACT", CODE:"WR", FIELD: "_WRITING_", MAP_FUNCTION: mapSubScore}
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
        "13" : "13",
        "Grade 13" : "13",
        "14" : "14",
        "Grade 14" : "14",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

    var passDecode = {
       "4" : "Yes"
       ,"3" : "Yes"
       ,"2" : "No"
       ,"1" : "No"
       ,"Level 1" : "No"
       ,"Level 2" : "No"
       ,"Level 3" : "Yes"
       ,"Level 4" : "Yes"
       ,"ABS" : "No"
       ,"" : null
       ,null : null
      };

    var primaryDecode = {
       "1": "Well Below Proficient In Standard"
       ,"2": "Partially Proficient In Standard"
       ,"3": "Proficient In Standard"
       ,"4": "Excel In Standard"
       ,"ABS" : "ABS"
       ,"" : null
       ,null : null
      };

      var decileDecode = {
      "0": "0",
      "0-10" : "1",
      "11-20" : "2",
      "21-30" : "3",
      "31-40" : "4",
      "41-50" : "5",
      "51-60" : "6",
      "61-70" : "7",
      "71-80" : "8",
      "81-90" : "9",
      "91-100" : "10",
       "" : null,
       null : null
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

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata,signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
            }
        });

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
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

        var fullName = row.getField("STUDENT_NAME").split(' ')
        var lastName = null;
        var firstName = null;
        var middleName = null;
        if(fullName.length === 4){
            lastName = fullName[0];
            firstName = fullName[1]+' '+fullName[2];
            middleName = fullName[3];
        }
        else if(fullName.length === 3){
            var lastName = fullName[0];
            var firstName = fullName[1];
            var middleName = fullName[2];
        }
        else if(fullName.length === 2){
            var lastName = fullName[0];
            var firstName = fullName[1];
        }

        if(lastName !== null)
            lastName = lastName.replace(/,/g, '');
        if(middleName !== null)
            middleName = middleName.replace(/,/g, '');
        if(firstName !== null)
            firstName = firstName.replace(/,/g, '');

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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID_ALT")
                        ,row.getField("STUDENT_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_1")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STATE_STUDENT_ID_VERSION_1")
                        ,row.getField("STUDENT_ID_ALT")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = firstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= middleName;
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
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

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScore(row, testMetadata, signature) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "SCALE_SCORE"),row.getField("SCALESCORE"));
        var rawScore = row.getField(testMetadata.FIELD + "RAW_SCORE");
        var performanceLevel = _util.coalesce(row.getField(testMetadata.FIELD + "PERFORMANCE_LEVEL"),row.getField("PERF_LVL_CODE"));
        var perfDecode = row.getField("PERF_LVL");
        var performanceRank = row.getField(testMetadata.FIELD + "PERFORMANCE_RANK");
        var decile = row.getField(testMetadata.FIELD + "CITY_PL");
        var grade = gradeDecode[row.getField('GRADE')];
        var subject = row.getField("ASSESSMENT_DESCRIPTION");
        if(perfDecode && perfDecode.indexOf('-')>-1){
            perfDecode = perfDecode.split('-')[1];
        }
        if(grade!=="" && grade!== undefined && grade!==null){
            testNumber = testNumber + "_" + grade;
        }
        if(subject && subject.indexOf("ELA") > -1 && testMetadata.CODE !== "ELA"){
            return null;
        }else if(subject && subject.indexOf("Math") > -1 && testMetadata.CODE !== "STM"){
            return null;
        }else if(subject && subject.indexOf("Sci") > -1 && testMetadata.CODE !== "SCI"){
            return null;
        }

        if(scaleScore === null && rawScore === "ABS" ||scaleScore === "" && rawScore === "ABS"  ) {
            rawScore = "0";
            scaleScore = "0";
            performanceLevel = "ABS";
            performanceRank = "ABS";
            decile = "0";
        }
        if(scaleScore === null && rawScore === "ADM" || scaleScore === null && rawScore === "REF" || scaleScore === "" && rawScore === "ADM" ||scaleScore === "" && rawScore === "REF" ||scaleScore === "" && rawScore === ""  && _util.trim(perfDecode) === ""|| scaleScore === null && rawScore === null && perfDecode === null) {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
        if(!isNaN(scaleScore)){
    	    score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(rawScore)){
            score["TEST_RAW_SCORE"] = rawScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
    	if(signature.getFormat().getFormatName() === "NYC_EXTRACT_35_1_COLS"){
               score["TEST_PRIMARY_RESULT"] = perfDecode;
               score["TEST_PASSED_INDICATOR"] = passDecode[perfDecode];
    	}
    	else{
    	    score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
            score["TEST_PRIMARY_RESULT"] = primaryDecode[performanceLevel];
    	}

    	score["TEST_SECONDARY_RESULT_CODE"] = performanceLevel;
    	score["TEST_SECONDARY_RESULT"] = performanceRank;
    	score["TEST_DECILE_SCORE"] = decileDecode[decile];

    	if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
        }

        return score;
    }

    //TODO subScoreMapping and Metadata update
    function mapSubScore(row, testMetadata, signature){

        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var subScore = _util.trim(row.getField("NYSESLAT" + testMetadata.FIELD + "SUBSCORE"));
        var grade = gradeDecode[row.getField('GRADE')];

        if(grade!=="" && grade!== undefined && grade!==null){
            testNumber = testNumber + "_" + grade;
        }
        if(subScore === null || subScore === ""){
             return null;
        }
        else{
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCALED_SCORE"] = subScore;
        }

        if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
        }

        return score;

    }

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

    /**
     * Generates an Assessment Admin Key using a combination of hierarchy values and natural keys from an assessment signature
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param srcRecord The assessment record being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        var subject = srcRecord.getField("ASSESSMENT_DESCRIPTION");
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        if(signature.getFormat().getFormatName() === "NYC_EXTRACT_35_1_COLS"){
            if(subject.indexOf("ELA") > -1){
               assessmentAdminKey += "_" + "ELA";
            }else if(subject.indexOf("Math") > -1 ){
               assessmentAdminKey += "_" + "STM";
            }else if(subject.indexOf("Sci") > -1){
               assessmentAdminKey += "_" + "SCI";
            }
        }
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }


    return module;
}());