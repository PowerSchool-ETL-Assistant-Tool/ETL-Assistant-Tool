var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "EXACT_PATH";
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

			print("Normalized file: ${normalizedFile}\n");

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

    // scoresToMap is now dynamically generated based on signature format

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

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
       "Advanced" : "Advanced"
       ,"Basic" : "Basic"
       ,"Below Basic" : "Below Basic"
       ,"Proficient" : "Proficient"
       ,"Approaching" : "Approaching"
       ,"Below" : "Below"
       ,"Exceeds" : "Exceeds"
       ,"Meets" : "Meets"
       ,"N/A" : "N/A"
       ,"" : null
       ,null : null
      };

    var performanceLevelDecode = {
       "Advanced" : {CODE: "Advanced", DESC: "Advanced", PASS_IND: "Yes"}
       ,"Basic" : {CODE: "Basic", DESC: "Basic", PASS_IND: "No"}
       ,"Below Basic" : {CODE: "Below Basic", DESC: "Below Basic", PASS_IND: "No"}
       ,"Proficient" : {CODE: "Proficient", DESC: "Proficient", PASS_IND: "Yes"}
       ,"Approaching" : {CODE: "Approaching", DESC: "Approaching", PASS_IND: "No"}
       ,"Below" : {CODE: "Below", DESC: "Below", PASS_IND: "No"}
       ,"Exceeds" : {CODE: "Exceeds", DESC: "Exceeds", PASS_IND: "Yes"}
       ,"Meets" : {CODE: "Meets", DESC: "Meets", PASS_IND: "Yes"}
       ,"N/A"  : {CODE: null, DESC: null, PASS_IND: null}
       ,"" : {CODE: null, DESC: null, PASS_IND: null}
       ,null : {CODE: null, DESC: null, PASS_IND: null}
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

        var scoresByDate = setAdminByPeriodAndDate(signature, hierarchy, row);

        for (var scoreDateKey in scoresByDate) {
            AppUtil.nullSafePush(normalizedRecords, mapNormalizedRecord(signature, hierarchy, row, scoreDateKey, scoresByDate[scoreDateKey]));
        }

        return normalizedRecords;
    }


    function setAdminByPeriodAndDate(signature, hierarchy, row) {

        var scoresByDate  = {};
        var signatureFormatName = signature.getFormat().getFormatName();
        var scoresToMapToUse = [];
        if (signatureFormatName === "EXACTPATH_42COLS") {
            scoresToMapToUse = [
                {TEST: "EXACT_PATH", CODE:"_FALL", FIELD: "FALL_"}
                ,{TEST: "EXACT_PATH", CODE:"_WINTER", FIELD: "WINTER_"}
                ,{TEST: "EXACT_PATH", CODE:"_SPRING", FIELD: "SPRING_"}
            ];
        } else {
            scoresToMapToUse = [
                {TEST: "EXACT_PATH", CODE:"_DIA_TST_1", FIELD: "DIAGNOSTIC_TEST_1_"}
                ,{TEST: "EXACT_PATH", CODE:"_DIA_TST_2", FIELD: "DIAGNOSTIC_TEST_2_"}
                ,{TEST: "EXACT_PATH", CODE:"_DIA_TST_3", FIELD: "DIAGNOSTIC_TEST_3_"}
                ,{TEST: "EXACT_PATH", CODE:"_DIA_TST_4", FIELD: "DIAGNOSTIC_TEST_4_"}
                ,{TEST: "EXACT_PATH", CODE:"_DIA_TST_5", FIELD: "DIAGNOSTIC_TEST_5_"}
            ];
        }

        scoresToMapToUse.forEach(function (scoreData) {

            var scoreDateKey;

            if (signatureFormatName === "EXACTPATH_42COLS") {
                // Use FIELD and CODE only, ignore PERIOD
                var belongingPeriod = scoreData.FIELD.replace('_','').toUpperCase();
                var defaultDate = getDefaultDatesByPeriod(belongingPeriod, hierarchy);
                var belongingDate = _util.coalesce(row.getField("TESTING_WIN_" + belongingPeriod + "_COMPLETION_DATE"), defaultDate);
                if (belongingDate && (belongingDate.indexOf('/') > -1 || belongingDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.FIELD + '#' + String(belongingDate) + '#' + belongingPeriod;
                    scoresByDate[scoreDateKey] = [];
                }
            } else {
                // Legacy logic for diagnostic tests
                if (scoreData.CODE === "_DIA_TST_1" || scoreData.CODE === "_DIA_TST_2" || scoreData.CODE === "_DIA_TST_3" || scoreData.CODE === "_DIA_TST_4" || scoreData.CODE === "_DIA_TST_5" ) {
                    var belongingPeriod = _util.coalesce(row.getField(scoreData.FIELD + 'GLP_SEASON'), hierarchy.REPORTING_PERIOD);
                    belongingPeriod = belongingPeriod.toUpperCase();
                    var defaultDate = getDefaultDatesByPeriod(belongingPeriod, hierarchy);
                    var belongingDate = _util.coalesce(row.getField(scoreData.FIELD + 'COMPLETION_DATE'), defaultDate);
                    if (belongingDate && (belongingDate.indexOf('/') > -1 || belongingDate.indexOf('-') > -1)) {
                        scoreDateKey = scoreData.FIELD + '#' + String(belongingDate) + '#' + belongingPeriod;
                        scoresByDate[scoreDateKey] = [];
                    }
                }
            }
            AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapScaledScore(signature, row, scoreData));
        });

        return scoresByDate;
    }

    function getDefaultDatesByPeriod(period, hierarchy) {
        let defaultDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
        if(period === "FALL") {
            defaultDate = "09/15/" + hierarchy.SCHOOL_YEAR.substring(0,4);
        } else if(period === "WINTER") {
            defaultDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(0,4);
        } else if(period ==="SPRING") {
            defaultDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
        } else if(period ==="SUMMER") {
            defaultDate = "06/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
        }
        return defaultDate;
    }

    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     * @returns {Object}
     */
    function mapNormalizedRecord(signature, hierarchy, row, scoreDateKey, scores) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = scores;
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, scoreDateKey);

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
    function mapNormalizedAdminFields(signature, hierarchy, row, scoreDateKey) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

        // Handle different name field formats based on signature
        var firstName = null;
        var lastName = null;
        var signatureFormatName = signature.getFormat().getFormatName();

        if (signatureFormatName === "EXACTPATH_42COLS") {
            // New format has separate first/last name fields
            firstName = row.getField("LEARNER_FIRST_NAME");
            lastName = row.getField("LEARNER_LAST_NAME");
        } else {
            // Legacy format has combined name field
            var fullName = row.getField("STUDENT_NAME");
            if(fullName !== undefined && fullName !== null && fullName !== ""){
                var nameParts = fullName.split(",");
                if(nameParts.length >= 2) {
                    lastName = nameParts[0].trim();
                    firstName = nameParts[1].trim();
                }
            }
        }

        var scoreType,scorePeriod,scoreDate;

        if(scoreDateKey) {
            scoreType = scoreDateKey.split('#')[0];
            scoreDate = scoreDateKey.split('#')[1];
            scorePeriod = scoreDateKey.split('#')[2];
        }

        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, scoreType, scoreDate, scorePeriod);
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
                    record.REPORTING_PERIOD = scorePeriod;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(AppUtil.getMonthFollowedByDay(scoreDate).STANDARD_DATE);
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
                    record.STUDENT_FIRST_NAME = firstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GRADE_CODE":
                    var gradeField;
                    if (signatureFormatName === "EXACTPATH_42COLS") {
                        // For 42COLS format, try to get grade from any available testing window
                        gradeField = _util.coalesce(row.getField('TESTING_WINDOW_GRADE_FALL'),row.getField('TESTING_WINDOW_GRADE_WINTER'),row.getField('TESTING_WINDOW_GRADE_SPRING'));
                    } else {
                        gradeField = _util.coalesce(row.getField('DIAGNOSTIC_TEST_1_GRADE'),row.getField('GRADE_LEVEL'),row.getField('STUDENT_GRADE'));
                    }
                    record.STUDENT_GRADE_CODE = gradeDecode[gradeField];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("LOCATION_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("LOCATION_NAME"), "DISTRICT");
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
//
//        return admin;
    }

    function removeLexileAlphaChar(value) {
        if(value === undefined || value === null) {
            return null;
        } else if (value.trim().startsWith("BR") && value.trim().length() == 2){
            return value.replace("L", "").replace("Q", "").replace("BR", "0").replace("EM", "");
        } else {
            return value.replace("L", "").replace("Q", "").replace("BR", "-").replace("EM", "");
        }
    }
    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(signature, row, testMetadata) {
        var score = {};
        var subject = row.getField("SUBJECT_NAME");
        var subName = '';
        if(subject==='LanguageArts'){
            subName = '_ELA';
        } else if(subject==='Reading'){
            subName = '_RD';
        } else if(subject==='Mathematics'){
            subName = '_MA';
        }
        var testNumber = testMetadata.TEST + testMetadata.CODE + subName;

        var signatureFormatName = signature.getFormat().getFormatName();
        var scaleScore, profLevel, npr, lpeg, lexile, lexileRange;
        var lower = null;
        var upper = null;

        if (signatureFormatName === "EXACTPATH_42COLS") {
            if(subject === 'Reading' || subject === 'LanguageArts') {
                lexile = row.getField("READING_" + testMetadata.FIELD + "LEXILE_READING");
                lexileRange = row.getField("READING_" + testMetadata.FIELD + "LEXILE_RANGE_READING");
            } else if(subject === 'Mathematics') {
                lexile = row.getField("MATH_" + testMetadata.FIELD + "QUANTILE_MATH");
                lexileRange = row.getField("MATH_" + testMetadata.FIELD + "QUANTILE_RANGE_MATH");
            }

            scaleScore = row.getField("TESTING_WIN_" + testMetadata.FIELD + "SCALE_SCORE");
            profLevel = row.getField("TESTING_WINDOW_GRADE_" + testMetadata.FIELD.replace('_',''));
            npr = row.getField("TIME_ON_TASK_" + testMetadata.FIELD + "NPR");

        } else {
            scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
            profLevel = row.getField(testMetadata.FIELD + "GRADE_LEVEL_PROFICIENCY");
            npr = row.getField(testMetadata.FIELD + "NPR");
            lpeg = row.getField(testMetadata.FIELD + "LOWEST_LPEG");
            lexile = _util.coalesce(row.getField(testMetadata.FIELD + "LEXILE_READING"), row.getField(testMetadata.FIELD + "QUANTILE_MATH"));
            lexileRange = _util.coalesce(row.getField(testMetadata.FIELD + "LEXILE_RANGE_READING"), row.getField(testMetadata.FIELD + "QUANTILE_RANGE_MATH"));
        }

        if (lexileRange !== undefined && lexileRange !== null && lexileRange !== "") {
            var rangeParts = lexileRange.split("-");
            if(rangeParts.length === 2) {
                lower = rangeParts[0].replace("L","").replace("Q", "").replace("BR", "").replace("EM", "").trim();
                upper = rangeParts[1].replace("L","").replace("Q", "").replace("BR", "").replace("EM", "").trim();
            }
        }

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

        if(profLevel && performanceLevelDecode[profLevel]) {
            score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[profLevel].DESC;
            score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelDecode[profLevel].CODE;
            score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[profLevel].PASS_IND;
        }

    	score["TEST_READING_LEVEL"] = removeLexileAlphaChar(lexile);
        score["TEST_LOWER_BOUND"] = removeLexileAlphaChar(lower);
        score["TEST_UPPER_BOUND"] = removeLexileAlphaChar(upper);
        score["TEST_PERCENTILE_SCORE"] = npr;


        if (signatureFormatName === "EXACTPATH_42COLS") {
            var timeOnTask = row.getField("TIME_ON_TASK_" + testMetadata.FIELD + "SCALE_SCORE");
            if(timeOnTask !== null && timeOnTask !== undefined && _util.trim(timeOnTask) !== "--" && _util.trim(timeOnTask) !== "") {
                score["TEST_CUSTOM_RESULT"] = timeOnTask;
            }
        } else {
            // Add legacy fields
            if(lpeg !== null && lpeg !== undefined) {
                score["TEST_CUSTOM_RESULT_CODE"] = lpeg;
            }
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, scoreType, scoreDate, scorePeriod) {

        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        // Only append score-specific information if the parameters are provided
        if (scoreType !== undefined && scoreDate !== undefined && scorePeriod !== undefined) {
            var signatureFormatName = signature.getFormat().getFormatName();

            if (signatureFormatName === "EXACTPATH_42COLS") {
                // New format using periods - scoreType already ends with underscore, so add another one before scoreDate
                assessmentAdminKey = assessmentAdminKey + '_' + scoreType + scoreDate;
            } else {
                // Legacy format using diagnostic tests
                if (scoreType === 'DIAGNOSTIC_TEST_1_' || scoreType === 'DIAGNOSTIC_TEST_2_'
                || scoreType === 'DIAGNOSTIC_TEST_3_' || scoreType === 'DIAGNOSTIC_TEST_4_'
                || scoreType === 'DIAGNOSTIC_TEST_5_' ) {
                    assessmentAdminKey = assessmentAdminKey + '_' + scoreType + scoreDate;
                } else {
                    assessmentAdminKey = assessmentAdminKey + '_' + scoreType + scoreDate;
                }
            }
        }

        return assessmentAdminKey;
    }

    return module;
}());