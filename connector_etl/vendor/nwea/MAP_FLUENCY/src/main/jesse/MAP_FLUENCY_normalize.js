var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MAP_FLUENCY";
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
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found or no student ID.", JSON.stringify(row)));
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
    var scoresToMap = [
        {TEST: "MAP_FL", CODE: "PC", TYPE: "MAP", FIELD:"PRINT_CONCEPT_", MAP_FUNCTION: mapScoredTest},
        {TEST: "MAP_FL", CODE: "LC", TYPE: "MAP", FIELD:"LISTENING_COMPREHENSION_", MAP_FUNCTION: mapScoredTest},
        {TEST: "MAP_FL", CODE: "LT", TYPE: "MAP", FIELD:"LITERAL_COMPREHENSION_", MAP_FUNCTION: mapScoredTest},
        {TEST: "MAP_FL", CODE: "LN", TYPE: "MAP", FIELD:"LANGUAGE_COMPREHENSION_", MAP_FUNCTION: mapScoredTest},
        {TEST: "MAP_FL", CODE: "PV", TYPE: "MAP", FIELD:"PICTURE_VOCAB_", MAP_FUNCTION: mapScoredTest},
        {TEST: "MAP_FL", CODE: "SR", TYPE: "MAP", FIELD:"SENTENCE_READING_FLUENCY_", MAP_FUNCTION: mapScoredTest},
        {TEST: "MAP_FL", CODE: "PA", TYPE: "MAP", FIELD:"PHONOLOGICAL_AWARENESS_", MAP_FUNCTION: mapZPDTest},
        {TEST: "MAP_FL", CODE: "PW", TYPE: "MAP", FIELD:"PHONICS_WORD_RECOGNITION_", MAP_FUNCTION: mapZPDTest},
        {TEST: "MAP_FL", CODE: "OR", TYPE: "MAP", FIELD:"ORAL_READING_", MAP_FUNCTION: mapOralReadingTest},
        {TEST: "MAP_FL", CODE: "PM", TYPE: "MAP", FIELD:"PROGRESS_MONITORING_", MAP_FUNCTION: mapProgressMonitoringTest}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var passedTest = {
        "Below Expectation": "No",
        "Approaching Expectation": "No",
        "Meets Expectation": "Yes",
        "Exceeds Expectation": "Yes",
        "No Score": "Yes",
        "No Expectation": "No",
        "": null,
        null: null
    };
    var primaryCode = {
        "Below Expectation": "1",
        "Approaching Expectation": "2",
        "Meets Expectation": "3",
        "Exceeds Expectation": "4",
        "No Score": "-1",
        "No Expectation": "0",
        "": null,
        null: null
    };

    var testLangCode = {
        "English": "ENG",
        "Spanish": "SPA"
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
        "PK": "PK",
        "Kindergarten": "KG",
        "": null,
        null: null
    };

    var decodeZPD = {
        "Blending & Segmenting": "BS",
        "Blending and Segmenting": "BS",
        "Blending & segmenting": "BS",
        "Blending and segmenting": "BS",
        "Decodable words: beginning": "DW_B",
        "Decodable Words: Beginning": "DW_B",
        "Decodable words: multisyllabic": "DW_M",
        "Decodable Words: Multisyllabic": "DW_M",
        "Decodable: CVC": "D_CVC",
        "Decodable: One-syllable": "D_OS",
        "Initial letters & syllables": "ILS",
        "Initial Letters & Syllables": "ILS",
        "Introduce - Letters and Sounds": "I_LS",
        "Introduce - Letters & Sounds": "I_LS",
        "Initial Sounds": "IS",
        "Introduce - Rhymes and Syllables": "I_RS",
        "Introduce - Rhymes & Syllables": "I_RS",
        "Letters and Sounds": "LS",
        "Letters & Sounds": "LS",
        "Letters in Words": "LIW",
        "Phonemic Manipulation": "PM",
        "Reinforce - Phonemic Manipulation": "R_PM",
        "Reinforce - Syllable & phoneme manipulation": "R_SPM",
        "Reinforce - Syllable & Phoneme Manipulation": "R_SPM",
        "Rhymes and Syllables": "RS",
        "Rhymes & Syllables": "RS",
        "Reinforce - Decodable words: multisyllabic": "R_DWM",
        "Reinforce - Decodable Words: Multisyllabic": "R_DWM",
        "Reinforce - Decodable: One-syllable": "R_DOS",
        "Syllable and phoneme manipulation": "SPM",
        "Syllable & Phoneme Manipulation": "SPM",
        "Syllable & phoneme manipulation": "SPM",
        "Syllable blending and initial sounds": "SBIS",
        "Syllable Blending & Initial Sounds": "SBIS",
        "Syllable blending & initial sounds": "SBIS",
        "": null,
        null: null
    };

    var outcomeDecode = {
        "N/A" : "N/A",
        "Flagged" : "F",
        "Not Flagged" : "NF",
        "Insufficient Data" : "ID",
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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
               RAW_DATE : null
               , MONTH : null
               , DAY : null
               , YEAR : null
               , STANDARD_DATE : null
           };
           var birthDate =  _util.coalesce(row.getField("STUDENT_BIRTHDATE"),row.getField("BIRTH_DATE"));
           if(birthDate !== null && birthDate !== undefined && birthDate !== "" && birthDate !== "0" && birthDate !== ".") {
              birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);//MM/dd/yyyy,MMddyyyy,yyyymmdd
           } else {
              birthDateObject = { RAW_DATE: null, MONTH: null, DAY: null, YEAR: null, STANDARD_DATE: null }; // Ensuring a valid object is assigned
           }

           var testAdminDate = null;
           var testDate = row.getField("TEST_ADMIN_DATE");
           if(testDate !== null && testDate !== undefined && testDate !== "" && testDate !== "0" && testDate !== ".") {
             testAdminDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;//MM/dd/yyyy,MMddyyyy,yyyymmdd
            }else{
                  testAdminDate  = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9);
            }

        var period = getTEST_ADMIN_PERIOD(row);
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                /*
                TERM_NAME
                DISTRICT_NAME
                SCHOOL_NAME
                STATE_STUDENT_ID_VERSION_1
                GRADE
                ASSIGNED_TEST_TYPE
                RESULT_TYPE
                TEST_LANGUAGE
                TEST_DATE
                 */
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = row.getField("GENDER");
                    break;



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
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testAdminDate;
                    break;
                case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("STATE_STUDENT_ID");
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("STATE_STUDENT_ID");
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("STATE_STUDENT_ID");
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
        var admin = {};
        
        //Fields appear in the same order as the initial signature
        //AssignedTestType	ResultType	TestLanguage
        admin.TEST_INTERVENTION_CODE = "ASSN";
        admin.TEST_INTERVENTION_DESC = row.getField("ASSIGNED_TEST_TYPE");
        admin.TEST_INTERVENTION_CODE_2 = "RSLT";
        admin.TEST_INTERVENTION_DESC_2 = row.getField("RESULT_TYPE");
        admin.TEST_INTERVENTION_CODE_3 = "LANG";
        admin.TEST_INTERVENTION_DESC_3 = row.getField("TEST_LANGUAGE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScoredTest(row, testMetaData) {
        var score = {};
        var testNumber = testMetaData.TEST + "_" + testLangCode[row.getField("TEST_LANGUAGE")] + "_" + testMetaData.CODE;
        var scoreCorrect = row.getField(testMetaData.FIELD + "CORRECT");
        var scoreAttempted = row.getField(testMetaData.FIELD + "ATTEMPTED");
        var performanceLevel = row.getField(testMetaData.FIELD + "PERFORMANCE_LEVEL");
        var dyslexiaScreenerOutcome = row.getField("DYSLEXIA_SCREENER_OUTCOME");
        var universalScreenerOutcome = row.getField("UNIVERSAL_SCREENER_OUTCOME");
        var RANDurationOverallScore = row.getField("RAPID_AUTOMATIZED_NAMING_OVERALL_SCORE");
        var RANPicturesCorrectPerSecondOverallScore = row.getField("RAPID_AUTOMATIZED_NAMING_PICTURES_CORRECT_PER_SECOND_OVERALL_SCORE");
        var domainScore = row.getField(testMetaData.FIELD + "DOMAIN_SCORE");
        var percentile = row.getField(testMetaData.FIELD + "TEST_PERCENTILE");
        var checkStudentID = row.getField("STATE_STUDENT_ID");

        // Check for key fields and do not map score and exit if conditions met.
        if((_util.trim(scoreAttempted) === null || _util.trim(scoreAttempted) === undefined || _util.trim(scoreAttempted) === "" ) &&
           (_util.trim(domainScore) === null || _util.trim(domainScore) === undefined || _util.trim(domainScore) === "" ) &&
           (_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === "" ) ||
           (_util.trim(checkStudentID) === null || _util.trim(checkStudentID) === undefined || _util.trim(checkStudentID) === "" )) {
            return null;
        };


        // Set score fields
        score["TEST_ITEMS_ATTEMPTED"] = scoreAttempted;
        score["TEST_SCORE_TEXT"] = scoreCorrect;
        score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_SCALED_SCORE"] = domainScore;
        score["TEST_SCORE_VALUE"] = scoreCorrect;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = primaryCode[performanceLevel];
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PASSED_INDICATOR"] = passedTest[performanceLevel];
        score["TEST_GROWTH_RESULT_CODE"] = outcomeDecode[dyslexiaScreenerOutcome];
        score["TEST_GROWTH_RESULT"] = dyslexiaScreenerOutcome;
        score["TEST_CUSTOM_RESULT"] = universalScreenerOutcome;
        score["TEST_CUSTOM_RESULT_CODE"] = outcomeDecode[universalScreenerOutcome];

        if (!isNaN(RANDurationOverallScore)) {
            score["TEST_GROWTH_TARGET_1"] = RANDurationOverallScore;
        }
        if (!isNaN(RANPicturesCorrectPerSecondOverallScore)) {
            score["TEST_GROWTH_TARGET_2"] = RANPicturesCorrectPerSecondOverallScore;
        }
        return score;
    }


    function mapZPDTest(row, testMetaData) {
        var score = {};
        var zpdName = row.getField(testMetaData.FIELD + "ZPD_NAME");
        var testNumber = testMetaData.TEST + "_" + testLangCode[row.getField("TEST_LANGUAGE")] + "_" + decodeZPD[zpdName] + "_" + testMetaData.CODE;
        var zpdLevel = row.getField(testMetaData.FIELD + "ZPD_LEVEL");
        var performanceLevel = row.getField(testMetaData.FIELD + "PERFORMANCE_LEVEL");
        var dyslexiaScreenerOutcome = row.getField("DYSLEXIA_SCREENER_OUTCOME");
        var universalScreenerOutcome = row.getField("UNIVERSAL_SCREENER_OUTCOME");
        var RANDurationOverallScore = row.getField("RAPID_AUTOMATIZED_NAMING_OVERALL_SCORE");
        var RANPicturesCorrectPerSecondOverallScore = row.getField("RAPID_AUTOMATIZED_NAMING_PICTURES_CORRECT_PER_SECOND_OVERALL_SCORE");
        var domain = row.getField(testMetaData.FIELD + "DOMAIN_SCORE");
        var percentile = row.getField(testMetaData.FIELD + "TEST_PERCENTILE");
        var checkStudentID = row.getField("STATE_STUDENT_ID");


        // Check for key fields and do not map score and exit if conditions met.
        if((_util.trim(zpdLevel) === null || _util.trim(zpdLevel) === undefined || _util.trim(zpdLevel) === "") ||
           (_util.trim(checkStudentID) === null || _util.trim(checkStudentID) === undefined || _util.trim(checkStudentID) === "")){
            return null;
        }


        // Set score fields
        score["TEST_SCORE_TEXT"] = zpdName;
        score["TEST_SCORE_VALUE"] = zpdLevel;
        score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_SCALED_SCORE"] = domain;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = primaryCode[performanceLevel];
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PASSED_INDICATOR"] = passedTest[performanceLevel];
        score["TEST_GROWTH_RESULT_CODE"] = outcomeDecode[dyslexiaScreenerOutcome]
        score["TEST_GROWTH_RESULT"] = dyslexiaScreenerOutcome;
        score["TEST_CUSTOM_RESULT"] = universalScreenerOutcome;
        score["TEST_CUSTOM_RESULT_CODE"] = outcomeDecode[universalScreenerOutcome]
        if (!isNaN(RANDurationOverallScore)) {
            score["TEST_GROWTH_TARGET_1"] = RANDurationOverallScore;
        }
        if (!isNaN(RANPicturesCorrectPerSecondOverallScore)) {
            score["TEST_GROWTH_TARGET_2"] = RANPicturesCorrectPerSecondOverallScore;
        }
        return score;
    }


    function mapOralReadingTest(row, testMetaData) {
        var score = {};
        var testNumber = testMetaData.TEST + "_" + testLangCode[row.getField("TEST_LANGUAGE")] + "_" + testMetaData.CODE;
        var testScore = row.getField(testMetaData.FIELD + "ACCURACY_SCORE");
        var accuracyPerformanceLevel = row.getField(testMetaData.FIELD + "ACCURACY_PERFORMANCE_LEVEL");
        var ratePerformanceLevel = row.getField(testMetaData.FIELD + "RATE_PERFORMANCE_LEVEL");
        var wcpm = row.getField(testMetaData.FIELD + "WCPM");
        var lexileScore = removeLexileAlphaChar(_util.coalesce(row.getField("LEXILE_" + testMetaData.FIELD + "MEASURE")));

        var dyslexiaScreenerOutcome = row.getField("DYSLEXIA_SCREENER_OUTCOME");
        var universalScreenerOutcome = row.getField("UNIVERSAL_SCREENER_OUTCOME");
        var RANDurationOverallScore = row.getField("RAPID_AUTOMATIZED_NAMING_OVERALL_SCORE");
        var RANPicturesCorrectPerSecondOverallScore = row.getField("RAPID_AUTOMATIZED_NAMING_PICTURES_CORRECT_PER_SECOND_OVERALL_SCORE");
        var checkStudentID = row.getField("STATE_STUDENT_ID");

        // Check for key fields and do not map score and exit if conditions met.
        if((_util.trim(testScore) === null || _util.trim(testScore) === undefined || _util.trim(testScore) === "") ||
           (_util.trim(checkStudentID) === null || _util.trim(checkStudentID) === undefined || _util.trim(checkStudentID) === "")){
            return null;
        }


        // Set score fields
        score["TEST_SCORE_TEXT"] = testScore;
        if(!isNaN(testScore)){
        score["TEST_SCORE_VALUE"] = testScore;
        }
        score["TEST_PRIMARY_RESULT"] = accuracyPerformanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = primaryCode[accuracyPerformanceLevel];
        score["TEST_SECONDARY_RESULT"] = ratePerformanceLevel;
        score["TEST_SECONDARY_RESULT_CODE"] = primaryCode[ratePerformanceLevel];
        score["TEST_TERTIARY_RESULT"] = wcpm;
        score["TEST_TERTIARY_RESULT_CODE"] = wcpm;
        score["TEST_READING_LEVEL"] = lexileScore;
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PASSED_INDICATOR"] = passedTest[accuracyPerformanceLevel];
        score["TEST_CUSTOM_PASS_IND"] = passedTest[ratePerformanceLevel];
        score["TEST_GROWTH_RESULT_CODE"] = outcomeDecode[dyslexiaScreenerOutcome];
        score["TEST_GROWTH_RESULT"] = dyslexiaScreenerOutcome;
        score["TEST_CUSTOM_RESULT"] = universalScreenerOutcome;
        score["TEST_CUSTOM_RESULT_CODE"] = outcomeDecode[universalScreenerOutcome];
        if (!isNaN(RANDurationOverallScore)) {
            score["TEST_GROWTH_TARGET_1"] = RANDurationOverallScore;
        }
        if (!isNaN(RANPicturesCorrectPerSecondOverallScore)) {
            score["TEST_GROWTH_TARGET_2"] = RANPicturesCorrectPerSecondOverallScore;
        }
        return score;
    }


    function mapProgressMonitoringTest(row, testMetaData) {
        var score = {};
        var testNumber = testMetaData.TEST + "_" + testLangCode[row.getField("TEST_LANGUAGE")] + "_" + testMetaData.CODE;
        var scoreCorrect = row.getField(testMetaData.FIELD + "COMPREHENSION_CORRECT");
        var scoreAttempted = row.getField(testMetaData.FIELD + "COMPREHENSION_ATTEMPTED");
        var accuracyScore = row.getField(testMetaData.FIELD + "ACCURACY_SCORE");
        var accuracyPerformanceLevel = row.getField(testMetaData.FIELD + "ACCURACY_PERFORMANCE_LEVEL");
        var ratePerformanceLevel = row.getField(testMetaData.FIELD + "RATE_PERFORMANCE_LEVEL");
        var wcpm = row.getField(testMetaData.FIELD + "WCPM");
        var lexileTextMeasureTange = row.getField(testMetaData.FIELD + "LEXILE_TEXT_MEASURE_RANGE");

        var dyslexiaScreenerOutcome = row.getField("DYSLEXIA_SCREENER_OUTCOME");
        var universalScreenerOutcome = row.getField("UNIVERSAL_SCREENER_OUTCOME");
        var RANDurationOverallScore = row.getField("RAPID_AUTOMATIZED_NAMING_OVERALL_SCORE");
        var RANPicturesCorrectPerSecondOverallScore = row.getField("RAPID_AUTOMATIZED_NAMING_PICTURES_CORRECT_PER_SECOND_OVERALL_SCORE");
        var checkStudentID = row.getField("STATE_STUDENT_ID");

        // Check for key fields and do not map score and exit if conditions met.
        if((_util.trim(scoreAttempted) === null || _util.trim(scoreAttempted) === undefined || _util.trim(scoreAttempted) === "") ||
           (_util.trim(checkStudentID) === null || _util.trim(checkStudentID) === undefined || _util.trim(checkStudentID) === "")){
            return null;
        }


        // Set score fields
        score["TEST_ITEMS_ATTEMPTED"] = scoreAttempted;
        score["TEST_SCORE_TEXT"] = scoreCorrect;
        score["TEST_SCORE_VALUE"] = scoreCorrect;
        if (!isNaN(accuracyScore)){
        score["TEST_RAW_SCORE"] = accuracyScore;
        }
        score["TEST_PRIMARY_RESULT"] = accuracyPerformanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = primaryCode[accuracyPerformanceLevel];
        score["TEST_SECONDARY_RESULT"] = ratePerformanceLevel;
        score["TEST_SECONDARY_RESULT_CODE"] = primaryCode[ratePerformanceLevel];
        score["TEST_TERTIARY_RESULT"] = wcpm;
        score["TEST_TERTIARY_RESULT_CODE"] = wcpm;
        score["TEST_QUATERNARY_RESULT"] = lexileTextMeasureTange;
        score["TEST_QUATERNARY_RESULT_CODE"] = lexileTextMeasureTange;
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PASSED_INDICATOR"] = passedTest[accuracyPerformanceLevel];
        score["TEST_CUSTOM_PASS_IND"] = passedTest[ratePerformanceLevel];
        score["TEST_GROWTH_RESULT_CODE"] = outcomeDecode[dyslexiaScreenerOutcome]
        score["TEST_GROWTH_RESULT"] = dyslexiaScreenerOutcome;
        score["TEST_CUSTOM_RESULT"] = universalScreenerOutcome;
        score["TEST_CUSTOM_RESULT_CODE"] = outcomeDecode[universalScreenerOutcome]
        if (!isNaN(RANDurationOverallScore)) {
            score["TEST_GROWTH_TARGET_1"] = RANDurationOverallScore;
        }
        if (!isNaN(RANPicturesCorrectPerSecondOverallScore)) {
            score["TEST_GROWTH_TARGET_2"] = RANPicturesCorrectPerSecondOverallScore;
        }
        return score;
    }

    function removeLexileAlphaChar(value) {
        if(value === undefined || value === null) {
            return null;
        } else if (value.trim().startsWith("BR") && value.trim().length() == 2){
            // BR = Beginning Reader
            return value.replace("L", "").replace("BR", "0");
        } else {
            return value.replace("L", "").replace("BR", "-").replace("L+", "");
        }
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
        var testDate = srcRecord.getField("TEST_ADMIN_DATE");
        var testAdminDate;

        if (testDate) {
            testAdminDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
        } else {
            testAdminDate = "05/15/" + hierarchy.SCHOOL_YEAR.slice(-4);
        }

        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey += "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        assessmentAdminKey += "_" + testAdminDate;

        return assessmentAdminKey;
    }

    function getTEST_ADMIN_PERIOD(row) {
        var period = row.getField("TERM_NAME").toUpperCase();
        var testAdminPeriod = "ALL";
        if (period.indexOf("FALL") > -1) {
            testAdminPeriod = "FALL";
        }
        else if (period.indexOf("WINTER") > -1) {
            testAdminPeriod = "WINTER";
        }
        else if (period.indexOf("SPRING") > -1) {
            testAdminPeriod = "SPRING";
        }
        return testAdminPeriod;
    }

    return module;
}());