var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MAP_STUDENT_TEST";
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
            print("Loading using signature file ${signatureFormatName}\n");


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("Normalized file: ${normalizedFile}\n");

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
            {TEST: "MAP_ST", CODE: "OVR", TYPE: "MAP", FIELD:"MAP_", MAP_FUNCTION: mapMAPScore}
            ,{TEST: "MAP_ST", CODE: "OVR", TYPE: "MAPA", FIELD:"MAP_", MAP_FUNCTION: mapMAPAScore}//TODO add matching metadata? May exist.
            ,{TEST: "MAP_ST", CODE: "OVR", TYPE: "TN", FIELD:"TERRANOVA_", MAP_FUNCTION: mapTERRAScore}
            ,{TEST: "MAP_ST", CODE: "OVR", TYPE: "EOC", FIELD:"EOC_", MAP_FUNCTION: mapEOCScore}
            ,{TEST: "MAP_ST", CODE: "MC", TYPE: "EOC", FIELD:"_MC", MAP_FUNCTION: mapMAPStrandScore}
            ,{TEST: "MAP_ST", CODE: "PE", TYPE: "EOC", FIELD:"_PE", MAP_FUNCTION: mapMAPStrandScore}
            ,{TEST: "MAP_ST", CODE: "RD", TYPE: "MAP", FIELD:"READING_", MAP_FUNCTION: mapReadingScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KN" 	: "KG"
        ,"0" 	: "KG"
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
        ,"A1"   : "A1"
        ,"A2"   : "A2"
        ,"B1"   : "B1"
        ,"E2"   : "E2"
        ,"GV"   : "GV"
        ,"E1"   : "E1"
        ,"GE"   : "GE"
        ,"AH"   : "AH"
        ,"PS"   : "PS"
    };

    var decodeContentArea = {
        "Mathematics"    : "MA",
        "Mathematics       "    : "MA",
        "Communication Arts"    : "CA",
        "Science"    : "SCI",
        "Social Studies" : "SS",
        "Eng. Language Arts" : "ELA",
        null : null,
        "" : null
    };

    var decodePerformancePassingLevel = {
        "Below Basic": "No"
        , "Basic": "No"
        , "Proficient": "Yes"
        , "Advanced": "Yes"
        , null: null
        ,"" : null
    };

    /*var decodePerformanceLevel = {
        "1" 	: "Level 1"
        ,"2"	: "Level 2"
        ,"3"	: "Level 3"
        ,"4"	: "Level 4"
        ,"E"    : "Exempt"
        ,null	: null
    };

    var decodePerformanceLevelText = {
        "1" 	: "Minimally Developed"
        ,"2"	: "Somewhat Developed"
        ,"3"	: "Moderately Developed"
        ,"4"	: "Well Developed"
        ,"E"    : "Exempt"
        ,null	: null
    };

    var decodePerformanceLevelStrand = {
        "3" 	: "Well Developed"
        ,"2"	: "Somewhat/Moderately"
        ,"1"	: "Beginning"
        ,"E"    : "Exempt"
        ,null	: null
    };

    var decodeConditionCodes = {
        "NT"    : "Not Tested",
        "AT"    : "Alternate Assessment"
    };

    var decodeAttemptedness = {
        "N"     : "Non-Completion",
        "P"     : "Partial-Completion",
        "Y"     : "Completion"
    };

    var decodeIncludeIndicator = {
        "N"     : "Did not test",
        "T"     : "Tested and received ALT condition code",
        "Y"     : "Student met completion/attemptedness"
    };*/

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

    function decodeRaceCode(raceCode) {
        if(raceCode === undefined || raceCode === null ) {
            return null;
        }
        var lkpRaceObj = raceLookup[raceCode];
        if(lkpRaceObj == undefined || lkpRaceObj == null) {
            return null;
        }
        return lkpRaceObj.GRADE_CODE;
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
        var birthDateObject = parseDate(row.getField("DATE_OF_BIRTH"));

        var period = row.getField("EOC_ADMINISTRATION_WINDOW");
        if((period===undefined||period===null||period==="")||(period!=="Fall"&&period!=="Winter"&&period!=="Spring")){
            period = hierarchy.REPORTING_PERIOD;
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:  var trimmedDistrictCode - declaration split from assignment
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = period;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = '05/01/' + row.getField("YEAR");
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL_CODE")
                        , row.getField("SCHOOL_NAME")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL_NAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOL_CODE")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("SCHOOL_CODE")
                    );
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTestDateWithDefault(row.getField("TEST_DATE"),
                        row.getField("EOC_ADMINISTRATION_WINDOW"), hierarchy.SCHOOL_YEAR).STANDARD_DATE;
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
                    record.STUDENT_GRADE_CODE = _util.coalesce(row.getField("GRADE_OF_STUDENT"),row.getField("GRADE_LEVEL"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_STUDENT_NUMBER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("MOSIS_STATE_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("MOSIS_STATE_ID"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('MIDDLE_INITIAL');
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

        admin.TEST_INTERVENTION_DESC = _util.coalesce(row.getField("HS_MATH"),row.getField("MATH_HS_PARTICIPANT"));
        admin.TEST_INTERVENTION_CODE = "HSMA";


        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapCompositeScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField("OVERALL_SCALE_SCORE");
        var performanceLevel = row.getField("OVERALL_PROFICIENCY_LEV");
        var rawScore = row.getField("TEST_BATTERY_RAW_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(rawScore)){
            score["TEST_SCALED_SCORE"] = rawScore;
        }
        score["TEST_SECONDARY_RESULT_CODE"] = performanceLevel;
        //Passing and performance set by benchmarks

        return score;
    }

    function mapTERRAScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var level = _util.trim(row.getField("ACHIEVEMENT_LEVEL"));
        var lexile = _util.trim(row.getField("TERRANOVA_LEXILE_SCORE"));
        var scaleScore = _util.trim(row.getField("TERRANOVA_SCALE_SCORE"));
        var exclude = _util.trim(row.getField("INVALID_TERRANOVA"));

        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === "" || exclude === "Y") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_READING_LEVEL"] = lexile;
        score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel[level];

        return score;
    }

    function mapMAPScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var levelCode = row.getField("ACHIEVEMENT_LEVEL_CODE");
        var level = row.getField("ACHIEVEMENT_LEVEL");
        var scaleScore = _util.coalesce(row.getField("MAP_SCALE_SCORE"));
        var exclude = _util.coalesce(row.getField("MAP_SCORE_INVALIDATION"),row.getField("INVALID_MAP_SCORE"));


        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === "" || exclude === "Y") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_PRIMARY_RESULT_CODE"] = levelCode;
        score["TEST_PRIMARY_RESULT"] = level;
        score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel[level];

        return score;
    }

    function mapMAPAScore(row, testMetadata) {
        if(row.getField("MAP_ALTERNATE")!=="Y"){
            return null;
        }

        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var levelCode = row.getField("ACHIEVEMENT_LEVEL_CODE");
        var level = row.getField("ACHIEVEMENT_LEVEL");
        var scaleScore = row.getField("MAPA_SCORE");
        var exclude = _util.coalesce(row.getField("MAP_SCORE_INVALIDATION"),row.getField("INVALID_MAP_SCORE"));

        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(level) === null || _util.trim(level) === undefined || _util.trim(level) === "" || exclude === "Y") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(scaleScore !== null && _util.trim(scaleScore) !== "" && !isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_TEXT"] = scaleScore;
        } else {
            score["TEST_SCORE_VALUE"] = levelCode;
            score["TEST_SCORE_TEXT"] = levelCode;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = levelCode;
        score["TEST_PRIMARY_RESULT"] = level;
        score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel[level];

        return score;
    }

    function mapEOCScore(row, testMetadata) {
        var score = {};
        var gradeLevel =  getGradeLevelSubject(row,testMetadata);
        var testNumber = generateTestNumber(row, testMetadata) + "_" + gradeLevel;
        var level = _util.trim(row.getField("ACHIEVEMENT_LEVEL"));
        var levelCode = row.getField("ACHIEVEMENT_LEVEL_CODE");
        var rawScore = _util.trim(row.getField("EOC_TOTAL_RAW_SCORE"));
        var percent = _util.trim(row.getField("EOC_TOTAL_PERCENT_CORRECT"));
        var scaleScore = _util.trim(row.getField("EOC_SCORE"));
        var exclude = _util.trim(row.getField("EOC_EXCLUDE"));


        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === "" || exclude === "Y") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(rawScore)){
        score["TEST_RAW_SCORE"] = rawScore;
        }
        score["TEST_PERCENTAGE_SCORE"] = _util.trim(percent);
        score["TEST_PRIMARY_RESULT_CODE"] = levelCode;
        score["TEST_PRIMARY_RESULT"] = level;
        score["TEST_PASSED_INDICATOR"] = decodePerformancePassingLevel[level];

        return score;
    }


    function mapMAPStrandScore(row, testMetadata) {
        var score = {};

        var gradeLevel =  getGradeLevelSubject(row,testMetadata);
        var testNumber = generateTestNumber(row, testMetadata) + "_" + gradeLevel;
        var rawScore = _util.trim(row.getField("EOC_RAW_SCORE"+testMetadata.FIELD));
        var online = _util.trim(row.getField("EOC_ONLINE_TEST"+testMetadata.FIELD));


        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(rawScore) === null || _util.trim(rawScore) === undefined || _util.trim(rawScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = rawScore;
        if(!isNaN(rawScore)){
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
        }
        score["TEST_SCORE_ATTRIBUTES"] = online;

        return score;
    }

    function mapReadingScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var performanceLevel = row.getField("READING_PROFICIENCY_LEVEL");
        var percent = row.getField("READING_PROFICIENCY_PCT");


        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = performanceLevel;
        if(!isNaN(performanceLevel)){
            score["TEST_SCORE_VALUE"] = performanceLevel;
            score["TEST_SCALED_SCORE"] = performanceLevel;
        }
        score["TEST_PERCENTAGE_SCORE"] = _util.trim(percent);
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;


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
        var grade = gradeLookup[srcRecord.getField("GRADE_LEVEL")];
        var subject = _util.trim(srcRecord.getField("CONTENT_AREA"));

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        assessmentAdminKey = assessmentAdminKey +'_' + subject + '_' + grade ;


        return assessmentAdminKey;

    }

    function generateTestNumber(row, testMetadata) {
        var testNumber = null;
        var rawArea = row.getField("CONTENT_AREA");
        if(rawArea!==undefined&&rawArea!==null){
            rawArea = _util.trim(rawArea);
        }
        var area = decodeContentArea[rawArea];
        var additional = "";
        if(row.getField("MAP_ALTERNATE")==="Y"){
            additonal = "A_";
        }
        if(area!==null && area!==undefined){
            testNumber = testMetadata.TEST + "_" + testMetadata.TYPE + additional + "_" + testMetadata.CODE + "_" + area;
        }
        else{
            testNumber = testMetadata.TEST + "_" + testMetadata.TYPE + additional + "_" + testMetadata.CODE;
        }


        return testNumber;

    }
