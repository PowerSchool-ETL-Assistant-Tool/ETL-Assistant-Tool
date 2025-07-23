var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CORE_GROWTH";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
   /* module.createNormalizedFile = function (file, signature) {
        try {

            var signatureFormatName = signature.getFormat().getFormatName();
            print("\nLoading using signature file ${signatureFormatName}\n");


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("\nNormalized file: ${normalizedFile}\n");

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
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, exception, JSON.stringify(one) + '|' + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK: ${exception}", JSON.stringify(rows)));
                    }

                })
                .transform("TRANSFORM", ["RECORDS"],
                    function (output, rows) {

                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {

                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if (mappingObject.SCORE_MAPPINGS.length = 0 && row.getField("INCLUDE_INDICATOR") === "N") {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "LOW", record.LINEAGE_LINE, "Include indicator is No.", JSON.stringify(row)));
                    }
                    else if (mappingObject.SCORE_MAPPINGS.length = 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", record.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG);

            return normalizedFile;

        } catch (exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };*/
    module.createNormalizedFile = function(file, signature) {
            try {
                let normalizedFile = AppUtil.createResultsFile(file);
                const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
                const fileRows = createRecords(file, signature);
                let normalizedRows = [], normalizedRecords = [];

                fileRows.forEach(function(rows) {
                    try{
                        mapNormalizedRecords(signature, hierarchy, rows).forEach(function(normRecord) {
                            normalizedRows.push(normRecord)
                        });

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "mapNormalizedRecords error: ${exception}", JSON.stringify(rows)));
                    }
                });


                normalizedRows.forEach(function(row) {
                    try {
                        const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            normalizedRecords.push(row);
                        }

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                });

                writeNormalizedRecords(normalizedFile, normalizedRecords);

                return normalizedFile;
            } catch(exception) {
                throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
            }
        };

         /** Java classes **/
            const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
            const BufferedReader = Java.type("java.io.BufferedReader");
            const InputStreamReader = Java.type('java.io.InputStreamReader');
            const CSVWriter = Java.type("com.opencsv.CSVWriter");
            const FileWriter = Java.type("java.io.FileWriter");
            const File = Java.type("java.io.File");

            /***************************************************************************
                 Utility Functions
                 ***************************************************************************/

                function createRecords(file, signature) {
                    try {
                        const format = signature.getFormat();
                        const fieldDelimiter = format.getFieldDelim();
                        const textDelimiter = format.getQuoteDelim();
                        const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
                        const delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
                        const fileFullName = file.getFullName();
                        let lineNumber = 0;
                        let recordsArray = [];
                        const fieldNames = delimitedRecordParser.parseRow(reader);
                        let row, record;

                        while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                            let index = 0;
                            record = {};

                            for (const key in fieldNames) {
                                record[fieldNames[index]] = row.get(index++);
                            }
                            record.LINEAGE_FILE = fileFullName;
                            record.LINEAGE_LINE = (++lineNumber).toString();
                            const rowArray = [];
                            rowArray.push(record);
                            recordsArray.push((rowArray));
                        }

                        return recordsArray;
                    } catch (exception) {
                        throw "${_thisModuleName}.createRecords Exception: ${exception}";
                    }
                }

                /**
                 * Creates a Processed file containing the audit types of error for the file processed
                 *
                 * @param file A fully qualified string path to the normalFile
                 * @param data The audit statistics of the file that was processed
                 */
                function writeNormalizedRecords(file, data) {
                    try {
                        const normalFile = _file.open(file);
                        const normalFilePath = normalFile.getParent();
                        const normalFileName = normalFile.getName()
                        const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
                        let rowArray = null;
                        const header = Object.keys(data[0]);

                        writer.writeNext(header);

                        data.forEach(function(row) {
                            rowArray = [];

                            for (let key in row) {
                                 rowArray.push(row[key]);
                            }
                            writer.writeNext(rowArray);
                        })

                        writer.close();
                    } catch (exception) {
                        throw "${_thisModuleName}.writeNormalizedRecords Exception: ${exception}";
                    }
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

    var scoresToMap =
        [
            { TEST: "COREGR", CODE: "SELFCON", FIELD: "SELF_CONTROL", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RESPCT", FIELD: "RESPECTFUL", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RESPON", FIELD: "RESPONSIBLE", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "INDEP", FIELD: "INDEPENDENT", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "ATTEN", FIELD: "ATTENTIVE", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "DIL", FIELD: "DILIGENT", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "NUL", FIELD: "NAMES_UPPERCASE_LETTERS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "NLL", FIELD: "NAMES_LOWERCASE_LETTERS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "LTOS", FIELD: "CONNECTS_LETTERS_TO_SOUNDS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "CONPR", FIELD: "DEMONSTRATES_CONCEPTS_OF_PRINT", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RTFS", FIELD: "RETELLS_FAMILIAR_STORIES", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RON", FIELD: "READS_OWN_NAME", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SYL", FIELD: "SYLLABICATION", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RHYM", FIELD: "RHYME_RECOGNITION", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "BONRM", FIELD: "BLENDS_ONSET__RIME", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "PRTNAM", FIELD: "PRINTS_NAME", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "WLSRW", FIELD: "WRITES_LETTERS_OR_LETTER_LIKE_SHAPES_TO_REPRESENT_WORDS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SCDW", FIELD: "SHOWS_CONTROL_IN_DRAWING_AND_WRITING", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "LISRESP", FIELD: "LISTENS_AND_RESPONDS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "UAAS", FIELD: "USE_AGE_APPROPRIATE_SPEECH", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "CRPAT", FIELD: "CREATES_PATTERNS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "CNT20", FIELD: "COUNTS_TO_20", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RN010", FIELD: "RECOGNIZES_NUMBERS_0_TO_10", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "WN010", FIELD: "WRITES_NUMBERS_0_10", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "CO10", FIELD: "COUNTS_OBJECTS_TO_10", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "CQUAN5", FIELD: "COMPARES_QUANTITY_TO_5", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SADDO5", FIELD: "SOLVES_ADDITION_PROBLEMS_W_OBJECTS_TO_5", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SSUBO5", FIELD: "SOLVES_SUBTRACTION_PROBLEMS_W_OBJECTS_TO_5", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "NAMSH", FIELD: "NAMES_SHAPES", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "IPOOSP", FIELD: "IDENTIFIES_POSITIONS_OF_OBJECTS_IN_SPACE", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SCO", FIELD: "SORTS_AND_CLASSIFIES_OBJECTS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "COA", FIELD: "COMPARES_OBJECTS_AND_ATTRIBUTES", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "AMTSP", FIELD: "APPLIES_MATHEMATICAL_THINKING_TO_SOLVE_PROBLEMS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "LMD", FIELD: "LARGE_MUSCLE_DEVELOPMENT", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SMD", FIELD: "SMALL_MUSCLE_DEVELOPMENT", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "DBADA", FIELD: "DEMONSTRATES_BODY_AWARENESS_AND_DIRECTIONAL_AWARENESS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "VISART", FIELD: "VISUAL_ARTS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "PERFART", FIELD: "PERFORMING_ARTS", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "MUS", FIELD: "MUSIC", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SCI", FIELD: "SCIENCE", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SOCSCI", FIELD: "SOCIAL_SCIENCE", MAP_FUNCTION: mapGradeScore }



            , { TEST: "COREGR", CODE: "COOPRES", FIELD: "COOPRESP_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RESPCT", FIELD: "RESPECTFUL_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SELFREG", FIELD: "SELFREG_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "INDEP", FIELD: "INDEPENDENT_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "ATTENLIS", FIELD: "ATTENTLISTEN_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "TRANSIT", FIELD: "TRANSITION_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "LOWREC", FIELD: "LOWERRECOG_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "UPREC", FIELD: "UPPERRECOG_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "CONPR", FIELD: "PRINTCONCEPT_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RON", FIELD: "NAMERECOG_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "PRTNAM", FIELD: "NAMEWRITING_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SPEE", FIELD: "SPEECH_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RTCT", FIELD: "ROTECOUNT_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "NUMNAM", FIELD: "NUMBERNAME_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "CORR", FIELD: "CORRESPOND_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "RECSHAP", FIELD: "SHAPERECOG_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "PATT", FIELD: "PATTERNING_KST", MAP_FUNCTION: mapGradeScore }
            , { TEST: "COREGR", CODE: "SELFPOR", FIELD: "SELFPORTRAIT_KST", MAP_FUNCTION: mapGradeScore }


            , { TEST: "COREGR", CODE: "LANGUAGELIT", FIELD: "LANGUAGE_AND_LITERACY", MAP_FUNCTION: mapTotalScoreBasedOnPercentage }
            , { TEST: "COREGR", CODE: "MA", FIELD: "MATHEMATICS", MAP_FUNCTION: mapTotalScoreBasedOnPercentage }
            , { TEST: "COREGR", CODE: "SES", FIELD: "SOCIAL_EMOTIONALSELF", MAP_FUNCTION: mapTotalScoreBasedOnPercentage }


            , { TEST: "COREGR", CODE: "PHONA", FIELD: "PHONEMIC_AWARENESS", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "LIT", FIELD: "LITERACY", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "LIS", FIELD: "LISTENING", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "NUMSEN", FIELD: "NUMBER_SENSE", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "OPER", FIELD: "OPERATIONS", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "GEOMMEAS", FIELD: "GEOMETRY__MEASUREMENT", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "PROBSOL", FIELD: "PROBLEM_SOLVING", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "PHYDEV", FIELD: "PHYSICAL_DEVELOPMENT", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "ARTSCI", FIELD: "ARTS__SCIENCES", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "TK", FIELD: "TRANSITIONAL_KINDERGARTEN_SUMMARY", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "SOCEMO", FIELD: "SOC_EMO", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "LANGLIT", FIELD: "LANG_LIT", MAP_FUNCTION: mapTotalScore }
            , { TEST: "COREGR", CODE: "ROOT", FIELD: "ROOT", MAP_FUNCTION: mapTotalScore }
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var maxScoreDecode = {
        "SOC_EMO": "30"
        , "SOCIAL_EMOTIONALSELF": "30"
        , "LANG_LIT": "37"
        , "LANGUAGE_AND_LITERACY": "37"
        , "MATHEMATICS": "27"
        , "SELFPORTRAIT_KST": "6"
        , "ROOT": "100"
        , "COOPRESP_KST": "5"
        , "RESPECTFUL_KST": "5"
        , "SELFREG_KST": "5"
        , "INDEPENDENT_KST": "5"
        , "ATTENTLISTEN_KST": "5"
        , "TRANSITION_KST": "5"
        , "LOWERRECOG_KST": "8"
        , "UPPERRECOG_KST": "8"
        , "PRINTCONCEPT_KST": "8"
        , "NAMERECOG_KST": "5"
        , "NAMEWRITING_KST": "6"
        , "SPEECH_KST": "2"
        , "ROTECOUNT_KST": "8"
        , "NUMBERNAME_KST": "6"
        , "CORRESPOND_KST": "5"
        , "SHAPERECOG_KST": "4"
        , "PATTERNING_KST": "4"
        , "SELF_CONTROL": "20"
        , "ATTENTIVE": "20"
        , "RESPECTFUL": "20"
        , "RESPONSIBLE": "20"
        , "INDEPENDENT": "20"
        , "APPLIES_MATHEMATICAL_THINKING_TO_SOLVE_PROBLEMS": "1" // Just the dummy value
        , "ARTS__SCIENCES": "50"
        , "BLENDS_ONSET__RIME": "4"
        , "COMPARES_OBJECTS_AND_ATTRIBUTES": "4"
        , "COMPARES_QUANTITY_TO_5": "4"
        , "CONNECTS_LETTERS_TO_SOUNDS": "4"
        , "COUNTS_OBJECTS_TO_10": "4"
        , "COUNTS_TO_20": "4"
        , "CREATES_PATTERNS": "4"
        , "DEMONSTRATES_BODY_AWARENESS_AND_DIRECTIONAL_AWARENESS": "10"
        , "DEMONSTRATES_CONCEPTS_OF_PRINT": "4"
        , "DILIGENT": "20"
        , "GEOMETRY__MEASUREMENT": "16"
        , "IDENTIFIES_POSITIONS_OF_OBJECTS_IN_SPACE": "4"
        , "LARGE_MUSCLE_DEVELOPMENT": "20"
        , "LISTENING": "8"
        , "LISTENS_AND_RESPONDS": "4"
        , "LITERACY": "50" // Need to check
        , "MUSIC": "10"
        , "NAMES_LOWERCASE_LETTERS": "4"
        , "NAMES_SHAPES": "4"
        , "NAMES_UPPERCASE_LETTERS": "4"
        , "OPERATIONS": "1" // Just the dummy value
        , "PERFORMING_ARTS": "10"
        , "PHONEMIC_AWARENESS": "20" // Need to check
        , "PHYSICAL_DEVELOPMENT": "50"
        , "PRINTS_NAME": "4"
        , "PROBLEM_SOLVING": "1" // Just the dummy value
        , "READS_OWN_NAME": "4"
        , "RECOGNIZES_NUMBERS_0_TO_10": "4"
        , "RETELLS_FAMILIAR_STORIES": "4"
        , "RHYME_RECOGNITION": "4"
        , "SCIENCE": "10"
        , "SHOWS_CONTROL_IN_DRAWING_AND_WRITING": "4"
        , "SMALL_MUSCLE_DEVELOPMENT": "20"
        , "SOCIAL_SCIENCE": "10"
        , "SOLVES_ADDITION_PROBLEMS_W_OBJECTS_TO_5": "1" // Just the dummy value
        , "SOLVES_SUBTRACTION_PROBLEMS_W_OBJECTS_TO_5": "1" // Just the dummy value
        , "SORTS_AND_CLASSIFIES_OBJECTS": "4"
        , "SYLLABICATION": "4"
        , "TRANSITIONAL_KINDERGARTEN_SUMMARY": "303" // Need to check
        , "VISUAL_ARTS": "10"
        , "WRITES_LETTERS_OR_LETTER_LIKE_SHAPES_TO_REPRESENT_WORDS": "4"
        , "WRITING": "12" // Need to check
        , "NUMBER_SENSE": "24" // Need to check
        , "WRITES_NUMBERS_0_10": "4" // Need to check
        , "USE_AGE_APPROPRIATE_SPEECH": "4"// Need to check

    };


    var gradeLookup = {
        "KN": "KG"
        , "KG": "KG"
        , "K": "KG"
        , "TK": "TK"
        , "": null
        , null: null

    };


    var decodeFourScaleLevel = {
        "0": "Never"
        , "1": "Rarely"
        , "2": "Occasionally"
        , "3": "Usually"
        , "4": "Consistently"
        , null: null
    };

    var decodeFourScalePassingLevel = {
        "0": "N"
        , "1": "N"
        , "2": "N"
        , "3": "Y"
        , "4": "Y"
        , null: null
    };

    var decodePerformanceLevel = {
        "C": "Concern"
        , "E": "Emerging"
        , "P": "Progressing"
        , "M": "Meets"
        , "NR": "Not Recorded"
        , "NOT RECORDED": "Not Recorded"
        , "U": "Unable"
        , "UNABLE": "Unable"
        , null: null
    };

    var decodePerformancePassingLevel = {
        "C": "No"
        , "E": "No"
        , "P": "No"
        , "M": "Yes"
        , "NR": null
        , "NOT RECORDED": null
        , "U": null
        , "UNABLE": null
        , null: null
    };


    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    function decodeGradeCode(gradeCode) {
        if (gradeCode == null) {
            return null;
        }
        var lkpGradeObj = gradeLookup[gradeCode];
        if (lkpGradeObj == undefined || lkpGradeObj == null) {
            return null;
        }
        return lkpGradeObj;
    }

    function decodeRaceCode(raceCode) {
        if (raceCode === undefined || raceCode === null) {
            return null;
        }
        var lkpRaceObj = raceLookup[raceCode];
        if (lkpRaceObj == undefined || lkpRaceObj == null) {
            return null;
        }
        return lkpRaceObj.GRADE_CODE;
    }


    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/

    /**
     * Maps normalized records for given group of rows.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param array Array containing JSON objects representing raw data by physical name.
     * @returns {array} Mapped normalized records.
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];

        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        var record = mapSingleNormalizedRecord(signature, hierarchy, row);

        AppUtil.nullSafePush(normalizedRecords, record);

        return normalizedRecords;

    }


    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} Mapped normalized record.
     */
    function mapSingleNormalizedRecord(signature, hierarchy, row) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row)

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                            var score = (testMetadata.MAP_FUNCTION)(row, testMetadata,signature);
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
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateField = row.getField("BIRTH_DATE");

        if (birthDateField !== null && birthDateField !== undefined && birthDateField.toString().length < 10) {
            var birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "MM/dd/yy");
        }

        else if (birthDateField !== null && birthDateField !== undefined) {
            if (birthDateField.indexOf("-") >= 4) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "yyyy-MM-dd");
            }
            else if (birthDateField.indexOf("-") >= 2) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "MM-dd-yyyy");
            }
            else {
                var birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "MM/dd/yyyy");
            }
        }
        else {
            var birthDateObject = {
                RAW_DATE: null
                , MONTH: null
                , DAY: null
                , YEAR: null
                , STANDARD_DATE: null
            };
        }


        var testDateObject = AppUtil.getDateObjByPattern(row.getField("TIMECOMPLETED"), "EEE, dd MMM yyyy HH:mm:ss Z");//Ex. Wed, 16 Jan 2019 23:02:38 +0000

        /*  pre UIHN-9419:
        var trimmedDistrictCode = _util.coalesce(
            AssessmentLoader.config.DISTRICT_CODE
            , ""
        );

        if (trimmedDistrictCode.length > 7) {
            trimmedDistrictCode = trimmedDistrictCode.substring(0, 7);
        }
        */

        //Loop through normalized fields and map if possible.
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; // pre UIHN-9419:  trimmedDistrictCode;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = getPeriod(row.getField("TEST"));
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOLID")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOLNAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOLID")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = null;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = birthDateObject.DAY;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADE")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("SSID"), row.getField("STUID"));
                    break;
                case "STUDENT_DISTRICT_ID":
                    record.STUDENT_DISTRICT_ID = _util.coalesceEmptyString(row.getField("STUID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesceEmptyString(row.getField("SSID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                    break;
                //Removed 07/08/21 due to metric issues
//                case "TEST_REPORTING_DATE":
//                    record.TEST_REPORTING_DATE = "01/01/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
//                    break;
                default:
                    record[field] = row.getField(field);
                    break
            }
        });

        return record;
    }




    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {

        var admin = {};

        if (row.getField("HRIGHT") === "1") {
            admin.TEST_INTERVENTION_CODE = "HAND";
            admin.TEST_INTERVENTION_DESC = "Right Handed";
        }
        else if (row.getField("HLEFT") === "1") {
            admin.TEST_INTERVENTION_CODE = "HAND";
            admin.TEST_INTERVENTION_DESC = "Left Handed";
        }
        else if (row.getField("HLEFT") === "0") {
            admin.TEST_INTERVENTION_CODE = "HAND";
            admin.TEST_INTERVENTION_DESC = "Undecided Handed";
        }

        if (row.getField("PENCILF") === "1") {
            admin.TEST_INTERVENTION_CODE_2 = "PENCIL";
            admin.TEST_INTERVENTION_DESC_2 = "Fisted Pencil Grip";
        }
        else if (row.getField("PENCILF") === "1") {
            admin.TEST_INTERVENTION_CODE_2 = "PENCIL";
            admin.TEST_INTERVENTION_DESC_2 = "Tripod Pencil Grip";
        }
        else if (row.getField("PENCILT") === "0") {
            admin.TEST_INTERVENTION_CODE_2 = "PENCIL";
            admin.TEST_INTERVENTION_DESC_2 = "Unknown Pencil Grip";
        }

        if (row.getField("ENGLEARNER") === "1" || row.getField("ENGLEARNER") === "2") {
            admin.STUDENT_LEP_CODE = row.getField("ENGLEARNER");
        }

        if (row.getField("PLAYGROUP") === "1" || row.getField("PLAYGROUP") === "2") {
            admin.TEST_INTERVENTION_CODE_3 = "PLAYGROUP";
            admin.TEST_INTERVENTION_DESC_3 = row.getField("PLAYGROUP");
        }

        if (row.getField("ATTENDY") === "1") {
            admin.TEST_INTERVENTION_CODE_4 = "PRESCHOOL";
            admin.TEST_INTERVENTION_DESC_4 = "Attended Preschool";
        }

        if (row.getField("SPEECHY") === "1") {
            admin.TEST_EXEMPTION_CODE = "SPEECH";
            admin.TEST_EXEMPTION_DESC = "Speech and Language";
        }

        if (row.getField("IEPY") === "1") {
            admin.TEST_EXEMPTION_CODE_2 = "IEP";
            admin.TEST_EXEMPTION_DESC_2 = "IEP";
        }
        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapGradeScore(row, testMetadata) {
        var score = {};

        var testNumber = (testMetadata.TEST + "_" + row.getField("TEST") + "_" + testMetadata.CODE).toUpperCase();
        var scaleScore = row.getField(testMetadata.FIELD);
        var gradeString = row.getField(testMetadata.FIELD + "_GRADE");
        var gradeFlagMeets = row.getField(testMetadata.FIELD + "_MEETS_COUNT");
        var gradeFlagProgress = row.getField(testMetadata.FIELD + "_PROGRESS_COUNT");
        var gradeFlagEmerging = row.getField(testMetadata.FIELD + "_EMERGING_COUNT");
        var gradeFlagConcern = row.getField(testMetadata.FIELD + "_CONCERN_COUNT");
        var gradeFlagNotRecorded = row.getField(testMetadata.FIELD + "_NOT_RECORDED_COUNT");
        var gradeFlagUnable = row.getField(testMetadata.FIELD + "_UNABLE_COUNT");


        // Check for key fields and do not map score and exit if conditions met.
        if (_util.trim(scaleScore) === "" || _util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined) {
            return null;
        }
        var percentPassing = null;
        if (!isNaN(scaleScore) && !isNaN(maxScoreDecode[testMetadata.FIELD])) {
            percentPassing = scaleScore / parseInt(maxScoreDecode[testMetadata.FIELD]);
        }


        //set grade if present
        if (_util.trim(gradeString) !== "" && gradeString !== null && gradeString !== undefined) {
            score["TEST_PRIMARY_RESULT_CODE"] = gradeString;
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[gradeString];
            score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel[gradeString];

        }
        else {

            if (percentPassing >= 0.75) {
                score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["M"];
                score["TEST_PRIMARY_RESULT_CODE"] = "M";
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["M"];
            } else if (percentPassing < 0.75 && percentPassing >= 0.5) {
                score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["P"];
                score["TEST_PRIMARY_RESULT_CODE"] = "P";
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["P"];
            } else if (percentPassing < 0.5 && percentPassing >= 0.25) {
                score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["E"];
                score["TEST_PRIMARY_RESULT_CODE"] = "E";
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["E"];
            } else if (percentPassing < 0.25) {
                score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["C"];
                score["TEST_PRIMARY_RESULT_CODE"] = "C";
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["C"];
            }

        }


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;

        }

        score["TEST_SECONDARY_RESULT_CODE"] = "PTS";
        score["TEST_SECONDARY_RESULT"] = scaleScore + "/" + maxScoreDecode[testMetadata.FIELD];
        score["TEST_TERTIARY_RESULT_CODE"] = scaleScore;
        score["TEST_TERTIARY_RESULT"] = maxScoreDecode[testMetadata.FIELD];

        if (null !== percentPassing) {
            score["TEST_PERCENTAGE_SCORE"] = percentPassing * 100;
        }


        return score;

    }
    function  getPercentage (scoreObtained,totalScore){
        if (scoreObtained===null||scoreObtained===undefined) {
            return null;
        }
        scoreObtained = parseFloat(scoreObtained);
        totalScore = parseFloat(totalScore);
        if (!isNaN(scoreObtained) && !isNaN(totalScore)) {
            return (scoreObtained / totalScore) * 100;
        } else {
            return null;
        }
    };
    function mapTotalScoreBasedOnPercentage(row, testMetadata) {


        let score = {};
        let testNumber = (testMetadata.TEST + "_" + row.getField("TEST") + "_" + testMetadata.CODE).toUpperCase();

        let scoreObtained = row.getField(testMetadata.FIELD);
        let totalScore = row.getField(testMetadata.FIELD + '_TOTAL');

        // Check for key fields and do not map score and exit if conditions met.
        if (_util.trim(scoreObtained) === "" || _util.trim(scoreObtained) === null || _util.trim(scoreObtained) === undefined) {
            return null;
        }

        let gradeString = row.getField(testMetadata.FIELD + "_GRADE");

        let percentScoreObtained = getPercentage(scoreObtained, totalScore);

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scoreObtained;
        if (!isNaN(scoreObtained)) {
            score["TEST_SCORE_VALUE"] = scoreObtained;
            score["TEST_SCALED_SCORE"] = scoreObtained;
        }

        score["TEST_SECONDARY_RESULT_CODE"] = "PTS";
        score["TEST_SECONDARY_RESULT"] = parseFloat(scoreObtained) + "/" + _util.coalesce(totalScore,maxScoreDecode[testMetadata.FIELD]);
        score["TEST_TERTIARY_RESULT_CODE"] = scoreObtained;
        score["TEST_TERTIARY_RESULT"] =  _util.coalesce(totalScore,maxScoreDecode[testMetadata.FIELD]);

        if (null !== percentScoreObtained) {
            score["TEST_PERCENTAGE_SCORE"] = percentScoreObtained;
        }

        //set grade if present
        if (_util.trim(gradeString) !== "" && gradeString !== null && gradeString !== undefined) {
            score["TEST_PRIMARY_RESULT_CODE"] = gradeString;
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[gradeString];
            score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel[gradeString];

        }

        if (percentScoreObtained >= 75) {
            score["TEST_PRIMARY_RESULT_CODE"] = "M";
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["M"];
            score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["M"];
        } else if (percentScoreObtained < 75 && percentScoreObtained >= 50) {
            score["TEST_PRIMARY_RESULT_CODE"] = "P";
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["P"];
            score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["P"];
        } else if (percentScoreObtained < 50 && percentScoreObtained >= 25) {
            score["TEST_PRIMARY_RESULT_CODE"] = "E";
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["E"];
            score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["E"];
        } else {
            score["TEST_PRIMARY_RESULT_CODE"] = "C";
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["C"];
            score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["C"];
        }

        return score;
    }


    function mapTotalScore(row, testMetadata) {
        var score = {};

        var testNumber = (testMetadata.TEST + "_" + row.getField("TEST") + "_" + testMetadata.CODE).toUpperCase();
        var taken = row.getField(testMetadata.FIELD);
        var maxCount = row.getField(testMetadata.FIELD + "_TOTAL");
        var gradeString = row.getField(testMetadata.FIELD + "_GRADE");
        var gradeFlagMeets = row.getField(testMetadata.FIELD + "_MEETS_COUNT");
        var gradeFlagProgress = row.getField(testMetadata.FIELD + "_PROGRESS_COUNT");
        var gradeFlagEmerging = row.getField(testMetadata.FIELD + "_EMERGING_COUNT");
        var gradeFlagConcern = row.getField(testMetadata.FIELD + "_CONCERN_COUNT");
        var gradeFlagNotRecorded = row.getField(testMetadata.FIELD + "_NOT_RECORDED_COUNT");
        var gradeFlagUnable = row.getField(testMetadata.FIELD + "_UNABLE_COUNT");

        // Check for key fields and do not map score and exit if conditions met.
        if (_util.trim(taken) === "" || _util.trim(taken) === null || _util.trim(taken) === undefined) {
            return null;
        }
        var percentPassing = null;
        if (!isNaN(taken) && !isNaN(maxScoreDecode[testMetadata.FIELD])) {
            percentPassing = parseFloat(taken) / parseInt(_util.coalesce(maxCount,maxScoreDecode[testMetadata.FIELD]));
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = taken;
        if (!isNaN(taken)) {
            score["TEST_SCORE_VALUE"] = taken;
            score["TEST_SCALED_SCORE"] = taken;
        }

        score["TEST_SECONDARY_RESULT_CODE"] = "PTS";
        score["TEST_SECONDARY_RESULT"] = taken + "/" + _util.coalesce(maxCount,maxScoreDecode[testMetadata.FIELD]);
        score["TEST_TERTIARY_RESULT_CODE"] = taken;
        score["TEST_TERTIARY_RESULT"] = _util.coalesce(maxCount,maxScoreDecode[testMetadata.FIELD]);

        if (null !== percentPassing) {
            score["TEST_PERCENTAGE_SCORE"] = (parseFloat(percentPassing)) * 100;
        }
        //set grade if present

        if (_util.trim(gradeString) !== "" && gradeString !== null && gradeString !== undefined) {
            score["TEST_PRIMARY_RESULT_CODE"] = gradeString;
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[gradeString];
            score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel[gradeString];

        }
        else {

            if (percentPassing >= 0.75) {
                score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["M"];
                score["TEST_PRIMARY_RESULT_CODE"] = "M";
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["M"];
            } else if (percentPassing < 0.75 && percentPassing >= 0.5) {
                score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["P"];
                score["TEST_PRIMARY_RESULT_CODE"] = "P";
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["P"];
            } else if (percentPassing < 0.5 && percentPassing >= 0.25) {
                score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["E"];
                score["TEST_PRIMARY_RESULT_CODE"] = "E";
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["E"];
            } else if (percentPassing < 0.25) {
                score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel["C"];
                score["TEST_PRIMARY_RESULT_CODE"] = "C";
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel["C"];
            }

        }
        return score;

    }


    /***************************************************************************
     Utility Functions
     ***************************************************************************/

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


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + AssessmentLoader.config.TENANT_CODE
            + "_" + AssessmentLoader.config.DISTRICT_CODE;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        assessmentAdminKey = (assessmentAdminKey + "_" + AppUtil.getDateObjByPattern(srcRecord.getField("TIMECOMPLETED"), "EEE, dd MMM yyyy HH:mm:ss Z").STANDARD_DATE).toUpperCase();

        return assessmentAdminKey;

    }


    /*
    if (rawDate.indexOf('-') > -1) {
            var positionOne = rawDate.indexOf('-');
            var positionTwo = rawDate.indexOf('-', (positionOne+1));

            month = padDateElement(rawDate.substring(positionOne + 1, positionTwo));
            day = padDateElement(rawDate.substring(positionTwo + 1, positionTwo + 3));
            year = padDateElement(rawDate.substring(0, positionOne));
        }
    */

    function getPeriod(testWindow) {
        var testPeriod = "ALL";
        if (testWindow === undefined || testWindow === null) {
            return testPeriod;
        }
        if (testWindow.toString().toUpperCase() === "TKCORE1") {
            testPeriod = "Fall";
        }
        else if (testWindow.toString().toUpperCase() === "TKCORE2") {
            testPeriod = "Winter";
        }
        else if (testWindow.toString().toUpperCase() === "TKCORE3") {
            testPeriod = "Spring";
        }
        return testPeriod;
    }

    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        // Check for format MM-dd-yyyy
        if (rawDate.substring(0, 3).search("/") >= 0) {
            var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else {
            var formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
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

    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
