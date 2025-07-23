var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CO_PSAT_SAT";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false; // Potentially true?  Requires further live testing.


    /*
        Assessment-Specific Global Variables
    */
    var testNumberPrefix = null;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
 /** Java classes **/
    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
    const BufferedReader = Java.type("java.io.BufferedReader");
    const InputStreamReader = Java.type('java.io.InputStreamReader');
    const CSVWriter = Java.type("com.opencsv.CSVWriter");
    const FileWriter = Java.type("java.io.FileWriter");
    const File = Java.type("java.io.File");



     module.createNormalizedFile = function(file, signature) {
             try {
                 let normalizedFile = AppUtil.createResultsFile(file);
                 const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
                 const fileRows = createRecords(file, signature);
                 let normalizedRows = [], normalizedRecords = [];

                 fileRows.forEach(function(rows) {
                     try{
                         mapNormalizedRecords(signature, hierarchy, rows).forEach(function(normRecord) {
                             normalizedRows.push(normRecord)
                         });

                     } catch(exception) {
                         AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "mapNormalizedRecords error: ${exception}", JSON.stringify(rows)));
                     }
                 });


                 normalizedRows.forEach(function(row) {
                     try {
                         const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                         if(mappingObject.SCORE_MAPPINGS.length === 0) {
                             AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                         } else {
                             normalizedRecords.push(row);
                         }

                     } catch(exception) {
                         AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                     }
                 });

                 writeNormalizedRecords(normalizedFile, normalizedRecords);

                 return normalizedFile;
             } catch(exception) {
                 throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
             }
         };
