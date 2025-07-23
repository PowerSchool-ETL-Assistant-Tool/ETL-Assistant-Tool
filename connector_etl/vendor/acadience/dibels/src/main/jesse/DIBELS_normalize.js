var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "DIBELS";
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

            print(`Normalized file: ${normalizedFile}\n`);

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
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
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
        { TEST: 'DIBELS', CODE: 'OVERALL', FIELD: 'COMPOSITE_SCORE', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'PATHACHCOM', FIELD: 'ACHIEVED_COMPOSITE', MAP_FUNCTION: mapPathwayScore },
        { TEST: 'DIBELS', CODE: 'PATHSETCOM', FIELD: 'SET_COMPOSITE', MAP_FUNCTION: mapPathwayScore },

        { TEST: 'DIBELS', CODE: 'PATHACHFSF', FIELD: 'ACHIEVED_FSF', MAP_FUNCTION: mapPathwayScore },//FSF Pathway
        { TEST: 'DIBELS', CODE: 'PATHACHPSF', FIELD: 'ACHIEVED_PSF', MAP_FUNCTION: mapPathwayScore },//PSF Pathway
        { TEST: 'DIBELS', CODE: 'PATHACHNWF_CLS', FIELD: 'ACHIEVED_NWF_CLS', MAP_FUNCTION: mapPathwayScore },//NWF_CLS Pathway
        { TEST: 'DIBELS', CODE: 'PATHACHNWF_WWR', FIELD: 'ACHIEVED_NWF_WWR', MAP_FUNCTION: mapPathwayScore },//NWF_WWR Pathway
        { TEST: 'DIBELS', CODE: 'PATHACHORF_WC', FIELD: 'ACHIEVED_ORC_WC', MAP_FUNCTION: mapPathwayScore },//ORF_WC Pathway
        { TEST: 'DIBELS', CODE: 'PATHACHORF_ACCURACY', FIELD: 'ACHIEVED_ORF_ACCURACY', MAP_FUNCTION: mapPathwayScore },//ORF_ACCURACY Pathway
        { TEST: 'DIBELS', CODE: 'PATHACHRETELL', FIELD: 'ACHIEVED_RETELL', MAP_FUNCTION: mapPathwayScore },//RETELL Pathway
        { TEST: 'DIBELS', CODE: 'PATHACHMAZE_ADJUSTED', FIELD: 'ACHIEVED_MAZE_ADJUSTED', MAP_FUNCTION: mapPathwayScore },//MAZE_ADJUSTED Pathway
        { TEST: 'DIBELS', CODE: 'PATHACHCOMPOSITE_GOAL', FIELD: 'ACHIEVED_COMPOSITE_GOAL', MAP_FUNCTION: mapPathwayScore },//COMPOSITE_GOAL Pathway

        { TEST: 'DIBELS', CODE: 'DAZECOR', FIELD: 'DAZE_CORRECT', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'DAZEINC', FIELD: 'DAZE_INCORRECT', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'DAZE', FIELD: 'DAZE', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'DORFACC', FIELD: 'DORF_ACCURACY', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'DORFERR', FIELD: 'DORF_ERRORS', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'DORFFLU', FIELD: 'DORF_FLUENCY', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'DORFRETQUA', FIELD: 'DORF_RETELL_QUALITY', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'DORFRET', FIELD: 'DORF_RETELL', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'FSF', FIELD: 'FSF', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'LNF', FIELD: 'LNF', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'NWFCLS', FIELD: 'NWF_CLS', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: '*NWFCLS', FIELD: '*NWF_CLS', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'NWFWWR', FIELD: 'NWF_WWR', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: '*NWFWWR', FIELD: '*NWF_WWR', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'NWF-WRC', FIELD: 'NWF-WRC', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'PSF', FIELD: 'PSF', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'PSF', FIELD: 'RAN', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'ORFWC', FIELD: 'ORF_WC', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'ORFERR', FIELD: 'ORF_ERRORS', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'ORFACCURACY', FIELD: 'ORF_ACCURACY', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: '*ORFACC', FIELD: '*ORF_ACC', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'RETELL', FIELD: 'RETELL', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'RETELLQUALITY', FIELD: 'RETELL_QUALITY', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'MAZEADJUSTED', FIELD: 'MAZE_ADJUSTED', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'COMPOSITE', FIELD: 'COMPOSITE', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'COMPOSITEGOAL', FIELD: 'COMPOSITE_GOAL', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'RISKIND', FIELD: 'RISK_INDICATOR', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'SPELLING', FIELD: 'SPELLING', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'VOCABULARY', FIELD: 'VOCABULARY', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'ORALLANG', FIELD: 'ORAL_LANGUAGE', MAP_FUNCTION: mapScaledScore },
        { TEST: 'DIBELS', CODE: 'RAN' , FIELD: 'RAN', MAP_FUNCTION: mapScaledScore},
        { TEST: 'DIBELS', CODE: 'WRF' , FIELD: 'WRF', MAP_FUNCTION: mapScaledScore},
        { TEST: 'DIBELS', CODE: 'READCOMP' , FIELD: 'READING_COMPREHENSION_MAZE', MAP_FUNCTION: mapScaledScore},

        { TEST: 'DIBELS', CODE: 'RAN_OBJECTS' , FIELD: 'OBJECTS', MAP_FUNCTION: mapRANScore},
        { TEST: 'DIBELS', CODE: 'RAN_LETTERS' , FIELD: 'LETTERS', MAP_FUNCTION: mapRANScore},
        { TEST: 'DIBELS', CODE: 'RAN_NUMBERS' , FIELD: 'NUMBERS', MAP_FUNCTION: mapRANScore},

        { TEST: 'DIBELS', CODE: 'RAN_TOTAL' , FIELD: 'RAN', MAP_FUNCTION: mapTotalRANScore},

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

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
        "Grade K Only": "KG",
        "Kindergarten": "KG"
        , "": null
        , null: null
    };

    var primaryDecode = {
          "Adv": "Advanced"
        , "Advanced": "Advanced"
        , "Bas": "Basic"
        , "Basic": "Basic"
        , "Bel": "Below Basic"
        , "Below Basic": "Below Basic"
        , "Pro": "Proficient"
        , "Proficient": "Proficient"
        , "": null
        , null: null
    };

    var passDecode = {
        "Adv": "Yes"
        , "Advanced": "Yes"
        , "Bas": "No"
        , "Basic": "No"
        , "Bel": "No"
        , "Below Basic": "No"
        , "Pro": "Yes"
        , "Proficient": "Yes"
        , "": null
        , null: null
    };

    var perfLevels = {
        "Intensive Support": {
            TEST_PRIMARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT: "Intensive Support",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark"
        },
        "Strategic Support": {
            TEST_PRIMARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT: "Strategic Support",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark"
        },
        "Core Support": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "At Or Above Benchmark"
        },
        "--": {
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT: "--",
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        "well below benchmark": {
            TEST_PRIMARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT: "Intensive Support",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark"
        },
        "below benchmark": {
            TEST_PRIMARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT: "Strategic Support",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark"
        },
        "at benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AT",
            TEST_SECONDARY_RESULT: "At Benchmark"
        },
        "above benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "ABV",
            TEST_SECONDARY_RESULT: "Above Benchmark"
        },
        "at or above benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "At Or Above Benchmark"
        },
        "Above Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "ABV",
            TEST_SECONDARY_RESULT: "Above Benchmark"
        },
        "Below Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT: "Strategic Support",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark"
        },
        "At Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AT",
            TEST_SECONDARY_RESULT: "At Benchmark"
        },
        "At or Above Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "At Or Above Benchmark"
        },
        "Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AT",
            TEST_SECONDARY_RESULT: "At Benchmark"
        },
        "Well Below Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT: "Intensive Support",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark"
        },
        "Not Determined": {
            TEST_PRIMARY_RESULT_CODE: "Not Determined",
            TEST_PRIMARY_RESULT: "Not Determined",
            TEST_SECONDARY_RESULT_CODE: "Not Determined",
            TEST_SECONDARY_RESULT: "Not Determined"
        },
        "Intensive": {
            TEST_PRIMARY_RESULT_CODE: "I",
            TEST_PRIMARY_RESULT: "Intensive",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark"
        },
        "Strategic": {
            TEST_PRIMARY_RESULT_CODE: "S",
            TEST_PRIMARY_RESULT: "Strategic",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark"
        },
        "": {
               TEST_PRIMARY_RESULT_CODE: "--",
               TEST_PRIMARY_RESULT: "--",
               TEST_SECONDARY_RESULT_CODE: "--",
               TEST_SECONDARY_RESULT: "--"
           }
    };

     var assessPeriods =
        {
            "BOY" : "Beginning",
            "Beginning" : "Beginning",
            "beginning" : "Beginning",
            "MOY" : "Middle",
            "middle" : "middle",
            "Middle" : "Middle",
            "EOY" : "End",
            "End" : "End",
            "end" : "End",
            "Winter" : "Winter",
            "Fall" : "Fall",
            "Spring" : "Spring"
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

        //var record = mapNormalizedRecord(signature, hierarchy, row);
        var assessPeriod = assessPeriods[row.getField("BENCHMARK_PERIOD")];
        var record = mapNormalizedRecord(signature, hierarchy, row, assessPeriod);
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
    function mapNormalizedRecord(signature, hierarchy, row, period) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, period);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, period);

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
    function mapNormalizedAdminFields(signature, hierarchy, row, period) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        let schoolName = row.getField('SCHOOL_NAME');

        if (schoolName) {
            schoolName = schoolName.replace('(X)', '').trim();
        }

        let rawDob = row.getField("DATE_OF_BIRTH");
        var birthDateObject = AppUtil.getEmptyDateObj();
        let format = 'MM/dd/yy';
        let dateChunks;
        if (rawDob) {
            if (rawDob.indexOf('-') > -1) {
                dateChunks = rawDob.split('-');
                if (dateChunks[2].length === 2) {
                    if (rawDob.indexOf('-') > 3){
                         format = 'yyyy-MM-dd';
                    }
                    else{
                        format = 'MM-dd-yy';
                    }
                }
                else {
                     format = dateChunks[0]>12 ? 'dd-MM-YYYY' : 'MM-dd-yyyy';
                }
            } else if (rawDob.indexOf('/') > -1) {
                dateChunks = rawDob.split('/');
                if (dateChunks[2].length === 2) {
                    format = 'MM/dd/yy';
                } else {
                    format = 'MM/dd/yyyy';
                }
            }
            try {
                birthDateObject = AppUtil.getDateObjByPattern(rawDob, format);
            } catch (e) {
                print("\nERROR: ${e}\n");
            }
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
                    record.REPORTING_PERIOD = _util.coalesce(period, hierarchy.REPORTING_PERIOD);//What when all?
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTestAdminDate(row, hierarchy.SCHOOL_YEAR);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(
                        row.getField("STUDENT_LOCAL_ID"),
                        row.getField("STUDENT_ID"),
                        row.getField("STUDENT_ID_LOCAL_ID")
                    );
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1"),
                        row.getField("STATE_STUDENT_ID_VERSION_2"),
                        row.getField("STUDENT_STATE_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1"),
                        row.getField("STATE_STUDENT_ID_VERSION_2"),
                        row.getField("STUDENT_VENDOR_ID"),
                        row.getField("STUDENT_ID"),
                        row.getField("STUDENT_ID_LOCAL_ID")
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
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField('GRADE')],gradeDecode[row.getField('ASSESSMENT_GRADE')],gradeDecode[row.getField('ENROLLMENT_GRADE')]);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL_VENDOR_ID"),
                        row.getField("SCHOOL_LOCAL_ID"),
                        row.getField("SCHOOL_NAME"),
                        row.getField("PRIMARY_SCHOOL_ID"),
                        row.getField("SCHOOL_STATE_ID"),
                        "DISTRICT"
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("PRIMARY_SCHOOL_ID")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("PRIMARY_SCHOOL_ID")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = schoolName;
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
//
//        if (row.getField("ENG_LEARNER") === "1" || row.getField("ENG_LEARNER") === "2") {
//            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
//        }
//        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, testMetadata,  period) {
        let score = {};
        let testNumber = testMetadata.TEST + '_' + testMetadata.CODE;
        let scaleScore = row.getField('ASSESSMENT_MEASURE_' + testMetadata.FIELD + '_SCORE'); // ASSESSMENT_MEASURE_RAN_SCORE
        let scoreLevels = row.getField('ASSESSMENT_MEASURE_' + testMetadata.FIELD + '_LEVELS');
        let percentile =  row.getField('ASSESSMENT_MEASURE_' + testMetadata.FIELD + '_PERCENTILE');
        let lexile = row.getField("LEXILE_READING");

        if (!scaleScore || _util.trim(scaleScore) === "--") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (scoreLevels) {
            score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[scoreLevels].TEST_PRIMARY_RESULT_CODE;
            score["TEST_PRIMARY_RESULT"] = perfLevels[scoreLevels].TEST_PRIMARY_RESULT;
            score["TEST_SECONDARY_RESULT_CODE"] = perfLevels[scoreLevels].TEST_SECONDARY_RESULT_CODE;
            score["TEST_SECONDARY_RESULT"] = perfLevels[scoreLevels].TEST_SECONDARY_RESULT;
        }

        if(lexile !== undefined && lexile !== null && lexile !== ""){
            score["TEST_READING_LEVEL"] = lexile.replace("BR", "").replace("L", "");
        }
        //Percentile must be numeric but these values need inclusion, see UIHN-77510
        if(percentile === ">99"){
            percentile = "100";
        }
        if(percentile === "<1"){
            percentile = "0";
        }
        score["TEST_PERCENTILE_SCORE"] = percentile;
        return score;
    }

    function mapPathwayScore(row, testMetadata,  period) {
        let score = {};
        let testNumber = testMetadata.TEST + '_' + testMetadata.CODE;
        let pathwayScore = row.getField('PATHWAY_' + testMetadata.FIELD + '_SCORE');

        if (!pathwayScore) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = pathwayScore;

        if (!isNaN(pathwayScore)) {
            score["TEST_SCORE_VALUE"] = pathwayScore;
            score["TEST_SCALED_SCORE"] = pathwayScore;
        }
         if (isNaN(pathwayScore)) {
         score["TEST_PRIMARY_RESULT"] = pathwayScore;
         }
        return score;
    }
    function mapRANScore(row, testMetadata,  period) {
        let score = {};
        let testNumber = testMetadata.TEST + '_' + testMetadata.CODE;
        let scaleScore = row.getField('RAN_' + testMetadata.FIELD + '_ERRORS');
        let rawScore = row.getField('RAN_' + testMetadata.FIELD + '_SECONDS');
        let RANLevels = row.getField('ASSESSMENT_MEASURE_RAN_' + testMetadata.FIELD + '_LEVELS');

        if (!scaleScore || _util.trim(scaleScore) === "--") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (!isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
        }

        if (RANLevels) {
            score["TEST_PRIMARY_RESULT"] = RANLevels;
        }
        return score;
    }

    function mapTotalRANScore(row, testMetadata,  period) {
        let score = {};
        let testNumber = testMetadata.TEST + '_' + testMetadata.CODE;
        let scaleScore = row.getField('TOTAL_' + testMetadata.FIELD + '_ERRORS');
        let rawScore = row.getField('TOTAL_' + testMetadata.FIELD + '_SECONDS');

        if (!scaleScore || _util.trim(scaleScore) === "--") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (!isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
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
        var grade = _util.coalesce(gradeDecode[srcRecord.getField('GRADE')],gradeDecode[srcRecord.getField('ASSESSMENT_GRADE')],gradeDecode[srcRecord.getField('ENROLLMENT_GRADE')]);
        var studentId = srcRecord.getField("STUDENT_ID");
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_" + grade;
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        if((studentId === null || studentId === "" || studentId === " ") && (signature.getFormat().getFormatName() === "DIBELS_COL105")){
            var primaryId = srcRecord.getField("DISTRICT_PRIMARY_ID");
            assessmentAdminKey = assessmentAdminKey + "_" + primaryId;
        }
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    /*function generateLevelCode(level) {
        if (level) {
            return level.split(" ").map(l => l[0].toUpperCase()).join("");
        }
    }*/

    function getTestAdminDate(row, year) {
      if((row.getField("CLIENT_DATE")!==undefined) && ( row.getField("CLIENT_DATE") !== null)){
            if(row.getField("CLIENT_DATE").indexOf("/") >-1){
            return AppUtil.getMonthFollowedByDay(row.getField("CLIENT_DATE")).STANDARD_DATE;
            }else if(row.getField("CLIENT_DATE").indexOf("-") >-1){
            return AppUtil.getDateObjByPattern(row.getField("CLIENT_DATE"), "yyyy-MM-dd").STANDARD_DATE;
            }
      }
      else if ((row.getField("COMPOSITE_DATE")!==undefined) && ( row.getField("COMPOSITE_DATE") !== null)){
        if(row.getField("COMPOSITE_DATE").indexOf("/") > -1 ) {
          return AppUtil.getDateObjByPattern(row.getField("COMPOSITE_DATE"), "MM/dd/yy").STANDARD_DATE;
        }
        else if(row.getField("COMPOSITE_DATE").indexOf("-") > -1) {
          return AppUtil.getDateObjByPattern(row.getField("COMPOSITE_DATE"), "yyyy-MM-dd").STANDARD_DATE;
        }
      } else {
        return '05/15/' + year.substring(5, 9);
      }
    }

    return module;
}());