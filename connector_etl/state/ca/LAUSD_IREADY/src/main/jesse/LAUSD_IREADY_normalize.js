var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LAUSD_IREADY";
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
            throw `${_thisModuleName}.createNormalizedFile Exception: ${exception}`;
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

     // Turned off Instruction cause it is not present - UIHN-73160
    var scoresToMap =
        [
            { MAP_FUNCTION: mapScaledScore, SUBJECT: 'OVERALL', TEST_NUMBER_SUFFIX: 'OVERALL', NAME: 'OVERALL' }

            //, { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'OVERALL', TEST_NUMBER_SUFFIX: 'INS_OVERALL', NAME: 'OVERALL' }

            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'OVERALL', TEST_NUMBER_SUFFIX: 'LES_OVERALL', NAME: 'OVERALL' }
            // --------------------------------MATH-------------------------------------
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'NUM_OPS', NAME: 'NUMBER_AND_OPERATIONS' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'ALG', NAME: 'ALGEBRA_AND_ALGEBRAIC_THINKING' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'MEASURE', NAME: 'MEASUREMENT_AND_DATA' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'GEO', NAME: 'GEOMETRY' }
            , { MAP_FUNCTION: mapProjectionScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'PROJ', NAME: '' }//Projection data

            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'MATH_SPA', TEST_NUMBER_SUFFIX: 'NUM_OPS', NAME: 'NUMBER_AND_OPERATIONS' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'MATH_SPA', TEST_NUMBER_SUFFIX: 'ALG', NAME: 'ALGEBRA_AND_ALGEBRAIC_THINKING' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'MATH_SPA', TEST_NUMBER_SUFFIX: 'MEASURE', NAME: 'MEASUREMENT_AND_DATA' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'MATH_SPA', TEST_NUMBER_SUFFIX: 'GEO', NAME: 'GEOMETRY' }

            /*, { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'INS_NUM_OPS', NAME: 'NUMBER_AND_OPERATIONS' }
            , { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'INS_ALG', NAME: 'ALGEBRA_AND_ALGEBRAIC_THINKING' }
            , { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'INS_MEASURE', NAME: 'MEASUREMENT_AND_DATA' }
            , { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'INS_GEO', NAME: 'GEOMETRY' }*/
            // --------------------------------ELA-------------------------------------
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'PHON_AWARE', NAME: 'PHONOLOGICAL_AWARENESS' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'PHONICS', NAME: 'PHONICS' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'HI_FREQ_WORD', NAME: 'HIGH-FREQUENCY_WORDS' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'VOCAB', NAME: 'VOCABULARY' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'READ_COMP_LIT', NAME: 'READING_COMPREHENSION_LITERATURE' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'READ_COMP_INFO_TEXT', NAME: 'READING_COMPREHENSION_INFORMATIONAL_TEXT' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'READ_COMP_OVR', NAME: 'READING_COMPREHENSION_OVERALL' }
            , { MAP_FUNCTION: mapProjectionScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'PROJ', NAME: '' }//Projection data
            // --------------------------------SPA-------------------------------------
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'RD_SPA', TEST_NUMBER_SUFFIX: 'PHON_AWARE', NAME: 'PHONOLOGICAL_AWARENESS' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'RD_SPA', TEST_NUMBER_SUFFIX: 'PHONICS', NAME: 'PHONICS' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'RD_SPA', TEST_NUMBER_SUFFIX: 'COMP_LIT', NAME: 'COMPREHENSION_LITERATURE' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'RD_SPA', TEST_NUMBER_SUFFIX: 'COMP_INFO_TEXT', NAME: 'COMPREHENSION_INFORMATIONAL_TEXT' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: 'RD_SPA', TEST_NUMBER_SUFFIX: 'VOCAB', NAME: 'VOCABULARY' }

            /*, { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'INS_PHON_AWARE', NAME: 'PHONOLOGICAL_AWARENESS' }
            , { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'INS_PHONICS', NAME: 'PHONICS' }
            , { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'INS_HI_FREQ_WORD', NAME: 'HIGH-FREQUENCY_WORDS' }
            , { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'INS_VOCAB', NAME: 'VOCABULARY' }
            , { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'INS_READING_COMP', NAME: 'READING_COMPREHENSION' }
            , { MAP_FUNCTION: mapInstructionScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'INS_READING_COMP_CLS_READING', NAME: 'READING_COMPREHENSION_CLOSE_READING' }*/

            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'LES_PHON_AWARE', NAME: 'PHONOLOGICAL_AWARENESS' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'LES_PHONICS', NAME: 'PHONICS' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'LES_HI_FREQ_WORD', NAME: 'HIGH-FREQUENCY_WORDS' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'LES_VOCAB', NAME: 'VOCABULARY' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'LES_READING_COMP', NAME: 'READING_COMPREHENSION' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'LES_READING_COMP_CLS_READING', NAME: 'READING_COMPREHENSION_CLOSE_READING' }

            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'LES_NUM_OPS', NAME: 'NUMBER_AND_OPERATIONS' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'LES_ALG', NAME: 'ALGEBRA_AND_ALGEBRAIC_THINKING' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'LES_MEASURE', NAME: 'MEASUREMENT_AND_DATA' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'LES_GEO', NAME: 'GEOMETRY' }
        ];
    var subject = "";

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var ref_GradeDecodes = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "KG",
        "K": "KG"
    };

    var ref_GradeDecodesNum = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "0",
        "K": "0"
    };

    var onLevelDecodes = {
        "Early 1": "Early",
        "Early 2": "Early",
        "Early 3": "Early",
        "Early 4": "Early",
        "Early 5": "Early",
        "Early 6": "Early",
        "Early 7": "Early",
        "Early 8": "Early",
        "Early 9": "Early",
        "Early 10": "Early",
        "Early 11": "Early",
        "Early 12": "Early",
        "Early K": "Early",
        "Early Algebra 1": "Early",
        "Early Algebra 2": "Early",
        "Early CCR Math": "Early",
        "Early Geometry": "Early",
        "Emerging K": null, //Emerging is a Level
        "Late 1": "Late",
        "Late 2": "Late",
        "Late 3": "Late",
        "Late 4": "Late",
        "Late 5": "Late",
        "Late 6": "Late",
        "Late 7": "Late",
        "Late 8": "Late",
        "Late 9": "Level 9",
        "Late 10": "Level 10",
        "Late 11": "Level 11",
        "Late 12": "Level 12",
        "Late K": "Late",
        "Late Algebra 1": "Late",
        "Late Algebra 2": "Late",
        "Late CCR Math": "Late",
        "Late Geometry": "Late",
        "Level 1": "Level 1",
        "Level 2": "Level 2",
        "Level 3": "Level 3",
        "Level 4": "Level 4",
        "Level 5": "Level 5",
        "Level 6": "Level 6",
        "Level 7": "Level 7",
        "Level 8": "Level 8",
        "Level 9": "Level 9",
        "Level 10": "Level 10",
        "Level 11": "Level 11",
        "Level 12": "Level 12",
        "Level K": "Level K",
        "Mid 1": "Mid",
        "Mid 2": "Mid",
        "Mid 3": "Mid",
        "Mid 4": "Mid",
        "Mid 5": "Mid",
        "Mid 6": "Mid",
        "Mid 7": "Mid",
        "Mid 8": "Mid",
        "Mid 9": "Mid",
        "Mid 10": "Mid",
        "Mid 11": "Mid",
        "Mid 12": "Mid",
        "Mid K": "Mid",
        "Mid Algebra 1": "Mid",
        "Mid Algebra 2": "Mid",
        "Mid CCR Math": "Mid",
        "Mid Geometry": "Mid",
        "Tested Out": null,
        "Early / Mid 1": "Early / Mid",
        "Early / Mid K": "Early / Mid",
        "Mid / Late K": "Mid / Late",
        "Mid / Late 1": "Mid / Late",
        "Mid / Late 9": "Mid / Late",
        "Mid / Late 10": "Mid / Late",
        "Mid / Late 11": "Mid / Late",
        "Mid / Late 12": "Mid / Late",
        "Max Score": null,
        "Grade 1": "Level 1",
        "Grade 2": "Level 2",
        "Grade 3": "Level 3",
        "Grade 4": "Level 4",
        "Grade 5": "Level 5",
        "Grade 6": "Level 6",
        "Grade 7": "Level 7",
        "Grade 8": "Level 8",
        "Grade 9": "Level 9",
        "Grade 10": "Level 10",
        "Grade 11": "Level 11",
        "Grade 12": "Level 12",
        "Grade K": "Level K",
        "Algebra 1": null,
        "Algebra 2": null,
        "Geometry": null,
        "CCR Math": null
    };
    var levelDecodes = {
        "Early 1": "Level 1",
        "Early 2": "Level 2",
        "Early 3": "Level 3",
        "Early 4": "Level 4",
        "Early 5": "Level 5",
        "Early 6": "Level 6",
        "Early 7": "Level 7",
        "Early 8": "Level 8",
        "Early 9": "Level 9",
        "Early 10": "Level 10",
        "Early 11": "Level 11",
        "Early 12": "Level 12",
        "Early K": "Level K",
        "Emerging K": "Emerging K",
        "Early Algebra 1": null,
        "Early Algebra 2": null,
        "Early CCR Math": null,
        "Early Geometry": null,
        "Late 1": "Level 1",
        "Late 2": "Level 2",
        "Late 3": "Level 3",
        "Late 4": "Level 4",
        "Late 5": "Level 5",
        "Late 6": "Level 6",
        "Late 7": "Level 7",
        "Late 8": "Level 8",
        "Late 9": "Level 9",
        "Late 10": "Level 10",
        "Late 11": "Level 11",
        "Late 12": "Level 12",
        "Late K": "Level K",
        "Late Algebra 1": null,
        "Late Algebra 2": null,
        "Late CCR Math": null,
        "Late Geometry": null,
        "Level 1": "Level 1",
        "Level 2": "Level 2",
        "Level 3": "Level 3",
        "Level 4": "Level 4",
        "Level 5": "Level 5",
        "Level 6": "Level 6",
        "Level 7": "Level 7",
        "Level 8": "Level 8",
        "Level 9": "Level 9",
        "Level 10": "Level 10",
        "Level 11": "Level 11",
        "Level 12": "Level 12",
        "Level K": "Level K",
        "Mid 1": "Level 1",
        "Mid 2": "Level 2",
        "Mid 3": "Level 3",
        "Mid 4": "Level 4",
        "Mid 5": "Level 5",
        "Mid 6": "Level 6",
        "Mid 7": "Level 7",
        "Mid 8": "Level 8",
        "Mid 9": "Level 9",
        "Mid 10": "Level 10",
        "Mid 11": "Level 11",
        "Mid 12": "Level 12",
        "Mid K": "Level K",
        "Mid Algebra 1": null,
        "Mid Algebra 2": null,
        "Mid CCR Math": null,
        "Mid Geometry": null,
        "Tested Out": null,
        "Early / Mid 1": "Level 1",
        "Early / Mid K": "Level K",
        "Mid / Late K": "Level K",
        "Mid / Late 1": "Level 1",
        "Mid / Late 12": "Level 12",
        "Mid / Late 11": "Level 11",
        "Mid / Late 9": "Level 9",
        "Mid / Late 10": "Level 10",
        "Max Score": null,
        "Grade 1": "Level 1",
        "Grade 2": "Level 2",
        "Grade 3": "Level 3",
        "Grade 4": "Level 4",
        "Grade 5": "Level 5",
        "Grade 6": "Level 6",
        "Grade 7": "Level 7",
        "Grade 8": "Level 8",
        "Grade 9": "Level 9",
        "Grade 10": "Level 10",
        "Grade 11": "Level 11",
        "Grade 12": "Level 12",
        "Grade K": "Level K",
        "Algebra 1": null,
        "Algebra 2": null,
        "Geometry": null,
        "CCR Math": null
    };
    var levelRank = {
        "Emerging K": "-1",
        "Level 1": "1",
        "Level 2": "2",
        "Level 3": "3",
        "Level 4": "4",
        "Level 5": "5",
        "Level 6": "6",
        "Level 7": "7",
        "Level 8": "8",
        "Level 9": "9",
        "Level 10": "10",
        "Level 11": "11",
        "Level 12": "12",
        "Level K": "0"
    };

    var decodeProfLevel = {
        "Standard Not Met": "1",
        "Standard Nearly Met": "2",
        "Standard Met": "3",
        "Standard Exceeded": "4",
        null: null
    };

    var decodegroup = {
        "Tier 1" : "1",
        "Tier 2" : "2",
        "At risk for Tier 3" : "3",
        "1" : "1",
        "2" : "2",
        "3" : "3",
        "4" : "4",
        "5" : "5",
        null : null,
        "" : null
    };

    var decodeRecent = {
        "Y": "1",
        "N": null,
        null : null,
        "" : null
    };
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

        if(row.getField("COMPLETION_DATE_0")!==undefined){//Testing if this speeds up the process for tests with only latest
        //There are 6 buckets, bucket 0 is most recent, buckets 1-5 represent other attempts
            var record = mapNormalizedRecord(signature, hierarchy, row, "0");
            AppUtil.nullSafePush(normalizedRecords, record);
        }

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
    function mapNormalizedRecord(signature, hierarchy, row, attempt) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, attempt);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, attempt,signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
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
    function mapNormalizedAdminFields(signature, hierarchy, row, attempt) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        if(row.getField("COMPLETION_DATE_" + attempt) !== "NULL"){
            if (row.getField("COMPLETION_DATE_" + attempt) !== null && row.getField("COMPLETION_DATE_" + attempt) !== undefined) {
                var format = getDateFormat(row.getField("COMPLETION_DATE_" + attempt));
                var testDate = AppUtil.getDateObjByPattern(row.getField("COMPLETION_DATE_" + attempt), format).STANDARD_DATE;
            }
            else {
                var testDate = null;
            }
        }else{
            var testDate = null;
        }

        var studentId = row.getField("STUDENT_ID");
        if(studentId !== null && studentId !== undefined && studentId !== "") {
           if(studentId.indexOf("_") > -1) {
             studentId = studentId.split("_")[0];
           }
           else {
             studentId = studentId;
           }
        }
        var studentGenderCode = null;
        var genderCode = row.getField("GENDER");
        if (genderCode != null){
            studentGenderCode = _util.trim(row.getField("GENDER") + "-").substring(0, 1).toUpperCase();
        }

        normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row) + "_" + attempt;
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
                case "PARTICIPATION_YEAR":
                    record.PARTICIPATION_YEAR = _util.coalesce(row.getField("ACADEMIC_YEAR"));
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(row, hierarchy.REPORTING_PERIOD, hierarchy.SCHOOL_YEAR, attempt);
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
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = studentId;
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"), studentId);
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = studentId;
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = studentGenderCode;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(ref_GradeDecodes[_util.trim(row.getField("STUDENT_GRADE"))]);
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = _util.coalesce(ref_GradeDecodes[_util.trim(row.getField("STUDENT_GRADE"))]);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL"), row.getField("SCHOOL_ID"),"DISTRICT");
                    break;
                case"SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID=_util.coalesce(row.getField("SCHOOL_STATE_ID"));
                    break;
                case"SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID=_util.coalesce(row.getField("STATE_SCHOOL_ID"));//storing null since file doesn't have stateid
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL"));
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
        //initialize admin objects
        var admin = {};
        var code = "--";
        admin.TEST_INTERVENTION_CODE = null;
        admin.TEST_INTERVENTION_DESC = null;
        admin.TEST_INTERVENTION_CODE_2 = null;
        admin.TEST_INTERVENTION_DESC_2 = null;
        admin.TEST_INTERVENTION_CODE_3 = null;
        admin.TEST_INTERVENTION_DESC_3 = null;
        admin.TEST_INTERVENTION_CODE_4 = null;
        admin.TEST_INTERVENTION_DESC_4 = null;

        //Map additional admin fields in vars
        var rushFlag = _util.coalesce(row.getField("RUSH_FLAG"), row.getField("NOTES"), "--");
        var enrolledMap = row.getField("ENROLLED");
        var baselineDiagnostic = row.getField("BASELINE_DIAG");
        var mostRecentDiagnostic = row.getField("MOST_RECENT_0");

        //Field name changed from NOTES to RUSH FLAG on 12/13/2019.  Used mapFirstAvailable to allow for backwards compatibility
        if (null != rushFlag && "" != rushFlag) {
            if (null != row.getField("NOTES") && "" != row.getField("NOTES")) {
                code = "Notes";
            }
            else if (null != row.getField("RUSH_FLAG") && "" != row.getField("RUSH_FLAG")) {
                code = "Rush Flag";
            }
            admin.TEST_INTERVENTION_CODE = code;
            admin.TEST_INTERVENTION_DESC = rushFlag;
        }

        //Field mapped for ENROLLED
        if (enrolledMap !== undefined  && enrolledMap !== null  && enrolledMap !== "") {
            if(enrolledMap.toUpperCase() === "ENROLLED"){
                admin.TEST_INTERVENTION_CODE_2 = enrolledMap;
                admin.TEST_INTERVENTION_DESC_2 = "Enrolled";
            } else {
                admin.TEST_INTERVENTION_CODE_2 = enrolledMap;
                admin.TEST_INTERVENTION_DESC_2 = "Not Enrolled";
            }
        }

        //Field mapped for BaseLine Diagnostic
        if (baselineDiagnostic !== undefined  && baselineDiagnostic !== null  && baselineDiagnostic !== "") {
            if(baselineDiagnostic.toUpperCase() === "Y"){
                admin.TEST_INTERVENTION_CODE_3 = baselineDiagnostic;
                admin.TEST_INTERVENTION_DESC_3 = "Baseline Diagnostic Yes";
            } else {
                admin.TEST_INTERVENTION_CODE_3 = 'N';
                admin.TEST_INTERVENTION_DESC_3 = "Baseline Diagnostic No";
            }
        }

        //Field mapped for Most Recent Diagnostic
        if (mostRecentDiagnostic !== undefined  && mostRecentDiagnostic !== null  && mostRecentDiagnostic !== "") {
            if(mostRecentDiagnostic.toUpperCase() === "Y"){
                admin.TEST_INTERVENTION_CODE_4 = mostRecentDiagnostic;
                admin.TEST_INTERVENTION_DESC_4 = "Most Recent Diagnostic Yes";
            } else {
                admin.TEST_INTERVENTION_CODE_4 = 'N';
                admin.TEST_INTERVENTION_DESC_4 = "Most Recent Diagnostic No";
            }
        }
        return admin;
    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata, attempt,signature) {
        var score = {};
        var subject = "";
        var isELA = false;
        var isELASPA = false;
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        if ((JSON.stringify(row)).indexOf("LEXILE_MEASURE") > -1) {
            subject = "ELA";
            isELA = true;
        }
        if (fileName.indexOf('MATH') > -1) {
            subject = "MATH";
        }
        if (row.getField("SUBJECT") == "Reading") {
            subject = "ELA";
            isELA = true;
        }
        if(isELA == false && row.getField("DIAGNOSTIC_LANGUAGE") !== null && row.getField("DIAGNOSTIC_LANGUAGE") !== undefined) {
            if((row.getField("DIAGNOSTIC_LANGUAGE") === "Spanish")) {
                subject = "MATH_SPA";
            } else {
                subject = "MATH";
            }
        } else if( testMetadata.SUBJECT == 'RD_SPA' && (signature.format.formatName === "iReady_2223_spanish" || signature.format.formatName === "LA_iReady_23_24_Spanish_ELA")){
            subject = "RD_SPA";
        } else if (testMetadata.SUBJECT === 'OVERALL' && (signature.format.formatName === "iReady_2223_spanish" || signature.format.formatName === "LA_iReady_23_24_Spanish_ELA")) {
            subject = "ELA_SPA";
            isELASPA = true;
            isELA = true;
        }else if(isELA == false) {
            subject = "MATH";
        }
        
        //Only map scores associated to current subject or if the score is an overall score.
        if (testMetadata.SUBJECT !== 'OVERALL' && testMetadata.SUBJECT !== subject && isELASPA === false) {
            return null;
        }
        if (testMetadata.SUBJECT !== 'OVERALL' && testMetadata.SUBJECT !== "ELA_SPA" && isELASPA === true) {
            //special condition for ELA Spanish cases
            return null;
        }
        if (row.getField("COMPLETION_DATE_" + attempt) === undefined ||row.getField("COMPLETION_DATE_" + attempt) === "NULL" || row.getField("COMPLETION_DATE_" + attempt) === null) {
            return null;
        }
        
        var testNumber = 'LA_IREADY_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
        var scaleScore = row.getField(testMetadata.NAME + '_SCALE_SCORE_' + attempt);

        var profLevel = row.getField('SBAC_ACH_LEVEL');
        var placementScore = _util.coalesce(row.getField(testMetadata.NAME + '_PLACEMENT_' + attempt),row.getField("OVERALL_SPANISH_PLACEMENT"));
        var relativePlacementScore = row.getField(testMetadata.NAME + '_RELATIVE_PLACEMENT_' + attempt);
        if(subject === "RD_SPA"){
            var percentScore = row.getField(testMetadata.NAME + '_%_Correct');
        }
        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === undefined){
            return null;
        }
        if (((scaleScore === null ||  _util.trim(scaleScore) == "" ||  _util.trim(scaleScore) == "NULL") && placementScore !== "Tested Out") &&
        (percentScore === null || percentScore === undefined || _util.trim(percentScore) == "") && isELASPA === false) {
            var testNumber = 'LA_IREADY_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
            score["TEST_NUMBER"] = testNumber;
            score["TEST_PRIMARY_RESULT"] = "No Score";
            score["TEST_CUSTOM_RESULT"] = relativePlacementScore;
            return score;
        }
        var recent =  row.getField('MOST_RECENT_0');
        var difficulty = row.getField('READING_DIFFICULTY_INDICATOR');

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_PERCENTAGE_SCORE"]= percentScore;

        if (!isNaN(scaleScore)&&scaleScore!= null) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (profLevel !== null) {
            score["TEST_PRIMARY_RESULT"] = profLevel;
            score["TEST_PRIMARY_RESULT_CODE"] = decodeProfLevel[profLevel];
        } else if(placementScore !== null){
            score["TEST_PRIMARY_RESULT"] = placementScore;
        }
        if (placementScore === "Tested Out") {
            score["TEST_SCORE_VALUE"] = null;
            score["TEST_SCALED_SCORE"] = null;
        }

        var lower = '';
        var upper = '';

        if (testMetadata.SUBJECT == "OVERALL" && subject == "ELA" && row.getField("LEXILE_MEASURE_0") !== null) {
            var lexileValue =  row.getField("LEXILE_MEASURE_" + attempt);
            var LexileRange = row.getField("LEXILE_RANGE_0");
            
            if (lexileValue !== null && lexileValue !== undefined && lexileValue !== "") {
                score["TEST_READING_LEVEL"] = lexileValue.replace("L", "").replace("BR", "").trim();
            }
            
            if (LexileRange !== null && LexileRange !== undefined && LexileRange !== "" && (LexileRange.contains('-'))) {
                lower = LexileRange.split("-")[0].replace("L", "").replace("BR", "").trim();
                upper = LexileRange.split("-")[1].replace("L", "").replace("BR", "").trim();
            } else {
                lower = row.getField("LEXILE_RANGE_0").replace("L", "").replace("BR", "").trim();
            }
        }
        if (testMetadata.SUBJECT == "OVERALL" && (subject == "MATH" || subject == "MATH_SPA" ) && row.getField("QUANTILE_MEASURE_0") !== null) {
            score["TEST_NCE_SCORE"] = row.getField("QUANTILE_MEASURE_0").replace("Q", "").replace("EM", "").trim();
            var QuantileRange = row.getField("QUANTILE_RANGE_0");
            if (QuantileRange !== null && QuantileRange !== undefined && QuantileRange !== "" && (QuantileRange.contains('-'))) {
                lower = QuantileRange.split("-")[0].replace("Q", "").replace("EM", "").trim();
                upper = QuantileRange.split("-")[1].replace("Q", "").replace("EM", "").trim();
            } else {
                lower = row.getField("QUANTILE_RANGE_0").replace("Q", "").replace("EM", "").trim();
            }
        }
        if(lower === ''){
            lower = null;
        }
        if(upper === ''){
            upper = null;
        }
        score["TEST_LOWER_BOUND"] = lower;
        score["TEST_UPPER_BOUND"] = upper;

        var timeOnTask = row.getField("TIME_ON_TASK_MIN_" + attempt);
        var group = row.getField("GROUPING_" + attempt);

        if (testMetadata.SUBJECT == "OVERALL") {
            //New in 2020 Diagnostic

            if(timeOnTask !== null && timeOnTask !== undefined) {
                score["TEST_ITEMS_ATTEMPTED"] = parseInt(timeOnTask);
            }
            if (group !== null) {
                score["TEST_Z_SCORE"] = decodegroup[parseInt(group)];
            }
            if (row.getField("TIER_" + attempt) !== null) {
                score["TEST_SCORE_TO_PREDICTED_RESULT"] = row.getField("TIER_" + attempt);
            }
            if (row.getField("ANNUAL_TYPICAL_GROWTH_MEASURE") !== null) {
                score["TEST_GROWTH_TARGET_1"] = row.getField("ANNUAL_TYPICAL_GROWTH_MEASURE");
            }
            if (row.getField("ANNUAL_STRETCH_GROWTH_MEASURE") !== null) {
                score["TEST_GROWTH_TARGET_2"] = row.getField("ANNUAL_STRETCH_GROWTH_MEASURE");
            }

            var dignosticGain = row.getField("DIAGNOSTIC_GAIN_" + attempt);

            if((row.getField("USED_GROWTH_MEASURES_0") === "Y") &&
            (dignosticGain && (dignosticGain !== null || dignosticGain !== undefined || dignosticGain !== ''))) {
                if (row.getField("PERCENT_PROGRESS_TO_ANNUAL_TYPICAL_GROWTH_(%)") !== null) {
    
                    score["TEST_GROWTH_TARGET_3"] = row.getField("PERCENT_PROGRESS_TO_ANNUAL_TYPICAL_GROWTH_(%)");
                }
                if (row.getField("PERCENT_PROGRESS_TO_ANNUAL_STRETCH_GROWTH_(%)") !== null) {
    
                    score["TEST_GROWTH_TARGET_4"] = row.getField("PERCENT_PROGRESS_TO_ANNUAL_STRETCH_GROWTH_(%)");
                }
            }else{
                if (row.getField("PERCENT_PROGRESS_TO_ANNUAL_TYPICAL_GROWTH_(%)") !== null) {
    
                    score["TEST_GROWTH_TARGET_3"] = row.getField("PERCENT_PROGRESS_TO_ANNUAL_TYPICAL_GROWTH_(%)");
                }
                if (row.getField("PERCENT_PROGRESS_TO_ANNUAL_STRETCH_GROWTH_(%)") !== null) {
    
                    score["TEST_GROWTH_TARGET_4"] = row.getField("PERCENT_PROGRESS_TO_ANNUAL_STRETCH_GROWTH_(%)");
                }
            }

            if (row.getField("MID_ON_GRADE_LEVEL_SCORE_" + attempt) !== null) {
                score["TEST_GROWTH_RESULT_CODE"] = row.getField("MID_ON_GRADE_LEVEL_SCORE_" + attempt);
            }
            if (row.getField("COMPLETION_DATE_" + attempt) !== null) {
                score["TEST_SCORE_ATTRIBUTES"] = row.getField("COMPLETION_DATE_" + attempt);
            }
            if (row.getField("PERCENTILE_" + attempt) !== null) {
                score["TEST_PERCENTILE_SCORE"] = row.getField("PERCENTILE_" + attempt);
            }
        }

        var secondaryPlacement = onLevelDecodes[placementScore];
        if (secondaryPlacement == undefined) {
            secondaryPlacement = null;
        }
        var tertiaryPlacement = levelDecodes[placementScore];
        if (tertiaryPlacement == undefined) {
            tertiaryPlacement = null;
        }
        score["TEST_SECONDARY_RESULT"] = secondaryPlacement;
        score["TEST_TERTIARY_RESULT"] = tertiaryPlacement;
        score["TEST_CUSTOM_RESULT"] = relativePlacementScore;
        score["TEST_GRADE_EQUIVALENT"] = dignosticGain;
        score["TEST_DECILE_SCORE"] = difficulty;

        var quat = parseInt(levelRank[levelDecodes[placementScore]]);
        var curr = _util.coalesce(ref_GradeDecodesNum[_util.trim(row.getField("STUDENT_GRADE"))], row.getField("STUDENT_GRADE"), '@ERR');
        if (curr != null && curr != "" && curr != "@ERR") {
            curr = parseInt(curr, 10);
            if (signature.format.formatName !== "iReady_Math_DI" && signature.format.formatName !== "iReady_Reading_DI") {
                if (quat - curr == 0 || placementScore == "Tested Out") {
                    score["TEST_QUATERNARY_RESULT"] = "On Level";
                }
                else if (quat - curr > 0 || placementScore == "Max Score") {
                    score["TEST_QUATERNARY_RESULT"] = "Above Level";
                }
                else if (quat - curr == -1) {
                    score["TEST_QUATERNARY_RESULT"] = "1 Level Below";
                }
                else if (quat - curr == -2) {
                    score["TEST_QUATERNARY_RESULT"] = "2 Level Below";
                }
                else if (quat - curr < -2) {                
                    score["TEST_QUATERNARY_RESULT"] = "3 or More Levels Below";
                }
            } else {
                if (quat - curr == 0 || placementScore == "Tested Out") {
                    score["TEST_QUATERNARY_RESULT"] = "On Level";
                }
                else if (quat - curr > 0 || placementScore == "Max Score") {
                    score["TEST_QUATERNARY_RESULT"] = "Above Level";
                }
                else if (quat - curr == -1) {
                    score["TEST_QUATERNARY_RESULT"] = "1 Level Below";
                }
                else if (quat - curr < -1) {
                    score["TEST_QUATERNARY_RESULT"] = "2 or More Levels Below";
                }
            }
        }
        if (placementScore === "Tested Out") {
            score["TEST_PERCENTILE_SCORE"] = null;
        }
        score["TEST_ATTEMPT_NUMBER"] = decodeRecent[recent];
        return score;
    }

    function mapInstructionScore(row, testMetadata, attempt,signature) {
        var score = {};
        var subject = "";
        var isELA = false;
        if ((JSON.stringify(row)).indexOf("LEXILE_MEASURE") > -1) {
            subject = "ELA";
            isELA = true;
        }
        if (row.getField("SUBJECT") == "Reading") {
            subject = "ELA";
            isELA = true;
        }
        if (isELA == false) {
            subject = "MATH";
        }
        //Only map scores associated to current subject or if the score is an overall score.
        if (testMetadata.SUBJECT !== 'OVERALL' && testMetadata.SUBJECT !== subject) {
            return null;
        }
        if (row.getField("COMPLETION_DATE_" + attempt) === undefined || row.getField("COMPLETION_DATE_" + attempt) === null) {
           return null;
        }

        var testNumber = 'LA_IREADY_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
        var placementScore = row.getField(testMetadata.NAME + '_PLACEMENT_' + attempt);
        var scaleScore = row.getField(testMetadata.NAME + '_PASS_RATE_%');
        if ((signature.format.formatName == "LA_iReadyELA0SS" || signature.format.formatName == "LA_iReadyMATH0SS") && (scaleScore === null || scaleScore === "")){
            var testNumber = 'LA_IREADY_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
            score["TEST_NUMBER"] = testNumber;
            score["TEST_PRIMARY_RESULT"] = "No Score";
            return score;
        }
        // Added this condition only for these 2 sig because the customer wanted all scale scores even if it is null or 0 (UIHN-35356)
         if (signature.format.formatName !== "LA_iReadyELA0SS" && signature.format.formatName !== "LA_iReadyMATH0SS"){
            if (!scaleScore) {
                var testNumber = 'LA_IREADY_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
                score["TEST_NUMBER"] = testNumber;
                score["TEST_PRIMARY_RESULT"] = "No Score";
                return score;
            }
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_ITEMS_ATTEMPTED"] = Math.round(row.getField(testMetadata.NAME + "_TIME_ON_TASK_MIN"));

        var quat = parseInt(levelRank[levelDecodes[placementScore]]);
        var curr = _util.coalesce(ref_GradeDecodesNum[_util.trim(row.getField("STUDENT_GRADE"))], row.getField("STUDENT_GRADE"), '@ERR');
        if (curr != null && curr != "" && curr != "@ERR") {
            curr = parseInt(curr, 10);

            if (signature.format.formatName !== "iReady_Math_DI" && signature.format.formatName !== "iReady_Reading_DI") {
                if (quat - curr == 0 || placementScore == "Tested Out") {
                    score["TEST_QUATERNARY_RESULT"] = "On Level";
                }
                else if (quat - curr > 0 || placementScore == "Max Score") {
                    score["TEST_QUATERNARY_RESULT"] = "Above Level";
                }
                else if (quat - curr == -1) {
                    score["TEST_QUATERNARY_RESULT"] = "1 Level Below";
                }
                else if (quat - curr == -2) {
                    score["TEST_QUATERNARY_RESULT"] = "2 Level Below";
                }
                else if (quat - curr < -2) {
                         score["TEST_QUATERNARY_RESULT"] = "3 or More Levels Below";
                }
            } else {
                if (quat - curr == 0 || placementScore == "Tested Out") {
                    score["TEST_QUATERNARY_RESULT"] = "On Level";
                }
                else if (quat - curr > 0 || placementScore == "Max Score") {
                    score["TEST_QUATERNARY_RESULT"] = "Above Level";
                }
                else if (quat - curr == -1) {
                    score["TEST_QUATERNARY_RESULT"] = "1 Level Below";
                }
                else if (quat - curr < -1) {
                    score["TEST_QUATERNARY_RESULT"] = "2 or More Levels Below";
                }
            }
        }
        return score;
    }

    function mapProjectionScore(row, testMetadata, attempt) {
        var score = {};
        var subject = "";
        var isELA = false;
        if ((JSON.stringify(row)).indexOf("LEXILE_MEASURE") > -1) {
            subject = "ELA";
            isELA = true;
        }
        if (isELA == false) {
            subject = "MATH";
        }
        //Only map scores associated to current subject or if the score is an overall score.
        if (testMetadata.SUBJECT !== subject) {
            return null;
        }
        if (row.getField("COMPLETION_DATE_" + attempt) === undefined || row.getField("COMPLETION_DATE_" + attempt) === null) {
            return null;
        }
        var testNumber = 'LA_IREADY_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
        var noGrowth = row.getField("PROFICIENCY_IF_STUDENT_SHOWS_NO_ADDITIONAL_GROWTH");
        var typicalGrowth = row.getField("PROJECTION_IF_STUDENT_ACHIEVES_TYPICAL_GROWTH");
        var stretchGrowth = row.getField("PROJECTION_IF_STUDENT_ACHIEVES_STRETCH_GROWTH");
        var recent =  row.getField('MOST_RECENT_0');
        var difficulty = row.getField('READING_DIFFICULTY_INDICATOR');

        if (!noGrowth && noGrowth !== undefined) {
            var testNumber = 'LA_IREADY_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
            score["TEST_NUMBER"] = testNumber;
            score["TEST_PRIMARY_RESULT"] = "No Score";
            return score;
        }
        else if (noGrowth === undefined){
           return null;
       }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = noGrowth;
        score["TEST_PRIMARY_RESULT_CODE"] = "No Growth";
        score["TEST_PRIMARY_RESULT"] = noGrowth;
        score["TEST_SECONDARY_RESULT_CODE"] = "Typical Growth";
        score["TEST_SECONDARY_RESULT"] = typicalGrowth;
        score["TEST_TERTIARY_RESULT_CODE"] = "Stretch Growth";
        score["TEST_TERTIARY_RESULT"] = stretchGrowth;
        score["TEST_ATTEMPT_NUMBER"] = decodeRecent[recent];
        score["TEST_DECILE_SCORE"] = difficulty;

        return score;
    }

    function mapLessonScore(row, testMetadata, attempt,signature) {
        var score = {};
        var subject = "";
        var isELA = false;

        if (row.getField("SUBJECT") == "Reading") {
            subject = "ELA";
            isELA = true;
        }

        if (isELA == false || row.getField("SUBJECT") == "Math"){
            subject = "MATH";
            isELA = false;
        }

        if (testMetadata.SUBJECT !== 'OVERALL' && testMetadata.SUBJECT !== subject) {
            return null;
        }

        //If a signature doesn't have lessons, don't add lessons
        if(signature.format.formatName !== "LA_iReadyELA0SS" && signature.format.formatName !== "LA_iReadyMATH0SS"){
            return null;
        }

      if (row.getField("COMPLETION_DATE_" + attempt) === undefined || row.getField("COMPLETION_DATE_" + attempt) === null) {
         return null;
      }

      var testNumber = 'LA_IREADY_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
      var PassedScore = row.getField(testMetadata.NAME + '_LESSONS_PASSED');
      var FailedScore = row.getField(testMetadata.NAME + '_LESSONS_NOT_PASSED');
      var CompletedScore = row.getField(testMetadata.NAME + '_LESSONS_COMPLETED');
      var PassRateScore = row.getField(testMetadata.NAME + '_PASS_RATE_%');
      var TimeOnTaskScore = row.getField(testMetadata.NAME + '_TIME_ON_TASK_MIN');

      if (PassedScore === null || PassedScore === ""){
        PassedScore = "0";
        score["TEST_CUSTOM_RESULT"] = "Zero Score";
      }
      if(FailedScore === null || FailedScore === ""){
        FailedScore = "0";
      }
      if(CompletedScore === null || CompletedScore === ""){
        CompletedScore = "0";
        score["TEST_CUSTOM_RESULT"] = "Zero Score";
      }
      if(PassRateScore === null || PassRateScore === ""){
         PassRateScore = "0";
      }
      if(TimeOnTaskScore === null || TimeOnTaskScore === ""){
         TimeOnTaskScore = "0";
         score["TEST_CUSTOM_RESULT"] = "Zero Score";
      }

      score["TEST_NUMBER"] = testNumber;
      score["TEST_SCORE_TEXT"] = PassedScore;
      if (!isNaN(PassedScore) && PassedScore !== "0") {
          score["TEST_SCORE_VALUE"] = parseInt(PassedScore);
          score["TEST_SCALED_SCORE"] = parseInt(PassedScore);
          score["TEST_ITEMS_ATTEMPTED"] = parseInt(PassedScore);
      }
      else if (PassedScore === "0"){
          score["TEST_SCORE_VALUE"] =PassedScore;
          score["TEST_SCALED_SCORE"] = PassedScore;
          score["TEST_ITEMS_ATTEMPTED"] = PassedScore;
      }

      if(!isNaN(FailedScore) && FailedScore !== "0"){
        score["TEST_RAW_SCORE"] = parseInt(FailedScore);
      }
      else if(FailedScore === "0"){
        score["TEST_RAW_SCORE"] = FailedScore;
      }

      if(CompletedScore !== "0") {
        score["TEST_ITEMS_POSSIBLE"] = parseInt(CompletedScore);
      }
      else{
         score["TEST_ITEMS_POSSIBLE"] = CompletedScore;
      }

      if(PassRateScore !== "0"){
        score["TEST_PERCENTAGE_SCORE"] = parseInt(PassRateScore);
      }
      else{
        score["TEST_PERCENTAGE_SCORE"] =PassRateScore;
      }

      score["TEST_SCORE_ATTRIBUTES"] = TimeOnTaskScore;
      return score;
    }


    /***************************************************************************
     Utility Functions
     ***************************************************************************/
    function getDateObject(rawDate) {

        var dateObj = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        // Check to see if date string exists
        if (rawDate !== undefined && rawDate !== null) {

            var year = '';
            var month = '';
            var day = '';

            if (rawDate.indexOf('-') > -1) {
                var positionOne = rawDate.indexOf('-');
                var positionTwo = rawDate.indexOf('-', (positionOne + 1));

                month = padDateElement(rawDate.substring(positionOne + 1, positionTwo));
                day = padDateElement(rawDate.substring(positionTwo + 1, positionTwo + 3));
                year = padDateElement(rawDate.substring(0, positionOne));
            } else if (rawDate.indexOf('/') > -1) {
                var positionOne = rawDate.indexOf('/');
                var positionTwo = rawDate.indexOf('/', (positionOne + 1));

                month = padDateElement(rawDate.substring(0, positionOne));
                day = padDateElement(rawDate.substring(positionOne + 1, positionTwo));
                year = padDateElement(rawDate.substring(positionTwo + 1, positionTwo + 5));

            }

            // Add century if missing
            if (year !== '' && year < 100) {
                year = '20' + year;
            }

            var standardDate = month + '/' + day + '/' + year;

            dateObj.RAW_DATE = rawDate;
            dateObj.MONTH = month;
            dateObj.DAY = day;
            dateObj.YEAR = year;
            dateObj.STANDARD_DATE = standardDate != '//' ? standardDate : null;

        }



        return dateObj;
    }

    function padDateElement(element) {
        if (element.length == 1)
            return '0' + element;
        else
            return element;
    }

    function getDateFormat(rawDate) {
        var format;

        if (rawDate.indexOf('/') > -1) {
            if (rawDate.split('/')[0].length === 4) {
                format = 'yyyy/MM/dd';
            }
            else if (rawDate.length === 9) {
                format = "M/dd/yyyy";
            }
            else if (rawDate.length === 10) {
                format = "MM/dd/yyyy";
            }
            else {
                format = 'MM/dd/yy';
            }
        } else if (rawDate.indexOf('-') > -1) {
            if (rawDate.split('-')[0].length === 4) {
                format = 'yyyy-MM-dd';
            } else if (rawDate.split('-')[1].length === 3) {
                format = 'dd-MMM-yy';
            } else if (rawDate.split('-')[2].length === 4) {
                format = 'MM-dd-yyyy';
            }
            else {
                format = 'MM-dd-yy';
            }
        }
        return format
    }

    function getTEST_ADMIN_PERIOD(row, filePeriod, schoolYear, attempt) {
        var testAdminPeriod = filePeriod;
        var windowSplit = "";
        var window = _util.trim(row.getField("Window"));
        if(row.getField("COMPLETION_DATE_" + attempt) !== "NULL"){
            if (filePeriod === 'ALL' && row.getField("COMPLETION_DATE_" + attempt) !== null && (window === null || window === undefined)) {
                var format = getDateFormat(row.getField("COMPLETION_DATE_" + attempt));
                var sd = AppUtil.getDateObjByPattern(row.getField("COMPLETION_DATE_" + attempt), format);
                var month = sd.MONTH;
                var day = sd.DAY;
                if(schoolYear > "2019-2020"){
                    //Periods changed per vendor in 2020-2021 - see UIHN-65106
                    if (month === "07" || month === "08" || month === "09" || month === "10" || (month === "11" && day < "16"))
                        //Start of school year thru Nov 15
                        testAdminPeriod = "Fall";
                    else if (month === "11" || month === "12" || month === "01" || month === "02" || (month === "03" && day === "01"))
                        //Nov 16 to March 1
                        testAdminPeriod = "Winter";
                    else if (month === "03" || month === "04" || month === "05" || month === "06")
                        //March 2 to end of school year
                        testAdminPeriod = "Spring";
                }
                else
                {
                    if (month === "07" || month === "08" || month === "09" || month === "10" || month === "11")
                        //Start of school year thru Nov 30
                        testAdminPeriod = "Fall";
                    else if (month === "12" || month === "01" || month === "02" || (month === "03" && day < "16"))
                        //December thru March 15
                        testAdminPeriod = "Winter";
                    else if (month === "03" || month === "04" || month === "05" || month === "06")
                        //March 16 to end of school year
                        testAdminPeriod = "Spring";
                }
    
            }
            // TODO Fall,Winter,Spring - Match with reg ELA and SPA
            else if (filePeriod === "ALL" && window !== null){
                if(window === "Beginning of Year"){
                    testAdminPeriod = "Fall";
                } else if(window === "Middle of Year"){
                    testAdminPeriod = "Winter";
                } else if(window === "End of Year"){
                    testAdminPeriod = "Spring";
                }
    
            }
        }
        return testAdminPeriod;
    }

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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var isELA = false;
        var fileName = srcRecord.getRawField("LINEAGE_FILE").toString().toUpperCase();
        if ((JSON.stringify(srcRecord)).indexOf("LEXILE_MEASURE") > -1 || (JSON.stringify(srcRecord)).indexOf("PHONICS_LESSONS_COMPLETED") >-1 ) {
            subject = "ELA";
            isELA = true;
        }
        if ((isELA == false) || (fileName.indexOf('MATH') > -1)) {
            subject = "MATH";
        }

        var sigName= signature.getFormat().getFormatName();

        if(sigName === "iReady_2223_spanish"){
            subject = "RD_SPA";
        }

        var academicYear = _util.coalesce(srcRecord.getField("ACADEMIC_YEAR"), hierarchy.SCHOOL_YEAR);

        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}` + "_" + academicYear;

        //UIHN-30843 -  In ELA and MA Data files the student id column contains id+uuid. To fetch the id alone in PROD_TEST_ID added code.
        var sigName= signature.getFormat().getFormatName();

        //Add completion date to the key
        if(srcRecord.getField("COMPLETION_DATE_0") !== "NULL"){
            if (srcRecord.getField("COMPLETION_DATE_0") !== null && srcRecord.getField("COMPLETION_DATE_0") !== undefined) {
                var format = getDateFormat(srcRecord.getField("COMPLETION_DATE_0"));
                var testDate = AppUtil.getDateObjByPattern(srcRecord.getField("COMPLETION_DATE_0"), format).STANDARD_DATE;
            }
            else {
                var testDate = null;
            }
        }else {
             var testDate = null;
        }

        assessmentAdminKey = assessmentAdminKey + "_" + testDate;

        //TODO Split the string and pass thru hierarchy
        // PROD_TEST_ID Types
        //STUDENT_ID, ACADEMIC_YEAR, "WINDOW", ACTIVITY_ID - Normal IREADY
        //STUDENT_ID, ACADEMIC_YEAR, "WINDOW" - Spanish IREADY
        var windowConsolidated = srcRecord.getField("WINDOW");
        if(windowConsolidated !== undefined && windowConsolidated !== null) {
            var modifiedWindow = windowConsolidated.replace(/\s+/g, "");
            assessmentAdminKey = assessmentAdminKey + "_" + modifiedWindow;
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        //If a signature doesn't have lessons, don't add lessons
        if(signature.format.formatName === "LA_iReadyELA0SS" || signature.format.formatName === "LA_iReadyMATH0SS"){
            assessmentAdminKey = assessmentAdminKey + "_LESSON";
        }
        return assessmentAdminKey;
    }
    return module;
}());