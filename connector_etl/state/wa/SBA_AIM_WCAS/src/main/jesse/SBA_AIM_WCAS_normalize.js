var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "SBA_AIM_WCAS";
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

            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}\n");
            var normalizedFile = AppUtil.createResultsFile(file);
            print("Normalized file: ${normalizedFile}\n");
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

                        if (mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found / No assessment start or end dates.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch (exception) {
                        print(exception);
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
        { TEST: "SBA", NUMBER: "SBA", CODE: "ELA", FIELD: "ELA", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SBA", NUMBER: "SBA", CODE: "MA", FIELD: "Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SBA", NUMBER: "SBA", CODE: "ELAL", FIELD: "ELA_Literacy_", MAP_FUNCTION: mapClaimScaleScore }
        , { TEST: "SBA", NUMBER: "SBA", CODE: "MAT", FIELD: "MATHEMATICS_", MAP_FUNCTION: mapClaimScaleScore }
        , {TEST: "SBA", NUMBER: "SBA", CODE:"ELA_RD", FIELD: "READING_CLAIM_", MAP_FUNCTION: mapClaimScaleScore}
        , {TEST: "SBA", NUMBER: "SBA", CODE:"ELA_WR", FIELD: "WRITING_CLAIM_", MAP_FUNCTION: mapClaimScaleScore}
        , {TEST: "SBA", NUMBER: "SBA", CODE:"ELA_LI", FIELD: "LISTENING_CLAIM_", MAP_FUNCTION: mapClaimScaleScore}
        , {TEST: "SBA", NUMBER: "SBA", CODE:"ELA_RI", FIELD: "RESEARCH_INQUIRY_CLAIM_", MAP_FUNCTION: mapClaimScaleScore}
        , {TEST: "SBA", NUMBER: "SBA", CODE:"ELA_PS", FIELD: "PROBLEM_SOLVING_AND_MODELING_&_DATA_ANALYSIS_CLAIM_", MAP_FUNCTION: mapClaimScaleScore}
        , {TEST: "SBA", NUMBER: "SBA", CODE:"ELA_CR", FIELD: "COMMUNICATING_REASONING_CLAIM_", MAP_FUNCTION: mapClaimScaleScore}
        , {TEST: "SBA", NUMBER: "SBA", CODE:"ELA_CP", FIELD: "CONCEPTS_AND_PROCEDURES_CLAIM_", MAP_FUNCTION: mapClaimScaleScore}
        , { TEST: "SBAC", NUMBER: "SBAC", CODE: "ELA", FIELD: "ELA", MAP_FUNCTION: mapScaledScore }
        , { TEST: "SBAC", NUMBER: "SBAC", CODE: "MA", FIELD: "Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "AIM", NUMBER: "WAAIM", CODE: "ELA", FIELD: "ELA", MAP_FUNCTION: mapScaledScore }
        , { TEST: "AIM", NUMBER: "WAAIM", CODE: "MA", FIELD: "Math", MAP_FUNCTION: mapScaledScore }
        , { TEST: "AIM", NUMBER: "WAAIM", CODE: "SCI", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WCAS", NUMBER: "WCAS", CODE: "SCI", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "ELPA", NUMBER: "ELPA", CODE: "21", FIELD: "ELPA", MAP_FUNCTION: mapScaledScore }
        , { TEST: "ALG", NUMBER: "ALG", CODE: "EOC", FIELD: "Math 1", MAP_FUNCTION: mapScaledScore }
        , { TEST: "ALG", NUMBER: "ALG", CODE: "EOC", FIELD: "Math1", MAP_FUNCTION: mapScaledScore }
        , { TEST: "ALG", NUMBER: "ALG", CODE: "EOC", FIELD: "ALGEBRA", MAP_FUNCTION: mapScaledScore }
        , { TEST: "ALGB", NUMBER: "ALGB", CODE: "EOC", FIELD: "Math1", MAP_FUNCTION: mapScaledScore }
        , { TEST: "BIO", NUMBER: "BIO", CODE: "EOC", FIELD: "Science1", MAP_FUNCTION: mapScaledScore }
        , { TEST: "BIOB", NUMBER: "BIOB", CODE: "EOC", FIELD: "Science1", MAP_FUNCTION: mapScaledScore }
        , { TEST: "GEO", NUMBER: "GEO", CODE: "EOC", FIELD: "Math2", MAP_FUNCTION: mapScaledScore }
        , { TEST: "ALG", NUMBER: "ALG_PSM", CODE: "EOC", FIELD: "PROBLEM_SOLVING_AND_MODELING", MAP_FUNCTION: mapAlgStrandScore }
        , { TEST: "ALG", NUMBER: "ALG_CR", CODE: "EOC", FIELD: "COMMUNICATING_REASONING", MAP_FUNCTION: mapAlgStrandScore }
        , { TEST: "ALG", NUMBER: "ALG_CP", CODE: "EOC", FIELD: "CONCEPTS_AND_PROCEDURES", MAP_FUNCTION: mapAlgStrandScore }
        , { TEST: "HSPE", NUMBER: "HSPE_RD", CODE: "MSPHSPE", FIELD: "Reading", MAP_FUNCTION: mapScaledScore }
        , { TEST: "HSPE", NUMBER: "HSPE_WR", CODE: "MSPHSPE", FIELD: "Writing", MAP_FUNCTION: mapScaledScore }
        , { TEST: "HSPB", NUMBER: "HSPB_RD", CODE: "MSPHSPE", FIELD: "Reading", MAP_FUNCTION: mapScaledScore }
        , { TEST: "HSPB", NUMBER: "HSPB_WR", CODE: "MSPHSPE", FIELD: "Writing", MAP_FUNCTION: mapScaledScore }
        , { TEST: "OFFG", NUMBER: "OFFG", CODE: "OFFG", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "MSPB", NUMBER: "MSPB", CODE: "MSPHSPE", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "DAPE", NUMBER: "DAPE", CODE: "DAPE", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        , { TEST: "MSP", NUMBER: "MSP", CODE: "MSPHSPE", FIELD: "Science", MAP_FUNCTION: mapScaledScore }
        //ELA Mapping function
        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "ELA", FIELD: "ELASCALE", FIELD2: "ELASCALE", MAP_FUNCTION: mapELAScore }
        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "ELA", FIELD: "SMARTER_BALANCED_ELA_READING", FIELD2: "ELA_READING", MAP_FUNCTION: mapELAScore }
        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "ELA", FIELD: "SMARTER_BALANCED_ELA_LISTENING_AND_SPEAKING", FIELD2: "ELA_LISTENING_AND_SPEAKING", MAP_FUNCTION: mapELAScore }
        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "ELA", FIELD: "SMARTER_BALANCED_ELA_WRITING", FIELD2: "ELA_WRITING", MAP_FUNCTION: mapELAScore }
        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "ELA", FIELD: "SMARTER_BALANCED_ELA_RESEARCH", FIELD2: "ELA_RESEARCH", MAP_FUNCTION: mapELAScore }

        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "Math", FIELD: "MATHSCALE", FIELD2: "MATHSCALE", MAP_FUNCTION: mapMathScore }
        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "Math", FIELD: "SMARTER_BALANCED_MATH_CONCEPTS_AND_PROCEDURES", FIELD2: "MATH_CONCEPTS_AND_PROCEDURES", MAP_FUNCTION: mapMathScore }
        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "Math", FIELD: "SMARTER_BALANCED_MATH_MODELING_DATA_ANALYSIS", FIELD2: "MATH_MODELING_DATA_ANALYSIS", MAP_FUNCTION: mapMathScore }
        ,{ TEST: "SBA", NUMBER: "SBA", CODE: "Math", FIELD: "SMARTER_BALANCED_Math_COMMUNICATING_RESEAONING", FIELD2: "MATH_COMMUNICATING_RESEAONING", MAP_FUNCTION: mapMathScore }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    //Non-ELPA total scores
    var decodeLevel = {
        "L1": "Well Below Standard"
        , "L2": "Below Standard"
        , "L3": "Meets Standard"
        , "L4": "Exceeds Standard"
        , "1": "Well Below Standard"
        , "2": "Below Standard"
        , "3": "Meets Standard"
        , "4": "Exceeds Standard"
        , "BA": "OK for Basic"
        , "Level 1": "Well Below Standard"
        , "Level 2": "Below Standard"
        , "Level 3": "Meets Standard"
        , "Level 4": "Exceeds Standard"
        , null: null
        , "": null
    };
    var decodeLevelPassIndicator = {
        "L1": "No"
        , "L2": "No"
        , "L3": "Yes"
        , "L4": "Yes"
        , "1": "No"
        , "2": "No"
        , "3": "Yes"
        , "4": "Yes"
        , "Level 1": "No"
        , "Level 2": "No"
        , "Level 3": "Yes"
        , "Level 4": "Yes"
        , null: null
        , "": null
    };
    var decodeNumericLevel = {
        "L1": "1"
        , "L2": "2"
        , "L3": "3"
        , "L4": "4"
        , "1": "1"
        , "2": "2"
        , "3": "3"
        , "4": "4"
        , "BA": "BA"
        , null: null
        , "": null
    };

    //ElPA total scores
    var decodeELPALevelCode = {
        "Emerging": "1"
        , "Progressing": "2"
        , "Proficient": "3"
        , "1": "1"
        , "2": "2"
        , "3": "3"
        , null: null
        , "": null
    };
    var decodeELPALevelDesc = {
        "1": "Emerging"
        , "2": "Progressing"
        , "3": "Proficient"
        , "Emerging": "Emerging"
        , "Progressing": "Progressing"
        , "Proficient": "Proficient"
        , null: null
        , "": null
    };
    var decodeELPASubClaimLevelCode = {
        "Beginning": "1"
        , "Early Intermediate": "2"
        , "Intermediate": "3"
        , "Early Advanced": "4"
        , "Advanced": "5"
        , "1": "1"
        , "2": "2"
        , "3": "3"
        , "4": "4"
        , "5": "5"
        , null: null
        , "": null
    };
    var decodeELALevelCode = {
        "Above": "1",
        "At/Near": "2",
        "Below": "3",
        "": null,
        null: null
    };
    var decodeELPASubClaimLevelDesc = {
        "1": "Beginning"
        , "2": "Early Intermediate"
        , "3": "Intermediate"
        , "4": "Early Advanced"
        , "5": "Advanced"
        , "Beginning": "Beginning"
        , "Early Intermediate": "Early Intermediate"
        , "Intermediate": "Intermediate"
        , "Early Advanced": "Early Advanced"
        , "Advanced": "Advanced"
        , null: null
        , "": null
    };


    //Non-ELPA strands
    var decodeClaimLevel = {
        "1": "Below Standard"
        , "2": "At/Near Standard"
        , "3": "Above Standard"
        , "BA": "OK for Basic"
        , null: null
        , "": null
    };

    var decodeStudentGrade = {
        "1": "01"
        , "01": "01"
        , "2": "02"
        , "02": "02"
        , "3": "03"
        , "03": "03"
        , "4": "04"
        , "04": "04"
        , "5": "05"
        , "05": "05"
        , "6": "06"
        , "06": "06"
        , "7": "07"
        , "07": "07"
        , "8": "08"
        , "08": "08"
        , "9": "09"
        , "09": "09"
        , "10": "10"
        , "11": "11"
        , "12": "12"
        , "KG": "KG"
        , null: null
        , "": null
    };

    //New ELPA CLaimLevel vars
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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                //component
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                //claims strands
                if (testMetadata.FIELD !== "ALGEBRA" && score !== null) {
                    for (var i = 1; i <= 6; i++) {
                        var masteryClaim = mapClaimScore(row, testMetadata, i, signature);
                        if (masteryClaim !== null) {
                            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, masteryClaim);
                        }
                    }
                }
            } catch (exception) {
                print(exception);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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
        if (!module.normalizedFileFields) {
            module.normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        }

        var testDate = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        var testEndDate = row.getField("TESTEND");
        var testStartDate = row.getField("TESTSTART");
        if(!testEndDate && !testStartDate){
            testEndDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5);
        }
        if (testEndDate === null || testEndDate === undefined || testEndDate === "" || testEndDate === "#NULL!") {
            testDate = parseDate(testStartDate);
            var reportDate  = null;
        } else {
            testDate = parseDate(testEndDate);
            var reportDate  = testDate.STANDARD_DATE;
        }
        var birthDate = row.getField("BIRTHDATE");
        if(birthDate !== null && birthDate !== "" && birthDate !== undefined){
            var birthDateString = birthDate.toString();
        }else{
            var birthDateString = null;
        }
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        birthDateObject = parseDate(birthDateString);

         if((row.getField("ADMINISTRATION")) && row.getField("ADMINISTRATION") !== "ELPA"){
         var reportingPeriod = getReportingPeriod(row.getField("ADMINISTRATION"));
         } else {
            var reportingPeriod = getTEST_ADMIN_PERIOD(row);
         }
        module.normalizedFileFields.forEach(function (field) {
            switch (field) {
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
                    record.REPORTING_PERIOD = _util.coalesce(reportingPeriod, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDate.STANDARD_DATE, getTestAdminDate(testDate.STANDARD_DATE.substr(6), _util.coalesce(reportingPeriod, hierarchy.REPORTING_PERIOD)));
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = _util.coalesce(reportDate, null);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("REPORTINGSCHOOLCODE"),
                                                row.getField("REPORTINGSCHOOLNAME"),
                                                row.getField("SCHOOLNAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("REPORTINGSCHOOLCODE"),
                                                row.getField("SCHOOLCODE"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("REPORTINGSCHOOLNAME"), row.getField("SCHOOLNAME"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("SSID");
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("SSID");
                    break;
                case "STUDENT_STATE_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_STATE_ID = row.getField("SSID");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRSTNAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("MIDDLENAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LASTNAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(decodeStudentGrade[row.getField("REPORTINGGRADE")], row.getField("TESTEDGRADE"));
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
    function mapAdditionalAdminFields(admin, row) {

     var admin = {};
     admin. TEST_INTERVENTION_CODE = _util.coalesce(row.getField("ATTEMPTED"), "");
     admin. TEST_EXEMPTION_CODE = _util.coalesce(row.getField("EXCLUDEFROMAGGREGATION"), "-NA-");
     admin. TEST_EXEMPTION_DESC = "Exclude From Aggregation";
     admin. TEST_INTERVENTION_DESC = null;
     return admin;

    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
     function mapELAScore(row, testMetadata) {
         var score = {};
         var testNumber = generateTestNumberWithField(row, testMetadata);
         var scaleScore = row.getField(testMetadata.FIELD + "_SCORE");
         var level = row.getField(testMetadata.FIELD + "_LEVEL");
         if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
             return null;
         }
         score["TEST_NUMBER"] = testNumber;
         score["TEST_SCORE_TEXT"] = scaleScore;
         if (!isNaN(scaleScore)) {
             score["TEST_SCORE_VALUE"] = scaleScore;
             score["TEST_SCALED_SCORE"] = scaleScore;
         }
         score["TEST_PRIMARY_RESULT_CODE"] = decodeELALevelCode[level];
         score["TEST_PRIMARY_RESULT"] = level;
         score["TEST_SECONDARY_RESULT_CODE"] = decodeNumericLevel[row.getField("ELASTUDENTLEVEL")];
         score["TEST_SECONDARY_RESULT"] = decodeLevel[row.getField("ELASTUDENTLEVEL")];
         score["TEST_PASSED_INDICATOR"] = decodeLevelPassIndicator[row.getField("ELASTUDENTLEVEL")];
         return score;
     }

     function mapMathScore(row, testMetadata) {
        var score = {};
         var testNumber = generateTestNumberWithField(row, testMetadata);
         var scaleScore = row.getField(testMetadata.FIELD + "_SCORE");
         var level = row.getField(testMetadata.FIELD + "_LEVEL");
         if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
             return null;
         }
         score["TEST_NUMBER"] = testNumber;
         score["TEST_SCORE_TEXT"] = scaleScore;
         if (!isNaN(scaleScore)) {
             score["TEST_SCORE_VALUE"] = scaleScore;
             score["TEST_SCALED_SCORE"] = scaleScore;
         }
         score["TEST_PRIMARY_RESULT_CODE"] = decodeELALevelCode[level];
         score["TEST_PRIMARY_RESULT"] = level;
         score["TEST_SECONDARY_RESULT_CODE"] = decodeNumericLevel[row.getField("MATHSTUDENTLEVEL")];
         score["TEST_SECONDARY_RESULT"] = decodeLevel[row.getField("MATHSTUDENTLEVEL")];
         score["TEST_PASSED_INDICATOR"] = decodeLevelPassIndicator[row.getField("MATHSTUDENTLEVEL")];
         return score;
     }



    function mapAlgStrandScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata) + "_STR";
        var perfScore = row.getField(testMetadata.FIELD+"_PERCENT_OF_TOTAL_POINTS_EARNED");
        var proficiency = row.getField(testMetadata.FIELD+"_MEETS_OR_EXCEEDS_PROFICIENT_RANGE");
        // Check for key fields and do not map score and exit if conditions met.
        if(perfScore === null || perfScore === undefined || _util.trim(perfScore) === "--" || _util.trim(perfScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = perfScore;

        score["TEST_PRIMARY_RESULT"] = perfScore;
        score["TEST_PASSED_INDICATOR"] = proficiency;

        return score;
    }
    function mapScaledScore(row, testMetadata, signature) {
        var score = {};
        var testEndDate = row.getField("TESTEND");
        var testStartDate = row.getField("TESTSTART");

        // For ELPA test ONLY do not load the record if no start or end date is available.

        if (row.getField("TESTADMIN") === "ELPA" || signature.getFormat().getFormatName() === "WCAS_SPR_18") {
            if ((testStartDate === null || testStartDate === undefined || testStartDate.trim() === "" || testStartDate.trim() === "#NULL!") &&
                (testEndDate === null || testEndDate === undefined || testEndDate.trim() === "" || testEndDate.trim() === "#NULL!" || testEndDate === " ")) {
                return null;
            }
        }
        if((testMetadata.FIELD !== "ALGEBRA" && signature.getFormat().getFormatName() === "EOC_SPR_2018")
            || (signature.getFormat().getFormatName() !== "EOC_SPR_2018"
                && signature.getFormat().getFormatName() !== "PSDELPA21Spr2021"))
        {
        var resolvedTestType = row.getField("RESOLVEDTESTTYPE");

        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();

        if(fileName.indexOf("SBA") > -1 && resolvedTestType === null) {
            resolvedTestType = "SBA";
        }
            if ((resolvedTestType !== testMetadata.TEST || row.getField("RESOLVEDSUBJECT") !== testMetadata.FIELD)
                && (resolvedTestType !== testMetadata.TEST || row.getField("TESTSUBJECT") !== testMetadata.FIELD))
                {
                    return null;
                }
        }

        //for the PSDELPA21Spr2021 signature only ELPA scores should get loaded
        if(signature.getFormat().getFormatName() === "PSDELPA21Spr2021"
            && testMetadata && testMetadata.TEST !== 'ELPA'){
            return null;
        }

        var testNumber = generateTestNumber(row, testMetadata) + "_TOT";


        var scaleScore = row.getField("SCALESCORE");
        var achievLevel = _util.coalesce(row.getField("LEVEL"), row.getField("PPLEVEL"));
        var metStandard = row.getField("METSTANDARD");
        var metCCR = row.getField("MET_CCR_STANDARD");
        var metGrad = row.getField("METGRADREQSTANDARD");

        var sem = row.getField("SCALESCORESEM");
        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === "#NULL!" || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === " "){
            return null;
        }
        scaleScore = scaleScore.replace(",", "");
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore.replace("#NULL!", ""))) {
            score["TEST_SCALED_SCORE"] = scaleScore.replace("#NULL!", "");
            score["TEST_SCORE_VALUE"] = scaleScore.replace("#NULL!", "");
        }
        if (metStandard !== null && metStandard !== "#NULL!") {
            score["TEST_PASSED_INDICATOR"] = metStandard;
        }
        if (testMetadata.TEST === "ELPA") {
            if (achievLevel !== null && achievLevel !== "#NULL!") {
                score["TEST_PRIMARY_RESULT_CODE"] = decodeELPALevelCode[achievLevel];
                score["TEST_PRIMARY_RESULT"] = decodeELPALevelDesc[achievLevel];
            }
        }
        else {
            score["TEST_PRIMARY_RESULT_CODE"] = decodeNumericLevel[achievLevel];
            score["TEST_PRIMARY_RESULT"] = decodeLevel[achievLevel];
            score["TEST_PASSED_INDICATOR"] = decodeLevelPassIndicator[achievLevel];

        }


        score["TEST_SECONDARY_RESULT_CODE"] = metCCR;
        score["TEST_SECONDARY_RESULT"] = null;
        score["TEST_TERTIARY_RESULT_CODE"] = metGrad;
        score["TEST_TERTIARY_RESULT"] = null;
        if (sem !== null && sem !== "#NULL!") {
            score["TEST_STANDARD_ERROR"] = sem;
        }
        return score;
    }

    function mapClaimScaleScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var standardError = _util.coalesce(row.getField("STANDARD_ERROR_FOR_" + testMetadata.FIELD + "SCALE_SCORE"), row.getField(testMetadata.FIELD + "STANDARD_ERROR"));
        var level = _util.coalesce(row.getField(testMetadata.FIELD + "ACHIEVEMENT_LEVEL"), row.getField(testMetadata.FIELD +"PERFORMANCE_LEVEL"));

        // Check for key fields and do not map score and exit if conditions met.
        if ((scaleScore === null || scaleScore === "#NULL!" || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
            && (level === null || level === "#NULL!" || level === undefined || _util.trim(level) === "--" || _util.trim(level) === "")) {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if (![null, undefined, '#NULL!', 'N', 'E'].some(falsy => falsy === scaleScore)) {
            score["TEST_SCORE_TEXT"] = scaleScore;
        }

        if (!isNaN(scaleScore)) {
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (standardError && !isNaN(standardError)) {
            score["TEST_STANDARD_ERROR"] = standardError;
        }

        if (level !== null && level !== "#NULL!") {
            score["TEST_PRIMARY_RESULT_CODE"] = level;
            score["TEST_PRIMARY_RESULT"] = decodeLevel[level];
            score["TEST_PASSED_INDICATOR"] = decodeLevelPassIndicator[level];
        }

        return score;
    }

    function mapClaimScore(row, testMetadata, masteryClaimNumber,signature) {
        var testEndDate = row.getField("TESTEND");
        var testStartDate = row.getField("TESTSTART");
        // For ELPA test ONLY do not load the record if no start or end date is available.
        if (row.getField("TESTADMIN") === "ELPA") {
            if ((testStartDate === null || testStartDate === undefined || testStartDate.trim() === "" || testStartDate.trim() === "#NULL!") &&
                (testEndDate === null || testEndDate === undefined || testEndDate.trim() === "" || testEndDate.trim() === "#NULL!")) {
                return null;
            }
        }
        if ((row.getField("RESOLVEDTESTTYPE") !== testMetadata.TEST || row.getField("RESOLVEDSUBJECT") !== testMetadata.FIELD)
                && (row.getField("RESOLVEDTESTTYPE") !== testMetadata.TEST || row.getField("TESTSUBJECT") !== testMetadata.FIELD)
                && ("ELA_"+ row.getField("SUBTEST" + masteryClaimNumber + "LABEL") === testMetadata.FIELD)) {
            return null;
        }
        var score = {};

        //for the PSDELPA21Spr2021 signature only ELPA scores should get loaded
        if(signature.getFormat().getFormatName() === "PSDELPA21Spr2021"
            && testMetadata.TEST !== 'ELPA'){
            return null;
        }

        var testNumber = generateTestNumber(row, testMetadata) + "_" + masteryClaimNumber;

        var scaleScore = _util.coalesce(row.getField("CLAIM_OR_STRAND" + masteryClaimNumber + "SCALE"), row.getField("SUBTEST" + masteryClaimNumber + "SCALE"));
        var rawScore = _util.coalesce(row.getField("CLAIM_OR_STRAND" + masteryClaimNumber + "RAW"), row.getField("SUBTEST" + masteryClaimNumber + "RAW"));
        var theta = _util.coalesce(row.getField("CLAIM_OR_STRAND" + masteryClaimNumber + "THETA"), row.getField("SUBTEST" + masteryClaimNumber + "THETA"));
        var sem = _util.coalesce(row.getField("CLAIM_OR_STRAND" + masteryClaimNumber + "SEM"), row.getField("SUBTEST" + masteryClaimNumber + "SEM"));
        var scaleSEM = _util.coalesce(row.getField("CLAIM_OR_STRAND" + masteryClaimNumber + "SCALESEM"), row.getField("SUBTEST" + masteryClaimNumber + "SCALESEM"));
        var level = _util.coalesce(row.getField("CLAIM_OR_STRAND" + masteryClaimNumber + "LEVEL"), row.getField("SUBTEST" + masteryClaimNumber + "LEVEL"));
        var met = _util.coalesce(row.getField("CLAIM_OR_STRAND" + masteryClaimNumber + "MET"), row.getField("SUBTEST" + masteryClaimNumber + "MET"), row.getField("METSTANDARD"));
        var percent = _util.coalesce(row.getField("CLAIM_OR_STRAND" + masteryClaimNumber + "PCT"), row.getField("SUBTEST" + masteryClaimNumber + "PCT"));
        var label = _util.coalesce(row.getField("CLAIM" + masteryClaimNumber + "LABEL"), row.getField("STRAND" + masteryClaimNumber + "LABEL"), row.getField("SUBTEST" + masteryClaimNumber + "LABEL"));
        var numItems = _util.coalesce(row.getField("SUBTEST" + masteryClaimNumber + "NOITEMS"));
        // Check for key fields and do not map score and exit if conditions met.
        if ((rawScore === null || rawScore === "#NULL!" || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")
            && (scaleScore === null || scaleScore === "#NULL!" || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
            && (level === null || level === "#NULL!" || level === undefined || _util.trim(level) === "--" || _util.trim(level) === "")) {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if (![null, undefined, '#NULL!', 'N', 'E'].some(falsy => falsy === scaleScore)) {
            score["TEST_SCORE_TEXT"] = scaleScore;
        }

        if (!isNaN(scaleScore)) {
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (rawScore && !isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
        }

        if (theta && !isNaN(theta)) {
            score["TEST_Z_SCORE"] = theta;
        }

        if (scaleSEM && !isNaN(scaleSEM)) {
            score["TEST_STANDARD_ERROR"] = scaleSEM;
        }
        if (testMetadata.TEST === "ELPA") {
            if (level !== null && level !== "#NULL!") {
                score["TEST_PRIMARY_RESULT_CODE"] = decodeELPASubClaimLevelCode[level];
                score["TEST_PRIMARY_RESULT"] = decodeELPASubClaimLevelDesc[level];
            }
        }
        else {
            if (level !== null && level !== "#NULL!") {
                score["TEST_PRIMARY_RESULT_CODE"] = level;
                score["TEST_PRIMARY_RESULT"] = decodeClaimLevel[level];
            }
        }
        score["TEST_SCORE_ATTRIBUTES"] = label;
        if (met !== null && met !== "#NULL!") {
            score["TEST_PASSED_INDICATOR"] = met;
        }
        if (percent && !isNaN(percent)) {
            score["TEST_PERCENTAGE_SCORE"] = percent;
        }
        if (numItems && !isNaN(numItems)) {
            score["TEST_ITEMS_ATTEMPTED"] = numItems;
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var period = srcRecord.getField("ADMINISTRATION");
         if (period && period !== "ELPA"){
          if (period.toUpperCase().indexOf("SPRING") > -1) {
            period = "SPRING";
          }else if (period.toUpperCase().indexOf("WINTER") > -1) {
             period = "WINTER";
          }else if (period.toUpperCase().indexOf("FALL") > -1) {
           period = "FALL";
          }else if (period.toUpperCase().indexOf("SUMMER") > -1) {
           period = "SUMMER";
           }
         }
        else {
          period = _util.coalesce(getTEST_ADMIN_PERIOD(srcRecord),hierarchy.REPORTING_PERIOD);
         }

        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key), ""));
        });
        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {

        var testNumber = testMetadata.NUMBER + "_" + testMetadata.CODE;

        return testNumber;

    }
    function generateTestNumberWithField(row, testMetadata) {
       var testNumber = testMetadata.NUMBER + "_" + testMetadata.FIELD2;
       return testNumber;
   }

    function getTEST_ADMIN_PERIOD(row, filePeriod) {
        var testAdminPeriod = null;
        // Some student started the test but not Ended.
        if (row.getField("TESTSTART") !== null) {

        var sd = parseDate(row.getField("TESTSTART")).STANDARD_DATE;
        var month = sd.substring(0, 2);

        if (month === "07" || month === "08" || month === "09" || month === "10")
           testAdminPeriod = "FALL";
        else if (month === "11" || month === "12" || month === "01" || month === "02")
           testAdminPeriod = "WINTER";
        else if (month === "03" || month === "04" || month === "05" || month === "06")
           testAdminPeriod = "SPRING";
        }
        else{
            return testAdminPeriod;
        }
        return testAdminPeriod;
    }

    function getReportingPeriod(administration) {


         if (administration.toUpperCase().indexOf("SPRING") > -1) {
            return "SPRING";
         } else if (administration.toUpperCase().indexOf("WINTER") > -1) {
            return "WINTER";
         } else if (administration.toUpperCase().indexOf("FALL") > -1) {
           return "FALL";
         }else if (administration.toUpperCase().indexOf("SUMMER") > -1) {
           return "SUMMER";
         }
    }

    function getTestAdminDate(testYear, reportingPeriod) {
        let testAdminDate = null, testAdminDateObj = AppUtil.getEmptyDateObj();
        if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'WINTER') {
            testAdminDate = '01/15/' + testYear;
        } else if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'SPRING') {
            testAdminDate = '05/15/' + testYear;
        } else {
            testAdminDate = '09/15/' + (testYear - 1);
        }
        testAdminDateObj = AppUtil.getDateObjByPattern(testAdminDate, "MM/dd/yyyy");
        return testAdminDateObj.STANDARD_DATE;
    }


    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };
        var formatter;
        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if((rawDate.indexOf("/")>-1) && rawDate.length===10){
            formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if((rawDate.indexOf("/")>-1) && rawDate.length===9){
            formatter = new java.text.SimpleDateFormat("M/dd/yyyy");
        } else if((rawDate.indexOf("/")>-1) && rawDate.length===8){
            formatter = new java.text.SimpleDateFormat("M/d/yyyy");
        }else if(rawDate.length===12){
            formatter = new java.text.SimpleDateFormat("MMddyyyyhhmm");
        }else if(rawDate.length===11){
            formatter = new java.text.SimpleDateFormat("Mddyyyyhhmm");
        } else if(rawDate.length===8){
            formatter = new java.text.SimpleDateFormat("MMddyyyy");
        }else if(rawDate.length===7){
            formatter = new java.text.SimpleDateFormat("Mddyyyy");
        }else if(rawDate.length===6){
            formatter = new java.text.SimpleDateFormat("MMddyy");
        }else if(rawDate.length===5){
            formatter = new java.text.SimpleDateFormat("Mddyy");
        }
        else if(rawDate.indexOf("-")>-1) {
            formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
        }
        else{
            formatter = new java.text.SimpleDateFormat("MMDDYYYYhhmm");
        }
        var javaDate = formatter.parse(rawDate);

        var calendar = java.util.Calendar.getInstance();
        calendar.setTime(javaDate);

        var year = calendar.get(java.util.Calendar.YEAR);
        var month = AppUtil.formatNumber(calendar.get(java.util.Calendar.MONTH) + 1);
        var day = AppUtil.formatNumber(calendar.get(java.util.Calendar.DAY_OF_MONTH));
        var standardDate = month + "/" + day + "/" + year;

        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;
        dateObj.STANDARD_DATE = standardDate;

        return dateObj;
    }
    return module;

}());