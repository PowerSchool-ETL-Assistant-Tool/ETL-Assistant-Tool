var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ASPIRE_PLUS";
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


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("Normalized file: ${normalizedFile}\n");

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
        { TEST: 'ASPIRE_PLUS', CODE: 'ELA_SCALE', FIELD: 'ELA', MAP_FUNCTION: collectScaleScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'STEM_SCALE', FIELD: 'STEM', MAP_FUNCTION: collectScaleScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'COMP_SCALE', FIELD: 'COMPOSITE', MAP_FUNCTION: collectScaleScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'ENG_SCALE', FIELD: 'ENGLISH', MAP_FUNCTION: collectScaleScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'RED_SCALE', FIELD: 'READING', MAP_FUNCTION: collectScaleScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'MA_SCALE', FIELD: 'MATH', MAP_FUNCTION: collectScaleScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'SCI_SCALE', FIELD: 'SCIENCE', MAP_FUNCTION: collectScaleScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'COMP_PRED', FIELD: 'COMPOSITE', MAP_FUNCTION: collectPredictedScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'ENG_PRED', FIELD: 'ENGLISH', MAP_FUNCTION: collectPredictedScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'RED_PRED', FIELD: 'READING', MAP_FUNCTION: collectPredictedScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'MA_PRED', FIELD: 'MATH', MAP_FUNCTION: collectPredictedScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'SCI_PRED', FIELD: 'SCIENCE', MAP_FUNCTION: collectPredictedScore },
        { TEST: 'ASPIRE_PLUS', CODE: 'OVR', FIELD: 'OVERALL', MAP_FUNCTION: collectOvrallScore }

    ];

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

    var perfDecode = {
        "1": "Level 1"
        , "2": "Level 2"
        , "3": "Level 3"
        , "4": "Level 4"
        , "": null
        , null: null
    };
