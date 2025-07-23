var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "TS_GOLD";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
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

                        if(mappingObject.SCORE_MAPPINGS === null || mappingObject.SCORE_MAPPINGS.length === 0) {
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
    var scoresToMap = [
        {TEST: "TSGOLD", CODE:"", FIELD: "1A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "1B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "1C", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "1C1", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "1C2", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "1C3", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "1C4", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "2A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "2B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "2C", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "2D", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "3A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "3B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "4", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "4A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "4B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "4C", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "5", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "5A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "5B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "5C", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "6", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "6A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "6B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "6C", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "7A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "7B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "8A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "8B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "9A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "9B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "9C", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "9D", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "10A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "10B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "S8A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "S8B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "S9A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "S9B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "S9C", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "S9D", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "S10A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "S10B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "11A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "11B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "11C", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "11D", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "11E", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "12A", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "12B", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "13", MAP_FUNCTION: mapOverallScore}
       ,{TEST: "TSGOLD", CODE:"", FIELD: "14A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "14B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "15A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "15B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "15C", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "15D", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "16A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "16B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "17A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "17B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "18A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "18B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "18C", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "18D", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "18E", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "19A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "19B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "19C", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S15A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S15B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S15C", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S15D", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S16A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S16B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S17A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S17B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S18A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S18B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S18C", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S18D", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S18E", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S19A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S19B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "S19C", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "20A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "20B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "20C", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "20D", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "20E", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "20F", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "21A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "21B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "22A", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "22B", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "22C", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "23", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "24", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "25", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "26", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "27", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "28", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "29", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "30", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "31", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "32", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "33", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "34", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "35", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "36", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "37", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "TSGOLD", CODE:"", FIELD: "38", MAP_FUNCTION: mapOverallScore}

        ,{TEST: "TSGOLD", CODE:"PTB_1_ENT", FIELD: "PART_B_ENTRY", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_2_ENT", FIELD: "PART_B_ENTRY", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_3_ENT", FIELD: "PART_B_ENTRY", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_1_EXT", FIELD: "PART_B_EXIT", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_2_EXT", FIELD: "PART_B_EXIT", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_3_EXT", FIELD: "PART_B_EXIT", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_1_ECO", FIELD: "PART_B_ECO", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_2_ECO", FIELD: "PART_B_ECO", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_3_ECO", FIELD: "PART_B_ECO", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}

        ,{TEST: "TSGOLD", CODE:"PTC_1_ENT", FIELD: "PART_C_ENTRY", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_2_ENT", FIELD: "PART_C_ENTRY", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_3_ENT", FIELD: "PART_C_ENTRY", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_1_EXT", FIELD: "PART_C_EXIT", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_2_EXT", FIELD: "PART_C_EXIT", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_3_EXT", FIELD: "PART_C_EXIT", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_1_ECO", FIELD: "PART_C_ECO", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_2_ECO", FIELD: "PART_C_ECO", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_3_ECO", FIELD: "PART_C_ECO", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}

        //(9 point data) TSGOLDPTB_1_ENT_9POINT
        ,{TEST: "TSGOLD", CODE:"PTB_1_ENT_9POINT", FIELD: "PART_B_ENTRY", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_2_ENT_9POINT", FIELD: "PART_B_ENTRY", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_3_ENT_9POINT", FIELD: "PART_B_ENTRY", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_1_EXT_9POINT", FIELD: "PART_B_EXIT", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_2_EXT_9POINT", FIELD: "PART_B_EXIT", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTB_3_EXT_9POINT", FIELD: "PART_B_EXIT", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}

        ,{TEST: "TSGOLD", CODE:"PTC_1_ENT_9POINT", FIELD: "PART_C_ENTRY", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_2_ENT_9POINT", FIELD: "PART_C_ENTRY", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_3_ENT_9POINT", FIELD: "PART_C_ENTRY", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_1_EXT_9POINT", FIELD: "PART_C_EXIT", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_2_EXT_9POINT", FIELD: "PART_C_EXIT", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{TEST: "TSGOLD", CODE:"PTC_3_EXT_9POINT", FIELD: "PART_C_EXIT", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}


        //Added for LDOE but may appear at other customers
        ,{TEST: "TSGOLD", CODE:"SOCEM", FIELD: "SOCIAL-EMOTIONAL", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "TSGOLD", CODE:"PHY", FIELD: "PHYSICAL", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "TSGOLD", CODE:"LANG", FIELD: "LANGUAGE", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "TSGOLD", CODE:"SPAN_LANG", FIELD: "SPANISH_LANGUAGE", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "TSGOLD", CODE:"COG", FIELD: "COGNITIVE", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "TSGOLD", CODE:"LIT", FIELD: "LITERACY", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "TSGOLD", CODE:"SPAN_LIT", FIELD: "SPANISH_LITERACY", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "TSGOLD", CODE:"MATH", FIELD: "MATHEMATICS", MAP_FUNCTION: mapScaleScore}

        ,{ TEST: "TSGOLD", CODE: "PTC_1_COSF", FIELD: "PART_C_COSF", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{ TEST: "TSGOLD", CODE: "PTC_2_COSF", FIELD: "PART_C_COSF", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{ TEST: "TSGOLD", CODE: "PTC_3_COSF", FIELD: "PART_C_COSF", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}
        ,{ TEST: "TSGOLD", CODE: "PTC_1_COSF_9POINT", FIELD: "PART_C_COSF", FIELD_NUM: "1", MAP_FUNCTION: mapPartScore}
        ,{ TEST: "TSGOLD", CODE: "PTC_2_COSF_9POINT", FIELD: "PART_C_COSF", FIELD_NUM: "2", MAP_FUNCTION: mapPartScore}
        ,{ TEST: "TSGOLD", CODE: "PTC_3_COSF_9POINT", FIELD: "PART_C_COSF", FIELD_NUM: "3", MAP_FUNCTION: mapPartScore}

    ];


    var ageDecodeColors = {
        "1 to 2 years (Orange)": "Orange",
        "1 to 2 years": "Orange",
        "2 to 3 years (Yellow)": "Yellow",
        "2 to 3 years": "Yellow",
        "Birth to 1 year (Red)": "Red",
        "Birth to 1 year": "Red",
        "Kindergarten (Purple)": "Purple",
        "Kindergarten": "Purple",
        "Pre-K 4 class/grade (Blue)": "Blue",
        "Pre-K 4 class/grade": "Blue",
        "Preschool 3 class/grade (Green)": "Green",
        "Preschool 3 class/grade": "Green",
        "Pre-K 3 class/grade (Blue)": "Blue",
        "Pre-K 3 class/grade": "Blue",
        "" : null,
        null : null
    };
    var ageDecodeGrade = {
        "1 to 2 years (Orange)": "PK",
        "1 to 2 years": "PK",
        "2 to 3 years (Yellow)": "PK",
        "2 to 3 years": "PK",
        "Birth to 1 year (Red)": "PK",
        "Birth to 1 year": "PK",
        "Kindergarten (Purple)": "KG",
        "Kindergarten": "KG",
        "Pre-K 4 class/grade (Blue)": "PK",
        "Pre-K 4 class/grade": "PK",
        "Preschool 3 class/grade (Green)": "PK",
        "Preschool 3 class/grade": "PK",
        "Pre-K 3 class/grade (Blue)": "PK",
        "Pre-K 3 class/grade": "PK",
        "" : null,
        null : null
    };
    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function getTEST_ADMIN_PERIOD(assessPeriod) {
        return hierarchy.REPORTING_PERIOD;
    }
    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/

    function mapOverallScore(row, testMetadata) {

        try {
            if(row.getField("STUDENT_ID#") === undefined
                || row.getField("STUDENT_ID#") === null
                || row.getField("STUDENT_ID#") === "") {
                return null;
            }
            var score = {};
            var testNumber = null;
            var objective = testMetadata.FIELD;
            var objectiveScore = row.getField("OBJECTIVE_"+objective);
            if(objective === "1A" || objective === "S1A" || objective === "9D" || objective === "S9D"){
                if(objectiveScore < 3 ){
                    var objectiveDecode = "Partially Approaches";
                }else if (objectiveScore >= 3 && objectiveScore <= 4){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 5 && objectiveScore <= 8){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 8){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "10B" || objective === "S10B" || objective === "3B" || objective === "S3B" || objective === "1B" || objective === "S1B" || objective === "11A" || objective === "S11A" || objective === "11C" || objective === "S11C" || objective === "11D" || objective === "S11D" || objective === "12A" || objective === "S12A" || objective === "12B" || objective === "S12B" || objective === "21A" || objective === "S21A"){
                if(objectiveScore < 4 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 4){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 5 && objectiveScore <= 7){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 7){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "1C" || objective === "S1C" || objective === "4" || objective === "S4" || objective === "5" || objective === "S5" || objective === "6" || objective === "S6" || objective === "7A" || objective === "S7A" || objective === "4A" || objective === "S4A" || objective === "4B" || objective === "S4B" || objective === "4C" || objective === "S4C" || objective === "5A" || objective === "S5A" || objective === "5B" || objective === "S5B" || objective === "5C" || objective === "S5C" || objective === "6A" || objective === "S6A" || objective === "6B" || objective === "S6B" || objective === "6C" || objective === "S6C" || objective === "8A" || objective === "S8A"){
                if(objectiveScore < 5 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 5){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 6 || objectiveScore <= 8){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 8){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "2A" || objective === "S2A"){
                if(objectiveScore < 6 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 6){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 7 && objectiveScore <= 8){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 8){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "2B" || objective === "S2B" || objective === "2C" || objective === "S2C" || objective === "2D" || objective === "S2D" || objective === "20A" || objective === "S20A" || objective === "21B" || objective === "S21B"){
                if(objectiveScore < 3 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore >= 3 && objectiveScore <= 4){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 5 && objectiveScore <= 6){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 6){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "3A" || objective === "S3A" || objective === "20B" || objective === "S20B" || objective === "15A" || objective === "S15A" || objective === "13" || objective === "S13" || objective === "14A" || objective === "S14A" || objective === "14B" || objective === "S14B"){
                if(objectiveScore < 3 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 3){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 4 && objectiveScore <= 6){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 6){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "7B" || objective === "S7B" || objective === "9C" || objective === "S9C"){
                if(objectiveScore < 3 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore >= 3 && objectiveScore <= 4){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 5 && objectiveScore <= 7){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 7){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "8B" || objective === "S8B"){
                if(objectiveScore < 4 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 4){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 5 && objectiveScore <= 8){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 8){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "9A" || objective === "S9A"){
                if(objectiveScore < 5 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore >= 5 && objectiveScore <= 7){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 7){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "9B" || objective === "S9B" || objective === "10A" || objective === "S10A"){
                if(objectiveScore < 5 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 5){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 6 && objectiveScore <= 7){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 7){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "11B" || objective === "S11B"){
                if(objectiveScore < 4 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 4){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 5 && objectiveScore <= 6){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 6){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "23" || objective === "S23" || objective === "17A" || objective === "S17A" || objective === "11E" || objective === "S11E"){
                if(objectiveScore < 3 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 3){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 4 && objectiveScore <= 7){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 7){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "15B" || objective === "17B" || objective === "18A" || objective === "18B" || objective === "19A" || objective === "S15B" || objective === "S17B" || objective === "S18A" || objective === "S18B" || objective === "S19A"){
                if(objectiveScore < 2 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 2){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 3 && objectiveScore <= 6){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 6){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "15C" || objective === "S15C"){
                if(objectiveScore < 1 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 1){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 2 && objectiveScore <= 5){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 5){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "16A" || objective === "S16A"){
                if(objectiveScore < 2 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore >= 2 && objectiveScore <= 5){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 5){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "16B" || objective === "S16B"){
                if(objectiveScore < 1 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 1){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 2 && objectiveScore <= 6){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 6){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "18C" || objective === "S18C"){
                if(objectiveScore < 2 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore >= 2 && objectiveScore <= 6){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 6){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "19B" || objective === "S19B"){
                if(objectiveScore < 2 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore == 2){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 3 && objectiveScore <= 5){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 5){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "20C" || objective === "S20C"){
                if(objectiveScore < 2 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore >= 2 && objectiveScore <= 3){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 4 && objectiveScore <= 6){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 6){
                    objectiveDecode = "Exceeds";
                }
            }else if(objective === "22A" || objective === "S22A" || objective === "22B" || objective === "S22B" || objective === "22C" || objective === "S22C"){
                if(objectiveScore < 2 ){
                    objectiveDecode = "Partially Approaches";
                }else if (objectiveScore >= 2 && objectiveScore <= 3){
                    objectiveDecode = "Approaches";
                }else if (objectiveScore >= 4 && objectiveScore <= 7){
                    objectiveDecode = "Meets";
                }else if (objectiveScore > 7){
                    objectiveDecode = "Exceeds";
                }
            }else{
                objectiveDecode = "Level " + objectiveScore;
            }
            testNumber = testMetadata.TEST
                        + "_OBJ_" + objective;
            if(objectiveScore === undefined || objectiveScore === null || objectiveScore === ""){
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_PRIMARY_RESULT_CODE = objectiveScore;
            score.TEST_PRIMARY_RESULT = objectiveDecode;
            score.TEST_SCORE_TEXT = objectiveScore;
            score.TEST_SCALED_SCORE = objectiveScore;
            score.TEST_SCORE_VALUE = objectiveScore;
            score.TEST_SECONDARY_RESULT = ageDecodeColors[row.getField("GOLD_AGE_OR_CLASS_GRADE")];//TODO no longer exists at LDOE
            score.TEST_TERTIARY_RESULT = ageDecodeGrade[row.getField("GOLD_AGE_OR_CLASS_GRADE")];
            score.TEST_SCORE_ATTRIBUTES = row.getField("GOLD_AGE_OR_CLASS_GRADE");

            return score;
        } catch(exception) {
           throw "${_thisModuleName}.mapOverallScore Exception: ${exception}";
        }
    }

    function mapPartScore(row, testMetadata) {
        try {
            if(row.getField("STUDENT_ID#") === undefined
                || row.getField("STUDENT_ID#") === null
                || row.getField("STUDENT_ID#") === "") {
                return null;
            }
            var score = {};
            var testNumber = null;
            testNumber = testMetadata.TEST + testMetadata.CODE;
            var partDate = row.getField(testMetadata.FIELD+"_DATE");

            if(testNumber.endsWith("9POINT")){
                var partScoreOutcome = row.getField(testMetadata.FIELD+"_SCORE_OUTCOME_"+testMetadata.FIELD_NUM+"_(9_POINT)");
            }
            else{
                var partScoreOutcome = row.getField(testMetadata.FIELD+"_SCORE_OUTCOME_"+testMetadata.FIELD_NUM);
            }

            if(partScoreOutcome === undefined || partScoreOutcome === null || partScoreOutcome === ""){
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_SCORE_TEXT = partScoreOutcome;
            score.TEST_SCALED_SCORE = partScoreOutcome;
            score.TEST_SCORE_VALUE = partScoreOutcome;
            score.TEST_SCORE_ATTRIBUTES = partDate;
            return score;
        } catch(exception) {
           throw "${_thisModuleName}.mapPartScore Exception: ${exception}";
        }
    }

    function mapScaleScore(row, testMetadata) {
        try {
            if(row.getField("STUDENT_ID#") === undefined
                || row.getField("STUDENT_ID#") === null
                || row.getField("STUDENT_ID#") === "") {
                return null;
            }
            var score = {};
            var testNumber = null;
            testNumber = testMetadata.TEST + testMetadata.CODE;
            var rawScore = row.getField(testMetadata.FIELD+"_RAW_SCORE");
            var scaleScore = row.getField(testMetadata.FIELD+"_SCALE_SCORE");
            var whe = row.getField(testMetadata.FIELD+"_WHE");
            var nn = row.getField(testMetadata.FIELD+"_NN");
            var kReady = row.getField(testMetadata.FIELD+"_K-READINESS");
            if(whe === undefined || whe === null || whe === ""){
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_SCORE_TEXT = scaleScore;
            score.TEST_SCALED_SCORE = scaleScore;
            score.TEST_RAW_SCORE = rawScore;
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_PRIMARY_RESULT_CODE = "WHE";
            score.TEST_PRIMARY_RESULT = whe;
            score.TEST_SECONDARY_RESULT_CODE = "KREAD";
            score.TEST_SECONDARY_RESULT = kReady;
            score.TEST_TERTIARY_RESULT_CODE = "NN";
            score.TEST_TERTIARY_RESULT = nn;
           //score.TEST_PERCENTILE_SCORE = nn;
            return score;
        } catch(exception) {
           throw "${_thisModuleName}.mapPartScore Exception: ${exception}";
        }
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

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);

            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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
        var birthDateObject = parseDate(row.getField("BIRTHDATE"));

        //LDOE padding
        // var districtVal = null;  // pre UIHN-9419:
        var schoolVal = null;
        var stateSchoolVal = null;
        if((row.getField("STATE")==="LA" || row.getField("STATE")==="MN") && row.getField("SITE_IDENTIFIER") !== null&& row.getField("SITE_IDENTIFIER") !== undefined && row.getField("SITE_IDENTIFIER") !== ""){
            stateSchoolVal = row.getField("SITE_IDENTIFIER");
            while(stateSchoolVal === null || stateSchoolVal.length<6){
                stateSchoolVal = "0"+stateSchoolVal;
            }

            if(stateSchoolVal.toString().substring(0,1)!=='0' && isNaN(stateSchoolVal.toString().substring(0,1))){
                schoolVal = stateSchoolVal.substring(0,3);
                // districtVal = stateSchoolVal.substring(3,6);  // pre UIHN-9419:
            }
            else{
                // districtVal = stateSchoolVal.substring(0,3);  // pre UIHN-9419:
                schoolVal = stateSchoolVal.substring(3,6);
            }

        }

        var stateID = null;
        if(row.getField("SOURCECHILDID")!==null
            && row.getField("SOURCECHILDID")!==undefined
            && row.getField("SOURCECHILDID")!==""
            && row.getField("SOURCECHILDID").toString().length>5){
            stateID = row.getField("SOURCECHILDID");
        } else {
            stateID = row.getField("MARSS");
        }

        var gender = null;
        if(row.getField("GENDER")!==null &&row.getField("GENDER")!==undefined && row.getField("GENDER")!==""){
            gender = row.getField("GENDER").substring(0,1);
        }

        var periodDate = null;
        if(hierarchy.REPORTING_PERIOD==="Winter" || hierarchy.REPORTING_PERIOD==="WINTER"){
            periodDate = "01/01/"+hierarchy.SCHOOL_YEAR.substring(5, 9);
        }
        else if(hierarchy.REPORTING_PERIOD==="Fall" || hierarchy.REPORTING_PERIOD==="FALL" ){
            periodDate = "09/01/"+(parseInt(hierarchy.SCHOOL_YEAR.substring(5, 9))-1);
        }
        else{
            periodDate = "05/01/"+hierarchy.SCHOOL_YEAR.substring(5, 9);
        }


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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   _util.coalesce(districtVal,AssessmentLoader.config.DISTRICT_CODE);
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                //case "TEST_REPORTING_DATE":
                    //record.TEST_REPORTING_DATE = "01/01/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
                    //break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE =  _util.coalesce(AppUtil.getDateObjByPattern(row.getField("DATE_FINALIZED"), "MM/dd/yyyy").STANDARD_DATE, parseDate(periodDate).STANDARD_DATE);
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
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("CHILD_F_NAME"), null);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("CHILD_MI"),null);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("CHILD_L_NAME"), null);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID#"), row.getField("CHILDID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(stateID, row.getField("STATE_STUDENTNUMBER"),null);
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("MARSS") != "#N/A" ? row.getField("MARSS") : null,
                        row.getField("STUDENT_ID#"),
                        row.getField("CHILDID")
                    );
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = gender;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(stateSchoolVal,row.getField("SITE_IDENTIFIER"),row.getField("SITE"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = row.getField("SITEID");
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = ageDecodeGrade[row.getField("AGE_GRADE")];
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = stateSchoolVal;
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SITE")
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
        var admin = {};

        admin.TEST_INTERVENTION_CODE = "IEP";
        admin.TEST_INTERVENTION_DESC = row.getField("HAS_IEP");
        return admin;
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

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + hierarchy.REPORTING_PERIOD+ "_" + _util.coalesce(srcRecord.getField(key),"") ;

        });

        return assessmentAdminKey;
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

        if (rawDate.length >= 9 && rawDate.indexOf('/') !== -1) {
            formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");

        } else if (rawDate.indexOf("/") > -1 && rawDate.length === 6) {
            formatter = new java.text.SimpleDateFormat("M/d/yyyy");

        } else if (rawDate.indexOf("/") > -1 && rawDate.length === 7) {
            var parts = rawDate.split("/");
            if (parts.length === 3) {
                var month = parts[0];
                var day = parts[1];
                if (month.length === 1 && day.length === 2) {
                    formatter = new java.text.SimpleDateFormat("M/dd/yyyy");
                } else if (month.length === 2 && day.length === 1) {
                    formatter = new java.text.SimpleDateFormat("MM/d/yyyy");
                }
            }

        } else if (rawDate.indexOf("/") > -1 && rawDate.length === 8) {
            var parts = rawDate.split("/");
            if (parts.length === 3) {
                var month = parts[0];
                var day = parts[1];
                if (month.length === 1 && day.length === 1) {
                    formatter = new java.text.SimpleDateFormat("M/d/yyyy");
                } else if (month.length === 1 && day.length === 2) {
                    formatter = new java.text.SimpleDateFormat("M/dd/yyyy");
                } else if (month.length === 2 && day.length === 1) {
                    formatter = new java.text.SimpleDateFormat("MM/d/yyyy");
                } else if (month.length === 2 && day.length === 2) {
                    formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
                }
            }

        } else if (rawDate.length >= 9 && rawDate.indexOf('-') !== -1) {
            formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");

        } else if (rawDate.length === 6) {
            formatter = new java.text.SimpleDateFormat("ddMMyy");

        } else {
            formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        }

        if (!formatter) {
            throw new Error("Unsupported date format: " + rawDate);
        }

        var parsedDate = formatter.parse(rawDate);

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
