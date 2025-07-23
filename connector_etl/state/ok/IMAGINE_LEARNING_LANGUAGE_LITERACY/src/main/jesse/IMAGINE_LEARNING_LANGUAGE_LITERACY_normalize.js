var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IMAGINE_LEARNING_LANGUAGE_LITERACY";
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
        try{

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
        {TEST: "IMG_LL", CODE:"OR_VOC_BNCH_1", FIELD: "ORAL_VOCABULARY_BENCHMARK_1_SCORE", MAP_FUNCTION: mapBenchMarkScore}
        ,{TEST: "IMG_LL", CODE:"OR_VOC_BNCH_2", FIELD: "ORAL_VOCABULARY_BENCHMARK_2_SCORE", MAP_FUNCTION: mapBenchMarkScore}
        ,{TEST: "IMG_LL", CODE:"OR_VOC_BNCH_3", FIELD: "ORAL_VOCABULARY_BENCHMARK_3_SCORE", MAP_FUNCTION: mapBenchMarkScore}
        ,{TEST: "IMG_LL", CODE:"LIT_BNCH_1", FIELD: "LITERACY_BENCHMARK_1_SCORE", MAP_FUNCTION: mapBenchMarkScore}
        ,{TEST: "IMG_LL", CODE:"LIT_BNCH_2", FIELD: "LITERACY_BENCHMARK_2_SCORE", MAP_FUNCTION: mapBenchMarkScore}
        ,{TEST: "IMG_LL", CODE:"LIT_BNCH_3", FIELD: "LITERACY_BENCHMARK_3_SCORE", MAP_FUNCTION: mapBenchMarkScore}
        ,{TEST: "IMG_LL", CODE:"RLA_BEG", FIELD: "BEGINNING", MAP_FUNCTION: mapRLAScore}
        ,{TEST: "IMG_LL", CODE:"RLA_MID", FIELD: "MIDDLE", MAP_FUNCTION: mapRLAScore}
        ,{TEST: "IMG_LL", CODE:"RLA_END", FIELD: "END", MAP_FUNCTION: mapRLAScore}

        ,{TEST: "IMG_LL", CODE:"LSSN", FIELD: "LESSONS", MAP_FUNCTION: mapLessonScore}
        ,{TEST: "IMG_LL", CODE:"LANG", FIELD: "LANGUAGE_LESSONS", MAP_FUNCTION: mapLanguageScore}
        ,{TEST: "IMG_LL", CODE:"LIT", FIELD: "LITERACY_LESSONS", MAP_FUNCTION: mapLiteracyScore}
        ,{TEST: "IMG_LL", CODE:"GRAM", FIELD: "GRAMMAR_LESSONS", MAP_FUNCTION: mapGrammarScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "First" : "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "Second" : "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "Third" : "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "Fourth" : "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "Fifth" : "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "Sixth" : "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "Seventh" : "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "Eighth" : "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "Nine" : "09",
        "10": "10",
        "Grade 10": "10",
        "Tenth" : "10",
        "Ten" : "10",
        "11": "11",
        "Grade 11": "11",
        "Eleven": "11",
        "12": "12",
        "Grade 12": "12",
        "Twelve" : "12",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
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
        var birthDateObject = _util.coalesce(AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd"), null);

         var testDateField = row.getField("TEST_ADMIN_DATE");
         var testDateObject = {
                                   RAW_DATE : null
                                   , MONTH : null
                                   , DAY : null
                                   , YEAR : null
                                   , STANDARD_DATE : null
                              };

         if (testDateField !== null && testDateField !== "" && testDateField !== undefined){
             if (testDateField.length() == 20 && testDateField.indexOf("/")>-1){
                    testDateField = testDateField.split(" ")[0];
                     testDateObject = AppUtil.getDateObjByPattern(testDateField, "M/d/yyyy").STANDARD_DATE;
             }
             else if (testDateField.length() == 21 && testDateField.indexOf("/")>-1) {
                 testDateField = testDateField.split(" ")[0];//date format is M/d/yyyy HH:mm:ss a - removing timestamp
                 testDateObject = AppUtil.getDateObjByPattern(testDateField, "M/dd/yyyy").STANDARD_DATE;
             }
             else if (testDateField.length() == 22 && testDateField.indexOf("/")>-1) {
                 testDateField = testDateField.split(" ")[0];
                 testDateObject = AppUtil.getDateObjByPattern(testDateField, "MM/dd/yyyy").STANDARD_DATE;
             }
             else if (testDateField.length() == 21 && testDateField.indexOf("/")>-1) {
                 testDateField = testDateField.split(" ")[0];
                 testDateObject = AppUtil.getDateObjByPattern(testDateField, "MM/d/yyyy").STANDARD_DATE;
            }
          } else {
                testDateObject.STANDARD_DATE = testDateField;
          }


    function getTEST_ADMIN_PERIOD(row,testDateObject) {

        if( testDateObject !== null){

                var month = testDateObject.substring(0,2);
                    if (month === "07" || month === "08" || month === "09" || month === "10"){
                        testAdminPeriod = "Fall";
                    }
                    else if (month === "11" || month === "12" || month === "01" || month === "02"){
                        testAdminPeriod = "Winter";
                    }
                    else if (month === "03" || month === "04" || month === "05" || month === "06"){
                        testAdminPeriod = "Spring";
                    }
                }
        return testAdminPeriod;
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
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(row,testDateObject);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //TEST_ADMIN_DATE must always finish/print as MM/dd/YYYY format
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject, null);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ALT_ID"));
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
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE_LEVEL')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
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
    function mapBenchMarkScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField("EMBEDDED_" + testMetadata.FIELD);

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
        return score;

    }


    function mapRLAScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField("RLA_SCORE_" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_RAW_SCORE"] = scaleScore;
        }

        return score;
    }

    function mapLessonScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var lessonsCompleted = row.getField(testMetadata.FIELD + "_COMPLETED");
        var lessonsPassed = row.getField(testMetadata.FIELD + "_PASSED");
        var lessonsPassRate = row.getField("LESSON_PASS_RATE");

        // Check for key fields and do not map score and exit if conditions met.
        if(lessonsCompleted === null || lessonsCompleted === undefined || _util.trim(lessonsCompleted) === "--" || _util.trim(lessonsCompleted) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;


    	score["TEST_ITEMS_POSSIBLE"] = lessonsCompleted;
        score["TEST_ITEMS_ATTEMPTED"] = lessonsPassed;

            if (lessonsPassRate !== null && lessonsPassRate.indexOf(".")>-1){
                score["TEST_PERCENTAGE_SCORE"] = Number(lessonsPassRate).toFixed(4);
            }
            else {
                score["TEST_PERCENTAGE_SCORE"] = lessonsPassRate;
            }


       return score;
    }

    function mapLanguageScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var lessonsCompleted = row.getField(testMetadata.FIELD + "_COMPLETED");
        var lessonsPassed = row.getField(testMetadata.FIELD + "_PASSED");
        var lessonsPassRate = row.getField("LANGUAGE_LESSON_PASS_RATE");

        // Check for key fields and do not map score and exit if conditions met.
        if(lessonsCompleted === null || lessonsCompleted === undefined || _util.trim(lessonsCompleted) === "--" || _util.trim(lessonsCompleted) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;


    	score["TEST_ITEMS_POSSIBLE"] = lessonsCompleted;
        score["TEST_ITEMS_ATTEMPTED"] = lessonsPassed;

                if (lessonsPassRate !== null && lessonsPassRate.indexOf(".")>-1){
                    score["TEST_PERCENTAGE_SCORE"] = Number(lessonsPassRate).toFixed(4);
                }
                else {
                    score["TEST_PERCENTAGE_SCORE"] = lessonsPassRate;
                }



        return score;
    }

    function mapLiteracyScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var lessonsCompleted = row.getField(testMetadata.FIELD + "_COMPLETED");
        var lessonsPassed = row.getField(testMetadata.FIELD + "_PASSED");
        var lessonsPassRate = row.getField("LITERACY_LESSON_PASS_RATE");

        // Check for key fields and do not map score and exit if conditions met.
        if(lessonsCompleted === null || lessonsCompleted === undefined || _util.trim(lessonsCompleted) === "--" || _util.trim(lessonsCompleted) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;


    	score["TEST_ITEMS_POSSIBLE"] = lessonsCompleted;
        score["TEST_ITEMS_ATTEMPTED"] = lessonsPassed;


           if (lessonsPassRate !== null && lessonsPassRate.indexOf(".")>-1){
               score["TEST_PERCENTAGE_SCORE"] = Number(lessonsPassRate).toFixed(4);
           }
           else {
               score["TEST_PERCENTAGE_SCORE"] = lessonsPassRate;
           }



        return score;
    }

    function mapGrammarScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var lessonsCompleted = row.getField(testMetadata.FIELD + "_COMPLETED");
        var lessonsPassed = row.getField(testMetadata.FIELD + "_PASSED");
        var lessonsPassRate = row.getField("GRAMMAR_LESSON_PASS_RATE");

        // Check for key fields and do not map score and exit if conditions met.
        if(lessonsCompleted === null || lessonsCompleted === undefined || _util.trim(lessonsCompleted) === "--" || _util.trim(lessonsCompleted) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;


    	score["TEST_ITEMS_POSSIBLE"] = lessonsCompleted;
        score["TEST_ITEMS_ATTEMPTED"] = lessonsPassed;


           if (lessonsPassRate !== null  && lessonsPassRate.indexOf(".")>-1){
               score["TEST_PERCENTAGE_SCORE"] = Number(lessonsPassRate).toFixed(4);
           }
           else {
               score["TEST_PERCENTAGE_SCORE"] = lessonsPassRate;
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


       var testAdminDate = srcRecord.getField("TEST_ADMIN_DATE");
       var FinalDate = testAdminDate.split(" ")[0];
       if(FinalDate !== null && FinalDate !== undefined && FinalDate !== "") {
           var adminDate = AppUtil.getMonthFollowedByDay(FinalDate).STANDARD_DATE;
       }
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        assessmentAdminKey = assessmentAdminKey + "_" + adminDate;

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);

        //Add conformed MM/dd/yyyy test/completion date as the last value
        //Test/completion date should not be present in the NATURAL_KEY of any signatures, it is to be added here
        //If the test date is truly not needed, this section can be deleted when creating a new connector
//        var fileTestDate = row.getField("test_date");
//        if(fileTestDate!==undefined && fileTestDate!== null) {
//            fileTestDate = fileTestDate.toString();
//            //The template contains an example of having multiple date strings. If your connector only has one, only take what is inside the ELSE statement and remove the rest of the IF/ELSE code
//            // If your connector has multiple dates with / or -, consider if the string length can be used for an IF/ELSEIF check
//            if(fileTestDate.indexOf("/")>-1) {
//                assessmentAdminKey = assessmentAdminKey + "_" + AppUtil.getDateObjByPattern(row.getField(fileTestDate), "M/d/yyyy").STANDARD_DATE;
//            }
//            else{
//                assessmentAdminKey = assessmentAdminKey + "_" + AppUtil.getDateObjByPattern(row.getField(fileTestDate), "MM-dd-yyyy").STANDARD_DATE;
//            }
      //  }
        
        return assessmentAdminKey;
    }

    return module;
}());