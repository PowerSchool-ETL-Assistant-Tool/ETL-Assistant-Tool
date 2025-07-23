var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "STAR";
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
            subject = determineFileSubject(_fileDetector.getSignatureName(signature));
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
        {CODE: null, FIELD: null, MAP_FUNCTION: mapORF},
        {CODE: null, FIELD: null, MAP_FUNCTION: mapIRL},
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
    var fileNamesToSubjects = {
        //Standard Files
        "SEL": "LIT",
        "SM": "MA",
        "SR": "RD",
        // Spanish Versions
        "SELS": "SPLIT",
        "SMS": "SPMA",
        "SRS": "SPRD",
        "SRS2": "SPRD"
    };

    var testTypes = {
        "Classic":"CSC",
        "Enterprise":"ENT",
        "Non-Enterprise":"NONENT",
        "Progress Monitoring":"PRGMNT",
        "Geometry":"GEM",
        "Algebra":"ALG",
        "Unknown":"UNK"
    };

    var perfLevels = {
        //Standard STAR
        "Intervention": { PASSING_IND: "No", RESULT_CODE: "INTER", RESULT: "Intervention"},
        "On Watch": { PASSING_IND: "No", RESULT_CODE: "ONWCH", RESULT: "On Watch"},
        "Urgent Intervention": { PASSING_IND: "No", RESULT_CODE: "URGIN", RESULT: "Urgent Intervention"},
        "At/Above Benchmark": { PASSING_IND: "Yes", RESULT_CODE: "ATABV", RESULT: "At/Above Benchmark"},
        //Average Mastery
        "Beginning": { PASSING_IND: "No", RESULT_CODE: "BEG", RESULT: "Beginning"},
        "Developing": { PASSING_IND: "Yes", RESULT_CODE: "DEV", RESULT: "Developing"},
        "Secure": { PASSING_IND: "Yes", RESULT_CODE: "SEC", RESULT: "Secure"},
    };

    var grades = {
        "Pre-K":"PK",
        "K":"KG",
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
        "None" : null,
        "" : null,
        null : null
    };

    var decodeStateBenchmarkCatAdj = {
        "Level 1":"1",
        "Level 2":"2",
        "Level 3":"3",
        "Level 4":"4",
        "" : null,
        null : null
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

    function mapTOTAL(row, testMetadata) {
        try {
            var score = {};
            var scaleScore = _util.coalesce(row.getField("SCALED_SCORE"),row.getField("SCALEDSCORE"), row.getField("ENTERPRISE_SCORE"), row.getField("AVERAGE_MASTERY"));

            if(scaleScore === undefined || scaleScore === null || scaleScore.trim() === "") {
                return null;
            }

            score["TEST_NUMBER"] = getTEST_NUMBER(row, "TOT");
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_PERCENTILE_SCORE"] = _util.coalesce(row.getField("PERCENTILE_RANK"),row.getField("PERCENTILERANK"));
            score["TEST_NCE_SCORE"] = _util.coalesce(row.getField("NORMAL_CURVE_EQUIVALENT"),row.getField("NORMAL_CURVE_EQUIVALENT"));
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_STANDARD_ERROR"] = row.getField("SEM");

            /*
                Upper and lower ZPD shouldn"t be used.  Only use the lexile versions.
            */
            score["TEST_READING_LEVEL"] = removeLexileAlphaChar(_util.coalesce(row.getField("LEXILE")));
            score["TEST_LOWER_BOUND"] = removeLexileAlphaChar(_util.coalesce(row.getField("LOWER_LEXILE_ZPD"),row.getField("LOWERLEXILEZPD")));
            score["TEST_UPPER_BOUND"] = removeLexileAlphaChar(_util.coalesce(row.getField("UPPER_LEXILE_ZPD"), row.getField("UPPERLEXILEZPD")));

            // Setting full values.  The lexiles contain non-numeric characters.
            score["TEST_TERTIARY_RESULT"] = removeLexileUpperLowerAlphaChar(_util.coalesce(row.getField("LOWER_LEXILE_ZPD"),row.getField("LOWERLEXILEZPD")));
            score["TEST_QUATERNARY_RESULT"] = removeLexileUpperLowerAlphaChar(_util.coalesce(row.getField("UPPER_LEXILE_ZPD"), row.getField("UPPERLEXILEZPD")));

            //Map Performance Levels
            var perfObject = decodePerfLevel(_util.coalesce(row.getField("SCREENING_CATEGORY"), row.getField("SCREENING_CATEGORY_GROUP_ADJUSTMENT"), row.getField("SCREENINGCATEGORYGROUPADJUSTMENT"), row.getField("MASTERY_LEVEL")));

            score["TEST_CUSTOM_RESULT_CODE"] = perfObject.RESULT_CODE;
            score["TEST_PASSED_INDICATOR"] = perfObject.PASSING_IND;
            score["TEST_SECONDARY_RESULT"] = _util.coalesce(row.getField("LITERACY_CLASSIFICATION"));
            score["TEST_QUARTILE_SCORE"] = _util.coalesce(row.getField("RASCH_SCORE"),row.getField("RASCHSCORE"));
            score["TEST_DECILE_SCORE"] = _util.coalesce(row.getField("UNIFIED_SCORE", row.getField("UNIVERSAL_SCORE"), row.getField("UNIVERSALSCORE")));

            if (row.getField("CURRENTSGP") !== null) {
                score["TEST_GROWTH_PERCENTILE"] = _util.coalesce(row.getField("CURRENT_SGP"), row.getField("CURRENTSGP"));
            }
            else {
                score["TEST_GROWTH_TARGET_1"] = row.getField("FALL_WINTER_SGP");
                score["TEST_GROWTH_TARGET_2"] = row.getField("WINTER_SPRING_SGP");
                score["TEST_GROWTH_TARGET_3"] = row.getField("FALL_SPRING_SGP");
            }

            score["TEST_GRADE_EQUIVALENT"] = _util.coalesce(row.getField("GRADE_EQUIVALENT"), row.getField("GRADEEQUIVALENT"), row.getField("GRADE_PLACEMENT"), row.getField("GRADEPLACEMENT"));
            score["TEST_SCORE_ATTRIBUTES"] = getTEST_SCORE_ATTRIBUTES(row);
            score["TEST_CUSTOM_RESULT"] = _util.coalesce(row.getField("TOTAL_TIME"),row.getField("TOTALTIME"));
            score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(decodeStateBenchmarkCatAdj[row.getField("STATEBENCHMARKCATEGORYADJUSTMENT")]);
            score["TEST_PRIMARY_RESULT"] = _util.coalesce(row.getField("STATEBENCHMARKCATEGORYADJUSTMENT"));

            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapTOTAL Exception: ${exception}";
        }
    }

    function mapORF(row, testMetadata) {
        try {
            var rawScore = _util.coalesce(row.getField("ORF"), row.getField("ESTIMATED_ORAL_READING_FLUENCY"));

            if (rawScore === undefined || rawScore === null || rawScore.trim() === "") {
                return null;
            }

            var score = {};

            score["TEST_NUMBER"] = getTEST_NUMBER(row, "ORF");
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
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

            if (rawScore === undefined || rawScore === null || rawScore.trim() === "") {
                return null;
            }

            var score = {};

            score["TEST_NUMBER"] = getTEST_NUMBER(row, "IRL");

            if (!isNaN(rawScore)) {
                score["TEST_SCORE_VALUE"] = rawScore;
            }

            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_ATTRIBUTES"] = getTEST_SCORE_ATTRIBUTES(row);

            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapIRL Exception: ${exception}";
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
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
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
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch (exception) {
                    print(exception);
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
                }

            });

            // System Fields
            record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
            record.LINEAGE_SOURCE = _thisLineageSource;
            record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
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
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
                                RAW_DATE : null
                                , MONTH : null
                                , DAY : null
                                , YEAR : null
                                , STANDARD_DATE : null
                              };
        var birthDate = null;
        if(row.getField("STUDENT_BIRTHDATE")!==null){
        birthDate = row.getField("STUDENT_BIRTHDATE").substring(0, row.getField("STUDENT_BIRTHDATE").indexOf(" "), "MM/dd/yyyy");
        }
        //Date fields to be split
        if (birthDate !== null && birthDate !== undefined && birthDate !== ""){
            birthDate = row.getField("STUDENT_BIRTHDATE").substring(0, row.getField("STUDENT_BIRTHDATE").indexOf(" "), "MM/dd/yyyy");
            birthDateObject = parseDate(birthDate);
        }
        else {
            birthDateObject = parseDate("");

         }

        var studentLocalID = null;
        var stuLocalID = _util.coalesce(row.getField("STUDENTLOCALID"), row.getField("STUDENT_LOCAL_ID"));

        // Remove 's' from field if it exists
        if(stuLocalID !== null && stuLocalID !== "" && stuLocalID !== undefined){
             if (stuLocalID.trim().indexOf("STU-") >= 0) {
                    studentLocalID = stuLocalID.trim().replace("STU-","");
             } else if (stuLocalID.trim().indexOf("stu-") >= 0) {
                    studentLocalID = stuLocalID.trim().replace("stu-","");
             } else if (stuLocalID.trim().indexOf("STU") >= 0) {
                    studentLocalID = stuLocalID.trim().replace("STU","");
             } else if (stuLocalID.trim().indexOf("stu") >= 0) {
                    studentLocalID = stuLocalID.trim().replace("stu","");
             } else if (stuLocalID.trim().indexOf("s") >= 0){
                    studentLocalID = stuLocalID.trim().replace("s","");
             } else if (stuLocalID.trim().indexOf("S") >= 0) {
                    studentLocalID = stuLocalID.trim().replace("S","");
            } else {
                studentLocalID = stuLocalID;
            }
        } else {
            studentLocalID;
        }

        var grade = decodeGrade(_util.coalesce(row.getField("STUDENT_GRADE_CODE")
            , row.getField("GRADE")
            , row.getField("CURRENT_GRADE")
            ,row.getField("CURRENTGRADE")));

        /*  pre UIHN-9419:
        // This was needed to check and handle fields with spaces in them.
        var fieldDistrictCode1 = row.getField("DISTRICT_STATE_ID");
             if(fieldDistrictCode1 === ""){
                fieldDistrictCode1 = null;
             }

        var fieldDistrictCode2 = row.getField("DISTRICTSTATEID");
             if(fieldDistrictCode2 === ""){
                fieldDistrictCode2 = null;
             }

         var fieldDistrictCode3 = row.getField("DISTRICT_CODE");
         if(fieldDistrictCode3 === ""){
            fieldDistrictCode3 = null;
         }

        var districtCode = _util.coalesce(
                                            fieldDistrictCode1
                                            , fieldDistrictCode2
                                            , fieldDistrictCode3
                                            , AssessmentLoader.config.DISTRICT_CODE
                                            , ""
                                         );

        //District code fields are length 14, 7 district code numbers followed by 7 school code numbers or 7 zeroes
        if(districtCode !== null && districtCode.length > 7){
            districtCode = districtCode.substring(0,7);
        }
        */

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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   districtCode;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(row);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE").substring(0, row.getField("TEST_ADMIN_DATE").indexOf(" ")), "MM/dd/yyyy").STANDARD_DATE;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH,null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(grade, null);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(studentLocalID, null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOLLOCALID"), row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOLSTATEID"), row.getField("SCHOOL_NAME"), row.getField("SCHOOLNAME"));
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
        var teacher = _util.coalesce(row.getField("TEACHER_LOCAL_ID"), row.getField("TEACHER_STATE_ID"));
        var testInterventionDesc = _util.coalesce(row.getField("WINDOW_NAME"),row.getField("WINDOWNAME"));

        admin.TEST_TEACHER = teacher;
        admin.TEST_INTERVENTION_DESC =  testInterventionDesc;

        return admin;
    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function getTEST_NUMBER(row, scoreType) {
        var testType = testTypes[_util.coalesce(row.getField("TEST_TYPE"),row.getField("TESTTYPE"))];
        var grade = decodeGrade(_util.coalesce(row.getField("STUDENT_GRADE_CODE"), row.getField("GRADE"), row.getField("CURRENT_GRADE"),row.getField("CURRENTGRADE")));

        return "STAR${testType}${subject}${grade}${scoreType}";
    }

    function getTEST_ADMIN_PERIOD(row) {
        var testAdminPeriod = "Unknown";
        var windowName = _util.coalesce(row.getField("GLOBAL_WINDOW"), row.getField("GLOBALWINDOW"));

        if(windowName !== undefined && windowName !== null) {
            if(windowName.length > 20) {
                windowName = windowName.substring(0,20);
            }

            testAdminPeriod = windowName;

        } else {
            var month = _util.coalesce(row.getField("TEST_ADMIN_DATE"));

            if(month === "07" || month === "08" || month === "09" || month === "10")
                testAdminPeriod = "Fall";
            else if(month === "11" || month === "12" || month === "01" || month === "02")
                testAdminPeriod = "Winter";
            else if(month === "03" || month === "04" || month === "05" || month === "06")
                testAdminPeriod = "Spring";
        }

        return testAdminPeriod
    }

    function getTEST_SCORE_ATTRIBUTES(row) {
        var sectionATime = _util.coalesce(row.getField("SECTION_A_TIME"), row.getField("SECTIONATIME"));
        var sectionBTime = _util.coalesce(row.getField("SECTION_B_TIME"), row.getField("SECTIONBTIME"));
        var courseNumber = _util.coalesce(row.getField("COURSE_NUMBER"), row.getField("COURSENUMBER"));
        var attributes = "";

        if(courseNumber !== null && courseNumber !== "")
            attributes += "COURSE_NUMBER: ${courseNumber} ";
        if(sectionATime !== null && sectionATime !== "")
            attributes += "SECTION_A_TIME: ${sectionATime} ";
        if(sectionBTime !== null && sectionBTime !== "")
            attributes += "SECTION_B_TIME: ${sectionBTime} ";

        return attributes.trim();
    }

    function removeLexileAlphaChar(value) {
        if(value === undefined || value === null) {
            return null;
        } else if (value.trim().startsWith("BR") && value.trim().length() == 2){
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

    function determineFileSubject(format) {
        var type = format.substring(format.lastIndexOf("_") + 1);

        return fileNamesToSubjects[type];
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
        if(rawDate === null || _util.trim(_util.coalesce(rawDate, "")) === ""){
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
        var testType = testTypes[srcRecord.getField("TEST_TYPE")];
        var period = getTEST_ADMIN_PERIOD(srcRecord);
        var attempt = srcRecord.getField("ASSESSMENT_NUMBER");
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}_${testType}_${attempt}_${subject}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        return assessmentAdminKey;
    }

    return module;
}());
