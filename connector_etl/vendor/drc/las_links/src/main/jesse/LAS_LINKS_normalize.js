var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LAS_LINKS";
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
            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();
            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");
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

     //Customer only requests certain data at this time 09/03/2020
     //Others remain commented out for future use
    var scoresToMap =
        [
            {TEST: "LASL", CODE:"TOT_LIS", FIELD: "TOTAL_LISTENING_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"TOT_SPK", FIELD: "TOTAL_SPEAKING_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"TOT_RD", FIELD: "TOTAL_READING_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"TOT_WR", FIELD: "TOTAL_WRITING_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"TOT_OVR", FIELD: "TOTAL_OVERALL_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"TOT_COMP", FIELD: "TOTAL_COMPREHENSION_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"TOT_ORAL", FIELD: "TOTAL_ORAL_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"TOT_LIT", FIELD: "TOTAL_LITERACY_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"TOT_PROD", FIELD: "TOTAL_PRODUCTIVE_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "LASL", CODE:"LIS", FIELD: "LISTENING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"OVR", FIELD: "OVERALL_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"RD", FIELD: "READING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"SPK", FIELD: "SPEAKING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"WR", FIELD: "WRITING_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"ORAL", FIELD: "ORAL_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"LIT", FIELD: "LITERACY_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"PROD", FIELD: "PRODUCTIVE_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"COMP", FIELD: "COMPREHENSION_", MAP_FUNCTION: mapStrandScore}
            // NCE - Normal curve equivalent Scores
            ,{TEST: "LASL", CODE:"LIS_NCE", FIELD: "LISTENING_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"OVR_NCE", FIELD: "OVERALL_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"RD_NCE", FIELD: "READING_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"SPK_NCE", FIELD: "SPEAKING_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"WR_NCE", FIELD: "WRITING_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"ORAL_NCE", FIELD: "ORAL_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"LIT_NCE", FIELD: "LITERACY_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"PROD_NCE", FIELD: "PRODUCTIVE_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"COMP_NCE", FIELD: "COMPREHENSION_NORMAL_CURVE_EQUIVALENT_", MAP_FUNCTION: mapStrandScore}
            // PR - percentile rank Scores
            ,{TEST: "LASL", CODE:"LIS_PR", FIELD: "LISTENING_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"OVR_PR", FIELD: "OVERALL_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"RD_PR", FIELD: "READING_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"SPK_PR", FIELD: "SPEAKING_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"WR_PR", FIELD: "WRITING_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"ORAL_PR", FIELD: "ORAL_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"LIT_PR", FIELD: "LITERACY_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"PROD_PR", FIELD: "PRODUCTIVE_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"COMP_PR", FIELD: "COMPREHENSION_PERCENTILE_RANK_", MAP_FUNCTION: mapStrandScore}
            ,{TEST: "LASL", CODE:"", FIELD: "", MAP_FUNCTION: mapCombinedScore}//Multiple tests in one column, decoded in function
        ];


    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     /**
        https://avantassessment.com/stamp4s/benchmark-rubric-guide
     */

    var performanceLevelDecode = {
        "1"     :   "Beginning",
        "Beginning (Level 1)"     :   "Beginning",
        "2"     :   "Early Intermediate",
        "Early Intermediate (Level 2)"     :   "Early Intermediate",
        "3"     :   "Intermediate",
        "Intermediate (Level 3)"     :   "Intermediate",
        "4"     :   "Proficient",
        "Proficient (Level 4)"     :   "Proficient",
        "5"     :   "Above Proficient",
        "Above Proficient (Level 5)"     :   "Above Proficient",
        ""     :   null,
        null     :   null
    };
    var performanceLevelPassDecode = {
        "1"     :   "No",
        "2"     :   "No",
        "3"     :   "Yes",
        "4"     :   "Yes",
        "5"     :   "Yes"
    };
    var performanceReverseDecode = {
        "Beginning (Level 1)"     :   "1",
        "Early Intermediate (Level 2)"     :   "2",
        "Intermediate (Level 3)"     :   "3",
        "Proficient (Level 4)"     :   "4",
        "Above Proficient (Level 5)"     :   "5",
        ""     :   null,
        null     :   null
    };
    var performanceLevelDecodeStrand = {
        "BEGINNING"              :   "Beginning",
        "EARLY INTERMEDIATE"     :   "Early Intermediate",
        "INTERMEDIATE"           :   "Intermediate",
        "PROFICIENT"             :   "Proficient",
        "ABOVE PROFICIENT"      :   "Above Proficient"
    };
    var performanceLevelPassDecodeStrand = {
        "BEGINNING"     :   "No",
        "EARLY INTERMEDIATE"     :   "No",
        "INTERMEDIATE"     :   "Yes",
        "PROFICIENT"     :   "Yes",
        "ABOVE PROFICIENT"     :   "Yes"
    };
    var subjectNameCode = {
        "Comprehension"     :   "COMP",
        "Listening"     :   "LIS",
        "Literacy"     :   "LIT",
        "Mastery"     :   "MAST",
        "Oral"     :   "ORAL",
        "Overall"     :   "OVR",
        "Productive"     :   "PROD",
        "Reading"     :   "RD",
        "Speaking"     :   "SPK",
        "Writing"     :   "WR",
        "Non-Participants"  : "NA"
    }

    var decodeStudentGrade = {
            "1"   : "01"
            ,"01"  : "01"
            ,"2"  : "02"
            ,"02"  : "02"
            ,"3"  : "03"
            ,"03"  : "03"
            ,"4"  : "04"
            ,"04"  : "04"
            ,"5"  : "05"
            ,"05"  : "05"
            ,"6"  : "06"
            ,"06"  : "06"
            ,"7"  : "07"
            ,"07"  : "07"
            ,"8"  : "08"
            ,"08"  : "08"
            ,"9"  : "09"
            ,"09"  : "09"
            ,"10"  : "10"
            ,"11"  : "11"
            ,"12"  : "12"
            ,"K"  : "KG"
            ,"KG"  : "KG"
            ,null  : null
            ,""    : null
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
        function dateConverter(dateString) {
        var dateParts, dateObj, year, month, day;
        // Check for the presence of time and strip it out for initial processing
        var timeIndex = dateString.indexOf(" ");
        if (timeIndex !== -1) {
          dateString = dateString.split(" ")[0];
        }
        // Replace dashes with slashes for consistent processing
        dateString = dateString.replace(/-/g, '/');
        // Handle YYYY/MM/DD or YYYY/DD/MM
        if (dateString.match(/^\d{4}\/\d{2}\/\d{2}$/)) {
          dateParts = dateString.split('/');
          if (dateParts[1] > 12) { // It's in YYYY/DD/MM format
              dateString = dateParts[0] + '/' + dateParts[2] + '/' + dateParts[1];
          }
        }
        // Handle DD/MM/YYYY
        else if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
          dateParts = dateString.split('/');
          if (parseInt(dateParts[0], 10) > 12) {
              dateString = dateParts[1] + '/' + dateParts[0] + '/' + dateParts[2];
          }
        }
        dateObj = new Date(dateString);
        month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
        day = ('0' + dateObj.getDate()).slice(-2);
        year = dateObj.getFullYear();
        var finalDate =  month + '/' + day + '/' + year;
        return { finalDates: finalDate, months: month, days: day, years: year };
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
        var fullName = row.getField("STUDENT_NAME");
        if(fullName!==null && fullName!==undefined){
            var firstName = _util.trim(fullName.split(",")[1]);
            var lastName = fullName.split(",")[0];
            var middleName = null;
        }
        else{
            var firstName = row.getField("FIRST_NAME");
            var lastName = row.getField("LAST_NAME");
            var middleName = row.getField("MIDDLE_NAME");
        }

        if(row.getField("DOB")!==undefined && row.getField("DOB")!== null && row.getField("DOB").toString().indexOf("/")>-1){
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "M/d/yyyy");
        }else if(row.getField("DOB")!==undefined && row.getField("DOB")!== null && row.getField("DOB").toString().indexOf("-")>-1){
            var birthDateObject = AppUtil.getMonthFollowedByDay(row.getField("DOB"));
        }
        else if(row.getField("DOB")!==undefined && row.getField("DOB")!== null && row.getField("DOB").toString().indexOf(",")>-1){
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "MMMM d, yyyy");
        }
        else if(row.getField("DOB")!==undefined && row.getField("DOB")!== null && row.getField("DOB").toString().indexOf("-")>-1){
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "dd-MMM-yy");
        }
         else if(row.getField("DOB")!==undefined && row.getField("DOB")!== null && row.getField("DOB").length === 9){
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "ddMMMyyyy");
        }
        else if(row.getField("DOB")!==undefined && row.getField("DOB")!== null){
            var birthDateObject = AppUtil.getMonthFollowedByDay(row.getField("DOB"));
        }
        else{
            var birthDateObject = {
                 RAW_DATE: null
                 , MONTH: null
                 , DAY: null
                 , YEAR: null
                 , STANDARD_DATE: null
             };
        }
        var studentGenderCode = null;
               var genderCode = row.getField("GENDER");
               if (genderCode != null){
               studentGenderCode = _util.trim(row.getField("GENDER")+"-").substring(0,1).toUpperCase();
               }

        var fileAssessmentDate = row.getField("ASSESSMENT_DATE");
       if(fileAssessmentDate === undefined || fileAssessmentDate === null || fileAssessmentDate === "") {
            var assessmentDate = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9);
       } else {
            var assessmentDate = dateConverter(fileAssessmentDate).finalDates;
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
                    record.TEST_ADMIN_DATE = assessmentDate;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = firstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME = middleName;
                     break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = studentGenderCode;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = decodeStudentGrade[_util.coalesce(row.getField("GRADE"))];
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"),row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL_NAME")
                    );
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
    function mapCompositeScore(row, testMetadata) {
        var score = {};
        if(row.getField("TEST_NAME") === null){
         var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        }else{
        var testNumber = generateTestNumber(row, testMetadata);
        }
        if (testNumber == null) {
            return null;
        }
        var performance = row.getField(testMetadata.FIELD+ "PL");
        var performanceLevel = performanceLevelDecode[performance];
        var passing = performanceLevelPassDecode[performance];

        //Check for key fields and do not map score and exit if conditions met.
        //Do not load if still In Progress
        if(performance === null || performance === undefined || _util.trim(performance) === "--" || _util.trim(performance) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = performance;
        if(!isNaN(performance)){
            score["TEST_SCORE_VALUE"] = performance;
            score["TEST_SCALED_SCORE"] = performance;
        }
    	score["TEST_PRIMARY_RESULT_CODE"] = performance;
    	score["TEST_PRIMARY_RESULT"] = performanceLevel;
    	score["TEST_PASSED_INDICATOR"] = passing;

        return score;
    }

    function mapStrandScore(row, testMetadata, signature) {
        var score = {};
        if(row.getField("TEST_NAME") === null){
         var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        }else{
        var testNumber = generateTestNumber(row, testMetadata);
        }
        if (testNumber == null) {
            return null;
        }
        var scaledScore = row.getField(testMetadata.FIELD +"SCALED_SCORE");
        var performance = row.getField(testMetadata.FIELD +"PL");
        var numCorrect = row.getField(testMetadata.FIELD +"NUMBER_CORRECT");
        var pctCorrect = row.getField(testMetadata.FIELD +"PERCENT_CORRECT");
        var lexile=row.getField("LEXILE_SCORE");

        var siicNCR = _util.coalesce(row.getField("SOCIAL_INTERCULTURAL_AND_INSTRUCTIONAL_COMMUNICATION_NCR"),row.getField(testMetadata.FIELD +"SOCIAL_INTERCULTURAL_AND_INSTRUCTIONAL_COMMUNICATION_NCR"));
        var siicPCT = _util.coalesce(row.getField("SOCIAL_INTERCULTURAL_AND_INSTRUCTIONAL_COMMUNICATION_PCT"),row.getField(testMetadata.FIELD +"SOCIAL_INTERCULTURAL_AND_INSTRUCTIONAL_COMMUNICATION_PCT"));
        var lassNCR = _util.coalesce(row.getField("LANGUAGE_ARTS_SOCIAL_STUDIES_HISTORY_NCR"),row.getField(testMetadata.FIELD +"LANGUAGE_ARTS_SOCIAL_STUDIES_HISTORY_NCR"));
        var lassPCT = _util.coalesce(row.getField("LANGUAGE_ARTS_SOCIAL_STUDIES_HISTORY_PCT"),row.getField(testMetadata.FIELD +"LANGUAGE_ARTS_SOCIAL_STUDIES_HISTORY_PCT"));
        var mstNCR =  _util.coalesce(row.getField("MATHEMATICS_SCIENCE_TECHNICAL_SUBJECTS_NCR"),row.getField(testMetadata.FIELD +"MATHEMATICS_SCIENCE_TECHNICAL_SUBJECTS_NCR"));
        var mstPCT =  _util.coalesce(row.getField("MATHEMATICS_SCIENCE_TECHNICAL_SUBJECTS_PCT"),row.getField(testMetadata.FIELD +"MATHEMATICS_SCIENCE_TECHNICAL_SUBJECTS_PCT"));
        var acaNCR = _util.coalesce(row.getField("ACADEMIC_NCR"),row.getField(testMetadata.FIELD +"ACADEMIC_NCR"));
        var acaPCT = _util.coalesce(row.getField("ACADEMIC_PCT"),row.getField(testMetadata.FIELD +"ACADEMIC_PCT"));

        if(signature.getFormat().getFormatName() === "LAS LINKS_178_1_COLS"){
            var performanceLevel = performanceLevelDecode[performance];
            var passing = performanceLevelPassDecode[performance];
        }else{
            var performanceLevel = performanceLevelDecodeStrand[performance];
            var passing = performanceLevelPassDecodeStrand[performance];
        }

        //Check for key fields and do not map score and exit if conditions met.
        //Do not load if still In Progress
        if(scaledScore === null || scaledScore === undefined || _util.trim(scaledScore) === "--" || _util.trim(scaledScore) === "") {
            return null;
        }

        //For Reading
        if(testMetadata.FIELD==="READING_"){
            var foundNCR = row.getField("FOUNDATIONAL_NCR");
            var foundPCT = row.getField("FOUNDATIONAL_PCT");
            score["TEST_GROWTH_RESULT_CODE"] = foundNCR;
            score["TEST_GROWTH_RESULT"] = foundPCT;
        }else{
        if (testMetadata.FIELD==="WRITING_"){
             var foundNCR1 = row.getField(testMetadata.FIELD +"FOUNDATIONAL_NCR");
             var foundPCT2 = row.getField(testMetadata.FIELD +"FOUNDATIONAL_PCT");
             score["TEST_GROWTH_RESULT_CODE"] = foundNCR1;
             score["TEST_GROWTH_RESULT"] = foundPCT2;
             }
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }

    	score["TEST_PRIMARY_RESULT"] = performanceLevel;
    	score["TEST_PRIMARY_RESULT_CODE"] = performance;
    	score["TEST_PASSED_INDICATOR"] = passing;
    	score["TEST_ITEMS_ATTEMPTED"] = numCorrect;
    	score["TEST_PERCENTAGE_SCORE"] = pctCorrect;

    	score["TEST_SECONDARY_RESULT_CODE"] = siicNCR;
    	score["TEST_SECONDARY_RESULT"] = siicPCT;
    	score["TEST_TERTIARY_RESULT_CODE"] = lassNCR;
    	score["TEST_TERTIARY_RESULT"] = lassPCT;
        score["TEST_QUATERNARY_RESULT_CODE"] = mstNCR;
    	score["TEST_QUATERNARY_RESULT"] = mstPCT;
        score["TEST_CUSTOM_RESULT_CODE"] = acaNCR;
    	score["TEST_CUSTOM_RESULT"] = acaPCT;
    	score["TEST_READING_LEVEL"] = lexile;

        return score;
    }

    function mapCombinedScore(row, testMetadata) {
        var score = {};
        if(row.getField("PLD") === undefined || row.getField("PLD") === null || row.getField("PLD") === "" ){
        return null;
        }

        if(row.getField("TEST_NAME") === null){
         var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        }else{
        var testNumber = generateTestNumber(row, testMetadata);
        }
        if (testNumber == null) {
            return null;
        }
        var performanceDescription = row.getField("PLD");
        var performanceLevel = performanceLevelDecode[performanceDescription];
        var performanceNumber = performanceReverseDecode[performanceDescription];
        var passing = row.getField("MASTERY");
        if(passing==="1"){
            passing = "Yes";
        }
        else{
            passing = "No";
        }
        var scaledScore = row.getField("SCALED_SCORE");
        var target = row.getField("NEXT_TARGET");

        //Check for key fields and do not map score and exit if conditions met.
        //Do not load if still In Progress
        if(passing === null || passing === undefined || _util.trim(passing) === "--") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
    	score["TEST_PASSED_INDICATOR"] = passing;
        score["TEST_SCORE_TEXT"] = performanceDescription;


        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = performanceNumber;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
    	score["TEST_PRIMARY_RESULT_CODE"] = performanceNumber;
    	score["TEST_PRIMARY_RESULT"] = performanceLevel;
    	if(!isNaN(target)){
    	score["TEST_GROWTH_TARGET_1"] = target;
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

        //Signature specific admin key
        if(signature.getFormat().getFormatName() === 'LASLINKS_45_COLS'){
            var fileAssessmentDate = srcRecord.getField("ASSESSMENT_DATE");
            if(fileAssessmentDate === undefined || fileAssessmentDate === null || fileAssessmentDate === "") {
                var assessmentDate = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9);
            } else {
                var assessmentDate = dateConverter(fileAssessmentDate).finalDates;
            }
            assessmentAdminKey = assessmentAdminKey + "_" + assessmentDate;
        }

        if(signature.getFormat().getFormatName() !== 'LASLINKS_2223_36_COLS' && signature.getFormat().getFormatName() !== 'LASLINKS_2223_99_COLS' && signature.getFormat().getFormatName() !== 'LASLINKS_45_COLS' ){
        if(JSON.stringify(srcRecord).indexOf("PRODUCTIVE_")>-1){
            assessmentAdminKey = assessmentAdminKey + "_COMPOSITE";
        }
        else if(JSON.stringify(srcRecord).indexOf("SPEAKING_")>-1){
            assessmentAdminKey = assessmentAdminKey + "_SPEAKING";
        }
        else if(JSON.stringify(srcRecord).indexOf("OVERALL_")>-1){
            assessmentAdminKey = assessmentAdminKey + "_OVERALL";
        }
        else if(JSON.stringify(srcRecord).indexOf("READING_")>-1){
            assessmentAdminKey = assessmentAdminKey + "_READING";
        }
        else if(JSON.stringify(srcRecord).indexOf("LISTENING_")>-1){
            assessmentAdminKey = assessmentAdminKey + "_LISTENING";
        }
        else if(JSON.stringify(srcRecord).indexOf("WRITING_")>-1){
            assessmentAdminKey = assessmentAdminKey + "_WRITING";
        }
        else if(srcRecord.getField("MASTERY")!==undefined){
            //key is set
        }
        else {
            assessmentAdminKey = assessmentAdminKey + "_NA";
        }
        }

        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
         if(row.getField("MASTERY")!==undefined) {
            const subjectCode = subjectNameCode[row.getField("TEST_NAME")];
            if (subjectCode === "NA") {
                return null;
            }
            testNumber = testNumber + subjectCode;
        }

        return testNumber;

    }

    return module;
}());