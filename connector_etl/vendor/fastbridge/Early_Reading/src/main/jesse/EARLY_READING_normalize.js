var AppNormalize = (function() {
    let module = {};
    const _thisModuleName = "AppNormalize";
    const _assessmentIdentifier = "EARLY_READING";
    const _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
   const multipleRowsPerGroupingExpected = false;

    /**
    *
    * Admin period values to generate separate admin keys
    */
    var adminPeriods = [
        "Fall",
        "Winter",
        "Spring"
    ];


    /** Java classes **/
    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
    const BufferedReader = Java.type("java.io.BufferedReader");
    const InputStreamReader = Java.type('java.io.InputStreamReader');
    const CSVWriter = Java.type("com.opencsv.CSVWriter");
    const FileWriter = Java.type("java.io.FileWriter");
    const File = Java.type("java.io.File");

    const SignatureFormatType = {
            DELIMITED: 'class com.versifit.fileDetector.recordFormat.DelimitedRecordFormat',
            FIXED_LENGTH: 'class com.versifit.fileDetector.recordFormat.FixedWidthRecordFormat'
    };

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {

        try {
            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const records = getRecords(file, signature);

            print("\nLoading using signature file ${signature.getFormat().getFormatName()}\n");

            let normalizedFile = AppUtil.createResultsFile(file);

            print("\nNormalized file: ${normalizedFile}");
            var lineNumber = 0;
            const fileFullName = file.getFullName();

        let normalizedRows = [], normalizedRecords = [];

                    records.forEach((record) => {
                        try {
                            // Removing white spaces
                            if (typeof record === 'object') {
                                for (let key in record) {
                                    if (typeof record[key] === 'string') {
                                        record[key] = _util.trim(record[key]);
                                    }
                                }
                            }

                            mapNormalizedRecords(signature, hierarchy, [record])
                                .forEach((normalizedRecord) => {
                                    normalizedRows.push(normalizedRecord);
                                });
                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                                hierarchy.SOURCE_FILE.getFilePath(),
                                "HIGH",
                                record.LINEAGE_LINE,
                                "mapNormalizedRecords error: ${exception}",
                                JSON.stringify(record)
                            ));
                        }
                    });

                    normalizedRows.forEach((row) => {
                        try {
                            const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                            if (mappingObject.SCORE_MAPPINGS.length === 0) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                                    file.getFilePath(),
                                    "WARNING",
                                    row.LINEAGE_LINE,
                                    "No scores found.",
                                    JSON.stringify(row)
                                ));
                            } else {
                                normalizedRecords.push(row);
                            }

                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                                hierarchy.SOURCE_FILE.getFilePath(),
                                "HIGH",
                                _util.coalesce(row.LINEAGE_LINE, -1),
                                "SCORE COUNT CHECK dataflow error: ${exception}",
                                JSON.stringify(row)
                            ));
                        }
                    });

                    writeNormalizedRecords(normalizedFile, normalizedRecords);

