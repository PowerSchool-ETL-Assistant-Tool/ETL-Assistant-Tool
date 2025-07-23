var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MS_MAAP";
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
    var scoresToMap =
        [
            // Initial ELPAC Scores to Process
              {TEST: "MAAP", CODE: "TOT", FIELD:"TOT_", MAP_FUNCTION: mapTotalScore}
             ,{TEST: "MAAP", CODE: "RC1", FIELD: "RC1", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "RC2", FIELD: "RC2", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "RC3", FIELD: "RC3", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "RC4", FIELD: "RC4", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "RC5", FIELD: "RC5", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "RC6", FIELD: "RC6", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "RC7", FIELD: "RC8", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "RC8", FIELD: "RC8", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "RC9", FIELD: "RC9", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MAAP", CODE: "Development", CODE1: "DEV",  FIELD: "DIM1", MAP_FUNCTION: mapFinalScore}
             ,{TEST: "MAAP", CODE: "Organization", CODE1: "ORG", FIELD: "DIM2", MAP_FUNCTION: mapFinalScore}
             ,{TEST: "MAAP", CODE: "Grammar And Usage", CODE1: "GRA&USG", FIELD: "DIM3", MAP_FUNCTION: mapFinalScore}
             ,{TEST: "MAAP", CODE: "Mechanics", CODE1: "MECH", FIELD: "DIM4", MAP_FUNCTION: mapFinalScore}
             ,{TEST: "MAAP", CODE: "Total Writing",CODE1: "TOT_WR", FIELD: "WP_SCORE", MAP_FUNCTION: mapFinalScore}
             ,{TEST: "MAAP", CODE: "D1", FIELD: "D1", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "D2", FIELD: "D2", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "D3", FIELD: "D3", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "D4", FIELD: "D4", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "D5", FIELD: "D5", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "D6", FIELD: "D6", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "D7", FIELD: "D7", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "D8", FIELD: "D8", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "DT", FIELD: "DT", MAP_FUNCTION: mapItemScore}
             ,{TEST: "MAAP", CODE: "MA_TOT", FIELD: "MATH_", MAP_FUNCTION: mapScaleScore}
             ,{TEST: "MAAP", CODE: "SCI_TOT", FIELD: "SCIENCE_", MAP_FUNCTION: mapScaleScore}
             ,{TEST: "MAAP", CODE: "HIST_TOT", FIELD: "HISTORY_", MAP_FUNCTION: mapScaleScore}
             ,{TEST: "MAAP", CODE: "RLA_TOT", FIELD: "RLA_", MAP_FUNCTION: mapScaleScore}
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
        "Kindergarten": "KG",
        "64" : "Kindergarten",
        "56" : "SCD"
       ,"" : null
       ,null : null
    };

       var perfLevels = {

       "PL1": { PASS_IND: "No", CODE: "PL1", DESC: "Below Basic" },
       "PL2": { PASS_IND: "No", CODE: "PL2", DESC: "Basic" },
       "PL3": { PASS_IND: "Yes",CODE: "PL3", DESC: "Passing" },
       "PL4": { PASS_IND: "Yes",CODE: "PL4", DESC: "Proficient" },
       "PL5": { PASS_IND: "Yes",CODE: "PL5", DESC: "Advanced" },
       "Passing": { PASS_IND: "Yes",CODE: "PL3", DESC: "Passing" },
       "Proficient": { PASS_IND: "Yes",CODE: "PL4", DESC: "Proficient" },
       "1": { PASS_IND: "No",CODE: "1A", DESC: "Minimal Bottom" },
       "2": { PASS_IND: "No",CODE: "1B", DESC: "Minimal Top" },
       "3": { PASS_IND: "No",CODE: "2A", DESC: "Basic Bottom" },
       "4": { PASS_IND: "No",CODE: "2B", DESC: "Basic Top" },
       "5": { PASS_IND: "Yes",CODE: "3A", DESC: "Passing Bottom" },
       "6": { PASS_IND: "Yes",CODE: "3B", DESC: "Passing Top" },
       "7": { PASS_IND: "Yes",CODE: "4", DESC: "Proficient" },
       "8": { PASS_IND: "Yes",CODE: "5", DESC: "Advanced" },
       "" : {PASS_IND: null, CODE: null, DESC: null},
       "null" :{ PASS_IND: null, CODE: null, DESC: null}
          };

    var subjectLookup = {
          "ELA"     : "ELA"
          ,"Math"	: "MA"
          ,"Mathematics" : "MA"
          ,"English Language Arts (Alt)" : "ELA_ALT"
          ,"Math (Alt)" : "MA_ALT"
          ,"SCIENCE" : "SCI"
          ,null	: null
      };
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    function decodeSubject(subject) {
        if(subject == null) {
            return null;
        }
        var lkpSubjectObj = subjectLookup[subject];
        if(lkpSubjectObj == undefined || lkpSubjectObj == null) {
            return null;
        }
        return lkpSubjectObj;
    }
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
        var birthDateObject = {
                                RAW_DATE : null
                                , MONTH : null
                                , DAY : null
                                , YEAR : null
                                , STANDARD_DATE : null
        }
        var birthDate = _util.coalesce(row.getField("DOB"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "" && birthDate.length === 9) {
           birthDateObject = _util.coalesce(AppUtil.getDateObjByPattern(birthDate, "dd-MMM-yy")) ;
        }
        else if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
           birthDateObject = AppUtil.getMonthFollowedByDay(birthDate, "MMddyyyy");
        }
        //print(birthDateObject.STANDARD_DATE + "\n");

        var testAdminDate = getAdminDate(row, hierarchy);
        var reportingPeriod = getTEST_ADMIN_PERIOD(row, hierarchy);
        if(signature.getFormat().getFormatName() === "MAAP_113COLS"){
            var adminDate = getMaxDate(row, hierarchy);
        }else{
            var adminDate = AppUtil.getDateObjByPattern(testAdminDate, "MM/dd/yyyy").STANDARD_DATE;
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
                    record.REPORTING_PERIOD = _util.coalesce(reportingPeriod, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(adminDate,"05/15/"+hierarchy.SCHOOL_YEAR.substring(5));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_ID"),row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL_NAME")
                    );

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
    function mapStrandScore(row, testMetadata) {
        var score = {};
        var testNumber =  testMetadata.TEST
                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + testMetadata.CODE
                             + "_" + gradeDecode[row.getField('GRADE')];
        var scaledScore = _util.coalesce(row.getField(testMetadata.FIELD + "OP"), row.getField(testMetadata.FIELD + "_SCORE"));
//        var performanceLevel = row.getField(testMetadata.FIELD+"_PL");


        // Check for key fields and do not map score and exit if conditions met.
        if(scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
//        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        return score;
    }

    function mapFinalScore(row, testMetadata) {
        var score = {};
        var testNumber =  testMetadata.TEST
//                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + testMetadata.CODE1
                             + "_" + gradeDecode[row.getField('GRADE')];
        var scaledScore = row.getField("FINAL_" + testMetadata.FIELD);
//        var performanceLevel = row.getField(testMetadata.FIELD+"_PL");


        // Check for key fields and do not map score and exit if conditions met.
        if(scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "" || scaledScore === "F") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
//        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        return score;
    }

    function mapItemScore(row, testMetadata) {
        var score = {};
        var testNumber =  testMetadata.TEST
                             + "_" + decodeSubject(row.getField("CONTENT_AREA"))
                             + "_" + testMetadata.CODE
                             + "_" + gradeDecode[row.getField('GRADE')];
        var scaledScore = _util.coalesce(row.getField(testMetadata.FIELD + "OP"), row.getField(testMetadata.FIELD + "PP"), row.getField(testMetadata.FIELD + "PC"));
//        var performanceLevel = row.getField(testMetadata.FIELD+"_PL");


        // Check for key fields and do not map score and exit if conditions met.
        if(scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;      // UIHN-30403
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
//        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        return score;
    }


    function mapTotalScore(row, testMetadata) {
        var score = {};

        var testNumber =  testMetadata.TEST
                             + "_" + decodeSubject(_util.coalesce(row.getField("SUBJECT"),row.getField("CONTENT_AREA")))
                             + "_" + testMetadata.CODE
                             + "_" + gradeDecode[row.getField('GRADE')];

        var achievementLevel = row.getField("PROF_LVL");
        var scaledScore = row.getField("SCALE_SCORE");
        var rawScore    = _util.coalesce(row.getField(testMetadata.FIELD + "RS"),row.getField(testMetadata.FIELD + "OP"),row.getField("RAW_SCORE"));

        // Check for key fields and do not map score and exit if conditions met.
        if(scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") {
            return null;
        }

        // Set score fields
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_PRIMARY_RESULT"] = perfLevels[achievementLevel].DESC;
        score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[achievementLevel].CODE;
        score["TEST_PASSED_INDICATOR"]      = perfLevels[achievementLevel].PASS_IND;
        return score;
    }

    function mapScaleScore(row, testMetadata) {
        var score = {};

        var testNumber =  testMetadata.TEST + "_" + testMetadata.CODE + "_" + gradeDecode[row.getField('GRADE')];

        var scaledScore = row.getField(testMetadata.FIELD + "SCORE");
        var perfLevel = row.getField(testMetadata.FIELD + "PROFICIENCY_LEVEL");
        var proficient = row.getField(testMetadata.FIELD + "PROFICIENT");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") {
            return null;
        }

        // Set score fields
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }

        score["TEST_PRIMARY_RESULT"] = perfLevels[perfLevel].DESC;
        score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[perfLevel].CODE;
        score["TEST_SECONDARY_RESULT_CODE"] = proficient;
        score["TEST_PASSED_INDICATOR"]      = perfLevels[perfLevel].PASS_IND;

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

    function getAdminDate(row, hierarchy) {
        var adminDate = null;
        var period = getTEST_ADMIN_PERIOD(row, hierarchy)

        if(period === 'FALL'){
            adminDate = "09/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
        }else if(period === 'WINTER'){
            adminDate = "01/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        } else if(period === 'SPRING'){
            adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        }
        else {
            adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        }
        return adminDate;
     }

     function getMaxDate(row, hierarchy){
         var dates = [];

         if(row.getField("MATH_TEST_DATE")!==null && row.getField("MATH_TEST_DATE") !== "" && row.getField("MATH_TEST_DATE") !== undefined){
             dates.push(new Date(row.getField("MATH_TEST_DATE")+"Z"));
         }
         if(row.getField("RLA_TEST_DATE")!==null && row.getField("RLA_TEST_DATE") !== "" && row.getField("RLA_TEST_DATE") !== undefined){
             dates.push(new Date(row.getField("RLA_TEST_DATE")+"Z"));
         }
         if(row.getField("SCIENCE_TEST_DATE")!==null && row.getField("SCIENCE_TEST_DATE") !== "" && row.getField("SCIENCE_TEST_DATE") !== undefined){
             dates.push(new Date(row.getField("SCIENCE_TEST_DATE")+"Z"));
         }
         if(row.getField("HISTORY_TEST_DATE")!==null && row.getField("HISTORY_TEST_DATE") !== "" && row.getField("HISTORY_TEST_DATE") !== undefined){
             dates.push(new Date(row.getField("HISTORY_TEST_DATE")+"Z"));
         }

         if(dates.length == 0 ) {
              testDate = AppUtil.getMonthFollowedByDay("05/15/" + hierarchy.SCHOOL_YEAR).STANDARD_DATE;
              return testDate;
         }

         var maximumDate=new Date(Math.max.apply(null, dates));
         var isoD = maximumDate.toISOString();
         var format = (isoD.substring(0,10));
         adminDate = AppUtil.getMonthFollowedByDay(format).STANDARD_DATE;

         return adminDate;
     }

    function getTEST_ADMIN_PERIOD(row, hierarchy) {
        var term = _util.coalesce(row.getField("TERM"), row.getField("SEASON"));
        var testAdminPeriod = null;
        if(term !== null && term !== "" && term !== undefined){
            if(term.indexOf('Fall') > -1){
                testAdminPeriod = "FALL";
            }else if(term.indexOf('Winter') > -1){
                testAdminPeriod = "WINTER";
            } else if(term.indexOf('Spring') > -1 || term.indexOf('SPRING') > -1 ){
                testAdminPeriod = "SPRING";
            }
        }
        else {
            testAdminPeriod = "ALL";
        }
        return testAdminPeriod;
    }

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