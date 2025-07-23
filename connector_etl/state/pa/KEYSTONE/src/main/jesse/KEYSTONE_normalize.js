var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "KEYSTONE";
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
                //found reject
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
        {TEST: "KEYS", CODE:"_OVERALL", FIELD: "ADMIN_", MAP_FUNCTION: mapOverallScore}
        //Best
        ,{TEST: "KEYS", CODE:"_M1_BEST", FIELD: "MODULE_1_BEST_", MAP_FUNCTION: mapBestScore}
        ,{TEST: "KEYS", CODE:"_M2_BEST", FIELD: "MODULE_2_BEST_", MAP_FUNCTION: mapBestScore}
        ,{TEST: "KEYS", CODE:"_OVR_BEST", FIELD: "BEST_", MAP_FUNCTION: mapBestScore}
        //Module mains
        ,{TEST: "KEYS", CODE:"_M1_OVR", FIELD: "MODULE_1_", MAP_FUNCTION: mapModuleScore}
        ,{TEST: "KEYS", CODE:"_M2_OVR", FIELD: "MODULE_2_", MAP_FUNCTION: mapModuleScore}
        //Module anchors
        ,{TEST: "KEYS", CODE:"_M1_A1", FIELD: "MODULE_1_ANCHOR_1_", NUM: "1", MAP_FUNCTION: mapAnchorScore}
        ,{TEST: "KEYS", CODE:"_M1_A2", FIELD: "MODULE_1_ANCHOR_2_", NUM: "2", MAP_FUNCTION: mapAnchorScore}
        ,{TEST: "KEYS", CODE:"_M1_A3", FIELD: "MODULE_1_ANCHOR_3_", NUM: "3", MAP_FUNCTION: mapAnchorScore}
        ,{TEST: "KEYS", CODE:"_M1_A4", FIELD: "MODULE_1_ANCHOR_4_", NUM: "4", MAP_FUNCTION: mapAnchorScore}
        ,{TEST: "KEYS", CODE:"_M2_A1", FIELD: "MODULE_2_ANCHOR_1_", NUM: "1", MAP_FUNCTION: mapAnchorScore}
        ,{TEST: "KEYS", CODE:"_M2_A2", FIELD: "MODULE_2_ANCHOR_2_", NUM: "2", MAP_FUNCTION: mapAnchorScore}
        ,{TEST: "KEYS", CODE:"_M2_A3", FIELD: "MODULE_2_ANCHOR_3_", NUM: "3", MAP_FUNCTION: mapAnchorScore}
        ,{TEST: "KEYS", CODE:"_M2_A4", FIELD: "MODULE_2_ANCHOR_4_", NUM: "4", MAP_FUNCTION: mapAnchorScore}
        //Test events
        ,{TEST: "KEYS", CODE:"_M1_TE1", FIELD: "TEST_EVENT_1_MODULE_1_", NUM: "1", MAP_FUNCTION: mapEvent}
        ,{TEST: "KEYS", CODE:"_M1_TE2", FIELD: "TEST_EVENT_2_MODULE_1_", NUM: "2", MAP_FUNCTION: mapEvent}
        ,{TEST: "KEYS", CODE:"_M1_TE3", FIELD: "TEST_EVENT_3_MODULE_1_", NUM: "3", MAP_FUNCTION: mapEvent}
        ,{TEST: "KEYS", CODE:"_M2_TE1", FIELD: "TEST_EVENT_1_MODULE_2_", NUM: "1", MAP_FUNCTION: mapEvent}
        ,{TEST: "KEYS", CODE:"_M2_TE2", FIELD: "TEST_EVENT_2_MODULE_2_", NUM: "2", MAP_FUNCTION: mapEvent}
        ,{TEST: "KEYS", CODE:"_M2_TE3", FIELD: "TEST_EVENT_3_MODULE_2_", NUM: "3", MAP_FUNCTION: mapEvent}

        ,{TEST: "KEYS", CODE:"COMPOSITE", FIELD: "COMPOSITE_SCORE", MAP_FUNCTION: mapCompositeScore}

        ,{TEST: "KEYS", CODE:"TWO_TEST_COMP", FIELD: "TWO_TEST_COMPOSITE_SCORE", MAP_FUNCTION: mapTwoTestCompositeScore}
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

      var fullDecode = {
           "1" : "Below Basic"
           ,"2" : "Basic"
           ,"3" : "Proficient"
           ,"4" : "Advanced"
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
           ,"CA" : "No Score"
           ,"EL1" : "No Score"
           ,"N/A" : "No Score"
           ,"NV" : "No Score"
           ,"" : null
           ,null : null
      };
    var reverseDecode = {
            "Below Basic" : "1"
            ,"Basic" : "2"
            ,"Proficient" : "3"
            ,"Advanced" : "4"
           ,"P" : "0"
           ,"Ot" : "0"
           ,"NE" : "0"
           ,"MuC" : "0"
           ,"NR" : "0"
           ,"M" : "0"
           ,"NS" : "0"
           ,"-" : "0"
           ,"PO" : "0"
           ,"Ab" : "0"
           ,"ME" : "0"
           ,"MO" : "0"
           ,"Eab" : "0"
           ,"CA" : "0"
           ,"EL1" : "0"
           ,"N/A" : "0"
           ,"NV" : "0"
            ,"" : null
            ,null : null
    };
      var passDecode = {
           "0" : null
           ,"1" : "No"
           ,"2" : "No"
           ,"3" : "Yes"
           ,"4" : "Yes"
           ,"" : null
           ,null : null
      };
      var retestDecode = {
           "01" : "First Time"
           ,"1" : "First Time"
           ,"02" : "Re-test"
           ,"2" : "Re-test"
           ,"" : null
           ,null : null
      };
    var moduleDecode = {
           "01" : "Passed"
           ,"1" : "Passed"
           ,"02" : "Not Passed"
           ,"2" : "Not Passed"
           ,"" : null
           ,null : null
    };

    var modulePassDecode= {
           "01" : "Yes"
           ,"1" : "Yes"
           ,"02" : "No"
           ,"2" : "No"
           ,"" : null
           ,null : null
    };

    var statusDecode = {
        "0" : "Requirements Not Met",
        "1" : "Met Requirements"
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
        var subject = null;
        if(signature.getFormat().getFormatName() === "Keystone_a1" ){
            subject = "A1";
        }
        else if(signature.getFormat().getFormatName() === "Keystone_bio" ){
            subject = "BIO";
        }
        else if(signature.getFormat().getFormatName() === "Keystone_lit" ){
            subject = "LIT";
        }
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata,subject);

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
        var birthDateStr = row.getField("BIRTHDATE");
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        //var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTHDATE"), "MMddyyyy");
        if (birthDateStr === null || birthDateStr === "" || birthDateStr === undefined) {
            birthDateObject;
        } else if(birthDateStr.length >= 5 && birthDateStr.length <= 6){
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMddyy");
        }else if(birthDateStr.length === 7){
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "Mddyyyy");
        } else if (birthDateStr.length >= 8 && birthDateStr.length <= 10){
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMddyyyy");
        } else {
            birthDateObject;
        }
        var adminY = _util.coalesce(row.getField("ADMIN_YEAR"),hierarchy.SCHOOL_YEAR.toString().substring(5));
        var adminP = _util.coalesce(row.getField("ADMIN_DATE"),hierarchy.REPORTING_PERIOD);
        var adminT = '5';
        if(adminP === 'Winter' || adminP === "WINTER"){
            adminT = '1';
            if(adminY.indexOf("/")> -1){
               adminY = adminY.split("/")[1];
            }
            else if(adminY.indexOf("-")> -1){
                   adminY = adminY.split("-")[1];
            }
        }
        if(adminP === 'Fall'){
            adminT === '9';
            if(adminY.indexOf("/")> -1){
               adminY = adminY.split("/")[1];
            }
            adminY = parseInt(adminY)-1;
        }
        if(adminP === 'Spring'){
            if(adminY.indexOf("/")> -1){
               adminY = adminY.split("/")[1];
            }
        }
        if(adminP === 'ALL'){
            if(adminY.indexOf("/")> -1){
               adminY = adminY.split("/")[1];
            }
        }
        var adminD = adminT + '/15/'+adminY;
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
                    record.REPORTING_PERIOD = adminP;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(adminD, "MM/dd/yyyy").STANDARD_DATE;
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
                 case "STUDENT_VENDOR_ID":
                      record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("LOCAL_STUDENT_ID"));
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
                     record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField("GRADE")]);
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

        if(row.getField("ALGEBRA_I_CORONAVIRUS_EXEMPTION")){
        admin.TEST_INTERVENTION_DESC = _util.trim(row.getField("ALGEBRA_I_CORONAVIRUS_EXEMPTION"));
        admin.TEST_INTERVENTION_CODE = "ALGI";
        }
        if(row.getField("BIOLOGY_CORONAVIRUS_EXEMPTION")){
        admin.TEST_INTERVENTION_DESC_2 = _util.trim(row.getField("BIOLOGY_CORONAVIRUS_EXEMPTION"));
        admin.TEST_INTERVENTION_CODE_2 = "BIO"
        }
        if(row.getField("LITERATURE_CORONAVIRUS_EXEMPTION")){
        admin.TEST_INTERVENTION_DESC_3 = _util.trim(row.getField("LITERATURE_CORONAVIRUS_EXEMPTION"));
        admin.TEST_INTERVENTION_CODE_3 = "LIT"
        }
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapOverallScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = null;
        var testName = _util.coalesce(subject,_util.trim(row.getField("TEST_NAME")));
        // Subject from file name
        var lineageFile = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        var fileName = lineageFile.substring(lineageFile.lastIndexOf('/')+1);

        if(testName){
            testNumber = testMetadata.TEST + testMetadata.CODE + '_' + testName;
        } else if(fileName.indexOf("BIO") > -1){
            testNumber = testMetadata.TEST + testMetadata.CODE + '_' + "BIO";
        } else if ( fileName.indexOf("ALG") > -1){
            testNumber = testMetadata.TEST + testMetadata.CODE + '_' + "A1";
        } else if ( fileName.indexOf("LIT") > -1){
            testNumber = testMetadata.TEST + testMetadata.CODE + '_' + "LIT";
        }

        var scaleScore = _util.coalesce(_util.trim(row.getField("ADMIN_SCALE_SCORE")), _util.trim(row.getField("OVERALL_SCALE_SCORE")));

        var sem = _util.trim(row.getField("ADMIN_SCALE_SCORE_STANDARD_ERROR_OF_MEASUREMENT"));

        var performanceLevel = fullDecode[parseInt(row.getField("ADMIN_PERFORMANCE_LEVEL_CODE"))];
        var performanceLevelCode = row.getField("ADMIN_PERFORMANCE_LEVEL_CODE");
        var newPerformanceLevel = row.getField("OVERALL_PERFORMANCE_LEVEL");
        if(performanceLevel === null || performanceLevel === undefined ){
            var performanceLevel = _util.coalesce(row.getField("ADMIN_PERFORMANCE_LEVEL"), newPerformanceLevel);
            var performanceLevelCode = reverseDecode[_util.coalesce(row.getField("ADMIN_PERFORMANCE_LEVEL"), newPerformanceLevel)];
        }
        var raw = _util.trim(row.getField("ADMIN_RAW_SCORE"));

        var mc = row.getField("ADMIN_MULTIPLE_CHOICE_TOTAL_RAW_SCORE");
        var cr = row.getField("ADMIN_CONSTRUCTED_RESPONSE_TOTAL_RAW_SCORE");
        var retest = row.getField("FIRST_TIME_OR_RE-TEST");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""|| _util.trim(scaleScore) === " ") {
            return null;
        }
        //May be removed someday so kept as a separate return null
        if(performanceLevel==="No Score"){
            return null;
        }

        if(fullDecode === "No Score" || reverseDecode === "0"){
            // Set major score fields to null when no score but report the no score
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = _util.trim(scaleScore);
            score["TEST_SCORE_VALUE"] = null;
            score["TEST_SCALED_SCORE"] =  null;
            if(!isNaN(raw)&&raw!="")
                score["TEST_RAW_SCORE"] = parseInt(_util.trim(raw));


            score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelCode;
            score["TEST_PRIMARY_RESULT"] = performanceLevel;
            score["TEST_PASSED_INDICATOR"] = passDecode[parseInt(performanceLevelCode)];

            if(!isNaN(sem)&&sem!="")
                score["TEST_STANDARD_ERROR"] = sem;
            score["TEST_SECONDARY_RESULT"] = mc;
            score["TEST_TERTIARY_RESULT"] = cr;
            return score;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = _util.trim(scaleScore);

        if(!isNaN(scaleScore)&&scaleScore!=""){

            score["TEST_SCALED_SCORE"] =  parseInt(_util.trim(scaleScore));
            score["TEST_SCORE_VALUE"] = parseInt(_util.trim(scaleScore));

        }

        if(!isNaN(raw)&&raw!=""){
            score["TEST_RAW_SCORE"] = parseInt(_util.trim(raw));
        }


        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelCode;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PASSED_INDICATOR"] = passDecode[parseInt(performanceLevelCode)];

        score["TEST_STANDARD_ERROR"] = sem;
        score["TEST_SECONDARY_RESULT"] = mc;
        score["TEST_TERTIARY_RESULT"] = cr;
        score["TEST_SCORE_ATTRIBUTES"] = retestDecode[retest];

        if(testName === "A1"){
            score["TEST_QUATERNARY_RESULT_CODE"] = row.getField("ALG1RESULT");
            score["TEST_QUATERNARY_RESULT"] = fullDecode[row.getField("ALG1RESULT")];
        }else if(testName === "BIO"){
            score["TEST_QUATERNARY_RESULT_CODE"] = row.getField("BIORESULT");
            score["TEST_QUATERNARY_RESULT"] = fullDecode[row.getField("BIORESULT")];
        }else if(testName === "LIT"){
            score["TEST_QUATERNARY_RESULT_CODE"] = row.getField("LITRESULT");
            score["TEST_QUATERNARY_RESULT"] = fullDecode[row.getField("LITRESULT")];
        }

        return score;
    }


    /**
     * Robust Keystone performance level mapping.
     * Returns { level: "Below Basic"|"Basic"|"Proficient"|"Advanced", code: "1"|"2"|"3"|"4" }
     * @param {string} testName - The subject/test name (e.g., "A1", "ALGEBRA I", "BIO", "LIT", etc.)
     * @param {number|string} scaleScore - The scale score (number or numeric string)
     * @returns {{level: string, code: string}|null}
     */
    function getKeystonePerformanceLevel(testName, scaleScore) {
        if (scaleScore === null || scaleScore === undefined || scaleScore === "" || isNaN(scaleScore)) return null;
        var score = parseInt(scaleScore, 10);
        if (isNaN(score)) return null;
        var name = String(testName || "").toUpperCase().replace(/\s+/g, "");
        // Algebra I / Mathematics
        if (["A1", "ALGEBRAI", "ALGEBRA", "MATHEMATICS", "MATH"].indexOf(name) > -1) {
            if (score >= 1200 && score <= 1438) return { level: "Below Basic", code: "1" };
            if (score >= 1439 && score <= 1499) return { level: "Basic", code: "2" };
            if (score >= 1500 && score <= 1545) return { level: "Proficient", code: "3" };
            if (score >= 1546 && score <= 1800) return { level: "Advanced", code: "4" };
        }
        // Biology
        else if (["BIO", "BIOLOGY"].indexOf(name) > -1) {
            if (score >= 1200 && score <= 1459) return { level: "Below Basic", code: "1" };
            if (score >= 1460 && score <= 1499) return { level: "Basic", code: "2" };
            if (score >= 1500 && score <= 1548) return { level: "Proficient", code: "3" };
            if (score >= 1549 && score <= 1800) return { level: "Advanced", code: "4" };
        }
        // Literature
        else if (["LIT", "LITERATURE"].indexOf(name) > -1) {
            if (score >= 1200 && score <= 1443) return { level: "Below Basic", code: "1" };
            if (score >= 1444 && score <= 1499) return { level: "Basic", code: "2" };
            if (score >= 1500 && score <= 1583) return { level: "Proficient", code: "3" };
            if (score >= 1584 && score <= 1800) return { level: "Advanced", code: "4" };
        }
        return null;
    }

    function mapModuleScore(row, testMetadata, subject) {
        var score = {};
        var raw = _util.trim(row.getField(testMetadata.FIELD+"RAW_SCORE"));
        var scaled = _util.trim(row.getField(testMetadata.FIELD+"SCALE_SCORE"));
        var result = _util.trim(row.getField(testMetadata.FIELD+"RESULT"));
        var formNumber = row.getField(testMetadata.FIELD+"FORM_NUMBER");
        if (formNumber && formNumber.length === 1) {
            formNumber = '0' + formNumber;
        }
        else if (formNumber === null){
            formNumber = "NF";
        }
        var testName = _util.coalesce(subject,_util.trim(row.getField("TEST_NAME")));
        var testNumber = testMetadata.TEST + testMetadata.CODE+ '_' + testName+'_'+ _util.trim(formNumber);
        var spanishVersion = row.getField(testMetadata.FIELD+"SPANISH_VERSION");
        var exclusionCode = row.getField(testMetadata.FIELD+"EXCLUSION_CODE");
        if(spanishVersion ==='Y'){
            testNumber = testNumber + "_SPAN";
        }
        if(scaled === null || scaled === undefined || _util.trim(scaled) === "--" || _util.trim(scaled) === ""|| _util.trim(scaled) === " ") {
            return null;
        }
        if(fullDecode[parseInt(result)]==="No Score"){
            return null;
        }

        // Use robust Keystone mapping
        var perf = getKeystonePerformanceLevel(testName, scaled);

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = parseInt(_util.trim(scaled));
        if(!isNaN(scaled)&&scaled!=""){
            score["TEST_SCORE_VALUE"] = parseInt(_util.trim(scaled));
            score["TEST_SCALED_SCORE"] = parseInt(_util.trim(scaled));
        }
        if(!isNaN(raw)&&raw!=""){
            score["TEST_RAW_SCORE"] = parseInt(_util.trim(raw));
        }
        // Primary result from robust mapping
        score["TEST_PRIMARY_RESULT"] = perf ? perf.level : null;
        score["TEST_PRIMARY_RESULT_CODE"] = perf ? perf.code : null;
        // Move old result/code to secondary
        score["TEST_SECONDARY_RESULT"] = moduleDecode[parseInt(result)];
        score["TEST_SECONDARY_RESULT_CODE"] = result;
        if(row.getField(testMetadata.FIELD+"PASS")!==undefined && row.getField(testMetadata.FIELD+"PASS") !== null){
            score["TEST_PASSED_INDICATOR"] = row.getField(testMetadata.FIELD+"PASS");
        }
        else {
            score["TEST_PASSED_INDICATOR"] = modulePassDecode[parseInt(result)];
        }
        score["TEST_SCORE_ATTRIBUTES"] = exclusionCode;
        return score;
    }

    function mapBestScore(row, testMetadata, subject) {
        var score = {};
        var testName = _util.coalesce(subject,_util.trim(row.getField("TEST_NAME")));
        var testNumber = testMetadata.TEST + testMetadata.CODE+ '_'+ testName;
        var scaled = _util.trim(row.getField(testMetadata.FIELD+"SCALE_SCORE"));
        var result = _util.coalesce(row.getField(testMetadata.FIELD+"RESULT"),row.getField(testMetadata.FIELD+"SCORE_RESULT"));
        var bestDate = row.getField(testMetadata.FIELD+"SCORE_TEST_DATE");
        var sem = _util.trim(row.getField(testMetadata.FIELD+"PERFORMANCE_STANDARD_ERROR_OF_MEASUREMENT"));
        if(scaled === null || scaled === undefined || _util.trim(scaled) === "--" || _util.trim(scaled) === ""|| _util.trim(scaled) === " ") {
            return null;
        }
        if(fullDecode[parseInt(result)]==="No Score"){
            return null;
        }
        // Use robust Keystone mapping
        var perf = getKeystonePerformanceLevel(testName, scaled);

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = parseInt(_util.trim(scaled));
        if(!isNaN(scaled)&&scaled!=""){
            score["TEST_SCORE_VALUE"] = parseInt(_util.trim(scaled));
            score["TEST_SCALED_SCORE"] = parseInt(_util.trim(scaled));
        }
        // Primary result from robust mapping
        score["TEST_PRIMARY_RESULT"] = perf ? perf.level : null;
        score["TEST_PRIMARY_RESULT_CODE"] = perf ? perf.code : null;
        // Move old result/code to secondary
        score["TEST_SECONDARY_RESULT"] = fullDecode[parseInt(result)];
        score["TEST_SECONDARY_RESULT_CODE"] = result;
        score["TEST_PASSED_INDICATOR"] = passDecode[perf ? perf.code : null];
        if(!isNaN(sem) && sem!="") {
            score["TEST_STANDARD_ERROR"] = sem;
        }
        score["TEST_SCORE_ATTRIBUTES"] = bestDate;
        return score;
    }


    function mapAnchorScore(row, testMetadata, subject) {
        var score = {};
        var testName = _util.coalesce(subject,_util.trim(row.getField("TEST_NAME")));
        var testNumber = testMetadata.TEST + testMetadata.CODE+ '_' + testName;
        var rawScore = _util.trim(row.getField(testMetadata.FIELD + "RAW_SCORE"));
        var rawScoreCR = row.getField(testMetadata.FIELD + "CR_RAW_SCORE");
        var retest = row.getField("FIRST_TIME_OR_RE-TEST");
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""|| _util.trim(rawScore) === " "){
            return null;
        }

        // Use robust Keystone mapping (if anchor uses scale score, replace rawScore with scaled if available)
        var perf = getKeystonePerformanceLevel(testName, rawScore);

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = parseInt(_util.trim(rawScore));
        if(!isNaN(rawScore)&&rawScore!=""){
            score["TEST_RAW_SCORE"] = parseInt(_util.trim(rawScore));
            score["TEST_SCORE_VALUE"] = parseInt(_util.trim(rawScore));
        }
        // Primary result from robust mapping
        score["TEST_PRIMARY_RESULT"] = perf ? perf.level : null;
        score["TEST_PRIMARY_RESULT_CODE"] = perf ? perf.code : null;
        // Move old result/code to secondary
        score["TEST_SECONDARY_RESULT"] = rawScoreCR;
        score["TEST_SCORE_ATTRIBUTES"] = retestDecode[retest];
        return score;
    }
    function mapEvent(row, testMetadata, subject) {
        var score = {};
        var testName = _util.coalesce(subject,_util.trim(row.getField("TEST_NAME")));
        var testNumber = testMetadata.TEST + testMetadata.CODE+ '_' + testName;
        var result = row.getField(testMetadata.FIELD + "RESULT");
        var scaleScore = _util.trim(row.getField(testMetadata.FIELD + "SCALE_SCORE"));
        var exclusionCode = row.getField(testMetadata.FIELD + "EXCLUSION_CODE");
        var retest = row.getField("FIRST_TIME_OR_RE-TEST");

        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""|| _util.trim(scaleScore) === " "){
            return null;
        }
        if(fullDecode[parseInt(result)]==="No Score"){
            return null;
        }

        // Use robust Keystone mapping
        var perf = getKeystonePerformanceLevel(testName, scaleScore);

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = parseInt(_util.trim(scaleScore));
        if(!isNaN(scaleScore)&&scaleScore!=""){
            score["TEST_SCALED_SCORE"] = parseInt(_util.trim(scaleScore));
            score["TEST_SCORE_VALUE"] = parseInt(_util.trim(scaleScore));
        }
        // Primary result from robust mapping
        score["TEST_PRIMARY_RESULT"] = perf ? perf.level : null;
        score["TEST_PRIMARY_RESULT_CODE"] = perf ? perf.code : null;
        // Move old result/code to secondary
        score["TEST_SECONDARY_RESULT"] = moduleDecode[parseInt(result)];
        score["TEST_SECONDARY_RESULT_CODE"] = result;
        if(row.getField(testMetadata.FIELD+"PASS")!==undefined && row.getField(testMetadata.FIELD+"PASS") !== null){
            score["TEST_PASSED_INDICATOR"] = row.getField(testMetadata.FIELD+"PASS");
        }
        else {
            score["TEST_PASSED_INDICATOR"] = modulePassDecode[parseInt(result)];
        }
        score["TEST_SCORE_ATTRIBUTES"] = exclusionCode;
        return score;
    }

    function mapCompositeScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + _util.coalesce(subject,_util.trim(row.getField("TEST_NAME")));

        var scaleScore = _util.trim(row.getField(testMetadata.CODE + "_SCORE"));
        var primaryResult = row.getField("COMPOSITE_SCORE_STATUS");
        var secondaryResult = row.getField("OVERALL_COMPOSITE_SCORE_STATUS");
        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""|| _util.trim(scaleScore) === " "){
            return null;
        }
        // Set score fields
    	score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if(!isNaN(scaleScore) && scaleScore!=""){
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
        score["TEST_PRIMARY_RESULT"] = statusDecode[primaryResult];
        score["TEST_SECONDARY_RESULT_CODE"] = secondaryResult;
        score["TEST_SECONDARY_RESULT"] = statusDecode[secondaryResult];

        return score;
    }

    function mapTwoTestCompositeScore(row, testMetadata, subject) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + _util.coalesce(subject,_util.trim(row.getField("TEST_NAME")));
        var scaleScore = _util.trim(row.getField(testMetadata.FIELD));
        var primaryResult = row.getField("TWO_TEST_COMPOSITE_SCORE_STATUS");
        var scoreAttribute = row.getField("TWO_TEST_ELIGIBLE");

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""|| _util.trim(scaleScore) === " "){
            return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if(!isNaN(scaleScore) && scaleScore!=""){
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
        score["TEST_PRIMARY_RESULT"] = statusDecode[primaryResult];
        score["TEST_SCORE_ATTRIBUTES"] = scoreAttribute;
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
            assessmentAdminKey = assessmentAdminKey.trim();
        });
        return assessmentAdminKey;
    }

    return module;
}());