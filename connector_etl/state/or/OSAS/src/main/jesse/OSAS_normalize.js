var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "OSAS";
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
        //SCIENCE Scores
        {TEST: "OSAS", CODE:"OVR_SCI", FIELD: "SCIENCE", MAP_FUNCTION: mapScienceScore}
        //SCIENCE Strand Scores
        ,{TEST: "OSAS", CODE:"SCI_3D_ESS", FIELD: "3-DIMENSIONAL_EARTH_AND_SPACE_SCIENCE", MAP_FUNCTION: mapScienceStrandScore}
        ,{TEST: "OSAS", CODE:"SCI_3D_LS", FIELD: "3-DIMENSIONAL_LIFE_SCIENCE", MAP_FUNCTION: mapScienceStrandScore}
        ,{TEST: "OSAS", CODE:"SCI_3D_PS", FIELD: "3-DIMENSIONAL_PHYSICAL_SCIENCE", MAP_FUNCTION: mapScienceStrandScore}

        // ELA Scores
        ,{TEST: "OSAS", CODE:"OVR_ELA", FIELD: "ENGLISH_LANGUAGE_ARTS", MAP_FUNCTION: mapELAScore}
        ,{TEST: "OSAS", CODE:"ELA_RD", FIELD: "READING", MAP_FUNCTION: mapELAScore}
        ,{TEST: "OSAS", CODE:"ELA_WR", FIELD: "WRITING_CLAIM", MAP_FUNCTION: mapELAScore}
        ,{TEST: "OSAS", CODE:"ELA_LIST", FIELD: "LISTENING", MAP_FUNCTION: mapELAScore}
        ,{TEST: "OSAS", CODE:"ELA_RIC", FIELD: "RESEARCH_INQUIRY_CLAIM", MAP_FUNCTION: mapELAScore}
        // ELA Strand Scores
        ,{TEST: "OSAS", CODE:"ELA_INFO_EE", FIELD: "INFORMATIONAL_EVIDENCE_ELABORATION", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_INFO_OP", FIELD: "INFORMATIONAL_ORGANIZATION_PURPOSE", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_INFO_CON", FIELD: "INFORMATIONAL_CONVENTIONS", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_OPN_EE", FIELD: "OPINION_EVIDENCE_ELABORATION", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_OPN_OP", FIELD: "OPINION_ORGANIZATION_PURPOSE", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_OPN_CON", FIELD: "OPINION_CONVENTIONS", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_EXP_EE", FIELD: "EXPLANATORY_EVIDENCE_ELABORATION", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_EXP_OP", FIELD: "EXPLANATORY_ORGANISATION_PURPOSE", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_EXP_CON", FIELD: "EXPLANATORY_CONVENTIONS", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_ARG_EE", FIELD: "ARGUMENTATIVE_EVIDENCE_ELABORATION", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_ARG_OP", FIELD: "ARGUMENTATIVE_ORGANISATION_PURPOSE", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_ARG_CON", FIELD: "ARGUMENTATIVE_CONVENTIONS", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_NAR_EE", FIELD: "NARRATIVE_EVIDENCE_ELABORATION", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_NAR_OP", FIELD: "NARRATIVE_ORGANISATION_PURPOSE", MAP_FUNCTION: mapELAStrandScore}
        ,{TEST: "OSAS", CODE:"ELA_NAR_CON", FIELD: "NARRATIVE_CONVENTIONS", MAP_FUNCTION: mapELAStrandScore}

        //Mathematics Scores
        ,{TEST: "OSAS", CODE:"OVR_MA", FIELD: "MATHEMATICS", MAP_FUNCTION: mapMathematicsScore}
        ,{TEST: "OSAS", CODE:"MA_CPC", FIELD: "CONCEPTS_AND_PROCEDURES_CLAIM", MAP_FUNCTION: mapMathematicsScore}
        ,{TEST: "OSAS", CODE:"MA_PS_MOD_DA", FIELD: "PROBLEM_SOLVING_4_MODELING_&_DATA_ANALYSIS", MAP_FUNCTION: mapMathematicsScore}
        ,{TEST: "OSAS", CODE:"MA_CRC", FIELD: "COMMUNICATING_REASONING_CLAIM", MAP_FUNCTION: mapMathematicsScore}

        //SocialScience Scores
        ,{TEST: "OSAS", CODE:"OVR_SOC_SCI", FIELD: "SOCIAL_SCIENCES", MAP_FUNCTION: mapSocialScienceScore}
        ,{TEST: "OSAS", CODE:"SS_CIV_GOV", FIELD: "CIVICS_AND_GOVERNMENT", MAP_FUNCTION: mapSocialScienceScore}
        ,{TEST: "OSAS", CODE:"SS_ECO", FIELD: "ECONOMICS", MAP_FUNCTION: mapSocialScienceScore}
        ,{TEST: "OSAS", CODE:"SS_GEO", FIELD: "GEOGRAPHY", MAP_FUNCTION: mapSocialScienceScore}
        ,{TEST: "OSAS", CODE:"SS_HIST_SK", FIELD: "HISTORICAL_SKILLS", MAP_FUNCTION: mapSocialScienceScore}
        ,{TEST: "OSAS", CODE:"SS_US_HIST", FIELD: "US_HISTORY", MAP_FUNCTION: mapSocialScienceScore}
        ,{TEST: "OSAS", CODE:"SS_WORLD_HIST", FIELD: "WORLD_HISTORY", MAP_FUNCTION: mapSocialScienceScore}
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
       "Not Enough Information" : "NEI"
       , "Does Not Meet Standard" : "DNMS"
       ,"Meets" : "MS"
       ,"Level 1" : "1"
       ,"Level 2" : "2"
       ,"Level 3" : "3"
       ,"Level 4" : "4"
       ,"Below Standard" : "BS"
       ,"At/Near Standard" : "ANS"
       ,"Above Standard" : "AS"
       ,"Invalidated" : null
       ,"Not Attempted" : null
       ,"Insufficient to score" : null
       ,"N/A" : null
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
        var birthDate = row.getField("STUDENT_DOB");
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            if (birthDate.length() == 8){
                 birthDateObject = AppUtil.getDateObjByPattern(birthDate, "M/d/yyyy");
             }
             else if (birthDate.length() == 9 && birthDate.indexOf("/")>-1) {
                 birthDateObject = AppUtil.getDateObjByPattern(birthDate, "M/dd/yyyy");
             }
             else if (birthDate.length() == 10 && birthDate.indexOf("-")>-1) {
                 birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MM-dd-yyyy");
             }
             }

        var testDateField = row.getField("TEST_COMPLETION_DATE");//05-01-2019
        var testDateObject = {
                                   RAW_DATE : null
                                   , MONTH : null
                                   , DAY : null
                                   , YEAR : null
                                   , STANDARD_DATE : null
                              };
        if (testDateField !== null && testDateField !== "" && testDateField !== undefined){
             if (testDateField.length() == 8){
                 testDateObject = AppUtil.getDateObjByPattern(testDateField, "M/d/yyyy");
             }
             else if (testDateField.length() == 9 && testDateField.indexOf("/")>-1) {
                 testDateObject = AppUtil.getDateObjByPattern(testDateField, "M/dd/yyyy");
             }
             else if (testDateField.length() == 10 && testDateField.indexOf("/")>-1) {
                 testDateObject = AppUtil.getDateObjByPattern(testDateField, "MM/dd/yyyy");
             }
             else if (testDateField.length() == 10) {
                 testDateObject = AppUtil.getDateObjByPattern(testDateField, "MM-dd-yyyy");
             }
             else if (testDateField.length() == 10) {
                 testDateObject = AppUtil.getDateObjByPattern(testDateField, "yyyy-MM-dd");
             }
        } else {
                testDateObject.STANDARD_DATE = testDateField;
        }


       var studentName = row.getField("STUDENT_NAME");
       if(studentName !== null && studentName !== "" && studentName !== undefined){
                var studentFirstName = studentName.split(",")[1].trim();
                var studentLastName = studentName.split(",")[0].trim();
       }

       var schoolInfo = row.getField("ENROLLED_SCHOOL");
       if(schoolInfo !== null && schoolInfo !== "" && schoolInfo !== undefined){
            var schoolName = schoolInfo.split("(")[0].trim();
            var schoolId = schoolInfo.split("(")[1].replace(")", "").trim();
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
                //TEST_ADMIN_DATE must always finish/print as MM/dd/YYYY format
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, null);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_LOCAL_STUDENT_ID_NUMBER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("DISTRICT_LOCAL_STUDENT_ID_NUMBER"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(studentFirstName, row.getField('STUDENT_FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(studentLastName, row.getField('STUDENT_LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(getGradeFromFilename(row, hierarchy), gradeDecode[row.getField('GRADE')]);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(schoolId, row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(schoolId, row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(schoolId, row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(schoolName, row.getField("SCHOOL_NAME"));
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
    function mapScienceScore(row, testMetadata, hierarchy) {

        var score = {};
        var gradeCode = getGradeFromFilename(row, hierarchy);
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + gradeCode;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var standardError = row.getField(testMetadata.FIELD + "_SCALE_SCORE_STANDARD_ERROR");
		var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE");

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

       if (!isNaN(standardError)) {
          score["TEST_STANDARD_ERROR"] = standardError;
       }
    	score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
    	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performanceLevel];
    	score["TEST_PRIMARY_RESULT"] = performanceLevel;

        return score;
    }


    function mapScienceStrandScore(row, testMetadata, hierarchy) {

        var score = {};
        var gradeCode = getGradeFromFilename(row, hierarchy);
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + gradeCode;
		var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE");

        // Check for key fields and do not map score and exit if conditions met.
        if(performanceLevel === null || performanceLevel === undefined || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === "" || performanceLevel === "n/a" || performanceLevel === "N/A") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;

    	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performanceLevel];
    	score["TEST_PRIMARY_RESULT"] = performanceLevel;

        return score;
    }

    function mapELAScore(row, testMetadata, hierarchy) {

        var score = {};
        var gradeCode = getGradeFromFilename(row, hierarchy);
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + gradeCode;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var standardError = row.getField(testMetadata.FIELD + "_SCALE_SCORE_STANDARD_ERROR");//ENGLISH_LANGUAGE_ARTS_SCALE_SCORE_STANDARD_ERROR
		var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE");//ENGLISH_LANGUAGE_ARTS_PERFORMANCE

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

       if (!isNaN(standardError)) {
          score["TEST_STANDARD_ERROR"] = standardError;
       }

       score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
       score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performanceLevel];
       score["TEST_PRIMARY_RESULT"] = performanceLevel;

       return score;
    }

    function mapELAStrandScore(row, testMetadata, hierarchy) {

        var score = {};
        var gradeCode = getGradeFromFilename(row, hierarchy);
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + gradeCode;

		var performanceLevel = _util.trim(_util.coalesce(row.getField(testMetadata.FIELD)));

        // Check for key fields and do not map score and exit if conditions met.
        if(performanceLevel === null || performanceLevel === undefined || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === "" || performanceLevel === "Insufficient" || performanceLevel === "N/A" || performanceLevel === "Off Topic") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
       score["TEST_PRIMARY_RESULT"] = performanceLevel;

       return score;
    }

    function mapMathematicsScore(row, testMetadata, hierarchy) {

        var score = {};
        var gradeCode = getGradeFromFilename(row, hierarchy);
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + gradeCode;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var standardError = row.getField(testMetadata.FIELD + "_SCALE_SCORE_STANDARD_ERROR");
        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE");

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

       if (!isNaN(standardError)) {
          score["TEST_STANDARD_ERROR"] = standardError;
       }

       score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
       score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performanceLevel];
       score["TEST_PRIMARY_RESULT"] = performanceLevel;

       return score;
    }

    function mapSocialScienceScore(row, testMetadata, hierarchy) {

        var score = {};
        var gradeCode = getGradeFromFilename(row, hierarchy);
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + gradeCode;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var standardError = row.getField(testMetadata.FIELD + "_SCALE_SCORE_STANDARD_ERROR");
        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE");

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

       if (!isNaN(standardError)) {
          score["TEST_STANDARD_ERROR"] = standardError;
       }

       score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
       score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performanceLevel];
       score["TEST_PRIMARY_RESULT"] = performanceLevel;

       return score;
    }

    function getGradeFromFilename(row, hierarchy) {
        var grade = "";
        var fileName = row.getRawField("LINEAGE_FILE");

        if (fileName.indexOf("Grade3") > -1) {
            grade = "03";
        } else if (fileName.indexOf("Grade4") > -1) {
            grade = "04";
        } else if (fileName.indexOf("Grade5") > -1) {
            grade = "05";
        } else if (fileName.indexOf("Grade6") > -1) {
            grade = "06";
        } else if (fileName.indexOf("Grade7") > -1) {
            grade = "07";
        } else if (fileName.indexOf("Grade8") > -1) {
            grade = "08";
        } else if (fileName.indexOf("HighSchool") > -1) {
            grade = "HS";
        }
        return grade;
    }

    function subjectFromSignatureName(signature, row){
        //For Handling Duplicates
        var sub = null;
        if(signature.getFormat().getFormatName() === 'English_2019_2024_45_COLS'){
            sub = 'ELA'
        } else if(signature.getFormat().getFormatName() === 'English_2019_2024_35_COLS'){
            sub = 'ELA'
        }else if(signature.getFormat().getFormatName() === 'Mathematics_19_24'){
            sub = 'MA'
        } else if(signature.getFormat().getFormatName() === 'Science_19_24'){
            sub = 'SCI'
        } else if(signature.getFormat().getFormatName() === 'Social_Science_19_24'){
            sub = 'SS'
        }

        return sub;
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

        var subject = subjectFromSignatureName(signature, srcRecord);
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        if(subject && subject!== null){
            assessmentAdminKey = assessmentAdminKey + "_" + subject;
        }

        return assessmentAdminKey;
    }

    return module;
}());