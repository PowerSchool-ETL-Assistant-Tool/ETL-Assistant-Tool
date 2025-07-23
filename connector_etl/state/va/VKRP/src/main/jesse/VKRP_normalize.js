var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "VKRP";
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


//    module.createNormalizedFile = function(file, signature) {
//		try {
//
//			var signatureFormatName = signature.getFormat().getFormatName();
//			print("Loading using signature file ${signatureFormatName}\n");
//
//
//			//Initialize path and lineage variables.
//			var normalizedFile = AppUtil.createResultsFile(file);
//
//			print("Normalized file: ${normalizedFile}\n");
//
//			var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
//			var lineNumber = 0;			const fileFullName = file.getFullName();
//
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
//
//					try {
//						var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
//						var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
//
//						return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
//					} catch(exception) {
//						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
//					}
//
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
//			return normalizedFile;
//
//		} catch(exception) {
//			throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
//		}
//    };


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
                    /*if (typeof record === 'object') {
                        for (let key in record) {
                            if (typeof record[key] === 'string') {
                                record[key] = _util.trim(record[key]);
                            }
                        }
                    }*/

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
			return normalizedFile;
		} catch(exception) {
			throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
		}
    };

    /***************************************************************************
     Utility Functions
     ***************************************************************************/
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
    module.mergeAssessment = function(file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

     //update scoresToMap
    var scoresToMap = [
        // Refer UIHN-28263
        // E → English (In Person Score), _SP → Spanish (In Person), _SpR → Spanish Remote Test, _R → English Remote, _S → Spanish
        {TEST: "VKRP", CODE:"CBRS_SR", FIELD: "CBRS_SELF_REGULATION", MAP_FUNCTION: mapCBRSScore}
        ,{TEST: "VKRP", CODE:"CBRS_SS", FIELD: "CBRS_SOCIAL_SKILLS", MAP_FUNCTION: mapCBRSScore}
        ,{TEST: "VKRP", CODE:"CBRS_WB", FIELD: "CBRS_WELL_BEING", MAP_FUNCTION: mapCBRSScore}
        ,{TEST: "VKRP", CODE:"CBRS_DSR", FIELD: "CBRS_DOMAIN_SELFREGULATION", MAP_FUNCTION: mapCBRSScore}
        ,{TEST: "VKRP", CODE:"CBRS_DSS", FIELD: "CBRS_DOMAIN_SOCIALSKILLS", MAP_FUNCTION: mapCBRSScore}
        ,{TEST: "VKRP", CODE:"E_OVR", FIELD: "E_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_HI", FIELD: "EMAS_HIGHEST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_GEO", FIELD: "EMAS_GEOMETRY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_PTRN", FIELD: "EMAS_PATTERNING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_NUM", FIELD: "EMAS_NUMERACY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_COMP", FIELD: "EMAS_COMPUTATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_TOT", FIELD: "EMAS_TOTAL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS", FIELD: "EMAS_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_E_GEO", FIELD: "EMAS_E_GEOMETRY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_E_PTRN", FIELD: "EMAS_E_PATTERNING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_E_NUM", FIELD: "EMAS_E_NUMERACY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_E_COMP", FIELD: "EMAS_E_COMPUTATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_E_TOT", FIELD: "EMAS_E_TOTAL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_E", FIELD: "EMAS_E_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_E_HI", FIELD: "EMAS_E_HIGHEST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"DOM_SR", FIELD: "DOMAIN_SELF_REGULATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"DOM_SS", FIELD: "DOMAIN_SOCIAL_SKILLS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"DOM_WB", FIELD: "DOMAIN_WELL_BEING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"DOM_HI", FIELD: "DOMAIN_HIGHEST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EDOM_GEO", FIELD: "E_DOMAIN_GEOMETRY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EDOM_PTRN", FIELD: "E_DOMAIN_PATTERNING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EDOM_NUM", FIELD: "E_DOMAIN_NUMERACY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EDOM_COMP", FIELD: "E_DOMAIN_COMPUTATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EDOM_MA", FIELD: "E_DOMAIN_MATH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"RDOM_MA2", FIELD: "R_DOMAIN_MATH2", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"RDOM", FIELD: "R_DOMAIN_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"RDOM_MA", FIELD: "R_DOMAIN_MATH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"SDOM_GEO", FIELD: "S_DOMAIN_GEOMETRY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"SDOM_PTRN", FIELD: "S_DOMAIN_PATTERNING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"SDOM_NUM", FIELD: "S_DOMAIN_NUMERACY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"SDOM_COMP", FIELD: "S_DOMAIN_COMPUTATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"SDOM", FIELD: "S_DOMAIN_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"SDOM_MA", FIELD: "S_DOMAIN_MATH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"SRDOM_MA", FIELD: "SR_DOMAIN_MATH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_R_GEO", FIELD: "EMAS_R_GEOMETRY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_R_PTRN", FIELD: "EMAS_R_PATTERNING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_R_NUM", FIELD: "EMAS_R_NUMERACY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_R_COMP", FIELD: "EMAS_R_COMPUTATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_R_TOT", FIELD: "EMAS_R_TOTAL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_R", FIELD: "EMAS_R_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_R_HI", FIELD: "EMAS_R_HIGHEST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SP_GEO", FIELD: "EMAS_SP_GEOMETRY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SP_PTRN", FIELD: "EMAS_SP_PATTERNING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SP_NUM", FIELD: "EMAS_SP_NUMERACY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SP_COMP", FIELD: "EMAS_SP_COMPUTATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SP_TOT", FIELD: "EMAS_SP_TOTAL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SP", FIELD: "EMAS_SP_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SP_HI", FIELD: "EMAS_SP_HIGHEST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SPR_GEO", FIELD: "EMAS_SPR_GEOMETRY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SPR_PTRN", FIELD: "EMAS_SPR_PATTERNING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SPR_NUM", FIELD: "EMAS_SPR_NUMERACY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SPR_COMP", FIELD: "EMAS_SPR_COMPUTATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SPR_TOT", FIELD: "EMAS_SPR_TOTAL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SPR", FIELD: "EMAS_SPR_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SPR_HI", FIELD: "EMAS_SPR_HIGHEST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_S_HI", FIELD: "EMAS_S_HIGHEST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "VKRP", CODE:"EMAS_SR_HI", FIELD: "EMAS_SR_HIGHEST", MAP_FUNCTION: mapScaledScore}

   ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //add any additional decodes
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
        "PK": "PK",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
       "Adv" : "Advanced"
       , "Advanced" : "Advanced"
       ,"Bas" : "Basic"
       ,"Basic" : "Basic"
       ,"Bel" : "Below Basic"
       ,"Below Basic" : "Below Basic"
       ,"Pro" : "Proficient"
       ,"Proficient" : "Proficient"
       ,"" : null
       ,null : null
      };

    var domainDecode = {
        "1" :  {CODE: "AB", DESC: "At or Above Benchmark"}
        ,"0" : {CODE: "BB", DESC: "Below Benchmark"}
        ,"Growing" : {CODE: "G", DESC: "Growing"}
        ,"Beginning" : {CODE: "B", DESC: "Beginning"}
        ,"Strong" : {CODE: "S", DESC: "Strong"}
        ,"" : {CODE: null, DESC: null}
        ,null : {CODE: null, DESC: null}
      };

    var passDecode = {
       "Adv" : "Yes"
       ,"Advanced" : "Yes"
       ,"Bas" : "No"
       ,"Basic" : "No"
       ,"Bel" : "No"
       ,"Below Basic" : "No"
       ,"Pro" : "Yes"
       ,"Proficient" : "Yes"
       ,"0" : "No"
       ,"1" : "Yes"
       ,"" : null
       ,null : null
      };

    var concernDecode = {
       "1" : "Not At All"
       ,"2" : "Slightly"
       ,"3" : "Moderately"
       ,"4" : "Very"
       ,"5" : "Extremely"
       ,"1.0" : "Not At All"
       ,"2.0" : "Slightly"
       ,"3.0" : "Moderately"
       ,"4.0" : "Very"
       ,"5.0" : "Extremely"
       ,"" : null
       ,null : null
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

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature, hierarchy);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
    function getPeriodFromFilename(row, hierarchy){
        var period = null;
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        if(fileName.indexOf('FALL')> -1){
           period = 'Fall';
        } else if(fileName.indexOf('WINTER')> -1){
            period = 'Winter';
        } else if(fileName.indexOf('SPRING')> -1){
            period = 'Spring';
        } else {
            period = hierarchy.REPORTING_PERIOD
        }

        return period;
    }
    /**
     * Maps normalized administration fields based on a given set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
                                RAW_DATE : null
                                , MONTH : null
                                , DAY : null
                                , YEAR : null
                                , STANDARD_DATE : null
        }

        var birthDate = _util.coalesce(row.getField("BIRTHDATE"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        var periodFromFileName = getPeriodFromFilename(row, hierarchy);
        var periodFromFile = _util.coalesce(row.getField("ASSESSMENT_PERIOD"), periodFromFileName);
        var period = parsePeriod(periodFromFile, hierarchy);

        var cbrsDate = row.getField("CBRS_ASSESSMENT_DATE");
        var emasDate = _util.coalesce(row.getField("EMAS_ASSESSMENT_DATE"), row.getField("EMAS_E_ASSESSMENT_DATE"));
        var testDate = parseTestDate(cbrsDate, emasDate, period, hierarchy);
        var grade = gradeFromFileName(row);

        normalizedFileFields.forEach(function (field) {
            switch(field) {
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
                    record.REPORTING_PERIOD = period;
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

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                    );
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
                    record.STUDENT_GENDER_CODE = _util.coalesce(_util.trim(row.getField("GENDER")), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField('GRADE'), grade)];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
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

    function parsePeriod(period, hierarchy) {
        if(period) {
            period = period.toUpperCase()
            if(period.indexOf("FALL")>-1){
                period = "Fall";
            } else if(period.indexOf("SPRING")>-1) {
                period = "Spring";
            } else if(period.indexOf("WINTER")>-1) {
                period = "Winter";
            } else {
                period = hierarchy.REPORTING_PERIOD;
            }
        } else {
            period = hierarchy.REPORTING_PERIOD;
        }
        return period;
    }

    function parseTestDate(cbrsDate, emasDate, period, hierarchy) {
        var testDate; var dates = [];

        if(cbrsDate !== null && cbrsDate !== undefined) {
            dates.push(new Date(cbrsDate));
        }
        if(emasDate !== null && emasDate !== undefined) {
            dates.push(new Date(emasDate));
        }

        var maxDate = new Date(Math.max.apply(null,dates)).toLocaleDateString('en-US');

        if(maxDate !== null && maxDate !== undefined && maxDate !== "Invalid Date") {
            testDate = AppUtil.getMonthFollowedByDay(maxDate).STANDARD_DATE;
        }
        else {
            if(period === "Fall") {
                testDate = "09/15/"+hierarchy.SCHOOL_YEAR.substring(0,4);
            } else if(period === "Winter") {
                testDate = "01/15/"+hierarchy.SCHOOL_YEAR.substring(5,9);
            } else {
                testDate = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9);
            }
        }
        return testDate;
    }

    function gradeFromFileName(row) {
        var grade = null
         var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
         var flName =  fileName.substring(fileName.lastIndexOf('/')+1);
        if((flName.indexOf('PREK') > -1) || (flName.indexOf('PRE-K') > -1) || (flName.indexOf('PRE_K') > -1)){
            grade = 'PK';
        } else {
            grade = 'KG';
        }
        return grade;
    }
    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(row) {
        //add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        }
        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    function getColorCode(row, signature, hierarchy, testMetadata, val){
        var colorCode = null;
        var color = null;
        var value = val;
        var gradeObj = null;
        var gradeObj = gradeFromFileName(row);
        var grade = gradeDecode[_util.coalesce(row.getField('GRADE'), gradeObj)];
        var periodFromFileName = getPeriodFromFilename(row, hierarchy);
        var periodFromFile = _util.coalesce(row.getField("ASSESSMENT_PERIOD"), periodFromFileName);
        var period = parsePeriod(periodFromFile, hierarchy);

        if(grade=== 'KG'){
            if(testMetadata.CODE.indexOf('_SR')> -1){
                if(period=== 'Fall'){
                    if(value>='0' && value<='2.89'){
                        color = 'Red';
                        colorCode = 'R';
                    }else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
                else if(period=== 'Spring'){
                    if(value>='0' && value<='3.19'){
                        color = 'Red';
                        colorCode = 'R';
                    }else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
            } else if(testMetadata.CODE.indexOf('_SS')> -1){
                if(period=== 'Fall'){
                    if(value>='0' && value<='3.70'){
                        color = 'Red';
                        colorCode = 'R';
                    }else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
                else if(period=== 'Spring'){
                    if(value>='0' && value<='3.99'){
                        color = 'Red';
                        colorCode = 'R';
                    }else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
            } else if(testMetadata.CODE=== 'EMAS_E_TOT' || testMetadata.CODE=== 'EMAS_TOT' || testMetadata.CODE=== 'EDOM_MA' || testMetadata.CODE=== 'SDOM_MA'){
                if(period=== 'Fall'){
                    if(value>='0' && value<='14'){
                        color = 'Red';
                        colorCode = 'R';
                    }else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
                else if(period=== 'Spring'){
                    if(value>='0' && value<='23'){
                        color = 'Red';
                        colorCode = 'R';
                    }else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
            } else if(testMetadata.CODE=== 'RDOM_MA' || testMetadata.CODE=== 'RDOM_MA2' || testMetadata.CODE=== 'SRDOM_MA'){
                if(period=== 'Fall'){
                    if(value>='0' && value<='6'){
                        color = 'Red';
                        colorCode = 'R';
                    }else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
                else if(period=== 'Spring'){
                    if(value>='0' && value<='12'){
                        color = 'Red';
                        colorCode = 'R';
                    }else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
            }
        } else if(grade=== 'PK'){
            if(testMetadata.CODE.indexOf('_SR')> -1){
                if(period=== 'Fall'){
                    if(value>='1' && value<='2.30'){
                        color = 'Red';
                        colorCode = 'R';
                    } else if(value>='2.31' && value<='2.90'){
                        color = 'Yellow';
                        colorCode = 'Y';
                    } else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
                else if(period=== 'Spring'){
                    if(value>='1' && value<='2.99'){
                        color = 'Red';
                        colorCode = 'R';
                    } else if(value>='3.00' && value<='4.09'){
                        color = 'Yellow';
                        colorCode = 'Y';
                    } else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
            } else if(testMetadata.CODE.indexOf('_SS')> -1){
                if(period=== 'Fall'){
                    if(value>='1' && value<='2.70'){
                        color = 'Red';
                        colorCode = 'R';
                    } else if(value>='2.71' && value<='3.70'){
                        color = 'Yellow';
                        colorCode = 'Y';
                    } else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
                else if(period=== 'Spring'){
                    if(value>='1' && value<='3.79'){
                        color = 'Red';
                        colorCode = 'R';
                    } else if(value>='3.80' && value<='4.59'){
                        color = 'Yellow';
                        colorCode = 'Y';
                    } else {
                        color = 'Green';
                        colorCode = 'G';
                    }
                }
            }
         }

        return{
            color: color,
            colorCode: colorCode
        };
    }
    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapCBRSScore(row, testMetadata, signature,hierarchy) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = _util.trim(row.getField(testMetadata.FIELD));
        //var benchmarkMet = _util.trim(row.getField(testMetadata.FIELD + "_MET")); it will come from benchmarks.
        var concernLevel = row.getField("CBRS_TEACHER_CONCERN_LEVEL");
        var colorCode = getColorCode(row, signature, hierarchy, testMetadata, scaleScore);
        var tercileRange = row.getField(testMetadata.FIELD + "_TR")

         // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
        (tercileRange === null || tercileRange === undefined || _util.trim(tercileRange) === "--" || _util.trim(tercileRange) === "")) {

            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_CUSTOM_RESULT"] = colorCode.color;
        score["TEST_CUSTOM_RESULT_CODE"] = colorCode.colorCode;
        score["TEST_SECONDARY_RESULT_CODE"] = concernLevel;
        score["TEST_SECONDARY_RESULT"] = concernDecode[concernLevel];
        score["TEST_PRIMARY_RESULT_CODE"] = domainDecode[tercileRange].CODE;
        score["TEST_PRIMARY_RESULT"] = tercileRange;
    	//score["TEST_PASSED_INDICATOR"] = passDecode[benchmarkMet];

        return score;
    }

    function mapScaledScore(row, testMetadata, signature, hierarchy) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = _util.trim(row.getField(testMetadata.FIELD + "SCALED_SCORE"));
        var rawScore = _util.trim(row.getField(testMetadata.FIELD));
        var benchmarkMet = _util.coalesce(_util.trim(row.getField(testMetadata.FIELD + "_MET")),(row.getField("EMAS_" + testMetadata.FIELD + "_TR")));
        var concernLevel = row.getField("TEACHER_CONCERN_LEVEL");
        var colorCode = getColorCode(row, signature, hierarchy, testMetadata, rawScore);

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""))
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if((testMetadata.CODE.indexOf('DOM')> -1)
            || (testMetadata.CODE.indexOf('GEO')> -1)
            || (testMetadata.CODE.indexOf('PTRN')> -1)
            || (testMetadata.CODE.indexOf('NUM')> -1)
            || (testMetadata.CODE.indexOf('COMP')> -1))
        {
            score["TEST_PRIMARY_RESULT_CODE"] = domainDecode[benchmarkMet].CODE;
            score["TEST_PRIMARY_RESULT"] = domainDecode[benchmarkMet].DESC;
        }
        score["TEST_PASSED_INDICATOR"] = passDecode[benchmarkMet];
        score["TEST_CUSTOM_RESULT"] = colorCode.color;
        score["TEST_CUSTOM_RESULT_CODE"] = colorCode.colorCode;
        score["TEST_SECONDARY_RESULT_CODE"] = concernLevel;
        score["TEST_SECONDARY_RESULT"] = concernDecode[concernLevel];
        if(!isNaN(rawScore)){
            score["TEST_RAW_SCORE"] = rawScore;
            if(scaleScore === null){
                score["TEST_SCORE_VALUE"] = rawScore;
                score["TEST_SCORE_TEXT"] = rawScore;
            }
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        var periodFromFileName = getPeriodFromFilename(srcRecord, hierarchy);
        var period = _util.coalesce(srcRecord.getField("ASSESSMENT_PERIOD"), periodFromFileName);
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        assessmentAdminKey += "_" + parsePeriod(period, hierarchy);
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());