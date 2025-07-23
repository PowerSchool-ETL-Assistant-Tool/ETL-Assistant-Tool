var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CA_STATE";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;
    var perLevelDecode = new HashTable();

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
            print(`Loading using signature file ${signatureFormatName}`);

            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();

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

                        if(mappingObject.SCORE_MAPPINGS === null || mappingObject.SCORE_MAPPINGS.length === 0) {
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

    var scoresToMap = [
        {TEST: "CA_STATE_SUM_", CODE:"LIFE_SCI", FIELD: "LIFE_SCIENCES", MAP_FUNCTION: mapScienceScore},
        {TEST: "CA_STATE_SUM_", CODE:"PHY_SCI", FIELD: "PHYSICAL_SCIENCES", MAP_FUNCTION: mapScienceScore},
        {TEST: "CA_STATE_SUM_", CODE:"EAR_SP_SCI", FIELD: "EARTH_SPACE_SCIENCES", MAP_FUNCTION: mapScienceScore},
    ];

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    //Extend grades
    var gradeLookup = {
        "KN": "KG"
        , "KG": "KG"
        , "01": "01"
        , "1": "01"
        , "G1": "01"
        , "02": "02"
        , "2": "02"
        , "G2": "02"
        , "03": "03"
        , "3": "03"
        , "G3": "03"
        , "04": "04"
        , "4": "04"
        , "G4": "04"
        , "05": "05"
        , "5": "05"
        , "G5":"05"
        , "06": "06"
        , "6": "06"
        , "G6": "06"
        , "07": "07"
        , "7": "07"
        , "G7": "07"
        , "08": "08"
        , "8": "08"
        , "G8": "08"
        , "09": "09"
        , "9": "09"
        , "G9": "09"
        , "10": "10"
        , "G10": "10"
        , "11": "11"
        , "G11": "11"
        , "12": "12"
        , "G12": "12"
        , "UG" : "KG"
        , null: null
        , "": null
     };

     //Extend subjects for Summative from file field
     var decodeSubject = {
        "ELA": "ELA"
        , "MATH": "MA"
        , "Math": "MA"
        , "ELPAC": "ELPAC"
        , "CAAELA": "CAAELA"
        , "CAAMATH": "CAAMA"
        , "CAASCI": "CAASCI"
        , "CAST": "CAST"
        , "CSA": "CSA"
        , "ALTELPAC": "ALTELPAC"
     };

     var perfLevels =
     [
        { LEVEL: '4', DESC: 'Standard Exceeded', PASS_IND: 'Yes', CODE: '4'},
        { LEVEL: '4.0', DESC: 'Standard Exceeded', PASS_IND: 'Yes', CODE: '4'},
        { LEVEL: '3', DESC: 'Standard Met', PASS_IND: 'Yes', CODE: '3' },
        { LEVEL: '3.0', DESC: 'Standard Met', PASS_IND: 'Yes', CODE: '3' },
        { LEVEL: '2', DESC: 'Standard Nearly Met', PASS_IND: 'No', CODE: '2' },
        { LEVEL: '2.0', DESC: 'Standard Nearly Met', PASS_IND: 'No', CODE: '2' },
        { LEVEL: '1', DESC: 'Standard Not Met', PASS_IND: 'No', CODE: '1' },
        { LEVEL: '1.0', DESC: 'Standard Not Met', PASS_IND: 'No', CODE: '1' },
        { LEVEL: '9', DESC: 'Did not attempt', PASS_IND: 'No', CODE: '9' },
        { LEVEL: '9.0', DESC: 'Did not attempt', PASS_IND: 'No', CODE: '9' },
        { LEVEL: 'Did Not Meet Standard', DESC: 'Did Not Meet Standard', PASS_IND: 'No', CODE: '1' },
        { LEVEL: 'Nearly Met Standard', DESC: 'Nearly Met Standard', PASS_IND: 'No', CODE: '2' },
        { LEVEL: 'Met Standard', DESC: 'Met Standard', PASS_IND: 'Yes', CODE: '3' },
        { LEVEL: 'Exceeded Standard', DESC: 'Exceeded Standard', PASS_IND: 'Yes', CODE: '4' },

        { LEVEL: 'Standard Not Met (Level 1)', DESC: 'Did Not Meet Standard', PASS_IND: 'No', CODE: '1' },
        { LEVEL: 'Standard Nearly Met (Level 2)', DESC: 'Nearly Met Standard', PASS_IND: 'No', CODE: '2' },
        { LEVEL: 'Standard Met (Level 3)', DESC: 'Met Standard', PASS_IND: 'Yes', CODE: '3' },
        { LEVEL: 'Standard Exceeded (Level 4)', DESC: 'Exceeded Standard', PASS_IND: 'Yes', CODE: '4' },
        { LEVEL: "", DESC: null, PASS_IND: null, CODE: null},
        { LEVEL: null, DESC: null, PASS_IND: null, CODE: null},
        { LEVEL: undefined, DESC: null, PASS_IND: null, CODE: null}

     ];

     var scienceLevels =
     {
         "Near Standard" : {LEVEL: "2", DESC: "Near Standard", PASS_IND: "No"},
         "Above Standard" : {LEVEL: "3", DESC: "Above Standard", PASS_IND: "Yes"},
         "Below Standard" : {LEVEL: "1", DESC: "Below Standard", PASS_IND: "No"},
         "" : {LEVEL: null, DESC: null, PASS_IND: null},
         null : {LEVEL: null, DESC: null, PASS_IND: null},
         undefined : {LEVEL: null, DESC: null, PASS_IND: null}


     }

     var claimLevels =
     {
         "3" : {LEVEL: "3", DESC: "Above Standard", PASS_IND: "Yes"},
         "3.0" : {LEVEL: "3", DESC: "Above Standard", PASS_IND: "Yes"},
         "2" : {LEVEL: "2", DESC: "At or Near Standard", PASS_IND: "No"},
         "2.0" : {LEVEL: "2", DESC: "At or Near Standard", PASS_IND: "No"},
         "1" : {LEVEL: "1", DESC: "Below Standard", PASS_IND: "No"},
         "1.0" : {LEVEL: "1", DESC: "Below Standard", PASS_IND: "No"},
         "9" : {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"},
         "" :  { LEVEL: "", DESC: null, PASS_IND: null },
         null : { LEVEL: null, DESC: null, PASS_IND: null },
         undefined : { LEVEL: null, DESC: null, PASS_IND: null }
     };


    var decodeELPACOverallPerformanceLevel = {
      "1": { TEXT: "Minimally Developed", LEVEL: "Level 1", PASS_IND: 'No' },
      "1.0": { TEXT: "Minimally Developed", LEVEL: "Level 1", PASS_IND: 'No' },
      "2": { TEXT: "Somewhat Developed", LEVEL: "Level 2", PASS_IND: 'No' },
      "2.0": { TEXT: "Somewhat Developed", LEVEL: "Level 2", PASS_IND: 'No' },
      "3": { TEXT: "Moderately Developed", LEVEL: "Level 3", PASS_IND: 'Yes' },
      "3.0": { TEXT: "Moderately Developed", LEVEL: "Level 3", PASS_IND: 'Yes' },
      "4": { TEXT: "Well Developed",LEVEL: "Level 4", PASS_IND: 'Yes' },
      "4.0": { TEXT: "Well Developed",LEVEL: "Level 4", PASS_IND: 'Yes' },
      "E": { TEXT: "Exempt", PASS_IND: 'No' },
      "" : { TEXT: "", LEVEL: null, PASS_IND: null},
      null: { TEXT: null, LEVEL: null, PASS_IND: null },
      undefined : { TEXT: null, LEVEL: null, PASS_IND: null }
    };

    var decodeELPACClaimPerformanceLevel = {
     "1": { TEXT: "Beginning", PASS_IND: 'No' },
     "1.0": { TEXT: "Beginning", PASS_IND: 'No' },
     "2": { TEXT: "Somewhat/Moderately", PASS_IND: 'No' },
     "2.0": { TEXT: "Somewhat/Moderately", PASS_IND: 'No' },
     "3": { TEXT: "Well Developed", PASS_IND: 'Yes' },
     "3.0": { TEXT: "Well Developed", PASS_IND: 'Yes' },
     "E": { TEXT: "Exempt", PASS_IND: 'No' },
     "" : { TEXT: null, PASS_IND: null},
     null : { TEXT: null, PASS_IND: null },
     undefined : { TEXT: null, PASS_IND: null }
    };

    var decodeALTELPAC = {
    "1": "Novice English Learner",
    "1.0": "Novice English Learner",
    "2": "Intermediate English Learner",
    "2.0": "Intermediate English Learner",
    "3": "Fluent English Proficient",
    "3.0": "Fluent English Proficient",
     "": null,
     null: null
    };

     /**
     * Maps normalized records for given group of rows.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param rows A JSON array of record objects being processed
     * @returns {Array}
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {

        perfLevels.forEach(
            function (e, i, a) {
               perLevelDecode.setItem(e.LEVEL, e);
            }
         );

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

        //Map normalized try {
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Scores Mappings From Here Generic Build
        try {
            let score = mapTotalScore(row);
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);


            //For Science Scores


          scoresToMap.forEach(function(testMetadata){
try{

            let scienceScore = mapScienceScore(row,testMetadata);
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, scienceScore);
    } catch(exception) {
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
        }
});

            //check the 6 claim strands
            for (let i = 1; i <= 6; i++) {
               let claimScore = mapClaimScore(row, i);
               AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, claimScore);
            }
            for (let i = 1; i <= 6; i++) {
               let altScore = mapAltScore(row, i);
               AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, altScore);
            }
         } catch (exception) {
            mappingObject.ERROR_MESSAGE = exception.message;
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
         }

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

        const testDateObj = module.mapDateObject(hierarchy, row, row.getField("SUBMITDATETIME").replace("Sept", "Sep"));
        const birthDateObject = module.mapDateObject(hierarchy, row, row.getField("STUDENT_BIRTHDATE"));

        normalizedFileFields.forEach(function (field) {
           switch (field) {
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
             case "PARTICIPATION_YEAR":
                record.PARTICIPATION_YEAR = _util.coalesce(row.getField("EDITION"), hierarchy.SCHOOL_YEAR);
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
                record.TEST_ADMIN_DATE = testDateObj.STANDARD_DATE;
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
                record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOLID"), row.getField("SCHOOLNAME"));
                break;
             case "SCHOOL_STATE_ID":
                record.SCHOOL_STATE_ID = _util.coalesce(row.getField("RESPONSIBLE_SCHOOL_CODE"));
                break;
             case "SCHOOL_NAME":
                record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOLNAME"));
                break;
             case "STUDENT_STATE_ID":
                record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENTIDENTIFIER"));
                break;
             case "STUDENT_VENDOR_ID":
                record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENTIDENTIFIER"));
                break;
             case "STUDENT_FIRST_NAME":
                record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRSTNAME"));
                break;
             case "STUDENT_MIDDLE_NAME":
                record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                break;
             case "STUDENT_LAST_NAME":
                record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LASTORSURNAME"));
                break;
             case "STUDENT_GENDER_CODE":
                record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER")) !== null ? _util.coalesce(row.getField("GENDER")).substring(0, 1) : null;
                break;
             case "STUDENT_GRADE_CODE":
                record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADELEVELWHENASSESSED")));
                break;
             case "PARTICIPATION_GRADE":
                record.PARTICIPATION_GRADE = decodeGradeCode(_util.coalesce(row.getField("GRADELEVELWHENASSESSED")));
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
    function mapAdditionalAdminFields(row){
        var admin = {};
        admin.TEST_INTERVENTION_DESC = _util.trim(row.getField("ASSIGNEDACCOMMODATIONLIST"));
        if (_util.trim(row.getField("ADMINISTRATIONCONDITION")) !== "") {
           admin.TEST_INTERVENTION_DESC_2 = _util.trim(row.getField("ADMINISTRATIONCONDITION"));
        }
        if (_util.trim(row.getField("COMPLETENESS")) !== "") {
           admin.TEST_INTERVENTION_DESC_3 = _util.trim(row.getField("COMPLETENESS"));
        }
        if (_util.trim(row.getField("STATUS")) !== "") {
           admin.TEST_INTERVENTION_DESC_4 = _util.trim(row.getField("STATUS"));
        }

        return admin;
    }

    function mapScienceScore(row, testMetadata) {
        var score = {};

        var testNumber = decodeTestNumber(row) + "_" + testMetadata.CODE;

        var sciencePerflevel = row.getField(testMetadata.FIELD);
        // Check for key fields and do not map score and exit if conditions met.
        if(sciencePerflevel === null || sciencePerflevel === undefined || _util.trim(sciencePerflevel) === "--" || _util.trim(sciencePerflevel) === "")
        {
            return null;
        }

    	score["TEST_NUMBER"] = testNumber;
        if(sciencePerflevel){
        score["TEST_PRIMARY_RESULT"] = sciencePerflevel;
    	score["TEST_PRIMARY_RESULT_CODE"] = scienceLevels[sciencePerflevel].LEVEL;
        score["TEST_PASSED_INDICATOR"] = scienceLevels[sciencePerflevel].PASS_IND;
        }

        return score;
    }


    function mapTotalScore(row) {
        let score = {};

        var testNumber = decodeTestNumber(row);

        let scaleScore = _util.coalesce(row.getField('SCALESCORE'));
        let sem = _util.coalesce(row.getField('SCALESCORESTANDARDERROR'));
        let primaryResult = _util.coalesce(row.getField('SCALESCOREACHIEVEMENTLEVEL'));
        let assessmentName = row.getField('ASSESSMENTNAME');
        let maxScore= _util.coalesce(row.getField("LEXILE_BANDS_MAX"), row.getField("QUANTILE_BANDS_MAX"));
        let minScore= _util.coalesce(row.getField("LEXILE_BANDS_MIN"), row.getField("QUANTILE_BANDS_MIN"));
        let lexileScore = _util.coalesce(row.getField("LEXILE_MEASURE"), row.getField("QUANTILE_MEASURE"));

        if(((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (maxScore === null || maxScore === undefined || _util.trim(maxScore) === "--" || _util.trim(maxScore) === "")
        && (minScore === null || minScore === undefined || _util.trim(minScore) === "--" || _util.trim(minScore) === "")
        && (lexileScore === null || lexileScore === undefined || _util.trim(lexileScore) === "--" || _util.trim(lexileScore) === "")))
        {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (lexileScore) {
            score["TEST_NCE_SCORE"] = lexileScore.replace("L", "").replace("Q", "").replace("EM", "");
        }

        if (minScore) {
        score["TEST_LOWER_BOUND"] = minScore.replace("L", "").replace("Q", "").replace("EM", "");
        }
        if (maxScore) {
        score["TEST_UPPER_BOUND"] = maxScore.replace("L", "").replace("Q", "").replace("EM", "");;
        }

        if (!isNaN(sem)) {
        score["TEST_STANDARD_ERROR"] = sem;
        }

        if(testNumber.indexOf('SUM_ALTELPAC') > -1 && row.getField('SUBJECT')){
         score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
         score["TEST_PRIMARY_RESULT"] = decodeALTELPAC[primaryResult];
         }
        //ELPAC Overall Decodes Level 1-4, else CAASSP
        else if (testNumber.indexOf('ELPAC') > -1) {
         score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
         score["TEST_PRIMARY_RESULT"] = decodeELPACOverallPerformanceLevel[primaryResult].LEVEL;
         score["TEST_SECONDARY_RESULT_CODE"] = primaryResult;
         score["TEST_SECONDARY_RESULT"] = decodeELPACOverallPerformanceLevel[primaryResult].TEXT;
         score["TEST_PASSED_INDICATOR"] = decodeELPACOverallPerformanceLevel[primaryResult].PASS_IND;
        } else {
         let decode = decodePrimaryResultCode(primaryResult);
         score["TEST_PRIMARY_RESULT_CODE"] = decode.CODE;
         if (decode != null && decode != undefined) {
            score["TEST_PRIMARY_RESULT"] = decode.DESC;
            score["TEST_PASSED_INDICATOR"] = decode.PASS_IND;
         }
         let claimDecode = claimLevels[primaryResult];
         if(claimDecode != null && claimDecode != undefined){
            score["TEST_CUSTOM_RESULT"] = claimDecode.DESC;
         }
        }

        score["TEST_SCORE_ATTRIBUTES"] = assessmentName;

        return score;
     }

     function decodeTestNumber(row) {

        let testType = row.getField('ASSESSMENTTYPE');

        let subject = decodeSubject[row.getField('SUBJECT').toString().toUpperCase()];

        let grade = getTestGrade(row);

        //High School case where all grades from 09-12 are covered in metadata
        if (row.getField('ASSESSMENTNAME').indexOf('High School') > -1) {
           grade = 'HS';
        }

        if (row.getField('ASSESSMENTNAME').indexOf('Middle School') > -1) {
           grade = 'MS';
        }

        //Summative does not contain assessmentsubtype
        if (testType === 'Interim') {
            let testNameDecode = decodedTest(row);
            testType = 'INT_' + row.getField('ASSESSMENTSUBTYPE') + '_' + subject + '_' +
            testNameDecode + '_' + grade;
        } else if (testType === 'Summative') {
            testType = 'SUM_' + subject + '_' + grade;
        }

        return _assessmentIdentifier + '_' + testType;
     }

     //Interim(Only Type) Test Names Lookup to generate Test Numbers Decodes
     //Distribution With Grades
     var testNumberWithNameLookup = {
        //IAB Interim MATH
        "Operations and Algebraic Thinking": "OAT"
        , "Number and Quantity": "NQ"
        , "Algebra and Functions I": "AFI"
        , "Seeing Structure in Expressions/Polynomial Expressions": "EXPPOL"
        , "Geometry and Right Triangle Trigonometry": "GEOMRTT"
        , "Geometry Congruence": "GEOMC"
        , "Geometry Measurement and Modeling": "GEOMMM"
        , "Algebra and Functions II": "AFII"
        , "Statistics and Probability": "STATPROB"
        , "Interpreting Functions": "INTFUN"
        , "Expressions and Equations": "EXPEQU"
        , "Equations and Reasoning": "EQUREAS"
        , "Geometry": "GEOM"
        , "The Number System": "NUMSYS"
        , "Ratios and Proportional Relationships": "RATPROP"
        , "Functions": "FUNC"
        , "Divide Fractions by Fractions": "DFBF"
        , "Algebraic Expressions": "ALEXP"
        , "Algebraic Expressions and Equations": "ALGEXPEQU"
        , "Congruence and Similarity": "COGSIM"
        , "Analyze and Solve Linear Equations": "ANALLEQU"
        , "Proportional Relationships, Lines, and Linear Equations": "PRLLEQU"
        , "Solve Equations and Inequalities: Linear and Exponential": "SOLEILINEXP"
        , "Number and Operations - Fractions": "NUMOPFRAC"
        , "Number and Operations in Base Ten": "NUMOPBASE10"
        , "Measurement and Data": "MEASDATA"
        , "Performance Task - Turtle Habitat": "PTTH"
        , "Add and Subtract with Equivalent Fractions": "ADDSUBEQI"
        , "Performance Task - Camping Tasks": "PTCT"
        , "Performance Task - Baseball Tickets": "PTBT"
        , "Performance Task - Teen Driving Restrictions": "PTTDR"
        , "Performance Task - Order Form": "PTOF"
        , "Performance Task - Cell Phone Plan": "PTCPP"
        , "Four Operations: Interpret, Represent, and Solve": "FOIRS"
        , "Multiply and Divide within 100": "MULDI"
        , "Linear and Area Measurement": "LIAM"
        , "Time, Volume, and Mass": "TVM"
        , "Properties of Multiplication and Division": "PMUDI"
        , "Factors and Multiples": "FAM"
        , "Multidigit Arithmetic: Place Value and Operations": "MAPVO"
        , "Build Fractions from Unit Fractions": "BFUF"
        , "Performance Task - Animal Jumping": "PTAJ"
        , "Fraction Equivalence and Ordering": "FEO"
        , "Place Value System": "PVS"
        , "Operations with Whole Numbers and Decimals": "OWND"
        , "Volume of Cylinders, Cones, and Spheres": "VCCS"
        , "Create Equations: Quadratic": "CEQ"
        , "Geometric Figures": "GF"
        , "Angles, Areas, and Volume": "AAV"
        , "Equivalent Expressions": "EQEX"
        , "Dependent and Independent Variables": "DIDV"
        , "Multiplication and Division: Interpret, Represent, and Solve": "MDIRS"
        , "Place Value and Multidigit Whole Numbers": "PVMWN"
        , "Fractions and Decimal Notation" : "FDN"
        , "Multidigit Numbers, Factors, and Multiples" : "MNFM"
        , "Solve Equations and Inequalities: Quadratic" : "SEIQ"
        , "Numerical Expressions" : "NE"
        , "Generate and Analyze Patterns" : "GAP"
        , "One Variable Expressions and Equations" : "OVEE"
        , "Volume Concepts" : "VC"
        , "Convert Measurements" : "CM"


        //IAB Interim ELA
        , "Listen/Interpret": "LISINT"
        , "Research": "RSRCH"
        , "Research: Analyze Information" : "RESAI"
        , "Research: Analyze and Integrate Information" : "RESAI"
        , "Research: Interpret and Integrate" : "RESII"
        , "Research: Use Evidence" : "RESUE"
        , "Research: Evaluate Information and Sources" : "RESIS"
        , "Language and Vocabulary Use": "LANGVOC"
        , "Read Informational Texts": "READINF"
        , "Brief Writes": "BW"
        , "Editing": "EDIT"
        , "Edit/Revise": "EDITREV"
        , "Read Literary Texts": "READLIT"
        , "Revision": "REV"
        , "Performance Task - Multivitamins": "PTMULVIT"
        , "Performance Task - Mobile Ed Technology": "PTMOBTECH"
        , "Performance Task - Compare Ancient Societies": "PTCAS"
        , "Performance Task - How We Learn": "PTHWL"
        , "Performance Task - Beetles": "PTBEET"
        , "Performance Task - Unlikely Animal Friends": "PTUAF"
        , "Performance Task - Whales": "PTW"
        , "Performance Task - Maps and Technology": "PTMT"
        , "Performance Task - Recycling": "PTR"
        , "Write and Revise Explanatory Texts": "WRET"
        , "Write and Revise Informational Texts": "WRIT"
        , "Write and Revise Narratives": "WRNAR"
        , "Write and Revise Opinion Texts": "WROT"
        , "Write and Revise Argumentative Texts" : "WRAT"
        , "Performance Task - Reptiles" : "PTRP"
        , "Performance Task - Women In Space (IAB)" : "PTWIP"
        , "Make and Support Inferences" : "MSI"

        //ICA Interim Assessment
        , "ICA": "COMP"
        , "Interim Comprehensive Assessment": "COMP"

        //IAB  ELPAC

       ,"Listening I": "LISTEN"
       ,"Reading I": "READ"
       ,"Writing I": "WRITE"
       ,"Physical Sciences I" : "PSI"
       ,"Earth and Space Sciences I" : "EASSI"
       ,"Life Sciences I" : "LSI"
       ,"Speaking I" : "SPK"
       ,"Listening II": "LISTEN2",
        "Reading II": "READ2",
        "Writing II": "WRITE2",
        "Writing  II": "WRITE2",
        "Speaking II": "SPK2",
        "Speaking I Braille": "SPK1BR",
        "Speaking II Braille": "SPK2BR"

       //IAB INTERIM CAST

       ," IA-I" : "IA_I"

     };

     function decodedTest(row) {
      let keys = Object.keys(testNumberWithNameLookup);
      let testName = row.getField('ASSESSMENTNAME');
      var testDecode = '';
      keys.forEach(function(key) {
        if (testName.indexOf(key) > -1) {
         testDecode = testNumberWithNameLookup[key];

        }
      });
      return testDecode;
     }

    function decodeGradeCode(gradeCode) {
        if (gradeCode == null) {
           return null;
        }
        var lkpGradeObj = gradeLookup[gradeCode];
        if (lkpGradeObj == undefined || lkpGradeObj == null) {
           return null;
        }
        return lkpGradeObj;
     }

     function decodePrimaryResultCode(perfLevel) {
//        if (perfLevel == null || perfLevel == undefined || perfLevel === "") {
//           return null;
//        }
        var result = perLevelDecode.getItem(perfLevel);
            if(result == undefined){
              result =  { LEVEL: null, DESC: null, PASS_IND: null, CODE: null}
            }
                //if (result == null || result == undefined || result === "") {
                   //return null;
                //}
                return result;
             }


     function mapClaimScore(row, claimNumber) {

        var score = {};

        let testNumber = decodeTestNumber(row) + '_CLAIM' + claimNumber;

        let scaleScore = _util.coalesce(row.getField('CLAIM' + claimNumber + 'ACHIEVEMENTLEVEL'), row.getField('CLAIM' + claimNumber + 'SCOREACHIEVEMENTLEVEL'));
        let primaryResult = _util.coalesce(row.getField('CLAIM' + claimNumber + 'ACHIEVEMENTLEVEL'), row.getField('CLAIM' + claimNumber + 'SCOREACHIEVEMENTLEVEL'));
        let assessmentName = row.getField('ASSESSMENTNAME');

        if (scaleScore === null || scaleScore === undefined || scaleScore == "" || scaleScore === "NA") {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        score["TEST_SCORE_TEXT"] = scaleScore;


        //ELPAC Claim(1 to 4 Lis,Read,Spea,Wri) Decodes Level 1-3, else CAASSP
        if (testNumber.indexOf('ELPAC') > -1) {
         score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
         score["TEST_PRIMARY_RESULT"] = decodeELPACClaimPerformanceLevel[primaryResult].TEXT;
         score["TEST_PASSED_INDICATOR"] = decodeELPACClaimPerformanceLevel[primaryResult].PASS_IND;
        } else {

        let decode = decodePrimaryResultCode(primaryResult);
        score["TEST_PRIMARY_RESULT_CODE"] = decode.CODE;
        if (decode != null && decode != undefined) {
           score["TEST_PRIMARY_RESULT"] = decode.DESC;
           score["TEST_PASSED_INDICATOR"] = decode.PASS_IND;
        }
        let claimDecode = claimLevels[primaryResult];
        if(claimDecode != null && claimDecode != undefined){
           score["TEST_CUSTOM_RESULT"] = claimDecode.DESC;
        }

      }

        score["TEST_SCORE_ATTRIBUTES"] = assessmentName;

        return score;
     }

     function mapAltScore(row, altNumber) {

        var score = {};

        let testNumber = decodeTestNumber(row) + '_ALT' + altNumber;

        let scaleScore = row.getField('ALT' + altNumber + 'SCALESCORE');
        let sem = row.getField('ALT' + altNumber + 'SCALESCORESTANDARDERROR');
        let primaryResult = _util.coalesce(row.getField('ALT' + altNumber + 'ACHIEVEMENTLEVEL'), row.getField('ALT' + altNumber + 'SCOREACHIEVEMENTLEVEL'));
        let assessmentName = row.getField('ASSESSMENTNAME');

        if (scaleScore === null || scaleScore === undefined || scaleScore == "" || scaleScore === "NA") {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if (!isNaN(sem)) {
            score["TEST_STANDARD_ERROR"] = sem;
        }

        //ELPAC Overall Decodes Level 1-4, else CAASSP
        if (testNumber.indexOf('ELPAC') > -1) {
         score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
         score["TEST_PRIMARY_RESULT"] = decodeELPACOverallPerformanceLevel[primaryResult].LEVEL;
         score["TEST_SECONDARY_RESULT_CODE"] = primaryResult;
         score["TEST_SECONDARY_RESULT"] = decodeELPACOverallPerformanceLevel[primaryResult].TEXT;
         score["TEST_PASSED_INDICATOR"] = decodeELPACOverallPerformanceLevel[primaryResult].PASS_IND;
        } else {
         let decode = decodePrimaryResultCode(primaryResult);
         score["TEST_PRIMARY_RESULT_CODE"] = decode.CODE;
         if (decode != null && decode != undefined) {
           score["TEST_PRIMARY_RESULT"] = decode.DESC;
           score["TEST_PASSED_INDICATOR"] = decode.PASS_IND;
         }
         let claimDecode = claimLevels[primaryResult];
         if(claimDecode != null && claimDecode != undefined){
           score["TEST_CUSTOM_RESULT"] = claimDecode.DESC;
         }
        }

        score["TEST_SCORE_ATTRIBUTES"] = assessmentName;

        return score;
     }

     function getTestGrade(row) {
         var assmtName = row.getField("ASSESSMENTNAME");
         var grade = null;

         if (assmtName) {

             if (assmtName.indexOf("Grade 10") > -1) {
                 grade = "10";
             } else if (assmtName.indexOf("Grade 11") > -1) {
                 grade = "11";
             } else if (assmtName.indexOf("Grade 12") > -1) {
                 grade = "12";
             } else if (assmtName.indexOf("Grade 1") > -1) {
                 grade = "01";
             } else if (assmtName.indexOf("Grade 2") > -1) {
                 grade = "02";
             } else if (assmtName.indexOf("Grade 3") > -1) {
                 grade = "03";
             } else if (assmtName.indexOf("Grade 4") > -1) {
                 grade = "04";
             } else if (assmtName.indexOf("Grade 5") > -1) {
                 grade = "05";
             } else if (assmtName.indexOf("Grade 6") > -1) {
                 grade = "06";
             } else if (assmtName.indexOf("Grade 7") > -1) {
                 grade = "07";
             } else if (assmtName.indexOf("Grade 8") > -1) {
                 grade = "08";
             } else if (assmtName.indexOf("Grade 9") > -1) {
                 grade = "09";
             } else if (assmtName.indexOf("High School") > -1 || assmtName.indexOf("HS") > -1) {
                 grade = "HS";
             } else if (assmtName.indexOf("Kindergarten") > -1) {
                 grade = "KG";
             }
         }

         return grade;
     }


     module.mapDateObject = function(hierarchy, row, dateStr) {
        //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyyMMdd format or dd-MMM format.  Attempt to map both.
        try {
           testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
        } catch (exception) {
              // Error will be reported in final check.
        }

        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "MMM dd, yyyy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }
        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM-dd-yyyy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }

        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd MMM yyyy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }
        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd-MMM-yy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }
        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "d-MMM-yy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }
        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yy");
           } catch (exception) {
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

     function HashTable(obj) {
        this.length = 0;
        this.items = {};
        for (var p in obj) {
           if (obj.hasOwnProperty(p)) {
              this.items[p] = obj[p];
              this.length++;
           }
        }

        this.setItem = function (key, value) {
           var previous = undefined;
           if (this.hasItem(key)) {
              previous = this.items[key];
           }
           else {
              this.length++;
           }
           this.items[key] = value;
           return previous;
        }

        this.getItem = function (key) {
           return this.hasItem(key) ? this.items[key] : undefined;
        }

        this.hasItem = function (key) {
           return this.items.hasOwnProperty(key);
        }

        this.removeItem = function (key) {
           if (this.hasItem(key)) {
              var previous = this.items[key];
              this.length--;
              delete this.items[key];
              return previous;
           }
           else {
              return undefined;
           }
        }

        this.keys = function () {
            var keys = [];
            for (var k in this.items) {
               if (this.hasItem(k)) {
                  keys.push(k);
               }
            }

            return keys;
         }

         this.values = function () {
            var values = [];
            for (var k in this.items) {
               if (this.hasItem(k)) {
                  values.push(this.items[k]);
               }
            }

            return values;
         }

         this.each = function (fn) {
            for (var k in this.items) {
               if (this.hasItem(k)) {
                  fn(k, this.items[k]);
               }
            }
         }

         this.clear = function () {
            this.items = {}
            this.length = 0;
         }
      }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

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
            throw `${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}`;
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
        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;

        // Extract and format testDate
        var testDate = srcRecord.getField("SUBMITDATETIME");
        if (testDate) {
            const formattedDateObject = module.mapDateObject(hierarchy, srcRecord, testDate);
            testDate = formattedDateObject.STANDARD_DATE || testDate.split(" ")[0];
        }

        // Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        if (signature.format.formatName === "CA_STATE") {
            assessmentAdminKey = assessmentAdminKey + "_" + testDate;
        }

        return assessmentAdminKey;
    }


    return module;
}());