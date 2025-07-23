var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "acadience_math";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
    var multipleRowsPerGroupingExpected = false;
    var adminPeriod;
    var threePeriods = ["_BEG", "_MID", "_END"];

    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
    const BufferedReader = Java.type("java.io.BufferedReader");
    const InputStreamReader = Java.type("java.io.InputStreamReader");
    const FileInputStream = Java.type("java.io.FileInputStream");
    const CSVWriter = Java.type("com.opencsv.CSVWriter");
    const FileWriter = Java.type("java.io.FileWriter");
    const File = Java.type("java.io.File");
    const groupedRecords = {};

    module.createNormalizedFile = function (file, signature) {
        try {
            const normalizedFile = AppUtil.createResultsFile(file);
            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const fileRows = createRecords(file, signature); // Array of single-record arrays

            let normalizedRows = [];
            let normalizedRecords = [];


            // Flatten all individual rows into a flat list
            const flatRows = [].concat.apply([], fileRows);
            // === GROUPING by natural key ===
            flatRows.forEach(row => {
                try {
                    const details = AppSignatureFieldDetails.getFieldDetailsParser(signature, row);
                    const groupKey = groupAssessmentByNaturalKey(signature, hierarchy, details, details);
                    if (!groupedRecords[groupKey]) groupedRecords[groupKey] = [];
                    groupedRecords[groupKey].push(row);
                } catch (exception) {
                    AssessmentLoader.audits.push(
                        AppAudit.writeRejectRecord(
                            hierarchy.SOURCE_FILE.getFilePath(),
                            "HIGH",
                            (row && row.LINEAGE_LINE) || "-1",
                            `Grouping error: ${exception}`,
                            JSON.stringify(row)
                        )
                    );
                }
            });

            // === PROCESS each group ===
            for (const groupKey in groupedRecords) {
                const rows = groupedRecords[groupKey];

                // === Duplicate check ===
                if (rows.length > 1) {
                    rows.forEach(row => {
                        AssessmentLoader.audits.push(
                            AppAudit.writeRejectRecord(
                                file.getFilePath(),
                                "WARNING",
                                (row && row.LINEAGE_LINE) || "-1",
                                "Duplicate record natural key in source assessment file.",
                                JSON.stringify(row)
                            )
                        );
                    });
                    continue; // Skip processing this duplicate group
                }
                // === Normalize valid group ===
                try {
                    const mapped = mapNormalizedRecords(signature, hierarchy, rows);
                    mapped.forEach(r => normalizedRows.push(r));
                } catch (exception) {
                    AssessmentLoader.audits.push(
                        AppAudit.writeRejectRecord(
                            file.getFilePath(),
                            "HIGH",
                            (rows[0] && rows[0].LINEAGE_LINE) || "-1",
                            `Mapping error: ${exception}`,
                            JSON.stringify(rows[0])
                        )
                    );
                }
            }

            // === Score check + filter ===
            normalizedRows.forEach(function (row) {
                try {
                    const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS || "{}");

                    if (!mappingObject.SCORE_MAPPINGS || mappingObject.SCORE_MAPPINGS.length === 0) {
                         AssessmentLoader.audits.push(
                             AppAudit.writeRejectRecord(
                                 file.getFilePath(),
                                 "WARNING",
                                 row.LINEAGE_LINE || "-1",
                                 "No scores found.",
                                 JSON.stringify(row)
                             )
                         );
                    } else {
                        normalizedRecords.push(row);
                    }

                } catch (exception) {
                     AssessmentLoader.audits.push(
                         AppAudit.writeRejectRecord(
                             hierarchy.SOURCE_FILE.getFilePath(),
                             "HIGH",
                             _util.coalesce(row.LINEAGE_LINE, "-1"),
                             `SCORE COUNT CHECK dataflow error: ${exception}`,
                             JSON.stringify(row)
                         )
                     );
                }
            });

            // === Write Final Output ===
            writeNormalizedRecords(normalizedFile, normalizedRecords);
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
    module.mergeAssessment = function (file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    var scoresToMap = [
        { TEST: "ACADIENCE_MATH", CODE: "BQD", FIELD: "BQD", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "NIF", FIELD: "NIF", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "NNF", FIELD: "NNF", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "AM_COMPOSITE", FIELD: "AM_COMPOSITE", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "AQD", FIELD: "AQD", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "MNF", FIELD: "MNF", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "COMPUTATIONA", FIELD: "COMPA", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "COMPUTATIONB", FIELD: "COMPB", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "AM_COMPUTATION", FIELD: "AM_COMPUTATION", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACADIENCE_MATH", CODE: "CA", FIELD: "CA", MAP_FUNCTION: mapScaledScore },

        //Composite goal need to check with client file
        { TEST: "ACADIENCE_MATH", CODE: "AM_COMPOSITE_GOAL", FIELD: "AM_COMPOSITE_GOAL", MAP_FUNCTION: mapScaledScore }
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


    var testNumberGradeDecode = {
        "1": "1",
        "01": "1",
        "Grade 1": "1",
        "2": "2",
        "02": "2",
        "Grade 2": "2",
        "3": "3",
        "03": "3",
        "Grade 3": "3",
        "4": "4",
        "04": "4",
        "Grade 4": "4",
        "5": "5",
        "05": "5",
        "Grade 5": "5",
        "6": "6",
        "06": "6",
        "Grade 6": "6",
        "7": "7",
        "07": "7",
        "Grade 7": "7",
        "8": "8",
        "08": "8",
        "Grade 8": "8",
        "9": "9",
        "09": "9",
        "Grade 9": "9",
        "10": "10",
        "Grade 10": "10",
        "11": "11",
        "Grade 11": "11",
        "12": "12",
        "Grade 12": "12",
        "KG": "K",
        "KN": "K",
        "K": "K",
        "Kindergarten": "K"
        , "": null
        , null: null
    };

    var benchmarkDecode = {
        "BEGINNING": "_BEG",
        "MIDDLE": "_MID",
        "END": "_END",
        "beginning": "BEG",
        "middle": "MID",
        "end": "END",
        "BOY": "_BEG",
        "MOY": "_MID",
        "EOY": "_END",
        "BEG": "_BEG",
        "MID": "_MID"
    }

    var perfLevels = {
        "--": {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        "Well Below Benchmark": {
            TEST_SECONDARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT_CODE: "WB",
            TEST_PRIMARY_RESULT: "Well Below Benchmark",
            TEST_SECONDARY_RESULT: "Intensive Support"
        },
        "Below Benchmark": {
            TEST_SECONDARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT_CODE: "BB",
            TEST_PRIMARY_RESULT: "Below Benchmark",
            TEST_SECONDARY_RESULT: "Strategic Support"
        },
        "At or Above Benchmark": {
            TEST_SECONDARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT_CODE: "AB",
            TEST_PRIMARY_RESULT: "At or Above Benchmark",
            TEST_SECONDARY_RESULT: "Core Support"
        },
        "Above Benchmark": {
            TEST_SECONDARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT_CODE: "AB",
            TEST_PRIMARY_RESULT: "Above Benchmark",
            TEST_SECONDARY_RESULT: "Core Support"
        },
        "At Benchmark": {
            TEST_SECONDARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT_CODE: "AB",
            TEST_PRIMARY_RESULT: "At Benchmark",
            TEST_SECONDARY_RESULT: "Core Support"
        },
        "Not Determined": {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT: "Not Determined",
            TEST_SECONDARY_RESULT: "Not Determined"
        },
        "B": {
            TEST_SECONDARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT_CODE: "B",
            TEST_PRIMARY_RESULT: "Benchmark",
            TEST_SECONDARY_RESULT: "Core Support"
        },
        "I": {
            TEST_SECONDARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT_CODE: "I",
            TEST_PRIMARY_RESULT: "Intensive",
            TEST_SECONDARY_RESULT: "Intensive Support"
        },
        "S": {
            TEST_SECONDARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT_CODE: "S",
            TEST_PRIMARY_RESULT: "Strategic",
            TEST_SECONDARY_RESULT: "Strategic Support"
        },
        "": {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        " ": {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        null: {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        }
    };

    var capsLevels = {
        "well below benchmark": "Well Below Benchmark",
        "below benchmark": "Below Benchmark",
        "above benchmark": "Above Benchmark",
        "at benchmark": "At Benchmark",
        "at or above benchmark": "At or Above Benchmark",
        "Above Benchmark": "Above Benchmark",
        "Well Below Benchmark": "Well Below Benchmark",
        "Below Benchmark": "Below Benchmark",
        "At Benchmark": "At Benchmark",
        "Benchmark": "At Benchmark",
        "benchmark": "At Benchmark",
        "At or Above Benchmark": "At or Above Benchmark",
        "B": "B",
        "I": "I",
        "S": "S",
        "": "",
        "--": "--"
    }

    var perfCutoffs = {
        "BQD_K_BEG":
            [
                { "Min": "0", "Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "2", "Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "5", "Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "6", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "BQD_K_MID":
            [
                { "Min": "0", "Max": "3", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "4", "Max": "6", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "7", "Max": "9", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "10", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "BQD_K_END":
            [
                { "Min": "0", "Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "9", "Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "13", "Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "16", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "NIF_K_BEG":
            [
                { "Min": "0", "Max": "3", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "4", "Max": "5", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "6", "Max": "8", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "9", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "NIF_K_MID":
            [
                { "Min": "0", "Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "8", "Max": "13", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "14", "Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "21", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "NIF_K_END":
            [
                { "Min": "0", "Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "14", "Max": "24", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "25", "Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "34", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "NNF_K_BEG":
            [
                { "Min": "0", "Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "2", "Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "5", "Max": "6", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "7", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "NNF_K_MID":
            [
                { "Min": "0", "Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "7", "Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "11", "Max": "12", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "13", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "NNF_K_END":
            [
                { "Min": "0", "Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "10", "Max": "13", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "14", "Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "16", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPOSITE_K_BEG":
            [
                { "Min": "0", "Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "13", "Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "24", "Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "33", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPOSITE_K_MID":
            [
                { "Min": "0", "Max": "48", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "49", "Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "72", "Max": "88", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "89", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPOSITE_K_END":
            [
                { "Min": "0", "Max": "66", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "67", "Max": "91", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "92", "Max": "109", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "110", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AQD_1_BEG":
            [
                { "Min": "0", "Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "6", "Max": "9", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "10", "Max": "12", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "13", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AQD_1_MID":
            [
                { "Min": "0", "Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "14", "Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "19", "Max": "21", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "22", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AQD_1_END":
            [
                { "Min": "0", "Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "17", "Max": "21", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "22", "Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "25", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "NIF_1_BEG":
            [
                { "Min": "0", "Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "16", "Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "27", "Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "33", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "NNF_1_BEG":
            [
                { "Min": "0", "Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "9", "Max": "11", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "12", "Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "14", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "MNF_1_BEG":
            [
                { "Min": "0", "Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "2", "Max": "3", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "4", "Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "6", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "MNF_1_MID":
            [
                { "Min": "0", "Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "6", "Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "8", "Max": "8", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "9", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "MNF_1_END":
            [
                { "Min": "0", "Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "8", "Max": "9", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "10", "Max": "11", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "12", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPOSITE_1_BEG":
            [
                { "Min": "0", "Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "81", "Max": "123", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "124", "Max": "147", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "148", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPOSITE_1_MID":
            [
                { "Min": "0", "Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "33", "Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "46", "Max": "52", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "53", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPOSITE_1_END":
            [
                { "Min": "0", "Max": "43", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "44", "Max": "58", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "59", "Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "68", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPUTATION_1_BEG":
            [
                { "Min": "0", "Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "3", "Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "5", "Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "6", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPUTATION_1_MID":
            [
                { "Min": "0", "Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "7", "Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "11", "Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "14", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPUTATION_1_END":
            [
                { "Min": "0", "Max": "10", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "11", "Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "17", "Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "20", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "COMPA_1_BEG":
            [
                { "Min": "0", "Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "3", "Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "5", "Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "6", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "COMPA_1_MID":
            [
                { "Min": "0", "Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "7", "Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "11", "Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "14", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "COMPA_1_END":
            [
                { "Min": "0", "Max": "10", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "11", "Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "17", "Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "20", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "COMPB_1_BEG":
            [
                { "Min": "0", "Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "3", "Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "5", "Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "6", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "COMPB_1_MID":
            [
                { "Min": "0", "Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "7", "Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "11", "Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "14", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "COMPB_1_END":
            [
                { "Min": "0", "Max": "10", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "11", "Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "17", "Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "20", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" },
            ],
        "AM_COMPOSITE_2_BEG":
            [
                { "Min": "0", "Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "16", "Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "24", "Max": "31", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "32", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_2_MID":
            [
                { "Min": "0", "Max": "29", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "30", "Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "46", "Max": "56", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "57", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_2_END":
            [
                { "Min": "0", "Max": "47", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "48", "Max": "65", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "66", "Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "86", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_2_BEG":
            [
                { "Min": "0", "Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "3", "Max": "5", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "6", "Max": "7", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "8", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_2_MID":
            [
                { "Min": "0", "Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "8", "Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "11", "Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "14", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_2_END":
            [
                { "Min": "0", "Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "10", "Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "15", "Max": "18", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "19", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_2_BEG":
            [
                { "Min": "0", "Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "3", "Max": "5", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "6", "Max": "7", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "8", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_2_MID":
            [
                { "Min": "0", "Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "8", "Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "11", "Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "14", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_2_END":
            [
                { "Min": "0", "Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "10", "Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "15", "Max": "18", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "19", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_2_BEG":
            [
                { "Min": "0", "Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "3", "Max": "5", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "6", "Max": "7", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "8", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_2_MID":
            [
                { "Min": "0", "Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "8", "Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "11", "Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "14", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_2_END":
            [
                { "Min": "0", "Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "10", "Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "15", "Max": "18", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "19", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_2_BEG":
            [
                { "Min": "0", "Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "8", "Max": "13", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "14", "Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "18", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_2_MID":
            [
                { "Min": "0", "Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "15", "Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "24", "Max": "30", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "31", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_2_END":
            [
                { "Min": "0", "Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "23", "Max": "34", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "35", "Max": "46", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "47", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_3_BEG":
            [
                { "Min": "0", "Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "33", "Max": "48", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "49", "Max": "55", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "56", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_3_MID":
            [
                { "Min": "0", "Max": "56", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "57", "Max": "82", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "83", "Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "99", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_3_END":
            [
                { "Min": "0", "Max": "73", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "74", "Max": "100", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "101", "Max": "125", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "126", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_3_BEG":
            [
                { "Min": "0", "Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "9", "Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "13", "Max": "14", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "15", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_3_MID":
            [
                { "Min": "0", "Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "16", "Max": "21", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "22", "Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "25", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_3_END":
            [
                { "Min": "0", "Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "21", "Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "29", "Max": "34", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "35", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_3_BEG":
            [
                { "Min": "0", "Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "9", "Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "13", "Max": "14", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "15", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_3_MID":
            [
                { "Min": "0", "Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "16", "Max": "21", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "22", "Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "25", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_3_END":
            [
                { "Min": "0", "Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "21", "Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "29", "Max": "34", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "35", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_3_BEG":
            [
                { "Min": "0", "Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "9", "Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "13", "Max": "14", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "15", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_3_MID":
            [
                { "Min": "0", "Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "16", "Max": "21", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "22", "Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "25", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_3_END":
            [
                { "Min": "0", "Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "21", "Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "29", "Max": "34", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "35", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_3_BEG":
            [
                { "Min": "0", "Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "13", "Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "23", "Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "28", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_3_MID":
            [
                { "Min": "0", "Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "24", "Max": "39", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "40", "Max": "49", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "50", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_3_END":
            [
                { "Min": "0", "Max": "31", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "32", "Max": "46", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "47", "Max": "58", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "59", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_4_BEG":
            [
                { "Min": "0", "Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "47", "Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "70", "Max": "83", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "84", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_4_MID":
            [
                { "Min": "0", "Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "55", "Max": "82", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "83", "Max": "100", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "101", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_4_END":
            [
                { "Min": "0", "Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "81", "Max": "116", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "117", "Max": "149", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "150", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_4_BEG":
            [
                { "Min": "0", "Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "12", "Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "17", "Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "21", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_4_MID":
            [
                { "Min": "0", "Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "21", "Max": "30", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "31", "Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "39", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_4_END":
            [
                { "Min": "0", "Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "33", "Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "46", "Max": "57", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "58", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_4_BEG":
            [
                { "Min": "0", "Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "12", "Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "17", "Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "21", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_4_MID":
            [
                { "Min": "0", "Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "21", "Max": "30", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "31", "Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "39", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_4_END":
            [
                { "Min": "0", "Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "33", "Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "46", "Max": "57", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "58", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_4_BEG":
            [
                { "Min": "0", "Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "12", "Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "17", "Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "21", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_4_MID":
            [
                { "Min": "0", "Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "21", "Max": "30", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "31", "Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "39", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_4_END":
            [
                { "Min": "0", "Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "33", "Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "46", "Max": "57", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "58", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_4_BEG":
            [
                { "Min": "0", "Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "21", "Max": "33", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "34", "Max": "43", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "44", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_4_MID":
            [
                { "Min": "0", "Max": "29", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "30", "Max": "48", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "49", "Max": "62", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "63", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_4_END":
            [
                { "Min": "0", "Max": "45", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "46", "Max": "70", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "71", "Max": "92", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "93", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_5_BEG":
            [
                { "Min": "0", "Max": "34", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "35", "Max": "52", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "53", "Max": "64", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "65", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_5_MID":
            [
                { "Min": "0", "Max": "62", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "63", "Max": "92", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "93", "Max": "117", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "118", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_5_END":
            [
                { "Min": "0", "Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "79", "Max": "115", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "116", "Max": "148", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "149", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_5_BEG":
            [
                { "Min": "0", "Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "18", "Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "27", "Max": "31", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "32", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_5_MID":
            [
                { "Min": "0", "Max": "30", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "31", "Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "52", "Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "66", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_5_END":
            [
                { "Min": "0", "Max": "37", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "38", "Max": "55", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "56", "Max": "69", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "70", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_5_BEG":
            [
                { "Min": "0", "Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "18", "Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "27", "Max": "31", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "32", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_5_MID":
            [
                { "Min": "0", "Max": "30", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "31", "Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "52", "Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "66", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_5_END":
            [
                { "Min": "0", "Max": "37", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "38", "Max": "55", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "56", "Max": "69", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "70", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_5_BEG":
            [
                { "Min": "0", "Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "18", "Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "27", "Max": "31", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "32", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_5_MID":
            [
                { "Min": "0", "Max": "30", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "31", "Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "52", "Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "66", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_5_END":
            [
                { "Min": "0", "Max": "37", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "38", "Max": "55", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "56", "Max": "69", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "70", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_5_BEG":
            [
                { "Min": "0", "Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "15", "Max": "24", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "25", "Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "33", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_5_MID":
            [
                { "Min": "0", "Max": "25", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "26", "Max": "41", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "42", "Max": "52", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "53", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_5_END":
            [
                { "Min": "0", "Max": "39", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "40", "Max": "61", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "62", "Max": "80", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "81", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_6_BEG":
            [
                { "Min": "0", "Max": "45", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "46", "Max": "72", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "73", "Max": "84", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "85", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_6_MID":
            [
                { "Min": "0", "Max": "71", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "72", "Max": "103", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "104", "Max": "124", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "125", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPOSITE_6_END":
            [
                { "Min": "0", "Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "94", "Max": "131", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "132", "Max": "158", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "159", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_6_BEG":
            [
                { "Min": "0", "Max": "27", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "28", "Max": "38", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "39", "Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "46", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_6_MID":
            [
                { "Min": "0", "Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "37", "Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "54", "Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "66", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "AM_COMPUTATION_6_END":
            [
                { "Min": "0", "Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "47", "Max": "65", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "66", "Max": "76", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "77", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_6_BEG":
            [
                { "Min": "0", "Max": "27", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "28", "Max": "38", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "39", "Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "46", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_6_MID":
            [
                { "Min": "0", "Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "37", "Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "54", "Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "66", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPA_6_END":
            [
                { "Min": "0", "Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "47", "Max": "65", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "66", "Max": "76", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "77", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_6_BEG":
            [
                { "Min": "0", "Max": "27", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "28", "Max": "38", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "39", "Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "46", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_6_MID":
            [
                { "Min": "0", "Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "37", "Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "54", "Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "66", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "COMPB_6_END":
            [
                { "Min": "0", "Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "47", "Max": "65", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "66", "Max": "76", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "77", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_6_BEG":
            [
                { "Min": "0", "Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "18", "Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "30", "Max": "37", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "38", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_6_MID":
            [
                { "Min": "0", "Max": "29", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "30", "Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "46", "Max": "59", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "60", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ],
        "CA_6_END":
            [
                { "Min": "0", "Max": "48", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support" },
                { "Min": "49", "Max": "66", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support" },
                { "Min": "67", "Max": "81", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support" },
                { "Min": "82", "Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support" }
            ]
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
    // function mapNormalizedRecords(signature, hierarchy, rows) {
    //     print("mapNormalizedRecords: " + JSON.stringify(rows) + "\n")

    //     var normalizedRecords = [];


    //     var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);


    //     // TODO: here split the rows into groups based on the beg,mid etc  and then process each group separately

    //     var record = mapNormalizedRecord(signature, hierarchy, row);

    //     AppUtil.nullSafePush(normalizedRecords, record);

    //     return normalizedRecords;
    // }
    function mapNormalizedRecords(signature, hierarchy, rows) {

        var normalizedRecords = [];
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        var benchmarkPeriod = row.getField('BENCHMARK_PERIOD');

        // If a specific benchmark period is specified, process only that one
        if (benchmarkPeriod) {
            benchmarkPeriod = benchmarkPeriod.toUpperCase();
            benchmarkPeriod = benchmarkDecode[benchmarkPeriod];

            var record = mapNormalizedRecord(signature, hierarchy, row, benchmarkPeriod);
            AppUtil.nullSafePush(normalizedRecords, record);
        }
        // Otherwise, create a separate record for each period (BEG, MID, END)
        else {
            // Create separate records for each period
            threePeriods.forEach(function (periodValue) {
                // Check if this row has data for this period
                // You may need to adjust this logic based on your data structure
                if (hasDataForPeriod(row, periodValue)) {
                    var record = mapNormalizedRecord(signature, hierarchy, row, periodValue);
                    AppUtil.nullSafePush(normalizedRecords, record);
                }
            });
        }

        return normalizedRecords;
    }
    // Helper function to check if a row has data for a specific period
    function hasDataForPeriod(row, periodValue) {
        // Check for any score field that contains data for this period
        for (var i = 0; i < scoresToMap.length; i++) {
            var testMetadata = scoresToMap[i];
            var testNumberGrade = testNumberGradeDecode[row.getField('GRADE')];
            var scoreField = testMetadata.FIELD + '_' + testNumberGrade + periodValue;

            var score = row.getField(scoreField);
            if (score !== null && score !== undefined && _util.trim(score) !== "--" && _util.trim(score) !== "") {
                return true;
            }
        }
        return false;
    }

    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     * @returns {Object}
     */
    // function mapNormalizedRecord(signature, hierarchy, row) {
    //     var record = {};
    //     var mappingObject = {};

    //     mappingObject.ADMIN_MAPPINGS = {};
    //     mappingObject.SCORE_MAPPINGS = [];
    //     mappingObject.ASSESSMENT_METADATA = {};
    //     mappingObject.ASSESSMENT_METADATA.TESTS = [];
    //     mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

    //     let cleanrow = cleanJson(row);




    //     var benchmarkPeriod = cleanrow.getField('BENCHMARK_PERIOD');

    //     if (benchmarkPeriod) {
    //         benchmarkPeriod = benchmarkPeriod.toUpperCase();
    //         benchmarkPeriod = benchmarkDecode[benchmarkPeriod];
    //         //Map normalized admin fields
    //         record = mapNormalizedAdminFields(signature, hierarchy, cleanrow);

    //         //Map non-normalized admin fields
    //         mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(cleanrow);
    //     } else {
    //         // use threePeriods for the mapping
    //         threePeriods.forEach(function (value) {
    //             record = mapNormalizedAdminFields(signature, hierarchy, cleanrow);
    //             mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(cleanrow);
    //         });
    //     }

    //     //Map score fields for each expected score mapping
    //     scoresToMap.forEach(function (testMetadata) {
    //         try {
    //             var score;
    //             if (benchmarkPeriod) {
    //                 score = (testMetadata.MAP_FUNCTION)(cleanrow, testMetadata, benchmarkPeriod);
    //                 AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);

    //             } else {
    //                 threePeriods.forEach(function (value) {
    //                     score = (testMetadata.MAP_FUNCTION)(cleanrow, testMetadata, value);
    //                     AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
    //                 });
    //             }
    //         } catch (exception) {
    //             AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
    //         }
    //     });




    //     //System Fields
    //     record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
    //     record.LINEAGE_SOURCE = _thisLineageSource;
    //     record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();

    //     function cleanKey(key) {
    //         return key.replace(/[^\x20-\x7E]/g, '').replace(/['"`]/g, '').trim();
    //     }

    //     let cleankeyfilename = cleanKey("LINEAGE_FILE");
    //     let cleanKeyName = cleanKey("LINEAGE_LINE");
    //     record.LINEAGE_FILE = cleanrow.getRawField(cleankeyfilename);
    //     record.LINEAGE_LINE = cleanrow.getRawField(cleanKeyName);


    //     if (cleanrow.getRawField(cleanKeyName) === "123") {



    //         print("old row:" + JSON.stringify(row) + "\n")
    //         print("new row:" + JSON.stringify(cleanrow) + "\n")
    //     }
    //     //record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

    //     return record;
    // }
    function mapNormalizedRecord(signature, hierarchy, row, specificPeriod) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        let cleanrow = cleanJson(row);

        // Map normalized admin fields with the specific period
        record = mapNormalizedAdminFields(signature, hierarchy, cleanrow, specificPeriod);

        // Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(cleanrow);

        // Map score fields for each expected score mapping, but only for the specific period
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(cleanrow, testMetadata, specificPeriod);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch (exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                    hierarchy.SOURCE_FILE.getFilePath(),
                    "HIGH",
                    row.getRawField("LINEAGE_LINE"),
                    "Score mapping error: " + exception,
                    JSON.stringify(row)
                ));
            }
        });

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();

        function cleanKey(key) {
            return key.replace(/[^\x20-\x7E]/g, '').replace(/['"`]/g, '').trim();
        }

        let cleankeyfilename = cleanKey("LINEAGE_FILE");
        let cleanKeyName = cleanKey("LINEAGE_LINE");
        record.LINEAGE_FILE = cleanrow.getRawField(cleankeyfilename);
        record.LINEAGE_LINE = cleanrow.getRawField(cleanKeyName);



        return record;
    }

    function cleanJson(obj) {
        function cleanKey(key) {
            var cleankey = key.replace(/[^\x20-\x7E]/g, '')   // remove non-ASCII
                .replace(/['"`]/g, '')          // remove quotes
                .replace(/[\u0000-\u001F\u007F-\u009F]/g, '') // control chars
                .trim();
            return cleankey;
        }

        function cleanValue(value) {
            if (typeof value === "string") {
                return value.replace(/[^\x20-\x7E]/g, '')
                    .replace(/['"`]/g, '')
                    .replace(/[\u0000-\u001F\u007F-\u009F]/g, '')
                    .trim();
            }
            return value;
        }

        if (obj instanceof Array) {
            var arr = [];
            for (var i = 0; i < obj.length; i++) {
                arr.push(cleanJson(obj[i]));
            }
            return arr;
        } else if (typeof obj === 'object' && obj !== null) {
            var cleaned = {};
            for (var key in obj) {
                if (obj.hasOwnProperty(key)) {
                    var cleanK = cleanKey(key);
                    var rawV = obj[key];
                    var cleanV;

                    if (typeof rawV === 'object' && rawV !== null) {
                        cleanV = cleanJson(rawV);
                    } else {
                        cleanV = cleanValue(rawV);
                    }

                    cleaned[cleanK] = cleanV;
                }
            }
            return cleaned;
        } else {
            return cleanValue(obj);
        }
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
    function mapNormalizedAdminFields(signature, hierarchy, row, specificPeriod) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = parseDate(row.getField("STUDENT_BIRTHDATE"));
        var testDateObject = parseDate(_util.coalesce(row.getField("AM_COMPOSITE_DATE"), row.getField("CA_DATE"), row.getField("AM_COMPUTATION_DATE"), row.getField("MNF_DATE")
            , row.getField("NNF_DATE"), row.getField("NIF_DATE")));

        normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row,specificPeriod);
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
                // case "REPORTING_PERIOD":
                //     record.REPORTING_PERIOD = _util.coalesce(benchmarkDecode[row.getField('BENCHMARK_PERIOD')], adminPeriod, hierarchy.REPORTING_PERIOD);
                //     break;
                case "REPORTING_PERIOD":
                    // Convert _BEG to BOY, _MID to MOY, _END to EOY for the reporting period
                    var reportingPeriod;
                    if (specificPeriod === "_BEG") reportingPeriod = "BEG";
                    else if (specificPeriod === "_MID") reportingPeriod = "MID";
                    else if (specificPeriod === "_END") reportingPeriod = "END";
                    else reportingPeriod = specificPeriod;

                    record.REPORTING_PERIOD = reportingPeriod;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5, 9));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STUDENT_STATE_ID")
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
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0, 1);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("NCSE_SCHOOL_ID"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_SIS_ID"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
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
    function mapScaledScore(row, testMetadata, periodValue) {
        var score = {};

        var testNumberGrade = testNumberGradeDecode[row.getField('GRADE')];

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + '_' + testNumberGrade + periodValue;



        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + '_' + testNumberGrade + periodValue),

            row.getField(testMetadata.FIELD + '_SCORE'));





        //Composite Scores calculations If Scale Score not present
        //https://acadiencelearning.org/wp-content/uploads/2020/05/Acadience-Math-Benchmark-Goals.pdf
        if (testMetadata.FIELD === 'AM_COMPOSITE' && (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "")) {
            scaleScore = compositeScoreCalculation(row, testNumberGrade, periodValue);

        }

        var assessmentCode = testMetadata.FIELD + '_' + testNumberGrade + periodValue;

        var primary = _util.coalesce(row.getField(testMetadata.FIELD + '_' + testNumberGrade + periodValue + "_STATUS"),
            row.getField(testMetadata.FIELD + "_STATUS"), '--');

        var nationalPercentile = _util.coalesce(row.getField(testMetadata.FIELD + '_' + testNumberGrade + periodValue + "_NATIONAL_PERCENTILE"),
            row.getField(testMetadata.FIELD + "_NATIONAL_PERCENTILE"),
            row.getField(testMetadata.FIELD + '_' + testNumberGrade + periodValue + "_PERCENTILE_N"),
            row.getField(testMetadata.FIELD + "_PERCENTILE_N")
        );

        var pathway = _util.coalesce(row.getField(testMetadata.FIELD + '_' + testNumberGrade + periodValue + "_PATHWAY"),
            row.getField(testMetadata.FIELD + "_PATHWAY"));

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


        primary = capsLevels[primary];

        if (scaleScore !== null && primary !== undefined && primary !== '--') {
            score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[primary].TEST_PRIMARY_RESULT_CODE;
            score["TEST_PRIMARY_RESULT"] = perfLevels[primary].TEST_PRIMARY_RESULT;
            score["TEST_SECONDARY_RESULT_CODE"] = perfLevels[primary].TEST_SECONDARY_RESULT_CODE;
            score["TEST_SECONDARY_RESULT"] = perfLevels[primary].TEST_SECONDARY_RESULT;
        }

        var test_result_1 = '--';
        var test_result_2 = '--';

        if (scaleScore !== null && primary !== undefined && primary !== '--') {
            if (assessmentCode in perfCutoffs) {
                var temp = perfCutoffs[assessmentCode];
                temp.forEach(item => {
                    if ((scaleScore >= parseInt(item['Min']) && scaleScore <= parseInt(item['Max'])) ||
                        (scaleScore >= parseInt(item['Min']) && item['Max'] === '')) {
                        test_result_1 = item['Test_Primary'];
                        test_result_2 = item['Test_Secondary'];
                    }
                });
            }

            score["TEST_PRIMARY_RESULT"] = test_result_1;
            score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[test_result_1].TEST_PRIMARY_RESULT_CODE;
            score["TEST_SECONDARY_RESULT"] = test_result_2;
            score["TEST_SECONDARY_RESULT_CODE"] = perfLevels[test_result_1].TEST_SECONDARY_RESULT_CODE;
        }

        if (nationalPercentile === "<1") {
            nationalPercentile = "0";
        } else if (nationalPercentile === ">99") {
            nationalPercentile = "100";
        }

        score["TEST_PERCENTILE_SCORE"] = nationalPercentile;
        score["TEST_TERTIARY_RESULT"] = pathway;

        var testedDate = _util.coalesce(row.getField(testMetadata.FIELD + '_' + testNumberGrade + periodValue + "_DATE_TESTED"),
            row.getField(testMetadata.FIELD + "_DATE_TESTED")
        );
        var fileYear = row.getField('YEAR');
        if (testedDate) {
            score["TEST_SCORE_ATTRIBUTES"] = testedDate;
        } else {
            score["TEST_SCORE_ATTRIBUTES"] = "05/15/" + fileYear;
        }

        return score;
    }

    function compositeScoreCalculation(row, grade, period) {
        var score = '';
        var bqd = parseInt(_util.coalesce(row.getField('BQD_' + grade + period),
            row.getField('BQD_SCORE')));
        var nif = parseInt(_util.coalesce(row.getField('NIF_' + grade + period),
            row.getField('NIF_SCORE')));
        var nnf = parseInt(_util.coalesce(row.getField('NNF_' + grade + period),
            row.getField('NNF_SCORE')));
        var aqd = parseInt(_util.coalesce(row.getField('AQD_' + grade + period),
            row.getField('AQD_SCORE')));
        var mnf = parseInt(_util.coalesce(row.getField('MNF_' + grade + period),
            row.getField('MNF_SCORE')));
        var ca = parseInt(_util.coalesce(row.getField('CA_' + grade + period),
            row.getField('CA_SCORE')));
        var comp = parseInt(_util.coalesce(row.getField('AM_COMPUTATION_' + grade + period),
            row.getField('AM_COMPUTATION_SCORE')));

        if (grade === 'K') {
            if (period === '_BEG' && bqd && nif && nnf) {
                score = 2 * bqd + nif + 2 * nnf;
            } else if (period === '_MID' && bqd && nif && nnf) {
                score = 3 * bqd + nif + 3 * nnf;
            } else if (period === '_END' && bqd && nif && nnf) {
                score = 2 * bqd + nif + 3 * nnf;
            }
        } else if (grade === '1') {
            if (period === '_BEG' && aqd && nif && nnf && mnf && comp) {
                score = nif + 3 * nnf + 2 * aqd + 5 * mnf + 4 * comp;
            } else if ((period === '_MID' || period === '_END') && aqd && mnf && comp) {
                score = aqd + 2 * mnf + comp;
            }
        } else if (grade === '2' || grade === '3') {
            if ((period === '_BEG' || period === '_MID' || period === '_END') && ca && comp) {
                score = ca + 2 * comp;
            }
        } else if (grade === '4') {
            if (period === '_BEG' && ca && comp) {
                score = ca + 2 * comp;
            } else if ((period === '_END' || period === '_MID' || period === '_END') && ca && comp) {
                score = ca + comp;
            }
        } else if (grade === '5' || grade === '6') {
            if ((period === '_BEG' || period === '_END' || period === '_MID') && ca && comp) {
                score = ca + comp;
            }
        }

        return score;

    }

    // Name from signature 'formatName'
    function determineAdminPeriod(normalizedFile) {
        var fileName = normalizedFile.substring(normalizedFile.lastIndexOf('/') + 1);

        if (fileName.indexOf('BOY') > -1) {
            adminPeriod = 'BOY';
        } else if (fileName.indexOf('MOY') > -1) {
            adminPeriod = 'MOY';
        } else if (fileName.indexOf('EOY') > -1) {
            adminPeriod = 'EOY';
        } else {
            adminPeriod = 'ALL';
        }

        return adminPeriod;
    }


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

            // Check for format MM-dd-yyyy
            if (rawDate.indexOf('/') !== -1) {
                formatter = new java.text.SimpleDateFormat('M/dd/yy');
            } else if (rawDate.indexOf('-') !== -1 && rawDate.indexOf('-') !== 4) {
                formatter = new java.text.SimpleDateFormat('dd-MM-yyyy');
            } else if (rawDate.indexOf('-') !== -1 && rawDate.indexOf('-') === 4) {
                formatter = new java.text.SimpleDateFormat('yyyy-MM-dd');
            } else {
                formatter = new java.text.SimpleDateFormat('dd/MM/yyyy');
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
                return generateAssessmentAdminKey(signature, hierarchy, one)
                //return 1;
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, specificPeriod) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        if (adminPeriod === 'BOY' || adminPeriod === 'MOY' || adminPeriod === 'EOY') {
            assessmentAdminKey = assessmentAdminKey + "_" + adminPeriod;
        }
        if (specificPeriod) {
            assessmentAdminKey = assessmentAdminKey + specificPeriod;
        }
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());