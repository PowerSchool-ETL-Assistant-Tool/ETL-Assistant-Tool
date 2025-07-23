var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IAM";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
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
            //Overall Scores
            {TEST: "IAM", CODE: "OVR", FIELD:"OVERALL", MAP_FUNCTION: mapOverallScore},
            //Reporting Scores
            {TEST: "IAM", CODE: "RPT", FIELD:"REPORTING", MAP_FUNCTION: mapReportingScore},
            // Biology Subject Scores
            {TEST: "IAM", CODE: "BIO", FIELD:"BIOLOGY", MAP_FUNCTION: mapOverallScore},
            {TEST: "IAM", CODE: "MT", FIELD:"ANALYZING_DATA_AND_MATHEMATICAL_THINKING", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "CUE", FIELD:"COMMUNICATING_EXPLANATIONS_AND_EVALUATING_CLAIMS_USING_EVIDENCE", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "SF", FIELD:"DEVELOPING_AND_USING_MODELING_TO_DESCRIBE_STRUCTURE_AND_FUNCTION", MAP_FUNCTION: mapSubjectScore},
            //English Subject
            {TEST: "IAM", CODE: "ELA", FIELD:"ENGLISH_LANGUAGE_ARTS", MAP_FUNCTION: mapOverallScore},
            {TEST: "IAM", CODE: "SV", FIELD:"KEY_IDEAS_AND_TEXTUAL_SUPPORT_VOCABULARY", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "RF", FIELD:"READING_FOUNDATIONS", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "IML", FIELD:"STRUCTURAL_ELEMENTS_AND_ORGANIZATION_CONNECTION_OF_IDEAS_MEDIA_LITERACY", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "WR", FIELD:"WRITING", MAP_FUNCTION: mapSubjectScore},
            //Maths Scores
            {TEST: "IAM", CODE: "MAT", FIELD:"MATHS", MAP_FUNCTION: mapOverallScore},
            {TEST: "IAM", CODE: "DA", FIELD:"ALGEBRAIC_THINKING_AND_DATA_ANALYSIS", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "COM", FIELD:"COMPUTATION", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "GM", FIELD:"GEOMETRY_AND_MEASUREMENT", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "NS", FIELD:"NUMBER_SENSE", MAP_FUNCTION: mapSubjectScore},
            // Science Scores
            {TEST: "IAM", CODE: "SCI", FIELD:"SCIENCE", MAP_FUNCTION: mapOverallScore},
            {TEST: "IAM", CODE: "CT", FIELD:"ANALYZING_INTERPRETING_AND_COMPUTATIONAL_THINKING", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "RC", FIELD:"EXPLAINING_SOLUTIONS_REASONING_AND_COMMUNICATING", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "INV", FIELD:"INVESTIGATING", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "QM", FIELD:"QUESTIONING_AND_MODELING", MAP_FUNCTION: mapSubjectScore},
             // Social Scores
            {TEST: "IAM", CODE: "SOC", FIELD:"SOCIAL", MAP_FUNCTION: mapOverallScore},
            {TEST: "IAM", CODE: "GH", FIELD:"CIVICS_AND_GOVERNMENT_HISTORY", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "ECO", FIELD:"ECONOMICS", MAP_FUNCTION: mapSubjectScore},
            {TEST: "IAM", CODE: "GEO", FIELD:"GEOGRAPHY", MAP_FUNCTION: mapSubjectScore}
        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KG"	: "KG"
        , "01"	: "01"
        ,"Level 1": "01"
        ,"1"	: "01"
        ,"02"	: "02"
        ,"Level 2": "02"
        ,"2"	: "02"
        ,"03"	: "03"
        ,"Level 3": "03"
        ,"3"	: "03"
        ,"04"	: "04"
        ,"Level 4"	: "04"
        ,"4"	: "04"
        ,"05"	: "05"
        ,"Level 5"	: "05"
        ,"5"	: "05"
        ,"06"	: "06"
        ,"Level 6"	: "06"
        ,"6"	: "06"
        ,"07"	: "07"
        ,"Level 7"	: "07"
        ,"7"	: "07"
        ,"08"	: "08"
        ,"Level 8"	: "08"
        ,"8"	: "08"
        ,"09"	: "09"
        ,"Level 9"	: "09"
        ,"9"	: "09"
        ,"10"	: "10"
        ,"Level 10"	: "10"
        ,"10"	: "10"
        ,"11"	: "11"
        ,"Level 11"	: "11"
        ,"11"	: "11"
        ,"12"	: "12"
        ,"Level 12"	: "12"
        ,"12"	: "12"
    };

    var decodePerformanceLevel = {
        "Did Not Pass"	: "No"
        ,"Pass": "Yes"
        ,"Undetermmind"	: "--"
    };

    var decodeProficiencyLevel = {
        "Below Proficiency"	: "No"
        ,"At Proficiency": "Yes"
        ,"Approaching Proficiency"	: "No"
        ,"Above Proficiency"	: "Yes"
        ,"N/A": "--"
        ,"NMC"	: "--"
        ,"" : "--"
        ,"Level 1" : "No"
        ,"Level 2" : "No"
        ,"Level 3" : "Yes"
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

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            var score = {};
            if (testMetadata.CODE !== "RPT") {
                score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } else {
                for (let i=1; i<=7; i++ ) {
                    score = (testMetadata.MAP_FUNCTION)(row, testMetadata, i);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                }
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
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateObject = parseDate(row.getField("STUDENT_DOB"), signature);
        var localID = row.getField("SCHOOL_LOCAL_ID");
        if(localID){
           if(localID !==null && localID.toString().indexOf("_")>-1){
               localID = localID.toString().split("_")[1];
           }
        } else {
          var local_name = row.getField("SCHOOL_NAME");
          var insideParentheses = local_name.match(/\(([^)]+)\)/)[1];
          var outsideParentheses = local_name.replace(/\([^)]+\)/, '');

        }
        var studentFullName = row.getField("STUDENT_FULL_NAME");
        if(studentFullName && studentFullName.length > -1){
            var firstName = studentFullName.toString().split(", ")[1];
            var lastName = studentFullName.toString().split(", ")[0];
        }

        var testDate = row.getField("TEST_DATE");
        if(testDate!==null && testDate!==undefined){
            testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
        }
        else{
            testDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
        }

        function getTEST_ADMIN_PERIOD(row,hierarchy) {
            var testAdminPeriod = "";
            var fileName = row.getRawField("LINEAGE_FILE");
            var testDate = row.getField("TEST_DATE");
             if(testDate !== null){
            testDate =  AppUtil.getMonthFollowedByDay(row.getField("TEST_DATE")).STANDARD_DATE;
            }
                if (fileName.indexOf("WINTER") > -1|| fileName.indexOf("Winter") > -1) {
                   testAdminPeriod = "Winter";
                } else if (fileName.indexOf("SPRING") > -1 || fileName.indexOf("Spring") > -1) {
                   testAdminPeriod = "Spring";
                } else if (fileName.indexOf("FALL") > -1|| fileName.indexOf("Fall") > -1) {
                   testAdminPeriod = "Fall";
                }else if (testDate !== null && testDate !== undefined && testDate !== '' ) {
                    var month = testDate.substring(0,2);
                    if (month === "07" || month === "08" || month === "09" || month === "10")
                        testAdminPeriod = "Fall";
                    else if (month === "11" || month === "12" || month === "01" || month === "02")
                        testAdminPeriod = "Winter";
                    else if (month === "03" || month === "04" || month === "05" || month === "06")
                        testAdminPeriod = "Spring";
               }else{
                testAdminPeriod = hierarchy.REPORTING_PERIOD;
            }
            return testAdminPeriod;
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
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(row,hierarchy);
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = null;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //School Info
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(localID, insideParentheses);
                    break;
               // case "SCHOOL_STATE_ID":
                    //record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"));
                    //break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(localID, insideParentheses);
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(outsideParentheses, row.getField("SCHOOL_NAME"));
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDate;
                    break;
                //Student Info
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
                    record.STUDENT_GRADE_CODE = gradeLookup[_util.coalesce(row.getField("STUDENT_GRADE_CODE"))];
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("STUDENT_STATE_ID");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"), firstName);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"), lastName);
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("STUDENT_STATE_ID");
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

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapOverallScore(row, testMetadata) {

        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);

        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var proficiency = _util.coalesce(row.getField(testMetadata.FIELD + "_PROFICIENCY_LEVEL"), row.getField(testMetadata.FIELD + "_PERFORMANCE"));
        var performanceLevel =  row.getField("PASSING_STATUS");

        var readinessIndicator = row.getField("CAREER_READINESS_INDICATOR");

        var lexile = row.getField("LEXILE_MEASURE");

        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === ""
         ||  _util.trim(scaleScore) === "Undetermined" || _util.trim(scaleScore) === "NMC" || _util.trim(scaleScore) === "E"
         || _util.trim(scaleScore) === "Invalidated" || _util.trim(scaleScore) === "N/A") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }

        score["TEST_PRIMARY_RESULT"] = proficiency;
        score["TEST_PASSED_INDICATOR"] = _util.coalesce(decodePerformanceLevel[performanceLevel], decodeProficiencyLevel[proficiency]);

        //Proficiency Levels
        score["TEST_SECONDARY_RESULT"] = performanceLevel;
        //Readiness
        score["TEST_TERTIARY_RESULT"] = readinessIndicator;
        //Lexiles
        score["TEST_QUATERNARY_RESULT"] = lexile;

        return score;
    }

    function mapSubjectScore(row, testMetadata) {

        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);

        var PercentScore = row.getField(testMetadata.FIELD + "_PERCENT_CORRECT");


        if(_util.trim(PercentScore) === null || _util.trim(PercentScore) === undefined || _util.trim(PercentScore) === "" || _util.trim(PercentScore) === "E"
        || _util.trim(PercentScore) === "NMC" || _util.trim(PercentScore) === "Invalidated" ||  _util.trim(PercentScore) === "N/A") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_PERCENTAGE_SCORE"] = PercentScore;
        return score;
    }

    function mapReportingScore(row, testMetadata, i) {

        var score = {};

        var testNumber = generateTestNumber(row, testMetadata) + i;

        var scaleScore = row.getField(testMetadata.FIELD + "_CATEGORY_" + i + "_SCORE" );
        var percentScore = row.getField(testMetadata.FIELD + "_CATEGORY_" + i + "_PERCENT_CORRECT" );
        var performanceLevel = row.getField(testMetadata.FIELD + "_CATEGORY_" + i + "_PERFORMANCE" );

        if((_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "Undetermined")
           && (_util.trim(percentScore) === null || _util.trim(percentScore) === undefined || _util.trim(percentScore) === "" || _util.trim(percentScore) === "Undetermined")
           && (_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === "" || _util.trim(performanceLevel) === "Undetermined")) {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (!isNaN(percentScore)) {
            score["TEST_PERCENTAGE_SCORE"] = percentScore;
        }

        score["TEST_PRIMARY_RESULT"] = performanceLevel;
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
        var subject = getSubject(srcRecord);
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE
            + "_" + subject;
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {
        var testNumber = null;
        var subject = getSubject(row);
        testNumber = testMetadata.TEST + gradeLookup[row.getField("STUDENT_GRADE_CODE")] + subject + testMetadata.CODE;
        return testNumber;
    }

    function getSubject(row) {
         var subject = row.getField("TEST_NAME");
         if(subject){
            if (subject.indexOf('English') > -1) {
                   subject = 'ELA';
             } else if (subject.indexOf('Mathematics') > -1) {
                   subject = 'MA';
             } else if (subject.indexOf('Science') > -1) {
                   subject = 'SCI';
             } else if (subject.indexOf('Biology') > -1) {
                   subject = 'BIO';
             } else if (subject.indexOf('Social Studies') > -1) {
                   subject = 'SOSCI';
             }
         } else {
            var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
                if (fileName.indexOf('ENGLISH') > -1) {
                    subject = 'ELA';
                } else if (fileName.indexOf('MATHEMATICS') > -1) {
                    subject = 'MA';
                } else if (fileName.indexOf('SCIENCE') > -1) {
                    subject = 'SCI';
                } else if (fileName.indexOf('BIOLOGY') > -1) {
                     subject = 'BIO';
                } else if (fileName.indexOf('SOCIALSTUDIES') > -1) {
                     subject = 'SOC';
                }
            }
         return subject;
    }

    function parseDate(rawDate, signature) {

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        var formatter;
        var signatureFormatName = signature.getFormat().getFormatName();

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if (rawDate.length() > 8 && rawDate.indexOf('/') > -1 && signatureFormatName === "IAM") {
           formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
        } else if (rawDate.toString().substring(0, 3).search("/") >= 0 && rawDate.split("/")[2].length === 4) {
           formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if (rawDate.length() >= 8) {
           formatter = new java.text.SimpleDateFormat("MMddyyyy");
        }else if (rawDate.length() >= 7) {
                    formatter = new java.text.SimpleDateFormat("Mddyyyy");
        }else if (rawDate.length() > 8 && rawDate.indexOf('-') > -1 && signatureFormatName === "IAM"){
           formatter = new java.text.SimpleDateFormat("dd-MM-yyyy");
        } else {
           formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
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

    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
