var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ACAP";
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

    var scoresToMap = [
        {TEST: "ACAP_", CODE:"SS_", FIELD: "SCALE_", MAP_FUNCTION: mapScaledScore}
       ,{TEST: "ACAP_", CODE:"PERF_", FIELD: "PERFORMANCE_", MAP_FUNCTION: mapScaledScore}
       ,{TEST: "ACAP_", CODE:"OVR_", FIELD: "OVERALL_", MAP_FUNCTION: mapScaledScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC1", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC2", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC3", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC4", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC5", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC6", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC7", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC8", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC9", FIELD: "", MAP_FUNCTION: mapItemScore}
       ,{TEST: "ACAP_", NUMBER:"RC", CODE:"RC10", FIELD: "", MAP_FUNCTION: mapItemScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var perfLevelDecode = {
        "1" : "Support Needed"
       ,"2" : "On Track"
       ,"3" : "Prepared"
       ,"4" : "Prepared"
       ,"" : null
       ,null : null
      };

    var NewLevelDecode = {
       "1" : { DESC:"Level 1", PASS_IND: "No"}
      ,"2" : { DESC:"Level 2", PASS_IND: "No"}
      ,"3" : { DESC:"Level 3", PASS_IND: "Yes"}
      ,"4" : { DESC:"Level 4", PASS_IND: "Yes"}
      ,"" : { DESC: null, PASS_IND: null}
      ,null : { DESC: null, PASS_IND: null}
    };

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
         , "": null
         , null: null
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = _util.coalesce(row.getField("BIRTH_DATE"));
        var testDate = _util.coalesce(row.getField("TEST_DATE"));

        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
           birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = _util.trim(generateAssessmentAdminKey(signature, hierarchy, row));
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
                    record.TEST_ADMIN_DATE = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.trim(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.trim(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.trim(_util.coalesce(row.getField("STUDENT_ID"), (row.getField("STATE_STUDENT_ID"))));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.trim(row.getField('FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.trim(row.getField('LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.trim(row.getField('MIDDLE_NAME'));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('TEST_GRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.trim(_util.coalesce(row.getField("SCHOOL_CODE"), (row.getField("SCHOOL_NAME"))));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.trim(row.getField("SCHOOL_CODE"));
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
//        var admin = {};
//
//        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var contentArea = _util.trim(row.getField("CONTENT_AREA"));
        var testNumber = testMetadata.TEST + testMetadata.CODE + contentArea;
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "SCORE"), row.getField(testMetadata.FIELD + "SCALESCORE"));
		var perfLevel = _util.coalesce(row.getField(testMetadata.FIELD + "LEVEL"), row.getField(testMetadata.FIELD + "PERFORMANCELEVEL"));
		var itemsAttempted = row.getField(testMetadata.FIELD + 'ITEMSATTEMPTED');
		var totalPoints = row.getField(testMetadata.FIELD + 'TOTALPOINTS');
		var statePerRank = row.getField(testMetadata.FIELD + 'STATE_PERCENTILE_RANK');
		var growthScorePer = row.getField(testMetadata.FIELD + 'GROWTHSCOREPERCENTILE');
		var growthScoreSe = row.getField(testMetadata.FIELD + 'GROWTHSCORESTANDARDERROR');
		var growthLevelCode = row.getField(testMetadata.FIELD + 'GROWTHLEVELCODE');
		var lexScore = row.getField(testMetadata.FIELD + 'LEXILESCORE');
		var lexLow = row.getField(testMetadata.FIELD + 'LEXILELOW');
		var lexHigh = row.getField(testMetadata.FIELD + 'LEXILEHIGH');
        var quartileScore = row.getField(testMetadata.FIELD + 'QUANTILESCORE');
        var quartileLow = row.getField(testMetadata.FIELD + 'QUANTILELOW');
        var quartileHigh = row.getField(testMetadata.FIELD + 'QUANTILEHIGH');

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === ""))
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;
        score["TEST_ITEMS_POSSIBLE"] = totalPoints;
        score["TEST_PERCENTILE_SCORE"] = statePerRank;
        score["TEST_GROWTH_TARGET_1"] = growthScorePer;
        score["TEST_GROWTH_TARGET_2"] = growthScoreSe;
        score["TEST_GROWTH_RESULT_CODE"] = growthLevelCode;
        score["TEST_GROWTH_RESULT"] = NewLevelDecode[growthLevelCode].DESC;
        if(contentArea !== null && contentArea.indexOf("ELA") > -1){
            score["TEST_READING_LEVEL"] = removeAlphaChar(lexScore);
            score["TEST_LOWER_BOUND"] = removeAlphaChar(lexLow);
            score["TEST_UPPER_BOUND"] = removeAlphaChar(lexHigh);
        }else if(contentArea !== null && contentArea.indexOf("Math") > -1){
           score["TEST_QUARTILE_SCORE"] = removeAlphaChar(quartileScore);
           score["TEST_LOWER_BOUND"] = removeAlphaChar(quartileLow);
           score["TEST_UPPER_BOUND"] = removeAlphaChar(quartileHigh);
        }
    	score["TEST_PRIMARY_RESULT_CODE"] = perfLevel;

    	if(testNumber !== null || testNumber !== undefined){
            if(testNumber.indexOf("OVR") > -1){
                score["TEST_PRIMARY_RESULT"] = NewLevelDecode[perfLevel].DESC;
                score["TEST_PASSED_INDICATOR"] = NewLevelDecode[perfLevel].PASS_IND;
            }else{
                score["TEST_PRIMARY_RESULT"] = perfLevelDecode[perfLevel];
            }
    	}

        return score;
    }

    function mapItemScore(row, testMetadata) {
        var score = {};

        var contentArea = _util.trim(row.getField("CONTENT_AREA"));
        var testNumber = testMetadata.TEST + testMetadata.CODE  + "_" +contentArea;
        var ptPoss = row.getField("POINTS_POSSIBLE_" + testMetadata.CODE);//POINTS_POSSIBLE_RC1
        var earn = row.getField("POINTS_EARNED_" + testMetadata.CODE);//POINTS_EARNED_RC1
        var progress = row.getField("PROGRESS_" + testMetadata.CODE); //PROGRESS_RC1

        // Check for key fields and do not map score and exit if conditions met.
        if((ptPoss === null || ptPoss === undefined || _util.trim(ptPoss) === "--" || _util.trim(ptPoss) === "") &&
           (earn === null || earn === undefined || _util.trim(earn) === "--" || _util.trim(earn) === "") &&
           (progress === null || progress === undefined || _util.trim(progress) === "--" || _util.trim(progress) === "")) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(ptPoss){
            score["TEST_ITEMS_POSSIBLE"] = ptPoss;
        }
        if(earn){
            score["TEST_ITEMS_ATTEMPTED"] = earn;
        }
        if(progress){
            score["TEST_PRIMARY_RESULT_CODE"] = progress;
            score["TEST_PRIMARY_RESULT"] = NewLevelDecode[progress].DESC;
            score["TEST_PASSED_INDICATOR"] = NewLevelDecode[progress].PASS_IND;
        }

        return score;
    }

    function removeAlphaChar(value){

       if(value === undefined || value === null) {
            return null;
       }

        if((/[a-zA-Z]/g.test(value))){
            value = value.replace(/[a-zA-Z]/g, '').trim();
        }

        return value;
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

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key),""));
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());