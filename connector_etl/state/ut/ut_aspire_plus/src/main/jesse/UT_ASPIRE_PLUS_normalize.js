var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "UT_ASPIRE_PLUS";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
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
            print("Loading using signature file ${signatureFormatName}\n");


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("Normalized file: ${normalizedFile}\n");

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
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"],
                    function (output, rows) {
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

                        // Report when no scores are found.
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
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        } n
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
            {TEST: "UT_ASPIRE_PLUS_", CODE:"G10_ELA", FIELD: "G10_ENGLISH_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_MA", FIELD: "G10_MATH_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_READ", FIELD: "G10_READING_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_SC", FIELD: "G10_SCIENCE_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_ELA", FIELD: "G9_ENGLISH_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_MA", FIELD: "G9_MATH_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_READ", FIELD: "G9_READING_", MAP_FUNCTION: mapScaledScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_SC", FIELD: "G9_SCIENCE_", MAP_FUNCTION: mapScaledScore}

            //GRADE 10
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_CSE", FIELD: "G10_CONV_STANDARD_ENGLISH_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_KOL", FIELD: "G10_KNOWLEDGE_OF_LANG_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_POW", FIELD: "G10_PRODUCTION_OF_WRITING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_ALG", FIELD: "G10_ALGEBRA_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_FUNC", FIELD: "G10_FUNCTIONS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_GOE", FIELD: "G10_GEOMETRY_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_NAQ", FIELD: "G10_NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_SAP", FIELD: "G10_STATISTICS_AND_PROBABILITY_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_CAS", FIELD: "G10_CRAFT_AND_STRUCTURE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_KAI", FIELD: "G10_KNOWLEDGE_AND_IDEA_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_KI", FIELD: "G10_KEYIDEAS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_DAUM", FIELD: "G10_DEVELOPING_AND_USING_MODELS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_GDAI", FIELD: "G10_GATHERING_DATA_AND_INVESTIGATING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_SRTCE", FIELD: "G10_SCIENTIFIC_REASONING_TO_CONSTRUCT_EXPLANATIONS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G10_MTAIP", FIELD: "G10_MATHEMATICAL_THINKING_AND_INTERPRET_PATTERNS_", MAP_FUNCTION: mapStrandScore}

            //GRADE 9
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_CSE", FIELD: "G9_Read_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_KOL", FIELD: "G9_KNOWLEDGE_OF_LANG_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_POW", FIELD: "G9_PRODUCTION_OF_WRITING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_ALG", FIELD: "G9_ALGEBRA_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_FUNC", FIELD: "G9_FUNCTIONS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_GOE", FIELD: "G9_GEOMETRY_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_SAP", FIELD: "G9_STATISTICS_AND_PROBABILITY_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_CAS", FIELD: "G9_CRAFT_AND_STRUCTURE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_KAI", FIELD: "G9_KNOWLEDGE_AND_IDEA_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_KI", FIELD: "G9_KEYIDEAS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_DAUM", FIELD: "G9_DEVELOPING_AND_USING_MODELS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_GDAI", FIELD: "G9_GATHERING_DATA_AND_INVESTIGATING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_SRTCE", FIELD: "G9_SCIENTIFIC_REASONING_TO_CONSTRUCT_EXPLANATIONS_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "UT_ASPIRE_PLUS_", CODE:"G9_MTAIP", FIELD: "G90_MATHEMATICAL_THINKING_AND_INTERPRET_PATTERNS_", MAP_FUNCTION: mapStrandScore}
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
        "Kindergarten": "KG"
        , "": null
        , null: null
    };

    var primaryDecode = {
           "Below Proficient" : "Level 1"
           ,"Approaching Proficient" : "Level 2"
           ,"Proficient" : "Level 3"
           ,"Highly Proficient" : "Level 4"
           ,"-" : null
           ,"" : null
           ,null : null
          };

        var predictedDecode = {
            "On Target" : "OT"
            ,"Not on Target" : "NOT"
            ,"-" : null
            ,"" : null
            ,null : null
           };

        var passDecode = {
           "Below Proficient" : "No"
           ,"Approaching Proficient" : "No"
           ,"Proficient" : "Yes"
           ,"Highly Proficient" : "Yes"
           ,"-" : null
           ,"" : null
           ,null : null
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
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
                   //AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

             var studentname = row.getField("STUDENT_NAME");
               if (studentname !== null && studentname !== undefined && studentname !== ""){
                var firstName = studentname.split(",")[1];
                var lastName = studentname.split(",")[0];
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
                    //TEST_ADMIN_DATE must always finish/print as MM/dd/YYYY format
                    case "TEST_ADMIN_DATE":
                        record.TEST_ADMIN_DATE = _util.coalesce('05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
                        break;

               //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_ID")
                    );
                    break;
                    case "STUDENT_FIRST_NAME":
                        record.STUDENT_FIRST_NAME = firstName;
                        break;
                    case "STUDENT_LAST_NAME":
                        record.STUDENT_LAST_NAME = lastName;
                        break;
                    case "STUDENT_MIDDLE_NAME":
                        record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                        break;
                    case "STUDENT_GENDER_CODE":
                        record.STUDENT_GENDER_CODE = row.getField('GENDER');
                        break;
                    case "STUDENT_GRADE_CODE":
                        record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOLNUMBER"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("DISTRICTNUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOLNUMBER"));
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

        //        if (row.getField("ENG_LEARNER") === "1" || row.getField("ENG_LEARNER") === "2") {
        //            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        //        }
        //        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata) {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE;
            var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
            var predictedScore = row.getField(testMetadata.FIELD + "PREDICTEDACTSCORE");
    		var achievLevel = row.getField(testMetadata.FIELD + "PROF_LEVEL");
    		var testProgress = row.getField(testMetadata.FIELD + "TEST_PROGRESS");


            // Check for key fields and do not map score and exit if conditions met.
            if (
                (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "-") &&
                (predictedScore === null || predictedScore === undefined || _util.trim(predictedScore) === "--" || _util.trim(predictedScore) === "" || _util.trim(predictedScore) === "-")
            ) {
                return null;
            }


        	// Set score fields
        	score["TEST_NUMBER"] = testNumber;
        	score["TEST_SCORE_TEXT"] = predictedScore;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }
        	score["TEST_PASSED_INDICATOR"] = passDecode[achievLevel];
        	score["TEST_PRIMARY_RESULT"] = achievLevel;
        	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achievLevel];

        	score["TEST_SECONDARY_RESULT"] = predictedScore;
            score["TEST_SECONDARY_RESULT_CODE"] = predictedDecode[predictedScore];
            score["TEST_CUSTOM_RESULT"] = testProgress;

            return score;
        }


    function mapStrandScore(row, testMetadata) {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE;
            var percentile = row.getField(testMetadata.FIELD + "PERCENTILE");

            // Check for key fields and do not map score and exit if conditions met.
            if(percentile === null || percentile === undefined || _util.trim(percentile) === "--" || _util.trim(percentile) === "" || _util.trim(percentile) === "-") {
                return null;
            }

        	// Set score fields
         	score["TEST_NUMBER"] = testNumber;
        	score["TEST_PERCENTILE_SCORE"] = percentile.replace("%","");

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
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }
    }

    // function to generate TestNumber
//    function generateTestNumber(row, testMetadata) {
//
//        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
//
//        return testNumber;
//
//    }

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
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());