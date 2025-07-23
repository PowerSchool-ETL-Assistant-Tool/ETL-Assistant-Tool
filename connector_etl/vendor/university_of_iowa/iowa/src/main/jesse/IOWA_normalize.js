var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IOWA";
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
			print("Loading using signature file ${signatureFormatName}");
            var normalizedFile = AppUtil.createResultsFile(file);
            print("Normalized file: ${normalizedFile}");
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
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
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

     var ITBS2005testNumberLookup ={
             "01" : {SLOT: "01", TEST_NUMBER_PART: "_RV"}, // Vocabulary
             "02" : {SLOT: "02", TEST_NUMBER_PART: "_RC"}, // Reading Comprehension
             "03" : {SLOT: "03", TEST_NUMBER_PART: "_RT"}, // READING TOTAL
             "04" : {SLOT: "04", TEST_NUMBER_PART: "_WA"}, // Word Analysis
             "05" : {SLOT: "05", TEST_NUMBER_PART: "_LI"}, // Listening
             "06" : {SLOT: "06", TEST_NUMBER_PART: "_L-1"}, // SPELLING
             "07" : {SLOT: "07", TEST_NUMBER_PART: "_L-2"}, // Capitalization
             "08" : {SLOT: "08", TEST_NUMBER_PART: "_L-3"}, // Punctuation
             "09" : {SLOT: "09", TEST_NUMBER_PART: "_L-4"}, // Usage/Expression
             "10" : {SLOT: "10", TEST_NUMBER_PART: "_LT"}, // LANGUAGE TOTAL
             "11" : {SLOT: "11", TEST_NUMBER_PART: "_M-1"}, // Concepts & Estimation
             "12" : {SLOT: "12", TEST_NUMBER_PART: "_M-2"}, // Problems & Data Interpretation
             "13" : {SLOT: "13", TEST_NUMBER_PART: "_MT"}, // MATH TOTAL - Computation
             "14" : {SLOT: "14", TEST_NUMBER_PART: "_M-3"}, // Computation
             "15" : {SLOT: "15", TEST_NUMBER_PART: "_MT+/M"}, // MATH TOTAL + Computation
             "16" : {SLOT: "16", TEST_NUMBER_PART: "_CT-"}, // CORE TOTAL - Computation
             "17" : {SLOT: "17", TEST_NUMBER_PART: "_CT+"}, // CORE TOTAL + Computation
             "18" : {SLOT: "18", TEST_NUMBER_PART: "_SS"}, // Social Studies
             "19" : {SLOT: "19", TEST_NUMBER_PART: "_SC"}, // Science
             "20" : {SLOT: "20", TEST_NUMBER_PART: "_S-1"}, // Maps & Diagrams
             "21" : {SLOT: "21", TEST_NUMBER_PART: "_S-2"}, // Reference Materials
             "22" : {SLOT: "22", TEST_NUMBER_PART: "_ST"}, // SOURCES TOTAL
             "23" : {SLOT: "23", TEST_NUMBER_PART: "_CC-"}, // COMPLETE COMPOSITE - Computation
             "24" : {SLOT: "24", TEST_NUMBER_PART: "_CC+"}, // COMPLETE COMPOSITE + Computation
             "25" : {SLOT: "25", TEST_NUMBER_PART: ""}, // Blank
             "26" : {SLOT: "26", TEST_NUMBER_PART: ""}, // Blank
             "27" : {SLOT: "27", TEST_NUMBER_PART: ""}, // Blank
             "28" : {SLOT: "28", TEST_NUMBER_PART: ""}, // Blank
             "29" : {SLOT: "29", TEST_NUMBER_PART: ""}, // Blank
             "30" : {SLOT: "30", TEST_NUMBER_PART: ""} // Blank
          }

     var ITBS2002testNumberLookup ={
                  "01" : {SLOT: "01", TEST_NUMBER_PART: "_RV"}, // Vocabulary
                  "02" : {SLOT: "02", TEST_NUMBER_PART: "_RC"}, // Reading Comprehension
                  "03" : {SLOT: "03", TEST_NUMBER_PART: "_RT"}, // READING TOTAL
                  "04" : {SLOT: "04", TEST_NUMBER_PART: "_LI"}, // Listening
                  "05" : {SLOT: "05", TEST_NUMBER_PART: "_L-1"}, // SPELLING
                  "06" : {SLOT: "06", TEST_NUMBER_PART: "_L-2"}, // Capitalization
                  "07" : {SLOT: "07", TEST_NUMBER_PART: "_L-3"}, // Punctuation
                  "08" : {SLOT: "08", TEST_NUMBER_PART: "_L-4"}, // Language/Usage & Express/IWST Adv. Skills
                  "09" : {SLOT: "09", TEST_NUMBER_PART: "_LT"}, // Language Total/IWST
                  "10" : {SLOT: "10", TEST_NUMBER_PART: "_M-1"}, // Math Concepts & Est.
                  "11" : {SLOT: "11", TEST_NUMBER_PART: "_M-2"}, // Math Probs & Data Interp.
                  "12" : {SLOT: "12", TEST_NUMBER_PART: "_M-3"}, // Math Computation
                  "13" : {SLOT: "13", TEST_NUMBER_PART: "_MT"}, // MATH TOTAL
                  "14" : {SLOT: "14", TEST_NUMBER_PART: "_CT"}, // CORE TOTAL (SBT)
                  "15" : {SLOT: "15", TEST_NUMBER_PART: "_WA"}, // Word Analysis
                  "16" : {SLOT: "16", TEST_NUMBER_PART: "_SS"}, // Social Studies
                  "17" : {SLOT: "17", TEST_NUMBER_PART: "_SC"}, // Science
                  "18" : {SLOT: "18", TEST_NUMBER_PART: "_S1"}, // Map and Diagrams
                  "19" : {SLOT: "19", TEST_NUMBER_PART: "_S2"}, // Reference Materials
                  "20" : {SLOT: "20", TEST_NUMBER_PART: "_ST"}, // Sources of Info Total
                  "21" : {SLOT: "21", TEST_NUMBER_PART: "_CC"}, // Composite
                  "22" : {SLOT: "22", TEST_NUMBER_PART: "_MTX"}, // Math Total w/ Computation
                  "23" : {SLOT: "23", TEST_NUMBER_PART: "_CTX"}, // Core Total w/ Computation
                  "24" : {SLOT: "24", TEST_NUMBER_PART: "_CCX"}, // Composite w/ Computation
                  "25" : {SLOT: "25", TEST_NUMBER_PART: ""}, // Blank
                  "26" : {SLOT: "26", TEST_NUMBER_PART: ""}, // Blank
                  "27" : {SLOT: "27", TEST_NUMBER_PART: ""} // Blank
               }

     var ITED2005testNumberLookup ={
             "01" : {SLOT: "01", TEST_NUMBER_PART: "_RV"}, // Vocabulary
             "02" : {SLOT: "02", TEST_NUMBER_PART: "_RC"}, // Comprehension
             "03" : {SLOT: "03", TEST_NUMBER_PART: "_RT"}, // READING TOTAL
             "04" : {SLOT: "04", TEST_NUMBER_PART: "_WA"}, // Blank
             "05" : {SLOT: "05", TEST_NUMBER_PART: "_LI"}, // Blank
             "06" : {SLOT: "06", TEST_NUMBER_PART: "_L-1"}, // Spelling
             "07" : {SLOT: "07", TEST_NUMBER_PART: "_L-2"}, // Blank
             "08" : {SLOT: "08", TEST_NUMBER_PART: "_L-3"}, // Blank
             "09" : {SLOT: "09", TEST_NUMBER_PART: "_L-4"}, // Blank
             "10" : {SLOT: "10", TEST_NUMBER_PART: "_LT"}, // Revising Writing Material
             "11" : {SLOT: "11", TEST_NUMBER_PART: "_M-1"}, // Blank
             "12" : {SLOT: "12", TEST_NUMBER_PART: "_M-2"}, // Blank
             "13" : {SLOT: "13", TEST_NUMBER_PART: "_MT"}, // Concepts & Problems
             "14" : {SLOT: "14", TEST_NUMBER_PART: "_M-3"}, // Computation
             "15" : {SLOT: "15", TEST_NUMBER_PART: "_MT+/M"}, // MATH TOTAL + Computation
             "16" : {SLOT: "16", TEST_NUMBER_PART: "_CT-"}, // CORE TOTAL - Computation
             "17" : {SLOT: "17", TEST_NUMBER_PART: "_CT+"}, // CORE TOTAL + Computation
             "18" : {SLOT: "18", TEST_NUMBER_PART: "_SS"}, // Social Studies
             "19" : {SLOT: "19", TEST_NUMBER_PART: "_SC"}, // Science
             "20" : {SLOT: "20", TEST_NUMBER_PART: "_S-1"}, // Blank
             "21" : {SLOT: "21", TEST_NUMBER_PART: "_S-2"}, // Blank
             "22" : {SLOT: "22", TEST_NUMBER_PART: "_ST"}, // SOURCES TOTAL
             "23" : {SLOT: "23", TEST_NUMBER_PART: "_CC-"}, // COMPLETE COMPOSITE - Computation
             "24" : {SLOT: "24", TEST_NUMBER_PART: "_CC+"}, // COMPLETE COMPOSITE - Computation
             "25" : {SLOT: "25", TEST_NUMBER_PART: ""}, // Blank
             "26" : {SLOT: "26", TEST_NUMBER_PART: ""}, // Blank
             "27" : {SLOT: "27", TEST_NUMBER_PART: ""}, // Blank
             "28" : {SLOT: "28", TEST_NUMBER_PART: ""}, // Blank
             "29" : {SLOT: "29", TEST_NUMBER_PART: ""}, // Blank
             "30" : {SLOT: "30", TEST_NUMBER_PART: ""} // Blank
          }

     var ITED2002testNumberLookup = {
            "01" : {SLOT: "01", TEST_NUMBER_PART: "_RV"}, // Vocabulary
            "02" : {SLOT: "02", TEST_NUMBER_PART: "_RC"}, // Reading*
            "03" : {SLOT: "03", TEST_NUMBER_PART: "_RT"}, // READING TOTAL
            "04" : {SLOT: "04", TEST_NUMBER_PART: ""}, // Blank
            "05" : {SLOT: "05", TEST_NUMBER_PART: ""}, // Blank
            "06" : {SLOT: "06", TEST_NUMBER_PART: ""}, // Blank
            "07" : {SLOT: "07", TEST_NUMBER_PART: ""}, // Blank
            "08" : {SLOT: "08", TEST_NUMBER_PART: "_EXAS"}, // Expression Adv. Skills
            "09" : {SLOT: "09", TEST_NUMBER_PART: "_EX"}, // Expression
            "10" : {SLOT: "10", TEST_NUMBER_PART: ""}, // Blank
            "11" : {SLOT: "11", TEST_NUMBER_PART: "_QAS"}, // Quant Think Adv. Skills
            "12" : {SLOT: "12", TEST_NUMBER_PART: ""}, // Blank
            "13" : {SLOT: "13", TEST_NUMBER_PART: "_QT"}, // Quantitative Thinking
            "14" : {SLOT: "14", TEST_NUMBER_PART: "_CT"}, // CORE TOTAL (SBT)
            "15" : {SLOT: "15", TEST_NUMBER_PART: "_LM"}, // Literary Materials
            "16" : {SLOT: "16", TEST_NUMBER_PART: "_SS"}, // Social Studies
            "17" : {SLOT: "17", TEST_NUMBER_PART: "_SC"}, // Science
            "18" : {SLOT: "18", TEST_NUMBER_PART: ""}, // Blank
            "19" : {SLOT: "19", TEST_NUMBER_PART: ""}, // Blank
            "20" : {SLOT: "20", TEST_NUMBER_PART: "_ST"}, // Sources of Information
            "21" : {SLOT: "21", TEST_NUMBER_PART: "_CC"}, // Composite
            "22" : {SLOT: "22", TEST_NUMBER_PART: ""}, // Blank
            "23" : {SLOT: "23", TEST_NUMBER_PART: ""}, // Blank
            "24" : {SLOT: "24", TEST_NUMBER_PART: ""}, // Blank
            "25" : {SLOT: "25", TEST_NUMBER_PART: ""}, // Blank
            "26" : {SLOT: "26", TEST_NUMBER_PART: ""}, // Blank
            "27" : {SLOT: "27", TEST_NUMBER_PART: ""} // Blank
     }



    var scoresToMap = [
        // Reading
        {TEST: "IOWA", CODE:"03", FIELD: "_03", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"01", FIELD: "_01", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"02", FIELD: "_02", MAP_FUNCTION: mapComponentScore},
        // Language
        {TEST: "IOWA", CODE:"10", FIELD: "_10", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"04", FIELD: "_04", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"05", FIELD: "_05", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"06", FIELD: "_06", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"07", FIELD: "_07", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"08", FIELD: "_08", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"09", FIELD: "_09", MAP_FUNCTION: mapComponentScore},
        // Math
        {TEST: "IOWA", CODE:"13", FIELD: "_13", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"11", FIELD: "_11", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"12", FIELD: "_12", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"15", FIELD: "_15", MAP_FUNCTION: mapComponentScore},
        // Computation
        {TEST: "IOWA", CODE:"16", FIELD: "_16", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"17", FIELD: "_17", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"14", FIELD: "_14", MAP_FUNCTION: mapComponentScore},
        // Social Studies
        {TEST: "IOWA", CODE:"18", FIELD: "_18", MAP_FUNCTION: mapComponentScore},
        // Science
        {TEST: "IOWA", CODE:"19", FIELD: "_19", MAP_FUNCTION: mapComponentScore},
        // Sources
        {TEST: "IOWA", CODE:"22", FIELD: "_22", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"20", FIELD: "_20", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"21", FIELD: "_21", MAP_FUNCTION: mapComponentScore},
        // Composite
        {TEST: "IOWA", CODE:"23", FIELD: "_23", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"24", FIELD: "_24", MAP_FUNCTION: mapComponentScore},
        // Blank
        {TEST: "IOWA", CODE:"25", FIELD: "_25", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"26", FIELD: "_26", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"27", FIELD: "_27", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"28", FIELD: "_28", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"29", FIELD: "_29", MAP_FUNCTION: mapComponentScore},
        {TEST: "IOWA", CODE:"30", FIELD: "_30", MAP_FUNCTION: mapComponentScore},


        {TEST: "IOWA", CODE:"03", FIELD: "_3", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"01", FIELD: "_1", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"02", FIELD: "_2", MAP_FUNCTION: mapScaleScore},
        // Language
        {TEST: "IOWA", CODE:"10", FIELD: "_10", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"04", FIELD: "_4", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"05", FIELD: "_5", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"06", FIELD: "_6", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"07", FIELD: "_7", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"08", FIELD: "_8", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"09", FIELD: "_9", MAP_FUNCTION: mapScaleScore},
        // Math
        {TEST: "IOWA", CODE:"13", FIELD: "_13", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"11", FIELD: "_11", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"12", FIELD: "_12", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"15", FIELD: "_15", MAP_FUNCTION: mapScaleScore},
        // Computation
        {TEST: "IOWA", CODE:"16", FIELD: "_16", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"17", FIELD: "_17", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"14", FIELD: "_14", MAP_FUNCTION: mapScaleScore},
        // Social Studies
        {TEST: "IOWA", CODE:"18", FIELD: "_18", MAP_FUNCTION: mapScaleScore},
        // Science
        {TEST: "IOWA", CODE:"19", FIELD: "_19", MAP_FUNCTION: mapScaleScore},
        // Sources
        {TEST: "IOWA", CODE:"22", FIELD: "_22", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"20", FIELD: "_20", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"21", FIELD: "_21", MAP_FUNCTION: mapScaleScore},
        // Composite
        {TEST: "IOWA", CODE:"23", FIELD: "_23", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"24", FIELD: "_24", MAP_FUNCTION: mapScaleScore},
        // Blank
        {TEST: "IOWA", CODE:"25", FIELD: "_25", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"26", FIELD: "_26", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"27", FIELD: "_27", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"28", FIELD: "_28", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"29", FIELD: "_29", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"30", FIELD: "_30", MAP_FUNCTION: mapScaleScore},

        {TEST: "IOWA", CODE:"31", FIELD: "_31", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"32", FIELD: "_32", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"33", FIELD: "_33", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"34", FIELD: "_34", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"35", FIELD: "_35", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"36", FIELD: "_36", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"37", FIELD: "_37", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"38", FIELD: "_38", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"39", FIELD: "_39", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"40", FIELD: "_40", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"41", FIELD: "_41", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"42", FIELD: "_42", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"43", FIELD: "_43", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"44", FIELD: "_44", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"45", FIELD: "_45", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"46", FIELD: "_46", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"47", FIELD: "_47", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"48", FIELD: "_48", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"49", FIELD: "_49", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"50", FIELD: "_50", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"51", FIELD: "_51", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"52", FIELD: "_52", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"53", FIELD: "_53", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"54", FIELD: "_54", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"55", FIELD: "_55", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"56", FIELD: "_56", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"57", FIELD: "_57", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"58", FIELD: "_58", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"59", FIELD: "_59", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"60", FIELD: "_60", MAP_FUNCTION: mapScaleScore},

        // SAT Predictions
        {TEST: "IOWA", CODE:"PRED_SAT_VERBAL", FIELD: "PREDICTED_SAT_VERBAL", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"PRED_SAT_MATH", FIELD: "PREDICTED_SAT_MATH", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"PRED_SAT_CRI_RD", FIELD: "PREDICTED_SAT_CRITICAL_READING", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"PRED_SAT_COMP", FIELD: "PREDICTED_ACT_COMPOSITE", MAP_FUNCTION: mapPredictionScore},

        // ACT Predictions
        {TEST: "IOWA", CODE:"PRED_ACT_MATH", FIELD: "PREDICTED_ACT", MAP_FUNCTION: mapPredictionScore},
        // SCORE RANGE
        {TEST: "IOWA", CODE:"LEX_SC_R", FIELD: "LEXILE_SCORE_OF_RANGE", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"QUANT_SC_R", FIELD: "QUANTILE_SCORE_OF_RANGE", MAP_FUNCTION: mapPredictionScore},

        {TEST: "IOWA", CODE:"R", FIELD: "Reading", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"V", FIELD: "Vocabulary", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"SP", FIELD: "Spelling", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"CP", FIELD: "Capitalization", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"PC", FIELD: "Punctuation", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"L", FIELD: "Language (levels 05-08)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"WE", FIELD: "Written Expression (levels 09-17)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"L-WE", FIELD: "Language and Written Expression (levels 05-17)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"CW", FIELD: "Conventions of Writing", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"ET", FIELD: "ELA Total", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"WA", FIELD: "Word Analysis", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"LI", FIELD: "Listening", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"XET", FIELD: "Extended ELA Total", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"M", FIELD: "Mathematics (or MT without Comp)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"MC", FIELD: "Computation", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"MT", FIELD: "Math Total (with Comp)*", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"CT", FIELD: "Core Composite (with ELA)*", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"XCT", FIELD: "Core Composite (with Extended ELA)*", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"CT-", FIELD: "Core Composite (with ELA without Comp)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"XCT-", FIELD: "Core Composite (with Extended ELA without Comp)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"SS", FIELD: "Social Studies", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"SC", FIELD: "Science", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"CC", FIELD: "Complete Composite (with ELA)*", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"XCC", FIELD: "Complete Composite (with Extended ELA)*", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"CC-", FIELD: "Complete Composite (with ELA without Comp)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"XCC-", FIELD: "Complete Composite (with Extended ELA without Comp)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"RW", FIELD: "Reading Words for Level 06 only (this is Reading Part 1 reported in Slot 1)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"RC", FIELD: "Reading Comprehension for Level 06 only (this is Reading Part 2 reported in Slot 1)", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"RT", FIELD: "Reading Total", MAP_FUNCTION: mapPredictionScore},
        {TEST: "IOWA", CODE:"LT", FIELD: "Language Total", MAP_FUNCTION: mapPredictionScore},
        //{TEST: "IOWA", CODE:"29", FIELD: "", MAP_FUNCTION: mapPredictionScore},
        //{TEST: "IOWA", CODE:"30", FIELD: "", MAP_FUNCTION: mapPredictionScore},


        // mapScaledScore
        {TEST: "IOWA", CODE:"R", FIELD: "Reading", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"V", FIELD: "Vocabulary", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"SP", FIELD: "Spelling", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"CP", FIELD: "Capitalization", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"PC", FIELD: "Punctuation", MAP_FUNCTION: mapScaleScore},

        {TEST: "IOWA", CODE:"L", FIELD: "Language (levels 05-08)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"WE", FIELD: "Written Expression (levels 09-17)", MAP_FUNCTION: mapScaleScore},

        {TEST: "IOWA", CODE:"L-WE", FIELD: "Language and Written Expression (levels 05-17)", MAP_FUNCTION: mapScaleScore},

        {TEST: "IOWA", CODE:"CW", FIELD: "Conventions of Writing", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"ET", FIELD: "ELA Total", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"WA", FIELD: "Word Analysis", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"LI", FIELD: "Listening", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"XET", FIELD: "Extended ELA Total", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"M", FIELD: "Mathematics (or MT without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"MC", FIELD: "Computation", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"MT", FIELD: "Math Total (with Comp)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"CT", FIELD: "Core Composite (with ELA)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"XCT", FIELD: "Core Composite (with Extended ELA)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"CT-", FIELD: "Core Composite (with ELA without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"XCT-", FIELD: "Core Composite (with Extended ELA without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"SS", FIELD: "Social Studies", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"SC", FIELD: "Science", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"CC", FIELD: "Complete Composite (with ELA)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"XCC", FIELD: "Complete Composite (with Extended ELA)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"CC-", FIELD: "Complete Composite (with ELA without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"XCC-", FIELD: "Complete Composite (with Extended ELA without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"RW", FIELD: "Reading Words for Level 06 only (this is Reading Part 1 reported in Slot 1)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"RC", FIELD: "Reading Comprehension for Level 06 only (this is Reading Part 2 reported in Slot 1)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"RT", FIELD: "Reading Total", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"LT", FIELD: "Language Total", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"29", FIELD: "", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"30", FIELD: "", MAP_FUNCTION: mapScaleScore},

        // Standard Score
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_R", FIELD: "Reading", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_V", FIELD: "Vocabulary", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_SP", FIELD: "Spelling", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_CP", FIELD: "Capitalization", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_PC", FIELD: "Punctuation", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_L", FIELD: "Language (levels 05-08)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_WE", FIELD: "Written Expression (levels 09-17)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_L-WE", FIELD: "Language and Written Expression (levels 05-17)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_CW", FIELD: "Conventions of Writing", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_ET", FIELD: "ELA Total", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_WA", FIELD: "Word Analysis", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_LI", FIELD: "Listening", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_XET", FIELD: "Extended ELA Total", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_M", FIELD: "Mathematics (or MT without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_MC", FIELD: "Computation", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_MT", FIELD: "Math Total (with Comp)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_CT", FIELD: "Core Composite (with ELA)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_XCT", FIELD: "Core Composite (with Extended ELA)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_CT-", FIELD: "Core Composite (with ELA without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_XCT-", FIELD: "Core Composite (with Extended ELA without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_SS", FIELD: "Social Studies", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_SC", FIELD: "Science", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_CC", FIELD: "Complete Composite (with ELA)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_XCC", FIELD: "Complete Composite (with Extended ELA)*", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_CC-", FIELD: "Complete Composite (with ELA without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_XCC-", FIELD: "Complete Composite (with Extended ELA without Comp)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_RW", FIELD: "Reading Words for Level 06 only (this is Reading Part 1 reported in Slot 1)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_RC", FIELD: "Reading Comprehension for Level 06 only (this is Reading Part 2 reported in Slot 1)", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_RT", FIELD: "Reading Total", MAP_FUNCTION: mapScaleScore},
        {TEST: "IOWA", CODE:"BASED_2005_NORMS_LT", FIELD: "Language Total", MAP_FUNCTION: mapScaleScore},
        //{TEST: "IOWA", CODE:"BASED_2005_NORMS_29", FIELD: "", MAP_FUNCTION: mapScaleScore},
        //{TEST: "IOWA", CODE:"BASED_2005_NORMS_30", FIELD: "", MAP_FUNCTION: mapScaleScore},

        //Local Score
        {TEST: "IOWA", CODE:"R", FIELD: "Reading", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"V", FIELD: "Vocabulary", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"SP", FIELD: "Spelling", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"CP", FIELD: "Capitalization", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"PC", FIELD: "Punctuation", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"L", FIELD: "Language (levels 05-08)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"WE", FIELD: "Written Expression (levels 09-17)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"L-WE", FIELD: "Langurage and Written Expression (levels 05-17)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"CW", FIELD: "Conventions of Writing", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"ET", FIELD: "ELA Total", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"WA", FIELD: "Word Analysis", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"LI", FIELD: "Listening", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"XET", FIELD: "Extended ELA Total", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"M", FIELD: "Mathematics (or MT without Comp)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"MC", FIELD: "Computation", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"MT", FIELD: "Math Total (with Comp)*", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"CT", FIELD: "Core Composite (with ELA)*", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"XCT", FIELD: "Core Composite (with Extended ELA)*", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"CT-", FIELD: "Core Composite (with ELA without Comp)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"XCT-", FIELD: "Core Composite (with Extended ELA without Comp)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"SS", FIELD: "Social Studies", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"SC", FIELD: "Science", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"CC", FIELD: "Complete Composite (with ELA)*", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"XCC", FIELD: "Complete Composite (with Extended ELA)*", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"CC-", FIELD: "Complete Composite (with ELA without Comp)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"XCC-", FIELD: "Complete Composite (with Extended ELA without Comp)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"RW", FIELD: "Reading Words for Level 06 only (this is Reading Part 1 reported in Slot 1)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"RC", FIELD: "Reading Comprehension for Level 06 only (this is Reading Part 2 reported in Slot 1)", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"RT", FIELD: "Reading Total", MAP_FUNCTION: mapLocalScore},
        {TEST: "IOWA", CODE:"LT", FIELD: "Language Total", MAP_FUNCTION: mapLocalScore},
        //{TEST: "IOWA", CODE:"29", FIELD: "", MAP_FUNCTION: mapLocalScore},
        //{TEST: "IOWA", CODE:"30", FIELD: "", MAP_FUNCTION: mapLocalScore},

        // Index Scores
        {TEST: "IOWA", CODE:"_RD", FIELD: "_RT", MAP_FUNCTION: mapIndexScore},
        {TEST: "IOWA", CODE:"_LANG", FIELD: "_LT", MAP_FUNCTION: mapIndexScore},
        {TEST: "IOWA", CODE:"_MATH", FIELD: "_MT", MAP_FUNCTION: mapIndexScore},
        {TEST: "IOWA", CODE:"_SS", FIELD: "_SS", MAP_FUNCTION: mapIndexScore},
        {TEST: "IOWA", CODE:"_SCI", FIELD: "_SC", MAP_FUNCTION: mapIndexScore},
        {TEST: "IOWA", CODE:"_SRCTOT", FIELD: "_ST", MAP_FUNCTION: mapIndexScore},
        {TEST: "IOWA", CODE:"_COMPLETECOMPOS", FIELD: "_CC", MAP_FUNCTION: mapIndexScore},

        // Accountability Scores
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_VOCAB", FIELD: "_VOCABULARY", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_RDCOMPREH", FIELD: "_READING_COMPREHENSION", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_RDTOT", FIELD: "_READING_TOTAL", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_SP", FIELD: "_SPELLING", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_CAP", FIELD: "_CAPITALIZATION", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_PUNC", FIELD: "_PUNCTUATION", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_USEXP", FIELD: "_USAGE_AND_EXPRESSION", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_LANGTOT", FIELD: "_LANGUAGE_TOTAL", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_WTADVSKLS_EXPADVSKLS", FIELD: "_ITBS_INT_WRITING_ADV_SKILLS_ITED_EXPRESSION_ADV_SKILLS", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_WTTOT_TSTE", FIELD: "_ITBS_WRITING_TOTAL_ITED_TEST_E", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_MTCONEST", FIELD: "_MATH_CONCEPTS_&_EST", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_MTPDI_QTS", FIELD: "_ITBS_MATH_PROB_DATA_INT_ITED_QUANT_THINKING_SKILLS", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_MTTOT_TSTQ", FIELD: "_ITBS_MATH_TOTAL_ITED_TEST_Q", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_CORBAT", FIELD: "_CORE_BATTERY", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_SS_TSTSS", FIELD: "_ITBS_SOCIAL_STUDIES_ITED_TEST_SS", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_SCI_TSTSC", FIELD: "_ITBS_SCIENCE_ITED_TEST_SC", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_SCI_TSTSCGRDOP", FIELD: "_ITBS_SCIENCE_ITED_TEST_SC_GRD_OP", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_MPDIG", FIELD: "_MAPS_AND_DIAGRAMS", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_REFMAT", FIELD: "_REFERENCE_MATERIALS", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_SRCINFOTOT", FIELD: "_SOURCES_OF_INFO_TOTAL", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_ITED_COMPOS", FIELD: "_COMPOSITE", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITBS_COMPUT", FIELD: "_MATH_COMPUTATION", MAP_FUNCTION: mapAccountabilityScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_ITED_TSTL", FIELD: "_TEST_L", MAP_FUNCTION: mapAccountabilityScore},

        // Accountability Index Scores
        {TEST: "IOWA_ACCOUNT", CODE:"_VOCAB", FIELD: "_VOCABULARY", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_RDCOMPREH", FIELD: "_READING_COMPREHENSION", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_RDTOT", FIELD: "_READING_TOTAL", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_SP", FIELD: "_SPELLING", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_CAP", FIELD: "_CAPITALIZATION", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_PUNC", FIELD: "_PUNCTUATION", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_USEXP", FIELD: "_USAGE_AND_EXPRESSION", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_LANGTOT", FIELD: "_LANGUAGE_TOTAL", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_WTADVSKLS_EXPADVSKLS", FIELD: "_ITBS_INT_WRITING_ADV_SKILLS_ITED_EXPRESSION_ADV_SKILLS", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_WTTOT_TSTE", FIELD: "_ITBS_WRITING_TOTAL_ITED_TEST_E", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_MTCONEST", FIELD: "_MATH_CONCEPTS_&_EST", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_MTPDI_QTS", FIELD: "_ITBS_MATH_PROB_DATA_INT_ITED_QUANT_THINKING_SKILLS", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_MTTOT_TSTQ", FIELD: "_ITBS_MATH_TOTAL_ITED_TEST_Q", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_CORBAT", FIELD: "_CORE_BATTERY", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_SS_TSTSS", FIELD: "_ITBS_SOCIAL_STUDIES_ITED_TEST_SS", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_SCI_TSTSC", FIELD: "_ITBS_SCIENCE_ITED_TEST_SC", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_SCI_TSTSCGRDOP", FIELD: "_ITBS_SCIENCE_ITED_TEST_SC_GRD_OP", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_MPDIG", FIELD: "_MAPS_AND_DIAGRAMS", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_REFMAT", FIELD: "_REFERENCE_MATERIALS", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_SRCINFOTOT", FIELD: "_SOURCES_OF_INFO_TOTAL", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_COMPOS", FIELD: "_COMPOSITE", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_COMPUT", FIELD: "_MATH_COMPUTATION", MAP_FUNCTION: mapAccountabilityIndexScore},
        {TEST: "IOWA_ACCOUNT", CODE:"_TSTL", FIELD: "_TEST_L", MAP_FUNCTION: mapAccountabilityIndexScore}
    ];

    var compCriteriaDecode = {
        "1" : "Yes",
        "0" : "No",
        "" : null,
        null : null
    };

    var ref_GradeDecodes = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "KG",
        "K": "KG"
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, hierarchy);
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

    function mapDateObject(hierarchy, row, dateStr) {

        //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM-dd-yyyy");
        } catch(exception){
            // Error will be reported in final check.
        }

        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
            } catch(exception){
                // Error will be reported in final check.
            }
        }
        if(testDateObject === null){
            try {
                if (dateStr.length === 7) {
                    dateStr = '0' + dateStr;
                }
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "MMddyyyy");
            } catch(exception){
                // Error will be reported in final check.
            }
        }
        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "MMddyy");
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

        var birthDateField = row.getField("DATE_OF_BIRTH");
        var birthDateObject = mapDateObject(hierarchy, signature, birthDateField);
        // TEST_ADMIN_DATE
        var testDateField = _util.coalesce(row.getField("DATE_TESTED"),("05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9)));
        var testDateObject = mapDateObject(hierarchy, row, testDateField);


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
                    record.REPORTING_PERIOD = _util.coalesce(hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE);
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(row.getField("STUDENT_DOB_MONTH"), birthDateObject.MONTH,null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(row.getField("STUDENT_DOB_DAY"), birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(row.getField("STUDENT_DOB_YEAR"), birthDateObject.YEAR, null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"), row.getField("BUILDING_NAME"), row.getField("DISTRICT_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"),row.getField("DISTRICT_CODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"),row.getField("BUILDING_NAME"));
                     break;
                 case "STUDENT_LOCAL_ID":
                      record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"),row.getField("STUDENT_ID"), row.getField("STUDENT_ID_NUMBER"));
                      break;
                 case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"),row.getField("STUDENT_ID"), row.getField("STUDENT_ID_NUMBER"));
                      break;
                case "STUDENT_VENDOR_ID":
                      record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"),row.getField("STUDENT_ID"), row.getField("STUDENT_ID_NUMBER"));
                      break;
                 case "STUDENT_FIRST_NAME":
                     record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"), row.getField("FIRST"));
                     break;
                 case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME =  null;
                     break;
                 case "STUDENT_LAST_NAME":
                     record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"), row.getField("LAST"));
                     break;
                 case "STUDENT_GENDER_CODE":
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), row.getField("SEX"));
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = ref_GradeDecodes[_util.coalesce(row.getField("CLASS_GRADE"), row.getField("GRADE_OPTION"), row.getField("GRADE"), row.getField('STUDENT_GRADE'))];
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
    function mapComponentScore(row, testMetadata, hierarchy) {

        var score = {};
        var testNumber = null;

        if (row.getField("TEST") === "ITBS") {
            if (hierarchy.SCHOOL_YEAR in ("2004-2005", "2003-2004", "2002-2003")) {
                testNumber = testMetadata.TEST + row.getField("TEST") + "_" + ITBS2005testNumberLookup[testMetadata.CODE].TEST_NUMBER_PART;
            } else if (hierarchy.SCHOOL_YEAR in ("2001-2002", "2000-2001", "1999-2000")) {
                    testNumber = testMetadata.TEST + row.getField("TEST") + "_" + ITBS2002testNumberLookup[testMetadata.CODE].TEST_NUMBER_PART;
            }

        } else if (row.getField("TEST") === "ITED") {
            if (hierarchy.SCHOOL_YEAR in ("2004-2005", "2003-2004", "2002-2003")) {
                testNumber = testMetadata.TEST + row.getField("TEST") + "_" + ITED2005testNumberLookup[testMetadata.CODE].TEST_NUMBER_PART;
            } else if (hierarchy.SCHOOL_YEAR in ("2001-2002", "2000-2001", "1999-2000")) {
                testNumber = testMetadata.TEST + row.getField("TEST") + "_" + ITED2002testNumberLookup[testMetadata.CODE].TEST_NUMBER_PART;
            }
        }

        if (testNumber === null) {
                return null;
        }

        var rawScore = row.getField("RAW_SCORE" + testMetadata.FIELD);
        var standardScore = row.getField("STANDARD_SCORE" + testMetadata.FIELD);
        var nationalPercentileRank = _util.coalesce(row.getField("NATIONAL_PERCENTILE_RANK" + testMetadata.FIELD), row.getField("NATIONAL_PR_RANKS" + testMetadata.FIELD), row.getField("NATIONAL_PR" + testMetadata.FIELD));
        var nceScore = _util.coalesce(row.getField("NCE_SCORE" + testMetadata.FIELD), row.getField("NORMAL_CURVE_EQUIVALENT" + testMetadata.FIELD));
        var nationalStanineScore = _util.coalesce(row.getField("NATIONAL_STANINE_SCORE" + testMetadata.FIELD), row.getField("NATIONAL_STANINE" + testMetadata.FIELD), row.getField("NATIONAL_STAN_ME" + testMetadata.FIELD));

        var itemsAttempted = row.getField("NUMBER_OF_TEST_ITEMS_ATTEMPTED" + testMetadata.FIELD);
        var itemsCorrect = row.getField("NUMBER_OF_TEST_ITEMS_CORRECT" + testMetadata.FIELD);
        var gradeEquiv = row.getField("GRADE_EQUIVALENT" + testMetadata.FIELD);
        var extraPr1 = row.getField("EXTRA_PR_1" + testMetadata.FIELD);
        var extraStanine1 = row.getField("EXTRA_STANINE_1" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(standardScore === null || standardScore === undefined || _util.trim(standardScore) === "--" || _util.trim(standardScore) === "") {
            return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;

    	score["TEST_RAW_SCORE"] = rawScore;

        score["TEST_SCORE_TEXT"] = standardScore;
        score["TEST_SCORE_VALUE"] = standardScore;
        score["TEST_SCALED_SCORE"] = standardScore;

        score["TEST_PERCENTILE_SCORE"] = nationalPercentileRank;
        score["TEST_NCE_SCORE"] = nceScore;
        score["TEST_STANINE_SCORE"] = nationalStanineScore;

        score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;
        score["TEST_ITEMS_POSSIBLE"] = itemsCorrect;
        if (!isNaN(gradeEquiv)){
        score["TEST_GRADE_EQUIVALENT"] = gradeEquiv;
        }
        score["TEST_TERTIARY_RESULT"] = extraPr1;
        score["TEST_QUATERNARY_RESULT"] = extraStanine1;

        return score;
    }


     function mapPredictionScore(row, testMetadata , hierarchy) {
         var score = {};
         var testNumber = testMetadata.TEST + "_MPS_" + testMetadata.CODE;

         var scaleScore = row.getField("PSS_" + testMetadata.CODE);

         var pgeScore = row.getField("PGE_" + testMetadata.CODE);

         var pnprScore  = row.getField("PNPR_" + testMetadata.CODE);

         var pssDiffs = row.getField("PSS_DIFFS_" + testMetadata.CODE);

         var pgeDiffs = row.getField("PGE_DIFFS_" + testMetadata.CODE);

         var prValidFlags = row.getField("PR_VALID_FLAG_" + testMetadata.CODE);

         var significantDiffs = row.getField("SIGNIFICANT_DIFF_IND_" + testMetadata.CODE);

         var low = row.getField(testMetadata.FIELD + "_LOW");
         var high = row.getField(testMetadata.FIELD + "_HIGH");
        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
            (pnprScore === null || pnprScore === undefined || isNaN(pnprScore) || pnprScore === "")){
            return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }

        score["TEST_GRADE_EQUIVALENT"] = pgeScore;

        if (!isNaN(pnprScore)) {
            score["TEST_PERCENTILE_SCORE"] = pnprScore;
        }

        score["TEST_PRIMARY_RESULT"] = prValidFlags;

        score["TEST_SECONDARY_RESULT"] = pssDiffs;
        score["TEST_TERTIARY_RESULT"] =  pgeDiffs;
        score["TEST_QUATERNARY_RESULT"] = significantDiffs;


        if (!isNaN(low)) {
            score["TEST_LOWER_BOUND"] = low;
        }

        if (!isNaN(high)) {
        score["TEST_UPPER_BOUND"] = high;
        }

        return score;
     }


     function mapScaleScore(row, testMetadata , hierarchy) {
        var score = {};
        var testNumber = testMetadata.TEST + "_MSS_" + testMetadata.CODE;

        var numberAttempted = row.getField("NUMBER_ATTEMPTED_" + testMetadata.CODE);

        var completionCriteria = row.getField("COMPLETION_CRITERIA_" + testMetadata.CODE);

        var rawScore = row.getField("RAW_SCORE_" + testMetadata.CODE);

        var standardScore = row.getField("STANDARD_SCORE_" + testMetadata.CODE);

        var gradeEquivalent = row.getField("GRADE_EQUIVALENT_" + testMetadata.CODE);

        var npr = _util.coalesce(row.getField("NATIONAL_PR_RANK_" + testMetadata.CODE) , row.getField(testMetadata.CODE))

        var nce = row.getField("NCE_" + testMetadata.CODE);

        var collegeReadiness = row.getField("COLLEGE_READINESS_" + testMetadata.CODE);

        var nationalStanine = row.getField("NATIONAL_STANINE_" + testMetadata.CODE);

        var predictedScaleScore = _util.coalesce( row.getField("STATE_PREDICTED_SCALE_SCORE" + testMetadata.FIELD),
                                  row.getField("STATE_PREDICTED_SCALE_SCORE_" + testMetadata.CODE));

        var low = _util.coalesce( row.getField("STATE_PREDICTED_SCALE_SCORE_LOW" + testMetadata.FIELD),
                                  row.getField("STATE_PREDICTED_SCALE_SCORE_LOW_" + testMetadata.CODE));

        var high = _util.coalesce( row.getField("STATE_PREDICTED_SCALE_SCORE_HIGH" + testMetadata.FIELD),
                                  row.getField("STATE_PREDICTED_SCALE_SCORE_HIGH_" + testMetadata.CODE));

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if((standardScore === null || standardScore === undefined || _util.trim(standardScore) === "--" || _util.trim(standardScore) === "") &&
            (npr === null || npr === undefined || isNaN(npr) || npr === "")){
            return null;
        }

        if (!isNaN(numberAttempted)) {
            score["TEST_ITEMS_ATTEMPTED"] = numberAttempted;
        }

        score["TEST_PRIMARY_RESULT"] = completionCriteria;
        score["TEST_PASSED_INDICATOR"] = compCriteriaDecode[completionCriteria];

        if (!isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
        }

        score["TEST_SCORE_TEXT"] = standardScore;
        if (!isNaN(standardScore)) {
            score["TEST_SCORE_VALUE"] = standardScore;
            score["TEST_SCALED_SCORE"] = standardScore;
        }
        if(!isNaN(gradeEquivalent)){
        score["TEST_GRADE_EQUIVALENT"] = gradeEquivalent;
        }

        if (!isNaN(npr)) {
            score["TEST_PERCENTILE_SCORE"] = npr;
        }

        score["TEST_SECONDARY_RESULT"] = collegeReadiness;

        if (!isNaN(nationalStanine)) {
            score["TEST_STANINE_SCORE"] = nationalStanine;
        }

        if (!isNaN(nce)) {
            score["TEST_GROWTH_TARGET_1"] = nce;
        }

        if (!isNaN(predictedScaleScore)) {
            score["TEST_GROWTH_TARGET_2"] = predictedScaleScore;
        }

        if (!isNaN(low)) {
            score["TEST_LOWER_BOUND"] = low;
        }

        if (!isNaN(high)) {
            score["TEST_UPPER_BOUND"] = high;
        }
        return score;
     }

    function mapLocalScore(row, testMetadata , hierarchy) {
        var score = {};
        var testNumber = testMetadata.TEST + "_MLS_" + testMetadata.CODE;

        var lpr = row.getField("LOCAL_PERCENTILE_RANK_" + testMetadata.CODE);

        var localStanines = row.getField("LOCAL_STANINES_" + testMetadata.CODE);

        var catholic = row.getField("CATHOLIC_PRIVATE_PR_" + testMetadata.CODE);

        var lses = row.getField("LSES_PR_" + testMetadata.CODE);

        var hses = row.getField("HSES_PR_" + testMetadata.CODE);

        if ((lpr === null || lpr === undefined || _util.trim(lpr) === "--" || _util.trim(lpr) === ""))

        {
            return null;
        }


        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(lpr)) {
            score["TEST_PERCENTILE_SCORE"] = lpr;
        }

        if (!isNaN(localStanines)) {
            score["TEST_STANINE_SCORE"] = localStanines;
        }

        if (!isNaN(lses)) {
            score["TEST_GROWTH_TARGET_3"] = lses;
        }

        if (!isNaN(hses)) {
            score["TEST_GROWTH_TARGET_4"] = hses;
        }

        if (!isNaN(catholic)) {
            score["TEST_GROWTH_TARGET_5"] = catholic;
        }

        return score;
    }


    function mapIndexScore(row, testMetadata , hierarchy) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var indexScore = row.getField("INDEX_SCORES" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(indexScore === null || indexScore === undefined || _util.trim(indexScore) === "--" || _util.trim(indexScore) === "") {

          return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = indexScore;
        score["TEST_SCORE_VALUE"] = indexScore;
        score["TEST_SCALED_SCORE"] = indexScore;

        return score;
    }

    function mapAccountabilityScore(row, testMetadata , hierarchy) {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE;
            var standardScore = row.getField("SS" + testMetadata.FIELD);
            var nationalPercentileRank = row.getField("NPR" + testMetadata.FIELD);
            var stanineScore = row.getField("STA9" + testMetadata.FIELD);

            // Check for key fields and do not map score and exit if conditions met.
            if(standardScore === null || standardScore === undefined || _util.trim(standardScore) === "--" || _util.trim(standardScore) === "") {

              return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;

            score["TEST_SCORE_TEXT"] = standardScore;
            score["TEST_SCORE_VALUE"] = standardScore;
            score["TEST_SCALED_SCORE"] = standardScore;

            score["TEST_PERCENTILE_SCORE"] = nationalPercentileRank;
            score["TEST_STANINE_SCORE"] = stanineScore;

            return score;
    }

    function mapAccountabilityIndexScore(row, testMetadata , hierarchy) {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE;

            var indexScore = row.getField("INDEX" + testMetadata.FIELD);

            // Check for key fields and do not map score and exit if conditions met.
            if(indexScore === null || indexScore === undefined || _util.trim(indexScore) === "--" || _util.trim(indexScore) === "") {

              return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;

            score["TEST_SCORE_TEXT"] = indexScore;
            score["TEST_SCORE_VALUE"] = indexScore;
            score["TEST_SCALED_SCORE"] = indexScore;

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

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = _util.trim( assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),""));
        });

        return assessmentAdminKey;
    }

    return module;
}());