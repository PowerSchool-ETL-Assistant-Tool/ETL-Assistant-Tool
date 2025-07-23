var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "PEAKS";
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
          { TEST: "AK_PEAKS", CODE: "ELA", FIELD: "ELA", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "MA", FIELD: "MATH", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "SCI", FIELD: "SCIENCE", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_SMED", FIELD: "SCIENCE_SCHOOL", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_DMED", FIELD: "SCIENCE_DISTRICT", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_STMED", FIELD: "SCIENCE_STATE", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_PS", FIELD: "SCIENCE_PHYSICAL_SCIENCE", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_LS", FIELD: "SCIENCE_LIFE_SCIENCE", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_ES", FIELD: "SCIENCE_EARTH_AND_SPACE_SCIENCE", MAP_FUNCTION: mapScaledScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_ITNS", FIELD: "SCIENCE_INQUIRY_TECHNOLOGY_AND_NATURE_OF_SCIENCE", MAP_FUNCTION: mapSciStrandScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_INS", FIELD: "SCIENCE_INQUIRY_AND_NATURE_OF_SCIENCE", MAP_FUNCTION: mapSciStrandScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_ITSNS", FIELD: "SCIENCE_INQUIRY_TECHNOLOGY_SOCIETY_AND_NATURE_OF_SCIENCE", MAP_FUNCTION: mapSciStrandScore  }
          , { TEST: "AK_PEAKS", CODE: "SCI_PS", FIELD: "SCIENCE_CONCEPTS_OF_PHYSICAL_SCIENCE", MAP_FUNCTION: mapSciStrandScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_LS", FIELD: "SCIENCE_CONCEPTS_OF_LIFE_SCIENCE", MAP_FUNCTION: mapSciStrandScore }
          , { TEST: "AK_PEAKS", CODE: "SCI_ES", FIELD: "SCIENCE_CONCEPTS_OF_EARTH_SCIENCE", MAP_FUNCTION: mapSciStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_RD", FIELD: "ELA_READING", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_RD_LIT", FIELD: "ELA_READING_LITERARY", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_RD_INF", FIELD: "ELA_READING_INFORMATIONAL", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_KID", FIELD: "ELA_KEY_IDEAS_AND_DETAILS", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_CR_STR", FIELD: "ELA_CRAFT_AND_STRUCTURE", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_WR", FIELD: "ELA_WRITING", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_TT", FIELD: "ELA_TEXT_TYPES", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_DP", FIELD: "ELA_DISTRIBUTION_AND_PRODUCTION", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_LANG", FIELD: "ELA_LANGUAGE", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "ELA_TDA", FIELD: "ELA_TEXT-DEPENDENT_ANALYSIS_(TDA)", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_ALG", FIELD: "MATH_ALGEBRA", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_EX_EP", FIELD: "MATH_EXPRESSIONS_AND_EQUATIONS", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_FUN", FIELD: "MATH_FUNCTIONS", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_GEO", FIELD: "MATH_GEOMETRY", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_GEO_ME", FIELD: "MATH_GEOMETRY_AND_MEASUREMENT", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_NO_BASE10", FIELD: "MATH_NUMBER_AND_OPERATIONS_IN_BASE_TEN", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_NOF", FIELD: "MATH_NUMBER_AND_OPERATIONS_FRACTIONS", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_NQ", FIELD: "MATH_NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_NEE", FIELD: "MATH_NUMBERS_EXPRESSIONS_AND_EQUATIONS", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_OAT", FIELD: "MATH_OPERATIONS_AND_ALGEBRAIC_THINKING", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_RPR", FIELD: "MATH_RATIOS_AND_PROPORTIONAL_RELATIONSHIPS", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_SP", FIELD: "MATH_STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStrandScore }
          , { TEST: "AK_PEAKS", CODE: "MA_TNS", FIELD: "MATH_THE_NUMBER_SYSTEM", MAP_FUNCTION: mapStrandScore }

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
       "FBP" : "Far Below Proficient"
       ,"BP" : "Below Proficient"
       ,"P" : "Proficient"
       ,"A" : "Advanced"
       ,"AP" : "Approaching Proficient"
       ,"NS" : "Needs Support"
       ,"" : "Subject was not taken"
       ,"" : null
       ,null : null
    };

    var secondaryDecodeShapes = {
       "0" : "[]"
       ,"1" : "v"
       ,"2" : "="
       ,"3" : "^"
       ,"" : null
       ,null : null
    };

    var passDecode = {
           "FBP" : "No"
           ,"BP" : "No"
           ,"NS" : "No"
           ,"AP" : "No"
           ,"P" : "Yes"
           ,"A" : "Yes"
           ,"" : null
           ,null : null
        };

    var perfLevelDecode = {
        "0" : "Did not attempt any items in this reporting category",
        "1" : "Did not do as well as students who scored just barely proficient",
        "2" : "Did about as well as students who scored just barely proficient",
        "3" : "Did better than students who scored just barely proficient",
        "" : "Subject was not taken",
        null : null
        };


    var decodeConditionCodes = {
        "NOA" : "Not Attempted",
        "MED" : "Medical Excuse",
        "PRF" : "Parent Refusal",
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

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
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DATE_OF_BIRTH"), "MM/dd/yyyy");
        var finalDate= null;
        if(hierarchy.SCHOOL_YEAR.substring(5) === "2017" ) {
           finalDate = "03/28/2017";
        }
        else if(hierarchy.SCHOOL_YEAR.substring(5) === "2018" ) {
           finalDate = "03/26/2018";
        }
        else if(hierarchy.SCHOOL_YEAR.substring(5) === "2019" ) {
            finalDate = "03/25/2019";
        }
        else if(hierarchy.SCHOOL_YEAR.substring(5) === "2021" ) {
            finalDate = "03/29/2021";
        }
        else {
            finalDate = "03/25/"+ hierarchy.SCHOOL_YEAR.substring(5);
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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = finalDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("DISTRICT_STUDENT_ID");
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("AKSID");
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("DRC_STUDENT_ID");
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
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('STUDENT_GRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
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

        if (_util.trim(row.getField("SCIENCE_SPECIAL_CIRCUMSTANCE")) !== "") {
            admin.TEST_INTERVENTION_CODE = _util.trim(row.getField("SCIENCE_SPECIAL_CIRCUMSTANCE"));
            admin.TEST_INTERVENTION_DESC = decodeConditionCodes[admin.TEST_INTERVENTION_CODE] === undefined ? null : decodeConditionCodes[admin.TEST_INTERVENTION_CODE];
        }

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var sem = row.getField(testMetadata.FIELD + "_STANDARD_ERROR");
		var achievLevel = row.getField(testMetadata.FIELD + "_ACHIEVEMENT_LEVEL");
		var itemPossible = row.getField(testMetadata.FIELD + "_TOTAL_ITEMS");
		var itemAttempted = row.getField(testMetadata.FIELD + "_ITEMS_ANSWERED");
        var performance = _util.trim(row.getField(testMetadata.FIELD + "_PERFORMANCE"));
        var median = row.getField(testMetadata.FIELD + "_MEDIAN");
        var sciCircumstance = row.getField(testMetadata.FIELD + "_SPECIAL_CIRCUMSTANCE");
        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" ) &&
        (performance === null || performance === undefined || _util.trim(performance) === "--" ) &&
        (sciCircumstance === null || sciCircumstance === undefined || _util.trim(sciCircumstance) === "--" ) &&
        (median === null || median === undefined || _util.trim(median) === "--" ))
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

    	score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel];
    	score["TEST_PASSED_INDICATOR"] = passDecode[achievLevel];
        score["TEST_SECONDARY_RESULT_CODE"] = parseInt(performance);
        score["TEST_SECONDARY_RESULT"] = perfLevelDecode[parseInt(performance)];
        score["TEST_PREDICTED_SCORE"] = median;

        if (!isNaN(sem)) {
           score["TEST_STANDARD_ERROR"] = sem;
        }
        score["TEST_ITEMS_ATTEMPTED"] = itemAttempted;
        score["TEST_ITEMS_POSSIBLE"] = itemPossible;

        if(sciCircumstance){
        score["TEST_QUATERNARY_RESULT"] = decodeConditionCodes[sciCircumstance];
        score["TEST_QUATERNARY_RESULT_CODE"] = sciCircumstance;
        }

        return score;
    }

    function mapSciStrandScore(row, testMetadata) {
       var score = {};
       var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
       var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
       var pointsPossible = row.getField(testMetadata.FIELD + "_POINTS_POSSIBLE");


       // Check for key fields and do not map score and exit if conditions met.
       if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" ) {
          return null;
       }

        // Set score fields
       score["TEST_NUMBER"] = testNumber;
       score["TEST_SCORE_TEXT"] = scaleScore;

       if(!isNaN(scaleScore)){
          score["TEST_SCORE_VALUE"] = scaleScore;
          score["TEST_SCALED_SCORE"] = scaleScore;
       }

       score["TEST_ITEMS_POSSIBLE"] = pointsPossible;

       return score;
    }

    function mapStrandScore(row, testMetadata) {
       var score = {};
       var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
       var performance = row.getField(testMetadata.FIELD + "_PERFORMANCE");


       // Check for key fields and do not map score and exit if conditions met.
       if( performance === null || performance === undefined || _util.trim(performance) === "--" ) {
          return null;
       }


       // Set score fields
       score["TEST_NUMBER"] = testNumber;
       score["TEST_PRIMARY_RESULT_CODE"] = performance;
       score["TEST_PRIMARY_RESULT"] = performance;
       score["TEST_SECONDARY_RESULT"] = secondaryDecodeShapes[performance];

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