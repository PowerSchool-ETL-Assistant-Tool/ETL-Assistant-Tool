var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "BOCES";
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
        { TEST: "BOCES", CODE: "_ELA", FIELD: "ELA_", MAP_FUNCTION: mapElaScore }
        , { TEST: "BOCES", CODE: "_MA", FIELD: "MATH_", MAP_FUNCTION: mapMathScore }
        , { TEST: "BOCES", CODE: "_SCI", FIELD: "SCIENCE_", MAP_FUNCTION: mapScienceScore }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeDecode = {
        "1": "01",
        "01": "01",
        "KF": "01",
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
        "13": "13",
        "Grade 13": "13",
        "14": "14",
        "Grade 14": "14",
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

    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        var formatter;

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if (rawDate.indexOf('/') > -1) {
            formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if (rawDate.indexOf('-') > -1) {
            formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        } else {
            formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
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
        //Date fields to be split
        var testDate = row.getField("TEST_DATE");
        var testDateObject = testDate.split(" ")[0];
        var testAdminDate = null;

        testAdminDate = parseDate(testDateObject);

        if (testAdminDate === null) {
            testAdminDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
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
                    record.TEST_ADMIN_DATE = testAdminDate.STANDARD_DATE;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENTID_LOCAL"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENTID_LOCAL"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENTID_LOCAL"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = null;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE_LEVEL')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), "DISTRICT");
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

    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapElaScore(row, testMetadata) {
        var score = {};
        var gradeLevel = row.getField("GRADE_LEVEL");
        var testNumber = testMetadata.TEST + "_" + gradeDecode[gradeLevel] + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "1");
        var rawScore = row.getField(testMetadata.FIELD + "%_2");

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_RAW_SCORE"] = rawScore;

        if (gradeLevel === '3' || gradeLevel === '03') {
            if (scaleScore >= 0 && scaleScore <= 582) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 583 && scaleScore <= 601) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 602 && scaleScore <= 628) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 629 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '4' || gradeLevel === '04') {
            if (scaleScore >= 0 && scaleScore <= 583) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 584 && scaleScore <= 602) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 603 && scaleScore <= 618) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 619 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '5' || gradeLevel === '05') {
            if (scaleScore >= 0 && scaleScore <= 593) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 594 && scaleScore <= 608) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 609 && scaleScore <= 621) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 622 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '6' || gradeLevel === '06') {
            if (scaleScore >= 0 && scaleScore <= 589) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 590 && scaleScore <= 601) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 602 && scaleScore <= 613) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 614 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '7' || gradeLevel === '07') {
            if (scaleScore >= 0 && scaleScore <= 590) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 591 && scaleScore <= 606) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 607 && scaleScore <= 622) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 623 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '8' || gradeLevel === '08') {
            if (scaleScore >= 0 && scaleScore <= 583) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 584 && scaleScore <= 602) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 603 && scaleScore <= 616) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 617 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }

        if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 1') {
            score["TEST_PASSED_INDICATOR"] = "No";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 2') {
            score["TEST_PASSED_INDICATOR"] = "No";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 3') {
            score["TEST_PASSED_INDICATOR"] = "Yes";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 4') {
            score["TEST_PASSED_INDICATOR"] = "Yes";
        } else {
            score["TEST_PASSED_INDICATOR"] = "null";
        }

        if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
        }

        return score;
    }

    function mapMathScore(row, testMetadata) {
        var score = {};
        var gradeLevel = row.getField("GRADE_LEVEL");
        var testNumber = testMetadata.TEST + "_" + gradeDecode[gradeLevel] + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "1");
        var rawScore = row.getField(testMetadata.FIELD + "%_2");

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_RAW_SCORE"] = rawScore;

        if (gradeLevel === '3' || gradeLevel === '03') {
            if (scaleScore >= 0 && scaleScore <= 586) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 587 && scaleScore <= 599) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 600 && scaleScore <= 614) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 615 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '4' || gradeLevel === '04') {
            if (scaleScore >= 0 && scaleScore <= 587) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 588 && scaleScore <= 601) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 602 && scaleScore <= 613) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 614 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '5' || gradeLevel === '05') {
            if (scaleScore >= 0 && scaleScore <= 591) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 592 && scaleScore <= 603) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 604 && scaleScore <= 615) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 616 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '6' || gradeLevel === '06') {
            if (scaleScore >= 0 && scaleScore <= 591) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 592 && scaleScore <= 603) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 604 && scaleScore <= 615) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 616 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '7' || gradeLevel === '07') {
            if (scaleScore >= 0 && scaleScore <= 592) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 593 && scaleScore <= 605) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 606 && scaleScore <= 617) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 618 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }
        else if (gradeLevel === '8' || gradeLevel === '08') {
            if (scaleScore >= 0 && scaleScore <= 595) {
                score["TEST_PRIMARY_RESULT"] = 'Below Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
            } else if (scaleScore >= 596 && scaleScore <= 609) {
                score["TEST_PRIMARY_RESULT"] = 'Partially Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
            } else if (scaleScore >= 610 && scaleScore <= 621) {
                score["TEST_PRIMARY_RESULT"] = 'Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
            } else if (scaleScore >= 622 && scaleScore <= 998) {
                score["TEST_PRIMARY_RESULT"] = 'Above Proficient';
                score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
            } else if (scaleScore == 999) {
                score["TEST_PRIMARY_RESULT"] = 'Opt Out';
                score["TEST_PRIMARY_RESULT_CODE"] = 'OO';
            }
        }

        if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 1') {
            score["TEST_PASSED_INDICATOR"] = "No";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 2') {
            score["TEST_PASSED_INDICATOR"] = "No";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 3') {
            score["TEST_PASSED_INDICATOR"] = "Yes";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 4') {
            score["TEST_PASSED_INDICATOR"] = "Yes";
        } else {
            score["TEST_PASSED_INDICATOR"] = "null";
        }

        if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
        }

        return score;
    }


    function mapScienceScore(row, testMetadata) {
        var score = {};
        var gradeLevel = row.getField("GRADE_LEVEL");
        var testNumber = testMetadata.TEST + "_" + gradeDecode[gradeLevel] + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "1");
        var rawScore = row.getField(testMetadata.FIELD + "%_2");

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_RAW_SCORE"] = rawScore;

        if (scaleScore >= 0 && scaleScore <= 43) {
            score["TEST_PRIMARY_RESULT"] = 'Not Meeting the Standards';
            score["TEST_PRIMARY_RESULT_CODE"] = 'Level 1';
        } else if (scaleScore >= 44 && scaleScore <= 64) {
            score["TEST_PRIMARY_RESULT"] = 'Not Fully Meeting the Standards';
            score["TEST_PRIMARY_RESULT_CODE"] = 'Level 2';
        } else if (scaleScore >= 65 && scaleScore <= 84) {
            score["TEST_PRIMARY_RESULT"] = 'Meeting the Standards';
            score["TEST_PRIMARY_RESULT_CODE"] = 'Level 3';
        } else if (scaleScore >= 85 && scaleScore <= 100) {
            score["TEST_PRIMARY_RESULT"] = 'Meeting the Standards with Distinction';
            score["TEST_PRIMARY_RESULT_CODE"] = 'Level 4';
        }

        if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 1') {
            score["TEST_PASSED_INDICATOR"] = "No";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 2') {
            score["TEST_PASSED_INDICATOR"] = "No";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 3') {
            score["TEST_PASSED_INDICATOR"] = "Yes";
        } else if (score["TEST_PRIMARY_RESULT_CODE"] === 'Level 4') {
            score["TEST_PASSED_INDICATOR"] = "Yes";
        } else {
            score["TEST_PASSED_INDICATOR"] = "null";
        }

        if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
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

        var testDateObject = srcRecord.getField("TEST_DATE").split(" ")[0];
        var testAdminDate = null;

        testAdminDate = parseDate(testDateObject).STANDARD_DATE;

        assessmentAdminKey = assessmentAdminKey + "_" + testAdminDate;

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }


    return module;
}());