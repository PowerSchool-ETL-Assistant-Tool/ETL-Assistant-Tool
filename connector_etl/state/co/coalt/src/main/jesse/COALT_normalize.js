var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "COALT";
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

            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();

            _dataflow.create("RECORD BUILD")
                .input("INPUT", AppUtil.getInputDataflow(file, signature))
                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {

                    json.LINEAGE_FILE = fileFullName;
                    json.LINEAGE_LINE = (++lineNumber).toString();
                    output.RECORDS.put(json);
                })
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
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
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function(output, rows) {
                    try{
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
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
        {TEST: "CoAlt", CODE:"_OVERALL", FIELD: "_OVERALL", MAP_FUNCTION: mapOverallScore},
        // Standard
        {TEST: "CoAlt", CODE:"_STAND_1", FIELD: "STANDARD_1_", MAP_FUNCTION: mapStandardOrSubScore},
        {TEST: "CoAlt", CODE:"_STAND_2", FIELD: "STANDARD_2_", MAP_FUNCTION: mapStandardOrSubScore},
        {TEST: "CoAlt", CODE:"_STAND_3", FIELD: "STANDARD_3_", MAP_FUNCTION: mapStandardOrSubScore},
        {TEST: "CoAlt", CODE:"_STAND_4", FIELD: "STANDARD_4_", MAP_FUNCTION: mapStandardOrSubScore},
        //SEP
        {TEST: "CoAlt", CODE:"_SEP", FIELD: "SEP_", MAP_FUNCTION: mapSepScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

      var performanceLvlDecode = {
            "1" : {LEVEL: "Level 1", DESC: "Emerging", PASS_IND : "No"},
            "2" : {LEVEL: "Level 2", DESC: "Approaching the Target", PASS_IND : "No"},
            "3" : {LEVEL: "Level 3", DESC: "At Target", PASS_IND : "Yes"},
            "4" : {LEVEL: "Level 4", DESC: "Advanced", PASS_IND : "Yes"},
            "" : {LEVEL: "Level 0", DESC: "Test did not receive a valid score", PASS_IND : "--"}
      };

      var subjectDecode = {
           "Science" : "_SCI"
           ,"Social Studies" : "_SS"
           ,"SS" : "_SS"
           ,"SCI" : "_SCI"
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
        var subject = subjectDecode[_util.coalesce(_util.trim(row.getField("SUBJECT")))];

        scoresToMap.forEach(function(testMetadata) {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, subject);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
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
        var birthDateStr= row.getField("STUDENT_BIRTHDATE");
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };
        try {
            if (birthDateStr === null || birthDateStr === "" || birthDateStr === undefined) {
                birthDateObject;
            } else if( birthDateStr.length === 8){
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMddyyyy");
            } else if (birthDateStr.length >= 8 && birthDateStr.length <= 10){
                if(birthDateStr.toString().indexOf("/")>-1){
                    birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yyyy");
                }
                else if (birthDateStr.toString().indexOf("-")>-1){
                        birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "yyyy-MM-dd");
                    }
            }
            else {
                birthDateObject;
            }
        } catch(exception){
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING",row.getRawField("LINEAGE_LINE"), "Error parsing test date string: ${exception}", JSON.stringify(row.getSourceRow())));
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
                    record.TEST_ADMIN_DATE = "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("TESTING_SCHOOL_CODE"), row.getField("RESPONSIBLE_SCHOOL_CODE"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("RESPONSIBLE_SCHOOL_CODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("RESPONSIBLE_SCHOOL_CODE"));
                     break;
                 case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_IDENTIFIER"));
                      break;
                 case "STUDENT_VENDOR_ID":
                      record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STATE_STUDENT_IDENTIFIER"),row.getField("LOCAL_STUDENT_IDENTIFIER"));
                      break;
                 case "STUDENT_FIRST_NAME":
                     record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                     break;
                 case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                     break;
                 case "STUDENT_LAST_NAME":
                     record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                     break;
                 case "STUDENT_GENDER_CODE":
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("SEX"));
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = _util.coalesce(row.getField("GRADE_LEVEL_WHEN_ASSESSED"), row.getField("ASSESSMENT_GRADE"));
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

    function mapOverallScore(row, testMetadata, subject) {
        var score = {};
        var testNumber;
        if(subject === null){
            testNumber  = testMetadata.TEST +  testMetadata.CODE;
        }
        else{
            var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        }
        var scaleScore = _util.trim(row.getField("SCALE_SCORE" + testMetadata.FIELD));
        var standardError = row.getField("CONDITIONAL_STANDARD_ERROR_OF_MEASURE" + testMetadata.FIELD);
        var performanceLevel = row.getField("PERFORMANCE_LEVEL" + testMetadata.FIELD);
        var pointsPossible = row.getField("POINTS_POSSIBLE" + testMetadata.FIELD);
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if(!isNaN(scaleScore)){
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(standardError)){
        score["TEST_STANDARD_ERROR"] = standardError;
        }
        if(!isNaN(pointsPossible)){
        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = performanceLvlDecode[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = performanceLvlDecode[performanceLevel].PASS_IND;

        return score;
    }

    function mapStandardOrSubScore(row, testMetadata, subject) {
        var score = {};
        var testNumber;
        if(subject === null){
            testNumber  = testMetadata.TEST +  testMetadata.CODE;
        }
        else{
            testNumber  = testMetadata.TEST + subject + testMetadata.CODE;
        }

        var rawScore = _util.trim(row.getField(testMetadata.FIELD + "RAW_SCORE"));
        var pointsPossible = row.getField(testMetadata.FIELD + "POINTS_POSSIBLE");
        var percentCorrect = row.getField(testMetadata.FIELD + "PERCENT_CORRECT");
        var percentEarned = row.getField(testMetadata.FIELD + "PCT_EARNED");

        // Check for key fields and do not map score and exit if conditions met.
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""){
            return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;
        if(!isNaN(rawScore)){
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_SCORE_TEXT"] = rawScore;
        score["TEST_SCORE_VALUE"] = rawScore;
        }
        if(!isNaN(pointsPossible)){
        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;
        }
        if(!isNaN(percentCorrect)){
        score["TEST_PERCENTAGE_SCORE"] = percentCorrect;
        }
        if(!isNaN(percentEarned)){
        score["TEST_PERCENTILE_SCORE"] = percentEarned;
        }

        return score;
    }

    function mapSepScore(row, testMetadata, subject) {
            var score = {};
            var testNumber;
            if(subject == null){
                testNumber  = testMetadata.TEST +  testMetadata.CODE;
            }
            else{
                testNumber  = testMetadata.TEST + subject + testMetadata.CODE;
            }
            var rawScore = _util.trim(row.getField(testMetadata.FIELD + "RAWSCORE"));
            var pointsPossible = row.getField(testMetadata.FIELD + "PTSPOSS");
            var percentEarned = row.getField(testMetadata.FIELD + "PCT_EARNED");
            // Check for key fields and do not map score and exit if conditions met.
            if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""){
                return null;
            }
            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            if(!isNaN(rawScore)){
            score["TEST_RAW_SCORE"] = rawScore;
            }
            if(!isNaN(pointsPossible)){
            score["TEST_ITEMS_POSSIBLE"] = pointsPossible;
            }
            if(!isNaN(percentEarned)){
            score["TEST_PERCENTAGE_SCORE"] = percentEarned;
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