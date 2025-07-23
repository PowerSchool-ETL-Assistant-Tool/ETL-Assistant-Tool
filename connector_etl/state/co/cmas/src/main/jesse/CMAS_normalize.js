var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CMAS";
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
			print("Loading using signature file ${signatureFormatName}\n");

            var normalizedFile = AppUtil.createResultsFile(file);
            print("Normalized file: ${normalizedFile}\n");

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
        //Overall
        {TEST: "CMAS", CODE:"_OVERALL", FIELD: "_OVERALL", MAP_FUNCTION: mapOverallScore}
        // Standard
        ,{TEST: "CMAS", CODE:"_STAND_1", FIELD: "STD1_", MAP_FUNCTION: mapStandardSSSCIScore}
        ,{TEST: "CMAS", CODE:"_STAND_2", FIELD: "STD2_", MAP_FUNCTION: mapStandardSSSCIScore}
        ,{TEST: "CMAS", CODE:"_STAND_3", FIELD: "STD3_", MAP_FUNCTION: mapStandardSSSCIScore}
        ,{TEST: "CMAS", CODE:"_STAND_4", FIELD: "STD4_", MAP_FUNCTION: mapStandardSSSCIScore}
         // Standard Error
        ,{TEST: "CMAS", CODE:"_SEP", FIELD: "SEP_", MAP_FUNCTION: mapStandardSSSCIScore}
        // Standard 1 Prepared Graduate Competency
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRAD_COMP_1", FIELD: "STD1_PGC1_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRAD_COMP_2", FIELD: "STD1_PGC2_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRAD_COMP_3", FIELD: "STD1_PGC3_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 1 Prepared Graduate
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRAD_1", FIELD: "STD1_PG1_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 1 Prepared Graduate 23
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRAD_23", FIELD: "STD1_PG23_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 1 Prepared Graduate 234
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRAD_234", FIELD: "STD1_PG234_", MAP_FUNCTION: mapStandardSubScore}
         // Standard 1 Prepared Graduate 4
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRAD_4", FIELD: "STD1_PG4_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 2 Prepared Graduate Competency
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRAD_COMP_1", FIELD: "STD2_PGC1_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRAD_COMP_2", FIELD: "STD2_PGC2_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRAD_COMP_3", FIELD: "STD2_PGC3_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRAD_COMP_4", FIELD: "STD2_PGC4_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 2 Prepared Graduate 5
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRAD_5", FIELD: "STD2_PG5_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 2 Prepared Graduate 6
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRAD_6", FIELD: "STD2_PG6_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 2 Prepared Graduate 56
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRAD_56", FIELD: "STD2_PG56_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 2 Prepared Graduate 78
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRAD_78", FIELD: "STD2_PG78_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 3 Prepared Graduate Competency
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRAD_COMP_1", FIELD: "STD3_PGC1_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRAD_COMP_2", FIELD: "STD3_PGC2_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRAD_COMP_3", FIELD: "STD3_PGC3_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 3 Prepared Graduate 9
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRAD_9", FIELD: "STD3_PG9_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 3 Prepared Graduate 1011
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRAD_1011", FIELD: "STD3_PG1011_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 4 Prepared Graduate Competency
        ,{TEST: "CMAS", CODE:"_STAND_4_PREP_GRAD_COMP_1", FIELD: "STD4_PGC1_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_4_PREP_GRAD_COMP_2", FIELD: "STD4_PGC2_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 1 Grade Level Expectation
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRD_LVL_EXP_1", FIELD: "STD1_GLE1_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRD_LVL_EXP_2", FIELD: "STD1_GLE2_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRD_LVL_EXP_3", FIELD: "STD1_GLE3_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRD_LVL_EXP_4", FIELD: "STD1_GLE4_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRD_LVL_EXP_5", FIELD: "STD1_GLE5_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_1_PREP_GRD_LVL_EXP_6", FIELD: "STD1_GLE6_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 2 Grade Level Expectation
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_1", FIELD: "STD2_GLE1_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_2", FIELD: "STD2_GLE2_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_3", FIELD: "STD2_GLE3_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_4", FIELD: "STD2_GLE4_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_5", FIELD: "STD2_GLE5_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_6", FIELD: "STD2_GLE6_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_7", FIELD: "STD2_GLE7_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_8", FIELD: "STD2_GLE8_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_2_PREP_GRD_LVL_EXP_9", FIELD: "STD2_GLE9_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 3 Grade Level Expectation
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_1", FIELD: "STD3_GLE1_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_2", FIELD: "STD3_GLE2_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_3", FIELD: "STD3_GLE3_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_4", FIELD: "STD3_GLE4_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_5", FIELD: "STD3_GLE5_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_6", FIELD: "STD3_GLE6_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_7", FIELD: "STD3_GLE7_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 3 Grade Level Expectation 12
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_12", FIELD: "STD3_GLE12_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 3 Grade Level Expectation 34
        ,{TEST: "CMAS", CODE:"_STAND_3_PREP_GRD_LVL_EXP_34", FIELD: "STD3_GLE34_", MAP_FUNCTION: mapStandardSubScore}
        // Standard 4 Grade Level Expectation
        ,{TEST: "CMAS", CODE:"_STAND_4_PREP_GRD_LVL_EXP_1", FIELD: "STD4_GLE1_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_4_PREP_GRD_LVL_EXP_2", FIELD: "STD4_GLE2_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_STAND_4_PREP_GRD_LVL_EXP_3", FIELD: "STD4_GLE3_", MAP_FUNCTION: mapStandardSubScore}
        // Constructed Response
        ,{TEST: "CMAS", CODE:"_CONST_RESP", FIELD: "CR_", MAP_FUNCTION: mapConstructedOrSelectedScore}
        // Selected Response
        ,{TEST: "CMAS", CODE:"_SEL_RESP", FIELD: "SR_", MAP_FUNCTION: mapConstructedOrSelectedScore}
        // Reading
        ,{TEST: "CMAS", CODE:"_TESTRD", FIELD: " TEST_READING_", MAP_FUNCTION: mapConstructedOrSelectedScore}
         ,{TEST: "CMAS", CODE:"_TESTRD", FIELD: "TEST_READING_", MAP_FUNCTION: mapConstructedOrSelectedScore}
        // Writing
        ,{TEST: "CMAS", CODE:"_TESTWT", FIELD: " TEST_WRITING_", MAP_FUNCTION: mapStandardSubScore}
        ,{TEST: "CMAS", CODE:"_TESTWT", FIELD: "TEST_WRITING_", MAP_FUNCTION: mapStandardSubScore}
        // MATH & ELA Standard
        ,{TEST: "CMAS", CODE:"_STAND_1", FIELD: "STD1_MA_ELA_", MAP_FUNCTION: mapStandardMAELAScore}
        ,{TEST: "CMAS", CODE:"_STAND_2", FIELD: "STD2_MA_ELA_", MAP_FUNCTION: mapStandardMAELAScore}
        ,{TEST: "CMAS", CODE:"_STAND_3", FIELD: "STD3_MA_ELA_", MAP_FUNCTION: mapStandardMAELAScore}
        ,{TEST: "CMAS", CODE:"_STAND_4", FIELD: "STD4_MA_ELA_", MAP_FUNCTION: mapStandardMAELAScore}
        ,{TEST: "CMAS", CODE:"_STAND_5", FIELD: "STD5_MA_ELA_", MAP_FUNCTION: mapStandardMAELAScore}
        // Social Studies Strand
        ,{TEST: "CMAS", CODE:"_STD1", FIELD: "_STANDARD_1", MAP_FUNCTION: mapStrandSSSore}
        ,{TEST: "CMAS", CODE:"_STD2", FIELD: "_STANDARD_2", MAP_FUNCTION: mapStrandSSSore}
        ,{TEST: "CMAS", CODE:"_STD3", FIELD: "_STANDARD_3", MAP_FUNCTION: mapStrandSSSore}
        ,{TEST: "CMAS", CODE:"_STD4", FIELD: "_STANDARD_4", MAP_FUNCTION: mapStrandSSSore}
        ,{TEST: "CMAS", CODE:"_STD5", FIELD: "_STANDARD_5", MAP_FUNCTION: mapStrandSSSore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

      var performanceLvlDecode = {
            "1" : {LEVEL: "Level 1", DESC: "Did not yet meet expectations", PASSED: "No"}
            ,"2" : {LEVEL: "Level 2", DESC: "Partially met expectations", PASSED: "No"}
            ,"3" : {LEVEL: "Level 3", DESC: "Approached expectations", PASSED: "No"}
            ,"4" : {LEVEL: "Level 4", DESC: "Met expectations", PASSED: "Yes"}
            ,"5" : {LEVEL: "Level 5", DESC: "Exceeded expectations", PASSED: "Yes"}
            ,"" : {LEVEL: null, DESC: null, PASSED: null}
            ,"null" : {LEVEL: null, DESC: null, PASSED: null}
      };
      var performanceLvlDecodeSCISS = {
             "1" : {LEVEL: "Level 1", DESC: "Partially met expectations", PASSED: "No"}
            ,"2" : {LEVEL: "Level 2", DESC: "Approached expectations", PASSED: "No"}
            ,"3" : {LEVEL: "Level 3", DESC: "Met expectations", PASSED: "Yes"}
            ,"4" : {LEVEL: "Level 4", DESC: "Exceeded expectations", PASSED: "Yes"}
            ,"" : {LEVEL: null, DESC: null, PASSED: null}
            ,"null" : {LEVEL: null, DESC: null, PASSED: null}
      };

      var subClaimCategoryDecode = {
             "1" : " Meets or Exceeds Students at Level 4"
             ,"2" : "Nearly Students at Level 3"
             ,"3" : "Below Students at Level 3 Blank"
             ,"" : null
             ,null : null
      };

      var subjectDecode = {
           "English Language Arts/Literacy" : "_ELA"
           ,"Spanish Language Arts/Literacy" : "_SPA_ELA"

           ,"Mathematics" : "_MT"
           ,"Algebra I" : "_ALGI"
           ,"Geometry" : "_GEOM"
           ,"Integrated Mathematics I" : "_INT_MTI"
           ,"Integrated Mathematics II" : "_INT_MTII"

           ,"Science" : "_SCI"

           ,"Social Studies" : "_SS"
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
        var subject = subjectDecode[_util.coalesce(row.getField("SUBJECT"))];

        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, subject);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                print(e);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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


        const birthDateObject = module.mapDateObject(hierarchy, row, row.getField("STUDENT_BIRTHDATE"));
        const testDateObject = module.mapDateObject(hierarchy, row, _util.coalesce(row.getField("ATTEMPT_CREATE_DATE"), hierarchy.SCHOOL_YEAR.substring(5)+"-01-01" ));



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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("RESPONSIBLESCHOOLCODE"),row.getField("RESPONSIBLESCHOOLNAME"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("RESPONSIBLESCHOOLCODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("RESPONSIBLESCHOOLNAME"));
                     break;
                case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_IDENTIFIER"));
                      break;
                case "STUDENT_VENDOR_ID":
                      record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STATE_STUDENT_IDENTIFIER"));
                      break;
                case "STUDENT_LOCAL_ID":
                     record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("LOCALSTUDENTIDENTIFIER"));
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
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("SEX"));
                     break;
                case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = _util.coalesce(row.getField("GRADE_LEVEL_WHEN_ASSESSED"), row.getField("ASSESSMENT_GRADE"));
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

        return admin;
    }





    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapOverallScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var scaleScore = row.getField("SCALE_SCORE" + testMetadata.FIELD);
        var pointsPossible = row.getField("PTS_POSS" + testMetadata.FIELD);
        var csemRange = row.getField("CSEM" + testMetadata.FIELD);
        var performanceLevel = row.getField("PERF_LVL" + testMetadata.FIELD);
        var percentileRank = _util.coalesce(row.getField("PERCENTILE_RANK_OF_STUDENT_OF_THE_STATE" + testMetadata.FIELD), row.getField("PERCENTILE_RANK" + testMetadata.FIELD));

        // print(pointsPossible+"\n")
        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
         &&(pointsPossible === null || pointsPossible === undefined || _util.trim(pointsPossible) === "--" || _util.trim(pointsPossible) === ""))
         {
            return null;
        }
   // print("After Null"+pointsPossible+"\n")
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;
        score["TEST_PERCENTAGE_SCORE"] = csemRange;

        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = performanceLvlDecode[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = performanceLvlDecode[performanceLevel].PASSED;
        if(subject === "_SCI" || subject === "_SS"){
           score["TEST_PRIMARY_RESULT"] = performanceLvlDecodeSCISS[performanceLevel].DESC;
           score["TEST_PASSED_INDICATOR"] = performanceLvlDecodeSCISS[performanceLevel].PASSED;
        }
        if(percentileRank==="<1"){
            percentileRank = "1";
        }
        score["TEST_PERCENTILE_SCORE"] = percentileRank;
		score["TEST_SCORE_ATTRIBUTES"] = row.getField("TESTCODE");
        return score;
    }

    function mapStandardSSSCIScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var pointsPossible = row.getField(testMetadata.FIELD + "PTS_POSS");
        var csemRange = row.getField(testMetadata.FIELD + "CSEM");
        var performanceLevel = row.getField(testMetadata.FIELD + "PERF_LVL");
        var percentileRank = row.getField(testMetadata.FIELD + "PERCENTILE_RANK_OF_STUDENT");
        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
          &&(percentileRank === null || percentileRank === undefined || _util.trim(percentileRank) === "--" || _util.trim(percentileRank) === ""))
         {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;

        score["TEST_PERCENTAGE_SCORE"] = csemRange;

        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = performanceLvlDecodeSCISS[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = performanceLvlDecodeSCISS[performanceLevel].PASSED;
        if(percentileRank==="<1"){
            percentileRank = "1";
        }
        score["TEST_PERCENTILE_SCORE"] = percentileRank;
		score["TEST_SCORE_ATTRIBUTES"] = row.getField("TESTCODE");
        return score;
    }

    function mapStandardMAELAScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD + "RAW_SCORE");
        var performanceLevel = row.getField(testMetadata.FIELD + "PERF_LVL");
        var pointsPossible = row.getField(testMetadata.FIELD + "PTS_POSS");
        var percentCorrect = row.getField(testMetadata.FIELD + "PCT_CORR");

        // Check for key fields and do not map score and exit if conditions met.
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_SCORE_VALUE"] = rawScore;

        score["TEST_PERCENTAGE_SCORE"] = percentCorrect;

        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;

        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        if(undefined !== performanceLvlDecode[performanceLevel]){
            score["TEST_PRIMARY_RESULT"] = performanceLvlDecode[performanceLevel].DESC;
            score["TEST_PASSED_INDICATOR"] = performanceLvlDecode[performanceLevel].PASSED;
        }
		score["TEST_SCORE_ATTRIBUTES"] = row.getField("TESTCODE");
        return score;
    }

    function mapStandardSubScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD + "RAW_SCORE");
        var pointsPossible = row.getField(testMetadata.FIELD + "PTS_POSS");
        var percentCorrect = row.getField(testMetadata.FIELD + "PCT_CORR");

        // Check for key fields and do not map score and exit if conditions met.
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;

    	score["TEST_RAW_SCORE"] = rawScore;
    	score["TEST_SCORE_VALUE"] = rawScore;

        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;

    	score["TEST_PERCENTAGE_SCORE"] = percentCorrect;
		score["TEST_SCORE_ATTRIBUTES"] = row.getField("TESTCODE");
        return score;
    }

    function mapConstructedOrSelectedScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var csemRange = row.getField(testMetadata.FIELD + "CSEM");
        var pointsPossible = row.getField(testMetadata.FIELD + "PTS_POSS");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_PERCENTAGE_SCORE"] = csemRange;

        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;
		score["TEST_SCORE_ATTRIBUTES"] = row.getField("TESTCODE");
        return score;
    }
    function mapStrandSSSore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var scaleScore = row.getField("SS_PERCENTILE" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_PERCENTILE_SCORE"] = scaleScore;
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
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        return assessmentAdminKey;
    }

    module.mapDateObject = function (hierarchy, row, dateStr){

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
        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd HH:mm:ss");
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
