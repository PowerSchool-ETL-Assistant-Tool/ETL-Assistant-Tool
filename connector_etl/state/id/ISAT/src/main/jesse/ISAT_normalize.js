var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ISAT";
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
        //BIOLOGY
        {TEST: "ISAT_", CODE:"BIO_OVR", FIELD: "BIOLOGY_", MAP_FUNCTION: mapScaledScore}


        //CHEMISTRY
        ,{TEST: "ISAT_", CODE:"CHEM_OVR", FIELD: "CHEMISTRY_", MAP_FUNCTION: mapScaledScore}

        //ELA/LITERACY
        ,{TEST: "ISAT_", CODE:"ELA_LIT_OVR", FIELD: "ELA_LITERACY_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ISAT_", CODE:"ALT_ELA_LIT_OVR", FIELD: "ALTERNATE_ELA_LITERACY_", MAP_FUNCTION: mapScaledScore}

        //MATHEMATICS
        ,{TEST: "ISAT_", CODE:"MATH_OVR", FIELD: "MATHEMATICS_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ISAT_", CODE:"ALT_MATH_OVR", FIELD: "ALTERNATE_MATHEMATICS_", MAP_FUNCTION: mapScaledScore}

        //ELA
        ,{TEST: "ISAT_", CODE:"ELA_OVR", FIELD: "ELA_", MAP_FUNCTION: mapScaledScore}

        //SCIENCE
        ,{TEST: "ISAT_", CODE:"SCI_OVR", FIELD: "SCIENCE_", MAP_FUNCTION: mapScaledScore}

        //CLAIM
        ,{TEST: "ISAT_", CODE:"RD_CLAIM", FIELD: "READING_CLAIM_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ISAT_", CODE:"WR_CLAIM", FIELD: "WRITING_CLAIM_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ISAT_", CODE:"LIST_CLAIM", FIELD: "LISTENING_CLAIM_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ISAT_", CODE:"RES_INQ_CLAIM", FIELD: "RESEARCH_INQUIRY_CLAIM_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ISAT_", CODE:"CONCEPT_PRO_CLAIM", FIELD: "CONCEPTS_AND_PROCEDURES_CLAIM_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ISAT_", CODE:"PS_MOD_DA_CLAIM", FIELD: "PROBLEM_SOLVING_AND_MODELING_&_DATA_ANALYSIS_CLAIM_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ISAT_", CODE:"COMM_RS_CLAIM", FIELD: "COMMUNICATING_REASONING_CLAIM_", MAP_FUNCTION: mapScaledScore}

        //STRAND
        ,{TEST: "ISAT_", CODE:"NOS", FIELD: "NATURE_OF_SCIENCE_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "ISAT_", CODE:"BIO", FIELD: "BIOLOGY_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "ISAT_", CODE:"PHY_SCI", FIELD: "PHYSICAL_SCIENCE_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "ISAT_", CODE:"EARTH_SCI_SYS", FIELD: "EARTH_AND_SCIENCE_SYSTEMS_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "ISAT_", CODE:"PER_SOCI_PERSPECT", FIELD: "PERSONAL_AND_SOCIAL_PERSPECTIVES_", MAP_FUNCTION: mapStrandScore},
        ,{TEST: "ISAT_", CODE:"LIFE_SCI", FIELD: "LIFE_SCIENCES_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "ISAT_", CODE:"EARTH_SPC_SCI", FIELD: "EARTH_AND_SPACE_SCIENCES_", MAP_FUNCTION: mapStrandScore}
        // SCORE
        ,{TEST: "ISAT_", CODE:"_OVR", FIELD: "SCALE_", MAP_FUNCTION: mapSummativeScore}

        //PERFORMANCE
        ,{TEST: "ISAT_", CODE:"COMM_RS", FIELD: "COMMUNICATING_REASONING_", MAP_FUNCTION: mapPerformanceScore}
        ,{TEST: "ISAT_", CODE:"CONCEPT_PRO", FIELD: "CONCEPTS_AND_PROCEDURES_", MAP_FUNCTION: mapPerformanceScore}
        ,{TEST: "ISAT_", CODE:"PS_MOD_DA", FIELD: "PROBLEM_SOLVING_AND_MODELING_DATA_ANALYSIS_", MAP_FUNCTION: mapPerformanceScore}
        ,{TEST: "ISAT_", CODE:"LIST", FIELD: "LISTENING_", MAP_FUNCTION: mapPerformanceScore}
        ,{TEST: "ISAT_", CODE:"RD", FIELD: "READING_", MAP_FUNCTION: mapPerformanceScore}
        ,{TEST: "ISAT_", CODE:"RES_INQ", FIELD: "RESEARCH_INQUIRY_", MAP_FUNCTION: mapPerformanceScore}
        ,{TEST: "ISAT_", CODE:"WR", FIELD: "WRITING_", MAP_FUNCTION: mapPerformanceScore}
        ,{TEST: "ISAT_", CODE:"RD_LIS", FIELD: "READING_AND_LISTENING_", MAP_FUNCTION: mapPerformanceScore}
        ,{TEST: "ISAT_", CODE:"WR_RES", FIELD: "WRITING_AND_RESEARCH_", MAP_FUNCTION: mapPerformanceScore}
    ];

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
        "1" :  {CODE: "Level 1", DESC: "Not met achievement standard", PASS_IND: "No"}
        ,"2" : {CODE: "Level 2", DESC: "Nearly met the achievement level", PASS_IND: "No"}
        ,"3" : {CODE: "Level 3", DESC: "Met the achievement level", PASS_IND: "Yes"}
        ,"4" : {CODE: "Level 4", DESC: "Exceeded the achievement level", PASS_IND: "Yes"}
        ,"Above Standard" : {CODE: "AS", DESC: "Above Standard", PASS_IND: "Yes"}
        ,"At/Near Standard" : {CODE: "NS", DESC: "At/Near Standard", PASS_IND: "Yes"}
        ,"Approaching Standard" : {CODE: "AS", DESC: "Approaching Standard", PASS_IND: "Yes"}
        ,"Below Standard" : {CODE: "BS", DESC: "Below Standard", PASS_IND: "No"}
        ,"Level 1" : {CODE: "Level 1", DESC: "Not met achievement standard", PASS_IND: "No"}
        ,"Level 2" : {CODE: "Level 2", DESC: "Nearly met the achievement level", PASS_IND: "No"}
        ,"Level 3" : {CODE: "Level 3", DESC: "Met the achievement level", PASS_IND: "Yes"}
        ,"Level 4" : {CODE: "Level 4", DESC: "Exceeded the achievement level", PASS_IND: "Yes"}
        ,"Insufficient to score" : {CODE: null, DESC: null, PASS_IND: null}
        ,"Invalidated" : {CODE: null, DESC: null, PASS_IND: null}
        ,"" : {CODE: null, DESC: null, PASS_IND: null}
        ,null : {CODE: null, DESC: null, PASS_IND: null}
        ,undefined : {CODE: null, DESC: null, PASS_IND: null}
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

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = _util.coalesce(row.getField("STUDENT_DOB"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }
        var adminDate = _util.coalesce(row.getField("DATE_TAKEN"));
        if(adminDate !== null && adminDate !== undefined && adminDate !== "") {
            adminDate = AppUtil.getMonthFollowedByDay(adminDate).STANDARD_DATE;
        }

        var studentName = _util.coalesce(row.getField("STUDENT_NAME"));
        if (studentName && studentName !== null) {
            var splitName = studentName.split(",",2);
            var studentFirstName = splitName[1];
            var studentLastName = splitName[0];
        }

        var schoolName = _util.coalesce(row.getField("ENROLLED_SCHOOL"));
        var localId = _util.coalesce(row.getField("ENROLLED_SCHOOL_ID"));
        if (schoolName && schoolName !== null) {
            var schoolId = schoolName.split("(").pop().replace(')', '');
            var schName = schoolName.split("(")[0];
        }
//        if(schoolId.indexOf('_')> -1){
//            schoolId = schoolName.split("_")[1].replace(')', '');
//        }

        var assessmentPeriod = adminPeriod(hierarchy, row);

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
                    record.REPORTING_PERIOD = _util.coalesce(assessmentPeriod, hierarchy.REPORTING_PERIOD.toUpperCase());
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(adminDate, "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9));
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
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('STUDENT_FIRST_NAME'), studentFirstName);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField('STUDENT_LAST_NAME'), studentLastName);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField('STUDENT_MIDDLE_NAME'));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('ENROLLED_GRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("ENROLLED_SCHOOL_ID"), row.getField("ENROLLED_SCHOOL"), schName);
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("ENROLLED_SCHOOL_ID"), schoolId);
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("ENROLLED_SCHOOL_ID"), schoolId);
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(schName);
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

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var sem = row.getField(testMetadata.FIELD + "STANDARD_ERROR");
        var ptPoss = row.getField(testMetadata.FIELD + "POINTS_POSSIBLE");
        var ptEar = row.getField(testMetadata.FIELD + "POINTS_EARNED");
		var achieveLevel = _util.coalesce(row.getField(testMetadata.FIELD + "PROFICIENCY_LEVEL"), row.getField(testMetadata.FIELD + "ACHIEVEMENT_LEVEL") , row.getField(testMetadata.FIELD + "ACHIEVEMENT_CATEGORY") , row.getField(testMetadata.FIELD + "PERFORMANCE_LEVEL"));
        var rptLex = _util.coalesce(row.getField(testMetadata.FIELD + "REPORTED_LEXILE_MEASURE"), row.getField(testMetadata.FIELD + "REPORTED_QUANTILE_MEASURE"));

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || scaleScore === 'Insufficient to score' || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (achieveLevel === null || achieveLevel === undefined || _util.trim(achieveLevel) === "--" || _util.trim(achieveLevel) === ""))

        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if(achieveLevel){
            score["TEST_PASSED_INDICATOR"] = primaryDecode[achieveLevel].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achieveLevel].CODE;
            score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel].DESC;
    	}

    	if(ptPoss && !isNaN(ptPoss)){
            score["TEST_ITEMS_POSSIBLE"] = ptPoss;
        }

        if(ptEar && !isNaN(ptEar)){
            score["TEST_ITEMS_ATTEMPTED"] = ptEar;
        }

    	if(sem && !isNaN(sem)){
    	    score["TEST_STANDARD_ERROR"] = sem;
    	}

        score["TEST_READING_LEVEL"] = removeAlphaChar(rptLex);


        return score;
    }

    function mapStrandScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var itemPoss = row.getField(testMetadata.FIELD + "TOTAL_NUMBER_OF_QUESTIONS");
        var itemAttempt = row.getField(testMetadata.FIELD + "STUDENT_PERCENT_CORRECT");
		var perfLevel = row.getField(testMetadata.FIELD + "PERFORMANCE_LEVEL");
        // Check for key fields and do not map score and exit if conditions met.
        if((itemPoss === null || itemPoss === undefined || itemPoss === 'Insufficient to score' || _util.trim(itemPoss) === "--" || _util.trim(itemPoss) === "")
        && (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === ""))
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
    	if(itemPoss && !isNaN(itemPoss)){
            score["TEST_ITEMS_POSSIBLE"] = itemPoss;
        }
        if(itemAttempt && !isNaN(itemAttempt)){
            score["TEST_ITEMS_ATTEMPTED"] = itemAttempt;
        }

        if(perfLevel){
            score["TEST_CUSTOM_PASS_IND"] = primaryDecode[perfLevel].PASS_IND;
            score["TEST_SECONDARY_RESULT_CODE"] = primaryDecode[perfLevel].CODE;
            score["TEST_SECONDARY_RESULT"] = primaryDecode[perfLevel].DESC;
    	}

        return score;
    }

    function mapPerformanceScore(row, testMetadata){
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var perfLevel = row.getField(testMetadata.FIELD + "PERFORMANCE");

        // Check for key fields and do not map score and exit if conditions met.
        if((perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === "") &&
           ( scaleScore === null || scaleScore === undefined ))

        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = perfLevel;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if(perfLevel){
            score["TEST_PASSED_INDICATOR"] = primaryDecode[perfLevel].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[perfLevel].CODE;
            score["TEST_PRIMARY_RESULT"] = primaryDecode[perfLevel].DESC;
    	}

        return score;
    }

    function mapSummativeScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "SCORE");
        var sem = row.getField(testMetadata.FIELD + "SCORE_STANDARD_ERROR");
		var achieveLevel = _util.coalesce(row.getField("PERFORMANCE"));
        var rptLex = _util.coalesce(row.getField("REPORTED_LEXILE_MEASURE"));
        var rptQuan = _util.coalesce(row.getField("REPORTED_QUANTILE_MEASURE"));

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || scaleScore === 'Insufficient to score' || scaleScore === 'Invalidated' || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(achieveLevel){
            score["TEST_PASSED_INDICATOR"] = primaryDecode[achieveLevel].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achieveLevel].CODE;
            score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel].DESC;
    	}

    	if(sem && !isNaN(sem)){
    	    score["TEST_STANDARD_ERROR"] = sem;
    	}
        score["TEST_READING_LEVEL"] = removeAlphaChar(rptLex);
        score["TEST_SECONDARY_RESULT"] = removeAlphaChar(rptQuan);


        return score;
    }

    function generateTestNumber(row, testMetadata) {

        var testNumber = null;
        var testSubject = _util.trim(row.getField("TEST_SUBJECT"));
        if(testSubject === 'ELA'){
            subject = 'ELA';
        } else if(testSubject === 'Mathematics'){
            subject = 'MATH';
        }
        else if(testSubject === 'Science'){
            subject = 'SCI';
        }
        if(testSubject) {
             testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        } else {
             testNumber = testMetadata.TEST + testMetadata.CODE;
        }

        return testNumber;

    }

    function removeAlphaChar(value) {
        if(value === undefined || value === null) {
            return null;
        } else if (value.trim().startsWith("BR") && value.trim().length() == 2){
            // BR = Beginning Reader
            return value.replace("L", "").replace("BR", "");
        } else if (value.trim().startsWith("EM") && value.trim().length() == 2){
            return value.replace("Q", "").replace("EM", "");
        } else {
            return value.replace("L", "").replace("BR", "").replace("Q", "").replace("EM", "").replace("L+", "");
        }
    }

    function adminPeriod(hierarchy, row){
        var assessmentPeriod = row.getField("TEST_REASON");
        if (assessmentPeriod && assessmentPeriod.toUpperCase().indexOf("SPRING") > -1) {
            assessmentPeriod = 'SPRING';
        } else if (assessmentPeriod && assessmentPeriod.toUpperCase().indexOf("WINTER") > -1) {
            assessmentPeriod = 'WINTER';
        } else if (assessmentPeriod && assessmentPeriod.toUpperCase().indexOf("FALL") > -1) {
            assessmentPeriod = 'FALL';
        } else {
            assessmentPeriod = hierarchy.REPORTING_PERIOD.toUpperCase();
        }

        return assessmentPeriod;
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

    function subjectFromSignatureName(signature, row){
        //For Handling Duplicates
        var sub = null;
        if(signature.getFormat().getFormatName() === 'ISAT_BIO'){
            sub = '_BIO'
        } else if(signature.getFormat().getFormatName() === 'ISAT_51_COLS'){
            sub = '_MIX_SCORE'
        } else if(signature.getFormat().getFormatName() === 'ISAT_54_COLS'){
            sub = '_ALL_SCORE'
        } else if(signature.getFormat().getFormatName() === 'ISAT_2021'){
            sub = '_ALL'
        } else if(signature.getFormat().getFormatName() === 'ISAT_ALT_ELA_MATH'){
            sub = '_ALT_ELA_MATH'
        } else if(signature.getFormat().getFormatName() === 'ISAT_19_1_COLS'){
            sub = '_ALT_MATH'
        } else if(signature.getFormat().getFormatName() === 'ISAT_CHEMISTRY'){
            sub = '_CHEM'
        } else if(signature.getFormat().getFormatName() === 'ISAT_ELA_2122' || signature.getFormat().getFormatName() === 'ISAT_ELA_COL39' || signature.getFormat().getFormatName() === 'ISAT_33_1_COLS'){
            sub = '_ELA'
        } else if(signature.getFormat().getFormatName() === 'ISAT_MATH_2122' || signature.getFormat().getFormatName() === 'ISAT_23_1_COLS' || signature.getFormat().getFormatName() === 'ISAT_24_1_COLS'){
            sub = '_MATH'
        } else if(signature.getFormat().getFormatName() === 'ISAT_SCIENCE' || signature.getFormat().getFormatName() === 'ISAT_2021_2022'){
            sub = '_SCI'
        }

        return sub;
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
        var testSubjectRaw = srcRecord.getField("TEST_SUBJECT");
        var testSubject = testSubjectRaw ? _util.trim(testSubjectRaw).toUpperCase() : "";
        var subjectSuffix = "";
            if (testSubject === "ELA" || testSubject === "ELA/L SICA") {
                subjectSuffix = "_ELA";
            } else if (testSubject === "MATHEMATICS" || testSubject === "MATH SICA") {
                subjectSuffix = "_MATH";
            } else if (testSubject === "SCIENCE") {
                subjectSuffix = "_SCI";
            }

        var adminDate = _util.coalesce(srcRecord.getField("DATE_TAKEN"));
                if(adminDate !== null && adminDate !== undefined && adminDate !== "") {
                    adminDate = AppUtil.getMonthFollowedByDay(adminDate).STANDARD_DATE;
        }


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        if (signature.getFormat().getFormatName() === "ISAT_MATH_COL24" || signature.getFormat().getFormatName() === 'ISAT_SCIENCE_COL_23'){
            assessmentAdminKey = assessmentAdminKey + subjectSuffix + "_" + adminDate;
        }
        else if(subject && subject!== null){
            assessmentAdminKey = assessmentAdminKey + subject;
        }else{
            assessmentAdminKey = assessmentAdminKey;
        }

        return assessmentAdminKey;

    }
    return module;
}());