//    module.createNormalizedFile = function(file, signature) {
//        try {
//
//            var signatureFormatName = signature.getFormat().getFormatName();
//            print("Loading using signature file ${signatureFormatName}");
//
//
//            //Initialize path and lineage variables.
//            var normalizedFile = AppUtil.createResultsFile(file);
//
//            print("Normalized file: ${normalizedFile}");
//
//            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
//            var lineNumber = 0;            const fileFullName = file.getFullName();
//
//
//            //Process data file records.
//            _dataflow.create("RECORD BUILD")
//                .input("INPUT", AppUtil.getInputDataflow(file, signature))
//                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
//
// json.LINEAGE_FILE = fileFullName;
//                    json.LINEAGE_LINE = (++lineNumber).toString();
//                    output.RECORDS.put(json);
//                })
//                .group_by("ADMINISTRATION GROUPING" , function(one, two){
//
//                    try {
//                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
//                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
//
//                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
//                    }
//
//                })
//                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
//                    try{
//                        if(!multipleRowsPerGroupingExpected && rows.length > 1){
//
//                            //Report error for each row
//                            rows.forEach(function(row){
//                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
//                            });
//
//                        } else {
//                            output.RECORDS.put(rows);
//                        }
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
//                    }
//                })
//                .transform("TRANSFORMATION", ["RECORDS"],
//                    function(output, rows) {
//                        try{
//
//                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);
//
//                            normalizedRecords.forEach(function(record){
//                                output.RECORDS.put(record);
//                            });
//
//                        } catch(exception) {
//                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
//                        }
//
//
//                    })
//                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
//                    try {
//                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
//
//                        // Report when no scores are found.
//                        if(mappingObject.SCORE_MAPPINGS.length === 0){
//                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
//                        } else {
//                            output.RECORDS.put(row);
//                        }
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
//                    }
//                })
//                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\"))
//                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 20, 100);
//
//            return normalizedFile;
//
//        } catch(exception) {
//            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
//        }
//    };


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
        //Redesigned Scores
        {FUNCTION: mapRedesignedScore, CODE: "TOT", 		NAME: "TOTAL", SCORE: "",PERCENTILE_LABEL:"_SCORE"}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWTOT", 	NAME: "EVIDENCE_BASED_READING_AND_WRITING", SCORE: "SECTION_",PERCENTILE_LABEL:"_SECTION"}
        ,{FUNCTION: mapRedesignedScore, CODE: "MATOT", 		NAME: "MATH", SCORE: "SECTION_",PERCENTILE_LABEL:"_SECTION"}
        ,{FUNCTION: mapRedesignedScore, CODE: "MAMACT",     NAME: "MATH_TEST", SCORE: "",PERCENTILE_LABEL:""}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWRCT", 	NAME: "READING_TEST", SCORE: "",PERCENTILE_LABEL:""}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWWCT", 	NAME: "WRITING_AND_LANGUAGE_TEST", SCORE: "",PERCENTILE_LABEL:""}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWASCT", 	NAME: "ANALYSIS_IN_SCIENCE_CROSSTEST", SCORE: "",PERCENTILE_LABEL:""}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWHSSCT", 	NAME: "ANALYSIS_IN_HISTORYSOCIAL_SCIENCE_CROSSTEST", SCORE: "",PERCENTILE_LABEL:""}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWRWC",		NAME: "RELEVANT_WORDS_IN_CONTEXT", SCORE: "SUB",PERCENTILE_LABEL:"_SUBSCORE"}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWCE",		NAME: "COMMAND_OF_EVIDENCE", SCORE: "SUB",PERCENTILE_LABEL:"_SUBSCORE"}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWEI",		NAME: "EXPRESSION_OF_IDEAS", SCORE: "SUB",PERCENTILE_LABEL:"_SUBSCORE"}
        ,{FUNCTION: mapRedesignedScore, CODE: "EBRWSEC",		NAME: "STANDARD_ENGLISH_CONVENTIONS", SCORE: "SUB",PERCENTILE_LABEL:"_SUBSCORE"}
        ,{FUNCTION: mapRedesignedScore, CODE: "MAHA",		NAME: "HEART_OF_ALGEBRA", SCORE: "SUB",PERCENTILE_LABEL:"_SUBSCORE"}
        ,{FUNCTION: mapRedesignedScore, CODE: "MAPAM",		NAME: "PASSPORT_TO_ADVANCED_MATHEMATICS", SCORE: "SUB",PERCENTILE_LABEL:"_SUBSCORE"}
        ,{FUNCTION: mapRedesignedScore, CODE: "MAPSDA",		NAME: "PROBLEM_SOLVING_AND_DATA_ANALYSIS", SCORE: "SUB",PERCENTILE_LABEL:"_SUBSCORE"}
        ,{FUNCTION: mapEssaySubscore, CODE: "ESRD",		NAME: "ESSAY_READING_SUBSCORE", SCORE: "",PERCENTILE_LABEL:""}
        ,{FUNCTION: mapEssaySubscore, CODE: "ESANLYS",		NAME: "ESSAY_ANALYSIS_SUBSCORE", SCORE: "",PERCENTILE_LABEL:""}
        ,{FUNCTION: mapEssaySubscore, CODE: "ESWR",		NAME: "ESSAY_WRITING_SUBSCORE", SCORE: "",PERCENTILE_LABEL:""}
        ,{FUNCTION: mapRangeScore, CODE: "RWKSCS",		NAME: "READING_WRITING_KNOWLEDGE_AND_SKILLS_CRAFT_STRUC", SCORE: "",PERCENTILE_LABEL:"_RANGE"}
        ,{FUNCTION: mapRangeScore, CODE: "RWKSEI",		NAME: "READING_WRITING_KNOWLEDGE_AND_SKILLS_EXP_OF_IDEAS", SCORE: "",PERCENTILE_LABEL:"_RANGE"}
        ,{FUNCTION: mapRangeScore, CODE: "RWKSSEC",		NAME: "READING_WRITING_KNOWLEDGE_AND_SKILLS_STD_ENG_CONV", SCORE: "",PERCENTILE_LABEL:"_RANGE"}
        ,{FUNCTION: mapRangeScore, CODE: "RWKSII",		NAME: "READING_WRITING_KNOWLEDGE_AND_SKILLS_INF_IDEAS", SCORE: "",PERCENTILE_LABEL:"_RANGE"}
        ,{FUNCTION: mapRangeScore, CODE: "MKSA",		NAME: "MATH_KNOWLEDGE_AND_SKILLS_ALG", SCORE: "",PERCENTILE_LABEL:"_RANGE"}
        ,{FUNCTION: mapRangeScore, CODE: "MKSGT",		NAME: "MATH_KNOWLEDGE_AND_SKILLS_GEO_TRIG", SCORE: "",PERCENTILE_LABEL:"_RANGE"}
        ,{FUNCTION: mapRangeScore, CODE: "MKSAM",		NAME: "MATH_KNOWLEDGE_AND_SKILLS_ADV_MATH", SCORE: "",PERCENTILE_LABEL:"_RANGE"}
        ,{FUNCTION: mapRangeScore, CODE: "MKSPS",		NAME: "MATH_KNOWLEDGE_AND_SKILLS_PROB_SOLVG", SCORE: "",PERCENTILE_LABEL:"_RANGE"}

    ];






    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/
    var educationLevelDecodes = {
             "1" :  "<8"
            ,"2" :  "08"
            ,"4" :  "09"
            ,"5" :  "10"
            ,"6" :  "11"
            ,"7" :  "12"
            ,"8" :  "NHS"   //No longer in high school
            ,"9" :  "NR"	//No Response
            ,"10" :  "UNK"	//Unknown
            ,"11" :  "C1"	//1st Year of college
            ,"12" :  "C2"	//@nd Year of college
        };

    var collegeReadinessDecodes = {
          "N"	: "Not College Ready"
        , "Y"	: "College Ready"
    };

    var expelledDecode = {
          "0"	: null
        , "N"	: null
        , "1"	: "Expelled"
        , "Y"	: "Expelled"
        , ""    : null
        , null  : null
    };

    var proficiencyDecode = {
        "1" :  "Does Not Yet Meet Expectations"
        ,"2" :  "Approached Expectations"
        ,"3" :  "Met Expectations"
        ,"4" :  "Exceeded Expectations"
        ,null : null
    };

    var yesNoDecodes = {
        "Y": "Yes",
        "N": "No",
        "Yes":"Yes",
        "No": "No",
        "": null,
        null: null
    }

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
    function mapNormalizedRecords(signature, hierarchy, rows){
        var normalizedRecords = [];

        //Only expect a single row.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);


        var record = mapNormalizedRecord(signature, hierarchy, row);

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
    function mapNormalizedRecord(signature, hierarchy, row){
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
            var score = (testMetadata.FUNCTION)(row, testMetadata.NAME, testMetadata.CODE, testMetadata.SCORE, testMetadata.PERCENTILE_LABEL);

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
    function mapNormalizedAdminFields(signature, hierarchy, row){

        // Map standard normalized assessment fields.
        var record = AppUtil.mapNormalizedAssessmentFields(signature, hierarchy, row);


        /*
            Map normalized fields requiring assessment-specific logic.
        */

        var latestGradeLevel = _util.coalesce(row.getField("GRADE"),row.getField("STATE_SPONSORED_ASSESSMENTS:_GRADE_LEVEL_WHEN_ASSESSED"), "");


        // Get raw date values
        var testDateStr = _util.coalesce(row.getField("TEST_DATE"),row.getField("STATE_SPONSORED_ASSESSMENT_DATE"), "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9));
        var birthDateStr = _util.coalesce(row.getField("BIRTH_DATE"), "");


        var testDateObject = module.mapDateObject(hierarchy, row, testDateStr);
        var birthDateObject = module.mapDateObject(hierarchy, row, birthDateStr);

        var studentGenderCode =  _util.coalesce(row.getField("GENDER"), "").substring(0,1);

        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
        record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);      // pre UIHN-9419:  was not being set at all
        record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:  was not being set at all
        record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR
        record.SCHOOL_LOCAL_ID = null;
        record.SCHOOL_STATE_ID = row.getField("STATE_ORGANIZATION_CODE");
        record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("RESP_AICODE"),row.getField("STATE_ORGANIZATION_CODE"));
        record.SCHOOL_NAME = row.getField("RESPONSIBLE_ATTENDING_INSTITUTION_NAME");
        record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
        record.STUDENT_GRADE_CODE = educationLevelDecodes[latestGradeLevel] === undefined ? null : educationLevelDecodes[latestGradeLevel];
        record.STUDENT_GENDER_CODE= studentGenderCode;
        record.STUDENT_LOCAL_ID = row.getField("SECONDARY_SCHOOL_STUDENT_ID");
        record.STUDENT_STATE_ID = row.getField("SECONDARY_SCHOOL_STUDENT_ID");
        record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("COLLEGE_BOARD_STUDENT_ID"),row.getField("SECONDARY_SCHOOL_STUDENT_ID"));
        record.STUDENT_FIRST_NAME = row.getField("STUDENT_FIRST_NAME");
        record.STUDENT_LAST_NAME = row.getField("STUDENT_LAST_OR_SURNAME");
        record.STUDENT_MIDDLE_NAME = row.getField("MIDDLE_INITIAL");

        //Birthdate fields
       // record.STUDENT_DOB = birthDateObject.STANDARD_DATE;
        record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
        record.STUDENT_DOB_DAY = birthDateObject.DAY;
        record.STUDENT_DOB_YEAR = birthDateObject.YEAR;

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
    function mapAdditionalAdminFields(row){

        var admin = {};
        admin.TEST_INTERVENTION_CODE = row.getField("EXPELLED");
        admin.TEST_INTERVENTION_DESC = expelledDecode[row.getField("EXPELLED")];
        return admin;
    }



    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/
    function mapRedesignedScore(row, name, code, scorePart, percentilePart){
        var testScoreElement = {};

        var testNumber = getTestNumberPrefix(row) + "RDSN" + code;


        var scaleScore = row.getField("STATE_SPONSORED_ASSESSMENTS_"  + name + "_" + scorePart + "SCORE");
        var percentileScore = row.getField("NATIONALLY_REPRESENTATIVE_SAMPLE_PERCENTILE_" + name + percentilePart);

        if (percentileScore !== null || percentileScore !== undefined || percentileScore !== ""){
            if(percentileScore === "99+"){
                 var percentileScore = percentileScore.toString().replace("+","");
            }else if( percentileScore === "1-"){
                var percentileScore = percentileScore.toString().replace("-","");
            }else{
                  var percentileScore = percentileScore;
            }
        }
        // Set main score elements
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === ""){
            return null;
        } else{
            testScoreElement["TEST_NUMBER"] = testNumber;
            testScoreElement["TEST_SCORE_VALUE"] = parseFloat(scaleScore);
            testScoreElement["TEST_SCALED_SCORE"] = parseFloat(scaleScore);
            testScoreElement["TEST_SCORE_TEXT"] = scaleScore;
            testScoreElement["TEST_PERCENTILE_SCORE"] = parseFloat(percentileScore);
        }

        // Set performance levels
        if (name === "EVIDENCE_BASED_READING_AND_WRITING"){
            testScoreElement["TEST_PASSED_INDICATOR"] = yesNoDecodes[row.getField("EVIDENCE_BASED_READING_AND_WRITING_CCR_BENCHMARK_INDICATOR")];
            testScoreElement["TEST_PRIMARY_RESULT_CODE"] = row.getField("EVIDENCE_BASED_READING_AND_WRITING_CCR_BENCHMARK_INDICATOR");
            testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes[row.getField("EVIDENCE_BASED_READING_AND_WRITING_CCR_BENCHMARK_INDICATOR")] === undefined ? null : collegeReadinessDecodes[row.getField("EVIDENCE_BASED_READING_AND_WRITING_CCR_BENCHMARK_INDICATOR")];
            testScoreElement["TEST_SECONDARY_RESULT_CODE"] = row.getField("EBRW PROFICIENCY LEVEL");
            testScoreElement["TEST_SECONDARY_RESULT"] = proficiencyDecode[row.getField("EBRW PROFICIENCY LEVEL")];
        } else if (name === "MATH"){
            testScoreElement["TEST_PASSED_INDICATOR"] = yesNoDecodes[row.getField("MATH_CCR_BENCHMARK_INDICATOR")];
            testScoreElement["TEST_PRIMARY_RESULT_CODE"] = row.getField("MATH_CCR_BENCHMARK_INDICATOR");
            testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes[row.getField("MATH_CCR_BENCHMARK_INDICATOR")] === undefined ? null : collegeReadinessDecodes[row.getField("MATH_CCR_BENCHMARK_INDICATOR")];;
            testScoreElement["TEST_SECONDARY_RESULT_CODE"] = row.getField("MATH PROFICIENCY LEVEL");
            testScoreElement["TEST_SECONDARY_RESULT"] = proficiencyDecode[row.getField("MATH PROFICIENCY LEVEL")];
        } else if(name === "TOTAL"){

            var ebrwBenchmark = row.getField("EVIDENCE_BASED_READING_AND_WRITING_CCR_BENCHMARK_INDICATOR");
            var mathBenchmark = row.getField("MATH_CCR_BENCHMARK_INDICATOR");

            //Set College Readiness based on subject level performance.
            if(_util.trim(ebrwBenchmark) == "Y" && _util.trim(mathBenchmark) == "Y"){
                    testScoreElement["TEST_PASSED_INDICATOR"] = "Yes";
                    testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "Y";
                    testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes["Y"];
            } else {
                    testScoreElement["TEST_PASSED_INDICATOR"] = "No";
                    testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "N";
                    testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes["N"];
            }
        }


        return testScoreElement;
    }

    function mapEssaySubscore(row, name, code, scorePart, percentilePart){
        var testScoreElement = {};
        var testNumber = getTestNumberPrefix(row) + "RDSN" + code;

        var scaleScore = row.getField(name);

        // Set main score elements
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === ""){
            return null;
        } else{
            testScoreElement["TEST_NUMBER"] = testNumber;
            testScoreElement["TEST_SCORE_VALUE"] = parseFloat(scaleScore);
            testScoreElement["TEST_SCALED_SCORE"] = parseFloat(scaleScore);
            testScoreElement["TEST_SCORE_TEXT"] = scaleScore;
        }
        return testScoreElement;
    }


    function mapRangeScore(row, name, code, scorePart, percentilePart){
        var testScoreElement = {};
        var testNumber = getTestNumberPrefix(row) + "RDSN" + code;
        var rangeValue = row.getField(name + "_RANGE");

        // Set main score elements
        if(_util.trim(rangeValue) === null || _util.trim(rangeValue) === ""){
            return null;
        } else{
            testScoreElement["TEST_NUMBER"] = testNumber;

            // Parse range bounds from formats like "610-670" or "610 to 670"
            var rangeStr = rangeValue.toString().trim();
            var delimiter = rangeStr.indexOf("-") > -1 ? "-" : " to ";
            var rangeParts = rangeStr.split(delimiter);

            if(rangeParts.length === 2) {
                var lowerBound = _util.trim(rangeParts[0]);
                var upperBound = _util.trim(rangeParts[1]);

                if(!isNaN(parseFloat(lowerBound)) && !isNaN(parseFloat(upperBound))) {
                    testScoreElement["TEST_LOWER_BOUND"] = parseFloat(lowerBound);
                    testScoreElement["TEST_UPPER_BOUND"] = parseFloat(upperBound);
                }
            }
        }
        return testScoreElement;
    }


    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function getTestNumberPrefix(row){
        var scoreTestNumberPrefix = null;
        if (row.getField("TEST")==="SAT"){
            scoreTestNumberPrefix = "SAT";
        }
        else if (row.getField("TEST")==="PSAT"){
           scoreTestNumberPrefix = "PSAT10";
        }
        else if (row.getField("SAT_TEST_ADMINISTRATION_INDICATOR")==="Y"){
           scoreTestNumberPrefix = "SAT";
        }
        else if (row.getField("PSAT89_TEST_ADMINSTRATION_INDICATOR")==="Y"){
           scoreTestNumberPrefix = "PSAT8_9";
        }
        else if (row.getField("PSAT10_TEST_ADMINISTRATION_INDICATOR")==="Y"){
           scoreTestNumberPrefix = "PSAT10";
        }
        else {
            scoreTestNumberPrefix = null;
        }
        return scoreTestNumberPrefix;
    }

    function createRecords(file, signature) {
            try {
                const format = signature.getFormat();
                const fieldDelimiter = format.getFieldDelim();
                const textDelimiter = format.getQuoteDelim();
                const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
                const delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
                const fileFullName = file.getFullName();
                let lineNumber = 0;
                let recordsArray = [];
                const fieldNames = delimitedRecordParser.parseRow(reader);
                let row, record;

                while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                    let index = 0;
                    record = {};

                    for (const key in fieldNames) {
                        record[fieldNames[index]] = row.get(index++);
                    }
                    record.LINEAGE_FILE = fileFullName;
                    record.LINEAGE_LINE = (++lineNumber).toString();
                    const rowArray = [];
                    rowArray.push(record);
                    recordsArray.push((rowArray));
                }

                return recordsArray;
            } catch (exception) {
                throw "${_thisModuleName}.createRecords Exception: ${exception}";
            }
        }

        /**
         * Creates a Processed file containing the audit types of error for the file processed
         *
         * @param file A fully qualified string path to the normalFile
         * @param data The audit statistics of the file that was processed
         */
        function writeNormalizedRecords(file, data) {
            try {
                const normalFile = _file.open(file);
                const normalFilePath = normalFile.getParent();
                const normalFileName = normalFile.getName()
                const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
                let rowArray = null;
                const header = Object.keys(data[0]);

                writer.writeNext(header);

                data.forEach(function(row) {
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


    function groupAssessmentByNaturalKey(signature, hierarchy, one, two){

        try {

           // Note: Admin year isn"t required for sorting. Should be left blank.
           var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
           var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);

           if(assessmentAdminKey_one === assessmentAdminKey_two){
               return 1;
           } else {
               return -1;
           }

       } catch (exception) {
           throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
       }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord){
       var assessmentAdminKey = null;
       //Since impact to standardizing keys for past signatures would cause duplicates, hence restricted signature UIHN - 71576
       if (signature.getFormat().getFormatName() === 'CO_PSAT_SAT_2023_2024_111_COLS'){
           if (srcRecord.getField("TEST_DATE")){
               var testAdminDate = srcRecord.getField("TEST_DATE");
                if(testAdminDate !== null && testAdminDate !== undefined && testAdminDate !== "") {
                var adminDate = AppUtil.getMonthFollowedByDay(testAdminDate).STANDARD_DATE;
                }
                    // Set base assessment admin key information
                    //TODO Should be the same as the old version or use this opportunity to upgrade?
                    assessmentAdminKey = _assessmentIdentifier
                        + "_" + getTestNumberPrefix(srcRecord) + "RDSN"
                        + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
                        + "_" + AssessmentLoader.config.DISTRICT_CODE
                        + "_" + _util.coalesceEmptyString(srcRecord.getField("SECONDARY_SCHOOL_STUDENT_ID"), "")
                        + "_" + adminDate
                //	print(assessmentAdminKey);
                    assessmentAdminKey = assessmentAdminKey.trim();

           }
       }
       else{
        // Set base assessment admin key information
        //TODO Should be the same as the old version or use this opportunity to upgrade?
        assessmentAdminKey = _assessmentIdentifier
            + "_" + getTestNumberPrefix(srcRecord) + "RDSN"
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE
            + "_" + _util.coalesceEmptyString(srcRecord.getField("SECONDARY_SCHOOL_STUDENT_ID"), "")
            + "_" + _util.coalesce(srcRecord.getField("STATE_SPONSORED_ASSESSMENT_DATE"), "")
	//	print(assessmentAdminKey);
		assessmentAdminKey = assessmentAdminKey.trim();
		}
        return assessmentAdminKey;

    }


    module.mapDateObject = function (hierarchy, row, dateStr){

        //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
        } catch(exception){
            // Error will be reported in final check.
        }

        if(testDateObject === null){
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
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

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());
