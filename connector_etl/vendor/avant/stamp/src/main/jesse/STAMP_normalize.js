var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "stamp";
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
            print("Normalized file ${normalizedFile}\n");

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
    var scoresToMap =
        [
            { TEST: "STAMP", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapScaledScore }
            , { TEST: "STAMP", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapRawScore }
            , { TEST: "STAMP", CODE: "LIS", FIELD: "LISTENING", MAP_FUNCTION: mapScaledScore }
            , { TEST: "STAMP", CODE: "SPK", FIELD: "SPEAKING", MAP_FUNCTION: mapRawScore }
            , { TEST: "STAMP", CODE: "RCP", FIELD: "RECEPTIVE", MAP_FUNCTION: mapRawScore }
            , { TEST: "STAMP", CODE: "EXP", FIELD: "EXPRESSIVE", MAP_FUNCTION: mapRawScore }
            , { TEST: "STAMP", CODE: "OVR", FIELD: "COMPOSITE", MAP_FUNCTION: mapCompositeScore }
        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    /**
       https://avantassessment.com/stamp4s/benchmark-rubric-guide
    */
    var performanceLevelDecode = {
        //regular numerals
        "0": "No Score",
        "1": "Novice",
        "2": "Novice",
        "3": "Novice",
        "4": "Intermediate",
        "5": "Intermediate",
        "6": "Intermediate",
        "7": "Advanced",
        "8": "Advanced",
        "9": "Advanced",
        //numeral-
        "1-": "Invalid",
        "2-": "Invalid",
        "3-": "Invalid",
        "4-": "Invalid",
        "5-": "Invalid",
        "6-": "Invalid",
        "7-": "Invalid",
        "8-": "Invalid",
        "9-": "Invalid",
        //numeral+
        "6+": "Intermediate",
        //text
        "NR": "Not Ratable",
        "NS": "Section Not Started",
        "IP": "Section In Progress",
        "SP": "Scoring In Progress",
        "ST": "Not Specified",
        //defaults
        null: "Not Specified",
        "": "Not Specified"
    };
    var numeralDecode = {
        //regular numerals
        "1": "1",
        "2": "2",
        "3": "3",
        "4": "4",
        "5": "5",
        "6": "6",
        "7": "7",
        "8": "8",
        "9": "9",
        //numeral-
        "1-": "Invalid",
        "2-": "Invalid",
        "3-": "Invalid",
        "4-": "Invalid",
        "5-": "Invalid",
        "6-": "Invalid",
        "7-": "Invalid",
        "8-": "Invalid",
        "9-": "Invalid",
        //numeral+
        "6+": "6",
        //text
        "NR": "Not Ratable",
        "NS": "Section Not Started",
        "IP": "Section In Progress",
        "SP": "Scoring In Progress",
        "ST": "Not Specified",
        //defaults
        null: "Not Specified",
        "": "Not Specified"
    };
    var lowMidHighLevelDecode = {
        "0": "No Score",
        "1": "Low",
        "2": "Mid",
        "3": "High",
        "4": "Low",
        "5": "Mid",
        "6": "High",
        "7": "Low",
        "8": "Mid",
        "9": "High",
        //numeral-
        "1-": "Invalid",
        "2-": "Invalid",
        "3-": "Invalid",
        "4-": "Invalid",
        "5-": "Invalid",
        "6-": "Invalid",
        "7-": "Invalid",
        "8-": "Invalid",
        "9-": "Invalid",
        //numeral+
        "6+": "Pre-Advanced",

        "NR": "NR",
        "NS": "NS",
        "IP": "IP",
        "SP": "SP",
        "ST": "ST"
    };
    var rawLowMidHighLevelDecode = {
        "0": "No Score",
        "1": "Low",
        "2": "Mid",
        "3": "High",
        "4": "Low",
        "5": "Mid",
        "6": "High",
        "7": "Low",
        "8": "Mid/High",
        //numeral-
        "1-": "Invalid",
        "2-": "Invalid",
        "3-": "Invalid",
        "4-": "Invalid",
        "5-": "Invalid",
        "6-": "Invalid",
        "7-": "Invalid",
        "8-": "Invalid",
        //numeral+
        "6+": "Pre-Advanced",

        "NR": "NR",
        "NS": "NS",
        "IP": "IP",
        "SP": "SP",
        "ST": "ST"
    };

    var gradeDecode = {
         "1": "01",
         "01": "01",
         "Grade 1": "01",
         "1st Grade": "01",
         "2": "02",
         "02": "02",
         "Grade 2": "02",
         "2nd Grade": "02",
         "3": "03",
         "03": "03",
         "Grade 3": "03",
         "3rd Grade": "03",
         "4": "04",
         "04": "04",
         "Grade 4": "04",
         "4th Grade": "04",
         "5": "05",
         "05": "05",
         "Grade 5": "05",
         "5th Grade": "05",
         "6": "06",
         "06": "06",
         "Grade 6": "06",
         "6th Grade": "06",
         "7": "07",
         "07": "07",
         "Grade 7": "07",
         "7th Grade": "07",
         "8": "08",
         "08": "08",
         "Grade 8": "08",
         "8th Grade": "08",
         "9": "09",
         "09": "09",
         "Grade 9": "09",
         "9th Grade": "09",
         "10": "10",
         "Grade 10": "10",
         "10th Grade": "10",
         "10th":"10",
         "11": "11",
         "Grade 11": "11",
         "11th Grade": "11",
         "11th":"11",
         "12": "12",
         "Grade 12": "12",
         "12th Grade": "12",
         "12th":"12",
         "H.S. Graduate":"12",
         "16+":"16",
         "KG": "KG",
         "KN": "KG",
         "K": "KG",
         "Kindergarten": "KG"
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

        var datePattern = "";
        var testDate = "";
        if (row.getField("START_TIME_(UTC)") !== null && row.getField("START_TIME_(UTC)") !== undefined) {

            var rawDate = row.getField("START_TIME_(UTC)").toString();
            if ((rawDate.indexOf("-") > -1) && (rawDate.split("-")[0].length === 2)) {
                datePattern = "dd-MM-yyyy";
            } else if ((rawDate.indexOf("-") > -1) && (rawDate.split("-")[0].length === 4)) {
                datePattern = "yyyy-MM-dd";
            } else {
                datePattern = "MM/d/yyyy";
            }

            testDate = AppUtil.getDateObjByPattern(rawDate, datePattern).STANDARD_DATE;
        }else{
            testDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(0,4);
        }

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
                    record.TEST_ADMIN_DATE = testDate;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENTID_OTHERID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENTID_OTHERID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENTID_OTHERID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = null;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = null;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = null;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_ID"),row.getField("DISTRICT"),row.getField("SCHOOL_ID"), row.getField('SCHOOL_CODE'));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL")
                    );
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
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField("SCALED_" + testMetadata.FIELD + "_SCORE");
        var rawScore = row.getField(testMetadata.FIELD + "_SCORE");
        var status = row.getField("STATUS");
        var length = row.getField(testMetadata.FIELD + "_LENGTH_OF_TIME");
        var performanceLevel = performanceLevelDecode[rawScore];
        var lowMidHighLevel = lowMidHighLevelDecode[rawScore];
        //Check for key fields and do not map score and exit if conditions met.
        //Do not load if still In Progress
        if ((status === "In Progress" || rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || performanceLevel === "Invalid") &&
        (performanceLevel === null || performanceLevel === undefined || performanceLevel === "" || performanceLevel === "Not Specified")){
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (isNaN(numeralDecode[scaleScore])) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if (!isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = rawScore;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_SECONDARY_RESULT_CODE"] = rawScore;
        score["TEST_SECONDARY_RESULT"] = lowMidHighLevel;
        score["TEST_TERTIARY_RESULT_CODE"] = rawScore;
        score["TEST_TERTIARY_RESULT"] = performanceLevel + "-" + lowMidHighLevel;
        score["TEST_SCORE_ATTRIBUTES"] = length;
        return score;
    }

    function mapRawScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var rawScore = row.getField(testMetadata.FIELD + "_SCORE");
        var status = row.getField("STATUS");
        var length = row.getField(testMetadata.FIELD + "_LENGTH_OF_TIME");
        var performanceLevel = performanceLevelDecode[rawScore];
        var lowMidHighLevel = rawLowMidHighLevelDecode[rawScore];
        //Check for key fields and do not map score and exit if conditions met.
        //Do not load if still In Progress
        if ((status === "In Progress" || rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || performanceLevel === "Invalid") &&
        (performanceLevel === null || performanceLevel === undefined || performanceLevel === "" || performanceLevel === "Not Specified")){
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = rawScore;
        if (!isNaN(rawScore)) {
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = rawScore;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_SECONDARY_RESULT_CODE"] = rawScore;
        score["TEST_SECONDARY_RESULT"] = lowMidHighLevel;
        score["TEST_TERTIARY_RESULT_CODE"] = rawScore;
        score["TEST_TERTIARY_RESULT"] = performanceLevel + "-" + lowMidHighLevel;
        score["TEST_SCORE_ATTRIBUTES"] = length;
        return score;
    }

    function mapCompositeScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var rawScore = row.getField(testMetadata.FIELD + "_SCORE");
        var status = row.getField("STATUS");
        var length = row.getField("TEST_LENGTH");

        //Check for key fields and do not map score and exit if conditions met.
        //Do not load if still In Progress
        if ((status === "In Progress" || rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || performanceLevel === "Invalid") &&
        (performanceLevel === null || performanceLevel === undefined || performanceLevel === "" || performanceLevel === "Not Specified")){
            return null;
        }


        var performanceLevel = performanceLevelDecode[rawScore.toString().substring(0, 1)];
        if (performanceLevel === "Invalid") {
            return null;
        }

        var lowMidHighLevel = rawLowMidHighLevelDecode[rawScore.toString().substring(0, 1)];
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = rawScore;
        if (!isNaN(rawScore)) {
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = rawScore;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_SECONDARY_RESULT_CODE"] = rawScore;
        score["TEST_SECONDARY_RESULT"] = lowMidHighLevel;
        score["TEST_TERTIARY_RESULT_CODE"] = rawScore;
        score["TEST_TERTIARY_RESULT"] = performanceLevel + "-" + lowMidHighLevel;
        score["TEST_SCORE_ATTRIBUTES"] = length;
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

    function generateTestNumber(row, testMetadata) {
        var lang = row.getField("LANGUAGE").toString().toUpperCase();
        lang = lang.replace(" ", "_").replace("'","");
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + lang;

        var fileName = row.getRawField("LINEAGE_FILE").toString();
        if(fileName.indexOf("ASL") > -1){
            testNumber = testNumber + "_ASL";
        }else if(fileName.indexOf("4SE") > -1){
            testNumber = testNumber + "_4SE";
        }else if(fileName.indexOf("4S") > -1){
            testNumber = testNumber + "_4S";
        }

        return testNumber;

    }

    return module;
}());