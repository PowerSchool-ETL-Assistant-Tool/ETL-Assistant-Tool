var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "EOC_EOG";
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
            print(`Loading using signature file ${signatureFormatName}\n`);


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
                        if (mappingObject.ERROR_MESSAGE) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                                file.getFilePath(),
                                "WARNING",
                                row.LINEAGE_LINE,
                                mappingObject.ERROR_MESSAGE,
                                JSON.stringify(row)
                            ));
                        } else if (mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                                file.getFilePath(),
                                "WARNING",
                                row.LINEAGE_LINE,
                                "No scores found./Improper Grades",
                                JSON.stringify(row)
                            ));
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
        { TEST: "EOC", CODE: "TOT", FIELD: "SUB", MAP_FUNCTION: mapScoreNameEOC },
        { TEST: "EOC", CODE: "TOT", FIELD: "", MAP_FUNCTION: mapEOCScaledScore },
        { TEST: "EOG", CODE: "TOT", FIELD: "SUB", MAP_FUNCTION: mapScoreNameEOG },
        { TEST: "EOG", CODE: "TOT", FIELD: "", MAP_FUNCTION: mapEOGScaledScore },
        { TEST: "BOG", CODE: "TOT", FIELD: "", MAP_FUNCTION: mapBOGScaledScore },
        { TEST: "BOG", CODE: "TOT_RD", FIELD: "BOG_RD", MAP_FUNCTION: mapBOGScores },
        { TEST: "EOC", CODE: "TOT", FIELD: "", MAP_FUNCTION: mapNCEXTENDandEOC },
        { TEST: "EOC", CODE: "TOT", FIELD: "PC_M1", MAP_FUNCTION: mapEOCCombinedScaleScores },
        { TEST: "EOC", CODE: "TOT", FIELD: "PC_M3", MAP_FUNCTION: mapEOCCombinedScaleScores },
        { TEST: "EOC", CODE: "TOT", FIELD: "PC_BI", MAP_FUNCTION: mapEOCCombinedScaleScores },
        { TEST: "EOC", CODE: "TOT", FIELD: "PC_E2", MAP_FUNCTION: mapEOCCombinedScaleScores },

        { TEST: "EOC", CODE: "_TOT_BIO", FIELD: "BIOLOGY_EOC_", MAP_FUNCTION: mapEOCCombinedScaleScores },
        { TEST: "EOC", CODE: "_TOT_ENG_II", FIELD: "ENGLISHII_EOC_", MAP_FUNCTION: mapEOCCombinedScaleScores },
        { TEST: "EOC", CODE: "_TOT_MA_I", FIELD: "MATHI_EOC_", MAP_FUNCTION: mapEOCCombinedScaleScores },
        { TEST: "EOC", CODE: "_TOT_MA_3", FIELD: "MATHIII_EOC_", MAP_FUNCTION: mapEOCCombinedScaleScores },


        { TEST: "EOG", CODE: "TOT", FIELD: "MA", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "RD", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "BEG_RD", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "SCI", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "", MAP_FUNCTION: mapEOGCombinedScaleScores },

        { TEST: "EOG", CODE: "TOT", FIELD: "RD3B", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "RD03", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "LTG_RD", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "LTG_MA", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "LTG_SC", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "PC_RD", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "PC_MA", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "PC_SC", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "PC_M1", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "PC_M3", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "PC_BI", MAP_FUNCTION: mapEOGCombinedScaleScores },
        { TEST: "EOG", CODE: "TOT", FIELD: "PC_E2", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "LANG", FIELD: "LANGUAGE", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "RD_LIT", FIELD: "READ_LITERATURE", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "RD_INFO", FIELD: "READ_INFORMATION", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "CALC_INACT", FIELD: "CALC_INACTIVE", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "CALC_ACT", FIELD: "CALC_ACTIVE", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "OP_ALG_THINK", FIELD: "OPERATIONS_ALG_THINK", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "NUM_OPS_B10", FIELD: "NUM_OPS_BASE_10", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "NUM_OPS_FRAC", FIELD: "NUM_OPS_FRACTIONS", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "MEAS_DATA", FIELD: "MEASUREMENT_AND_DATA", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "GEO", FIELD: "GEOMETRY", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "STAT_PROB", FIELD: "STAT_PROBABILITY", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "GRID_ITEMS", FIELD: "GRIDDED_ITEMS", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "RAT_PROP_REL", FIELD: "RATIOS_PROP_RELATION", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "NUM_SYS", FIELD: "THE_NUMBER_SYSTEM", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "EXP_EQUA", FIELD: "EXPRESSIONS_EQUATION", MAP_FUNCTION: mapEOGCombinedScaleScores }
        , { TEST: "EOG", CODE: "FUNCTNS", FIELD: "FUNCTIONS", MAP_FUNCTION: mapEOGCombinedScaleScores }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
        "0": "KG",
        "-5": "PreK 0",
        "-4": "PreK 1",
        "-3": "PreK 2",
        "-2": "PreK 3",
        "-1":"PreK 4",
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
        "13": "13",
        "Grade 13": "13",
        "-9": "ALT",
        "-6": "ALT",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
        , "": null
        , null: null
    };


    var primaryDecode = {
        "Level 1": "Level 1"
        , "Level 2": "Level 2"
        , "Level 3": "Level 3"
        , "Level 4": "Level 4"
        , "Level 5": "Level 5"
        , "Not Proficient": "Not Proficient"
        , "I": "Level 1"
        , "II": "Level 2"
        , "III": "Level 3"
        , "IV": "Level 4"
        , "V": "Level 5"
        , "1": "Level 1"
        , "2": "Level 2"
        , "3": "Level 3"
        , "4": "Level 4"
        , "5": "Level 5"
        , "H": "exemption or n/a"
        , "A": "exemption or n/a"
        , "G": "exemption or n/a"
        , "S": "exemption or n/a"
        , "N/A": "exemption or n/a"
        , "B": "exemption or n/a"
        , "M": "exemption or n/a"
        , "H`": "exemption or n/a"
        , "n/a": "exemption or n/a"
        , "Covid-19/Exempt": "exemption or n/a"
        , "Covid-19-Exempt": "exemption or n/a"
        , "Q": "exemption or n/a"
        , "": null
        , null: null
    }

    var primaryRecode = {
        "Level 1": "1"
        , "Level 2": "2"
        , "Level 3": "3"
        , "Level 4": "4"
        , "Level 5": "5"
        , "1": "1"
        , "2": "2"
        , "3": "3"
        , "4": "4"
        , "5": "5"
        , "I": "1"
        , "II": "2"
        , "III": "3"
        , "IV": "4"
        , "V": "5"
        , "Not Proficient": "0"
        , "": null
        , null: null
    };

    var passDecode = {
        "Level 5": "Yes"
        , "Level 4": "Yes"
        , "Level 3": "Yes"
        , "Level 1": "No"
        , "Level 2": "No"
        , "Not Proficient": "No"
        , "": null
        , null: null
    };

    var MeetsCareerAndCollegeReadiness = {
        "Level 5": "College Ready"
        , "Level 4": "College Ready"
        , "Level 3": "Not College Ready"
        , "Level 1": "Not College Ready"
        , "Level 2": "Not College Ready"
        , "5": "College Ready"
        , "4": "College Ready"
        , "3": "Not College Ready"
        , "1": "Not College Ready"
        , "2": "Not College Ready"
        , "I": "Not College Ready"
        , "II": "Not College Ready"
        , "III": "Not College Ready"
        , "IV": "College Ready"
        , "V": "College Ready"
        , "Not Proficient": "Not College Ready"
        , "": null
        , null: null
    }
