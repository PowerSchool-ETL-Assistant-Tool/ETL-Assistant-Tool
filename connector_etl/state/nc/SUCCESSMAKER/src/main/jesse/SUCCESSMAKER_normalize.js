var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "SUCCESSMAKER";
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

			print("Normalized file: ${normalizedFile} \n");

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
        {TEST: "SUCCESSMAKER", CODE:"TOT", MAP_FUNCTION: mapTotScore},
        {TEST: "SUCCESSMAKER", CODE:"EXERCISES", MAP_FUNCTION: mapExercisesScore},
        {TEST: "SUCCESSMAKER", CODE:"SKILLS", MAP_FUNCTION: mapSkillsScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeDecode = {
        "0": "KG",
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
       "Adv" : "Advanced"
       , "Advanced" : "Advanced"
       ,"Bas" : "Basic"
       ,"Basic" : "Basic"
       ,"Bel" : "Below Basic"
       ,"Below Basic" : "Below Basic"
       ,"Pro" : "Proficient"
       ,"Proficient" : "Proficient"
       ,"" : null
       ,null : null
      };

    var passDecode = {
       "Adv" : "Yes"
       ,"Advanced" : "Yes"
       ,"Bas" : "No"
       ,"Basic" : "No"
       ,"Bel" : "No"
       ,"Below Basic" : "No"
       ,"Pro" : "Yes"
       ,"Proficient" : "Yes"
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
        var adminDate = getTestAdminDate(row,hierarchy);
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
                    record.REPORTING_PERIOD = _util.coalesce(getReportingPeriod(row, hierarchy), hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                    //todo REPORT_RUN_DATE? format is weird!
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = adminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("STUDENT_NUMBER");
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("STUDENT_NUMBER");
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("STUDENT_NUMBER");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_GRADE_CODE":
                       record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                       break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                    break;
                //no birthdate information in files, leaving it in for the future
                // case "STUDENT_DOB_MONTH":
                //     record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                //     break;
                // case "STUDENT_DOB_DAY":
                //     record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                //     break;
                // case "STUDENT_DOB_YEAR":
                //     record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                //     break;

                //todo School Information - some records have no school_info - reject on vendor_id
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOLID"),row.getField("SCHOOL_NAME"),row.getField("DISTRICT"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOLID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOLID"));
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
        return admin;
    }

    function getReportingPeriod(row,hierarchy){
        var month;
        var testAdminPeriod;
        var testAdminDate = getTestAdminDate(row,hierarchy);
            if( testAdminDate === null || testAdminDate === undefined){
                return testAdminDate;
            }

        var standardDate = testAdminDate;
        month = standardDate.substring(0,2);
            if( month === "08" || month === "09" || month === "10" || month === "11"){
                testAdminPeriod = "Beginning";
            } else if(month === "12" || month === "01" || month === "02" || month === "03"){
                testAdminPeriod = "Middle";
            } else if(month === "04" || month === "05" || month === "06" || month === "07"){
                testAdminPeriod = "End";
            }
        return testAdminPeriod;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapTotScore(row, testMetadata) {
        var Totscore = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + row.getField("SUBJECT").replace(/ /g,"_").toUpperCase();

        var scaleScore = row.getField("IPM_LEVEL");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
        Totscore["TEST_NUMBER"] = testNumber;
        Totscore["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            Totscore["TEST_SCORE_VALUE"] = scaleScore;
            Totscore["TEST_SCALED_SCORE"] = scaleScore;
        }
        Totscore["TEST_PRIMARY_RESULT"] = row.getField("CURRENT_COURSE_LEVEL");
        Totscore["TEST_GRADE_EQUIVALENT"] = row.getField("ASSIGNED_COURSE_LEVEL");
        if(!isNaN(row.getField("TOTAL_SESSIONS"))){
            Totscore["TEST_ITEMS_ATTEMPTED"] = row.getField("TOTAL_SESSIONS");
        }
        Totscore["TEST_GROWTH_RESULT"] = row.getField("GAIN");
        Totscore["TEST_SCORE_ATTRIBUTES"] = row.getField("TOTAL_TIME_SPENT");


        return Totscore;
    }

    function mapExercisesScore(row, testMetadata) {
        var Exercisescore = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + row.getField("SUBJECT").replace(/ /g,"_").toUpperCase();

        var exercises_attempted = row.getField("EXERCISES_ATTEMPTED_CPR");
        var exercises_correct = row.getField("EXERCISES_CORRECT_CPR");
        var pct_exercises_correct = row.getField("PCT_EXERCISES_CORRECT_CPR");

        // Check for key fields and do not map score and exit if conditions met.
        if(exercises_correct === null || exercises_correct === undefined || _util.trim(exercises_correct) === "--" || _util.trim(exercises_correct) === "") {
            return null;
        }

        // Set score fields
        Exercisescore["TEST_NUMBER"] = testNumber;
        if(!isNaN(exercises_attempted)){
            Exercisescore["TEST_ITEMS_ATTEMPTED"] = exercises_attempted;
        }
        Exercisescore["TEST_SCORE_TEXT"] = exercises_correct;
        if(!isNaN(pct_exercises_correct)){
            Exercisescore["TEST_PERCENTAGE_SCORE"] = pct_exercises_correct;
        }

        if(!isNaN(exercises_correct)){
            Exercisescore["TEST_SCORE_VALUE"] = exercises_correct;
            Exercisescore["TEST_SCALED_SCORE"] = exercises_correct;
        }
        return Exercisescore;
    }

    function mapSkillsScore(row, testMetadata) {
        var Skillsscore = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + row.getField("SUBJECT").replace(/ /g,"_").toUpperCase();

        var skills_assessed = row.getField("SKILLS_ASSESSED");
        var skills_mastered = row.getField("SKILLS_MASTERED");
        var pct_skills_mastered = row.getField("PCT_SKILLS_MASTERED");

        // Check for key fields and do not map score and exit if conditions met.
        if(skills_mastered === null || skills_mastered === undefined || _util.trim(skills_mastered) === "--" || _util.trim(skills_mastered) === "") {
            return null;
        }

        // Set score fields
        Skillsscore["TEST_NUMBER"] = testNumber;
        if(!isNaN(skills_assessed)){
            Skillsscore["TEST_ITEMS_ATTEMPTED"] = skills_assessed;
        }
        Skillsscore["TEST_SCORE_TEXT"] = skills_mastered;
        if(!isNaN(pct_skills_mastered)){
            Skillsscore["TEST_PERCENTAGE_SCORE"] = pct_skills_mastered;
        }

        if(!isNaN(skills_mastered)){
            Skillsscore["TEST_SCORE_VALUE"] = skills_mastered;
            Skillsscore["TEST_SCALED_SCORE"] = skills_mastered;
        }
        return Skillsscore;
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


    function getTestAdminDate(row,hierarchy) {
        let date = "";
        let adminDate = row.getField("TEST_ADMIN_DATE");
        if(adminDate !== null && adminDate !== "" && adminDate !== undefined){
            date = adminDate.substring(0, adminDate.indexOf(" "));
        }
        let testAdminDate = {
            RAW_DATE: date
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        if(date !== null && date !== "" && date !== undefined ){
            if(date.indexOf("/") > -1){
                if (date.length === 8) {
                    testAdminDate = AppUtil.getDateObjByPattern(date, "M/d/yyyy").STANDARD_DATE;
                }
                if (date.length === 9) {
                    testAdminDate = AppUtil.getDateObjByPattern(date, "M/dd/yyyy").STANDARD_DATE;
                }
                if (date.length === 10)
                {
                    testAdminDate = AppUtil.getDateObjByPattern(date, "MM/dd/yyyy").STANDARD_DATE;
                }
            }
            else if (date.indexOf("-") > -1) {
                if(date.split("-")[0].length === 4){
                    testAdminDate = AppUtil.getDateObjByPattern(date, "yyyy-MM-dd").STANDARD_DATE;
                } else {
                    testAdminDate = AppUtil.getDateObjByPattern(date, "dd-MM-yyyy").STANDARD_DATE;
                }
            }
            else if (date.indexOf(":") > -1) {
                testAdminDate = AppUtil.getDateObjByPattern("05/15/" + hierarchy.SCHOOL_YEAR.substring(5), "MM/dd/yyyy").STANDARD_DATE;
            }
        }
        else {
            testAdminDate = "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9);
        }
        return testAdminDate;
    }

    return module;
}());