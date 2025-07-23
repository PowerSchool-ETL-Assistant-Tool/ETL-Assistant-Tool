var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AIR_ELPT";
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
            {TEST: "ELPA21", CODE: "OVR", FIELD:"OVERALL", MAP_FUNCTION: mapCompositeScore}
            , {TEST: "ELPA21", CODE: "COMPR", FIELD:"SS", MAP_FUNCTION: mapComprehensionScore}
            , {TEST: "ELPA21", CODE: "LIS", FIELD: "LISTENING", MAP_FUNCTION: mapScore}
            , {TEST: "ELPA21", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapScore}
            ,{TEST: "ELPA21", CODE: "SPK", FIELD: "SPEAKING", MAP_FUNCTION: mapScore}
            , {TEST: "ELPA21", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapScore}
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

    var decodePerformanceLevel = {
        "1" 	: {LEVEL: "Level 1", DESC: "Beginning"}
        ,"Beginning" 	: {LEVEL: "Level 1", DESC: "Beginning"}
        ,"2"	: {LEVEL: "Level 2", DESC: "Early Intermediate"}
        ,"Early Intermediate"	: {LEVEL: "Level 2", DESC: "Early Intermediate"}
        ,"3"	: {LEVEL: "Level 3", DESC: "Intermediate"}
        ,"Intermediate"	: {LEVEL: "Level 3", DESC: "Intermediate"}
        ,"4"	: {LEVEL: "Level 4", DESC: "Early Advanced"}
        ,"Early Advanced"	: {LEVEL: "Level 4", DESC: "Early Advanced"}
        ,"5"	: {LEVEL: "Level 5", DESC: "Advanced"}
        ,"Advanced"	: {LEVEL: "Level 5", DESC: "Advanced"}
        ,"0"	: {LEVEL: "0", DESC: "Performance Not Determined"}
        ,"Performance Not Determined"	: {LEVEL: "0", DESC: "Performance Not Determined"}
        ,"N"	: {LEVEL: "N", DESC: "Not Attempted"}
        ,"Not Attempted"	: {LEVEL: "N", DESC: "Not Attempted"}
        ,"E"	: {LEVEL: "E", DESC: "Exempt"}
        ,"Exempt"	: {LEVEL: "E", DESC: "Exempt"}
        ,null	: null
        ,""     : null
    };
    var decodeProficiencyLevel = {
        "1" 	: {LEVEL: "1", DESC: "Emerging"}
        ,"Emerging" 	: {LEVEL: "1", DESC: "Emerging"}
        ,"2"	: {LEVEL: "2", DESC: "Progressing"}
        ,"Progressing"	: {LEVEL: "2", DESC: "Progressing"}
        ,"3"	: {LEVEL: "3", DESC: "Proficient"}
        ,"Proficient"	: {LEVEL: "3", DESC: "Proficient"}
        ,"D"	: {LEVEL: "D", DESC: "Proficiency Not Determined"}
        ,"N"	: {LEVEL: "N", DESC: "Not Attempted"}
        ,"E"	: {LEVEL: "E", DESC: "Exempt"}
        ,null	: null
        ,""     : null
    };
      var overallProficiencyDecode = {
              "Emerging" : "E"
              ,"Progressing 1" : "P1"
              ,"Progressing 2" : "P2"
              ,"Progressing 3" : "P3"
              ,"Transitioning/Proficient" : "T"
              ,"" : null
              ,null : null
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

        var studentName = row.getField("STUDENT_NAME");
        var lastName = studentName.split(",")[1];
        var firstName = studentName.split(",")[0];

        var birthDateObject = "";
        if(row.getField("BIRTH_DATE")!==null && row.getField("BIRTH_DATE") !== undefined){
            birthDateObject = parseDate(row.getField("BIRTH_DATE"));
        }
        var simpleDate =  _util.coalesce(row.getField("ASSESSMENTSESSIONACTUALENDDATETIME"),row.getField("DATE_TAKEN"));
        if(simpleDate && simpleDate.length===11){
            simpleDate = '0'+simpleDate;
        }
        var testDateObject = parseDate(simpleDate);

        /*  pre UIHN-9419:
        var trimmedDistrictCodeColumn =  _util.coalesce(
                    row.getField("RESPONSIBLEDISTRICTIDENTIFIER")
                    , AssessmentLoader.config.DISTRICT_CODE
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

        var schoolLocalIDColumn = _util.coalesce(row.getField("RESPONSIBLESCHOOLIDENTIFIER"));
        var schoolLocalID = null;

        // School Local ID
        // Example 002_002003
        if(schoolLocalIDColumn.indexOf("_") >= 0) {
           schoolLocalID = schoolLocalIDColumn.split("_").pop().replace(')', '');
        } else {
           schoolLocalID = schoolLocalIDColumn;
        }

        if(schoolLocalIDColumn !== null && schoolLocalIDColumn !== undefined && schoolLocalIDColumn !== "" && schoolLocalIDColumn.indexOf(" (") > -1){
            var schoolName = schoolLocalIDColumn.split(" (")[0];
        }

        const PERIOD_INFO = (() => {
                let term = row.getField("TEST_REASON");
                let period = '';
                let year = '';
                if (term) {
                    period = term.split(' ')[0].toUpperCase();
                    year = term.split(' ')[1];
                } else {
                    period = hierarchy.REPORTING_PERIOD.toUpperCase();
                    year = hierarchy.SCHOOL_YEAR.substring(5,9);
                }
                return {
                    period: period,
                    year: year
                }
            })();
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:  districtCode;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = PERIOD_INFO.period;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = '01/01/' + PERIOD_INFO.year;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        schoolLocalID
                        , row.getField("RESPONSIBLESCHOOLNAME")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        schoolName,
                        row.getField("RESPONSIBLESCHOOLNAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = null;
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = schoolLocalID;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
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
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADE")));
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = decodeGradeCode(_util.coalesce(row.getField("GRADELEVELWHENASSESSED")));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = null;
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("SSID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("SSID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(firstName, row.getField("FIRSTNAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("MIDDLENAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(lastName, row.getField("LASTNAME"));
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
        //admin.TEST_INTERVENTION_CODE = row.getField("ASSESSMENTACCOMMODATION");
        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapCompositeScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var proficiencyLevel = row.getField("PROFICIENCY");
        var prob = row.getField("PROFICIENCY_PROB");
        var scaleScore = row.getField(testMetadata.FIELD + "_SS");
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");
        var sem = row.getField(testMetadata.FIELD + "_SE");
        var theta = row.getField(testMetadata.FIELD + "_THETA");
        var thetaError = row.getField(testMetadata.FIELD + "_THETA_SE");

        var numItems = row.getField("ASSESSMENTNUMBEROFITEMS");
        var numItemsTaken = row.getField("OPERATIONALNUMBEROFITEMS");

        //var comprehensionLvlScore = row.getField("COMPREHENSION_SS");
        //var comprehensionLvlERR = row.getField("COMPREHENSION_SE");

        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === "" ||_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined){
            return null;
        }
        var proficiency = mapOverallProficiency(row, testMetadata);
        var proficiencyDecode = overallProficiencyDecode[proficiency];

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
        score["TEST_PRIMARY_RESULT_CODE"] = proficiencyDecode;
        score["TEST_PRIMARY_RESULT"] = proficiency;
        score["TEST_SECONDARY_RESULT_CODE"] = decodeProficiencyLevel[proficiencyLevel].LEVEL;
        score["TEST_SECONDARY_RESULT"] = decodeProficiencyLevel[proficiencyLevel].DESC;
        if(!isNaN(rawScore)){
           score["TEST_STANDARD_ERROR"] = sem;
        }
        score["TEST_GROWTH_RESULT_CODE"] = prob;
        score["TEST_TERTIARY_RESULT_CODE"] = theta;
        score["TEST_QUATERNARY_RESULT_CODE"] = thetaError;
        score["TEST_ITEMS_POSSIBLE"] = numItems;
        score["TEST_ITEMS_ATTEMPTED"] = numItemsTaken;
        //score["TEST_SECONDARY_RESULT_CODE"] = comprehensionLvlScore;
        //score["TEST_SECONDARY_RESULT"] = decodePerformanceLevel[comprehensionLvlScore];

        return score;
    }

    function mapComprehensionScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var comprehensionLvlScore = row.getField("COMPREHENSION_SS");
        var sem = row.getField("COMPREHENSION_SE");
        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(comprehensionLvlScore) === "" ||_util.trim(comprehensionLvlScore) === null || _util.trim(comprehensionLvlScore) === undefined){
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = comprehensionLvlScore;
        if(!isNaN(comprehensionLvlScore)){
            score["TEST_SCORE_VALUE"] = comprehensionLvlScore;
            score["TEST_SCALED_SCORE"] = comprehensionLvlScore;
        }
        score["TEST_STANDARD_ERROR"] = sem;
        return score;
    }


    function mapScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var performanceLevel = row.getField(testMetadata.FIELD + "_LEVEL");
        var proficiencyLevel = row.getField("PROFICIENCY");
        var scaleScore = row.getField(testMetadata.FIELD + "_SS");
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");
        var sem = row.getField(testMetadata.FIELD + "_SE");
        var prob = row.getField(testMetadata.FIELD + "_PROB");
        var theta = row.getField(testMetadata.FIELD + "_THETA");
        var thetaError = row.getField(testMetadata.FIELD + "_THETA_SE");
        var numItemsTaken =  row.getField(testMetadata.FIELD + "NUMBEROFITEMS");

        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === "" ||_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined){
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(rawScore)){
            score["TEST_RAW_SCORE"] = rawScore;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevel].LEVEL;
        score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].DESC;
        score["TEST_SECONDARY_RESULT"] = decodeProficiencyLevel[proficiencyLevel].DESC;
        if(!isNaN(sem)){
             score["TEST_STANDARD_ERROR"] = sem;
         }

        score["TEST_GROWTH_RESULT_CODE"] = prob;
        score["TEST_SECONDARY_RESULT_CODE"] = _util.coalesce(theta,decodeProficiencyLevel[proficiencyLevel].LEVEL);
        score["TEST_TERTIARY_RESULT_CODE"] = _util.coalesce(thetaError,decodeProficiencyLevel[proficiencyLevel].DESC);
        score["TEST_ITEMS_ATTEMPTED"] = numItemsTaken;

        return score;
    }




    /***************************************************************************
     Utility Functions
     ***************************************************************************/
    function mapOverallProficiency(row, testMetadata){
        var lowest = 10;
        var highest = 0;
        var decode = 'Not all subjects provided';

        var readingProficiencyLvl = row.getField("READING_LEVEL");
        var writingProficiencyLvl = row.getField("WRITING_LEVEL");
        var listeningProficiencyLvl = row.getField("LISTENING_LEVEL");
        var speakingProficiencyLvl = row.getField("SPEAKING_LEVEL");

        //Determine lowest score
        if(readingProficiencyLvl<lowest){
            lowest = readingProficiencyLvl;
        }
        if(writingProficiencyLvl<lowest){
            lowest = writingProficiencyLvl;
        }
        if(listeningProficiencyLvl<lowest){
            lowest = listeningProficiencyLvl;
        }
        if(speakingProficiencyLvl<lowest){
            lowest = speakingProficiencyLvl;
        }

        //Determine highest score
        if(readingProficiencyLvl>highest){
            highest = readingProficiencyLvl;
        }
        if(writingProficiencyLvl>highest){
            highest = writingProficiencyLvl;
        }
        if(listeningProficiencyLvl>highest){
            highest = listeningProficiencyLvl;
        }
        if(speakingProficiencyLvl>highest){
            highest = speakingProficiencyLvl;
        }

        if(highest<3){
            decode = 'Emerging';
        }
        else if(highest>=3 && lowest < 2){
            decode = 'Progressing 1';
        }
        else if(highest>=3 && lowest < 3){
            decode = 'Progressing 2';
        }
        else if(highest>=3 && lowest < 4){
            decode = 'Progressing 3';
        }
        else if(highest>=4 && lowest >= 4){
            decode = 'Transitioning/Proficient';
        }

        return decode;
    }
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


    function generateTestNumber(row, testMetadata) {

        var testNumber = null;
        if(row.getField("ASSESSMENTSUBTESTIDENTIFIER")){
        testNumber = row.getField("ASSESSMENTSUBTESTIDENTIFIER")+"_"+testMetadata.CODE;

        } else{
            testNumber = testMetadata.TEST+"_"+testMetadata.CODE;
        }
        return testNumber;
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
        var formatter;
        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if((rawDate.indexOf("/")>-1) && rawDate.length===10){
            formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if((rawDate.indexOf("/")>-1) && rawDate.length===9){
            formatter = new java.text.SimpleDateFormat("M/dd/yyyy");
        } else if((rawDate.indexOf("/")>-1) && rawDate.length===8){
             formatter = new java.text.SimpleDateFormat("M/d/yyyy");
         }
        else if(rawDate.indexOf("-")>-1) {
            formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
        }
        else{
            formatter = new java.text.SimpleDateFormat("MMDDYYYYhhmm");
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
