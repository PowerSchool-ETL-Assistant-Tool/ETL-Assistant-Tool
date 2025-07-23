var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "EUREKA_AFFIRM";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
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
                .transform("ADD LINEAGE FIELD", ["RECORDS"], function(output, json) {

                    json.LINEAGE_FILE = fileFullName;
                    json.LINEAGE_LINE = (++lineNumber).toString();
                    output.RECORDS.put(json);
                })
                .group_by("ADMINISTRATION GROUPING", function(one, two) {

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function(output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function(row) {
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
                    function(output, rows) {
                        try {

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function(record) {
                                output.RECORDS.put(record);
                            });

                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }


                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function(output, row) {
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
        }
        n
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function(file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    //TODO update scoresToMap
    var scoresToMap = [{
            TEST: "EUAF",
            CODE: "OVR",
            FIELD: "OVERALL",
            PART: "",
            MAP_FUNCTION: mapOverallScore
        }, //does not have parts
        //Reporting Scores
        {
            TEST: "EUAF",
            CODE: "I1P1",
            FIELD: "ITEM_1",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I1P2",
            FIELD: "ITEM_1",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I1P3",
            FIELD: "ITEM_1",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I1P4",
            FIELD: "ITEM_1",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I1P5",
            FIELD: "ITEM_1",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I1P6",
            FIELD: "ITEM_1",
            PART: "PART_6",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I2P1",
            FIELD: "ITEM_2",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I2P2",
            FIELD: "ITEM_2",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I2P3",
            FIELD: "ITEM_2",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I2P4",
            FIELD: "ITEM_2",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I2P5",
            FIELD: "ITEM_2",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I2P6",
            FIELD: "ITEM_2",
            PART: "PART_6",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I2P7",
            FIELD: "ITEM_2",
            PART: "PART_7",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I2P8",
            FIELD: "ITEM_2",
            PART: "PART_8",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I3P1",
            FIELD: "ITEM_3",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I3P2",
            FIELD: "ITEM_3",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I3P3",
            FIELD: "ITEM_3",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I3P4",
            FIELD: "ITEM_3",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I4P1",
            FIELD: "ITEM_4",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I4P2",
            FIELD: "ITEM_4",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I4P3",
            FIELD: "ITEM_4",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I4P4",
            FIELD: "ITEM_4",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I4P5",
            FIELD: "ITEM_4",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P1",
            FIELD: "ITEM_5",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P2",
            FIELD: "ITEM_5",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P3",
            FIELD: "ITEM_5",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P4",
            FIELD: "ITEM_5",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P5",
            FIELD: "ITEM_5",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P6",
            FIELD: "ITEM_5",
            PART: "PART_6",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P7",
            FIELD: "ITEM_5",
            PART: "PART_7",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P8",
            FIELD: "ITEM_5",
            PART: "PART_8",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P9",
            FIELD: "ITEM_5",
            PART: "PART_9",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I5P10",
            FIELD: "ITEM_5",
            PART: "PART_10",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I6P1",
            FIELD: "ITEM_6",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I6P2",
            FIELD: "ITEM_6",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I6P3",
            FIELD: "ITEM_6",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I6P4",
            FIELD: "ITEM_6",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I6P5",
            FIELD: "ITEM_6",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I7P1",
            FIELD: "ITEM_7",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I7P2",
            FIELD: "ITEM_7",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I7P3",
            FIELD: "ITEM_7",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I7P4",
            FIELD: "ITEM_7",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I7P5",
            FIELD: "ITEM_7",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I8P1",
            FIELD: "ITEM_8",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I8P2",
            FIELD: "ITEM_8",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I8P3",
            FIELD: "ITEM_8",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I8P4",
            FIELD: "ITEM_8",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I8P5",
            FIELD: "ITEM_8",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I9P1",
            FIELD: "ITEM_9",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I9P2",
            FIELD: "ITEM_9",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I9P3",
            FIELD: "ITEM_9",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I9P4",
            FIELD: "ITEM_9",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I9P5",
            FIELD: "ITEM_9",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I10P1",
            FIELD: "ITEM_10",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I10P2",
            FIELD: "ITEM_10",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I10P3",
            FIELD: "ITEM_10",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I10P4",
            FIELD: "ITEM_10",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I10P5",
            FIELD: "ITEM_10",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I11P1",
            FIELD: "ITEM_11",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I11P2",
            FIELD: "ITEM_11",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I11P3",
            FIELD: "ITEM_11",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I11P4",
            FIELD: "ITEM_11",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I11P5",
            FIELD: "ITEM_11",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I12P1",
            FIELD: "ITEM_12",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I12P2",
            FIELD: "ITEM_12",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I12P3",
            FIELD: "ITEM_12",
            PART: "PART_3",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I12P4",
            FIELD: "ITEM_12",
            PART: "PART_4",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I12P5",
            FIELD: "ITEM_12",
            PART: "PART_5",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I13P1",
            FIELD: "ITEM_13",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I13P2",
            FIELD: "ITEM_13",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I14P1",
            FIELD: "ITEM_14",
            PART: "PART_1",
            MAP_FUNCTION: mapReportingScore
        },
        {
            TEST: "EUAF",
            CODE: "I14P2",
            FIELD: "ITEM_14",
            PART: "PART_2",
            MAP_FUNCTION: mapReportingScore
        },


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
        "Kindergarten": "KG",
        "": null,
        null: null
    };


    var primaryDecode = {
        "1": {
            LEVEL: "Level 1",
            DESC: "Not Yet Proficient"
        },
        "Not Yet Proficient": {
            LEVEL: "Level 1",
            DESC: "Not Yet Proficient"
        },
        "2": {
            LEVEL: "Level 2",
            DESC: "Partially Proficient"
        },
        "Partially Proficient": {
            LEVEL: "Level 2",
            DESC: "Partially Proficient"
        },
        "3": {
            LEVEL: "Level 3",
            DESC: "Proficient"
        },
        "Proficient": {
            LEVEL: "Level 3",
            DESC: "Proficient"
        },
        "4": {
            LEVEL: "Level 4",
            DESC: "Highly Proficient"
        },
        "Highly Proficient": {
            LEVEL: "Level 4",
            DESC: "Highly Proficient"
        },
        "Undefined": {
            LEVEL: null,
            DESC: null
        },
        "": {
            LEVEL: null,
            DESC: null
        },
        "null": {
            LEVEL: null,
            DESC: null
        }
    };

    var assessmenttypeDecodes = {
        "Topic Quiz": "TQ",
        "End-of-Module Assessment": "EOMA",
        "Equip Pre-Module Assessment": "Equip",
        "Mid-Module Assessment": "MMA",
        "TQ": "TQ",
        "EOMA": "EOMA",
        "Equip": "EQUIP",
        "MMA": "MMA"

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
        try {
            //Map normalized admin fields
            record = mapNormalizedAdminFields(signature, hierarchy, row);

            //Map non-normalized admin fields
            mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

            //Map score fields for each expected score mapping
            scoresToMap.forEach(function(testMetadata) {
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
        } catch (e) {
            print("Error in mapNormalizedRecord : ${e}");
        }
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
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        let birthDateObject = AppUtil.getEmptyDateObj(); // No dob in the data file

        var finalDate = null;
        if (row.getField("DATE_COMPLETED") !== null && row.getField("DATE_COMPLETED") !== undefined) {
            finalDate = AppUtil.getDateObjByPattern(row.getField("DATE_COMPLETED"), "MM-dd-yy").STANDARD_DATE;
        }

        var fullName = row.getField("STUDENT");
        if (fullName !== null && fullName !== undefined && fullName !== "") {
        var lastName = fullName.split(",")[0].trim();
        var firstName = fullName.split(",")[1].trim();
        }


        normalizedFileFields.forEach(function(field) {
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
                    record.TEST_ADMIN_DATE = _util.coalesce(finalDate, '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
                    break;

                    //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_NUMBER")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_NUMBER")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = firstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("STATE_SCHOOL_NUMBER"), row.getField("DISTRICT_SCHOOL_NUMBER"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = row.getField("DISTRICT_SCHOOL_NUMBER");
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = row.getField("STATE_SCHOOL_NUMBER");
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL"));
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
        admin.VENDOR_STAFF_ID = row.getField("TEACHER_SIS_ID");
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapOverallScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = generateTestNumber(row, testMetadata);
            var pointsAchieved = row.getField(testMetadata.FIELD + "_POINTS_ACHIEVED");
            var pointsPossible = row.getField(testMetadata.FIELD + "_POINTS_POSSIBLE");
            var percentile = row.getField(testMetadata.FIELD + "_PERCENTAGE");
            var proficiencyLevel = row.getField("PROFICIENCY_BAND");

            // Check for key fields and do not map score and exit if conditions met.
            if (pointsAchieved === null || pointsAchieved === undefined || _util.trim(pointsAchieved) === "--" || _util.trim(pointsAchieved) === "") {
                return null;
            }
            if (percentile === null || percentile === undefined || _util.trim(percentile) === "--" || _util.trim(percentile) === "") {
                return null;
            }
            if (pointsPossible === null || pointsPossible === undefined || _util.trim(pointsPossible) === "--" || _util.trim(pointsPossible) === "") {
                return null;
            }


            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = pointsAchieved;

            if (!isNaN(parseInt(pointsAchieved))) {
                score["TEST_SCORE_VALUE"] = parseInt(pointsAchieved);
                score["TEST_ITEMS_ATTEMPTED"] = parseInt(pointsAchieved);
            }

            if (!isNaN(parseInt(pointsPossible))) {
                score["TEST_ITEMS_POSSIBLE"] = parseInt(pointsPossible);
            }

            score["TEST_PRIMARY_RESULT"] = primaryDecode[proficiencyLevel].DESC;
            score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[proficiencyLevel].LEVEL;

            score["TEST_PERCENTAGE_SCORE"] = percentile;


        } catch (e) {
            print("score mapping error" + e + "\n");
        }

        return score;
    }

    function mapReportingScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = generateTestNumber(row, testMetadata);
            var pointsAchieved = row.getField(testMetadata.FIELD + "_" + testMetadata.PART + "_" + "POINTS_ACHIEVED");
            var pointsPossible = row.getField(testMetadata.FIELD + "_" + testMetadata.PART + "_" + "POINTS_POSSIBLE");
            var percentile = row.getField(testMetadata.FIELD + "_" + testMetadata.PART + "_" + "PERCENTAGE");
            var proficiencyLevel = row.getField("PROFICIENCY_BAND");

            // Check for key fields and do not map score and exit if conditions met.
            if (pointsAchieved === null || pointsAchieved === undefined || _util.trim(pointsAchieved) === "--" || _util.trim(pointsAchieved) === "") {
                return null;
            }
            if (percentile === null || percentile === undefined || _util.trim(percentile) === "--" || _util.trim(percentile) === "") {
                return null;
            }
            if (pointsPossible === null || pointsPossible === undefined || _util.trim(pointsPossible) === "--" || _util.trim(pointsPossible) === "") {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = pointsAchieved;

            if (!isNaN(parseInt(pointsAchieved))) {
                score["TEST_SCORE_VALUE"] = parseInt(pointsAchieved);
                score["TEST_ITEMS_ATTEMPTED"] = parseInt(pointsAchieved);
            }

            if (!isNaN(parseInt(pointsPossible))) {
                score["TEST_ITEMS_POSSIBLE"] = parseInt(pointsPossible);
            }

            score["TEST_PERCENTAGE_SCORE"] = percentile;

            score["TEST_PRIMARY_RESULT"] = primaryDecode[proficiencyLevel].DESC;
            score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[proficiencyLevel].LEVEL;


        } catch (e) {
            print(e + "error in reporting fxn")
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
        var assessmentAdminKey = null;
        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier +
            "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE) +
            "_" + AssessmentLoader.config.DISTRICT_CODE;
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        return assessmentAdminKey;
    }


    function generateTestNumber(row, testMetadata) {
        var testNumber = null;
        var assessmenttype = row.getField("TYPE_OF_ASSESSMENT");
        var grade = gradeDecode[row.getField('GRADE')];
        var module = row.getField("MODULE");
        if (assessmenttype !== null && grade !== null && module !== null) {
            testNumber = testMetadata.TEST + "_" + assessmenttypeDecodes[assessmenttype] + "_G" + grade + "_M" + module + "_" + testMetadata.CODE;
        } else {
            testNumber = testMetadata.TEST + "_" + assessmenttypeDecodes[assessmenttype] + "_G" + grade + "_" + testMetadata.CODE;
        }
        return testNumber;
    }




    return module;
}());