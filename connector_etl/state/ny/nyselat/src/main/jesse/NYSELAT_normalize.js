var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "nyselat";
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

    var scoresToMap = [
        {TEST: "NYSELAT", CODE:"_ELA", FIELD: "ELA_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "NYSELAT", CODE:"_MA", FIELD: "MATH_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "NYSELAT", CODE:"_SCI", FIELD: "SCIENCE_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "NYSELAT", CODE:"_NUM", FIELD: "NUMERIC_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "NYSELAT", CODE:"_LIS", FIELD: "LISTENING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYSELAT", CODE:"_SP", FIELD: "SPEAKING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYSELAT", CODE:"_RD", FIELD: "READING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYSELAT", CODE:"_WR", FIELD: "WRITING_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "NYSELAT", CODE:"_TOT", FIELD: "TOT_", MAP_FUNCTION: mapTotScore}

        //GradeWise
        ,{TEST: "NYSELAT", CODE:"_G3ELA", FIELD: "G3ELA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G4ELA", FIELD: "G4ELA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G5ELA", FIELD: "G5ELA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G6ELA", FIELD: "G6ELA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G7ELA", FIELD: "G7ELA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G8ELA", FIELD: "G8ELA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G3MA", FIELD: "G3MA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G4MA", FIELD: "G4MA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G5MA", FIELD: "G5MA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G6MA", FIELD: "G6MA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G7MA", FIELD: "G7MA_", MAP_FUNCTION: mapTotScore}
        ,{TEST: "NYSELAT", CODE:"_G8MA", FIELD: "G8MA_", MAP_FUNCTION: mapTotScore}
         ,{TEST: "NYSELAT", CODE:"_G4SC", FIELD: "G4SC_", MAP_FUNCTION: mapTotScore}
         ,{TEST: "NYSELAT", CODE:"_G5SC", FIELD: "G5SC_", MAP_FUNCTION: mapTotScore}
         ,{TEST: "NYSELAT", CODE:"_G8SC", FIELD: "G8SC_", MAP_FUNCTION: mapTotScore}
         ,{TEST: "NYSELAT", CODE:"_G5SS", FIELD: "G5SS_", MAP_FUNCTION: mapTotScore}
         ,{TEST: "NYSELAT", CODE:"_G8SS", FIELD: "G8SS_", MAP_FUNCTION: mapTotScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeDecode = {
        "1": "01",
        "01": "01",
        "KF": "01",
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
        "Kindergarten": "KG",
        "9-12": "9-12",
        "3-4": "3-4",
        "1-2": "1-2",
        "5-6": "5-6",
        "7-8": "7-8",
        //For short files
         "NYSESLAT: K Total Score" : "KG"
        , "NYSESLAT: 1 Total Score" : "01"
        , "NYSESLAT: 2 Total Score" : "02"
        , "NYSESLAT: 3 Total Score" : "03"
        , "NYSESLAT: 4 Total Score" : "04"
        , "NYSESLAT: 5 Total Score" : "05"
        , "NYSESLAT: 6 Total Score" : "06"
        , "NYSESLAT: 7 Total Score" : "07"
        , "NYSESLAT: 8 Total Score" : "08"
        , "NYSESLAT: 9 Total Score" : "09"
        , "NYSESLAT: 10 Total Score" : "10"
        , "NYSESLAT: 11 Total Score" : "11"
        , "NYSESLAT: 12 Total Score" : "12"
        , "NYSESLAT: K Listening" : "KG"
        , "NYSESLAT: K Reading" : "KG"
        , "NYSESLAT: K Speaking" : "KG"
        , "NYSESLAT: K Writing" : "KG"
        , "NYSESLAT: 1-2 Listening" : "1-2"
        , "NYSESLAT: 1-2 Reading" : "1-2"
        , "NYSESLAT: 1-2 Speaking" : "1-2"
        , "NYSESLAT: 1-2 Writing" : "1-2"
        , "NYSESLAT: 3-4 Listening" : "3-4"
        , "NYSESLAT: 3-4 Reading" : "3-4"
        , "NYSESLAT: 3-4 Speaking" : "3-4"
        , "NYSESLAT: 3-4 Writing" : "3-4"
        , "NYSESLAT: 5-6 Listening" : "5-6"
        , "NYSESLAT: 5-6 Reading" : "5-6"
        , "NYSESLAT: 5-6 Speaking" : "5-6"
        , "NYSESLAT: 5-6 Writing" : "5-6"
        , "NYSESLAT: 7-8 Listening" : "7-8"
        , "NYSESLAT: 7-8 Reading" : "7-8"
        , "NYSESLAT: 7-8 Speaking" : "7-8"
        , "NYSESLAT: 7-8 Writing" : "7-8"
        , "NYSESLAT: 9-12 Listening" : "9-12"
        , "NYSESLAT: 9-12 Reading" : "9-12"
        , "NYSESLAT: 9-12 Speaking" : "9-12"
        , "NYSESLAT: 9-12 Writing" : "9-12"
        , "K Total Score" : "KG"
        , "1 Total Score" : "01"
        , "2 Total Score" : "02"
        , "3 Total Score" : "03"
        , "4 Total Score" : "04"
        , "5 Total Score" : "05"
        , "6 Total Score" : "06"
        , "7 Total Score" : "07"
        , "8 Total Score" : "08"
        , "9 Total Score" : "09"
        , "10 Total Score" : "10"
        , "11 Total Score" : "11"
        , "12 Total Score" : "12"
        , "K Listening" : "KG"
        , "K Reading" : "KG"
        , "K Speaking" : "KG"
        , "K Writing" : "KG"
        , "1-2 Listening" : "1-2"
        , "1-2 Reading" : "1-2"
        , "1-2 Speaking" : "1-2"
        , "1-2 Writing" : "1-2"
        , "3-4 Listening" : "3-4"
        , "3-4 Reading" : "3-4"
        , "3-4 Speaking" : "3-4"
        , "3-4 Writing" : "3-4"
        , "5-6 Listening" : "5-6"
        , "5-6 Reading" : "5-6"
        , "5-6 Speaking" : "5-6"
        , "5-6 Writing" : "5-6"
        , "7-8 Listening" : "7-8"
        , "7-8 Reading" : "7-8"
        , "7-8 Speaking" : "7-8"
        , "7-8 Writing" : "7-8"
        , "9-12 Listening" : "9-12"
        , "9-12 Reading" : "9-12"
        , "9-12 Speaking" : "9-12"
        , "9-12 Writing" : "9-12"
        , "1 Listening" : "01"
        , "1 Reading" : "01"
        , "1 Speaking" : "01"
        , "1 Writing" : "01"
        , "2 Listening" : "02"
        , "2 Reading" : "02"
        , "2 Speaking" : "02"
        , "2 Writing" : "02"
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

    function parseDate(rawDate) {

            var dateObj = {
                RAW_DATE : rawDate
                , MONTH : null
                , DAY : null
                , YEAR : null
                , STANDARD_DATE : null
            };

            var formatter;

            // Exit if no value is provided.
            if(_util.trim(_util.coalesce(rawDate, "")) === "") {
                return dateObj;
            }

            if (rawDate.indexOf(' ') > -1) {
               formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            } else if (rawDate.indexOf('-') > -1){
               formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
            } else {
               formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            }
            var javaDate = formatter.parse(rawDate);

            var calendar = java.util.Calendar.getInstance();
            calendar.setTime(javaDate);

            var year = calendar.get(java.util.Calendar.YEAR);
            var month = AppUtil.formatNumber(calendar.get(java.util.Calendar.MONTH) + 1);
            var day = AppUtil.formatNumber(calendar.get(java.util.Calendar.DAY_OF_MONTH));
            var standardDate = month + "/" + day + "/" + year;

            dateObj.MONTH = month;
            dateObj.DAY = day;
            dateObj.YEAR = year;
            dateObj.STANDARD_DATE = standardDate;

            return dateObj;
        }

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
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        //Date fields to be split
        var testDate = row.getField("TEST_DATE");
        var testAdminDate = null;
        if(testDate){
            if (testDate !== null && testDate !== undefined && testDate.indexOf(",") >=1) {
                testDate = testDate.toString().replace("\"","").toUpperCase();
                var rawDate = new Date(testDate);
                testAdminDate = AppUtil.getDateObjByPattern((rawDate.getMonth() + 1) + '/' + rawDate.getDate() + '/' +  rawDate.getFullYear(), "M/d/yyyy").STANDARD_DATE;
            }
            else {
                if (testDate !== null && testDate !== undefined && testDate !== "") {
                    var testDateObject = testDate.split(" ")[0];
                }

                if (testDateObject !== null && testDateObject.indexOf("-") >= 1 && testDateObject.split('-')[0].length === 4) {
                    testAdminDate = AppUtil.getDateObjByPattern(testDateObject, "yyyy-MM-dd").STANDARD_DATE;
                } else if (testDateObject !== null && testDateObject.indexOf("/") >= 1) {
                    testAdminDate = AppUtil.getDateObjByPattern(testDateObject, "d/M/yyyy").STANDARD_DATE;
                } else if (testDateObject !== null && testDateObject.indexOf("-") >= 1 && testDateObject.split('-')[1].length === 3) {
                    testAdminDate = AppUtil.getDateObjByPattern(testDateObject, "dd-MMM-yy").STANDARD_DATE;
                } else {
                    testAdminDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
                }
            }
        } else {
            testAdminDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
        }

        var studentName = row.getField("STUDENT_NAME");
        if (studentName !== null) {
            var newName = studentName.split(",");
            var studentFirstName = newName[1];
            var studentLastName = newName[0];
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
                    record.TEST_ADMIN_DATE = testAdminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENTID_LOCAL"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID_ALT"),row.getField("STUDENTID_LOCAL"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENTID_LOCAL"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('STUDENT_FIRST_NAME'),studentFirstName);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField('STUDENT_LAST_NAME'),studentLastName);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"),null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField('GRADE_LEVEL'),row.getField("GRADE_LEVEL_1"))];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("DISTRICT_NAME"),row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_ID"),row.getField("DISTRICT_NAME"),row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                     break;
                case "DISTRICT_SCHOOL_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("DISTRICT_NAME"));
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

    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, testMetadata) {
        var score = {};
        //for short files subject is in the subtest identifier/GRADE_LEVEL_1
        var subIdent = row.getField("GRADE_LEVEL_1");
        if(subIdent!==undefined && subIdent !== null){

            if(subIdent.toString().indexOf("ing")>-1){//ex. Listening, Speaking, Reading, Writing
                return null;
            }
        }
        var lineageFile = null;
        lineageFile = row.getRawField("LINEAGE_FILE").toString().toUpperCase();

        if(row.getField("GRADE_LEVEL")) {
            var gradeLevel = row.getField("GRADE_LEVEL");
        }
        else if(row.getField("GRADE_LEVEL_1")){
            gradeLevel = row.getField("GRADE_LEVEL_1");
        }

        if(lineageFile.indexOf('NYSAA') > -1){
            testMetadata.TEST = "NYSAA";
        }
        else{
            testMetadata.TEST = 'NYSELAT';//Odd issues detected if a NYSAA and then a NYSELAT is loaded
        }

        var testNumber = testMetadata.TEST  + "_" + gradeDecode[gradeLevel] + testMetadata.CODE;
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "1"));
        var rawScore = row.getField(testMetadata.FIELD + "%_2");

        var achieveLevelCode = _util.coalesce(row.getField(testMetadata.FIELD + "STANDARD_ACHIEVED_CODE"),row.getField("STD_ACHIEVED_CODE"));
        var assessmentId = row.getField(testMetadata.FIELD + "STATE_ASSESSMENT_ID");

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""))
        {
            return null;
        }


    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_PRIMARY_RESULT_CODE"] = scaleScore;
        }
            score["TEST_TERTIARY_RESULT_CODE"] = assessmentId;

    	score["TEST_RAW_SCORE"] = rawScore;
        if((scaleScore === undefined || scaleScore === null)&& testMetadata.FIELD === "ELA_"){
            scaleScore = rawScore;//For the short 22_23 signature
        }
    	if(scaleScore >= 120 && scaleScore <= 212) {
    	    score["TEST_PRIMARY_RESULT"] = "Entering";
    	} else if(scaleScore >= 213 && scaleScore <= 244) {
             score["TEST_PRIMARY_RESULT"] = "Emerging";
        } else if(scaleScore >= 245 && scaleScore <= 263) {
             score["TEST_PRIMARY_RESULT"] = "Transitioning";
        }else if(scaleScore >= 264 && scaleScore <= 315) {
             score["TEST_PRIMARY_RESULT"] = "Expanding";
        }else if(scaleScore >= 316 && scaleScore <= 360) {
             score["TEST_PRIMARY_RESULT"] = "Commanding";
        }

        score["TEST_SECONDARY_RESULT_CODE"] = achieveLevelCode;

    	if(achieveLevelCode >= 31 && achieveLevelCode <= 31) {
    	    score["TEST_SECONDARY_RESULT"] = "Entering";
    	} else if(achieveLevelCode >= 32 && achieveLevelCode <= 32) {
             score["TEST_SECONDARY_RESULT"] = "Emerging";
        } else if(achieveLevelCode >= 33 && achieveLevelCode <= 33) {
             score["TEST_SECONDARY_RESULT"] = "Transitioning";
        }else if(achieveLevelCode >= 34 && achieveLevelCode <= 34) {
             score["TEST_SECONDARY_RESULT"] = "Expanding";
        }else if(achieveLevelCode >= 35 && achieveLevelCode <= 35) {
             score["TEST_SECONDARY_RESULT"] = "Commanding";
        }else if(achieveLevelCode >= 92 && achieveLevelCode <= 92) {
             score["TEST_SECONDARY_RESULT"] = "Receiving entirely remote instruction";
        }else if(achieveLevelCode >= 93 && achieveLevelCode <= 93) {
             score["TEST_SECONDARY_RESULT"] = "Medically excused";
        }else if(achieveLevelCode >= 95 && achieveLevelCode <= 95) {
             score["TEST_SECONDARY_RESULT"] = "Not enrolled at the time of test";
        }else if(achieveLevelCode >= 97 && achieveLevelCode <= 97) {
             score["TEST_SECONDARY_RESULT"] = "Administrative error";
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

    function mapSubScore(row, testMetadata) {

        var score = {};
        if(row.getField("GRADE_LEVEL")){
            var gradeLevel = row.getField("GRADE_LEVEL");
        }
        else if(row.getField("GRADE_LEVEL_1")){
            gradeLevel = row.getField("GRADE_LEVEL_1");
        }
        var lineageFile = null;
        lineageFile = row.getRawField("LINEAGE_FILE").toString().toUpperCase();

        if(lineageFile.indexOf('NYSAA') > -1){
            testMetadata.TEST = "NYSAA";
        }
        else{
            testMetadata.TEST = 'NYSELAT';
        }


        var testNumber = testMetadata.TEST  + "_" + gradeDecode[gradeLevel] + testMetadata.CODE;
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "SUBSCORE"));

        //for short files subject is in the subtest identifier/GRADE_LEVEL_1
        var subIdent = row.getField("GRADE_LEVEL_1");
        if(subIdent!==undefined && subIdent !== null){
            if(subIdent.toString().indexOf("Total Score")>-1){//ex. Listening, Speaking, Reading, Writing
                //Total Score belongs to the main ELA score and not to these
                return null;
            }
            if(subIdent.toString().indexOf("Reading")>-1 && testMetadata.CODE !== "_RD") {//ex. Listening, Speaking, Reading, Writing
                //Tie Reading to Reading only
                return null;
            }
            if(subIdent.toString().indexOf("Listening")>-1 && testMetadata.CODE !== "_LIS") {//ex. Listening, Speaking, Reading, Writing
                //Tie Listening to Listening only
                return null;
            }
            if(subIdent.toString().indexOf("Speaking")>-1 && testMetadata.CODE !== "_SP") {//ex. Listening, Speaking, Reading, Writing
                //Tie Speaking to Speaking only
                return null;
            }
            if(subIdent.toString().indexOf("Writing")>-1 && testMetadata.CODE !== "_WR") {//ex. Listening, Speaking, Reading, Writing
                //Tie Writing to Writing only
                return null;
            }

            //Subtests identified by the short signature need to have ELA_ as their field
            if(subIdent.toString().indexOf("ing")>-1) {
                testMetadata.FIELD = "ELA_";
                scaleScore =  + _util.coalesce(row.getField(testMetadata.FIELD + "%_2"));
                var achLevel =  + _util.coalesce(row.getField(testMetadata.FIELD + "ACHIEVEMENT_LEVEL"));
                if(achLevel !== undefined && achLevel!== null && achLevel !== "0" && achLevel !== 0) {
                    score["TEST_PRIMARY_RESULT"] = achLevel;
                }
            }

        }

        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""))
        {
            return null;
        }
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
             score["TEST_SCORE_VALUE"] = scaleScore;
             score["TEST_SCALED_SCORE"] = scaleScore;
        }
        return score;
    }
    function mapTotScore(row, testMetadata) {

        var score = {};
		var testNumber = testMetadata.TEST + testMetadata.CODE;

		var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "SCALESCORE"), row.getField(testMetadata.FIELD + "SCORE"));
		var profLevel = _util.coalesce(row.getField(testMetadata.FIELD + "PROFLEVEL"));
		var lepDuration = row.getField("LEP_DURATION");

		if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""))
        {
            return null;
        }
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
             score["TEST_SCORE_VALUE"] = scaleScore;
             score["TEST_SCALED_SCORE"] = scaleScore;
        }

        score["TEST_CUSTOM_RESULT"] = lepDuration;
		score["TEST_PRIMARY_RESULT"] = profLevel;
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

                var testDate = srcRecord.getField("TEST_DATE");
                var testAdminDate = null;
                if(testDate){
                    if (testDate !== null && testDate !== undefined && testDate.indexOf(",") >=1) {
                        testDate = testDate.toString().replace("\"","").toUpperCase();
                        var rawDate = new Date(testDate);
                        testAdminDate = AppUtil.getDateObjByPattern((rawDate.getMonth() + 1) + '/' + rawDate.getDate() + '/' +  rawDate.getFullYear(), "M/d/yyyy").STANDARD_DATE;
                    }
                    else {
                        if (testDate !== null && testDate !== undefined && testDate !== "") {
                            var testDateObject = testDate.split(" ")[0];
                        }

                        if (testDateObject !== null && testDateObject.indexOf("-") >= 1 && testDateObject.split('-')[0].length === 4) {
                            testAdminDate = AppUtil.getDateObjByPattern(testDateObject, "yyyy-MM-dd").STANDARD_DATE;
                        } else if (testDateObject !== null && testDateObject.indexOf("/") >= 1) {
                            testAdminDate = AppUtil.getDateObjByPattern(testDateObject, "d/M/yyyy").STANDARD_DATE;
                        } else if (testDateObject !== null && testDateObject.indexOf("-") >= 1 && testDateObject.split('-')[1].length === 3) {
                            testAdminDate = AppUtil.getDateObjByPattern(testDateObject, "dd-MMM-yy").STANDARD_DATE;
                        } else {
                            testAdminDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
                        }
                    }
                } else {
                    testAdminDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
                }


        assessmentAdminKey = assessmentAdminKey + "_" + testAdminDate;

        return assessmentAdminKey;
    }

    return module;
}());