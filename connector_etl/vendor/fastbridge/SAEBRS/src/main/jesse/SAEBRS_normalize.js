var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "SAEBRS";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;
    /**
    *
    * Admin period values to generate separate admin keys
    */
    var adminPeriods = [
        "Fall",
        "Winter",
        "Spring",
        "Summer"
    ];

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
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


    /*module.createNormalizedFile = function(file, signature) {
        try {
            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");

            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();

            _dataflow.create("RECORD BUILD")
                .input("INPUT", AppUtil.getInputDataflow(file, signature))
                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {

                    json.LINEAGE_FILE = fileFullName;
                    json.LINEAGE_LINE = (++lineNumber).toString();
                    output.RECORDS.put(json);
                })
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try{
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function(output, rows) {
                    try{
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;
        } catch(exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };*/


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
    var scoresToMap =
        [
           {TEST: "SAEBRS", CODE:"Fall_TEA_SEBA", FORMAT: "TEACHER", FIELD: "FALL_SAEBRS_TEACHER_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "SAEBRS", CODE:"Fall_STU_SEBA", FORMAT: "STUDENT", FIELD: "FALL_SAEBRS_STUDENT_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "SAEBRS", CODE:"Winter_TEA_SEBA", FORMAT: "TEACHER", FIELD: "WINTER_SAEBRS_TEACHER_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "SAEBRS", CODE:"Winter_STU_SEBA", FORMAT: "STUDENT", FIELD: "WINTER_SAEBRS_STUDENT_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "SAEBRS", CODE:"Spring_TEA_SEBA", FORMAT: "TEACHER", FIELD: "SPRING_SAEBRS_TEACHER_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "SAEBRS", CODE:"Spring_STU_SEBA", FORMAT: "STUDENT", FIELD: "SPRING_SAEBRS_STUDENT_", MAP_FUNCTION: mapScaledScore}

           // New DBR Score
           ,{TEST: "SAEBRS", CODE:"FALL_DBR_SEBA", FORMAT: "DBR", FIELD: "FALL_SAEBRS_DBR_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "SAEBRS", CODE:"WINTER_DBR_SEBA", FORMAT: "DBR", FIELD: "WINTER_SAEBRS_DBR_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "SAEBRS", CODE:"SPRING_DBR_SEBA", FORMAT: "DBR", FIELD: "SPRING_SAEBRS_DBR_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "SAEBRS", CODE:"SUMMER_DBR_SEBA", FORMAT: "DBR", FIELD: "SUMMER_SAEBRS_DBR_", MAP_FUNCTION: mapScaledScore}

           //same deal as Early_Reading regarding labeling LOGICAL_NAMEs?
           , {TEST: "SAEBRS", CODE:"WINTER_TEA_FW", FORMAT: "TEACHER", FIELD: "WINTER_SAEBRS_TEACHER_", FIELD_2: "_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SPRING_TEA_FS", FORMAT: "TEACHER", FIELD: "SPRING_SAEBRS_TEACHER_", FIELD_2: "_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SPRING_TEA_WS", FORMAT: "TEACHER", FIELD: "SPRING_SAEBRS_TEACHER_", FIELD_2: "_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"WINTER_STU_FW", FORMAT: "STUDENT", FIELD: "WINTER_SAEBRS_STUDENT_", FIELD_2: "_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SPRING_STU_FS", FORMAT: "STUDENT", FIELD: "SPRING_SAEBRS_STUDENT_", FIELD_2: "_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SPRING_STU_WS", FORMAT: "STUDENT", FIELD: "SPRING_SAEBRS_STUDENT_", FIELD_2: "_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore}

           //NEW Growth Score
           , {TEST: "SAEBRS", CODE:"WINTER_DBR_FW", FORMAT: "DBR", FIELD_2: "_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SPRING_DBR_FS", FORMAT: "DBR", FIELD_2: "_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SUMMER_DBR_FSU", FORMAT: "DBR", FIELD_2: "_FROM_FALL_TO_SUMMER", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SPRING_DBR_WS", FORMAT: "DBR", FIELD_2: "_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SUMMER_DBR_WSU", FORMAT: "DBR", FIELD_2: "_FROM_WINTER_TO_SUMMER", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "SAEBRS", CODE:"SUMMER_DBR_SSU", FORMAT: "DBR", FIELD_2: "_FROM_SPRING_TO_SUMMER", MAP_FUNCTION: mapGrowthScore}

           ,{TEST: "SAEBRS", CODE:"Fall_TEA_SEBA_SOCIAL", FORMAT: "TEACHER", FIELD: "FALL_SAEBRS_TEACHER_SEBA_SAEBRS_",  FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Fall_STU_SEBA_SOCIAL", FORMAT: "STUDENT", FIELD: "FALL_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Fall_TEA_SEBA_EMOTIONAL", FORMAT: "TEACHER", FIELD: "FALL_SAEBRS_TEACHER_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Fall_STU_SEBA_EMOTIONAL", FORMAT: "STUDENT", FIELD: "FALL_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Fall_TEA_SEBA_ACADEMICS", FORMAT: "TEACHER", FIELD: "FALL_SAEBRS_TEACHER_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Fall_STU_SEBA_ACADEMICS", FORMAT: "STUDENT", FIELD: "FALL_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}

           ,{TEST: "SAEBRS", CODE:"Winter_TEA_SEBA_SOCIAL", FORMAT: "TEACHER", FIELD: "WINTER_SAEBRS_TEACHER_SEBA_SAEBRS_",  FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Winter_STU_SEBA_SOCIAL", FORMAT: "STUDENT", FIELD: "WINTER_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Winter_TEA_SEBA_EMOTIONAL", FORMAT: "TEACHER", FIELD: "WINTER_SAEBRS_TEACHER_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Winter_STU_SEBA_EMOTIONAL", FORMAT: "STUDENT", FIELD: "WINTER_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Winter_TEA_SEBA_ACADEMICS", FORMAT: "TEACHER", FIELD: "WINTER_SAEBRS_TEACHER_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Winter_STU_SEBA_ACADEMICS", FORMAT: "STUDENT", FIELD: "WINTER_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}

           ,{TEST: "SAEBRS", CODE:"Spring_TEA_SEBA_SOCIAL", FORMAT: "TEACHER", FIELD: "SPRING_SAEBRS_TEACHER_SEBA_SAEBRS_", FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Spring_STU_SEBA_SOCIAL", FORMAT: "STUDENT", FIELD: "SPRING_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Spring_TEA_SEBA_EMOTIONAL", FORMAT: "TEACHER", FIELD: "SPRING_SAEBRS_TEACHER_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Spring_STU_SEBA_EMOTIONAL", FORMAT: "STUDENT", FIELD: "SPRING_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Spring_TEA_SEBA_ACADEMICS", FORMAT: "TEACHER", FIELD: "SPRING_SAEBRS_TEACHER_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"Spring_STU_SEBA_ACADEMICS", FORMAT: "STUDENT", FIELD: "SPRING_SAEBRS_STUDENT_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}

           //New DBR ITEM Scores
           ,{TEST: "SAEBRS", CODE:"FALL_DBR_SEBA_ACADEMICS", FORMAT: "DBR", FIELD: "FALL_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"FALL_DBR_SEBA_EMOTIONAL", FORMAT: "DBR", FIELD: "FALL_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"FALL_DBR_SEBA_SOCIAL", FORMAT: "DBR", FIELD: "FALL_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}

           ,{TEST: "SAEBRS", CODE:"WINTER_DBR_SEBA_ACADEMICS", FORMAT: "DBR", FIELD: "WINTER_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"WINTER_DBR_SEBA_EMOTIONAL", FORMAT: "DBR", FIELD: "WINTER_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"WINTER_DBR_SEBA_SOCIAL", FORMAT: "DBR", FIELD: "WINTER_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}

           ,{TEST: "SAEBRS", CODE:"SPRING_DBR_SEBA_ACADEMICS", FORMAT: "DBR", FIELD: "SPRING_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"SPRING_DBR_SEBA_EMOTIONAL", FORMAT: "DBR", FIELD: "SPRING_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"SPRING_DBR_SEBA_SOCIAL", FORMAT: "DBR", FIELD: "SPRING_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}

           ,{TEST: "SAEBRS", CODE:"SUMMER_DBR_SEBA_ACADEMICS", FORMAT: "DBR", FIELD: "SUMMER_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "ACADEMIC", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"SUMMER_DBR_SEBA_EMOTIONAL", FORMAT: "DBR", FIELD: "SUMMER_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "EMOTIONAL", MAP_FUNCTION: mapItemsScore}
           ,{TEST: "SAEBRS", CODE:"SUMMER_DBR_SEBA_SOCIAL", FORMAT: "DBR", FIELD: "SUMMER_SAEBRS_DBR_SEBA_SAEBRS_", FIELD_2: "SOCIAL", MAP_FUNCTION: mapItemsScore}

        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
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
    var primaryDecode = {
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
//        // Map a normalized record for different period
//        adminPeriods.forEach(function(period){
//            var record = mapNormalizedRecord(signature, hierarchy, row, period);
//            AppUtil.nullSafePush(normalizedRecords, record);
//        });
        for(var i=0; i<adminPeriods.length; i++) {
            var record = mapNormalizedRecord(signature, hierarchy, row, adminPeriods[i], i);
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
    function mapNormalizedRecord(signature, hierarchy, row, period, periodIndex) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, period, periodIndex);
        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature, period, periodIndex);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = parseDate(row.getField("STUDENT_BIRTHDATE"));
        if(row.getField("ASSESSMENT") === "SAEBRS Student") {
            var springDate =row.getField("SPRING_SAEBRS_STUDENT_FINAL_DATE");
            var winterDate = row.getField("WINTER_SAEBRS_STUDENT_FINAL_DATE");
            var fallDate = row.getField("FALL_SAEBRS_STUDENT_FINAL_DATE");
            var recentDate = springDate;
            if(period === "Fall"){
                recentDate = fallDate;
            }else if(period === "Winter") {
                recentDate = winterDate;
            }else if(period === "Spring") {
                recentDate = springDate
            }
        }else if(row.getField("ASSESSMENT") === "SAEBRS DBR") {
            var springDate =row.getField("SPRING_SAEBRS_DBR_FINAL_DATE");
            var winterDate = row.getField("WINTER_SAEBRS_DBR_FINAL_DATE");
            var fallDate = row.getField("FALL_SAEBRS_DBR_FINAL_DATE");
            var summerDate = row.getField("SUMMER_SAEBRS_DBR_FINAL_DATE");
            //var screeningDate = row.getField("SCREENING_PERIOD_5_SAEBRS_DBR_FINAL_DATE");
            var recentDate = springDate;
            if(period === "Fall"){
                recentDate = fallDate;
            }else if(period === "Winter") {
                recentDate = winterDate;
            }else if(period === "Spring") {
                recentDate = springDate
            }else if(period === "Summer") {
                recentDate = summerDate
            }
        } else{
            var springDate =row.getField("SPRING_SAEBRS_TEACHER_FINAL_DATE");
            var winterDate = row.getField("WINTER_SAEBRS_TEACHER_FINAL_DATE");
            var fallDate = row.getField("FALL_SAEBRS_TEACHER_FINAL_DATE");
            var recentDate = springDate;
            if(period === "Fall"){
                recentDate = fallDate;
            }else if(period === "Winter") {
                recentDate = winterDate;
            }else if(period === "Spring") {
                recentDate = springDate
            }
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
                    record.REPORTING_PERIOD = period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(parseDate(recentDate).STANDARD_DATE, '05/15/' + hierarchy.SCHOOL_YEAR.substring(0,4));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STUDENT_LOCAL_ID")));
                    break;
              case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STUDENT_STATE_ID")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STUDENT_LOCAL_ID")));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
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
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENT_GENDER_CODE"),"").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("STUDENT_GRADE_CODE"))];
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL_NAME")
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
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(row) {
       return {}
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata, signature, period, periodIndex) {
        var score = {};
        var scaleScore, totalItems, primary, percentileSchool, percentileLEA;
        var percentileNation, uniqueDate, itemsSocial, itemsAcademic, itemsEmotional;
        if(row.getField("ASSESSMENT") === 'SAEBRS Student' && testMetadata.FORMAT!=='STUDENT'){
            return null;
        }
        if(row.getField("ASSESSMENT") === 'SAEBRS Teacher' && testMetadata.FORMAT!=='TEACHER'){
            return null;
        }
        if(row.getField("ASSESSMENT") === 'SAEBRS DBR' && testMetadata.FORMAT!== 'DBR'){
            return null;
        }
        var testNumber = generateTestNumber(row, testMetadata, periodIndex);
        var testSplit = testNumber.split("_")[1];
        if(testSplit === period.toUpperCase() || testSplit === period) {
            scaleScore = row.getField(testMetadata.FIELD +"SEBA_SAEBRS_ITEMS_CORRECT");
            totalItems = row.getField(testMetadata.FIELD +"SEBA_SAEBRS_TOTAL_ITEMS");
            primary = row.getField(testMetadata.FIELD +"RISK_LEVEL");
            percentileSchool = row.getField(testMetadata.FIELD +"PERCENTILE_AT_SCHOOL");
            percentileLEA = row.getField(testMetadata.FIELD +"PERCENTILE_AT_LEA");
            percentileNation = row.getField(testMetadata.FIELD +"PERCENTILE_AT_NATION");
            uniqueDate = row.getField(testMetadata.FIELD +"FINAL_DATE");
            // var items = row.getField(testMetadata.FIELD +"SEBA_SAEBRS_ITEMS_CORRECT");
            //itemsSocial = row.getField(testMetadata.FIELD +"SEBA_SAEBRS_SOCIAL_ITEMS_CORRECT");
            //itemsAcademic = row.getField(testMetadata.FIELD +"SEBA_SAEBRS_ACADEMIC_ITEMS_CORRECT");
            //itemsEmotional = row.getField(testMetadata.FIELD +"SEBA_SAEBRS_EMOTIONAL_ITEMS_CORRECT");
        }
        else
        {
            return null;
        }

        //Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;

        }
        score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_PRIMARY_RESULT_CODE"] = primary;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
    	score["TEST_SCORE_ATTRIBUTES"] = uniqueDate;
    	score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
    	score["TEST_SECONDARY_RESULT"] = percentileSchool;
    	score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
    	score["TEST_TERTIARY_RESULT"] = percentileLEA;
    	score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
    	score["TEST_QUATERNARY_RESULT"] = percentileNation;
    	score["TEST_PERCENTILE_SCORE"] = parseFloat(percentileNation);

    	score["TEST_ITEMS_ATTEMPTED"] = parseInt(scaleScore);
        score["TEST_ITEMS_POSSIBLE"] = parseInt(totalItems);
    	score["TEST_GROWTH_TARGET_1"] = parseInt(scaleScore);
    	//score["TEST_GROWTH_TARGET_2"] = itemsSocial;
    	//score["TEST_GROWTH_TARGET_3"] = itemsAcademic;
    	//score["TEST_GROWTH_TARGET_4"] = itemsEmotional;
        return score;
    }

    function mapGrowthScore(row, testMetadata, signature, period, periodIndex) {
        var score = {};
        if(row.getField("ASSESSMENT") === 'SAEBRS Student' && testMetadata.FORMAT!=='STUDENT'){
            return null;
        }
        if(row.getField("ASSESSMENT") === 'SAEBRS Teacher' && testMetadata.FORMAT!=='TEACHER'){
            return null;
        }
        if(row.getField("ASSESSMENT") === 'SAEBRS DBR' && testMetadata.FORMAT!=='DBR'){
            return null;
        }
        var testNumber = generateTestNumber(row, testMetadata, periodIndex);
        var testSplit = testNumber.split("_")[1];
        if(testSplit === period.toUpperCase()) {
            var growthScore = _util.coalesce(row.getField(testMetadata.FIELD+"GROWTH_SCORE"+testMetadata.FIELD_2),row.getField("GROWTH_SCORE"+testMetadata.FIELD_2));
            var growthPercentile = _util.coalesce(row.getField(testMetadata.FIELD+"NATIONAL_GROWTH_PERCENTILE"+testMetadata.FIELD_2),row.getField("NATIONAL_GROWTH_PERCENTILE"+testMetadata.FIELD_2));
            var growthStart = _util.coalesce(row.getField(testMetadata.FIELD+"GROWTH_PERCENTILE_BY_START_SCORE"+testMetadata.FIELD_2),row.getField("GROWTH_PERCENTILE_BY_START_SCORE"+testMetadata.FIELD_2));
            var growthSchool = _util.coalesce(row.getField(testMetadata.FIELD+"SCHOOL_GROWTH_PERCENTILE"+testMetadata.FIELD_2),row.getField("SCHOOL_GROWTH_PERCENTILE"+testMetadata.FIELD_2));
            var growthDistrict = _util.coalesce(row.getField(testMetadata.FIELD+"DISTRICT_GROWTH_PERCENTILE"+testMetadata.FIELD_2),row.getField("DISTRICT_GROWTH_PERCENTILE"+testMetadata.FIELD_2));
        }
        else {
            return null;
        }

        //Check for key fields and do not map score and exit if conditions met.
        if(growthScore === null || growthScore === undefined || _util.trim(growthScore) === "--" || _util.trim(growthScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = growthScore;
        score["TEST_GROWTH_RESULT"] = growthScore;
        if(!isNaN(growthScore)){
            score["TEST_SCORE_VALUE"] = growthScore;
            score["TEST_SCALED_SCORE"] = growthScore;
        }
    	score["TEST_PERCENTILE_SCORE"] = parseFloat(growthPercentile);
    	score["TEST_GROWTH_PERCENTILE"] = parseFloat(growthPercentile);
    	score["TEST_GROWTH_TARGET_1"] = parseFloat(growthStart);
    	score["TEST_GROWTH_TARGET_2"] = parseFloat(growthSchool);
    	score["TEST_GROWTH_TARGET_3"] = parseFloat(growthDistrict);

        return score;
    }

    function mapItemsScore(row, testMetadata, signature, period, periodIndex) {
        var score = {};
        if(row.getField("ASSESSMENT") === 'SAEBRS Student' && testMetadata.FORMAT!=='STUDENT'){
            return null;
        }
        if(row.getField("ASSESSMENT") === 'SAEBRS Teacher' && testMetadata.FORMAT!=='TEACHER'){
            return null;
        }
        if(row.getField("ASSESSMENT") === 'SAEBRS DBR' && testMetadata.FORMAT!=='DBR'){
            return null;
        }
        var testNumber = generateTestNumber(row, testMetadata, periodIndex);
        var testSplit = testNumber.split("_")[1];
        if(testSplit === period.toUpperCase() || testSplit === period) {
            var scaleScore = row.getField(testMetadata.FIELD + testMetadata.FIELD_2 +"_ITEMS_CORRECT");
            var totalItems = row.getField(testMetadata.FIELD + testMetadata.FIELD_2 +"_TOTAL_ITEMS");
        }
        else
        {
            return null;
        }

        //Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;

        }
        score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_ITEMS_ATTEMPTED"] = parseInt(scaleScore);
    	score["TEST_GROWTH_TARGET_1"] = parseInt(scaleScore);
    	score["TEST_ITEMS_POSSIBLE"] = parseInt(totalItems);


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
            // Sending different periods to generate assessment admin key
            for(var i=0; i<adminPeriods.length; i++) {
                var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, adminPeriods[i]);
                var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, adminPeriods[i]);
                if(assessmentAdminKey_one === assessmentAdminKey_two) {
                    return 1;
                } else {
                    return -1;
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
        if(srcRecord.getField("ASSESSMENT") === "SAEBRS Student") {
            // Add the Final date
            if(period === "Fall") {
                if(srcRecord.getField("FALL_SAEBRS_STUDENT_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("FALL_SAEBRS_STUDENT_FINAL_DATE"),"");
                } else {
                    // Default date for FALL
                    assessmentAdminKey = assessmentAdminKey +  "_" + "09/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            } else if(period === "Winter") {
                if(srcRecord.getField("WINTER_SAEBRS_STUDENT_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("WINTER_SAEBRS_STUDENT_FINAL_DATE"),"");
                } else {
                    // Default date for WINTER
                    assessmentAdminKey = assessmentAdminKey +  "_" + "01/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            } else if(period ==="Spring") {
                if(srcRecord.getField("SPRING_SAEBRS_STUDENT_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("SPRING_SAEBRS_STUDENT_FINAL_DATE"),"");
                } else {
                    // Default date for SPRING
                    assessmentAdminKey = assessmentAdminKey +  "_" + "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            }
        } else if(srcRecord.getField("ASSESSMENT") === "SAEBRS DBR")  {
            if(period === "Fall") {
                if(srcRecord.getField("FALL_SAEBRS_DBR_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("FALL_SAEBRS_DBR_FINAL_DATE"),"");
                } else {
                    // Default date for FALL
                    assessmentAdminKey = assessmentAdminKey +  "_" + "09/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            } else if(period === "Winter") {
                if(srcRecord.getField("WINTER_SAEBRS_DBR_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("WINTER_SAEBRS_DBR_FINAL_DATE"),"");
                } else {
                    // Default date for WINTER
                    assessmentAdminKey = assessmentAdminKey +  "_" + "01/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            } else if(period === "Spring") {
                if(srcRecord.getField("SPRING_SAEBRS_DBR_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("SPRING_SAEBRS_DBR_FINAL_DATE"),"");
                } else {
                    // Default date for SPRING
                    assessmentAdminKey = assessmentAdminKey +  "_" + "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            } else if(period === "Summer") {
                if(srcRecord.getField("SUMMER_SAEBRS_DBR_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("SUMMER_SAEBRS_DBR_FINAL_DATE"),"");
                } else {
                      // Default date for Summer
                    assessmentAdminKey = assessmentAdminKey +  "_" + "07/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            }
        } else {
            // Add the Final date
            if(period === "Fall") {
                if(srcRecord.getField("FALL_SAEBRS_TEACHER_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("FALL_SAEBRS_TEACHER_FINAL_DATE"),"");
                } else {
                    // Default date for FALL
                    assessmentAdminKey = assessmentAdminKey +  "_" + "09/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            } else if(period === "Winter") {
                if(srcRecord.getField("WINTER_SAEBRS_TEACHER_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("WINTER_SAEBRS_TEACHER_FINAL_DATE"),"");
                } else {
                    // Default date for WINTER
                    assessmentAdminKey = assessmentAdminKey +  "_" + "01/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            } else if(period ==="Spring") {
                if(srcRecord.getField("SPRING_SAEBRS_TEACHER_FINAL_DATE")) {
                    assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("SPRING_SAEBRS_TEACHER_FINAL_DATE"),"");
                } else {
                    // Default date for SPRING
                    assessmentAdminKey = assessmentAdminKey +  "_" + "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
                }
            }
        }
        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata, periodIndex) {
        const testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + periodIndex;
        return testNumber;
    }

    function parseDate(rawDate){

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === ""){
            return dateObj;
        }

        var formatter;

        if (rawDate.length >= 8 && rawDate.indexOf('/') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
        } else if (rawDate.length >= 8 && rawDate.indexOf('-') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
        } else {
            formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
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

    return module;
}());