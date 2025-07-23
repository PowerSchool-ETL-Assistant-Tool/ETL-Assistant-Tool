var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "TCAP";
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
         {TEST: "TCAP", CODE:"ENG", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "TCAP", CODE:"MAT", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "TCAP", CODE:"SCI", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "TCAP", CODE:"SOC", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"E1", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"E2", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"E3", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"M1", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"A1", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"A2", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"C1", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"B1", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"G1", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "EOC", CODE:"U1", FIELD: "SUBPART_", MAP_FUNCTION: mapScaledScore}
        , { TEST: "TCAP", CODE: "ENG", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "TCAP", CODE: "MAT", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "TCAP", CODE: "SCI", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "TCAP", CODE: "SOC", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "E1", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "E2", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "E3", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "M1", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "A1", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "A2", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "C1", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "B1", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "G1", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "EOC", CODE: "U1", FIELD: "SS", MAP_FUNCTION: mapRawScore }
        , { TEST: "TCAP", CODE: "ENG", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "TCAP", CODE: "MAT", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "TCAP", CODE: "SCI", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "TCAP", CODE: "SOC", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "E1", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "E2", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "E3", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "M1", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "A1", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "A2", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "C1", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "B1", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "G1", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }
        , { TEST: "EOC", CODE: "U1", FIELD: "TOTAL", MAP_FUNCTION: mapTotalScore }

        , { TEST: "", CODE: "SCORE", MAP_FUNCTION: mapCombinedScore }
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
    var decodePerformanceLevel = {
         "Below" 	            :{LEVEL: "1", DESC: "Below" , PASS_IND: "No"}
        ,"Basic"                :{LEVEL: "1", DESC: "Basic" , PASS_IND: "No"}
        ,"Below Basic"          :{LEVEL: "1", DESC: "Below Basic" , PASS_IND: "No"}
        ,"Approaching"          :{LEVEL: "2", DESC: "Approaching" , PASS_IND: "No"}
        ,"On track"             :{LEVEL: "3", DESC: "On-Track" , PASS_IND: "Yes"}
        ,"On-Track"             :{LEVEL: "3", DESC: "On-Track" , PASS_IND: "Yes"}
        ,"On Track"             :{LEVEL: "3", DESC: "On-Track" , PASS_IND: "Yes"}
        ,"Proficient"           :{LEVEL: "3", DESC: "Proficient" , PASS_IND: "Yes"}
        ,"Mastered"             :{LEVEL: "4", DESC: "Mastered" , PASS_IND: "Yes"}
        ,"Advanced"             :{LEVEL: "4", DESC: "Advanced" , PASS_IND: "Yes"}
        ,"1" 	: {LEVEL: "1", DESC: "Below" , PASS_IND: "No"}
        ,"2"	: {LEVEL: "2", DESC: "Approaching" , PASS_IND: "No"}
        ,"3"	: {LEVEL: "3", DESC: "On-Track" , PASS_IND: "Yes"}
        ,"4"	: {LEVEL: "4", DESC: "Mastered" , PASS_IND: "Yes"}
        ,"Below Expectations" :        {LEVEL: "1", DESC: "Below Expectations" , PASS_IND: "No"}
        ,"Approaching Expectations" :  {LEVEL: "2", DESC: "Approaching Expectations" , PASS_IND: "No"}
        ,"Met Expectations"  :         {LEVEL: "3", DESC: "Met Expectations" , PASS_IND: "Yes"}
        ,"Exceeded Expectations" :     {LEVEL: "4", DESC: "Exceeded Expectations" , PASS_IND: "Yes"}
        ,""   : {LEVEL: "", DESC: "" , PASS_IND: ""}
        ,undefined  : {LEVEL: null, DESC: null , PASS_IND: null}
        , null  : {LEVEL: null, DESC: null , PASS_IND: null }
    };


     var levelDecode = {
       "1" : "Lower"
      ,"2" : "Similar"
      ,"3" : "Higher"

     }
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
                if (testMetadata.FIELD === "SS") {
                    for (var i = 1; i <= 7; i++) {
                        var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, i);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                    }
                } else if (testMetadata.FIELD === "SUBPART_") {
                    for (var i = 1; i <= 4; i++) {
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, i);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                    }
                } else {
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                }

            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
        var birthdate = row.getField("STUDENT_BIRTHDATE");
        if(birthdate !== null && birthdate !== undefined && birthdate !== ""){
            if(birthdate.length === 8){
                 birthDateObject = AppUtil.getDateObjByPattern(birthdate, "MMddyyyy");
            }else if(birthdate.length >= 8 && birthdate.indexOf("/") > -1){
                 birthDateObject = AppUtil.getDateObjByPattern(birthdate, "MM/dd/yyyy");
            }else {
                birthDateObject = AppUtil.getDateObjByPattern(birthdate, "Mddyyyy");
            }
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
                    record.REPORTING_PERIOD = _util.coalesce(row.getField("PERIOD_NAME"), hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce('05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"), row.getField("VENDOR_STUDENT_ID"), row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"), row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("VENDOR_STUDENT_ID"), row.getField("STATE_STUDENT_ID"), row.getField("STUDENT_ID"));
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
                    record.STUDENT_GENDER_CODE = row.getField("GENDER");
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField('GRADE'), row.getField('GRADE_STUDENT_TEST_GRADE'))];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_NUMBER"), row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
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
//        var admin = {};
//
//        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
//            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
//        }
//        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");
//
//        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapTotalScore(row, testMetadata) {
        var score = {};
        var subject = _util.trim(row.getField("CONTENT_AREA_CODE"));
        var testType = getTestType(subject);
        if(testType != testMetadata.TEST || subject != testMetadata.CODE){
            return null;
        }
        var rawScore = row.getField(testMetadata.FIELD + "_POINTS_EARNED");
        var scaleScore = row.getField("SCALE_SCORE");
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || scaleScore === null || scaleScore === undefined) {
            return null;
        }
        var totalUpperScore = row.getField(testMetadata.FIELD + "_SCORE_CONFIDENCE_BAND_HIGH");
        var totalLowerScore = row.getField(testMetadata.FIELD + "_SCORE_CONFIDENCE_BAND_LOW");
        var percentile = row.getField(testMetadata.FIELD + "_PERCENTILE");
        var itemsPossible = row.getField(testMetadata.FIELD + "_POINTS_POSSIBLE");
		var perfLevel = _util.trim(row.getField("PERFORMANCE_LEVEL"));
        var testNumber = testType + `_${testMetadata.CODE}` + '_TOT';

        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = _util.trim(scaleScore).replace(" ","");
            score["TEST_SCALED_SCORE"] = _util.trim(scaleScore).replace(" ","");
        }
        score["TEST_NUMBER"] = testNumber;
        score["TEST_RAW_SCORE"] = _util.trim(rawScore).replace(" ","");
        score["TEST_SCORE_TEXT"] = _util.trim(rawScore).replace(" ","");
        score["TEST_PERCENTILE_SCORE"] = _util.trim(percentile);
        score["TEST_ITEMS_POSSIBLE"] = itemsPossible;
        score["TEST_LOWER_BOUND"] =  totalLowerScore;
        score["TEST_UPPER_BOUND"] = totalUpperScore;

        score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevel[perfLevel].LEVEL;
    	score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[perfLevel].DESC;
    	score["TEST_PASSED_INDICATOR"] = decodePerformanceLevel[perfLevel].PASS_IND;
        return score;
    }

    function getTestType(subject){
        if(subject !== null && subject !== undefined && (subject.indexOf('ENG') >-1 || subject.indexOf('MAT') >-1  || subject.indexOf('SCI') >-1  || subject.indexOf('SOC') >-1 )){
            return 'TCAP'
        }
        return 'EOC'
    }

    function mapScaledScore(row, testMetadata, bucket) {
        var subject = _util.trim(row.getField("CONTENT_AREA_CODE"));
        var testType = getTestType(subject);
        if(testType != testMetadata.TEST || subject != testMetadata.CODE){
            return null;
        }

        var score = {};
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + bucket +"_POINTS_EARNED"), row.getField(testMetadata.FIELD + bucket +"_POINTS_EARNED_MAX_MATH_USH"), row.getField(testMetadata.FIELD + bucket +"_POINTS_EARNED_MAX_ELA_ONLY"));
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        var itemsAttempt = _util.coalesce(row.getField(testMetadata.FIELD + bucket +"_ITEMS_ATTEMPTED"), row.getField(testMetadata.FIELD + bucket +"_ITEMS_ATTEMPTED_MAX_MATH_USH"), row.getField(testMetadata.FIELD + bucket +"_ITEMS_ATTEMPTED_MAX_ELA_ONLY"));
        var itemsPossible = _util.coalesce(row.getField(testMetadata.FIELD + bucket +"_POINTS_POSSIBLE"), row.getField(testMetadata.FIELD + bucket +"_POINTS_POSSIBLE_MAX_MATH_USH"), row.getField(testMetadata.FIELD + bucket +"_POINTS_POSSIBLE_MAX_ELA_ONLY"));
        var testNumber = testType + `_${testMetadata.CODE}` + '_SP' + bucket;

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] =_util.trim(scaleScore).replace(" ","");
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = _util.trim(scaleScore).replace(" ","");
            score["TEST_SCALED_SCORE"] = _util.trim(scaleScore).replace(" ","");
        }
        score["TEST_ITEMS_ATTEMPTED"] = itemsAttempt;
        score["TEST_ITEMS_POSSIBLE"] = itemsPossible;
        return score;
    }

    function mapRawScore(row, testMetadata, bucket) {
        var score = {};
        var subject = _util.trim(row.getField("CONTENT_AREA_CODE"));
        var testType = getTestType(subject);
        if(testType != testMetadata.TEST || subject != testMetadata.CODE){
            return null;
        }
        var percentile = row.getField(testMetadata.FIELD + bucket + "_PERCENT_CORRECT");
        var nceScore = row.getField(testMetadata.FIELD + bucket + "_NCE_SCORE");
        var rawScore = row.getField(testMetadata.FIELD + bucket + "_POINTS_EARNED");
        // Check for key fields and do not map score and exit if conditions met.
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }
        var testNumber = testType + `_${testMetadata.CODE}`+ '_RS' + bucket;
        var level = _util.trim(row.getField(testMetadata.FIELD + bucket + "_READING_LEVEL"));

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
        if(!isNaN(rawScore)){
            score["TEST_SCORE_VALUE"] = _util.trim(rawScore).replace(" ","");
            score["TEST_RAW_SCORE"] = _util.trim(rawScore).replace(" ","");
        }

    	score["TEST_PERCENTILE_SCORE"] = _util.trim(percentile);
        score["TEST_READING_LEVEL"] = level;
        score["TEST_PRIMARY_RESULT_CODE"] = levelDecode[level];
        score["TEST_NCE_SCORE"] = nceScore;

        return score;
    }

    function mapCombinedScore(row, testMetadata) {
              var score = {};
              var subject = row.getField("SUBJECT_NAME");
              var test = row.getField("TEST");
              var subName = '';
              var testNumber = '';

              if (subject !== null && subject !== undefined && subject !== "") {
                  if (subject === 'Algebra I') {
                      subName = 'ALG';
                  } else if (subject === 'English II') {
                      subName = 'ENG_II';
                  } else if (subject === 'English Language Arts' || subject === 'ELA') {
                      subName = 'ELA';
                  } else if (subject === 'Science') {
                      subName = 'SCI';
                  } else if (subject === 'Mathematics' || subject === 'Math') {
                      subName = 'MAT';
                  } else if (subject === 'Social Studies') {
                      subName = 'SS';
                  } else if (subject === 'Biology I') {
                      subName = 'BIO_I';
                  } else if (subject === 'Integrated Math I') {
                      subName = 'INT_MATH_I';
                  } else if (subject === 'Integrated Math II') {
                      subName = 'INT_MATH_II';
                  } else if (subject === 'Integrated Math III') {
                      subName = 'INT_MATH_III';
                  } else if (subject === 'US History') {
                      subName = 'US_HIST';
                  } else if (subject === 'English I') {
                      subName = 'ENG_I';
                  }
              }
              if (test !== null && test !== undefined && test !== "") {
                  if (test.indexOf("EOC") > -1) {
                      var testNumber = 'EOC' + "_" + subName;
                  } else if (test.indexOf("TNReady") > -1) {
                      var testNumber = 'TCAP_TNREADY' + "_" + subName;
                  } else if (test.indexOf("MSAA") > -1) {
                      var testNumber = 'TCAP_MSAA' + "_" + subName;
                  } else if (test.indexOf("Alt-Science/Social Studies") > -1) {
                      var testNumber = 'TCAP_AS-SS' + "_" + subName;
                  }
              }
           var scaleScore = row.getField("SCALED_" + testMetadata.CODE);
           var performanceLevel = _util.coalesce(row.getField("PERFORMANCE_LEVEL_" + testMetadata.CODE), row.getField("ORIGINAL_PERFORMANCE_LEVEL_" + testMetadata.CODE));
           var percentile = row.getField("PERCENTILE_" + testMetadata.CODE);

           // Check for key fields and do not map score and exit if conditions met.
           if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === " ") &&
               (percentile === null || percentile === undefined || _util.trim(percentile) === "--" || _util.trim(percentile) === "" || _util.trim(percentile) === " ") &&
               (performanceLevel === null || performanceLevel === undefined || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === "" || _util.trim(performanceLevel) === " ")) {
               return null;
           }

           // Set score fields
           score["TEST_NUMBER"] = testNumber;
           score["TEST_SCORE_TEXT"] = scaleScore;
           if (!isNaN(scaleScore)) {
               score["TEST_SCORE_VALUE"] = scaleScore;
               score["TEST_SCALED_SCORE"] = scaleScore;
           }

           if(performanceLevel){
           score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevel].LEVEL;
           score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].DESC;
           score["TEST_PASSED_INDICATOR"] = decodePerformanceLevel[performanceLevel].PASS_IND;
           }
           score["TEST_PERCENTILE_SCORE"] = percentile;


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
        var assessmentAdminKey = null;
        var sub = getSubject(srcRecord);
        // Set base assessment admin key information
        if(signature.getFormat().getFormatName() !== "TCAP_EOC_2223_43_COLS"){
          assessmentAdminKey = _assessmentIdentifier
              + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
              + "_" + AssessmentLoader.config.DISTRICT_CODE
              + "-" + hierarchy.SCHOOL_YEAR
              + "_" + sub
        }else{
            assessmentAdminKey = _assessmentIdentifier
              + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
              + "_" + AssessmentLoader.config.DISTRICT_CODE
              + "-" + hierarchy.SCHOOL_YEAR
        }
      //Add natural key fields
      signature.getFormat().getNaturalKey().forEach(function (key) {
          assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
      });
        return assessmentAdminKey;
    }

    function getSubject(row) {
        var subject = row.getField("CONTENT_AREA_CODE");
        if (subject != ''){
            return subject
        }
        return 'SOC';
    }

    return module;
}());