//""ASPIRE_PLUS_RED_SCALE"",""TEST_SCORE_TEXT"":""219"",""TEST_SCORE_VALUE"":""219"",""TEST_SCALED_SCORE"":""219"",""TEST_RAW_SCORE"":""33"",""TEST_PRIMARY_RESULT_CODE"":""Level 3"",""TEST_PRIMARY_RESULT"":""Proficient"",""TEST_STANDARD_ERROR"":""7.6"",""TEST_Z_SCORE"":""0.7544""},
    var profDecode = {
        "1" : { DESC:"Below Proficient", PASS_IND: "No"}
        , "Level 1" : { DESC:"Below Proficient", PASS_IND: "No"}
        , "2": { DESC:"Approaching Proficient", PASS_IND: "No"}
        , "Level 2": { DESC:"Approaching Proficient", PASS_IND: "No"}
        , "3": { DESC:"Proficient", PASS_IND: "Yes"}
        , "Level 3": { DESC:"Proficient", PASS_IND: "Yes"}
        , "4": { DESC:"Highly Proficient", PASS_IND: "Yes"}
        , "Level 4": { DESC:"Highly Proficient", PASS_IND: "Yes"}
         ,"" : { DESC: "Not Applicable", PASS_IND: null}
         ,null : { DESC: null, PASS_IND: null}
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);

                if (testMetadata.CODE == "ENG_SCALE" || testMetadata.CODE == "RED_SCALE" || testMetadata.CODE == "MA_SCALE" || testMetadata.CODE == "SCI_SCALE" && score !== null) {
                    for (var i = 1; i <= 5; i++) {
                        var scr = collectScore(row, testMetadata, i, signature);
                        if (scr !== null) {
                            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, scr);
                        }
                    }
                }
            } catch (exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
        }

        var birthDate = _util.coalesce(row.getField("BIRTH_DATE"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        var finalDate = null;
        if(row.getField("TEST_ADMIN_DATE")!==null && row.getField("TEST_ADMIN_DATE")!==undefined){
            finalDate = AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "MM/dd/yyyy").STANDARD_DATE;
        }
        else{
            finalDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
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
                    record.TEST_ADMIN_DATE = finalDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STUDENT_ID")
                    );
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
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
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
                //use TestingSchoolNumber as School_Number if it is present in data file.
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("REPORTING_SCHOOL_NUMBER") + "|" +row.getField("SCHOOL_NUMBER"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("REPORTING_SCHOOL_NUMBER"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("REPORTING_SCHOOL_NUMBER"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
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

        //        if (row.getField("ENG_LEARNER") === "1" || row.getField("ENG_LEARNER") === "2") {
        //            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        //        }
        //        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function collectScaleScore(row, testMetadata, signature) {
        var score = {};

        if (signature.getFormat().getFormatName() == "UT_UTAH_ASPIRE18") {
            return null;
        }

        var testNumber = testMetadata.TEST + '_' + testMetadata.CODE;

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "SCALESCORE"));
        var sem = _util.coalesce(row.getField(testMetadata.FIELD + "SCALESCORECSEM"));
        var prof = _util.coalesce(row.getField(testMetadata.FIELD + "PROFICIENCYLEVEL"));
        var rawScore = _util.coalesce(row.getField(testMetadata.FIELD + "RAWSCORE"));
        var theta = _util.coalesce(row.getField(testMetadata.FIELD + "THETASCORE"));

        //        // Check for key fields and do not map score and exit if conditions met.
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
        var test = score["TEST_SCORE_VALUE"];

        if (!isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
        }

        if (row.getField("GRADE") == 09) {
            if (testMetadata.FIELD === "ENGLISH") {
                if (scaleScore >= 100 && scaleScore <= 164) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 165 && scaleScore <= 201) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 202 && scaleScore <= 241) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 242 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "STEM") {
                if (scaleScore >= 100 && scaleScore <= 164) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 165 && scaleScore <= 201) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 202 && scaleScore <= 241) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 242 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "COMPOSITE") {
                if (scaleScore >= 100 && scaleScore <= 164) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 165 && scaleScore <= 201) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 202 && scaleScore <= 241) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 242 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "ELA") {
                if (scaleScore >= 100 && scaleScore <= 164) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 165 && scaleScore <= 201) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 202 && scaleScore <= 241) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 242 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "READING") {
                if (scaleScore >= 100 && scaleScore <= 165) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 166 && scaleScore <= 203) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 204 && scaleScore <= 230) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 231 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "MATH") {
                if (scaleScore >= 100 && scaleScore <= 171) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 172 && scaleScore <= 205) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 206 && scaleScore <= 232) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 233 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "SCIENCE") {
                if (scaleScore >= 100 && scaleScore <= 163) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 164 && scaleScore <= 210) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 211 && scaleScore <= 238) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 239 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
        }

        if (row.getField("GRADE") == 10) {
            if (testMetadata.FIELD === "ENGLISH") {
                if (scaleScore >= 100 && scaleScore <= 160) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 161 && scaleScore <= 199) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 200 && scaleScore <= 244) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 245 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "STEM") {
                if (scaleScore >= 100 && scaleScore <= 160) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 161 && scaleScore <= 199) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 200 && scaleScore <= 244) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 245 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "COMPOSITE") {
                if (scaleScore >= 100 && scaleScore <= 160) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 161 && scaleScore <= 199) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 200 && scaleScore <= 244) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 245 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "ELA") {
                if (scaleScore >= 100 && scaleScore <= 160) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 161 && scaleScore <= 199) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 200 && scaleScore <= 244) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 245 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "READING") {
                if (scaleScore >= 100 && scaleScore <= 174) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 175 && scaleScore <= 203) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 204 && scaleScore <= 234) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 235 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "MATH") {
                if (scaleScore >= 100 && scaleScore <= 180) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 181 && scaleScore <= 209) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 210 && scaleScore <= 235) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 236 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
            if (testMetadata.FIELD === "SCIENCE") {
                if (scaleScore >= 100 && scaleScore <= 167) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                    score["TEST_PRIMARY_RESULT"] = "Below Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 168 && scaleScore <= 212) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                    score["TEST_PRIMARY_RESULT"] = "Approaching Proficient";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                else if (scaleScore >= 213 && scaleScore <= 238) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                    score["TEST_PRIMARY_RESULT"] = "Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if (scaleScore >= 239 && scaleScore <= 300) {
                    score["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                    score["TEST_PRIMARY_RESULT"] = "Highly Proficient";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
            }
        }


        if (!isNaN(sem)) {
            if(sem <= 9999.9999){
                score["TEST_STANDARD_ERROR"] = sem;
            }
        }

        if (!isNaN(theta)) {
            score["TEST_Z_SCORE"] = theta;
        }
        return score;
    }


    function collectPredictedScore(row, testMetadata, signature) {
        var score = {};

        if (signature.getFormat().getFormatName() == "UT_UTAH_ASPIRE18") {
            return null;
        }

        var testNumber = testMetadata.TEST + '_' + testMetadata.CODE;
        var predictedScore = row.getField(testMetadata.FIELD + "PREDICTEDACTSCORE");
        var low = row.getField(testMetadata.FIELD + "PREDICTEDACTSCORERANGELOW");
        var high = row.getField(testMetadata.FIELD + "PREDICTEDACTSCORERANGEHIGH");
        var achievLevel = row.getField(testMetadata.FIELD + "PROFICIENCYLEVEL");


        // Check for key fields and do not map score and exit if conditions met.
        if (predictedScore === null || predictedScore === undefined || _util.trim(predictedScore) === "--" || _util.trim(predictedScore) === "") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = predictedScore;

        if (!isNaN(predictedScore)) {
            score["TEST_SCORE_VALUE"] = predictedScore;
            score["TEST_SCALED_SCORE"] = predictedScore;
            if(predictedScore>=18 && testMetadata.FIELD == "COMPOSITE"){
                score["TEST_PRIMARY_RESULT_CODE"] = "OT";
                score["TEST_PRIMARY_RESULT"] = "On Target";
                score["TEST_PASSED_INDICATOR"] = "Yes";
            }
            else if(predictedScore>=18 && testMetadata.FIELD == "ENGLISH"){
                score["TEST_PRIMARY_RESULT_CODE"] = "OT";
                score["TEST_PRIMARY_RESULT"] = "On Target";
                score["TEST_PASSED_INDICATOR"] = "Yes";
            }
            else if(predictedScore>=22 && testMetadata.FIELD == "READING"){
                score["TEST_PRIMARY_RESULT_CODE"] = "OT";
                score["TEST_PRIMARY_RESULT"] = "On Target";
                score["TEST_PASSED_INDICATOR"] = "Yes";
            }
            else if(predictedScore>=22 && testMetadata.FIELD == "MATH"){
                score["TEST_PRIMARY_RESULT_CODE"] = "OT";
                score["TEST_PRIMARY_RESULT"] = "On Target";
                score["TEST_PASSED_INDICATOR"] = "Yes";
            }
            else if(predictedScore>=23 && testMetadata.FIELD == "SCIENCE"){
                score["TEST_PRIMARY_RESULT_CODE"] = "OT";
                score["TEST_PRIMARY_RESULT"] = "On Target";
                score["TEST_PASSED_INDICATOR"] = "Yes";
            }
            else{
                score["TEST_PRIMARY_RESULT_CODE"] = "NOT";
                score["TEST_PRIMARY_RESULT"] = "Not on Target";
                score["TEST_PASSED_INDICATOR"] = "No";
            }
        }


        score["TEST_LOWER_BOUND"] = low;
        score["TEST_UPPER_BOUND"] = high;

        return score;
    }

    function collectScore(row, testMetadata, itr, signature) {
        var score = {};

        if (signature.getFormat().getFormatName() == "UT_UTAH_ASPIRE18") {
            return null;
        }

        var testNumber = generateTestNumber(row, testMetadata) + "_" + itr;

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "SCALESCORERC" + itr));
        var rawScore = _util.coalesce(row.getField(testMetadata.FIELD + "RAWSCORERC" + itr));
        var theta = _util.coalesce(row.getField(testMetadata.FIELD + "THETASCORERC" + itr));
        var scaleSEM = _util.coalesce(row.getField(testMetadata.FIELD + "SCALESCORECSEMRC" + itr));
        // Check for key fields and do not map score and exit if conditions met.
        if ((rawScore === null || rawScore === "#NULL!" || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")
            && (scaleScore === null || scaleScore === "#NULL!" || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
            && (theta === null || theta === "#NULL!" || theta === undefined || _util.trim(theta) === "--" || _util.trim(theta) === "")
            && (scaleSEM === null || scaleSEM === "#NULL!" || scaleSEM === undefined || _util.trim(scaleSEM) === "--" || _util.trim(scaleSEM) === "")) {
            return null;
        }

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

        if (scaleSEM && !isNaN(scaleSEM) && scaleSEM <= 9999.9999) {
            score["TEST_STANDARD_ERROR"] = scaleSEM;
        }

        return score;
    }

    function collectOvrallScore(row, testMetadata, signature) {
        var score = {};

        if (signature.getFormat().getFormatName() == "UT_UTAH_ASPIRE21") {
            return null;
        }

        var subject = row.getField("SUBJECTAREA");
        if (subject === 'English') {
            subName = 'ENG_SCALE';
        } else if (subject === 'Math') {
            subName = 'MA_SCALE';
        } else if (subject === 'Reading') {
            subName = 'RED_SCALE';
        } else if (subject === 'Science') {
            subName = 'SCI_SCALE';
        } else if (subject === 'STEM') {
            subName = 'STEM_SCALE';
        } else if (subject === 'ELA') {
            subName = 'ELA_SCALE';
        } else if (subject === 'Composite') {
            subName = 'COMP_SCALE';
        } else if (subject == null || subject == '') {
            subName = 'OVR_SCALE';
        }

        var testNumber = testMetadata.TEST + '_' + subName;

        var scaleScore = row.getField("SCALESCORE");
        var sem = row.getField("SCALESCORECSEM");
        var prof = row.getField("PROFICIENCYLEVEL");
        var rawScore = row.getField("RAWSCORE");
        var theta = row.getField("THETASCORE");
        var predictedAct = row.getField("PREDICTEDACT");
        var predictedActlabel = row.getField("PREDICTEDACTLABEL");

        //        // Check for key fields and do not map score and exit if conditions met.
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
        var test = score["TEST_SCORE_VALUE"];

        if (!isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
        }

        score["TEST_SECONDARY_RESULT_CODE"] = row.getField("PROFICIENCYLEVEL"); //EX 2
        score["TEST_SECONDARY_RESULT"] = perfDecode[row.getField("PROFICIENCYLEVEL")]; //EX Level 2

        score["TEST_PRIMARY_RESULT_CODE"] = prof;//EX 2
        score["TEST_PRIMARY_RESULT"] = profDecode[prof].DESC;
        score["TEST_PASSED_INDICATOR"] = profDecode[prof].PASS_IND;

        score["TEST_CUSTOM_RESULT_CODE"] = predictedAct;
        score["TEST_CUSTOM_RESULT"] = predictedActlabel;

        if (row.getField("RECORDTYPELABEL") == "Predicted ACT Score by subject" ||
            row.getField("RECORDTYPELABEL") == "Predicted ACT Composite Score") {
            score["TEST_PRIMARY_RESULT_CODE"] = row.getField("PROFICIENCYLEVEL");
        }

        if (!isNaN(sem) && sem <= 9999.9999) {
            score["TEST_STANDARD_ERROR"] = sem;
        }

        if (!isNaN(theta)) {
            score["TEST_Z_SCORE"] = theta;
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

    // function to generate TestNumber
    function generateTestNumber(row, testMetadata) {

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

        return testNumber;

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

    return module;
}());