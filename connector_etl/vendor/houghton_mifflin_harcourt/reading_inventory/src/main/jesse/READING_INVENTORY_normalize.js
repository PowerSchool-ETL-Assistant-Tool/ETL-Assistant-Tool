var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "READING_INVENTORY";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

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
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {

            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const records = getRecords(file, signature);

            print("\nLoading using signature file ${signature.getFormat().getFormatName()}\n");

            let normalizedFile = AppUtil.createResultsFile(file);

            print("\nNormalized file: ${normalizedFile}");

            let normalizedRows = [], normalizedRecords = [];

            records.forEach((record) => {
                try {
                    // Removing white spaces
                    if (typeof record === 'object') {
                        for (let key in record) {
                            if (typeof record[key] === 'string') {
                                record[key] = _util.trim(record[key]);
                            }
                        }
                    }

                    mapNormalizedRecords(signature, hierarchy, [record])
                        .forEach((normalizedRecord) => {
                            normalizedRows.push(normalizedRecord);
                        });
                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH",
                        record.LINEAGE_LINE,
                        "mapNormalizedRecords error: ${exception}",
                        JSON.stringify(record)
                    ));
                }
            });

            normalizedRows.forEach((row) => {
                try {
                    const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
                    if (mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            file.getFilePath(),
                            "WARNING",
                            row.LINEAGE_LINE,
                            "No scores found.",
                            JSON.stringify(row)
                        ));
                    } else {
                        normalizedRecords.push(row);
                    }

                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH",
                        _util.coalesce(row.LINEAGE_LINE, -1),
                        "SCORE COUNT CHECK dataflow error: ${exception}",
                        JSON.stringify(row)
                    ));
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
    //scoreSets with a blank MAP_FUNCTION call their function directly below
    var scoreSet = [
          {SCORETYPE: "LEX", TEST: "", CODE: "", FIELD: "", MAP_FUNCTION:""}
        , {SCORETYPE: "SRI_FRA", TEST: "", CODE: "", FIELD: "", MAP_FUNCTION:""}
        , {SCORETYPE: "SRI", TEST: "", CODE: "", FIELD: "", MAP_FUNCTION:""}
        , {SCORETYPE: "SRIOVR", TEST: "", CODE: "", FIELD: "", MAP_FUNCTION:""}
        , {SCORETYPE: "OVR",TEST: "RDINV", CODE:"OVR", FIELD: "OVERALL_", MAP_FUNCTION: mapOverallScore}
        , {SCORETYPE: "ELA_RD_COMP",TEST: "RDINV", CODE:"ELA_RD_COMP", FIELD: "ELA_READING_COMP_", MAP_FUNCTION: mapOverallScore}
        , {SCORETYPE: "ELA_LANG",TEST: "RDINV", CODE:"ELA_LANG", FIELD: "ELA_LANG_", MAP_FUNCTION: mapOverallScore}
        , {SCORETYPE: "MA_NUM",TEST: "RDINV", CODE:"MA_NUM", FIELD: "MATH_NUMBERS_", MAP_FUNCTION: mapOverallScore}
        , {SCORETYPE: "MA_OP_AL",TEST: "RDINV", CODE:"MA_OP_AL", FIELD: "MATH_OPERATIONS_AND_ALGEBRA_", MAP_FUNCTION: mapOverallScore}
        , {SCORETYPE: "MA_MEA_PRO",TEST: "RDINV", CODE:"MA_MEA_PRO", FIELD: "MATH_MEASUREMENT_DATA_AND_PROBABILITY_", MAP_FUNCTION: mapOverallScore}
        , {SCORETYPE: "MA_GEO",TEST: "RDINV", CODE:"MA_GEO", FIELD: "MATH_GEOMETRY_", MAP_FUNCTION: mapOverallScore}
        , {SCORETYPE: "MA_FRA_PRO",TEST: "RDINV", CODE:"MA_FRA_PRO", FIELD: "MATH_FRACTIONS_RATIOS_AND_PROPORTIONS_", MAP_FUNCTION: mapOverallScore}
        , {SCORETYPE: "MA_FUN",TEST: "RDINV", CODE:"MA_FUN", FIELD: "MATH_FUNCTIONS_", MAP_FUNCTION: mapOverallScore}
    ]

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var decodeStudentGrade = {
        "1": "01"
        , "01": "01"
        , "2": "02"
        , "02": "02"
        , "3": "03"
        , "03": "03"
        , "4": "04"
        , "04": "04"
        , "5": "05"
        , "05": "05"
        , "6": "06"
        , "06": "06"
        , "7": "07"
        , "07": "07"
        , "8": "08"
        , "08": "08"
        , "9": "09"
        , "09": "09"
        , "10": "10"
        , "11": "11"
        , "12": "12"
        , "KG": "KG"
        , "K": "KG"
        , null: null
        , "": null
    };

    var performanceDecode =
    {
            "Below Basic" :  {LEVEL: "1", DESC: "Below Basic"},
            "Basic"       :  {LEVEL: "2", DESC: "Basic"},
            "Proficient"  :  {LEVEL: "3", DESC: "Proficient"},
            "Advanced"    :  {LEVEL: "4", DESC: "Advanced"},
            "Above-Level" :    {LEVEL: "1", DESC: "Above-Level"},
            "Below-Level" :   {LEVEL: "2", DESC: "Below-Level"},
            "On-Level"    :    {LEVEL: "3", DESC: "On-Level"},
            "Far Below Level"    :    {LEVEL: "1", DESC: "Far Below Level"},
            "Below Level" :   {LEVEL: "2", DESC: "Below Level"},
            "On Level"    :    {LEVEL: "3", DESC: "On Level"},
            "Above Level" :    {LEVEL: "4", DESC: "Above Level"},
            "Approaching"    :    {LEVEL: "5", DESC: "Approaching"},
            "" : {LEVEL: null, DESC: null},
            null :{LEVEL: null, DESC: null}
    };

    var performanceDecodePassFail =
    {
        "Advanced": "Yes",
        "AD": "Yes",
        "Proficient": "Yes",
        "PR": "Yes",
        "Basic": "No",
        "B": "No",
        "Below Basic": "No",
        "BB": "No",
        "": null,
        null: null
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

            var scoresByDate = setAdminByDate(signature, hierarchy, row);
            for (var scoreDateKey in scoresByDate) {
                if(JSON.stringify( scoresByDate[scoreDateKey])!=="[]"){
                    AppUtil.nullSafePush(normalizedRecords, mapNormalizedRecord(signature, hierarchy, row, scoreDateKey, scoresByDate[scoreDateKey]));
                }
            }

        return normalizedRecords;
    }


    function setAdminByDate(signature, hierarchy, row) {

        var scoresByDate  = {};

        scoreSet.forEach(function (scoreData) {
            var scoreDateKey;
            //if FRA, do if 9 times for each bucket, if regular SRI, do 30
            if (scoreData.SCORETYPE === "SRI") {
                for (var i = 1; i <= 30; i++) {
                    var sriDate = row.getField("SRI_TEST_DATE_" + i);
                    // Create bucket with date
                    if (sriDate && (sriDate.indexOf('/') > -1 || sriDate.indexOf('-') > -1)) {
                        scoreDateKey = scoreData.SCORETYPE + String(i) + '#' + String(sriDate);
                        scoresByDate[scoreDateKey] = [];
                    }
                    AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapSRIScore(signature, row, i, scoreData.SCORETYPE));
                }
            }
                else if (scoreData.SCORETYPE === "SRI_FRA") {
                for (var j = 1; j <= 9; j++) {
                    var sriFRADate = row.getField("SRI_FRA_TEST_DATE_" + j);
                    if (sriFRADate && (sriFRADate.indexOf('/') > -1 || sriFRADate.indexOf('-') > -1)) {
                        scoreDateKey = scoreData.SCORETYPE + String(j) + '#' + String(sriFRADate);
                        scoresByDate[scoreDateKey] = [];
                    }
                    AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapFRAScore(signature, row, j, scoreData.SCORETYPE));
                }
            } else if (scoreData.SCORETYPE === "SRIOVR") {
                var sriOverallScoreDate = _util.coalesce( row.getField("SRI_LAST_LEXILE_DATE"), row.getField("TEST_DATE"));
                if (sriOverallScoreDate && (sriOverallScoreDate.indexOf('/') > -1 || sriOverallScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(sriOverallScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapSRIOVRScore(signature, row, scoreData.SCORETYPE));
            } else if (scoreData.SCORETYPE === "LEX") {
                var lexileScoreDate = _util.coalesce( row.getField("LEXILE_MOD_DATE"), row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapLexileScore(signature, row, scoreData.SCORETYPE));
            }
            else if (scoreData.SCORETYPE === "OVR") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
            else if (scoreData.SCORETYPE === "ELA_RD_COMP") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
            else if (scoreData.SCORETYPE === "ELA_LANG") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
            else if (scoreData.SCORETYPE === "MA_NUM") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
            else if (scoreData.SCORETYPE === "MA_OP_AL") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
            else if (scoreData.SCORETYPE === "MA_MEA_PRO") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
            else if (scoreData.SCORETYPE === "MA_GEO") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
            else if (scoreData.SCORETYPE === "MA_FRA_PRO") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
            else if (scoreData.SCORETYPE === "MA_FUN") {
                var lexileScoreDate = _util.coalesce(row.getField("TEST_DATE"));
                if (lexileScoreDate && (lexileScoreDate.indexOf('/') > -1 || lexileScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.SCORETYPE + '#' + String(lexileScoreDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], (scoreData.MAP_FUNCTION)(row, scoreData, signature));
            }
        });
        return scoresByDate;
    }

    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     * @returns {Object}
     */
    function mapNormalizedRecord(signature, hierarchy, row, scoreDateKey, scores) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = scores;
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, scoreDateKey);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);


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
    function mapNormalizedAdminFields(signature, hierarchy, row, scoreDateKey) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var getScoreDate = scoreDateKey.split('#')[1];
        var getScoreType = scoreDateKey.split('#')[0];

        var tad = parseDate(getScoreDate);

        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        var birthDate = _util.coalesce(row.getField("BIRTH_DATE"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, getScoreDate, getScoreType);
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
                    record.REPORTING_PERIOD =  _util.coalesce(getTEST_ADMIN_PERIOD(row, getScoreDate), hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = tad.STANDARD_DATE;
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_ID"), row.getField("SCHOOL_NAME"));
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

                case "STUDENT_STATE_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("SIS_ID"), row.getField("USER_NAME"));
                    break;
                case "STUDENT_LOCAL_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("USER_ID"), row.getField("USER_NAME"));
                    break;
                case "STUDENT_VENDOR_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_VENDOR_ID = row.getField("USER_NAME");
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
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = decodeStudentGrade[_util.coalesce(row.getField("GRADE"))];
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
    function mapAdditionalAdminFields(admin, row) {
        return admin;
    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapSRIOVRScore(signature, row, scoreType) {
        var score = {};
        var grade = decodeStudentGrade[row.getField("GRADE")];
        var scaleScore = _util.coalesce(row.getField("SRI_LAST_LEXILE_SCORE"));
        var modDate = row.getField("SRI_LAST_LEXILE_DATE");
        var percentile = row.getField("SRI_PERCENTILE");
        var nce = row.getField("SRI_NCE");
        if (scaleScore === null || scaleScore === "#NULL!" || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        var testNumber = generateTestNumber(row, scoreType, null);


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_READING_LEVEL"] = scaleScore;

        if (modDate !== null && modDate !== undefined && modDate !== '') {
            score["TEST_SCORE_ATTRIBUTES"] =  AppUtil.getMonthFollowedByDay(modDate).STANDARD_DATE;
        }

        score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_NCE_SCORE"] = nce;
        if(scaleScore === 'BR'){
            if(grade === "KG" || grade === "01"){
                score["TEST_PRIMARY_RESULT"] = 'Basic'
            } else {
                score["TEST_PRIMARY_RESULT"] = 'Below Basic'
            }
        }
        return score;
    }

    function mapSRIScore(signature, row, bucket, scoreType) {
        var score = {};
        var testDate = _util.coalesce(row.getField("SRI_" + "TEST_DATE_" + bucket));
        var lexileScores = _util.coalesce(row.getField("SRI_" + "LEXILE_SCORES_" + bucket));
        var totalTime = row.getField("SRI_" + "TOTAL_TIME_PER_TEST_" + bucket);
        var testNames = row.getField("SRI_" + "TEST_NAMES_" + bucket);
        var gradeLevel = row.getField("SRI_" + "GRADE_LEVEL_" + bucket);
        var performanceLevel = _util.coalesce(row.getField("SRI_" + "PERFORMANCE_LEVEL_" + bucket));
        var testNumber = generateTestNumber(row, scoreType, bucket);

        if (lexileScores === null || lexileScores === "#NULL!" || lexileScores === undefined || _util.trim(lexileScores) === "--" || _util.trim(lexileScores) === "") {
            return null;
        }
        if (testDate === null || testDate === "#NULL!" || testDate === undefined || _util.trim(testDate) === "--" || _util.trim(testDate) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = lexileScores;
        if(!isNaN(lexileScores)){
            score["TEST_SCORE_VALUE"] = lexileScores;
            score["TEST_SCALED_SCORE"] = lexileScores;
        }
        score["TEST_READING_LEVEL"] = lexileScores;
        score["TEST_SCORE_ATTRIBUTES"] = testNames;
        if(performanceDecode[performanceLevel] === null || performanceDecode[performanceLevel] === "#NULL!" || performanceDecode[performanceLevel] === undefined || _util.trim(performanceDecode[performanceLevel]) === "--" || _util.trim(performanceDecode[performanceLevel]) === ""){
            score["TEST_PRIMARY_RESULT_CODE"] = null;
            score["TEST_PRIMARY_RESULT"] = null;
            score["TEST_PASSED_INDICATOR"] = null;
        } else {
            score["TEST_PRIMARY_RESULT_CODE"] = performanceDecode[performanceLevel].LEVEL;
            score["TEST_PRIMARY_RESULT"] = performanceDecode[performanceLevel].DESC;
            score["TEST_PASSED_INDICATOR"] = performanceDecodePassFail[performanceLevel];
        }
        score["TEST_GRADE_EQUIVALENT"] = decodeStudentGrade[gradeLevel];
        score["TEST_TERTIARY_RESULT"] = totalTime;
        if((testDate && testDate!==null && testDate.toString().length===10) || (testDate && testDate!==null && testDate.toString().length===9)){
            score["TEST_QUATERNARY_RESULT"] = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
        }
        return score;
    }

    function mapFRAScore(signature, row, bucket, scoreType) {
        var score = {};
        var testDate = row.getField("SRI_FRA_" + "TEST_DATE_" + bucket);
        var items = row.getField("SRI_FRA_" + "TOTAL_ITEMS_RECEIVED_" + bucket);
        var accuracy = row.getField("SRI_FRA_" + "TOTAL_ACCURACY_SCORE_" + bucket);
        var fluency = row.getField("SRI_FRA_" + "TOTAL_FLUENCY_SCORE_" + bucket);
        var totalTime = row.getField("SRI_FRA_" + "TOTAL_TIME_PER_TEST_" + bucket);

        if (items === null || items === "#NULL!" || items === undefined || _util.trim(items) === "--" || _util.trim(items) === "") {
            return null;
        }
        var testNumber = generateTestNumber(row, scoreType, bucket);

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_ITEMS_ATTEMPTED"] = items;
        score["TEST_PRIMARY_RESULT"] = accuracy;
        score["TEST_SECONDARY_RESULT"] = fluency;
        score["TEST_TERTIARY_RESULT"] = totalTime;
        if((testDate && testDate!==null && testDate.toString().length===10) || (testDate && testDate!==null && testDate.toString().length===9)){
            score["TEST_QUATERNARY_RESULT"] = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
        }

        return score;
    }

    function mapLexileScore(signature, row, scoreType) {
        var score = {};
        var grade = decodeStudentGrade[row.getField("GRADE")];
        var scaleScore = _util.coalesce(row.getField("LEXILE"),row.getField("LEXILE_SCORE"),row.getField("SCALED_SCORE"));
        var modDate = row.getField("LEXILE_MOD_DATE");
        var performanceLevel = row.getField("PERFORMANCE_LEVEL");
        var lexileMin = row.getField("LEXILE_MIN");
        var lexileMax = row.getField("LEXILE_MAX");
        var elaReadingComprehensionLevel = row.getField("ELA_READING_COMPREHENSION_LEVEL");
        var elaLanguageLevel = row.getField("ELA_LANGUAGE_LEVEL");

        if (scaleScore === null || scaleScore === "#NULL!" || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        var testNumber = generateTestNumber(row, scoreType, null);


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_READING_LEVEL"] = scaleScore;
        score["TEST_SCORE_ATTRIBUTES"] = modDate;
        score["TEST_UPPER_BOUND"] = lexileMax;
        score["TEST_LOWER_BOUND"] = lexileMin;
        if(scaleScore === 'BR'){
            if(grade === "KG" || grade === "01"){
                score["TEST_PRIMARY_RESULT"] = 'Basic'
            } else {
                score["TEST_PRIMARY_RESULT"] = 'Below Basic'
            }
        }
        else{
               score["TEST_PRIMARY_RESULT_CODE"] = performanceDecode[performanceLevel].LEVEL;
               score["TEST_PRIMARY_RESULT"] = performanceDecode[performanceLevel].DESC;
               score["TEST_SECONDARY_RESULT"] = performanceDecode[elaReadingComprehensionLevel].LEVEL;
               score["TEST_SECONDARY_RESULT_CODE"] = performanceDecode[elaReadingComprehensionLevel].DESC;
               score["TEST_TERTIARY_RESULT"] = performanceDecode[elaLanguageLevel].LEVEL;
               score["TEST_TERTIARY_RESULT_CODE"] = performanceDecode[elaLanguageLevel].DESC;

        }
        return score;
    }


    function mapOverallScore(row, testMetadata, signature) {
        var score = {};
        var testNumber = testMetadata.TEST + "_"  + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "SCALED_SCORE");
        var level = row.getField(testMetadata.FIELD + "LEVELS");
        if(testMetadata.CODE === "OVR"){
            var gradeCode = row.getField("OVERALL_GRADE_LEVEL_EQUIVALENCE");
            var gradeDef = row.getField("OVERALL_GRADE_LEVEL_EQUIVALENCE_CATEGORY");
            var min = _util.coalesce(row.getField("OVERALL_LEXILE_MIN"),row.getField("OVERALL_QUANTILE_MIN"));
            var max = _util.coalesce(row.getField("OVERALL_LEXILE_MAX"),row.getField("OVERALL_QUANTILE_MAX"));
        }


        if(level === null || level === "#NULL!" || level === undefined || _util.trim(level) === "--" || _util.trim(level) === ""){
            return null;
        }
        if(row.getField("TEST_LEVEL")!== null && row.getField("TEST_LEVEL")!== "" && row.getField("TEST_LEVEL")!== undefined ){//and not "" and not undefined
            testNumber = testNumber + "_" + row.getField("TEST_LEVEL");
        }
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
    	score["TEST_SCORE_TEXT"] = level;
        score["TEST_PRIMARY_RESULT"] = performanceDecode[level].DESC;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceDecode[level].LEVEL;
        score["TEST_QUATERNARY_RESULT_CODE"] = gradeCode;
        score["TEST_QUATERNARY_RESULT"] = gradeDef;
        score["TEST_UPPER_BOUND"] = max;
        score["TEST_LOWER_BOUND"] = min;

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

    function writeNormalizedRecords(file, data) {
        try {
            const normalFile = _file.open(file);
            const normalFilePath = normalFile.getParent();
            const normalFileName = normalFile.getName();
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

                    record = { LINEAGE_FILE: null, LINEAGE_LINE: null };

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


    /**
     * Generates an Assessment Admin Key using a combination of hierarchy values and natural keys from an assessment signature
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param srcRecord The assessment record being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, testDate, scoreType) {
    try{
        var period = getTEST_ADMIN_PERIOD(srcRecord, testDate);
        var periodInfo = _util.coalesce(period,hierarchy.REPORTING_PERIOD)
        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${periodInfo}`;
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key), ""));
        });
        assessmentAdminKey = assessmentAdminKey + "_" + scoreType + "_" + parseDate(testDate).STANDARD_DATE;

        if (signature.getFormat().getFormatName() === "RDINV_59COLS" && srcRecord.getField("TEST_LEVEL")!=="" && srcRecord.getField("TEST_LEVEL")!== null && srcRecord.getField("TEST_LEVEL")!== undefined ) {
             assessmentAdminKey = assessmentAdminKey + "_" + srcRecord.getField("TEST_LEVEL");//Needed when testing multiple subjects same day like Algebra and Geometry
        }
        //assessmentAdminKey = assessmentAdminKey + "_" + parseDate(testDate).STANDARD_DATE;
        return assessmentAdminKey;
        }catch(e){
        print("generateAssessmentAdminKey error:: ${e}\n");
        }
    }

    function generateTestNumber(row, scoreType, attempt) {

        var testNumber = "RDINV_" + scoreType;
        if (attempt !== null) {
            testNumber = testNumber + "_" + attempt;
        }

        return testNumber;
    }

    function getTEST_ADMIN_PERIOD(row, testDate) {
        var testAdminPeriod = null;
        var sdObj = testDate;
        var term = row.getField("TERMC0DE");
        if (term === "#N/A"){
        return null;
        }
        if (sdObj !== null){
        var sd = parseDate(sdObj).STANDARD_DATE;
        var month = sd.substring(0, 2);
        }
        if (term){
            if (term === 'YR' || term === 'YRE'){
                if (month === "08" || month === "09" || month === "10" || month === "11") {
                    testAdminPeriod = "Pre";
                }else if (month === "12" || month === "01" || month === "02" || month === "03") {
                    testAdminPeriod = "Mid";
                }else if (month === "04" || month === "05" || month === "06") {
                    testAdminPeriod = "Post";
                }
           }
            else if (term === 'S1C' || term === 'S1'){
               if (month === "08" || month === "09" || month === "10") {
                   testAdminPeriod = "Pre";
               }else if (month === "11") {
                   testAdminPeriod = "Mid";
               }else if (month === "12" || month === "01") {
                   testAdminPeriod = "Post";
               }
            }
            else if (term === 'S2C' || term ==='S2'){
               if (month === "02" || month === "03") {
                   testAdminPeriod = "Pre";
               }else if (month === "04") {
                   testAdminPeriod = "Mid";
               }else if (month === "05" || month === "06") {
                   testAdminPeriod = "Post";
               }
            }
        }
       else{
        if (month === "07" || month === "08" || month === "09" || month === "10" || month === "11") {
            testAdminPeriod = "FALL";
        }else if (month === "12" || month === "01" || month === "02" || month === "03") {
            testAdminPeriod = "WINTER";
        }else if (month === "04" || month === "05" || month === "06") {
            testAdminPeriod = "SPRING";
        }else {
            testAdminPeriod = "ALL";
        }
        }
        return testAdminPeriod;
    }


    function parseDate(rawDate) {
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

        var format;

        if (rawDate.indexOf('/') > -1) {
            if (rawDate.split('/')[0].length === 4) {
                    format = 'yyyy/MM/dd';
            } else if(rawDate.length() === 10){
                format = 'MM/dd/yyyy';
            } else {
                format = 'M/dd/yyyy';
            }
        } else if (rawDate.indexOf('-') > -1) {
            if (rawDate.split('-')[0].length === 4) {
                    format = 'yyyy-MM-dd';
            } else if(rawDate.length() === 10){
                format = 'MM-dd-yyyy';
            } else {
                format = 'M-dd-yyyy';
            }
        }

        var formatter = new java.text.SimpleDateFormat(format);
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


    return module;


}());