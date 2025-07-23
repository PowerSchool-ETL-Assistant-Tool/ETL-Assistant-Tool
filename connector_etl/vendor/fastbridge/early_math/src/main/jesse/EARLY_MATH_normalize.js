var AppNormalize = (function() {
    let module = {};
    const _thisModuleName = "AppNormalize";
    const _assessmentIdentifier = "early_math";
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

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {

/*         try {
            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();
            var signatureFormatName = signature.getFormat().getFormatName();
            print(`Loading using signature file ${signatureFormatName} \n`);

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
        } */

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
            throw `${_thisModuleName}.createNormalizedFile Exception: ${exception}`;
        }
    };


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
            throw `${_thisModuleName}.createRecords Exception: ${exception}`;
        }
    }

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
            throw `${_thisModuleName}.writeNormalizedRecords Exception: ${exception}`;
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
    const scoresToMap =
        [
             {TEST: "EARLY_MATH", CODE:"FALL_EM", FIELD: "FALL_EARLY_MATH_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_COMP",FIELD: "FALL_COMPOSING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_COUNT",FIELD: "FALL_COUNTING_OBJECTS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_DEC_ONE" , FIELD: "FALL_DECOMPOSING_ONE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_DEC_KG",FIELD: "FALL_DECOMPOSING_KG_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_EQ"   ,FIELD: "FALL_EQUAL_PARTITIONING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_MAT"  , FIELD: "FALL_MATCH_QUANTITY_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_NUMBER_ONE",FIELD: "FALL_NUMBER_SEQUENCE_ONE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_NUMBER_KG",FIELD: "FALL_NUMBER_SEQUENCE_KG_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_NUM_ONE",FIELD: "FALL_NUMERAL_IDENTIFICATION_ONE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_NUM_KG" ,FIELD: "FALL_NUMERAL_IDENTIFICATION_KG_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_PLACE" ,FIELD: "FALL_PLACE_VALUE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_QUA_DL" ,FIELD: "FALL_QUANTITY_DISCRIMINATION_LEAST_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_QUA_DM" ,FIELD: "FALL_QUANTITY_DISCRIMINATION_MOST_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_SUB"    ,FIELD: "FALL_SUBITIZING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_VERB_ADD" ,FIELD: "FALL_VERBAL_ADDITION_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_VERB_SUB" ,FIELD: "FALL_VERBAL_SUBTRACTION_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"FALL_ST"     , FIELD: "FALL_STORY_PROBLEMS_", MAP_FUNCTION: mapStrandScore}

           ,{TEST: "EARLY_MATH", CODE:"WINTER_EM", FIELD: "WINTER_EARLY_MATH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_COMP", FIELD: "WINTER_COMPOSING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_COUNT", FIELD: "WINTER_COUNTING_OBJECTS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_DEC_ONE", FIELD: "WINTER_DECOMPOSING_ONE_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_DEC_KG", FIELD: "WINTER_DECOMPOSING_KG_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_EQ", FIELD: "WINTER_EQUAL_PARTITIONING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_MAT", FIELD: "WINTER_MATCH_QUANTITY_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_NUMBER_ONE", FIELD: "WINTER_NUMBER_SEQUENCE_ONE_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_NUMBER_KG", FIELD: "WINTER_NUMBER_SEQUENCE_KG_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_NUM_ONE", FIELD: "WINTER_NUMERAL_IDENTIFICATION_ONE_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_NUM_KG", FIELD: "WINTER_NUMERAL_IDENTIFICATION_KG_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_PLACE", FIELD: "WINTER_PLACE_VALUE_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_QUA_DL", FIELD: "WINTER_QUANTITY_DISCRIMINATION_LEAST_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_QUA_DM", FIELD: "WINTER_QUANTITY_DISCRIMINATION_MOST_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_SUB", FIELD: "WINTER_SUBITIZING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_VERB_ADD", FIELD: "WINTER_VERBAL_ADDITION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_VERB_SUB", FIELD: "WINTER_VERBAL_SUBTRACTION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_ST", FIELD: "WINTER_STORY_PROBLEMS_", MAP_FUNCTION: mapStrandScore}

            ,{TEST: "EARLY_MATH", CODE:"SPRING_EM", FIELD: "SPRING_EARLY_MATH_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_COMP", FIELD: "SPRING_COMPOSING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_COUNT", FIELD: "SPRING_COUNTING_OBJECTS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_DEC_ONE", FIELD: "SPRING_DECOMPOSING_ONE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_DEC_KG", FIELD: "SPRING_DECOMPOSING_KG_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_EQ", FIELD: "SPRING_EQUAL_PARTITIONING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_MAT", FIELD: "SPRING_MATCH_QUANTITY_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_NUMBER_ONE", FIELD: "SPRING_NUMBER_SEQUENCE_ONE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_NUMBER_KG", FIELD: "SPRING_NUMBER_SEQUENCE_KG_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_NUM_ONE", FIELD: "SPRING_NUMERAL_IDENTIFICATION_ONE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_NUM_KG", FIELD: "SPRING_NUMERAL_IDENTIFICATION_KG_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_PLACE", FIELD: "SPRING_PLACE_VALUE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_QUA_DL", FIELD: "SPRING_QUANTITY_DISCRIMINATION_LEAST_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_QUA_DM", FIELD: "SPRING_QUANTITY_DISCRIMINATION_MOST_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_SUB", FIELD: "SPRING_SUBITIZING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_VERB_ADD", FIELD: "SPRING_VERBAL_ADDITION_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_VERB_SUB", FIELD: "SPRING_VERBAL_SUBTRACTION_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_ST", FIELD: "SPRING_STORY_PROBLEMS_", MAP_FUNCTION: mapStrandScore}

           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_EM", FIELD: "WINTER_FEB-MAR_EARLY_MATH_", MAP_FUNCTION: mapScaledScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_COMP", FIELD: "WINTER_FEB-MAR_COMPOSING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_COUNT", FIELD: "WINTER_FEB-MAR_COUNTING_OBJECTS_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_DEC_ONE", FIELD: "WINTER_FEB-MAR_DECOMPOSING_ONE_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_DEC_KG", FIELD: "WINTER_FEB-MAR_DECOMPOSING_KG_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_EQ", FIELD: "WINTER_FEB-MAR_EQUAL_PARTITIONING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_MAT", FIELD: "WINTER_FEB-MAR_MATCH_QUANTITY_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NUMBER_ONE", FIELD: "WINTER_FEB-MAR_NUMBER_SEQUENCE_ONE_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NUMBER_KG", FIELD: "WINTER_FEB-MAR_NUMBER_SEQUENCE_KG_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NUM_ONE", FIELD: "WINTER_FEB-MAR_NUMERAL_IDENTIFICATION_ONE_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NUM_KG", FIELD: "WINTER_FEB-MAR_NUMERAL_IDENTIFICATION_KG_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_PLACE", FIELD: "WINTER_FEB-MAR_PLACE_VALUE_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_QUA_DL", FIELD: "WINTER_FEB-MAR_QUANTITY_DISCRIMINATION_LEAST_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_QUA_DM", FIELD: "WINTER_FEB-MAR_QUANTITY_DISCRIMINATION_MOST_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_SUB", FIELD: "WINTER_FEB-MAR_SUBITIZING_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_VERB_ADD", FIELD: "WINTER_FEB-MAR_VERBAL_ADDITION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_VERB_SUB", FIELD: "WINTER_FEB-MAR_VERBAL_SUBTRACTION_", MAP_FUNCTION: mapStrandScore}
           ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_ST", FIELD: "WINTER_FEB-MAR_STORY_PROBLEMS_", MAP_FUNCTION: mapStrandScore}




            ,{TEST: "EARLY_MATH", CODE:"WINTER_EM_FWG", FIELD: "WINTER_EARLY_MATH_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_COMP_FWG", FIELD: "WINTER_COMPOSING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_COUNT_FWG", FIELD: "WINTER_COUNTING_OBJECTS_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_DEO_FWG", FIELD: "WINTER_DECOMPOSING_ONE_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_DEK_FWG", FIELD: "WINTER_DECOMPOSING_KG_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_EQP_FWG", FIELD: "WINTER_EQUAL_PARTITIONING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_MQ_FWG", FIELD: "WINTER_MATCH_QUANTITY_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_NSO_FWG", FIELD: "WINTER_NUMBER_SEQUENCE_ONE_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_NSK_FWG", FIELD: "WINTER_NUMBER_SEQUENCE_KG_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_NIO_FWG", FIELD: "WINTER_NUMERAL_IDENTIFICATION_ONE_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_NIK_FWG", FIELD: "WINTER_NUMERAL_IDENTIFICATION_KG_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_PV_FWG", FIELD: "WINTER_PLACE_VALUE_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_QDL_FWG", FIELD: "WINTER_QUANTITY_DISCRIMINATION_LEAST_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_QDM_FWG", FIELD: "WINTER_QUANTITY_DISCRIMINATION_MOST_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_SUB_FWG", FIELD: "WINTER_SUBITIZING_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_VA_FWG", FIELD: "WINTER_VERBAL_ADDITION_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_VS_FWG", FIELD: "WINTER_VERBAL_SUBTRACTION_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_SP_FWG", FIELD: "WINTER_STORY_PROBLEMS_", FIELD_2: "_FROM_FALL_TO_WINTER" , MAP_FUNCTION: mapGrowthScore}


           ,{TEST: "EARLY_MATH", CODE:"SPRING_EM_FSG", FIELD: "SPRING_EARLY_MATH_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_COMP_FSG", FIELD: "SPRING_COMPOSING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_COUNT_FSG", FIELD: "SPRING_COUNTING_OBJECTS_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_DEO_FSG", FIELD: "SPRING_DECOMPOSING_ONE_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_DEK_FSG", FIELD: "SPRING_DECOMPOSING_KG_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_EQP_FSG", FIELD: "SPRING_EQUAL_PARTITIONING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_MQ_FSG", FIELD: "SPRING_MATCH_QUANTITY_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_NSO_FSG", FIELD: "SPRING_NUMBER_SEQUENCE_ONE_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_NSK_FSG", FIELD: "SPRING_NUMBER_SEQUENCE_KG_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_NIO_FSG", FIELD: "SPRING_NUMERAL_IDENTIFICATION_ONE_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_NIK_FSG", FIELD: "SPRING_NUMERAL_IDENTIFICATION_KG_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_PV_FSG", FIELD: "SPRING_PLACE_VALUE_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_QDL_FSG", FIELD: "SPRING_QUANTITY_DISCRIMINATION_LEAST_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_QDM_FSG", FIELD: "SPRING_QUANTITY_DISCRIMINATION_MOST_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_SUB_FSG", FIELD: "SPRING_SUBITIZING_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_VA_FSG", FIELD: "SPRING_VERBAL_ADDITION_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_VS_FSG", FIELD: "SPRING_VERBAL_SUBTRACTION_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_SP_FSG", FIELD: "SPRING_STORY_PROBLEMS_", FIELD_2: "_FROM_FALL_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
          ,{TEST: "EARLY_MATH", CODE:"SPRING_EM_WSG", FIELD: "SPRING_EARLY_MATH_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_COMP_WSG", FIELD: "SPRING_COMPOSING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_COUNT_WSG", FIELD: "SPRING_COUNTING_OBJECTS_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_DEO_WSG", FIELD: "SPRING_DECOMPOSING_ONE_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_DEK_WSG", FIELD: "SPRING_DECOMPOSING_KG_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_EQP_WSG", FIELD: "SPRING_EQUAL_PARTITIONING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_MQ_WSG", FIELD: "SPRING_MATCH_QUANTITY_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_NSO_WSG", FIELD: "SPRING_NUMBER_SEQUENCE_ONE_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_NSK_WSG", FIELD: "SPRING_NUMBER_SEQUENCE_KG_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_NIO_WSG", FIELD: "SPRING_NUMERAL_IDENTIFICATION_ONE_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_NIK_WSG", FIELD: "SPRING_NUMERAL_IDENTIFICATION_KG_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_PV_WSG", FIELD: "SPRING_PLACE_VALUE_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_QDL_WSG", FIELD: "SPRING_QUANTITY_DISCRIMINATION_LEAST_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
           ,{TEST: "EARLY_MATH", CODE:"SPRING_QDM_WSG", FIELD: "SPRING_QUANTITY_DISCRIMINATION_MOST_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_SUB_WSG", FIELD: "SPRING_SUBITIZING_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_VA_WSG", FIELD: "SPRING_VERBAL_ADDITION_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_VS_WSG", FIELD: "SPRING_VERBAL_SUBTRACTION_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"SPRING_SP_WSG", FIELD: "SPRING_STORY_PROBLEMS_", FIELD_2: "_FROM_WINTER_TO_SPRING" , MAP_FUNCTION: mapGrowthScore}

            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_EM_FFMG", FIELD: "WINTER_FEB-MAR_EARLY_MATH_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_COMP_FFMG", FIELD: "WINTER_FEB-MAR_COMPOSING_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_COUNT_FFMG", FIELD: "WINTER_FEB-MAR_COUNTING_OBJECTS_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_DEO_FFMG", FIELD: "WINTER_FEB-MAR_DECOMPOSING_ONE_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_DEK_FFMG", FIELD: "WINTER_FEB-MAR_DECOMPOSING_KG_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_EQP_FFMG", FIELD: "WINTER_FEB-MAR_EQUAL_PARTITIONING_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
             ,{TEST: "EARLY_MATH",CODE:"WINTER_FM_MQ_FFMG", FIELD: "WINTER_FEB-MAR_MATCH_QUANTITY_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NSO_FFMG", FIELD: "WINTER_FEB-MAR_NUMBER_SEQUENCE_ONE_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NSK_FFMG", FIELD: "WINTER_FEB-MAR_NUMBER_SEQUENCE_KG_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NIO_FFMG", FIELD: "WINTER_FEB-MAR_NUMERAL_IDENTIFICATION_ONE_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NIK_FFMG", FIELD: "WINTER_FEB-MAR_NUMERAL_IDENTIFICATION_KG_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_PV_FFMG",  FIELD: "WINTER_FEB-MAR_PLACE_VALUE_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_QDL_FFMG", FIELD: "WINTER_FEB-MAR_QUANTITY_DISCRIMINATION_LEAST_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_QDM_FFMG", FIELD: "WINTER_FEB-MAR_QUANTITY_DISCRIMINATION_MOST_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_SUB_FFMG", FIELD: "WINTER_FEB-MAR_SUBITIZING_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_VA_FFMG", FIELD: "WINTER_FEB-MAR_VERBAL_ADDITION_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_VS_FFMG", FIELD: "WINTER_FEB-MAR_VERBAL_SUBTRACTION_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_SP_FFMG", FIELD: "WINTER_FEB-MAR_STORY_PROBLEMS_", FIELD_2: "_FROM_FALL_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}

            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_EM_FWFMG" ,FIELD: "WINTER_FEB-MAR_EARLY_MATH_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_COMP_FWFMG" ,FIELD: "WINTER_FEB-MAR_COMPOSING_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_COUNT_FWFMG",FIELD: "WINTER_FEB-MAR_COUNTING_OBJECTS_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_DEO_FWFMG", FIELD: "WINTER_FEB-MAR_DECOMPOSING_ONE_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_DEK_FWFMG", FIELD: "WINTER_FEB-MAR_DECOMPOSING_KG_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_EQP_FWFMG", FIELD: "WINTER_FEB-MAR_EQUAL_PARTITIONING_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_MQ_FWFMG", FIELD: "WINTER_FEB-MAR_MATCH_QUANTITY_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NSO_FWFMG", FIELD: "WINTER_FEB-MAR_NUMBER_SEQUENCE_ONE_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NSK_FWFMG", FIELD: "WINTER_FEB-MAR_NUMBER_SEQUENCE_KG_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NIO_FWFMG", FIELD: "WINTER_FEB-MAR_NUMERAL_IDENTIFICATION_ONE_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_NIK_FWFMG", FIELD: "WINTER_FEB-MAR_NUMERAL_IDENTIFICATION_KG_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_PV_FWFMG", FIELD: "WINTER_FEB-MAR_PLACE_VALUE_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_QDL_FWFMG", FIELD: "WINTER_FEB-MAR_QUANTITY_DISCRIMINATION_LEAST_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_QDM_FWFMG", FIELD: "WINTER_FEB-MAR_QUANTITY_DISCRIMINATION_MOST_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_SUB_FWFMG", FIELD: "WINTER_FEB-MAR_SUBITIZING_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_VA_FWFMG", FIELD: "WINTER_FEB-MAR_VERBAL_ADDITION_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            , {TEST: "EARLY_MATH",CODE:"WINTER_FM_VS_FWFMG", FIELD: "WINTER_FEB-MAR_VERBAL_SUBTRACTION_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}
            ,{TEST: "EARLY_MATH", CODE:"WINTER_FM_SP_FWFMG", FIELD: "WINTER_FEB-MAR_STORY_PROBLEMS_", FIELD_2: "_FROM_WINTER_TO_FEB-MAR" , MAP_FUNCTION: mapGrowthScore}

        ];

   /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    const gradeDecode = {
        "One"     :   "01",
        "Two"     :   "03",
        "Three"   :   "03",
        "Four"    :   "04",
        "Five"    :   "05",
        "Six"     :   "06",
        "Seven"   :   "07",
        "Eight"   :   "08",
        "Nine"    :   "09",
        "Ten"     :   "10",
        "Eleven"  :   "11",
        "Twelve"  :   "12",
        "Kindergarten" : "KG",
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

        adminPeriods.forEach(function(period, periodIndex){
            var record = mapNormalizedRecord(signature, hierarchy, row, period, periodIndex);
            AppUtil.nullSafePush(normalizedRecords, record);
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

            try{
                 var score = (testMetadata.MAP_FUNCTION)(signature, row, testMetadata, period, periodIndex);
                  AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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
            birthDateObject = parseDate(row.getField("DOB"));
        }

       var testDateObject = parseTestDate(recentDate);

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
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("DISTRICT"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("STATE"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
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
  function mapScaledScore(signature, row, testMetadata, period, periodIndex){
    try{
            let score = {};
            var testNumber = generateTestNumber(signature, row, testMetadata, periodIndex);
            var testSplit = testNumber.split("_")[2];
            if(testSplit === 'FALL') {
                testSplit = 'Fall'
            } else if(testSplit === 'WINTER'){
                testSplit = 'Winter'
            }else if(testSplit === 'SPRING'){
                testSplit = 'Spring'
            }
             if(testSplit === period) {
               var scaleScore = row.getField(testMetadata.FIELD +"COMPOSITE_SCORE");
               var primary = row.getField(testMetadata.FIELD +"RISK_LEVEL");
               var percentileSchool = row.getField(testMetadata.FIELD +"PERCENTILE_AT_SCHOOL");
               var percentileLEA = row.getField(testMetadata.FIELD +"PERCENTILE_AT_LEA");
               var percentileNation = row.getField(testMetadata.FIELD +"PERCENTILE_AT_NATION");
               var uniqueDate = row.getField(testMetadata.FIELD +"FINAL_DATE");
            }
            else
                {
                 return null;
                }

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

             if(!isNaN(scaleScore)){
                 var formattedScore = formatNumeric84(scaleScore);
                 if(formattedScore !== null){
                     score["TEST_SCORE_VALUE"] = formattedScore;
                     score["TEST_SCALED_SCORE"] = formattedScore;
                 } else {
                     score["TEST_SCORE_VALUE"] = null;
                     score["TEST_SCALED_SCORE"] = null;
                 }
             }
            score["TEST_PRIMARY_RESULT_CODE"] = primary;
            score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
            score["TEST_SCORE_ATTRIBUTES"] = uniqueDate;
            score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
            score["TEST_SECONDARY_RESULT"] = parseFloat(percentileSchool);
            score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
            score["TEST_TERTIARY_RESULT"] = parseFloat(percentileLEA);
            score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
            score["TEST_QUATERNARY_RESULT"] = percentileNation;
            score["TEST_PERCENTILE_SCORE"] = percentileNation;
            return score;
            } catch(exception){
                print("exception-" + exception);
            }
  }




  function mapStrandScore(signature, row, testMetadata, period, periodIndex){



            let score = {};
            var testNumber = generateTestNumber(signature, row, testMetadata, periodIndex);
            var testSplit = testNumber.split("_")[2];
            if(testSplit === 'FALL') {
                testSplit = 'Fall'
            } else if(testSplit === 'WINTER'){
                testSplit = 'Winter'
            }else if(testSplit === 'SPRING'){
                testSplit = 'Spring'
            }
            if(testSplit === period) {
              var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD +"ITEMS_CORRECT"),row.getField(testMetadata.FIELD +"IC_PER_MINUTE"),row.getField(testMetadata.FIELD +"NRC_PER_MINUTE"));
              var primary = row.getField(testMetadata.FIELD +"RISK_LEVEL");
              var percentileSchool = row.getField(testMetadata.FIELD +"PERCENTILE_AT_SCHOOL");
              var percentileLEA = row.getField(testMetadata.FIELD +"PERCENTILE_AT_LEA");
              var percentileNation = row.getField(testMetadata.FIELD +"PERCENTILE_AT_NATION");
              var itemsAttempted = _util.coalesce(row.getField(testMetadata.FIELD +"ITEMS_CORRECT"),row.getField(testMetadata.FIELD +"NUMBER_READ_CORRECT"));
              var itemsPossible =  _util.coalesce(row.getField(testMetadata.FIELD +"TOTAL_ITEMS"),row.getField(testMetadata.FIELD +"TOTAL_NUMBER_READ"));
              var itemsError = row.getField(testMetadata.FIELD + "ERROR");

            }
            else
                {
                  return null;
                }

            if(checkAdminDate(row, period) == null) {

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

            if(!isNaN(scaleScore)){
                var formattedScore = formatNumeric84(scaleScore);
                if(formattedScore !== null){
                    score["TEST_SCORE_VALUE"] = formattedScore;
                    score["TEST_SCALED_SCORE"] = formattedScore;
                } else {
                    score["TEST_SCORE_VALUE"] = null;
                    score["TEST_SCALED_SCORE"] = null;
                }
            }

            score["TEST_ITEMS_ATTEMPTED"] = parseInt(itemsAttempted);
            score["TEST_ITEMS_POSSIBLE"]= parseInt(itemsPossible);
            score["TEST_PRIMARY_RESULT_CODE"] = primary;
            score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
            score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
            score["TEST_SECONDARY_RESULT"] = parseFloat(percentileSchool);
            score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
            score["TEST_TERTIARY_RESULT"] =parseFloat(percentileLEA);
            score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
            score["TEST_QUATERNARY_RESULT"] = parseFloat(percentileNation);
            score["TEST_PERCENTILE_SCORE"] =parseFloat(percentileNation);
            score["TEST_STANDARD_ERROR"] = itemsError;
            return score;
   }



  function mapGrowthScore(signature, row, testMetadata, period, periodIndex) {
         let score = {};
         var testNumber = generateTestNumber(signature, row, testMetadata, periodIndex);
         var testSplit = testNumber.split("_")[2];
            if(testSplit === 'FALL') {
                testSplit = 'Fall'
            } else if(testSplit === 'WINTER'){
                testSplit = 'Winter'
            }else if(testSplit === 'SPRING'){
                testSplit = 'Spring'
            }
        if(testSplit === period) {
          var growthScore = row.getField(testMetadata.FIELD+"GROWTH_SCORE"+testMetadata.FIELD_2);
          var growthPercentile = row.getField(testMetadata.FIELD+"NATIONAL_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
          var growthStart = row.getField(testMetadata.FIELD+"GROWTH_PERCENTILE_BY_START_SCORE"+testMetadata.FIELD_2);
          var growthSchool = row.getField(testMetadata.FIELD+"SCHOOL_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
          var growthDistrict = row.getField(testMetadata.FIELD+"DISTRICT_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
        }
        else
            {
             return null;
           }

        if(checkAdminDate(row, period) == null) {
              return null;
        }


         if(growthScore === null || growthScore === undefined || _util.trim(growthScore) === "--" || _util.trim(growthScore) === "") {
                    return null;
                }
                if(growthPercentile!==undefined&&growthPercentile!==null){
                    growthPercentile = parseInt(growthPercentile);
                }
                if(growthStart!==undefined&&growthStart!==null){
                    growthStart = parseFloat(growthStart);
                }
                if(growthSchool!==undefined&&growthSchool!==null){
                    growthSchool = parseFloat(growthSchool);
                }
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = growthScore;
                score["TEST_GROWTH_RESULT"] = growthScore;
                if(!isNaN(growthScore)){
                    var formattedScore = formatNumeric84(growthScore);
                    if(formattedScore !== null){
                        score["TEST_SCORE_VALUE"] = formattedScore;
                        score["TEST_SCALED_SCORE"] = formattedScore;
                    } else {
                        score["TEST_SCORE_VALUE"] = null;
                        score["TEST_SCALED_SCORE"] = null;
                    }
                }
            	score["TEST_PERCENTILE_SCORE"] = parseInt(growthPercentile);
            	score["TEST_GROWTH_PERCENTILE"] = parseInt(growthPercentile);
            	score["TEST_GROWTH_TARGET_1"] =  parseFloat(growthStart);
            	score["TEST_GROWTH_TARGET_2"] =  parseFloat(growthSchool);
            	score["TEST_GROWTH_TARGET_3"] =  parseFloat(growthDistrict);

                return score;
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

        if (rawDate.length >= 9 && rawDate.indexOf('/') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
        } else if (rawDate.length >= 9 && rawDate.indexOf('-') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
        } else if (rawDate.length === 8 && rawDate.indexOf('/') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('M/d/yyyy');
        }else if(rawDate.length === 6) {
            formatter = new java.text.SimpleDateFormat("ddMMyy");
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, period) {

        var assessmentAdminKey = null;
        // Set base assessment admin key information based on period
        if(period===undefined){
             assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;
        }
        else{
            assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}`;
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

    function generateTestNumber(signature, row, testMetadata, periodIndex) {

       var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

       return testNumber;
    }

    function getDefaultTestAdminDateByPeriod(hierarchy, periodValue) {
        var date = '';
        var period = periodValue ? periodValue : hierarchy.REPORTING_PERIOD;
        if(period === 'Fall') {
            date = "09/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}"
        } else if (period === 'Winter') {
            date = "01/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}"
        } else if (period === 'Spring') {
            date = "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}"
        } else {
            // Making SPRING as default
            date = "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}"
        }
        return date;
    }

    function checkAdminDate(row, period) {

        if(period === "Fall") {
            let date = _util.coalesce(row.getField("FALL_EARLY_MATH_FINAL_DATE")
                 ,row.getField("FALL_COMPOSING_FINAL_DATE")
                ,row.getField("FALL_COUNTING_OBJECTS_FINAL_DATE")
                ,row.getField("FALL_DECOMPOSING_ONE_FINAL_DATE")
                ,row.getField("FALL_DECOMPOSING_KG_FINAL_DATE")
                ,row.getField("FALL_EQUAL_PARTITIONING_FINAL_DATE")
                ,row.getField("FALL_MATCH_QUANTITY_FINAL_DATE")
                ,row.getField("FALL_NUMBER_SEQUENCE_ONE_FINAL_DATE")
                ,row.getField("FALL_NUMBER_SEQUENCE_KG_FINAL_DATE")
                ,row.getField("FALL_NUMERAL_IDENTIFICATION_ONE_FINAL_DATE")
                ,row.getField("FALL_NUMERAL_IDENTIFICATION_KG_FINAL_DATE")
                ,row.getField("FALL_PLACE_VALUE_FINAL_DATE")
                ,row.getField("FALL_QUANTITY_DISCRIMINATION_LEAST_FINAL_DATE")
                ,row.getField("FALL_QUANTITY_DISCRIMINATION_MOST_FINAL_DATE")
                ,row.getField("FALL_SUBITIZING_FINAL_DATE")
                ,row.getField("FALL_VERBAL_ADDITION_FINAL_DATE")
                ,row.getField("FALL_VERBAL_SUBTRACTION_FINAL_DATE")
                ,row.getField("FALL_STORY_PROBLEMS_FINAL_DATE")
                ,null);
           return date;
        } else if(period === "Winter") {
            let date = _util.coalesce(row.getField("WINTER_EARLY_MATH_FINAL_DATE")
                  ,row.getField("WINTER_COMPOSING_FINAL_DATE")
                 ,row.getField("WINTER_COUNTING_OBJECTS_FINAL_DATE")
                 ,row.getField("WINTER_DECOMPOSING_ONE_FINAL_DATE")
                 ,row.getField("WINTER_DECOMPOSING_KG_FINAL_DATE")
                 ,row.getField("WINTER_EQUAL_PARTITIONING_FINAL_DATE")
                 ,row.getField("WINTER_MATCH_QUANTITY_FINAL_DATE")
                 ,row.getField("WINTER_NUMBER_SEQUENCE_ONE_FINAL_DATE")
                 ,row.getField("WINTER_NUMBER_SEQUENCE_KG_FINAL_DATE")
                 ,row.getField("WINTER_NUMERAL_IDENTIFICATION_ONE_FINAL_DATE")
                 ,row.getField("WINTER_NUMERAL_IDENTIFICATION_KG_FINAL_DATE")
                 ,row.getField("WINTER_PLACE_VALUE_FINAL_DATE")
                 ,row.getField("WINTER_QUANTITY_DISCRIMINATION_LEAST_FINAL_DATE")
                 ,row.getField("WINTER_QUANTITY_DISCRIMINATION_MOST_FINAL_DATE")
                 ,row.getField("WINTER_SUBITIZING_FINAL_DATE")
                 ,row.getField("WINTER_VERBAL_ADDITION_FINAL_DATE")
                 ,row.getField("WINTER_VERBAL_SUBTRACTION_FINAL_DATE")
                 ,row.getField("WINTER_STORY_PROBLEMS_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_EARLY_MATH_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_COMPOSING_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_COUNTING_OBJECTS_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_DECOMPOSING_ONE_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_DECOMPOSING_KG_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_EQUAL_PARTITIONING_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_MATCH_QUANTITY_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_NUMBER_SEQUENCE_ONE_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_NUMBER_SEQUENCE_KG_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_NUMERAL_IDENTIFICATION_ONE_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_NUMERAL_IDENTIFICATION_KG_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_PLACE_VALUE_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_QUANTITY_DISCRIMINATION_LEAST_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_QUANTITY_DISCRIMINATION_MOST_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_SUBITIZING_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_VERBAL_ADDITION_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_VERBAL_SUBTRACTION_FINAL_DATE")
                 ,row.getField("WINTER_FEB-MAR_STORY_PROBLEMS_FINAL_DATE")
                  ,null);
                  return date;
        } else if(period ==="Spring") {
                    let date = _util.coalesce(row.getField("SPRING_EARLY_MATH_FINAL_DATE")
                   ,row.getField("SPRING_COMPOSING_FINAL_DATE")
                   ,row.getField("SPRING_COUNTING_OBJECTS_FINAL_DATE")
                   ,row.getField("SPRING_DECOMPOSING_ONE_FINAL_DATE")
                   ,row.getField("SPRING_DECOMPOSING_KG_FINAL_DATE")
                   ,row.getField("SPRING_EQUAL_PARTITIONING_FINAL_DATE")
                   ,row.getField("SPRING_MATCH_QUANTITY_FINAL_DATE")
                   ,row.getField("SPRING_NUMBER_SEQUENCE_ONE_FINAL_DATE")
                   ,row.getField("SPRING_NUMBER_SEQUENCE_KG_FINAL_DATE")
                   ,row.getField("SPRING_NUMERAL_IDENTIFICATION_ONE_FINAL_DATE")
                   ,row.getField("SPRING_NUMERAL_IDENTIFICATION_KG_FINAL_DATE")
                   ,row.getField("SPRING_PLACE_VALUE_FINAL_DATE")
                   ,row.getField("SPRING_QUANTITY_DISCRIMINATION_LEAST_FINAL_DATE")
                   ,row.getField("SPRING_QUANTITY_DISCRIMINATION_MOST_FINAL_DATE")
                   ,row.getField("SPRING_SUBITIZING_FINAL_DATE")
                   ,row.getField("SPRING_VERBAL_ADDITION_FINAL_DATE")
                   ,row.getField("SPRING_VERBAL_SUBTRACTION_FINAL_DATE")
                   ,row.getField("SPRING_STORY_PROBLEMS_FINAL_DATE")
                   ,null);
               return date;
          }
      }

      return module;
  }());