function getGradeLevelSubject(row, testMetadata) {
    var testNameMap = row.getField("TEST_NAME_MAP");
    var rawArea = row.getField("CONTENT_AREA");
    if (rawArea !== undefined && rawArea !== null) {
        rawArea = _util.trim(rawArea);
    }
    var area = decodeContentArea[rawArea];
    var gradeLevel = row.getField("GRADE_LEVEL");
    var subtype = null;

    if(gradeLevel === null || gradeLevel === undefined || gradeLevel === ""){
    return null;
    }

    if (testNameMap === "EOC") {
        if (area === "MA") {
            if (gradeLevel.indexOf('A1') > -1) {
                subtype = 'A1';
            } else if (gradeLevel.indexOf('A2') > -1) {
                subtype = 'A2';
            } else if (gradeLevel.indexOf('GE') > -1) {
                subtype = 'GE';
            }
        }

        if (area === "CA") {
            if (gradeLevel.indexOf('E2') > -1) {
                subtype = 'E2';
            }
            else if (gradeLevel.indexOf('E1') > -1) {
                subtype = 'E1';
            }
        }

        if (area === "SCI") {
            if (gradeLevel.indexOf('B1') > -1) {
                subtype = 'B1';
            }
            else if (gradeLevel.indexOf('PS') > -1) {
                subtype = 'PS';
            }
        }
        if (area === "SS") {
            if (gradeLevel.indexOf('GV') > -1) {
                subtype = 'GV';
            }
            else if (gradeLevel.indexOf('AH') > -1) {
                subtype = 'AH';
            }
        }
        if (area === "ELA") {
            if (gradeLevel.indexOf('E2') > -1) {
                subtype = 'E2';
            }
        }
    }

    return subtype;

}
    /*
    if (rawDate.indexOf('-') > -1) {
            var positionOne = rawDate.indexOf('-');
            var positionTwo = rawDate.indexOf('-', (positionOne+1));

            month = padDateElement(rawDate.substring(positionOne + 1, positionTwo));
            day = padDateElement(rawDate.substring(positionTwo + 1, positionTwo + 3));
            year = padDateElement(rawDate.substring(0, positionOne));
        }
    */

    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "" || _util.trim(_util.coalesce(rawDate, "")).length<6) {
            return dateObj;
        }


        var formatter = new java.text.SimpleDateFormat("MMddyy");
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

    function getTestDateWithDefault(testDateStr, testPeriodStr, schoolYear) {
        let testDate = parseDate(testDateStr);

        // use valid if valid date from test record
        if (testDate.STANDARD_DATE !== null){
            return testDate;
        }

        // else... get default date based on common rules

        /*
            Default date rules:
                If unknown or EOY or Spring 05/15/YYYY
                If known Winter 01/15/YYYY
                If known Fall 09/15/YYYY
        */

        let period = "";

        if (testPeriodStr !== null && testPeriodStr !== undefined) {
            period = _util.trim(testPeriodStr).toUpperCase();
        }

        if (period == 'FALL') {
            testDateObj = AppUtil.getDateObjByPattern('09/15/' + schoolYear.substring(0, 4), 'MM/dd/yyyy');
        }
        else if (period == 'WINTER') {
            testDateObj = AppUtil.getDateObjByPattern('01/15/' + schoolYear.substring(5, 9), 'MM/dd/yyyy');
        }
        else {  // SPRING, unknown, or EOY
            testDateObj = AppUtil.getDateObjByPattern('05/15/' + schoolYear.substring(5, 9), 'MM/dd/yyyy');
        }

        return testDateObj;
    }


    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
