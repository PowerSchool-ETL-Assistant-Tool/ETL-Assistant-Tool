var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LEAP_AA1";
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
        { TEST: "LEAP_AA1_", CODE: "ELA_OVERALL", FIELD: "_ELA", MAP_FUNCTION: mapOverallScore }
        , { TEST: "LEAP_AA1_", CODE: "ELA_RFS1", FIELD: "READING_FOUNDATIONAL_SET_1_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "ELA_RFS2", FIELD: "READING_FOUNDATIONAL_SET_2_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "ELA_T1WP", FIELD: "TIER_1_WRITING_PROMPT_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "ELA_LIS", FIELD: "LISTENING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "ELA_RD", FIELD: "READING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "ELA_UIR", FIELD: "USING_INFORMATION_RESOURCES_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "ELA_WT", FIELD: "WRITING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        // MATH
        , { TEST: "LEAP_AA1_", CODE: "MA_OVERALL", FIELD: "_MATH", MAP_FUNCTION: mapOverallScore }
        , { TEST: "LEAP_AA1_", CODE: "MA_AP", FIELD: "ALGEBRA_AND_PATTERNS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "MA_DATA", FIELD: "DATA_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "MA_MG", FIELD: "MEASUREMENT_AND_GEOMETRY_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "MA_NUM", FIELD: "NUMBERS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        // SCIENCE
        , { TEST: "LEAP_AA1_", CODE: "SCI_OVERALL", FIELD: "_SCIENCE", MAP_FUNCTION: mapOverallScore }
        , { TEST: "LEAP_AA1_", CODE: "SCI_ESES", FIELD: "EARTH_SPACE_AND_ENVIRONMENTAL_SCIENCE_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "SCI_LS", FIELD: "LIFE_SCIENCE_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "SCI_PS", FIELD: "PHYSICAL_SCIENCE_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_AA1_", CODE: "SCI_SI", FIELD: "SCIENCE_AS_INQUIRY_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var assessAchievDecode = {
        "1": "Level 1"
        , "2": "Level 2"
        , "3": "Level 3"
        , "4": "Level 4"
        , "Level 1": "Level 1"
        , "Level 2": "Level 2"
        , "Level 3": "Level 3"
        , "Level 4": "Level 4"
        , "EST": "Exceeds Standard"
        , "MST": "Meets Standard"
        , "WST": "Working Toward Standard"
        , "Exceeds Standard": "Exceeds Standard"
        , "Meets Standard"  : "Meets Standard"
        , "Working Toward Standard": "Working Toward Standard"
        , "": null
        , null: null
    };

    var accountAchievDecode = {
        "UNS": "Unsatisfactory"
        , "BAS": "Basic"
        , "MAS": "Mastery"
        , "ADV": "Advanced"
        , "EST": "Exceeds Standard"
        , "MST": "Meets Standard"
        , "WST": "Working Toward Standard"
        , "": null
        , null: null
    };

    var accountAchievPassDecode = {
        "1": "No"
        , "2": "No"
        , "3": "Yes"
        , "4": "Yes"
        , "Level 1": "No"
        , "Level 2": "No"
        , "Level 3": "Yes"
        , "Level 4": "Yes"
        , "EST": "Yes"
        , "MST": "Yes"
        , "WST": "No"
        , "": null
        , null: null
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
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

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
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "MM/dd/yyyy");//"yyyy-MM-dd");
        var testRptDate = null;
        var testDateObj = null;

        if (row.getField("TEST_DATE_FULL") !== null && row.getField("TEST_DATE_FULL") !== undefined && row.getField("TEST_DATE_FULL") !== "") {
            let rawTestDate = row.getField("TEST_DATE_FULL");
            let year = rawTestDate.split('-')[1];
            if (year.length === 2) {
                testRptDate = AppUtil.getDateObjByPattern(rawTestDate, "MMM-yy").STANDARD_DATE;
            } else if (year.length === 4) {
                testRptDate = AppUtil.getDateObjByPattern(rawTestDate, "MMM-yyyy").STANDARD_DATE;
            }
            testDateObj = testRptDate;
        } else if (row.getField("TEST_DATE_MONTH") == null || row.getField("TEST_DATE_MONTH") == undefined || row.getField("TEST_DATE_MONTH") == "" ||
            row.getField("TEST_DATE_YEAR") == null || row.getField("TEST_DATE_YEAR") == undefined || row.getField("TEST_DATE_YEAR") == "") {
            testRptDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
            testDateObj = AppUtil.getDateObjByPattern(row.getField("TEST_DATE_MONTH") + "/15/" + row.getField("TEST_DATE_YEAR"), "M/d/yyyy").STANDARD_DATE;
        } else {
            testRptDate = row.getField("TEST_DATE_MONTH") + "/15/" + row.getField("TEST_DATE_YEAR");
            testDateObj = AppUtil.getDateObjByPattern(row.getField("TEST_DATE_MONTH") + "/15/" + row.getField("TEST_DATE_YEAR"), "M/d/yyyy").STANDARD_DATE;
        }

        /*  pre UIHN-9419:
        var districtCode = _util.coalesce(
                                            row.getField("DISTRICT_CODE")
                                            , AssessmentLoader.config.DISTRICT_CODE
                                            , ""
                                          );

        //District code fields are length 14, 7 district code numbers followed by 7 school code numbers or 7 zeroes
        if(districtCode.length > 7){
            districtCode = districtCode.substring(0,7);
        }
        */

        normalizedFileFields.forEach(function (field) {
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  //  pre UIHN-9419: districtCode;
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
                    record.TEST_ADMIN_DATE = testDateObj;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(row.getField("SUMMARIZED_DOB_MONTH"), birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(row.getField("SUMMARIZED_DOB_DAY"), birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(row.getField("SUMMARIZED_DOB_YEAR"), birthDateObject.YEAR, null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    // record.SCHOOL_VENDOR_ID = districtCode + "" + _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));  // pre UIHN-9419:
                    record.SCHOOL_VENDOR_ID = AssessmentLoader.config.DISTRICT_CODE + "" + _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                    // record.SCHOOL_STATE_ID = districtCode + "" + _util.coalesce(row.getField("SCHOOL_CODE"));  //  pre UIHN-9419:
                    record.SCHOOL_STATE_ID = AssessmentLoader.config.DISTRICT_CODE + "" + _util.coalesce(row.getField("SCHOOL_CODE"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = null;
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("NEW_LASID"), row.getField("LASID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("SUMMARIZED_GENDER"), row.getField("LAP_GENDER"), row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(row.getField("SUMMARIZED_GRADE"), row.getField("LAP_GRADE_PLACEMENT"), row.getField("GRADE"));
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = testRptDate;
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
    function mapSubClaimScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var rawScore = _util.coalesce(
            row.getField(testMetadata.FIELD + "RAW_SCORE" + testMetadata.PARENT_FIELD),
            row.getField(testMetadata.FIELD.substr(0, testMetadata.FIELD.lastIndexOf('_')))
        );
        var rating = row.getField(testMetadata.FIELD + "RATING" + testMetadata.PARENT_FIELD);
        var percentCorrect = row.getField(testMetadata.FIELD + "PERCENT_CORRECT" + testMetadata.PARENT_FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_SCORE_TEXT"] = rawScore;
        score["TEST_SCORE_VALUE"] = rawScore;

        if (percentCorrect && !isNaN(percentCorrect)) {
            score["TEST_PERCENTAGE_SCORE"] = percentCorrect;
        }
        //score["TEST_PRIMARY_RESULT_CODE"] = rating;
        //score["TEST_PRIMARY_RESULT"] = ratingDecode[rating];

        return score;
    }

    function mapOverallScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var rawScore = row.getField("RAW_SCORE" + testMetadata.FIELD);
        var scaleScore = row.getField("SCALE_SCORE" + testMetadata.FIELD);
        var achievLevel = row.getField("ASSESSMENT_ACHIEVEMENT_LEVEL" + testMetadata.FIELD);

        var semLow = row.getField("SEM_LOW" + testMetadata.FIELD);
        var semHigh = row.getField("SEM_HIGH" + testMetadata.FIELD);

        var acctLevel = row.getField("ACCOUNTABILITY_ACHIEVEMENT_LEVEL" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_RAW_SCORE"] = rawScore;

        score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
        score["TEST_PRIMARY_RESULT"] = assessAchievDecode[achievLevel];
        score["TEST_PASSED_INDICATOR"] = accountAchievPassDecode[achievLevel];

        score["TEST_LOWER_BOUND"] = semLow;
        score["TEST_UPPER_BOUND"] = semHigh;

        score["TEST_SECONDARY_RESULT_CODE"] = acctLevel;
        score["TEST_SECONDARY_RESULT"] = accountAchievDecode[acctLevel];

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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        return assessmentAdminKey;
    }

    return module;
}());
