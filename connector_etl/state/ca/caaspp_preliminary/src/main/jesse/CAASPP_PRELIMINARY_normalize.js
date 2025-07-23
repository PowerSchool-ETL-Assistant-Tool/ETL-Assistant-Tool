var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CAASPP_PRELIMINARY";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
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
                .group_by("ADMINISTRATION GROUPING", function (one, two) {
                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function (output, rows) {
                    try {
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        //print(`mapping object ${JSON.stringify(mappingObject)}`);

                        if (mappingObject.SCORE_MAPPINGS.length === 0 || mappingObject.SCORE_MAPPINGS === null) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;
        } catch (exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function (file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/


    var scoresToMap = [
        // ELA
        { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_OVERALL", FIELD: "ELA/LITERACY_", MAP_FUNCTION: mapScaledScore }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_RD", FIELD: "READING_", MAP_FUNCTION: mapClaimPerformanceLevel }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_LSSPK", FIELD: "LISTENING_AND_SPEAKING_", MAP_FUNCTION: mapClaimPerformanceLevel }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_LS", FIELD: "LISTENING_", MAP_FUNCTION: mapClaimPerformanceLevel }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR", FIELD: "WRITING_", MAP_FUNCTION: mapClaimPerformanceLevel }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_RI", FIELD: "RESEARCH/INQUIRY_", MAP_FUNCTION: mapClaimPerformanceLevel }
        // Writing
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_I_OP", FIELD: "INFORMATIONAL_ORGANIZATION/PURPOSE", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_I_EE", FIELD: "INFORMATIONAL_EVIDENCE/ELABORATION", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_I_C", FIELD: "INFORMATIONAL_CONVENTIONS", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_O_OP", FIELD: "OPINION_ORGANIZATION/PURPOSE", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_O_EE", FIELD: "OPINION_EVIDENCE/ELABORATION", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_O_C", FIELD: "OPINION_CONVENTIONS", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_N_OP", FIELD: "NARRATIVE_ORGANIZATION/PURPOSE", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_N_EE", FIELD: "NARRATIVE_EVIDENCE/ELABORATION", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_N_C", FIELD: "NARRATIVE CONVENTIONS", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_A_OP", FIELD: "ARGUMENTATIVE_ORGANIZATION/PURPOSE", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_A_EE", FIELD: "ARGUMENTATIVE_EVIDENCE/ELABORATION", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_A_C", FIELD: "ARGUMENTATIVE_CONVENTIONS", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_E_OP", FIELD: "EXPLANATORY_ORGANIZATION/PURPOSE", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_E_EE", FIELD: "EXPLANATORY_EVIDENCE/ELABORATION", MAP_FUNCTION: mapWritingStrands }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "ELA_WR_E_C", FIELD: "EXPLANATORY_CONVENTIONS", MAP_FUNCTION: mapWritingStrands }
        //Math
        ,{ TEST: "CAASPP_PRELIMINARY_", CODE: "MA_OVERALL", FIELD: "MATHEMATICS_", MAP_FUNCTION: mapScaledScore }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "MA_CNPR", FIELD: "CONCEPTS_AND_PROCEDURES_", MAP_FUNCTION: mapClaimPerformanceLevel }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "MA_PSMDLDA", FIELD: "PROBLEM_SOLVING_AND_MODELING_&_DATA_ANALYSIS_", MAP_FUNCTION: mapClaimPerformanceLevel }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "MA_CR", FIELD: "COMMUNICATING_REASONING_", MAP_FUNCTION: mapClaimPerformanceLevel }

        //Map Domian Score
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "DOM_1", FIELD: "1", MAP_FUNCTION: mapDomainScore }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "DOM_2", FIELD: "2", MAP_FUNCTION: mapDomainScore }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "DOM_3", FIELD: "3", MAP_FUNCTION: mapDomainScore }

        //Map Scores
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "SC", FIELD: "SCORE", MAP_FUNCTION: mapScore }

        //Claim Scores
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "CLAIM_1", FIELD: "OVR", MAP_FUNCTION: mapClaimScore }
        , { TEST: "CAASPP_PRELIMINARY_", CODE: "CLAIM_2", FIELD: "OVR", MAP_FUNCTION: mapClaimScore }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var performanceDecodes = {
        '1': { DECODE: 'Standard Not Met', PASS_IND: 'No', AS_NUMBER: '1' },
        '2': { DECODE: 'Standard Nearly Met', PASS_IND: 'No', AS_NUMBER: '2' },
        '3': { DECODE: 'Standard Met', PASS_IND: 'Yes', AS_NUMBER: '3' },
        '4': { DECODE: 'Standard Exceeded', PASS_IND: 'Yes', AS_NUMBER: '4' },
        '9': { DECODE: 'Did not attempt', PASS_IND: 'No', AS_NUMBER: '5' },
        'Standard Not Met': { DECODE: 'Standard Not Met', PASS_IND: 'No', AS_NUMBER: '1' },
        'Standard Nearly Met': { DECODE: 'Standard Nearly Met', PASS_IND: 'No', AS_NUMBER: '2' },
        'Standard Met': { DECODE: 'Standard Met', PASS_IND: 'Yes', AS_NUMBER: '3' },
        'Standard Exceeded': { DECODE: 'Standard Exceeded', PASS_IND: 'Yes', AS_NUMBER: '4' }
    };

    var domainLevels = {
        "3" : {LEVEL: "3", DESC: "Above Standard", PASS_IND: "Yes"},
        "2" : {LEVEL: "2", DESC: "Near Standard", PASS_IND: "No"},
        "1" : {LEVEL: "1", DESC: "Below Standard", PASS_IND: "No"}
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

        var fileGrade = getGradeFromFilename(row);

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, fileGrade);


        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, fileGrade);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);

            } catch (exception) {
                print(exception);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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
    function mapNormalizedAdminFields(signature, hierarchy, row, fileGrade) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var elaOppNumber = _util.coalesce(row.getField("ELA/LITERACY_OPPNUMBER"), null);
        var mathOppNumber = _util.coalesce(row.getField("MATHEMATICS_OPPNUMBER"), null);
        var oppNumber;

        if( row.getField("ELA/LITERACY_OPPNUMBER") && row.getField("MATHEMATICS_OPPNUMBER")) {
        // ELA
        if (elaOppNumber === null || elaOppNumber === undefined || _util.trim(elaOppNumber) === "") {
            // MATH
            if (mathOppNumber === null || mathOppNumber === undefined || _util.trim(mathOppNumber) === "") {
                return null;
            } else {
                oppNumber = mathOppNumber;
            }
        } else {
            oppNumber = elaOppNumber;
        }
        }

        var testDateObj = getTestDateObject(row, oppNumber, hierarchy);
        var testAdminDate = AppUtil.getDateObjByPattern(row.getField("FINAL_TEST_COMPLETED_DATE"), "yyyy-MM-dd");

        normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, fileGrade);
                    break;
                case "SYS_PARTITION_VALUE":
                    record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                    break;
                case "TENANT_CODE":
                    record.TENANT_CODE = AssessmentLoader.config.TENANT_CODE;
                    break;
                case "DISTRICT_CODE":
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; // pre UIHN-9419:  districtCode;
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
                    record.TEST_ADMIN_DATE = _util.coalesce(testAdminDate.STANDARD_DATE,testDateObj.STANDARD_DATE);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("ENROLLED_SCHOOL_ID"),row.getField("SCHOOL_VENDOR_ID"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("ENROLLED_SCHOOL_ID"),row.getField("SCHOOL_VENDOR_ID"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("ENROLLED_SCHOOL"),row.getField("SCHOOL_NAME"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"),row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"),row.getField("STUDENT_GENDER_CODE"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(row.getField("ENROLLED_GRADE"),row.getField("STUDENT_GRADE_CODE"), fileGrade, 'NA');
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = "01/01/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
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

    function mapScaledScore(row, testMetadata, fileGrade) {
        var score = {};
        var grade = _util.coalesce(row.getField("ENROLLED_GRADE"), fileGrade, 'NA');

        if (grade != null && grade.length < 2) {
            grade = '0' + grade;
        }

        var testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE;
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + 'SCALE_SCORE'));
        var standardError = _util.coalesce(row.getField('STANDARD_ERROR_FOR_' + testMetadata.FIELD + 'SCALE_SCORE'));
        var achievementLevel = _util.coalesce(row.getField(testMetadata.FIELD + 'ACHIEVEMENT_LEVEL'));

        if (scaleScore === null || scaleScore === undefined || scaleScore == "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (scaleScore !== 'NA' && scaleScore !== 'N/A' && scaleScore !== 'NS' && !isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (standardError !== 'NA' && standardError !== 'N/A' && standardError !== 'NS' && !isNaN(standardError)) {
            score["TEST_STANDARD_ERROR"] = standardError;
        }

        score["TEST_SCORE_TEXT"] = scaleScore;


        var decode = performanceDecodes[achievementLevel];
        if (decode != null && decode != undefined) {
            score['TEST_PRIMARY_RESULT'] = decode.DECODE;
            score['TEST_PASSED_INDICATOR'] = decode.PASS_IND;
            score['TEST_PRIMARY_RESULT_CODE'] = decode.AS_NUMBER;
        }

        return score;
    }

    function mapClaimPerformanceLevel(row, testMetadata, fileGrade) {
        var score = {};
        var grade = _util.coalesce(row.getField("ENROLLED_GRADE"), fileGrade, 'NA');

        if (grade != null && grade.length < 2) {
            grade = '0' + grade;
        }

        var testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE;
        var performanceLevel = _util.coalesce(
            row.getField(testMetadata.FIELD + 'CLAIMS_PERFORMANCE_LEVEL')
            , row.getField(testMetadata.FIELD + 'CLAIM_ACHIEVEMENT_CATEGORY')
        );

        if (performanceLevel === null || performanceLevel === undefined || performanceLevel == "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = 'NA';
        score["TEST_PRIMARY_RESULT"] = performanceLevel;

        //Set passing indicator based on component achievement level.
        var achievementLevel = _util.coalesce(row.getField(testMetadata.FIELD + 'ACHIEVEMENT_LEVEL'));
        var decode = performanceDecodes[achievementLevel];

        if (decode != null && decode != undefined) {
            score['TEST_PASSED_INDICATOR'] = decode.PASS_IND;
        }

        return score;
    }

    function mapWritingStrands(row, testMetadata, fileGrade) {
        var score = {};
        var grade = _util.coalesce(row.getField("ENROLLED_GRADE"), fileGrade, 'NA');

        if (grade != null && grade.length < 2) {
            grade = '0' + grade;
        }

        var testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE;
        var performanceLevel = _util.coalesce(row.getField(testMetadata.FIELD));
        if (performanceLevel === null || performanceLevel === undefined || performanceLevel == "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;

        if (!isNaN(performanceLevel)) {
            score["TEST_SCALED_SCORE"] = performanceLevel;
        }

        return score;
    }

    function mapDomainScore(row, testMetadata, fileGrade) {

       var score = {};
       var grade = _util.coalesce(row.getField("STUDENT_GRADE_CODE"), fileGrade, 'NA');

       var domain = row.getField("DOMAIN_" + testMetadata.FIELD + "_LEVEL");
       var standardError = row.getField("STANDARD_ERROR_MEASUREMENT");
       var recordType = row.getField("RECORD_TYPE");
       var subject;

       if (grade != null && grade.length < 2) {
           grade = '0' + grade;
       }

       if(recordType) {
           if(recordType === "01" || recordType === "1") {
               subject = "ELA_";
           } else if(recordType === "02" || recordType === "2") {
               subject = "MA_";
           } else if(recordType === "03" || recordType === "3" ) {
              subject = "CAA_ELA_";
           } else if(recordType === "04" || recordType === "4" ) {
              subject = "CAA_MA_";
           } else if(recordType === "05" || recordType === "5" ) {
              subject = "CAA_SCI_";
           } else if(recordType === "06" || recordType === "6" ) {
              subject = "SCI_";
           } else if(recordType === "09" || recordType === "9" ) {
              subject = "CSA_";
           }

       }

       var decode = domainLevels[domain];
       var testNumber = testMetadata.TEST + grade + '_'+ subject + testMetadata.CODE;
       score["TEST_NUMBER"] = testNumber;
       score["TEST_STANDARD_ERROR"] = standardError;

           //{LEVEL: "9", DESC: "Did not attempt", PASS_IND: "N"}
       if(domain === null || domain === undefined || _util.trim(domain) == "" || domain == "9" || _util.trim(domain) == "NS") {
           return null;
       } else {
            score["TEST_PRIMARY_RESULT_CODE"] = decode.LEVEL;
            score["TEST_PRIMARY_RESULT"] = decode.DESC;
            score["TEST_PASSED_INDICATOR"] = decode.PASS_IND;
       }

       return score;
    }

    function mapClaimScore(row, testMetadata, fileGrade) {
            var score = {};

            var testNumber = testMetadata.TEST + testMetadata.FIELD + '_' + testMetadata.CODE;
            var claimScore = row.getField( 'SMARTERCOMP' + testMetadata.CODE + 'SCORE');
            var claimPerformanceLevel = row.getField( 'SMARTERCOMP' + testMetadata.CODE + 'PL');
            var decode = domainLevels[claimPerformanceLevel];


            if (claimScore === null || claimScore === undefined || claimScore == "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCALED_SCORE"] = claimScore;
            score["TEST_PRIMARY_RESULT_CODE"] = decode.LEVEL;
            score["TEST_PRIMARY_RESULT"] = decode.DESC;

            return score;
        }

    function mapScore(row, testMetadata, fileGrade) {
        var score = {};
        var grade = _util.coalesce(row.getField("STUDENT_GRADE_CODE"), fileGrade, 'NA');
        var recordType = row.getField("RECORD_TYPE");
        var subject;

        if (grade != null && grade.length < 2) {
            grade = '0' + grade;
        }
       if(recordType) {
           if(recordType === "01" || recordType === "1") {
               subject = "ELA_";
           } else if(recordType === "02" || recordType === "2") {
               subject = "MA_";
           } else if(recordType === "03" || recordType === "3" ) {
              subject = "CAA_ELA_";
           } else if(recordType === "04" || recordType === "4" ) {
              subject = "CAA_MA_";
           } else if(recordType === "05" || recordType === "5" ) {
              subject = "CAA_SCI_";
           } else if(recordType === "06" || recordType === "6" ) {
              subject = "SCI_";
           } else if(recordType === "09" || recordType === "9" ) {
              subject = "CSA_";
           }

       }

        var testNumber = testMetadata.TEST + grade + '_' + subject + testMetadata.CODE;
        var scaleScore = _util.coalesce(row.getField("SCALE_"+testMetadata.FIELD));
        var standardError = _util.coalesce(row.getField("STANDARD_ERROR_MEASUREMENT"));
        var achievementLevel = _util.coalesce(row.getField("ACHIEVEMENT_LEVELS"));
        var growthScore = row.getField("GROWTH_SCORE");
        var maxScore= row.getField("SMARTER_SCALE_SCORES_ERROR_BANDS_MAX");
        var minScore= row.getField("SMARTER_SCALE_SCORES_ERROR_BANDS_MIN");
        var lexileScore = row.getField("LEXILE_OR_QUANTILE_MEASURE");

        if (scaleScore === null || scaleScore === undefined || scaleScore == "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (scaleScore !== 'NA' && scaleScore !== 'N/A' && scaleScore !== 'NS' && !isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (standardError !== 'NA' && standardError !== 'N/A' && standardError !== 'NS' && !isNaN(standardError)) {
            score["TEST_STANDARD_ERROR"] = standardError;
        }

        if (lexileScore) {
            score["TEST_READING_LEVEL"] = lexileScore.replace("BR", "").replace("L", "").replace("Q", "").replace("EM", "");
        }

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_LOWER_BOUND"] = minScore;
        score["TEST_UPPER_BOUND"] = maxScore;
        score["TEST_GROWTH_RESULT"] = growthScore;

        var decode = performanceDecodes[achievementLevel];
        if (decode != null && decode != undefined) {
            score['TEST_PRIMARY_RESULT'] = decode.DECODE;
            score['TEST_PASSED_INDICATOR'] = decode.PASS_IND;
            score['TEST_PRIMARY_RESULT_CODE'] = decode.AS_NUMBER;
        }

        return score;
    }

    /***************************************************************************
     Utility Functions
     ***************************************************************************/

    function getGradeFromFilename(row) {
        var record = {};
        var grade = null;
        var gradeStr = "GRADE_";

        // Get the file path of data file
        var rowGrade = record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE").toString().toUpperCase().replace(" ", "_");

        // Check for GRADE_ in file path and get the grade.
        if (rowGrade.indexOf(gradeStr + "11") > -1) {
            grade = "11";
        }
        else if (rowGrade.indexOf(gradeStr + "8") > -1) {
            grade = "08";
        }
        else if (rowGrade.indexOf(gradeStr + "7") > -1) {
            grade = "07";
        }
        else if (rowGrade.indexOf(gradeStr + "6") > -1) {
            grade = "06";
        }
        else if (rowGrade.indexOf(gradeStr + "5") > -1) {
            grade = "05";
        }
        else if (rowGrade.indexOf(gradeStr + "4") > -1) {
            grade = "04";
        }
        else if (rowGrade.indexOf(gradeStr + "3") > -1) {
            grade = "03";
        } else {
            if(row.getField("STUDENT_GRADE_CODE")) {
              grade = row.getField("STUDENT_GRADE_CODE");
            }
        }
        return grade;
    }

    function getTestDateObject(row, oppNumber, hierarchy) {

        var dateObj = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        //Data file doesn't define a test date.
        //Test date must be created. (TODO: Verify date)
        var rawYear = hierarchy.SCHOOL_YEAR;

        var month = '03';
        var day = oppNumber; //Verify
        if (day != null && day.length < 2) {
            day = "0" + day;
        }
        if (null == day) {
            day = '15';
        }
        var year = rawYear.substring(rawYear.indexOf("-") + 1);;


        var standardDate = month + "/" + day + "/" + year;


        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;
        dateObj.STANDARD_DATE = standardDate;

        return dateObj;

    }


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

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, fileGrade) {

        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;
        assessmentAdminKey = "CAASPP_PRE_" + hierarchy.SCHOOL_YEAR;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        assessmentAdminKey = assessmentAdminKey + "_" + fileGrade;

        return assessmentAdminKey;
    }

    return module;
}());
