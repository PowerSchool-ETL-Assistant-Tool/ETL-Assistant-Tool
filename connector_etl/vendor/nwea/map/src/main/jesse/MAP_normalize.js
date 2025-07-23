var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NWEA_MAP";
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

                        if (mappingObject.SCORE_MAPPINGS === null || mappingObject.SCORE_MAPPINGS.length === 0) {
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
        { TEST: "MAP", CODE: "TOT", FIELD: "TOTAL", MAP_FUNCTION: mapOverallScore },
        //Growth Time Frame Scores
        { TEST: "MAP", CODE: "FALLTOFALL", FIELD: "FF", MAP_FUNCTION: mapOverallGrowth },
        { TEST: "MAP", CODE: "FALLTOWINTER", FIELD: "FW", MAP_FUNCTION: mapOverallGrowth },
        { TEST: "MAP", CODE: "FALLTOSPRING", FIELD: "FS", MAP_FUNCTION: mapOverallGrowth },
        { TEST: "MAP", CODE: "WINTERTOWINTER", FIELD: "WW", MAP_FUNCTION: mapOverallGrowth },
        { TEST: "MAP", CODE: "WINTERTOSPRING", FIELD: "WS", MAP_FUNCTION: mapOverallGrowth },
        { TEST: "MAP", CODE: "SPRINGTOSPRING", FIELD: "SS", MAP_FUNCTION: mapOverallGrowth },
        //Goal Scores
        { TEST: "MAP", CODE: "1", MAP_FUNCTION: mapGoalScore },
        { TEST: "MAP", CODE: "2", MAP_FUNCTION: mapGoalScore },
        { TEST: "MAP", CODE: "3", MAP_FUNCTION: mapGoalScore },
        { TEST: "MAP", CODE: "4", MAP_FUNCTION: mapGoalScore },
        { TEST: "MAP", CODE: "5", MAP_FUNCTION: mapGoalScore },
        { TEST: "MAP", CODE: "6", MAP_FUNCTION: mapGoalScore },
        { TEST: "MAP", CODE: "7", MAP_FUNCTION: mapGoalScore },
        { TEST: "MAP", CODE: "8", MAP_FUNCTION: mapGoalScore },
        //Projected Proficiency Scores
        { TEST: "MAP", CODE: "1", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "2", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "3", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "4", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "5", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "6", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "7", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "8", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "9", MAP_FUNCTION: mapProjectedProficiencyScore },
        { TEST: "MAP", CODE: "10", MAP_FUNCTION: mapProjectedProficiencyScore }
    ];

    var gradeDecodes = {
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
        ,"0" : "KG"
        ,"KG 1" : "KG1"
        ,"KG 2" : "KG2"
       ,"" : null
       ,null : null
    };

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var NWEAPerfLevels = {
        "LO": "Low",
        "LOW": "Low",
        "LoAvg": "Low Average",
        "LOAVG": "Low Average",
        "AV": "Average",
        "AVG": "Average",
        "HI": "High",
        "HIGH": "High",
        "HiAvg": "High Average",
        "HIAVG": "High Average",
        "--": "--",
        "" : null,
        null : null
    };
    
    var growthMet = {
        "No": "Did Not Meet Growth",
        "No*": "Did Not Meet Growth",
        "Yes": "Met Growth",
        "Yes*": "Met Growth",
        "--": "--",
        "" : null,
        null : null
    };

    var growthMeasureDecode = {
        "TRUE" : 1,
        "True" : 1,
        "FALSE" : 0,
        "False" : 0,
        "" : null,
        null : null
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

        //Map normalized try {
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch (exception) {
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
        //var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var birthDateStr = _util.coalesce(row.getField("STUDENT_DOB"), "");
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        var birthDateSplit = birthDateStr.split("-");

        try {
            if (birthDateStr.length === 10 &&  birthDateSplit[0].length === 2 && birthDateStr.indexOf('-'))  {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "dd-MM-yyyy");

            } else if (birthDateStr.length === 10 && birthDateSplit[0].length === 4 && birthDateStr.indexOf('-')) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "yyyy-MM-dd");
            } else if (birthDateStr.length >= 8 && birthDateStr.length <= 10 && birthDateStr.indexOf('/')) {
                birthDateStr = (("0000000000" + birthDateStr).slice(-10));
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yyyy");
            } else {
                birthDateObject;
            }
        } catch (exception) {
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing birth date string: ${exception}", JSON.stringify(row.getSourceRow())));
        }
        var testDateField = _util.coalesce(row.getField("TEST_ADMIN_DATE"),("05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9)));
        var testDateObject = module.mapDateObject(hierarchy, row, testDateField);
        
           const PERIOD_INFO = (() => {
                     let term = row.getField("TERMNAME");
                     let period = '';
                     let year = '';
                     if (term) {
                         period = term.split(' ')[0];
                         year = term.split(' ')[1];
                     } else {
                         period = hierarchy.REPORTING_PERIOD;
                         year = hierarchy.SCHOOL_YEAR.substring(0,4);
                     }
                     return {
                         period: period,
                         year: year
                     }
        })();
        var studentStateID = row.getField("STATE_STUDENT_ID");
        if (studentStateID === "#N/A") {
            studentStateID = null;
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
                    record.REPORTING_PERIOD = PERIOD_INFO.period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE);
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecodes[row.getField("GRADE")];
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "STUDENT_LOCAL_ID":
                       record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"));
                       break;
                case "STUDENT_VENDOR_ID":
                      record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"));
                      break;
                case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(studentStateID);
                      break;
                case "SCHOOL_VENDOR_ID":
                      record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("SCHOOL_STATE_ID"),row.getField("SCHOOL_NAME"));
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
        var admin = {};

        admin.TEST_TEACHER = row.getField("TEACHER_NAME");
        admin.VENDOR_STAFF_ID = row.getField("TEACHER_UID");

        return admin;
    }

    module.mapDateObject = function (hierarchy, row, dateStr) {
            var dateObj = {
                    RAW_DATE: dateStr
                    , MONTH: null
                    , DAY: null
                    , YEAR: null
                    , STANDARD_DATE: null
            };
            //Create empty test date object.
            var testDateObject = null

            //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
            } catch(exception) {
                // Error will be reported in final check.
            }

             if(testDateObject === null){
                 try {
                    if(dateStr!== null && dateStr.indexOf("/") > -1 && dateStr.length === 6) {
                        testDateObject = AppUtil.getMonthFollowedByDay(dateStr);
                     }
                 } catch(exception) {
                 // Error will be reported in final check.
                }
             }

            if(testDateObject === null){
                try {
                    testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
                } catch(exception) {
                    // Error will be reported in final check.
                }
            }
