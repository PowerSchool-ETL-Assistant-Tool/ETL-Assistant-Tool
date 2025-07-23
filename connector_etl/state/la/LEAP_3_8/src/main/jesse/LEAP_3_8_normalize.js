var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LEAP_3_8";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {
            var signatureFormatName = signature.getFormat().getFormatName();
            print(`Loading using signature file ${signatureFormatName}`);

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
                .group_by("ADMINISTRATION GROUPING", function (one, two) {
                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function (output, rows) {
                    try {
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if (mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;
        } catch (exception) {
            throw `${_thisModuleName}.createNormalizedFile Exception: ${exception}`;
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
    var scoresToMap = [
        // ELA
        { TEST: "LEAP_3-8_", CODE: "ELA_OVERALL", FIELD: "_ELA", FIELD2: "_1_(ELA)",PARENT_FIELD: "_ELA", MAP_FUNCTION: mapOverallScore }

        , { TEST: "LEAP_3-8_", CODE: "ELA_RLT", FIELD: "READING_LITERARY_TEXT_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_RIT", FIELD: "READING_INFORMATIONAL_TEXT_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_RV", FIELD: "READING_VOCABULARY_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_WE", FIELD: "WRITTEN_EXPRESSION_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_KULC", FIELD: "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_RD", FIELD: "READING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_WR", FIELD: "WRITING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }

        , { TEST: "LEAP_3-8_", CODE: "ELA_TSRR", FIELD: "TEST_SESSION_READING_AND_RESPONDING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_TSRBK", FIELD: "TEST_SESSION_RESEARCH_TO_BUILD_KNOWLEDGE_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_TSWRT", FIELD: "TEST_SESSION_WRITING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_TSLANG", FIELD: "TEST_SESSION_LANGUAGE_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM1COMP", FIELD: "DIMENSION_1_COMPOSING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM1", FIELD: "DIMENSION_1_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM2SAA", FIELD: "DIMENSION_2_STYLE_AUDIENCE_AWARENESS_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM2", FIELD: "DIMENSION_2_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM3SF", FIELD: "DIMENSION_3_SENTENCE_FORMATION_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM3", FIELD: "DIMENSION_3_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM4USG", FIELD: "DIMENSION_4_USAGE_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM4", FIELD: "DIMENSION_4_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM5MECH", FIELD: "DIMENSION_5_MECHANICS_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM5", FIELD: "DIMENSION_5_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM6_SPEL", FIELD: "DIMENSION_6_SPELLING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_DIM6", FIELD: "DIMENSION_6_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_MCI", FIELD: "MULTIPLE_CHOICE_ITEMS_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_CRI", FIELD: "CONSTRUCTED_RESPONSE_ITEMS_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S1RCR", FIELD: "STANDARD_1_READ_COMPREHEND_AND_RESPOND_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S1", FIELD: "STANDARD_1_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S2WTCOMP", FIELD: "STANDARD_2_WRITE_COMPETENTLY_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S2", FIELD: "STANDARD_2_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S3UCLANG", FIELD: "STANDARD_3_USE_CONVENTIONS_OF_LANGUAGE_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S3", FIELD: "STANDARD_3_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S4NA", FIELD: "STANDARD_4_NOT_ASSESSED_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S4", FIELD: "STANDARD_4_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S5LSSI", FIELD: "STANDARD_5_LOCATE_SELECT_AND_SYNTHESIZE_INFORMATION_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S5", FIELD: "STANDARD_5_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S6RARL", FIELD: "STANDARD_6_READ_ANALYZE_AND_RESPOND_TO_LITERATURE_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S6", FIELD: "STANDARD_6_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S7ARPSS", FIELD: "STANDARD_7_APPLY_REASONING_AND_PROBLEM_SOLVING_SKILLS_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_S7", FIELD: "STANDARD_7_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_SPEL", FIELD: "SPELLING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_CAP", FIELD: "CAPITALIZATION_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_PUNC", FIELD: "PUNCTUATION_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_USEEXP", FIELD: "USAGE_AND_EXPRESSION_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_RD_SUB", FIELD: "READING_SUBSCORE_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_WR_SUB", FIELD: "SUBTEST_WRITING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_UIR_SUB", FIELD: "SUBTEST_USING_INFORMATION_RESOURCES_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_RR_SUB", FIELD: "SUBTEST_READING_AND_RESPONDING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "ELA_PROOF_SUB", FIELD: "SUBTEST_PROOFREADING_", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapSubClaimScore }
        // MATH
        , { TEST: "LEAP_3-8_", CODE: "MA_OVERALL", FIELD: "_MATH", FIELD2: "_2_(MATH)",PARENT_FIELD: "_MA", MAP_FUNCTION: mapOverallScore }

        , { TEST: "LEAP_3-8_", CODE: "MA_MC", FIELD: "MAJOR_CONTENT_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_ASC", FIELD: "ADDITIONAL_&_SUPPORTING_CONTENT_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_EMR", FIELD: "EXPRESSING_MATHEMATICAL_REASONING_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_MODAPP", FIELD: "MODELING_&_APPLICATION_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_MC_SC1", FIELD: "MAJOR_CONTENT_SUBCATEGORY_1_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_MC_SC2", FIELD: "MAJOR_CONTENT_SUBCATEGORY_2_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_MC_SC3", FIELD: "MAJOR_CONTENT_SUBCATEGORY_3_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_MC_SC4", FIELD: "MAJOR_CONTENT_SUBCATEGORY_4_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_PQSMDP", FIELD: "PRODUCTS_&_QUOTIENTS_SOLVEMULTIPLICATION_&_DIVISION_PROBLEMS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_SPWO", FIELD: "SOLVE_PROBLEMS_WITH_ANY_OPERATION_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_FNE", FIELD: "FRACTIONS_AS_NUMBERS_&_EQUIVALENCE_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_STAMEP", FIELD: "SOLVE_TIME_AREA_MEASUREMENT_&_ESTIMATION_PROBLEMS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_CSPWFSPF", FIELD: "COMPARE_&_SOLVE_PROBLEMS_WITH_FRACTIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_SMP", FIELD: "SOLVE_MULTISTEP_PROBLEMS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_MCPV", FIELD: "MULTIPLICATIVE_COMPARISON_&_PLACE_VALUE_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_ODRWCD", FIELD: "OPERATIONS_WITH_DECIMALS_READ_WRITE_COMPARE_&_DECIMALS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_SFP", FIELD: "SOLVE_FRACTION_PROBLEMS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_IFPVS", FIELD: "INTERPRET_FRACTIONS_PLACE_VALUE_&_SCALING_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_RRDVMDWN", FIELD: "RECOGNIZE_REPRESENT_&_DETERMINE_VOLUME_MULTIPLY_&_DIVIDE_WHOLE_NUMBERS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_RNMDF", FIELD: "RATIONAL_NUMBERS_MULTIPLY_&_DIVIDE_FRACTIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_RR", FIELD: "RATIO_&_RATE_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_EIE", FIELD: "EXPRESSIONS_INEQUALITIES_&_EQUATIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_APRSP", FIELD: "ANALYZE_PROPORTIONAL_RELATIONSHIPS_&_SOLVE_PROBLEMS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_ORN", FIELD: "OPERATIONS_WITH_RATIONAL_NUMBERS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_RIESN", FIELD: "RADICALS_INTEGER_EXPONENTS_&_SCIENTIFIC_NOTATION_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_PRLEF", FIELD: "PROPORTIONAL_RELATIONSHIPS_LINEAR_EQUATIONS_&_FUNCTIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_SLESELE", FIELD: "SOLVING_LINEAR_EQUATIONS_SYSTEMSLINEAR_EQUATIONS_OF_LINEAR_EQUATIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_CSPT", FIELD: "CONGRUENCE_&_SIMILARITY_PYTHAGOREAN_THEOREM_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_DOMOAT", FIELD: "DOMAIN_OPERATIONS_AND_ALGEBRAIC_THINKING_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_DOMNOBTEN", FIELD: "DOMAIN_NUMBER_AND_OPERATIONS_IN_BASE_TEN_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_DOMNOF", FIELD: "DOMAIN_NUMBER_AND_OPERATIONS_FRACTIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_DOMMD", FIELD: "DOMAIN_MEASUREMENT_AND_DATA_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_DOMGEOM", FIELD: "DOMAIN_GEOMETRY_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_DOMRPR", FIELD: "DOMAIN_RATIOS_AND_PROPORTIONAL_RELATIONSHIPS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_DOMNUMSYS", FIELD: "DOMAIN_THE_NUMBER_SYSTEM_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_DOMEE", FIELD: "DOMAIN_EXPRESSIONS_AND_EQUATIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_CSPT", FIELD: "DOMAIN_STATISTICS_AND_PROBABILITY_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_CDOMNOP", FIELD: "COMBINED_DOMAIN_NUMBER_AND_OPERATIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_CDOMGMD", FIELD: "COMBINED_DOMAIN_GEOMETRY_MEASUREMENT_AND_DATA_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_CDOMOBTENAT", FIELD: "COMBINED_DOMAIN_OPERATIONS_IN_BASE_TEN_ALGEBRAIC_THINKING_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_SUB1MCI", FIELD: "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_SUB2CRI", FIELD: "SUBTEST_2_CONSTRUCTED_RESPONSE_ITEMS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_REPCATFRAC", FIELD: "REPORTING_CATEGORY_FRACTIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_REPCATMDG", FIELD: "REPORTING_CATEGORY_MEASUREMENT_DATA_AND_GEOMETRY_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_REPCATMD", FIELD: "REPORTING_CATEGORY_MULTIPLICATION_AND_DIVISION_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_REPCATNUM", FIELD: "REPORTING_CATEGORY_NUMBER_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_REPCATNOP", FIELD: "REPORTING_CATEGORY_NUMBER_AND_OPERATIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_REPCATNUMSYS", FIELD: "REPORTING_CATEGORY_NUMBER_SYSTEM_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_REPCATRPA", FIELD: "REPORTING_CATEGORY_RATIO_PROPORTION_AND_ALGEBRA_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S1NNR", FIELD: "STANDARD_1_NUMBER_AND_NUMBER_RELATIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S1", FIELD: "STANDARD_1_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S2ALG", FIELD: "STANDARD_2_ALGEBRA_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S2", FIELD: "STANDARD_2_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S3MEAS", FIELD: "STANDARD_3_MEASUREMENT_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S3", FIELD: "STANDARD_3_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S4GEOM", FIELD: "STANDARD_4_GEOMETRY_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S4", FIELD: "STANDARD_4_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S5DAPDM", FIELD: "STANDARD_5_DATA_ANALYSIS_PROBABILITY_&_DISCRETE_MATH_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S5", FIELD: "STANDARD_5_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S6PRF", FIELD: "STANDARD_6_PATTERNS_RELATIONS_&_FUNCTIONS_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "MA_S6", FIELD: "STANDARD_6_", PARENT_FIELD: "_MA", MAP_FUNCTION: mapSubClaimScore }
        // SCIENCE
        , { TEST: "LEAP_3-8_", CODE: "SCI_OVERALL", FIELD: "_SCIENCE", FIELD2: "_3_(SCIENCE)",PARENT_FIELD: "_SCI", MAP_FUNCTION: mapOverallScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_INV", FIELD: "INVESTIGATE_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_EVA", FIELD: "EVALUATE_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_RS", FIELD: "REASONSCIENTIFICALLY_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_S1SI", FIELD: "STANDARD_1_SCIENCE_AS_INQUIRY_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_S2PS", FIELD: "STANDARD_2_PHYSICAL_SCIENCE_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_S3LS", FIELD: "STANDARD_3_LIFE_SCIENCE_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_S4ESS", FIELD: "STANDARD_4_EARTH_AND_SPACE_SCIENCE_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_S5SE", FIELD: "STANDARD_5_SCIENCE_AND_THE_ENVIRONMENT_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_SUB1MCI", FIELD: "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_SUB2SAI", FIELD: "SUBTEST_2_SHORT_ANSWER_ITEMS_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_SUB2TI", FIELD: "SUBTEST_2_TASK_ITEMS_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_SUB3TI", FIELD: "SUBTEST_3_TASK_ITEMS_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_MCI", FIELD: "MULTIPLE_CHOICE_ITEMS_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SCI_CRI", FIELD: "CONSTRUCTED_RESPONSE_ITEMS_", PARENT_FIELD: "_SCI", MAP_FUNCTION: mapSubClaimScore }
        // SOCIAL STUDIES
        , { TEST: "LEAP_3-8_", CODE: "SS_OVERALL", FIELD: "_SOCIAL_STUDIES", FIELD2: "_4_(SOCIAL_STUDIES)",PARENT_FIELD: "_SS", MAP_FUNCTION: mapOverallScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_HIST", FIELD: "HISTORY_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_GEOG", FIELD: "GEOGRAPHY_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_CIV", FIELD: "CIVICS_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_ECON", FIELD: "ECONOMICS_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_S1GEOG", FIELD: "STANDARD_1_GEOGRAPHY_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_S2CIV", FIELD: "STANDARD_2_CIVICS_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_S3ECON", FIELD: "STANDARD_3_ECONOMICS_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_S4HIS", FIELD: "STANDARD_4_HISTORY_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_SUB1MCI", FIELD: "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_SUB2TI", FIELD: "SUBTEST_2_TASK_ITEMS_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_MCI", FIELD: "MULTIPLE_CHOICE_ITEMS_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }
        , { TEST: "LEAP_3-8_", CODE: "SS_CRI", FIELD: "CONSTRUCTED_RESPONSE_ITEMS_", PARENT_FIELD: "_SS", MAP_FUNCTION: mapSubClaimScore }

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var ratingDecode = {
        "1": "Weak Performance"
        , "2": "Moderate Performance"
        , "3": "Strong Performance"
        , "Strong": "Strong Performance"
        , "Weak": "Weak Performance"
        , "Moderate": "Moderate Performance"
        , "": null
        , null: null
    };

    var assessAchievDecode = {
        "UNS": "Unsatisfactory"
        , "ABV": "Above Basic"
        , "APP": "Approaching Basic"
        , "BAS": "Basic"
        , "BLW": "Below Basic"
        , "MAS": "Mastery"
        , "ADV": "Advanced"
        , "INC": "Include in reports"
        , "Advanced": "Advanced"
        , "Approaching Basic": "Approaching Basic"
        , "Basic": "Basic"
        , "Mastery": "Mastery"
        , "Unsatisfactory": "Unsatisfactory"
        , "": null
        , null: null
    };

    var assessAchievPassDecode = {
        "UNS": "No"
        , "ABV": "Yes"
        , "APP": "No"
        , "BAS": "Yes"
        , "BLW": "No"
        , "MAS": "Yes"
        , "ADV": "Yes"
        , "INC": "No"
        , "Advanced": "Yes"
        , "Approaching Basic": "No"
        , "Basic": "Yes"
        , "Mastery": "Yes"
        , "Unsatisfactory": "No"
        , "": null
        , null: null
    };

    var testModeDecode = {
        "P": "Paper"
        , "O": "Online"
        , "Online": "Online"
        , "Paper": "Paper"
        , "": null
        , null: null
    };

    var gradeDecode = {
        "KG": "KG"
        , "0": "KG"
        , "1": "01"
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
        , "T9": "T9"
        , "15": "15"
        , "20": "PS"
        , "PS": "PS"
        , "P": "P"
        , "HS": "HS"
        , "24": "PK"
        , "PK": "PK"
        , "25": "KG"
        , "35": "35"
        , null: null
        , "": null
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

        var birthDateObject = parseDate(row.getField("DOB"));
        var testRptDate = null;

        if (row.getField("ADMINISTRATIONDATE") !== undefined) {
            let format;
            let rawAdminDate = row.getField("ADMINISTRATIONDATE");
            if (rawAdminDate) {
                let temp = rawAdminDate.split('-');
                if (temp.length === 2) {
                    if (temp[0] !== undefined && !isNaN(temp[0]) && isNaN(temp[1])) {
                        format = 'dd-yy-MMM';
                        rawAdminDate = '15' + '-' + temp.join('-');
                    } else if (temp[1] !== undefined && isNaN(temp[0]) && !isNaN(temp[1])) {
                        format = 'MMM-yy-dd';
                        rawAdminDate = temp.join('-') + '-' + '15';
                    }
                    testRptDate = AppUtil.getDateObjByPattern(rawAdminDate, format).STANDARD_DATE;
                } else {
                    testRptDate = parseTestDate(row.getField("ADMINISTRATIONDATE")).STANDARD_DATE;
                }
            }
        } else if (row.getField("TEST_DATE_MONTH") == null ||
            row.getField("TEST_DATE_MONTH") == undefined ||
            row.getField("TEST_DATE_MONTH") == "" ||
            row.getField("TEST_DATE_YEAR") == null ||
            row.getField("TEST_DATE_YEAR") == undefined ||
            row.getField("TEST_DATE_YEAR") == "") {
            testRptDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
        } else {
            testRptDate = row.getField("TEST_DATE_MONTH") + "/15/" + row.getField("TEST_DATE_YEAR");
        }

        /*  pre UIHN-9419:

        var districtCode = _util.coalesce(
                                            row.getField("DISTRICT_CODE")
                                            , AssessmentLoader.config.DISTRICT_CODE
                                            , ""
                                          );

        //District code fields are length 14, 7 district code numbers followed by 7 school code numbers or 7 zeroes
        if(districtCode.length > 7){
            districtCode = districtCode.substring(0,7);
        }
        */

        var schoolCode = row.getField("SCHOOL_CODE");
        if (schoolCode.length === 1) {
            schoolCode = '00' + schoolCode;
        } else if (schoolCode.length === 2) {
            schoolCode = '0' + schoolCode;
        }

        if (schoolCode !== null && schoolCode !== undefined && schoolCode.length === 3) {
            //For LDOE Lousiana
            schoolCode = AssessmentLoader.config.DISTRICT_CODE + schoolCode;  //  pre UIHN-9419: replaced districtCode with config value
        }

        normalizedFileFields.forEach(function (field) {
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:  districtCode;
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
                    record.TEST_ADMIN_DATE = testRptDate; // Need to check for correct format
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(row.getField("SUMMARIZED_DOB_MONTH"), birthDateObject.MONTH, "null");
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(row.getField("SUMMARIZED_DOB_DAY"), birthDateObject.DAY, "null");
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(row.getField("SUMMARIZED_DOB_YEAR"), birthDateObject.YEAR, "null");
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(schoolCode, row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(schoolCode);
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOLSYSTEMNBR"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("NEW_LASID"), row.getField("LASID"), row.getField("STATE_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("LASID"), row.getField("NEW_LASID"), row.getField("STATE_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("SUMMARIZED_GENDER"), row.getField("LAP_GENDER"), row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("SUMMARIZED_GRADE"), row.getField("LAP_GRADE_PLACEMENT"), row.getField("GRADE"))];
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = testRptDate;
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
    function mapSubClaimScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE;
            var rawScore = row.getField(testMetadata.FIELD + "RAW_SCORE" + testMetadata.PARENT_FIELD);
            var rating = row.getField(testMetadata.FIELD + "RATING" + testMetadata.PARENT_FIELD);
            var percentCorrect = row.getField(testMetadata.FIELD + "PERCENT_CORRECT" + testMetadata.PARENT_FIELD);
            // Sub Score
            var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE" + testMetadata.PARENT_FIELD);
            var achievLevel = row.getField(testMetadata.FIELD + "ASSESSMENT_ACHIEVEMENT_LEVEL_" + testMetadata.FIELD +"_SUBSCORE");

            if ((rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")
                && (rating === null || rating === undefined || _util.trim(rating) === "--" || _util.trim(rating) === "")) {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_RAW_SCORE"] = _util.trim(rawScore);
            score["TEST_SCORE_TEXT"] = _util.trim(rawScore);
            score["TEST_SCORE_VALUE"] = _util.trim(rawScore);
            score["TEST_PERCENTAGE_SCORE"] = _util.trim(percentCorrect);
            score["TEST_PRIMARY_RESULT_CODE"] = _util.trim(rating);
            score["TEST_PRIMARY_RESULT"] = ratingDecode[_util.trim(rating)];
            // Reading Subscore
            if (scaleScore !== null && scaleScore !== undefined && _util.trim(scaleScore) !== "--" && _util.trim(scaleScore) !== "") {
                score["TEST_SCALED_SCORE"] = _util.trim(scaleScore);
                score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
                score["TEST_PRIMARY_RESULT"] = assessAchievDecode[achievLevel];
                score["TEST_PASSED_INDICATOR"] = assessAchievPassDecode[achievLevel];
            }

        }
        catch (e) {
            print(e);
        }

        return score;
    }

    function mapOverallScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE;
            var rawScore = row.getField("RAW_SCORE" + testMetadata.FIELD);
            var scaleScore = row.getField("SCALE_SCORE" + testMetadata.FIELD);
            var achievLevel = row.getField("ASSESSMENT_ACHIEVEMENT_LEVEL" + testMetadata.FIELD);

            var semLow = row.getField("SEM_LOW" + testMetadata.FIELD);
            var semHigh = row.getField("SEM_HIGH" + testMetadata.FIELD);

            //var acctCode = row.getField("UPDATED_ACCOUNTABILITY_CODE_DOCUMENT" + testMetadata.FIELD2);
            var acctLevel = row.getField("ACCOUNTABILITY_ACHIEVEMENT_LEVEL" + testMetadata.FIELD);

            var testMode = row.getField("TEST_MODE" + testMetadata.PARENT_FIELD);
            // Check for key fields and do not map score and exit if conditions met.
            if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
                (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")) {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = _util.trim(scaleScore);
            score["TEST_SCORE_VALUE"] = _util.trim(scaleScore);
            score["TEST_SCALED_SCORE"] = _util.trim(scaleScore);

            score["TEST_RAW_SCORE"] = _util.trim(rawScore);

            score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
            score["TEST_PRIMARY_RESULT"] = assessAchievDecode[achievLevel];
            score["TEST_PASSED_INDICATOR"] = assessAchievPassDecode[achievLevel];

            score["TEST_LOWER_BOUND"] = semLow;
            score["TEST_UPPER_BOUND"] = semHigh;

            score["TEST_SECONDARY_RESULT_CODE"] = acctLevel;
            score["TEST_SECONDARY_RESULT"] = assessAchievDecode[acctLevel];

            //score["TEST_SECONDARY_RESULT_CODE"] = acctCode;
            //score["TEST_SECONDARY_RESULT"] = assessAchievDecode[acctCode];

            score["TEST_SCORE_ATTRIBUTES"] = testModeDecode[testMode];

        } catch (exception) {
            print(exception);
        }

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

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }
        } catch (exception) {
            throw `${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}`;
        }
    }

    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        var formatter;

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }
        if ((rawDate.length >= 6) && (rawDate.length <= 8) && (rawDate.indexOf("/") > -1)) {
            formatter = new java.text.SimpleDateFormat("MM/dd/yy");
        } else if ((rawDate.length >= 8) && (rawDate.indexOf("/") > -1)) {
            formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if ((rawDate.length >= 8) && (rawDate.indexOf("-") > -1) && (rawDate.split("-")[2].length === 4)) {
            formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
        } else if ((rawDate.length >= 8) && (rawDate.indexOf("-") > -1) && (rawDate.split("-")[0].length === 4)) {
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

    function parseTestDate(rawDate) {

        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        var formatter;

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if ((rawDate.length >= 8) && (rawDate.indexOf("/") > -1) && (rawDate.split("/")[2].length === 4)) {
            formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if ((rawDate.length >= 8) && (rawDate.indexOf("-") > -1) && (rawDate.split("-")[2].length === 4)) {
            formatter = new java.text.SimpleDateFormat("dd-MM-yyyy");
        } else if ((rawDate.length >= 8) && (rawDate.indexOf("-") > -1) && (rawDate.split("-")[0].length === 4)) {
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
     * Generates an Assessment Admin Key using a combination of hierarchy values and natural keys from an assessment signature
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param srcRecord The assessment record being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {

        var assessmentAdminKey = null;
        var testDate = null;

        var rawAdminDate = srcRecord.getField("ADMINISTRATIONDATE");

        if (rawAdminDate !== undefined && rawAdminDate !== null && rawAdminDate !== "") {
            let format;
            let temp = rawAdminDate.split('-');
            if (temp.length === 2) {
                if (temp[0] !== undefined && !isNaN(temp[0]) && isNaN(temp[1])) {
                    format = 'dd-yy-MMM';
                    rawAdminDate = '15' + '-' + temp.join('-');
                } else if (temp[1] !== undefined && isNaN(temp[0]) && !isNaN(temp[1])) {
                    format = 'MMM-yy-dd';
                    rawAdminDate = temp.join('-') + '-' + '15';
                }
                testDate = AppUtil.getDateObjByPattern(rawAdminDate, format).STANDARD_DATE;
            } else {
                testDate = parseTestDate(rawAdminDate).STANDARD_DATE;
            }
        } else {
            testDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
        }

        // Build the key
        assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${testDate}`;

        // Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey += "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        return assessmentAdminKey;
    }

  return module;
}());