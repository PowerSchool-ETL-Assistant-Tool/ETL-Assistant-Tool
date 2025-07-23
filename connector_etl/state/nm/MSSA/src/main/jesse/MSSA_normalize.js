var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MSSA";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
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

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows, normalizedFile);

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
            throw `${_thisModuleName}.createNormalizedFile Exception: ${exception}`;
        }
    };

     function determineGradeFromFile(normalizedFile, row) {
        var testedGrade = '';
        var fileName = normalizedFile.substring(normalizedFile.lastIndexOf('/')+1);
        if (fileName.indexOf('3rd') > -1 || fileName.indexOf('Grade_3') > -1) {
            testedGrade = '03';
        } else if (fileName.indexOf('4th') > -1 || fileName.indexOf('Grade_4') > -1) {
            testedGrade = '04';
        } else if (fileName.indexOf('5th') > -1 || fileName.indexOf('Grade_5') > -1) {
            testedGrade = '05'
        }  else if (fileName.indexOf('6th') > -1 || fileName.indexOf('Grade_6') > -1) {
            testedGrade = '06'
        }  else if (fileName.indexOf('7th') > -1 || fileName.indexOf('Grade_7') > -1) {
            testedGrade = '07'
        }  else if (fileName.indexOf('8th') > -1 || fileName.indexOf('Grade_8') > -1) {
            testedGrade = '08'
        } else {
            testedGrade = gradeDecode[row.getField('Grade')];
        }
        return testedGrade;
    }

    function determinePeriodFromFile(normalizedFile) {
        var filePeriod = null;
        var fileName = normalizedFile.substring(normalizedFile.lastIndexOf('/')+1);
        if (fileName.indexOf('BOY') > -1) {
            filePeriod = 'BOY';
        } else if (fileName.indexOf('MOY') > -1) {
            filePeriod = 'MOY';
        } else if (fileName.indexOf('EOY') > -1) {
            filePeriod = 'EOY';
        } else if (fileName.indexOf('Spring') > -1) {
            filePeriod = 'Spring';
        } else if (fileName.indexOf('Winter') > -1) {
            filePeriod = 'Winter';
        } else if (fileName.indexOf('Fall') > -1) {
            filePeriod = 'Fall';
        }
        return filePeriod;
    }

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

    //TODO update scoresToMap
    var scoresToMap = [
        //iMSSA Interim Scores
        //Map Scaled Scores
        { TEST: "IMSSA_", CODE: "READ", FIELD: "READING", MAP_FUNCTION: mapScaledScore },
        { TEST: "IMSSA_", CODE: "LANG", FIELD: "LANGUAGE_USAGE", MAP_FUNCTION: mapScaledScore },
        { TEST: "IMSSA_", CODE: "MATH", FIELD: "MATHEMATICS", MAP_FUNCTION: mapScaledScore },

        //Map Achievement Sub Scores
        //Reading
        { TEST: "IMSSA_", CODE: "READ_LIT", FIELD: "READING", SUBFIELD: "LITERARY_TEXT", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "READ_INFO", FIELD: "READING", SUBFIELD: "INFORMATIONAL_TEXT", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "READ_COMP", FIELD: "READING", SUBFIELD: "COMPREHENSION", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "READ_AAI", FIELD: "READING", SUBFIELD: "ANALYSIS_AND_INTERPRETATION", MAP_FUNCTION: mapSubCategoryScore },

        //Language
        { TEST: "IMSSA_", CODE: "LANG_NWA", FIELD: "LANGUAGE_USAGE", SUBFIELD: "NARRATIVE_WRITING_ANALYSIS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "LANG_EWA", FIELD: "LANGUAGE_USAGE", SUBFIELD: "EXPOSITORY_WRITING_ANALYSIS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "LANG_ELC", FIELD: "LANGUAGE_USAGE", SUBFIELD: "ENGLISH_LANGUAGE_CONVENTIONS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "LANG_AWA", FIELD: "LANGUAGE_USAGE", SUBFIELD: "ARGUMENT_WRITING_ANALYSIS", MAP_FUNCTION: mapSubCategoryScore },

        //Math
        { TEST: "IMSSA_", CODE: "MATH_OAAT", FIELD: "MATHEMATICS", SUBFIELD: "OPERATIONS_AND_ALGEBRIC_THINKING", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_NAOB10", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_AND_OPERATION_BASE10", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_NAOF", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_AND_OPERATION_FRACTIONS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_MAD", FIELD: "MATHEMATICS", SUBFIELD: "MEASUREMENT_AND_DATA", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_GEOM", FIELD: "MATHEMATICS", SUBFIELD: "GEOMETRY", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_PS", FIELD: "MATHEMATICS", SUBFIELD: "PROBLEM_SOLVING", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_RAA", FIELD: "MATHEMATICS", SUBFIELD: "REASONING_AND_ARGUMENT", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_MA", FIELD: "MATHEMATICS", SUBFIELD: "MODELING", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_SARR", FIELD: "MATHEMATICS", SUBFIELD: "STRUCTURE_AND_REPEATED_REASONING", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_RAPR", FIELD: "MATHEMATICS", SUBFIELD: "RATIO_AND_PROPORTIONAL_RELATIONSHIP", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_NS", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_SYSTEM", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_EAE", FIELD: "MATHEMATICS", SUBFIELD: "EXPRESSION_AND_EQUATION", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_SAP", FIELD: "MATHEMATICS", SUBFIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_FA", FIELD: "MATHEMATICS", SUBFIELD: "FUNCTION", MAP_FUNCTION: mapSubCategoryScore },

        { TEST: "IMSSA_", CODE: "MATH_NAOB10OF", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_AND_OPERATION_BASE10_OR_FRACTION", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_MADGEOM", FIELD: "MATHEMATICS", SUBFIELD: "MEASUREMENT_AND_DATA_OR_GEOMETRY", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_NSEAE", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_SYSTEM_EXPRESSION_OR_EQUATION", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_GEOMSAP", FIELD: "MATHEMATICS", SUBFIELD: "GEOMETRY_OR_STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_PSRAA", FIELD: "MATHEMATICS", SUBFIELD: "PROBLEM_SOLVING_OR_REASONING_AND_ARGUMENT", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_MASARR", FIELD: "MATHEMATICS", SUBFIELD: "MODELING_OR_STRUCTURE_AND_REPEATED_REASONING", MAP_FUNCTION: mapSubCategoryScore },

        // PSAT iMSSA Scores
        { TEST: "IMSSA_", CODE: "PSAT_EBRW", FIELD: "PSAT_EBRW", MAP_FUNCTION: mapScaledScore },
        { TEST: "IMSSA_", CODE: "PSAT_MATH", FIELD: "PSAT_MATHEMATICS", MAP_FUNCTION: mapScaledScore },

        //MSSA Scores --------------------Not Interim>
        { TEST: "MSSA_", CODE: "LANG_ART", FIELD: "LANGUAGE_ARTS", MAP_FUNCTION: mapNMScaledScore },
        { TEST: "MSSA_", CODE: "WRIT", FIELD: "WRITING", MAP_FUNCTION: mapNMScaledScore },
        { TEST: "MSSA_", CODE: "MATH", FIELD: "MATHEMATICS", MAP_FUNCTION: mapNMScaledScore },
        { TEST: "MSSA_", CODE: "READ", FIELD: "READING", MAP_FUNCTION: mapNMScaledScore },
        { TEST: "MSSA_", CODE: "SCI", FIELD: "SCIENCE", MAP_FUNCTION: mapNMScaledScore },

        //Reading
        { TEST: "MSSA_", CODE: "READ_LIT", FIELD: "READING", SUBFIELD: "LITERARY_TEXT", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "READ_INFO", FIELD: "READING", SUBFIELD: "INFORMATIONAL_TEXT", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "READ_COMP", FIELD: "READING", SUBFIELD: "COMPREHENSION", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "READ_AAI", FIELD: "READING", SUBFIELD: "ANALYSIS_AND_INTERPRETATION", MAP_FUNCTION: mapNMSubCategoryScore },

        //Writing
        { TEST: "MSSA_", CODE: "WRIT_WAALC", FIELD: "WRITING", SUBFIELD: "WRITING_ANALYSIS_AND_LANGUAGE_CONVENTIONS", MAP_FUNCTION: mapNMSubCategoryScore },

        //Math
        { TEST: "MSSA_", CODE: "MATH_OAAT", FIELD: "MATHEMATICS", SUBFIELD: "OPERATIONS_AND_ALGEBRIC_THINKING", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_NAOB10", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_AND_OPERATION_BASE10", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_NAOF", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_AND_OPERATION_FRACTIONS", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_MAD", FIELD: "MATHEMATICS", SUBFIELD: "MEASUREMENT_AND_DATA", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_GEOM", FIELD: "MATHEMATICS", SUBFIELD: "GEOMETRY", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_PS", FIELD: "MATHEMATICS", SUBFIELD: "PROBLEM_SOLVING", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_RAA", FIELD: "MATHEMATICS", SUBFIELD: "REASONING_AND_ARGUMENT", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_MA", FIELD: "MATHEMATICS", SUBFIELD: "MODELING", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_SARR", FIELD: "MATHEMATICS", SUBFIELD: "STRUCTURE_AND_REPEATED_REASONING", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_RAPR", FIELD: "MATHEMATICS", SUBFIELD: "RATIO_AND_PROPORTIONAL_RELATIONSHIP", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_NS", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_SYSTEM", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_EAE", FIELD: "MATHEMATICS", SUBFIELD: "EXPRESSION_AND_EQUATION", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_SAP", FIELD: "MATHEMATICS", SUBFIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_FA", FIELD: "MATHEMATICS", SUBFIELD: "FUNCTION", MAP_FUNCTION: mapNMSubCategoryScore },

        { TEST: "MSSA_", CODE: "MATH_NAOB10OF", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_AND_OPERATION_BASE10_OR_FRACTION", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_MADGEOM", FIELD: "MATHEMATICS", SUBFIELD: "MEASUREMENT_AND_DATA_OR_GEOMETRY", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_NSEAE", FIELD: "MATHEMATICS", SUBFIELD: "NUMBER_SYSTEM_EXPRESSION_OR_EQUATION", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_GEOMSAP", FIELD: "MATHEMATICS", SUBFIELD: "GEOMETRY_OR_STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_PSRAA", FIELD: "MATHEMATICS", SUBFIELD: "PROBLEM_SOLVING_OR_REASONING_AND_ARGUMENT", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "MATH_MASARR", FIELD: "MATHEMATICS", SUBFIELD: "MODELING_OR_STRUCTURE_AND_REPEATED_REASONING", MAP_FUNCTION: mapNMSubCategoryScore },

        //Science
        { TEST: "MSSA_", CODE: "SCI_LIFE", FIELD: "SCIENCE", SUBFIELD: "LIFE_SCIENCES", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "SCI_PHY", FIELD: "SCIENCE", SUBFIELD: "PHYSICAL_SCIENCES", MAP_FUNCTION: mapNMSubCategoryScore },
        { TEST: "MSSA_", CODE: "SCI_EARSPACE", FIELD: "SCIENCE", SUBFIELD: "EARTH_AND_SPACE_SCIENCES", MAP_FUNCTION: mapNMSubCategoryScore }

    ];

    var gradeDecode = {
        "Grade 03": "03",
        "Grade 04": "04",
        "Grade 05": "05",
        "Grade 06": "06",
        "Grade 07": "07",
        "Grade 08": "08",
        "Grade 09": "09",
        "Grade 10": "10",
        "Grade 11": "11",
        "Grade 12": "12"
    }

    var decodePassInd = {
        //iMSSA
        "Near Target": "No",
        "Needs Support": "No",
        "On Target": "Yes",
        "Medical Exemption": "No",
        "Incomplete": "No",
        "Other": "No",
        "Withdrew Before Test Completion": "No",
        "Absent": "No",
        //NMSSA and NMASR
        "Advanced": "Yes",
        "Nearing Proficiency": "No",
        "Novice": "No",
        "Proficient": "Yes",
        "Above": "Yes",
        "At/Near": "No",
        "Below": "No",
        "Did Not Meet Minimum Attempt": "No",
        "Void Test": "No",
        "": "No"
    }

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    //TODO add any additional decodes

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
    function mapNormalizedRecords(signature, hierarchy, rows, file) {
        var normalizedRecords = [];
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        var record = mapNormalizedRecord(signature, hierarchy, row, file);

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
    function mapNormalizedRecord(signature, hierarchy, row, file) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        var grade = determineGradeFromFile(file, row);

        var period = determinePeriodFromFile(file);

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, grade, period);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, grade, signature);

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

    /**
     * Maps normalized administration fields based on a given set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     */
    function mapNormalizedAdminFields(signature, hierarchy, row, grade, period) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var testDate = getTestAdminDate(period, hierarchy);

        normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, grade, period);
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
                    record.TEST_ADMIN_DATE =  _util.coalesce( testDate, "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9));
                    break;

                //Student Information
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(
                        row.getField("FIRST_NAME")
                    );
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(
                        row.getField("LAST_NAME")
                    );
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = grade;
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NUMBER"), 'DISTRICT');
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NUMBER"), 'DISTRICT');
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NUMBER"),'DISTRICT');
                    break;

                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }


    function getTestAdminDate(period, hierarchy) {
        var testDate = null;
        //iMSSA Cases
        if (period === 'BOY' || period === 'Fall') {
            testDate = "08/15/" + hierarchy.SCHOOL_YEAR.toString().substring(0,4);
        } else if (period === 'MOY' || period === 'Winter') {
            testDate = "12/15/" + hierarchy.SCHOOL_YEAR.toString().substring(0,4);
        } else if (period === 'EOY') {
            testDate = "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9);
        } else if (period === 'Spring') {
            //NM -MSSA/NMASR Case
            testDate = "04/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9);
        }
        return testDate;
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

    function mapScaledScore(row, testMetadata, grade, signature) {
        var score = {};
        var testNumber;

        if (signature.getFormat().getFormatName().indexOf('iMSSA') === -1) {
            return null;
        }

        testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE;

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + '_SCALE_SCORE'));

        var achievementLevel = _util.coalesce(row.getField(testMetadata.FIELD + '_ACHIEVEMENT_LEVEL'));

        var progressLevel = _util.coalesce(row.getField(testMetadata.FIELD + '_PROJECTION_LEVEL'));

        var readingLexiles = _util.coalesce(row.getField(testMetadata.FIELD + '_LEXILE_SCORE'));

        var mathQuantile = _util.coalesce(row.getField(testMetadata.FIELD + '_QUANTILE_SCORE'));

        if (scaleScore === null || scaleScore === undefined || scaleScore == "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        score["TEST_SCORE_TEXT"] = scaleScore;

        score["TEST_PRIMARY_RESULT"] = achievementLevel;

        score["TEST_PASSED_INDICATOR"] = decodePassInd[achievementLevel];

        score["TEST_SECONDARY_RESULT"] = progressLevel;

        score["TEST_READING_LEVEL"] = readingLexiles;

        score["TEST_QUARTILE_SCORE"] = mathQuantile;

        return score;
    }


    function mapNMScaledScore(row, testMetadata, grade, signature) {

        var score = {};
        var testNumber;

        if (signature.getFormat().getFormatName().indexOf('iMSSA') > -1) {
            return null;
        }

        var testLanguage = row.getField(testMetadata.FIELD + '_TEST_LANGUAGE');

        if (testLanguage === 'Spanish') {
            testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE + '_SP' ;
        } else {
            testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE;
        }

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + '_SCALE_SCORE'));

        var achievementLevel = _util.coalesce(row.getField(testMetadata.FIELD + '_ACHIEVEMENT_LEVEL'));

        var readingLexiles = _util.coalesce(row.getField(testMetadata.FIELD + '_LEXILE_SCORE'));

        var mathQuantile = _util.coalesce(row.getField(testMetadata.FIELD + '_QUANTILE_SCORE'));

        if (scaleScore === null || scaleScore === undefined || scaleScore == "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        score["TEST_SCORE_TEXT"] = scaleScore;

        score["TEST_READING_LEVEL"] = readingLexiles;

        score["TEST_QUARTILE_SCORE"] = mathQuantile;


        score["TEST_PRIMARY_RESULT"] = achievementLevel;

        score["TEST_PASSED_INDICATOR"] = decodePassInd[achievementLevel];

        return score;
    }


    function mapSubCategoryScore(row, testMetadata, grade, signature) {
        var score = {};

        var testNumber;

        if (signature.getFormat().getFormatName().indexOf('iMSSA') === -1) {
            return null;
        }

        testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE;

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + '_SCALE_SCORE'));

        var achievementLevel = _util.coalesce(row.getField(testMetadata.SUBFIELD + '_ACHIEVEMENT_LEVEL'));

        var pointsEarned = _util.coalesce(row.getField(testMetadata.SUBFIELD + '_POINTS_EARNED'));

        var pointsPossible = _util.coalesce(row.getField(testMetadata.SUBFIELD + '_POINTS_POSSIBLE'));

        if ((scaleScore === null || scaleScore === undefined || scaleScore === "") ||
        (achievementLevel === null || achievementLevel === undefined || achievementLevel === "")) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;
        score["TEST_ITEMS_ATTEMPTED"] = pointsEarned;
        score["TEST_PRIMARY_RESULT"] = achievementLevel;
        score["TEST_PASSED_INDICATOR"] = decodePassInd[achievementLevel];

        return score;
    }

    //For MSSA signatures, iMMSA uses other function
    function mapNMSubCategoryScore(row, testMetadata, grade, signature) {
        var score = {};

        var testNumber;

        if (signature.getFormat().getFormatName().indexOf('iMSSA') > -1) {
            return null;
        }

        var testLanguage = row.getField(testMetadata.FIELD + '_TEST_LANGUAGE');

        if (testLanguage === 'Spanish') {
            testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE + '_SP' ;
        } else {
            testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE;
        }

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + '_SCALE_SCORE'));

        var achievementLevel = _util.coalesce(row.getField(testMetadata.SUBFIELD + '_ACHIEVEMENT_LEVEL'));

        var pointsEarned = _util.coalesce(row.getField(testMetadata.SUBFIELD + '_POINTS_EARNED'));

        var pointsPossible = _util.coalesce(row.getField(testMetadata.SUBFIELD + '_POINTS_POSSIBLE'));


        if ((scaleScore === null || scaleScore === undefined || scaleScore === "") ||
        (achievementLevel === null || achievementLevel === undefined || achievementLevel === "")) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;
        score["TEST_ITEMS_ATTEMPTED"] = pointsEarned;
        score["TEST_PRIMARY_RESULT"] = achievementLevel;
        score["TEST_PASSED_INDICATOR"] = decodePassInd[achievementLevel];

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
            throw `${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}`;
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, grade, period) {

        if (signature.getFormat().getFormatName().indexOf('iMSSA') > -1) {
            _assessmentIdentifier = 'iMSSA';
        } else {
            _assessmentIdentifier = 'MSSA';
        }

        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;

        if(signature.getFormat().getFormatName() === "IMSSA_20_21_22_23"){
            var period = getTEST_ADMIN_PERIOD(srcRecord, hierarchy);
        }
        else{
            var period = period;
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        if(_assessmentIdentifier === 'iMSSA'){
            assessmentAdminKey = assessmentAdminKey + "_" + period;
        }
        assessmentAdminKey = assessmentAdminKey + '_' + grade;


        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }
      function getTEST_ADMIN_PERIOD(row, hierarchy){
            period = null;
            window = row.getField("ASSESSMENT_WINDOW");
            if(window!= null){
                window = window.toString().toUpperCase();
                if(window.indexOf("BOY") > -1){
                    period = "BOY";
                } else if(window.indexOf("MOY") > -1){
                    period = "MOY";
                } else if(window.indexOf("EOY") > -1){
                    period = "EOY";
                }
            } else {
                period = "ALL";
            }
            return period;
        }

    return module;
}());