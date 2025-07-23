var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "nys";
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
			print("Loading using signature file ${signatureFormatName} \n");


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
        {TEST: "NYS", CODE:"TOT", FIELD: "", MAP_FUNCTION: mapScaledScore},
        ,{TEST: "NYSESLAT", CODE:"_LIS", FIELD: "LISTENING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYSESLAT", CODE:"_SP", FIELD: "SPEAKING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYSESLAT", CODE:"_RD", FIELD: "READING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYSESLAT", CODE:"_WR", FIELD: "WRITING_", MAP_FUNCTION: mapSubScore}
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
        "13": "13",
        "Grade 13": "13",
        "14": "14",
        "Grade 14": "14",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };



    var passDecode = {
       "Level 4" : "Yes"
       ,"Level 3" : "Yes"
       ,"Level 2" : "No"
       ,"Level 1" : "No",
        "level 1"                  : "No",
        "level 2"                  : "No",
        "level 3"                  : "Yes",
        "level 4"                  : "Yes"
       ,"4" : "Yes"
       ,"3" : "Yes"
       ,"2" : "No"
       ,"1" : "No"
      ,"NYSAA-Level 4"          : "Yes"
        ,"NYSAA-Level 3"          : "Yes"
        ,"NYSAA-Level 2"          : "No"
        ,"NYSAA-Level 1"          : "No"
        ,"Expanding"              : "Yes"
        ,"Transitioning"          : "Yes"
        ,"Entering"               : "No"
        ,"Emerging"               : "No"
        ,"Refusal"                : null
        ,"Absent"                 : null
        ,"Absent/No Valid Score"  : null
        ,""                       : null
        ,null                     : null
      };

    var perflvlDecode = {
       "1" : "Level 1"
       ,"2" : "Level 2"
       ,"3" : "Level 3"
       ,"4" : "Level 4"
       ,"6" : "Refusal"
       ,"9" : "Absent",
        "Absent/No Valid Score"    : "Absent",
        "Level 1"                  : "Level 1",
        "Level 2"                  : "Level 2",
        "Level 3"                  : "Level 3",
        "Level 4"                  : "Level 4",
        "level 1"                  : "Level 1",
        "level 2"                  : "Level 2",
        "level 3"                  : "Level 3",
        "level 4"                  : "Level 4",
        "Refusal"                  : "Refusal",
        "NYSAA-Level 1"            : "Level 1",
        "NYSAA-Level 2"            : "Level 2",
        "NYSAA-Level 3"            : "Level 3",
        "NYSAA-Level 4"            : "Level 4",
        "Emerging"                 : "Emerging",
        "Entering"                 : "Entering",
        "Transitioning"            : "Transitioning",
        "Expanding"                : "Expanding"
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

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = row.getField("STUDENT_BIRTHDATE");
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }


        var dateObj = row.getField("TEST_ADMINISTRATION_DATE");
        if(dateObj !== null && dateObj !== undefined && dateObj !== "" && dateObj.length > 10){
            var testDateObject = AppUtil.getDateObjByPattern(dateObj, "MMM dd, yyyy").STANDARD_DATE;
        }else if(dateObj !== null && dateObj !== undefined && dateObj !== "" && dateObj.length === 10){
            var testDateObject = AppUtil.getMonthFollowedByDay(dateObj, "MM/dd/yyyy").STANDARD_DATE;
        }else if(dateObj !== null && dateObj !== undefined && dateObj !== "" ){
         var testDateObject = AppUtil.getMonthFollowedByDay(dateObj, "M/dd/yyyy").STANDARD_DATE;
        }
        var STUDENT_NAME = row.getField("STUDENT_NAME");
        if(STUDENT_NAME!= null && STUDENT_NAME != "" && STUDENT_NAME != "undefined"){
            var STUDENT_LAST_NAME = STUDENT_NAME.substring(0,STUDENT_NAME.indexOf(","));
            var STUDENT_FIRST_NAME = STUDENT_NAME.substring(STUDENT_NAME.indexOf(",")+1 );
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
                    record.REPORTING_PERIOD =_util.coalesce( getTEST_ADMIN_PERIOD(row), hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE =  _util.coalesce(testDateObject, '05/15/' + hierarchy.SCHOOL_YEAR.substring(5));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("STUDENT_STATE_ID");
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"),row.getField('STUDENT_LOCAL_ID'));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = STUDENT_FIRST_NAME;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = STUDENT_LAST_NAME;
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
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("STUDENT_GENDER"));
                    break;
                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"), row.getField("SCHOOL_NAME"),row.getField("BUILDING_ID"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("SCHOOL_NAME"),row.getField("DISTRICT_NAME"),row.getField("BUILDING_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("SCHOOL_NAME"),row.getField("DISTRICT_NAME"),row.getField("BUILDING_ID"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("BUILDING_NAME"),row.getField("SCHOOL_NAME"));
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
    function mapScaledScore(row, testMetadata, signature) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var subTest = row.getField("SUBTEST_IDENTIFIER");

        var scaleScore = row.getField("SCALE_SCORE");
        var rawScore = row.getField("RAW_SCORE")
        var percentageScore = row.getField("PCT_SCORE")
        var subject = "";
        var achieveLevel = _util.coalesce(perflvlDecode[row.getField("STANDARD_ACHIEVED")],row.getField("ACHIEVEMENT_LEVEL"),row.getField("PERFORMANCE_LEVEL"), perflvlDecode[row.getField("PERF_LEVEL")]);
        if (signature.getFormat().getFormatName() === "NYS_35_1_COLS" &&
            achieveLevel && typeof achieveLevel === "string") {
          var hyphenIndex = achieveLevel.indexOf("-");
          if (hyphenIndex !== -1) {
            achieveLevel = achieveLevel.substring(hyphenIndex + 1);
          }
        }
        var stdAchievedCode =_util.coalesce(row.getField("STD_ACHIEVED_CODE"), row.getField("PERF_LEVEL"));
        var assessmentDesc =_util.coalesce(row.getField("ASSESSMENT_DESCRIPTION"),row.getField("SUBTEST_IDENTIFIER"),row.getField("ASSESSMENT_NAME"));
        var grade = gradeDecode[row.getField('GRADE')];

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null && achieveLevel === null) || (scaleScore === undefined && achieveLevel === undefined) || (_util.trim(scaleScore) === "--" && _util.trim(achieveLevel) === "--") || (_util.trim(scaleScore) === "" && _util.trim(achieveLevel) === "" )) {
            return null;
        }

        if(grade!=="" && grade!== undefined && grade!==null){
            testNumber = testNumber + "_" + grade;
        }
        if(assessmentDesc!=="" && assessmentDesc!== undefined && assessmentDesc!==null){
        if (assessmentDesc.indexOf("Math")> -1){
            subject = 'MA';
        }
        if (assessmentDesc.indexOf("Sci")> -1){
            subject = 'SCI';
        }
        if (assessmentDesc.indexOf("ELA")> -1){
            subject = 'ELA';
        }
        if (assessmentDesc.indexOf("Total")> -1){
            subject = 'TOT';
                }
        if (assessmentDesc.indexOf("Reading")> -1){
            subject = 'RD';
                }
        if (assessmentDesc.indexOf("Writing")> -1){
            subject = 'WR';
                }
        if (assessmentDesc.indexOf("Speaking")> -1){
            subject = 'SP';
                }
        if (assessmentDesc.indexOf("Listening")> -1){
            subject = 'LIS';
                }
    }
         if(subject!==""){
             testNumber = testNumber + "_" + subject;
         }

       if (subTest!=="" && subTest!== undefined && subTest!==null){
       if (subTest.indexOf("NYSESLAT")> -1){
            testNumber = "NYSESLAT"+ "_" + subject;
                }

    	// Set score fields

        }
        score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_PERCENTAGE_SCORE"] = percentageScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_RAW_SCORE"] = rawScore;
        }
    	score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
    	score["TEST_PRIMARY_RESULT"] = achieveLevel;
    	score["TEST_PRIMARY_RESULT_CODE"] = stdAchievedCode;
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

    //todo function mapSubScore(){
          //  scale score/value/text of each subscore
