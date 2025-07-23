var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MCA_MTAS_FINAL";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;
    var header = ["TestName","TestDate","TestSubject","Grade","TestForm","FormNumber","TestingDistrictNumber","TestingDistrictType","TestingschoolNumber","FillerA","MarssStateReporting Number","LocalStudentID","StudentLastName","StudentFirstName","StudentMiddleName","DateOfBirth","Gender","FillerB","EnglishLearnerFlag","SpecialEducationFlag","FRPEligibleFlag","October1SchoolFlag","October1DistrictFlag","MigrantFlag","PriorELAccountability Flag","PriorSPEAccountability Flag","SLifeFlag","HomelessFlag","ForeignExchange Student Flag","RecentlyArrived EnglishLearnerFlag","ActiveDutyParentFlag","F14","F15","F16","EthnicCode","PrimaryDisabilityCode","LanguageCode","ADM97","C5","C6","C7","C8","C9","C10","PriorYearAssessment AndGrade","PriorYearScoreOrTest Code","PriorYearAchievement Level","DocumentCodes","Accommodation LinguisticSupportCodes","FillerD","TestCode","AchievementLevel","Score1Label","Score1","Score1Characteristic","Score1Range","Score2Label","Score2","Score2Characteristic","Score2Range","Score3Label","Score3","Score3Characteristic","Score3Range","Score4Label","Score4","Score4Characteristic","Score4Range","Score5Label","Score5","Score5Characteristic","Score5Range","score6Label","score6","score6Characteristic","Score6Range","Score7Label","Score7","Score7Characteristic","Score7Range","Score8Label","Score8","Score8Characteristic","Score8Range","Score9Label","Score9","Score9Characteristic","Score9Range","Score10Label","Score10","Score10Characteristic","Score10Range","Score11Label","Score11","Score11Characteristic","Score11Range","Score12Label","Score12","Score12Characteristic","Score12Range","Score13Label","Score13","Score13Characteristic","Score13Range","Score14Label","Score14","Score14Characteristic","Score14Range","Score15Label","Score15","Score15Characteristic","Score15Range","Score16Label","Score16","Score16Characteristic","Score16Range","Score17Label","Score17","Score17Characteristic","Score17Range","Score18Label","Score18","Score18Characteristic","Score18Range","Score19Label","Score19","Score19Characteristic","Score19Range","Score20Label","Score20","Score20Characteristic","Score20Range","Score21Label","Score21","Score21Characteristic","Score21Range","Score22Label","Score22","Score22Characteristic","Score22Range","Score23Label","Score23","Score23Characteristic","Score23Range","Score24Label","Score24","Score24Characteristic","Score24Range","Score25Label","Score25","Score25Characteristic","Score25Range","MTASPassage Access All","MTASOperational Passage1","MTASOperational Passage2","MTASOperational Passage3","LexileQuantileScore","LexileQuantileScore Range","LearningLocator","UIN"];
    //var header = ["TEST_NAME","TEST_DATE","TEST_SUBJECT","GRADE","TEST_FORM","FORM_NUMBER","TESTING_DISTRICT_NUMBER","TESTING_DISTRICT_TYPE","TESTING_SCHOOL_NUMBER","FILLER_A","MARSS_STATE_REPORTING_NUMBER","LOCAL_STUDENT_ID","STUDENT_LAST_NAME","STUDENT_FIRST_NAME","STUDENT_MIDDLE_NAME","DATE_OF_BIRTH","GENDER","FILLER_B","ENGLISH_LEARNER_FLAG","SPECIAL_EDUCATION_FLAG","FRP_ELIGIBLE_FLAG","OCTOBER_1_SCHOOL_FLAG","OCTOBER_1_DISTRICT_FLAG","MIGRANT_FLAG","PRIOR_EL_ACCOUNTABILITY_FLAG","PRIOR_SPE_ACCOUNTABILITY_FLAG","S_LIFE_FLAG","HOMELESS_FLAG","FOREIGN_EXCHANGE_STUDENT_FLAG","RECENTLY_ARRIVED_ENGLISH_LEARNER_FLAG","ACTIVE_DUTY_PARENT_FLAG","F14","F15","F16","ETHNIC_CODE","PRIMARY_DISABILITY_CODE","LANGUAGE_CODE","ADM97","C5","C6","C7","C8","C9","C10","PRIOR_YEAR_ASSESSMENT_AND_GRADE","PRIOR_YEAR_SCORE_OR_TEST_CODE","PRIOR_YEAR_ACHIEVEMENT_LEVEL","DOCUMENT_CODES","ACCOMMODATION_LINGUISTIC_SUPPORT_CODES","FILLER_D","TEST_CODE","ACHIEVEMENT_LEVEL","SCORE_1_LABEL","SCORE_1","SCORE_1_CHARACTERISTIC","SCORE_1_RANGE","SCORE_2_LABEL","SCORE_2","SCORE_2_CHARACTERISTIC","SCORE_2_RANGE","SCORE_3_LABEL","SCORE_3","SCORE_3_CHARACTERISTIC","SCORE_3_RANGE","SCORE_4_LABEL","SCORE_4","SCORE_4_CHARACTERISTIC","SCORE_4_RANGE","SCORE_5_LABEL","SCORE5","SCORE_5_CHARACTERISTIC","SCORE_5_RANGE","SCORE_6_LABEL","SCORE_6","SCORE_6_CHARACHTERISTIC","SCORE_6_RANGE","SCORE_7_LABEL","SCORE_7","SCORE_7_CHARACTERISTIC","SCORE_7_RANGE","SCORE_8_LABEL","SCORE_8","SCORE_8_CHARACTERISTIC","SCORE_8_RANGE","SCORE_9_LABEL","SCORE_9","SCORE_9_CHARACTERISTIC","SCORE_9_RANGE","SCORE_10_LABEL","SCORE_10","SCORE_10_CHARACTERISTIC","SCORE_10_RANGE","SCORE_11_LABEL","SCORE_11","SCORE_11_CHARACTERISTIC","SCORE_11_RANGE","SCORE_12_LABEL","SCORE_12","SCORE_12_CHARACTERISTIC","SCORE_12_RANGE","SCORE_13_LABEL","SCORE_13","SCORE_13_CHARACTERISTIC","SCORE_13_RANGE","SCORE_14_LABEL","SCORE_14","SCORE_14_CHARACTERISTIC","SCORE_14_RANGE","SCORE_15_LABEL","SCORE_15","SCORE_15_CHARACTERISTIC","SCORE_15_RANGE","SCORE_16_LABEL","SCORE_16","SCORE_16_CHARACTERISTIC","SCORE_16_RANGE","SCORE_17_LABEL","SCORE_17","SCORE_17_CHARACTERISTIC","SCORE_17_RANGE","SCORE_18_LABEL","SCORE_18","SCORE_18_CHARACTERISTIC","SCORE_18_RANGE","SCORE_19_LABEL","SCORE_19","SCORE_19_CHARACTERISTIC","SCORE_19_RANGE","SCORE_20_LABEL","SCORE_20","SCORE_20_CHARACTERISTIC","SCORE_20_RANGE","SCORE_21_LABEL","SCORE_21","SCORE_21_CHARACTERISTIC","SCORE_21_RANGE","SCORE_22_LABEL","SCORE_22","SCORE_22_CHARACTERISTIC","SCORE_22_RANGE","SCORE_23_LABEL","SCORE_23","SCORE_23_CHARACTERISTIC","SCORE_23_RANGE","SCORE_24_LABEL","SCORE_24","SCORE_24_CHARACTERISTIC","SCORE_24_RANGE","SCORE_25_LABEL","SCORE_25","SCORE_25_CHARACTERISTIC","SCORE_25_RANGE","MTAS_PASSAGE_ACCESS_ALL","MTAS_OPERATIONAL_PASSAGE_1","MTAS_OPERATIONAL_PASSAGE_2","MTAS_OPERATIONAL_PASSAGE_3","LEXILE_QUANTILE_SCORE","LEXILE_QUANTILE_SCORE_RANGE","LEARNING_LOCATOR","UIN"];
    /**
     * This function will convert the source file given into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */;
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
           let df = _dataflow.create("RECORD BUILD");
           if(signature.getFormat().getHasHeader()){
              df.input("INPUT", AppUtil.getInputDataflow(file, signature));
           }else {
              df.input("INPUT", _io.delim_input_ext(file.getFilePath(), "\t", "\"", "\\", header,false));
           }
                //.input("INPUT", AppUtil.getInputDataflow(file, signature))
                //.input("INPUT", _io.delim_input_ext(file.getFilePath(), "\t", "\"", "\\", header,true))
                df.transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {

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
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + '|' + JSON.stringify(two)));
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
                .transform("TRANSFORMATION", ["RECORDS"],
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

    var scoresToMap =
        [
            // Initial ELPAC Scores to Process
            {TEST: "MNF", CODE: "TOT", CODE2:"", MAP_FUNCTION: mapTotalScore}
             //Reading
             ,{TEST: "MNF", CODE: "SELT", CODE2: "", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "SEIN", CODE2: "", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "SEV", CODE2: "", MAP_FUNCTION: mapScaleStrandScore}
              ,{TEST: "MNF", CODE: "LSS", CODE2: "", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "INFS", CODE2: "", MAP_FUNCTION: mapStanineStrandScore}

             ,{TEST: "MNF", CODE: "VSS", CODE2: "", MAP_FUNCTION: mapStanineStrandScore}

             //Science
             ,{TEST: "MNF", CODE: "NSE", CODE2: "SENS", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "PSCS", CODE2: "SEPH", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "ESS", CODE2: "SEES", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "LIFS", CODE2: "SELS", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "POSS", CODE2: "SEPS", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "POES", CODE2: "SEPE", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "INTS", CODE2: "SEIS", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "SFLS", CODE2: "SESF", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "IALS", CODE2: "SEIA", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "EILS", CODE2: "SEEL", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "HILS", CODE2: "SEHI", MAP_FUNCTION: mapStanineStrandScore}
             //Math
             ,{TEST: "MNF", CODE: "NOPS", CODE2: "SEN", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "ALGS", CODE2: "SEA", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "GMS", CODE2: "SEG", MAP_FUNCTION: mapStanineStrandScore}
             //,{TEST: "MNF", CODE: "SED", CODE2: "SED", MAP_FUNCTION: mapStanineStrandScore} //customer confirmed not to map
             ,{TEST: "MNF", CODE: "DANS", CODE2: "DANS", MAP_FUNCTION: mapStanineStrandScore}
             ,{TEST: "MNF", CODE: "DAPS", CODE2: "DAPS", MAP_FUNCTION: mapStanineStrandScore}
             //MTAS special
             ,{TEST: "MNF", CODE: "MTAS_PASS", FIELD: "MTAS", MAP_FUNCTION: mapMTASPassage}
             ,{TEST: "MNF", CODE: "EXS1", CODE2: "", MAP_FUNCTION: mapScaleStrandScore}
             ,{TEST: "MNF", CODE: "EXS2", CODE2: "", MAP_FUNCTION: mapScaleStrandScore}
             ,{TEST: "MNF", CODE: "EXS3", CODE2: "", MAP_FUNCTION: mapScaleStrandScore}
             ,{TEST: "MNF", CODE: "EXS4", CODE2: "", MAP_FUNCTION: mapScaleStrandScore}
             //Access
              ,{TEST: "ACC", CODE: "CMSS", CODE2: "PLSC", NUM_PART: "COMP", MAP_FUNCTION: mapAccessStrandScore}
              ,{TEST: "ACC", CODE: "ORSS", CODE2: "PLSO", NUM_PART: "ORAL", MAP_FUNCTION: mapAccessStrandScore}
              ,{TEST: "ACC", CODE: "LTSS", CODE2: "PLSL", NUM_PART: "LIT", MAP_FUNCTION: mapAccessStrandScore}
              ,{TEST: "ACC", CODE: "C", CODE2: "", NUM_PART: "TOT", MAP_FUNCTION: mapAccessComponentScore}
              ,{TEST: "ACC", CODE: "L", CODE2: "", NUM_PART: "LIS", MAP_FUNCTION: mapAccessComponentScore}
              ,{TEST: "ACC", CODE: "R", CODE2: "", NUM_PART: "RD", MAP_FUNCTION: mapAccessComponentScore}
              ,{TEST: "ACC", CODE: "S", CODE2: "", NUM_PART: "SP", MAP_FUNCTION: mapAccessComponentScore}
              ,{TEST: "ACC", CODE: "W", CODE2: "", NUM_PART: "WR", MAP_FUNCTION: mapAccessComponentScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KN" 	: "KG"
        ,"KG" 	: "KG"
        ,"0" 	: "KG"
        ,"00" 	: "KG"
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
    };

	var decodeConditionCodes = {
        "NC" 	    : "Not Completed"
        ,"NA"	    : "Not Attempted"
        ,"NE"	    : "Not Enrolled"
        ,"WG"	    : "Wrong Grade for Testing"
        ,"SPD"	    : "Special Education Deferred"
        ,"VS"	    : "Valid Score"
        ,"Non-VS"	: "Non Valid Score"
        ,"ABS"	    : "Absent"
        ,"NA"	    : "Not Attempted"
        ,"DEC"	    : "Declined"
        ,"INV"	    : "Invalidated"
        ,"INV-D"	: "Invalidated - Improper Device Use"
        ,"INV-O"	: "Invalidated - Other Action"
        ,"INV-S"	: "Invalidated - Student Action"
        ,"ME"	    : "Medical Excuse"
        ,"REF"	    : "Refusal"
        ,"REF-P"	: "Parent Refusal"
        ,"REF-S"	: "Student Refusal"
        ,"EXC-N"	: "Extenuating Circumstances - Not Attempted"
        ,"EXC-A"	: "Extenuating Circumstances - Attempted"
        ,"REF-S"	: "Student Refusal"
        ,null	    : null
    };

	var decodeAchievementLevel = {
        "D" 	: "Does Not Meet"
        ,"P"	: "Partially Meets"
        ,"M"	: "Meets"
        ,"E"	: "Exceeds"
        ,null	: null
    };

	var decodeAchievementPassLevel = {
        "D" 	: "No"
        ,"P"	: "No"
        ,"M"	: "Yes"
        ,"E"	: "Yes"
        ,null	: null
    };

    var decodeScorelbl = {
        "ALGS" : "Algebra Strand"
        ,"SEA" : "Standard Error Algebra"
        ,"DAPS" : "Data Analysis & Probability Strand"
        ,"GMS" : "Geometry & Measurement Strand"
        ,"SEG" : "Standard Error Geometry & Measurement"
        ,"NOPS" : "Number & Operation Strand"
        ,"SEN" : "Standard Error Number & Operation"
        , "DANS" : "Data Analysis Strand"
        , "SED" : "Standard Error Data Analysis"
        , "INFS" : "INFORMATIONAL TEXT SUBSTRAND"
        , "LSS" : "LITERATURE SUBSTRAND"
        , "SELT" : "STANDARD ERROR OF MEASUREMENT LITERATURE SUBSTRAND"
        , "SEIN" : "STANDARD ERROR OF MEASUREMENT INFORMATIONAL TEXT SUBSTRAND"
        , "EXS1" : "Extended Standard 1"
        , "EXS2" : "Extended Standard 2"
        , "EXS3" : "Extended Standard 3"
        , "EXS4" : "Extended Standard 4"
        , "LIFS" : "Life Science Strand"
        , "NSE"  : "Natural Science and Engineering Strand"
        , "SEV"  : "Standard Error of Measurement for Vertical Scale Score"
        , "SES"  : "Standard Error of Measurement for Scale Score"
        , "VSS"  : "Vertical Scale Score (Student Progress Score)"
        , null : null

    }

    var decodePassage = {
        "1" : "READ TO"
        ,"2" : "READ ALONG"
        ,"3" : "READ ALONE"
        , null : null
    }

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

    //Levels remain 1-6
    function decodeProficiencyLevel(profLevel) {
        var primaryResult = "@UNK";
        if(profLevel === "" || profLevel == null){
            primaryResult = null;
        } else {
            var firstNumber = profLevel.substring(0, 1);
            primaryResult = "@UNK";
            if(profLevel === "A1") {
                primaryResult = "Initiating";
            }
            else if(profLevel === "A2") {
                primaryResult = "Exploring";
            }
            else if(profLevel === "A3") {
                primaryResult = "Engaging";
            }
            else if(profLevel === "P1") {
                primaryResult = "Entering";
            }
            else if(profLevel === "P2") {
                primaryResult = "Emerging";
            }
            else if(profLevel === "P3") {
                primaryResult = "Developing";
            }
            else if(profLevel === "NA") {
                primaryResult = "Not Available";
            }
            else if (firstNumber === "1") {
                primaryResult = "Entering";
            } else if (firstNumber === "2") {
                primaryResult = "Emerging"; // primaryResult = "Beginning";
            } else if (firstNumber === "3") {
                primaryResult = "Developing";
            } else if (firstNumber === "4") {
                primaryResult = "Expanding";
            } else if (firstNumber === "5") {
                primaryResult = "Bridging";
            } else if (firstNumber === "6") {
                primaryResult = "Reaching";
            } else if (firstNumber === "N") {
                primaryResult = "N/A";
            }
        }
        return primaryResult;
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
        //print("--- " + JSON.stringify(row));
        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
        //print("--- " + JSON.stringify(score));

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

        var birthDateObject = module.mapDateObject(hierarchy, row, row.getField("DATE_OF_BIRTH"));
        var testDateObject = module.mapDateObject(hierarchy, row, row.getField("TEST_DATE"));
        var studentGenderCode = null;
        var genderCode = row.getField("GENDER");
              if (genderCode != null){
                   studentGenderCode = _util.trim(row.getField("GENDER") + "-").substring(0, 1).toUpperCase();
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
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        null
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("TESTING_SCHOOL_NUMBER")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("TESTING_SCHOOL_NUMBER")
                    );
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("TESTING_SCHOOL_NUMBER")
                    );
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
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
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("MARSS_STATE_REPORTING_NUMBER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesceEmptyString(row.getField("MARSS_STATE_REPORTING_NUMBER"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesceEmptyString(row.getField("LOCAL_STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("STUDENT_FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("STUDENT_LAST_NAME");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = studentGenderCode;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = testDateObject.STANDARD_DATE;
                    break;
                default:
                    record[field] = row.getField(field);
                    break
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

        if (_util.trim(row.getField("TEST_CODE")) !== "" && _util.trim(row.getField("TEST_CODE")) !== "NA") {
            admin.TEST_INTERVENTION_CODE = _util.trim(row.getField("TEST_CODE"));
            admin.TEST_INTERVENTION_DESC = decodeConditionCodes[admin.TEST_INTERVENTION_CODE] === undefined ? null : decodeConditionCodes[admin.TEST_INTERVENTION_CODE];
        } else {
            admin.TEST_INTERVENTION_CODE = "NA";
            admin.TEST_INTERVENTION_DESC = "Not Attempted";
        }

        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapTotalScore(row, testMetadata) {
        if (row.getField("TEST_NAME") === 'ALTACCESS' || row.getField("TEST_NAME") === 'ACCESS') {
            return null;
        }
        var score = {};
        var testNumber = testMetadata.TEST
            + "_" + row.getField("TEST_NAME")
            + "_" + row.getField("TEST_SUBJECT")
            + "_" + decodeGradeCode(row.getField("GRADE"))
            + "_" + testMetadata.CODE;
        var achievementLevel = row.getField("ACHIEVEMENT_LEVEL");
        var lexileQuantile = row.getField("LEXILE_QUANTILE_SCORE");
        var lexileQuantileRange = row.getField("LEXILE_QUANTILE_SCORE_RANGE");
        var slifeFlag = row.getField("S_LIFE_FLAG");
        // Check for key fields and do not map score and exit if conditions met.
        if (achievementLevel === undefined || achievementLevel === null || _util.trim(achievementLevel) === "") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_PRIMARY_RESULT"] = "Not Tested";
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = achievementLevel;

        // Set scaled score if SSCO is present
        for (var i = 1; i < 31; i++) {
            if (row.getField("SCORE_" + i + "_LABEL") == 'SSCO') {
                var raw = row.getField("SCORE_" + i);
                // only call trimZeroes / toString if raw is non-null
                score["TEST_SCALED_SCORE"] = raw != null
                    ? trimZeroes(raw)
                    : null;
                score["TEST_SCORE_VALUE"] = raw != null
                    ? trimZeroes(raw)
                    : null;

                // only apply the MCA slice if TEST_NAME contains "MCA" *and* raw was defined
                var tn = row.getField("TEST_NAME");
                if (raw != null
                    && typeof tn === "string"
                    && tn.indexOf("MCA") > -1) {
                    var s = raw.toString();
                    // slice the last two chars
                    score["TEST_SCORE_VALUE"] = s.slice(-2);
                }
            }
        }

        // Set raw score if RSCO is present
        for (var i = 1; i < 31; i++) {
            if (row.getField("SCORE_" + i + "_LABEL") == 'RSCO') {
                var raw = row.getField("SCORE_" + i);
                score["TEST_RAW_SCORE"] = raw != null
                    ? trimZeroes(raw)
                    : null;
            }
        }

        // Set percentile if MNPR is present
        for (var i = 1; i < 31; i++) {
            if (row.getField("SCORE_" + i + "_LABEL") == 'MNPR') {
                var raw = row.getField("SCORE_" + i);
                score["TEST_PERCENTILE_SCORE"] = raw != null
                    ? trimZeroes(raw)
                    : null;
            }
        }

        // Set standard error if SES is present
        for (var i = 1; i < 31; i++) {
            if (row.getField("SCORE_" + i + "_LABEL") == 'SES') {
                var raw = row.getField("SCORE_" + i);
                score["TEST_STANDARD_ERROR"] = raw != null
                    ? trimZeroes(raw)
                    : null;
            }
        }

        // Set multiple choice points if present
        for (var i = 1; i < 31; i++) {
            if (row.getField("SCORE_" + i + "_LABEL") == 'MCP') {
                var raw = row.getField("SCORE_" + i);
                score["TEST_ITEMS_POSSIBLE"] = raw != null
                    ? trimZeroes(raw)
                    : null;
            }
        }

        // Set technology enhanced/gridded points if present
        for (var i = 1; i < 31; i++) {
            if (row.getField("SCORE_" + i + "_LABEL") == 'TEGP') {
                var raw = row.getField("SCORE_" + i);
                score["TEST_ITEMS_ATTEMPTED"] = raw != null
                    ? trimZeroes(raw)
                    : null;
            }
        }

        score["TEST_PRIMARY_RESULT_CODE"] = achievementLevel;
        score["TEST_PRIMARY_RESULT"] = decodeAchievementLevel[achievementLevel];
        score["TEST_PASSED_INDICATOR"] = decodeAchievementPassLevel[achievementLevel];
        score["TEST_SECONDARY_RESULT_CODE"] = lexileQuantile;
        score["TEST_SECONDARY_RESULT"] = lexileQuantileRange;
        score["TEST_SCORE_ATTRIBUTES"] = slifeFlag;
        return score;
    }


    function mapScaleStrandScore(row, testMetadata){
        if(row.getField("TEST_NAME") ==='ALTACCESS' || row.getField("TEST_NAME")==='ACCESS' ){
            return null;
        }
        var score = {};
        var testNumber =  testMetadata.TEST
                             + "_" + row.getField("TEST_NAME")
                             + "_" + row.getField("TEST_SUBJECT")
                             + "_" + decodeGradeCode(row.getField("GRADE"))
                             + "_" + testMetadata.CODE;
        for(var i = 1; i < 31;i++){
            if(row.getField("SCORE_"+i+"_LABEL") == testMetadata.CODE){
                var scoreValue = trimZeroes(row.getField("SCORE_"+i));
                if(scoreValue === undefined || scoreValue === null || _util.trim(scoreValue) === "") {
                    score["TEST_NUMBER"] = testNumber;
                    score["TEST_PRIMARY_RESULT"] =  "Not Tested";
                }
                for(var j = 1; j < 31;j++){
                    if(row.getField("SCORE_"+j+"_LABEL") == testMetadata.CODE2 && testMetadata.CODE2 !== ""){
                        score["TEST_STANDARD_ERROR"] = trimZeroes(row.getField("SCORE_"+j));
                    }
                }
                var scoreLabel = row.getField("SCORE_"+i+"_LABEL");
                var scoreChar = row.getField("SCORE_"+i+"_CHARACTERISTIC");
                var scoreRange = row.getField("SCORE_"+i+"_RANGE");
                var slifeFlag = row.getField("S_LIFE_FLAG");
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = scoreValue;
                if(!isNaN(scoreValue)){
                    score["TEST_SCORE_VALUE"] = trimZeroes(scoreValue);
                    score["TEST_SCALED_SCORE"] = trimZeroes(scoreValue);
                }
                score["TEST_QUATERNARY_RESULT_CODE"] = scoreLabel;
                score["TEST_QUATERNARY_RESULT"] = decodeScorelbl[scoreLabel];
                score["TEST_SECONDARY_RESULT_CODE"] = scoreChar;
                score["TEST_TERTIARY_RESULT_CODE"] = scoreRange;
                score["TEST_SCORE_ATTRIBUTES"] = slifeFlag;
                return score;
            }
        }
        return null;
    }
    function mapStanineStrandScore(row, testMetadata){
        if(row.getField("TEST_NAME") ==='ALTACCESS' || row.getField("TEST_NAME")==='ACCESS' ){
            return null;
        }
        var score = {};
       var grade = decodeGradeCode[row.getField("GRADE")];
        var testNumber =  testMetadata.TEST
                             + "_" + row.getField("TEST_NAME")
                             + "_" + row.getField("TEST_SUBJECT")
                             + "_" + decodeGradeCode(row.getField("GRADE"))
                             + "_" + testMetadata.CODE;
        for(var i = 1; i < 31;i++){
            if(row.getField("SCORE_"+i+"_LABEL") == testMetadata.CODE||row.getField("SCORE_"+i+"_LABEL") == testMetadata.CODE2)
            {
                var scoreValue = trimZeroes(row.getField("SCORE_"+i));
                if(scoreValue === undefined || scoreValue === null || _util.trim(scoreValue) === "") {
                    score["TEST_NUMBER"] = testNumber;
                    score["TEST_PRIMARY_RESULT"] =  "Not Tested";
                }
                for(var j = 1; j < 31;j++){
                    if(row.getField("SCORE_"+j+"_LABEL") == testMetadata.CODE2 && testMetadata.CODE2 !== ""){
                        score["TEST_STANDARD_ERROR"] = trimZeroes(row.getField("SCORE_"+j));
                    }
                }
                if(grade >= '03' && grade <= '05'){
                    if(testMetadata.CODE === "DAPS"){
                        return null;
                    }
                } else if(grade >= '06' && grade <= '11'){
                    if(testMetadata.CODE === "DANS"){
                        return null;
                    }
                }
                var scoreLabel = row.getField("SCORE_"+i+"_LABEL");
                var scoreChar = row.getField("SCORE_"+i+"_CHARACTERISTIC");
                var scoreRange = row.getField("SCORE_"+i+"_RANGE");
                var slifeFlag = row.getField("S_LIFE_FLAG");
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = scoreValue;
                if(!isNaN(scoreValue)){
                    score["TEST_SCORE_VALUE"] = trimZeroes(scoreValue);
                    score["TEST_STANINE_SCORE"] = trimZeroes(scoreValue);
                }
                score["TEST_QUATERNARY_RESULT_CODE"] = scoreLabel;
                score["TEST_QUATERNARY_RESULT"] = decodeScorelbl[scoreLabel];
                score["TEST_SECONDARY_RESULT_CODE"] = scoreChar;
                score["TEST_TERTIARY_RESULT_CODE"] = scoreRange;
                score["TEST_SCORE_ATTRIBUTES"] = slifeFlag;
                return score;
            }
        }
        return null;
    }

    function mapMTASPassage(row, testMetadata) {
        if(row.getField("TEST_NAME") ==='ALTACCESS' || row.getField("TEST_NAME")==='ACCESS' ){
            return null;
        }
       var score = {};
       var testNumber =  testMetadata.TEST
                            + "_" + row.getField("TEST_NAME")
                            + "_" + row.getField("TEST_SUBJECT")
                            + "_" + decodeGradeCode(row.getField("GRADE"))
                            + "_" + testMetadata.CODE;

       var accessAll = row.getField("MTAS_PASSAGE_ACCESS_ALL");
       var passage1 = row.getField("MTAS_OPERATIONAL_PASSAGE_1");
       var passage2 = row.getField("MTAS_OPERATIONAL_PASSAGE_2");
       var passage3 = row.getField("MTAS_OPERATIONAL_PASSAGE_3");
       var slifeFlag = row.getField("S_LIFE_FLAG");

       // Check for key fields and do not map score and exit if conditions met.
       if(accessAll === undefined || accessAll === null || _util.trim(accessAll) === "") {
           score["TEST_NUMBER"] = testNumber;
           score["TEST_PRIMARY_RESULT"] =  "Not Tested";
       }

       // Set score fields
       score["TEST_NUMBER"] = testNumber;
       score["TEST_SCORE_TEXT"] = accessAll;
       score["TEST_PRIMARY_RESULT_CODE"] = passage1;
       score['TEST_PRIMARY_RESULT'] = decodePassage[passage1];
       score["TEST_SECONDARY_RESULT_CODE"] = passage2;
       score["TEST_SECONDARY_RESULT"] = decodePassage[passage2];
       score["TEST_TERTIARY_RESULT_CODE"] = passage3;
       score["TEST_TERTIARY_RESULT"] = decodePassage[passage3];
       score["TEST_SCORE_ATTRIBUTES"] = slifeFlag;
       return score;
    }

    function mapAccessStrandScore(row, testMetadata){
        if(row.getField("TEST_NAME")!=='ALTACCESS' && row.getField("TEST_NAME")!=='ACCESS' ){
            return null;
        }
        var score = {};
        var altFlag = "";
        var formVal = row.getField("FORM_NUMBER");
        if(row.getField("TEST_NAME")==='ALTACCESS'){
            altFlag = 'ALT';
        }
        if(null===formVal||"-"===formVal){
            formVal = "";
        }
        var testNumber =  altFlag
                             + testMetadata.TEST
                             + decodeGradeCode(row.getField("GRADE"))
                             + formVal
                             + testMetadata.NUM_PART;
        for(var i = 1; i < 31;i++){
            if(row.getField("SCORE_"+i+"_LABEL") == testMetadata.CODE){
                var scoreValue = removeDecimal(trimZeroes(row.getField("SCORE_"+i)));
                if(scoreValue === undefined || scoreValue === null || _util.trim(scoreValue) === "") {
                    score["TEST_NUMBER"] = testNumber;
                    score["TEST_PRIMARY_RESULT"] =  "Not Tested";
                }
                for(var j = 1; j < 31;j++){
                    if(row.getField("SCORE_"+j+"_LABEL") == testMetadata.CODE2 && testMetadata.CODE2 !== ""){
                        score["TEST_QUATERNARY_RESULT_CODE"] = trimZeroes(row.getField("SCORE_"+j));
                    }
                }
                var scoreChar = row.getField("SCORE_"+i+"_CHARACTERISTIC");
                var scoreRange = row.getField("SCORE_"+i+"_RANGE");
                var slifeFlag = row.getField("S_LIFE_FLAG");
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = scoreValue;
                if(!isNaN(scoreValue)){
                    score["TEST_SCORE_VALUE"] = trimZeroes(scoreValue);
                    score["TEST_STANINE_SCORE"] = trimZeroes(scoreValue);
                }
                score["TEST_SECONDARY_RESULT_CODE"] = scoreChar;
                score["TEST_TERTIARY_RESULT_CODE"] = scoreRange;
                score["TEST_SCORE_ATTRIBUTES"] = slifeFlag;
                return score;
            }
        }
        return null;
    }
    function mapAccessComponentScore(row, testMetadata){
        if(row.getField("TEST_NAME")!=='ALTACCESS' && row.getField("TEST_NAME")!=='ACCESS' ){
            return null;
        }
        var score = {};
        var altFlag = "";
        var formVal = row.getField("FORM_NUMBER");
        if(row.getField("TEST_NAME")==='ALTACCESS'){
            altFlag = 'ALT';
        }
        if(null===formVal||"-"===formVal){
            formVal = "";
        }
        var testNumber =  altFlag
                             + testMetadata.TEST
                             + decodeGradeCode(row.getField("GRADE"))
                             + formVal
                             + testMetadata.NUM_PART;
        for(var i = 1; i < 31;i++){
            if(row.getField("TEST_SUBJECT") == testMetadata.CODE && row.getField("SCORE_"+i+"_LABEL") == "SSCO"){
                var scoreValue = removeDecimal(trimZeroes(row.getField("SCORE_"+i)));
                if(scoreValue === undefined || scoreValue === null || _util.trim(scoreValue) === "") {
                    score["TEST_NUMBER"] = testNumber;
                    score["TEST_PRIMARY_RESULT"] =  "Not Tested";
                }
                for(var j = 1; j < 31;j++){
                    if(row.getField("SCORE_"+j+"_LABEL") == "PLS"){
                        score["TEST_QUATERNARY_RESULT_CODE"] = trimZeroes(row.getField("SCORE_"+j));
                    }
                }
                score["TEST_PRIMARY_RESULT_CODE"]=row.getField("ACHIEVEMENT_LEVEL");
                score["TEST_PRIMARY_RESULT"]=decodeProficiencyLevel(row.getField("ACHIEVEMENT_LEVEL"));
                var scoreChar = row.getField("SCORE_"+i+"_CHARACTERISTIC");
                var scoreRange = row.getField("SCORE_"+i+"_RANGE");
                var slifeFlag = row.getField("S_LIFE_FLAG");
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCORE_TEXT"] = scoreValue;
                if(!isNaN(scoreValue)){
                    score["TEST_SCORE_VALUE"] = trimZeroes(scoreValue);
                    score["TEST_STANINE_SCORE"] = trimZeroes(scoreValue);
                }
                score["TEST_SECONDARY_RESULT_CODE"] = scoreChar;
                score["TEST_TERTIARY_RESULT_CODE"] = scoreRange;
                score["TEST_SCORE_ATTRIBUTES"] = slifeFlag;
                return score;
            }
        }
        return null;
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
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }


    module.mapDateObject = function(hierarchy, row, dateStr){

        //Create empty test date object.
       let testDateObject = null

        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyyMMdd");
        } catch(exception){
            // Error will be reported in final check.
        }

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

    function trimZeroes(value) {
      if (value == null) return value;
      var s = value.toString();
      if (s.length === 6) {
        s = s.substring(0, 4);
      }
      while (s.charAt(0) === "0") {
        s = s.substring(1);
      }
      return s;
    }


    /**
     * Remove the decimal part of a number from string number
     * @param value
     * @returns {string|null|*}
     */
    function removeDecimal(value) {
        if (value == null || value === 'undefined') {
            return null;
        }

        const index = value.lastIndexOf('.');
        if (index < 0) {
            return value;
        } else {
            return value.substring(0, index);
        }
    }


    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
