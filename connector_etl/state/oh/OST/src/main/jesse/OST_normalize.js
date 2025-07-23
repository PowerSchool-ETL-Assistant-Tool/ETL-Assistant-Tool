var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "OST";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {

            var signatureFormatName = signature.getFormat().getFormatName();
            print("\nLoading using signature file ${signatureFormatName}");


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("\nNormalized file: ${normalizedFile}");

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
                .group_by("ADMINISTRATION GROUPING", function (one, two) {

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, exception, JSON.stringify(one) + '|' + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {
                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK: ${exception}", JSON.stringify(rows)));
                    }

                })
                .transform("TRANSFORM", ["RECORDS"],
                    function (output, rows) {

                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {

                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if (mappingObject.SCORE_MAPPINGS.length == 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

                return normalizedFile;

        } catch (exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function (file) {
        return AppDataflow.mergeAssessment(file);
    };



    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    var scoresToMap =
        [
            // OST Scores to Process
            { NAME: "Grade 3 English Language Arts", CODE: "OSTSTR_ELA03", SUBSCORELOOKUP: "ELA", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 4 English Language Arts", CODE: "OSTSTR_ELA04", SUBSCORELOOKUP: "ELA", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 5 English Language Arts", CODE: "OSTSTR_ELA05", SUBSCORELOOKUP: "ELA", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 6 English Language Arts", CODE: "OSTSTR_ELA06", SUBSCORELOOKUP: "ELA", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 7 English Language Arts", CODE: "OSTSTR_ELA07", SUBSCORELOOKUP: "ELA", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 8 English Language Arts", CODE: "OSTSTR_ELA08", SUBSCORELOOKUP: "ELA", MAP_FUNCTION: mapStrandScore }
            , { NAME: "English Language Arts 1", CODE: "OSTSTR_ELA_1", SUBSCORELOOKUP: "ELA", MAP_FUNCTION: mapStrandScore }
            , { NAME: "English Language Arts 2", CODE: "OSTSTR_ELA_2", SUBSCORELOOKUP: "ELA", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 3 Mathematics", CODE: "OSTSTR_MATH03", SUBSCORELOOKUP: "3M", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 4 Mathematics", CODE: "OSTSTR_MATH04", SUBSCORELOOKUP: "4M", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 5 Mathematics", CODE: "OSTSTR_MATH05", SUBSCORELOOKUP: "5M", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 6 Mathematics", CODE: "OSTSTR_MATH06", SUBSCORELOOKUP: "6M", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 7 Mathematics", CODE: "OSTSTR_MATH07", SUBSCORELOOKUP: "7M", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 8 Mathematics", CODE: "OSTSTR_MATH08", SUBSCORELOOKUP: "8M", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Integrated Mathematics 1", CODE: "OSTSTR_INT_MATH_1", SUBSCORELOOKUP: "IM1", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Integrated Mathematics 2", CODE: "OSTSTR_INT_MATH_2", SUBSCORELOOKUP: "IM2", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Algebra 1", CODE: "OSTSTR_ALG_1", SUBSCORELOOKUP: "ALG", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Geometry", CODE: "OSTSTR_GEOM", SUBSCORELOOKUP: "GEO", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 4 Social Studies", CODE: "OSTSTR_SS04", SUBSCORELOOKUP: "4SS", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 6 Social Studies", CODE: "OSTSTR_SS06", SUBSCORELOOKUP: "6SS", MAP_FUNCTION: mapStrandScore }
            , { NAME: "American Government", CODE: "OSTSTR_AMGOV", SUBSCORELOOKUP: "AMGOVT", MAP_FUNCTION: mapStrandScore }
            , { NAME: "American History", CODE: "OSTSTR_AMHIS", SUBSCORELOOKUP: "AMHIST", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 5 Science", CODE: "OSTSTR_SCI05", SUBSCORELOOKUP: "5SCI", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Grade 8 Science", CODE: "OSTSTR_SCI08", SUBSCORELOOKUP: "8SCI", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Biology", CODE: "OSTSTR_BIO", SUBSCORELOOKUP: "BIO", MAP_FUNCTION: mapStrandScore }
            , { NAME: "Physical Science", CODE: "OSTSTR_PHSCI", SUBSCORELOOKUP: "PS", MAP_FUNCTION: mapStrandScore }
//            // Overall
            , { NAME: "OVERALL", CODE: "_OVR", MAP_FUNCTION: mapOverallScaledScore }

            , { NAME: "COMPREHENSION", CODE: "OSTSTR_COMP", MAP_FUNCTION: mapScaledScore }
            , { NAME: "LISTENING", CODE: "OSTSTR_LIS", MAP_FUNCTION: mapScaledScore }
            , { NAME: "READING", CODE: "OSTSTR_READ", MAP_FUNCTION: mapScaledScore }
            , { NAME: "SPEAKING", CODE: "OSTSTR_SPK", MAP_FUNCTION: mapScaledScore }
            , { NAME: "WRITING", CODE: "OSTSTR_WR", MAP_FUNCTION: mapScaledScore }
            , { NAME: "MATH", CODE: "OSTSTR_MATH", MAP_FUNCTION: mapScaledScore }
            , { NAME: "SOCIAL_STUDIES", CODE: "OSTSTR_SOCIAL_ST", MAP_FUNCTION: mapScaledScore }
            , { NAME: "SCIENCE", CODE: "OSTSTR_SCI", MAP_FUNCTION: mapScaledScore },

            { NAME: "LISTENING", CODE: "LIS", FIELD: "LISTENING_", MAP_FUNCTION: mapScaledScoreOELPA },
            { NAME: "READING", CODE: "READ", FIELD: "READING_", MAP_FUNCTION: mapScaledScoreOELPA },
            { NAME: "SPEAKING", CODE: "SPK", FIELD: "SPEAKING_", MAP_FUNCTION: mapScaledScoreOELPA },
            { NAME: "WRITING", CODE: "WR", FIELD: "WRITING_", MAP_FUNCTION: mapScaledScoreOELPA },
            { NAME: "COMPREHENSION", CODE: "COMP", FIELD: "OELPA_COMPREHENSION_", MAP_FUNCTION: mapScaledScoreOELPA },
            { NAME: "OELPA", CODE: "OVR", FIELD: "OELPA_", MAP_FUNCTION: mapOverallScaledScoreOELPA }

            //for data files with different format
            , { NAME: "ALGEBRA", FIELD: "ALGEBRA_1", CODE: "OSTSTR_ALG_1" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "SOCIAL_STUDIES", FIELD: "AMERICAN_GOVERNMENT", CODE: "OSTSTR_AMGOV" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "SOCIAL_STUDIES", FIELD: "AMERICAN_HISTORY", CODE: "OSTSTR_AMHIS" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "SCIENCE", FIELD: "BIOLOGY", CODE: "OSTSTR_BIO" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "WRITING", FIELD: "ENGLISH_LANGUAGE_ARTS_1", CODE: "OSTSTR_ELA_1" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "WRITING", FIELD: "ENGLISH_LANGUAGE_ARTS_2", CODE: "OSTSTR_ELA_2" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "GEOMETRY", CODE: "OSTSTR_GEOM" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "WRITING", FIELD: "GRADE_3_ENGLISH_LANGUAGE_ARTS", CODE: "OSTSTR_ELA03" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "WRITING", FIELD: "GRADE_4_ENGLISH_LANGUAGE_ARTS", CODE: "OSTSTR_ELA04" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "WRITING", FIELD: "GRADE_5_ENGLISH_LANGUAGE_ARTS", CODE: "OSTSTR_ELA05" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "WRITING", FIELD: "GRADE_6_ENGLISH_LANGUAGE_ARTS", CODE: "OSTSTR_ELA06" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "WRITING", FIELD: "GRADE_7_ENGLISH_LANGUAGE_ARTS", CODE: "OSTSTR_ELA07" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "WRITING", FIELD: "GRADE_8_ENGLISH_LANGUAGE_ARTS", CODE: "OSTSTR_ELA08" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "GRADE_3_MATHEMATICS", CODE: "OSTSTR_MATH03" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "GRADE_4_MATHEMATICS", CODE: "OSTSTR_MATH04" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "GRADE_5_MATHEMATICS", CODE: "OSTSTR_MATH05" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "GRADE_6_MATHEMATICS", CODE: "OSTSTR_MATH06" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "GRADE_7_MATHEMATICS", CODE: "OSTSTR_MATH07" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "GRADE_8_MATHEMATICS", CODE: "OSTSTR_MATH08" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "SCIENCE", FIELD: "GRADE_5_SCIENCE", CODE: "OSTSTR_SCI05" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "SCIENCE", FIELD: "GRADE_8_SCIENCE", CODE: "OSTSTR_SCI08" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "INTEGRATED_MATHEMATICS_1", CODE: "OSTSTR_INT_MATH_1" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "MATH", FIELD: "INTEGRATED_MATHEMATICS_2", CODE: "OSTSTR_INT_MATH_2" , MAP_FUNCTION: mapAdditionalStrandScore }
            , { NAME: "SCIENCE", FIELD: "PHYSICAL_SCIENCE", CODE: "OSTSTR_PHSCI" , MAP_FUNCTION: mapAdditionalStrandScore }

            //additional performance level
            , { NAME: "ALGEBRA", FIELD: "FUNCTION", CODE: "OSTSTR_ALG_1_FUNC", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "ALGEBRA", FIELD: "ALG_MODELING_AND_REASON", CODE: "OSTSTR_ALG_1_MOD_REAS", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "ALGEBRA", FIELD: "NUMBER_QUANTITIES_EQUATIONS_AND_EXPRESSIONS", CODE: "OSTSTR_ALG_1_NUM_QEE", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "ALGEBRA", FIELD: "STATISTICS", CODE: "OSTSTR_ALG_1_STAT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SOCIAL_STUDIES", FIELD: "HISTORIC_DOCUMENTS", CODE: "OSTSTR_AMGOV_HIST_DOC", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SOCIAL_STUDIES", FIELD: "OHIO_POLICY_ECONOMY", CODE: "OSTSTR_AMGOV_GOV_OHIO", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SOCIAL_STUDIES", FIELD: "PRINCIPLES_AND_STRUCTURE", CODE: "OSTSTR_AMGOV_PRIN_STR", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SOCIAL_STUDIES", FIELD: "1877_1945", CODE: "OSTSTR_AMHIS_THRU_WW2", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SOCIAL_STUDIES", FIELD: "1945_PRESENT", CODE: "OSTSTR_AMHIS_POST_WW2", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SOCIAL_STUDIES", FIELD: "SKILLS_AND_DOCUMENTS", CODE: "OSTSTR_AMHIS_SKIL_DOC", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "CELLS", CODE: "OSTSTR_BIO_CELLS", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "DIVERSITY_OF_LIFE", CODE: "OSTSTR_BIO_LIF_DIV", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "EVOLUTION", CODE: "OSTSTR_BIO_EVO", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "HEREDITY", CODE: "OSTSTR_BIO_HERED", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "READING_INFORMATIONAL_TEXT_1", CODE: "OSTSTR_ELA_1_RD_IT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "READING_LITERARY_TEXT_1", CODE: "OSTSTR_ELA_1_RD_LIT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "WRITING_1", CODE: "OSTSTR_ELA_1_WR", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "READING_INFORMATIONAL_TEXT_2", CODE: "OSTSTR_ELA_2_RD_IT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "READING_LITERARY_TEXT_2", CODE: "OSTSTR_ELA_2_RD_LIT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "WRITING_2", CODE: "OSTSTR_ELA_2_WR", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "CIRCLES", CODE: "OSTSTR_GEOM_CIR", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "CONGRUENCE_AND_PROOF", CODE: "OSTSTR_GEOM_CONG_PRO", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "MODELING_AND_REASON", CODE: "OSTSTR_GEOM_MOD_REAS", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "PROBABILITY", CODE: "OSTSTR_GEOM_PROB", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "SIMILARITY_&_TRIGONOMETRY", CODE: "OSTSTR_GEOM_SIM_TRIG", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "READING_INFORMATIONAL_TEXT", CODE: "OSTSTR_ELA", SUFFIX: "_RD_IT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "READING_LITERARY_TEXT", CODE: "OSTSTR_ELA", SUFFIX: "_RD_LIT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "WRITING", FIELD: "WRITING", CODE: "OSTSTR_ELA", SUFFIX: "_WR", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "FRACTIONS", CODE: "OSTSTR_MATH", SUFFIX: "_FRAC", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "GEOMETRY", CODE: "OSTSTR_MATH", SUFFIX: "_GEOM", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "MODELING_AND_REASONING", CODE: "OSTSTR_MATH", SUFFIX: "_MOD_REAS", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "MULTIPLICATION_AND_DIVISION", CODE: "OSTSTR_MATH", SUFFIX: "_MULT_DIV", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "NUMBERS_AND_OPERATIONS", CODE: "OSTSTR_MATH", SUFFIX: "_NUM_OP", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "DECIMALS", CODE: "OSTSTR_MATH", SUFFIX: "_DEC", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "EXPRESSIONS_AND_EQUATIONS", CODE: "OSTSTR_MATH", SUFFIX: "_EXP_EQ", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "GEOMETRY_AND_STATISTICS", CODE: "OSTSTR_MATH", SUFFIX: "_GEOM_STAT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "RATIOS_AND_PROPORTIONS", CODE: "OSTSTR_MATH", SUFFIX: "_RAT_PRO", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "THE_NUMBER_SYSTEM", CODE: "OSTSTR_MATH", SUFFIX: "_NUM_SYS", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "STATISTICS_AND_PROBABILITY", CODE: "OSTSTR_MATH", SUFFIX: "_STAT_PROB", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "FUNCTIONS", CODE: "OSTSTR_MATH", SUFFIX: "_FUNC", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "EARTH_SCIENCE", CODE: "OSTSTR_SCI", SUFFIX: "_SCI_EAR", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "LIFE_SCIENCE", CODE: "OSTSTR_SCI", SUFFIX: "_SCI_LIFE", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "PHYSICAL_SCI", CODE: "OSTSTR_SCI", SUFFIX: "_SCI_PHY", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM2_FUNCTIONS", CODE: "OSTSTR_INT_MATH_2_FUNC", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM2_MODELING_AND_REASONING", CODE: "OSTSTR_INT_MATH_2_MOD_REAS", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM2_NUMBER_QUANTITIES_EQUATIONS_AND_EXPRESSIONS", CODE: "OSTSTR_INT_MATH_2_NUM_QEE", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM2_GEOMETRY", CODE: "OSTSTR_INT_MATH_2_GEOM", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM2_PROBABILITY", CODE: "OSTSTR_INT_MATH_2_PROB", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM1_ALGEBRA", CODE: "OSTSTR_INT_MATH_1_ALG", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM1_GEOMETRY", CODE: "OSTSTR_INT_MATH_1_GEOM", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM1_MODELING_AND_REASONING", CODE: "OSTSTR_INT_MATH_1_MOD_REAS", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM1_NUMBER_&_QUANTITY_FUNCTIONS", CODE: "OSTSTR_INT_MATH_1_NU_Q_FUN", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "MATH", FIELD: "IM1_STATISTICS", CODE: "OSTSTR_INT_MATH_1_STAT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "ENERGY_AND_WAVES", CODE: "OSTSTR_PHSCI_EN_WAV", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "FORCES_AND_MOTION", CODE: "OSTSTR_PHSCI_FOR_MO", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "MATTER", CODE: "OSTSTR_PHSCI_MATT", MAP_FUNCTION: mapAdditionalPerformanceLevel }
            , { NAME: "SCIENCE", FIELD: "THE_UNIVERSE", CODE: "OSTSTR_PHSCI_UNIV", MAP_FUNCTION: mapAdditionalPerformanceLevel }

        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "22": "KG"
        , "01": "01"
        , "02": "02"
        , "03": "03"
        , "04": "04"
        , "05": "05"
        , "06": "06"
        , "07": "07"
        , "08": "08"
        , "09": "09"
        , "10": "10"
        , "11": "11"
        , "12": "12"
        , "13": null //adult high school
        , "14": null //testing only
    };


    var decodePerformanceLevel = {
        "+": "Above"
        , "*": "At/Near"
        , "-": "Below"
        , null: null
        , 1: "Limited",
        2: "Basic",
        3: "Proficient",
        4: "Accomplished",
        5: "Advanced",
        6: "Accelerated",
        "Limited": 1,
        "Basic": 2,
        "Proficient": 3,
        "Accomplished": 4,
        "Advanced": 5,
        "Accelerated": 6,
        "": null

    };

    var decodeOverallPerformanceLevel = {

        "0" : {NAME: "Proficiency not demonstrated", CODE: "0", PASS_IND: "N/A"}
        ,"1" :  {NAME: "Limited", CODE: "1", PASS_IND: "No"}
        ,"2" : {NAME: "Basic", CODE: "2", PASS_IND: "No"}
        ,"3" : {NAME: "Proficient", CODE: "3", PASS_IND: "Yes"}
        ,"4" : {NAME: "Accomplished", CODE: "4", PASS_IND: "Yes"}
        ,"5" : {NAME: "Advanced", CODE: "5", PASS_IND: "Yes"}
        ,"6" : {NAME: "Accelerated", CODE: "6", PASS_IND: "N/A"}
        ,"Limited" : {NAME: "Limited", CODE: "1", PASS_IND: "No"}
        ,"Basic" : {NAME: "Basic", CODE: "2", PASS_IND: "No"}
        ,"Proficient" : {NAME: "Proficient", CODE: "3", PASS_IND: "Yes"}
        ,"Accomplished" : {NAME: "Accomplished", CODE: "4", PASS_IND: "Yes"}
        ,"Advanced" : {NAME: "Advanced", CODE: "5", PASS_IND: "Yes"}
        ,"Accelerated" : {NAME: "Accelerated", CODE: "ACC", PASS_IND: "N/A"}
        ,"Invalidated" : {NAME: "Invalidated", CODE: "INV", PASS_IND: "N/A"}
        ,"INV" : {NAME: "Invalidated", CODE: "INV", PASS_IND: "N/A"}
        ,"Insufficient to score" : {NAME: "Insufficient to score", CODE: "INS", PASS_IND: "N/A"}
        ,"Emerging" : {NAME: "Emerging", CODE: "1", PASS_IND: "No"}
        ,"Progressing" : {NAME: "Progressing", CODE: "2", PASS_IND: "No"}
        ,"+" : {NAME: "Above", CODE: "+", PASS_IND: "Yes"}
        ,"*" : {NAME: "At/Near", CODE: "*", PASS_IND: "No"}
        ,"-" : {NAME: "Below", CODE: "-", PASS_IND: "No"}
        ,"Level 5" : {NAME: "Advanced", CODE: "5", PASS_IND: "Yes"}
        ,"Level 4" : {NAME: "Early Advanced", CODE: "4", PASS_IND: "Yes"}
        ,"Level 3" : {NAME: "Intermediate", CODE: "3", PASS_IND: "Yes"}
        ,"Level 2" : {NAME: "Early Intermediate", CODE: "2", PASS_IND: "No"}
        ,"Level 1" : {NAME: "Beginning", CODE: "1", PASS_IND: "No"}
        ,"Not Attempted" : {NAME: null, CODE: null, PASS_IND: null}
        ,"Did Not Attempt" : {NAME: null, CODE: null, PASS_IND: null}
        ,"" : {NAME: null, CODE: null, PASS_IND: null}
        ,null : {NAME: null, CODE: null, PASS_IND: null}

    };

    var oelpsDecodePerformanceLevel = {
         "0" : {NAME: "Emerging", CODE: "1", PASS_IND: "No"} //0= Proficiency not demonstrated, so we equate that with Emerging ref-UIHN-42571
        ,"1" :  {NAME: "Emerging", CODE: "1", PASS_IND: "No"}
        ,"2" : {NAME: "Progressing", CODE: "2", PASS_IND: "No"}
        ,"3" : {NAME: "Proficient", CODE: "3", PASS_IND: "Yes"}
        ,"Advanced" : {NAME: "Advanced", CODE: "ADV", PASS_IND: "Yes"}
        ,"Basic" : {NAME: "Basic", CODE: "BAS", PASS_IND: "No"}
        ,"INV" : {NAME: "Invalidated", CODE: "INV", PASS_IND: "N/A"}
        ,"" : {NAME: null, CODE: null, PASS_IND: null}
        ,null : {NAME: null, CODE: null, PASS_IND: null}
    }

    var passDecode = {
        1: "NO",
        2: "NO",
        3: "YES",
        4: "YES",
        5: "YES",
        null: null
    };

    var meetDecode = {
        0: "NO",
        1: "YES",
        "N/A": null,
        "": null,
        null: null
    };

    var subscore1Lookup = {
        "ELA": "Reading Informational Text"
        , "3M": "Multiplication and Division"
        , "4M": "Multiplication and Division"
        , "5M": "Fractions"
        , "6M": "Ratios and Proportions"
        , "7M": "Ratios and Proportions"
        , "8M": "Expressions and Equations"
        , "ALG": "Functions"
        , "GEO": "Circles"
        , "IM1": "Geometry"
        , "IM2": "Functions"
        , "4SS": "History"
        , "6SS": "History and Government"
        , "5SCI": "Earth Science"
        , "8SCI": "Earth Science"
        , "AMGOVT": "Historic Documents"
        , "AMHIST": "Skills and Documents"
        , "BIO": "Heredity"
        , "PS": "Matter"
        , null: null
    };
    var subscore2Lookup = {
        "ELA": "Reading Literary Text"
        , "3M": "Numbers and Operations"
        , "4M": "Fractions"
        , "5M": "Decimals"
        , "6M": "Expressions and Equations"
        , "7M": "The Number System"
        , "8M": "Functions"
        , "ALG": "Number, Quantities, Equations and Expressions"
        , "GEO": "Congruence and Proof"
        , "IM1": "Statistics"
        , "IM2": "Geometry"
        , "4SS": "Government"
        , "6SS": "Economics"
        , "5SCI": "Life Science"
        , "8SCI": "Life Science"
        , "AMGOVT": "Principles and Structure"
        , "AMHIST": "1877 - 1945"
        , "BIO": "Evolution"
        , "PS": "Energy and Waves"
        , null: null
    };
    var subscore3Lookup = {
        "ELA": "Writing"
        , "3M": "Geometry"
        , "4M": "Geometry"
        , "5M": "Geometry"
        , "6M": "Geometry and Statistics"
        , "7M": "Geometry"
        , "8M": "Geometry"
        , "ALG": "Statistics"
        , "GEO": "Probability"
        , "IM1": "Algebra"
        , "IM2": "Number, Quantities, Equations and Expressions"
        , "4SS": "Geography/Economics"
        , "6SS": "Geography"
        , "5SCI": "Physical Science"
        , "8SCI": "Physical Science"
        , "AMGOVT": "Ohio/Policy/Economy"
        , "AMHIST": "1945 - Present"
        , "BIO": "Diversity of Life"
        , "PS": "Forces and Motion"
        , null: null
    };
    var subscore4Lookup = {
        "ELA": null
        , "3M": "Fractions"
        , "4M": "Modeling and Reasoning"
        , "5M": "Modeling and Reasoning"
        , "6M": "The Number System"
        , "7M": "Statistics and Probability"
        , "8M": "The Number System"
        , "ALG": "Modeling and Reasoning"
        , "GEO": "Similarity and Trigonometry"
        , "IM1": "Number and Quantity Functions"
        , "IM2": "Probability"
        , "4SS": null
        , "6SS": null
        , "5SCI": null
        , "8SCI": null
        , "AMGOVT": null
        , "AMHIST": null
        , "BIO": "Cells"
        , "PS": "The Universe"
        , null: null
    };
    var subscore5Lookup = {
        "ELA": null
        , "3M": "Modeling and Reasoning"
        , "4M": null
        , "5M": null
        , "6M": "Modeling and Reasoning"
        , "7M": "Modeling and Reasoning"
        , "8M": "Modeling and Reasoning"
        , "ALG": null
        , "GEO": "Modeling and Reasoning"
        , "IM1": "Modeling and Reasoning"
        , "IM2": "Modeling and Reasoning"
        , "4SS": null
        , "6SS": null
        , "5SCI": null
        , "8SCI": null
        , "AMGOVT": null
        , "AMHIST": null
        , "BIO": null
        , "PS": null
        , null: null
    };

    var subscoreTestNumberLookup = {
        "Reading Informational Text": "RD_IT"
        , "Multiplication and Division": "MULT_DIV"
        , "Fractions": "FRAC"
        , "Ratios and Proportions": "RAT_PRO"
        , "Expressions and Equations": "EXP_EQ"
        , "Functions": "FUNC"
        , "Circles": "CIR"
        , "Geometry": "GEOM"
        , "History": "HIST"
        , "History and Government": "HIST_GOV"
        , "Earth Science": "SCI_EAR"
        , "Historic Documents": "HIST_DOC"
        , "Skills and Documents": "SKIL_DOC"
        , "Heredity": "HERED"
        , "Matter": "MATT"
        , "Reading Literary Text": "RD_LIT"
        , "Numbers and Operations": "NUM_OP"
        , "Decimals": "DEC"
        , "The Number System": "NUM_SYS"
        , "Number, Quantities, Equations and Expressions": "NUM_QEE"
        , "Congruence and Proof": "CONG_PRO"
        , "Statistics": "STAT"
        , "Government": "GOV"
        , "Economics": "ECON"
        , "Life Science": "SCI_LIFE"
        , "Principles and Structure": "PRIN_STR"
        , "1877 - 1945": "THRU_WW2"
        , "Evolution": "EVO"
        , "Energy and Waves": "EN_WAV"
        , "Writing": "WR"
        , "Geometry and Statistics": "GEOM_STAT"
        , "Probability": "PROB"
        , "Algebra": "ALG"
        , "Geography/Economics": "GEOG_ECON"
        , "Geography": "GEOG"
        , "Physical Science": "SCI_PHY"
        , "Ohio/Policy/Economy": "GOV_OHIO"
        , "1945 - Present": "POST_WW2"
        , "Diversity of Life": "LIF_DIV"
        , "Forces and Motion": "FOR_MO"
        , "Modeling and Reasoning": "MOD_REAS"
        , "Statistics and Probability": "STAT_PROB"
        , "Similarity and Trigonometry": "SIM_TRIG"
        , "Number and Quantity Functions": "NUM_Q_FUNC"
        , "Cells": "CELLS"
        , "The Universe": "UNIV"
        , null: null
    };

    var adminKeyLookup = {
        "Grade 3 English Language Arts": "G3ELA",
        "Grade 4 English Language Arts": "G4ELA",
        "Grade 5 English Language Arts": "G5ELA",
        "Grade 6 English Language Arts": "G6ELA",
        "Grade 7 English Language Arts": "G7ELA",
        "Grade 8 English Language Arts": "G8ELA",
        "English Language Arts 1": "ELA1",
        "English Language Arts 2": "ELA2",
        "Grade 3 Mathematics": "G3MATH",
        "Grade 4 Mathematics": "G4MATH",
        "Grade 5 Mathematics": "G5MATH",
        "Grade 6 Mathematics": "G6MATH",
        "Grade 7 Mathematics": "G7MATH",
        "Grade 8 Mathematics": "G8MATH",
        "Integrated Mathematics 1": "INTMATH1",
        "Integrated Mathematics 2": "INTMATH2",
        "Algebra 1": "ALG1",
        "Geometry": "GEOM",
        "Grade 4 Social Studies": "G4SS",
        "Grade 6 Social Studies": "G5SS",
        "American Government": "AMG",
        "American History": "AMHIST",
        "Grade 5 Science": "G5SC",
        "Grade 8 Science": "G8SC",
        "Biology": "BIO",
        "Physical Science": "PHYSCI",
        "Grade 11 OELPA":"G11ELA",
        "Grade 10 OELPA":"G10ELA",
        "Kindergarten OELPA":"KGELA",
        "Kindergarten OELPS":"KGELA",
        "Beginning of Kindergarten OELPS" : "KGELA",
        "Grade 4 OELPS": "G4ELA",
        "Grade 3 OELPS": "G3ELA",
        "Grade 2 OELPS": "G2ELA",
        "Grade 8 OELPS": "G8ELA",
        "Grade 11 OELPS": "G11ELA",
        "Grade 6 OELPS": "G6ELA",
        "Grade 9 OELPS": "G9ELA",
        "Grade 5 OELPS": "G5ELA",
        "Grade 7 OELPS": "G7ELA",
        "Grade 6 OELPS": "G6ELA",
        "Grade 10 OELPS": "G10ELA",
        "Grade 12 OELPS": "G12ELA",
        "Grade 1 OELPS": "G1ELA",
        "Grade 1 OELPS": "G1ELA",
        "Grade K OELPS": "KGELA",
        "Grade 8 OELPA":"G8ELA",
        "Grade 1 OELPA":"G1ELA",
        "Grade 3-5 English Language Arts":"G3T5ELA",
        "Grade 3-5 Mathematics":"G3T5MATH",
        "HS English Language Arts":"HSELA",
        "HS Mathematics":"HSMATH",
        "HS Science":"HSSCI",
        "HS Social Studies":"HSSS",
        "Grade 6-8 English Language Arts":"G6T8ELA",
        "Grade 6-8 Mathematics":"G6T8MATH",
        "Grade 7 OELPA":"G7ELA",
        "Grade 3 OELPA":"G3ELA",
        "Grade 4 OELPA":"G4ELA",
        "Grade 6 OELPA":"G6ELA",
        "Grade 5 OELPA":"G5ELA",
        "Grade 2 OELPA":"G2ELA",
        "Grade 12 OELPA":"G12ELA",
        "Grade 9 OELPA":"G9ELA",
        "Grade 4 Mathematics : Geometry Checkpoint 2":"G4MATHGEOCP2"
        ,"Grade 3 Mathematics Benchmark Test": "G3MATHBENCH"
        ,"Grade 3 English Language Arts Benchmark Test" : "G3ELABENCH"
        ,"Grade 7 Mathematics Benchmark Test" : "G7MATHBENCH"
        ,"Grade 6 Mathematics Benchmark Test": "G6MATHBENCH"
        ,"Grade 7 Mathematics Benchmark Test": "G7MATHBENCH"
        ,"Grade 8 Science : Physical Science Checkpoint 1":"G8SCIPHYSICSCP1"
        ,"Integrated Mathematics I Benchmark Test":"INTMATH1BENCH"
        ,"Grade 7 Mathematics : Statistics and Probability Checkpoint 1" : "G7MATHSTATPROBCP1"
        ,"Grade 7 Mathematics : Geometry Checkpoint 1" : "G7MATHGEOMCP1"
        ,"Grade 7 Mathematics : Ratios and Proportions Checkpoint 1" : "G7MATHRATPROCP1"
        ,"Grade 7 Mathematics : The Number System Checkpoint 1" : "G7MATHNUMSYSCP1"
        ,"Grade 6 Mathematics : Expressions and Equations Checkpoint 1":"G6MATHEXPANDEQCP1"
        ,"Grade 8 Mathematics : Equations and Expressions Checkpoint 1" : "G8MATHEXPANDEQCP1"
        ,"Grade 6 Mathematics : The Number System Checkpoint 1" : "G6MATHNUMSYSCP1"
        ,"Grade 6 Mathematics : Ratios and Proportions Checkpoint 1" : "G6MATHRATPROCP1"
        ,"Grade 7 English Language Arts Benchmark Test" : "G7ELABENCH"
        ,"Integrated Mathematics I : Algebra Checkpoint 1" : "INTMATH1ALGCP1"
        ,"Integrated Mathematics I : Number and Quantity Functions Checkpoint 1" : "INTMATH1NUMQFUNCP1"
        ,"Integrated Mathematics I : Statistics Checkpoint 1" : "INTMATH1STATCP1"
        ,"Integrated Mathematics I : Geometry Checkpoint 1" : "INTMATH1GEOMCP1"
        ,"Grade 4 English Language Arts Benchmark Test" : "G4ELABENCH"
        ,"Grade 3 English Language Arts : Reading Informational Text Checkpoint 1": "G3ELARDITCP1"
        ,"Grade 3 English Language Arts : Reading Literary Text Checkpoint 1" : "G3ELARDLITCP1"
        ,"Grade 3 English Language Arts : Reading Informational Text Checkpoint 2" : "G3ELARDITCP2"
        ,"Grade 3 English Language Arts : Reading Literary Text Checkpoint 2" : "G3ELARDLITCP2"
        ,"Grade 5 English Language Arts : Writing Checkpoint 1 - Explanatory" : "G5ELAWRCP1EXPL"
        ,"Grade 4 English Language Arts : Writing Checkpoint 1 - Explanatory" : "G4ELAWRCP1EXPL"
        ,"Biology Benchmark Test" : "BIOBENCH"
        ,"American History Benchmark Test" : "AMHISTBENCH"
        ,"Integrated Mathematics II : Number Quantities, Equations and Expressions Checkpoint 1" : "INTMATH2NUMQEQCP1"
        ,"Integrated Mathematics II : Functions Checkpoint 1":"INTMATH2FUNCP1"
        ,"Integrated Mathematics II : Number Quantities, Equations and Expressions Checkpoint 2" : "INTMATH2NUMQEQCP2"
        ,"Grade 4 Mathematics : Multiplication and Division Checkpoint 1" : "G4MATHMULTDIVCP1"
        ,"Integrated Mathematics II : Functions Checkpoint 2" : "INTMATH2FUNCP2"
        ,"Integrated Mathematics II Benchmark Test" : "INTMATH2BENCH"
       , null: "NA"
    };

     var decodeTestGroup={
        "Ohio State Tests":"OST"
        ,"OST":"OST"
        ,"OELPA": "OELPA"
        ,"AASCD": "AASCD"
        ,"NULL": "OCBA"
        ,"": "OCBA"
        ,"OCBA": "OCBA"
        ,"Benchmark": "BENCH"
        ,"Checkpoints": "CHKPT"
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
             "13": null, //adult high school
             "14": null, //testing only
             "22": "KG",
             "KG": "KG",
             "KN": "KG",
             "K": "KG",
             "N/A": "NA",
             "Kindergarten": "KG"
            ,"**": null
            ,"" : null
            ,null : null
         };

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    function decodeGradeCode(gradeCode) {
        if (gradeCode == null) {
            return null;
        }
        var lkpGradeObj = gradeLookup[gradeCode];
        if (lkpGradeObj == undefined || lkpGradeObj == null) {
            return null;
        }
        return lkpGradeObj;
    }

    function decodeRaceCode(raceCode) {
        if (raceCode === undefined || raceCode === null) {
            return null;
        }
        var lkpRaceObj = raceLookup[raceCode];
        if (lkpRaceObj == undefined || lkpRaceObj == null) {
            return null;
        }
        return lkpRaceObj.GRADE_CODE;
    }

    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/

    /**
     * Maps normalized records for given group of rows.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param array Array containing JSON objects representing raw data by physical name.
     * @returns {array} Mapped normalized records.
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];

        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        var record = mapSingleNormalizedRecord(signature, hierarchy, row);

        AppUtil.nullSafePush(normalizedRecords, record);

        return normalizedRecords;

    }


    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} Mapped normalized record.
     */

     function deduplicateOverallScoreMappings(scoreMappings) {
       var uniqueMappings = [];
       var seenOverall = {};
       scoreMappings.forEach(function(mapping) {
         if (mapping && mapping.TEST_NUMBER && mapping.TEST_NUMBER.indexOf("OELPA_OVR") >= 0) {
           // Use the entire TEST_NUMBER (includes the grade) as a key.
           if (!seenOverall[mapping.TEST_NUMBER]) {
             seenOverall[mapping.TEST_NUMBER] = true;
             uniqueMappings.push(mapping);
           }
         } else {
           uniqueMappings.push(mapping);
         }
       });
       return uniqueMappings;
     }


    function mapSingleNormalizedRecord(signature, hierarchy, row) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];


        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row)

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);


        //Map score fields for each expected score mapping
        var mappingEntries;
        if (signature.getFormat().getFormatName() === 'OELPA_24_COLS') {
          mappingEntries = scoresToMap.filter(function(m) {
              return (typeof m.FIELD !== "undefined" && m.FIELD !== null && m.FIELD !== "");
          });
        } else {
          mappingEntries = scoresToMap;
        }

        try {
          mappingEntries.forEach(function (testMetadata) {
            if (["COMPREHENSION", "SPEAKING", "LISTENING", "READING", "WRITING",
                 "SOCIAL_STUDIES", "SCIENCE", "MATH", "OVERALL", "ALGEBRA"].indexOf(testMetadata.NAME) >= 0) {
              var score = testMetadata.MAP_FUNCTION(row, testMetadata, signature);
              AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } else {
              for (var i = 1; i <= 5; i++) {
                var score = testMetadata.MAP_FUNCTION(row, testMetadata, i, signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
              }
            }
          });
        } catch (exception) {
          mappingObject.ERROR_MESSAGE = exception.message;
          AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
              hierarchy.SOURCE_FILE.getFilePath(),
              "HIGH",
              row.getRawField("LINEAGE_LINE"),
              "Score mapping error: " + exception,
              JSON.stringify(row)
          ));
        }

        mappingObject.SCORE_MAPPINGS = deduplicateOverallScoreMappings(mappingObject.SCORE_MAPPINGS);


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
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var signatureFormatName = signature.getFormat().getFormatName();

        if (signatureFormatName.indexOf("KETTERING_CITY") > -1){
            var birthDateObject = parseDate(row.getField("DATE_OF_BIRTH"));
        }else{
            var birthDateObject = parseDate(row.getField("DATE_OF_BIRTH"));
        }
        var admin_date = row.getField("ADMINISTRATION");
        var test_date = row.getField("TEST_DATE");
        if (test_date !== null) {
            var testDateObject = parsePeriodDate(test_date, hierarchy.SCHOOL_YEAR);
        } else if ((row.getField("TEST_DAY") !== null) && (row.getField("TEST_MONTH") !== null) && (row.getField("TEST_YEAR") !== null)) {
            var testDateObject = calculateTestDate(row);
        }else {
            var testDateObject = parsePeriodDate(admin_date, hierarchy.SCHOOL_YEAR);
        }
        let assessmentPeriod = ((admin) => {
         if(admin !== null ){
             if (admin && admin.indexOf("SPRING") > -1 || admin.indexOf("Spring") > -1) {
                 return 'SPRING';
             } else if (admin && admin.indexOf("WINTER") > -1 || admin.indexOf("Winter") > -1) {
                 return 'WINTER';
             } else if(admin && admin.indexOf("FALL") > -1 || admin.indexOf("Fall") > -1) {
                 return 'FALL';
             }  else if(admin && admin.indexOf("SUMMER") > -1 || admin.indexOf("Summer") > -1) {
                return 'SUMMER';
             }
        }})(_util.coalesce(row.getField("ADMINISTRATION"), row.getField("TEST_REASON")));

        var schoolName = row.getField("SCHOOL");
        if(schoolName){
            var schoolLocalId = schoolName.split("(").pop().replace(')', '');
            var schName = schoolName.split("(")[0];
        }
        //Buchtel HS (004077)
        var studentName = row.getField("STUDENT_NAME");
        if (studentName !== null) {
            var newName = studentName.split((",") ,2);
            var studentFirstName = newName[1];
            var studentLastName = newName[0];
        }

        var studentId = _util.coalesce(row.getField("STUDENT_LOCAL_ID"), row.getField("STUDENT_STATE_ID"));
        if(isNaN(studentId)){
            studentId = studentId.substring(2, 9);
        }


        var testDate = row.getField("DATE_TAKEN")
        if(testDate !== null && testDate !== undefined && testDate !== "") {
            var adminDateObject = AppUtil.getMonthFollowedByDay(testDate);
        }else{
            var adminDateObject = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9)
        }


        //Loop through normalized fields and map if possible.
        normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, testDateObject, adminDateObject);
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
                    record.REPORTING_PERIOD =_util.coalesce(assessmentPeriod, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("ATTENDING_SCHOOL_IRN"),schName, row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(schName, row.getField("ATTENDING_SCHOOL_NAME"),row.getField("SCHOOL_NAME"), row.getField("SCHOOL"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("ATTENDING_SCHOOL_IRN"), schoolLocalId, row.getField("SCHOOL_ID"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = row.getField("ATTENDING_SCHOOL_IRN");
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(adminDateObject.STANDARD_DATE,testDateObject.STANDARD_DATE);
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = '01/01/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, row.getField("BIRTH_MONTH"));//refer UIHN-77975
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, row.getField("BIRTH_DAY"));//refer UIHN-77975
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, row.getField("BIRTH_YEAR"));//refer UIHN-77975
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField("ENROLLED_GRADE")];
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = studentId;
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = studentId;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = studentId;
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"),studentFirstName);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"),studentLastName);
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = null;
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = null;
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENT_GENDER"), "").substring(0, 1);
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
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {

        var admin = {};

        if (_util.trim(row.getField("PRIMARY_DISABILITY")) !== "") {
            admin.TEST_INTERVENTION_CODE = _util.trim(row.getField("PRIMARY_DISABILITY"));
            //admin.TEST_INTERVENTION_DESC = decodeConditionCodes[admin.TEST_INTERVENTION_CODE] === undefined ? null : decodeConditionCodes[admin.TEST_INTERVENTION_CODE];
        }
        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapStrandScore(row, testMetadata, subscoreNumber,signature) {
        var score = {};
        var assessmentType = _util.coalesce(row.getField("ASSESSMENT_TYPE"), decodeTestGroup[row.getField("TEST_GROUP")], row.getField("TEST_NAME"));

        if (testMetadata.NAME !== row.getField("TEST_NAME")) {
            return null;
        }
        var testNumber = generateTestNumber(row, testMetadata, subscoreNumber, assessmentType);
        var performanceLevel = row.getField("SUBSCORE_" + subscoreNumber + "_PERFORMANCE_BAND");
        var rawScore = row.getField("SUBSCORE_" + subscoreNumber + "_RAW_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if (_util.trim(testNumber) === "" || _util.trim(rawScore) === "" || _util.trim(rawScore) === "INV" || _util.trim(rawScore) === null) {
            return null;
        }

        score["TEST_SCORE_TEXT"] = rawScore;
        if (!isNaN(rawScore)) {
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = decodeOverallPerformanceLevel[performanceLevel].NAME;
        score["TEST_PASSED_INDICATOR"] = decodeOverallPerformanceLevel[performanceLevel].PASS_IND;
        score["TEST_SECONDARY_RESULT"] = row.getField("TEST_NAME");
        return score;
    }

    function mapScaledScore(row, testMetadata,signature) {
        var score = {};
        var assessmentType = _util.coalesce(row.getField("ASSESSMENT_TYPE"), decodeTestGroup[row.getField("TEST_GROUP")], row.getField("TEST_NAME"));

        if (assessmentType === 'AASCD') {
            var testNumber = assessmentType + "_" + testMetadata.CODE;
            var performanceLevel = row.getField(testMetadata.NAME + "_PERFORMANCE_LEVEL");
            var scaleScore = row.getField(testMetadata.NAME + "_SCALE_SCORE");
        } else {
            var testNumber = assessmentType + "_" + testMetadata.CODE;
            var performanceLevel = row.getField("OELPA_" + testMetadata.NAME + "_PERFORMANCE_LEVEL");
            var scaleScore = _util.coalesce(row.getField("OELPA_" + testMetadata.NAME + "_SCALE_SCORE"), row.getField(testMetadata.NAME + "_SCALE_SCORE"));
            var StandardError = row.getField("OELPA_" + testMetadata.NAME + "_SCALE_SCORE_STANDARD_ERROR");
        }

        // Check for key fields and do not map score and exit if conditions met.
        if (_util.trim(testNumber) === "" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "INV" || _util.trim(scaleScore) === "E" || _util.trim(scaleScore) === "Not" || _util.trim(scaleScore) === "Not Attempted"
          || _util.trim(performanceLevel) === "E" || _util.trim(performanceLevel) === "N" || _util.trim(performanceLevel) === "Not" || _util.trim(performanceLevel) === "Not Attempted"
          || _util.trim(scaleScore) === "#N/A" || _util.trim(scaleScore) === "Did Not Attempt"){
            return null;
        }
        if(scaleScore===null && performanceLevel === null){
            return null;
        }
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = decodeOverallPerformanceLevel[performanceLevel].NAME;
        score["TEST_PASSED_INDICATOR"] = decodeOverallPerformanceLevel[performanceLevel].PASS_IND;
        score["TEST_STANDARD_ERROR"] = parseInt(StandardError);

        return score;

    }

    function mapOverallScaledScore(row, testMetadata, subscoreNumber ,signature) {
    try {
        var score = {};
        var fileName = row.getRawField("LINEAGE_FILE");
        if(fileName.indexOf('OST')>-1 || !(row.getField("ASSESSMENT_TYPE")) || !(row.getField("TEST_GROUP")) || !(row.getField("TEST_REASON"))){
           var assessmentType = "OST";
        }else if(row.getField("ASSESSMENT_TYPE") || row.getField("TEST_GROUP")){
        var assessmentType = _util.coalesce(row.getField("ASSESSMENT_TYPE"), decodeTestGroup[row.getField("TEST_GROUP")], row.getField("TEST_NAME"));
        }else{
            return null;
        }
        if (row.getField("TEST_NAME") !== "NULL") {
            if (adminKeyLookup[row.getField("TEST_NAME")] === null
                || adminKeyLookup[row.getField("TEST_NAME")] === undefined
                || adminKeyLookup[row.getField("TEST_NAME")] == "") {
                let errorMessage = "New test detected :: " + row.getField("TEST_NAME");
                print("\n${errorMessage}\n");
                throw new Error(errorMessage);
            }
        }
        var testNumber = assessmentType + testMetadata.CODE; //+ "_" + subscoreNumber;
        var overallPerformanceLevel = row.getField("OVERALL_PERFORMANCE_LEVEL_-_OHIO'S_STATE_TESTS_OR_ALTERNATE_ASSESSMENT");
        var overallRawScore = row.getField("OVERALL_RAW_SCORE");
        var overallScore = _util.trim(row.getField("OVERALL_SCALE_SCORE"));
        var meetCode = row.getField("MET_READING_PROMOTION_SCORE");
        let overallStandardError = null;

        // Overall scaled score field
        if (assessmentType === 'OCBA') {
            overallScore = _util.coalesce(row.getField("OVERALL_SCALE_SCORE_-_OHIO'S_STATE_TESTS_OR_ALTERNATE_ASSESSMENT"),row.getField("OVERALL_SCALE_SCORE"));
            testNumber = testNumber + "_OCBA";
            if (row.getField("TEST_NAME") !== "NULL") {
                testNumber = testNumber + "_" + adminKeyLookup[row.getField("TEST_NAME")];
            }
        } else if (assessmentType === 'OELPA' || assessmentType === 'OELPS' || assessmentType === 'ELSCR') {
            overallScore =  _util.coalesce(row.getField("OELPA_OVERALL_SCALE_SCORE"), row.getField("SCALE_SCORE"));
            overallPerformanceLevel = _util.coalesce(row.getField("OELPA_PROFICIENCY_STATUS"), row.getField("PERFORMANCE"));
            overallStandardError = row.getField("OELPA_OVERALL_SCALE_SCORE_STANDARD_ERROR");
        if(assessmentType === 'OELPA'){
            testNumber = testNumber + "_OELPA";
        }
        else{
            testNumber = testNumber + "_OELPS";
        }
            testNumber = testNumber + "_" + adminKeyLookup[row.getField("TEST_NAME")];
        }
        else if (assessmentType === 'AASCD') {
            overallScore = _util.coalesce(row.getField("OVERALL_SCALE_SCORE_-_OHIO'S_STATE_TESTS_OR_ALTERNATE_ASSESSMENT"),row.getField("OVERALL_SCALE_SCORE"));
            overallPerformanceLevel = row.getField("OVERALL_PERFORMANCE_LEVEL_-_OHIO'S_STATE_TESTS_OR_ALTERNATE_ASSESSMENT");
            if (row.getField("TEST_NAME") !== "NULL") {
                testNumber = testNumber + "_" + adminKeyLookup[row.getField("TEST_NAME")];
            }
        }
       else if(assessmentType === 'OST'){
              overallScore = _util.coalesce(row.getField("OVERALL_SCALE_SCORE_-_OHIO'S_STATE_TESTS_OR_ALTERNATE_ASSESSMENT"),row.getField("OVERALL_SCALE_SCORE"));
              overallPerformanceLevel = row.getField("OVERALL_PERFORMANCE_LEVEL_-_OHIO'S_STATE_TESTS_OR_ALTERNATE_ASSESSMENT");
              if (row.getField("TEST_NAME") !== "NULL") {
                    testNumber = testNumber + "_" + adminKeyLookup[row.getField("TEST_NAME")];
            }
        }


        // Check for key fields and do not map score and exit if conditions met.
        if (_util.trim(testNumber) === "" || _util.trim(overallScore) === ""  || _util.trim(overallScore) === "INV" || _util.trim(overallScore) === "F" || _util.trim(overallScore) === "DNA" || _util.trim(overallScore) === "E" || _util.trim(overallScore) === "Not" || _util.trim(overallScore) === "Not Attempted"
        || _util.trim(overallScore) === "NUL" || _util.trim(overallScore) === "DNV"|| _util.trim(overallPerformanceLevel) === "E" ||  _util.trim(overallPerformanceLevel) === "Not" ||  _util.trim(overallPerformanceLevel) === "Not Attempted" || _util.trim(overallScore) === "***") {
        return null;
        }
        score["TEST_SCORE_TEXT"] = overallScore;
        if (!isNaN(overallScore)) {
            score["TEST_SCORE_VALUE"] = overallScore;
            score["TEST_SCALED_SCORE"] = overallScore;
        }
        if (!isNaN(overallRawScore)) {
            score["TEST_RAW_SCORE"] = overallRawScore;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(assessmentType === 'ELSCR' && testNumber.indexOf("ELSCR_OVR_OELPS")>-1 ){
        score["TEST_PRIMARY_RESULT_CODE"] = oelpsDecodePerformanceLevel[overallPerformanceLevel].CODE;
        score["TEST_PRIMARY_RESULT"] = oelpsDecodePerformanceLevel[overallPerformanceLevel].NAME;
        score["TEST_PASSED_INDICATOR"] = oelpsDecodePerformanceLevel[overallPerformanceLevel].PASS_IND;
        }
        else{
        score["TEST_PRIMARY_RESULT_CODE"] = decodeOverallPerformanceLevel[overallPerformanceLevel].CODE;
        score["TEST_PRIMARY_RESULT"] = decodeOverallPerformanceLevel[overallPerformanceLevel].NAME;
        score["TEST_PASSED_INDICATOR"] = decodeOverallPerformanceLevel[overallPerformanceLevel].PASS_IND;
        }
        score["TEST_CUSTOM_PASS_IND"] = meetDecode[meetCode];
        score["TEST_SECONDARY_RESULT"] = row.getField("TEST_NAME");
        score["TEST_STANDARD_ERROR"] = parseInt(overallStandardError);

        return score;
    } catch (e) {
      //ignore expected range errors
        if (e.name !== 'TypeError') {
            print(e + "\n");
        }
      }
    }

    function mapAdditionalStrandScore(row, testMetadata, signature){
        var score = {};
        if(row.getField("TEST_REASON")){
            var assessmentType = row.getField("TEST_REASON");
                if(assessmentType.indexOf("OST") >-1){
                    assessmentType = "OST"
                }else{
                    return null;
                }
        }else{
            return null;
        }
        var testNumber = assessmentType + "_" + testMetadata.CODE;
        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var overallRawScore = row.getField("OVERALL_RAW_SCORE");
        var meetCode = row.getField("MET_READING_PROMOTION_SCORE");
        // Check for key fields and do not map score and exit if conditions met.
        if (_util.trim(scaleScore) === "" || _util.trim(scaleScore) === "INV" || _util.trim(scaleScore) === null) {
            return null;
        }

        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if (!isNaN(overallRawScore)) {
            score["TEST_RAW_SCORE"] = overallRawScore;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_CUSTOM_PASS_IND"] = meetDecode[meetCode];
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevel];
        return score;
    }

function mapAdditionalPerformanceLevel(row, testMetadata,signature){
        var score = {};
        var fileName = row.getRawField("LINEAGE_FILE");
        if(fileName.indexOf("OST") >-1 && row.getField("TEST_REASON") === null){
               var testNumber = "OST" + "_" + testMetadata.CODE ;
        }else{
        var testNumber = getTestNumber(row, testMetadata,signature);
        }

        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE");
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if ((_util.trim(performanceLevel) === "" || _util.trim(performanceLevel) === "INV" || _util.trim(performanceLevel) === null) &&
        (_util.trim(rawScore) === "" || _util.trim(rawScore) === "INV" || _util.trim(rawScore) === null))
         {
            return null;
        }


        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = decodeOverallPerformanceLevel[performanceLevel].NAME;
        score["TEST_PASSED_INDICATOR"] = decodeOverallPerformanceLevel[performanceLevel].PASS_IND;
        score["TEST_SECONDARY_RESULT"] = row.getField("TEST_NAME");
        score["TEST_RAW_SCORE"] = rawScore;

        return score;
    }

                function mapScaledScoreOELPA(row, testMetadata, signature) {
                    var score = {};
                    var testNumber = "OELPA" + "_" + testMetadata.CODE + "_" + gradeDecode[row.getField("ENROLLED_GRADE")];

                    var fieldName = testMetadata.FIELD + "SCALE_SCORE";
                    var scaleScore = _util.coalesce(row.getField(fieldName));

//                    var prefix = testMetadata.FIELD;
//                    if (prefix.charAt(prefix.length - 1) === "_") {
//                        prefix = prefix.substring(0, prefix.length - 1);
//                    }
                    var performanceLevel = row.getField(testMetadata.FIELD + "ACHIEVE_LEVEL");

                    //if any key value is missing, return null.
                    if (_util.trim(testNumber) === "" ||
                        _util.trim(scaleScore) === "" ||
                        _util.trim(scaleScore) === "INV" ||
                        _util.trim(scaleScore) === "E" ||
                        _util.trim(scaleScore) === "Not" ||
                        _util.trim(scaleScore) === "Not Attempted" ||
                        _util.trim(scaleScore) === "#N/A" ||
                        _util.trim(scaleScore) === "Did Not Attempt" ||
                        (_util.trim(performanceLevel) === "E" ||
                         _util.trim(performanceLevel) === "Not" ||
                         _util.trim(performanceLevel) === "Not Attempted")
                    ) {
                        return null;
                    }

                    score["TEST_SCORE_TEXT"] = scaleScore;
                    if (!isNaN(scaleScore)) {
                        score["TEST_SCORE_VALUE"] = scaleScore;
                        score["TEST_SCALED_SCORE"] = scaleScore;
                    }
                    score["TEST_NUMBER"] = testNumber;
                    score["TEST_PRIMARY_RESULT"] = performanceLevel;
                    score["TEST_PRIMARY_RESULT_CODE"] = decodeOverallPerformanceLevel[performanceLevel].CODE;
                    score["TEST_PASSED_INDICATOR"] = decodeOverallPerformanceLevel[performanceLevel].PASS_IND;

                    return score;
                }


                function mapOverallScaledScoreOELPA(row, testMetadata, subscoreNumber, signature) {
                    var score = {};
                    var overallScore = _util.coalesce(row.getField("OELPA_SCALESCORE"), row.getField("SCALE_SCORE"));
                    var overallPerformanceLevel = _util.coalesce(row.getField("OELPA_ACHIEVE_LEVEL"));

                    var testNumber = _assessmentIdentifier + "_OELPA_OVR" + "_" + gradeDecode[row.getField("ENROLLED_GRADE")];

                    // null
                    if (
                        _util.trim(overallScore) === "" ||
                        _util.trim(overallScore) === "INV" ||
                        _util.trim(overallScore) === "F" ||
                        _util.trim(overallScore) === "DNA" ||
                        _util.trim(overallScore) === "E" ||
                        _util.trim(overallScore) === "Not" ||
                        _util.trim(overallScore) === "Not Attempted" ||
                        _util.trim(overallScore) === "NUL" ||
                        _util.trim(overallScore) === "DNV" ||
                        _util.trim(overallPerformanceLevel) === "E" ||
                        _util.trim(overallPerformanceLevel) === "Not" ||
                        _util.trim(overallPerformanceLevel) === "Not Attempted" ||
                        _util.trim(overallScore) === "***") {
                        return null;
                    }

                    score["TEST_SCORE_TEXT"] = overallScore;
                    if (!isNaN(overallScore)) {
                        score["TEST_SCORE_VALUE"] = overallScore;
                        score["TEST_SCALED_SCORE"] = overallScore;
                    }

                    score["TEST_NUMBER"] = testNumber;

                    score["TEST_PRIMARY_RESULT_CODE"] = decodeOverallPerformanceLevel[overallPerformanceLevel].CODE;
                    score["TEST_PRIMARY_RESULT"] = overallPerformanceLevel;
                    score["TEST_PASSED_INDICATOR"] = decodeOverallPerformanceLevel[overallPerformanceLevel].PASS_IND;

                    return score;
                }
    /***************************************************************************
     Utility Functions
     ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {
            var testDateObject1 = parsePeriodDate(one.getField("ADMINISTRATION"), hierarchy.SCHOOL_YEAR);
            var testDateObject2 = parsePeriodDate(two.getField("ADMINISTRATION"), hierarchy.SCHOOL_YEAR);
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, testDateObject1);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, testDateObject2);

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }

        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, testDateObject) {

        var assessmentAdminKey = null;
        var signatureFormatName = signature.getFormat().getFormatName();


        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            // + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE;
        if (signatureFormatName === 'OST_STRAND_161718_FW') {
            assessmentAdminKey += adminKeyLookup[srcRecord.getField('TEST_NAME')];
        }
        var grade = gradeDecode[srcRecord.getField("ENROLLED_GRADE")];
        if (signatureFormatName === 'SPRING_OST_18' && grade !== null) {
            assessmentAdminKey += grade;
        }

        if (signatureFormatName.indexOf("KETTERING_CITY") > -1){
            assessmentAdminKey += signatureFormatName.substring(15);
        }
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_"+ _util.coalesce(srcRecord.getField(key), "");
        });
        if(testDateObject.MONTH !== null || testDateObject.DAY !== null || testDateObject.YEAR !== null){
           assessmentAdminKey = assessmentAdminKey + "_"+ testDateObject.MONTH+ "/" + testDateObject.DAY + "/" +testDateObject.YEAR;
        }
        return assessmentAdminKey;

    }


    function generateTestNumber(row, testMetadata, subscoreNumber, assessmentType) {

        var testNumber = null;
        testMetadata.TEST = assessmentType;
        testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + testMetadata.SUBSCORELOOKUP;
        switch (subscoreNumber) {
            case 1:
                subscoreText = subscoreTestNumberLookup[subscore1Lookup[testMetadata.SUBSCORELOOKUP]];
                break;
            case 2:
                subscoreText = subscoreTestNumberLookup[subscore2Lookup[testMetadata.SUBSCORELOOKUP]];
                break;
            case 3:
                subscoreText = subscoreTestNumberLookup[subscore3Lookup[testMetadata.SUBSCORELOOKUP]];
                break;
            case 4:
                subscoreText = subscoreTestNumberLookup[subscore4Lookup[testMetadata.SUBSCORELOOKUP]] ? subscoreTestNumberLookup[subscore4Lookup[testMetadata.SUBSCORELOOKUP]] : "4";
                break;
            case 5:
                subscoreText = subscoreTestNumberLookup[subscore5Lookup[testMetadata.SUBSCORELOOKUP]] ? subscoreTestNumberLookup[subscore5Lookup[testMetadata.SUBSCORELOOKUP]] : "5";
                break;
            default:
                return "";
        }
        if (subscoreText) {
            testNumber = testNumber + "_" + subscoreText;
        }
        return testNumber;
    }

    function parseDate(rawDate) {
        var dateObj = {
            RAW_DATE: null,
            MONTH: null,
            DAY: null,
            YEAR: null,
            STANDARD_DATE: null
        };

        rawDate = rawDate ? rawDate.trim() : "";
        if (rawDate === "") {
            return dateObj;
        }

        var parsedDate;
        if (rawDate.indexOf("/") !== -1 && rawDate.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
            // MM/DD/YYYY
            var parts = rawDate.split("/");
            var month = parts[0];
            var day = parts[1];
            var year = parts[2];
            parsedDate = new Date(year, month - 1, day);
        } else if (rawDate.indexOf("-") !== -1 && rawDate.match(/^\d{4}-\d{2}-\d{2}$/)) {
            // YYYY-MM-DD
            var parts = rawDate.split("-");
            var year = parts[0];
            var month = parts[1];
            var day = parts[2];
            parsedDate = new Date(year, month - 1, day);
        } else if (rawDate.indexOf("-") !== -1 && rawDate.match(/^\d{2}-\d{2}-\d{4}$/)) {
            // DD-MM-YYYY
            var parts = rawDate.split("-");
            var day = parts[0];
            var month = parts[1];
            var year = parts[2];
            parsedDate = new Date(year, month - 1, day);
        } else {
            return dateObj;
        }

        if (isNaN(parsedDate.getTime())) {
            return dateObj;
        }

        var month = (parsedDate.getMonth() + 1).toString();
        var day = parsedDate.getDate().toString();
        var year = parsedDate.getFullYear();

        if (month.length === 1) {
            month = "0" + month;
        }
        if (day.length === 1) {
            day = "0" + day;
        }

        var standardDate = month + "/" + day + "/" + year;

        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;
        dateObj.STANDARD_DATE = standardDate;

        return dateObj;
    }


    function calculateTestDate(row) {
        var dateObj = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        var day = row.getField("TEST_DAY");
        var month = row.getField("TEST_MONTH");
        var year = row.getField("TEST_YEAR");

        var standardDate = month + "/" + day + "/" + year;

        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;
        dateObj.STANDARD_DATE = standardDate;

        return dateObj;

    }

    function parsePeriodDate(periodString, schoolYear) {
        var dateObj = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(periodString, "")) === "") {
            return dateObj;
        }

        var period = "";
        var year = schoolYear.substring(0, 4);
        var month = "";
        var day = "15";
        if ((periodString.toString().indexOf("Spring") !== -1) || (periodString.toString().indexOf("SPRING") !== -1)){
            month = "04";
            year = schoolYear.substring(5, 9);
        }
        else if ((periodString.toString().indexOf("Fall") !== -1) || (periodString.toString().indexOf("FALL") !== -1)) {
            month = "09";
            year = schoolYear.substring(0, 4);
        }
        else if ((periodString.toString().indexOf("Winter") !== -1) || (periodString.toString().indexOf("WINTER") !== -1)) {
            month = "12";
            year = schoolYear.substring(0, 4);
        }
        else if ((periodString.toString().indexOf("Summer") !== -1) || (periodString.toString().indexOf("SUMMER") !== -1)) {
            month = "06";
            year = schoolYear.substring(5, 9);
        } else if ((periodString.toString().length = 8)) {
            var formatter = new java.text.SimpleDateFormat("yyyyMMdd");

            var javaDate = formatter.parse(periodString.toString());

            var calendar = java.util.Calendar.getInstance();
            calendar.setTime(javaDate);

            year = calendar.get(java.util.Calendar.YEAR);
            month = AppUtil.formatNumber(calendar.get(java.util.Calendar.MONTH) + 1);
            day = AppUtil.formatNumber(calendar.get(java.util.Calendar.DAY_OF_MONTH));
        }
        else {
            month = "02"
        }

        var standardDate = month + "/" + day + "/" + year;

        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;
        dateObj.STANDARD_DATE = standardDate;

        return dateObj;
    }

    function getTestNumber(row, testMetadata){
    if(row.getField("TEST_REASON")){
        var assessmentType = row.getField("TEST_REASON");
            if(assessmentType.indexOf("OST") >-1){
                assessmentType = "OST"
            }else{
                return null;
            }
    }else{
        return null;
    }
        var fileName = row.getRawField("LINEAGE_FILE");
            if(fileName.indexOf("Grade3") >-1){
                var testNumber = assessmentType + "_" +testMetadata.CODE + "03" + testMetadata.SUFFIX ;
            }else if(fileName.indexOf("Grade4") >-1){
                testNumber = assessmentType + "_" +testMetadata.CODE + "04" + testMetadata.SUFFIX ;
            }else if(fileName.indexOf("Grade5") >-1){
                testNumber = assessmentType + "_" +testMetadata.CODE + "05" + testMetadata.SUFFIX ;
            }else if(fileName.indexOf("Grade6") >-1){
                testNumber = assessmentType + "_" +testMetadata.CODE + "06" + testMetadata.SUFFIX ;
            }else if(fileName.indexOf("Grade7") >-1){
                testNumber = assessmentType + "_" +testMetadata.CODE + "07" + testMetadata.SUFFIX ;
            }else if(fileName.indexOf("Grade8") >-1){
                testNumber = assessmentType + "_" +testMetadata.CODE + "08" + testMetadata.SUFFIX ;
            }else{
                testNumber = assessmentType + "_" + testMetadata.CODE;
            }
        return testNumber;
    }



    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());