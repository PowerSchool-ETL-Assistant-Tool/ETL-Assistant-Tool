var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AVRSB";
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
                .group_by("ADMINISTRATION GROUPING" , function(one, two){

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
                        if(!multipleRowsPerGroupingExpected && rows.length > 1){

                            //Report error for each row
                            rows.forEach(function(row){
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"],
                    function(output, rows) {
                        try{

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function(record){
                                output.RECORDS.put(record);
                            });

                        } catch(exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }


                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        // Report when no scores are found.
                        if(mappingObject.SCORE_MAPPINGS.length === 0){
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
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

     //TODO update scoresToMap
    var scoresToMap = [
        {TEST: "AVRSB", CODE: "TOT_RD", FIELD: "READING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "AVRSB", CODE: "TOT_WR", FIELD: "WRITING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "AVRSB", CODE: "TOT", FIELD: "MATHEMATICS", MAP_FUNCTION: mapScaledScore}

        //Strands for ENGLISH and LITRACY
        ,{TEST: "AVRSB", CODE: "INFO_TXT", FIELD: "INFORMATION_TEXT", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "NARR", FIELD: "NARRATIVE", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "VIS_MED_TXT", FIELD: "VISUAL_MEDIA_TEXT", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "POE", FIELD: "POETRY", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "LIT_COMP", FIELD: "LITERAL_COMPREHENSION", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "NON_LIT_COMP", FIELD: "NON_LITERAL_COMPREHENSION", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "WRI_IDE", FIELD: "WRITING_IDEAS", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "WRI_ORG", FIELD: "WRITING_ORGANIZATION", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "WRI_CONV", FIELD: "WRITING_CONVENTIONS", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "WRI_LANG", FIELD: "WRITING_LANGUAGE_USE", MAP_FUNCTION: mapStrandPerformanceLevel}

        //Strands for Mathematics
        ,{TEST: "AVRSB", CODE: "NUM", FIELD: "NUMBERS", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "PATT", FIELD: "PATTERN", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "MEAS", FIELD: "MEASURE", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "GEOM", FIELD: "GEOMETRY", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "STATS", FIELD: "STATISTICS", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "KNOWLEDGE", FIELD: "KNOWLEDGE", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "APPLICATION", FIELD: "APPLICATION", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "ALG", FIELD: "ALGEBRA", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "FUNC", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStrandPerformanceLevel}
        ,{TEST: "AVRSB", CODE: "FINAN", FIELD: "FINANCIAL", MAP_FUNCTION: mapStrandPerformanceLevel}

        //Strands for both
        ,{TEST: "AVRSB", CODE: "ANALYSIS", FIELD: "ANALYSIS", MAP_FUNCTION: mapStrandPerformanceLevel} //TODO in mapStrandPerformanceLevel add a special case for if(testMetadata.CODE) === "ANAYLISIS" then concat "_MA" or "_ELA" to the testNumber
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes

    var primaryDecode = {
       "Adv" : "Advanced"
       , "Advanced" : "Advanced"
       ,"Bas" : "Basic"
       ,"Basic" : "Basic"
       ,"Bel" : "Below Basic"
       ,"Below Basic" : "Below Basic"
       ,"Pro" : "Proficient"
       ,"Proficient" : "Proficient"
       ,"" : null
       ,null : null
      };

    var passDecode = {
       "Adv" : "Yes"
       ,"Advanced" : "Yes"
       ,"Bas" : "No"
       ,"Basic" : "No"
       ,"Bel" : "No"
       ,"Below Basic" : "No"
       ,"Pro" : "Yes"
       ,"Proficient" : "Yes"
       ,"" : null
       ,null : null
      };

      var performanceLevelDecode = {
          "Level 1" : {DESC:  "Does Not Meet Expectations" , PASS_IND: "No"}
          ,"Level 2" : {DESC: "Does Not Meet Expectations" ,  PASS_IND: "No"}
          ,"Level 3" : {DESC: "Meeting expectations" ,  PASS_IND: "Yes"}
          ,"Level 4" : {DESC: "Meeting expectations" ,  PASS_IND: "Yes"}
          ,"Did not Participate" : {DESC: null ,  PASS_IND: null}
          ,"Not Enough Evidence" : {DESC: null ,  PASS_IND: null}
          ,"" : {DESC: null ,  PASS_IND: ""}
          ,null : {DESC: null ,  PASS_IND: null}
          ,undefined  : {DESC: null , PASS_IND: null}
      };
      
      var strandPerformance = {
          "at or above" : "AOA"
          ,"may need attention" : "MNA"
          ,"" : ""
          ,null : null
           ,undefined  : null
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
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));            }
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
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }

        var birthDate = _util.coalesce(row.getField("BIRTH_DATE"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }
        if (_util.trim(row.getField("GENDER")+"-").substring(0,1).toUpperCase() == 'X'){
            gender = null
        }
        else{
            gender = _util.trim(row.getField("GENDER")+"-").substring(0,1);
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
                    record.TEST_ADMIN_DATE = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
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
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME').replace(/"/g, '').replace(/\s+/g, '-');
                    //.replace(/[^a-zA-Z0-9]/g, '');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = gender;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = getGradeFromFilename(row);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                 case "SCHOOL_NAME":
                      record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
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
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var program = row.getField("PROGRAM");
        var grade = getGradeFromFilename(row);
        // Include FIELD in the test number to make it unique
        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "_" + "SCALE_SCORE");
        var performanceLevel = row.getField(testMetadata.FIELD + "_" +"PERFORMANCE_LEVEL");

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (performanceLevel === null || performanceLevel === "Not Enough Evidence" || performanceLevel === "Did not Participate" || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === "")){

            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[performanceLevel].PASS_IND;
        score["TEST_SCORE_ATTRIBUTES"] = program;
        return score;
    }

    function mapStrandPerformanceLevel(row, testMetadata, signature) {
        var score = {};
        var grade = getGradeFromFilename(row);
        var prefLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");

        if (prefLevel === null || prefLevel === undefined || prefLevel === "" || _util.trim(prefLevel) === "--") {
            return null;
        }

        // Set test number
        var testNumber = generateTestNumber(row, testMetadata);
        if (testMetadata.CODE === "ANALYSIS") {
            if (signature.getFormat().getFormatName() === 'LITERACY_COL_32') {
                testNumber = testMetadata.TEST + '_ELA_' + testMetadata.CODE + '_' + grade;
            } else if (signature.getFormat().getFormatName() === 'MATH_COL_32') {
                testNumber = testMetadata.TEST + '_MATH_' + testMetadata.CODE + '_' + grade;
            }
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = prefLevel;
        score["TEST_PRIMARY_RESULT"] = (performanceLevelDecode[prefLevel] && performanceLevelDecode[prefLevel].DESC)
                                           ? performanceLevelDecode[prefLevel].DESC
                                           : prefLevel;
        score["TEST_PASSED_INDICATOR"] = (performanceLevelDecode[prefLevel] && performanceLevelDecode[prefLevel].PASS_IND)
                                            ? performanceLevelDecode[prefLevel].PASS_IND
                                            : null;

        return score;
    }
//    function mapStrandPerformanceLevel(row, testMetadata,signature){
//         var score = {};
//         var grade = getGradeFromFilename(row);
//         if(testMetadata.CODE === "ANALYSIS" && signature.getFormat().getFormatName() === 'LITERACY_COL_32'){
//               var testNumber = testMetadata.TEST + '_' + 'ELA_' + testMetadata.CODE + '_' + grade;
//         }else if(testMetadata.CODE === "ANALYSIS" && signature.getFormat().getFormatName() === 'MATH_COL_32'){
//              var testNumber = testMetadata.TEST  + '_' + 'MATH_' + testMetadata.CODE + '_' + grade;
//         }
//         else{
//         // Include FIELD in the test number to make it unique
//         var testNumber = generateTestNumber(row, testMetadata);
//         }
//         var prefLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
//
//         // Check for key fields and do not map score and exit if conditions met.
//         if( prefLevel === null || prefLevel === undefined || prefLevel === "" || _util.trim(prefLevel) === "--" ) {
//            return null;
//         }
//         // Set score fields
//         score["TEST_NUMBER"] = testNumber;
//         score["TEST_PRIMARY_RESULT_CODE"] = strandPerformance[prefLevel];
//         score["TEST_PRIMARY_RESULT"] = prefLevel;
//         return score;
//    }




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

    function getGradeFromFilename(row) {
        var grade = null;
        var rowGrade = row.getRawField("LINEAGE_FILE").toString().toUpperCase();

        if (
            rowGrade.indexOf("GRADE3") > -1 || rowGrade.indexOf("GRADE_3") > -1 || rowGrade.indexOf("GRADE-3") > -1 || rowGrade.indexOf("GRADE 3") > -1 || rowGrade.indexOf("GRADE%203") > -1 ||
            rowGrade.indexOf("ENGLISH3") > -1 || rowGrade.indexOf("ENGLISH 3") > -1 || rowGrade.indexOf("ENGLISH_3") > -1 || rowGrade.indexOf("ENGLISH-3") > -1 || rowGrade.indexOf("ENGLISH%203") > -1 ||
            rowGrade.indexOf("MATH3") > -1 || rowGrade.indexOf("MATH 3") > -1 || rowGrade.indexOf("MATH_3") > -1 || rowGrade.indexOf("MATH-3") > -1 || rowGrade.indexOf("MATH%203") > -1
        ) {
            grade = "03";
        } else if (
            rowGrade.indexOf("GRADE6") > -1 || rowGrade.indexOf("GRADE_6") > -1 || rowGrade.indexOf("GRADE-6") > -1 || rowGrade.indexOf("GRADE 6") > -1 || rowGrade.indexOf("GRADE%206") > -1 ||
            rowGrade.indexOf("ENGLISH6") > -1 || rowGrade.indexOf("ENGLISH 6") > -1 || rowGrade.indexOf("ENGLISH_6") > -1 || rowGrade.indexOf("ENGLISH-6") > -1 || rowGrade.indexOf("ENGLISH%206") > -1 ||
            rowGrade.indexOf("MATH6") > -1 || rowGrade.indexOf("MATH 6") > -1 || rowGrade.indexOf("MATH_6") > -1 || rowGrade.indexOf("MATH-6") > -1 || rowGrade.indexOf("MATH%206") > -1
        ) {
            grade = "06";
        } else if (
            rowGrade.indexOf("GRADE8") > -1 || rowGrade.indexOf("GRADE_8") > -1 || rowGrade.indexOf("GRADE-8") > -1 || rowGrade.indexOf("GRADE 8") > -1 || rowGrade.indexOf("GRADE%208") > -1 ||
            rowGrade.indexOf("ENGLISH8") > -1 || rowGrade.indexOf("ENGLISH 8") > -1 || rowGrade.indexOf("ENGLISH_8") > -1 || rowGrade.indexOf("ENGLISH-8") > -1 || rowGrade.indexOf("ENGLISH%208") > -1 ||
            rowGrade.indexOf("MATH8") > -1 || rowGrade.indexOf("MATH 8") > -1 || rowGrade.indexOf("MATH_8") > -1 || rowGrade.indexOf("MATH-8") > -1 || rowGrade.indexOf("MATH%208") > -1
        ) {
            grade = "08";
        } else if (
            rowGrade.indexOf("GRADE10") > -1 || rowGrade.indexOf("GRADE_10") > -1 || rowGrade.indexOf("GRADE-10") > -1 || rowGrade.indexOf("GRADE 10") > -1 || rowGrade.indexOf("GRADE%2010") > -1 ||
            rowGrade.indexOf("ENGLISH10") > -1 || rowGrade.indexOf("ENGLISH 10") > -1 || rowGrade.indexOf("ENGLISH_10") > -1 || rowGrade.indexOf("ENGLISH-10") > -1 || rowGrade.indexOf("ENGLISH%2010") > -1 ||
            rowGrade.indexOf("MATH10") > -1 || rowGrade.indexOf("MATH 10") > -1 || rowGrade.indexOf("MATH_10") > -1 || rowGrade.indexOf("MATH-10") > -1 || rowGrade.indexOf("MATH%2010") > -1
        ) {
            grade = "10";
        }

        return grade;
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

        var subject = getSubjectName(srcRecord);
        if(subject !== null && subject !== undefined && subject !== ""){
            assessmentAdminKey = assessmentAdminKey + "_" + subject;
        }



        // Add grade number
        var grade = getGradeFromFilename(srcRecord);
        if (grade)
        {
            assessmentAdminKey = assessmentAdminKey + "_" + grade;
        }
        assessmentAdminKey = assessmentAdminKey.replace(/"/g, '').replace(/\s+/g, '-')
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    function getSubjectName(row, isTestNumber = false) {
        var fileName = row.getRawField("LINEAGE_FILE").toString().replace(/%20|\d+/g, " ").toUpperCase();// //.replace(/%20/g, " ").replace(/\d+/g, "")
        var sub = null;

        if (fileName.indexOf('NSE MATH') > -1 || fileName.indexOf('NSE_MATH') > -1) return "NSE_MATH";
        if (fileName.indexOf('NSE ENGLISH') > -1 || fileName.indexOf('NSE_ENGLISH') > -1) return "NSE_ENGLISH";
        if (fileName.indexOf('READING AND WRITING') > -1 || fileName.indexOf('READING_AND_WRITING') > -1 ||
            fileName.indexOf('READING-WRITING') > -1 || fileName.indexOf('READING_WRITING') > -1) {
            return "READING_WRITING";
        }
        if (fileName.indexOf('LITERACY') > -1) return "LITERACY";
        if (fileName.indexOf('ENGLISH') > -1) return "ENGLISH";
        if (fileName.indexOf('MATH') > -1) return "MATH";

        return null;
    }
//    function getSubjectName(row, isTestNumber = false) {
//        var fileName = row.getRawField("LINEAGE_FILE").toString().replaceAll('%20'," ");
//        var sub = null;
//        if(fileName.indexOf('English') > -1 || fileName.indexOf('ENGLISH') > -1 || fileName.indexOf('ENG') > -1 ){
//            sub = "ELA";
//        }
//        if(fileName.indexOf('Literacy') > -1 || fileName.indexOf('Literacy') > -1 || fileName.indexOf('LITRACY') > -1 || fileName.indexOf('LITERACY') > -1){
//            sub = "ELA";
//        }
//        if(fileName.indexOf('Reading and Writing') > -1 || fileName.indexOf('Reading_and_Writing') > -1 || fileName.indexOf('Reading-and-Writing') > -1 || fileName.indexOf('Reading_Writing') > -1){
//            sub = "ELA";
//        }
//        if ((fileName.indexOf('Mathematics') > -1) || (fileName.indexOf('Math') > -1) || (fileName.indexOf('NSE Math') > -1)) {
//           sub = "MATH";
//        }
//        return sub;
//    }

    function generateTestNumber(row, testMetadata) {

        var sub = getSubjectName(row);
        var grade = getGradeFromFilename(row);
        var testNumber = testMetadata.TEST

        if(sub !== null && sub !== undefined && sub !== ""){
             testNumber = testNumber + '_' + sub + "_" + testMetadata.CODE + "_" + grade;
        } else {
            testNumber = testNumber + '_' + testMetadata.CODE + "_" + grade;
        }
         return testNumber;
     }

    return module;
    }());
