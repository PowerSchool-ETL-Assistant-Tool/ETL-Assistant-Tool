var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ma_access";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *`
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
        try {
            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}\n");

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
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\"))
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
        {FIELD:"COMPREHENSION", CODE: "COMP", MAP_FUNCTION: mapTestScoreRecord} //ACCCOMP2
        ,{FIELD:"LISTENING", CODE: "LIS", MAP_FUNCTION: mapTestScoreRecord} //ACCLIS2
        ,{FIELD:"LITERACY", CODE: "LIT", MAP_FUNCTION: mapTestScoreRecord} //ACCLIT2
        ,{FIELD:"ORAL", CODE: "ORAL", MAP_FUNCTION: mapTestScoreRecord} //ACCORAL2
        ,{FIELD:"OVERALL", CODE: "TOT", MAP_FUNCTION: mapTestScoreRecord} //ACCTOT2
        ,{FIELD:"READING", CODE: "RD", MAP_FUNCTION: mapTestScoreRecord} //ACCRD2
        ,{FIELD: "SPEAKING", CODE: "SP", MAP_FUNCTION: mapTestScoreRecord} //ACCSP2
        ,{FIELD: "WRITING", CODE: "WR", MAP_FUNCTION: mapTestScoreRecord} //ACCWR2
        ];



    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var progressTowardCareerReadinessDecode = {
        "0" : "Insufficient progress toward an NCRC level"
        , "1" : "Progress toward Bronze Level NCRC"
        , "2" : "Progress toward Silver level NCRC"
        , "3" : "Progress toward Gold level NCRC"
        , "-" : "Unable to calculate"
    };


    var understandingComplexTextDecode = {
        "0" : "Below proficiency"
        , "1" : "Proficient"
        , "2" : "Above proficiency"
        , "-" : "Unable to calculate"
    };

   var decodeMadeProgress = {
       "0": "Did Not Make Progress",
       "1": "Made Progress",
       "": null,
       null: null
   };

    //Levels remain 1-6
    function decodeProficiencyLevel(profLevel) {
        var primaryResult = "@UNK";
        if(profLevel === "" || profLevel == null){
            primaryResult = null;
        } else {
            var firstNumber = profLevel.substring(0, 1);
            primaryResult = "@UNK";

            if (firstNumber === "1") {
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
        Assessment-specific decode functions
    ***********************************************************************************/
    function getGrade(row) {
        var gradeValue = _util.trim(row.getField("GRADE"));

        if(gradeValue === undefined || gradeValue === null) {
            gradeValue = "";
        } else if (gradeValue === "0" || gradeValue === "00") {
            gradeValue = "KG";
        } else if (gradeValue.length === 1) {
            gradeValue = "0" + gradeValue;
        }
        return gradeValue;
    }

//TODO validate against MA dw race codes
    function getRace(row){
        var race = _util.trim(row.getField("RACE"));
        //A=Asian; B=Black; H=Hispanic; M=Multi-race; N=Native American; P=Pacific Islander; W=White
        if(race=='N'){
            race = "AIAN";
        }
        else if(race=='A'){
            race = "ASIA";
        }
        else if(race=='B'){
            race = "B/AA";
        }
        else if(race=='P'){
            race = "PI/H";
        }
        else if(race=='W'){
            race = "WHIT";
        }
        else if(race=='M'){
            race = "MULT";
        }
        if(race=='H'){
            race = race.substring(0,2) + "HL";
        }
        return race;
    }

    function getTEST_ADMIN_DATE_STR(hierarchy) {
        var schoolYear = hierarchy.SCHOOL_YEAR;
    	return "05/01/" + schoolYear.substring(5, 9);
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
		var grade = getGrade(row);
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];


        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);


        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            var score = (testMetadata.MAP_FUNCTION)(row,testMetadata,grade);
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

        var birthDateObject = parseDate(row.getField("BIRTH_DATE"));
        var testDateObject = parseDate(getTEST_ADMIN_DATE_STR(hierarchy));

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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   below...
                    /*
                    record.DISTRICT_CODE = _util.coalesce(
                                                row.getField("RESPONSIBLE_DISTRICT_NUMBER"),
                                                row.getField("DISTRICT_NUMBER"),
                                                AssessmentLoader.config.DISTRICT_CODE
                                            );
                     */
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("RESPONSIBLE_SCHOOL_NUMBER"),
                        row.getField("SCHOOL_NUMBER")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("RESPONSIBLE_SCHOOL_NUMBER"),
                        row.getField("SCHOOL_NUMBER")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL_NAME")
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
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_RACE_CODE":
                    record.STUDENT_RACE_CODE = getRace(row);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = getGrade(row);
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = getGrade(row);
                    break;
                case "STUDENT_MIGRANT_ED_IND":
                    record.STUDENT_MIGRANT_ED_IND = _util.coalesce(row.getField("MIGRANT"));
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
        function mapAdditionalAdminFields(row){

            var admin = {};

            admin.TEST_INTERVENTION_DESC = row.getField("MADE_EXIT_CRITERIA");
            admin.TEST_INTERVENTION_DESC_2 = row.getField("EXITEDELINSTRUCTION_RE3");
            admin.TEST_INTERVENTION_DESC_2 = row.getField("NOTMEETINGEXITCRITERIA_RE5");
            return admin;
        }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function mapTestScoreRecord(row, testMetadata, grade) {
        var testScoreElement = {};
        var scaleScore = _util.coalesce(_util.trim(row.getField(testMetadata.FIELD + "_SCALED_SCORE")));

        if(scaleScore === null || scaleScore === undefined || scaleScore === "--" || scaleScore === ""){
            return null;
        }else{
            var tier = _util.coalesce(_util.trim(row.getField("TIER")));
            var testNumber = getTestNumber(grade, tier, testMetadata.CODE);

            var profLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_PROFICIENCY_LEVEL")
                            ,row.getField(testMetadata.FIELD + "_ALT_PROFICIENCY_LEVEL"));
            var attrib = _util.coalesce(row.getField("MODE"));
            var alteqLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_ALT_EQ_LEVEL"));
            var madeprogress = row.getField("MADE_PROGRESS");
            var progresstargetcurrent = row.getField("PROGRESS_TARGET_CURRENT_YEAR");
            var difficultycurrent = row.getField("DIFFICULTY_INDEX_CURRENT_YEAR");
            var progresstargetupcoming = row.getField("PROGRESS_TARGET_UPCOMING_YEAR");
            var difficultyupcoming = row.getField("DIFFICULTY_INDEX_UPCOMING_YEAR");
            //Prepare scores object
            testScoreElement["TEST_NUMBER"] = testNumber;

            if (scaleScore === "NA") {
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = "0";
                testScoreElement["TEST_PRIMARY_RESULT"] = scaleScore;
                testScoreElement["TEST_SCORE_TEXT"] = scaleScore;
            } else {
                testScoreElement["TEST_SCALED_SCORE"] = scaleScore;
                testScoreElement["TEST_SCORE_VALUE"] = scaleScore;
                testScoreElement["TEST_SCORE_TEXT"] = scaleScore;
                testScoreElement["TEST_PRIMARY_RESULT_CODE"] = profLevel;
                testScoreElement["TEST_PRIMARY_RESULT"] = decodeProficiencyLevel(profLevel);
                testScoreElement["TEST_SCORE_ATTRIBUTES"] = attrib;
                testScoreElement["TEST_SECONDARY_RESULT_CODE"] = alteqLevel;
                testScoreElement["TEST_GROWTH_RESULT"] = decodeMadeProgress[madeprogress];
                testScoreElement["TEST_GROWTH_RESULT_CODE"] = madeprogress;
                if(!isNaN(progresstargetcurrent)){
                    testScoreElement["TEST_GROWTH_TARGET_1"] = progresstargetcurrent;
                }
                if(!isNaN(difficultycurrent)){
                    testScoreElement["TEST_GROWTH_TARGET_2"] = difficultycurrent;
                }
                if(!isNaN(progresstargetupcoming)){
                    testScoreElement["TEST_GROWTH_TARGET_3"] = progresstargetupcoming;
                }
                if(!isNaN(difficultyupcoming)){
                    testScoreElement["TEST_GROWTH_TARGET_4"] = difficultyupcoming;
                }
            }

        }
        return testScoreElement;
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
           + "_" + AssessmentLoader.config.DISTRICT_CODE
		   + "_" + hierarchy.SCHOOL_YEAR;


       //Add natural key fields
       signature.getFormat().getNaturalKey().forEach(function(key) {
           assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
       });

       return assessmentAdminKey;
    }

    function getTestNumber(grade, tier, suffix) {
        if(grade === "KG" || null === tier || "" === tier){
            //Ignore Tier
            return "ACC2" + grade + suffix;
        } else {
            return "ACC2" + grade + tier + suffix;
        }
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

        var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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
