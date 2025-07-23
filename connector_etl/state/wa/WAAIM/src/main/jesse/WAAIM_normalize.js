var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "WAAIM";
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
        {TEST: "WAAIM", CODE:"ELA", FIELD: "ELA", BUCKET:"", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "WAAIM", CODE:"MA", FIELD: "MATH",BUCKET:"", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "WAAIM", CODE:"SCI", FIELD: "SCIENCE",BUCKET:"", MAP_FUNCTION: mapScaledScore}
        /*,{TEST: "WAAIM", CODE:"STAT1", FIELD: "STATUSCODE",BUCKET:"1", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT2", FIELD: "STATUSCODE",BUCKET:"2", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT3", FIELD: "STATUSCODE",BUCKET:"3", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT4", FIELD: "STATUSCODE",BUCKET:"4", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT5", FIELD: "STATUSCODE",BUCKET:"5", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT6", FIELD: "STATUSCODE",BUCKET:"6", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT7", FIELD: "STATUSCODE",BUCKET:"7", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT8", FIELD: "STATUSCODE",BUCKET:"8", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT9", FIELD: "STATUSCODE",BUCKET:"9", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT10", FIELD: "STATUSCODE",BUCKET:"10", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT11", FIELD: "STATUSCODE",BUCKET:"11", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT12", FIELD: "STATUSCODE",BUCKET:"12", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT13", FIELD: "STATUSCODE",BUCKET:"13", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT14", FIELD: "STATUSCODE",BUCKET:"14", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT15", FIELD: "STATUSCODE",BUCKET:"15", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT16", FIELD: "STATUSCODE",BUCKET:"16", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT17", FIELD: "STATUSCODE",BUCKET:"17", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT18", FIELD: "STATUSCODE",BUCKET:"18", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT19", FIELD: "STATUSCODE",BUCKET:"19", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT20", FIELD: "STATUSCODE",BUCKET:"20", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT21", FIELD: "STATUSCODE",BUCKET:"21", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT22", FIELD: "STATUSCODE",BUCKET:"22", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT23", FIELD: "STATUSCODE",BUCKET:"23", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT24", FIELD: "STATUSCODE",BUCKET:"24", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT25", FIELD: "STATUSCODE",BUCKET:"25", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT26", FIELD: "STATUSCODE",BUCKET:"26", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT27", FIELD: "STATUSCODE",BUCKET:"27", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT28", FIELD: "STATUSCODE",BUCKET:"28", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT29", FIELD: "STATUSCODE",BUCKET:"29", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"STAT30", FIELD: "STATUSCODE",BUCKET:"30", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP1", FIELD: "COMPLEXITYLEVEL",BUCKET:"1", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP2", FIELD: "COMPLEXITYLEVEL",BUCKET:"2", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP3", FIELD: "COMPLEXITYLEVEL",BUCKET:"3", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP4", FIELD: "COMPLEXITYLEVEL",BUCKET:"4", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP5", FIELD: "COMPLEXITYLEVEL",BUCKET:"5", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP6", FIELD: "COMPLEXITYLEVEL",BUCKET:"6", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP7", FIELD: "COMPLEXITYLEVEL",BUCKET:"7", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP8", FIELD: "COMPLEXITYLEVEL",BUCKET:"8", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP9", FIELD: "COMPLEXITYLEVEL",BUCKET:"9", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP10", FIELD: "COMPLEXITYLEVEL",BUCKET:"10", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP11", FIELD: "COMPLEXITYLEVEL",BUCKET:"11", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP12", FIELD: "COMPLEXITYLEVEL",BUCKET:"12", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP13", FIELD: "COMPLEXITYLEVEL",BUCKET:"13", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP14", FIELD: "COMPLEXITYLEVEL",BUCKET:"14", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP15", FIELD: "COMPLEXITYLEVEL",BUCKET:"15", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP16", FIELD: "COMPLEXITYLEVEL",BUCKET:"16", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP17", FIELD: "COMPLEXITYLEVEL",BUCKET:"17", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP18", FIELD: "COMPLEXITYLEVEL",BUCKET:"18", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP19", FIELD: "COMPLEXITYLEVEL",BUCKET:"19", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP20", FIELD: "COMPLEXITYLEVEL",BUCKET:"20", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP21", FIELD: "COMPLEXITYLEVEL",BUCKET:"21", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP22", FIELD: "COMPLEXITYLEVEL",BUCKET:"22", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP23", FIELD: "COMPLEXITYLEVEL",BUCKET:"23", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP24", FIELD: "COMPLEXITYLEVEL",BUCKET:"24", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP25", FIELD: "COMPLEXITYLEVEL",BUCKET:"25", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP26", FIELD: "COMPLEXITYLEVEL",BUCKET:"26", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP27", FIELD: "COMPLEXITYLEVEL",BUCKET:"27", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP28", FIELD: "COMPLEXITYLEVEL",BUCKET:"28", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP29", FIELD: "COMPLEXITYLEVEL",BUCKET:"29", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"COMP30", FIELD: "COMPLEXITYLEVEL",BUCKET:"30", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM1", FIELD: "ITEMTYPE",BUCKET:"1", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM2", FIELD: "ITEMTYPE",BUCKET:"2", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM3", FIELD: "ITEMTYPE",BUCKET:"3", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM4", FIELD: "ITEMTYPE",BUCKET:"4", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM5", FIELD: "ITEMTYPE",BUCKET:"5", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM6", FIELD: "ITEMTYPE",BUCKET:"6", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM7", FIELD: "ITEMTYPE",BUCKET:"7", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM8", FIELD: "ITEMTYPE",BUCKET:"8", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM9", FIELD: "ITEMTYPE",BUCKET:"9", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM10", FIELD: "ITEMTYPE",BUCKET:"10", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM11", FIELD: "ITEMTYPE",BUCKET:"11", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM12", FIELD: "ITEMTYPE",BUCKET:"12", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM13", FIELD: "ITEMTYPE",BUCKET:"13", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM14", FIELD: "ITEMTYPE",BUCKET:"14", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM15", FIELD: "ITEMTYPE",BUCKET:"15", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM16", FIELD: "ITEMTYPE",BUCKET:"16", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM17", FIELD: "ITEMTYPE",BUCKET:"17", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM18", FIELD: "ITEMTYPE",BUCKET:"18", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM19", FIELD: "ITEMTYPE",BUCKET:"19", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM20", FIELD: "ITEMTYPE",BUCKET:"20", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM21", FIELD: "ITEMTYPE",BUCKET:"21", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM22", FIELD: "ITEMTYPE",BUCKET:"22", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM23", FIELD: "ITEMTYPE",BUCKET:"23", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM24", FIELD: "ITEMTYPE",BUCKET:"24", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM25", FIELD: "ITEMTYPE",BUCKET:"25", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM26", FIELD: "ITEMTYPE",BUCKET:"26", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM27", FIELD: "ITEMTYPE",BUCKET:"27", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM28", FIELD: "ITEMTYPE",BUCKET:"28", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM29", FIELD: "ITEMTYPE",BUCKET:"29", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ITEM30", FIELD: "ITEMTYPE",BUCKET:"30", MAP_FUNCTION: mapStandardScore}*/
        ,{TEST: "WAAIM", CODE:"ELA1", FIELD: "ELAFINALSCORE",BUCKET:"1", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ELA2", FIELD: "ELAFINALSCORE",BUCKET:"2", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ELA3", FIELD: "ELAFINALSCORE",BUCKET:"3", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ELA4", FIELD: "ELAFINALSCORE",BUCKET:"4", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ELA5", FIELD: "ELAFINALSCORE",BUCKET:"5", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ELA6", FIELD: "ELAFINALSCORE",BUCKET:"6", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ELA7", FIELD: "ELAFINALSCORE",BUCKET:"7", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"ELA8", FIELD: "ELAFINALSCORE",BUCKET:"8", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA9", FIELD: "MATHFINALSCORE",BUCKET:"9", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA10", FIELD: "MATHFINALSCORE",BUCKET:"10", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA11", FIELD: "MATHFINALSCORE",BUCKET:"11", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA12", FIELD: "MATHFINALSCORE",BUCKET:"12", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA13", FIELD: "MATHFINALSCORE",BUCKET:"13", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA14", FIELD: "MATHFINALSCORE",BUCKET:"14", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA15", FIELD: "MATHFINALSCORE",BUCKET:"15", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA16", FIELD: "MATHFINALSCORE",BUCKET:"16", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA17", FIELD: "MATHFINALSCORE",BUCKET:"17", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA18", FIELD: "MATHFINALSCORE",BUCKET:"18", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA19", FIELD: "MATHFINALSCORE",BUCKET:"19", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"MA20", FIELD: "MATHFINALSCORE",BUCKET:"20", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI21", FIELD: "SCIFINALSCORE",BUCKET:"21", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI22", FIELD: "SCIFINALSCORE",BUCKET:"22", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI23", FIELD: "SCIFINALSCORE",BUCKET:"23", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI24", FIELD: "SCIFINALSCORE",BUCKET:"24", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI25", FIELD: "SCIFINALSCORE",BUCKET:"25", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI26", FIELD: "SCIFINALSCORE",BUCKET:"26", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI27", FIELD: "SCIFINALSCORE",BUCKET:"27", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI28", FIELD: "SCIFINALSCORE",BUCKET:"28", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI29", FIELD: "SCIFINALSCORE",BUCKET:"29", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "WAAIM", CODE:"SCI30", FIELD: "SCIFINALSCORE",BUCKET:"30", MAP_FUNCTION: mapStandardScore}
        //Old strand scores
        ,{TEST: "WAAIM", CODE:"RDLIT", FIELD: "READINGLITERATURE",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"RDINF", FIELD: "READINGINFORMATIONALTEXT",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"RDINFINT", FIELD: "READINGINFORMATIONALTEXTINTEGRATION",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"RDFNDSK", FIELD: "READINGFOUNDATIONALSKILLS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"WRTXPUR", FIELD: "WRITING_TEXTTYPESANDPURPOSES",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"WRREAKNLG", FIELD: "WRITING_RESEARCHTOBUILDANDPRESENTKNOWLEDGE",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"SPKLIS", FIELD: "SPEAKINGANDLISTENING",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"LANG", FIELD: "LANGUAGE",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"ALGEQ", FIELD: "ALGEBRA_CREATINGEQUATIONS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"ALGREASEQIN", FIELD: "ALGEBRA_REASONINGWITHEQUATIONSANDINEQUALITIES",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"GEOM", FIELD: "GEOMETRY",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"MEASDATA", FIELD: "MEASUREMENTANDDATA",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"NUMOP10", FIELD: "NUMBERANDOPERATIONSINBASETEN",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"NUMOPFRAC", FIELD: "NUMBERANDOPERATIONS-FRACTIONS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"OPALGTHINK", FIELD: "OPERATIONSANDALGEBRAICTHINKING",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"EXPEQ", FIELD: "EXPRESSIONSANDEQUATIONS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"FUNC", FIELD: "FUNCTIONS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"NUMSYS", FIELD: "THENUMBERSYSTEMREALNUMBERSYSTEM",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"RATIOPROP", FIELD: "RATIOSANDPROPORTIONALRELATIONSHIPS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"STATPROB", FIELD: "STATISTICSANDPROBABILITY",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"SYS", FIELD: "SYSTEMS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"INQ", FIELD: "INQUIRY",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"APP", FIELD: "APPLICATION",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"EARSPASCI", FIELD: "EARTHANDSPACESCIENCE",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"STRUCFUNCLIVORG", FIELD: "STRUCTUREANDFUNCTIONOFLIVINGORGANISMS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"APPSCITECHPROBSOLV", FIELD: "APPLICATIONSCIENCETECHANDPROBLEMSOLVING",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"PHYSCI", FIELD: "PHYSICALSCIENCE",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"EARSPASCICYCNEAREAR", FIELD: "EARTHANDSPACESCIENCECYCLESINEARTHSYSTEMS",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
        ,{TEST: "WAAIM", CODE:"LIFESCI", FIELD: "LIFESCIENCE",BUCKET:"", MAP_FUNCTION: mapOldStrandScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var decodeLevel = {
        "1" 	: "Well Below Standard"
        ,"2"	: "Below Standard"
        ,"3"	: "Meets Standard"
        ,"4"	: "Exceeds Standard"
        ,null	: null
        ,""	: null
    };
    var decodePassing = {
        "1" 	: "No"
        ,"2"	: "No"
        ,"3"	: "Yes"
        ,"4"	: "Yes"
        ,null	: null
        ,""	: null
    };
    var decodeComplexityText = {
        "I" 	: "Intermediate Complexity"
        ,"L"	: "Less Complex"
        ,"M"	: "More Complex"
        ,null	: null
        ,""	: null
    };
    var decodeComplexityCode = {
        "Intermediate Complexity" : "I"
        ,"Less Complex"           : "L"
        ,"More Complex"           : "M"
        ,null	: null
        ,""	: null
    };
    var gradeDecode = {
          "1": "01"
          , "01": "01"
          , "2": "02"
          , "02": "02"
          , "3": "03"
          , "03": "03"
          , "4": "04"
          , "04": "04"
          , "5": "05"
          , "05": "05"
          , "6": "06"
          , "06": "06"
          , "7": "07"
          , "07": "07"
          , "8": "08"
          , "08": "08"
          , "9": "09"
          , "09": "09"
          , "10": "10"
          , "11": "11"
          , "12": "12"
          , "T9": "09"
          , null: null
          , "": null
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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                //component
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                print(e);
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
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateString = row.getField("STUDENTBIRTHDATEMMDDYYYY");
        var birthDateObject = {
                                RAW_DATE : null
                                , MONTH : null
                                , DAY : null
                                , YEAR : null
                                , STANDARD_DATE : null
                             };

        if(_util.trim(_util.coalesce(birthDateString, "")) === "") {
            return birthDateObject;
        }

        if(birthDateString.length == 10) {
            birthDateObject = AppUtil.getDateObjByPattern(birthDateString, "MMddyyyy");
        }
        else if (birthDateString.length === 7) {
            birthDateObject = AppUtil.getDateObjByPattern(birthDateString, "Mddyyyy");
        }
        else if(birthDateString.length === 8) {
            birthDateObject = AppUtil.getDateObjByPattern(birthDateString, "MMddyyyy");
        }


        var testDateStr = row.getField("TESTDATE");
        var testDateObject = {
                  RAW_DATE : null
                  , MONTH : null
                  , DAY : null
                  , YEAR : null
                  , STANDARD_DATE : null
        };
        if (testDateStr.length === 5){
            testDateObject = AppUtil.getDateObjByPattern(testDateStr, "Mddyy");
        }
        else{
        testDateObject = AppUtil.getDateObjByPattern(testDateStr, "MMddyy");
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
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "TEST_REPORTING_DATE":
                     record.TEST_REPORTING_DATE = testDateObject.STANDARD_DATE;
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("REPORTINGSCHOOLCODE"), row.getField("SCHOOLNAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("REPORTINGSCHOOLCODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOLNAME"));
                     break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("SSID");
                    break;
                 case "STUDENT_FIRST_NAME":
                     record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENTFIRSTNAME"));
                     break;
                 case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENTMIDDLEINITIAL"));
                     break;
                 case "STUDENT_LAST_NAME":
                     record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENTLASTNAME"));
                     break;
                 case "STUDENT_GENDER_CODE":
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENTGENDER"));
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("REPORTINGGRADE"),row.getField("TESTGRADE"))];
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
    function mapAdditionalAdminFields(admin, row) {
       return admin;
    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata)+"_TOT";

        var scaleScore = row.getField(testMetadata.FIELD+"SCORE");
		var achievLevel = row.getField(testMetadata.FIELD+"PERFORMANCELEVEL");
		var statusCode = row.getField(testMetadata.FIELD+"STATUSCODE_ORIGINAL");



        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_SCORE_VALUE"] = scaleScore;
    	score["TEST_SCALED_SCORE"] = scaleScore;
    	score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
    	score["TEST_PRIMARY_RESULT"] = decodeLevel[achievLevel];
    	score["TEST_PASSED_INDICATOR"] = decodePassing[achievLevel];
    	score["TEST_SCORE_ATTRIBUTES"] = statusCode;
        return score;
    }

    function mapStandardScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        /*
        var scaleScore = row.getField(testMetadata.FIELD+"STANDARD"+testMetadata.BUCKET);

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_SCORE_VALUE"] = scaleScore;
    	score["TEST_SCALED_SCORE"] = scaleScore;
    	*/
        var complexity = row.getField("COMPLEXITYLEVELSTANDARD"+testMetadata.BUCKET);
        var itemType = row.getField("ITEMTYPESTANDARD"+testMetadata.BUCKET);
        var scaleScore = row.getField(testMetadata.FIELD+"STANDARD"+testMetadata.BUCKET);
        var statusCode = row.getField("STATUSCODESTANDARD"+testMetadata.BUCKET);
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_SCORE_VALUE"] = scaleScore;
    	score["TEST_SCALED_SCORE"] = scaleScore;
    	score["TEST_SCORE_ATTRIBUTES"] = statusCode;
    	score["TEST_PRIMARY_RESULT_CODE"] = complexity;
    	score["TEST_PRIMARY_RESULT"] = decodeComplexityText[complexity];
    	score["TEST_SECONDARY_RESULT"] = itemType;

    	return score;
    }

    function mapOldStrandScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);

        var complexity = row.getField(testMetadata.FIELD+"COMPLEXITYLEVEL");
        var itemType = row.getField(testMetadata.FIELD+"ITEMTYPE");
        var scaleScore = row.getField(testMetadata.FIELD+"FINALSCORE");
        var statusCode = row.getField(testMetadata.FIELD+"STATUSCODE");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_SCORE_VALUE"] = scaleScore;
    	score["TEST_SCALED_SCORE"] = scaleScore;
    	score["TEST_SCORE_ATTRIBUTES"] = statusCode;
    	score["TEST_PRIMARY_RESULT"] = complexity;
    	score["TEST_PRIMARY_RESULT_CODE"] = decodeComplexityCode[complexity];
    	score["TEST_SECONDARY_RESULT"] = itemType;

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
        //Required to align to state file format AIM records
        var assessmentAdminKey = "SBA_AIM_WCAS_"+ "${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${hierarchy.REPORTING_PERIOD}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key),""));
        });
        assessmentAdminKey = assessmentAdminKey + "_AIM";
        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {

            var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

            return testNumber;

        }

    return module;


}());