//For new years after XXXX, use this decode
    var newPrimaryDecode = {
            "Level 1": "Not Proficient"
            , "Level 2": "Not Proficient"
            , "Level 3": "Level 3"
            , "Level 4": "Level 4"
            , "Level 5": "Level 5"
            , "Not Proficient": "Not Proficient"
            , "I": "Not Proficient"
            , "II": "Not Proficient"
            , "III": "Level 3"
            , "IV": "Level 4"
            , "V": "Level 5"
            , "1": "Not Proficient"
            , "2": "Not Proficient"
            , "3": "Level 3"
            , "4": "Level 4"
            , "5": "Level 5"
            , "H": "exemption or n/a"
            , "A": "exemption or n/a"
            , "G": "exemption or n/a"
            , "S": "exemption or n/a"
            , "N/A": "exemption or n/a"
            , "B": "exemption or n/a"
            , "M": "exemption or n/a"
            , "H`": "exemption or n/a"
            , "n/a": "exemption or n/a"
            , "Covid-19/Exempt": "exemption or n/a"
            , "Covid-19-Exempt": "exemption or n/a"
            , "Q": "exemption or n/a"
            , "": null
            , null: null
    }
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature, hierarchy);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch (exception) {
                mappingObject.ERROR_MESSAGE = exception.message;
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
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var dataFileName = row.getRawField("LINEAGE_FILE").toString();
        var period = getTEST_ADMIN_PERIOD(row, hierarchy);
        var testDate = adminDate(row, hierarchy);
        var periodBackupDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5);//SPRING and ALL periods

        if (period === "WINTER") {
            periodBackupDate = '01/15/' + hierarchy.SCHOOL_YEAR.substring(5);
        }
        if (period === "FALL") {
            periodBackupDate = '09/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4);
        }
        if (period === "SUMMER") {
            periodBackupDate = '06/15/' + hierarchy.SCHOOL_YEAR.substring(5);
        }


        var birthDateObject;

        if (row.getField("BIRTHMONTH") !== null && row.getField("BIRTHDAY") !== null && row.getField("BIRTHYEAR") !== null) {
            //var birthDate = row.getField("BIRTHMONTH") + "/" + row.getField("BIRTHDAY") + "/" + row.getField("BIRTHYEAR");
            var month = row.getField("BIRTHMONTH");
            var day = row.getField("BIRTHDAY");
            var year = row.getField("BIRTHYEAR");

            month.length < 2 ? month += "0" : month = month;
            day.length < 2 ? day += "0" : day = day;


            var birthDate = month + "/" + day + "/" + year;
            birthDateObject = mapDateObject(hierarchy, row, birthDate, row.getField("BIRTHYEAR"), row.getField("BIRTHMONTH"), row.getField("BIRTHDAY"));
        }


        var date = row.getField("DOB");
          if (signature.getFormat().getFormatName() === 'AUTOMATION_26_1_COLS' || signature.getFormat().getFormatName() === 'AUTOMATION_36_1_COLS' && (date !== null && date !== undefined)){
            birthDateObject = AppUtil.getDateObjByPattern(date, "yyyy-MM-dd");
          }else{
        birthDateObject = AppUtil.getDateObjByPattern(date, "yyyyMMdd");
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
                    record.REPORTING_PERIOD = _util.coalesce(period, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDate, periodBackupDate);
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
                //Student Information : Student_Number
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("STUDENT_NUMBER");
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID =
                        row.getField("STUDENT_NUMBER");
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("STUDENT_NUMBER");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('MIDDLE_NAME');
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField('GRADE_LEVEL'), row.getField('TESTED_GRADE_LEVEL'), row.getField("ASSIGNEDGRADE"), gradeLevelFromTestForm(row.getField("TESTFORM")), gradeLevelFromFileName(dataFileName))];
                    break;
                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOLID"), row.getField("SCHOOLNAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOLID"), row.getField("SCHOOLNAME"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOLID"), row.getField("SCHOOLNAME"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), row.getField("SCHOOLNAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("SEX"),row.getField("GENDER"), "").substring(0,1);
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

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapEOCScaledScore(row, testMetadata, signature,hierarchy) {
        try {
            if ((row.getField("TESTFORM") && row.getField("TESTFORM").indexOf("BOG") > -1)) {
                return null;
            }
            if (row.getField("ALPHASCORE") === "NA" || row.getField("ALPHASCORE") === null || row.getField("ALPHASCORE") === "N/A" || row.getField("ALPHASCORE") === "" ||
                row.getField("ALPHASCORE") === "G" || row.getField("ALPHASCORE") === "H" || row.getField("ALPHASCORE") === "M" || row.getField("ALPHASCORE") === "A" ||
                row.getField("TESTED_GRADE_LEVEL") === 810 || row.getField("TESTED_GRADE_LEVEL") === 0 ||
                row.getField("GRADE_LEVEL") === 810 || row.getField("GRADE_LEVEL") === 0) {
                return null;
            }
            var score = {};
            var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
            var achievLevel = _util.trim(row.getField("ALPHASCORE"));

            //setting test_number based on subject in test_name
            //FILES THAT HAVE NO TEST_NAME -> using signature format to differentiate
            let testName = row.getField("TEST_NAME");
            var fileName = signature.getFormat().getFormatName().toString().toUpperCase();
            var scaleScore = row.getField("SCALE_SCORE");
            var pointConvScore100 = row.getField("100POINTCONVSCORE");
            var pctl = row.getField("PCTL");
            if (testName === null) {
                if (fileName.toString().indexOf("EOC") === -1) {
                    return null;
                }
                if (row.getField("GRADE_LEVEL") === null) {
                    if (fileName.toString().indexOf("BIO") !== -1) {
                        testNumber = testNumber + "_BIO";
                    } else if (fileName.toString().indexOf("MATH_I") !== -1) {
                        testNumber = testNumber + "_MA_I";
                    } else if (fileName.toString().indexOf("MATH3") !== -1) {
                        testNumber = testNumber + "_MA_3";
                    } else if (fileName.toString().indexOf("ENGLISH")) {
                        testNumber = testNumber + "_ENG_II";
                    } else if (fileName.toString().indexOf("BIOLOGY") !== -1) {
                        testNumber = testNumber + "_BIO";
                    }
                }
                else {
                    if (fileName.toString().indexOf("BIO") !== -1) {
                        testNumber = testNumber + "_" + row.getField("GRADE_LEVEL") + "_BIO";
                    } else if (fileName.toString().indexOf("MATH_I") !== -1) {
                        testNumber = testNumber + "_" + row.getField("GRADE_LEVEL") + "_MA_I";
                    } else if (fileName.toString().indexOf("MATH3") !== -1) {
                        testNumber = testNumber + "_" + row.getField("GRADE_LEVEL") + "_MA_3";
                    } else if (fileName.toString().indexOf("ENGLISH")) {
                        testNumber = testNumber + "_" + row.getField("GRADE_LEVEL") + "_ENG_II";
                    } else if (fileName.toString().indexOf("BIOLOGY") !== -1) {
                        testNumber = testNumber + "_" + row.getField("GRADE_LEVEL") + "_BIO";
                    }
                }
            } else {
                if (testName && testName.toString().indexOf("EOC") === -1) {
                    return null;
                }
                //some files have achievLevel between 1-5 , that case is not part of this else statement(being set in the if statement above)
                if (testName && testName.toString().indexOf("Biology") !== -1) {
                    testNumber = testNumber + "_" + row.getField("TESTED_GRADE_LEVEL") + "_BIO";
                    if (achievLevel <= 249) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 250 && achievLevel <= 251) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 252 && achievLevel <= 260) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 261) {
                        achievLevel = 'Level 5';
                    }
                } else if (testName && testName.toString().indexOf("Math I") !== -1) {
                    testNumber = testNumber + "_" + row.getField("TESTED_GRADE_LEVEL") + "_MA_I";
                    if (achievLevel <= 547) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 548 && achievLevel <= 554) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 555 && achievLevel <= 562) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 563) {
                        achievLevel = 'Level 5';
                    }
                } else if (testName && testName.toString().indexOf("Math 3") !== -1) {
                    testNumber = testNumber + "_" + row.getField("TESTED_GRADE_LEVEL") + "_MA_3";
                    if (achievLevel <= 549) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 550 && achievLevel <= 555) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 556 && achievLevel <= 562) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 563) {
                        achievLevel = 'Level 5';
                    }
                } else if (testName && testName.toString().indexOf("English") !== -1) {
                    testNumber = testNumber + "_" + row.getField("TESTED_GRADE_LEVEL") + "_ENG_II";
                    if (achievLevel <= 548) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 549 && achievLevel <= 554) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 555 && achievLevel <= 564) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 565) {
                        achievLevel = 'Level 5';
                    }
                }

            }


            // Check for key fields and do not map score and exit if conditions met.
            if (achievLevel === undefined || achievLevel === "--" || achievLevel === "") {
                return null;
            }

            let lexile = row.getField("REPORTEDLEXILE");
            let quantile = _util.coalesce(row.getField("QUANTILE"), row.getField("REPORTEDQUANTILE"));

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = achievLevel;
            if (!isNaN(scaleScore)) {
                score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievLevel]];
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
                score["TEST_SCORE_TEXT"] = achievLevel;
                score["TEST_PERCENTILE_SCORE"] = pctl;
            if(hierarchy.SCHOOL_YEAR.substring(5) >'2019'){
                score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];
                score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
            } else {
                score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievLevel]];
               score["TEST_PRIMARY_RESULT_CODE"] = primaryRecode[achievLevel];
               score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel];
            }

                if (lexile) {
                    score["TEST_READING_LEVEL"] = lexile.replace("BR", "").replace("L", "");
                }
                if (quantile) {
                    score["TEST_TERTIARY_RESULT"] = quantile;
                    score["TEST_TERTIARY_RESULT_CODE"] = "QUANTILE";
                }
            } else {
                if (primaryDecode[achievLevel] === "exemption or n/a") {
                    return null;
                }

               if(hierarchy.SCHOOL_YEAR.substring(5) >'2019'){
                score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];
                score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
               } else {
                score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievLevel]];
                score["TEST_PRIMARY_RESULT_CODE"] = primaryRecode[achievLevel];
                score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel];
               }
                score["TEST_SCORE_VALUE"] = primaryRecode[achievLevel];
                score["TEST_SCALED_SCORE"] = primaryRecode[achievLevel];
                score["TEST_SECONDARY_RESULT_CODE"] = "CCR";
                score["TEST_SECONDARY_RESULT"] = MeetsCareerAndCollegeReadiness[achievLevel];
                score["TEST_PERCENTILE_SCORE"] = pctl;
                if (lexile) {
                    score["TEST_READING_LEVEL"] = lexile.replace("BR", "").replace("L", "");
                }
                if (quantile) {
                    score["TEST_TERTIARY_RESULT"] = quantile;
                    score["TEST_TERTIARY_RESULT_CODE"] = "QUANTILE";
                }
            }
            if (pointConvScore100) {
                score["TEST_RAW_SCORE"] = pointConvScore100;
            }
            return score;
        } catch (e) {
            print(e);
        }
    }

    function mapEOGScaledScore(row, testMetadata, signature,hierarchy) {
        if ((row.getField("TESTFORM") && row.getField("TESTFORM").indexOf("BOG") > -1) ||
            (row.getField("TESTFORM") && row.getField("TESTFORM").indexOf("BIOL") > -1)) {
            return null;
        }
        if (row.getField("ALPHASCORE") === "NA" || row.getField("ALPHASCORE") === null || row.getField("ALPHASCORE") === "N/A" || row.getField("ALPHASCORE") === "" ||
            row.getField("ALPHASCORE") === "G" || row.getField("ALPHASCORE") === "H" || row.getField("ALPHASCORE") === "M" || row.getField("ALPHASCORE") === "A" ||
            row.getField("TESTED_GRADE_LEVEL") === 810 || row.getField("TESTED_GRADE_LEVEL") === 0 ||
            row.getField("GRADE_LEVEL") === 810 || row.getField("GRADE_LEVEL") === 0) {
            return null;
        }
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var achievLevel = row.getField("ALPHASCORE");
        let testName = row.getField("TEST_NAME");
        var fileName = signature.getFormat().getFormatName().toString().toUpperCase();

        var scaleScore = row.getField("SCALE_SCORE");
        var pctl = row.getField("PCTL");
        var grade;
        var dataFileName;

        if (row.getField(testMetadata.FIELD + "_SCALE") !== undefined
            && row.getField(testMetadata.FIELD + "_SCALE") !== null
            && row.getField(testMetadata.FIELD + "_LEVEL") !== null
            && row.getField(testMetadata.FIELD + "_LEVEL") !== undefined
        ) {
            return null;
        }

        if ((testName !== null && testName && (testName.toString().indexOf("EOC") !== -1 || testName.toString().indexOf("End of Course") !== -1)) ||
            (fileName.toString().indexOf("EOC") !== -1 && testName === null)) {
            return null;
        }
        if (testName === null) {
            if (fileName.toString().indexOf("EOG") === -1 && fileName.toString().indexOf("NCEXT") === -1) {
                return null;
            }

            dataFileName = row.getRawField("LINEAGE_FILE").toString().toLowerCase();
            if (row.getField("GRADE_LEVEL") === undefined || row.getField("GRADE_LEVEL") === null) {

                if (row.getField("TESTFORM") !== null) {
                    grade = gradeLevelFromTestForm(row.getField("TESTFORM"));
                } else { grade = gradeLevelFromFileName(dataFileName); }

                if (signature.getFormat().getFormatName() === "NCEXT_1_BIO") {
                    grade = gradeDecode[row.getField("ASSIGNEDGRADE")];
                }

                if (grade === undefined || grade === null || grade === "") {
                    let errorMessage = "Error: mapEOGScaledScore - File Name expected to have grade information/ File should have GRADE_LEVEL column/ GRADE_LEVEL column value is missing: ${dataFileName}";
                    throw new Error(errorMessage);
                }
            }
            if (fileName.toString().indexOf("READ") !== -1) {
                testNumber = testNumber + "_" + grade + "_RD";
            } else if (fileName.toString().indexOf("MATH") !== -1) {
                testNumber = testNumber + "_" + grade + "_MA";
            } else if (fileName.toString().indexOf("SCI") !== -1) {
                testNumber = testNumber + "_" + grade + "_SCI";
            } else if (fileName.toString().indexOf("BIOLOGY") !== -1) {
                testNumber = testNumber + "_" + grade + "_BIO";
            } else if (fileName.toString().indexOf("BIO") !== -1) {
                testNumber = testNumber + "_" + grade + "_BIO";
            } else if (fileName.toString().indexOf("GR11") !== -1){
                testNumber = testNumber + "_" + grade + "_X1Alt";
            } else if (fileName.toString().indexOf("RD") !== -1){
                testNumber = testNumber + "_" + grade + "_RD";
            }

        }
        else {
            //setting test_number based on subject in test_name
            if ((testName !== null && testName && testName.toString().indexOf("EOC") !== -1) ||
                (fileName.toString().indexOf("EOC") !== -1 && testName === null)) {
                return null;
            }
            //some files have achievLevel between 1-5 , that case is not part of this else statement(being set in the if statement above)
            if (testName !== null && testName && testName.toString().indexOf("Science") !== -1) {
                testNumber = testNumber + "_" + row.getField("TESTED_GRADE_LEVEL") + "_SCI";
                if (row.getField("TESTED_GRADE_LEVEL") === '5') {
                    if (achievLevel <= 248) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 249 && achievLevel <= 251) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 252 && achievLevel <= 262) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 263) {
                        achievLevel = 'Level 5';
                    }
                }

                if (row.getField("TESTED_GRADE_LEVEL") === '8') {
                    if (achievLevel <= 244) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 245 && achievLevel <= 247) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 248 && achievLevel <= 259) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 260) {
                        achievLevel = 'Level 5';
                    }
                }
            }
            else if (testName !== null && testName && testName.toString().indexOf("Math") !== -1) {
                testNumber = testNumber + "_" + row.getField("TESTED_GRADE_LEVEL") + "_MA";
                if (row.getField("TESTED_GRADE_LEVEL") === '3') {
                    if (achievLevel <= 544) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 545 && achievLevel <= 550) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 551 && achievLevel <= 559) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 560) {
                        achievLevel = 'Level 5';
                    }
                }

                if (row.getField("TESTED_GRADE_LEVEL") === '4') {
                    if (achievLevel <= 546) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 547 && achievLevel <= 551) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 552 && achievLevel <= 559) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 560) {
                        achievLevel = 'Level 5';
                    }
                }

                if (row.getField("TESTED_GRADE_LEVEL") === '5' || row.getField("TESTED_GRADE_LEVEL") === '6' || row.getField("TESTED_GRADE_LEVEL") === '7') {
                    if (achievLevel <= 545) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 546 && achievLevel <= 550) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 551 && achievLevel <= 560) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 561) {
                        achievLevel = 'Level 5';
                    }
                }

                if (row.getField("TESTED_GRADE_LEVEL") === '8') {
                    if (achievLevel <= 542) {
                        achievLevel = 'Not Proficient';
                    } else if (achievLevel >= 543 && achievLevel <= 547) {
                        achievLevel = 'Level 3';
                    } else if (achievLevel >= 548 && achievLevel <= 554) {
                        achievLevel = 'Level 4'
                    } else if (achievLevel >= 555) {
                        achievLevel = 'Level 5';
                    }
                }
            } else if (testName !== null && testName && testName.toString().indexOf("Beginning") !== -1) {
                testNumber = testNumber + "_" + row.getField("TESTED_GRADE_LEVEL") + "_BEG_RD";
                achievLevel = readingLevelMapping(row.getField("TESTED_GRADE_LEVEL"), achievLevel);
            } else if (testName !== null && testName && testName.toString().indexOf("Reading") !== -1) {
                testNumber = testNumber + "_" + row.getField("TESTED_GRADE_LEVEL") + "_RD";
                achievLevel = readingLevelMapping(row.getField("TESTED_GRADE_LEVEL"), achievLevel);
            }

        }
        // Check for key fields and do not map score and exit if conditions met.
        if (achievLevel === null || achievLevel === undefined || _util.trim(achievLevel) === "--" || _util.trim(achievLevel) === "") {
            return null;
        }

        let lexile = row.getField("REPORTEDLEXILE");
        let quantile = _util.coalesce(row.getField("QUANTILE"), row.getField("REPORTEDQUANTILE"));
        try {
            achievLevel = _util.trim(achievLevel);
            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = achievLevel;

            if (primaryDecode[achievLevel] === "exemption or n/a") {
                return null;
            }
            if (!isNaN(pctl)) {
                score["TEST_PERCENTILE_SCORE"] = pctl;
            }
            if (lexile) {
                score["TEST_READING_LEVEL"] = lexile.replace("BR", "").replace("L", "");
            }
            if (quantile) {
                score["TEST_TERTIARY_RESULT"] = quantile;
                score["TEST_TERTIARY_RESULT_CODE"] = "QUANTILE";
            }

            if(hierarchy.SCHOOL_YEAR.substring(5) >'2019'){
                score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];
                score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
            } else {
                score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievLevel]];
                score["TEST_PRIMARY_RESULT_CODE"] = primaryRecode[achievLevel];
                score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel];
            }
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        catch (e) {
            print(e + "\n");
        }
        return score;
    }


    function mapScoreNameEOG(row, testMetadata, signature,hierarchy) {
        if (row.getField("TEST_NAME") && (row.getField("TEST_NAME").indexOf("EOC") > -1 ||
            row.getField("TEST_NAME").indexOf("End of Course") > -1)) {
            return null;
        }
        if (row.getField("ALPHASCORE") === "NA" || row.getField("ALPHASCORE") === null || row.getField("ALPHASCORE") === "N/A" || row.getField("ALPHASCORE") === "" ||
            row.getField("ALPHASCORE") === "G" || row.getField("ALPHASCORE") === "H" || row.getField("ALPHASCORE") === "M" || row.getField("ALPHASCORE") === "A" ||
            row.getField("TESTED_GRADE_LEVEL") === 810 || row.getField("TESTED_GRADE_LEVEL") === 0 ||
            row.getField("GRADE_LEVEL") === 810 || row.getField("GRADE_LEVEL") === 0) {
            return null;
        }

        var score = {};
        var testName = row.getField("TEST_NAME");
        var scoreName = row.getField("SCORE_NAME");
        var achievLevel = row.getField("ALPHASCORE");
        var testNumber;
        var fileName = signature.getFormat().getFormatName();
        var achievementLevel;
        var percentile;
        var scaleScoreName;
        //generate testnumbers based on ScoreName
        if (testName !== null && testName.toString().indexOf("Science") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_SCI" + "_ACHLVL";
        }
        else if (testName !== null && testName.toString().indexOf("Science") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_SCI" + "_PERC";
        }
        else if (testName !== null && testName.toString().indexOf("Science") > -1 && scoreName.toString().indexOf("Scale") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_SCI" + "_SCALE";
        }
        else if (testName !== null && testName.toString().indexOf("Math") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_MA" + "_ACHLVL";
        }
        else if (testName !== null && testName.toString().indexOf("Math") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_MA" + "_PERC";
        }
        else if (testName !== null && testName.toString().indexOf("Math") > -1 && scoreName.toString().indexOf("Scale") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_MA" + "_SCALE";
        }
        else if (testName !== null && testName.toString().indexOf("Beginning") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_BEG_RD" + "_ACHLVL";
        }
        else if (testName !== null && testName.toString().indexOf("Beginning") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_BEG_RD" + "_PERC";
        }
        else if (testName !== null && testName.toString().indexOf("Beginning") > -1 && scoreName.toString().indexOf("Scale") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_BEG_RD" + "_SCALE";
        }
        else if (testName !== null && testName.toString().indexOf("Reading") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_RD" + "_ACHLVL";
        }
        else if (testName !== null && testName.toString().indexOf("Reading") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_RD" + "_PERC";
        }
        else if (testName !== null && testName.toString().indexOf("Reading") > -1 && scoreName.toString().indexOf("Scale") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_RD" + "_SCALE";
        }
         else if (testName !== null && testName.toString().indexOf("Read-to-Achieve") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
                  testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_RTA" + "_ACHLVL";
         }
         else if (testName !== null && testName.toString().indexOf("Read-to-Achieve") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                  testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_RTA" + "_PERC";
         }
         else if (testName !== null && testName.toString().indexOf("Read-to-Achieve") > -1 && scoreName.toString().indexOf("Scale") > -1) {
                  testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_" + row.getField("TESTED_GRADE_LEVEL") + "_RTA" + "_SCALE";
         }



        if (fileName === "EOC_EOG") {
            if ((scoreName === "Achievement Level") || (scoreName.toString().indexOf("Achieve_Lev") > -1) || (scoreName.toString().indexOf("Achievement_Level") > -1)) {

                achievementLevel = achievLevel;
            }
            else if (scoreName === "Percentile" || (scoreName.toString().indexOf("Percentile") > -1)) {
                percentile = achievLevel;
            }
            else if (scoreName === "Scale Score" || (scoreName.toString().indexOf("Scale") > -1)) {
                scaleScoreName = achievLevel;
            }
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScoreName;

            if (primaryDecode[achievLevel] === "exemption or n/a") {
                return null;
            }

            if (achievementLevel !== null && achievementLevel !== undefined && achievementLevel !== "NA") {
            if(hierarchy.SCHOOL_YEAR.substring(5) >'2019'){
                score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];

                score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
            } else {
                score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievementLevel]];
                score["TEST_PRIMARY_RESULT_CODE"] = primaryRecode[achievementLevel];
                score["TEST_PRIMARY_RESULT"] = primaryDecode[achievementLevel];
                }


                score["TEST_SECONDARY_RESULT_CODE"] = "CCR";
                score["TEST_SECONDARY_RESULT"] = MeetsCareerAndCollegeReadiness[achievementLevel];
            }

            if (percentile !== null && percentile !== undefined && percentile !== "NA") {
                score["TEST_PERCENTILE_SCORE"] = percentile;
            }
            if (scaleScoreName !== null && scaleScoreName !== undefined && scaleScoreName !== "NA") {
                score["TEST_SCORE_VALUE"] = scaleScoreName;
                score["TEST_SCALED_SCORE"] = scaleScoreName;
            }

        }
        else {
            return null;
        }
        return score;
    }

    function mapScoreNameEOC(row, testMetadata, signature,hierarchy) {
        if (row.getField("TEST_NAME") && row.getField("TEST_NAME").indexOf("EOC") === -1 &&
            row.getField("TEST_NAME").indexOf("End of Course") === -1) {
            return null;
        }

        if (row.getField("ALPHASCORE") === "NA" || row.getField("ALPHASCORE") === null || row.getField("ALPHASCORE") === "N/A" || row.getField("ALPHASCORE") === "" ||
            row.getField("ALPHASCORE") === "G" || row.getField("ALPHASCORE") === "H" || row.getField("ALPHASCORE") === "M" || row.getField("ALPHASCORE") === "A" ||
            row.getField("TESTED_GRADE_LEVEL") === 810 || row.getField("TESTED_GRADE_LEVEL") === 0 ||
            row.getField("GRADE_LEVEL") === 810 || row.getField("GRADE_LEVEL") === 0) {
            return null;
        }

        var score = {};
        var testName = row.getField("TEST_NAME");
        var scoreName = row.getField("SCORE_NAME");
        var achievLevel = row.getField("ALPHASCORE");
        var testNumber;
        var fileName = signature.getFormat().getFormatName();
        var achievementLevel;
        var percentile;
        var scaleScoreName;

        if (testName !== null && testName.toString().indexOf("Biology") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_BIO" + "_ACHLVL";
        }
        else if (testName !== null && testName.toString().indexOf("Biology") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_BIO" + "_PERC";
        }
        else if (testName !== null && testName.toString().indexOf("Biology") > -1 && scoreName.toString().indexOf("Sc ale") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_BIO" + "_SCALE";
        }
        else if (testName !== null && testName.toString().indexOf("Math I") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_MA_I" + "_ACHLVL";
        }
        else if (testName !== null && testName.toString().indexOf("Math I") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_MA_I" + "_PERC";
        }
        else if (testName !== null && testName.toString().indexOf("Math I") > -1 && scoreName.toString().indexOf("Scale") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_MA_I" + "_SCALE";
        }
        else if (testName !== null && testName.toString().indexOf("Math 3") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_MA_3" + "_ACHLVL";
        }
        else if (testName !== null && testName.toString().indexOf("Math 3") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_MA_3" + "_PERC";
        }
        else if (testName !== null && testName.toString().indexOf("Math 3") > -1 && scoreName.toString().indexOf("Scale") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_MA_3" + "_SCALE";
        }
        else if (testName !== null && testName.toString().indexOf("English II") > -1 && scoreName.toString().indexOf("Achieve") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_ENG_II" + "_" + "_ACHLVL";
        }
        else if (testName !== null && testName.toString().indexOf("English II") > -1 && scoreName.toString().indexOf("Percentile") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_ENG_II" + "_" + "_PERC";
        }
        else if (testName !== null && testName.toString().indexOf("English II") > -1 && scoreName.toString().indexOf("Scale") > -1) {
                 testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.FIELD + "_ENG_II" + "_" + "_SCALE";
        }

        if (fileName === "EOC_EOG") {

            if (scoreName.toUpperCase().indexOf("ACHIEVEMENT") > -1) {
                achievementLevel = achievLevel;
            } else if (scoreName.toUpperCase().indexOf("PERCENTILE") > -1) {
                percentile = achievLevel;
            } else if (scoreName.toUpperCase().indexOf("SCALE") > -1) {
                scaleScoreName = achievLevel;
            }
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScoreName;

            if (primaryDecode[achievLevel] === "exemption or n/a") {
                return null;
            }

            if (achievementLevel !== null && achievementLevel !== undefined) {
            if(hierarchy.SCHOOL_YEAR.substring(5) >'2019'){
                score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];
                score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
            } else {
                 score["TEST_PRIMARY_RESULT"] = primaryDecode[achievementLevel];
                 score["TEST_PRIMARY_RESULT_CODE"] =primaryRecode[achievementLevel];
                 score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievementLevel]];

            }
                score["TEST_SECONDARY_RESULT_CODE"] = "CCR";
                score["TEST_SECONDARY_RESULT"] = MeetsCareerAndCollegeReadiness[achievementLevel];
            }

            if (percentile !== null && percentile !== undefined) {
                score["TEST_PERCENTILE_SCORE"] = percentile;
            }
            if (scaleScoreName !== null && scaleScoreName !== undefined) {
                score["TEST_SCORE_VALUE"] = scaleScoreName;
                score["TEST_SCALED_SCORE"] = scaleScoreName;
            }

        }
        else {
            return null;
        }
        return score;
    }
    function mapBOGScaledScore(row, testMetadata, signature,hierarchy) {
        if (!row.getField("TESTFORM") || (row.getField("TESTFORM") && row.getField("TESTFORM").indexOf("BOG") === -1)) {
            return null;
        }

        if (row.getField("ALPHASCORE") === "NA" || row.getField("ALPHASCORE") === null || row.getField("ALPHASCORE") === "N/A" || row.getField("ALPHASCORE") === "" ||
            row.getField("ALPHASCORE") === "G" || row.getField("ALPHASCORE") === "H" || row.getField("ALPHASCORE") === "M" || row.getField("ALPHASCORE") === "A" ||
            row.getField("TESTED_GRADE_LEVEL") === 810 || row.getField("TESTED_GRADE_LEVEL") === 0 ||
            row.getField("GRADE_LEVEL") === 810 || row.getField("GRADE_LEVEL") === 0) {
            return null;
        }
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var achievLevel = row.getField("ALPHASCORE");
        var fileName = signature.getFormat().getFormatName();
        var scaleScore = row.getField("SCALE_SCORE");
        var pctl = row.getField("PCTL");
        var grade = row.getField("GRADE_LEVEL");
        var lexileScore = row.getField("REPORTEDLEXILE");
        var readinglexile = row.getField("READING_LEXILE");
        var lexile;
        var dataFileName;

        if (row.getField(testMetadata.FIELD + "_SCALE") !== undefined
            && row.getField(testMetadata.FIELD + "_SCALE") !== null
            && row.getField(testMetadata.FIELD + "_LEVEL") !== null
            && row.getField(testMetadata.FIELD + "_LEVEL") !== undefined
        ) {
            return null;
        }
        if (lexileScore) {
            lexile = lexileScore.replace("BR", "").replace("L", "");
        }

        dataFileName = row.getRawField("LINEAGE_FILE").toString().toLowerCase();
        if (grade === undefined || grade === null) {
            grade = gradeLevelFromFileName(dataFileName);

            if (grade === undefined || grade === null || grade === "") {
                if (row.getField("TESTFORM") && row.getField("TESTFORM").indexOf("BOG") !== -1) {
                    grade = gradeLevelFromTestForm(row.getField("TESTFORM"));
                }
                else {
                    let errorMessage = "Error: mapBOGScaledScore - File Name expected to have grade information/ File should have GRADE_LEVEL column/ GRADE_LEVEL column value is missing: ${dataFileName}";
                    throw new Error(errorMessage);
                }
            }
        }
        if (grade !== undefined || grade !== null || grade !== "") {
            testNumber = testNumber + "_" + grade;
        }
        if (fileName.toString().indexOf("READ") !== -1) {
            testNumber = testNumber + "_RD";
        } else if (fileName.toString().indexOf("MATH") !== -1) {
            testNumber = testNumber + "_MA";
        } else if (fileName.toString().indexOf("SCI") !== -1) {
            testNumber = testNumber + "_SCI";
        } else if (fileName.toString().indexOf("BOG") !== -1) {
            if (dataFileName.toString().toUpperCase().indexOf("READ") !== -1) {
                testNumber = testNumber + "_RD";
            } else if (dataFileName.toString().toUpperCase().indexOf("MATH") !== -1) {
                testNumber = testNumber + "_MA";
            } else if (dataFileName.toString().toUpperCase().indexOf("SCI") !== -1) {
                testNumber = testNumber + "_SCI";
            }
        }

        // Check for key fields and do not map score and exit if conditions met.
        if (achievLevel === null || achievLevel === undefined || _util.trim(achievLevel) === "--" || _util.trim(achievLevel) === "") {
            return null;
        }

        try {
            achievLevel = _util.trim(achievLevel);
            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = achievLevel;

            if (primaryDecode[achievLevel] === "exemption or n/a") {
                return null;
            }
            score["TEST_READING_LEVEL"] = lexile;
            score["TEST_SECONDARY_RESULT"] = readinglexile;
            if(hierarchy.SCHOOL_YEAR.substring(5) >'2019'){
                score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];
                score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
            } else {
                 score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel];
                 score["TEST_PRIMARY_RESULT_CODE"] = primaryRecode[achievLevel];
                 score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievLevel]];;

            }

            if (!isNaN(pctl)) {
                score["TEST_PERCENTILE_SCORE"] = pctl;
            }
            if (!isNaN(scaleScore)) {
                score["TEST_SCORE_VALUE"] = scaleScore
                score["TEST_SCALED_SCORE"] = scaleScore;
            } else if (!isNaN(achievLevel)) {
                score["TEST_SCORE_VALUE"] = achievLevel;
                score["TEST_SCALED_SCORE"] = achievLevel;
            } else {
                score["TEST_SCORE_VALUE"] = primaryRecode[achievLevel];
                score["TEST_SCALED_SCORE"] = primaryRecode[achievLevel];
            }
        }
        catch (e) {
            print(e + "\n");
        }
        return score;
    }

    function readingLevelMapping(testGradeLevel, achievLevel) {
        //some files have achievLevel between 1-5 , that case is not part of this function
        if (testGradeLevel === '3') {
            if (achievLevel <= 539) {
                achievLevel = 'Not Proficient';
            } else if (achievLevel >= 540 && achievLevel <= 545) {
                achievLevel = 'Level 3';
            } else if (achievLevel >= 546 && achievLevel <= 550) {
                achievLevel = 'Level 4';
            } else if (achievLevel >= 551) {
                achievLevel = 'Level 5';
            }
        }

        if (testGradeLevel === '4') {
            if (achievLevel <= 543) {
                achievLevel = 'Not Proficient';
            } else if (achievLevel >= 544 && achievLevel <= 547) {
                achievLevel = 'Level 3';
            } else if (achievLevel >= 548 && achievLevel <= 555) {
                achievLevel = 'Level 4';
            } else if (achievLevel >= 556) {
                achievLevel = 'Level 5';
            }
        }

        if (testGradeLevel === '5') {
            if (achievLevel <= 549) {
                achievLevel = 'Not Proficient';
            } else if (achievLevel >= 550 && achievLevel <= 553) {
                achievLevel = 'Level 3';
            } else if (achievLevel >= 554 && achievLevel <= 559) {
                achievLevel = 'Level 4';
            } else if (achievLevel >= 560) {
                achievLevel = 'Level 5';
            }
        }

        if (testGradeLevel === '6') {
            if (achievLevel <= 551) {
                achievLevel = 'Not Proficient';
            } else if (achievLevel >= 552 && achievLevel <= 557) {
                achievLevel = 'Level 3';
            } else if (achievLevel >= 558 && achievLevel <= 566) {
                achievLevel = 'Level 4';
            } else if (achievLevel >= 567) {
                achievLevel = 'Level 5';
            }
        }

        if (testGradeLevel === '7') {
            if (achievLevel <= 553) {
                achievLevel = 'Not Proficient';
            } else if (achievLevel >= 554 && achievLevel <= 558) {
                achievLevel = 'Level 3';
            } else if (achievLevel >= 559 && achievLevel <= 565) {
                achievLevel = 'Level 4';
            } else if (achievLevel >= 566) {
                achievLevel = 'Level 5';
            }
        }

        if (testGradeLevel === '8') {
            if (achievLevel <= 556) {
                achievLevel = 'Not Proficient';
            } else if (achievLevel >= 557 && achievLevel <= 562) {
                achievLevel = 'Level 3';
            } else if (achievLevel >= 563 && achievLevel <= 571) {
                achievLevel = 'Level 4';
            } else if (achievLevel >= 572) {
                achievLevel = 'Level 5';
            }
        }

        return achievLevel;

    }

    function mapEOCCombinedScaleScores(row, testMetadata, signature,hierarchy){
        if (row.getField("SCALE_SCORE") && signature.getFormat().getFormatName() !== 'AUTOMATION_26_1_COLS') {
                    return null;
        }
        var gradeLevel = _util.coalesce(row.getField("GRADE_LEVEL"), row.getField("TESTED_GRADE_LEVEL"));
        if (gradeLevel === 810 || gradeLevel === 0) {
                    return null;
        }
        var score = {};
        var dataFileName;
        var grade = row.getField("GRADE_LEVEL");
        var testNumber = testMetadata.TEST;
        if (testMetadata.FIELD === "") {
            var scaleScore = row.getField(testMetadata.TEST + "_SCALE");
            var achievLevel = row.getField(testMetadata.TEST + "_LEVEL");
            var pctl = row.getField(testMetadata.TEST + "_PCTL");
                    }
        else {
            var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "_SCALE_SCORE"),row.getField(testMetadata.FIELD + "ACHIEVEMENT_SCALE_SCORE"));
            var achievLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_LEVEL"),row.getField(testMetadata.FIELD + "ACHIEVEMENT_LEVEL"));
            var pctl = _util.coalesce(row.getField(testMetadata.FIELD + "_PCTL"),row.getField(testMetadata.FIELD + "ACHIEVEMENT_PCTL"));
            var rawScore = row.getField(testMetadata.FIELD);
        }
        if (testMetadata.FIELD !== "" && testMetadata.FIELD.length <= 6) {
                    testNumber += "_" + testMetadata.CODE + "_" + grade + "_" + testMetadata.FIELD;
                } else if (signature.getFormat().getFormatName() === 'AUTOMATION_26_1_COLS'){
                    testNumber += testMetadata.CODE;
                } else {
                    testNumber += "_" + grade + "_" + testMetadata.CODE;
                }
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
        (achievLevel === null || achievLevel === undefined || _util.trim(achievLevel) === "--" || _util.trim(achievLevel) === "") &&
        (pctl === null || pctl === undefined || _util.trim(pctl) === "--" || _util.trim(pctl) === ""))
            {
               return null;
            }//EOC_TOT_08_PC_M1 EOC_TOT_08_PC_M1

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;

            if (!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }

            score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
            score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
            score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];
            score["TEST_PERCENTILE_SCORE"] = pctl;

            return score;
        }


    function mapEOGCombinedScaleScores(row, testMetadata, signature,hierarchy) {
        if ((row.getField("TESTFORM") && row.getField("TESTFORM").indexOf("BOG") > -1)) {
            return null;
        }
        if (row.getField("SCALE_SCORE") && signature.getFormat().getFormatName() !== 'AUTOMATION_36_1_COLS') {
            return null;
        }
        var gradeLevel = _util.coalesce(row.getField("GRADE_LEVEL"), row.getField("TESTED_GRADE_LEVEL"));
        if (gradeLevel === 810 || gradeLevel === 0) {
            return null;
        }
        if (row.getField("ALPHASCORE")) {
            if (row.getField("ALPHASCORE") === "NA" || row.getField("ALPHASCORE") === null || row.getField("ALPHASCORE") === "N/A" || row.getField("ALPHASCORE") === "" ||
                row.getField("ALPHASCORE") === "G" || row.getField("ALPHASCORE") === "H" || row.getField("ALPHASCORE") === "M" || row.getField("ALPHASCORE") === "A") {
                return null;
            }
        }
        var score = {};
        var dataFileName;
        var grade;
        var testNumber = testMetadata.TEST;
        if (testMetadata.FIELD === "") {
            var scaleScore = row.getField(testMetadata.TEST + "_SCALE");
            var achievLevel = row.getField(testMetadata.TEST + "_LEVEL");
            var pctl = row.getField(testMetadata.TEST + "_PCTL");
        }
        else {
            var scaleScore = row.getField(testMetadata.FIELD + "_SCALE");
            var achievLevel = row.getField(testMetadata.FIELD + "_LEVEL");
            var pctl = row.getField(testMetadata.FIELD + "_PCTL");
            var rawScore = row.getField(testMetadata.FIELD);
        }

        var reportedLexile = row.getField("REPORTEDLEXILE");     //TEST_READING_LEVEL
        var readingLexile = row.getField("LEXILE");             //TEST_SECONDARY_RESULT
        var quantile = _util.coalesce(row.getField("QUANTILE"), row.getField("REPORTEDQUANTILE")); //TEST_TERITIARY_RESULT

        var fileName = signature.getFormat().getFormatName();

        if (fileName.indexOf('EOC') > -1) {
            return null;
        }
        if (row.getField("TEST_NAME")) {
            if (row.getField("TEST_NAME").indexOf("EOC") > -1 || row.getField("TEST_NAME").indexOf("End of Course") > -1) {
                return null;
            }
        }
        if ((scaleScore === undefined || scaleScore === null || scaleScore === "" || scaleScore === "N/A") &&
        (achievLevel === achievLevel || achievLevel === null || achievLevel === "") &&
        (pctl === undefined || pctl === null || pctl === "") &&
         (rawScore === undefined || rawScore === null || rawScore === ""))
        {
            return null;
        }
        dataFileName = row.getRawField("LINEAGE_FILE").toString().toLowerCase();
        if(signature.getFormat().getFormatName() === 'AUTOMATION_36_1_COLS'){
            testNumber = testNumber +  "_" + testMetadata.CODE + "_" + testMetadata.FIELD;
        }else{
        if (row.getField("GRADE_LEVEL") === undefined || row.getField("GRADE_LEVEL") === null) {
            grade = gradeLevelFromFileName(dataFileName);

            if (grade === undefined || grade === null || grade === "") {
                let errorMessage = "Error:mapEOGCombinedScaleScores - File Name expected to have grade information/ File should have GRADE_LEVEL column/ GRADE_LEVEL column value is missing: ${dataFileName}";
                throw new Error(errorMessage);
            }
        }
        else {
            grade = row.getField("GRADE_LEVEL");
        }

        if(grade.length ===2 && grade.startsWith('0')){
            grade = grade.replace(grade.substring(0,1),"")
        }

        if (testMetadata.FIELD !== "" && testMetadata.FIELD.length <= 6) {
            testNumber += "_" + testMetadata.CODE + "_" + grade + "_" + testMetadata.FIELD;
        } else {
            testNumber += "_" + grade + "_" + testMetadata.CODE;
        }
        }
        try {
            achievLevel = _util.trim(achievLevel);
            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;

            if (primaryDecode[achievLevel] === "exemption or n/a") {
                return null;
            }
            if (!isNaN(pctl)) {
                score["TEST_PERCENTILE_SCORE"] = pctl;
            }
            if(hierarchy.SCHOOL_YEAR.substring(5) >'2019' && signature.getFormat().getFormatName() !== 'AUTOMATION_36_1_COLS'){
                score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];
                score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
            } else if(signature.getFormat().getFormatName() === 'AUTOMATION_36_1_COLS'){
            score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievLevel]];
            score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
            score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];
            }else {
            score["TEST_PASSED_INDICATOR"] = passDecode[primaryDecode[achievLevel]];
            score["TEST_PRIMARY_RESULT_CODE"] = primaryRecode[achievLevel];
            score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel];
            }
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_READING_LEVEL"] = reportedLexile;
            score["TEST_SECONDARY_RESULT"] = readingLexile;
            score["TEST_TERTIARY_RESULT_CODE"] = "QUANTILE";
            score["TEST_TERTIARY_RESULT"] = quantile;
            score["TEST_RAW_SCORE"] = rawScore;
        }
        catch (e) {
            print(e + "\n");
        }
        return score;
    }

    function mapNCEXTENDandEOC(row, testMetadata) {
                if (row.getField("TEST_CODE") && row.getField("TEST_CODE").indexOf("BOG") > -1){
                return null;
                }
//            if (row.getField("TEST_CODE") && row.getField("TEST_CODE").indexOf("EOC") === -1 &&
//                row.getField("TEST_CODE").indexOf("End of Course") === -1) {
//                return null;

            var score = {};
            var testName = row.getField("TEST_CODE");
            var performanceLevel = row.getField("PERF_LEVEL");
            var scaleScore = row.getField("OVR_" + "SCALE_SCORE");
            var testNumber = getTestNumber(testMetadata, row, testName);

            if(testName !== null && testName !== undefined && _util.trim(testName) !== "--" && _util.trim(testName) !== ""){
                if(testName.indexOf("End of Course") > -1 || testName.indexOf("NCEXTEND") > -1){
                    testMetadata.TEST = "EOC";
                    var testNumber = getTestNumber(testMetadata, row, testName);
                }
                else{
                    testMetadata.TEST = "EOG";
                    var testNumber = getTestNumber(testMetadata, row, testName);
                }
            }

            if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""){
               return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;

            if (!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }

            score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[performanceLevel]];
            score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
            score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[performanceLevel];

            return score;
        }

     function mapBOGScores(row, testMetadata, signature,hierarchy){
        var score = {};

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var achievLevel = row.getField(testMetadata.FIELD + "_LEVEL");
        var pctl = row.getField(testMetadata.FIELD + "_PCTL");//BOG_RD_PCTL

        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
        (achievLevel === null || achievLevel === undefined || _util.trim(achievLevel) === "--" || _util.trim(achievLevel) === "") &&
        (pctl === null || pctl === undefined || _util.trim(pctl) === "--" || _util.trim(pctl) === ""))
        {
           return null;
        }
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;

            if (!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }

            score["TEST_PASSED_INDICATOR"] = passDecode[newPrimaryDecode[achievLevel]];
            score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
            score["TEST_PRIMARY_RESULT"] = newPrimaryDecode[achievLevel];

            score["TEST_PERCENTILE_SCORE"] = pctl;

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
        //how to add grade code to files without grade_level column
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        var grade = _util.coalesce(srcRecord.getField("GRADE_LEVEL"), srcRecord.getField("TESTED_GRADE_LEVEL"),srcRecord.getField("ASSIGNEDGRADE"), "notFound");
        var fileName = signature.getFormat().getFormatName();
        var dataFileName = srcRecord.getRawField("LINEAGE_FILE").toString().toLowerCase();

        if(grade === "notFound") {
            grade = gradeLevelFromFileName(dataFileName);
            if(grade !== null && grade !== undefined) {
                assessmentAdminKey = assessmentAdminKey + "_" + grade;
            }else if(srcRecord.getField("TESTFORM") !== null){
                grade = gradeLevelFromTestForm(srcRecord.getField("TESTFORM"));
                assessmentAdminKey = assessmentAdminKey + "_" + grade;
            }
        }
        else {
            if(grade !== undefined){
                assessmentAdminKey = assessmentAdminKey + "_" + grade;
            }
        }
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        if (srcRecord.getField("STUDENT_NUMBER") !== null && srcRecord.getField("STUDENT_NUMBER") !== "" && srcRecord.getField("STUDENT_NUMBER") !== undefined) {
            assessmentAdminKey = assessmentAdminKey + "_" + srcRecord.getField("STUDENT_NUMBER");
        }
        if (srcRecord.getField("TESTFORM") !== null && srcRecord.getField("TESTFORM") !== "" && srcRecord.getField("TESTFORM") !== undefined) {
            assessmentAdminKey = assessmentAdminKey + "_" + srcRecord.getField("TESTFORM");
        }
        if (srcRecord.getField("TEST_DATE") !== null && srcRecord.getField("TEST_DATE") !== "" && srcRecord.getField("TEST_DATE") !== undefined) {
            assessmentAdminKey = assessmentAdminKey + "_" + srcRecord.getField("TEST_DATE");
        }
        if (fileName.toString().indexOf("BIO") !== -1) {
            assessmentAdminKey = assessmentAdminKey + "_BIO";
        } else if (fileName.toString().indexOf("MATH_I") !== -1) {
            assessmentAdminKey = assessmentAdminKey + "_MA_I";
        } else if (fileName.toString().indexOf("MATH3") !== -1) {
            assessmentAdminKey = assessmentAdminKey + "_MA_3";
        } else if (fileName.toString().indexOf("ENGLISH") !== -1) {
            assessmentAdminKey = assessmentAdminKey + "_ENG_II";
        } else if (fileName.toString().indexOf("READ") !== -1) {
            assessmentAdminKey = assessmentAdminKey + "_RD";
        } else if (fileName.toString().indexOf("MATH") !== -1) {
            assessmentAdminKey = assessmentAdminKey + "_MA";
        } else if (fileName.toString().indexOf("SCI") !== -1) {
            assessmentAdminKey = assessmentAdminKey + "_SCI";
        }
        assessmentAdminKey = assessmentAdminKey + "_" + getTEST_ADMIN_PERIOD(srcRecord, hierarchy);
        var period = getTEST_ADMIN_PERIOD(srcRecord, hierarchy);
        var testDate = adminDate(srcRecord, hierarchy);
        var periodBackupDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5);

        if (period === "WINTER") {
            periodBackupDate = '01/15/' + hierarchy.SCHOOL_YEAR.substring(5);
        }
        if (period === "FALL") {
            periodBackupDate = '09/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4);
        }
        if (period === "SUMMER") {
            periodBackupDate = '06/15/' + hierarchy.SCHOOL_YEAR.substring(5);
        }
        assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(testDate, periodBackupDate);
        assessmentAdminKey = assessmentAdminKey.replaceAll(' ', '_');
        do {
            assessmentAdminKey = assessmentAdminKey.replaceAll("__", "_");
        }
        while (assessmentAdminKey.match("__"));
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }
    function adminDate(row, hierarchy) {
        var TESTADMINDAY = row.getField("TESTADMINDAY");
        var TESTADMINMONTH = row.getField("TESTADMINMONTH");
        var TESTADMINYEAR = row.getField("TESTADMINYEAR");
        var TESTADMINDATE;
        try {
            if (TESTADMINDAY !== undefined && TESTADMINDAY !== null) {
                TESTADMINDATE = TESTADMINMONTH + "/" + TESTADMINDAY + "/" + "20" + TESTADMINYEAR;
            } else {
                var dates = [];
                //Some students only have certain dates, only those should be included or it causes an undefined date object.
                if (row.getField("TESTADMINDAYRD") !== null && row.getField("TESTADMINDAYRD") !== "") {
                    dates.push(new Date(row.getField("TESTADMINMONTHRD") + "/" + row.getField("TESTADMINDAYRD") + "/" + "20" + row.getField("TESTADMINYEARRD") + "Z"));
                }
                if (row.getField("TESTADMINDAYMA") !== null && row.getField("TESTADMINDAYMA") !== "") {
                    dates.push(new Date(row.getField("TESTADMINMONTHMA") + "/" + row.getField("TESTADMINDAYMA") + "/" + "20" + row.getField("TESTADMINYEARMA") + "Z"));
                }
                if (row.getField("PC_RD_DATE") !== null && row.getField("PC_RD_DATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("PC_RD_DATE"), "yyyyMMdd").STANDARD_DATE+"Z"));
                }
                if (row.getField("PC_MA_DATE") !== null && row.getField("PC_MA_DATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("PC_MA_DATE"), "yyyyMMdd").STANDARD_DATE+"Z"));
                }
                if (row.getField("PC_SC_DATE") !== null && row.getField("PC_SC_DATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("PC_SC_DATE"), "yyyyMMdd").STANDARD_DATE+"Z"));
                }
                 if (row.getField("PC_M1_DATE") !== null && row.getField("PC_M1_DATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("PC_M1_DATE"), "yyyyMMdd").STANDARD_DATE+"Z"));
                }
                if (row.getField("BIO_TESTDATE") !== null && row.getField("BIO_TESTDATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("BIO_TESTDATE") ,"MM/dd/yyyy").STANDARD_DATE+"Z"));
                }
                if (row.getField("ENGL_II_TESTDATE") !== null && row.getField("ENGL_II_TESTDATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("ENGL_II_TESTDATE"),"MM/dd/yyyy").STANDARD_DATE+"Z"));
                }
                if (row.getField("MATHI_TESTDATE") !== null && row.getField("MATHI_TESTDATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("MATHI_TESTDATE"),"MM/dd/yyyy").STANDARD_DATE+"Z"));
                }
                if (row.getField("MATHIII_TESTDATE") !== null && row.getField("MATHIII_TESTDATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("MATHIII_TESTDATE"),"MM/dd/yyyy").STANDARD_DATE+"Z"));
                }
                if (row.getField("MA_TESTDATE") !== null && row.getField("MA_TESTDATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("MA_TESTDATE"),"MM/dd/yyyy").STANDARD_DATE+"Z"));
                }
                if (row.getField("RD_TESTDATE") !== null && row.getField("RD_TESTDATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("RD_TESTDATE"),"MM/dd/yyyy").STANDARD_DATE+"Z"));
                }
                if (row.getField("SCI_TESTDATE") !== null && row.getField("SCI_TESTDATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("SCI_TESTDATE"),"MM/dd/yyyy").STANDARD_DATE+"Z"));
                }
                if (row.getField("BOG_RD_TESTDATE") !== null && row.getField("BOG_RD_TESTDATE") !== "") {
                    dates.push(new Date(AppUtil.getDateObjByPattern(row.getField("BOG_RD_TESTDATE"),"MM/dd/yyyy").STANDARD_DATE+"Z"));
                }
                var maximumDate = new Date(Math.max.apply(null, dates));

                var isoD = maximumDate.toISOString();

                var format = (isoD.substring(0, 10));

                TESTADMINDATE = mapDateObject(hierarchy, row, format, null, null, null).STANDARD_DATE;
                return TESTADMINDATE;
            }

        }
        catch (e) {
            //ignore expected range errors
            if (e.name !== 'RangeError') {
                print(e);
            }
        }

        var testDate = row.getField("TEST_DATE");

        //Alphanumeric "Dates" like PEY18,FX418,EOY19, etc are set to default Test Admin Date.
        //No Test Admin Date in the data file is also set as default date.
        if(testDate === null || /[a-zA-Z]+/.test(testDate) ){
             TESTADMINDATE = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5);
        }else{
             TESTADMINDATE = testDate;
        }

        var testDateRaw = TESTADMINDATE;

//     if (JSON.stringify(new Date(testDateRaw)) !== null) {
//     testDate = AppUtil.getDateObjByPattern(testDateRaw, "MM/dd/yyyy").STANDARD_DATE;
//     }

       if(testDateRaw !== null && testDateRaw !== undefined && testDateRaw !== "") {
             if(testDateRaw.length === 10 && testDateRaw.indexOf("-") > -1){
                testDate = AppUtil.getDayFollowedByMonth(testDateRaw).STANDARD_DATE;
             } else {
                testDate = AppUtil.getMonthFollowedByDay(testDateRaw).STANDARD_DATE;
             }
       }

        return testDate;
    }

    function getTestNumber(testMetadata, row, testName){

        if(testName === null || testName === undefined || testName === "--"){
            return null;
        }

        if (testName !== null && testName.toString().indexOf("Biology") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_BIO";
        }
        else if (testName !== null && testName.toString().indexOf("Math I") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_MA_I";
        }
        else if (testName !== null && testName.toString().indexOf("Math 3") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_MA_3";
        }
        else if (testName !== null && testName.toString().indexOf("English II") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_ENG_II";
        }
        else if (testName !== null && testName.toString().indexOf("Math") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_MA";
        }
        else if (testName !== null && testName.toString().indexOf("Reading") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_RD";
        }
        else if (testName !== null && testName.toString().indexOf("Writing") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE +"_WR";
        }
        else if (testName !== null && testName.toString().indexOf("Science") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_SCI";
        }
        else if (testName !== null && testName.toString().indexOf("NCEXTEND") > -1) {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_NCEXTEND";
        }
//        else if (testName !== null && testName.toString().indexOf("EOC") > -1) {
//            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_MA_I";
//        }

        return testNumber;

    }


    function mapDateObject(hierarchy, row, dateStr, year, month, day) {

        //Create empty test date object.
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.

        if (dateStr.length === 8 && dateStr.indexOf("/") > -1) {
            birthDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yy");
        }
        if (dateStr.length === 10 && dateStr.indexOf("-") > -1) {
            birthDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
        }
        if (dateStr.length === 10 && dateStr.indexOf("/") > -1) {
            birthDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
        }
        if (dateStr.length === 7 && dateStr.indexOf("/") > -1) {
            if (year.length === 1) {
                year = "0" + year;
            }
            dateStr = month + "/" + day + "/" + year;
            birthDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yy");
        }
        if (dateStr === 8 && dateStr.indexOf("/") === -1) {
            birthDateObject = AppUtil.getDateObjByPattern(dateStr, "MMddyyyy");
        }
        if (dateStr === 6 && dateStr.indexOf("/") === -1) {
            birthDateObject = AppUtil.getDateObjByPattern(dateStr, "MMddyy");
        }

        // Set default empty objects if mappings fail and report error.
        if (birthDateObject === null) {
            birthDateObject = AppUtil.getEmptyDateObj(dateStr);
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing date string: ${dateStr}", JSON.stringify(row.getSourceRow())));
        }

        return birthDateObject;
    }

    function gradeLevelFromFileName(dataFileName) {
        var grade = null;
        dataFileName = dataFileName.toLowerCase();

        var gradeList = [3, 4, 5, 6, 7, 8];
        var gradeVariation = ['g', 'gr', 'grade', 'grade%20', 'grade ', 'grd'];

        for (const gradeNum of gradeList) {
            for (const gradeVar of gradeVariation) {
                if (dataFileName.indexOf(gradeVar + gradeNum) !== -1) {
                  grade = gradeNum;
                }
            }
        }
        return grade;
    }
    function gradeLevelFromTestForm(TestForm) {
        var grade;

        if(TestForm === null || TestForm === undefined || TestForm === "--"){
            return null;
        }

        if (TestForm.indexOf("3") !== -1) {
            grade = "3";
        }
        if (TestForm.indexOf("4") !== -1) {
            grade = "4";
        }
        if (TestForm.indexOf("5") !== -1) {
            grade = "5";
        }
        if (TestForm.indexOf("6") !== -1) {
            grade = "6";
        }
        if (TestForm.indexOf("7") !== -1) {
            grade = "7";
        }
        if (TestForm.indexOf("8") !== -1) {
            grade = "8";
        }
        if (TestForm.indexOf("10") !== -1) {
            grade = "10";
        }
        if (TestForm.indexOf("11") !== -1) {
            grade = "11";
        }
        return grade;

    }




    function getTEST_ADMIN_PERIOD(row, hierarchy) {
        var period = _util.coalesce(row.getField("COLLECTION_CODE"));
        var administrationDate = row.getField("TEST_DATE");
        var testAdminPeriod = 'ALL';
        if (period !== null) {
            if (period === "BOY") {
                testAdminPeriod = "FALL";
            }
            else if (period === "MOY") {
                testAdminPeriod = "WINTER";
            }
            else if (period === "EOY") {
                testAdminPeriod = "SPRING";
            }
        }
        else if (administrationDate !== null) {
            if (administrationDate.indexOf("BOY") > -1
                || administrationDate.indexOf("F4") !== -1
                || administrationDate.indexOf("OTF") !== -1) {
                testAdminPeriod = "FALL";
            }
            else if (administrationDate.indexOf("MOY") > -1
                || administrationDate.indexOf("W4") !== -1) {
                testAdminPeriod = "WINTER";
            }
            else if (administrationDate.indexOf("EOY") > -1
                || administrationDate.indexOf("S4") !== -1) {
                testAdminPeriod = "SPRING";
            }
            else if (administrationDate.indexOf("YR") !== -1) {
                testAdminPeriod = "ALL"
            }
            else if (administrationDate.indexOf("SUM") !== -1
                || administrationDate.indexOf("PEY") !== -1) {
                testAdminPeriod = "SUMMER"
            }
        }

        if (testAdminPeriod === "ALL" && administrationDate !== null && administrationDate !== undefined && administrationDate.indexOf("YR") == -1) {
            var monthCheck = adminDate(row, hierarchy);
            var month = monthCheck.substring(0, 2);
            if (month === "09" || month === "10" || month === "11")
                testAdminPeriod = "FALL";
            else if (month === "12" || month === "01" || month === "02" || month === "03")
                testAdminPeriod = "WINTER";
            else if (month === "04" || month === "05")
                testAdminPeriod = "SPRING";
            else if (month === "06" || month === "07" || month === "08")
                testAdminPeriod = "SUMMER";
        }


        return testAdminPeriod;
    }




    return module;
}());