var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "STAR_V2_STATE";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;
    var subject;
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
            var normalizedFile = AppUtil.createResultsFile(file);
            subject = determineFileSubject(_fileDetector.getSignatureName(signature),normalizedFile);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();
            _dataflow.create("RECORD BUILD")
                .input("INPUT", AppUtil.getInputDataflow(file, signature))
                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
                    try{

                        json.LINEAGE_FILE = fileFullName;
                        json.LINEAGE_LINE = (++lineNumber).toString();
                        output.RECORDS.put(json);
                    }
                    catch(exception){
                            print(`exception:  ${exception} \n`);
                    }

                })
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        print(`exception:  ${exception} \n`);
                        try{
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                        }
                        catch(exception){
                            print(`exception2:  ${exception} \n`);
                        }
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
                            if (record.REPORTING_PERIOD === "Unknown") {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",record.LINEAGE_LINE, "NORMALIZE dataflow error: Could not find test administration date/Invalid date format. ", JSON.stringify(record)));
                            } else {
                                output.RECORDS.put(record);
                            }
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
        {CODE: null, FIELD: null, MAP_FUNCTION: mapTOTAL},
        {CODE: null, FIELD: null, MAP_FUNCTION: mapTOTALAssessmentBenchmarks},
        {CODE: null, FIELD: null, MAP_FUNCTION: mapORF},
        {CODE: null, FIELD: null, MAP_FUNCTION: mapIRL},
        {CODE: "STATE", FIELD: "STATE", MAP_FUNCTION: mapBenchmarkScore},
        {CODE: "REN", FIELD: "RENAISSANCE", MAP_FUNCTION: mapBenchmarkScore},
        {CODE: "DIST", FIELD: "DISTRICT", MAP_FUNCTION: mapBenchmarkScore},
        {CODE: "SCH", FIELD: "SCHOOL", MAP_FUNCTION: mapBenchmarkScore},

        {CODE: "SDAP", FIELD: "SEL_SUBDOMAIN_AP_ALPHABETIC_PRINCIPLE", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDAPSSAK", FIELD: ":SEL_AP_SKILLSET_ALPHABETIC_KNOWLEDGE", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDAPSSAS", FIELD: "SEL_AP_SKILLSET_ALPHABETIC_SEQUENCE", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDAPSSLS", FIELD: "SEL_AP_SKILLSET_LETTER_SOUNDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDCW", FIELD: "SEL_SUBDOMAIN_CW_CONCEPT_OF_WORD", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDCWSSPCWL", FIELD: "SEL_CW_SKILLSET_PRINT_CONCEPTS_WORD_LENGTH", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDCWSSPCWB", FIELD: "SEL_CW_SKILLSET_PRINT_CONCEPTS_WORD_BORDERS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDCWSSPCLW", FIELD: "SEL_CW_SKILLSET_PRINT_CONCEPTS_LETTERS_AND_WORDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDVD", FIELD: "SEL_SUBDOMAIN_VS_VISUAL_DISCRIMINATION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDVDSSL", FIELD: "SEL_VS_SKILLSET_LETTERS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDVDSSIWM", FIELD: "SEL_VS_SKILLSET_IDENTIFICATION_AND_WORD_MATCHING", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPA", FIELD: "SEL_SUBDOMAIN_PA_PHONEMIC_AWARENESS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPASSRWF", FIELD: "SEL_PA_SKILLSET_RHYMING_AND_WORD_FAMILIES", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPASSBWP", FIELD: "SEL_PA_SKILLSET_BLENDING_WORD_PARTS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPASSBP", FIELD: "SEL_PA_SKILLSET_BLENDING_PHONEMES", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPASSIFP", FIELD: "SEL_PA_SKILLSET_INITIAL_AND_FINAL_PHONEMES", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPASSCB", FIELD: "SEL_PA_SKILLSET_CONSONANT_BLENDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPASSMDP", FIELD: "SEL_PA_SKILLSET_MEDIAL_PHONEME_DISCRIMINATION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPASSPS", FIELD: "SEL_PA_SKILLSET_PHONEME_SEGMENTATION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPASSPIM", FIELD: "SEL_PA_SKILLSET_PHONEME_ISOLATION_MANIPULATION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDP", FIELD: "SEL_SUBDOMAIN_PH_PHONICS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSLVS", FIELD: "SEL_PH_SKILLSET_LONG_VOWEL_SOUNDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSSVS", FIELD: "SEL_PH_SKILLSET_SHORT_VOWEL_SOUNDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSICS", FIELD: "SEL_PH_SKILLSET_INITIAL_CONSONANT_SOUNDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSFCS", FIELD: "SEL_PH_SKILLSET_FINAL_CONSONANT_SOUNDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSSSCC", FIELD: "SEL_PH_SKILLSET_SOUND_SYMBOL_CORRESPONDENCE_CONSONANTS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSSSCV", FIELD: "SEL_PH_SKILLSET_SOUND_SYMBOL_CORRESPONDENCE_VOWELS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSWFR", FIELD: "SEL_PH_SKILLSET_WORD_FAMILIES_RHYMING", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSCB", FIELD: "SEL_PH_SKILLSET_CONSONANT_BLENDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSCD", FIELD: "SEL_PH_SKILLSET_CONSONANT_DIGRAPHS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSVVS", FIELD: "SEL_PH_SKILLSET_VARIANT_VOWEL_SOUNDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSOVS", FIELD: "SEL_PH_SKILLSET_OTHER_VOWEL_SOUNDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPSSWB", FIELD: "SEL_PH_SKILLSET_WORD_BUILDING", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDSA", FIELD: "SEL_SUBDOMAIN_SA_STRUCTURAL_ANALYSIS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDSASSWWA", FIELD: "SEL_SA_SKILLSET_WORDS_WITH_AFFIXES", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDSASSS", FIELD: "SEL_SA_SKILLSET_SYLLABIFICATION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDSASSCW", FIELD: "SEL_SA_SKILLSET_COMPOUND_WORDS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDV", FIELD: "SEL_SUBDOMAIN_VO_VOCABULARY", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDVSSWF", FIELD: "SEL_VO_SKILLSET_WORD_FACILITY", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDVSSS", FIELD: "SEL_VO_SKILLSET_SYNONYMS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDVSSA", FIELD: "SEL_VO_SKILLSET_ANTONYMS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDSLC", FIELD: "SEL_SUBDOMAIN_SC_SENTENCE_LEVEL_COMPREHENSION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDSLCSSCSL", FIELD: "SEL_SC_SKILLSET_COMPREHENSION_AT_THE_SENTENCE_LEVEL", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPLC", FIELD: "SEL_SUBDOMAIN_PC_PARAGRAPH_LEVEL_COMPREHENSION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDPLCSSCOP", FIELD: "SEL_PC_SKILLSET_COMPREHENSION_OF_PARAGRAPHS", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDEN", FIELD: "SEL_SUBDOMAIN_EN_EARLY_NUMERACY", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDENSSNNNI", FIELD: "SEL_EN_SKILLSET_NUMBER_NAMING_AND_NUMBER_IDENTIFICATION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDENSSM", FIELD: "SEL_EN_SKILLSET_MEASUREMENT", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDENSSSC", FIELD: "SEL_EN_SKILLSET_SEQUENCE_COMPLETION", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDENSSNOC", FIELD: "SEL_EN_SKILLSET_NUMBER_OBJECT_CORRESPONDENCE", MAP_FUNCTION: mapDomainOrSkillSetScores},
        {CODE: "SDENSSCAD", FIELD: "SEL_EN_SKILLSET_COMPOSING_AND_DECOMPOSING", MAP_FUNCTION: mapDomainOrSkillSetScores}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //Reads from signature name
    var fileNamesToSubjects = {
        //Standard Files
        "SEL_V2": "LIT",
        "SEL_v2": "LIT",
        "SEL": "LIT",
        "SM_V2": "MA",
        "SM_v2": "MA",
        "SM": "MA",
        "SR_V2": "RD",
        "SR_v2": "RD",
        "SR": "RD",
        // Spanish Versions
        "SELS_V2": "SPLIT",
        "SELS_v2": "SPLIT",
        "SELS": "SPLIT",
        "SMS_V2": "SPMA",
        "SMS_v2": "SPMA",
        "SMS": "SPMA",
        "SRS_V2": "SPRD",
        "SRS2_V2": "SPRD",
        "SRS_v2": "SPRD",
        "SRS2_v2": "SPRD",
        "SRS": "SPRD"
    };

    var testTypes = {
        "Classic":"CSC",
        "Enterprise":"ENT",
        "Star Early Literacy Enterprise Tests": "ENT",
        "Star Early Literacy Spanish Enterprise Tests": "ENT",
        "Star Reading Enterprise Tests": "ENT",
        "Star Reading Spanish Enterprise Tests": "ENT",
        "Star Math Enterprise Tests": "ENT",
        "Star Math Spanish Enterprise Tests": "ENT",
        "Non-Enterprise":"NONENT",
        "Progress Monitoring":"PRGMNT",
        "ProgressMonitoring": "PRGMNT",
        "Geometry":"GEM",
        "Algebra":"ALG",
        "Grade3":"GRD3",
        "Grade 3":"GRD3",
        "Unknown":"UNK",
        null: "ENT",
        "": "UNK",
        " ": "UNK"
    };

    var perfLevels = {
        //Standard STAR
        "Intervention": { PASSING_IND: "No", RESULT_CODE: "INTER", RESULT: "Intervention"},
        "On Watch": { PASSING_IND: "No", RESULT_CODE: "ONWCH", RESULT: "On Watch"},
        "Urgent Intervention": { PASSING_IND: "No", RESULT_CODE: "URGIN", RESULT: "Urgent Intervention"},
        "Minimally Proficient": { PASSING_IND: "No", RESULT_CODE: "MP", RESULT: "Minimally Proficient"},
        "Highly Proficient": { PASSING_IND: "Yes", RESULT_CODE: "HP", RESULT: "Highly Proficient"},
        "Partially Proficient": { PASSING_IND: "No", RESULT_CODE: "PP", RESULT: "Partially Proficient"},
        "At/Above Benchmark": { PASSING_IND: "Yes", RESULT_CODE: "ATABV", RESULT: "At/Above Benchmark"},
        //Average Mastery
        "Beginning": { PASSING_IND: "No", RESULT_CODE: "BEG", RESULT: "Beginning"},
        "Developing": { PASSING_IND: "Yes", RESULT_CODE: "DEV", RESULT: "Developing"},
        "Secure": { PASSING_IND: "Yes", RESULT_CODE: "SEC", RESULT: "Secure"},
        "Advanced": { PASSING_IND: "Yes", RESULT_CODE: "ADV", RESULT: "Advanced"},
        "Proficient": { PASSING_IND: "Yes", RESULT_CODE: "PROF", RESULT: "Proficient"},
        "Basic": { PASSING_IND: "No", RESULT_CODE: "BAS", RESULT: "Basic"},
        "Below Basic": { PASSING_IND: "No", RESULT_CODE: "BELBAS", RESULT: "Below Basic"}
    };

    var benchmarkCategoryRecode = {
          "Level 1" : "1",
          "1" : "1",
          "Level 2" : "2",
          "2" : "2",
          "Level 3" : "3",
          "3" : "3",
          "Level 4" : "4",
          "4" : "4",
          "" : null,
          null : null
    };

    var grades = {
        "Pre-K":"PK",
        "-1":"PK",
        "K":"KG",
        "0":"KG",
        "1":"01",
        "01":"01",
        "2":"02",
        "02":"02",
        "3":"03",
        "03":"03",
        "4":"04",
        "04":"04",
        "5":"05",
        "05":"05",
        "6":"06",
        "06":"06",
        "7":"07",
        "07":"07",
        "8":"08",
        "08":"08",
        "9":"09",
        "09":"09",
        "10":"10",
        "11":"11",
        "12":"12",
        "12+" : "12",
        ">12" : "12",
        "None" : null,
        "" : null,
        null : null
    };

    var decodeDistrictBenchmarkCategoryLevel = {
        "1": "Level 1",
        "Level 1": "Level 1",
        "2": "Level 2",
        "Level 2": "Level 2",
        "3": "Level 3",
        "Level 3": "Level 3",
        "4": "Level 4",
        "Level 4": "Level 4",
        "": null,
        null: null
    };

    var decodeStateBenchmarkCatAdj = {
        "1": "Level 1",
        "Level 1": "Level 1",
        "2": "Level 2",
        "Level 2": "Level 2",
        "3": "Level 3",
        "Level 3": "Level 3",
        "4": "Level 4",
        "Level 4": "Level 4",
        "": null,
        null: null
    };

    var decodesStatesBenchmarkCatAdj = {
        "1": "1",
        "Level 1": "1",
        "2": "2",
        "Level 2": "2",
        "3": "3",
        "Level 3": "3",
        "4": "4",
        "Level 4": "4",
        "": null,
        null: null
    };
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function decodeGrade(value) {
        return _util.coalesce(grades[value],"");
    }

    function decodePerfLevel(value) {
        var perfObj = perfLevels[value];

        if(perfObj === undefined || perfObj === null) {
            return { PASSING_IND: "--", RESULT_CODE: "", RESULT: value};
        } else {
            return perfObj;
        }
    }

    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/

    function mapTOTAL(row, testMetadata, signature) {
        try {
            var score = {};
            var scaleScore = _util.coalesce(row.getField("UNIVERSALSCORE"),row.getField("SCALED_SCORE"),row.getField("SCALEDSCORE"), row.getField("ENTERPRISE_SCORE"), row.getField("AVERAGE_MASTERY"));
            var rawScore = _util.coalesce(row.getField("SCALED_SCORE"),row.getField("SCALEDSCORE"), row.getField("ENTERPRISE_SCORE"), row.getField("AVERAGE_MASTERY"));
            var attempt = row.getField("ASSESSMENT_NUMBER");
            if(scaleScore === undefined || scaleScore === null || scaleScore.toString().trim() === "") {
                return null;
            }

            score["TEST_NUMBER"] = getTEST_NUMBER(row, "TOT");
            if (!isNaN(attempt)) {
                score["TEST_ITEMS_ATTEMPTED"] = attempt;
            }

            if (!isNaN(scaleScore)) {
                score["TEST_SCALED_SCORE"] = scaleScore;
                score["TEST_SCORE_VALUE"] = scaleScore;
            }
            if (!isNaN(rawScore)) {
                score["TEST_RAW_SCORE"] = rawScore;
            }
            var testPercentileScore = _util.coalesce(row.getField("PERCENTILE_RANK"),row.getField("PERCENTILERANK"));
            if (!isNaN(testPercentileScore)) {
               score["TEST_PERCENTILE_SCORE"] = testPercentileScore;
            }

            var nceScore = _util.coalesce(row.getField("NORMAL_CURVE_EQUIVALENT"),row.getField("NORMALCURVEEQUIVALENT"));

            if (!isNaN(nceScore)) {
               score["TEST_NCE_SCORE"] = nceScore;
            }
            score["TEST_SCORE_TEXT"] = scaleScore;

            var sem = row.getField("SEM");

            if (!isNaN(sem)) {
               score["TEST_STANDARD_ERROR"] = sem;
            }

            /*
                Upper and lower ZPD shouldn't be used.  Only use the lexile versions of ZPD.
            */
             var lexileRange = row.getField("LEXILERANGE");
             if (lexileRange !== undefined && lexileRange !== null && lexileRange !== "") {
                 var lower = lexileRange.split("-")[0].replace("L","").replace("BR", "").trim();
                 var upper = lexileRange.split("-")[1].replace("L","").replace("BR", "").trim();
             }
             var quantileRange = row.getField("QUANTILERANGE");
             if (quantileRange !== undefined && quantileRange !== null && quantileRange !== "") {
                 var lower1 = quantileRange.split("-")[0].replace("Q","").replace("EM", "").trim();
                 var upper1 = quantileRange.split("-")[1].replace("Q","").replace("EM", "").trim();
             }

            var lowerBound = removeLexileAlphaChar(_util.coalesce(row.getField("LOWER_LEXILE_ZPD"),row.getField("LOWERLEXILEZPD"),lower,lower1));
            var upperBound = removeLexileAlphaChar(_util.coalesce(row.getField("UPPER_LEXILE_ZPD"), row.getField("UPPERLEXILEZPD"),upper,upper1));

            score["TEST_READING_LEVEL"] = removeLexileAlphaChar(_util.coalesce(row.getField("LEXILE"),row.getField("LEXILESCORE")));
            if (!isNaN(lowerBound)) {
            score["TEST_LOWER_BOUND"] = lowerBound;
            }

            if (!isNaN(upperBound)) {
            score["TEST_UPPER_BOUND"] = upperBound;
            }

            // Setting full values.  The lexiles contain non-numeric characters.
            score["TEST_TERTIARY_RESULT"] = removeLexileUpperLowerAlphaChar(_util.coalesce(row.getField("LOWER_LEXILE_ZPD"),row.getField("LOWERLEXILEZPD")));
            score["TEST_QUATERNARY_RESULT"] = removeLexileUpperLowerAlphaChar(_util.coalesce(row.getField("UPPER_LEXILE_ZPD"), row.getField("UPPERLEXILEZPD")));

            //Map Performance Levels
            var signatureFormatName = signature.getFormat().getFormatName();
            //TODO need to measure sig impact of the below
            if (signatureFormatName === "REN_LEARNING_1920_SPACES_SM_V2" || signatureFormatName === "REN_LEARNING_1920_SPACES_SR_V2" || signatureFormatName === "REN_LEARNING_STAR_ALL360_V2" ) {
                var perfObject = decodePerfLevel(_util.coalesce(row.getField("DISTRICTBENCHMARKCATEGORYNAME")));
            } else {
                perfObject = decodePerfLevel(_util.coalesce(row.getField("RENAISSANCEBENCHMARKCATEGORYNAME")));
            }
           // var perfObject = decodePerfLevel(_util.coalesce(row.getField("RENAISSANCEBENCHMARKCATEGORYNAME")));


            score["TEST_PASSED_INDICATOR"] = perfObject.PASSING_IND;
            score["TEST_QUARTILE_SCORE"] = _util.coalesce(row.getField("RASCH_SCORE"),row.getField("RASCHSCORE"));
            score["TEST_DECILE_SCORE"] = _util.coalesce(row.getField("UNIFIED_SCORE"), row.getField("UNIVERSAL_SCORE"), row.getField("UNIVERSALSCORE"));

            var growth1 = row.getField("STUDENTGROWTHPERCENTILEFALLWINTER");
            if (!isNaN(growth1)) {
            score["TEST_GROWTH_TARGET_1"] = growth1;
            }

            var growth2 = row.getField("STUDENTGROWTHPERCENTILEWINTERSPRING");
            if (!isNaN(growth2)) {
            score["TEST_GROWTH_TARGET_2"] = growth2;
            }

            var growth3 = row.getField("STUDENTGROWTHPERCENTILEFALLSPRING");
            if (!isNaN(growth3)) {
            score["TEST_GROWTH_TARGET_3"] = growth3;
            }

            //new 2019
            var growth4 = row.getField("STUDENTGROWTHPERCENTILEFALLFALL");
            if (!isNaN(growth4)) {
            score["TEST_GROWTH_TARGET_4"] = growth4;
            }
            //UIHN-63091
            var growth5 = row.getField("STUDENTGROWTHPERCENTILESPRINGSPRING");
            if (!isNaN(growth5)) {
            score["TEST_GROWTH_TARGET_5"] = growth5;
            }
            //UIHN-63091
            var growth6 = row.getField("STUDENTGROWTHPERCENTILESPRINGFALL");
            if (!isNaN(growth6)) {
            score["TEST_GROWTH_TARGET_6"] = growth6;
            }
            score["TEST_GROWTH_RESULT"] = row.getField("CURRENTSGP");

            //new 2020
            var rawGE = _util.coalesce( row.getField("GRADEEQUIVALENT"),  row.getField("GRADEPLACEMENT"));
            if(rawGE!== null && rawGE!== undefined && rawGE!== ""){
            if(rawGE==="<1"||rawGE==="< 1"){
                rawGE = "-1";
            }
            else if(rawGE.toString().indexOf(">") > -1){
               if(rawGE.toString().indexOf(".") > -1){
                    rawGE = rawGE.toString().replace(" ", "");//Catch cases with spaces
                    rawGE = rawGE.toString().replace(">", "")+"99";//Cases without spaces
               }
               else{
                    rawGE = rawGE.toString().replace(" ", "");//Catch cases with spaces
                    rawGE = rawGE.toString().replace(">", "")+".999";//Cases without spaces
               }
            }
            }
            score["TEST_GRADE_EQUIVALENT"] = rawGE;
            score["TEST_SCORE_ATTRIBUTES"] = getTEST_SCORE_ATTRIBUTES(row);
            score["TEST_CUSTOM_RESULT"] = _util.coalesce(row.getField("TOTAL_TIME"),row.getField("TOTALTIME"));

            var spanishModifier = null;
            var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
            if(fileName.indexOf("SMS_V2")>-1 || fileName.indexOf("SMS_v2")>-1){
                spanishModifier = "SP";
            }
            if(fileName.indexOf("SRS_V2")>-1 || fileName.indexOf("SRS2_v2")>-1) {
                spanishModifier = "SP";
            }
            if(fileName.indexOf("SELS_V2")>-1 || fileName.indexOf("SELS_v2")>-1){
                spanishModifier = "SP";
            }
            if(fileName.indexOf("SMS")>-1){
                spanishModifier = "SP";
            }
            if(fileName.indexOf("SRS")>-1) {
                spanishModifier = "SP";
            }
            if(fileName.indexOf("SELS")>-1){
                spanishModifier = "SP";
            }
            if(spanishModifier==="SP"){
                score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(decodeDistrictBenchmarkCategoryLevel[row.getField("DISTRICTBENCHMARKCATEGORYLEVEL")]);
                score["TEST_PRIMARY_RESULT"] = _util.coalesce(row.getField("DISTRICTBENCHMARKCATEGORYNAME"));
            }
            else{
                score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(decodesStatesBenchmarkCatAdj[row.getField("STATEBENCHMARKCATEGORYADJUSTMENT")]);
                score["TEST_PRIMARY_RESULT"] = _util.coalesce(decodeStateBenchmarkCatAdj[row.getField("STATEBENCHMARKCATEGORYADJUSTMENT")]);
            }
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = _util.coalesce(row.getField("STATEBENCHMARKCATEGORYNAME"));
            rawGE = null;

            var quantile =  row.getField("QUANTILESCORE");
            if (quantile !== undefined && quantile !== null) {
                score["TEST_DECILE_SCORE"] = quantile;
            }
            return score;

        } catch(exception) {
            throw "${_thisModuleName}.mapTOTAL Exception: ${exception}";
        }
    }

    function mapTOTALAssessmentBenchmarks(row, testMetadata) {
        try {
            var score = {};
            var scaleScore = _util.coalesce(row.getField("UNIVERSALSCORE"),row.getField("SCALED_SCORE"),row.getField("SCALEDSCORE"), row.getField("ENTERPRISE_SCORE"), row.getField("AVERAGE_MASTERY"));
            var rawScore = _util.coalesce(row.getField("SCALED_SCORE"),row.getField("SCALEDSCORE"), row.getField("ENTERPRISE_SCORE"), row.getField("AVERAGE_MASTERY"));
            var attempt = row.getField("ASSESSMENT_NUMBER");
            if (!(row.getField("SATBENCHMARKCATEGORY") && row.getField("ACTBENCHMARKCATEGORY"))) {
                return null;
            }

            if(scaleScore === undefined || scaleScore === null || scaleScore.toString().trim() === "") {
                return null;
            }

            score["TEST_NUMBER"] = getTEST_NUMBER(row, "TOT_BNCH");
            if (!isNaN(attempt)) {
                score["TEST_ITEMS_ATTEMPTED"] = attempt;
            }
            if (!isNaN(scaleScore)) {
            score["TEST_SCALED_SCORE"] = scaleScore;
            }

            if (!isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
            }

            score["TEST_PRIMARY_RESULT_CODE"] = "SAT";
            score["TEST_PRIMARY_RESULT"] = "SAT Prediction: " + row.getField("SATBENCHMARKCATEGORY");
            score["TEST_SECONDARY_RESULT_CODE"] = "ACT";
            score["TEST_SECONDARY_RESULT"] = "ACT Prediction: " + row.getField("ACTBENCHMARKCATEGORY");
            return score;

        } catch(exception) {
            throw "${_thisModuleName}.mapTOTALAssessmentBenchmarks Exception: ${exception}";
        }
    }

    function mapBenchmarkScore(row, testMetadata) {
        try {
            var score = {};

            var lowerBound = row.getField(testMetadata.FIELD+"BENCHMARKMINSCALEDSCORE");
            var upperBound = row.getField(testMetadata.FIELD+"BENCHMARKMAXSCALEDSCORE");
            var proficient = row.getField(testMetadata.FIELD+"BENCHMARKPROFICIENT");
            var levelText = row.getField(testMetadata.FIELD+"BENCHMARKCATEGORYADJUSTMENT");
            var levelNum = levelText;
            if(levelText!==undefined && levelText!==null && levelText.toString().indexOf("Level")>-1){
                //Level 1 ->  1
                levelNum = benchmarkCategoryRecode[levelText];//or split on "Level " and take number
            }

            var levelRaw = _util.coalesce(row.getField(testMetadata.FIELD+"BENCHMARKCATEGORYLEVEL"),levelNum);
            var benchName = row.getField(testMetadata.FIELD+"BENCHMARKCATEGORYNAME");
            var assmName = row.getField(testMetadata.FIELD+"BENCHMARKASSESSMENTNAME");
            var numLevels = row.getField(testMetadata.FIELD+"BENCHMARKNUMBEROFCATEGORYLEVELS");
            var attempt = row.getField("ASSESSMENT_NUMBER");
            var perfObject = decodePerfLevel(benchName);

            if ((levelText === undefined || levelText === null || levelText.toString().trim() === "")
                && (benchName === undefined || benchName === null || benchName.toString().trim() === "")) {
                return null;
            }

            if (numLevels !== undefined && numLevels !== null && numLevels.toString().trim() !== "") {
                numLevels = numLevels.toString().split(".")[0];
            }

            score["TEST_NUMBER"] = getTEST_NUMBER(row, testMetadata.FIELD);
            if (!isNaN(attempt)) {
                score["TEST_ITEMS_ATTEMPTED"] = attempt;
            }
            score["TEST_SCORE_ATTRIBUTES"] = assmName;
            if (!isNaN(lowerBound)) {
            score["TEST_LOWER_BOUND"] = lowerBound;
            }
            if (!isNaN(upperBound)) {
            score["TEST_UPPER_BOUND"] = upperBound;
            }
            score["TEST_PASSED_INDICATOR"] = proficient;
            score["TEST_PRIMARY_RESULT_CODE"] = perfObject.RESULT_CODE;
            score["TEST_PASSED_INDICATOR"] = perfObject.PASSING_IND;
            score["TEST_PRIMARY_RESULT"] = benchName;
            score["TEST_SECONDARY_RESULT_CODE"] = levelRaw;
            score["TEST_SECONDARY_RESULT"] = levelText;
            score["TEST_SCORE_TEXT"] = levelText;
            if (!isNaN(numLevels)) {
            score["TEST_ITEMS_POSSIBLE"] = numLevels;
            }
            if (!isNaN(levelRaw)) {
            score["TEST_SCORE_VALUE"] = levelRaw;
            score["TEST_RAW_SCORE"] = levelRaw;
            }
            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapBenchmarkScore Exception: ${exception}";
        }
    }
    

    function mapORF(row, testMetadata) {
        try {
            var rawScore = _util.coalesce(row.getField("ORF"), row.getField("ESTIMATED_ORAL_READING_FLUENCY"));
            var attempt = row.getField("ASSESSMENT_NUMBER");
            if (rawScore === undefined || rawScore === null || rawScore.trim() === "") {
                return null;
            }

            var score = {};

            score["TEST_NUMBER"] = getTEST_NUMBER(row, "ORF");
            if (!isNaN(attempt)) {
                score["TEST_ITEMS_ATTEMPTED"] = attempt;
            }

            if (!isNaN(rawScore)) {
                score["TEST_RAW_SCORE"] = rawScore;
                score["TEST_SCORE_VALUE"] = rawScore;
            }
            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_ATTRIBUTES"] = getTEST_SCORE_ATTRIBUTES(row);
            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapORF Exception: ${exception}";
        }
    }

    function mapIRL(row, testMetadata) {
        try {
            var rawScore = row.getField("IRL");
            var attempt = row.getField("ASSESSMENT_NUMBER");
            if (rawScore === undefined || rawScore === null || rawScore.toString().trim() === "") {
                return null;
            }

            var score = {};

            score["TEST_NUMBER"] = getTEST_NUMBER(row, "IRL");
            if (!isNaN(attempt)) {
                score["TEST_ITEMS_ATTEMPTED"] = attempt;
            }

            if (!isNaN(rawScore)) {
                score["TEST_SCORE_VALUE"] = rawScore;
                score["TEST_RAW_SCORE"] = rawScore;
            }
            if(rawScore ==="P"){
                score["TEST_SCORE_VALUE"] = -1;
                score["TEST_RAW_SCORE"] = -1;
            }
            if(rawScore ==="PP"){
                score["TEST_SCORE_VALUE"] = -2;
                score["TEST_RAW_SCORE"] = -2;
            }
            if(rawScore ==="PHS"){
                score["TEST_SCORE_VALUE"] = 13;
                score["TEST_RAW_SCORE"] = 13;
            }
            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_ATTRIBUTES"] = getTEST_SCORE_ATTRIBUTES(row);
            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapIRL Exception: ${exception}";
        }
    }

    function mapLC(row, testMetadata) {
        try {
            var rawScore = row.getField("LITERACYCLASSIFICATION");

            if (rawScore === undefined || rawScore === null || rawScore.trim() === "") {
                return null;
            }

            var score = {};

            score["TEST_NUMBER"] = getTEST_NUMBER(row, "LC");
            if (!isNaN(rawScore)) {
                score["TEST_SCORE_VALUE"] = rawScore;
            }

            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_ATTRIBUTES"] = getTEST_SCORE_ATTRIBUTES(row);
            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapLC Exception: ${exception}";
        }
    }

    function mapDomainOrSkillSetScores(row, testMetadata) {
        try {
            var rawScore = row.getField(testMetadata.FIELD);

            if (rawScore === undefined || rawScore === null || rawScore.trim() === "") {
                return null;
            }

            var score = {};

            score["TEST_NUMBER"] = getTEST_NUMBER(row, testMetadata.CODE);
            if (!isNaN(rawScore)) {
                score["TEST_RAW_SCORE"] = rawScore;
                score["TEST_SCORE_VALUE"] = rawScore;
            }
            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_ATTRIBUTES"] = getTEST_SCORE_ATTRIBUTES(row);
            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapDomainOrSkillSetScores Exception: ${exception}";
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
        try {
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
            scoresToMap.forEach(function (testMetadata) {
                try {
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch (exception) {
                    print(exception);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
                }

            });

            // System Fields
            record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
            record.LINEAGE_SOURCE = _thisLineageSource;
            record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
            //print(signature.getFormat().getFormatName());
            record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
            record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

            return record;
        } catch(e) {
            print(e)
        }
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
    	var sd = "";
    	var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
          };
    	var birthDate = row.getField("STUDENT_BIRTHDATE");
        if(birthDate !== null && birthDate.startsWith("00:") || birthDate === "NA"){
            birthDate = null;
        }
    	if (birthDate !== null && birthDate !== "") {
    		birthDate = module.mapDateObject(hierarchy, signature, birthDate);;
    	} else {
    	    birthDate = birthDateObject;
    	}

    	var tad = row.getField("TEST_ADMIN_DATE");
    	if (tad !== null && tad !== undefined && tad !== "") {
    		var dateVal1 = tad;
    		if (tad.length > 10) {
    			dateVal1 = tad.split(" ")[0];
    			if (dateVal1.indexOf("/") > -1) {
    				// MM/dd/yy
    				sd = AppUtil.getMonthFollowedByDay(dateVal1, "MM/dd/yyyy").STANDARD_DATE;
    			} else if (dateVal1.indexOf("-") > -1) {
    				// MM-dd-yy
    				sd = AppUtil.getMonthFollowedByDay(dateVal1, "MM-dd-yyyy").STANDARD_DATE;
    			}
    		} else if (tad.indexOf("/") > -1) {
    			if (dateVal1.length < 10) {
    				dateVal1 = "0" + dateVal1;
    			}
    			sd = AppUtil.getMonthFollowedByDay(dateVal1, "MM/dd/yyyy").STANDARD_DATE;
    		}
    		// No Timestamp 2019-09-09
    		else if (tad.length == 10) {
    			sd = AppUtil.getDateObjByPattern(tad, "yyyy-MM-dd").STANDARD_DATE;
    		} else if (tad.indexOf("-") > -1) {
    			sd = AppUtil.getDateObjByPattern(tad.substring(0, tad.indexOf(" ")), "yyyy-MM-dd").STANDARD_DATE;
    		} else {
    			sd = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5);
    		}
    	} else if (row.getField("ACTIVITY_COMPLETED_DATE") !== null) {
    		var dateVal = row.getField("ACTIVITY_COMPLETED_DATE");
    		if (dateVal !== "" && dateVal !== undefined && dateVal !== null && dateVal.indexOf(":") === 2 && dateVal.length === 7) {
    			sd = `05/15/${hierarchy.SCHOOL_YEAR.substring(5)}`;
    		}
    		// No Timestamp 2019-09-09
    		else if ((dateVal !== null && dateVal !== "" && dateVal !== undefined && dateVal.length == 10 && dateVal.indexOf("/") === -1)) {
    			sd = AppUtil.getDateObjByPattern(dateVal, "yyyy-MM-dd").STANDARD_DATE;
    		} else if ((dateVal !== null && dateVal !== "" && dateVal !== undefined && dateVal.length !== 17)) {
    			if (dateVal.length < 10) {
    				dateVal = "0" + dateVal;
    				sd = AppUtil.getDateObjByPattern(dateVal, "MM/dd/yyyy").STANDARD_DATE;
    			} else if (dateVal.length === 23) {
    				sd = AppUtil.getDateObjByPattern(dateVal.substring(0, dateVal.indexOf(" ")), "yyyy-MM-dd").STANDARD_DATE;
    			} else {
    				sd = AppUtil.getDateObjByPattern(dateVal, "MM/dd/yyyy").STANDARD_DATE;
    			}
    		} else if (dateVal !== null && dateVal !== "" && row.getField("ACTIVITY_COMPLETED_DATE") !== undefined && (dateVal.length === 17)) {
    			sd = AppUtil.getDateObjByPattern(dateVal, "MM/dd/yyyy hh:mm:ss").STANDARD_DATE;
    		} else {
    			sd = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5);
    		}
    	} else {
    		sd = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5);
    	}

    	var grade = decodeGrade(_util.coalesce(row.getField("STUDENT_GRADE_CODE"), row.getField("GRADE"), row.getField("CURRENT_GRADE"), row.getField("CURRENTGRADE")));
        

    	normalizedFileFields.forEach(function(field) {
    		switch (field) {
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
    				record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; // pre UIHN-9419:   districtCode;
    				break;
    			case "SCHOOL_YEAR":
    				record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
    				break;
    			case "REPORTING_PERIOD":
    				record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(sd);
    				break;
    			case "ASSESSMENT_VENDOR":
    				record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
    				break;
    			case "ASSESSMENT_PRODUCT":
    				record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
    				break;
    			case "TEST_ADMIN_DATE":
    				record.TEST_ADMIN_DATE = sd;
    				break;
    			case "STUDENT_LOCAL_ID":
    			    record.STUDENT_LOCAL_ID = row.getField("STUDENT_LOCAL_ID");
    			    break;
    			case "STUDENT_STATE_ID":
    			    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENTSTATEID"),row.getField("STUDENT_STATE_ID"));
    			//review this mapping based on the ticket UIHN-38565 over the student id for STUDENTDISPLAYID
    			//unclear STUDENTDISPLAYID is to be mapped to state or local id.
    			case "STUDENT_VENDOR_ID":
    				record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENTDISPLAYID"), row.getField("STUDENT_LOCAL_ID"), row.getField("STUDENTSTATEID"), row.getField("STUDENT_STATE_ID"));
    				break;
    			case "STUDENT_DOB_MONTH":
    				record.STUDENT_DOB_MONTH = _util.coalesce(birthDate.MONTH, null);
    				break;
    			case "STUDENT_DOB_DAY":
    				record.STUDENT_DOB_DAY = _util.coalesce(birthDate.DAY, null);
    				break;
    			case "STUDENT_DOB_YEAR":
    				record.STUDENT_DOB_YEAR = _util.coalesce(birthDate.YEAR, null);
    				break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
    			case "STUDENT_GRADE_CODE":
    				record.STUDENT_GRADE_CODE = _util.coalesce(grade, null);
    				break;
    			case "SCHOOL_VENDOR_ID":
    				record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOLLOCALID"), row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOLSTATEID"), row.getField("SCHOOL_NAME"), row.getField("SCHOOLNAME"), row.getField("DISTRICTNAME"));
    				break;
    			case "SCHOOL_LOCAL_ID":
    				record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOLLOCALID"));
    				break;
    			case "SCHOOL_STATE_ID":
    				record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOLSTATEID"));
    				break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), row.getField("SCHOOLNAME"));
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
         var teacher = _util.coalesce(row.getField("TEACHER_LOCAL_ID"), row.getField("TEACHERLOCALID"), row.getField("TEACHER_STATE_ID"), row.getField("TEACHERSTATEID"));
         var teacherIdentifier =  _util.coalesce(row.getField("TEACHERLOCALID"),row.getField("TEACHERUSERID"));
         var testInterventionDesc = _util.coalesce(row.getField("WINDOW_NAME"),row.getField("WINDOWNAME"));
         var teacherSourceID = row.getField("TEACHERSOURCEDID");
         var teacherStateID = _util.coalesce(row.getField("TEACHERSTATEID"));

         admin.TEST_INTERVENTION_DESC =  testInterventionDesc;

         admin.TEST_INTERVENTION_DESC_2 = row.getField("TAKENAT");
         var testTakenByIP = _util.trim(row.getField("TAKENATBYIP"));
         if(testTakenByIP === "NA" || testTakenByIP === "" || testTakenByIP === undefined || testTakenByIP === null){
            testTakenByIP = null;
         }
         admin.TEST_INTERVENTION_DESC_3 = testTakenByIP;

         if ((teacherStateID === undefined || teacherStateID === null || teacherStateID.toString().trim() === "") && (teacherSourceID === undefined || teacherSourceID === null || teacherSourceID.toString().trim() === "") && (teacherIdentifier === undefined || teacherIdentifier === null || teacherIdentifier.toString().trim() === "")) {
             return admin;
         }
         if (teacherSourceID !== null && teacherSourceID !== undefined && teacherSourceID !== "")  {
                if (teacherSourceID.toString().indexOf("Temp")>-1) {
                        teacherSourceID = teacherSourceID.slice(-5);
                }else if (teacherSourceID.toString().indexOf("T")>-1){
                        teacherSourceID = teacherSourceID.replace("T", "");
                }
            }
            if(teacherStateID !== null && teacherStateID !== undefined && teacherStateID !== ""){
                teacherStateID = teacherStateID.replace("T","");
            }
            if(teacherIdentifier !== null && teacherIdentifier !== undefined && teacherIdentifier !== ""){
                teacherIdentifier = teacherIdentifier.replace("T","");
            }
            if(teacher !== null && teacher !== undefined && teacher !== ""){
                teacher = teacher.replace("T","");
            }

         admin.TEST_TEACHER = teacher;
         admin.VENDOR_STAFF_ID = teacherSourceID;
         admin.STATE_STAFF_ID = teacherStateID;
         admin.DISTRICT_STAFF_ID = teacherIdentifier;

         return admin;
     }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function getTEST_NUMBER(row, scoreType) {
        var testType = testTypes[_util.coalesce(row.getField("TEST_TYPE"),row.getField("TESTTYPE"))];
        var grade = decodeGrade(_util.coalesce(row.getField("GRADE"), row.getField("CURRENTGRADE")));
        var spanishModifier = null;
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        if(fileName.indexOf("SMS_V2")>-1){
            spanishModifier = "SP";
        }
        if(fileName.indexOf("SRS_V2")>-1 || fileName.indexOf("SRS2_V2")>-1 | fileName.indexOf("SRS_v2")>-1 ) {
            spanishModifier = "SP";
        }
        if(fileName.indexOf("SELS_V2")>-1 || fileName.indexOf("SELS_v2")>-1){
            spanishModifier = "SP";
        }
        if(fileName.indexOf("SMS.")>-1){
            spanishModifier = "SP";
        }
        if(fileName.indexOf("SRS.")>-1) {
            spanishModifier = "SP";
        }
        if(fileName.indexOf("SELS.")>-1){
            spanishModifier = "SP";
        }
        if (spanishModifier !== null) {
            return `STAR_V2_STATE${testType}${spanishModifier}${subject}${grade}${scoreType}`;
        }
        return `STAR_V2_STATE${testType}${subject}${grade}${scoreType}`;
    }

    function getTEST_ADMIN_PERIOD(date) {
        var testAdminPeriod = "Unknown";
        var sd = date;
            if(sd===null || sd=== undefined){
                return testAdminPeriod;
            }

            var month = sd.substring(0,2);
            //Altered by one month (previously Fall started in July) to match http://doc.renlearn.com/KMNet/R00571375CF86BBF.pdf
            //Due to ticket SBSD-76
            if( month === "08" || month === "09" || month === "10" || month === "11")
                testAdminPeriod = "Fall";
            else if(month === "12" || month === "01" || month === "02" || month === "03")
                testAdminPeriod = "Winter";
            else if(month === "04" || month === "05" || month === "06" || month === "07")
                testAdminPeriod = "Spring";

        return testAdminPeriod;
    }

    function getTEST_SCORE_ATTRIBUTES(row) {
         var courseNumber = _util.coalesce(row.getField("COURSE_NUMBER"), row.getField("COURSENUMBER"));
        var attributes = "";

        if(courseNumber !== null && courseNumber !== "")
            attributes += "COURSE_NUMBER: ${courseNumber} ";
        return attributes.trim();
    }

    function removeLexileAlphaChar(value) {
        if(value === undefined || value === null) {
            return null;
        } else if (value.trim().startsWith("BR") && value.trim().length == 2){
            // BR = Beginning Reader
            return value.replace("L", "").replace("BR", "0");
        } else {
            return value.replace("L", "").replace("BR", "-");
        }
    }

    function removeLexileUpperLowerAlphaChar(value) {
        if(value === undefined || value === null) {
            return null;
        } else {
            return value.replace("L", "").replace("BR", "0");
        }
    }
    // Name from signature 'formatName'
    function determineFileSubject(format,normalizedFile) {
        var type =  format.substring(format.lastIndexOf('_', format.lastIndexOf('_')-1)+1);
        var subject = '';
        var fileName = normalizedFile.substring(normalizedFile.lastIndexOf('/')+1);
        if (type === 'ALL360_V2' && fileName.indexOf('Star_Early_Literacy')> -1) {
            subject = 'LIT';
        } else if (type === 'ALL360_V2' && (fileName.indexOf('Star_Reading')> -1 || fileName.indexOf('Star_English')> -1 || fileName.indexOf('STAR_READING')> -1) || fileName.indexOf('STAR_Reading')> -1) {
            subject = 'RD';
        } else if (type === 'ALL360_V2' && (fileName.indexOf('Star_Math')> -1 || fileName.indexOf('STAR_MATH')> -1 || fileName.indexOf('STAR_Math')> -1)) {
            subject = 'MA';
        } else if (type === 'ALL360_V2' && fileName.indexOf('Star_CAT_MATH')> -1) {
            subject = 'MA';
        }else if (fileName.indexOf('SR_V2')> -1 || fileName.indexOf('SR_v2')> -1 || fileName.indexOf('SRS_v2')> -1 || fileName.indexOf('SRS_V2')> -1){
           subject = 'RD';
        }else if (fileName.indexOf('Star_Math')> -1 || fileName.indexOf('STAR_MATH')> -1 || fileName.indexOf('STAR_Math')> -1 || fileName.indexOf('STAR Math')> -1 ){
           subject = 'MA';
        }else if (fileName.indexOf('SM_v2')> -1 || fileName.indexOf('SM_V2')> -1 || fileName.indexOf('SMS_V2')> -1 || fileName.indexOf('SMS_v2')> -1){
           subject = 'MA';
        }else if (fileName.indexOf('SEL_V2')> -1 || fileName.indexOf('SEL_v2')> -1 ||  fileName.indexOf('SELS_V2')> -1 ||  fileName.indexOf('SELS_v2')> -1 || fileName.indexOf('SEL')> -1){
           subject = 'LIT';
        }else {
            subject = fileNamesToSubjects[type];
        }
        return subject;
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

        if(rawDate.indexOf("-") > -1 && rawDate.substring(4,5)==='-') {
            var formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
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
        if( rawDate.indexOf("-") > -1 && rawDate.substring(2,3)=== '-'){
            var formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
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
        var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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
        var sd = "";
        var testType = testTypes[_util.coalesce(srcRecord.getField("TEST_TYPE"),srcRecord.getField("TESTTYPE"))];

        var attempt = srcRecord.getField("ASSESSMENT_NUMBER");
        var tad = _util.coalesce(srcRecord.getField("TEST_ADMIN_DATE"),srcRecord.getField("ACTIVITY_COMPLETED_DATE"));
        if(tad !== null && tad !== undefined && tad !== ""){
            var dateVal2 = tad;
            if(tad.length > 10) {
                dateVal2 = tad.split(" ")[0];
                if (dateVal2.indexOf("/") > -1){
                    // MM/dd/yy
                    sd = AppUtil.getDateObjByPattern(dateVal2, "MM/dd/yyyy").STANDARD_DATE;
                }
                else if (dateVal2.indexOf("-") > -1) {
                    if(dateVal2.indexOf("-") == 4){
                        // MM-dd-yy
                        sd = AppUtil.getDateObjByPattern(dateVal2, "yyyy-MM-dd").STANDARD_DATE;
                    }
                    else{
                        // MM-dd-yy
                        sd = AppUtil.getDateObjByPattern(dateVal2, "MM-dd-yyyy").STANDARD_DATE;
                    }
                }
            } else if (tad.indexOf("/") > -1){
                if(dateVal2.length<10){
                    dateVal2 = "0" + dateVal2;
                }
                sd = AppUtil.getDateObjByPattern(dateVal2, "MM/dd/yyyy").STANDARD_DATE;
            }
            // No Timestamp 2019-09-09
            else if (tad.length == 10) {
                 sd = AppUtil.getDateObjByPattern(tad, "yyyy-MM-dd").STANDARD_DATE;
            }
            else if (tad.indexOf("-") > -1){
                 sd = AppUtil.getDateObjByPattern(tad.substring(0, tad.indexOf(" ")), "yyyy-MM-dd").STANDARD_DATE;
            }
            else {
                 sd = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5);
            }
        }
        var period = getTEST_ADMIN_PERIOD(sd);
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}_${testType}_${attempt}_${subject}";
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        if (tad) {
            assessmentAdminKey = assessmentAdminKey + '_' + sd;
        }

        return assessmentAdminKey;
    }

    function removeTimeFromDate(TADate) {
        let dateObject = new Date(TADate);
        return dateObject.getFullYear() + '/' + (dateObject.getMonth()+1) + '/' + (dateObject.getDate());
    }

module.mapDateObject = function (hierarchy, row, dateStr) {

        //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
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
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd/MM/yyyy");
            } catch(exception){
                // Error will be reported in final check.
            }
        }

        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd-MM-yyyy");
            } catch(exception){
                // Error will be reported in final check.
            }
        }

        if(testDateObject === null){
            try {
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
    return module;
}());
