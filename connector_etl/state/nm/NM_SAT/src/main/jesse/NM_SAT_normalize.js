var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NM_SAT";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false; // Potentially true?  Requires further live testing.


    /*
        Assessment-Specific Global Variables
    */
    var assessmentMap = new java.util.concurrent.ConcurrentHashMap();

    /** Java classes **/
    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
    const BufferedReader = Java.type("java.io.BufferedReader");
    const InputStreamReader = Java.type('java.io.InputStreamReader');
    const CSVWriter = Java.type("com.opencsv.CSVWriter");
    const FileWriter = Java.type("java.io.FileWriter");
    const File = Java.type("java.io.File");

    const SignatureFormatType = {
        DELIMITED: 'class com.versifit.fileDetector.recordFormat.DelimitedRecordFormat',
        FIXED_LENGTH: 'class com.versifit.fileDetector.recordFormat.FixedWidthRecordFormat'
    };

    /**
     * This function will convert the source file given into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {

            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const records = getRecords(file, signature);
            const ADMIN_VALUES = 'LATEST, ADMIN2, ADMIN3, ADMIN4, ADMIN5, ADMIN6'.split(', ');

            print("\nLoading using signature file ${signature.getFormat().getFormatName()}\n");

            let normalizedFile = AppUtil.createResultsFile(file);

            print("\nNormalized file: ${normalizedFile}");

            let normalizedRows = [], normalizedRecords = [];

            records.forEach((record) => {
                try {
                    ADMIN_VALUES.forEach((adminVal) => {
                        mapNormalizedRecords(signature, hierarchy, [record], adminVal, file)
                            .forEach((normalizedRecord) => {
                                normalizedRows.push(normalizedRecord);
                            });
                    });
                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", record.LINEAGE_LINE, "mapNormalizedRecords error: ${exception}", JSON.stringify(record)));
                }
            });

            normalizedRows.forEach((row) => {
                try {
                    const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    if (mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found or No scores for historical record", JSON.stringify(row)));
                    } else {
                        normalizedRecords.push(row);
                    }

                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                }
            });

            writeNormalizedRecords(normalizedFile, normalizedRecords);

            return normalizedFile;

        } catch (exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
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
    var scoresToMap =
        [
            //Scores
            , { FUNCTION: mapTotalScore, CODE: "TOT", NAME: "TOTAL" }
            , { FUNCTION: mapScore, CODE: "EBRW_TOT", NAME: "EBRW" }
            , { FUNCTION: mapScore, CODE: "MA_TOT", NAME: "MATH_SECTION" }
            , { FUNCTION: mapScore, CODE: "MA_MACT", NAME: "MATH_TEST" }
            , { FUNCTION: mapScore, CODE: "EBRW_RCT", NAME: "READING" }
            , { FUNCTION: mapScore, CODE: "EBRW_WCT", NAME: "WRIT_LANG" }
            , { FUNCTION: mapScore, CODE: "EBRW_ASCT", NAME: "SCI_CROSS" }
            , { FUNCTION: mapScore, CODE: "EBRW_HSSCT", NAME: "HIST_SOCST_CROSS" }
            , { FUNCTION: mapScore, CODE: "EBRW_RWC", NAME: "WORDS_CONTEXT" }
            , { FUNCTION: mapScore, CODE: "EBRW_CE", NAME: "COMM_EVIDENCE" }
            , { FUNCTION: mapScore, CODE: "EBRW_EI", NAME: "EXPR_IDEAS" }
            , { FUNCTION: mapScore, CODE: "EBRW_SEC", NAME: "ENG_CONVENT" }
            , { FUNCTION: mapScore, CODE: "MA_HA", NAME: "HEART_ALGEBRA" }
            , { FUNCTION: mapScore, CODE: "MA_PAM", NAME: "ADV_MATH" }
            , { FUNCTION: mapScore, CODE: "MA_PSDA", NAME: "PROBSLV_DATA" }
            , { FUNCTION: mapScore, CODE: "WR_ER", NAME: "ESSAY_READING" }
            , { FUNCTION: mapScore, CODE: "WR_EA", NAME: "ESSAY_ANALYSIS" }
            , { FUNCTION: mapScore, CODE: "WR_EW", NAME: "ESSAY_WRITING" }
            , { FUNCTION: mapScore, CODE: "EBRW_TOTSE", NAME: "EBRWSE" }
            , { FUNCTION: mapScore, CODE: "MA_TOTSE", NAME: "MATH_SECTIONSE" }
        ];


    var subjectScoresToMap =
        [
            { FUNCTION: mapLatestSubjectScore, CODE: "SUBJ_1", NAME: "_SUBJ_TEST1", FIELD: "SUBJ_1" }
            , { FUNCTION: mapLatestSubjectScore, CODE: "SUBJ_2", NAME: "_SUBJ_TEST2", FIELD: "SUBJ_2" }
            , { FUNCTION: mapLatestSubjectScore, CODE: "SUBJ_3", NAME: "_SUBJ_TEST3", FIELD: "SUBJ_3" }
        ];

    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/
    var educationLevelDecodes = {
        "1": "<8"
        , "01": "<8"
        , "2": "08"
        , "02": "08"
        , "4": "09"
        , "04": "09"
        , "5": "10"
        , "05": "10"
        , "5": "10"
        , "05": "10"
        , "6": "11"
        , "06": "11"
        , "7": "12"
        , "07": "12"
        , "8": "NHS"   //No longer in high school
        , "08": "NHS"
        , "9": "NR"	//No Response
        , "09": "NR"
        , "9th grade": "NR" //No Response
        , "10": "NR"
        , "10th grade": "NR"
        , "11th grade": "UNK"
        , "11": "UNK"	///Unknown
        , "12": "C1"	//1st Year of college
        , "12th grade": "C1"
        , "13": "C2"    //2nd Year of college
        , "13th grade": "C2"
        , "No response": "NR" //No Response
    };

    var specialEducationLevelDecodes = {
        "09": "09"
        , "9": "09"
        , "10": "10"
        , "10th grade": "10"
        , "11": "11"
        , "11th grade": "11"
    };

    var collegeReadinessDecodes = {
        "N": "Not College Ready"
        , "Y": "College Ready"
    };
    var performanceLevelDecode = {
        "Advanced" : {CODE: "4", DESC: "Advanced", PASS_IND: "Yes"}
        ,"Proficient" : {CODE: "3", DESC: "Proficient", PASS_IND: "Yes"}
        ,"Not Proficient" : {CODE: "1", DESC: "Not Proficient", PASS_IND: "No"}
        ,"Partially Proficient" : {CODE: "2", DESC: "Partially Proficient", PASS_IND: "No"}
        ,"NA"  : {CODE: null, DESC: null, PASS_IND: null}
        ,"" : {CODE: null, DESC: null, PASS_IND: null}
        ,null : {CODE: null, DESC: null, PASS_IND: null}
       };

       var PerformanceLevelDecodes = {
         "1":"Partially Meets Standards"
        ,"2":"Approaching Standards"
        ,"3":"Meets Standards"
        ,"4":"Exceeds Standards"
       };

     var testDecode = {
        "SAT": "SAT"
     };

    var APPotentialDecodes = {
        "P": null
        , "S": null
        , "Y": "YES"
        , "N": "NO"
        , "": null
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
    function mapNormalizedRecords(signature, hierarchy, rows, adminVal, file) {
        var normalizedRecords = [];
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        setAssessmentTypeAndTestNumberPrefix(file, row);
        var record = mapNormalizedRecord(signature, hierarchy, row, adminVal);
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
    function mapNormalizedRecord(signature, hierarchy, row, adminVal) {
        var dateField = _util.coalesce(row.getField(adminVal + "_" + getAssessmentType(row) + "_DATE"), row.getField(adminVal + "_ASSESSMENT_DATE"), row.getField(adminVal + "_PSAT_DATE"));
        //if(dateField!==undefined && dateField!==null) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, adminVal);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row, adminVal);

        if (getAssessmentType(row) === "PSAT" && adminVal !== "LATEST") {
            //Not mapping historical PSAT at this time
            // System Fields
            record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
            record.LINEAGE_SOURCE = _thisLineageSource;
            record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
            record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
            record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

            return record;
        }

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            var score = (testMetadata.FUNCTION)(row, testMetadata.NAME, testMetadata.CODE, adminVal, signature);

            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
        });
        if (getAssessmentType(row) !== "PSAT") {
            subjectScoresToMap.forEach(function (testMetadata) {
                var score2 = (testMetadata.FUNCTION)(row, testMetadata.NAME, testMetadata, adminVal, signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score2);
            });
        }
        //MAP AP Potential fields for PSAT records
        if (getAssessmentType(row) === "PSAT") {
            predictionsToMap.forEach(function (testMetadata) {
                var score = (testMetadata.FUNCTION)(row, testMetadata.TESTNUMBER, testMetadata.OVERALL_POTENTIAL, testMetadata.GROUPING_SCORES, signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            });
        }

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");
        //}
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
    function mapNormalizedAdminFields(signature, hierarchy, row, adminVal) {
        // Map standard normalized assessment fields.
        var record = AppUtil.mapNormalizedAssessmentFields(signature, hierarchy, row);
        /*
            Map normalized fields requiring assessment-specific logic.
        */

        var latestGradeLevel = _util.coalesce(row.getField(adminVal + "_" + getAssessmentType(row) + "_GRADE"), row.getField(adminVal + "_GRADE_LEVEL"), row.getField("GRADE"), "");
        // Get raw date values LATEST_SAT_DATE, LATEST_ASSESSMENT_DATE, LATEST_PSAT_DATE
        var testDateStr = _util.coalesce(row.getField(adminVal + "_" + getAssessmentType(row) + "_DATE"), row.getField(adminVal + "_ASSESSMENT_DATE"), row.getField(adminVal + "_PSAT_DATE"),row.getField("TEST_ADMINS_DATE"), "");
        if (!testDateStr) {
            testDateStr = getDefaultTestDate(hierarchy);
        }
        var birthDateStr = _util.coalesce(row.getField("STUDENT_DOB"), row.getField("BIRTH_DATE"), "");
        var reportDateStr = row.getField("REPORT_DATE");
        var testDateObject = mapDateObject(hierarchy, row, testDateStr);
        var birthDateObject;
        if (birthDateStr.indexOf("-") > -1 && birthDateStr.split("-")[1].length === 3) {
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "dd-MMM-yy");
        } else if (birthDateStr.indexOf(",") > -1) {
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMM dd, yyyy");
        } else if (birthDateStr.indexOf("-") > -1 && birthDateStr.split("-")[0].length === 4) {
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "yyyy-MM-dd");
        } else if (birthDateStr.indexOf("-") > -1) {
        if(signature.getFormat().getFormatName() === "SAT_REDESIGN_DELIMITED_GENDER_2020_ALT" || signature.getFormat().getFormatName() === "SAT_REDESIGN_DELIMITED_2020_ALT"){
            birthDateObject = AppUtil.getDayFollowedByMonth(birthDateStr);
        }else{
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM-dd-yyyy");
        }
        } else if (birthDateStr.indexOf("/") > -1 && birthDateStr.split("/")[2].length === 4){
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yyyy");
        }
        else {
            birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yy");
        }

        var FullName = row.getField("STUDENT_NAME");
        var FirstName;
        var MiddleName;
        var LastName;

        if (FullName !== undefined && FullName !== null && FullName !== "") {
            LastName = FullName.split(",")[0].trim()
            if (FullName.endsWith(".")) {
                MiddleName = FullName[FullName.length - 2]
                FirstName = FullName.split(",")[1].trim().split(" ")[0].trim()
            }
            else {
                FirstName = FullName.split(",")[1].trim()
            }
        }

        //var reportDateObject = mapDateObject(hierarchy, row, reportDateStr);
        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, adminVal);
        record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
        var SCHOOL_LOCAL_ID = _util.coalesceEmptyString(row.getField("SCHOOL_VENDOR_ID"));
        var SCHOOL_STATE_ID = _util.coalesceEmptyString(row.getField("SCHOOL_VENDOR_ID"));
        if(row.getField("TEST_ADMIN_DATE")) {
        var adminDate = row.getField("TEST_ADMIN_DATE").toString().toUpperCase();
        if(adminDate !== null && adminDate !== undefined && adminDate !== "") {
            if(adminDate.indexOf('FALL') > -1) {
                 adminDate = "09/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}";
            }else if(period === 'WINTER') {
                  adminDate = "01/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
            } else if(period === 'SPRING') {
                 adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
            } else {
                 adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
            }
        }
        }
        record.TEST_ADMIN_DATE = _util.coalesce(row.getField("TEST_DATE"), adminDate, testDateObject.STANDARD_DATE);
        record.STUDENT_GENDER_CODE = row.getField("STUDENT_GENDER_CODE");
        // "TEST_REPORTING_DATE" is not considered, because customer doesn't want it to be present.
        //if(signature.getFormat().getFormatName() === "PSAT_18_19"){
            //record.STUDENT_GRADE_CODE = specialEducationLevelDecodes[latestGradeLevel] === undefined ? null : specialEducationLevelDecodes[latestGradeLevel];
        //}else{
            record.STUDENT_GRADE_CODE = educationLevelDecodes[latestGradeLevel] === undefined ? null : educationLevelDecodes[latestGradeLevel];
        //}
        record.STUDENT_LOCAL_ID = _util.coalesceEmptyString(row.getField("DISTRICT_STUDENT_ID"), row.getField("STUDENT_VENDOR_ID"), row.getField("STATE_STUDENT_ID"));
        record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("STUDENT_VENDOR_ID"), row.getField("STATE_STUDENT_ID"));
        record.STUDENT_STATE_ID = row.getField("STATE_STUDENT_ID");
        record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
        record.STUDENT_FIRST_NAME = _util.coalesceEmptyString(row.getField("NAME_FIRST"), row.getField("STUDENT_FIRST_NAME"), FirstName, null);
        record.STUDENT_MIDDLE_NAME = _util.coalesceEmptyString(row.getField("NAME_MI"), row.getField("STUDENT_MIDDLE_NAME"), MiddleName, null);
        record.STUDENT_LAST_NAME = _util.coalesceEmptyString(row.getField("NAME_LAST"), row.getField("STUDENT_LAST_NAME"), LastName, null);
        record.STUDENT_STREET_ADDRESS = _util.trim(_util.trim(_util.coalesce(row.getField("STUDENT_ADDRESS_LINE_1"), "")) + " " + _util.trim(_util.coalesce(row.getField("STUDENT_ADDRESS_LINE_2"), "")));
        if ((SCHOOL_LOCAL_ID === null && SCHOOL_STATE_ID === null) || (SCHOOL_LOCAL_ID === "" && SCHOOL_STATE_ID === "")) {
            record.SCHOOL_LOCAL_ID = "DISTRICT";
            record.SCHOOL_VENDOR_ID = "DISTRICT";
        }

        else {
            record.SCHOOL_VENDOR_ID = _util.coalesceEmptyString(row.getField("SCHOOL_VENDOR_ID"));
            record.SCHOOL_LOCAL_ID = _util.coalesceEmptyString(row.getField("SCHOOL_VENDOR_ID"));
            record.SCHOOL_STATE_ID = _util.coalesceEmptyString(row.getField("SCHOOL_VENDOR_ID"));
        }

        //Birthdate fields

        if (birthDateStr === null || birthDateStr === "") {
           // record.STUDENT_DOB = null;
            record.STUDENT_DOB_MONTH = null;
            record.STUDENT_DOB_DAY = null;
            record.STUDENT_DOB_YEAR = null;
        } else {
           // record.STUDENT_DOB = _util.coalesce(birthDateObject.STANDARD_DATE, null);
            record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
            record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
            record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
        }

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
    function mapAdditionalAdminFields(row, adminVal) {

        var admin = {};

        admin.TEST_INTERVENTION_DESC = adminVal;
        return admin;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function mapScore(row, name, code, adminVal, signature) {

        var testScoreElement = {};
        if (signature.getFormat().getFormatName() !== "PSAT_BJSHS_MVHS" && signature.getFormat().getFormatName() !== "PSAT_DELIMITED"
            && signature.getFormat().getFormatName() !== "SAT_ROSTER" && signature.getFormat().getFormatName() !== "PSAT_72_1_COLS" && signature.getFormat().getFormatName() !== "PSAT_82_1_COLS" && signature.getFormat().getFormatName() !== "PSAT_90_1_COLS"  && signature.getFormat().getFormatName() !== "SAT_REDESIGN_76COLS" && signature.getFormat().getFormatName() !== "PSAT_18_19") {
            if (_util.coalesce(row.getField(adminVal + "_ASSESSMENT_DATE"),row.getField("TEST_ADMIN_DATE"), row.getField(adminVal + "_" + getAssessmentType(row) + "_DATE"), row.getField(adminVal + "_PSAT_DATE"), "") === "") {
                return null;
            }
        }
        var test_Num = testDecode[row.getField("TEST_ASSESSMENT")];
        if(test_Num){
        var testNumber = test_Num + "_" + code;
        var scaleScore = row.getField(adminVal + "_" + "TEST_ASSESSMENT" + "_" + name);
        }else{
        var testNumber = getTestNumberPrefix(row) + "_" + code;
        var scaleScore = row.getField(adminVal + "_" + getAssessmentType(row) + "_" + name);
        }
        var percentileScore = row.getField("PERCENTILE_NATREP_" + getAssessmentType(row) + "_" + name);

        var userpercentileScore = row.getField("PERCENTILE_NATUSER_" + getAssessmentType(row) + "_" + name);

        var range = row.getField(adminVal + "_" + getAssessmentType(row) + "_" + name + "_RANGE");
        var lowerBound = null;
        var upperBound =null;

        if(range !==null && range !== undefined && range.indexOf("-") > -1) {
            lowerBound = range.split("-")[0];
            upperBound = range.split("-")[1];
        }

        //this condition is used to remove % if exists
        if (scaleScore !== null && scaleScore.endsWith("%")) {
            scaleScore = scaleScore.replace("%", '');
        }
        if (percentileScore !== null && percentileScore.endsWith("%")) {
            percentileScore = percentileScore.replace("%", '');
        }
        if (userpercentileScore !== null && userpercentileScore.endsWith("%")) {
            userpercentileScore = userpercentileScore.replace("%", '');
        }
        // Set main score elements
        if (_util.trim(scaleScore) === null || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NA" || _util.trim(scaleScore) === '.') {
            return null;
        } else {
            testScoreElement["TEST_NUMBER"] = testNumber;
            testScoreElement["TEST_SCORE_VALUE"] = scaleScore;
            testScoreElement["TEST_SCORE_TEXT"] = scaleScore;
            testScoreElement["TEST_SCALED_SCORE"] = scaleScore;
            testScoreElement["TEST_PERCENTILE_SCORE"] = percentileScore;
            testScoreElement["TEST_PERCENTAGE_SCORE"] = userpercentileScore;
            testScoreElement["TEST_LOWER_BOUND"] = lowerBound;
            testScoreElement["TEST_UPPER_BOUND"] = upperBound;
        }

        if (testNumber.indexOf("SAT_EBRW_TOT") > -1) {
            if (scaleScore >= 200 && scaleScore <= 410) {
                testScoreElement["TEST_PRIMARY_RESULT"] = "Novice";
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                testScoreElement["TEST_PASSED_INDICATOR"] = "No"
                }
            else if (scaleScore >= 420 && scaleScore <= 470) {
                testScoreElement["TEST_PRIMARY_RESULT"] = "Below Expectations";
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                testScoreElement["TEST_PASSED_INDICATOR"] = "No"
            }
            else if (scaleScore >= 480 && scaleScore <= 620) {
                testScoreElement["TEST_PRIMARY_RESULT"] = "At Expectations";
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                testScoreElement["TEST_PASSED_INDICATOR"] = "Yes"
            }
            else if (scaleScore >= 630 && scaleScore <= 800) {
                testScoreElement["TEST_PRIMARY_RESULT"] = "Above Expectation";
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                testScoreElement["TEST_PASSED_INDICATOR"] = "Yes"
            }
            }

        if (testNumber.indexOf("SAT_MA_TOT") > -1) {
            if (scaleScore >= 200 && scaleScore <= 410) {
                testScoreElement["TEST_PRIMARY_RESULT"] = "Novice";
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Level 1";
                testScoreElement["TEST_PASSED_INDICATOR"] = "No"
                }
            else if (scaleScore >= 420 && scaleScore <= 520) {
                testScoreElement["TEST_PRIMARY_RESULT"] = "Below Expectations";
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Level 2";
                testScoreElement["TEST_PASSED_INDICATOR"] = "No"
            }
            else if (scaleScore >= 530 && scaleScore <= 640) {
                testScoreElement["TEST_PRIMARY_RESULT"] = "At Expectations";
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Level 3";
                testScoreElement["TEST_PASSED_INDICATOR"] = "Yes"
            }
            else if (scaleScore >= 650 && scaleScore <= 800) {
                testScoreElement["TEST_PRIMARY_RESULT"] = "Above Expectation";
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Level 4";
                testScoreElement["TEST_PASSED_INDICATOR"] = "Yes"
            }
            }


        if (adminVal === "LATEST") {
           if(name === "EBRW" && signature.getFormat().getFormatName() === "PSAT_18_19"){
           testScoreElement["TEST_SECONDARY_RESULT_CODE"] = row.getField("PERFORMANCE_TEST_ASSESSMENT_EBRW");
           testScoreElement["TEST_SECONDARY_RESULT"] = PerformanceLevelDecodes[row.getField("PERFORMANCE_TEST_ASSESSMENT_EBRW")];
           }else if (name === "MATH_SECTION" && signature.getFormat().getFormatName() === "PSAT_18_19") {
           testScoreElement["TEST_SECONDARY_RESULT_CODE"] = row.getField("PERFORMANCE_TEST_ASSESSMENT_MATH_SECTION");
           testScoreElement["TEST_SECONDARY_RESULT"] = PerformanceLevelDecodes[row.getField("PERFORMANCE_TEST_ASSESSMENT_MATH_SECTION")];
           }
            // Set performance levels
            if (name === "EBRW") {
               if (signature.getFormat().getFormatName() === "PSAT_90_1_COLS" || signature.getFormat().getFormatName() === "PSAT_82_1_COLS"){
                   var EBRWPass = _util.coalesce(row.getField("EVIDENCE_BASED_READING_WRITING_PERFORMANCE_LEVEL_DESCRIPTION"),row.getField("EVIDENCE_READING_WRITING_PERFORMANCE_LEVEL_DESCRIPTION"));
                   testScoreElement["TEST_PASSED_INDICATOR"] = performanceLevelDecode[EBRWPass].PASS_IND;
                   testScoreElement["TEST_SECONDARY_RESULT_CODE"] = performanceLevelDecode[EBRWPass].CODE;
                   testScoreElement["TEST_SECONDARY_RESULT"] = performanceLevelDecode[EBRWPass].DESC;
                   //testScoreElement["TEST_PRIMARY_RESULT"] =  collegeReadinessDecodes[row.getField("EVIDENCE_BASED_READING_WRITING_CCRBENCHMARK_INDICATOR")] === undefined ? null : collegeReadinessDecodes[row.getField("EVIDENCE_BASED_READING_WRITING_CCRBENCHMARK_INDICATOR")];
                   //testScoreElement["TEST_PRIMARY_RESULT_CODE"] = row.getField("EVIDENCE_BASED_READING_WRITING_CCRBENCHMARK_INDICATOR");
                   }
               else{
                var EBRWPass = row.getField("EBRW_CCR_BENCHMARK");
                if (EBRWPass == "Y") {
                    EBRWPass = "Yes";
                }
                if (EBRWPass == "N") {
                    EBRWPass = "No";
                }
                //testScoreElement["TEST_PASSED_INDICATOR"] = EBRWPass;
                testScoreElement["TEST_SECONDARY_RESULT_CODE"] = row.getField("EBRW_CCR_BENCHMARK");
                testScoreElement["TEST_SECONDARY_RESULT"] = collegeReadinessDecodes[row.getField("EBRW_CCR_BENCHMARK")] === undefined ? null : collegeReadinessDecodes[row.getField("EBRW_CCR_BENCHMARK")];
               }
            } else if (name === "MATH_SECTION") {
                if (signature.getFormat().getFormatName() === "PSAT_90_1_COLS" || signature.getFormat().getFormatName() === "PSAT_82_1_COLS"){
                    var MathPass = row.getField("MATH_PERFORMANCE_LEVEL_DESCRIPTION");
                    testScoreElement["TEST_PASSED_INDICATOR"] = performanceLevelDecode[MathPass].PASS_IND;
                    testScoreElement["TEST_SECONDARY_RESULT_CODE"] = performanceLevelDecode[MathPass].CODE;
                    testScoreElement["TEST_SECONDARY_RESULT"] = performanceLevelDecode[MathPass].DESC;
                    testScoreElement["TEST_PRIMARY_RESULT_CODE"] = row.getField("MATH_CCRBENCHMARK_INDICATOR");
                    testScoreElement["TEST_PRIMARY_RESULT"] =  collegeReadinessDecodes[row.getField("MATH_CCRBENCHMARK_INDICATOR")] === undefined ? null : collegeReadinessDecodes[row.getField("MATH_CCRBENCHMARK_INDICATOR")];

                }
                else{
                var MathPass = row.getField("MATH_CCR_BENCHMARK");
                if (MathPass == "Y") {
                    MathPass = "Yes";
                }
                if (MathPass == "N") {
                    MathPass = "No";
                }
                //testScoreElement["TEST_PASSED_INDICATOR"] = MathPass;
                testScoreElement["TEST_SECONDARY_RESULT_CODE"] = row.getField("MATH_CCR_BENCHMARK");
                testScoreElement["TEST_SECONDARY_RESULT"] = collegeReadinessDecodes[row.getField("MATH_CCR_BENCHMARK")] === undefined ? null : collegeReadinessDecodes[row.getField("MATH_CCR_BENCHMARK")];
             }
            } else if (name === "TOTAL") {
                var ebrwBenchmark = row.getField("EBRW_CCR_BENCHMARK");
                var mathBenchmark = row.getField("MATH_CCR_BENCHMARK");
                //Set College Readiness based on subject level performance.
                if (ebrwBenchmark == "Y" && mathBenchmark == "Y") {
                    testScoreElement["TEST_PASSED_INDICATOR"] = "Yes";
                    testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Y";
                    testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes["Y"];
                } else if(ebrwBenchmark == "N" || mathBenchmark == "N") {
                    testScoreElement["TEST_PASSED_INDICATOR"] = "No";
                    testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "N";
                    testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes["N"];
                }
            }
        }
        return testScoreElement;
    }

    function mapTotalScore(row, name, code, adminVal, signature) {

        var testScoreElement = {};

        if (signature.getFormat().getFormatName() !== "PSAT_BJSHS_MVHS" && signature.getFormat().getFormatName() !== "PSAT_DELIMITED"
            && signature.getFormat().getFormatName() !== "SAT_ROSTER" && signature.getFormat().getFormatName() !== "PSAT_72_1_COLS" && signature.getFormat().getFormatName() !== "PSAT_82_1_COLS" && signature.getFormat().getFormatName() !== "PSAT_90_1_COLS"  && signature.getFormat().getFormatName() !== "SAT_REDESIGN_76COLS" && signature.getFormat().getFormatName() !== "PSAT_18_19") {
            if (_util.coalesce(row.getField(adminVal + "_ASSESSMENT_DATE"), row.getField("TEST_ADMIN_DATE"), row.getField(adminVal + "_" + getAssessmentType(row) + "_DATE"), row.getField(adminVal + "_PSAT_DATE"), "") === "") {
                return null;
            }
        }
        var test_Num = testDecode[row.getField("TEST_ASSESSMENT")];
        if(test_Num){
        var testNumber = test_Num + "_" + code;
        var scaleScore = row.getField(adminVal + "_" + "TEST_ASSESSMENT" + "_" + name);
        }else{
        var testNumber = getTestNumberPrefix(row) + "_" + code;
        var scaleScore = row.getField(adminVal + "_" + getAssessmentType(row) + "_" + name);
        }
        var percentileScore = row.getField("PERCENTILE_NATREP_" + getAssessmentType(row) + "_" + name);
        var userpercentileScore = row.getField("PERCENTILE_NATUSER_" + getAssessmentType(row) + "_" + name);
        var range = row.getField(adminVal + "_" + getAssessmentType(row) + "_" + name + "_RANGE");
        var lowerBound = null;
        var upperBound =null;

        if(range !==null && range !== undefined && range.indexOf("-") > -1) {
            lowerBound = range.split("-")[0];
            upperBound = range.split("-")[1];
        }

        //this condition is to remove % symbol from the data
        if (scaleScore !== null && scaleScore.endsWith("%")) {
            scaleScore = scaleScore.replace("%", '');
        }
        if (percentileScore !== null && percentileScore.endsWith("%")) {
            percentileScore = percentileScore.replace("%", '');
        }
        if (userpercentileScore !== null && userpercentileScore.endsWith("%")) {
            userpercentileScore = userpercentileScore.replace("%", '');
        }

        // Set main score elements
        if (_util.trim(scaleScore) === null || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NA") {
            return null;
        } else {
            testScoreElement["TEST_NUMBER"] = testNumber;
            testScoreElement["TEST_SCORE_VALUE"] = scaleScore;
            testScoreElement["TEST_SCORE_TEXT"] = scaleScore;
            testScoreElement["TEST_SCALED_SCORE"] = scaleScore;
            testScoreElement["TEST_PERCENTILE_SCORE"] = percentileScore;
            testScoreElement["TEST_PERCENTAGE_SCORE"] = userpercentileScore;
           testScoreElement["TEST_LOWER_BOUND"] = lowerBound;
           testScoreElement["TEST_UPPER_BOUND"] = upperBound;
        }
        if (adminVal === "LATEST") {
            // Set performance levels
            if (name === "EBRW") {
                var EBRWPass = row.getField("EBRW_CCR_BENCHMARK");
                if (EBRWPass == "Y") {
                    EBRWPass = "Yes";
                }
                if (EBRWPass == "N") {
                    EBRWPass = "No";
                }
                //testScoreElement["TEST_PASSED_INDICATOR"] = EBRWPass;
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = row.getField("EBRW_CCR_BENCHMARK");
                testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes[row.getField("EBRW_CCR_BENCHMARK")] === undefined ? null : collegeReadinessDecodes[row.getField("EBRW_CCR_BENCHMARK")];
            } else if (name === "MATH_SECTION") {
                var MathPass = row.getField("MATH_CCR_BENCHMARK");
                if (MathPass == "Y") {
                    MathPass = "Yes";
                }
                if (MathPass == "N") {
                    MathPass = "No";
                }
                testScoreElement["TEST_PASSED_INDICATOR"] = MathPass;
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = row.getField("MATH_CCR_BENCHMARK");
                testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes[row.getField("MATH_CCR_BENCHMARK")] === undefined ? null : collegeReadinessDecodes[row.getField("MATH_CCR_BENCHMARK")];
            } else if (name === "TOTAL") {
               if (signature.getFormat().getFormatName() === "PSAT_90_1_COLS" || signature.getFormat().getFormatName() === "PSAT_82_1_COLS"){
                    var EBRWPass = _util.coalesce(row.getField("EVIDENCE_BASED_READING_WRITING_PERFORMANCE_LEVEL_DESCRIPTION"),row.getField("EVIDENCE_READING_WRITING_PERFORMANCE_LEVEL_DESCRIPTION"));
                    var MathPass = row.getField("MATH_PERFORMANCE_LEVEL_DESCRIPTION");
                    var totalMathPass = performanceLevelDecode[MathPass].PASS_IND;
                    var totalEBRWPass = performanceLevelDecode[EBRWPass].PASS_IND;
                    if (totalEBRWPass == "Yes" && totalMathPass == "Yes"){
                         testScoreElement["TEST_PASSED_INDICATOR"] = "Yes";
                         testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Y";
                         testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes["Y"];
                    } else if(totalEBRWPass == "No" || totalMathPass == "No") {
                               testScoreElement["TEST_PASSED_INDICATOR"] = "No";
                               testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "N";
                               testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes["N"];
                     }
                }
               else{
                var ebrwBenchmark = row.getField("EBRW_CCR_BENCHMARK");
                var mathBenchmark = row.getField("MATH_CCR_BENCHMARK");

                //Set College Readiness based on subject level performance.
                if (ebrwBenchmark == "Y" && mathBenchmark == "Y") {
                    testScoreElement["TEST_PASSED_INDICATOR"] = "Yes";
                    testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Y";
                    testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes["Y"];
                } else if (ebrwBenchmark == "N" || mathBenchmark == "N") {
                    testScoreElement["TEST_PASSED_INDICATOR"] = "No";
                    testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "N";
                    testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes["N"];
                }

                if (row.getField('NATIONAL_MERIT') !== undefined && row.getField('NATIONAL_MERIT') !== null) {
                    testScoreElement['TEST_SECONDARY_RESULT_CODE'] = row.getField('NATIONAL_MERIT');
                    testScoreElement['TEST_SECONDARY_RESULT'] = "National Merit";
                } else {
                    testScoreElement['TEST_SECONDARY_RESULT_CODE'] = null;
                    testScoreElement['TEST_SECONDARY_RESULT'] = null;
                } if (row.getField('SELECTION_INDEX') !== undefined && row.getField('NATIONAL_MERIT') !== null) {
                    testScoreElement['TEST_TERTIARY_RESULT_CODE'] = row.getField('SELECTION_INDEX');
                    testScoreElement['TEST_TERTIARY_RESULT'] = "Selection Index";
                } else {
                    testScoreElement['TEST_TERTIARY_RESULT_CODE'] = null;
                    testScoreElement['TEST_TERTIARY_RESULT'] = null;
                }
              }
            }
        }
        return testScoreElement;
    }


    function mapLatestSubjectScore(row, name, testMetadata, adminVal, signature) {
        if (_util.coalesce(row.getField(adminVal + "_ASSESSMENT_DATE"),row.getField("TEST_ADMIN_DATE"), row.getField(adminVal + "_" + getAssessmentType(row) + "_DATE"), row.getField(adminVal + "_PSAT_DATE"), "") === "") {
            return null;
        }
        try {
            var testScoreElement = {};
            var testNumber = getTestNumberPrefix(row) + "__" + testMetadata.CODE + "_" + row.getField(adminVal + testMetadata.NAME + "_ID");
            var scaleScore = row.getField(adminVal + testMetadata.NAME + "_SCORE");
            var identifier = row.getField(adminVal + testMetadata.NAME + "_ID");
            var percentile = row.getField(testMetadata.FIELD + "_PERCENTILE");
            var userpercentileScore = row.getField("PERCENTILE_NATUSER_" + getAssessmentType(row) + "_" + name);

            //this condition is to remove % symbol from the data
            if (percentile !== null && percentile.endsWith("%")) {
                percentile = percentile.replace("%", '');
            }
            if (userpercentileScore !== null && userpercentileScore.endsWith("%")) {
                userpercentileScore = userpercentileScore.replace("%", '');
            }
            // Set main score elements
            if (_util.trim(scaleScore) === null || _util.trim(scaleScore) === "") {
                return null;
            }
            testScoreElement["TEST_NUMBER"] = testNumber;
            testScoreElement["TEST_SCORE_VALUE"] = scaleScore;
            testScoreElement["TEST_SCORE_TEXT"] = scaleScore;
            testScoreElement["TEST_SCALED_SCORE"] = scaleScore;
            testScoreElement["TEST_PERCENTILE_SCORE"] = percentile;
            testScoreElement["TEST_PERCENTAGE_SCORE"] = userpercentileScore;
            testScoreElement["TEST_SCORE_ATTRIBUTES"] = identifier;

            return testScoreElement;
        } catch (e) {
            print(e);
        }
    }

    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function writeNormalizedRecords(file, data) {
        try {
            const normalFile = _file.open(file);
            const normalFilePath = normalFile.getParent();
            const normalFileName = normalFile.getName()
            const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
            let rowArray = null;
            const header = Object.keys(data[0]);

            writer.writeNext(header);

            data.forEach(function (row) {
                rowArray = [];

                for (let key in row) {
                    rowArray.push(row[key]);
                }
                writer.writeNext(rowArray);
            })

            writer.close();
        } catch (exception) {
            throw "${_thisModuleName}.writeNormalizedRecords Exception: ${exception}";
        }
    }


    function getRecords(file, signature) {
        try {
            const format = signature.getFormat();
            const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
            const fileFullName = file.getFullName();

            let lineNumber = 0;
            let recordsArray = [];

            let record, row;

            if (signature.getFormat().getClass().toString().equals(SignatureFormatType.DELIMITED)) {
                let fieldDelimiter = format.getFieldDelim();
                let textDelimiter = format.getQuoteDelim();
                let delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
                let fieldNames = delimitedRecordParser.parseRow(reader);
                while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                    let index = 0;

                    record = { LINEAGE_FILE: null,  LINEAGE_LINE: null };

                    for (const key in fieldNames) {
                        record[fieldNames[index]] = row.get(index++);
                    }

                    record.LINEAGE_FILE = fileFullName;
                    record.LINEAGE_LINE = (++lineNumber).toString();

                    recordsArray.push((record));
                }
            } else if (signature.getFormat().getClass().toString().equals(SignatureFormatType.FIXED_LENGTH)) {
                let fields = format.getFields();
                while ((row = reader.readLine()) !== null) {
                    record = { LINEAGE_FILE: null, LINEAGE_LINE: null };
                    fields.forEach(field => {
                        record[field.getPhysicalName()] = row.substring(
                            field.getFieldOffset().getOffsetStart() - 1,
                            field.getFieldOffset().getOffsetEnd()
                        ).trim();
                    });
                    record.LINEAGE_FILE = fileFullName;
                    record.LINEAGE_LINE = (++lineNumber).toString();

                    recordsArray.push(record);
                }
            } else {
                throw new Error("Invalid Signature Format");
            }

            return recordsArray;
        } catch (exception) {
            throw "${_thisModuleName}.createRecords Exception: ${exception}";
        }
    }

    function setAssessmentTypeAndTestNumberPrefix(file, row) {
        let assessmentType;
        let testNumberPrefix;
        let fileName;

        if (row.getField("LATEST_SAT_DATE") || row.getField("LATEST_ASSESSMENT_DATE") || row.getField("LATEST_SAT_TOTAL")) {
            assessmentType = "SAT";
            testNumberPrefix = "SAT";
           }
          else {
            assessmentType = null;
            testNumberPrefix = null;
        }

        setAssessmentInfo(row, assessmentType, testNumberPrefix);
        return assessmentType;
    }


    function setAssessmentInfo(row, assessmentType, testNumberPrefix) {
        assessmentMap.put(row._srcJSON.LINEAGE_FILE + ':' + row._srcJSON.LINEAGE_LINE, assessmentType + ':' + testNumberPrefix);
    }

    function getAssessmentType(row) {
        return assessmentMap.get(row._srcJSON.LINEAGE_FILE + ':' + row._srcJSON.LINEAGE_LINE).split(':')[0];
    }

    function getTestNumberPrefix(row) {
        return assessmentMap.get(row._srcJSON.LINEAGE_FILE + ':' + row._srcJSON.LINEAGE_LINE).split(':')[1];
    }

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {

            // Note: Admin year isn"t required for sorting. Should be left blank.
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, null);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, null);

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }

        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, adminVal) {

        var FullName = srcRecord.getField("STUDENT_NAME");
        var FirstName;
        var MiddleName;
        var LastName;

        if (FullName !== undefined && FullName !== null && FullName !== "") {
           LastName = FullName.split(",")[0].trim()
           if (FullName.endsWith(".")) {
               MiddleName = FullName[FullName.length - 2];
               FirstName = FullName.split(",")[1].trim().split(" ")[0].trim();
           }
           else {
               FirstName = FullName.split(",")[1].trim();
           }
        }

        if (adminVal === null) {
            adminVal = "LATEST";
        }

        let assessmentAdminKey = `${_assessmentIdentifier}_${hierarchy.ASSESSMENT_PRODUCT}`;
        //TODO Should be the same as the old version or use this opportunity to upgrade?
        var testDateStr1 = _util.coalesce(srcRecord.getField(adminVal + "_" + getAssessmentType(srcRecord) + "_DATE"), srcRecord.getField(adminVal + "_ASSESSMENT_DATE"),srcRecord.getField("TEST_ADMINS_DATE"), "");
        if (!testDateStr1) {
            testDateStr1 = getDefaultTestDate(hierarchy);
        }

        var testDateObject1 = mapDateObject(hierarchy, srcRecord, testDateStr1);
            assessmentAdminKey = getTestNumberPrefix(srcRecord) + "_" + adminVal
                + "_" + AssessmentLoader.config.DISTRICT_CODE
                + "_" + _util.coalesceEmptyString(srcRecord.getField("STUDENT_FIRST_NAME"), "")
                + "_" + _util.coalesceEmptyString(srcRecord.getField("STUDENT_LAST_NAME"), "")
                + "_" + _util.coalesceEmptyString(srcRecord.getField("CB_ID"), srcRecord.getField("STUDENT_VENDOR_ID"), "")
                + "_" + _util.coalesce(srcRecord.getField(adminVal+ "_" + getAssessmentType(srcRecord) + "_SCI_CROSS"), "")
                + "_" + _util.coalesce(srcRecord.getField(adminVal + "_" + getAssessmentType(srcRecord) + "_DATE"), srcRecord.getField(adminVal + "_ASSESSMENT_DATE"), "")
                + "_" + _util.coalesceEmptyString(srcRecord.getField("REPORT_DATE"), "")

        return assessmentAdminKey;

    }

    function getDefaultTestDate(hierarchy) {
        if (!hierarchy.PERIOD) {
            hierarchy.PERIOD = 'ALL';
        }
        let period = hierarchy.PERIOD.toUpperCase();
        switch (period) {
            case 'FALL':
                break;
            case 'WINTER':
                break;
            case 'SPRING':
                break;
            default:
                return '09/15/' + (parseInt(hierarchy.SCHOOL_YEAR.substring(5)) - 1).toString();
        }
    }


    function mapDateObject(hierarchy, row, dateStr) {

        //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
        } catch (exception) {
            // Error will be reported in final check.
        }

        if (testDateObject === null) {
            try {
                testDateObject = AppUtil.getMonthFollowedByDay(dateStr, "MM/dd/yyyy");
            } catch (exception) {
                // Error will be reported in final check.
            }
        }
        if (testDateObject === null) {
            try {
                testDateObject = AppUtil.getMonthFollowedByDay(dateStr, "MMddyyyy");
            } catch (exception) {
                // Error will be reported in final check.
            }
        }
        if (testDateObject === null) {
            try {
                testDateObject = AppUtil.getMonthFollowedByDay(dateStr, "MMddyy");
            } catch (exception) {
                // Error will be reported in final check.
            }
        }
        if (testDateObject === null) {
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd-MM-yyyy");
            } catch (exception) {
                // Error will be reported in final check.
            }
        }
        if(testDateObject === null){
           try {
                 if(dateStr.indexOf("/") <= -1 && dateStr.length >= 6 && dateStr.length <= 8 ) {
                    testDateObject = AppUtil.getMonthFollowedByDay(dateStr);
                 }
               } catch(exception) {
                         // Error will be reported in final check.
               }
           }
        // Set default empty objects if mappings fail and report error.
        if (testDateObject === null) {
            testDateObject = AppUtil.getEmptyDateObj(dateStr);
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing date string: ${dateStr}", JSON.stringify(row.getSourceRow())));
        }
        return testDateObject;

    }

    function trimJson(json) {
        for (let key in json) {
            if (key.indexOf('_ANS') > -1) {
                delete json[key];
            }
        }
        return json;
    }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());
