var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CMAS_SAT_GROWTH";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
        try {

            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("Normalized file: ${normalizedFile}");

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
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, exception, JSON.stringify(one) + '|' + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try{
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK: ${exception}", JSON.stringify(rows)));
                    }

                })
                .transform("TRANSFORM", ["RECORDS"],
                    function(output, rows) {

                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {

                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if(mappingObject.SCORE_MAPPINGS.length == 0 &&  row.INCLUDE_INDICATOR === "N") {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "LOW",row.LINEAGE_LINE, "Include indicator is No.", JSON.stringify(row)));
                    }
                    else if(mappingObject.SCORE_MAPPINGS.length == 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\"))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG);

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

    var scoresToMap =
        [
            // Initial ELPAC Scores to Process
            {TEST: "CMASSATGR", CODE: "TOT", FIELD:"", MAP_FUNCTION: mapTotalScore}
            //Not requested at CSPS, only customer at this time
            // ,{TEST: "CMASSATGR", CODE: "ONTR", FIELD: "ON_TRACK_", MAP_FUNCTION: mapOnTrackScore}
            // ,{TEST: "CMASSATGR", CODE: "TGT0", FIELD: "_TARGET0", MAP_FUNCTION: mapTargetScore}
            // ,{TEST: "CMASSATGR", CODE: "TGT1", FIELD: "_TARGET1", MAP_FUNCTION: mapTargetScore}
            // ,{TEST: "CMASSATGR", CODE: "TGT2", FIELD: "_TARGET2", MAP_FUNCTION: mapTargetScore}
            // ,{TEST: "CMASSATGR", CODE: "TGT3", FIELD: "_TARGET3", MAP_FUNCTION: mapTargetScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KN" 	: "KG"
        ,"01"	: "01"
		,"1"	: "01"
        ,"02"	: "02"
        ,"2"	: "02"
        ,"03"	: "03"
        ,"3"	: "03"
        ,"04"	: "04"
        ,"4"	: "04"
        ,"05"	: "05"
        ,"5"	: "05"
        ,"06"	: "06"
        ,"6"	: "06"
        ,"07"	: "07"
        ,"7"	: "07"
        ,"08"	: "08"
        ,"8"	: "08"
        ,"09"	: "09"
        ,"9"	: "09"
        ,"10"	: "10"
        ,"11"	: "11"
        ,"12"	: "12"
    };
    var trackLookup = {
        "0"         : "No"
        ,"1"	    : "Yes"
        ,"missing"  : "Not Eligible"
        ,""	        : "Not Eligible"
        ," "        : "Not Eligible"
        ,null	    : "Not Eligible"
    };

    var subjectLookup = {
        "ENGLISH LANGUAGE ARTS" : "ELA"
        ,"EVIDENCE-BASED READING AND WRITING" : "ELA"
        ,"PARCC"	: "PARCC"
        ,"SAT"	    : "SAT"
        ,"MAT"	    : "MA"
        ,"MATH"     : "MA"
        ,null	    : null
    };

    var testNameLookup = {
        "COLORADO PSAT/SAT" : "COSATPSAT"
        ,"PSAT/SAT"	: "COSATPSAT"
        ,"MATH"	    : "MA"
        ,"CMAS"     : "CMAS"
        , "PARCC"	: "PARCC"
        , "SAT"     : "COSATPSAT"
        , null : null
    };
    var testCodeLookup = {
        "COLORADO PSAT/SAT" : "COSATPSAT"
        ,"ELA"	: "ELA"
        ,"CMAS" : "MAT"
        ,null	: null
    };

    var proficiencyLvlDecode = {
                "Level 1" : {PASSED: "No", TEXT:"Did Not Yet Meet Expectations"}
                ,"Level 2" : {PASSED: "No", TEXT:"Partially Met Expectations"}
                ,"Level 3" : {PASSED: "No", TEXT:"Approached Expectations"}
                ,"Level 4" : {PASSED: "Yes", TEXT:"Met Expectations"}
                ,"Level 5" : {PASSED: "Yes", TEXT:"Exceeded Expectations"}
                ,"Did Not Yet Meet Expectations" : {PASSED: "No", TEXT:"Did Not Yet Meet Expectations"}
                ,"Partially Met Expectations" : {PASSED: "No", TEXT:"Partially Met Expectations"}
                ,"Approached Expectations" : {PASSED: "No", TEXT:"Approached Expectations"}
                ,"Met Expectations" : {PASSED: "Yes", TEXT:"Met Expectations"}
                ,"Exceeded Expectations" : {PASSED: "Yes", TEXT:"Exceeded Expectations"}
                ,"Unreported" : {PASSED: "", TEXT:"Unreported"}
                ,"" : {PASSED: "", TEXT:""}
                ,null : {PASSED: "", TEXT:""}
          };

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    function decodeGradeCode(gradeCode) {
        if(gradeCode == null) {
            return null;
        }
        var lkpGradeObj = gradeLookup[gradeCode];
        if(lkpGradeObj == undefined || lkpGradeObj == null) {
            return null;
        }
        return lkpGradeObj;
    }

    function decodeSubject(subject) {
        if(subject == null) {
            return null;
        }
        var lkpSubjectObj = subjectLookup[subject];
        if(lkpSubjectObj == undefined || lkpSubjectObj == null) {
            return null;
        }
        return lkpSubjectObj;
    }

    function decodeTestName(testName) {
        if(testName == null) {
            return null;
        }
        var lkpTNObj = testNameLookup[testName];
        if(lkpTNObj == undefined || lkpTNObj == null) {
            return null;
        }
        return lkpTNObj;
    }
    function decodeTestCode(testName) {
        if(testName == null) {
            return null;
        }
        var lkpTNObj = testCodeLookup[testName];
        if(lkpTNObj == undefined || lkpTNObj == null) {
            return null;
        }
        return lkpTNObj;
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
        scoresToMap.forEach(function(testMetadata) {
            var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
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
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateObject = null;
        var testDateObject = parseDate(row.getField("TEST_RECORD_YEAR"));
        var reportingDateObject = parseDate(row.getField("REPORTING_YEAR"));

        //Loop through normalized fields and map if possible.
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCH_NUMBER")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCH_NAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCH_NUMBER")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("SCH_NUMBER")
                    );
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = null;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = null;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = null;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADE_LEVEL")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("SASID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesceEmptyString(row.getField("SASID"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = null;
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField("MIDDLE_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                    break;
                 case "STUDENT_GENDER_CODE":
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                     break;
                /*case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = reportingDateObject.STANDARD_DATE;
                    break;*/
                default:
                    record[field] = row.getField(field);
                    break
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

        admin.TEST_EXEMPTION_CODE = _util.trim(row.getField("INCLUDED_PFWK_CALCS"));
        admin.TEST_INTERVENTION_CODE = _util.trim(row.getField("DID_NOT_TEST_CODE"));
        admin.TEST_INTERVENTION_DESC = _util.trim(row.getField("DID_NOT_TEST_TEXT"));
        var valid = _util.trim(row.getField("EXCLUDED_TEST_INVALID_YN"));
        if(valid === 'Y'){
            admin.TEST_RECORD_TYPE = "Invalid";
        }
        else{
            admin.TEST_RECORD_TYPE = "Valid";
        }
        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapTotalScore(row, testMetadata) {
        var score = {};
        var testCode = row.getField("TEST_CODE");
        if(""==="TEST_CODE"){
            testCode = decodeTestCode(row.getField("TEST_NAME"));
        }
        var testNumber =  testMetadata.TEST
                             //+ "_" + row.getField("REPORTING_DATA_SET")
                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + decodeTestName(row.getField("TEST_NAME"))
                             + "_" + testCode
                             + "_" + testMetadata.CODE;


        var proficiencyLevel = row.getField("PROFICIENCY_LEVEL");
        var subject = decodeSubject(row.getField("SUBJECT"));
        var scaledScore = row.getField("SCALE_SCORE");
        var sgp = row.getField("SGP");
        var sgpBaseline = _util.coalesce(row.getField("SGP_BASELINE"));


        var priorProficiencyLevel = row.getField("PRIOR_YR_PROF_LEVEL");
        var priorScaledScore = row.getField("PRIOR_YR_SCALE_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
        // CSPS-357 Customer didn't want TEST_PRIMARY_RESULT populated.
        score["TEST_PRIMARY_RESULT"] = "Not Specified";//proficiencyLvlDecode[proficiencyLevel].TEXT
        score["TEST_PASSED_INDICATOR"] = proficiencyLvlDecode[proficiencyLevel].PASSED;
         if(subject === "ELA" || subject === "MA"){
            score["TEST_PRIMARY_RESULT"] = proficiencyLvlDecode[proficiencyLevel].TEXT;
            score["TEST_PASSED_INDICATOR"] = proficiencyLvlDecode[proficiencyLevel].PASSED;
        }
        score["TEST_SECONDARY_RESULT"] = proficiencyLvlDecode[priorProficiencyLevel].TEXT;
        score["TEST_SECONDARY_RESULT_CODE"] = priorScaledScore;
        score["TEST_GROWTH_PERCENTILE"] = sgp;
        score["TEST_GROWTH_TARGET_1"] = sgpBaseline;
        score["TEST_SCORE_ATTRIBUTES"] = testCode;
        return score;
    }

    /*function mapOnTrackScore(row, testMetadata) {
        var score = {};
        var testCode = row.getField("TEST_CODE");
        if(""==="TEST_CODE"){
            testCode = decodeTestCode(row.getField("TEST_NAME"));
        }
        var testNumber =  testMetadata.TEST
                             //+ "_" + row.getField("REPORTING_DATA_SET")
                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + decodeTestName(row.getField("TEST_NAME"))
                             + "_" + testCode
                             + "_" + testMetadata.CODE;

        var agp = row.getField("AGP");
        var l1tol2 = row.getField(testMetadata.FIELD+"L1_TO_L2");
        var l2tol3 = row.getField(testMetadata.FIELD+"L2_TO_L3");
        var l3tol4 = row.getField(testMetadata.FIELD+"L3_TO_L4");
        var maintainL4 = row.getField(testMetadata.FIELD+"L4_TO_L4");
        var maintainL5 = row.getField(testMetadata.FIELD+"L5_TO_L5");
        var catchUp = row.getField("CATCH_UP");
        var keepUp = row.getField("KEEP_UP");
        var onTrack = row.getField("ON_TRACK");


        // Check for key fields and do not map score and exit if conditions met.
        if(agp === undefined || agp === null || _util.trim(agp) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_GROWTH_PERCENTILE"] = agp;
        score["TEST_GROWTH_TARGET_1"] = l1tol2;
        score["TEST_GROWTH_TARGET_2"] = l2tol3;
        score["TEST_GROWTH_TARGET_3"] = l3tol4;
        score["TEST_GROWTH_TARGET_4"] = maintainL4;
        score["TEST_GROWTH_TARGET_5"] = maintainL5;
        score["TEST_PRIMARY_RESULT_CODE"] = catchUp;
        score["TEST_PRIMARY_RESULT"] = trackLookup[catchUp];
        score["TEST_SECONDARY_RESULT_CODE"] = keepUp;
        score["TEST_SECONDARY_RESULT"] = trackLookup[keepUp];
        score["TEST_TERTIARY_RESULT_CODE"] = onTrack;
        score["TEST_TERTIARY_RESULT"] = trackLookup[onTrack];
        return score;
    }

    function mapTargetScore(row, testMetadata) {
        var score = {};
        var testCode = row.getField("TEST_CODE");
        if(""==="TEST_CODE"){
            testCode = decodeTestCode(row.getField("TEST_NAME"));
        }
        var testNumber =  testMetadata.TEST
                             //+ "_" + row.getField("REPORTING_DATA_SET")
                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + decodeTestName(row.getField("TEST_NAME"))
                             + "_" + testCode
                             + "_" + testMetadata.CODE;

        var l1l2 = row.getField("L1L2"+testMetadata.FIELD);
        var l2l3 = row.getField("L2L3"+testMetadata.FIELD);
        var l3l4 = row.getField("L3L4"+testMetadata.FIELD);
        var l4l5 = row.getField("L4L5"+testMetadata.FIELD);
        var l5l6 = row.getField("L5L6"+testMetadata.FIELD);



        // Check for key fields and do not map score and exit if conditions met.
        if(l1l2 === undefined || l1l2 === null || _util.trim(l1l2) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_GROWTH_TARGET_1"] = l1l2;
        score["TEST_GROWTH_TARGET_2"] = l2l3;
        score["TEST_GROWTH_TARGET_3"] = l3l4;
        score["TEST_GROWTH_TARGET_4"] = l4l5;
        score["TEST_GROWTH_TARGET_5"] = l5l6;
        return score;
    }*/

    /***************************************************************************
     Utility Functions
     ***************************************************************************/

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


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = null;
        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE;
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        return assessmentAdminKey;
    }




    function parseDate(rawDate) {
        rawDate = "01/01/"+rawDate;
        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
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




    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