//            if(testDateObject === null){
//                try {
//                    testDateObject = AppUtil.getDateObjByPattern(dateStr, "M/d/yyyy");
//                } catch(exception) {
//                    // Error will be reported in final check.
//                }
//            }

            if(testDateObject === null){
                try {
                    testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd-MM-yyyy");
                } catch(exception) {
                    // Error will be reported in final check.
                }
            }

            if(testDateObject === null){
                try {
                    testDateObject = AppUtil.getDateObjByPattern(dateStr, "MMddyyyy");
                } catch(exception) {
                    // Error will be reported in final check.
                }
            }
            if(testDateObject === null){
                try {
                    testDateObject = AppUtil.getDateObjByPattern(dateStr, "MMddyy");
                } catch(exception) {
                    // Error will be reported in final check.
                }
            }
            // Set default empty objects if mappings fail and report error.
            if(testDateObject === null){
                testDateObject = AppUtil.getEmptyDateObj(dateStr);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING",row.getRawField("LINEAGE_LINE"), "Error parsing date string: ${dateStr}", JSON.stringify(row.getSourceRow())));
            }
            return testDateObject;
        }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapOverallScore(row, testMetadata) {
        try {
            var score = {}, testNumber;
            var discipline = _util.coalesce(row.getField("DISCIPLINE"), row.getField("SUBJECT"), row.getField("MEASUREMENTSCALE"));
            var course = row.getField("COURSE");

            if (discipline !== null) {
                discipline = discipline.toUpperCase();
            }
            if (course !== null) {
                course = course.toUpperCase();
            } else {
                course = '';
            }

            if (discipline === "MATHEMATICS" && row.getField("TESTNAME")!== undefined && row.getField("TESTNAME")!==null && row.getField("TESTNAME").indexOf("Spanish") > -1) {
                testNumber = "MAP_SPA_MATHEMATICS_TOT";
            }
            else if (discipline === "MATHEMATICS" || discipline === "MATH K-12") {
                testNumber = "MAP_MATHEMATICS_TOT";
            }
            else if (discipline === "LANGUAGE USAGE" || course === "LANGUAGE USAGE") {
                testNumber = "MAP_LANGUAGE_TOT";
            }
            else if (discipline === "LANGUAGE" || course === "LANGUAGE USAGE") {
                testNumber = "MAP_LANGUAGE_TOT";
            }
            else if (discipline === "LANGUAGE ARTS" && course !== undefined && course !== null && (course.toString().indexOf("Reading") > -1 || course.toString().indexOf("READING") > -1) && (course.toString().indexOf("SPANISH") > -1 || course.toString().indexOf("Spanish") > -1)) {
                testNumber = "MAP_SPA_READING_TOT";
            }
            else if (discipline === "LANGUAGE ARTS" && course !== undefined && course !== null && (course.toString().indexOf("Reading") > -1 || course.toString().indexOf("READING") > -1)) {
                testNumber = "MAP_READING_TOT";
            }
            else if (discipline === "READING (SPANISH)") {
                testNumber = "MAP_SPA_READING_TOT";
            }
            else if (discipline === "LANGUAGE ARTS") {
                testNumber = "MAP_LANGUAGE_ARTS_TOT";
            }
            else if (discipline === "READING") {
                testNumber = "MAP_READING_TOT";
            }
            else if (discipline === "GENERAL SCIENCE" || discipline === "SCIENCE - GENERAL SCIENCE") {
                testNumber = "MAP_SCIENCE_TOT";
            }
            else if (discipline === "SCIENCE" || discipline === "SCIENCE K-12") {
                testNumber = "MAP_SCIENCE_TOT";
            }
            else {
                testNumber = "MAP_${discipline}_TOT";
            }

            var growthMeasure = row.getField("GROWTHMEASUREYN");

            if(discipline === null){// Earlier growthMeasure was added as FALSE check to reject but due to the requirement of UIHN-75254 this was removed
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_ITEMS_ATTEMPTED = _util.coalesce(row.getField("DURATIONMINUTES"), row.getField("TESTDURATIONMINUTES"));
            score.TEST_SECONDARY_RESULT = _util.coalesce(row.getField("RITTOREADINGSCORE"), row.getField("LEXILESCORE"));
            score.TEST_TERTIARY_RESULT = _util.coalesce(row.getField("RITTOREADINGMIN"), row.getField("LEXILEMIN"));
            score.TEST_QUATERNARY_RESULT = _util.coalesce(row.getField("RITTOREADINGMAX"), row.getField("LEXILEMAX"));
            score.TEST_SCORE_VALUE = row.getField("TESTRITSCORE");
            score.TEST_SCORE_TEXT = row.getField("COURSE");
            let qMin = row.getField("QUANTILEMIN");
            let qMax = row.getField("QUANTILEMAX");
            let qScore = row.getField("QUANTILESCORE");

            if (qMin) {
                score.TEST_LOWER_BOUND = qMin.toString().replace("Q", "").replace("EM", "");
            }

            if (qMax) {
                score.TEST_UPPER_BOUND = qMax.toString().replace("Q", "").replace("EM", "");
            }

            if (qScore) {
                score.TEST_RAW_SCORE = qScore.toString().replace("Q", "").replace("EM", "");
            }

            score.TEST_STANDARD_ERROR = _util.coalesce(row.getField("TESTSTANDARDERROR"));

            if (row.getField("ACHIEVEMENTQUINTILE") !== null && row.getField("ACHIEVEMENTQUINTILE") !== undefined) {
                score.TEST_PRIMARY_RESULT_CODE = "QUINT";
            }
            score.TEST_SCORE_ATTRIBUTES = row.getField("TESTNAME");
            score.TEST_CUSTOM_RESULT =  "Overall";

            score.TEST_PRIMARY_RESULT = _util.coalesce(NWEAPerfLevels[_util.coalesce(row.getField("ACHIEVEMENTQUINTILE"), "--").toUpperCase()], "--");//new 2020
            score.TEST_SCORE_TO_PREDICTED_RESULT = _util.coalesce(row.getField("RAPIDGUESSINGPERCENTAGE"))//new 2020
            score.TEST_PERCENTAGE_SCORE = _util.coalesce(row.getField("PERCENTCORRECT")); //TODO percent correct 2023
            score.TEST_PERCENTILE_SCORE = !isNaN(row.getField("TESTPERCENTILE")) ? row.getField("TESTPERCENTILE") : ""; // Some records may contain a "*".  We map an empty value
            score.TEST_GROWTH_TARGET_5 = growthMeasureDecode[growthMeasure];

            return score;
        } catch (exception) {
            throw "${_thisModuleName}.mapOverallScore Exception: ${exception}";
        }
    }

    function mapOverallGrowth(row, testMetadata) {
        try {
            var score = {}, testNumber;
            var obsrvGrowth = _util.coalesce(row.getField(testMetadata.CODE + "OBSERVEDGROWTH"));
            var discipline = _util.coalesce(row.getField("DISCIPLINE"), row.getField("SUBJECT"), row.getField("MEASUREMENTSCALE") );
            var course = row.getField("COURSE");

            if (discipline !== null) {
                discipline = discipline.toUpperCase();
            }

            if (course !== null) {
                course = course.toUpperCase();
            } else {
                course = '';
            }

            if (discipline === "MATHEMATICS" && row.getField("TESTNAME")!== undefined && row.getField("TESTNAME")!==null && row.getField("TESTNAME").indexOf("Spanish") > -1) {
                testNumber = "MAP_SPA_MATHEMATICS_GROWTH_${testMetadata.FIELD}";
            }
            else if (discipline === "MATHEMATICS" || discipline === "Mathematics" || discipline === "MATH K-12") {
                testNumber = "MAP_MATHEMATICS_GROWTH_${testMetadata.FIELD}";
            }
            else if (discipline === "LANGUAGE ARTS" && course !== undefined && course !== null && (course.toString().indexOf("Reading") > -1 || course.toString().indexOf("READING") > -1) && (course.toString().indexOf("SPANISH") > -1 || course.toString().indexOf("Spanish") > -1)) {
                testNumber = "MAP_SPA_READING_GROWTH_${testMetadata.FIELD}";
            }
            else if (discipline === "READING (SPANISH)") {
                testNumber = "MAP_SPA_READING_GROWTH_${testMetadata.FIELD}";
            }
            else if (discipline === "LANGUAGE ARTS" && course !== undefined && course !== null && (course.toString().indexOf("Reading") > -1 || course.toString().indexOf("READING") > -1) || discipline === "READING") {
                testNumber = "MAP_READING_GROWTH_${testMetadata.FIELD}";
            }
            else if (discipline === "LANGUAGE ARTS" || discipline === "LANGUAGE USAGE" || course === "LANGUAGE USAGE") {
                testNumber = "MAP_LANGUAGE_GROWTH_${testMetadata.FIELD}";
            }
            else if (discipline === "GENERAL SCIENCE" || discipline === "SCIENCE - GENERAL SCIENCE" || discipline === "SCIENCE K-12") {
                testNumber = "MAP_SCIENCE_GROWTH_${testMetadata.FIELD}";
            }
            else {
                testNumber = "MAP_${discipline}_GROWTH_${testMetadata.FIELD}";
            }

            var growthMeasure = row.getField("GROWTHMEASUREYN");

            if (obsrvGrowth == null || obsrvGrowth.trim() === "") {// Earlier growthMeasure was added as FALSE check to reject but due to the requirement of UIHN-75254 this was removed
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_ITEMS_ATTEMPTED = _util.coalesce(row.getField("TESTDURATIONMINUTES"), row.getField("TESTDURATIONINMINUTES"));
            score.TEST_ITEMS_POSSIBLE = parseInt(_util.coalesce(row.getField("TYPICAL" + testMetadata.CODE + "GROWTH")));
            score.TEST_GROWTH_PERCENTILE = parseInt(_util.coalesce(row.getField(testMetadata.CODE + "CONDITIONALGROWTHPERCENTILE")));
            score.TEST_GROWTH_RESULT_CODE = _util.coalesce(row.getField(testMetadata.CODE + "METPROJECTEDGROWTH"));
            score.TEST_GROWTH_RESULT = _util.coalesce(growthMet[_util.coalesce(row.getField(testMetadata.CODE + "METPROJECTEDGROWTH"), "--")]);
            score.TEST_GROWTH_TARGET_1 = _util.coalesce(row.getField(testMetadata.CODE + "PROJECTEDGROWTH"));
            score.TEST_GROWTH_TARGET_2 = _util.coalesce(row.getField(testMetadata.CODE + "OBSERVEDGROWTH"));
            score.TEST_GROWTH_TARGET_3 = _util.coalesce(row.getField(testMetadata.CODE + "OBSERVEDGROWTHSE"));
            score.TEST_GROWTH_TARGET_4 = _util.coalesce(row.getField(testMetadata.CODE + "CONDITIONALGROWTHINDEX"));
            score.TEST_GROWTH_TARGET_5 = growthMeasureDecode[growthMeasure];
            score.TEST_PRIMARY_RESULT = _util.coalesce(NWEAPerfLevels[_util.coalesce(row.getField(testMetadata.CODE + "GROWTHQUINTILE"), "--").toUpperCase()], "--");//new 2020
            if (row.getField(testMetadata.CODE + "GROWTHQUINTILE") !== null && row.getField(testMetadata.CODE + "GROWTHQUINTILE") !== undefined) {
                score.TEST_PRIMARY_RESULT_CODE = "QUINT";//new2020
            }
            score.TEST_SCORE_ATTRIBUTES = row.getField("TESTNAME");
            score.TEST_CUSTOM_RESULT =  "Observed Growth Range";
            score.TEST_SECONDARY_RESULT = _util.coalesce(row.getField("RITTOREADINGSCORE"), row.getField("LEXILESCORE"));
            score.TEST_TERTIARY_RESULT = _util.coalesce(row.getField("RITTOREADINGMIN"), row.getField("LEXILEMIN"));
            score.TEST_QUATERNARY_RESULT = _util.coalesce(row.getField("RITTOREADINGMAX"), row.getField("LEXILEMAX"));
            score.TEST_SCORE_TEXT = row.getField("COURSE");
            score.TEST_SCORE_VALUE = _util.coalesce(row.getField("TESTRITSCORE"));
            score.TEST_STANDARD_ERROR = _util.coalesce(row.getField("TESTSTANDARDERROR"));
            score.TEST_PERCENTILE_SCORE = (!isNaN(row.getField("TESTPERCENTILE")) ? row.getField("TESTPERCENTILE") : ""); // Some records may contain a "*".  We map an empty value
            return score;
        } catch (exception) {
            throw "${_thisModuleName}.mapOverallGrowth Exception: ${exception}";
        }
    }

    function mapGoalScore(row, testMetadata) {
        try {
            if (row.getField("GOAL" + testMetadata.CODE + "NAME") === null || row.getField("GOAL" + testMetadata.CODE + "NAME").trim() === "") {
                return null;
            }

            var score = {}, testNumber;
            var discipline = _util.coalesce(row.getField("DISCIPLINE"), row.getField("SUBJECT"), row.getField("MEASUREMENTSCALE"));
            var course = row.getField("COURSE");

            if (discipline !== null) {
                discipline = discipline.toUpperCase();
            }

            if (course !== null) {
                course = course.toUpperCase();
            } else {
                course = '';
            }

            if (discipline === "MATHEMATICS" && row.getField("TESTNAME")!== undefined && row.getField("TESTNAME")!==null && row.getField("TESTNAME").indexOf("Spanish") > -1) {
                testNumber = "MAP_SPA_MATHEMATICS_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "MATHEMATICS" || discipline === "MATH K-12") {
                testNumber = "MAP_MATHEMATICS_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "LANGUAGE ARTS" && course !== undefined && course !== null && (course.toString().indexOf("Reading") > -1 || course.toString().indexOf("READING") > -1) && (course.toString().indexOf("SPANISH") > -1 || course.toString().indexOf("Spanish") > -1)) {
                testNumber = "MAP_SPA_READING_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "LANGUAGE ARTS" && course !== undefined && course !== null && (course.toString().indexOf("Reading") > -1 || course.toString().indexOf("READING") > -1)) {
                testNumber = "MAP_READING_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "LANGUAGE ARTS" || discipline === "LANGUAGE USAGE" || course === "LANGUAGE USAGE") {
                testNumber = "MAP_LANGUAGE_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "LANGUAGE" || discipline === "LANGUAGE USAGE" || course === "LANGUAGE USAGE") {
                testNumber = "MAP_LANGUAGE_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "GENERAL SCIENCE" || discipline === "SCIENCE - GENERAL SCIENCE") {
                testNumber = "MAP_SCIENCE_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "SCIENCE" || discipline === "SCIENCE K-12") {
                testNumber = "MAP_SCIENCE_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "READING") {
                testNumber = "MAP_READING_GOAL_${testMetadata.CODE}";
            }
            else if (discipline === "READING (SPANISH)") {
                testNumber = "MAP_SPA_READING_GOAL_${testMetadata.CODE}";
            }
            else {
                testNumber = "MAP_${discipline}_GOAL_${testMetadata.CODE}";
            }

            var growthMeasure = row.getField("GROWTHMEASUREYN");

            if(discipline === null){// Earlier growthMeasure was added as FALSE check to reject but due to the requirement of UIHN-75254 this was removed
                return null;
            }
            score.TEST_NUMBER = testNumber;
            score.TEST_SCORE_ATTRIBUTES = row.getField("TESTNAME");
            score.TEST_CUSTOM_RESULT = row.getField("GOAL" + testMetadata.CODE + "NAME");
            score.TEST_SCORE_VALUE = _util.coalesce(row.getField("GOAL" + testMetadata.CODE + "RITSCORE"));
            score.TEST_STANDARD_ERROR = _util.coalesce(row.getField("GOAL" + testMetadata.CODE + "STDERR"));
            score.TEST_SCORE_TEXT = row.getField("COURSE");
            score.TEST_GROWTH_TARGET_5 = growthMeasureDecode[growthMeasure];
            var lowerRange, upperRange;
            if(row.getField("GOAL" + testMetadata.CODE + "RANGE")!== undefined && row.getField("GOAL" + testMetadata.CODE + "RANGE")!== null) {
                lowerRange = row.getField("GOAL" + testMetadata.CODE + "RANGE").substring(0, row.getField("GOAL" + testMetadata.CODE + "RANGE").indexOf("-"));

                upperRange = row.getField("GOAL" + testMetadata.CODE + "RANGE").substring(row.getField("GOAL" + testMetadata.CODE + "RANGE").indexOf("-") + 1);
                if (lowerRange === "*" && upperRange === "*") {
                    return null;
                }
                score.TEST_LOWER_BOUND = lowerRange;
                score.TEST_UPPER_BOUND = upperRange;
            }
            score.TEST_PRIMARY_RESULT_CODE = _util.coalesce(row.getField("GOAL" + testMetadata.CODE + "ADJECTIVE"));
            score.TEST_PRIMARY_RESULT = _util.coalesce(NWEAPerfLevels[_util.coalesce(row.getField("GOAL" + testMetadata.CODE + "ADJECTIVE"), "--").toUpperCase()], "--");
            return score;
        } catch (exception) {
            throw "${_thisModuleName}.mapGoalScore Exception: ${exception}";
        }
    }

    function mapProjectedProficiencyScore(row, testMetadata) {
        try {
            var score = {}, testNumber;
            var rawProjProfStudy = row.getField("PROJECTEDPROFICIENCYSTUDY" + testMetadata.CODE);
            var projProfStudy = _util.coalesce(rawProjProfStudy);
            if (projProfStudy === null || projProfStudy === undefined || projProfStudy === "") {
                return null;
            }
            projProfStudy = projProfStudy.trim(); //RedundantLine Cleanup. It was Inferred twice.
            var rawProjProfLevel = row.getField("PROJECTEDPROFICIENCYLEVEL" + testMetadata.CODE);
            var projProfLevel = _util.coalesce(rawProjProfLevel);
            if (projProfLevel !== null) {
                projProfLevel = projProfLevel.trim();
            }
            var discipline = _util.coalesce(row.getField("DISCIPLINE"), row.getField("SUBJECT"), row.getField("MEASUREMENTSCALE"));
            var course = row.getField("COURSE");
            if (discipline !== null) {
                discipline = discipline.toUpperCase();
            }
            if (course !== null) {
                course = course.toUpperCase();
            } else {
                course = '';
            }
            if (discipline === "MATHEMATICS" && row.getField("TESTNAME") && row.getField("TESTNAME").indexOf("Spanish") > -1) {
                testNumber = "MAP_SPA_MATHEMATICS_PROJECTED_PROFICIENCY_" + testMetadata.CODE;
            } else if (discipline === "MATHEMATICS" || discipline === "MATH K-12") {
                testNumber = "MAP_MATHEMATICS_PROJECTED_PROFICIENCY_" + testMetadata.CODE;
            } else if (discipline === "LANGUAGE ARTS" && course &&
                       (course.toString().indexOf("Reading") > -1 || course.toString().indexOf("READING") > -1) &&
                       (course.toString().indexOf("SPANISH") > -1 || course.toString().indexOf("Spanish") > -1)) {
                testNumber = "MAP_SPA_READING_PROJECTED_PROFICIENCY_" + testMetadata.CODE;
            } else if (discipline === "READING (SPANISH)") {
                testNumber = "MAP_SPA_READING_PROJECTED_PROFICIENCY_" + testMetadata.CODE;
            } else if ((discipline === "LANGUAGE ARTS" && course &&
                        (course.toString().indexOf("Reading") > -1 || course.toString().indexOf("READING") > -1)) ||
                       discipline === "READING") {
                testNumber = "MAP_READING_PROJECTED_PROFICIENCY_" + testMetadata.CODE;
            } else if (discipline === "LANGUAGE ARTS" || discipline === "LANGUAGE USAGE") {
                testNumber = "MAP_LANGUAGE_PROJECTED_PROFICIENCY_" + testMetadata.CODE;
            } else if (discipline === "GENERAL SCIENCE" || discipline === "SCIENCE - GENERAL SCIENCE" || discipline === "SCIENCE K-12") {
                testNumber = "MAP_SCIENCE_PROJECTED_PROFICIENCY_" + testMetadata.CODE;
            } else {
                testNumber = "MAP_" + discipline + "_PROJECTED_PROFICIENCY_" + testMetadata.CODE;
            }
            var growthMeasure = row.getField("GROWTHMEASUREYN");
            score.TEST_SCORE_TEXT = row.getField("COURSE");
            score.TEST_NUMBER = testNumber;
            score.TEST_SCORE_ATTRIBUTES = row.getField("TESTNAME");
            score.TEST_CUSTOM_RESULT = projProfStudy;
            score.TEST_PRIMARY_RESULT = projProfLevel;
            score.TEST_PRIMARY_RESULT_CODE = projProfLevel;
            score.TEST_SECONDARY_RESULT = _util.coalesce(row.getField("RITTOREADINGSCORE"), row.getField("LEXILESCORE"));
            score.TEST_TERTIARY_RESULT = _util.coalesce(row.getField("RITTOREADINGMIN"), row.getField("LEXILEMIN"));
            score.TEST_QUATERNARY_RESULT = _util.coalesce(row.getField("RITTOREADINGMAX"), row.getField("LEXILEMAX"));
            score.TEST_SCORE_VALUE = _util.coalesce(row.getField("TESTRITSCORE"));
            score.TEST_STANDARD_ERROR = _util.coalesce(row.getField("TESTSTANDARDERROR"));
            score.TEST_PERCENTILE_SCORE = (!isNaN(row.getField("TESTPERCENTILE")) ? row.getField("TESTPERCENTILE") : "");
            score.TEST_GROWTH_TARGET_5 = growthMeasureDecode[growthMeasure];
            return score;
        } catch (exception) {
            throw _thisModuleName + ".mapProjectedProficiencyScore Exception: " + exception;
        }
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
        var DateObj = module.mapDateObject(hierarchy, srcRecord, srcRecord.getField("TEST_ADMIN_DATE"));
        assessmentAdminKey = assessmentAdminKey +"_"+ DateObj.STANDARD_DATE;
        var timeField = _util.coalesce(srcRecord.getField("TEST_START_TIME"), srcRecord.getField("TESTSTARTTIME"));
        if(timeField!==undefined && timeField!==null) {
            var timeStamp = timeField.substring(0, 5);
            assessmentAdminKey = assessmentAdminKey +"_"+ timeStamp;
        }
        
        return assessmentAdminKey;
    }
    return module;
}());