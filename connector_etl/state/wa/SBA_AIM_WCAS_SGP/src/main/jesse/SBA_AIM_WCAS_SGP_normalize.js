var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "SBA_AIM_WCAS_SGP";
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
        { TEST: "SBA", NUMBER: "SBA", CODE: "ELA", FIELD: "English Language Arts", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SBA", NUMBER: "SBA", CODE: "MA", FIELD: "Math", MAP_FUNCTION: mapScaledScore }

        , { TEST: "AIM", NUMBER: "AIM", CODE: "MA", FIELD: "Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "AIM", NUMBER: "AIM", CODE: "ELA", FIELD: "English Language Arts", MAP_FUNCTION: mapScaledScore }
        , { TEST: "AIM", NUMBER: "AIM", CODE: "SCI", FIELD: "Science", MAP_FUNCTION: mapScaledScore }

        , { TEST: "MSP", NUMBER: "MSP", CODE: "MSPHSPE", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "MSPB", NUMBER: "MSPB", CODE: "MSPHSPE", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "OFFG", NUMBER: "OFFG", CODE: "OFFG", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WCAS", NUMBER: "WCAS", CODE: "SCI", FIELD: "Science", MAP_FUNCTION: mapScaledScore }

        , { TEST: "HSPE", NUMBER: "HSPE_WR", CODE: "MSPHSPE", FIELD: "Writing", MAP_FUNCTION: mapScaledScore }

        , { TEST: "HSPE", NUMBER: "HSPE", CODE: "ELA", FIELD: "English Language Arts", MAP_FUNCTION: mapScaledScore }
        , { TEST: "BIO", NUMBER: "BIO", CODE: "EOC", FIELD: "EOC Biology", MAP_FUNCTION: mapScaledScore }
        , { TEST: "BIOB", NUMBER: "BIOB", CODE: "EOC", FIELD: "EOC Biology", MAP_FUNCTION: mapScaledScore }
        , { TEST: "ALG", NUMBER: "ALG", CODE: "EOC", FIELD: "EOC Math 1", MAP_FUNCTION: mapScaledScore }
        , { TEST: "ALGB", NUMBER: "ALGB", CODE: "EOC", FIELD: "EOC Math 1", MAP_FUNCTION: mapScaledScore }
        , { TEST: "GEO", NUMBER: "GEO", CODE: "EOC", FIELD: "EOC Math2", MAP_FUNCTION: mapScaledScore }
        , { TEST: "GEOB", NUMBER: "GEOB", CODE: "EOC", FIELD: "EOC Math2", MAP_FUNCTION: mapScaledScore }
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
         "Level 1": "Well Below Standard"
        , "Level 2": "Below Standard"
        , "Level 3": "Meets Standard"
        , "Level 4": "Exceeds Standard"
        , null: null
        , "": null
    };

    var priorDecode = {
         "Level 1": "Well Below Standard"
        , "Level 2": "Below Standard"
        , "Level 3": "Meets Standard"
        , "Level 4": "Exceeds Standard"
        , null: null
        , "": null
    };

    var passIndicator = {
         "Level 1": "No"
        , "Level 2": "No"
        , "Level 3": "Yes"
        , "Level 4": "Yes"
        , null: null
        , "": null
    };

    var sgpDecode = {
         "Low": "Below Basic"
        , "High": "Proficient"
        , "Typical": "Basic"
        , null: null
        , "": null
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


    function identifyReportingPeriod(row,hierarchy) {
           // Convert the period input to uppercase for case insensitivity
         var period = row.getField("ADMINISTRATION");
         if (period === null || period === undefined || _util.trim(period) === "--" || _util.trim(period) === "") {
            return null;
            }
          period = period.toString().toUpperCase();
          var finalPeriod = hierarchy.REPORTING_PERIOD;
           // Check the input period and return the corresponding reporting period
         if (period.indexOf('FALL') >-1) {
               finalPeriod = 'Fall';
         } else if (period.indexOf('SPRING') >-1) {
               finalPeriod = 'Spring';
         } else if (period.indexOf('WINTER') >-1) {
               finalPeriod = 'Winter';
         }
         return finalPeriod;

     }

//    function adminPeriod(row){
//        var period = null;
//        var testType = row.getField("ADMINISTRATION");
//            if(testType === null || testType === undefined || testType === ""){
//                return null;
//            }
//            if (testType.indexOf("Spring") > -1){
//                period = "SPRING"
//            }else if(testType.indexOf("Fall") > -1){
//                period = "FALL"
//            }else if(testType.indexOf("Winter") > -1){
//                period = "WINTER"
//            }
//            return period
//        }

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

        var identifiedPeriod = identifyReportingPeriod(row, hierarchy);
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
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //TEST_ADMIN_DATE must always finish/print as MM/dd/YYYY format
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTestAdminDate(hierarchy.SCHOOL_YEAR, hierarchy.REPORTING_PERIOD);
                    break;

                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = identifiedPeriod;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
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
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
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

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var subject = row.getField("SUBJECT");
        var testType = row.getField("TESTTYPE");
        if(testType!== testMetadata.NUMBER || subject!== testMetadata.FIELD){//may need subject too
           return null;
       }

        var testNumber = testMetadata.NUMBER + "_" + testMetadata.CODE + "_TOT";

        var scaleScore = row.getField("SCALE_SCORE");
        var achievementLevel = row.getField("ACHIEVEMENT_LEVEL");

        var scaleScorePrior = row.getField("SCALE_SCORE_PRIOR");
        var achievementLevelPrior = row.getField("ACHIEVEMENT_LEVEL_PRIOR");

        var sgp = row.getField("SGP");
        var sgpLevel = row.getField("SGP_LEVEL");
        var agp = row.getField("AGP");
        var attempt = row.getField("TESTATTEMPT");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PRIMARY_RESULT_CODE"] = achievementLevel;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[achievementLevel];

        if (!isNaN(scaleScorePrior)){
    	score["TEST_RAW_SCORE"] = scaleScorePrior;
    	score["TEST_SECONDARY_RESULT"] = priorDecode[achievementLevelPrior];
    	score["TEST_SECONDARY_RESULT_CODE"] = achievementLevelPrior;
    	}
    	score["TEST_PASSED_INDICATOR"] = passIndicator[achievementLevel];


        if (!isNaN(sgp)){
        score["TEST_GROWTH_PERCENTILE"] = sgp;
        score["TEST_GROWTH_RESULT"] = sgpDecode[sgpLevel];
        score["TEST_GROWTH_RESULT_CODE"] = sgpLevel;
        }

        if (!isNaN(agp)){
        score["TEST_GROWTH_TARGET_1"] = agp;
        }
        score["TEST_SCORE_ATTRIBUTES"] = attempt;

        return score;
    }

    function getTestAdminDate(hierarchyYear, reportingPeriod) {
		 let testAdminDate = null, testAdminDateObj = AppUtil.getEmptyDateObj();
		 var testYear = hierarchyYear.toString().split("-")[1];
		 if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'WINTER') {
			 testAdminDate = '01/15/' + testYear;
		 } else if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'SPRING') {
			 testAdminDate = '05/15/' + testYear;
		 }  else if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'FALL') {
			testAdminDate = '09/15/' + hierarchyYear.toString().split("-")[0];
		 }
		 else {
			 testAdminDate = '05/15/' + testYear;//ALL
		 }
		 testAdminDateObj = AppUtil.getDateObjByPattern(testAdminDate, "MM/dd/yyyy");
		 return testAdminDateObj.STANDARD_DATE;
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

        //Add conformed MM/dd/yyyy test/completion date as the last value
        //Test/completion date should not be present in the NATURAL_KEY of any signatures, it is to be added here
        //If the test date is truly not needed, this section can be deleted when creating a new connector
        var fileTestDate = getTestAdminDate(hierarchy.SCHOOL_YEAR, hierarchy.REPORTING_PERIOD);
        if(fileTestDate!==undefined && fileTestDate!==null) {
        assessmentAdminKey = assessmentAdminKey + "_" + fileTestDate;
//            fileTestDate = fileTestDate.toString();
            //The template contains an example of having multiple date strings. If your connector only has one, only take what is inside the ELSE statement and remove the rest of the IF/ELSE code
            // If your connector has multiple dates with / or -, consider if the string length can be used for an IF/ELSEIF check
//            if(fileTestDate.indexOf("/")>-1) {
//                assessmentAdminKey = assessmentAdminKey + "_" + AppUtil.getDateObjByPattern(row.getField(fileTestDate), "MM/dd/yyyy").STANDARD_DATE;
//            }
//            else{
//                assessmentAdminKey = assessmentAdminKey + "_" + AppUtil.getDateObjByPattern(row.getField(fileTestDate), "MM-dd-yyyy").STANDARD_DATE;
//            }
        }

        return assessmentAdminKey;
    }


    return module;
}());