var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "WIDA_ACCESS_2";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
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
                .group_by("ADMINISTRATION GROUPING", function (one, two) {

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, exception, JSON.stringify(one) + '|' + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK: ${exception}", JSON.stringify(rows)));
                    }

                })
                .transform("TRANSFORM", ["RECORDS"],
                    function (output, rows) {

                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {

                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if (mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", row.LINEAGE_LINE, "No Scores Found and/or No Test Admin Date.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

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
            // ELPAC Scores to Process
            { TEST: "ACC", CODE: "COMP", FIELD: "COMPREHENSION", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "LIS", FIELD: "LISTENING", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "LIT", FIELD: "LITERACY", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "ORAL", FIELD: "ORAL", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "SP", FIELD: "SPEAKING", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "TOT", FIELD: "OVERALL", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "TOT", FIELD: "COMPOSITE", MAP_FUNCTION: mapScore }

            , { TEST: "ACC", CODE: "GROWTH", FIELD: "GROWTH", MAP_FUNCTION: mapGrowthScore }
            , { TEST: "ACC", CODE: "ELA", FIELD: "ELA", MAP_FUNCTION: mapStudentPerformance }
            , { TEST: "ACC", CODE: "MATH", FIELD: "MATH", MAP_FUNCTION: mapStudentPerformance }
            , { TEST: "ACC", CODE: "SCI", FIELD: "SCIENCE", MAP_FUNCTION: mapStudentPerformance }
            , { TEST: "ACC", CODE: "CLUS_LIS", FIELD: "LISTENING", MAP_FUNCTION: mapClusterFields }
            , { TEST: "ACC", CODE: "CLUS_SP", FIELD: "SPEAKING", MAP_FUNCTION: mapClusterFields }
            , { TEST: "ACC", CODE: "CLUS_WR", FIELD: "WRITING", MAP_FUNCTION: mapClusterFields }
            , { TEST: "ACC", CODE: "CLUS_RD", FIELD: "READING", MAP_FUNCTION: mapClusterFields }
        ];

    var GLOBAL_OBJ = { STANDARD_NORMALIZED_FILE_FIELDS: null };



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/


    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    //Levels remain 1-6
    function decodeProficiencyLevel(profLevel) {
        var primaryResult = "@UNK";
        if (profLevel === "" || profLevel == null) {
            primaryResult = null;
        } else {
            var firstNumber = profLevel.substring(0, 1);
            primaryResult = "@UNK";
            if (profLevel === "A1") {
                primaryResult = "Initiating";
            }
            else if (profLevel === "A2") {
                primaryResult = "Exploring";
            }
            else if (profLevel === "A3") {
                primaryResult = "Engaging";
            }
            else if (profLevel === "P1") {
                primaryResult = "Entering";
            }
            else if (profLevel === "P2") {
                primaryResult = "Emerging";
            }
            else if (profLevel === "P3") {
                primaryResult = "Developing";
            }
            else if (profLevel >= "L1" && profLevel <="L1.9") {
                primaryResult = "Entering";
            }
            else if (profLevel >= "L2" && profLevel <="L2.9") {
                primaryResult = "Emerging";
            }
            else if (profLevel >= "L3" && profLevel <="L3.9") {
                primaryResult = "Developing";
            }
            else if (profLevel >= "L4" && profLevel <="L4.9") {
                primaryResult = "Expanding";
            }
            else if (profLevel >= "L5" && profLevel <="L5.9") {
                primaryResult = "Bridging";
            }
            else if (profLevel >= "L6") {
                primaryResult = "Reaching";
            }
            else if (profLevel === "NA") {
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


    function getGrade(row) {
        var gradeValue = _util.coalesce(row.getField('GRADE'), row.getField("TESTEDGRADE"));

        if (gradeValue === undefined || gradeValue === null) {
            gradeValue = "";
        } else if (gradeValue === "0" || gradeValue === "00"|| gradeValue === "15" || gradeValue === "K") {
            gradeValue = "KG";
        } else if (gradeValue.length === 1) {
            gradeValue = "0" + gradeValue;
        }

        return gradeValue;
    }

    function getTEST_INTERVENTION_DESC(row) {
        var accomodationString = "";

        if (row.getField('MC_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "MC - ACCOMMODATION, ";
        }
        if (row.getField('RA_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "RA - ACCOMMODATION, ";
        }
        if (row.getField('ES_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "ES - ACCOMMODATION, ";
        }
        if (row.getField('LP_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "LP - ACCOMMODATION, ";
        }
        if (row.getField('BR_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "BR - ACCOMMODATION, ";
        }
        if (row.getField('SD_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "SD - ACCOMMODATION, ";
        }
        if (row.getField('HR_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "HR - ACCOMMODATION, ";
        }
        if (row.getField('RR_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "RR - ACCOMMODATION, ";
        }
        if (row.getField('HI_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "HI - ACCOMMODATION, ";
        }
        if (row.getField('RI_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "RI - ACCOMMODATION, ";
        }
        if (row.getField('SR_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "SR - ACCOMMODATION, ";
        }
        if (row.getField('WD_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "WD - ACCOMMODATION, ";
        }
        if (row.getField('RD_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "RD - ACCOMMODATION, ";
        }
        if (row.getField('NS_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "NS - ACCOMMODATION, ";
        }
        if (row.getField('ET_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "ET - ACCOMMODATION, ";
        }
        if (row.getField('EM_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "EM - ACCOMMODATION, ";
        }
        if (row.getField('IR_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "EM - ACCOMMODATION, ";
        }
        if (row.getField('RP_-_ACCOMMODATION') === "Y") {
            accomodationString = accomodationString + "EM - ACCOMMODATION, ";
        }

        if (accomodationString === "") {
            return "NONE";
        } else {
            return accomodationString.substring(0, 200);
        }

    }

    function getRace(row) {
        var race = "";
        if (row.getField('RACE_-_AMERICAN INDIAN/ALASKA NATIVE') === 'Y') {
            race = "AIAN";
        }
        else if (row.getField('RACE_-_ASIAN') === 'Y') {
            race = "ASIA";
        }
        else if (row.getField('ETHNICITY_-_BLACK/AFRICAN AMERICAN') === 'Y') {
            race = "B/AA";
        }
        else if (row.getField('RACE_-_PACIFIC ISLANDER/HAWAIIAN') === 'Y') {
            race = "PI/H";
        }
        else if (row.getField('RACE_-_WHITE') === 'Y') {
            race = "WHIT";
        }

        if (row.getField('ETHNICITY_-_HISPANIC/LATINO') === 'Y') {
            race = race.substring(0, 2) + "HL";
        }
        return race;
    }

    var genderDecode = {
        "Female" : "F",
        "Male" : "M",
        "1": "F",
        "2": "M",
        "M": "M",
        "F": "F",
        "" : null,
        null : null
     };

   var growthMetDecode = {
        "FALSE": "Did Not Meet Target Score",
        "0": "Did Not Meet Target Score",
        "TRUE": "Met Target Score",
        "1"   : "Met Target Score",
        "": null,
        null : null
    };

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
        scoresToMap.forEach(function (testMetadata) {
            var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);
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
        if (!GLOBAL_OBJ.STANDARD_NORMALIZED_FILE_FIELDS) {
            GLOBAL_OBJ.STANDARD_NORMALIZED_FILE_FIELDS = AppUtil.getStandardNormalizedFileFields();
        }
        var normalizedFileFields = GLOBAL_OBJ.STANDARD_NORMALIZED_FILE_FIELDS;


        var testDateObject = AppUtil.getEmptyDateObj();
        var birthDateObject = AppUtil.getEmptyDateObj();

        var rawDate = row.getField('BIRTH_DATE');
        var rawTestDat = row.getField("TEST_COMPLETION_DATE");


        if (rawDate) {
            birthDateObject = AppUtil.getMonthFollowedByDay(rawDate);
        }

        if (rawTestDat) {
            testDateObject = parseDate(rawTestDat, signature);
        }
        var studentLastName = '';
        var studentFirstName = '';
        var studentMiddleInitial = '';

        if (row.getField('STUDENT_NAME')) {
            var studentName = row.getField('STUDENT_NAME');
            studentLastName = studentName.split(',')[0];
            var firstNameSeparator = studentName.split(',')[1].split(' ');
            var middleInitial = firstNameSeparator[firstNameSeparator.length-1];
            if (middleInitial.length === 1) {
                studentMiddleInitial = middleInitial;
                studentFirstName = firstNameSeparator.slice(0,-1).join(' ');
            } else {
                studentFirstName = studentName.split(',')[1];
            }
        } else {
            studentFirstName = row.getField('STUDENT_FIRST_NAME');
            studentLastName = row.getField('STUDENT_LAST_NAME');
            studentMiddleInitial = row.getField('STUDENT_MIDDLE_NAME');
        }

        /*  pre UIHN-9419:
        var trimmedDistrictCode = _util.coalesce(
            row.getField("DISTRICT_NUMBER")
            , AssessmentLoader.config.DISTRICT_CODE
            , ""
        );
        */

        //Loop through normalized fields and map if possible.
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   trimmedDistrictCode;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_CODE"),row.getField("SCHOOL_NAME"),
                        'DISTRICT' // As there is no school information in the data file
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_CODE"),row.getField("SCHOOL_NAME"),
                        'DISTRICT' // As there is no school information in the data file
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL_NAME")
                    );
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(
                        testDateObject.STANDARD_DATE,
                        "05" + "/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9)
                    );
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
                    record.STUDENT_GRADE_CODE = getGrade(row);
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = getGrade(row);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_STUDENT_ID"),row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("DISTRICT_STUDENT_ID"), row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = studentFirstName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = studentMiddleInitial;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = studentLastName;
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = genderDecode[row.getField("GENDER")];
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

        admin.TEST_INTERVENTION_DESC = getTEST_INTERVENTION_DESC(row);
        admin.TEST_INTERVENTION_CODE_2 = row.getField("PRIMARY_DISABILITY");
        admin.TEST_INTERVENTION_CODE_3 = row.getField("SECONDARY_DISABILITY");
        admin.TEST_ASSESSMENT_TYPE = row.getField("FORM_NUMBER");
        admin.STUDENT_RACE_CODE = getRace(row);
        admin.STUDENT_MIGRANT_ED_IND = row.getField("MIGRANT");

        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScore(row, testMetadata, signature) {
        // One of the data file doesn't contains TEST_COMPLETION_DATE, so added default value 05/15/SCHOOL_YEAR
        //Potentially caused by ACCESS_2_17_18, ACCESS_2_17_PLUS, ACCESS_2_18_19_31_COL, ACCESS_2_19_20_21, ACCESS_17-18_18-19
        //ACCESS_19-20_20-21, ACCESS_2021_2022, ACCESS_SY_2018, ALT_ACCESS_19
        var signature = signature.getFormat().getFormatName();
        if(signature === "ACCESS2_ROSTER" || signature === "ACCESS2_RESULTS_COL26" || signature === "ACCESS 2.0_33_1_COLS" || signature === "ACCESS2_PSUI_ALT_21_22" || signature === "ACCESS2_PSUI_SUMM_21_22" || signature === "ACCESS_2"
         || signature === "ACCESS_20_21" || signature === "ACCESS_2_15_16" || signature === "ACCESS_2_16_17" || signature === "ACCESS_2_17_18_19" || signature === "ACCESS_2_2017_ALT" || signature === "ACCESS_2_20_LIKE_19" || signature === "ACCESS_Puyallup_2022"
         || signature === "ACCESS_2_SHORT"){
        var testCompletionDate = row.getField('TEST_COMPLETION_DATE');
        if (testCompletionDate !== undefined && (testCompletionDate === "" || testCompletionDate === null)) {
            return null;
        }
        }

        var score = {};
        var grade = getGrade(row);
        var tier = row.getField("TIER_-_" + testMetadata.FIELD);

        if (tier === undefined || _util.trim(tier) === "" || tier === "-") {
            tier = null;
        }

        var testNumber = getTestNumber(grade, tier, testMetadata.CODE, row);
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "_SCALE_SCORE"),row.getField("SCALE_SCORE_-_" + testMetadata.FIELD),row.getField(testMetadata.FIELD + "_SS"));
        var proficiencyLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_PROFICIENCY_LEVEL"), row.getField("PROFICIENCY_LEVEL_-_" + testMetadata.FIELD),row.getField(testMetadata.FIELD + "_PL"));
        var lowerBound = row.getField(testMetadata.FIELD + "_CONFIDENCE_-_LOW_SCORE");
        var upperBound = row.getField(testMetadata.FIELD + "_CONFIDENCE_-_HIGH_SCORE");
        var testGrade = getGrade(row);
        var metStandard = row.getField("METSTANDARD");

        var sem = _util.coalesce(row.getField("CSEM_-_" + testMetadata.FIELD), row.getField("SCALESCORESEM"));

         if ((!_util.trim(scaleScore) || _util.trim(scaleScore) === 'N/A' || _util.trim(scaleScore) === 'NA' || scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
         && (!_util.trim(proficiencyLevel) || _util.trim(proficiencyLevel) === 'NA' || proficiencyLevel === null || proficiencyLevel === undefined || _util.trim(proficiencyLevel) === "--" || _util.trim(proficiencyLevel) === "")) {
            return null;
        }

        score.TEST_GRADE_EQUIVALENT = testGrade;

        if (proficiencyLevel || scaleScore) {
            score.TEST_NUMBER = testNumber;
        }

        if (proficiencyLevel) {
            score.TEST_PRIMARY_RESULT_CODE = proficiencyLevel;
            score.TEST_PRIMARY_RESULT = decodeProficiencyLevel(proficiencyLevel);
        }

        if (scaleScore && !isNaN(scaleScore)) {
            score.TEST_SCORE_TEXT = scaleScore;
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_SCALED_SCORE = scaleScore;
        }

        if (!isNaN(sem)) {
            score.TEST_STANDARD_ERROR = sem;
        }
        if (!isNaN(lowerBound)) {
            score.TEST_LOWER_BOUND = lowerBound;
        }
        if (!isNaN(upperBound)) {
            score.TEST_UPPER_BOUND = upperBound;
        }
        if(metStandard){
            score.TEST_TERTIARY_RESULT = metStandard;
        }
            return score;
        }

    function mapGrowthScore(row, testMetadata, signature) {
    try{
        var score = {};
        var signature = signature.getFormat().getFormatName();
       if(signature === "ACCESS2_ROSTER" || signature === "ACCESS2_RESULTS_COL26" || signature === "ACCESS 2.0_33_1_COLS" || signature === "ACCESS2_PSUI_ALT_21_22" || signature === "ACCESS2_PSUI_SUMM_21_22" || signature === "ACCESS_2"
        || signature === "ACCESS_20_21" || signature === "ACCESS_2_15_16" || signature === "ACCESS_2_16_17" || signature === "ACCESS_2_17_18_19" || signature === "ACCESS_2_2017_ALT" || signature === "ACCESS_2_20_LIKE_19" || signature === "ACCESS_Puyallup_2022"
        || signature === "ACCESS_2_SHORT"){
        var testCompletionDate = row.getField('TEST_COMPLETION_DATE');
        if (testCompletionDate !== undefined && (testCompletionDate === "" || testCompletionDate === null)) {
            return null;
        }
        }
      var grade = getGrade(row);


      var testNumber = "ACC2" + grade + testMetadata.CODE;
      var growthScore = row.getField(testMetadata.FIELD + "_CURRENT_YEAR_COMPOSITE_SCORE");
      var growthTargetScore = row.getField(testMetadata.FIELD + "_TARGET_SCORE");
      var growthMetTargetScore = row.getField(testMetadata.FIELD + "_MET_TARGET_SCORE");
      var testGrade = getGrade(row);

      if ((growthScore === null || growthScore === undefined || _util.trim(growthScore) === "") && (growthMetTargetScore === null || growthMetTargetScore === undefined || _util.trim(growthMetTargetScore) === "") && (growthTargetScore === null || growthTargetScore === undefined || _util.trim(growthTargetScore) === "")) {
            // Do not map record is no score is found.
            return null;
      }


      score.TEST_NUMBER = testNumber;

      score.TEST_GRADE_EQUIVALENT = testGrade;


       if (growthScore  && !isNaN(growthScore)) {
       score.TEST_SCALED_SCORE = growthScore;
       score.TEST_SCORE_TEXT =   growthScore;
       score.TEST_SCORE_VALUE =  growthScore;
       }
       if (growthTargetScore  && !isNaN(growthTargetScore)) {
        score.TEST_GROWTH_TARGET_1 = growthTargetScore;
        }
       if (growthMetTargetScore) {
       score.TEST_GROWTH_RESULT = growthMetDecode[growthMetTargetScore];
       }
    }
    catch(e){
    print(e + "\n");
    }
      return score;
    }

    function mapStudentPerformance(row, testMetadata, signature) {
     var score = {};
     var signature = signature.getFormat().getFormatName();
     if(signature === "ACCESS2_ALT_COL209"){
     var grade = getGrade(row);
     var testNumber = "ALT_ACC2" + grade + testMetadata.CODE;
     var StudentSubPerf = row.getField("STUDENT_PERFORMANCE_" + testMetadata.FIELD);
     var cluster = row.getField("CLUSTER_" + testMetadata.FIELD);

    if(StudentSubPerf === null || StudentSubPerf === undefined || _util.trim(StudentSubPerf) === "--" || _util.trim(StudentSubPerf) === "") {
        return null;
    }
    // Set score fields
    score["TEST_NUMBER"] = testNumber;
    score["TEST_SECONDARY_RESULT_CODE"] = StudentSubPerf;

    return score;
    }
    }

    function mapClusterFields(row, testMetadata, signature) {
      var score = {};
      var signature = signature.getFormat().getFormatName();
      if(signature === "ACCESS2_ALT_COL209"){
      var grade = getGrade(row);
      var testNumber = "ALT_ACC2" + grade + testMetadata.CODE;
      var cluster = row.getField("CLUSTER_" + testMetadata.FIELD);

     if(cluster === null || cluster === undefined || _util.trim(cluster) === "--" || _util.trim(cluster) === "") {
         return null;
     }
     // Set score fields
     score["TEST_NUMBER"] = testNumber;
     score["TEST_CUSTOM_RESULT_CODE"] = cluster;

     return score;
     }
     }



    /***************************************************************************
     Utility Functions
     ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {

            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
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
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        // Parse the test completion date
        var rawTestDate = srcRecord.getField("TEST_COMPLETION_DATE");
        var testDateObject = null;
        if (rawTestDate) {
            testDateObject = parseDate(rawTestDate, signature);
        }

        // Concatenate the test completion date to the key if the signature format matches
        if (signature.getFormat().getFormatName() === 'ACCESS2_PSUI_SUMM_21_22' && testDateObject) {
            assessmentAdminKey = assessmentAdminKey + "_" + testDateObject.STANDARD_DATE;
        }

        return assessmentAdminKey;

    }


    function getTestNumber(grade, tier, suffix, row) {
        let testNumber = '';
        if (row.getRawField("LINEAGE_FILE").toString().indexOf("Alternate") > -1) {
            if (grade === "KG" || null == tier) {
                //Ignore Tier
                testNumber = "ALT_ACC2" + grade + suffix;
            } else {
                testNumber = "ALT_ACC2" + grade + tier + suffix;
            }
        }
        else if (grade === "KG" || null == tier) {
            //Ignore Tier
            testNumber = "ACC2" + grade + suffix;
        }
        else {
            testNumber = "ACC2" + grade + tier + suffix;
        }
        return testNumber;
    }


function parseDate(rawDate, signature) {

        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        }, formatter;;

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if (signature.getFormat().getFormatName() === 'ACCESS_17-18_18-19' ||
        signature.getFormat().getFormatName() === 'ACCESS_19-20_20-21') {
            if (rawDate.indexOf('/') !== -1) {
                  formatter = new java.text.SimpleDateFormat('dd/MM/yyyy');
              } else if (rawDate.indexOf('-') !== -1) {
                  formatter = new java.text.SimpleDateFormat('dd-MM-yyyy');
             }  else if (rawDate.length === 5) {
                   return dateObj;
             } else if (rawDate.length > 6) {
                   formatter = new java.text.SimpleDateFormat("ddMMyyyy");
             } else {
                   formatter = new java.text.SimpleDateFormat("ddMMyy");
             }
        } else {
            if (rawDate.indexOf('/') !== -1) {
                 formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
             } else if (rawDate.indexOf('-') !== -1) {
                  if (rawDate.length === 10) {
                    formatter = new java.text.SimpleDateFormat('yyyy-MM-dd');
             }
             }else if (rawDate.indexOf('-') !== -1) {
                 formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
             }else if (rawDate.length > 6) {
                 formatter = new java.text.SimpleDateFormat("MMddyyyy");
             } else {
                 if (signature.getFormat().getFormatName() === "ACCESS 2.0_33_1_COLS") {
                   formatter = new java.text.SimpleDateFormat("yyyyMM");
                }
                else{
                   formatter = new java.text.SimpleDateFormat("MMddyy");
             }
           }
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
