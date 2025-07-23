var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "PARCC_SUMMATIVE";
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
        {TEST: "PARCC", CODE:"_OVERALL", FIELD: "_OVERALL", MAP_FUNCTION: mapOverallScore}
        // Reading
        ,{TEST: "PARCC", CODE:"_RD", FIELD: "TEST_READING_", MAP_FUNCTION: mapComponentScore}
        // Writing
        ,{TEST: "PARCC", CODE:"_WR", FIELD: "TEST_WRITING_", MAP_FUNCTION: mapComponentScore}
        // SubClaim
        ,{TEST: "PARCC", CODE:"_SUB1", FIELD: "SUBCLAIM_1_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "PARCC", CODE:"_SUB2", FIELD: "SUBCLAIM_2_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "PARCC", CODE:"_SUB3", FIELD: "SUBCLAIM_3_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "PARCC", CODE:"_SUB4", FIELD: "SUBCLAIM_4_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "PARCC", CODE:"_SUB5", FIELD: "SUBCLAIM_5_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "PARCC", CODE:"_SUB6", FIELD: "SUBCLAIM_6_", MAP_FUNCTION: mapSubClaimScore}

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

      var performanceLvlDecode = {
            "1" : {LEVEL: "Level 1", DESC: "Did not yet meet expectations", PASSED: "No"}
            ,"2" : {LEVEL: "Level 2", DESC: "Partially met expectations", PASSED: "No"}
            ,"3" : {LEVEL: "Level 3", DESC: "Approached expectations", PASSED: "No"}
            ,"4" : {LEVEL: "Level 4", DESC: "Met expectations", PASSED: "Yes"}
            ,"5" : {LEVEL: "Level 5", DESC: "Exceeded expectations", PASSED: "Yes"}
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
           "Alphanumeric English Language Arts/Literacy" : "_ELA"
            ,"Math" : "_MA"
            ,"Mathematics" : "_MA"
            ,"Integrated Math" : "_MA_INT"
            ,"Algebra I" : "_ALGI"
            ,"Algebra II" : "_ALGII"
            ,"Geometry" : "_GEO"
            ,"Spanish Language Arts/Literacy" : "_SLA"
            ,"English Language Arts/Literacy" : "_ELA"
      };

      var scoreCompleteDecode = {
           "1" : "All items Scored"
           ,"0" : "Not All items Scored"
           ,"" : "Scoring validation on the test attempt has not been performed"
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
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
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
                    record.TEST_ADMIN_DATE = "03" + "/15/" + _util.coalesce(row.getField("ASSESSMENT_YEAR")).substring(5,9);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("RESPONSIBLESCHOOLCODE"), row.getField("RESPONSIBLESCHOOLNAME"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("RESPONSIBLESCHOOLCODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("RESPONSIBLESCHOOLNAME"));
                     break;
                 case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_IDENTIFIER"));
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
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE +"_"+  row.getField("TESTCODE");
        var scaleScore = row.getField("SCALE_SCORE" + testMetadata.FIELD);
        var csemRange = row.getField("CSEM_RANGE" + testMetadata.FIELD);
        var performanceLevel = row.getField("PERFORMANCE_LEVEL" + testMetadata.FIELD);
        var scoreComplete = row.getField("SCORE_COMPLETE" + testMetadata.FIELD);
        var percentileRank = _util.coalesce(row.getField("CO_PERCENTILE_RANK" + testMetadata.FIELD));
        var growthPercentile = _util.coalesce(row.getField("STUDENT_GROWTH_PERCENTILE_COMPARED_TO_CROSS_STATE" + testMetadata.FIELD));


        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_PERCENTAGE_SCORE"] = csemRange;

        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = performanceLvlDecode[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = performanceLvlDecode[performanceLevel].PASSED;

        score["TEST_EXEMPTION_CODE"] = scoreComplete;
        score["TEST_EXEMPTION_DESC"] = scoreCompleteDecode[scoreComplete];

        score["TEST_PERCENTILE_SCORE"] = percentileRank;

        score["TEST_GROWTH_PERCENTILE"] = growthPercentile;
        return score;
    }

    function mapComponentScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE+"_"+  row.getField("TESTCODE");
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var csemRange = row.getField(testMetadata.FIELD + "CSEM");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_PERCENTAGE_SCORE"] = csemRange;
        return score;
    }

    function mapSubClaimScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE+ "_"+ row.getField("TESTCODE");
        var subClaimCategory = row.getField(testMetadata.FIELD + "CATEGORY");
        var scaleScore = row.getField("SCALE_SCORE" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(subClaimCategory === null || subClaimCategory === undefined || _util.trim(subClaimCategory) === "--" || _util.trim(subClaimCategory) === "" ||
           scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_PRIMARY_RESULT_CODE"] = subClaimCategory;
        score["TEST_PRIMARY_RESULT"] = subClaimCategoryDecode[subClaimCategory];
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
