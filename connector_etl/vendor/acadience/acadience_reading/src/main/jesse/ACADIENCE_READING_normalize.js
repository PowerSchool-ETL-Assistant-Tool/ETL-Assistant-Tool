var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "Reading";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *`
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */

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
//    module.createNormalizedFile = function (file, signature) {
//        try {
//            var signatureFormatName = signature.getFormat().getFormatName();
//            print(`Loading using signature file ${signatureFormatName} \n`);
//
//            var normalizedFile = AppUtil.createResultsFile(file);
//            print(`file name ${normalizedFile} \n`);
//
//            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
//            var lineNumber = 0;            const fileFullName = file.getFullName();
//            //Process data file records.
//            _dataflow.create("RECORD BUILD")
//                .input("INPUT", AppUtil.getInputDataflow(file, signature))
//                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
//
// json.LINEAGE_FILE = fileFullName;
//                    json.LINEAGE_LINE = (++lineNumber).toString();
//                    output.RECORDS.put(json);
//                })
//                .group_by("ADMINISTRATION GROUPING", function (one, two) {
//                    try {
//                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
//                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
//                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
//                    } catch (exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
//                    }
//                })
//                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
//                    try {
//                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {
//
//                            //Report error for each row
//                            rows.forEach(function (row) {
//                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
//                            });
//
//                        } else {
//                            output.RECORDS.put(rows);
//                        }
//                    } catch (exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
//                    }
//                })
//                .transform("TRANSFORM", ["RECORDS"],
//                    function (output, rows) {
//                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);
//
//                        normalizedRecords.forEach(function (record) {
//                            output.RECORDS.put(record);
//                        });
//
//                    })
//                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
//                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
//
//                    // Report when no scores are found.
//                    if (mappingObject.SCORE_MAPPINGS.length === 0) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
//                    } else {
//                        output.RECORDS.put(row);
//                    }
//                })
//                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
//                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);
//
//            return normalizedFile;
//        } catch (exception) {
//            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
//        }
//    };


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
    const GLOBAL = { normalizedFileFields : null };
    var strandsAndFields =
        [
            // DIBELS V6 STRANDS

            // DIBELS NEXT STRANDS
            { TEST: "ARD", STRAND: "FSF", FIELD: "FSF" },
            { TEST: "ARD", STRAND: "LNF", FIELD: "LNF" },
            { TEST: "ARD", STRAND: "PSF", FIELD: "PSF" },
            { TEST: "ARD", STRAND: "TOT", FIELD: "COMPOSITE" },


            { TEST: "ARD", STRAND: "NWFCLS", FIELD: "NWF-CLS" },
            { TEST: "ARD", STRAND: "NWFWWR", FIELD: "NWF-WWR" },
            { TEST: "ARD", STRAND: "DORFWC", FIELD: "DORF-WORDSCORRECT" },
            { TEST: "ARD", STRAND: "DORFERR", FIELD: "DORF-ERRORS" },
            { TEST: "ARD", STRAND: "DORFACC", FIELD: "DORF-ACCURACY" },
            { TEST: "ARD", STRAND: "DORFRT", FIELD: "DORF-RETELL" },
            { TEST: "ARD", STRAND: "DORFRQ", FIELD: "DORF-RETELLQUALITY" },
            { TEST: "ARD", STRAND: "DAZECOR", FIELD: "DAZE-CORRECT" },
            { TEST: "ARD", STRAND: "DAZEINC", FIELD: "DAZE-INCORRECT" },
            { TEST: "ARD", STRAND: "DAZEADJ", FIELD: "DAZE-ADJUSTED" },
            {TEST: "ARD", STRAND: "DAZE", FIELD: "DAZE"},

            {TEST: "ARD", STRAND: "DORFFL", FIELD: "DORF-FLUENCY"},

            {TEST: "ARD", STRAND: "NWFVOCAB" , FIELD: "VOCABULARY"},
            {TEST: "ARD", STRAND: "NWFSPEL" , FIELD: "SPELLING"},
            {TEST: "ARD", STRAND: "NWFRAN" , FIELD: "RAN"},
            {TEST: "ARD", STRAND: "NWFRISK" , FIELD: "RISK_INDICATOR"},

            { TEST: "ARD", STRAND: "ARK6ACC", FIELD: "ARK6_ACCURACY" },
            { TEST: "ARD", STRAND: "ARK6MAS", FIELD: "ARK6_MAZ_ADJ_SC" },
            { TEST: "ARD", STRAND: "ARK6TOT", FIELD: "ARK6_COMPOSITE" },
            { TEST: "ARD", STRAND: "ACC", FIELD: "ACCURACY" },
            { TEST: "ARD", STRAND: "ORFERR", FIELD: "ERR" },
            { TEST: "ARD", STRAND: "MAZEADJ", FIELD: "MAZ_ADJ_SC" },
            { TEST: "ARD", STRAND: "MAZC", FIELD: "MAZC" },
            { TEST: "ARD", STRAND: "MAZI", FIELD: "MAZI" },
            { TEST: "ARD", STRAND: "ORF", FIELD: "ORF" },
            { TEST: "ARD", STRAND: "ORF", FIELD: "DORF" },
            { TEST: "ARD", STRAND: "RT", FIELD: "RETELL" },
            { TEST: "ARD", STRAND: "ORFRQ", FIELD: "RETELLQR" },
            { TEST: "ARD", STRAND: "CLS", FIELD: "CLS" },
            { TEST: "ARD", STRAND: "WWR", FIELD: "WWR" },
            { TEST: "ARD", STRAND: "BQD", FIELD: "BQD" },
            { TEST: "ARD", STRAND: "NIF", FIELD: "NIF" },
            { TEST: "ARD", STRAND: "NNF", FIELD: "NNF" },
            { TEST: "ARD", STRAND: "AM_COMP", FIELD: "AM_COMPOSITE" },
            { TEST: "ARD", STRAND: "AQD", FIELD: "AQD" },
            { TEST: "ARD", STRAND: "MNF", FIELD: "MNF" },
            { TEST: "ARD", STRAND: "AM_COM", FIELD: "AM_COMPUTATION" },
            { TEST: "ARD", STRAND: "COMPA", FIELD: "COMPA" },
            { TEST: "ARD", STRAND: "COMPB", FIELD: "COMPB" },
            { TEST: "ARD", STRAND: "CA", FIELD: "CA" },

 // PASSAGE SCORES
            { TEST: "ARD", STRAND: "ORWC_P1", FIELD: "ORAL_READING_PASSAGE1_WORDCORRECT" },
            { TEST: "ARD", STRAND: "ORWC_P2", FIELD: "ORAL_READING_PASSAGE2_WORDCORRECT" },
            { TEST: "ARD", STRAND: "ORWC_P3", FIELD: "ORAL_READING_PASSAGE3_WORDCORRECT" },
            { TEST: "ARD", STRAND: "ORWC_TOT", FIELD: "ORAL_READING_WORDCORRECT_TOTAL" },
            { TEST: "ARD", STRAND: "ORWPMTOT", FIELD: "ORAL_READING_WORDCORRECT_PER-MIN_TOTAL" },
            { TEST: "ARD", STRAND: "ORERR_P1", FIELD: "ORAL_READING_PASSAGE1_ERRORS" },
            { TEST: "ARD", STRAND: "ORERR_P2", FIELD: "ORAL_READING_PASSAGE2_ERRORS" },
            { TEST: "ARD", STRAND: "ORERR_P3", FIELD: "ORAL_READING_PASSAGE3_ERRORS" },
            { TEST: "ARD", STRAND: "ORERR_TOT", FIELD: "ORAL_READING_ERRORS_TOTAL" },
            { TEST: "ARD", STRAND: "ORC_P1", FIELD: "ORAL_READING_PASSAGE1_COMPREHENSION" },
            { TEST: "ARD", STRAND: "ORC_P2", FIELD: "ORAL_READING_PASSAGE2_COMPREHENSION" },
            { TEST: "ARD", STRAND: "ORC_P3", FIELD: "ORAL_READING_PASSAGE3_COMPREHENSION" },
            { TEST: "ARD", STRAND: "ORC_TOT", FIELD: "ORAL_READING_COMPREHENSION_TOTAL" },
            { TEST: "ARD", STRAND: "ORACC_P1", FIELD: "ORAL_READING_PASSAGE1_ACCURACY" },
            { TEST: "ARD", STRAND: "ORACC_P2", FIELD: "ORAL_READING_PASSAGE2_ACCURACY" },
            { TEST: "ARD", STRAND: "ORACC_P3", FIELD: "ORAL_READING_PASSAGE3_ACCURACY" },
            { TEST: "ARD", STRAND: "ORA_TOT", FIELD: "ORAL_READING_ACCURACY_TOTAL" },

            { TEST: "ARD", STRAND: "MC_P1", FIELD: "MAZE_PASSAGE1_CORRECT" },
            { TEST: "ARD", STRAND: "MC_P2", FIELD: "MAZE_PASSAGE2_CORRECT" },
            { TEST: "ARD", STRAND: "MC_P3", FIELD: "MAZE_PASSAGE3_CORRECT" },
            { TEST: "ARD", STRAND: "MI_P1", FIELD: "MAZE_PASSAGE1_INCORRECT" },
            { TEST: "ARD", STRAND: "MI_P2", FIELD: "MAZE_PASSAGE2_INCORRECT" },
            { TEST: "ARD", STRAND: "MI_P3", FIELD: "MAZE_PASSAGE3_INCORRECT" },
            { TEST: "ARD", STRAND: "SR_P1", FIELD: "SILENT_READING_PASSAGE1" },
            { TEST: "ARD", STRAND: "SR_P2", FIELD: "SILENT_READING_PASSAGE2" },
            { TEST: "ARD", STRAND: "SR_P3", FIELD: "SILENT_READING_PASSAGE3" },
            { TEST: "ARD", STRAND: "SRTOT", FIELD: "SILENT_READING_TOTAL" },
            { TEST: "ARD", STRAND: "_MA_P1", FIELD: "MAZE_PASSAGE1_ADJUSTED_SCORE" },
            { TEST: "ARD", STRAND: "_MA_P2", FIELD: "MAZE_PASSAGE2_ADJUSTED_SCORE" },
            { TEST: "ARD", STRAND: "_MA_P3", FIELD: "MAZE_PASSAGE3_ADJUSTED_SCORE" },
            { TEST: "ARD", STRAND: "_MA_TOT", FIELD: "MAZE_ADJUSTED_TOTAL_SCORE" },
            { TEST: "ARD", STRAND: "GATE1", FIELD: "GATE1_SCORE" },
            { TEST: "ARD", STRAND: "GATE2", FIELD: "GATE2_SCORE" },
            { TEST: "ARD", STRAND: "GATE3", FIELD: "GATE3_SCORE" }
        ];

    var scoresToMap = [
        { TEST: "ACA_ARD", CODE: 'OVERALL', FIELD: 'COMPOSITE_SCORE', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'PATHACHCOM', FIELD: 'ACHIEVED_COMPOSITE', MAP_FUNCTION: mapPathwayScore },
        { TEST: "ACA_ARD", CODE: 'PATHSETCOM', FIELD: 'SET_COMPOSITE', MAP_FUNCTION: mapPathwayScore },
        { TEST: "ACA_ARD", CODE: 'DAZECOR', FIELD: 'DAZE_CORRECT', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'DAZEINC', FIELD: 'DAZE_INCORRECT', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'DAZE', FIELD: 'DAZE', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'DORFACC', FIELD: 'DORF_ACCURACY', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'DORFERR', FIELD: 'DORF_ERRORS', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'DORFFLU', FIELD: 'DORF_FLUENCY', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'DORFRETQUA', FIELD: 'DORF_RETELL_QUALITY', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'DORFRET', FIELD: 'DORF_RETELL', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'FSF', FIELD: 'FSF', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'LNF', FIELD: 'LNF', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'NWFCLS', FIELD: 'NWF_CLS', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: '*NWFCLS', FIELD: '*NWF_CLS', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'NWFWWR', FIELD: 'NWF_WWR', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: '*NWFWWR', FIELD: '*NWF_WWR', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'PSF', FIELD: 'PSF', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'PSF', FIELD: 'RAN', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'ORFWC', FIELD: 'ORF_WC', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: "ORFERR", FIELD: "ORFERR", MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'ORFACC', FIELD: 'ORF_ACCURACY', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: '*ORFACC', FIELD: '*ORF_ACC', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'RETELL', FIELD: 'RETELL', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'RETELLQA', FIELD: 'RETELL_QUALITY', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'MAZEADJ', FIELD: 'MAZE_ADJUSTED', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'COMPOSITE', FIELD: 'COMPOSITE', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'COMPGOAL', FIELD: 'COMPOSITE_GOAL', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'RISKIND', FIELD: 'RISK_INDICATOR', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'SPELLING', FIELD: 'SPELLING', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'VOCABULARY', FIELD: 'VOCABULARY', MAP_FUNCTION: mapScaledScore },
        { TEST: "ACA_ARD", CODE: 'RAN' , FIELD: 'RAN', MAP_FUNCTION: mapScaledScore},
        { TEST: "ACA_ARD", CODE: 'LR_TOT' , FIELD: 'READING', MAP_FUNCTION: mapScaledScore},

        { TEST: "ACA_ARD", CODE: 'RAN_OBJECTS' , FIELD: 'OBJECTS', MAP_FUNCTION: mapRANScore},
        { TEST: "ACA_ARD", CODE: 'RAN_LETTERS' , FIELD: 'LETTERS', MAP_FUNCTION: mapRANScore},
        { TEST: "ACA_ARD", CODE: 'RAN_NUMBERS' , FIELD: 'NUMBERS', MAP_FUNCTION: mapRANScore},

        { TEST: "ACA_ARD", CODE: 'RAN_TOTAL' , FIELD: 'RAN', MAP_FUNCTION: mapTotalRANScore},

        { TEST: 'ACA_ARD', CODE: 'MAZEADJUSTED', FIELD: 'ADJUSTED_MAZE', MAP_FUNCTION: mapScore },
        { TEST: "ACA_ARD", CODE: 'SR' , FIELD: 'SILENT_READING', MAP_FUNCTION: mapScore},
        { TEST: "ACA_ARD", CODE: 'OR_WC' , FIELD: 'OR_WC', MAP_FUNCTION: mapScore},
        { TEST: "ACA_ARD", CODE: 'OR_ACC' , FIELD: 'OR_ACCURACY', MAP_FUNCTION: mapScore},
        { TEST: "ACA_ARD", CODE: 'OR_COMP' , FIELD: 'OR_COMPREHENSION', MAP_FUNCTION: mapScore},
        { TEST: "ACA_ARD", CODE: 'COMP' , FIELD: 'COMP', MAP_FUNCTION: mapScore},

        ];


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var gradeLevels =
        [
            { GRADE_CODE: "KG", FIELD: "K" },
            //{ GRADE_CODE: "K", FIELD: "K" },
            { GRADE_CODE: "01", FIELD: "1ST" },
            { GRADE_CODE: "02", FIELD: "2ND" },
            { GRADE_CODE: "03", FIELD: "3RD" },
            { GRADE_CODE: "04", FIELD: "4TH" },
            { GRADE_CODE: "05", FIELD: "5TH" },
            { GRADE_CODE: "06", FIELD: "6TH" },
            { GRADE_CODE: "07", FIELD: "7TH" },
            { GRADE_CODE: "08", FIELD: "8TH" },

            { GRADE_CODE: "01", FIELD: "1" },
            { GRADE_CODE: "02", FIELD: "2" },
            { GRADE_CODE: "03", FIELD: "3" },
            { GRADE_CODE: "04", FIELD: "4" },
            { GRADE_CODE: "05", FIELD: "5" },
            { GRADE_CODE: "06", FIELD: "6" },
            { GRADE_CODE: "07", FIELD: "7" },
            { GRADE_CODE: "08", FIELD: "8" },


         ];
    var assessPeriodsMain =
        [
            { PERIOD_CODE: "BEG", FIELD: "BEG" },
            { PERIOD_CODE: "MID", FIELD: "MID" },
            { PERIOD_CODE: "END", FIELD: "END" }
        ];

//LNF(No Bnch),
    var perfCutoffs =
{
    // Kinder Garten ----------->
    "COMPOSITE_K_BEGINNING":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "37", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "38","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_K_BEG":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "37", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "38","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_K_MIDDLE":
    [
    {"Min": "0","Max": "84", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "85","Max": "121", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "122","Max": "155", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "156","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_K_MID":
    [
    {"Min": "0","Max": "84", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "85","Max": "121", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "122","Max": "155", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "156","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_K_END":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "118", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "119","Max": "151", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "152","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
   "FSF_K_BEGINNING":
   [
   {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
   {"Min": "5","Max": "9", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
   {"Min": "10","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
   {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
   ],
   "FSF_K_MIDDLE":
   [
   {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
   {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
   {"Min": "30","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
   {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
   ],
   "FSF_K_BEG":
   [
   {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
   {"Min": "5","Max": "9", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
   {"Min": "10","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
   {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
   ],
   "FSF_K_MID":
   [
   {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
   {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
   {"Min": "30","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
   {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
   ],
    "PSF_K_MIDDLE":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "43", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "44","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "PSF_K_MID":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "43", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "44","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "PSF_K_END":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "39", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "40","Max": "55", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "56","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_K_MIDDLE":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_K_MID":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_K_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "27", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "28","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_CLS_K_MIDDLE":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_CLS_K_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "27", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "28","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],

    // https://acadiencelearning.org/wp-content/uploads/2020/01/AcadienceMath_Assessment_Manual.pdf - Grade 1 to 6 >
    "BQD_K_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "5","Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "6","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "BQD_K_MID":
    [
    {"Min": "0","Max": "3", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "4","Max": "6", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "7","Max": "9", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "10","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "BQD_K_END":
    [
    {"Min": "0","Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "9","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "NIF_K_BEG":
    [
    {"Min": "0","Max": "3", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "4","Max": "5", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "6","Max": "8", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "9","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "NIF_K_MID":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "13", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "14","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "NIF_K_END":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "24", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "25","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "NNF_K_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "5","Max": "6", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "7","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "NNF_K_MID":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "12", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "13","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "NNF_K_END":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "13", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "14","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPOSITE_K_BEG":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPOSITE_K_MID":
    [
    {"Min": "0","Max": "48", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "49","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "88", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "89","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPOSITE_K_END":
    [
    {"Min": "0","Max": "66", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "67","Max": "91", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "92","Max": "109", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "110","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    // 1st Grade --------->
    "COMPOSITE_1ST_BEGINNING":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "112", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "113","Max": "128", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "129","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1ST_BEG":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "112", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "113","Max": "128", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "129","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1_BEGINNING":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "112", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "113","Max": "128", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "129","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1_BEG":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "112", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "113","Max": "128", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "129","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1ST_MIDDLE":
    [
    {"Min": "0","Max": "99", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "100","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "176", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "177","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1ST_MID":
    [
    {"Min": "0","Max": "99", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "100","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "176", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "177","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1_MIDDLE":
    [
    {"Min": "0","Max": "99", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "100","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "176", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "177","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1_MID":
    [
    {"Min": "0","Max": "99", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "100","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "176", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "177","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1ST_END":
    [
    {"Min": "0","Max": "110", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "111","Max": "154", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "155","Max": "207", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "208","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_1_END":
    [
    {"Min": "0","Max": "110", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "111","Max": "154", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "155","Max": "207", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "208","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "PSF_1ST_BEGINNING":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "39", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "40","Max": "46", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "47","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "PSF_1ST_BEG":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "39", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "40","Max": "46", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "47","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "PSF_1_BEGINNING":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "39", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "40","Max": "46", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "47","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "PSF_1_BEG":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "39", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "40","Max": "46", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "47","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1ST_BEGINNING":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1ST_BEG":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1_BEGINNING":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1_BEG":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1ST_MIDDLE":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "42", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "43","Max": "58", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "59","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1ST_MID":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "42", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "43","Max": "58", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "59","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1_MIDDLE":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "42", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "43","Max": "58", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "59","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1_MID":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "42", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "43","Max": "58", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "59","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1ST_END":
    [
    {"Min": "0","Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "47","Max": "57", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "58","Max": "80", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "81","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_1_END":
    [
    {"Min": "0","Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "47","Max": "57", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "58","Max": "80", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "81","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_CLS_1_BEGINNING":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_CLS_1_MIDDLE":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "42", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "43","Max": "58", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "59","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_CLS_1_END":
    [
    {"Min": "0","Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "47","Max": "57", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "58","Max": "80", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "81","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1ST_BEGINNING":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1ST_BEG":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1_BEGINNING":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1_BEG":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1ST_MIDDLE":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1ST_MID":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1_MIDDLE":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1_MID":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1ST_END":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_1_END":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_WWR_1_BEGINNING":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_WWR_1_MIDDLE":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_WWR_1_END":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1ST_BEGINNING":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1ST_BEG":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1_BEGINNING":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1_BEG":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "1","Max": "3", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "4","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1ST_MIDDLE":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1ST_MID":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1_MIDDLE":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1_MID":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1ST_END":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_1_END":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_1ST_MIDDLE":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_1ST_MID":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_1_MIDDLE":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_1_MID":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_1ST_END":
    [
    {"Min": "0","Max": "31", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "32","Max": "46", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "47","Max": "66", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "67","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_1_END":
    [
    {"Min": "0","Max": "31", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "32","Max": "46", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "47","Max": "66", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "67","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_WC_1_MIDDLE":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_WC_1_END":
    [
    {"Min": "0","Max": "31", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "32","Max": "46", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "47","Max": "66", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "67","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_1ST_MIDDLE":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_1ST_MID":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_1_MIDDLE":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_1_MID":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "33", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "34","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_1ST_END":
    [
    {"Min": "0","Max": "31", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "32","Max": "46", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "47","Max": "66", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "67","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_1_END":
    [
    {"Min": "0","Max": "31", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "32","Max": "46", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "47","Max": "66", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "67","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_1ST_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_1ST_MID":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_1_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_1_MID":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_1ST_END":
    [
    {"Min": "0","Max": "81", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "82","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "96", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_1_END":
    [
    {"Min": "0","Max": "81", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "82","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "96", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_1ST_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_1ST_MID":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_1_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_1_MID":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_1ST_END":
    [
    {"Min": "0","Max": "81", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "82","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "96", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_1_END":
    [
    {"Min": "0","Max": "81", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "82","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "96", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_1_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "77", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "78","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_ACCURACY_1_END":
    [
    {"Min": "0","Max": "81", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "82","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "96", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_1ST_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_1_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "16", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "17","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AQD_1_BEG":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "9", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "10","Max": "12", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "13","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AQD_1_MID":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "21", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "22","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AQD_1_END":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "21", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "22","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "NIF_1_BEG":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "NNF_1_BEG":
    [
    {"Min": "0","Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "9","Max": "11", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "12","Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "14","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "MNF_1_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "3", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "4","Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "6","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "MNF_1_MID":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "8", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "9","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "MNF_1_END":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "9", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "10","Max": "11", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "12","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPOSITE_1_BEG":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "123", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "124","Max": "147", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "148","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPOSITE_1_MID":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "46","Max": "52", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "53","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPOSITE_1_END":
    [
    {"Min": "0","Max": "43", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "44","Max": "58", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "59","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPUTATION_1_BEG":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "5","Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "6","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPUTATION_1_MID":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "14","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "AM_COMPUTATION_1_END":
    [
    {"Min": "0","Max": "10", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "11","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "COMPA_1_BEG":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "5","Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "6","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "COMPA_1_MID":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "14","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "COMPA_1_END":
    [
    {"Min": "0","Max": "10", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "11","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "COMPB_1_BEG":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "4", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "5","Max": "5", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "6","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "COMPB_1_MID":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "14","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    "COMPB_1_END":
    [
    {"Min": "0","Max": "10", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "11","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"},
    ],
    // 2nd Grade
    "COMPOSITE_2ND_BEGINNING":
    [
    {"Min": "0","Max": "108", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "141","Max": "201", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "202","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2ND_BEG":
    [
    {"Min": "0","Max": "108", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "141","Max": "201", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "202","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2_BEGINNING":
    [
    {"Min": "0","Max": "108", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "141","Max": "201", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "202","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2_BEG":
    [
    {"Min": "0","Max": "108", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "141","Max": "201", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "202","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2ND_MIDDLE":
    [
    {"Min": "0","Max": "144", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "145","Max": "189", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "190","Max": "255", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "256","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2ND_MID":
    [
    {"Min": "0","Max": "144", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "145","Max": "189", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "190","Max": "255", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "256","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2_MIDDLE":
    [
    {"Min": "0","Max": "144", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "145","Max": "189", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "190","Max": "255", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "256","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2_MID":
    [
    {"Min": "0","Max": "144", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "145","Max": "189", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "190","Max": "255", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "256","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2ND_END":
    [
    {"Min": "0","Max": "179", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "180","Max": "237", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "238","Max": "286", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "287","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_2_END":
    [
    {"Min": "0","Max": "179", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "180","Max": "237", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "238","Max": "286", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "287","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_2ND_BEGINNING":
    [
    {"Min": "0","Max": "34", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "35","Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "54","Max": "71", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "72","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_2ND_BEG":
    [
    {"Min": "0","Max": "34", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "35","Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "54","Max": "71", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "72","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_2_BEGINNING":
    [
    {"Min": "0","Max": "34", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "35","Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "54","Max": "71", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "72","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CLS_2_BEG":
    [
    {"Min": "0","Max": "34", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "35","Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "54","Max": "71", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "72","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_CLS_2_BEGINNING":
    [
    {"Min": "0","Max": "34", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "35","Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "54","Max": "71", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "72","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_2ND_BEGINNING":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_2ND_BEG":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_2_BEGINNING":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF-WWR_2_BEG":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "NWF_WWR_2_BEGINNING":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_2ND_BEGINNING":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_2ND_BEG":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_2_BEGINNING":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "WWR_2_BEG":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "6","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2ND_BEGINNING":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2ND_BEG":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2_BEGINNING":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2_BEG":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2ND_MIDDLE":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2ND_MID":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2_MIDDLE":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2_MID":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2ND_END":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_2_END":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2ND_BEGINNING":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2ND_BEG":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2_BEGINNING":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2_BEG":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2ND_MIDDLE":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2ND_MID":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2_MIDDLE":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2_MID":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2ND_END":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_2_END":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_2_BEGINNING":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "95", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "96","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_ACCURACY_2_MIDDLE":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_ACCURACY_2_END":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2ND_BEGINNING":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2ND_BEG":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2_BEGINNING":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2_BEG":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2ND_MIDDLE":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2ND_MID":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2_MIDDLE":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2_MID":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2ND_END":
    [
    {"Min": "0","Max": "64", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "65","Max": "86", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "87","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_2_END":
    [
    {"Min": "0","Max": "64", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "65","Max": "86", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "87","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_WC_2_BEGINNING":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	 "ORF_WC_2_MIDDLE":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	 "ORF_WC_2_END":
    [
    {"Min": "0","Max": "64", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "65","Max": "86", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "87","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2ND_BEGINNING":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2ND_BEG":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2_BEGINNING":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2_BEG":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "67", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "68","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2ND_MIDDLE":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2ND_MID":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2_MIDDLE":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2_MID":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2ND_END":
    [
    {"Min": "0","Max": "64", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "65","Max": "86", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "87","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_2_END":
    [
    {"Min": "0","Max": "64", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "65","Max": "86", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "87","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2ND_BEGINNING":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "15", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "16","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2ND_BEG":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "15", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "16","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2_BEGINNING":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "15", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "16","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2_BEG":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "15", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "16","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2ND_MIDDLE":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2ND_MID":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "31","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2_MIDDLE":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "31","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2_MID":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "31","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2ND_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_2_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2ND_BEGINNING":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "15", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "16","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2ND_BEG":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "15", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "16","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2_BEGINNING":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "15", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "16","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2_BEG":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "15", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "16","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2ND_MIDDLE":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "71", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "72","Max": "90", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "91","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2ND_MID":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "31","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2_MIDDLE":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "31","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2_MID":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "31","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2ND_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_2_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_2ND_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_2ND_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_2_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_2_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_2ND_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_2_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_2ND_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_2ND_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_2_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_2_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_2ND_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_2_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_2_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_2_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "AM_COMPOSITE_2_BEG":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "31", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_2_MID":
    [
    {"Min": "0","Max": "29", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "30","Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "46","Max": "56", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "57","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_2_END":
    [
    {"Min": "0","Max": "47", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "48","Max": "65", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "66","Max": "85", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "86","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_2_BEG":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "5", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "6","Max": "7", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "8","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_2_MID":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "14","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_2_END":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "18", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_2_BEG":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "5", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "6","Max": "7", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "8","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_2_MID":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "14","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_2_END":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "18", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_2_BEG":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "3","Max": "5", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "6","Max": "7", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "8","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_2_MID":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "13", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "14","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_2_END":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "18", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_2_BEG":
    [
    {"Min": "0","Max": "7", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "8","Max": "13", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_2_MID":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "30", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "31","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_2_END":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "34", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "35","Max": "46", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "47","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    // 3RD Grade
    "COMPOSITE_3RD_BEGINNING":
    [
    {"Min": "0","Max": "179", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "180","Max": "219", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "220","Max": "288", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "289","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3RD_BEG":
    [
    {"Min": "0","Max": "179", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "180","Max": "219", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "220","Max": "288", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "289","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3_BEGINNING":
    [
    {"Min": "0","Max": "179", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "180","Max": "219", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "220","Max": "288", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "289","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3_BEG":
    [
    {"Min": "0","Max": "179", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "180","Max": "219", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "220","Max": "288", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "289","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3RD_MIDDLE":
    [
    {"Min": "0","Max": "234", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "235","Max": "284", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "285","Max": "348", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "349","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3RD_MID":
    [
    {"Min": "0","Max": "234", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "235","Max": "284", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "285","Max": "348", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "349","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3_MIDDLE":
    [
    {"Min": "0","Max": "234", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "235","Max": "284", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "285","Max": "348", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "349","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3_MID":
    [
    {"Min": "0","Max": "234", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "235","Max": "284", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "285","Max": "348", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "349","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3RD_END":
    [
    {"Min": "0","Max": "279", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "280","Max": "329", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "330","Max": "404", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "405","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_3_END":
    [
    {"Min": "0","Max": "279", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "280","Max": "329", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "330","Max": "404", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "405","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3RD_BEGINNING":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3RD_BEG":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3_BEGINNING":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3_BEG":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3RD_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3RD_MID":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3_MID":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3RD_END":
    [
    {"Min": "0","Max": "79", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "80","Max": "99", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "100","Max": "117", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "118","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_3_END":
    [
    {"Min": "0","Max": "79", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "80","Max": "99", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "100","Max": "117", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "118","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_WC_3_BEGINNING":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_WC_3_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_WC_3_END":
    [
    {"Min": "0","Max": "79", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "80","Max": "99", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "100","Max": "117", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "118","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3RD_BEGINNING":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3RD_BEG":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3_BEGINNING":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3_BEG":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "90","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3RD_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3RD_MID":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3_MIDDLE":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3_MID":
    [
    {"Min": "0","Max": "67", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "68","Max": "85", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "86","Max": "104", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "105","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3RD_END":
    [
    {"Min": "0","Max": "79", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "80","Max": "99", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "100","Max": "117", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "118","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_3_END":
    [
    {"Min": "0","Max": "79", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "80","Max": "99", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "100","Max": "117", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "118","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3RD_BEGINNING":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3RD_BEG":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3_BEGINNING":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3_BEG":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3RD_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3RD_MID":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3_MID":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3RD_END":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_3_END":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3RD_BEGINNING":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3RD_BEG":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3_BEGINNING":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3_BEG":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3RD_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3RD_MID":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3_MID":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3RD_END":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_3_END":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_3_BEGINNING":
    [
    {"Min": "0","Max": "88", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "89","Max": "94", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_3_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_ACCURACY_3_END":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3RD_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3RD_BEG":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3_BEG":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3RD_MIDDLE":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3RD_MID":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3_MIDDLE":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3_MID":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3RD_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_3_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3RD_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3RD_BEG":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3_BEG":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3RD_MIDDLE":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3RD_MID":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3_MIDDLE":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3_MID":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "25", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "26","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3RD_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_3_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3RD_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3RD_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3RD_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3RD_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3RD_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_3_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3RD_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3RD_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3RD_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3RD_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3RD_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_3_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_3_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_3_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_3_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3RD_BEGINNING":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3RD_BEG":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3_BEGINNING":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3_BEG":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3RD_MIDDLE":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3RD_MID":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3_MIDDLE":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3_MID":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3RD_END":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "22", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "23","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_3_END":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "22", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "23","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3RD_BEGINNING":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3RD_BEG":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3_BEGINNING":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3_BEG":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3RD_MIDDLE":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3RD_MID":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3_MIDDLE":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3_MID":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3RD_END":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "22", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "23","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_3_END":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "22", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "23","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_3_BEGINNING":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "5","Max": "7", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "8","Max": "10", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "11","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_3_MIDDLE":
    [
    {"Min": "0","Max": "6", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "7","Max": "10", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "11","Max": "15", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "16","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_3_END":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "22", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "23","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_3_BEG":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "48", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "49","Max": "55", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "56","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_3_MID":
    [
    {"Min": "0","Max": "56", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "57","Max": "82", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "83","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_3_END":
    [
    {"Min": "0","Max": "73", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "74","Max": "100", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "101","Max": "125", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "126","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_3_BEG":
    [
    {"Min": "0","Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "9","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "14", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "15","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_3_MID":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "21", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "22","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_3_END":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "34", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "35","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_3_BEG":
    [
    {"Min": "0","Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "9","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "14", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "15","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_3_MID":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "21", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "22","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_3_END":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "34", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "35","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_3_BEG":
    [
    {"Min": "0","Max": "8", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "9","Max": "12", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "13","Max": "14", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "15","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_3_MID":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "21", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "22","Max": "24", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "25","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_3_END":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "34", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "35","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_3_BEG":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "22", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "23","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_3_MID":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "39", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "40","Max": "49", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "50","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_3_END":
    [
    {"Min": "0","Max": "31", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "32","Max": "46", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "47","Max": "58", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "59","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    //4th Grade
    "COMPOSITE_4TH_BEGINNING":
    [
    {"Min": "0","Max": "244", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "245","Max": "289", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "290","Max": "340", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "341","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4TH_BEG":
    [
    {"Min": "0","Max": "244", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "245","Max": "289", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "290","Max": "340", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "341","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4_BEGINNING":
    [
    {"Min": "0","Max": "244", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "245","Max": "289", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "290","Max": "340", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "341","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4_BEG":
    [
    {"Min": "0","Max": "244", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "245","Max": "289", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "290","Max": "340", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "341","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4TH_MIDDLE":
    [
    {"Min": "0","Max": "289", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "290","Max": "329", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "330","Max": "382", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "383","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4TH_MID":
    [
    {"Min": "0","Max": "289", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "290","Max": "329", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "330","Max": "382", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "383","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4_MIDDLE":
    [
    {"Min": "0","Max": "289", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "290","Max": "329", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "330","Max": "382", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "383","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4_MID":
    [
    {"Min": "0","Max": "289", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "290","Max": "329", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "330","Max": "382", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "383","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4TH_END":
    [
    {"Min": "0","Max": "329", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "330","Max": "390", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "391","Max": "445", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "446","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_4_END":
    [
    {"Min": "0","Max": "329", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "330","Max": "390", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "391","Max": "445", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "446","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4TH_BEGINNING":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4TH_BEG":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4_BEGINNING":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4_BEG":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4TH_MIDDLE":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4TH_MID":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4_MIDDLE":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4_MID":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4TH_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "114", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "115","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_4_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "114", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "115","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_WC_4_BEGINNING":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	 "ORF_WC_4_MIDDLE":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_WC_4_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "114", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "115","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4TH_BEGINNING":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4TH_BEG":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4_BEGINNING":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4_BEG":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "89", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "90","Max": "103", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "104","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4TH_MIDDLE":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4TH_MID":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4_MIDDLE":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4_MID":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "102", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "103","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4TH_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "114", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "115","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_4_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "114", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "115","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4TH_BEGINNING":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4TH_BEG":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4_BEGINNING":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4_BEG":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4TH_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4TH_MID":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4_MID":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4TH_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_4_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4TH_BEGINNING":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4TH_BEG":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4_BEGINNING":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4_BEG":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4TH_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4TH_MID":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4_MID":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4TH_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_4_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_4_BEGINNING":
    [
    {"Min": "0","Max": "92", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "93","Max": "95", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_ACCURACY_4_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_ACCURACY_4_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4TH_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "35", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "36","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4TH_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "35", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "36","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "35", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "36","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "35", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "36","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4TH_MIDDLE":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4TH_MID":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4_MIDDLE":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4_MID":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4TH_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_4_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4TH_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "35", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "36","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4TH_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "35", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "36","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "35", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "36","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "35", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "36","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4TH_MIDDLE":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4TH_MID":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4_MIDDLE":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4_MID":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4TH_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_4_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4TH_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4TH_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4TH_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4TH_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4TH_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_4_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4TH_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4TH_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4TH_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4TH_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4TH_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_4_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_4_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_4_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_4_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4TH_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4TH_BEG":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4_BEG":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4TH_MIDDLE":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4TH_MID":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4_MIDDLE":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4_MID":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4TH_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_4_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4TH_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4TH_BEG":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4_BEG":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4TH_MIDDLE":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4TH_MID":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4_MIDDLE":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4_MID":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4TH_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_4_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_4_BEGINNING":
    [
    {"Min": "0","Max": "9", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "10","Max": "14", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "15","Max": "17", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "18","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_4_MIDDLE":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "19", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_4_END":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_4_BEG":
    [
    {"Min": "0","Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "47","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "83", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "84","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_4_MID":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "55","Max": "82", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "83","Max": "100", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "101","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_4_END":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "81","Max": "116", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "117","Max": "149", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "150","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_4_BEG":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_4_MID":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "31","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_4_END":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "46","Max": "57", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "58","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_4_BEG":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_4_MID":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "31","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_4_END":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "46","Max": "57", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "58","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_4_BEG":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "16", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_4_MID":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "30", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "31","Max": "38", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "39","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_4_END":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "33","Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "46","Max": "57", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "58","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_4_BEG":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "33", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "34","Max": "43", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "44","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_4_MID":
    [
    {"Min": "0","Max": "29", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "30","Max": "48", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "49","Max": "62", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "63","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_4_END":
    [
    {"Min": "0","Max": "45", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "46","Max": "70", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "71","Max": "92", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "93","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    //5th Grade
    "COMPOSITE_5TH_BEGINNING":
    [
    {"Min": "0","Max": "257", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "258","Max": "356", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "357","Max": "385", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "386","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5TH_BEG":
    [
    {"Min": "0","Max": "257", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "258","Max": "356", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "357","Max": "385", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "386","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5_BEGINNING":
    [
    {"Min": "0","Max": "257", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "258","Max": "356", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "357","Max": "385", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "386","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5_BEG":
    [
    {"Min": "0","Max": "257", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "258","Max": "356", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "357","Max": "385", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "386","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5TH_MIDDLE":
    [
    {"Min": "0","Max": "309", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "310","Max": "371", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "372","Max": "410", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "411","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5TH_MID":
    [
    {"Min": "0","Max": "309", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "310","Max": "371", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "372","Max": "410", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "411","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5_MIDDLE":
    [
    {"Min": "0","Max": "309", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "310","Max": "371", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "372","Max": "410", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "411","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5_MID":
    [
    {"Min": "0","Max": "309", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "310","Max": "371", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "372","Max": "410", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "411","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5TH_END":
    [
    {"Min": "0","Max": "339", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "340","Max": "414", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "415","Max": "465", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "466","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_5_END":
    [
    {"Min": "0","Max": "339", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "340","Max": "414", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "415","Max": "465", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "466","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5TH_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5TH_BEG":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5_BEG":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5TH_MIDDLE":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5TH_MID":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5_MIDDLE":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5_MID":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5TH_END":
    [
    {"Min": "0","Max": "104", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "105","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "142", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "143","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_5_END":
    [
    {"Min": "0","Max": "104", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "105","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "142", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "143","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_WC_5_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_WC_5_MIDDLE":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	"ORF_WC_5_END":
    [
    {"Min": "0","Max": "104", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "105","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "142", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "143","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5TH_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5TH_BEG":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5_BEG":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5TH_MIDDLE":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5TH_MID":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5_MIDDLE":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5_MID":
    [
    {"Min": "0","Max": "100", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "101","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "132", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "133","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5TH_END":
    [
    {"Min": "0","Max": "104", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "105","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "142", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "143","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_5_END":
    [
    {"Min": "0","Max": "104", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "105","Max": "129", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "130","Max": "142", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "143","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5TH_BEGINNING":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5TH_BEG":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5_BEGINNING":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5_BEG":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5TH_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5TH_MID":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5_MID":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5TH_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "99","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_5_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "99","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5TH_BEGINNING":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5TH_BEG":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5_BEGINNING":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5_BEG":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5TH_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5TH_MID":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5_MID":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5TH_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "99","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_5_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "99","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_5_BEGINNING":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_5_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_5_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "99","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5TH_BEGINNING":
    [
    {"Min": "0","Max": "21", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "22","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5TH_BEG":
    [
    {"Min": "0","Max": "21", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "22","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5_BEGINNING":
    [
    {"Min": "0","Max": "21", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "22","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5_BEG":
    [
    {"Min": "0","Max": "21", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "22","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5TH_MIDDLE":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5TH_MID":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5_MIDDLE":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5_MID":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5TH_END":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "51", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "52","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_5_END":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "51", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "52","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5TH_BEGINNING":
    [
    {"Min": "0","Max": "21", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "22","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5TH_BEG":
    [
    {"Min": "0","Max": "21", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "22","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5_BEGINNING":
    [
    {"Min": "0","Max": "21", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "22","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5_BEG":
    [
    {"Min": "0","Max": "21", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "22","Max": "32", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "33","Max": "39", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "40","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5TH_MIDDLE":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5TH_MID":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5_MIDDLE":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5_MID":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5TH_END":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "51", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "52","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_5_END":
    [
    {"Min": "0","Max": "24", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "25","Max": "35", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "36","Max": "51", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "52","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5TH_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5TH_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5TH_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5TH_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5TH_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_5_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5TH_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5TH_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5TH_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5TH_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5TH_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_5_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_5_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_5_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_5_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5TH_BEGINNING":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5TH_BEG":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5_BEGINNING":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5_BEG":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5TH_MIDDLE":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5TH_MID":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5_MIDDLE":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5_MID":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5TH_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_5_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5TH_BEGINNING":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5TH_BEG":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5_BEGINNING":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5_BEG":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5TH_MIDDLE":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5TH_MID":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5_MIDDLE":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5_MID":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5TH_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_5_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_5_BEGINNING":
    [
    {"Min": "0","Max": "11", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "12","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_5_MIDDLE":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "13","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "20", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_5_END":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "23", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "24","Max": "27", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_5_BEG":
    [
    {"Min": "0","Max": "34", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "35","Max": "52", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "53","Max": "64", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "65","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_5_MID":
    [
    {"Min": "0","Max": "62", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "63","Max": "92", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "93","Max": "117", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "118","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_5_END":
    [
    {"Min": "0","Max": "78", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "79","Max": "115", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "116","Max": "148", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "149","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_5_BEG":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "31", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_5_MID":
    [
    {"Min": "0","Max": "30", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "31","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "66","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_5_END":
    [
    {"Min": "0","Max": "37", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "38","Max": "55", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "56","Max": "69", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_5_BEG":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "31", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_5_MID":
    [
    {"Min": "0","Max": "30", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "31","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "66","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_5_END":
    [
    {"Min": "0","Max": "37", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "38","Max": "55", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "56","Max": "69", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_5_BEG":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "31", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_5_MID":
    [
    {"Min": "0","Max": "30", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "31","Max": "51", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "52","Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "66","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_5_END":
    [
    {"Min": "0","Max": "37", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "38","Max": "55", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "56","Max": "69", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_5_BEG":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "24", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "25","Max": "32", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "33","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_5_MID":
    [
    {"Min": "0","Max": "25", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "26","Max": "41", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "42","Max": "52", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "53","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_5_END":
    [
    {"Min": "0","Max": "39", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "40","Max": "61", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "62","Max": "80", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "81","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    //6th Grade
    "COMPOSITE_6TH_BEGINNING":
    [
    {"Min": "0","Max": "279", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "280","Max": "343", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "344","Max": "434", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "435","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6TH_BEG":
    [
    {"Min": "0","Max": "279", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "280","Max": "343", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "344","Max": "434", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "435","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6_BEGINNING":
    [
    {"Min": "0","Max": "279", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "280","Max": "343", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "344","Max": "434", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "435","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6_BEG":
    [
    {"Min": "0","Max": "279", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "280","Max": "343", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "344","Max": "434", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "435","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6TH_MIDDLE":
    [
    {"Min": "0","Max": "284", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "285","Max": "357", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "358","Max": "460", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "461","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6TH_MID":
    [
    {"Min": "0","Max": "284", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "285","Max": "357", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "358","Max": "460", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "461","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6_MIDDLE":
    [
    {"Min": "0","Max": "284", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "285","Max": "357", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "358","Max": "460", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "461","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6_MID":
    [
    {"Min": "0","Max": "284", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "285","Max": "357", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "358","Max": "460", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "461","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6TH_END":
    [
    {"Min": "0","Max": "323", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "324","Max": "379", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "380","Max": "477", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "478","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPOSITE_6_END":
    [
    {"Min": "0","Max": "323", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "324","Max": "379", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "380","Max": "477", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "478","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6TH_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "110", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "111","Max": "120", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "121","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6TH_BEG":
    [
    {"Min": "0","Max": "89", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "90","Max": "106", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "107","Max": "138", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "139","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6_BEGINNING":
    [
    {"Min": "0","Max": "89", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "90","Max": "106", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "107","Max": "138", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "139","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6_BEG":
    [
    {"Min": "0","Max": "89", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "90","Max": "106", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "107","Max": "138", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "139","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6TH_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6TH_MID":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6_MID":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6TH_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "150", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "151","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-WORDSCORRECT_6_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "150", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "151","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_WC_6_BEGINNING":
    [
    {"Min": "0","Max": "89", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "90","Max": "106", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "107","Max": "138", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "139","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	  "ORF_WC_6_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
	 "ORF_WC_6_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "150", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "151","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6TH_BEGINNING":
    [
    {"Min": "0","Max": "89", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "90","Max": "106", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "107","Max": "138", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "139","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6TH_BEG":
    [
    {"Min": "0","Max": "89", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "90","Max": "106", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "107","Max": "138", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "139","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6_BEGINNING":
    [
    {"Min": "0","Max": "89", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "90","Max": "106", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "107","Max": "138", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "139","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6_BEG":
    [
    {"Min": "0","Max": "89", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "90","Max": "106", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "107","Max": "138", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "139","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6TH_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6TH_MID":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6_MID":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "92","Max": "108", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "109","Max": "140", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "141","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6TH_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "150", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "151","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_6_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "95","Max": "119", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "120","Max": "150", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "151","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6TH_BEGINNING":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6TH_BEG":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6_BEGINNING":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6_BEG":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6TH_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6TH_MID":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6_MID":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6TH_END":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-ACCURACY_6_END":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6TH_BEGINNING":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6TH_BEG":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6_BEGINNING":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6_BEG":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6TH_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6TH_MID":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6_MID":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6TH_END":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ACCURACY_6_END":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_6_BEGINNING":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_6_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "ORF_ACCURACY_6_END":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "99", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "100","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6TH_BEGINNING":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6TH_BEG":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6_BEGINNING":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6_BEG":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6TH_MIDDLE":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "47", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "48","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6TH_MID":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "47", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "48","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6_MIDDLE":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "47", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "48","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6_MID":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "47", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "48","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6TH_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "49", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "50","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELL_6_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "49", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "50","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6TH_BEGINNING":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6TH_BEG":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6_BEGINNING":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6_BEG":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "42", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "43","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6TH_MIDDLE":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "47", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "48","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6TH_MID":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "47", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "48","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6_MIDDLE":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "47", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "48","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6_MID":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "47", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "48","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6TH_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "49", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "50","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "RETELL_6_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "24","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "49", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "50","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6TH_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6TH_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6TH_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6TH_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6TH_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DORF-RETELLQUALITY_6_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6TH_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6TH_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6_BEG":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6TH_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6TH_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6_MID":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6TH_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELLQR_6_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "RETELL_QUALITY_6_BEGINNING":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
	 "RETELL_QUALITY_6_MIDDLE":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "2","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
	"RETELL_QUALITY_6_END":
    [
    {"Min": "0","Max": "1", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "2","Max": "2", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "3","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6TH_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6TH_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6TH_MIDDLE":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6TH_MID":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6_MIDDLE":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6_MID":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6TH_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "DAZE-ADJUSTED_6_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6TH_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6TH_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6TH_MIDDLE":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6TH_MID":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6_MIDDLE":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6_MID":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6TH_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZ_ADJ_SC_6_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_6_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "17", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "18","Max": "26", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_6_MIDDLE":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "MAZE_ADJUSTED_6_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "29", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_6_BEG":
    [
    {"Min": "0","Max": "45", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "46","Max": "72", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "73","Max": "84", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "85","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_6_MID":
    [
    {"Min": "0","Max": "71", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "72","Max": "103", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "104","Max": "124", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "125","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPOSITE_6_END":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "94","Max": "131", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "132","Max": "158", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "159","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_6_BEG":
    [
    {"Min": "0","Max": "27", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "28","Max": "38", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "39","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_6_MID":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "54","Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "66","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "AM_COMPUTATION_6_END":
    [
    {"Min": "0","Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "47","Max": "65", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "66","Max": "76", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "77","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_6_BEG":
    [
    {"Min": "0","Max": "27", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "28","Max": "38", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "39","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_6_MID":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "54","Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "66","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPA_6_END":
    [
    {"Min": "0","Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "47","Max": "65", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "66","Max": "76", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "77","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_6_BEG":
    [
    {"Min": "0","Max": "27", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "28","Max": "38", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "39","Max": "45", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "46","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_6_MID":
    [
    {"Min": "0","Max": "36", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "37","Max": "53", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "54","Max": "65", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "66","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "COMPB_6_END":
    [
    {"Min": "0","Max": "46", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "47","Max": "65", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "66","Max": "76", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "77","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_6_BEG":
    [
    {"Min": "0","Max": "17", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "18","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "37", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "38","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_6_MID":
    [
    {"Min": "0","Max": "29", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "30","Max": "45", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "46","Max": "59", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "60","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    "CA_6_END":
    [
    {"Min": "0","Max": "48", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "49","Max": "66", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "67","Max": "81", "Test_Primary": "At Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At Benchmark"},
    {"Min": "82","Max": "", "Test_Primary": "Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"Above Benchmark"}
    ],
    //Grade 7
    "MAZE_ADJUSTED_TOTAL_SCORE_7TH_BEGINNING":
    [
    {"Min": "0","Max": "44", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "45","Max": "61", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "62","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7TH_BEG":
    [
    {"Min": "0","Max": "44", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "45","Max": "61", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "62","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7_BEGINNING":
    [
    {"Min": "0","Max": "44", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "45","Max": "61", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "62","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7_BEG":
    [
    {"Min": "0","Max": "44", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "45","Max": "61", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "62","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7TH_MIDDLE":
    [
    {"Min": "0","Max": "44", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "45","Max": "63", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "64","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7TH_MID":
    [
    {"Min": "0","Max": "44", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "45","Max": "63", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "64","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7_MIDDLE":
    [
    {"Min": "0","Max": "44", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "45","Max": "63", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "64","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7_MID":
    [
    {"Min": "0","Max": "44", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "45","Max": "63", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "64","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7TH_END":
    [
    {"Min": "0","Max": "49", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "50","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_7_END":
    [
    {"Min": "0","Max": "49", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "50","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7TH_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7TH_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7_BEG":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "14","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7TH_MIDDLE":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7TH_MID":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7_MIDDLE":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7_MID":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7TH_END":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_7_END":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "19", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "20","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7TH_BEGINNING":
    [
    {"Min": "0","Max": "448", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "449","Max": "550", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "551","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7TH_BEG":
    [
    {"Min": "0","Max": "448", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "449","Max": "550", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "551","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7_BEGINNING":
    [
    {"Min": "0","Max": "448", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "449","Max": "550", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "551","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7_BEG":
    [
    {"Min": "0","Max": "448", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "449","Max": "550", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "551","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7TH_MIDDLE":
    [
    {"Min": "0","Max": "448", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "449","Max": "562", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "563","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7TH_MID":
    [
    {"Min": "0","Max": "448", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "449","Max": "562", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "563","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7_MIDDLE":
    [
    {"Min": "0","Max": "448", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "449","Max": "562", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "563","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7_MID":
    [
    {"Min": "0","Max": "448", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "449","Max": "562", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "563","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7TH_END":
    [
    {"Min": "0","Max": "478", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "479","Max": "598", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "599","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_7_END":
    [
    {"Min": "0","Max": "478", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "479","Max": "598", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "599","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7TH_BEGINNING":
    [
    {"Min": "0","Max": "440", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "441","Max": "561", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "562","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7TH_BEG":
    [
    {"Min": "0","Max": "440", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "441","Max": "561", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "562","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7_BEGINNING":
    [
    {"Min": "0","Max": "440", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "441","Max": "561", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "562","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7_BEG":
    [
    {"Min": "0","Max": "440", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "441","Max": "561", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "562","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7TH_MIDDLE":
    [
    {"Min": "0","Max": "482", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "483","Max": "596", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "597","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7TH_MID":
    [
    {"Min": "0","Max": "482", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "483","Max": "596", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "597","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7_MIDDLE":
    [
    {"Min": "0","Max": "482", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "483","Max": "596", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "597","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7_MID":
    [
    {"Min": "0","Max": "482", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "483","Max": "596", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "597","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7TH_END":
    [
    {"Min": "0","Max": "484", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "485","Max": "600", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "601","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_7_END":
    [
    {"Min": "0","Max": "484", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "485","Max": "600", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "601","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7TH_BEGINNING":
    [
    {"Min": "0","Max": "428", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "429","Max": "556", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "557","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7TH_BEG":
    [
    {"Min": "0","Max": "428", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "429","Max": "556", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "557","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7_BEGINNING":
    [
    {"Min": "0","Max": "428", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "429","Max": "556", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "557","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7_BEG":
    [
    {"Min": "0","Max": "428", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "429","Max": "556", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "557","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7TH_MIDDLE":
    [
    {"Min": "0","Max": "488", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "489","Max": "597", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "598","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7TH_MID":
    [
    {"Min": "0","Max": "488", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "489","Max": "597", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "598","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7_MIDDLE":
    [
    {"Min": "0","Max": "488", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "489","Max": "597", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "598","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7_MID":
    [
    {"Min": "0","Max": "488", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "489","Max": "597", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "598","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7TH_END":
    [
    {"Min": "0","Max": "484", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "485","Max": "600", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "601","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_7_END":
    [
    {"Min": "0","Max": "495", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "496","Max": "601", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "602","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7TH_BEGINNING":
    [
    {"Min": "0","Max": "406", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "407","Max": "524", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "525","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7TH_BEG":
    [
    {"Min": "0","Max": "406", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "407","Max": "524", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "525","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7_BEGINNING":
    [
    {"Min": "0","Max": "406", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "407","Max": "524", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "525","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7_BEG":
    [
    {"Min": "0","Max": "406", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "407","Max": "524", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "525","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7TH_MIDDLE":
    [
    {"Min": "0","Max": "468", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "469","Max": "570", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "571","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7TH_MID":
    [
    {"Min": "0","Max": "468", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "469","Max": "570", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "571","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7_MIDDLE":
    [
    {"Min": "0","Max": "468", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "469","Max": "570", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "571","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7_MID":
    [
    {"Min": "0","Max": "468", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "469","Max": "570", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "571","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7TH_END":
    [
    {"Min": "0","Max": "496", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "497","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_7_END":
    [
    {"Min": "0","Max": "496", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "497","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7TH_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7TH_BEG":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7_BEG":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "96","Max": "96", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "97","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7TH_MIDDLE":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7TH_MID":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7_MIDDLE":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7_MID":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7TH_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_7_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7TH_BEGINNING":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7TH_BEG":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7_BEGINNING":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7_BEG":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "26", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "27","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7TH_MIDDLE":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7TH_MID":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7_MIDDLE":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7_MID":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7TH_END":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_7_END":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "31", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "32","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    //Grade 8
    "MAZE_ADJUSTED_TOTAL_SCORE_8TH_BEGINNING":
    [
    {"Min": "0","Max": "50", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "51","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8TH_BEG":
    [
    {"Min": "0","Max": "50", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "51","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8_BEGINNING":
    [
    {"Min": "0","Max": "50", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "51","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8_BEG":
    [
    {"Min": "0","Max": "50", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "51","Max": "69", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "70","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8TH_MIDDLE":
    [
    {"Min": "0","Max": "58", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "59","Max": "78", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "79","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8TH_MID":
    [
    {"Min": "0","Max": "58", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "59","Max": "78", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "79","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8_MIDDLE":
    [
    {"Min": "0","Max": "58", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "59","Max": "78", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "79","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8_MID":
    [
    {"Min": "0","Max": "58", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "59","Max": "78", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "79","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8TH_END":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "84", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "85","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "MAZE_ADJUSTED_TOTAL_SCORE_8_END":
    [
    {"Min": "0","Max": "69", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "70","Max": "84", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "85","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8TH_BEGINNING":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8TH_BEG":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8_BEGINNING":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8_BEG":
    [
    {"Min": "0","Max": "15", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "16","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8TH_MIDDLE":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8TH_MID":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8_MIDDLE":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8_MID":
    [
    {"Min": "0","Max": "16", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "17","Max": "20", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "21","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8TH_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "SILENT_READING_TOTAL_8_END":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "15","Max": "18", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "19","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8TH_BEGINNING":
    [
    {"Min": "0","Max": "473", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "474","Max": "568", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "569","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8TH_BEG":
    [
    {"Min": "0","Max": "473", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "474","Max": "568", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "569","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8_BEGINNING":
    [
    {"Min": "0","Max": "473", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "474","Max": "568", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "569","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8_BEG":
    [
    {"Min": "0","Max": "473", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "474","Max": "568", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "569","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8TH_MIDDLE":
    [
    {"Min": "0","Max": "513", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "514","Max": "613", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "614","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8TH_MID":
    [
    {"Min": "0","Max": "513", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "514","Max": "613", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "614","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8_MIDDLE":
    [
    {"Min": "0","Max": "513", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "514","Max": "613", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "614","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8_MID":
    [
    {"Min": "0","Max": "513", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "514","Max": "613", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "614","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8TH_END":
    [
    {"Min": "0","Max": "568", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "569","Max": "663", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "664","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE1_SCORE_8_END":
    [
    {"Min": "0","Max": "568", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "569","Max": "663", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "664","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8TH_BEGINNING":
    [
    {"Min": "0","Max": "483", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "484","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8TH_BEG":
    [
    {"Min": "0","Max": "483", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "484","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8_BEGINNING":
    [
    {"Min": "0","Max": "483", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "484","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8_BEG":
    [
    {"Min": "0","Max": "483", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "484","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8TH_MIDDLE":
    [
    {"Min": "0","Max": "517", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "518","Max": "613", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "614","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8TH_MID":
    [
    {"Min": "0","Max": "517", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "518","Max": "613", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "614","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8_MIDDLE":
    [
    {"Min": "0","Max": "517", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "518","Max": "613", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "614","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8_MID":
    [
    {"Min": "0","Max": "517", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "518","Max": "613", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "614","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8TH_END":
    [
    {"Min": "0","Max": "516", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "517","Max": "622", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "623","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE2_SCORE_8_END":
    [
    {"Min": "0","Max": "516", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "517","Max": "622", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "623","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8TH_BEGINNING":
    [
    {"Min": "0","Max": "483", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "484","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8TH_BEG":
    [
    {"Min": "0","Max": "483", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "484","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8_BEGINNING":
    [
    {"Min": "0","Max": "483", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "484","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8_BEG":
    [
    {"Min": "0","Max": "483", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "484","Max": "590", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "591","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8TH_MIDDLE":
    [
    {"Min": "0","Max": "504", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "505","Max": "606", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "607","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8TH_MID":
    [
    {"Min": "0","Max": "504", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "505","Max": "606", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "607","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8_MIDDLE":
    [
    {"Min": "0","Max": "504", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "505","Max": "606", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "607","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8_MID":
    [
    {"Min": "0","Max": "504", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "505","Max": "606", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "607","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8TH_END":
    [
    {"Min": "0","Max": "532", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "533","Max": "642", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "643","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "GATE3_SCORE_8_END":
    [
    {"Min": "0","Max": "532", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "533","Max": "642", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "643","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8TH_BEGINNING":
    [
    {"Min": "0","Max": "482", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "483","Max": "578", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "579","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8TH_BEG":
    [
    {"Min": "0","Max": "482", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "483","Max": "578", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "579","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8_BEGINNING":
    [
    {"Min": "0","Max": "482", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "483","Max": "578", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "579","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8_BEG":
    [
    {"Min": "0","Max": "482", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "483","Max": "578", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "579","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8TH_MIDDLE":
    [
    {"Min": "0","Max": "503", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "504","Max": "600", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "601","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8TH_MID":
    [
    {"Min": "0","Max": "503", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "504","Max": "600", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "601","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8_MIDDLE":
    [
    {"Min": "0","Max": "503", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "504","Max": "600", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "601","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8_MID":
    [
    {"Min": "0","Max": "503", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "504","Max": "600", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "601","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8TH_END":
    [
    {"Min": "0","Max": "511", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "512","Max": "629", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "630","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_WORDCORRECT_TOTAL_8_END":
    [
    {"Min": "0","Max": "511", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "512","Max": "629", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "630","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8TH_BEGINNING":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8TH_BEG":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8_BEGINNING":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8_BEG":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8TH_MIDDLE":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8TH_MID":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8_MIDDLE":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8_MID":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "97","Max": "97", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "98","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8TH_END":
    [
    {"Min": "0","Max": "97", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_ACCURACY_TOTAL_8_END":
    [
    {"Min": "0","Max": "97", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "98","Max": "98", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "99","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8TH_BEGINNING":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "27", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8TH_BEG":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "27", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8_BEGINNING":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "27", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8_BEG":
    [
    {"Min": "0","Max": "19", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "20","Max": "27", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "28","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8TH_MIDDLE":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8TH_MID":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8_MIDDLE":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8_MID":
    [
    {"Min": "0","Max": "20", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "21","Max": "28", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "29","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8TH_END":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark"}
    ],
    "ORAL_READING_COMPREHENSION_TOTAL_8_END":
    [
    {"Min": "0","Max": "22", "Test_Primary": "Well Below Benchmark", "Test_Secondary": "Intensive Support", "test_score_attribute" : "Well Below Benchmark"},
    {"Min": "23","Max": "29", "Test_Primary": "Below Benchmark", "Test_Secondary": "Strategic Support", "test_score_attribute":"Below Benchmark"},
    {"Min": "30","Max": "", "Test_Primary": "At or Above Benchmark", "Test_Secondary": "Core Support", "test_score_attribute":"At or Above Benchmark", }
    ]
};

     var perfLevels = {
        "Intensive Support": {
            TEST_SECONDARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Intensive Support"
        },
        "Strategic Support": {
            TEST_SECONDARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Strategic Support"
        },
        "Core Support": {
            TEST_SECONDARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "Core Support"
        },
        "--": {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        "Well Below Benchmark": {
            TEST_SECONDARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Intensive Support"
        },
        "Below Benchmark": {
            TEST_SECONDARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Strategic Support"
        },
        "At or Above Benchmark": {
            TEST_SECONDARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "Core Support"
        },
        "Above Benchmark": {
                TEST_SECONDARY_RESULT_CODE: "CS",
                TEST_PRIMARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "Core Support"
        },
        "At Benchmark": {
                TEST_SECONDARY_RESULT_CODE: "CS",
                TEST_PRIMARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "Core Support"
         },
        "Not Determined": {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "Not Determined"
        },
        "Below Threshold": { //RanLevel
            TEST_PRIMARY_RESULT_CODE: "BT",
        },
        "Valid": { //RanLevel
            TEST_PRIMARY_RESULT_CODE: "VV",
        },
        "": {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        null: {
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        undefined: {
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
        "below threshold": "Below Threshold",
        "valid": "Valid",
        "": "",
        "--": "--"
    }

    var capsPathwayLevels = {
        "typical": "Typical",
        "above typical": "Above Typical",
        "below typical": "Below Typical",
        "well above typical": "Well Above Typical",
        "well below typical": "Well Below Typical",
        "": "",
        "--": "--"
    }



    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "1st Grade": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "2nd Grade": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "3rd Grade": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "4th Grade": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "5th Grade": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "6th Grade": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "7th Grade": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "8th Grade": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "9th Grade": "09",
        "10": "10",
        "Grade 10": "10",
        "10th Grade": "10",
        "10th":"10",
        "11": "11",
        "Grade 11": "11",
        "11th Grade": "11",
        "11th":"11",
        "12": "12",
        "Grade 12": "12",
        "12th Grade": "12",
        "12th":"12",
        "H.S. Graduate":"13",
        "College Student":"14",
        "Other":"15",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
        , "": null
        , null: null
    };
    var gradeBenchmarkDecode = {
        "01": "1",
        "02": "2",
        "03": "3",
        "04": "4",
        "05": "5",
        "06": "6",
        "07": "7",
        "08": "8",
        "09": "9",
        "10": "10",
        "11": "11",
        "12": "12",
        "13": "13",
        "14": "14",
        "15": "15",
        "KG": "K",
        "": null,
        null: null
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
            "end" : "End"
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
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param array Array containing JSON objects representing raw data by physical name.
     * @returns {array} Mapped normalized records.
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {

        var normalizedRecords = [];

        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        if (signature.getFormat().getFormatName() === "ACADIENCE_RD_2122" || signature.getFormat().getFormatName() === "ACADIENCE2122"|| signature.getFormat().getFormatName() === "ACADIENCE2223"|| signature.getFormat().getFormatName() === "ACARD_66_COLS"|| signature.getFormat().getFormatName().indexOf("BNCH") >-1) {
            var record;
            var year = hierarchy.SCHOOL_YEAR.split("-")[0];
            var gLevel = row.getField("GRADE");
            var assessPeriod = getShortAdminPeriod(row);
            record = mapSingleNormalizedRecord(signature, hierarchy, row, gLevel, assessPeriod, year);
            AppUtil.nullSafePush(normalizedRecords, record);
        } else {
            gradeLevels.forEach(function(gradeLevel) {
                var record;
                year = "";
                if (row.getField("YEAR_${gradeLevel.FIELD}") !== null && row.getField("YEAR_${gradeLevel.FIELD}") !== "") {
                    year = row.getField("YEAR_${gradeLevel.FIELD}");
                }
                //Acadience
                else if (row.getField("YEAR") !== null && row.getField("YEAR") !== "" && row.getField("GRADE") === gradeLevel.FIELD) {
                    if (row.getField("YEAR").length > 4) {
                        year = row.getField("YEAR").split(" ")[1]
                    } else {
                        year = row.getField("YEAR");
                    }
                } else if (row.getField("YEAR_GRADE${gradeLevel.FIELD}") !== null && row.getField("YEAR_GRADE${gradeLevel.FIELD}") !== "") {
                    year = row.getField("YEAR_GRADE${gradeLevel.FIELD}").split("-")[0];
                } else if (signature.getFormat().getFormatName() === "DIBELS_FAIRFAX_ACADIENCE_21") {
                    year = hierarchy.SCHOOL_YEAR.split("-")[0];
                }
                else if (row.getField("SCHOOL_YEAR") !== null && row.getField("SCHOOL_YEAR") !== "") {
                    year = row.getField("SCHOOL_YEAR").split("-")[0];
                }
                if (year) {
                    assessPeriodsMain.forEach(function(assessPeriod) {
                        record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year);
                        AppUtil.nullSafePush(normalizedRecords, record);
                    });
                }
            });
        }

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
    function mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year) {

        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        record = mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year);

        if((row.getField("COMPOSITE_GOAL_PATHWAY")===undefined || row.getField("COMPOSITE_GOAL_PATHWAY")===null ) && signature.getFormat().getFormatName()!="ACADIENCE2122" && signature.getFormat().getFormatName() !== "ACARD_66_COLS"&& signature.getFormat().getFormatName()!="ACADIENCE2223"){
                strandsAndFields.forEach(function(strandsAndField) {
                var performanceCode = "";
                var score;
                var testNumber = '';
                var assessmentCode = '';
                var test_result_1 = '--';
                var test_result_2 = '--';
                var test_result_3 = '--';

                if (signature.getFormat().getFormatName() === "ACADIENCE_RD_2122" || signature.getFormat().getFormatName().indexOf("BNCH") >-1) {
                    if (gradeLevel) {
                        gradeLevel = gradeDecode[gradeLevel];
                    }

                    testNumber = "ACA_${strandsAndField.TEST}" + gradeLevel + assessPeriod + "${strandsAndField.STRAND}";
                    assessmentCode = "ASSESSMENT_MEASURE-" + "${strandsAndField.FIELD}";
                    score = row.getField("${assessmentCode}" + "-SCORE");
                    performanceCode = _util.coalesce(_util.trim(row.getField("${assessmentCode}" + "-LEVELS")), "--");
                } else {
                    testNumber = "ACA_${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}";
                    assessmentCode = "${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}";
                    score = row.getField("${assessmentCode}");
                }
                if (score !== null && score !== "" && (signature.getFormat().getFormatName() !== "ACADIENCE_RD_2122"|| signature.getFormat().getFormatName().indexOf("BNCH") >-1)) {
                    var lexileValue = _util.coalesce(row.getField("LEXILE_${assessmentCode}"),row.getField("${assessmentCode}_LEXILE"), "--");
                    performanceCode = _util.coalesce(row.getField("NEED_FOR_SUPPORT_${assessmentCode}"), "--");
                    if (performanceCode == '--' && assessmentCode in perfCutoffs) {
                    var temp = perfCutoffs[assessmentCode];
                    temp.forEach(item => {
                        if ((score >= parseInt(item['Min']) && score <= parseInt(item['Max'])) ||
                        (score >= parseInt(item['Min']) && item['Max'] === '')){
                            test_result_1 = item['Test_Primary'];
                            test_result_2 = item['Test_Secondary'];
                            test_result_3 = item['test_score_attribute'];
                        }
                    });
                    }
                }

                if (score !== null && performanceCode !== '--') {
                    performanceCode = capsLevels[performanceCode];
                    var cleanLexile = null;
                    if(lexileValue !== undefined && lexileValue !== null && lexileValue !== ""){
                        cleanLexile = lexileValue.replace("BR", "").replace("L", "");
                    }
                    let scoreMapping = {
                        "TEST_NUMBER": testNumber,
                        "TEST_SCORE_VALUE": score,
                        "TEST_SCORE_TEXT": score,
                        "TEST_PERCENTILE_SCORE": _util.coalesce(isNaN(row.getField("DISTRICT_PERCENTILE_${assessmentCode}")) ? null : row.getField("DISTRICT_PERCENTILE_${assessmentCode}"), isNaN(row.getField("SCHOOL_PERCENTILE_${assessmentCode}")) ? null : row.getField("SCHOOL_PERCENTILE_${assessmentCode}")),
                        "TEST_PRIMARY_RESULT_CODE": perfLevels[performanceCode].TEST_PRIMARY_RESULT_CODE,
                        "TEST_PRIMARY_RESULT": performanceCode,
                        "TEST_SECONDARY_RESULT_CODE": perfLevels[performanceCode].TEST_SECONDARY_RESULT_CODE,
                        "TEST_SECONDARY_RESULT": perfLevels[performanceCode].TEST_SECONDARY_RESULT,
                        "TEST_READING_LEVEL": cleanLexile,
                        "TEST_TERTIARY_RESULT" : row.getField("${assessmentCode}"+"-NATIONAL_NORM_PERCENTILE"),
                        "TEST_QUATERNARY_RESULT_CODE" : "Semester",
                        "TEST_QUATERNARY_RESULT" : row.getField("${assessmentCode}"+"-SEMESTER_GROWTH"),
                        "TEST_CUSTOM_RESULT_CODE" : "Year",
                        "TEST_CUSTOM_RESULT" : row.getField("${assessmentCode}"+"-YEAR_GROWTH"),
                        "TEST_SCORE_ATTRIBUTES" : test_result_3
                    };
                    mappingObject.SCORE_MAPPINGS.push(scoreMapping);
                } else if (score !== null && performanceCode === '--') {
                    var cleanLexile = null;
                    if(lexileValue !== undefined && lexileValue !== null && lexileValue !== ""){
                        cleanLexile = lexileValue.replace("BR", "").replace("L", "");
                    }
                    let scoreMapping = {
                        "TEST_NUMBER": testNumber,
                        "TEST_SCORE_VALUE": score,
                        "TEST_SCORE_TEXT": score,
                        "TEST_PERCENTILE_SCORE": isNaN(row.getField("DISTRICT_PERCENTILE_${assessmentCode}")) ? null : row.getField("DISTRICT_PERCENTILE_${assessmentCode}"),
                        "TEST_PRIMARY_RESULT_CODE": perfLevels[test_result_1].TEST_PRIMARY_RESULT_CODE,
                        "TEST_PRIMARY_RESULT": test_result_1,
                        "TEST_SECONDARY_RESULT_CODE": perfLevels[test_result_2].TEST_SECONDARY_RESULT_CODE,
                        "TEST_SECONDARY_RESULT": test_result_2,
                        "TEST_READING_LEVEL": cleanLexile,
                        "TEST_TERTIARY_RESULT" : row.getField("${assessmentCode}"+"-NATIONAL_NORM_PERCENTILE"),
                        "TEST_QUATERNARY_RESULT_CODE" : "Semester",
                        "TEST_QUATERNARY_RESULT" : row.getField("${assessmentCode}"+"-SEMESTER_GROWTH"),
                        "TEST_CUSTOM_RESULT_CODE" : "Year",
                        "TEST_CUSTOM_RESULT" : row.getField("${assessmentCode}"+"-YEAR_GROWTH"),
                        "TEST_SCORE_ATTRIBUTES" : test_result_3
                    };
                    mappingObject.SCORE_MAPPINGS.push(scoreMapping);
                }

            });
        }
        else{
            scoresToMap.forEach(function (testMetadata) {
                try {
                    var period = assessPeriods[row.getField("BENCHMARK_PERIOD")];
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, period);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch (exception) {
                    print(exception+ "\n");
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
                }
            });
        }

       //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

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
    function mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year) {
        var record = {};

        var schoolName, schoolCode, birthDateObject = AppUtil.getEmptyDateObj();

        // Just to make sure normalizedFileFields load once, as it was creating issue in linux (MacOS) based machines
        if (!GLOBAL.normalizedFileFields) {
            GLOBAL.normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        }
        var dateString = {
                     MONTH : null
                    , DAY : null
                    , YEAR : null
                    , STANDARD_DATE : null
                };

         dateString = _util.coalesce(
            row.getField("STUDENT_BIRTHDATE"),
            row.getField("BIRTHDATE"),
            row.getField("DATE_OF_BIRTH")
        );
        if (dateString) {
            let dateChunk, dateSeparator;

            if (dateString.indexOf("-") > -1) {
                dateChunk = dateString.split("-");
                dateSeparator = "-";
            } else if (dateString.indexOf("/") > -1) {
                dateChunk = dateString.split("/");
                dateSeparator = "/";
            }

            dateChunk.forEach((dc) => {
                if (dc.length < 2) {
                    dc = ('0' + dc).slice('-2');
                }
            });

            let dateFormat = null;

            if (dateChunk[0].length === 4) {
                dateFormat = "yyyy${dateSeparator}MM${dateSeparator}dd";
            } else if (dateChunk[2].length === 4) {
                dateFormat = "MM${dateSeparator}dd${dateSeparator}yyyy";
            } else {
                dateFormat = "MM${dateSeparator}dd${dateSeparator}yyyy";
                dateChunk[2] = "20" + dateChunk[2]; // TODO: What will be year in case of two digit year?
                dateString = dateChunk[0] + dateSeparator + dateChunk[1] + dateSeparator + dateChunk[2];
            }

            birthDateObject = AppUtil.getDateObjByPattern(dateString, dateFormat);
        }

        var schoolInfo = row.getField("SCHOOL_${gradeLevel.FIELD}");

        if (undefined === row.getField("SCHOOL_${gradeLevel.FIELD}") || null === row.getField("SCHOOL_${gradeLevel.FIELD}")) {
            schoolName = _util.coalesce(
                row.getField("SCHOOL_NAME"),
                row.getField("SCHOOL_NAME_G${gradeLevel.FIELD}")
            );
            schoolCode = null;
        } else if (schoolInfo) {
            schoolName = schoolInfo.substring(0, schoolInfo.lastIndexOf(" "));
            schoolCode = schoolInfo.substr(schoolInfo.lastIndexOf(" ") + 1);
        }

        //Loop through normalized fields and map if possible.
        GLOBAL.normalizedFileFields.forEach(function(field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, assessPeriod);
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
                    record.REPORTING_PERIOD =  _util.coalesce(getTEST_ADMIN_PERIOD(assessPeriod, row, signature),hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE =  _util.coalesce(getTEST_ADMIN_DATE_STR(assessPeriod, year, row, signature), "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9));
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
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(
                        row.getField("STUDENT_LOCAL_ID"),
                        row.getField("STUDENT_ID"),
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1"), row.getField("STATE_STUDENT_ID_VERSION_2"), row.getField("SECONDARY_ID"), row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_NUMBER"), row.getField("STATE_STUDENT_ID_VERSION_1"), row.getField("STATE_STUDENT_ID_VERSION_2"), row.getField("SECONDARY_ID"), row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(
                        row.getField("STUDENT_FIRST_NAME"),
                        row.getField("FIRST_NAME")
                    );
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(
                        row.getField("STUDENT_MIDDLE_NAME"),
                        row.getField("STUDENT_MIDDLE_INITIAL")
                    );
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(
                        row.getField("STUDENT_LAST_NAME"),
                        row.getField("LAST_NAME")
                    );
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.coalesce(row.getField("STUDENT_ADDRESS"));
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STUDENT_STATE"));
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = _util.coalesce(row.getField("STUDENT_ZIP_CODE"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENT_GENDER_CODE"), row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField("GRADE")];
                    break;
                case "TEST_LOCATION":
                    record.TEST_LOCATION = _util.coalesce(row.getField("TEST_LOCATION"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        schoolName,
                        row.getField("DISTRICT_NAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = schoolCode;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        schoolCode, row.getField("SCHOOL_STATE_ID"),
                        schoolName, "DISTRICT"
                    );
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
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {
        var admin = {};

        return admin;
    }

    function getTEST_ADMIN_PERIOD(assessPeriod, row, signature) {

        var period = null;
        if (signature.getFormat().getFormatName() === "ACADIENCE_RD_2122" || signature.getFormat().getFormatName() === "ACADIENCE2122" || signature.getFormat().getFormatName() === "ACADIENCE2223" || signature.getFormat().getFormatName() === "ACARD_66_COLS" || signature.getFormat().getFormatName().indexOf("BNCH") >-1) {
            var benchmarkPeriod = row.getField("BENCHMARK_PERIOD");
            if (benchmarkPeriod === "BOY") {
                period = "Beginning";
            }
            else if (benchmarkPeriod === "beginning") {
                period = "Beginning";
            }
            else if (benchmarkPeriod === "MOY") {
               period = "Middle";
            }
            else if (benchmarkPeriod === "middle") {
               period = "Middle";
            }
            else if (benchmarkPeriod === "EOY") {
                period = "End";
            }
            else if (benchmarkPeriod === "end") {
                period = "End";
            }
        } else {
            switch (assessPeriod.FIELD) {
                case "BEGINNING":
                case "BEG":
                    period = "Beginning";
                    break;
                case "MIDDLE":
                case "MID":
                    period = "Middle";
                    break;
                case "END":
                    period = "End";
                    break;
            }
        }
        return period;
    }

    function getShortAdminPeriod(row) {

        var period = null;
        var benchmarkPeriod = row.getField("BENCHMARK_PERIOD");
        if (benchmarkPeriod === "BOY") {
            period = "BEG";
        }
        else if (benchmarkPeriod === "beginning") {
            period = "BEG";
        }
        else if (benchmarkPeriod === "MOY") {
            period = "MID";
        }
        else if (benchmarkPeriod === "middle") {
            period = "MID";
        }
        else if (benchmarkPeriod === "EOY") {
            period = "END";
        }
        else if (benchmarkPeriod === "end") {
            period = "END";
        }

        return period;
    }


    function getTEST_ADMIN_DATE_STR(assessPeriod, year, row, signature) {
        var date = null;
        if (signature.getFormat().getFormatName() === "ACADIENCE_RD_2122" || signature.getFormat().getFormatName() === "ACADIENCE2122" || signature.getFormat().getFormatName() === "ACADIENCE2223" || signature.getFormat().getFormatName() === "ACARD_66_COLS" || signature.getFormat().getFormatName().indexOf("BNCH") >-1) {
            var benchmarkPeriod = row.getField("BENCHMARK_PERIOD");
            if (benchmarkPeriod === "BOY" || benchmarkPeriod === "beginning") {
                date = "10/15/${year}";

            } else if (benchmarkPeriod === "MOY"|| benchmarkPeriod === "middle") {
                year = parseInt(year) + 1;
                date = "01/15/${year}";
            } else if (benchmarkPeriod === "EOY"|| benchmarkPeriod === "end") {
                year = parseInt(year) + 1;
                date = "04/15/${year}";
            }
        } else {
            //return "01/01/1900";
            switch (assessPeriod.FIELD) {

                case "BEGINNING":
                case "BEG":
                case "beginning" :
                    date = "10/15/${year}";
                    break;
                case "MIDDLE":
                case "MID":
                    year = parseInt(year) + 1;
                    date = "01/15/${year}";
                    break;
                case "END":
                    year = parseInt(year) + 1;
                    date = "04/15/${year}";
                    break;
            }
        }
        return date;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function mapScaledScore(row, testMetadata, period) {
        let score = {};
        let assessCode = null;
        let test_result_1 = '--';
        let test_result_2 = '--';
        let test_result_3 = '--';
        let grade = gradeBenchmarkDecode[gradeDecode[row.getField("GRADE")]];
        let testNumber = testMetadata.TEST + '_' + testMetadata.CODE;
        let scaleScore = row.getField('ASSESSMENT_MEASURE_' + testMetadata.FIELD + '_SCORE');
        let nationalPercentile = _util.trim(row.getField('ASSESSMENT_MEASURE_' + testMetadata.FIELD + '_NATIONAL_PERCENTILE'));
        let scoreLevels = _util.coalesce(row.getField('ASSESSMENT_MEASURE_' + testMetadata.FIELD + '_LEVELS'),'--');
        let pathway = row.getField(testMetadata.FIELD + '_PATHWAY');
        let lexile = row.getField('ASSESSMENT_MEASURE_LEXILE_' + testMetadata.FIELD);


         if(period !== null && period !== undefined && period !== "") {
            assessCode = testMetadata.FIELD + '_' + grade + '_' + assessPeriods[period].toUpperCase();
         }


        if ((!scaleScore || _util.trim(scaleScore) === "--") && (lexile === null || lexile === undefined || _util.trim(lexile) === "--" || lexile === "" || lexile === " "))
        {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if(nationalPercentile === "<1"){
            nationalPercentile = "0";
        }else if(nationalPercentile === ">99"){
            nationalPercentile = "100";
        }

        score["TEST_PERCENTILE_SCORE"] = nationalPercentile;

        if(lexile !== undefined && lexile !== null && lexile !== ""){
            score["TEST_READING_LEVEL"] = lexile.replace("BR", "").replace("L", "");
        }

        let decodedScoreLevels = capsLevels[scoreLevels];

        let decodedPathway = capsPathwayLevels[pathway];

        if (scoreLevels !== "--") {
            score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[decodedScoreLevels].TEST_PRIMARY_RESULT_CODE;
            score["TEST_PRIMARY_RESULT"] = decodedScoreLevels;
            score["TEST_SECONDARY_RESULT_CODE"] = perfLevels[decodedScoreLevels].TEST_SECONDARY_RESULT_CODE;
            score["TEST_SECONDARY_RESULT"] = perfLevels[decodedScoreLevels].TEST_SECONDARY_RESULT;
            score["TEST_SCORE_ATTRIBUTES"] = test_result_3;

        } else if (scaleScore !== null && scoreLevels === "--") {
            if(assessCode in perfCutoffs) {
                var temp = perfCutoffs[assessCode];
                temp.forEach(item => {
                if ((scaleScore >= parseInt(item['Min']) && scaleScore <= parseInt(item['Max'])) ||
                (scaleScore >= parseInt(item['Min']) && item['Max'] === '')){
                    test_result_1 = item['Test_Primary'];
                    test_result_2 = item['Test_Secondary'];
                    test_result_3 = item['test_score_attribute'];
                }
            });
            }
           score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[test_result_1].TEST_PRIMARY_RESULT_CODE;
           score["TEST_PRIMARY_RESULT"] = test_result_1;
           score["TEST_SECONDARY_RESULT_CODE"] = perfLevels[test_result_2].TEST_SECONDARY_RESULT_CODE;
           score["TEST_SECONDARY_RESULT"] = test_result_2;
           score["TEST_SCORE_ATTRIBUTES"] = test_result_3;
        }

        score["TEST_TERTIARY_RESULT"] = decodedPathway;
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

        let decodedScoreLevels = capsLevels[RANLevels];

        if (RANLevels) {
            score["TEST_PRIMARY_RESULT"] = decodedScoreLevels;
            score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[decodedScoreLevels].TEST_PRIMARY_RESULT_CODE;
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

        function mapScore(row, testMetadata, period) {
                let score = {};
                let testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
                let scaledScore = row.getField(testMetadata.FIELD + "_TOTAL_SCORE");
                let status = row.getField(testMetadata.FIELD + "_TOTAL_LEVELS");
                let nationalPercentile = row.getField(testMetadata.FIELD + "_TOTAL_NATIONAL_PERCENTILE");

                if(scaledScore === null || scaledScore === undefined || _util.trim(scaledScore) === "--"|| _util.trim(scaledScore) === "") {
                    return null;
                }
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = scaledScore;
                score["TEST_SCORE_VALUE"] = scaledScore;
                score["TEST_SCALED_SCORE"] = scaledScore;
                score["TEST_PRIMARY_RESULT"] = capsLevels[status];
                score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[capsLevels[status]].TEST_PRIMARY_RESULT_CODE;
                score["TEST_SECONDARY_RESULT_CODE"]= perfLevels[capsLevels[status]].TEST_SECONDARY_RESULT_CODE;
                score["TEST_SECONDARY_RESULT"]= perfLevels[capsLevels[status]].TEST_SECONDARY_RESULT;

                if(nationalPercentile === "<1"){
                    nationalPercentile = "0";
                }else if(nationalPercentile === ">99"){
                    nationalPercentile = "100";
                }

                score["TEST_PERCENTILE_SCORE"] = nationalPercentile;

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


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, assessPeriod) {

        var assessmentAdminKey = null;
        // Set base assessment admin key information
        // TODO: Will this cause any issue in already loaded data?
        const ASSESSMENT_ID_PREFIX = _assessmentIdentifier.split(" ").map((chunk) => chunk.trim().toUpperCase()).join("_");

        if (assessPeriod === undefined) {
            assessmentAdminKey = "${ASSESSMENT_ID_PREFIX}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        } else if (signature.getFormat().getFormatName() === "ACADIENCE_RD_2122" || signature.getFormat().getFormatName() === "ACADIENCE2122"|| signature.getFormat().getFormatName() === "ACADIENCE2223"|| signature.getFormat().getFormatName() === "ACARD_66_COLS" || signature.getFormat().getFormatName().indexOf("BNCH") >-1) {
            var period =  _util.coalesce(getTEST_ADMIN_PERIOD(assessPeriod, srcRecord, signature),hierarchy.REPORTING_PERIOD);
            assessmentAdminKey = "${ASSESSMENT_ID_PREFIX}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}";
        } else {
            assessmentAdminKey = "${ASSESSMENT_ID_PREFIX}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${assessPeriod.FIELD}";
        }

        //Special case for ORF only files, UIHN-36625
        if( signature.getFormat().getFormatName() === "FRUITVALE_ACADIENCE_ORF" || signature.getFormat().getFormatName() === "ACADIENCE_ORF_MOY_22_23" || signature.getFormat().getFormatName() === "AUTOMATION_ORF_43_1_COLS"){
            assessmentAdminKey = assessmentAdminKey + "_ORF";
        }
        if( signature.getFormat().getFormatName() === "ACADIENCE_MAZE_MOY_22_23" || signature.getFormat().getFormatName() === "AUTOMATION_MAZE_43_2_COLS"){
            assessmentAdminKey = assessmentAdminKey + "_MAZE";
        }
        if( signature.getFormat().getFormatName() === "FRUITVALE_ACADIENCE_MOY"){
            assessmentAdminKey = assessmentAdminKey + "_MOY";
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        return assessmentAdminKey;

    }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());



//UIHN:65109 - ACADIENCE2223.sig Natural key had STUDENT_LOCAL_ID which was wrongly used now its replaced with STUDENT_NUMBER which is the right way ahead.