function mapSubScore(row, testMetadata, signature) {
        var score = {};
        if(row.getField("GRADE")){
            var gradeLevel = row.getField("GRADE");
        }
        var scaleScore = row.getField(testMetadata.FIELD + "SUBSCORE");
        var testNumber = testMetadata.TEST  + "_" + gradeDecode[gradeLevel] + testMetadata.CODE;
        var stdAchievedCode =_util.coalesce(row.getField("STD_ACHIEVED_CODE"));
        if((scaleScore === null && stdAchievedCode === null) || (scaleScore === undefined && stdAchievedCode === undefined) || (_util.trim(scaleScore) === "--" && _util.trim(stdAchievedCode) === "--") || (_util.trim(scaleScore) === "" && _util.trim(stdAchievedCode) === "" ))
        {
            return null;
        }
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
             score["TEST_SCORE_VALUE"] = scaleScore;
             score["TEST_SCALED_SCORE"] = scaleScore;
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

    function getTEST_ADMIN_PERIOD(row) {
        var testAdminPeriod = null;
        var dateObj = row.getField("TEST_ADMINISTRATION_DATE");
            if(dateObj !== null && dateObj !== undefined && dateObj !== "" && dateObj.length > 10){
                var testDate = AppUtil.getDateObjByPattern(dateObj, "MMM dd, yyyy").STANDARD_DATE;
            }else if(dateObj !== null && dateObj !== undefined && dateObj !== "" && dateObj.length === 10){
                var testDate = AppUtil.getMonthFollowedByDay(dateObj, "MM/dd/yyyy").STANDARD_DATE;
            }


          if (testDate === null || testDate === undefined) {
                return testAdminPeriod;
          }

          var month = testDate.substring(0, 2);

          if (month === "07" || month === "08" || month === "09" || month === "10")
                testAdminPeriod = "Fall";
          else if (month === "11" || month === "12" || month === "01" || month === "02")
                testAdminPeriod = "Winter";
          else if (month === "03" || month === "04" || month === "05" || month === "06")
                testAdminPeriod = "Spring";

        return testAdminPeriod
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