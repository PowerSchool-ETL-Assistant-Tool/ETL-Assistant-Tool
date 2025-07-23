var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "DLM";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
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
            print("Loading using signature file ${signatureFormatName} \n");


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("Normalized file: ${normalizedFile} \n");

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
                .group_by("ADMINISTRATION GROUPING" , function(one, two){

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
                        if(!multipleRowsPerGroupingExpected && rows.length > 1){

                            //Report error for each row
                            rows.forEach(function(row){
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"],
                    function(output, rows) {
                        try{

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function(record){
                                output.RECORDS.put(record);
                            });

                        } catch(exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }


                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        // Report when no scores are found.
                        if(mappingObject.SCORE_MAPPINGS.length === 0){
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
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

        //TODO update scoresToMap mapISBEOverallScore
    var scoresToMap = [
            {TEST: "DLM", CODE:"_OVERALL", FIELD: "", MAP_FUNCTION: mapOverallScore}
            ,{TEST: "DLM", CODE:"_OVERALL", FIELD: "_ELA", MAP_FUNCTION: mapOverallScore}
            ,{TEST: "DLM", CODE:"_OVERALL", FIELD: "_MATH", MAP_FUNCTION: mapOverallScore}
            ,{TEST: "DLM", CODE:"_OVERALL", FIELD: "_SCI", MAP_FUNCTION: mapOverallScore}
            ,{TEST: "DLM", CODE:"_ISBE_OVR", FIELD: "_LEVEL", MAP_FUNCTION: mapISBEOverallScore}
            ,{TEST: "DLM", CODE:"", FIELD: "", MAP_FUNCTION: mapStandardScore}
            ,{TEST: "DLM", CODE:"_EE", FIELD: "", MAP_FUNCTION: mapEEScore}

            // EE_SCORES
            ,{TEST: "DLM", CODE:"EE", FIELD: "_1", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_2", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_3", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_4", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_5", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_6", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_7", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_8", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_9", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_10", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_11", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_12", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_13", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_14", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_15", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_16", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_17", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_18", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_19", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_20", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_21", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_22", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_23", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_24", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_25", STRING1: "",MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"EE", FIELD: "_26", STRING1: "",MAP_FUNCTION: mapScores}


            // ELA RL
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".3.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".3.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".3.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".3.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".3.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".3.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".4.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".4.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".4.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".4.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".4.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".4.6",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".5.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".5.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".5.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".5.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".5.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".5.6",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".5.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".6.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".6.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".6.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".6.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".6.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".6.6",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".7.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".7.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".7.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".7.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".7.5",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".8.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".8.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".8.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".8.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".8.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".8.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".910.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".910.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".910.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".910.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".910.5",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".1112.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".1112.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".1112.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".1112.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RL", STRING1: ".1112.5",  MAP_FUNCTION: mapScores}


            //ELA L
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".3.5.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".3.5.c",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".4.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".4.2.d",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".4.5.c",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".5.4.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".5.5.c",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".6.2.b",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".6.5.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".6.5.b",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".7.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".7.2.b",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".8.5.a",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".910.2.c",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".910.4.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".910.5.b",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".1112.4.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".L",STRING1: ".1112.2.b",  MAP_FUNCTION: mapScores}

            // ELA RI
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".3.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".3.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".3.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".3.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".3.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".3.8",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".3.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".4.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".4.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".4.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".4.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".4.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".4.8",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".4.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".5.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".5.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".5.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".5.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".5.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".5.7",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".5.8",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".5.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".6.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".6.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".6.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".6.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".6.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".6.6",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".6.8",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".6.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".7.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".7.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".7.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".7.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".7.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".7.6",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".7.8",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".7.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".8.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".8.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".8.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".8.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".8.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".8.6",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".8.8",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".8.9",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".910.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".910.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".910.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".910.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".910.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".910.8",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".1112.1",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".1112.2",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".1112.3",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".1112.4",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".1112.5",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".1112.8",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".RI", STRING1: ".1112.9",  MAP_FUNCTION: mapScores}


            //ELA W
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".3.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".3.4",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".4.2.b",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".5.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".5.2.b",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".6.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".6.2.b",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".7.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".7.2.b",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".7.2.d",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".8.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".8.2.b",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".8.2.c",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".8.2.d",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".8.2.f",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".910.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".910.2.b",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".910.2.c",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".910.2.d",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".910.2.f",  MAP_FUNCTION: mapScores}

            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".1112.2.a",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".1112.2.b",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".1112.2.c",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".1112.2.d",  MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"ELA", FIELD: ".W", STRING1: ".1112.2.f",  MAP_FUNCTION: mapScores}



            //MATH 3
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".G.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".MD.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".MD.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".MD.4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".NBT.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".NBT.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".NF.13", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".OA.4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".OA.8", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".OA.9", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".3",STRING1: ".OA.12", MAP_FUNCTION: mapScores}

            //MATH 4
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".MD.2.d", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".G.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".MD.2.a", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".MD.2.b", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".MD.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".MD.4.b", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".MD.5", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".MD.6", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".NBT.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".NBT.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".NBT.4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".NF.12", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".NF.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".OA.12", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".OA.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".4",STRING1: ".OA.5", MAP_FUNCTION: mapScores}

            //MATH 5
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".G.14", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".MD.1.a", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".MD.1.b", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".MD.1.c", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".MD.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".MD.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".MD.45", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".NBT.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".NBT.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".NBT.4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".NBT.5", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".NBT.67", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".NF.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".OA.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".5",STRING1: ".NF.1", MAP_FUNCTION: mapScores}

            //MATH 6
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".G.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".EE.12", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".EE.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".EE.57", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".G.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".NS.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".NS.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".NS.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".NS.58", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".RP.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".6",STRING1: ".SP.5", MAP_FUNCTION: mapScores}

            //MATH 7
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".EE.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".EE.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".G.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".G.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".G.4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".G.5", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".NS.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".NS.2.a", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".NS.2.b", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".NS.2.cd", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".NS.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".RP.13", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".SP.3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".7",STRING1: ".SP.57", MAP_FUNCTION: mapScores}

            //MATH 8
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".EE.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".EE.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".G.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".G.2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".G.4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".G.5", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".NS.1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".NS.2.a", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".NS.2.b", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".EE.7", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".F.13", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".F.4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".SP.4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".8",STRING1: ".G.9", MAP_FUNCTION: mapScores}

            //OTHER MATH
            ,{TEST: "DLM", CODE:"M", FIELD: ".ACED",STRING1: ".1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".ACED",STRING1: ".24", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".AREI",STRING1: ".1012", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".ASSE",STRING1: ".1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".ASSE",STRING1: ".3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".ASSE",STRING1: ".4", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".FBF",STRING1: ".1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".FBF",STRING1: ".2", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".FIF",STRING1: ".13", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".FIF",STRING1: ".46", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".FLE",STRING1: ".13", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".GCO",STRING1: ".1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".GCO",STRING1: ".45", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".GCO",STRING1: ".68", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".GGPE",STRING1: ".7", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".GMG",STRING1: ".13", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".NCN",STRING1: ".2.a", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".NCN",STRING1: ".2.b", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".NCN",STRING1: ".2.c", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".NQ",STRING1: ".13", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".NRN",STRING1: ".1", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".SCP",STRING1: ".15", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".SIC",STRING1: ".12", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".SID",STRING1: ".12", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".SID",STRING1: ".3", MAP_FUNCTION: mapScores}
            ,{TEST: "DLM", CODE:"M", FIELD: ".SID",STRING1: ".4", MAP_FUNCTION: mapScores}
            //ELA
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".ELA",STRING1: ".C1.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".ELA",STRING1: ".C1.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".ELA",STRING1: ".C1.3", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".ELA",STRING1: ".C2.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".ELA",STRING1: ".C2.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".ELA",STRING1: ".C1.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".ELA",STRING1: ".C1.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".ELA",STRING1: ".C1.3", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".ELA",STRING1: ".C2.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".ELA",STRING1: ".C2.2", MAP_FUNCTION: mapScores1}


           //MATH
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C1.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C1.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C1.3", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C2.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C2.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C3.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C3.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C4.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".M",STRING1: ".C4.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C1.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C1.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C1.3", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C2.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C2.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C3.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C3.2", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C4.1", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".M",STRING1: ".C4.2", MAP_FUNCTION: mapScores1}

           //SCI
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".SCI",STRING1: ".ESS", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".SCI",STRING1: ".LS", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"LLS.MASTERED", FIELD: ".SCI",STRING1: ".PS", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".SCI",STRING1: ".ESS", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".SCI",STRING1: ".LS", MAP_FUNCTION: mapScores1}
           ,{TEST: "DLM", CODE:"DENOMINATOR", FIELD: ".SCI",STRING1: ".PS", MAP_FUNCTION: mapScores1}





        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
        //TODO add any additional decodes

     var genderDecode = {
        "Female" : "Female",
        "Male" : "Male",
        "1": "Female",
        "2": "Male",
        "F": "Female",
        "M": "Male",
        "" : null,
        null : null
     };

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
            ,"" : null
            ,null : null
        };


    var performanceDecode = {
        "1": "Emerging"
        ,"2" : "Approaching The Target"
        ,"3" : "At Target"
        ,"4" : "Advanced"
        ,"9" : "Not tested"
        ,"" : null
        ,null : null
    };

    var primaryDecode = {
        "Emerging" : "1"
        ,"Approaching" : "2"
        ,"Approaching Target" : "2"
        ,"At Target" : "3"
        ,"Advanced" : "4"
        ,"Not tested" : "9"
        ,"" : null
        ,null : null
    };

    var EEDecode = {
        "0" : "No evidence of mastery"
        ,"1": "Initial precursor"
        ,"2" : "Distal precursor"
        ,"3" : "Proximal precursor"
        ,"4" : "Target"
        ,"5" : "Successor"
        ,"9" : "Not assessed"
        ,"" : null
        ,null : null
    };

    var subjectDecode = {
        "ELA" : "ELA"
        ,"Math" : "MA"
        ,"MAT" : "MATH"
        ,"SCI"  : "SCI"
        ,"" : null
        ,null : null
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);
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
        var birthDate = row.getField("DATE_OF_BIRTH");

        var birthDateObject = {
                  MONTH : null
                , DAY : null
                , YEAR : null
                , STANDARD_DATE : null
        }

        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
             birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        var testAdminDate;
        if(row.getField("TEST_DATE") == undefined || row.getField("TEST_DATE") == null || row.getField("TEST_DATE") == "") {
            testAdminDate = "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9);
        } else {
            if (signature.getFormat().getFormatName() === "DLM_ISBE_SIS_21_22" || signature.getFormat().getFormatName() === "DLM_13_COLS"){
                testAdminDate = AppUtil.getMonthFollowedByDay(row.getField("TEST_DATE")).STANDARD_DATE;
            }else{
                testAdminDate = AppUtil.getDayFollowedByMonth(row.getField("TEST_DATE")).STANDARD_DATE;
            }
        }

        var studentName = _util.coalesce(row.getField("STUDENT_NAME"));
                    if (studentName != null){
                        var splitName = studentName.split(",",2);
                        var studentFirstName = splitName[1];
                        var studentLastName = splitName[0];
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE =  testAdminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENTID")
                    ,row.getField("STUDENT_LOCAL_ID")
                    ,row.getField("DISTRICT_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_IDENTIFIER")
                        ,row.getField("STUDENT_STATE_ID")
                        ,row.getField("DISTRICT_STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_IDENTIFIER")
                        ,row.getField("STUDENT_ID")
                        ,row.getField("STUDENT_STATE_ID")
                        ,row.getField("DISTRICT_STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(studentFirstName, row.getField('STUDENT_LEGAL_FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(studentLastName, row.getField('STUDENT_LEGAL_LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_LEGAL_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = genderDecode[row.getField("GENDER")];
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('CURRENT_GRADE_LEVEL')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOL_CODE"), row.getField("DISTRICT_CODE"), row.getField("SCHOOL"), row.getField("TESTEDATSCHOOL"), row.getField("SCHOOL_VENDOR_ID"),"DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("TESTEDATSCHOOL"), row.getField("SCHOOL_LOCAL_ID"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("TESTEDATSCHOOL"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), row.getField("TESTEDATSCHOOL"));
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
        admin["TEST_INTERVENTION_CODE"] = row.getField("AYP");
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapOverallScore(row, testMetadata, signature) {
        var score = {};
        var signatureFormatName = signature.getFormat().getFormatName();

        if(signatureFormatName === 'DLM_WITH_EE'){
            return null;
        }
        
        if(signatureFormatName === 'DLM_2015_16' || signatureFormatName === 'DLM_14_15'){
            var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD;
        } else{
            var subject = row.getField('SUBJECT');
            if(subject === null || subject === '' || subject === undefined){
                return null;
            }
            subject = subject.toUpperCase();
            var testNumber = testMetadata.TEST + testMetadata.CODE + "_" + subject;
        }
            var performanceLevel = "PERFORMANCE_LEVEL" + testMetadata.FIELD;
            var invalidationCode = "INVALIDATION_CODE" + testMetadata.FIELD;
            var elatotalsm = row.getField("ELA_TOTAL_SKILLS_MASTERED");
            var mathtotalsm = row.getField("MATH_TOTAL_SKILLS_MASTERED");

        if(row.getField(performanceLevel) === null || performanceLevel === undefined || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === ""||row.getField(performanceLevel) === "9")
        {
            return null;
        }
        if(row.getField("SGP") !== null || ( row.getField("SGP_ELA") !== null || row.getField("SGP_MATH") !== null)){
            score["TEST_PERCENTAGE_SCORE"] = row.getField("SGP" + testMetadata.FIELD);
        }
        score["TEST_NUMBER"] = testNumber;
        if(testMetadata.FIELD === ""){
            score["TEST_SECONDARY_RESULT"] = row.getField("FINAL_BAND");
        }
        else{
            score["TEST_SECONDARY_RESULT"] = row.getField("FINAL" + testMetadata.FIELD + "_BAND");
        }
        score["TEST_PRIMARY_RESULT_CODE"] = row.getField(performanceLevel);
        score["TEST_SCORE_VALUE"] = row.getField(performanceLevel);
        score["TEST_PRIMARY_RESULT"] = performanceDecode[row.getField(performanceLevel)];
        if(elatotalsm){
            score["TEST_TERTIARY_RESULT_CODE"] = "ELA TotM";
            score["TEST_TERTIARY_RESULT"] = elatotalsm;
        }
        if(mathtotalsm){
            score["TEST_QUATERNARY_RESULT_CODE"] = "MA TotM";
            score["TEST_QUATERNARY_RESULT"] =  mathtotalsm;
        }

        return score;
    }

    function mapScores(row, testMetadata) {
        var score = {};
        var signatureFormatName = signature.getFormat().getFormatName();

        if(signatureFormatName === 'DLM_WITH_EE'){
            return null;
        }
        
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + testMetadata.FIELD.replace(".","_") + testMetadata.STRING1.replace(".","_");
        if(row.getField("SUBJECT") !== null){
            testNumber = testNumber + "_" + subjectDecode[row.getField("SUBJECT")];
        }
        var EECode = testMetadata.CODE + testMetadata.FIELD + testMetadata.STRING1;
        if(row.getField(EECode) === null ||row.getField(EECode) === "9")
        {
            return null;
        }
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = EECode;
        score["TEST_SCORE_VALUE"] = row.getField(EECode);

        score["TEST_PRIMARY_RESULT_CODE"] = row.getField(EECode);
        score["TEST_PRIMARY_RESULT"] = EEDecode[row.getField(EECode)];

        return score;
    }

   function mapScores1(row, testMetadata) {
       var score = {};

       var signatureFormatName = signature.getFormat().getFormatName();

       if(signatureFormatName === 'DLM_WITH_EE'){
           return null;
       }
//            var Signature  = signature.getFormat().getFormatName()
//            if(signature.getFormat().getFormatName() === 'DLM_2017_18') {
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + testMetadata.FIELD.replace(".","_") + testMetadata.STRING1.replace(".","_");
        var performanceLevel = row.getField("PERFORMANCE_LEVEL");
        if(row.getField("SUBJECT") !== null){
            testNumber = testNumber +  testMetadata.FIELD.replace(".","_");
        }
        var EECode = testMetadata.CODE + testMetadata.FIELD + testMetadata.STRING1;
        //}
        if(row.getField(EECode) === null ||row.getField(EECode) === "9")
        {
            return null;
        }
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = EECode;
        score["TEST_SCORE_VALUE"] = row.getField(EECode);
        score["TEST_PRIMARY_RESULT_CODE"] = row.getField(EECode);
        score["TEST_PRIMARY_RESULT"] = EEDecode[row.getField(EECode)];
        score["TEST_SECONDARY_RESULT"] = performanceLevel;
        score["TEST_SECONDARY_RESULT_CODE"] = performanceDecode[performanceLevel];

        return score;
   }
  //For ISBE files
   function mapISBEOverallScore(row, testMetadata) {
       var score = {};

       var signatureFormatName = signature.getFormat().getFormatName();

       if(signatureFormatName === 'DLM_WITH_EE'){
           return null;
       }
       var subject = subjectDecode[_util.coalesce(row.getField("TEST_CODE"), row.getField("SUBJECT"))];
       var testNumber = testMetadata.TEST + testMetadata.CODE + "_" + subject;

       var performanceLevel = row.getField("FINAL_PERFORMANCE" + testMetadata.FIELD);

       if( performanceLevel === null || performanceLevel === '' || performanceLevel === undefined){
          return null;
       }

       score["TEST_NUMBER"] = testNumber;
       score["TEST_PRIMARY_RESULT"] = performanceDecode[performanceLevel];
       score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;

       return score;
   }

    function mapStandardScore(row, testMetadata) {
        var score = {};
        var sub = null;
        var signatureFormatName = signature.getFormat().getFormatName();

        if(signatureFormatName === 'DLM_WITH_EE'){
            return null;
        }
        
        var fileName = row.getRawField("LINEAGE_FILE").toString();
        var subject = row.getField("TEST_ASSESSMENT_TYPE");
        if (subject != null ){
            if (subject.indexOf('Math') > -1) {
                sub = "MATH";
            } else if (subject.indexOf('ELA') > -1) {
                sub = "ELA";
            } else if (subject.indexOf('Science') > -1) {
                sub = "SCIENCE";
            }
        } else{
            if (fileName.indexOf('Math') > -1){
                sub = "MATH";
            } else if (fileName.indexOf('ELA') > -1){
                sub = "ELA";
            } else if (fileName.indexOf('Science') > -1) {
                sub = "SCIENCE";
            }
        }
        var testNumber = testMetadata.TEST + "_" + sub;
        var performanceLevel = row.getField("TEST_PRIMARY_RESULT");

        if( performanceLevel === null || performanceLevel === '' || performanceLevel === undefined){
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performanceLevel];

        return score;
    }


    function mapEEScore(row, testMetadata) {
        var score = {};
        var sub = null;

        //only map for valid signatures with EE only information, otherwise skip
        if(row.getField("EE_TESTED")===undefined){
            return null;
        }
        
        var fileName = row.getRawField("LINEAGE_FILE").toString();
        var subject = row.getField("SUBJECT");
        if (subject != null ){
            if (subject.indexOf('Math') > -1) {
                sub = "MA";
            } else if (subject.indexOf('English Language') > -1) {
                sub = "ELA";
            } else if (subject.indexOf('Science') > -1) {
                sub = "SCI";
            }
        } else{
            if (fileName.indexOf('Math') > -1){
                sub = "MA";
            } else if (fileName.indexOf('English Language') > -1){
                sub = "ELA";
            } else if (fileName.indexOf('Science') > -1) {
                sub = "SCI";
            }
        }
        var testNumber = testMetadata.TEST + "_TOT_EE_" + sub;
        var performanceLevel = row.getField("TEST_PRIMARY_RESULT");
        var totalEE = row.getField("EE_TESTED");
        var scoredEE = row.getField("EE_AT_ABOVE");
        var mastered = row.getField("SKILLS_MASTERED");

        if( performanceLevel === null || performanceLevel === '' || performanceLevel === undefined){
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performanceLevel];
        if(!isNaN(scoredEE)) {
            score["TEST_ITEMS_ATTEMPTED"] = scoredEE;
        }
        if(!isNaN(totalEE)){
        score["TEST_ITEMS_POSSIBLE"] = totalEE;
        }
        score["TEST_SECONDARY_RESULT"] = mastered;
        score["TEST_SECONDARY_RESULT_CODE"] = "TotM";
        
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

    function getUniqueNaturalKey(row, signature){
        var score = null;
        if(signature.getFormat().getFormatName() === 'DLM_2017_18'){
            var subject = row.getField('SUBJECT').toUpperCase();
            if(subject === 'ELA'){
                score = row.getField('DENOMINATOR.ELA.C1.1');
            } else if(subject === 'MATH'){
                score = row.getField("DENOMINATOR.M.C1.1");
            }else if(subject === 'SCI'){
                score = row.getField("DENOMINATOR.SCI.ESS");
            }
        }
        return score;
    }

    /**
     * Generates an Assessment Admin Key using a combination of hierarchy values and natural keys from an assessment signature
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param srcRecord The assessment record being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, row) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        var score =  getUniqueNaturalKey(row, signature);

        if(score){
            assessmentAdminKey = assessmentAdminKey + "_" + score;
        }
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(row.getField(key),"");
        });
        return assessmentAdminKey;
    }

    return module;
}());