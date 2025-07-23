var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IREADY_PERSONALIZED_INSTRUCTION";
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
    var scoresToMap = [
        {TEST: "IREADY_PI_", NAME: 'SCALE', MAP_FUNCTION: mapOverallScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var ref_GradeDecodes = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "KG",
        "K": "KG"
    };

    var ref_GradeDecodesNum = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "0",
        "K": "0"
    };

    var levelDecodes = {
        "Early 1": "Level 1",
        "Early 2": "Level 2",
        "Early 3": "Level 3",
        "Early 4": "Level 4",
        "Early 5": "Level 5",
        "Early 6": "Level 6",
        "Early 7": "Level 7",
        "Early 8": "Level 8",
        "Early 9": "Level 9",
        "Early 10": "Level 10",
        "Early 11": "Level 11",
        "Early 12": "Level 12",
        "Early K": "Level K",
        "Emerging K": "Emerging K",
        "Late 1": "Level 1",
        "Late 2": "Level 2",
        "Late 3": "Level 3",
        "Late 4": "Level 4",
        "Late 5": "Level 5",
        "Late 6": "Level 6",
        "Late 7": "Level 7",
        "Late 8": "Level 8",
        "Late 9": "Level 9",
        "Late 10": "Level 10",
        "Late 11": "Level 11",
        "Late 12": "Level 12",
        "Late K": "Level K",
        "Level 1": "Level 1",
        "Level 2": "Level 2",
        "Level 3": "Level 3",
        "Level 4": "Level 4",
        "Level 5": "Level 5",
        "Level 6": "Level 6",
        "Level 7": "Level 7",
        "Level 8": "Level 8",
        "Level 9": "Level 9",
        "Level 10": "Level 10",
        "Level 11": "Level 11",
        "Level 12": "Level 12",
        "Level K": "Level K",
        "Mid 1": "Level 1",
        "Mid 2": "Level 2",
        "Mid 3": "Level 3",
        "Mid 4": "Level 4",
        "Mid 5": "Level 5",
        "Mid 6": "Level 6",
        "Mid 7": "Level 7",
        "Mid 8": "Level 8",
        "Mid 9": "Level 9",
        "Mid 10": "Level 10",
        "Mid 11": "Level 11",
        "Mid 12": "Level 12",
        "Mid K": "Level K",
        "Tested Out": null,
        "Early / Mid 1": "Level 1",
        "Early / Mid K": "Level K",
        "Mid / Late K": "Level K",
        "Mid / Late 1": "Level 1",
        "Max Score": null,
        "Grade 1": "Level 1",
        "Grade 2": "Level 2",
        "Grade 3": "Level 3",
        "Grade 4": "Level 4",
        "Grade 5": "Level 5",
        "Grade 6": "Level 6",
        "Grade 7": "Level 7",
        "Grade 8": "Level 8",
        "Grade 9": "Level 9",
        "Grade 10": "Level 10",
        "Grade 11": "Level 11",
        "Grade 12": "Level 12",
        "Grade K": "Level K",
        "Extra 1": "Level 1",
        "Extra 2": "Level 2",
        "Extra 3": "Level 3",
        "Extra 4": "Level 4",
        "Extra 5": "Level 5",
        "Extra 6": "Level 6",
        "Extra 7": "Level 7",
        "Extra 8": "Level 8",
        "Extra 9": "Level 9",
        "Extra 10": "Level 10",
        "Extra 11": "Level 11",
        "Extra 12": "Level 12",
        "Extra K": "Level K"
    };
    var levelRank = {
        "Emerging K": "-1",
        "Level 1": "1",
        "Level 2": "2",
        "Level 3": "3",
        "Level 4": "4",
        "Level 5": "5",
        "Level 6": "6",
        "Level 7": "7",
        "Level 8": "8",
        "Level 9": "9",
        "Level 10": "10",
        "Level 11": "11",
        "Level 12": "12",
        "Level K": "0"
    };

    var decodeProfLevel = {
        "Standard Not Met": "1",
        "Standard Nearly Met": "2",
        "Standard Met": "3",
        "Standard Exceeded": "4",
        null: null
    };

    var passDecode = {
       "Passed" : "Yes"
       ,"Not Passed" : "No"
       ,"" : null
       ,null : null
      };

    var domainDecode = {
       "Phonological Awareness" : "PHON_AWARE"
       ,"Comprehension" : "COMP"
       ,"Comprehension: Close Reading" : "COMP_CLS_RD"
       ,"High-Frequency Words" : "HI_FREQ_WORD"
       ,"Phonics" : "PHONICS"
       ,"Vocabulary" : "VOCAB"
       ,"Geometry": "GEO"
       ,"Number and Operations" : "NUM_OP"
       ,"Measurement and Data" : "MEASURE_DATA"
       ,"Algebra and Algebraic Thinking" : "ALG_THINK"
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
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var testDateObj = AppUtil.getMonthFollowedByDay(row.getField("COMPLETION_DATE"));
        if(row.getField("ACADEMIC_YEAR")){
            var year = row.getField("ACADEMIC_YEAR").substring(5, 9);
        } else {
            var year = hierarchy.SCHOOL_YEAR.substring(5, 9);
        }
        var studentGenderCode = null;
               var genderCode = row.getField("GENDER");
               if (genderCode != null){
               studentGenderCode = _util.trim(row.getField("GENDER")+"-").substring(0,1);
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
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObj.STANDARD_DATE, '05/15/' + year);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"), row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = studentGenderCode;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = ref_GradeDecodes[row.getField('STUDENT_GRADE')];
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
                     record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL"), row.getField("SCHOOL_STATE_ID"));
                     break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = AssessmentLoader.config.SYS_PARTITION_VALUE; // for SCHOOL_NUMBER is dummy, custom added since LA.
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL"));
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

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapOverallScore(row, testMetadata) {
        var score = {};

        var subject = "";
        var domain = row.getField("DOMAIN");
        if (row.getField("SUBJECT") == "Reading") {
            if(row.getField("LESSON_LANGUAGE") == "English"){
                subject = "ELA";
            } else if(row.getField("LESSON_LANGUAGE") == "Spanish"){
                subject = "SPA";
            }
        } else if (row.getField("SUBJECT") == "Math") {
            subject = "MATH";
        }
        var lessonId = row.getField("LESSON_ID");
        var testNumber = testMetadata.TEST + lessonId.replace(/\./g, '_').toUpperCase();
        var scaleScore = row.getField(testMetadata.NAME + "_SCORE");
        var lessonLevel = row.getField("LESSON_LEVEL");
        var lessonGrade = row.getField("LESSON_GRADE");
        var placementScore = lessonLevel +" "+ lessonGrade;
        var passedInd = row.getField("PASSED_OR_NOT_PASSED");
        var itemAttempt = row.getField("TOTAL_TIME_ON_LESSON_MIN");
        var lessonName = row.getField("LESSON_NAME");

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
        var quat = parseInt(levelRank[levelDecodes[placementScore]]);
        var curr = _util.coalesce(ref_GradeDecodesNum[row.getField("STUDENT_GRADE")], row.getField("STUDENT_GRADE"), '@ERR');
        if (curr != null && curr != "" && curr != "@ERR") {
            curr = parseInt(curr, 10);
            if (quat - curr == 0 || placementScore == "Tested Out") {
                score["TEST_QUATERNARY_RESULT"] = "On Level";
            }
            else if (quat - curr > 0 || placementScore == "Max Score") {
                score["TEST_QUATERNARY_RESULT"] = "Above Level";
            }
            else if (quat - curr == -1) {
                score["TEST_QUATERNARY_RESULT"] = "1 Level Below";
            }
            else if (quat - curr < -1) {
                score["TEST_QUATERNARY_RESULT"] = "2 or More Levels Below";
            }
        }

        score["TEST_SCORE_ATTRIBUTES"] = lessonName;
    	score["TEST_PASSED_INDICATOR"] = passDecode[passedInd];
    	score["TEST_PRIMARY_RESULT_CODE"] = passedInd;
    	score["TEST_ITEMS_ATTEMPTED"] = itemAttempt;

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