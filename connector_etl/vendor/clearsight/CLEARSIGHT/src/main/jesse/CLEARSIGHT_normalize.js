var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CLEARSIGHT";
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
        {TEST: "CLEARSIGHT", CODE:"OVERALL", FIELD: "OVERALL_", MAP_FUNCTION: mapScaledScore}

        ,{TEST: "CLEARSIGHT", CODE:"WR_ARG_CSE", FIELD: "ARGUMENTATIVE_CONVENTIONS_OF_STANDARD_ENGLISH", MAP_FUNCTION: mapWritingStrands}
        ,{TEST: "CLEARSIGHT", CODE:"WR_ARG_EE", FIELD: "ARGUMENTATIVE_EVIDENCE_AND_ELABORATION", MAP_FUNCTION: mapWritingStrands}
        ,{TEST: "CLEARSIGHT", CODE:"WR_ARG_PFO", FIELD: "ARGUMENTATIVE_PURPOSE_FOCUS_AND_ORGANIZATION", MAP_FUNCTION: mapWritingStrands}

        ,{TEST: "CLEARSIGHT", CODE:"WR_INFEXP_CSE", FIELD: "INFORMATIVE_EXPLANATORY_CONVENTIONS_OF_STANDARD_ENGLISH", MAP_FUNCTION: mapWritingStrands}
        ,{TEST: "CLEARSIGHT", CODE:"WR_INFEXP_EE", FIELD: "INFORMATIVE_EXPLANATORY_EVIDENCE_AND_ELABORATION", MAP_FUNCTION: mapWritingStrands}
        ,{TEST: "CLEARSIGHT", CODE:"WR_INFEXP_PFO", FIELD: "INFORMATIVE_EXPLANATORY_PURPOSE_FOCUS_AND_ORGANIZATION", MAP_FUNCTION: mapWritingStrands}

        ,{TEST: "CLEARSIGHT", CODE:"WR_OPN_CSE", FIELD: "OPINION_CONVENTIONS_OF_STANDARD_ENGLISH", MAP_FUNCTION: mapWritingStrands}
        ,{TEST: "CLEARSIGHT", CODE:"WR_OPN_EE", FIELD: "OPINION_EVIDENCE_AND_ELABORATION", MAP_FUNCTION: mapWritingStrands}
        ,{TEST: "CLEARSIGHT", CODE:"WR_OPN_PFO", FIELD: "OPINION_PURPOSE_FOCUS_AND_ORGANIZATION", MAP_FUNCTION: mapWritingStrands}
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

    var perfLvlDecode = {
       "Below Proficient" : "BP"
       ,"Approaching Proficient" : "AP"
       ,"Proficient" : "PROF"
       ,"Highly Proficient" : "HP"
       ,"Insufficient score" : "IS"
       ,"Insufficient to score" : "IS"
       ,"Invalidated" : "INV"
       ,"" : null
       ,null : null
      };

    var passDecode = {
       "Below Proficient" : "No"
       ,"Approaching Proficient" : "No"
       ,"Proficient" : "Yes"
       ,"Highly Proficient" : "Yes"
       ,"insufficient score" : null
       ,"Insufficient to score" : null
       ,"Invalidated" : null
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
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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

        var studentName = row.getField("STUDENT_NAME");
               var splitName = studentName.split(",",2);
               var studentFirstName = splitName[1];
               var studentLastName = splitName[0];


        var birthDateObject = {
                   RAW_DATE : null
                   , MONTH : null
                   , DAY : null
                   , YEAR : null
                   , STANDARD_DATE : null
               }
               var birthDate = row.getField("STUDENT_DOB");
               if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
                   birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
               }

        var finalDate = null;
                if(row.getField("TEST_ADMIN_DATE")!==null && row.getField("TEST_ADMIN_DATE")!==undefined){
                    finalDate = AppUtil.getMonthFollowedByDay(row.getField("TEST_ADMIN_DATE")).STANDARD_DATE;
                }
                else{
                    finalDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
                }

                var testAdminPeriod = assessmentAdminPeriod(row, hierarchy);

                if (studentName !== undefined && studentName !== null) {
                   var splitName = studentName.split(",",2);
                   var studentFirstName = splitName[1];
                   var studentLastName = splitName[0];
                }

                if(row.getField("ENROLLED_SCHOOL")){
                      var schoolName = row.getField("ENROLLED_SCHOOL");
                      var schoolId = schoolName.split("_")[2].replace(")", "");
                      var schName = schoolName.split("(")[0];
                }

                if(row.getField("STUDENT_ID")){
                      var studentId = row.getField("STUDENT_ID");
                      var studentId = studentId.split("-")[2];
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
                    record.REPORTING_PERIOD = _util.coalesce(testAdminPeriod,hierarchy.REPORTING_PERIOD);
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
                    record.STUDENT_LOCAL_ID = studentId;
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = studentId;
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = studentFirstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = studentLastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField("STUDENT_MIDDLE_NAME");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = row.getField("GENDER");
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField("GRADE")];
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
                    record.SCHOOL_VENDOR_ID = schoolId;
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = schoolId;
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = schoolId;
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = schName;
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
        var subject = row.getField("TEST_SUBJECT");
        var testNumber =  generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var perflvl = row.getField("PERFORMANCE_LEVEL");

        var standardError = row.getField("SCALE_SCORE_STANDARD_ERROR_");

        //scores where 7/22 so calculated to 7/22*100;
        var percentile = row.getField("SCORE");
        if(percentile !== null && percentile !== undefined && _util.trim(percentile) !== "--" && _util.trim(percentile) !== "" ){
             if(percentile.indexOf("/") > -1 && percentile !== "N/A"){
                 var a = percentile.split("/")[0];
                 var b = percentile.split("/")[1];
                 var percentile = a/b*100;
             }
        }
        var percentage = row.getField("PERCENT_CORRECT");
        if(percentage !== null && percentage !== undefined && _util.trim(percentage) !== "--" && _util.trim(percentage) !== "" ){
            percentage = percentage.replace("%", "");
        }
        if(percentage === null || percentage === undefined || _util.trim(percentage) === "--" || _util.trim(percentage) === "" || percentage === "N/A" || percentage === "Insufficient to score" || percentage === "Invalidated")
        {
        percentage = null;
        }
        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === "N/A" || scaleScore === "Insufficient to score" || scaleScore === "Invalidated")
        && (percentage === null || percentage === undefined || _util.trim(percentage) === "--" || _util.trim(percentage) === "" || percentage === "N/A" || percentage === "Insufficient to score" || percentage === "Invalidated"))
         {
            return null;
        }
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PASSED_INDICATOR"] = passDecode[perflvl];
    	score["TEST_PRIMARY_RESULT_CODE"] = perfLvlDecode[perflvl];
    	score["TEST_PRIMARY_RESULT"] = perflvl;

       if(!isNaN(percentile) && (percentile !== null && percentile !== undefined && percentile !== "")){
        score["TEST_PERCENTILE_SCORE"] = (percentile).toFixed(4);
        }

         if(!isNaN(percentage)){
        score["TEST_PERCENTAGE_SCORE"] = percentage;
        }
        if(!isNaN(standardError)){
    	score["TEST_STANDARD_ERROR"] = standardError;
        }
        return score;
    }

    function mapWritingStrands(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD + "_SCORE");


        // Check for key fields and do not map score and exit if conditions met.
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || rawScore === "Insufficient to score"
        || rawScore === "N/A" || rawScore === "PROMPT_COPY_MATCH" || rawScore === "NOT_ENOUGH_DATA" || rawScore === "OUT_OF_VOCAB" || rawScore === "DUPLICATE_TEXT")
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = rawScore;
        if(!isNaN(rawScore)){
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
        }
        return score;
    }

    function assessmentAdminPeriod(row, hierarchy){
        var finalDate = null;
                if(row.getField("TEST_ADMIN_DATE")!==null && row.getField("TEST_ADMIN_DATE")!==undefined){
                    finalDate = AppUtil.getMonthFollowedByDay(row.getField("TEST_ADMIN_DATE")).STANDARD_DATE;
                }
                else{
                    finalDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
                }

                var month = finalDate.substring(0, 2);

                  if (month === "08" || month === "09" || month === "10" || month === "11")
                        testAdminPeriod = "Fall";
                  else if (month === "12" || month === "01" || month === "02")
                        testAdminPeriod = "Winter";
                  else if (month === "03" || month === "04" || month === "05")
                        testAdminPeriod = "Spring";

        return testAdminPeriod;
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
        var testPeriod = assessmentAdminPeriod(srcRecord, hierarchy);
        assessmentAdminKey = assessmentAdminKey + "_" + testPeriod;
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {
        var test = null;
        var testNumber = null;
        var testName = row.getField("TEST_NAME");
        if ((testName.indexOf("Interim: ELA Grade 3") > -1) || (testName.indexOf("Interim: ELA Grade 4") > -1) || (testName.indexOf("Interim: ELA Grade 5") > -1) ||
                      (testName.indexOf("Interim: ELA Grade 6") > -1) || (testName.indexOf("Interim: ELA Grade 7") > -1)|| (testName.indexOf("Interim: ELA Grade 8") > -1))
            {
                test = "INT_ELA_OVR";
             }else if ((testName.indexOf("Interim: Math Grade 3") > -1) || (testName.indexOf("Interim: Math Grade 4") > -1) || (testName.indexOf("Interim: Math Grade 5") > -1) ||
                      (testName.indexOf("Interim: Math Grade 6") > -1) || (testName.indexOf("Interim: Math Grade 7") > -1) || (testName.indexOf("Interim: Math Grade 8") > -1))
             {
                 test = "INT_MATH_OVR";
             }else if((testName.indexOf("ClearSight Formative: ELA Grade 8 Editing - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 7 Editing - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 6 Editing - 1") > -1) ||
                       (testName.indexOf("ClearSight Formative: ELA Grade 5 Editing - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 4 Editing - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 3 Editing - 1") > -1))
             {
                  test = "FOR_ELA_EDIT";
             }else if((testName.indexOf("ClearSight Formative: ELA Grade 3 Informational - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 4 Informational - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 5 Informational - 1") > -1) ||
                      (testName.indexOf("ClearSight Formative: ELA Grade 6 Informational - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 7 Informational - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 8 Informational - 1") > -1))
            {
                 test = "FOR_ELA_INFO";
            }else if((testName.indexOf("ClearSight Formative: ELA Grade 3 Literature - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 4 Literature - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 5 Literature - 1") > -1) ||
                       (testName.indexOf("ClearSight Formative: ELA Grade 6 Literature - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 7 Literature - 1") > -1) || (testName.indexOf("ClearSight Formative: ELA Grade 8 Literature - 1") > -1))
            {
                 test = "FOR_ELA_LIT";
            }else if((testName.indexOf("Interim: Reading Grade 3") > -1) || (testName.indexOf("Interim: Reading Grade 4") > -1) || (testName.indexOf("Interim: Reading Grade 5") > -1) ||
                        (testName.indexOf("Interim: Reading Grade 6") > -1) || (testName.indexOf("Interim: Reading Grade 7") > -1) || (testName.indexOf("Interim: Reading Grade 8") > -1))
            {
                 test = "INT_ELA_RD";
            }

                testNumber = testMetadata.TEST + '_' + test ;

                return testNumber;
            }

    return module;
}());