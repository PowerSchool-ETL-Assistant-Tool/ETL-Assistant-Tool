var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MSAA";
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
        //Overall
        {TEST: "MSAA", CODE:"", FIELD: "", MAP_FUNCTION: mapScore}
        ,{TEST: "MSAA", CODE:"OVR",FIELD: "ELA", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MSAA", CODE:"OVR",FIELD: "MATH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MSAA", CODE:"OVR",FIELD: "SCI", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MSAA", CODE:"",FIELD: "RD", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "MSAA", CODE:"",FIELD: "WRI", MAP_FUNCTION: mapStrandScore}


    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
        "1" 	: "01"
        ,"01" 	: "01"
        ,"2" 	: "02"
        ,"02" 	: "02"
        ,"3" 	: "03"
        ,"03" 	: "03"
        ,"4" 	: "04"
        ,"04" 	: "04"
        ,"5" 	: "05"
        ,"05" 	: "05"
        ,"6" 	: "06"
        ,"06" 	: "06"
        ,"7" 	: "07"
        ,"07" 	: "07"
        ,"8" 	: "08"
        ,"08" 	: "08"
        ,"9" 	: "09"
        ,"09" 	: "09"
        ,"10" 	: "10"
        ,"11" 	: "11"
        ,"12" 	: "12"
        , null	: null
        ,""	: null
    };

    var performanceLvlDecode = {
        "Level1" : {LEVEL: "1", DESC: "1", PASSED: "No"}
        ,"Level 1" : {LEVEL: "1", DESC: "1", PASSED: "No"}
        ,"Level2" : {LEVEL: "2", DESC: "2", PASSED: "No"}
        ,"Level 2" : {LEVEL: "2", DESC: "2", PASSED: "No"}
        ,"Level3" : {LEVEL: "3", DESC: "3", PASSED: "Yes"}
        ,"Level 3" : {LEVEL: "3", DESC: "3", PASSED: "Yes"}
        ,"Level4" : {LEVEL: "4", DESC: "4", PASSED: "Yes"}
        ,"Level 4" : {LEVEL: "4", DESC: "4", PASSED: "Yes"}
        ,"1" : {DESC: "Level 1", PASSED: "No"}
        ,"2" : {DESC: "Level 2", PASSED: "No"}
        ,"3" : {DESC: "Level 3", PASSED: "Yes"}
        ,"4" : {DESC: "Level 4", PASSED: "Yes"}
        ,"Not provided" : {LEVEL: null, DESC: null, PASSED: null}
        ,null : {LEVEL: null, DESC: null}
    };

    var subClaimCategoryDecode = {
        "1" : "Meets or Exceeds Students at Level 4"
        ,"2" : "Nearly Students at Level 3"
        ,"3" : "Below Students at Level 3"
        ,"" : null
        ,null : null
    };

    var subjectDecode = {
        "English Language Arts" : "_ELA"
        ,"Mathematics" : "_MA"
    };

    var testLevelDecode = {
        "NCSC/AltAssessment Grade 03" : "NCSCALT03",
        "NCSC/AltAssessment Grade 04" : "NCSCALT04",
        "NCSC/AltAssessment Grade 05" : "NCSCALT05",
        "NCSC/AltAssessment Grade 06" : "NCSCALT06",
        "NCSC/AltAssessment Grade 07" : "NCSCALT07",
        "NCSC/AltAssessment Grade 08" : "NCSCALT08",
        "NCSC/AltAssessment Grade 09" : "NCSCALT09",
        "NCSC/AltAssessment Grade 10" : "NCSCALT10",
        "NCSC/AltAssessment Grade 11" : "NCSCALT11",
        "NCSC/AltAssessment Grade 12" : "NCSCALT12",
        "NCSC/AltAssessmentGrade 03" : "NCSCALT03",
        "NCSC/AltAssessmentGrade 04" : "NCSCALT04",
        "NCSC/AltAssessmentGrade 05" : "NCSCALT05",
        "NCSC/AltAssessmentGrade 06" : "NCSCALT06",
        "NCSC/AltAssessmentGrade 07" : "NCSCALT07",
        "NCSC/AltAssessmentGrade 08" : "NCSCALT08",
        "NCSC/AltAssessmentGrade 09" : "NCSCALT09",
        "NCSC/AltAssessmentGrade 10" : "NCSCALT10",
        "NCSC/AltAssessmentGrade 11" : "NCSCALT11",
        "NCSC/AltAssessmentGrade 12" : "NCSCALT12"
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
        var subject = subjectDecode[_util.coalesce(row.getField("SUBJECT"))];

        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, subject);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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
        var birthDate = row.getField("BIRTHDATE");
        var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "yyyy-MM-dd");
        var fiscalYear = row.getField("FISCALYEAR");
        if (fiscalYear !== null && fiscalYear !== undefined && fiscalYear !== ""){
        var adminDate = "05" + "/15/" + row.getField("FISCALYEAR");
        } else {
        var adminDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
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
                    record.TEST_ADMIN_DATE = adminDate;
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOLID"), row.getField("SCHOOLNAME"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOLID"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOLNAME"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("SSID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("SSID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRSTNAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("MIDDLENAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LASTNAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField("STUDENTGRADE")]);
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
        return {}
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + "_" + testLevelDecode[row.getField("TESTLEVEL")];
        var scaleScore = row.getField("SCALESCORE");
        var performanceLevel = row.getField("PERFORMANCE");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_PRIMARY_RESULT_CODE"] = performanceLvlDecode[performanceLevel].DESC;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PASSED_INDICATOR"] = performanceLvlDecode[performanceLevel].PASSED;
        return score;
    }

     function mapScaledScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST +  "_" + testMetadata.FIELD +  "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_" + "SCALEDSCORE");
        var performanceLevel = row.getField(testMetadata.FIELD + "_" + "PERFLEVEL");
        var repStatus = row.getField(testMetadata.FIELD + "_" + "REPORTINGSTATUS");
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
        return null;
          }
            // Set score fields
            score["TEST_NUMBER"] = testNumber;

            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;

            score["TEST_PRIMARY_RESULT_CODE"] =  performanceLevel;
            score["TEST_PRIMARY_RESULT"] = performanceLvlDecode[performanceLevel].DESC;
            score["TEST_PASSED_INDICATOR"] = performanceLvlDecode[performanceLevel].PASSED;
            score["TEST_CUSTOM_RESULT"] = repStatus;
            return score;
        }

     function mapStrandScore(row, testMetadata, subject) {

        var score = {};
        var testNumber = testMetadata.TEST +  "_" + testMetadata.FIELD;
        var percent = row.getField(testMetadata.FIELD + "_" + "PCT");

        if(percent === null || percent === undefined || _util.trim(percent) === "--" || _util.trim(percent) === "" || percent === "N/A") {
        return null;
          }

        score["TEST_NUMBER"] = testNumber;
        if(!isNaN(percent)){
        score["TEST_PERCENTAGE_SCORE"] = percent;
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

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        return assessmentAdminKey;
    }

    return module;
}());
