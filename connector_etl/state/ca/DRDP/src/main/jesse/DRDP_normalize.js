var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "DRDP";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
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
            print(`Loading using signature file ${signatureFormatName}`);


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print(`Normalized file: ${normalizedFile}`);

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
            throw `${_thisModuleName}.createNormalizedFile Exception: ${exception}`;
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

        //TODO update scoresToMap
    var scoresToMap = [
            // InfantToddler Documentation- https://www.desiredresults.us/sites/default/files/docs/forms/DRDP2015-IT-Comprehensive-View-20200124_ADA.pdf
            // PreSchool Documentation - https://www.desiredresults.us/sites/default/files/docs/forms/DRDP2015_PSC_Comprehensive_View_Combined-20200219_ADA.pdf
            // APPROACHES TO LEARNING or Attitudes to Learning – Self-Regulation
            {TEST: "DRDP_", CODE:"ALT_REG_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            ,{TEST: "DRDP_", CODE:"ATL_REG_", FIELD: "ATTENTION_MAINTENANCE", DECODE: "preschoolAtl-1-5-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ATL_REG_", FIELD: "SELF_COMFORTING", DECODE: "preschoolAtl-1-5-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ATL_REG_", FIELD: "IMITATION", DECODE: "preschoolAtl-1-5-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ATL_REG_", FIELD: "CURIOSITY", DECODE: "preschoolAtl-1-5-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ATL_REG_", FIELD: "SELF_CONTROL", DECODE: "preschoolAtl-1-5-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ATL_REG_", FIELD: "PERSISTENCE", DECODE: "preschoolAtl-6-7-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ATL_REG_", FIELD: "SHARING", DECODE: "preschoolAtl-6-7-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}

            // Social and Emotional Development
            ,{TEST: "DRDP_", CODE:"SED_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            ,{TEST: "DRDP_", CODE:"SED_", FIELD: "SELF_IDENTITY", DECODE: "preschoolSedDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"SED_", FIELD: "FEELINGS", DECODE: "preschoolSedDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"SED_", FIELD: "INTERACTION_WITH_ADULTS", DECODE: "preschoolSedDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"SED_", FIELD: "INTERACTION_WITH_PEERS", DECODE: "preschoolSedDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"SED_", FIELD: "SOCIODRAMATIC_PLAY", DECODE: "preschoolSedDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}

            // Language and Literacy Development
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "UNDERSTANDING_OF_LANGUAGE", DECODE: "preschoolLld-1-3-4-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "RESPONSIVENESS_TO_LANGUAGE", DECODE: "preschoolLld-2-5-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "USE_OF_LANGUAGE", DECODE: "preschoolLld-1-3-4-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "CONVERSATION", DECODE: "preschoolLld-1-3-4-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "INTEREST_IN_LITERACY", DECODE: "preschoolLld-2-5-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "COMPREHENSION", DECODE: "preschoolLld-6to10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "PRINT_CONCEPTS", DECODE: "preschoolLld-6to10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "PHONOLOGICAL_AWARENESS", DECODE: "preschoolLld-6to10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "LETTER_KNOWLEDGE", DECODE: "preschoolLld-6to10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"LLD_", FIELD: "WRITING", DECODE: "preschoolLld-6to10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}

            // English Language Development
            ,{TEST: "DRDP_", CODE:"ELD_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            ,{TEST: "DRDP_", CODE:"ELD_", FIELD: "RECEPTIVE_ENGLISH", DECODE: "preschoolEldDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ELD_", FIELD: "EXPRESSIVE_ENGLISH", DECODE: "preschoolEldDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ELD_", FIELD: "UNDERSTANDING_RESPONSE", DECODE: "preschoolEldDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"ELD_", FIELD: "SYM_LTR_PRINT", DECODE: "preschoolEldDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}

            // Cognition Math
            ,{TEST: "DRDP_", CODE:"COG_MATH_", FIELD: "SPATIAL_RELATIONSHIPS", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_MATH_", FIELD: "CLASSIFICATION", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_MATH_", FIELD: "NUMBER_SENSE_OF_QUALITY", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_MATH_", FIELD: "MATH_OPERATION", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_MATH_", FIELD: "MEASUREMENT", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_MATH_", FIELD: "PATTERNING", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_MATH_", FIELD: "SHAPES", MAP_FUNCTION: mapScaledScore}

            //Cognition Science
            ,{TEST: "DRDP_", CODE:"COG_SCI_", FIELD: "CAUSE_AND_EFFECT", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_SCI_", FIELD: "INQUIRY", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_SCI_", FIELD: "DOCUMENTATION_AND_COMMUNICATION", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_SCI_", FIELD: "NATURAL_WORLD", MAP_FUNCTION: mapScaledScore}

            //Cognition Including Math and Science
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "SPATIAL_RELATIONSHIPS", DECODE: "preschoolCog-1-2-3-8-9-11-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "CLASSIFICATION", DECODE: "preschoolCog-1-2-3-8-9-11-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "NUMBER_SENSE_OF_QUALITY", DECODE: "preschoolCog-1-2-3-8-9-11-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "MATH_OPERATION", DECODE: "preschoolCog-4-5-6-7-10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "MEASUREMENT", DECODE: "preschoolCog-4-5-6-7-10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "PATTERNING", DECODE: "preschoolCog-4-5-6-7-10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "SHAPES", DECODE: "preschoolCog-4-5-6-7-10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "CAUSE_AND_EFFECT", DECODE: "preschoolCog-1-2-3-8-9-11-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "INQUIRY", DECODE: "preschoolCog-1-2-3-8-9-11-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "DOCUMENTATION_AND_COMMUNICATION", DECODE: "preschoolCog-4-5-6-7-10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"COG_", FIELD: "NATURAL_WORLD", DECODE: "preschoolCog-1-2-3-8-9-11-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}

            // Physical Development – Health
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}
            ,{TEST: "DRDP_", CODE:"HLTH_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}
            ,{TEST: "DRDP_", CODE:"PD_HLTH_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "PERCEPTUAL_MOTOR", DECODE: "preschoolPDHLTH-1-5-6-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "GROSS_LOCOMOTOR", DECODE: "preschoolPDHLTH-2-3-4-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "GROSS_MOTOR_MANIPULATIVE", DECODE: "preschoolPDHLTH-2-3-4-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "FINE_MOTOR", DECODE: "preschoolPDHLTH-2-3-4-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "SAFETY", DECODE: "preschoolPDHLTH-1-5-6-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "HYGIENE", DECODE: "preschoolPDHLTH-1-5-6-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "FEEDING", DECODE: "preschoolPDHLTH-7-8-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "DRESSING", DECODE: "preschoolPDHLTH-7-8-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "PHYSICAL_PLAY", DECODE: "preschoolPDHLTH-9-10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"PD_", FIELD: "NUTRITION", DECODE: "preschoolPDHLTH-9-10-Decode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}

            // History-Social Science
            ,{TEST: "DRDP_", CODE:"HSS_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            ,{TEST: "DRDP_", CODE:"HSS_", FIELD: "SENSE_OF_TIME", DECODE: "preschoolHssDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"HSS_", FIELD: "SENSE_OF_PLACE", DECODE: "preschoolHssDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"HSS_", FIELD: "ECOLOGY", DECODE: "preschoolHssDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"HSS_", FIELD: "CONFLICT_NEGOTIATION", DECODE: "preschoolHssDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"HSS_", FIELD: "RESP_CNDCT_AS_GRP_MEM", DECODE: "preschoolHssDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}

            // Visual and Performing Arts
            ,{TEST: "DRDP_", CODE:"VPA_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}
            ,{TEST: "DRDP_", CODE:"VPA_", FIELD: "STD_ERROR", MAP_FUNCTION: mapOverallScore}
            ,{TEST: "DRDP_", CODE:"VPA_", FIELD: "VISUAL_ART", DECODE: "preschoolVpaDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"VPA_", FIELD: "MUSIC", DECODE: "preschoolVpaDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"VPA_", FIELD: "DRAMA", DECODE: "preschoolVpaDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "DRDP_", CODE:"VPA_", FIELD: "DANCE", DECODE: "preschoolVpaDecode", FILE: "PRESCHOOL", MAP_FUNCTION: mapScaledScore}

            // kINDERGARTEN
            ,{TEST: "DRDP_", CODE:"KG_", FIELD: "KINDERGARTEN_READY", MAP_FUNCTION: mapKGScore}

            // LANG
            ,{TEST: "DRDP_", CODE:"LANG_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            // LIT
            ,{TEST: "DRDP_", CODE:"LIT_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            // MATH
            ,{TEST: "DRDP_", CODE:"MATH_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

            // SCIENCE
            ,{TEST: "DRDP_", CODE:"SCI_", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore}

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
            "Kindergarten": "KG",
            "PRE" : "PK"
            ,"" : null
            ,null : null
        };

    var decodeKGIndicator = {'Y': 1,'N':0, null:null};
    var KGTestPassedIndicator = {"Y": "YES", 'N': "NO", null:null};
    var assignedDecodes = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Later",
        5 : "Building Earlier",
        6 : "Building Middle",
        7 : "Building Later",
        8 : "Integrating Earlier",
        9 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    // InfantToddler documentation- https://www.desiredresults.us/sites/default/files/docs/forms/DRDP2015-IT-Comprehensive-View-20200124_ADA.pdf
    // PreSchool Documentation - https://www.desiredresults.us/sites/default/files/docs/forms/DRDP2015_PSC_Comprehensive_View_Combined-20200219_ADA.pdf

    var preschoolAtl1Decode = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Later",
        5 : "Building Earlier",
        6 : "Building Middle",
        7 : "Building Later",
        8 : "Integrating Earlier",
        9 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolAtl2Decode = {
        1 : "Exploring Earlier",
        2 : "Exploring Later",
        3 : "Building Earlier",
        4 : "Building Middle",
        5 : "Building Later",
        6 : "Integrating Earlier",
        7 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolSEDDecode = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Later",
        5 : "Building Earlier",
        6 : "Building Middle",
        7 : "Building Later",
        8 : "Integrating Earlier",
        9 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolLLD1Decode = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Middle",
        5 : "Exploring Later",
        6 : "Building Earlier",
        7 : "Building Middle",
        8 : "Building Later",
        9 : "Integrating Earlier",
        10 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolLLD2Decode = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Later",
        5 : "Building Earlier",
        6 : "Building Middle",
        7 : "Building Later",
        8 : "Integrating Earlier",
        9 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolLLD3Decode = {
        1 : "Exploring Middle",
        2 : "Exploring Later",
        3 : "Building Earlier",
        4 : "Building Middle",
        5 : "Building Later",
        6 : "Integrating Earlier",
        7 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolELDDecode = {
        1 : "Discovering Language",
        2 : "Discovering English",
        3 : "Exploring English",
        4 : "Developing English",
        5 : "Building English",
        6 : "Integrating English",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolCOG1Decode = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Later",
        5 : "Building Earlier",
        6 : "Building Middle",
        7 : "Building Later",
        8 : "Integrating Earlier",
        9 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolCOG2Decode = {
        1 : "Exploring Earlier",
        2 : "Exploring Later",
        3 : "Building Earlier",
        4 : "Building Middle",
        5 : "Building Later",
        6 : "Integrating Earlier",
        7 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolPDHLTH1Decode = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Later",
        5 : "Building Earlier",
        6 : "Building Middle",
        7 : "Building Later",
        8 : "Integrating Earlier",
        9 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolPDHLTH2Decode = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Middle",
        5 : "Exploring Later",
        6 : "Building Earlier",
        7 : "Building Middle",
        8 : "Building Later",
        9 : "Integrating Earlier",
        10 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolPDHLTH3Decode = {
        1 : "Responding Earlier",
        2 : "Responding Later",
        3 : "Exploring Earlier",
        4 : "Exploring Later",
        5 : "Building Earlier",
        6 : "Building Later",
        7 : "Integrating Earlier",
        8 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
    };

    var preschoolPDHLTH4Decode = {
        1 : "Exploring Middle",
        2 : "Exploring Later",
        3 : "Building Earlier",
        4 : "Building Middle",
        5 : "Building Later",
        6 : "Integrating Earlier",
        7 : "Not yet",
        "u" : "Unable to rate",
        "n" : "Not yet at earliest developmental level",
        "c" : "Conditional rating",
        "EM" : "Emerging",
        "Unable to rate" : "UR"
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        const PERIOD_INFO = (() => {
            let term = row.getField("TERMID");
            let period = '';
            let year = '';
            if (term) {
                period = term.split(' ')[0].toUpperCase();
                year = term.split(' ')[1];
            } else {
                period = hierarchy.REPORTING_PERIOD.toUpperCase();
                year = hierarchy.SCHOOL_YEAR.substring(0,4);
            }
            return {
                period: period,
                year: year
            }
        })();

        var studentGenderCode = null;
        var genderCode = row.getField("GENDER");
        if (genderCode != null){
            studentGenderCode = _util.trim(row.getField("GENDER") + "-").substring(0, 1);
        }

        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = _util.coalesce(row.getField("STUDENT_BIRTHDATE"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
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
                    record.REPORTING_PERIOD =  PERIOD_INFO.period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(getTEST_ADMIN_DATE(row, hierarchy, PERIOD_INFO.period),
                        '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID")
                        , row.getField("ICODE"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        ,row.getField("ICODE")
                        ,row.getField("STATE_STUDENT_ID_VERSION_1")
                        ,row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        ,row.getField("ICODE")
                        ,row.getField("STATE_STUDENT_ID_VERSION_1")
                        ,row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('STUDENT_FIRST_NAME'), "");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField('STUDENT_LAST_NAME'), "");
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField('STUDENT_MIDDLE_NAME'), "");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = studentGenderCode;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField('GRADE_LEVEL')], "PK");
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
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
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        }
        admin.TEST_INTERVENTION_DESC = row.getField("K_ENTRY_ASSESSMENT_EXCEPTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapOverallScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD;
        var scaleScore = _util.trim(row.getField(testMetadata.CODE + "OVERALL"));
        var stdError = _util.trim(row.getField(testMetadata.CODE + "STD_ERROR"));

        if ([null, undefined, '', '--', 'N/A'].some((falsey) => scaleScore  === falsey)) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_STANDARD_ERROR"] = stdError;

        return score;
    }

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD;
        var level = getDecode(row, testMetadata);
        //  Use the metadata field and code to get the data from logical name
        var scaleScore = _util.trim(row.getField(testMetadata.CODE + testMetadata.FIELD));
        var achieveLevel = _util.trim(row.getField(testMetadata.CODE + testMetadata.FIELD));

        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        // Set score fields
        score.TEST_NUMBER = testNumber;
        if (!isNaN(scaleScore)) {
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_SCALED_SCORE = scaleScore;
        }
        score.TEST_SCORE_TEXT = scaleScore;
        // Map the score to one more field from the decodes : 1-Earlier , 2-Middle, 3-Later
        score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
        score["TEST_PRIMARY_RESULT"] = level[achieveLevel];

        return score;
    }

    function mapKGScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD;
        var scaleScore = _util.trim(decodeKGIndicator[row.getField("KINDERGARTEN_READY")]);

        score.TEST_NUMBER = testNumber;

        if (scaleScore === null || scaleScore === undefined || scaleScore === ' ') {
            return null;
        }

        if (!isNaN(scaleScore)) {
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_SCALED_SCORE = scaleScore;
        }
        score.TEST_SCORE_TEXT = scaleScore;
        score.TEST_PASSED_INDICATOR = KGTestPassedIndicator[_util.trim(row.getField("KINDERGARTEN_READY"))];

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

    function getDecode(row, testMetadata){
        var primaryDecode = null;
        var lineageFile = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        if(lineageFile.indexOf('PRESCHOOL') > -1){
            if(testMetadata.FILE === 'PRESCHOOL'){
                if(testMetadata.DECODE === 'preschoolAtl-1-5-Decode'){
                    primaryDecode = preschoolAtl1Decode;
                } else if(testMetadata.DECODE === 'preschoolAtl-6-7-Decode'){
                    primaryDecode = preschoolAtl2Decode;
                } else if(testMetadata.DECODE === 'preschoolSedDecode'){
                    primaryDecode = preschoolSEDDecode;
                } else if(testMetadata.DECODE === 'preschoolLld-1-3-4-Decode'){
                    primaryDecode = preschoolLLD1Decode;
                } else if(testMetadata.DECODE === 'preschoolLld-2-5-Decode'){
                    primaryDecode = preschoolLLD2Decode;
                } else if(testMetadata.DECODE === 'preschoolLld-6to10-Decode'){
                    primaryDecode = preschoolLLD3Decode;
                } else if(testMetadata.DECODE === 'preschoolEldDecode'){
                    primaryDecode = preschoolELDDecode;
                } else if(testMetadata.DECODE === 'preschoolCog-1-2-3-8-9-11-Decode'){
                    primaryDecode = preschoolCOG1Decode;
                } else if(testMetadata.DECODE === 'preschoolCog-4-5-6-7-10-Decode'){
                    primaryDecode = preschoolCOG2Decode;
                } else if(testMetadata.DECODE === 'preschoolPDHLTH-1-5-6-Decode'){
                    primaryDecode = preschoolPDHLTH1Decode;
                } else if(testMetadata.DECODE === 'preschoolPDHLTH-2-3-4-Decode'){
                    primaryDecode = preschoolPDHLTH2Decode;
                } else if(testMetadata.DECODE === 'preschoolPDHLTH-7-8-Decode'){
                    primaryDecode = preschoolPDHLTH3Decode;
                } else if(testMetadata.DECODE === 'preschoolPDHLTH-9-10-Decode'){
                    primaryDecode = preschoolPDHLTH4Decode;
                } else if(testMetadata.DECODE === 'preschoolHssDecode'){
                    primaryDecode = preschoolPDHLTH4Decode;
                } else if(testMetadata.DECODE === 'preschoolVpaDecode'){
                    primaryDecode = preschoolPDHLTH4Decode;
                }
            }
        } else if(lineageFile.indexOf('INFANT') > -1){
            if(testMetadata.DECODE === 'preschoolAtl-1-5-Decode'){
                primaryDecode = preschoolAtl1Decode;
            } else if(testMetadata.DECODE === 'preschoolSedDecode'){
                primaryDecode = preschoolSEDDecode;
            } else if(testMetadata.DECODE === 'preschoolLld-1-3-4-Decode'){
                primaryDecode = preschoolLLD1Decode;
            } else if(testMetadata.DECODE === 'preschoolLld-2-5-Decode'){
                primaryDecode = preschoolLLD2Decode;
            } else if(testMetadata.DECODE === 'preschoolCog-1-2-3-8-9-11-Decode'){
                primaryDecode = preschoolCOG1Decode;
            } else if((testMetadata.DECODE === 'preschoolPDHLTH-1-5-6-Decode') || (testMetadata.DECODE === 'preschoolPDHLTH-7-8-Decode')){
                primaryDecode = preschoolPDHLTH1Decode;
            } else if(testMetadata.DECODE === 'preschoolPDHLTH-2-3-4-Decode'){
                primaryDecode = preschoolPDHLTH2Decode;
            }
        } else {
            primaryDecode = assignedDecodes;
        }

        return primaryDecode;
    }

    function getTEST_ADMIN_DATE(row, hierarchy, period) {

        var testDate = row.getField('DRDPCOMPLETION');

        if (testDate === null || testDate === undefined || testDate === '') {
            if (period === 'Winter' || period === "WINTER") {
                testDate = '01/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
            } else if (period === 'Spring' || period === "SPRING") {
                testDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
            } else if (period === 'Fall' || period === "FALL") {
                testDate = '09/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4);
            }
            else{//ALL period
                testDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
            }
        }
        else if(testDate.toString().indexOf("/")>-1){
            testDate = AppUtil.getDateObjByPattern(testDate, "M/d/yyyy").STANDARD_DATE;
        }
        else if(testDate.toString().split("-")[0].length>3){
            testDate = AppUtil.getDateObjByPattern(testDate, "yyyy-MM-dd").STANDARD_DATE;
        }
        else{
            testDate = AppUtil.getDateObjByPattern(testDate, "dd-MM-yyyy").STANDARD_DATE;
        }
        return testDate;
    }

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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);

        //Date is always added last
        let term = srcRecord.getField("TERMID");
        let period = '';
        if (term) {
            period = term.split(' ')[0].toUpperCase();
        } else {
            period = hierarchy.REPORTING_PERIOD.toUpperCase();
        }
        var keyDate = _util.coalesce(getTEST_ADMIN_DATE(srcRecord, hierarchy, period),
            '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));

        assessmentAdminKey = assessmentAdminKey + "_" + keyDate;

        return assessmentAdminKey;
    }

    return module;
}());