//            _dataflow.create("RECORD BUILD")
//                .input("INPUT", AppUtil.getInputDataflow(file, signature))
//                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
//
// json.LINEAGE_FILE = fileFullName;
//                    json.LINEAGE_LINE = (++lineNumber).toString();
//                    output.RECORDS.put(json);
//
//                })
//                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
//                    try {
//                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
//                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
//                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
//                    }
//                })
//                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
//                    try{
//                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
//                            rows.forEach(function(row) {
//                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
//                            });
//
//                        } else {
//                            output.RECORDS.put(rows);
//                        }
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
//                    }
//                })
//                .transform("NORMALIZE RECORDS", ["RECORDS"], function(output, rows) {
//                    try{
//                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);
//
//                        normalizedRecords.forEach(function(record) {
//                            output.RECORDS.put(record);
//                        });
//
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
//                    }
//                })
//                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
//                    try {
//                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
//
//                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
//                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
//                        } else {
//                            output.RECORDS.put(row);
//                        }
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
//                    }
//                })
//                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
//                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;
        } catch(exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
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

    //Per UIHN-39664 CBMR should be loades separately via CBMR loader/file
    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/
    const scoresToMap =
        [   //Fall MS
            {TEST: "EAR_READ", CODE:"FER_MS", PERIOD:"Fall", FIELD: "FALL_MS_EARLY_READING_ENGLISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"FER", PERIOD:"Fall", FIELD: "FALL_EARLY_READING_ENGLISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"FALL_DW", PERIOD:"Fall", FIELD: "FALL_MS_DECODABLE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_LN", PERIOD:"Fall", FIELD: "FALL_MS_LETTER_NAMES_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_LS", PERIOD:"Fall", FIELD: "FALL_MS_LETTER_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_NW", PERIOD:"Fall", FIELD: "FALL_MS_NONSENSE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_OS", PERIOD:"Fall", FIELD: "FALL_MS_ONSET_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_OR", PERIOD:"Fall", FIELD: "FALL_MS_ORAL_REPETITION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_WR", PERIOD:"Fall", FIELD: "FALL_MS_WORD_RHYMING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_SR", PERIOD:"Fall", FIELD: "FALL_MS_SENTENCE_READING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_SW", PERIOD:"Fall", FIELD: "FALL_MS_SIGHT_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_WB", PERIOD:"Fall", FIELD: "FALL_MS_WORD_BLENDING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FALL_WS", PERIOD:"Fall", FIELD: "FALL_MS_WORD_SEGMENTING_", MAP_FUNCTION: mapStrandScore}
           //,{TEST: "EAR_READ", CODE:"FALL_CBMR_EN", PERIOD:"Fall", FIELD: "FALL_MS_CBMR-ENGLISH_", MAP_FUNCTION: mapCBMRScore}

           ,{TEST: "EAR_READ", CODE:"FERSP", PERIOD:"Fall", FIELD: "FALL_EARLY_READING_SPANISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"FER_CP", PERIOD:"Fall", FIELD: "FALL_CONCEPTS_OF_PRINT_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_DW", PERIOD:"Fall", FIELD: "FALL_DECODABLE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_LN", PERIOD:"Fall", FIELD: "FALL_LETTER_NAMES_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_LS", PERIOD:"Fall", FIELD: "FALL_LETTER_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_NW", PERIOD:"Fall", FIELD: "FALL_NONSENSE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_OS", PERIOD:"Fall", FIELD: "FALL_ONSET_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_OR", PERIOD:"Fall", FIELD: "FALL_ORAL_REPETITION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_WR", PERIOD:"Fall", FIELD: "FALL_WORD_RHYMING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_SR", PERIOD:"Fall", FIELD: "FALL_SENTENCE_READING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_SW", PERIOD:"Fall", FIELD: "FALL_SIGHT_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_WB", PERIOD:"Fall", FIELD: "FALL_WORD_BLENDING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_WS", PERIOD:"Fall", FIELD: "FALL_WORD_SEGMENTING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"FER_SYR", PERIOD:"Fall", FIELD: "FALL_SYLLABLE_READING_", MAP_FUNCTION: mapStrandScore}
           //,{TEST: "EAR_READ", CODE:"FER_CBMR_EN", PERIOD:"Fall", FIELD: "FALL_CBMR-ENGLISH_", MAP_FUNCTION: mapCBMRScore}
           //,{TEST: "EAR_READ", CODE:"FER_CBMR_SP", PERIOD:"Fall", FIELD: "FALL_CBMR-SPANISH_", MAP_FUNCTION: mapCBMRScore}

           ,{TEST: "EAR_READ", CODE:"WER", PERIOD:"Winter", FIELD: "WINTER_EARLY_READING_ENGLISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"WERSP", PERIOD:"Winter", FIELD: "WINTER_EARLY_READING_SPANISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"WER_CP", PERIOD:"Winter", FIELD: "WINTER_CONCEPTS_OF_PRINT_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_DW", PERIOD:"Winter", FIELD: "WINTER_DECODABLE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_LN", PERIOD:"Winter", FIELD: "WINTER_LETTER_NAMES_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_LS", PERIOD:"Winter", FIELD: "WINTER_LETTER_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_NW", PERIOD:"Winter", FIELD: "WINTER_NONSENSE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_OS", PERIOD:"Winter", FIELD: "WINTER_ONSET_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_OR", PERIOD:"Winter", FIELD: "WINTER_ORAL_REPETITION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_WR", PERIOD:"Winter", FIELD: "WINTER_WORD_RHYMING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_SR", PERIOD:"Winter", FIELD: "WINTER_SENTENCE_READING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_SW", PERIOD:"Winter", FIELD: "WINTER_SIGHT_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_WB", PERIOD:"Winter", FIELD: "WINTER_WORD_BLENDING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_WS", PERIOD:"Winter", FIELD: "WINTER_WORD_SEGMENTING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_SYR", PERIOD:"Winter", FIELD: "WINTER_SYLLABLE_READING_", MAP_FUNCTION: mapStrandScore}
           //,{TEST: "EAR_READ", CODE:"WER_CBMR_EN", PERIOD:"Winter", FIELD: "WINTER_CBMR-ENGLISH_", MAP_FUNCTION: mapCBMRScore}
           //,{TEST: "EAR_READ", CODE:"WER_CBMR_SP", PERIOD:"Winter", FIELD: "WINTER_CBMR-SPANISH_", MAP_FUNCTION: mapCBMRScore}

           ,{TEST: "EAR_READ", CODE:"WER_FM_ER", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_EARLY_READING_ENGLISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_COP", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_CONCEPTS_OF_PRINT_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_DW", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_DECODABLE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_LN", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_LETTER_NAMES_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_LS", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_LETTER_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_NW", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_NONSENSE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_OS", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_ONSET_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_OR", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_ORAL_REPETITION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_WR", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_RHYMING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_SR", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_SENTENCE_READING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_SW", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_SIGHT_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_WB", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_BLENDING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"WER_FM_WS", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_SEGMENTING_", MAP_FUNCTION: mapStrandScore}
           //,{TEST: "EAR_READ", CODE:"WER_FM_CBMR",PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_CBMR-ENGLISH_", MAP_FUNCTION: mapCBMRScore}

           ,{TEST: "EAR_READ", CODE:"SER", PERIOD:"Spring", FIELD: "SPRING_EARLY_READING_ENGLISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"SERSP", PERIOD:"Spring", FIELD: "SPRING_EARLY_READING_SPANISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"SER_CP", PERIOD:"Spring", FIELD: "SPRING_CONCEPTS_OF_PRINT_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_DW", PERIOD:"Spring", FIELD: "SPRING_DECODABLE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_LN", PERIOD:"Spring", FIELD: "SPRING_LETTER_NAMES_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_LS", PERIOD:"Spring", FIELD: "SPRING_LETTER_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_NW", PERIOD:"Spring", FIELD: "SPRING_NONSENSE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_OS", PERIOD:"Spring", FIELD: "SPRING_ONSET_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_OR", PERIOD:"Spring", FIELD: "SPRING_ORAL_REPETITION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_WR", PERIOD:"Spring", FIELD: "SPRING_WORD_RHYMING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_SR", PERIOD:"Spring", FIELD: "SPRING_SENTENCE_READING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_SW", PERIOD:"Spring", FIELD: "SPRING_SIGHT_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_WB", PERIOD:"Spring", FIELD: "SPRING_WORD_BLENDING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_WS", PERIOD:"Spring", FIELD: "SPRING_WORD_SEGMENTING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_SYR", PERIOD:"Spring", FIELD: "SPRING_SYLLABLE_READING_", MAP_FUNCTION: mapStrandScore}
           //,{TEST: "EAR_READ", CODE:"SER_CBMR_EN", PERIOD:"Spring", FIELD: "SPRING_CBMR-ENGLISH_", MAP_FUNCTION: mapCBMRScore}
           //,{TEST: "EAR_READ", CODE:"SER_CBMR_SP", PERIOD:"Spring", FIELD: "SPRING_CBMR-SPANISH_", MAP_FUNCTION: mapCBMRScore}

           //Spring MS
           ,{TEST: "EAR_READ", CODE:"SER_MS", PERIOD:"Spring", FIELD: "SPRING_MS_EARLY_READING_ENGLISH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EAR_READ", CODE:"SER_CP_MS", PERIOD:"Spring", FIELD: "SPRING_MS_CONCEPTS_OF_PRINT_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_DW_MS", PERIOD:"Spring", FIELD: "SPRING_MS_DECODABLE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_LN_MS", PERIOD:"Spring", FIELD: "SPRING_MS_LETTER_NAMES_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_LS_MS", PERIOD:"Spring", FIELD: "SPRING_MS_LETTER_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_NW_MS", PERIOD:"Spring", FIELD: "SPRING_MS_NONSENSE_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_OS_MS", PERIOD:"Spring", FIELD: "SPRING_MS_ONSET_SOUNDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_OR_MS", PERIOD:"Spring", FIELD: "SPRING_MS_ORAL_REPETITION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_WR_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_RHYMING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_SR_MS", PERIOD:"Spring", FIELD: "SPRING_MS_SENTENCE_READING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_SW_MS", PERIOD:"Spring", FIELD: "SPRING_MS_SIGHT_WORDS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_WB_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_BLENDING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EAR_READ", CODE:"SER_WS_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_SEGMENTING_", MAP_FUNCTION: mapStrandScore}
           //,{TEST: "EAR_READ", CODE:"SER_CBMR_EN_MS", PERIOD:"Spring", FIELD: "SPRING_MS_CBMR-ENGLISH_", MAP_FUNCTION: mapCBMRScore}

           //, {TEST: "EAR_READ", CODE:"FW", PERIOD:"", FIELD: "_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore}
           //, {TEST: "EAR_READ", CODE:"FS", PERIOD:"", FIELD: "_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           //, {TEST: "EAR_READ", CODE:"WS", PERIOD:"", FIELD: "_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
            //Fall MS Growth
           ,{TEST: "EAR_READ", CODE:"FALL_MS_FFG", PERIOD:"Fall", FIELD: "FALL_MS_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_CP_FFG", PERIOD:"Fall", FIELD: "FALL_MS_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_DW_FFG", PERIOD:"Fall", FIELD: "FALL_MS_DECODABLE_WORDS_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_LN_FFG", PERIOD:"Fall", FIELD: "FALL_MS_LETTER_NAMES_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_LS_FFG", PERIOD:"Fall", FIELD: "FALL_MS_LETTER_SOUNDS_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_NW_FFG", PERIOD:"Fall", FIELD: "FALL_MS_NONSENSE_WORDS_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_OS_FFG", PERIOD:"Fall", FIELD: "FALL_MS_ONSET_SOUNDS_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_OR_FFG", PERIOD:"Fall", FIELD: "FALL_MS_ORAL_REPETITION_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_WR_FFG", PERIOD:"Fall", FIELD: "FALL_MS_WORD_RHYMING_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_SR_FFG", PERIOD:"Fall", FIELD: "FALL_MS_SENTENCE_READING_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_SW_FFG", PERIOD:"Fall", FIELD: "FALL_MS_SIGHT_WORDS_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_WB_FFG", PERIOD:"Fall", FIELD: "FALL_MS_WORD_BLENDING_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FALL_WS_FFG", PERIOD:"Fall", FIELD: "FALL_MS_WORD_SEGMENTING_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"FALL_CBMR_EN_FWG", PERIOD:"Fall", FIELD: "FALL_MS_CBMR-ENGLISH_", FIELD_2: "_FROM_FALL_TO_FALL_MS" , MAP_FUNCTION: mapGrowthScore}

            //Winter MS Growth
           ,{TEST: "EAR_READ", CODE:"WER_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_CP_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_DW_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_DECODABLE_WORDS_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_LN_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_LETTER_NAMES_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_LS_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_LETTER_SOUNDS_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_NW_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_NONSENSE_WORDS_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_OS_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_ONSET_SOUNDS_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_OR_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_ORAL_REPETITION_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WR_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_WORD_RHYMING_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_SR_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_SENTENCE_READING_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_SW_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_SIGHT_WORDS_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WB_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_WORD_BLENDING_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WS_MS_FWG", PERIOD:"Winter", FIELD: "WINTER_WORD_SEGMENTING_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"WER_CBMR_MS_EN_FWG", PERIOD:"Winter", FIELD: "WINTER_CBMR-ENGLISH_", FIELD_2: "_FROM_FALL_MS_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "EAR_READ", CODE:"WER_FWG", PERIOD:"Winter", FIELD: "WINTER_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_FWG_SP", PERIOD:"Winter", FIELD: "WINTER_EARLY_READING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_CP_FWG", PERIOD:"Winter", FIELD: "WINTER_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_DW_FWG", PERIOD:"Winter", FIELD: "WINTER_DECODABLE_WORDS_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_LN_FWG", PERIOD:"Winter", FIELD: "WINTER_LETTER_NAMES_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_LS_FWG", PERIOD:"Winter", FIELD: "WINTER_LETTER_SOUNDS_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_NW_FWG", PERIOD:"Winter", FIELD: "WINTER_NONSENSE_WORDS_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_OS_FWG", PERIOD:"Winter", FIELD: "WINTER_ONSET_SOUNDS_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_OR_FWG", PERIOD:"Winter", FIELD: "WINTER_ORAL_REPETITION_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WR_FWG", PERIOD:"Winter", FIELD: "WINTER_WORD_RHYMING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_SR_FWG", PERIOD:"Winter", FIELD: "WINTER_SENTENCE_READING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_SW_FWG", PERIOD:"Winter", FIELD: "WINTER_SIGHT_WORDS_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WB_FWG", PERIOD:"Winter", FIELD: "WINTER_WORD_BLENDING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WS_FWG", PERIOD:"Winter", FIELD: "WINTER_WORD_SEGMENTING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_SYR_FWG", PERIOD:"Winter", FIELD: "SPRING_SYLLABLE_READING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"WER_CBMR_EN_FWG", PERIOD:"Winter", FIELD: "WINTER_CBMR-ENGLISH_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"WER_CBMR_SP_FWG", PERIOD:"Winter", FIELD: "WINTER_CBMR-", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}

            //Spring MS Growth
           ,{TEST: "EAR_READ", CODE:"SER_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_CP_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_DW_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_DECODABLE_WORDS_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_LN_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_LETTER_NAMES_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_LS_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_LETTER_SOUNDS_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_NW_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_NONSENSE_WORDS_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_OS_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_ONSET_SOUNDS_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_OR_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_ORAL_REPETITION_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WR_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_RHYMING_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_SR_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_SENTENCE_READING_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_SW_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_SIGHT_WORDS_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WB_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_BLENDING_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WS_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_SEGMENTING_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"SER_CBMR_EN_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_CBMR-ENGLISH_", FIELD_2: "_FROM_FALL_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "EAR_READ", CODE:"WER_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_CP_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_DW_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_DECODABLE_WORDS_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_LN_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_LETTER_NAMES_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_LS_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_LETTER_SOUNDS_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_NW_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_NONSENSE_WORDS_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_OS_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_ONSET_SOUNDS_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_OR_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_ORAL_REPETITION_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WR_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_RHYMING_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_SR_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_SENTENCE_READING_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_SW_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_SIGHT_WORDS_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WB_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_BLENDING_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WER_WS_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_WORD_SEGMENTING_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"WER_CBMR_EN_FSG_MS", PERIOD:"Spring", FIELD: "SPRING_MS_CBMR-ENGLISH_", FIELD_2: "_FROM_WINTER_TO_SPRING_MS" , MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "EAR_READ", CODE:"FER_FSG", PERIOD:"Spring", FIELD: "SPRING_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_CP_FSG", PERIOD:"Spring", FIELD: "SPRING_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_DW_FSG", PERIOD:"Spring", FIELD: "SPRING_DECODABLE_WORDS_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_LN_FSG", PERIOD:"Spring", FIELD: "SPRING_LETTER_NAMES_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_LS_FSG", PERIOD:"Spring", FIELD: "SPRING_LETTER_SOUNDS_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_NW_FSG", PERIOD:"Spring", FIELD: "SPRING_NONSENSE_WORDS_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_OS_FSG", PERIOD:"Spring", FIELD: "SPRING_ONSET_SOUNDS_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_OR_FSG", PERIOD:"Spring", FIELD: "SPRING_ORAL_REPETITION_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_WR_FSG", PERIOD:"Spring", FIELD: "SPRING_WORD_RHYMING_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_SR_FSG", PERIOD:"Spring", FIELD: "SPRING_SENTENCE_READING_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_SW_FSG", PERIOD:"Spring", FIELD: "SPRING_SIGHT_WORDS_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_WB_FSG", PERIOD:"Spring", FIELD: "SPRING_WORD_BLENDING_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"FER_WS_FSG", PERIOD:"Spring", FIELD: "SPRING_WORD_SEGMENTING_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"FER_CBMR_EN_FSG", PERIOD:"Spring", FIELD: "SPRING_CBMR-ENGLISH_", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"FER_CBMR_SP_FSG", PERIOD:"Spring", FIELD: "SPRING_CBMR-", FIELD_2: "_FROM_FALL_MS_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "EAR_READ", CODE:"SER_FSG", PERIOD:"Spring", FIELD: "SPRING_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_FSG_SP", PERIOD:"Spring", FIELD: "SPRING_EARLY_READING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_CP_FSG", PERIOD:"Spring", FIELD: "SPRING_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_DW_FSG", PERIOD:"Spring", FIELD: "SPRING_DECODABLE_WORDS_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_LN_FSG", PERIOD:"Spring", FIELD: "SPRING_LETTER_NAMES_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_LS_FSG", PERIOD:"Spring", FIELD: "SPRING_LETTER_SOUNDS_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_NW_FSG", PERIOD:"Spring", FIELD: "SPRING_NONSENSE_WORDS_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_OS_FSG", PERIOD:"Spring", FIELD: "SPRING_ONSET_SOUNDS_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_OR_FSG", PERIOD:"Spring", FIELD: "SPRING_ORAL_REPETITION_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WR_FSG", PERIOD:"Spring", FIELD: "SPRING_WORD_RHYMING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_SR_FSG", PERIOD:"Spring", FIELD: "SPRING_SENTENCE_READING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_SW_FSG", PERIOD:"Spring", FIELD: "SPRING_SIGHT_WORDS_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WB_FSG", PERIOD:"Spring", FIELD: "SPRING_WORD_BLENDING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WS_FSG", PERIOD:"Spring", FIELD: "SPRING_WORD_SEGMENTING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_SYR_FSG", PERIOD:"Spring", FIELD: "SPRING_SYLLABLE_READING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"SER_CBMR_EN_FSG", PERIOD:"Spring", FIELD: "SPRING_CBMR-ENGLISH_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"SER_CBMR_SP_FSG", PERIOD:"Spring", FIELD: "SPRING_CBMR-", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "EAR_READ", CODE:"WFM_ERE_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_COP_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_DW_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_DECODABLE_WORDS_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_LN_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_LETTER_NAMES_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_LS_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_LETTER_SOUNDS_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_NW_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_NONSENSE_WORDS_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_OS_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_ONSET_SOUNDS_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_OR_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_ORAL_REPETITION_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_WR_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_RHYMING_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_SR_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_SENTENCE_READING_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_SW_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_SIGHT_WORDS_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_WB_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_BLENDING_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_WS_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_SEGMENTING_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"WFM_CBMR_FFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_CBMR-ENGLISH_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "EAR_READ", CODE:"WFM_ERE_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_COP_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_DW_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_DECODABLE_WORDS_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_LN_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_LETTER_NAMES_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_LS_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_LETTER_SOUNDS_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_NW_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_NONSENSE_WORDS_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_OS_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_ONSET_SOUNDS_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_OR_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_ORAL_REPETITION_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_WR_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_RHYMING_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_SR_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_SENTENCE_READING_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_SW_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_SIGHT_WORDS_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_WB_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_BLENDING_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"WFM_WS_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_WORD_SEGMENTING_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"WFM_CBMR_WFMG", PERIOD:"Winter", FIELD: "WINTER_FEB-MAR_CBMR-ENGLISH_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "EAR_READ", CODE:"SER_WSG", PERIOD:"Spring", FIELD: "SPRING_EARLY_READING_ENGLISH_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WSG_SP", PERIOD:"Spring", FIELD: "SPRING_EARLY_READING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_CP_WSG", PERIOD:"Spring", FIELD: "SPRING_CONCEPTS_OF_PRINT_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_DW_WSG", PERIOD:"Spring", FIELD: "SPRING_DECODABLE_WORDS_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_LN_WSG", PERIOD:"Spring", FIELD: "SPRING_LETTER_NAMES_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_LS_WSG", PERIOD:"Spring", FIELD: "SPRING_LETTER_SOUNDS_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_NW_WSG", PERIOD:"Spring", FIELD: "SPRING_NONSENSE_WORDS_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_OS_WSG", PERIOD:"Spring", FIELD: "SPRING_ONSET_SOUNDS_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_OR_WSG", PERIOD:"Spring", FIELD: "SPRING_ORAL_REPETITION_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WR_WSG", PERIOD:"Spring", FIELD: "SPRING_WORD_RHYMING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_SR_WSG", PERIOD:"Spring", FIELD: "SPRING_SENTENCE_READING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_SW_WSG", PERIOD:"Spring", FIELD: "SPRING_SIGHT_WORDS_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WB_WSG", PERIOD:"Spring", FIELD: "SPRING_WORD_BLENDING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_WS_WSG", PERIOD:"Spring", FIELD: "SPRING_WORD_SEGMENTING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EAR_READ", CODE:"SER_SYR_WSG", PERIOD:"Spring", FIELD: "SPRING_SYLLABLE_READING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"SER_CBMR_EN_WSG", PERIOD:"Spring", FIELD: "SPRING_CBMR-ENGLISH_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           //,{TEST: "EAR_READ", CODE:"SER_CBMR_SP_WSG", PERIOD:"Spring", FIELD: "SPRING_CBMR-", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "EAR_READ", CODE:"ENGLISH_PROGRESS", PERIOD:"", FIELD: "REPORT", FIELD_2: "" , MAP_FUNCTION: mapScaledScore2}
        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    const gradeDecode = {
        "One"     :   "01",
        "Two"     :   "02",
        "Three"     :   "03",
        "Four"     :   "04",
        "Five"     :   "05",
        "Six"     :   "06",
        "Seven"     :   "07",
        "Eight"     :   "08",
        "Nine" : "09",
        "Ten" : "10",
        "Eleven" : "11",
        "Twelve" : "12",
        "Kindergarten"     :   "KG",
        null    : null,
        ""      : null
    };
    const primaryDecode = {
        "VL"     :   "Very Low Risk",
        "CP"     :   "Very Low Risk",
        "LR"     :   "Low Risk",
        "highRisk"     :   "High Risk",
        "someRisk"     :   "Some Risk",
        "lowRisk"     :   "Low Risk",
        "Low Risk"     :   "Low Risk",
        "Some Risk"     :   "Some Risk",
        "Very Low Risk"     :   "Very Low Risk",
        "High Risk"     :   "High Risk",
        "EX"     : "Exceeds",
        "EC"     : "Exceeds",
        "AD"    : "AD",
        "OT"    : "On Track",
        null    : null,
        ""      : null
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
        // Map a normalized record for different period
        if(signature.getFormat().getFormatName() === 'Early_Reading_Mini') {
            var record = mapNormalizedRecord(signature, hierarchy, row);
            AppUtil.nullSafePush(normalizedRecords, record);
        } else {
            for(var i=0; i<adminPeriods.length; i++) {
                var record = mapNormalizedRecord(signature, hierarchy, row, adminPeriods[i], i);
                AppUtil.nullSafePush(normalizedRecords, record);
            }
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
    function mapNormalizedRecord(signature, hierarchy, row, period, periodIndex) {
        let record = {};
        let mappingObject = {};

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
        scoresToMap.forEach(function(testMetadata) {

            try {
                var score;
                if(signature.getFormat().getFormatName() === 'Early_Reading_Mini') {
                    score = (testMetadata.MAP_FUNCTION)(signature, row, testMetadata);

                } else {
                    score = (testMetadata.MAP_FUNCTION)(signature, row, testMetadata, period, periodIndex);
                }


                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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
        let record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        let recentDate = checkAdminDate(row, period);
        var birthDateObject = {
                                RAW_DATE : null
                                , MONTH : null
                                , DAY : null
                                , YEAR : null
                                , STANDARD_DATE : null
                              };


        //Date fields to be split
        if (row.getField("DOB") !== null && row.getField("DOB") !== undefined){
            birthDateField = row.getField("DOB");
            var birthDateObject = module.mapDateObject(hierarchy, signature, birthDateField);
        }
        else {
            birthDateString = row.getField("STUDENT_DOB_YEAR") + "-" + row.getField("STUDENT_DOB_MONTH") + "-" + row.getField("STUDENT_DOB_DAY")
        }

        var testDateObject;
        if(signature.getFormat().getFormatName() === 'Early_Reading_Mini') {
              testDateObject = parseTestDate(row.getField("ASSESSMENT_DATE"));
        } else {
              testDateObject = parseTestDate(recentDate);
        }
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, period);
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
                    record.REPORTING_PERIOD = period ? period : hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, getDefaultTestAdminDateByPeriod(hierarchy, period));
                    //record.TEST_ADMIN_DATE = _util.coalesce(AppUtil.getDateObjByPattern(recentDate, "MM/d/yyyy").STANDARD_DATE, '05/15/' + hierarchy.SCHOOL_YEAR.substring(0,4));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("LOCAL_ID")));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STATE_ID")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("LOCAL_ID")));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
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
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL")
                    );
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER")+"-").substring(0,1);
                    break;
                case "DISTRICT":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("DISTRICT"));
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
       return {};
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
     function mapScaledScore2(signature, row, testMetadata) {
        try {
            let score = {};
            var testNumber = testMetadata.CODE + "_" + testMetadata.FIELD;
            var scaleScore = row.getField("SCORE");
             //Check for key fields and do not map score and exit if conditions met.
             if(scaleScore === null
                    || scaleScore === undefined
                    || _util.trim(scaleScore) === "--"
                    || _util.trim(scaleScore) === "") {
                 return null;
             }
              // Set score fields
              score["TEST_NUMBER"] = testNumber;
              score["TEST_SCORE_TEXT"] = scaleScore;

             var formattedScore = formatNumeric84(scaleScore);
             if(formattedScore !== null){
                 score["TEST_SCORE_VALUE"] = formattedScore;
                 score["TEST_SCALED_SCORE"] = formattedScore;
             } else {
                 score["TEST_SCORE_VALUE"] = null;
                 score["TEST_SCALED_SCORE"] = null;
             }
            score["TEST_LOWER_BOUND"] = scaleScore;
            score["TEST_UPPER_BOUND"] = scaleScore;
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = row.getField("SCORE_METRIC");

            return score;
        } catch(e) {
            print("Error in mapScaledScore2 : " + e + "\n")
        }

     }

    function mapScaledScore(signature, row, testMetadata, period, periodIndex) {
        if(testMetadata.PERIOD === period) {
            try{
                var spanishNumber = "";
                var spanishField = "";
                if(signature.getFormat().getFormatName() === 'Early_Reading_spanish' || signature.getFormat().getFormatName() === 'Early_Reading_spanish_22'){
                    spanishNumber = "_SPA";
                }
                let score = {};
                var testNumber = generateTestNumber(signature, row, testMetadata, periodIndex, spanishNumber);
                var scaleScore = row.getField(testMetadata.FIELD + "COMPOSITE_SCORE");
                var primary = row.getField(testMetadata.FIELD + "RISK_LEVEL");
                var percentileSchool = row.getField(testMetadata.FIELD + "PERCENTILE_AT_SCHOOL");
                var percentileLEA = row.getField(testMetadata.FIELD + "PERCENTILE_AT_LEA");
                var percentileNation = row.getField(testMetadata.FIELD  + "PERCENTILE_AT_NATION");
                var uniqueDate = row.getField(testMetadata.FIELD + "FINAL_DATE");

                 //Check for key fields and do not map score and exit if conditions met.
                 if(scaleScore === null
                        || scaleScore === undefined
                        || _util.trim(scaleScore) === "--"
                        || _util.trim(scaleScore) === ""
                        || uniqueDate === ""
                        || uniqueDate === null) {
                     return null;
                 }
                scaleScore = parseFloat(scaleScore)
                 // Set score fields
                 score["TEST_NUMBER"] = testNumber;
                 score["TEST_SCORE_TEXT"] = scaleScore;

                 var formattedScore = formatNumeric84(scaleScore);
                if(formattedScore !== null){
                     score["TEST_SCORE_VALUE"] = formattedScore;
                     score["TEST_SCALED_SCORE"] = formattedScore;
                } else {
                    score["TEST_SCORE_VALUE"] = null;
                    score["TEST_SCALED_SCORE"] = null;
                 }
                score["TEST_PRIMARY_RESULT_CODE"] = primary;
                score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
                score["TEST_SCORE_ATTRIBUTES"] = uniqueDate;
                score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
                score["TEST_SECONDARY_RESULT"] = percentileSchool;
                score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
                score["TEST_TERTIARY_RESULT"] = percentileLEA;
                score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
                score["TEST_QUATERNARY_RESULT"] = percentileNation;
                if(percentileNation !== null || percentileNation !== undefined){
                score["TEST_PERCENTILE_SCORE"] = parseFloat(percentileNation);
                }
                return score;
            } catch(e) {
                print("Error mapScaledScore : "+e+"\n");
            }
        } else {
            return null;
        }


     }

    function mapStrandScore(signature, row, testMetadata, period, periodIndex) {
        let sig = signature;
        if(testMetadata.PERIOD === period) {
            try{
                    var spanishNumber = "";
                    var spanishField = "";
                    if(signature.getFormat().getFormatName() === 'Early_Reading_spanish' || signature.getFormat().getFormatName() === 'Early_Reading_spanish_22'){
                        spanishNumber = "_SPA";
                        spanishField = "SPANISH_";
                    }
                    let score = {};
                    var testNumber = generateTestNumber(signature, row, testMetadata, periodIndex, spanishNumber);
                    var scaleScore = row.getField(testMetadata.FIELD + spanishField + "CORRECT_ATTEMPTS");
                    var itemsPossible = row.getField(testMetadata.FIELD + spanishField + "TOTAL_POSSIBLE_VALUE");
                    var itemsAttempted = row.getField(testMetadata.FIELD + spanishField +  "CORRECT_PER_MINUTE");
                    var itemsError = row.getField(testMetadata.FIELD + spanishField +  "ERROR");
                    var primary = row.getField(testMetadata.FIELD + spanishField + "RISK_LEVEL");
                    var percentileSchool = row.getField(testMetadata.FIELD + spanishField + "PERCENTILE_AT_SCHOOL");
                    var percentileLEA = row.getField(testMetadata.FIELD + spanishField + "PERCENTILE_AT_LEA");
                    var percentileNation = row.getField(testMetadata.FIELD + spanishField + "PERCENTILE_AT_NATION");
                    var uniqueDate = row.getField(testMetadata.FIELD + "FINAL_DATE");
                    //Todo may be individual growth scores!

                    if(sig.getFormat().getFormatName() === 'Early_Reading_Mini') {
                        if(!row.getField("ASSESSMENT_DATE")) {
                            return null;
                        }
                    } else if(checkAdminDate(row, period) == null) {
                          return null;
                    }


                    //Check for key fields and do not map score and exit if conditions met.
                    if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                        return null;
                    }
                scaleScore = parseFloat(scaleScore)
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = scaleScore;

                var formattedScore = formatNumeric84(scaleScore);
                if(formattedScore !== null){
                    score["TEST_SCORE_VALUE"] = formattedScore;
                    score["TEST_SCALED_SCORE"] = formattedScore;
                } else {
                    score["TEST_SCORE_VALUE"] = null;
                    score["TEST_SCALED_SCORE"] = null;
                }
                score["TEST_PRIMARY_RESULT_CODE"] = primary;
                score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
                score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
                score["TEST_SECONDARY_RESULT"] = percentileSchool;
                score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
                score["TEST_TERTIARY_RESULT"] = percentileLEA;
                score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
                score["TEST_QUATERNARY_RESULT"] = percentileNation;
                if(itemsPossible){
                    score["TEST_ITEMS_POSSIBLE"] = parseInt(itemsPossible);
                }
                if(itemsAttempted){
                    score["TEST_ITEMS_ATTEMPTED"] = parseInt(itemsAttempted);
                }
                if(!isNaN(itemsError)){
                    score["TEST_STANDARD_ERROR"] = itemsError;
                }
                score["TEST_SCORE_ATTRIBUTES"] = uniqueDate;
                if(percentileNation){
                    score["TEST_PERCENTILE_SCORE"] = parseFloat(percentileNation);
                }
                    return score;
            } catch(e) {
                    print("Error in mapStrandScore : " + e + "\n")
                }
        } else {
            return null;
        }


    }
    //Per UIHN-39664 CBMR should be loades separately via CBMR loader/file
    /*function mapCBMRScore(signature, row, testMetadata, period, periodIndex) {
        let sig = signature;
        if(testMetadata.PERIOD === period) {
            try{
                var spanishNumber = "";
                var spanishField = "";
                if(signature.getFormat().getFormatName() === 'Early_Reading_spanish' || signature.getFormat().getFormatName() === 'Early_Reading_spanish_22'){
                    spanishNumber = "_SPA";
                    spanishField = "SPANISH_";
                }
                let score = {};
                var testNumber = generateTestNumber(signature, row, testMetadata, periodIndex, spanishNumber);
                var scaleScore = row.getField(testMetadata.FIELD + "CORRECT_PER_MINUTE")
                var itemsPossible = row.getField(testMetadata.FIELD + "TOTAL_POSSIBLE_VALUE");
                var itemsAttempted = row.getField(testMetadata.FIELD + "CORRECT_ATTEMPTS");
                var itemsError = row.getField(testMetadata.FIELD + "ERROR");
                var primary = row.getField(testMetadata.FIELD + "RISK_LEVEL");
                var percentileSchool = row.getField(testMetadata.FIELD + "PERCENTILE_AT_SCHOOL");
                var percentileLEA = row.getField(testMetadata.FIELD + "PERCENTILE_AT_LEA");
                var percentileNation = row.getField(testMetadata.FIELD + "PERCENTILE_AT_NATION");
                var medianAccuracy = row.getField(testMetadata.FIELD + "MEDIAN_ACCURACY")
                var uniqueDate = row.getField(testMetadata.FIELD + "FINAL_DATE");

                if(sig.getFormat().getFormatName() === 'Early_Reading_Mini') {
                    if(!row.getField("ASSESSMENT_DATE")) {
                        return null;
                    }
                } else if(checkAdminDate(row, period) == null) {
                     return null;
                }


                //Check for key fields and do not map score and exit if conditions met.
                if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                     return null;
                }
                scaleScore = parseFloat(scaleScore)
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = scaleScore;

                var formattedScore = formatNumeric84(scaleScore);
                if(formattedScore !== null){
                    score["TEST_SCORE_VALUE"] = formattedScore;
                    score["TEST_SCALED_SCORE"] = formattedScore;
                } else {
                    score["TEST_SCORE_VALUE"] = null;
                    score["TEST_SCALED_SCORE"] = null;
                }
                score["TEST_PRIMARY_RESULT_CODE"] = primary;
                score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
                score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
                score["TEST_SECONDARY_RESULT"] = percentileSchool;
                score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
                score["TEST_TERTIARY_RESULT"] = percentileLEA;
                score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
                score["TEST_QUATERNARY_RESULT"] = percentileNation;
                if(itemsPossible){
                    score["TEST_ITEMS_POSSIBLE"] = parseInt(itemsPossible);
                }
                if(itemsAttempted){
                    score["TEST_ITEMS_ATTEMPTED"] = parseInt(itemsAttempted);
                }
                if(!isNaN(itemsError)){
                    score["TEST_STANDARD_ERROR"] = itemsError;
                }
                score["TEST_SCORE_ATTRIBUTES"] = uniqueDate;
                if(percentileNation){
                    score["TEST_PERCENTILE_SCORE"] = parseFloat(percentileNation);
                }
                if(medianAccuracy){
                    score["TEST_PERCENTAGE_SCORE"] = parseFloat(medianAccuracy);
                }

                return score;
            }catch(e){
                print("Error in mapCBMRScore : " + e + "\n")
            }
        } else {
             return null;
         }


    }*/

    function mapGrowthScore(signature, row, testMetadata, period, periodIndex) {
        let sig = signature;
        if(testMetadata.PERIOD === period) {
            try {
                var spanishNumber = "";
                var spanishField = "";
                if(signature.getFormat().getFormatName() === 'Early_Reading_spanish' || signature.getFormat().getFormatName() === 'Early_Reading_spanish_22'){
                    spanishNumber = "_SPA";
                    spanishField = "SPANISH_";
                }
                let score = {};
                var testNumber = generateTestNumber(signature, row, testMetadata, periodIndex, spanishNumber);
                var growthScore = row.getField(testMetadata.FIELD+ spanishField +"GROWTH_SCORE"+testMetadata.FIELD_2);
                var growthPercentile = row.getField(testMetadata.FIELD+ spanishField +"NATIONAL_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
                var growthDistrict = row.getField(testMetadata.FIELD+ spanishField +"DISTRICT_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
                var growthStart = row.getField(testMetadata.FIELD+ spanishField +"GROWTH_PERCENTILE_BY_START_SCORE"+testMetadata.FIELD_2);
                var growthSchool = row.getField(testMetadata.FIELD+ spanishField +"SCHOOL_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
                var percentileLEA = row.getField(testMetadata.FIELD + spanishField +"PERCENTILE_AT_LEA");
                var primary = row.getField(testMetadata.FIELD + spanishField +"RISK_LEVEL");
                var percentileSchool = row.getField(testMetadata.FIELD + spanishField +"PERCENTILE_AT_SCHOOL");
                var percentileNation = row.getField(testMetadata.FIELD + spanishField +"PERCENTILE_AT_NATION");

                if(sig.getFormat().getFormatName() === 'Early_Reading_Mini') {
                    if(!row.getField("ASSESSMENT_DATE")) {
                        return null;
                    }
                } else if(checkAdminDate(row, period) == null) {
                    return null;
                }

                //Check for key fields and do not map score and exit if conditions met.
                if(growthScore === null || growthScore === undefined || _util.trim(growthScore) === "--" || _util.trim(growthScore) === "") {
                    return null;
                }

                growthScore = parseFloat(growthScore)
                growthSchool = parseFloat(growthSchool)
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = growthScore;
                score["TEST_GROWTH_RESULT"] = growthScore;
                var formattedScore = formatNumeric84(growthScore);
                if(formattedScore !== null){
                    score["TEST_SCORE_VALUE"] = formattedScore;
                    score["TEST_SCALED_SCORE"] = formattedScore;
                } else {
                    score["TEST_SCORE_VALUE"] = null;
                    score["TEST_SCALED_SCORE"] = null;
                }
                if(growthPercentile){
                    score["TEST_PERCENTILE_SCORE"] = parseFloat(growthPercentile);
                    score["TEST_GROWTH_PERCENTILE"] = parseFloat(growthPercentile);
                }
                score["TEST_GROWTH_TARGET_1"] = parseFloat(growthStart);
                if(!isNaN(growthSchool)){
                    score["TEST_GROWTH_TARGET_2"] = growthSchool;
                }
                if(growthDistrict){
                    score["TEST_GROWTH_TARGET_3"] = parseFloat(growthDistrict);
                }
                score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
                score["TEST_TERTIARY_RESULT"] = percentileLEA;
                score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
                score["TEST_QUATERNARY_RESULT"] = percentileNation;
                score["TEST_PRIMARY_RESULT_CODE"] = primary;
                score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
                score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
                score["TEST_SECONDARY_RESULT"] = percentileSchool;
                return score;
            } catch(e) {
                print("Error in mapGrowthScore : " + e + "\n")
            }
        } else {
            return null;
        }


    }

    module.mapDateObject = function (hierarchy, row, dateStr) {

        //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
        } catch(exception){
            // Error will be reported in final check.
        }

        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "M/d/yyyy");
            } catch(exception){
                // Error will be reported in final check.
            }
        }
        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM-dd-yyyy");
            } catch(exception){
                // Error will be reported in final check.
            }
        }
        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "ddMMyy");
            } catch(exception){
                // Error will be reported in final check.
            }
        }
        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
            } catch(exception){
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
            // Sending different periods to generate assessment admin key
            if(signature.getFormat().getFormatName() === 'Early_Reading_Mini') {
                var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
                var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);
                if(assessmentAdminKey_one === assessmentAdminKey_two) {
                    return 1;
                } else {
                    return -1;
                }
            } else {
                for(var i=0; i<adminPeriods.length; i++) {
                    var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, adminPeriods[i]);
                    var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, adminPeriods[i]);
                    if(assessmentAdminKey_one === assessmentAdminKey_two) {
                        return 1;
                    } else {
                        return -1;
                    }
                }
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, period) {

        var assessmentAdminKey = null;
        // Set base assessment admin key information based on period
        if(period===undefined){
             assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        }
        else{
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}";
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        // Add the Final date
        assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(checkAdminDate(srcRecord, period), getDefaultTestAdminDateByPeriod(hierarchy, period));

        return assessmentAdminKey;
    }

    function parseTestDate(rawDate) {

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
        if (rawDate.length >= 8 && rawDate.indexOf('/') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
        } else if (rawDate.length >= 8 && rawDate.indexOf('-') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
        } else {
            var formatter = new java.text.SimpleDateFormat("MM/d/yyyy");
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

    function generateTestNumber(signature, row, testMetadata, periodIndex, spanishNumber) {
        var testNumber;
        if(signature.getFormat().getFormatName() === 'Early_Reading_Mini') {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + periodIndex;
        }else if(signature.getFormat().getFormatName() === 'Early_Reading_spanish' || signature.getFormat().getFormatName() === 'Early_Reading_spanish_22') {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + periodIndex + spanishNumber;
        }else {
            testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        }
        return testNumber;
    }

    /**
         * Utility to format a value for numeric(8,4) DB column
         * Rounds to 4 decimal places, ensures value is in [-9999.9999, 9999.9999]
         * Returns null if not a number or out of range
         */
          function formatNumeric84(val) {
            if (val === null || val === undefined || isNaN(val)) return null;
            var num = Number(val);
            num = Math.round(num * 10000) / 10000;
            if (num > 9999.9999 || num < -9999.9999) return null;
            return num;
        }

    function getDefaultTestAdminDateByPeriod(hierarchy, periodValue) {
        var date = '';
        var period = periodValue ? periodValue : hierarchy.REPORTING_PERIOD;
        if(period === 'Fall' || period === 'FALL') {
            date = "09/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}"
        } else if (period === 'Winter' || period === 'WINTER') {
            date = "01/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}"
        } else if (period === 'Spring' || period === 'SPRING') {
            date = "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}"
        } else {
            // Making SPRING as default
            date = "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}"
        }
        return date;
    }
    //Per UIHN-39664 only the main Early Reading English/Spanish Final Date should be valid
    //These commented out values can be deleted during a future task, temporarily preserved in case we need them back for some reason
    function checkAdminDate(row, period) {

        if(period === "Fall" || period === "FALL") {
            let date = _util.coalesce(
               /*row.getField("FALL_CBMR-ENGLISH_FINAL_DATE")
               ,row.getField("FALL_CBMR-SPANISH_FINAL_DATE")*/
               row.getField("FALL_EARLY_READING_ENGLISH_FINAL_DATE")
               ,row.getField("FALL_EARLY_READING_SPANISH_FINAL_DATE")
               /*,row.getField("FALL_CONCEPTS_OF_PRINT_FINAL_DATE")
               ,row.getField("FALL_DECODABLE_WORDS_FINAL_DATE")
               ,row.getField("FALL_LETTER_NAMES_FINAL_DATE")
               ,row.getField("FALL_LETTER_SOUNDS_FINAL_DATE")
               ,row.getField("FALL_NONSENSE_WORDS_FINAL_DATE")
               ,row.getField("FALL_ONSET_SOUNDS_FINAL_DATE")
               ,row.getField("FALL_ORAL_REPETITION_FINAL_DATE")
               ,row.getField("FALL_WORD_RHYMING_FINAL_DATE")
               ,row.getField("FALL_SENTENCE_READING_FINAL_DATE")
               ,row.getField("FALL_SIGHT_WORDS_FINAL_DATE")
               ,row.getField("FALL_WORD_BLENDING_FINAL_DATE")
               ,row.getField("FALL_WORD_SEGMENTING_FINAL_DATE")
               ,row.getField("FALL_SYLLABLE_READING_FINAL_DATE")*/
               ,null);
           return date;
        } else if(period === "Winter" || period === "WINTER") {
            let date = _util.coalesce(
                /*row.getField("WINTER_CBMR-ENGLISH_FINAL_DATE")
                ,row.getField("WINTER_CBMR-SPANISH_FINAL_DATE")*/
                row.getField("WINTER_EARLY_READING_ENGLISH_FINAL_DATE")
                ,row.getField("WINTER_EARLY_READING_SPANISH_FINAL_DATE")
                /*,row.getField("WINTER_CONCEPTS_OF_PRINT_FINAL_DATE")
                ,row.getField("WINTER_DECODABLE_WORDS_FINAL_DATE")
                ,row.getField("WINTER_LETTER_NAMES_FINAL_DATE")
                ,row.getField("WINTER_LETTER_SOUNDS_FINAL_DATE")
                ,row.getField("WINTER_NONSENSE_WORDS_FINAL_DATE")
                ,row.getField("WINTER_ONSET_SOUNDS_FINAL_DATE")
                ,row.getField("WINTER_ORAL_REPETITION_FINAL_DATE")
                ,row.getField("WINTER_WORD_RHYMING_FINAL_DATE")
                ,row.getField("WINTER_SENTENCE_READING_FINAL_DATE")
                ,row.getField("WINTER_SIGHT_WORDS_FINAL_DATE")
                ,row.getField("WINTER_WORD_BLENDING_FINAL_DATE")
                ,row.getField("WINTER_WORD_SEGMENTING_FINAL_DATE")
                ,row.getField("WINTER_SYLLABLE_READING_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_CBMR-ENGLISH_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_EARLY_READING_ENGLISH_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_CONCEPTS_OF_PRINT_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_DECODABLE_WORDS_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_LETTER_NAMES_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_LETTER_SOUNDS_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_NONSENSE_WORDS_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_ONSET_SOUNDS_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_ORAL_REPETITION_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_WORD_RHYMING_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_SENTENCE_READING_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_SIGHT_WORDS_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_WORD_BLENDING_FINAL_DATE")
                ,row.getField("WINTER_FEB-MAR_WORD_SEGMENTING_FINAL_DATE")*/
                 ,null);
            return date;
        } else if(period ==="Spring" || period ==="SPRING") {
            let date = _util.coalesce(
                 /*row.getField("SPRING_CBMR-ENGLISH_FINAL_DATE")
                 ,row.getField("SPRING_CBMR-SPANISH_FINAL_DATE")*/
                 row.getField("SPRING_EARLY_READING_ENGLISH_FINAL_DATE")
                 ,row.getField("SPRING_EARLY_READING_SPANISH_FINAL_DATE")
                 /*,row.getField("SPRING_CONCEPTS_OF_PRINT_FINAL_DATE")
                 ,row.getField("SPRING_DECODABLE_WORDS_FINAL_DATE")
                 ,row.getField("SPRING_LETTER_NAMES_FINAL_DATE")
                 ,row.getField("SPRING_LETTER_SOUNDS_FINAL_DATE")
                 ,row.getField("SPRING_NONSENSE_WORDS_FINAL_DATE")
                 ,row.getField("SPRING_ONSET_SOUNDS_FINAL_DATE")
                 ,row.getField("SPRING_ORAL_REPETITION_FINAL_DATE")
                 ,row.getField("SPRING_WORD_RHYMING_FINAL_DATE")
                 ,row.getField("SPRING_SENTENCE_READING_FINAL_DATE")
                 ,row.getField("SPRING_SIGHT_WORDS_FINAL_DATE")
                 ,row.getField("SPRING_WORD_BLENDING_FINAL_DATE")
                 ,row.getField("SPRING_WORD_SEGMENTING_FINAL_DATE")
                 ,row.getField("SPRING_SYLLABLE_READING_FINAL_DATE")*/
                 ,null);
             return date;
        }
    }
    function writeNormalizedRecords(file, data) {
            try {
                const normalFile = _file.open(file);
                const normalFilePath = normalFile.getParent();
                const normalFileName = normalFile.getName();
                const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
                let rowArray = null;
                const header = Object.keys(data[0]);

                writer.writeNext(header);

                data.forEach(function (row) {
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

        function getRecords(file, signature) {
            try {
                const format = signature.getFormat();
                const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
        const fileFullName = file.getFullName();
        let lineNumber = 0;
        let recordsArray = [];

        let record, row;

        if (signature.getFormat().getClass().toString().equals(SignatureFormatType.DELIMITED)) {
            let fieldDelimiter = format.getFieldDelim();
            let textDelimiter = format.getQuoteDelim();
            let delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
            let fieldNames = delimitedRecordParser.parseRow(reader);
            while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                record = { LINEAGE_FILE: null, LINEAGE_LINE: null };

                // Fix: Use Math.min to prevent index out of bounds
                const maxIndex = Math.min(fieldNames.length, row.size());
                for (let index = 0; index < maxIndex; index++) {
                    record[fieldNames[index]] = row.get(index);
                }

                record.LINEAGE_FILE = fileFullName;
                record.LINEAGE_LINE = (++lineNumber).toString();

                recordsArray.push(record);
            }
        } else if (signature.getFormat().getClass().toString().equals(SignatureFormatType.FIXED_LENGTH)) {
            let fields = format.getFields();
            while ((row = reader.readLine()) !== null) {
                record = { LINEAGE_FILE: null, LINEAGE_LINE: null };
                fields.forEach(field => {
                    record[field.getPhysicalName()] = row.substring(
                        field.getFieldOffset().getOffsetStart() - 1,
                        field.getFieldOffset().getOffsetEnd()
                    ).trim();
                });
                record.LINEAGE_FILE = fileFullName;
                record.LINEAGE_LINE = (++lineNumber).toString();

                recordsArray.push(record);
            }
        } else {
            throw new Error("Invalid Signature Format");
        }

        return recordsArray;
            } catch (exception) {
                throw "${_thisModuleName}.createRecords Exception: ${exception}";
            }
        }

    return module;
}());