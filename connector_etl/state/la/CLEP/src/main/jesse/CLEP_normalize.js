var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CLEP";
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
                    if(mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
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

    var scoresToMap =
        [
            // ELPAC Scores to Process
            {TEST: "CLEP", CODE: "", FIELD:"", MAP_FUNCTION: mapScore},
            {TEST: "CLEP", CODE:"ENG_COMP", FIELD: "ENGLISH_COMPOSITION", MAP_FUNCTION: mapScaledScore},
            {TEST: "CLEP", CODE:"COL_ALG", FIELD: "COLLEGE_ALGEBRA", MAP_FUNCTION: mapScaledScore},
            {TEST: "CLEP", CODE:"SPA_LAN", FIELD: "SPANISH_LANGUAGE", MAP_FUNCTION: mapScaledScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KN" 	: "KG"
        ,"KG" 	: "KG"
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
        ,"T9"  : "T9"
        ,"15"  : "15"
        ,"20"  : "PS"
        ,"PS"  : "PS"
        ,"24"  : "PK"
        ,"PK"  : "PK"
        ,"25"  : "KG"
        ,"35"  : "35"
        , null : null
        , "" : null
    };

    //For passing levels that are not 50
    //https://clep.collegeboard.org/pdf/what-your-score-means.pdf
    //Spanish with Writing is not used and should be added when it appears
    var decodeExamPassing = {
          "FRENCH" 	 : 59
          ,"SPANISH" : 63
          ,"GERMAN"	 : 60
     };
    /* Sample in case needed for exam ed level
    var decodePerformanceLevel = {
        "1" 	: {LEVEL: "Level 1", DESC: "Beginning"}
        ,"2"	: {LEVEL: "Level 2", DESC: "Early Intermediate"}
        ,"3"	: {LEVEL: "Level 3", DESC: "Intermediate"}
        ,"4"	: {LEVEL: "Level 4", DESC: "Early Advanced"}
        ,"5"	: {LEVEL: "Level 5", DESC: "Advanced"}
        ,"0"	: {LEVEL: "0", DESC: "Performance Not Determined"}
        ,"N"	: {LEVEL: "N", DESC: "Not Attempted"}
        ,"E"	: {LEVEL: "E", DESC: "Exempt"}
        ,null	: null
        ,""     : null
    };
    */

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
        var birthDateObject = "";
        if(row.getField("DATEOFBIRTH")!==null && row.getField("DATEOFBIRTH") !== undefined
                && row.getField("DATEOFBIRTH").toString().length===8){
            birthDateObject = AppUtil.getDateObjByPattern(row.getField("DATEOFBIRTH"), "yyyy-MM-dd");
        }

        //var testDateObject = AppUtil.getDateObjByPattern(_util.trim(row.getField("EXAM_DATE")), "yyyy-MM-dd");

        var testDateObject=row.getField("EXAM_DATE");
        var finalDate = null;
        if (testDateObject !== null && testDateObject !== undefined && testDateObject.indexOf("-") >= 1){
           finalDate = AppUtil.getDateObjByPattern(testDateObject, "yyyy-MM-dd").STANDARD_DATE;
        }else if (testDateObject !== null && testDateObject !== undefined && testDateObject.indexOf("/") >= 1) {
            finalDate = AppUtil.getDateObjByPattern(testDateObject, "MM/dd/yyyy").STANDARD_DATE;
        }else{
            finalDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
        }

        /*  pre UIHN-9419:
        var trimmedDistrictCodeColumn =  _util.coalesce(
                    AssessmentLoader.config.DISTRICT_CODE
                    , ""
                );

        var districtCode = null;

        // District Code
        // Example 2 vs 002
        if(trimmedDistrictCodeColumn.length() >= 3) {
           districtCode = trimmedDistrictCodeColumn;
        }
        else if(trimmedDistrictCodeColumn.length() === 2) {
           districtCode = "0" + trimmedDistrictCodeColumn;
        }
        else {
           districtCode = "00" + trimmedDistrictCodeColumn;
        }
        */
        if(row.getField("SPONSORCD")) {
        var schoolLocalIDColumn = _util.coalesce(row.getField("SPONSORCD"));
        var schoolLocalID = null;

        // School Local ID
        // Example 002_002003
        if(schoolLocalIDColumn.indexOf("_") > -1) {
           schoolLocalID = schoolLocalIDColumn.split("_")[1];
        } else if (schoolLocalIDColumn.length() == 6) {
            schoolLocalID = schoolLocalIDColumn;
        } else {
           schoolLocalID = schoolLocalIDColumn + '999'; // District Route To for Unknowns
        }
        }

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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; //  pre UIHN-9419:  districtCode;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = '01/01/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"),
                        schoolLocalID
                        , row.getField("SPONSORCD") + "999" // District Route To for Unknowns
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = null;
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = schoolLocalID;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = finalDate;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = null;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = birthDateObject.DAY;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADEPLACEMENTCD"),row.getField("GRADE")));
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = decodeGradeCode(_util.coalesce(row.getField("GRADEPLACEMENTCD")));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = null;
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("LASID"),row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("LASID"),row.getField("STUDENT_VENDOR_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENTFIRSTNAMEANON"),row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENTLASTNAMEANON"),row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
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
        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScore(row, testMetadata) {
        var score = {};

        var testNumber = "CLEP_"+ _util.trim(row.getField("EXAM_CODE"))+"_"+_util.trim(row.getField("EXAM_WRDS"));
        var performanceLevel = _util.trim(row.getField("EXAM_EDLVL"));
        var scaleScore = _util.trim(row.getField("EXAM_SCORE"));
        var passed = "No";
        var examCode = _util.trim(row.getField("EXAM_WRDS"));

        if(performanceLevel ==='2'){
            testNumber = testNumber + "_2";
        }



        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === "" ||_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined){
            return null;
        }


        var passNum = null;
        if(decodeExamPassing[examCode]!==undefined && decodeExamPassing[examCode]!==null && performanceLevel ==='2'){
            passNum = decodeExamPassing[examCode];
        }
        else{
            passNum = 50;
        }


        if(passNum!== null && scaleScore >= passNum){
            passed = "Yes";
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_PASSED_INDICATOR"] = passed;
        if(passed === "Yes"){
            score["TEST_PRIMARY_RESULT_CODE"] = "CE";
            score["TEST_PRIMARY_RESULT"] = "Credits Earned";
        }
        else{
            score["TEST_PRIMARY_RESULT_CODE"] = "NCE";
            score["TEST_PRIMARY_RESULT"] = "No Credits Earned";
        }
        if(performanceLevel!==null&&performanceLevel!==undefined&&performanceLevel!==""){
            score["TEST_SECONDARY_RESULT_CODE"]="LVL "+performanceLevel;
            score["TEST_SECONDARY_RESULT"]="Level "+performanceLevel;
        }
        return score;
    }


    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        return score;
    }



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

    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
