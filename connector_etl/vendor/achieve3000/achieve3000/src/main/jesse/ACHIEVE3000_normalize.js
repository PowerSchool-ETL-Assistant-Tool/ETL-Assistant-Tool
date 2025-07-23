var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ACHIEVE3000";
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
            print("Loading using signature file ${signatureFormatName} \n");


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("Normalized file: ${normalizedFile} \n");

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

                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"],
                    function (output, rows) {
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

                        // Report when no scores are found.
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
        } n
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
        { TEST: "A3000", CODE: "TOT", FIELD: "", MAP_FUNCTION: mapOverallScore }
        , { TEST: "A3000", CODE: "ACT", FIELD: "", MAP_FUNCTION: mapActivityScore }
        , { TEST: "A3000", CODE: "LEX", FIELD: "", MAP_FUNCTION: mapLexileScore },

        , { TEST: "A3000", CODE: "ACT_EXT", FIELD: "JUST", MAP_FUNCTION: collectActivityScores }
        , { TEST: "A3000", CODE: "ACT_PASS", FIELD: "PASSING", MAP_FUNCTION: collectActivityScores }
        , { TEST: "A3000", CODE: "ACT_AVG_WK", FIELD: "AVERAGE_WEEKLY", MAP_FUNCTION: collectActivityScores }
        , { TEST: "A3000", CODE: "ACT_INV", FIELD: "INVALID", MAP_FUNCTION: collectActivityScores }
        , { TEST: "A3000", CODE: "ACT_TOT", FIELD: "TOTAL", MAP_FUNCTION: collectActivityScores }

        , { TEST: "A3000", CODE: "LEX_PRE_TEST", FIELD: "PRE_TEST", MAP_FUNCTION: collectLexileScores }
        , { TEST: "A3000", CODE: "LEX_INTERIM_TEST", FIELD: "INTERIM_TEST", MAP_FUNCTION: collectLexileScores }
        , { TEST: "A3000", CODE: "LEX_POST_TEST", FIELD: "POST_TEST", MAP_FUNCTION: collectLexileScores }
        , { TEST: "A3000", CODE: "LEX_CURRENT_TEST", FIELD: "CURRENT", MAP_FUNCTION: collectLexileScores }
        , { TEST: "A3000", CODE: "LEXILE_CURRENT", FIELD: "CURRENT", MAP_FUNCTION: lexileScores }

    ];

    var months = [
        'JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER'
    ];

    var monthShort = {
        "JANUARY": "JAN"
        , "FEBRUARY": "FEB"
        , "MARCH": "MAR"
        , "APRIL": "APR"
        , "MAY": "MAY"
        , "JUNE": "JUN"
        , "JULY": "JUL"
        , "AUGUST": "AUG"
        , "SEPTEMBER": "SEPT"
        , "OCTOBER": "OCT"
        , "NOVEMBER": "NOV"
        , "DECEMBER": "DEC"
        , "": null
        , null: null
    };
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
        , "": null
        , null: null
    };

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function getLatestDate(row) {
        var newDate = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        if (row.getField("MAY_ASSESSMENT_DATE") !== null && row.getField("MAY_ASSESSMENT_DATE") !== undefined && row.getField("MAY_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("MAY_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("APRIL_ASSESSMENT_DATE") !== null && row.getField("APRIL_ASSESSMENT_DATE") !== undefined && row.getField("APRIL_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("APRIL_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("MARCH_ASSESSMENT_DATE") !== null && row.getField("MARCH_ASSESSMENT_DATE") !== undefined && row.getField("MARCH_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("MARCH_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("FEBRUARY_ASSESSMENT_DATE") !== null && row.getField("FEBRUARY_ASSESSMENT_DATE") !== undefined && row.getField("FEBRUARY_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("FEBRUARY_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("JANUARY_ASSESSMENT_DATE") !== null && row.getField("JANUARY_ASSESSMENT_DATE") !== undefined && row.getField("JANUARY_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("JANUARY_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("DECEMBER_ASSESSMENT_DATE") !== null && row.getField("DECEMBER_ASSESSMENT_DATE") !== undefined && row.getField("DECEMBER_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("DECEMBER_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("NOVEMBER_ASSESSMENT_DATE") !== null && row.getField("NOVEMBER_ASSESSMENT_DATE") !== undefined && row.getField("NOVEMBER_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("NOVEMBER_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("OCTOBER_ASSESSMENT_DATE") !== null && row.getField("OCTOBER_ASSESSMENT_DATE") !== undefined && row.getField("OCTOBER_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("OCTOBER_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("SEPTEMBER_ASSESSMENT_DATE") !== null && row.getField("SEPTEMBER_ASSESSMENT_DATE") !== undefined && row.getField("SEPTEMBER_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("SEPTEMBER_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("AUGUST_ASSESSMENT_DATE") !== null && row.getField("AUGUST_ASSESSMENT_DATE") !== undefined && row.getField("AUGUST_ASSESSMENT_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("AUGUST_ASSESSMENT_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("POST_TEST_DATE") !== null && row.getField("POST_TEST_DATE") !== undefined && row.getField("POST_TEST_DATE") !== "") {
             newDate = AppUtil.getMonthFollowedByDay(row.getField("POST_TEST_DATE"));
        }
        else if (row.getField("INTERIM_TEST_DATE") !== null && row.getField("INTERIM_TEST_DATE") !== undefined && row.getField("INTERIM_TEST_DATE") !== "") {
            newDate = AppUtil.getDateObjByPattern(row.getField("INTERIM_TEST_DATE"), "yyyy-MM-dd");
        }
        else if (row.getField("PRE_TEST_DATE") !== null && row.getField("PRE_TEST_DATE") !== undefined && row.getField("PRE_TEST_DATE") !== "") {
            newDate = AppUtil.getMonthFollowedByDay(row.getField("PRE_TEST_DATE"));
        }


        return newDate;
    }

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
            let score;
            if (testMetadata.FIELD) {
                try {
                    score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
                }
            } else {
                months.forEach(function (mth) {
                    try {
                        score = (testMetadata.MAP_FUNCTION)(row, testMetadata, mth);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
                    }
                });
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
        var studentName = row.getField("STUDENT_NAME");
        if (studentName !== null) {
            var newName = studentName.split(",",2);
            var studentFirstName = newName[1];
            var studentLastName = newName[0];
        }

        //Logic for Example StudentId - student_155783, 1_123621 etc..
       var localID = row.getField("STUDENT_ID");
       if (localID !== null) {
           if (localID.toString().indexOf("_") > -1) {
               localID = localID.toString().split("_")[1];
           } else if (localID.toString().indexOf(".") > -1) {
               localID = localID.toString().split(".")[1];
           } else {
               localID = localID;
           }
       }
        var testDate = row.getField("LEXILE_DATE");
        if(testDate !== null && testDate !== undefined && testDate !== ""){
        var testAdminDate3 = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
         }
        //var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

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
                    record.TEST_ADMIN_DATE = _util.coalesce(testAdminDate3, getLatestDate(row).STANDARD_DATE, '05/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4));
                    break;
                //Student Information
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = localID;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = localID;
                    break;
                case "STUDENT_STATE_ID":
                     record.STUDENT_STATE_ID = localID;
                     break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('STUDENT_FIRST_NAME'), studentFirstName);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField('STUDENT_LAST_NAME'), studentLastName);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"),row.getField("SCHOOL_VENDOR_ID"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"));
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
    function mapOverallScore(row, testMetadata, month) {
        try {
            var score = {};

            //Only do overall growth once
            if (month !== "AUGUST") {
                return null;
            }

            var testNumber = generateTestNumber(row, testMetadata, month);
            var growth = row.getField("GROWTH");
            var initialExpectedPostTestScore = row.getField("INITIAL_EXPECTED_POST_TEST_SCORE");
            var currentExpectedPostTestScore = row.getField("CURRENT_EXPECTED_POST_TEST_SCORE");
            var mcActivities = row.getField("MC_ACTIVITIES");
            var avgFirstTryScore = row.getField("AVERAGE_FIRST_TRY_SCORE");

            // Check for key fields and do not map score and exit if conditions met.
            if (growth === null || growth === undefined || _util.trim(growth) === "--" || _util.trim(growth) === "" || _util.trim(growth).toUpperCase() === "N/A") {
                return null;
            }
            if (avgFirstTryScore === null || avgFirstTryScore === undefined || _util.trim(avgFirstTryScore) === "--" || _util.trim(avgFirstTryScore) === "" || _util.trim(avgFirstTryScore).toUpperCase() === "N/A") {
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_GROWTH_RESULT = growth;
            score.TEST_GROWTH_TARGET_1 = initialExpectedPostTestScore;
            score.TEST_GROWTH_TARGET_2 = currentExpectedPostTestScore;
            score.TEST_SCORE_ATTRIBUTES = mcActivities;
            score.TEST_SCALED_SCORE = avgFirstTryScore;
            score.TEST_SCORE_VALUE = avgFirstTryScore;

            return score;
        } catch (exception) {
            throw "${_thisModuleName}.mapOverallScore Exception: ${exception}";
        }
    }

    function mapActivityScore(row, testMetadata, month) {
        try {
            var score = {};
            var testNumber = generateTestNumber(row, testMetadata, month);
            var totalNewsAcitivity = row.getField(month + "_TOTAL_NEWS_ACTIVITIES");
            var activityLexileLevel = row.getField(month + "_ACTIVITY_LEXILE_LEVEL");
            var invalidActivities = row.getField(month + "_INVALID_ACTIVITIES");

            // Check for key fields and do not map score and exit if conditions met.
            if (totalNewsAcitivity === null || totalNewsAcitivity === undefined || _util.trim(totalNewsAcitivity) === "--" || _util.trim(totalNewsAcitivity) === "" || _util.trim(totalNewsAcitivity).toUpperCase() === "N/A") {
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_SCORE_VALUE = totalNewsAcitivity;
            score.TEST_SCALED_SCORE = totalNewsAcitivity;
            score.TEST_READING_LEVEL = activityLexileLevel;
            score.TEST_SCORE_ATTRIBUTES = invalidActivities;

            return score;
        } catch (exception) {
            throw "${_thisModuleName}.mapActivityScore Exception: ${exception}";
        }
    }


    function mapLexileScore(row, testMetadata, month) {
        try {
            var score = {};
            var testNumber = generateTestNumber(row, testMetadata, month);
            var assessmentLexileReadingMeasure = row.getField(month + "_ASSESSMENT_LEXILE_READING_MEASURE");
            var lexilePercentile = row.getField(month + "_LEXILE_PERCENTILE");
            var lexileNce = row.getField(month + "_LEXILE_NCE");
            var assessmentNumItems = row.getField(month + "_ASSESSMENT_NUM_ITEMS");
            var assessmentTotalTime = row.getField(month + "_ASSESSMENT_TOTAL_TIME_MINUTES");

            // Check for key fields and do not map score and exit if conditions met.
            if (assessmentLexileReadingMeasure === null || assessmentLexileReadingMeasure === undefined || _util.trim(assessmentLexileReadingMeasure) === "--" || _util.trim(assessmentLexileReadingMeasure) === "") {
                return null;
            }

            if (assessmentTotalTime) {
                assessmentTotalTime = assessmentTotalTime.replace('="', '').replace('"', '').trim();
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_READING_LEVEL = assessmentLexileReadingMeasure;
            score.TEST_PERCENTILE_SCORE = lexilePercentile;
            score.TEST_NCE_SCORE = lexileNce;
            score.TEST_ITEMS_POSSIBLE = assessmentNumItems;
            score.TEST_SCORE_ATTRIBUTES = assessmentTotalTime;

            return score;
        } catch (exception) {
            throw "${_thisModuleName}.mapLexileScore Exception: ${exception}";
        }
    }

    function collectActivityScores(row, testMetadata) {
        let score = {};
        let testNumber = generateTestNumber(row, testMetadata);
        var activities = row.getField(testMetadata.FIELD + "_ACTIVITIES");
        var scaledScore = row.getField("TOTAL_ACTIVITIES");

        // Check for key fields and do not map score and exit if conditions met.
        if (activities === null || activities === undefined || _util.trim(activities) === "--" || _util.trim(activities) === "" || _util.trim(activities).toUpperCase() === "N/A") {
            return null;
        }

        score.TEST_NUMBER = testNumber;
        score.TEST_SCORE_ATTRIBUTES = activities;
        score.TEST_SCALED_SCORE = scaledScore;
        score.TEST_SCORE_VALUE = scaledScore;

        return score;
    }

    function collectLexileScores(row, testMetadata) {
        let score = {};

        let testNumber = generateTestNumber(row, testMetadata);
        var lexileTestDate = row.getField(testMetadata.FIELD + "_DATE");
        var testLexile = row.getField(testMetadata.FIELD + "_LEXILE");
        var testReadingLevel = row.getField(testMetadata.FIELD + "_READING_LEVEL");
        var careerReadiness = row.getField("COLLEGE_AND_CAREER_READINESS_" + testMetadata.FIELD);
        var testLexileLevel = row.getField(testMetadata.FIELD + "_LEXILE_LEVEL");
        var lexGains = row.getField("LEXILE_GAINS");
        var nce = _util.coalesce(row.getField(testMetadata.FIELD + "_NORMAL_CURVE_EQUIVALENT"), row.getField(testMetadata.FIELD + "_LEXILE_NCE"));
        var percentile = _util.coalesce(row.getField(testMetadata.FIELD + "_PERCENTILE_RANK"), row.getField(testMetadata.FIELD + "_LEXILE_PERCENTILE"));

        if((testReadingLevel === null || testReadingLevel === undefined || _util.trim(testReadingLevel) === "--" || _util.trim(testReadingLevel) === "" || _util.trim(testReadingLevel).toUpperCase() === "N/A")
         &&(testLexile === null || testLexile === undefined || _util.trim(testLexile) === "-" || _util.trim(testLexile) === "--" || _util.trim(testLexile) === "" || _util.trim(testLexile).toUpperCase() === "N/A"))
        {
            return null;
        }

        score.TEST_NUMBER = testNumber;
        score.TEST_SCORE_ATTRIBUTES = lexileTestDate;
        score.TEST_SCALED_SCORE = testLexile;
        score.TEST_READING_LEVEL = testReadingLevel;
        score.TEST_PRIMARY_RESULT = careerReadiness;
        score.TEST_SCORE_VALUE = testLexileLevel;
        score.TEST_GROWTH_RESULT = lexGains;

        score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_NCE_SCORE"] = nce;

        return score;
    }

   function lexileScores(row, testMetadata) {
       let score = {};
       let testNum = testMetadata.TEST + "_" + testMetadata.CODE;
       let lexile = row.getField("LEXILE");
       let lexileRange = row.getField("LEXILE_GOAL");
       let lower = null;
       let upper = null;

       if (lexileRange && lexileRange.indexOf('-') > -1) {
           lower = lexileRange.split("-")[0].trim();
           upper = lexileRange.split("-")[1].replace("L", "").trim();
       }

       if (lower !== null) {
           score["TEST_LOWER_BOUND"] = lower;
       }
       if (upper !== null) {
           score["TEST_UPPER_BOUND"] = upper;
       }
       score["TEST_NUMBER"] = testNum;
       score["TEST_READING_LEVEL"] = lexile;

       if (row.getField("CURRENT_READINESS_FALLS_FAR_BELOW") === "Y") {
           score["TEST_PRIMARY_RESULT"] = "FALLS FAR BELOW";
       } else if (row.getField("CURRENT_READINESS_APPROACHES") === "Y") {
           score["TEST_PRIMARY_RESULT"] = "APPROACHES";
       } else if (row.getField("CURRENT_READINESS_MEETS") === "Y") {
           score["TEST_PRIMARY_RESULT"] = "MEETS";
       } else if (row.getField("CURRENT_READINESS_EXCEEDS") === "Y") {
           score["TEST_PRIMARY_RESULT"] = "EXCEEDS";
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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    function generateTestNumber(row, tmd, month) {
        let testNumber = '';
        let postFix = row.getField(month + '_ASSESSMENT');
        if (postFix) {
            if (postFix.toUpperCase().indexOf('PRE') > -1) {
                postFix = 'PRE';
            } else if (postFix.toUpperCase().indexOf('POST') > -1) {
                postFix = 'POST';
            } else if (postFix.toUpperCase().indexOf('INTERIM') > -1) {
                postFix = 'INTERIM';
            } else {
                postFix = '';
            }
        }
        if (month) {
            testNumber = tmd.TEST + '_' + tmd.CODE + '_' + monthShort[month];
        } else {
            testNumber = tmd.TEST + '_' + tmd.CODE;
        }
        if (postFix) {
            testNumber += '_' + postFix;
        }
        return testNumber;
    }

    return module;
}());
