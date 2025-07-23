var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CCRA";
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

            print("\nNormalized file: ${normalizedFile}");

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
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found/Test Date Blank", JSON.stringify(row)));
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
    var scoresToMap = [
        {TEST: "CCRA", FIELD: "SUBJECT", MAP_FUNCTION: mapScores}
        ,{TEST: "OAAP", FIELD: "SUBJECT", MAP_FUNCTION: mapOAAPScores}
        ,{TEST: "CCRA",  FIELD:"SCIENCE_PHYSICAL_SCIENCE", CODE: "SCI_PHYS", PARENT:"SCIENCE_-",  MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CCRA",  FIELD:"SCIENCE_LIFE_SCIENCE", CODE: "SCI_LIFSCI", PARENT:"SCIENCE_-",  MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CCRA",  FIELD:"SCIENCE", CODE: "SCI_OVR",  MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CCRA",  FIELD:"U.S_HISTORY", CODE: "US_HIST_OVR", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CCRA",  FIELD:"U.S_HISTORY_CATEGORY", CODE: "US_CAT", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CCRA",  FIELD:"CIVICS", CODE: "CIV", PARENT:"CIVICS", MAP_FUNCTION: mapStrandScore}
    ];


    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var collegeReadinessDecodes = {
        "Below Basic": "Not College Ready",
        "Basic": "May Not Be College Ready",
        "Proficient": "College Ready",
        "Advanced": "College Ready"
    };

    var passingDecodes = {
        "Not College Ready": "No",
        "May Not Be College Ready": "No",
        "College Ready": "Yes",
        "": null,
        null: null
    }

    var performanceDecodes = {
        "1": "Below Basic",
        "2": "Basic",
        "3": "Proficient",
        "4": "Advanced",
        "": null,
        null: null
    }

    //decode subjects and groups
    var decodeSubjects = {
        "ELA": "ELA",
        "MATH": "MATH",
        "SCIE": "SCIENCE",
        "SCIENCE": "SCIENCE",
        "English Language Arts": "ELA",
        "Mathematics": "MATH",
        "Science": "SCIENCE",
        "US History": "HISTORY",
        "Reading": "READING",
        "READING": "READING"
    }

    var recodePerformanceLevel = {
        "Basic" 	: "BAS"
        ,"Below Basic"	: "BEL"
        ,"Proficient"	: "PRO"
        ,"Advanced"	: "ADV"
        ,"Below Standard": "BLS"
        ,"At/Near Standard": "ANS"
        ,"Above Standard": "ABS"
        ,"Approaching Expectations" : "APE"
        ,"Achieving Expectations" : "ACE"
        ,"Near/At Expectations" : "NAE"
        ,null	: null
    };

    var passPerformanceLevel = {
        "Basic" 	: "No"
        ,"Below Basic"	: "No"
        ,"Below Standard": "No"
        ,"At/Near Standard": "Yes"
        ,"Above Standard": "Yes"
        ,"Proficient"	: "Yes"
        ,"Advanced"	: "Yes"
        ,"Approaching Expectations" : "No"
        ,"Achieving Expectations" : "Yes"
        ,"Near/At Expectations" : "Yes"
        ,null	: null
    };

    var gradeDecode = {
        "KG"	: "KG"
        , "01"	: "01"
        , "Grade 01"	: "01"
        ,"02"	: "02"
        ,"Grade 02"	: "02"
        ,"03"	: "03"
        ,"Grade 03"	: "03"
        ,"04"	: "04"
        ,"Grade 04"	: "04"
        ,"05"	: "05"
        ,"Grade 05"	: "05"
        ,"06"	: "06"
        ,"Grade 06"	: "06"
        ,"07"	: "07"
        ,"Grade 07"	: "07"
        ,"08"	: "08"
        ,"Grade 08"	: "08"
        ,"09"	: "09"
        ,"Grade 09"	: "09"
        ,"10"	: "10"
        ,"Grade 10"	: "10"
        ,"11"	: "11"
        ,"Grade 11"	: "11"
        ,"12"	: "12"
        ,"Grade 12"	: "12"
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
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
        // var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "MM/dd/yy");
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = _util.coalesce(row.getField("STUDENT_BIRTHDATE"))

        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        if(row.getField("TEST_DATE")){
            var testDate = mapDateObject(hierarchy, row, row.getField("TEST_DATE"));
            var formatDate = testDate.YEAR === null ? null : "${testDate.MONTH}/${testDate.DAY}/${testDate.YEAR}";
        } else {
            var formatDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5);
        }
        if(row.getField("TEST_ADMIN")){
            var period = row.getField("TEST_ADMIN");
        } else {
            var period = hierarchy.REPORTING_PERIOD;
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:  row.getField("FULL_CODE");
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = _util.coalesce(period, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = formatDate;
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("FULL_CODE"), row.getField("SITE_CODE"), row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("FULL_CODE"), row.getField("SCHOOL_LOCAL_ID"), 'DISTRICT');
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
                    break;
                case "STATE_STUDENT_ID":
                    record.STATE_STUDENT_ID = row.getField("STATE_STUDENT_ID");
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[(row.getField("TEST_GRADE"))];
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STN"), row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STN"), row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STN"), row.getField("STUDENT_LOCAL_ID"));
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
    function mapScores(row, testMetadata) {
        /* CCRA uses the same columns for all score types so we must
           look at the row data to determine the score type and score */
        var testScoreElement = {};
        var scoreType = _util.coalesce(row.getField("SUBJECT_GROUP"), row.getField("SUBJECT"));
        var subject = decodeSubjects[scoreType];
        var type =  _util.trim(row.getField("TYPE"));
        if(type === "OAAP"){
            return null;
        }
        if(type === "CCRA"){
            var testNumber = testMetadata.TEST + subject;
        }
        var scaleScore = _util.trim(row.getField("SCALE_SCORE"));
        var noScoreCode = _util.trim(_util.coalesce(row.getField("NO_SCORE_CODE"), row.getField("REASON_FOR_NO_SCORE")));
        var performanceLevel = row.getField("PERFORMANCE_LEVEL")
        var testDate = row.getField("TEST_DATE");
        var readinessDecodes;
        var performanceCode;

        if(testDate === null || testDate === undefined){
            return null;
        }

        if ([null, undefined, '', '--', 'N/A', '-1'].some((falsy) => scaleScore === falsy)) {
            return null;
        }

        if (scaleScore === "0") {
            testScoreElement["REASON_FOR_NO_SCORE"] = noScoreCode;
        }

        if(performanceLevel === "0" || performanceLevel === "" || performanceLevel === null) {
            return null;
        }

        performanceCode = performanceLevel.charAt(0);

        readinessDecodes = collegeReadinessDecodes[performanceDecodes[performanceCode]] === undefined ? null : collegeReadinessDecodes[performanceDecodes[performanceCode]];

        testScoreElement["TEST_NUMBER"] = testNumber;
        testScoreElement["TEST_SCORE_VALUE"] = performanceCode;
        testScoreElement["TEST_SCORE_TEXT"] = performanceCode;
        testScoreElement["TEST_SCALED_SCORE"] = scaleScore;
        testScoreElement["TEST_PRIMARY_RESULT_CODE"] = performanceCode;
        testScoreElement["TEST_PRIMARY_RESULT"] = performanceDecodes[performanceCode];
        testScoreElement["TEST_PASSED_INDICATOR"] = passingDecodes[readinessDecodes];


        return testScoreElement;

    }

    function mapOAAPScores(row, testMetadata) {

        var testScoreElement = {};
        var scoreType = _util.coalesce(row.getField("SUBJECT_GROUP"), row.getField("SUBJECT"));
        var subject = decodeSubjects[scoreType];
        var type =  _util.trim(row.getField("TYPE"));
        if(type === "CCRA"){
            return null;
        }
        if(type === "OAAP"){
            var testNumber = testMetadata.TEST + subject;
        }

        var scaleScore = _util.trim(row.getField("SCALE_SCORE"));
        var noScoreCode = _util.trim(_util.coalesce(row.getField("NO_SCORE_CODE"), row.getField("REASON_FOR_NO_SCORE")));
        var performanceLevel = row.getField("PERFORMANCE_LEVEL");
        var readinessDecodes;
        var performanceCode;

        if (([null, undefined, '', '--', 'N/A', '-1'].some((falsy) => scaleScore === falsy))
            && (performanceLevel === "0" || performanceLevel === null || performanceLevel === ""))
        {
            return null;
        }

        if (scaleScore === "0") {
            testScoreElement["REASON_FOR_NO_SCORE"] = noScoreCode;
        }

        if(performanceLevel === null || performanceLevel === "" ) {
            performanceCode = null;
            readinessDecodes = null;
        } else {
            performanceCode = performanceLevel.charAt(0) === null ? null : performanceLevel.charAt(0);
            readinessDecodes = collegeReadinessDecodes[performanceDecodes[performanceCode]] === undefined ? null : collegeReadinessDecodes[performanceDecodes[performanceCode]];
        }

        testScoreElement["TEST_NUMBER"] = testNumber;
        testScoreElement["TEST_SCORE_VALUE"] = performanceCode;
        testScoreElement["TEST_SCORE_TEXT"] = performanceCode;
        testScoreElement["TEST_SCALED_SCORE"] = scaleScore;
        testScoreElement["TEST_PRIMARY_RESULT_CODE"] = performanceCode;
        testScoreElement["TEST_PRIMARY_RESULT"] = performanceDecodes[performanceCode];
        testScoreElement["TEST_PASSED_INDICATOR"] = passingDecodes[readinessDecodes];


        return testScoreElement;

    }

    function mapStrandScore(row, testMetadata) {
        var score = {};

        var testNumber = testMetadata.TEST + "_"+ testMetadata.CODE;
        var opi = row.getField(testMetadata.FIELD + "_OPI");
        var performanceLevel = row.getField(testMetadata.FIELD+"_PERFORMANCE_LEVEL");

        // Check for key fields and do not map score and exit if conditions met.
        if( performanceLevel === "" || performanceLevel===undefined || performanceLevel===null|| _util.trim(performanceLevel) === "" || performanceLevel === "DNA"
            || performanceLevel === "INV-B" || performanceLevel === "INV") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(!isNaN(opi)){
            score["TEST_SCORE_VALUE"] = opi;
            score["TEST_SCALED_SCORE"] = opi;
        }
        score["TEST_SCORE_TEXT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = recodePerformanceLevel[performanceLevel];
        score["TEST_PASSED_INDICATOR"] = passPerformanceLevel[performanceLevel];
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

        var scoreType = _util.coalesce(srcRecord.getField("SUBJECT_GROUP"), srcRecord.getField("SUBJECT"));
        var subject = decodeSubjects[scoreType];
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        var defaultAdminDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5);


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        if (signature.getFormat().getFormatName() === 'CCRA_2019_2023_SCI_US'){

            assessmentAdminKey = assessmentAdminKey + "_" + defaultAdminDate;
        }
        else
        assessmentAdminKey = assessmentAdminKey + "_" + subject;

        return assessmentAdminKey;
    }

    function mapDateObject(hierarchy, row, dateStr){
        var testDateObject = null;
        var newDate;

        // See Requirements from Client in UIHN-23815(Comments) for below changes
        var type =  _util.trim(row.getField("TYPE"));
        if(type === "CCRA"){
            if (dateStr === null || dateStr === "") {
                newDate = "5/15/" + hierarchy.SCHOOL_YEAR.substring(5);
                testDateObject = AppUtil.getDateObjByPattern(newDate, "M/dd/yyyy");
                return testDateObject;
            }
        }
        if(type === "OAAP"){
            if (dateStr === null || dateStr === "") {
                newDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5);
                testDateObject = AppUtil.getDateObjByPattern(newDate, "MM/dd/yyyy");
                return testDateObject;
            }
        }


        //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
        } catch(exception){
            // Error will be reported in final check.
        }

        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "M/dd/yyyy");
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
        // Set default empty objects if mappings fail and report error.
        if(testDateObject === null){
            testDateObject = AppUtil.getEmptyDateObj(dateStr);
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING",row.getRawField("LINEAGE_LINE"), "Error parsing date string: ${dateStr}", JSON.stringify(row.getSourceRow())));
        }

        return testDateObject;
    }

    return module;


}());
