var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "dibels_6th";
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
    module.createNormalizedFile = function(file, signature) {
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

//			var signatureFormatName = signature.getFormat().getFormatName();
//			print("Loading using signature file ${signatureFormatName}");
//
//			var normalizedFile = AppUtil.createResultsFile(file);
//			print("Normalized file: ${normalizedFile}");
//
//			var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
//			var lineNumber = 0;			const fileFullName = file.getFullName();
//			//Process data file records.
//			_dataflow.create("RECORD BUILD")
//				.input("INPUT", AppUtil.getInputDataflow(file, signature))
//				.transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
//
// json.LINEAGE_FILE = fileFullName;
//					json.LINEAGE_LINE = (++lineNumber).toString();
//					output.RECORDS.put(json);
//				})
//				.group_by("ADMINISTRATION GROUPING" , function(one, two){
//					try {
//						var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
//						var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
//
//						return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
//					} catch(exception) {
//						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
//					}
//				})
//				.transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
//					try{
//						if(!multipleRowsPerGroupingExpected && rows.length > 1){
//
//							//Report error for each row
//							rows.forEach(function(row){
//								AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
//							});
//
//						} else {
//							output.RECORDS.put(rows);
//						}
//					} catch(exception) {
//						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
//					}
//				})
//				.transform("NORMALIZE RECORDS", ["RECORDS"],
//					function(output, rows) {
//						try{
//
//							var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);
//
//							normalizedRecords.forEach(function(record){
//								output.RECORDS.put(record);
//							});
//
//						} catch(exception) {
//							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
//						}
//
//
//					})
//				.transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
//					try {
//						var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
//
//						// Report when no scores are found.
//						if(mappingObject.SCORE_MAPPINGS.length === 0){
//							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
//						} else {
//							output.RECORDS.put(row);
//						}
//					} catch(exception) {
//						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
//					}
//				})
//				.output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
//				.execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);
//
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

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/
    var strandsAndFields =
        [
            // DIBELS V6 STRANDS

            // DIBELS NEXT STRANDS
            {TEST: "DIB6TH", STRAND: "FSF"    , FIELD: "FSF"},
            {TEST: "DIB6TH", STRAND: "ISF"    , FIELD: "ISF"},
            {TEST: "DIB6TH", STRAND: "LNF"    , FIELD: "LNF"},
            {TEST: "DIB6TH", STRAND: "PSF"    , FIELD: "PSF"},
            {TEST: "DIB6TH", STRAND: "NWFCLS" , FIELD: "NWF-CLS"},
            {TEST: "DIB6TH", STRAND: "NWFWWR" , FIELD: "NWF-WWR"},
            {TEST: "DIB6TH", STRAND: "DORFWC" , FIELD: "DORF-WORDSCORRECT"},
            {TEST: "DIB6TH", STRAND: "DORFERR", FIELD: "DORF-ERRORS"},
            {TEST: "DIB6TH", STRAND: "DORFACC", FIELD: "DORF-ACCURACY"},
            {TEST: "DIB6TH", STRAND: "DORFRT" , FIELD: "DORF-RETELL"},
            {TEST: "DIB6TH", STRAND: "DORFRQ" , FIELD: "DORF-RETELLQUALITY"},
            {TEST: "DIB6TH", STRAND: "DAZECOR", FIELD: "DAZE-CORRECT"},
            {TEST: "DIB6TH", STRAND: "DAZEINC", FIELD: "DAZE-INCORRECT"},
            {TEST: "DIB6TH", STRAND: "DAZEADJ", FIELD: "DAZE-ADJUSTED"},
            {TEST: "DIB6TH", STRAND: "TOT"    , FIELD: "COMPOSITE"},
            {TEST: "DIB6TH", STRAND: "NWF"    , FIELD: "NWF"},
            {TEST: "DIB6TH", STRAND: "NWFWRC"    , FIELD: "NWF-WRC"},
            {TEST: "DIB6TH", STRAND: "WRF"    , FIELD: "WRF"},
            {TEST: "DIB6TH", STRAND: "WUF"    , FIELD: "WUF"},
            {TEST: "DIB6TH", STRAND: "ORF"    , FIELD: "ORF"},
            {TEST: "DIB6TH", STRAND: "ORFWC"    , FIELD: "ORF-WORDSCORRECT"},
            {TEST: "DIB6TH", STRAND: "ORFERR"    , FIELD: "ORF-ERRORS"},
            {TEST: "DIB6TH", STRAND: "ORFACC"    , FIELD: "ORF-ACCURACY"},
            {TEST: "DIB6TH", STRAND: "ORFRT"    , FIELD: "ORF-RETELL"},
            {TEST: "DIB6TH", STRAND: "MAZE"    , FIELD: "MAZE"},
            {TEST: "DIB6TH", STRAND: "MAZEC"    , FIELD: "MAZE-CORRECT"},
            {TEST: "DIB6TH", STRAND: "MAZEINC"    , FIELD: "MAZE-INCORRECT"},
            {TEST: "DIB6TH", STRAND: "MAZEADJ"    , FIELD: "MAZE-ADJUSTED"}
        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeLevels =
        [
            {GRADE_CODE: "KG", FIELD: "K"},
            {GRADE_CODE: "01", FIELD: "1ST"},
            {GRADE_CODE: "02", FIELD: "2ND"},
            {GRADE_CODE: "03", FIELD: "3RD"},
            {GRADE_CODE: "04", FIELD: "4TH"},
            {GRADE_CODE: "05", FIELD: "5TH"},
            {GRADE_CODE: "06", FIELD: "6TH"},
            {GRADE_CODE: "07", FIELD: "7TH"},
            {GRADE_CODE: "08", FIELD: "8TH"}
        ];

    var perfLevels =
        {
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
            "Core^ Support": {
                TEST_PRIMARY_RESULT_CODE: "C^S",
                TEST_PRIMARY_RESULT: "Core^ Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "At Or Above Benchmark"
            },
            "--": {
                TEST_PRIMARY_RESULT_CODE: "--",
                TEST_PRIMARY_RESULT: "--",
                TEST_SECONDARY_RESULT_CODE: "--",
                TEST_SECONDARY_RESULT: "--"
            },
            "": {
                TEST_PRIMARY_RESULT_CODE: "--",
                TEST_PRIMARY_RESULT: "--",
                TEST_SECONDARY_RESULT_CODE: "--",
                TEST_SECONDARY_RESULT: "--"
            },
            "No Benchmark": {
                TEST_PRIMARY_RESULT_CODE: "NA",
                TEST_PRIMARY_RESULT: "NA",
                TEST_SECONDARY_RESULT_CODE: "NA",
                TEST_SECONDARY_RESULT: "NA"
            }
        };

    var assessPeriods =
            [
                {PERIOD_CODE: "BEG", FIELD: "BEGINNING"},
                {PERIOD_CODE: "MID", FIELD: "MIDDLE"},
                {PERIOD_CODE: "END", FIELD: "END"}
            ];

    var perfCutoffs = {
    "LNF_K_BEGINNING":
    [
    {"Min": "0","Max": "5", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "6","Max": "10", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "11","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "LNF_K_MIDDLE":
    [
    {"Min": "0","Max": "26", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "27","Max": "33", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "34","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "LNF_K_END":
    [
    {"Min": "0","Max": "41", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "42","Max": "46", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "47","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ISF_K_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ISF_K_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ISF_K_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "PSF_K_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "PSF_K_MIDDLE":
    [
    {"Min": "0","Max": "27", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "28","Max": "32", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "33","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "PSF_K_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "NWF-CLS_K_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "NWF-CLS_K_MIDDLE":
    [
    {"Min": "0","Max": "14", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "15","Max": "18", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "19","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-CLS_K_END":
    [
    {"Min": "0","Max": "34", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "35","Max": "38", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "39","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-WRC_K_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "NWF-WRC_K_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "NWF-WRC_K_END":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "1","Max": "2", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "3","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "WUF_K_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "WUF_K_MIDDLE":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "1","Max": "18", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "19","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "WUF_K_END":
    [
    {"Min": "0","Max": "23", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "24","Max": "36", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "37","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "LNF_1ST_BEGINNING":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "33","Max": "37", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "38","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "LNF_1ST_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "LNF_1ST_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "PSF_1ST_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "PSF_1ST_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "PSF_1ST_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "NWF-CLS_1ST_BEGINNING":
    [
    {"Min": "0","Max": "18", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "19","Max": "24", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "25","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-CLS_1ST_MIDDLE":
    [
    {"Min": "0","Max": "47", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "48","Max": "53", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "54","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-CLS_1ST_END":
    [
    {"Min": "0","Max": "61", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "62","Max": "70", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "71","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-WRC_1ST_BEGINNING":
    [
    {"Min": "0","Max": "0", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "1","Max": "1", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "2","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-WRC_1ST_MIDDLE":
    [
    {"Min": "0","Max": "2", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "3","Max": "9", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "10","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-WRC_1ST_END":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "5","Max": "12", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "13","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_1ST_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-WORDSCORRECT_1ST_MIDDLE":
    [
    {"Min": "0","Max": "12", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "13","Max": "18", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "19","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_1ST_END":
    [
    {"Min": "0","Max": "30", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "31","Max": "46", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "47","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_1ST_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-ACCURACY_1ST_MIDDLE":
    [
    {"Min": "0","Max": "63", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "64","Max": "77", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "78","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_1ST_END":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "81","Max": "90", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "91","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-RETELL_1ST_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-RETELL_1ST_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-RETELL_1ST_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "WUF_1ST_BEGINNING":
    [
    {"Min": "0","Max": "13", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "14","Max": "24", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "25","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "WUF_1ST_MIDDLE":
    [
    {"Min": "0","Max": "34", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "35","Max": "44", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "45","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "WUF_1ST_END":
    [
    {"Min": "0","Max": "37", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "38","Max": "46", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "47","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-CLS_2ND_BEGINNING":
    [
    {"Min": "0","Max": "51", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "52","Max": "61", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "62","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-CLS_2ND_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "NWF-CLS_2ND_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "NWF-WRC_2ND_BEGINNING":
    [
    {"Min": "0","Max": "4", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "5","Max": "12", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "13","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "NWF-WRC_2ND_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "NWF-WRC_2ND_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-WORDSCORRECT_2ND_BEGINNING":
    [
    {"Min": "0","Max": "27", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "28","Max": "40", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "41","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_2ND_MIDDLE":
    [
    {"Min": "0","Max": "54", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "55","Max": "75", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "76","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_2ND_END":
    [
    {"Min": "0","Max": "74", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "75","Max": "95", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "96","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_2ND_BEGINNING":
    [
    {"Min": "0","Max": "80", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "81","Max": "90", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "91","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_2ND_MIDDLE":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "92","Max": "96", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "97","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_2ND_END":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "98","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-RETELL_2ND_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-RETELL_2ND_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-RETELL_2ND_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "WUF_2ND_BEGINNING":
    [
    {"Min": "0","Max": "27", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "28","Max": "36", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "37","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "WUF_2ND_MIDDLE":
    [
    {"Min": "0","Max": "35", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "36","Max": "45", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "46","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "WUF_2ND_END":
    [
    {"Min": "0","Max": "39", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "40","Max": "49", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "50","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_3RD_BEGINNING":
    [
    {"Min": "0","Max": "56", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "57","Max": "71", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "72","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_3RD_MIDDLE":
    [
    {"Min": "0","Max": "75", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "76","Max": "88", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "89","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_3RD_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "97","Max": "109", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "110","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_3RD_BEGINNING":
    [
    {"Min": "0","Max": "91", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "92","Max": "95", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "96","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_3RD_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "94","Max": "97", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "98","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_3RD_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "99","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-RETELL_3RD_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-RETELL_3RD_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-RETELL_3RD_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "WUF_3RD_BEGINNING":
    [
    {"Min": "0","Max": "38", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "39","Max": "48", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "49","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "WUF_3RD_MIDDLE":
    [
    {"Min": "0","Max": "39", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "40","Max": "49", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "50","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "WUF_3RD_END":
    [
    {"Min": "0","Max": "32", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "33","Max": "41", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "42","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_4TH_BEGINNING":
    [
    {"Min": "0","Max": "65", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "66","Max": "85", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "86","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_4TH_MIDDLE":
    [
    {"Min": "0","Max": "83", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "84","Max": "102", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "103","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_4TH_END":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "94","Max": "113", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "114","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_4TH_BEGINNING":
    [
    {"Min": "0","Max": "90", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "91","Max": "95", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "96","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_4TH_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "98","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_4TH_END":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "98","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-RETELL_4TH_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-RETELL_4TH_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-RETELL_4TH_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-WORDSCORRECT_5TH_BEGINNING":
    [
    {"Min": "0","Max": "81", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "82","Max": "106", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "107","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_5TH_MIDDLE":
    [
    {"Min": "0","Max": "93", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "94","Max": "117", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "118","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_5TH_END":
    [
    {"Min": "0","Max": "104", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "105","Max": "126", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "127","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_5TH_BEGINNING":
    [
    {"Min": "0","Max": "94", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "95","Max": "97", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "98","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_5TH_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "99","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_5TH_END":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "97","Max": "98", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "99","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ERRORS_5TH_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-ERRORS_5TH_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-ERRORS_5TH_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-WORDSCORRECT_6TH_BEGINNING":
    [
    {"Min": "0","Max": "96", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "97","Max": "116", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "117","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_6TH_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "96","Max": "119", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "120","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-WORDSCORRECT_6TH_END":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "96","Max": "121", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "122","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_6TH_BEGINNING":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "98","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_6TH_MIDDLE":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "96","Max": "97", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "98","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ACCURACY_6TH_END":
    [
    {"Min": "0","Max": "95", "Test_Primary": "Intensive Support", "Test_Secondary": "Well Below Benchmark"},
    {"Min": "96","Max": "98", "Test_Primary": "Strategic Support", "Test_Secondary": "Below Benchmark"},
    {"Min": "99","Max": "1000", "Test_Primary": "Core Support", "Test_Secondary": "At or Above Benchmark"}
    ],
    "ORF-ERRORS_6TH_BEGINNING":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-ERRORS_6TH_MIDDLE":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
    ],
    "ORF-ERRORS_6TH_END":
    [
    {"Min": "0","Max": "1000", "Test_Primary": "No Benchmark", "Test_Secondary": "No Benchmark"}
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
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];
        var year = "";
        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        gradeLevels.forEach(function(gradeLevel) {
            if (row.getField("YEAR_${gradeLevel.FIELD}") !== null && row.getField("YEAR_${gradeLevel.FIELD}") !== "") {
                 year = row.getField("YEAR_${gradeLevel.FIELD}");
                 assessPeriods.forEach(function(assessPeriod) {
                    var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year, assessPeriod);
                    AppUtil.nullSafePush(normalizedRecords, record);
            })
            }


            else if (row.getField("YEAR") !== null && row.getField("YEAR") !==""){
               year = row.getField("YEAR");
               for(var i=0; i<assessPeriods.length; i++){
                   var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year,assessPeriods[i],i);
                   AppUtil.nullSafePush(normalizedRecords, record);
            }
            }

        });

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

    function mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year, assessPeriod,assessPeriodIndex) {
        var record = {};
        var mappingObject = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];
        //var assessPeriod = getAssesssPeriod(row);


        record = mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, year, assessPeriod,assessPeriodIndex);

        strandsAndFields.forEach(function(strandsAndField) {
            var assessmentCode = "${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}";
            var score = row.getField("${assessmentCode}");
            var performanceCode = _util.coalesce(row.getField("BENCHMARK_STATUS_${assessmentCode}"), "--");
            var dateField = _util.coalesce(row.getField("DATE_${assessmentCode}"), "--");
            var test_result_1 = '--';
            var test_result_2 = '--';

            if(score !== null && score !== ""){
                if(performanceCode == '--' & assessmentCode in perfCutoffs) {
                var temp = perfCutoffs[assessmentCode];
                temp.forEach(item => {
                    if((score >= parseInt(item['Min']) && score <= parseInt(item['Max'])) ||
                    (score >= parseInt(item['Min']) && item['Max'] === '')){
                        test_result_1 = item['Test_Primary'];
                        test_result_2 = item['Test_Secondary'];
                    }
                });
                }
            }

            if(score !== null && performanceCode !== '--'){
                let scoreMapping = {
                    "TEST_NUMBER" : "${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}",
                    "TEST_SCORE_VALUE" : score,
                    "TEST_SCORE_TEXT" : score,
                    "TEST_PERCENTILE_SCORE": isNaN(row.getField("DISTRICT_PERCENTILE_${assessmentCode}")) ? null : row.getField("DISTRICT_PERCENTILE_${assessmentCode}"),
                    "TEST_PRIMARY_RESULT_CODE" : perfLevels[performanceCode].TEST_PRIMARY_RESULT_CODE,
                    "TEST_PRIMARY_RESULT" : performanceCode,
                    "TEST_SECONDARY_RESULT_CODE" : perfLevels[performanceCode].TEST_SECONDARY_RESULT_CODE,
                    "TEST_SECONDARY_RESULT" : perfLevels[performanceCode].TEST_SECONDARY_RESULT,
                    "TEST_TERTIARY_RESULT" : isNaN(row.getField("NATIONAL_DDS_PERCENTILE_${assessmentCode}")) ? null : row.getField("NATIONAL_DDS_PERCENTILE_${assessmentCode}"),
                    "TEST_QUATERNARY_RESULT": isNaN(row.getField("SCHOOL_PERCENTILE_${assessmentCode}")) ? null : row.getField("SCHOOL_PERCENTILE_${assessmentCode}"),
                    "TEST_SCORE_ATTRIBUTES" : dateField
                };
                mappingObject.SCORE_MAPPINGS.push(scoreMapping);
            } else if(score !== null && performanceCode === '--'){
                let scoreMapping = {
                    "TEST_NUMBER" : "${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}",
                    "TEST_SCORE_VALUE" : score,
                    "TEST_SCORE_TEXT" : score,
                    "TEST_PERCENTILE_SCORE": isNaN(row.getField("DISTRICT_PERCENTILE_${assessmentCode}")) ? null : row.getField("DISTRICT_PERCENTILE_${assessmentCode}"),
                    "TEST_PRIMARY_RESULT_CODE" : perfLevels[test_result_1].TEST_PRIMARY_RESULT_CODE,
                    "TEST_PRIMARY_RESULT" : test_result_1,
                    "TEST_SECONDARY_RESULT_CODE" : perfLevels[test_result_1].TEST_SECONDARY_RESULT_CODE,
                    "TEST_SECONDARY_RESULT" : test_result_2,
                    "TEST_TERTIARY_RESULT" : isNaN(row.getField("NATIONAL_DDS_PERCENTILE_${assessmentCode}")) ? null : row.getField("NATIONAL_DDS_PERCENTILE_${assessmentCode}"),
                    "TEST_QUATERNARY_RESULT": isNaN(row.getField("SCHOOL_PERCENTILE_${assessmentCode}")) ? null : row.getField("SCHOOL_PERCENTILE_${assessmentCode}"),
                    "TEST_SCORE_ATTRIBUTES" : dateField
                };
                mappingObject.SCORE_MAPPINGS.push(scoreMapping);
            }

        });


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
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
            }
        });

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = mappingObject;
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
    function mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, year, assessPeriod) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var testDateObject = parseTestDate(row.getField("ASSESSMENT_DATES"));
        var schoolInfo = row.getField("SCHOOL_${gradeLevel.FIELD}");
        if(undefined ===row.getField("SCHOOL_${gradeLevel.FIELD}")||null ===row.getField("SCHOOL_${gradeLevel.FIELD}")){
            var schoolName = row.getField("SCHOOL_NAME");
            var schoolCode = null;
        }
        else{
            var schoolName = schoolInfo.substring(0, schoolInfo.lastIndexOf(" "));
            var schoolCode = schoolInfo.substr(schoolInfo.lastIndexOf(" ") + 1);
        }
        var tad = _util.coalesce(testDateObject.STANDARD_DATE, getTEST_ADMIN_DATE_STR(assessPeriod, year));

        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, gradeLevel, assessPeriod, tad);
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
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(assessPeriod);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, getTEST_ADMIN_DATE_STR(assessPeriod, year));
                    break;
                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("SECONDARY_ID"), row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("SECONDARY_ID"),row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeLevel.GRADE_CODE;
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

                //School Information
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = schoolName;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = schoolCode;
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = schoolCode;
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

    function getTEST_ADMIN_PERIOD(assessPeriod) {

        var period = null;

        switch (assessPeriod.FIELD) {
            case "BEGINNING":
                period = "Beginning";
                break;

            case "MIDDLE":
                period = "Middle";
                break;
            case "END":
                period = "End";
                break;
            case "PMON":
                period = "Pmon";
                break;
        }

        return period;
    }


    function getTEST_ADMIN_DATE_STR(assessPeriod, year) {
        var date = null;
        //return "01/01/1900";
        switch (assessPeriod.FIELD) {

            case "BEGINNING":
                date = "10/15/${year}";
                break;
            case "MIDDLE":
                year = parseInt(year) + 1;
                date = "01/15/${year}";
                break;
            case  "END":
                year = parseInt(year) + 1;
                date = "04/15/${year}";
            break;
}
        return date;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

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
    function groupAssessmentByNaturalKey(signature, hierarchy, one, two, gradeLevel, assessPeriod) {
        try {
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);

            if(assessmentAdminKey_one === assessmentAdminKey_two) {
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, gradeLevel, assessPeriod, tad) {

        var assessmentAdminKey = null;
        // Set base assessment admin key information
        if(assessPeriod===undefined){
             assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${tad}";
        }
        else{
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${assessPeriod.FIELD}_${tad}";
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

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

        if ((rawDate.length === 8))
        {
            var formatter = new java.text.SimpleDateFormat("yyyyMMdd");
        }
        else {
            var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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



    return module;
}());