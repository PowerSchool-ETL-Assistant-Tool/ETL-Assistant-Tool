var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "COGAT";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

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
    module.createNormalizedFile = function (file, signature) {
        try {
            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const records = getRecords(file, signature);

            print("\nLoading using signature file ${signature.getFormat().getFormatName()}\n");

            let normalizedFile = AppUtil.createResultsFile(file);

            print("\nNormalized file: ${normalizedFile}");

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
                    }  else if(row.STUDENT_LOCAL_ID === '#N/A'){
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            file.getFilePath(),
                            "WARNING",
                            row.LINEAGE_LINE,
                            "No scores found or StudentID #N/A",
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


            // _dataflow.create("RECORD BUILD")
            //     .input("INPUT", AppUtil.getInputDataflow(file, signature))
            //     .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
            //
            // json.LINEAGE_FILE = fileFullName;
            //         json.LINEAGE_LINE = (++lineNumber).toString();
            //         output.RECORDS.put(json);
            //     })
            //     .group_by("ADMINISTRATION GROUPING", function (one, two) {
            //         try {
            //             var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
            //             var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

            //             return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
            //         } catch (exception) {
            //             AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
            //         }
            //     })
            //     .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
            //         try {
            //             if (!multipleRowsPerGroupingExpected && rows.length > 1) {
            //                 rows.forEach(function (row) {
            //                     AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
            //                 });

            //             } else {
            //                 output.RECORDS.put(rows);
            //             }
            //         } catch (exception) {
            //             AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
            //         }
            //     })
            //     .transform("NORMALIZE RECORDS", ["RECORDS"], function (output, rows) {
            //         try {
            //             var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

            //             normalizedRecords.forEach(function (record) {
            //                 output.RECORDS.put(record);
            //             });
            //         } catch (exception) {
            //             AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
            //         }
            //     })
            //     .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
            //         try {
            //             var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

            //             if (mappingObject.SCORE_MAPPINGS.length === 0) {
            //                 AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
            //             } else {
            //                 output.RECORDS.put(row);
            //             }
            //         } catch (exception) {
            //             AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
            //         }
            //     })
            //     .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\"))
            //     .execute();

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
        {
            FUNCTION: mapTestScoreBase,
            TESTS: [
                ['V', 'VERBAL', ''],
                ['Q', 'QUANTITATIVE', ''],
                ['N', 'NONVERBAL', ''],
                ['V', 'VERBAL', 'AGE'],
                ['Q', 'QUANTITATIVE', 'AGE'],
                ['N', 'NONVERBAL', 'AGE'],
                ['V', 'VERBAL', 'GRD'],
                ['Q', 'QUANTITATIVE', 'GRD'],
                ['N', 'NONVERBAL', 'GRD'],
                ['V', 'VERBAL', 'LCL'],
                ['Q', 'QUANTITATIVE', 'LCL'],
                ['N', 'NONVERBAL', 'LCL'],
                ['V', 'VERBAL', 'CC'],
                ['Q', 'QUANTITATIVE', 'CC'],
                ['N', 'NONVERBAL', 'CC']
            ]
        },
        {
            FUNCTION: mapTestScoreComposite,
            TESTS: [
                ['VQ', 'VQ', ''],
                ['VN', 'VN', ''],
                ['QN', 'QN', ''],
                ['VQ', 'VQ', 'AGE'],
                ['VN', 'VN', 'AGE'],
                ['QN', 'QN', 'AGE'],
                ['VQ', 'VQ', 'GRD'],
                ['VN', 'VN', 'GRD'],
                ['QN', 'QN', 'GRD'],
                ['VQ', 'VQ', 'LCL'],
                ['VN', 'VN', 'LCL'],
                ['QN', 'QN', 'LCL'],
                ['VQ', 'VQ', 'CC'],
                ['VN', 'VN', 'CC'],
                ['QN', 'QN', 'CC']
            ]
        },
        {
            FUNCTION: mapTestScoreTotal,
            TESTS: [
                ['VQN', 'VQN', ''],
                ['VQN', 'VQN', 'AGE'],
                ['VQN_FULL', 'VQN_FULL', 'AGE'],
                ['VQN_SCREENER', 'VQN_SCREENER', 'AGE'],
                ['VQN', 'VQN', 'GRD'],
                ['VQN_FULL', 'VQN_FULL', 'GRD'],
                ['VQN_SCREENER', 'VQN_SCREENER', 'GRD'],
                ['VQN', 'VQN', 'LCL'],
                ['VQN', 'VQN', 'CC']
            ]
        }
    ];

    var scoresToMapNew = [
        { TEST: "COGAT", CODE: "ITBS_RD", FIELD: "ITBS_READING", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "ITBS_MA", FIELD: "ITBS_MATH", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "ITBS_SCI", FIELD: "ITBS_SCIENCE", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "ITBS_SS", FIELD: "ITBS_SS", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "QRI", FIELD: "QRI", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "TOMAGS", FIELD: "TOMAGS", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_SCH_GEN", FIELD: "SIGS_SCHOOL_GENERAL", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_SCH_LA", FIELD: "SIGS_SCHOOL_LA", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_SCH_MA", FIELD: "SIGS_SCHOOL_MATH", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_SCH_SCI", FIELD: "SIGS_SCHOOL_SCIENCE", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_SCH_SS", FIELD: "SIGS_SCHOOL_SOCIAL_STUDIES", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_SCH_CRE", FIELD: "SIGS_SCHOOL_CREATIVITY", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_SCH_LEA", FIELD: "SIGS_SCHOOL_LEADERSHIP", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_HOME_GEN", FIELD: "SIGS_HOME_GENERAL", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_HOME_LA", FIELD: "SIGS_HOME_LA", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_HOME_MA", FIELD: "SIGS_HOME_MATH", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_HOME_SCI", FIELD: "SIGS_HOME_SCIENCE", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_HOME_SS", FIELD: "SIGS_HOME_SOCIAL_STUDIES", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_CRE", FIELD: "SIGS_CREATIVITY", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "SIGS_LEA", FIELD: "SIGS_LEADERSHIP", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WISC_VERBAL_COMP", FIELD: "WISC_VERBAL_COMPREHENSION", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WISC_VIS_SPAT", FIELD: "WISC_VISUAL_SPATIAL", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WISC_FLU_REA", FIELD: "WISC_FLUID_REASONING", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WISC_WORK_MEM", FIELD: "WISC_WORKING_MEMORY", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WISC_PROC_SPEED", FIELD: "WISC_PROCESSING_SPEED", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WISC_FULL_SCALE_IQ", FIELD: "WISC_FULL_SCALE_IQ", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WPPSI_VERBAL_COMP", FIELD: "WPPSI_VERBAL_COMPREHENSION", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WPPSI_VIS_SPAT", FIELD: "WPPSI_VISUAL_SPATIAL", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WPPSI_FLU_REA", FIELD: "WPPSI_FLUID_REASONING", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WPPSI_WORK_MEM", FIELD: "WPPSI_WORKING_MEMORY", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WPPSI_PROC_SPEED", FIELD: "WPPSI_PROCESSING_SPEED", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "WPPSI_FULL_SCALE_IQ", FIELD: "WPPSI_FULL_SCALE_IQ", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "PCA_SCH_RATING_SCALE", FIELD: "PCA_SCHOOL_RATING_SCALE", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "PCA_HOME_RATING_SCALE", FIELD: "PCA_HOME_RATING_SCALE", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "PCA_CRE_INDEX", FIELD: "PCA_CREATIVITY_INDEX", MAP_FUNCTION: mapScaledScore }
        , { TEST: "COGAT", CODE: "ABILITY_PROFILE", FIELD: "ABILITY_PROFILE", MAP_FUNCTION: mapAbilityProfile }

    ];

    var NWEAPerfLevels = {
        "LO": "Low",
        "AV": "Average",
        "HI": "High",
        "LOW": "Low",
        "LOAVG": "Low Average",
        "AVG": "Average",
        "HIAVG": "High Average",
        "HIGH": "High",
        "--": "--"
    };

    var growthMet = {
        "No": "Did Not Meet Growth",
        "No*": "Did Not Meet Growth",
        "Yes": "Met Growth",
        "Yes*": "Met Growth",
        "--": "--"
    };
    var seasonDecode = {
        "1": "SPRING",
        "2": "WINTER",
        "3": "FALL",
        "": null
    };


    var gradeDecodes = {
        "1": "01",
        "2": "02",
        "3": "03",
        "4": "04",
        "5": "05",
        "6": "06",
        "7": "07",
        "8": "08",
        "9": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "13": "KG",
        "0": "KG",
        "KG": "KG",
        "K": "KG"
       ,"" : null
       ,null : null
    };
    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/

    function mapTestScoreBase(row, testParams, signature) {
        var score = {};
        var rawScore = row.getField("RAW_SCORE_" + testParams[1]);
        var studentID = row.getField('STUDENT_ID');
        if(signature.getFormat().getFormatName() !== 'COGAT_21_22_222COL'){
            var subscore = row.getField("AGE_STANINE_" + testParams[1]);
        }
       if(signature.getFormat().getFormatName() === 'COGAT_57_1_COLS_2122' && testParams[2] === ''){
            //This signature does not have a normal raw score for default scoring (not Age, etc)
            var rawScore = row.getField('UNIVERSAL_SCALE_SCORE_' + testParams[1]);
        }
        if (testParams[2] === 'AGE') {
            var AprObject = row.getField('AGE_PERCENTILE_RANK_' + testParams[1]);
        }
        if (testParams[2] === 'GRD') {
            var GprObject = row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]);
        }
        if (testParams[2] === 'LCL') {
            var LprObject = row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]);
        }
        if (((rawScore == null || rawScore == '') && (subscore == null || subscore == '') && (AprObject == null || AprObject == '') && (GprObject == null || GprObject == '') && (LprObject == null || LprObject == '')) || studentID === '#N/A') {
            return null;
        }
        score['TEST_NUMBER'] = 'COGAT' + testParams[2] + formatGrade(_util.coalesce(row.getField("CLASS_GRADE"), row.getField("CURRENT_GRADE"))) + testParams[0];
        if (testParams[2] === '') {
            score['TEST_ITEMS_ATTEMPTED'] = row.getField('NUMBER_ATTEMPTED_' + testParams[1]);
            score['TEST_SCORE_VALUE'] = row.getField('UNIVERSAL_SCALE_SCORE_' + testParams[1]);
            score['TEST_SCORE_TEXT'] = row.getField('UNIVERSAL_SCALE_SCORE_' + testParams[1]);
            score['TEST_RAW_SCORE'] = row.getField('RAW_SCORE_' + testParams[1]);
            score['TEST_SCALED_SCORE'] = row.getField('UNIVERSAL_SCALE_SCORE_' + testParams[1]);
            score['TEST_STANDARD_ERROR'] = row.getField('RAW_SCORE_PERSONAL_STANDARD_ERROR_' + testParams[1]);
            score['TEST_LOWER_BOUND'] = row.getField('RAW_SCORE_LOWER_BOUND_' + testParams[1]);
            score['TEST_UPPER_BOUND'] = row.getField('RAW_SCORE_UPPER_BOUND_' + testParams[1]);
        } else if (signature.getFormat().getFormatName() === 'COGAT_19_20_21') {
            return null;
         } else if (testParams[2] === 'AGE') {
            var SAS = parseInt(nullToEmpty(row.getField('STANDARD_AGE_SCORE_' + testParams[1])));
            var APR = parseInt(nullToEmpty(AprObject));
            var AS = parseInt(nullToEmpty(row.getField('AGE_STANINE_' + testParams[1])));
            score['TEST_QUATERNARY_RESULT'] = row.getField('STANDARD_AGE_SCORE_' + testParams[1]);
            score['TEST_LOWER_BOUND'] = row.getField('SAS_LOWER_BOUND_' + testParams[1]);
            score['TEST_UPPER_BOUND'] = row.getField('SAS_UPPER_BOUND_' + testParams[1]);

            if (row.getField('AGE_STANINE_' + testParams[1]) !== null && row.getField('AGE_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('AGE_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('AGE_PERCENTILE_RANK_' + testParams[1]);

            if (row.getField('AGE_STANINE_' + testParams[1]) == '' || row.getField('AGE_STANINE_' + testParams[1]) == null) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (AS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (AS == 8 || AS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (AS == 6 || AS == 5 || AS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (AS == 3 || AS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }


            if (row.getField('AGE_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('AGE_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (APR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (APR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (APR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (APR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }

            if (row.getField('STANDARD_AGE_SCORE_' + testParams[1]) == '' || row.getField('STANDARD_AGE_SCORE_' + testParams[1]) == null) {
                score['TEST_TERTIARY_RESULT_CODE'] = '--';
                score['TEST_TERTIARY_RESULT'] = 'Not Provided';
            } else if (SAS > 131) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'VH';
                score['TEST_TERTIARY_RESULT'] = 'Very High';
            } else if (SAS > 111) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'AA';
                score['TEST_TERTIARY_RESULT'] = 'Above Average';
            } else if (SAS > 87) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'A';
                score['TEST_TERTIARY_RESULT'] = 'Average';
            } else if (SAS > 71) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'BA';
                score['TEST_TERTIARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_TERTIARY_RESULT_CODE'] = 'VL';
                score['TEST_TERTIARY_RESULT'] = 'Very Low';
            }
        }
        else if (testParams[2] === 'GRD') {
            var GPR = parseInt(nullToEmpty(row.getField('GRADE_PERCENTILE_RANK_' + testParams[1])));
            var GS = parseInt(nullToEmpty(row.getField('GRADE_STANINE_' + testParams[1])));
            if (row.getField('GRADE_STANINE_' + testParams[1]) !== null && row.getField('GRADE_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('GRADE_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]);

            if (row.getField('GRADE_STANINE_' + testParams[1]) == '' || row.getField('GRADE_STANINE_' + testParams[1]) == null) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (GS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (GS == 8 || GS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (GS == 6 || GS == 5 || GS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (GS == 3 || GS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }

            if (row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (GPR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (GPR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (GPR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (GPR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }
        }
        else if (testParams[2] === 'LCL') {
            var LPR = parseInt(nullToEmpty(row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1])));
            var LS = parseInt(nullToEmpty(row.getField('LOCAL_STANINE_' + testParams[1])));
            if (row.getField('LOCAL_STANINE_' + testParams[1]) !== null && row.getField('LOCAL_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('LOCAL_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]);

            if (row.getField('LOCAL_STANINE_' + testParams[1]) == '' || row.getField('LOCAL_STANINE_' + testParams[1]) == null) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (LS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (LS == 8 || LS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (LS == 6 || LS == 5 || LS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (LS == 3 || LS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }

            if (row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (LPR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (LPR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (LPR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (LPR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }
        }
        else if (testParams[2] === 'CC') {
            if (!isNaN(row.getField('COMPLETION_CRITERIA_VERBAL'))) {
                score['TEST_T_SCORE'] = row.getField('COMPLETION_CRITERIA_VERBAL');
            }
            if (!isNaN(row.getField('COMPLETION_CRITERIA_QUANTITATIVE'))) {
                score['TEST_PREDICTED_SCORE'] = row.getField('COMPLETION_CRITERIA_QUANTITATIVE');
            }
            if (!isNaN(row.getField('COMPLETION_CRITERIA_NONVERBAL'))) {
                score['TEST_Z_SCORE'] = row.getField('COMPLETION_CRITERIA_NONVERBAL');
            }
        }
        else {
            return null;
        }

        score['TEST_GRADE_EQUIVALENT'] = gradeDecodes[_util.coalesce(row.getField("CLASS_GRADE"), row.getField("CURRENT_GRADE"))];
        return score;
    }

    function mapTestScoreComposite(row, testParams, signature) {
        var score = {};
        var studentID = row.getField('STUDENT_ID');
        var scaledScore = row.getField('UNIVERSAL_SCALE_SCORE_' + testParams[1]);
        if(signature.getFormat().getFormatName() === 'COGAT_57_1_COLS_2122' && testParams[2] === 'CC'){
            //This signature does not have a normal raw score for default scoring (not Age, etc)
            return null;
        }
        if (testParams[2] === 'AGE') {
            var AprObject = row.getField('AGE_PERCENTILE_RANK_' + testParams[1]);
        }
        if (testParams[2] === 'GRD') {
            var GprObject = row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]);
        }
        if (testParams[2] === 'LCL') {
            var LprObject = row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]);
        }
        if (((scaledScore == null || scaledScore == '') && (AprObject == null || AprObject == '') && (GprObject == null || GprObject == '') && (LprObject == null || LprObject == '')) || studentID === '#N/A') {
            return null;
        }
        var testNum = 'COGAT' + testParams[2] + formatGrade(_util.coalesce(row.getField("CLASS_GRADE"), row.getField("CURRENT_GRADE"))) + testParams[0]
        score['TEST_NUMBER'] = testNum;
        if (testParams[2] === '') {
            score['TEST_ITEMS_ATTEMPTED'] = row.getField('NUMBER_ATTEMPTED_' + testParams[1]);
            score['TEST_SCORE_VALUE'] = scaledScore;
            score['TEST_SCORE_TEXT'] = scaledScore;
            score['TEST_RAW_SCORE'] = row.getField('RAW_SCORE_' + testParams[1])
            score['TEST_SCALED_SCORE'] = scaledScore;
            score['TEST_STANDARD_ERROR'] = row.getField('RAW_SCORE_PERSONAL_STANDARD_ERROR_' + testParams[1]);
        } else if (signature.getFormat().getFormatName() === 'COGAT_19_20_21'){
            return null;
        }
        else if (testParams[2] === 'AGE') {
            var SAS = parseInt(nullToEmpty(row.getField('STANDARD_AGE_SCORE_' + testParams[1])));
            var APR = parseInt(nullToEmpty(AprObject));
            var AS = parseInt(nullToEmpty(row.getField('AGE_STANINE_' + testParams[1])));

            score['TEST_QUATERNARY_RESULT'] = row.getField('STANDARD_AGE_SCORE_' + testParams[1]);
            score['TEST_LOWER_BOUND'] = row.getField('SAS_LOWER_BOUND_' + testParams[1]);
            score['TEST_UPPER_BOUND'] = row.getField('SAS_UPPER_BOUND_' + testParams[1]);
            if (row.getField('AGE_STANINE_' + testParams[1]) !== null && row.getField('AGE_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('AGE_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('AGE_PERCENTILE_RANK_' + testParams[1]);



            if (row.getField('AGE_STANINE_' + testParams[1]) == '' || row.getField('AGE_STANINE_' + testParams[1]) == null) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (AS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (AS == 8 || AS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (AS == 6 || AS == 5 || AS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (AS == 3 || AS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }


            if (row.getField('AGE_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('AGE_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (APR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (APR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (APR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (APR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }


            if (row.getField('STANDARD_AGE_SCORE_' + testParams[1]) == '' || row.getField('STANDARD_AGE_SCORE_' + testParams[1]) == null) {
                score['TEST_TERTIARY_RESULT_CODE'] = '--';
                score['TEST_TERTIARY_RESULT'] = 'Not Provided';
            } else if (SAS > 131) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'VH';
                score['TEST_TERTIARY_RESULT'] = 'Very High';
            } else if (SAS > 111) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'AA';
                score['TEST_TERTIARY_RESULT'] = 'Above Average';
            } else if (SAS > 87) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'A';
                score['TEST_TERTIARY_RESULT'] = 'Average';
            } else if (SAS > 71) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'BA';
                score['TEST_TERTIARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_TERTIARY_RESULT_CODE'] = 'VL';
                score['TEST_TERTIARY_RESULT'] = 'Very Low';
            }
        }
        else if (testParams[2] === 'GRD') {
            var GPR = parseInt(nullToEmpty(row.getField('GRADE_PERCENTILE_RANK_' + testParams[1])));
            var GS = parseInt(nullToEmpty(row.getField('GRADE_STANINE_' + testParams[1])));
            if (row.getField('GRADE_STANINE_' + testParams[1]) !== null && row.getField('GRADE_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('GRADE_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]);


            if (row.getField('GRADE_STANINE_' + testParams[1]) == '' || row.getField('GRADE_STANINE_' + testParams[1]) == null) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (GS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (GS == 8 || GS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (GS == 6 || GS == 5 || GS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (GS == 3 || GS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }

            if (row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (GPR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (GPR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (GPR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (GPR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }
        }
        else if (testParams[2] === 'LCL') {
            var LPR = parseInt(nullToEmpty(row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1])));
            var LS = parseInt(nullToEmpty(row.getField('LOCAL_STANINE_' + testParams[1])));
            if (row.getField('LOCAL_STANINE_' + testParams[1]) !== null && row.getField('LOCAL_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('LOCAL_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]);

            if (row.getField('LOCAL_STANINE_' + testParams[1]) == '' || row.getField('LOCAL_STANINE_' + testParams[1]) == null) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (LS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (LS == 8 || LS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (LS == 6 || LS == 5 || LS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (LS == 3 || LS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }

            if (row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (LPR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (LPR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (LPR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (LPR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }
        }

         else if (testParams[2] === 'CC') {
            if (!isNaN(row.getField('COMPLETION_CRITERIA_VQ'))) {
                score['TEST_T_SCORE'] = row.getField('COMPLETION_CRITERIA_VQ');
            }
            if (!isNaN(row.getField('COMPLETION_CRITERIA_VN'))) {
                score['TEST_PREDICTED_SCORE'] = row.getField('COMPLETION_CRITERIA_VN');
            }
            if (!isNaN(row.getField('COMPLETION_CRITERIA_QN'))) {
                score['TEST_Z_SCORE'] = row.getField('COMPLETION_CRITERIA_QN');
            }
        }
        else {
            return null;
        }
        score['TEST_GRADE_EQUIVALENT'] = gradeDecodes[_util.coalesce(row.getField("CLASS_GRADE"), row.getField("CURRENT_GRADE"))];
        return score;
    }

    function mapTestScoreTotal(row, testParams, signature) {
        var score = {};
        var scaledScore = row.getField('UNIVERSAL_SCALE_SCORE_' + testParams[1]);
        if(signature.getFormat().getFormatName() === 'COGAT_57_1_COLS_2122' && testParams[2] === 'CC'){
            //This signature does not have a normal raw score for default scoring (not Age, etc)
            return null;
        }
        var studentID = row.getField('STUDENT_ID');
        if (testParams[2] === 'AGE') {
            var AprObject = row.getField('AGE_PERCENTILE_RANK_' + testParams[1]);
        }
        if (testParams[2] === 'GRD') {
            var GprObject = row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]);
        }
        if (testParams[2] === 'LCL') {
            var LprObject = row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]);
        }
        if (((scaledScore == null || scaledScore == '') && (AprObject == null || AprObject == '') && (GprObject == null || GprObject == '') && (LprObject == null || LprObject == '')) || studentID === '#N/A') {
            return null;
        }
        score['TEST_NUMBER'] = 'COGAT' + testParams[2] + formatGrade(_util.coalesce(row.getField("CLASS_GRADE"), row.getField("CURRENT_GRADE"))) + testParams[0];
        if (testParams[2] === '') {
            var AP = row.getField('ABILITY_PROFILE');
            if(AP !== null){
            if (AP && AP.indexOf('A') != -1)
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
            else if (AP && AP.indexOf('B') != -1)
                score['TEST_PRIMARY_RESULT_CODE'] = 'B';
            else if (AP && AP.indexOf('C') != -1)
                score['TEST_PRIMARY_RESULT_CODE'] = 'C';
            else if (AP && AP.indexOf('E') != -1)
                score['TEST_PRIMARY_RESULT_CODE'] = 'E';

            score['TEST_PRIMARY_RESULT'] = AP;
            }
            score['TEST_ITEMS_ATTEMPTED'] = row.getField('NUMBER_ATTEMPTED_' + testParams[1]);
            score['TEST_SCORE_VALUE'] = scaledScore;
            score['TEST_SCORE_TEXT'] = scaledScore;
            score['TEST_RAW_SCORE'] = row.getField('RAW_SCORE_' + testParams[1]);
            score['TEST_SCALED_SCORE'] = scaledScore;
            score['TEST_STANDARD_ERROR'] = row.getField('RAW_SCORE_PERSONAL_STANDARD_ERROR_' + testParams[1]);
            if (signature.getFormat().getFormatName() === 'COGAT_19_20_21' || signature.getFormat().getFormatName() === 'COGAT_FW'){
                var LPR = parseInt(nullToEmpty(row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1])));
                if (LPR == '') {
                    score['TEST_SECONDARY_RESULT_CODE'] = '--';
                    score['TEST_SECONDARY_RESULT'] = 'Not Provided';
                } else if (LPR > 95) {
                    score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                    score['TEST_SECONDARY_RESULT'] = 'Very High';
                } else if (LPR > 75) {
                    score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                    score['TEST_SECONDARY_RESULT'] = 'Above Average';
                } else if (LPR > 24) {
                    score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                    score['TEST_SECONDARY_RESULT'] = 'Average';
                } else if (LPR > 4) {
                    score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                    score['TEST_SECONDARY_RESULT'] = 'Below Average';
                } else {
                    score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                    score['TEST_SECONDARY_RESULT'] = 'Very Low';
                }
            }

        } else if (signature.getFormat().getFormatName() === 'COGAT_19_20_21'){
            return null;
        }
        else if (testParams[2] === 'AGE') {
            var SAS = parseInt(nullToEmpty(row.getField('STANDARD_AGE_SCORE_' + testParams[1])));
            var APR = parseInt(nullToEmpty(AprObject));
            var AS = parseInt(nullToEmpty(row.getField('AGE_STANINE_' + testParams[1])));

            score['TEST_QUATERNARY_RESULT'] = row.getField('STANDARD_AGE_SCORE_' + testParams[1]);
            score['TEST_LOWER_BOUND'] = row.getField('SAS_LOWER_BOUND_' + testParams[1]);
            score['TEST_UPPER_BOUND'] = row.getField('SAS_UPPER_BOUND_' + testParams[1]);
            if (row.getField('AGE_STANINE_' + testParams[1]) !== null && row.getField('AGE_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('AGE_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('AGE_PERCENTILE_RANK_' + testParams[1]);

            if (row.getField('AGE_STANINE_' + testParams[1]) == '' || row.getField('AGE_STANINE_' + testParams[1]) == null ) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (AS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (AS == 8 || AS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (AS == 6 || AS == 5 || AS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (AS == 3 || AS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }


            if (row.getField('AGE_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('AGE_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (APR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (APR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (APR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (APR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }


            if (row.getField('STANDARD_AGE_SCORE_' + testParams[1]) == '' || row.getField('STANDARD_AGE_SCORE_' + testParams[1]) == null) {
                score['TEST_TERTIARY_RESULT_CODE'] = '--';
                score['TEST_TERTIARY_RESULT'] = 'Not Provided';
            } else if (SAS > 131) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'VH';
                score['TEST_TERTIARY_RESULT'] = 'Very High';
            } else if (SAS > 111) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'AA';
                score['TEST_TERTIARY_RESULT'] = 'Above Average';
            } else if (SAS > 87) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'A';
                score['TEST_TERTIARY_RESULT'] = 'Average';
            } else if (SAS > 71) {
                score['TEST_TERTIARY_RESULT_CODE'] = 'BA';
                score['TEST_TERTIARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_TERTIARY_RESULT_CODE'] = 'VL';
                score['TEST_TERTIARY_RESULT'] = 'Very Low';
            }
        }
        else if (testParams[2] === 'GRD') {
            var GPR = parseInt(nullToEmpty(row.getField('GRADE_PERCENTILE_RANK_' + testParams[1])));
            var GS = parseInt(nullToEmpty(row.getField('GRADE_STANINE_' + testParams[1])));
            if (row.getField('GRADE_STANINE_' + testParams[1]) !== null && row.getField('GRADE_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('GRADE_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]);

            if (row.getField('GRADE_STANINE_' + testParams[1]) == '' || row.getField('GRADE_STANINE_' + testParams[1]) == null) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (GS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (GS == 8 || GS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (GS == 6 || GS == 5 || GS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (GS == 3 || GS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }

            if (row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('GRADE_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (GPR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (GPR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (GPR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (GPR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }
        }
        else if (testParams[2] === 'LCL') {
            var LPR = parseInt(nullToEmpty(row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1])));
            var LS = parseInt(nullToEmpty(row.getField('LOCAL_STANINE_' + testParams[1])));
            if (row.getField('LOCAL_STANINE_' + testParams[1]) !== null && row.getField('LOCAL_STANINE_' + testParams[1]) !== "") {
                score['TEST_STANINE_SCORE'] = row.getField('LOCAL_STANINE_' + testParams[1]);
            }
            score['TEST_PERCENTILE_SCORE'] = row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]);

            if (row.getField('LOCAL_STANINE_' + testParams[1]) == '' || row.getField('LOCAL_STANINE_' + testParams[1]) == null) {
                score['TEST_PRIMARY_RESULT_CODE'] = '--';
                score['TEST_PRIMARY_RESULT'] = 'Not Provided';
            } else if (LS == 9) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
                score['TEST_PRIMARY_RESULT'] = 'Very High';
            } else if (LS == 8 || LS == 7) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
                score['TEST_PRIMARY_RESULT'] = 'Above Average';
            } else if (LS == 6 || LS == 5 || LS == 4) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
                score['TEST_PRIMARY_RESULT'] = 'Average';
            } else if (LS == 3 || LS == 2) {
                score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
                score['TEST_PRIMARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
                score['TEST_PRIMARY_RESULT'] = 'Very Low';
            }

            if (row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]) == '' || row.getField('LOCAL_PERCENTILE_RANK_' + testParams[1]) == null) {
                score['TEST_SECONDARY_RESULT_CODE'] = '--';
                score['TEST_SECONDARY_RESULT'] = 'Not Provided';
            } else if (LPR > 95) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VH';
                score['TEST_SECONDARY_RESULT'] = 'Very High';
            } else if (LPR > 75) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'AA';
                score['TEST_SECONDARY_RESULT'] = 'Above Average';
            } else if (LPR > 24) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'A';
                score['TEST_SECONDARY_RESULT'] = 'Average';
            } else if (LPR > 4) {
                score['TEST_SECONDARY_RESULT_CODE'] = 'BA';
                score['TEST_SECONDARY_RESULT'] = 'Below Average';
            } else {
                score['TEST_SECONDARY_RESULT_CODE'] = 'VL';
                score['TEST_SECONDARY_RESULT'] = 'Very Low';
            }
        }
        else if (testParams[2] === 'CC') {
            if (!isNaN(row.getField('COMPLETION_CRITERIA_VQN'))) {
                score['TEST_PERCENTAGE_SCORE'] = row.getField('COMPLETION_CRITERIA_VQN');
            }
        }
        else {
            return null;
        }
       score['TEST_GRADE_EQUIVALENT'] = gradeDecodes[_util.coalesce(row.getField("CLASS_GRADE"), row.getField("CURRENT_GRADE"))];
        return score;
    }

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD);

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

        if (scaleScore > 95) {
           score['TEST_PRIMARY_RESULT_CODE'] = 'VH';
           score['TEST_PRIMARY_RESULT'] = 'Very High';
           } else if (scaleScore > 75) {
            score['TEST_PRIMARY_RESULT_CODE'] = 'AA';
            score['TEST_PRIMARY_RESULT'] = 'Above Average';
           } else if (scaleScore > 24) {
            score['TEST_PRIMARY_RESULT_CODE'] = 'A';
            score['TEST_PRIMARY_RESULT'] = 'Average';
           } else if (scaleScore > 4) {
            score['TEST_PRIMARY_RESULT_CODE'] = 'BA';
            score['TEST_PRIMARY_RESULT'] = 'Below Average';
           } else {
            score['TEST_PRIMARY_RESULT_CODE'] = 'VL';
            score['TEST_PRIMARY_RESULT'] = 'Very Low';
           }
        }

        return score;
    }

    function mapAbilityProfile(row, testMetadata) {
        var score = {};
        var abilityProfile = row.getField("ABILITY_PROFILE");
        var grade = formatGrade(_util.coalesce(row.getField("CLASS_GRADE"), row.getField("CURRENT_GRADE")));

        if(grade !== null && grade !== undefined && grade !== ""){
            var testNumber =  testMetadata.TEST + "_" + testMetadata.CODE + "_" + grade;
        }else{
            var testNumber =  testMetadata.TEST + "_" + testMetadata.CODE;
        }

        if(abilityProfile === null || abilityProfile === undefined || _util.trim(abilityProfile) === "--" || _util.trim(abilityProfile) === ""){
            return null;
        }

        score['TEST_NUMBER'] = testNumber

            var AP = row.getField('ABILITY_PROFILE');
            if(AP !== null){
            if (AP && AP.indexOf('A') != -1)
                score['TEST_PRIMARY_RESULT_CODE'] = 'A';
            else if (AP && AP.indexOf('B') != -1)
                score['TEST_PRIMARY_RESULT_CODE'] = 'B';
            else if (AP && AP.indexOf('C') != -1)
                score['TEST_PRIMARY_RESULT_CODE'] = 'C';
            else if (AP && AP.indexOf('E') != -1)
                score['TEST_PRIMARY_RESULT_CODE'] = 'E';

            score['TEST_PRIMARY_RESULT'] = AP;

        }
        return score;
    }


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
        scoresToMap.forEach(
            function (testDef) {
                testDef.TESTS.forEach(
                    function (testParams) {
                        try {
                            var score = (testDef.FUNCTION)(row, testParams, signature);
                            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
                        }
                    }
                );
            }
        );

        scoresToMapNew.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch (exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
            }
        });

        // for(var goalNumber = 1;goalNumber <= 8; goalNumber++) {
        //     try {
        //         var goalScore = mapGoalScore(row, goalNumber);
        //
        //         AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, goalScore);
        //     } catch(exception) {
        //         print(exception)
        //         AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Goal mapping error: ${exception}", JSON.stringify(rows)));
        //     }
        // }
        //
        // for(var projProfNumber=1; projProfNumber<=10; projProfNumber++) {
        //     try {
        //         var projProfScore = mapProjectedProficiencyScore(row, projProfNumber);
        //
        //         AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, projProfScore);
        //     } catch(exception) {
        //         AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Proficiency mapping error: ${exception}", JSON.stringify(rows)));
        //     }
        // }

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
        var birthDateObject = getDateFormat(row.getField("DATE_OF_BIRTH"), signature);
        if(birthDateObject === null || birthDateObject === undefined){
            birthDateObject = {
                         RAW_DATE: null
                        , MONTH: null
                        , DAY: null
                        , YEAR: null
                        , STANDARD_DATE: null
                    };
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
                    record.REPORTING_PERIOD = _util.coalesce(row.getField("QUARTERMONTH"), seasonDecode[row.getField("SEASON")], hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getDateFormat(_util.coalesce(row.getField("DATE_TESTED"),"05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9)), signature).STANDARD_DATE;
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("SECONDARY_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
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
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("BUILDING_NAME"), row.getField("SCHOOL_CODE"), "DISTRICT");
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("BUILDING_NAME"),row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("BUILDING_CODE"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("BUILDING_CODE"), row.getField("SCHOOL_CODE"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecodes[_util.coalesce(row.getField("CLASS_GRADE"), row.getField("CURRENT_GRADE"))];
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
        return {}
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function formatGrade(value) {
        if (value === null) {
            return '';
        }
        else if ((value.length == 1) && (value !== 'K')) {
            value = '0' + value;
        }
        if ((value == '00') || (value == 'K')){
            value = 'KG';
        }
        return value;
    }
    function formatDate(value) {
        if (value == null || value.length != 8)
            return value;

        return value.substring(0, 2) + '/' + value.substring(2, 4) + '/' + value.substring(4, 8);
    }
    /***************************************************************************
     Utility Functions
     ***************************************************************************/

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

    function getDateFormat(dateFromFile, signature){
        var dateObject;
        if(dateFromFile !== null && dateFromFile !== undefined && dateFromFile !== ""){
        if (dateFromFile.indexOf('/') > -1 && dateFromFile.length == 10) {
            dateObject = AppUtil.getDateObjByPattern(dateFromFile, "MM/dd/yyyy");
            return dateObject;
        } else if (dateFromFile.length > 10 && dateFromFile.indexOf('T')) {
            dateObject = AppUtil.getDateObjByPattern(dateFromFile.split("T"), "yyyy-MM-dd");
            return dateObject;
        }
        else if (dateFromFile.length == 9) {
            dateObject = AppUtil.getDateObjByPattern(dateFromFile, "M/dd/yyyy");
            return dateObject;
        } else if (dateFromFile.length == 8 && dateFromFile.indexOf("/") > -1) {
            dateObject = AppUtil.getDateObjByPattern(dateFromFile, "M/d/yyyy");
            return dateObject;
        }
        else if (dateFromFile.length == 7) {
            if(dateFromFile.indexOf("/")>-1){
                dateObject = AppUtil.getDateObjByPattern(dateFromFile, "M/dd/yy");
            }
            else{
                dateObject = AppUtil.getDateObjByPattern(dateFromFile, "Mddyyyy");
            }
             return dateObject;
        }
        else if(dateFromFile.length == 5){
            dateObject = AppUtil.getDateObjByPattern(dateFromFile, "Mddyy");
            return dateObject;
        }
        else if(dateFromFile.length == 6){
            dateObject = AppUtil.getDateObjByPattern(dateFromFile, "MMddyy");
            return dateObject;
        }
        else if(dateFromFile.indexOf("-") > -1 && dateFromFile.length == 10){
        if(signature.getFormat().getFormatName() === "COGAT_SHORTHANDS"){
            dateObject = AppUtil.getDateObjByPattern(dateFromFile, "dd-MM-yyyy");
        } else{
            dateObject = AppUtil.getDateObjByPattern(dateFromFile, "MM-dd-yyyy");
        }
            return dateObject;
        }
        else if(dateFromFile.length < 5){
            return null;
        }
        else {
            dateObject = AppUtil.getDateObjByPattern(dateFromFile, "MMddyyyy");
            return dateObject;
        }
        }
        else {
            return null;
        }
    }
    function getRecords(file, signature) {
        try {
            const format = signature.getFormat();
            const fileFullName = file.getFullName();
            const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));

            let lineNumber = 0;
            let recordsArray = [];

            let record, row;

            if (signature.getFormat().getClass().toString().equals(SignatureFormatType.DELIMITED)) {
                let fieldDelimiter = format.getFieldDelim();
                let textDelimiter = format.getQuoteDelim();
                let delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
                let fieldNames = delimitedRecordParser.parseRow(reader);
                while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                    let index = 0;

                    record = { LINEAGE_FILE: null, LINEAGE_LINE: null };

                    for (const key in fieldNames) {
                        record[fieldNames[index]] = row.get(index++);
                    }

                    record.LINEAGE_FILE = fileFullName;
                    record.LINEAGE_LINE = (++lineNumber).toString();

                    recordsArray.push((record));
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
    function defaultWhenNull(aValue, defaultValue) {
        if (aValue != null) return aValue;
        return defaultValue;
    }

    function nullToEmpty(aValue) {
        return defaultWhenNull(aValue, "");
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
        var date = srcRecord.getField("DATE_TESTED");
        var AP = srcRecord.getField("ABILITY_PROFILE");
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        if(signature.getFormat().getFormatName() === "COGAT_SHORTHANDS" || signature.getFormat().getFormatName() === "COGAT_19_20_21_22_45COL"){
            assessmentAdminKey = assessmentAdminKey + "_" + getDateFormat(_util.coalesce(date,"05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9)), signature).STANDARD_DATE;
            if(AP !== null && AP !== undefined && AP !== ""){
                assessmentAdminKey = assessmentAdminKey + "_" + AP;
            }
        }

        return assessmentAdminKey;
    }

    return module;
}());