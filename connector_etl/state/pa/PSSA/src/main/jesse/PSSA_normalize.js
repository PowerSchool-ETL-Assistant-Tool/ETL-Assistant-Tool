var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "PSSA";
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
        //Overall
        {TEST: "PSSA", CODE:"_OVERALL", FIELD: "", MAP_FUNCTION: mapOverallScore}
        //Other Raws
        ,{TEST: "PSSA", CODE:"_RAW_MC", FIELD: "MULTIPLE-CHOICE_", MAP_FUNCTION: mapRawScore}
        ,{TEST: "PSSA", CODE:"_RAW_OE", FIELD: "OPEN-ENDED_", MAP_FUNCTION: mapRawScore}
        ,{TEST: "PSSA", CODE:"_RAW_EBSR", FIELD: "EBSR_", MAP_FUNCTION: mapRawScore}
        //Old Subjectless
        ,{TEST: "PSSA", CODE:"_OVERALL_E", FIELD: "ELA", MAP_FUNCTION: mapOverallScoreOld}
        ,{TEST: "PSSA", CODE:"_OVERALL_M", FIELD: "MATH", MAP_FUNCTION: mapOverallScoreOld}
        ,{TEST: "PSSA", CODE:"_OVERALL_S", FIELD: "SCI", MAP_FUNCTION: mapOverallScoreOld}
        //Old Subjectless MC/OE
        ,{TEST: "PSSA", CODE:"_E_RAW_MC", FIELD: "MULTIPLE-CHOICE_", FIELD2: "ELA", MAP_FUNCTION: mapRawScoreOld}
        ,{TEST: "PSSA", CODE:"_E_RAW_OE", FIELD: "OPEN-ENDED_", FIELD2: "ELA", MAP_FUNCTION: mapRawScoreOld}
        ,{TEST: "PSSA", CODE:"_M_RAW_MC", FIELD: "MULTIPLE-CHOICE_", FIELD2: "MATH", MAP_FUNCTION: mapRawScoreOld}
        ,{TEST: "PSSA", CODE:"_M_RAW_OE", FIELD: "OPEN-ENDED_", FIELD2: "MATH", MAP_FUNCTION: mapRawScoreOld}
        ,{TEST: "PSSA", CODE:"_S_RAW_MC", FIELD: "MULTIPLE-CHOICE_", FIELD2: "SCI", MAP_FUNCTION: mapRawScoreOld}
        ,{TEST: "PSSA", CODE:"_S_RAW_OE", FIELD: "OPEN-ENDED_", FIELD2: "SCI", MAP_FUNCTION: mapRawScoreOld}
        //Stub for old performance strands
        //,{TEST: "PSSA", CODE:"E7.F", FIELD: "E7.F", MAP_FUNCTION: mapSubScoreOld}
        // Standard
        ,{TEST: "PSSA", CODE:"_RC_1", FIELD: "REPORTING_CATEGORY_1_", NUM: "1", MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_2", FIELD: "REPORTING_CATEGORY_2_", NUM: "2", MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_3", FIELD: "REPORTING_CATEGORY_3_", NUM: "3", MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_4", FIELD: "REPORTING_CATEGORY_4_", NUM: "4", MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_5", FIELD: "REPORTING_CATEGORY_5_", NUM: "5", MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_6", FIELD: "REPORTING_CATEGORY_6_", NUM: "6",  MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_7", FIELD: "REPORTING_CATEGORY_7_", NUM: "7", MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_8", FIELD: "REPORTING_CATEGORY_8_", NUM: "8", MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_9", FIELD: "REPORTING_CATEGORY_9-", NUM: "9", MAP_FUNCTION: mapStandardOrSubScore}
        ,{TEST: "PSSA", CODE:"_RC_10", FIELD: "REPORTING_CATEGORY_10_", NUM: "10", MAP_FUNCTION: mapStandardOrSubScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

      /*var performanceLvlDecode = {
            "1" : {LEVEL: "Level 1", DESC: "Emerging"}
            "2" : {LEVEL: "Level 2", DESC: "Approaching the Target"}
            "3" : {LEVEL: "Level 3", DESC: "At Target"}
            "4" : {LEVEL: "Level 4", DESC: "Advanced"}
            "" : {LEVEL: "Level 0", DESC: "Test did not receive a valid score"}
      };*/

      var subjectDecode = {
           "M" : "_MA"
           ,"S" : "_SCI"
           ,"E" : "_ENG"
           ,"ELA" : "_ENG"
           ,"MATH" : "_MA"
           ,"SCIENCE" : "_SCI"
           ,"" : null
           ,null : null
      };
      var strengthDecode = {
           "L" : "Low"
           ,"M" : "Medium"
           ,"H" : "High"
           ,"" : null
           ,null : null
      };



      var primaryDecode = {
           "Adv" : "Advanced"
           , "Adv " : "Advanced"
           , "Advanced" : "Advanced"
           ,"Bas" : "Basic"
           ,"Bas " : "Basic"
           ,"Basic" : "Basic"
           ,"Bel" : "Below Basic"
           ,"Bel " : "Below Basic"
           ,"Below Basic" : "Below Basic"
           ,"Pro" : "Proficient"
           ,"Pro " : "Proficient"
           ,"Proficient" : "Proficient"
           ,"1": "Below Basic"
           ,"2": "Basic"
           ,"3": "Proficient"
           ,"4": "Advanced"
           ,"P" : "No Score"
           ,"Ot" : "No Score"
           ,"NE" : "No Score"
           ,"MuC" : "No Score"
           ,"NR" : "No Score"
           ,"M" : "No Score"
           ,"NS" : "No Score"
           ,"-" : "No Score"
           ,"PO" : "No Score"
           ,"Ab" : "No Score"
           ,"ME" : "No Score"
           ,"MO" : "No Score"
           ,"Eab" : "No Score"
           ,"EAb" : "No Score"
           ,"CA" : "No Score"
           ,"EL1" : "No Score"
           ,"N/A" : "No Score"
           ,"NV" : "No Score"
           ,"" : null
           ,null : null
      };

      var oldREcode = {
           "Advanced" : "4"
           ,"Adv" : "4"
           ,"Adv " : "4"
           ,"Basic" : "2"
           ,"Bas" : "2"
           ,"Bas " : "2"
           ,"Below Basic" : "1"
           ,"Bel" : "1"
           ,"Bel " : "1"
           ,"Proficient" : "3"
           ,"Pro" : "3"
           ,"Pro " : "3"
           ,"" : null
           ,null : null
      };

      var passDecode = {
           "Adv" : "Yes"
           ,"Adv " : "Yes"
           ,"Advanced" : "Yes"
           ,"Bas" : "No"
           ,"Bas " : "No"
           ,"Basic" : "No"
           ,"Bel" : "No"
           ,"Bel " : "No"
           ,"Below Basic" : "No"
           ,"Pro" : "Yes"
           ,"Pro " : "Yes"
           ,"Proficient" : "Yes"
           ,"1": "No"
           ,"2": "No"
           ,"3": "Yes"
           ,"4": "Yes"
           ,"P" : null
           ,"Ot" : null
           ,"NE" : null
           ,"MuC" : null
           ,"NR" : null
           ,"M" : null
           ,"NS" : null
           ,"-" : null
           ,"PO" : null
           ,"Ab" : null
           ,"ME" : null
           ,"MO" : null
           ,"Eab" : null
           ,"EAb" : null
           ,"CA" : null
           ,"EL1" : null
           ,"N/A" : null
           ,"NV" : null
           ,"" : null
           ,null : null
      };
    var gradeDecode = {
        "1" 	: "01"
        ,"Grade 1" 	: "01"
        ,"01" 	: "01"
        ,"Grade 01" 	: "01"
        ,"2" 	: "02"
        ,"Grade 2" 	: "02"
        ,"02" 	: "02"
        ,"Grade 02" 	: "02"
        ,"3" 	: "03"
        ,"Grade 3" 	: "03"
        ,"03" 	: "03"
        ,"Grade 03" 	: "03"
        ,"4" 	: "04"
        ,"Grade 4" 	: "04"
        ,"04" 	: "04"
        ,"Grade 04" 	: "04"
        ,"5" 	: "05"
        ,"Grade 5" 	: "05"
        ,"05" 	: "05"
        ,"Grade 05" 	: "05"
        ,"6" 	: "06"
        ,"Grade 6" 	: "06"
        ,"06" 	: "06"
        ,"Grade 06" 	: "06"
        ,"7" 	: "07"
        ,"Grade 7" 	: "07"
        ,"07" 	: "07"
        ,"Grade 07" 	: "07"
        ,"8" 	: "08"
        ,"Grade 8" 	: "08"
        ,"08" 	: "08"
        ,"Grade 08" 	: "08"
        ,"9" 	: "09"
        ,"Grade 9" 	: "09"
        ,"09" 	: "09"
        ,"Grade 09" 	: "09"
        ,"10" 	: "10"
        ,"Grade 10" 	: "10"
        ,"11" 	: "11"
        ,"Grade 11" 	: "11"
        ,"12" 	: "12"
        ,"Grade 12" 	: "12"
        , null	: null
        ,""	: null
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
        var birthDateStr = row.getField("BIRTHDATE");
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };
        if (birthDateStr === null || birthDateStr === "" || birthDateStr === undefined) {
            birthDateObject;
        } else if(birthDateStr.length === 7){
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "Mddyyyy");
        } else if (birthDateStr.length >= 8 && birthDateStr.length <= 10){
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMddyyyy");
        } else {
            birthDateObject;
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
                    record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern("05/15/"+row.getField("TESTED_YEAR"), "MM/dd/yyyy").STANDARD_DATE;
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("TESTED_SCHOOL_CODE"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("TESTED_SCHOOL_CODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("TESTED_SCHOOL_NAME"));
                     break;
                 case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("DRC_STUDENT_ID"));
                      break;
                 case "STUDENT_LOCAL_ID":
                      record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("LOCAL_STUDENT_ID"));
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
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
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

        admin.TEST_EXEMPTION_DESC = _util.trim(row.getField("EXCLUSION_-_MEDICAL_EMERGENCY"));
        admin.TEST_EXEMPTION_CODE = _util.trim(row.getField("EXCLUSION_CODES"));
        admin.TEST_EXEMPTION_DESC_2 = _util.trim(_util.coalesce(row.getField("EXCLUSION_-_PARENTAL_REQUEST_CHAPTER_4"),row.getField("EXCLUSION_-_PARENTAL_REQUEST_OTHER")));
        admin.TEST_EXEMPTION_CODE_2 = _util.trim(row.getField("EXCLUSION_CODES"));
        admin.TEST_EXEMPTION_DESC_3 = _util.trim(row.getField("EXCLUSION_-_EXTENDED_ABSENCE"));
        admin.TEST_EXEMPTION_CODE_3 = _util.trim(row.getField("EXCLUSION_CODES"));
        admin.TEST_EXEMPTION_DESC_4 = _util.trim(row.getField("EXCLUSION_-_OTHER"));
        admin.TEST_EXEMPTION_CODE_4 = _util.trim(row.getField("EXCLUSION_CODES"));

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapOverallScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var scaleScore = row.getField("SCALE_SCORE");
        var performanceLevel = row.getField("PERFORMANCE_LEVEL_NAME");
        var performanceLevelCode = row.getField("PERFORMANCE_LEVEL_CODE");
        var SPPLevel = row.getField("SPP_PERFORMANCE_LEVEL");
        var raw = row.getField("TOTAL_RAW_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        //May be removed someday so kept as a separate return null
        if(primaryDecode[performanceLevel]==="No Score") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)&&primaryDecode[performanceLevel]!=="No Score"){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        else{
            score["TEST_SCORE_VALUE"] = null;
            score["TEST_SCALED_SCORE"] = null;
        }
        if(!isNaN(raw)){
            score["TEST_RAW_SCORE"] = raw;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelCode;
        score["TEST_PRIMARY_RESULT"] = primaryDecode[performanceLevel];
        score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
        score["TEST_SECONDARY_RESULT_CODE"] = "SPP";
        score["TEST_SECONDARY_RESULT"] = SPPLevel;

        return score;
    }

    //For older format with no subject
    function mapOverallScoreOld(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField("SCALE_SCORE_"+testMetadata.FIELD);
        var performanceLevel = row.getField("PERFORMANCE_LEVEL_NAME_"+testMetadata.FIELD);
        var performanceLevelCode = row.getField("PERFORMANCE_LEVEL_CODE_"+testMetadata.FIELD);//May not exist for older records
        var raw = row.getField("TOTAL_RAW_SCORE_"+testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        //May be removed someday so kept as a separate return null
        if(primaryDecode[performanceLevel]==="No Score") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(raw)){
            score["TEST_RAW_SCORE"] = raw;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(performanceLevelCode,oldREcode[performanceLevel]);
        score["TEST_PRIMARY_RESULT"] = primaryDecode[performanceLevel];
        score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];

        return score;
    }

    function mapRawScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var raw = row.getField(testMetadata.FIELD+"RAW_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(raw === null || raw === undefined || _util.trim(raw) === "--" || _util.trim(raw) === "" || isNaN(raw)) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_RAW_SCORE"] = raw;
        return score;
    }

    //For older files with no subject
    function mapRawScoreOld(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var raw = row.getField(testMetadata.FIELD+"RAW_SCORE_"+testMetadata.FIELD2);

        // Check for key fields and do not map score and exit if conditions met.
        if(raw === null || raw === undefined || _util.trim(raw) === "--" || _util.trim(raw) === "" || isNaN(raw)) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_RAW_SCORE"] = raw;
        return score;
    }

    function mapStandardOrSubScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + subject + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD + "RAW_SCORE");
        var strengthText = strengthDecode[row.getField(testMetadata.FIELD + "STRENGTH_PROFILE")];
        var strength = row.getField(testMetadata.FIELD + "STRENGTH_PROFILE");
        var anch1 = row.getField("ANCHOR_"+testMetadata.NUM+".1");
        var anch2 = row.getField("ANCHOR_"+testMetadata.NUM+".2");
        var anch3 = row.getField("ANCHOR_"+testMetadata.NUM+".3");
        var anch4 = row.getField("ANCHOR_"+testMetadata.NUM+".4");

        // Check for key fields and do not map score and exit if conditions met.
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""){
            return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;
        if(!isNaN(rawScore)){
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_SCORE_TEXT"] = rawScore;
        }
        else{
            return null;//Not a valid score
        }
        score["TEST_RAW_SCORE"] = rawScore;



        score["TEST_PRIMARY_RESULT_CODE"] = strength;
        score["TEST_PRIMARY_RESULT"] = strengthText;

        if(undefined!==anch1 && anch1!==""){
            score["TEST_GROWTH_TARGET_1"] = anch1;
        }
        if(undefined!==anch2 && anch2!==""){
            score["TEST_GROWTH_TARGET_2"] = anch2;
        }
        if(undefined!==anch3 && anch3!==""){
            score["TEST_GROWTH_TARGET_3"] = anch3;
        }
        if(undefined!==anch4 && anch4!==""){
            score["TEST_GROWTH_TARGET_4"] = anch4;
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