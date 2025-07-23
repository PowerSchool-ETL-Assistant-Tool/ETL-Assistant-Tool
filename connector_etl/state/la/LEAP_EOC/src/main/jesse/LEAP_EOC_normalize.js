var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LEAP_EOC_HS";
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
        // Algebra 1
        {TEST: "LEAP", CODE:"ALGI_OVERALL", FIELD: "_ALGI", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"ALGI_MC", FIELD: "MAJOR_CONTENT_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_ASC", FIELD: "ADDITIONAL_&_SUPPORTING_CONTENT_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_EMR", FIELD: "EXPRESSING_MATHEMATICAL_REASONING_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_MODDAPP", FIELD: "MODELING_&_APPLICATION_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_IF", FIELD: "INTERPRETING_FUNCTIONS_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_SA", FIELD: "SOLVING_ALGEBRAICALLY_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_SG", FIELD: "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_ALG", FIELD: "ALGEBRA_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_FUNC", FIELD: "FUNCTIONS_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_NQSP", FIELD: "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_EXPEQU", FIELD: "EXPRESSIONS_AND_EQUATIONS_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_LINREL", FIELD: "LINEAR_RELATIONSHIPS_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_NSMD", FIELD: "NUMBER_SYSTEM_MEASUREMENT_AND_DATA_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_NNRS1", FIELD: "NUMBER_&_NUMBER_RELATIONS_STANDARD_1_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_ALGS2", FIELD: "ALGEBRA_STANDARD_2_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_MGS3&4", FIELD: "MEASUREMENT_&_GEOMETRY_STANDARDS_3&4_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_DAPDMS5", FIELD: "DATA_ANALYSIS_PROBABILITY_&_DISCRETE_MATH_STANDARD_5_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_PRFS6", FIELD: "PATTERNS_RELATIONS_&_FUNCTIONS_STANDARD_6_", PARENT_FIELD: "_ALGI", MAP_FUNCTION: mapSubCategoryScore}

        // Algebra 1 2025
        ,{TEST: "LEAP", CODE:"ALGI_OVERALL", FIELD: "_ALGI_2025", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"ALG1_OVERALL", FIELD: "_ALG1_2025", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"ALGI_MC", FIELD: "MAJOR_CONTENT_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_MC", FIELD: "MAJOR_CONTENT_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_ASC", FIELD: "ADDITIONAL_&_SUPPORTING_CONTENT_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_ASC", FIELD: "ADDITIONAL_&_SUPPORTING_CONTENT_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_EMR", FIELD: "EXPRESSING_MATHEMATICAL_REASONING_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_EMR", FIELD: "EXPRESSING_MATHEMATICAL_REASONING_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_MODDAPP", FIELD: "MODELING_&_APPLICATION_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_MODDAPP", FIELD: "MODELING_&_APPLICATION_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_IF", FIELD: "INTERPRETING_FUNCTIONS_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_IF", FIELD: "INTERPRETING_FUNCTIONS_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_SA", FIELD: "SOLVING_ALGEBRAICALLY_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_SA", FIELD: "SOLVING_ALGEBRAICALLY_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_SG", FIELD: "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_SG", FIELD: "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_ALG", FIELD: "ALGEBRA_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_ALG", FIELD: "ALGEBRA_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_FUNC", FIELD: "FUNCTIONS_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_FUNC", FIELD: "FUNCTIONS_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_NQSP", FIELD: "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_NQSP", FIELD: "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_EXPEQU", FIELD: "EXPRESSIONS_AND_EQUATIONS_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_EXPEQU", FIELD: "EXPRESSIONS_AND_EQUATIONS_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_LINREL", FIELD: "LINEAR_RELATIONSHIPS_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_LINREL", FIELD: "LINEAR_RELATIONSHIPS_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_NSMD", FIELD: "NUMBER_SYSTEM_MEASUREMENT_AND_DATA_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_NSMD", FIELD: "NUMBER_SYSTEM_MEASUREMENT_AND_DATA_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_NNRS1", FIELD: "NUMBER_&_NUMBER_RELATIONS_STANDARD_1_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_NNRS1", FIELD: "NUMBER_&_NUMBER_RELATIONS_STANDARD_1_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_ALGS2", FIELD: "ALGEBRA_STANDARD_2_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_ALGS2", FIELD: "ALGEBRA_STANDARD_2_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_MGS3&4", FIELD: "MEASUREMENT_&_GEOMETRY_STANDARDS_3&4_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_MGS3&4", FIELD: "MEASUREMENT_&_GEOMETRY_STANDARDS_3&4_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_DAPDMS5", FIELD: "DATA_ANALYSIS_PROBABILITY_&_DISCRETE_MATH_STANDARD_5_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_DAPDMS5", FIELD: "DATA_ANALYSIS_PROBABILITY_&_DISCRETE_MATH_STANDARD_5_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALGI_PRFS6", FIELD: "PATTERNS_RELATIONS_&_FUNCTIONS_STANDARD_6_", PARENT_FIELD: "_ALGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ALG1_PRFS6", FIELD: "PATTERNS_RELATIONS_&_FUNCTIONS_STANDARD_6_", PARENT_FIELD: "_ALG1_2025", MAP_FUNCTION: mapSubCategoryScore}

        // Geometry
        ,{TEST: "LEAP", CODE:"GEOM_OVERALL", FIELD: "_GEOM", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"GEOM_MC", FIELD: "MAJOR_CONTENT_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_ASC", FIELD: "ADDITIONAL_&_SUPPORTING_CONTENT_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_EMR", FIELD: "EXPRESSING_MATHEMATICAL_REASONING_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_MODDAPP", FIELD: "MODELING_&_APPLICATION_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_CTS", FIELD: "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_STMA", FIELD: "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_CONG", FIELD: "CONGRUENCE_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_SRTT", FIELD: "SIMILARITY_RIGHT_TRIANGLES_&_TRIGONOMETRY_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_CEGPWE", FIELD: "CIRCLES_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_GMDMWG", FIELD: "GEOMETRIC_MEASUREMENT_&_DIMENSION_MODELING_WITH_GEOMETRY_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_GEOM", FIELD: "GEOMETRY_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_PROPALG", FIELD: "PROPORTION_AND_ALGEBRA_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_MEASDATA", FIELD: "MEASUREMENT_AND_DATA_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_NNRS1", FIELD: "NUMBER_AND_NUMBER_RELATIONS_STRAND_1_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_AS2PRFS6", FIELD: "ALGEBRA_STRAND_2_AND_PATTERNS_RELATIONS_FUNCTIONS_STRAND_6_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_MEASS3", FIELD: "MEASUREMENT_STRAND_3_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_GEOMS4", FIELD: "GEOMETRY_STRAND_4_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_DAPDMS5", FIELD: "DATA_ANALYSIS_PROB._AND_DISCRETE_MATH_STRAND_5_", PARENT_FIELD: "_GEOM", MAP_FUNCTION: mapSubCategoryScore}

        //Geometry 2025
        ,{TEST: "LEAP", CODE:"GEOM_OVERALL", FIELD: "_GEOM_2025", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"GEOM_MC", FIELD: "MAJOR_CONTENT_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_ASC", FIELD: "ADDITIONAL_&_SUPPORTING_CONTENT_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_EMR", FIELD: "EXPRESSING_MATHEMATICAL_REASONING_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_MODDAPP", FIELD: "MODELING_&_APPLICATION_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_CTS", FIELD: "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_STMA", FIELD: "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_CONG", FIELD: "CONGRUENCE_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_SRTT", FIELD: "SIMILARITY_RIGHT_TRIANGLES_&_TRIGONOMETRY_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_CEGPWE", FIELD: "CIRCLES_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_GMDMWG", FIELD: "GEOMETRIC_MEASUREMENT_&_DIMENSION_MODELING_WITH_GEOMETRY_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_GEOM", FIELD: "GEOMETRY_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_PROPALG", FIELD: "PROPORTION_AND_ALGEBRA_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_MEASDATA", FIELD: "MEASUREMENT_AND_DATA_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_NNRS1", FIELD: "NUMBER_AND_NUMBER_RELATIONS_STRAND_1_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_AS2PRFS6", FIELD: "ALGEBRA_STRAND_2_AND_PATTERNS_RELATIONS_FUNCTIONS_STRAND_6_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_MEASS3", FIELD: "MEASUREMENT_STRAND_3_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_GEOMS4", FIELD: "GEOMETRY_STRAND_4_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"GEOM_DAPDMS5", FIELD: "DATA_ANALYSIS_PROB._AND_DISCRETE_MATH_STRAND_5_", PARENT_FIELD: "_GEOM_2025", MAP_FUNCTION: mapSubCategoryScore}

        // Biology
        ,{TEST: "LEAP", CODE:"BIO_OVERALL", FIELD: "_BIO", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"BIO_SI", FIELD: "SCIENCE_AS_INQUIRY_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_LS", FIELD: "LIFE_SCIENCE_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_ESS", FIELD: "EARTH_AND_SPACE_SCIENCE_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_SIS1", FIELD: "SCIENCE_AS_INQUIRY_STRAND_1_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_LSS3", FIELD: "LIFE_SCIENCE_STRAND_3_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_ESSS4", FIELD: "EARTH_AND_SPACE_SCIENCE_STRAND_4_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_INV", FIELD: "INVESTIGATE_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_EVAL", FIELD: "EVALUATE_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RS", FIELD: "REASON_SCIENTIFICALLY_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC4", FIELD: "REPORTING_CATEGORY_4_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC5", FIELD: "REPORTING_CATEGORY_5_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC6", FIELD: "REPORTING_CATEGORY_6_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC7", FIELD: "REPORTING_CATEGORY_7_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC8", FIELD: "REPORTING_CATEGORY_8_", PARENT_FIELD: "_BIO", MAP_FUNCTION: mapSubCategoryScore}

        // Biology 2025
        ,{TEST: "LEAP", CODE:"BIO_OVERALL", FIELD: "_BIO", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"BIO_SI", FIELD: "SCIENCE_AS_INQUIRY_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_LS", FIELD: "LIFE_SCIENCE_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_ESS", FIELD: "EARTH_AND_SPACE_SCIENCE_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_SIS1", FIELD: "SCIENCE_AS_INQUIRY_STRAND_1_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_LSS3", FIELD: "LIFE_SCIENCE_STRAND_3_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_ESSS4", FIELD: "EARTH_AND_SPACE_SCIENCE_STRAND_4_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_INV", FIELD: "INVESTIGATE_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_EVAL", FIELD: "EVALUATE_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RS", FIELD: "REASON_SCIENTIFICALLY_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC4", FIELD: "REPORTING_CATEGORY_4_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC5", FIELD: "REPORTING_CATEGORY_5_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC6", FIELD: "REPORTING_CATEGORY_6_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC7", FIELD: "REPORTING_CATEGORY_7_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"BIO_RC8", FIELD: "REPORTING_CATEGORY_8_", PARENT_FIELD: "_BIO_2025", MAP_FUNCTION: mapSubCategoryScore}

        // US History
        ,{TEST: "LEAP", CODE:"USHIST_OVERALL", FIELD: "_USHIST", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"USHIST_WEPS2", FIELD: "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_IGWS3", FIELD: "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_BWPWWIIS4", FIELD: "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CWES5", FIELD: "COLD_WAR_ERA_-_STANDARD_5_-_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_MAS6", FIELD: "THE_MODERN_AGE_-_STANDARD_6_-_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS1", FIELD: "CONTENT_STANDARD_1_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS2", FIELD: "CONTENT_STANDARD_2_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS3", FIELD: "CONTENT_STANDARD_3_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS4", FIELD: "CONTENT_STANDARD_4_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS5", FIELD: "CONTENT_STANDARD_5_", PARENT_FIELD: "_USHIST", MAP_FUNCTION: mapSubCategoryScore}

        // US History 2025
        ,{TEST: "LEAP", CODE:"USHIST_OVERALL", FIELD: "_USHIST", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"USHIST_WEPS2", FIELD: "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_IGWS3", FIELD: "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_BWPWWIIS4", FIELD: "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CWES5", FIELD: "COLD_WAR_ERA_-_STANDARD_5_-_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_MAS6", FIELD: "THE_MODERN_AGE_-_STANDARD_6_-_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS1", FIELD: "CONTENT_STANDARD_1_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS2", FIELD: "CONTENT_STANDARD_2_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS3", FIELD: "CONTENT_STANDARD_3_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS4", FIELD: "CONTENT_STANDARD_4_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"USHIST_CONTS5", FIELD: "CONTENT_STANDARD_5_", PARENT_FIELD: "_USHIST_2025", MAP_FUNCTION: mapSubCategoryScore}

        // English I
        ,{TEST: "LEAP", CODE:"ENGI_OVERALL", FIELD: "_ENGI", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"ENGI_RLT", FIELD: "READING_LITERARY_TEXT_", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_RIT", FIELD: "READING_INFORMATIONAL_TEXT_", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_RV", FIELD: "READING_VOCABULARY_", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_RVT", FIELD: "READING_VOCABULARY_TEXT_", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_WE", FIELD: "WRITTEN_EXPRESSION_", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_KULC", FIELD: "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_RD", FIELD: "READING_", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_WR", FIELD: "WRITING_", PARENT_FIELD: "_ENGI", MAP_FUNCTION: mapSubCategoryScore}

        //English I 2025
        ,{TEST: "LEAP", CODE:"ENGI_OVERALL", FIELD: "_ENGI_2025", PARENT_FIELD: "_ENGI_2025", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"ENGI_RLT", FIELD: "READING_LITERARY_TEXT_", PARENT_FIELD: "_ENGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_RIT", FIELD: "READING_INFORMATIONAL_TEXT_", PARENT_FIELD: "_ENGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_RV", FIELD: "READING_VOCABULARY_", PARENT_FIELD: "_ENGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_WE", FIELD: "WRITTEN_EXPRESSION_", PARENT_FIELD: "_ENGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_KULC", FIELD: "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_", PARENT_FIELD: "_ENGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_RD", FIELD: "READING_", PARENT_FIELD: "_ENGI_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGI_WR", FIELD: "WRITING_", PARENT_FIELD: "_ENGI_2025", MAP_FUNCTION: mapSubCategoryScore}

        // English II
        ,{TEST: "LEAP", CODE:"ENGII_OVERALL", FIELD: "_ENGII", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"ENGII_RL", FIELD: "READING_LITERARY_TEXT_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RIT", FIELD: "READING_INFORMATIONAL_TEXT_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RV", FIELD: "READING_VOCABULARY_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_WE", FIELD: "WRITTEN_EXPRESSION_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_KUL", FIELD: "KNOWLEDGE_&_USE_OF_LANGUAGE_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RD", FIELD: "READING_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_WR", FIELD: "WRITING_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_WLC", FIELD: "WRITING_AND_LANGUAGE_CONVENTIONS_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RES", FIELD: "RESEARCH_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_WRS2", FIELD: "WRITING_STANDARD_2_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_PRDS3", FIELD: "PROOFREADING_STANDARD_3_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RRS1&6", FIELD: "READING_&_RESPONDING_STANDARDS1&6_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RRS7", FIELD: "READING_&_RESPONDING_STANDARD_7_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_UIRS5", FIELD: "USING_INFORMATION_RESOURCES_STANDARD_5_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}

        //English II 2025
        //,{TEST: "LEAP", CODE:"ENGII_OVERALL", FIELD: "_ENGII_2025", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"ENGII_OVERALL", FIELD: "_ENGII_2025", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapOverallScore}
        //,{TEST: "LEAP", CODE:"ENGII_RL", FIELD: "READING_LITERARY_TEXT_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RL", FIELD: "READING_LITERARY_TEXT_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_RIT", FIELD: "READING_INFORMATIONAL_TEXT_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RIT", FIELD: "READING_INFORMATIONAL_TEXT_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_RV", FIELD: "READING_VOCABULARY_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RV", FIELD: "READING_VOCABULARY_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_WE", FIELD: "WRITTEN_EXPRESSION_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_WE", FIELD: "WRITTEN_EXPRESSION_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_KUL", FIELD: "KNOWLEDGE_&_USE_OF_LANGUAGE_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_KUL", FIELD: "KNOWLEDGE_&_USE_OF_LANGUAGE_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_RD", FIELD: "READING_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RD", FIELD: "READING_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_WR", FIELD: "WRITING_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_WR", FIELD: "WRITING_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_WLC", FIELD: "WRITING_AND_LANGUAGE_CONVENTIONS_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_WLC", FIELD: "WRITING_AND_LANGUAGE_CONVENTIONS_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_RES", FIELD: "RESEARCH_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RES", FIELD: "RESEARCH_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_WRS2", FIELD: "WRITING_STANDARD_2_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_WRS2", FIELD: "WRITING_STANDARD_2_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_PRDS3", FIELD: "PROOFREADING_STANDARD_3_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_PRDS3", FIELD: "PROOFREADING_STANDARD_3_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_RRS1&6", FIELD: "READING_&_RESPONDING_STANDARDS1&6_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RRS1&6", FIELD: "READING_&_RESPONDING_STANDARDS1&6_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        //,{TEST: "LEAP", CODE:"ENGII_RRS7", FIELD: "READING_&_RESPONDING_STANDARD_7_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_RRS7", FIELD: "READING_&_RESPONDING_STANDARD_7_", PARENT_FIELD: "_ENGII_2025", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGII_UIRS5", FIELD: "USING_INFORMATION_RESOURCES_STANDARD_5_", PARENT_FIELD: "_ENGII", MAP_FUNCTION: mapSubCategoryScore}

        // English III
        ,{TEST: "LEAP", CODE:"ENGIII_OVERALL", FIELD: "_ENGIII", PARENT_FIELD: "_ENGIII", MAP_FUNCTION: mapOverallScore}
        ,{TEST: "LEAP", CODE:"ENGIII_WLC", FIELD: "WRITING_AND_LANGUAGE_CONVENTIONS_", PARENT_FIELD: "_ENGIII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGIII_RD", FIELD: "READING_", PARENT_FIELD: "_ENGIII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGIII_RES", FIELD: "RESEARCH_", PARENT_FIELD: "_ENGIII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGIII_WTS2", FIELD: "WRITING_STANDARD_2_", PARENT_FIELD: "_ENGIII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGIII_PROFRDS3", FIELD: "PROOFREADING_STANDARD_3_", PARENT_FIELD: "_ENGIII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGIII_RDRESS1&7", FIELD: "READING_&_RESPONDING_STANDARDS_1_&_7_", PARENT_FIELD: "_ENGIII", MAP_FUNCTION: mapSubCategoryScore}
        ,{TEST: "LEAP", CODE:"ENGIII_UIRS5", FIELD: "USING_INFORMATION_RESOURCES_STANDARD_5_", PARENT_FIELD: "_ENGIII", MAP_FUNCTION: mapSubCategoryScore}

         // ELA
         ,{ TEST: "LEAP", CODE: "ELA_OVERALL", FIELD: "_ELA", PARENT_FIELD: "_ELA", MAP_FUNCTION: mapOverallScore }

         // MATH
         ,{ TEST: "LEAP", CODE: "MA_OVERALL", FIELD: "_MATH", PARENT_FIELD: "_MATH", MAP_FUNCTION: mapOverallScore }

         // SCIENCE
         ,{ TEST: "LEAP", CODE: "SCI_OVERALL", FIELD: "_SCIENCE", PARENT_FIELD: "_SCIENCE", MAP_FUNCTION: mapOverallScore }

         ,{ TEST: "LEAP", CODE: "ALG_I", FIELD: "Algebra I", MAP_FUNCTION: mapScaledScore }
         ,{ TEST: "LEAP", CODE: "BIO", FIELD: "Biology",  MAP_FUNCTION:  mapScaledScore }
         ,{ TEST: "LEAP", CODE: "ENG_II", FIELD: "English II", MAP_FUNCTION:  mapScaledScore }
         ,{ TEST: "LEAP", CODE: "ENG_I", FIELD: "English I", MAP_FUNCTION:  mapScaledScore }

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

     var ratingDecode = {
        "1" :  {CODE: "1", DESC: "Weak Performance"}
        ,"2" : {CODE: "2", DESC: "Moderate Performance"}
        ,"3" : {CODE: "3", DESC: "Strong Performance"}
        ,"Weak Performance" : {CODE: "1", DESC: "Weak Performance"}
        ,"Moderate Performance" : {CODE: "2", DESC: "Moderate Performance"}
        ,"Strong Performance" : {CODE: "3", DESC: "Strong Performance"}
        ,"Weak" : {CODE: "1", DESC: "Weak Performance"}
        ,"Moderate" : {CODE: "2", DESC: "Moderate Performance"}
        ,"Strong" : {CODE: "3", DESC: "Strong Performance"}
        ,"" : {CODE: "", DESC: ""}
        ,null : {CODE: "", DESC: ""}
     };

     var pendingVoidDecode = {
         "Y" : "Pending Void"
         ,"" : null
         ,null : null
      };

      var assessAchievDecode = {
         "UNS" :  {CODE: "UNS", DESC: "Unsatisfactory", PASS_IND: "No"}
         ,"APP" : {CODE: "APP", DESC: "Approaching Basic", PASS_IND: "No"}
         ,"BAS" : {CODE: "BAS", DESC: "Basic", PASS_IND: "Yes"}
         ,"MAS" : {CODE: "MAS", DESC: "Mastery", PASS_IND: "Yes"}
         ,"ADV" : {CODE: "ADV", DESC: "Advanced", PASS_IND: "Yes"}
         ,"INC" : {CODE: "INC", DESC: "Include in reports", PASS_IND: "No"}
         ,"E" :   {CODE: "E", DESC: "Excellent", PASS_IND: "Yes"}
         ,"G" :   {CODE: "G", DESC: "Good", PASS_IND: "Yes"}
         ,"F" :   {CODE: "F", DESC: "Fair", PASS_IND: "Yes"}
         ,"NI" :  {CODE: "NI", DESC: "Needs Improvement", PASS_IND: "No"}
         ,"Unsatisfactory" :     {CODE: "UNS", DESC: "Unsatisfactory", PASS_IND: "No"}
         ,"Approaching Basic" :  {CODE: "APP", DESC: "Approaching Basic", PASS_IND: "No"}
         ,"Basic" :              {CODE: "BAS", DESC: "Basic", PASS_IND: "Yes"}
         ,"Mastery" :            {CODE: "MAS", DESC: "Mastery", PASS_IND: "Yes"}
         ,"Advanced" :           {CODE: "ADV", DESC: "Advanced", PASS_IND: "Yes"}
         ,"Include in reports" : {CODE: "INC", DESC: "Include in reports", PASS_IND: "No"}
         ,"Excellent" :          {CODE: "E", DESC: "Excellent", PASS_IND: "Yes"}
         ,"Good" :               {CODE: "G", DESC: "Good", PASS_IND: "Yes"}
         ,"Fair" :               {CODE: "F", DESC: "Fair", PASS_IND: "Yes"}
         ,"Needs Improvement" :  {CODE: "NI", DESC: "Needs Improvement", PASS_IND: "No"}
         ,"At Goal" :  {CODE: "ATG", DESC: "At Goal", PASS_IND: "Yes"}
         ,"Below Goal" :  {CODE: "BG", DESC: "Below Goal", PASS_IND: "No"}
         ,"Near Goal" :  {CODE: "NG", DESC: "Near Goal", PASS_IND: "No"}
         ,"Above Goal" :  {CODE: "AG", DESC: "Above Goal", PASS_IND: "Yes"}
         ,"" : {CODE: "", DESC: "", PASS_IND: ""}
         ,null : {CODE: "", DESC: "", PASS_IND: ""}
      };

      var acctAchievLvlDecode = {
          "EXC" :  {CODE: "EXC", DESC: "Excellent"}
          ,"GOO" : {CODE: "GOO", DESC: "Good"}
          ,"FAI" : {CODE: "FAI", DESC: "Fair"}
          ,"NIP" : {CODE: "NIP", DESC: "Needs Improvement"}
          ,"UNS" : {CODE: "UNS", DESC: "Unsatisfactory"}
          ,"APP" : {CODE: "APP", DESC: "Approaching Basic"}
          ,"BAS" : {CODE: "BAS", DESC: "Basic"}
          ,"MAS" : {CODE: "MAS", DESC: "Mastery"}
          ,"ADV" : {CODE: "ADV", DESC: "Advanced"}
          ,"INC" : {CODE: "INC", DESC: "Include in reports"}
          ,"Excellent" :         {CODE: "EXC", DESC: "Excellent"}
          ,"Good" :              {CODE: "GOO", DESC: "Good"}
          ,"Fair" :              {CODE: "FAI", DESC: "Fair"}
          ,"Needs Improvement" : {CODE: "NIP", DESC: "Needs Improvement"}
          ,"Unsatisfactory" :    {CODE: "UNS", DESC: "Unsatisfactory"}
          ,"Approaching Basic" : {CODE: "APP", DESC: "Approaching Basic"}
          ,"Basic" :             {CODE: "BAS", DESC: "Basic"}
          ,"Mastery" :           {CODE: "MAS", DESC: "Mastery"}
          ,"Advanced" :          {CODE: "ADV", DESC: "Advanced"}
          ,"Include in reports" :{CODE: "INC", DESC: "Include in reports"}
          ,"" : {CODE: "", DESC: ""}
          ,null : {CODE: "", DESC: ""}
      };

      var studentIndicatorDecode = {
         "YES" : "Y"
         ,"NO" : "N"
         ,"Y" : "Y"
         ,"N" : "N"
         ,"yes" : "Y"
         ,"no" : "N"
         ,"Yes" : "Y"
         ,"No" : "N"
         ,"" : ""
         ,null : ""
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
     function get504TEST_INTERVENTION_DESC(row) {
         var accomodationString = "S504: ";
         if (row.getField('SP-S504-ANSWERS_RECORDED') === "Y") {
             accomodationString = accomodationString + "Answers Recorded, ";
         }
         if (row.getField('SP-S504-INDIVIDUAL_SMALL_GROUP_ADMINISTRATION') === "Y") {
             accomodationString = accomodationString + "Individual/Small Group Administration, ";
         }
         if (row.getField('SP-S504-ASSISTIVE_TECHNOLOGY') === "Y") {
             accomodationString = accomodationString + "Assistive Technology, ";
         }
         if (row.getField('SP-S504-COMMUNICATION_ASSISTANCE') === "Y") {
             accomodationString = accomodationString + "Communication Assistance, ";
         }
         if (row.getField('SP-S504-EXTENDED_TIME') === "Y") {
             accomodationString = accomodationString + "Extended Time, ";
         }
         if (row.getField('SP-S504-TEST_READ_ALOUD') === "Y") {
             accomodationString = accomodationString + "Test Read Aloud, ";
         }
         if (row.getField('SP-S504-TRANSFERRED_ANSWERS') === "Y") {
             accomodationString = accomodationString + "Transferred Answers, ";
         }
         if (row.getField('SP-S504-LARGEPRINT') === "Y") {
             accomodationString = accomodationString + "Large Print, ";
         }
         if (row.getField('SP-S504-BRAILLE') === "Y") {
             accomodationString = accomodationString + "Braille, ";
         }
         if (row.getField('SP-S504-OTHER') === "Y") {
             accomodationString = accomodationString + "Other, ";
         }
         if (row.getField('SP-S504-NO_ACCOMMODATIONS') === "Y") {
             return accomodationString + "No Accomomdations";
         } else {
             return accomodationString.substring(0, 200);
         }
     }
    function getELTEST_INTERVENTION_DESC(row) {
         var accomodationString = "EL: ";
        if (row.getField('EL_EXTENDED_TIME') === "Y") {
             accomodationString = accomodationString + "Extended Time, ";
         }
         if (row.getField('EL_INDIVIDUAL_SMALL_GROUP_ADMINISTRATION') === "Y") {
             accomodationString = accomodationString + "Individual/Small Group Administration, ";
         }
         if (row.getField('EL_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY') === "Y") {
             accomodationString = accomodationString + "English/Native Language Word-to-Word Dictionary, ";
         }
         if (row.getField('EL_TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES') === "Y") {
             accomodationString = accomodationString + "Test Administered By ESL Teacher or Individual Providing Language Services, ";
         }
         if (row.getField('EL_TEST_READ_ALOUD_') === "Y") {
             accomodationString = accomodationString + "Read Aloud, ";
         }
         if (row.getField('EL_NO_ACCOMMODATIONS') === "Y") {
             return accomodationString + "No Accommodations, ";
         } else {
             return accomodationString.substring(0, 200);
         }
     }

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
                print(exception);
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
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = row.getField("DOB");
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }
        var testRptDate = null;

//Handling test admin date
        if(row.getField("ADMINISTRATIONDATE")!== undefined &&
                row.getField("TEST_DATE_MONTH") == undefined &&
                row.getField("TEST_DATE_YEAR") == undefined && row.getField("ADMINISTRATIONDATE")!== null ){
            testRptDate = parseDate(row.getField("ADMINISTRATION_DATE")).STANDARD_DATE;
        } else if(row.getField("TEST_DATE_MONTH") &&
                  row.getField("TEST_DATE_YEAR")){
            var mergedDate = row.getField("TEST_DATE_MONTH") + "/15/" + row.getField("TEST_DATE_YEAR");
            testRptDate = parseDate(mergedDate).STANDARD_DATE;
        } else {
           testDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
           testRptDate = parseDate(testDate).STANDARD_DATE;

        }

//Handling school code
        var schoolCode = row.getField("SCHOOL_CODE");
        if(schoolCode!==null && schoolCode !== undefined && schoolCode.length === 3){
            // var schoolCode = districtCode + schoolCode;  // pre UIHN-9419:
            var schoolCode = AssessmentLoader.config.DISTRICT_CODE + schoolCode;  //  pre UIHN-9419: replaced districtCode with config value
        }
        else if(schoolCode!==null && schoolCode !== undefined && schoolCode.length<3) {
            while(schoolCode.length<3){
                schoolCode = "0" + schoolCode;
            }
            // var schoolCode = districtCode + schoolCode;  //  pre UIHN-9419:
            var schoolCode = AssessmentLoader.config.DISTRICT_CODE + schoolCode;  //  pre UIHN-9419: replaced districtCode with config value
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   districtCode;
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
                    record.TEST_ADMIN_DATE = testRptDate;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(row.getField("DOB_-_MONTH"),row.getField("SUMMARIZED_DOB_MONTH"),birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(row.getField("DOB_-_DAY"),row.getField("SUMMARIZED_DOB_DAY") ,birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(row.getField("DOB_-_YEAR"),row.getField("SUMMARIZED_DOB_YEAR"), birthDateObject.YEAR, null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(schoolCode, row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(schoolCode);
                     break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = null;
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                     break;
                 case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("LASID"), row.getField("STATE_ID"));
                      break;
                 case "STUDENT_LOCAL_ID":
                       record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("LASID"), row.getField("STATE_ID"));
                       break;
                 case "STUDENT_VENDOR_ID":
                       record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("LASID"));
                       break;
                 case "STUDENT_FIRST_NAME":
                     record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                     break;
                 case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                     break;
                 case "STUDENT_LAST_NAME":
                     record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                     break;
                 case "STUDENT_GENDER_CODE":
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("REPORTING_GENDER"), row.getField("GENDER"), row.getField("SUMMARIZED_GENDER"));
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("SUMMARIZED_GRADE"), row.getField("REPORTING_GRADE"), row.getField("GRADE"))];
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
        var admin = {};

        admin.TEST_INTERVENTION_DESC = get504TEST_INTERVENTION_DESC(row);
        admin.TEST_INTERVENTION_DESC_2 = getELTEST_INTERVENTION_DESC(row);
        admin.TEST_EXEMPTION_CODE = row.getField("REPORTING_HOMELESS_(MCKINNEY-VENTO)_FLAG");
        admin.TEST_EXEMPTION_DESC = "Homeless Flag";
        admin.TEST_EXEMPTION_CODE_2 = row.getField("MILITARY_AFFILIATED");
        admin.TEST_EXEMPTION_DESC_2 = "Military Affiliated Flag";
        admin.TEST_EXEMPTION_CODE_3 = row.getField("FOSTER_CARE");
        admin.TEST_EXEMPTION_DESC_3 = "Foster Care Flag";
        admin.STUDENT_MIGRANT_ED_IND = studentIndicatorDecode[row.getField("REPORTING_MIGRANT_STATUS")];
        admin.STUDENT_RACE_CODE = row.getField("SUMMARIZED_ETHNICITY_RACE");//TODO may truncate..
        admin.STUDENT_LEP_CODE = row.getField("REPORTING_LEP_STATUS");
        admin.STUDENT_SPECIAL_ED_IND = studentIndicatorDecode[row.getField("REPORTING_SECTION_504_CODE")];
        admin.STUDENT_FOODSERVICE_IND = studentIndicatorDecode[row.getField("ECONOMICALLY_DISADVANTAGED_STATUS")];
        return admin;

    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapSubCategoryScore(row, testMetadata) {
        var score = {};
        var testNumber = testNumberEOCor2025(row, testMetadata);

        var rawScore = row.getField(testMetadata.FIELD + "RAW_SCORE" + testMetadata.PARENT_FIELD);
        var rating = row.getField(testMetadata.FIELD + "RATING" + testMetadata.PARENT_FIELD);
        var percentCorrect = row.getField(testMetadata.FIELD + "PERCENT_CORRECT" + testMetadata.PARENT_FIELD);
        var content = row.getField("CONTENT" + testMetadata.PARENT_FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if((rating === null || rating === undefined || _util.trim(rating) === "--" || _util.trim(rating) === "") &&
          (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")){
            return null;
        }
        rawScore = _util.trim(rawScore);
        // Set score fields
    	score["TEST_NUMBER"] = testNumber;
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_SCORE_TEXT"] = rawScore;
        score["TEST_SCORE_VALUE"] = rawScore;
        score["TEST_PERCENTAGE_SCORE"] = percentCorrect;
        score["TEST_PRIMARY_RESULT_CODE"] = ratingDecode[rating].CODE;
    	score["TEST_PRIMARY_RESULT"] = ratingDecode[rating].DESC;
    	score["TEST_GROWTH_RESULT_CODE"] = content;

        return score;
    }

    function mapOverallScore(row, testMetadata) {
        var score = {};
        var testNumber = testNumberEOCor2025(row, testMetadata);


        var rawScore = row.getField("RAW_SCORE" + testMetadata.PARENT_FIELD);
        var scaleScore = row.getField("SCALE_SCORE" + testMetadata.PARENT_FIELD);
        var achievLevel = row.getField("ASSESSMENT_ACHIEVEMENT_LEVEL" +  testMetadata.PARENT_FIELD);
        var achievAcctLevel = row.getField("ACCOUNTABILITY_ACHIEVEMENT_LEVEL" + testMetadata.PARENT_FIELD);
        var totalScoreMC = row.getField("TOTAL_MC_SCORE" +  testMetadata.PARENT_FIELD);
        var totalScoreRC = row.getField("TOTAL_CR_SCORE" +  testMetadata.PARENT_FIELD);
        var totalPctScore = row.getField("PERCENT_CORRECT" +  testMetadata.PARENT_FIELD);

        var classPeriod = row.getField("CLASS_PERIOD" +  testMetadata.PARENT_FIELD);
        var classType = row.getField("CLASS_TYPE" +  testMetadata.PARENT_FIELD);

        var semLow = row.getField("SEM_LOW" + testMetadata.PARENT_FIELD);
        var semHigh = row.getField("SEM_HIGH" + testMetadata.PARENT_FIELD);

        var standardError = row.getField("STANDARD_ERROR_OF_MEASUREMENT" + testMetadata.PARENT_FIELD);
        var pendingVoid = row.getField("PENDING_VOID" + testMetadata.PARENT_FIELD);

        var content = row.getField("CONTENT" + testMetadata.PARENT_FIELD);

        var testName = row.getField("TEST" + testMetadata.PARENT_FIELD);
        var acctCode = row.getField("ACCOUNTABILITY_CODE" + testMetadata.PARENT_FIELD);
        var validAttempt  = row.getField("TEST_VALID_ATTEMPT" + testMetadata.PARENT_FIELD);
        var voidFlag  = row.getField("VOID_FLAG" + testMetadata.PARENT_FIELD);
        var status = row.getField("STATUS" + testMetadata.PARENT_FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")){
            return null;
        }

        var attrib = testName;
        if(classPeriod != null || classPeriod != undefined || _util.trim(classPeriod) != "--" || _util.trim(classPeriod) != "") {
            attrib = attrib + " | Class Period: " + classPeriod;
        }
        if(classType != null || classType != undefined || _util.trim(classType) != "--" || _util.trim(classType) != "") {
            attrib = attrib + " | Class Type: " + classType;
        }
        if(acctCode != null || acctCode != undefined || _util.trim(acctCode) != "--" || _util.trim(acctCode) != "") {
            attrib = attrib + " | Accountability Code: " + acctCode;
        }
        if(validAttempt != null || validAttempt != undefined || _util.trim(validAttempt) != "--" || _util.trim(validAttempt) != "") {
            attrib = attrib + " | Valid Attempt: " + validAttempt;
        }
        if(voidFlag != null || voidFlag != undefined || _util.trim(voidFlag) != "--" || _util.trim(voidFlag) != "") {
            attrib = attrib + " | Void Flag: " + voidFlag;
        }
        if(status != null || status != undefined || _util.trim(status) != "--" || _util.trim(status) != "") {
            attrib = attrib + " | Status: " + status;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        rawScore = _util.trim(rawScore);
        score["TEST_RAW_SCORE"] = rawScore;

        score["TEST_PRIMARY_RESULT_CODE"] = assessAchievDecode[achievLevel].CODE;
        score["TEST_PRIMARY_RESULT"] = assessAchievDecode[achievLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = assessAchievDecode[achievLevel].PASS_IND;

        score["TEST_LOWER_BOUND"] = semLow;
        score["TEST_UPPER_BOUND"] = semHigh;

        score["TEST_STANDARD_ERROR"] = standardError;

        score["TEST_CUSTOM_RESULT_CODE"] = pendingVoid;
        score["TEST_CUSTOM_RESULT"] = pendingVoidDecode[pendingVoid];

        score["TEST_GROWTH_RESULT_CODE"] = content;

        score["TEST_SECONDARY_RESULT_CODE"] = acctAchievLvlDecode[achievAcctLevel].CODE;
        score["TEST_SECONDARY_RESULT"] = acctAchievLvlDecode[achievAcctLevel].DESC;

        score["TEST_TERTIARY_RESULT_CODE"] = totalScoreMC;
        score["TEST_QUATERNARY_RESULT_CODE"] = totalScoreRC;
        score["TEST_PERCENTAGE_SCORE"] = totalPctScore;

        score["TEST_SCORE_ATTRIBUTES"] = attrib;

        return score;
    }

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField("SCALE_SCORE");
        var achieveLevel = row.getField("ACHIEVEMENT_LEVEL");
        var subName = row.getField("COURSE");

        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === "P" || scaleScore === "-") {
            return null;
        }

    	// Set score fields
    	if (subName ===  testMetadata.FIELD){
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
         score["TEST_PRIMARY_RESULT_CODE"] = assessAchievDecode[achieveLevel].CODE;
         score["TEST_PRIMARY_RESULT"] = assessAchievDecode[achieveLevel].DESC;
         score["TEST_PASSED_INDICATOR"]   = assessAchievDecode[achieveLevel].PASS_IND;
    }
      else {
         return null;
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

            if(assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }
        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }
    }

    // Determines if test is EOC or 2025
        function testNumberEOCor2025(row, testMetadata){
                var testNumberEOCor2025 = null;
                var achievLevel = assessAchievDecode[row.getField("ASSESSMENT_ACHIEVEMENT_LEVEL" +  testMetadata.PARENT_FIELD)].CODE;

                if (achievLevel !== null || achievLevel !== undefined || _util.trim(achievLevel) !== "--" || _util.trim(achievLevel) !== "") {
                    if (achievLevel === "ADV" || achievLevel === "APP" || achievLevel === "BAS" || achievLevel === "UNS" || achievLevel === "MAS"){
                        testNumberEOCor2025 = "_2025";
                    }
                    else if(testMetadata.PARENT_FIELD.toString().indexOf("_2025")>-1){//TODO confirm function
                        testNumberEOCor2025 = "_2025";
                    }
                    else {
                              testNumberEOCor2025 = "_EOC";
                        }
                } else {
                        testNumberEOCor2025 = "_EOC";
                }

                            /*
                           // Algebra I
                           // CONTENT_ALG = AL, ALAE, ALNFT, ALS
                           if (testMetadata.PARENT_FIELD === "_ALGI"){
                                    // FALL 2017 (17-18) GOING FORWARD IS LEAP 2025 - ALGEBRA I
                                    if ((row.getField("TEST_DATE_MONTH") === 12 && row.getField("TEST_DATE_YEAR") === 2017) ||
                                        (row.getField("TEST_DATE_YEAR") > 2017))  {
                                              testNumberEOCor2025 = "_2025";
                                    } else {
                                          testNumberEOCor2025 = "_EOC";
                                    }
                            // Geometry
                            // CONTENT_GEOM = GM, GMAE, GMNFT, GMS
                            } else if (testMetadata.PARENT_FIELD === "_GEOM") {
                                  // FALL 2017 (17-18) GOING FORWARD IS LEAP 2025 - GEOMETRY
                                  if ((row.getField("TEST_DATE_MONTH") === 12 && row.getField("TEST_DATE_YEAR") === 2017) ||
                                      (row.getField("TEST_DATE_YEAR") > 2017))  {
                                          testNumberEOCor2025 = "_2025";
                                  } else {
                                          testNumberEOCor2025 = "_EOC";
                                  }
                            // Biology
                            // CONTENT_BIO = BL, BLE, BLAE, BLEAE, BLNFT
                            } else if (row.getField("CONTENT_BIO") === "BL" || row.getField("CONTENT_BIO") === "BLE" ||
                                       row.getField("CONTENT_BIO") === "BLAE" || row.getField("CONTENT_BIO") === "BLEAE" ||
                                       row.getField("CONTENT_BIO") === "BLNFT") {
                                           testNumberEOCor2025 = "_EOC";
                             // Biology 2025
                             // CONTENT_BIO = BLL, BLLAE, BLLNFT
                            } else if (row.getField("CONTENT_BIO") === "BLL" || row.getField("CONTENT_BIO") === "BLLAE" ||
                                       row.getField("CONTENT_BIO") === "BLLNFT") {
                                          testNumberEOCor2025 = "_2025";

                            } else if (testMetadata.PARENT_FIELD === "_BIO") {
                                          testNumberEOCor2025 = "_EOC";

                            } else if (testMetadata.PARENT_FIELD === "_BIO_2025") {
                                          testNumberEOCor2025 = "_2025";

                            // English I
                            // CONTENT_ENGI = E1, E1AE, E1NFT, E1S
                            } else if (testMetadata.PARENT_FIELD === "_ENGI") {
                                      // FALL 2017 (17-18) GOING FORWARD IS LEAP 2025 - ENGLISH I
                                      if ((row.getField("TEST_DATE_MONTH") === 12 && row.getField("TEST_DATE_YEAR") === 2017) ||
                                         (row.getField("TEST_DATE_YEAR") > 2017))  {
                                               testNumberEOCor2025 = "_2025";
                                     } else {
                                           testNumberEOCor2025 = "_EOC";
                                     }
                            // English II
                            // CONTENT_ENGII = E2, E2AE, E2NFT, E2S
                            } else if (testMetadata.PARENT_FIELD === "_ENGII") {
                                     // FALL 2017 (17-18) GOING FORWARD IS LEAP 2025 - ENGLISH II
                                     if ((row.getField("TEST_DATE_MONTH") === 12 && row.getField("TEST_DATE_YEAR") === 2017) ||
                                       (row.getField("TEST_DATE_YEAR") > 2017))  {
                                             testNumberEOCor2025 = "_2025";
                                     } else {
                                         testNumberEOCor2025 = "_EOC";
                                     }
                            // English III
                            // CONTENT_ENGIII = E3, E3AE, E3NFT, E3S
                            } else if (testMetadata.PARENT_FIELD === "_ENGIII"){
                                     testNumberEOCor2025 = "_EOC";

                            // US History
                            // CONTENT_USHIST = US,USE,USAE,USLAE,USNFT,USLNFT
                            } else if (row.getField("CONTENT_USHIST") === "US" || row.getField("CONTENT_USHIST") === "USE" ||
                                       row.getField("CONTENT_USHIST") === "USAE" || row.getField("CONTENT_USHIST") === "USLAE" ||
                                       row.getField("CONTENT_USHIST") === "USNFT" || row.getField("CONTENT_USHIST") === "USLNFT"){
                                          testNumberEOCor2025 = "_EOC";

                            // US History 2025
                            // CONTENT_USHIST = USL, USLS
                            } else if (row.getField("CONTENT_USHIST") === "USL" || row.getField("CONTENT_USHIST") === "USLS"){
                                          testNumberEOCor2025 = "_2025";

                            } else if (testMetadata.PARENT_FIELD === "_USHIST") {
                                          testNumberEOCor2025 = "_EOC";

                            } else if (testMetadata.PARENT_FIELD === "_USHIST_2025") {
                                                        testNumberEOCor2025 = "_2025";

                            // Old assessment
                            }   else {
                                  testNumberEOCor2025 = "_EOC";
                            }
                            */

               return testMetadata.TEST + testNumberEOCor2025 + "_"+ testMetadata.CODE;
        }
        function generateTestNumber(row, testMetadata){
                var testNumberEOCor2025 = null;
                var achievLevel = assessAchievDecode[row.getField("ACHIEVEMENT_LEVEL")].CODE;

                if (achievLevel !== null || achievLevel !== undefined || _util.trim(achievLevel) !== "--" || _util.trim(achievLevel) !== "") {
                    if (achievLevel === "ADV" || achievLevel === "APP" || achievLevel === "BAS" || achievLevel === "UNS" || achievLevel === "MAS"){
                        testNumberEOCor2025 = "_2025";
                    }
                    else {
                         testNumberEOCor2025 = "_EOC";
                    }
                }

                return testMetadata.TEST + testNumberEOCor2025 + "_"+ testMetadata.CODE + "_"+ gradeDecode[row.getField("GRADE")]
        }


    function parseDate(rawDate) {

            var dateObj = {
                RAW_DATE: rawDate
                , MONTH: null
                , DAY: null
                , YEAR: null
                , STANDARD_DATE: null
            };
         if(rawDate.indexOf("/") > -1) {
            var splitDate = rawDate.split("/",3)
         } else {
            var splitDate = rawDate.split("-",3)
         }
            var split1stPart = splitDate[0];
            var split2ndPart = splitDate[1];
            var split3rdPart = splitDate[2];
            // Exit if no value is provided.
            if (_util.trim(_util.coalesce(rawDate, "")) === "") {
                return dateObj;
            }

            if ((rawDate.length() >= 8) && (rawDate.indexOf("/") > -1)) {
                var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            } else if(rawDate.length() >= 8 && rawDate.indexOf("/") > -1 && split1stPart.length > 2) {
                var formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
            } else if(rawDate.length() >= 8 && rawDate.indexOf("-") > -1 && split1stPart.length > 2) {
                var formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
            } else if((rawDate.length() >= 8) && (rawDate.indexOf("-") > -1)) {
                var formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
            } else if((rawDate.length() >= 6) && (rawDate.indexOf("/") > -1)) {
                var formatter = new java.text.SimpleDateFormat("MM/dd/yy");
            } else if((rawDate.length() >= 5) && (rawDate.indexOf("/") > -1)) {
                var formatter = new java.text.SimpleDateFormat("M/dd/yy");
            } else {
                var formatter = new java.text.SimpleDateFormat("M/d/yyyy");
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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        return assessmentAdminKey;
    }

    return module;
}());
