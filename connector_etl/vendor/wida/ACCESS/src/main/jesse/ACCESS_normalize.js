var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "WIDA_ACCESS";
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
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
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
            , { TEST: "ACC", CODE: "TOT", FIELD: "COMPOSITE", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "SP", FIELD: "SPEAKING", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "OVR", FIELD: "OVERALL", MAP_FUNCTION: mapScore }
            , { TEST: "ACC", CODE: "COMPSI", FIELD: "PAPER_COMPREHENSION_SOCIAL_AND_INSTRUCTIONAL_LANGUAGE_RAW_SCORE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "COMPEL", FIELD: "PAPER_COMPREHENSION_LANGUAGE_OF_ENGLISH_LANGUAGE_RAW_SCORE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "COMPMA", FIELD: "PAPER_COMPREHENSION_LANGUAGE_OF_MATH_RAW_SCORE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "COMPSC", FIELD: "PAPER_COMPREHENSION_LANGUAGE_OF_SCIENCE_RAW_SCORE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "COMPSS", FIELD: "PAPER_COMPREHENSION_LANGUAGE_OF_SOCIAL_STUDIES_RAW_SCORE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "SPSI", FIELD: "PAPER_SPEAKING_SOCIAL_AND_INSTRUCTIONAL_LANGUAGE_STANDARD_RAW_SCORE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "SPLA", FIELD: "PAPER_SPEAKING_LANGUAGE_OF_ENGLISH_LANGUAGE_AND_LANGUAGE_OF_SOCIAL_STUDIES_STANDARD_RAW_SCORE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "SPMASC", FIELD: "PAPER_SPEAKING_LANGUAGE_OF_MATHEMATICS_AND_LANGUAGE_OF_SCIENCE_STANDARD_RAW_SCORE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "WRSI", FIELD: "PAPER_WRITING_SOCIAL_INSTRUCTIONAL_SCORES", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "WRLA", FIELD: "PAPER_WRITING_LANGUAGE_ARTS_SCORES", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "WRMS", FIELD: "PAPER_WRITING_MATH_SCIENCE_SCORES", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACC", CODE: "WRLASS", FIELD: "PAPER_WRITING_LANGUAGE_ARTS_SOCIAL_STUDIES_SCORES", MAP_FUNCTION: mapRawScore }
        ];



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
            else if (profLevel === "NA" || profLevel === " NA") {
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
        var gradeValue = row.getField('GRADE');

        if (gradeValue === undefined || gradeValue === null) {
            gradeValue = "";
        } else if (gradeValue === "0" || gradeValue === "00") {
            gradeValue = "KG";
        } else if (gradeValue === "K") {
            gradeValue = "KG";
        } else if (gradeValue !=="K" && gradeValue.length === 1) {
             gradeValue = "0" + gradeValue;
        }

        return gradeValue;
    }

    function getTEST_INTERVENTION_DESC(row) {
        var accomodationString = "";

        if (row.getField('ACCOMMANUAL_MC') === "Y") {
            accomodationString = accomodationString + "MC - ACCOMMODATION, ";
        }
        if (row.getField('REPEATITEMAUDIO_RA') === "Y") {
            accomodationString = accomodationString + "RA - ACCOMMODATION, ";
        }
        if (row.getField('EXTENDEDSPEAKINGTIME_ES') === "Y") {
            accomodationString = accomodationString + "ES - ACCOMMODATION, ";
        }
        if (row.getField('ACCOMLARGEPRINT_LP') === "Y") {
            accomodationString = accomodationString + "LP - ACCOMMODATION, ";
        }
        if (row.getField('ACCOMBRAILLE_BR') === "Y") {
            accomodationString = accomodationString + "BR - ACCOMMODATION, ";
        }
        if (row.getField('INTERPRETERSIGNSTESTDIRECTIONS_SD') === "Y") {
            accomodationString = accomodationString + "SD - ACCOMMODATION, ";
        }
        if (row.getField('REPEATITEM_RI') === "Y") {
            accomodationString = accomodationString + "RI - ACCOMMODATION, ";
        }
        if (row.getField('SCRIBEDRESPONSE_SR') === "Y") {
            accomodationString = accomodationString + "SR - ACCOMMODATION, ";
        }
        if (row.getField('READALOUDRESPONSE_LH') === "Y") {
            accomodationString = accomodationString + "LH - ACCOMMODATION, ";
        }
        if (row.getField('REPEATRESPONSE_RL') === "Y") {
            accomodationString = accomodationString + "RL - ACCOMMODATION, ";
        }
        if (row.getField('READALOUDITEM_IH') === "Y") {
            accomodationString = accomodationString + "IH - ACCOMMODATION, ";
        }

        if (accomodationString === "") {
            return "NONE";
        } else {
            return accomodationString.substring(0, 200);
        }

    }

    function getRace(row) {
        var race = "";
        if (row.getField('RACEAMERICANINDIANALASKANATIVE') === 'Y') {
            race = "AIAN";
        }
        else if (row.getField('RACEASIAN') === 'Y') {
            race = "ASIA";
        }
        else if (row.getField('RACEBLACK') === 'Y') {
            race = "B/AA";
        }
        else if (row.getField('RACEPACIFICISLANDER') === 'Y') {
            race = "PI/H";
        }
        else if (row.getField('RACEWHITE') === 'Y') {
            race = "WHIT";
        }

        if (row.getField('ETHNICITYHISPANICLATINO') === 'Y') {
            race = race.substring(0, 2) + "HL";
        }
        return race;
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
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var format = signature.getFormat().getFormatName();

        var birthDateObject = parseDate(row.getField('BIRTH_DATE') , signature);
        var testDateObject = parseDate(row.getField("DATE_OF_TESTING") , signature);
        if (format === "ACCESS_K_2_9_12" || format === "ACCESS_3_8" || testDateObject.STANDARD_DATE === null) {
            testDateObject = parseDate("05012015" , signature);
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
                //case "TEST_REPORTING_DATE":
                //    record.TEST_REPORTING_DATE = '05/01/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
                //    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOLCODE"),
                        row.getField("SCHOOL_NUMBER"),
                        'DISTRICT' // As there is no school information in the data file
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOLCODE"),
                        row.getField("SCHOOL_NUMBER"),
                        'DISTRICT' // As there is no school information in the data file
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOLNAME"),
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
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = getGrade(row);
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = getGrade(row);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICTSTUDENTID"), row.getField("DISTRICT_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATESTUDENTID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("DISTRICTSTUDENTID"), row.getField("DISTRICT_STUDENT_ID"), row.getField("STATESTUDENTID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRSTNAME"), row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("MIDDLEINITIAL"), row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LASTNAME"), row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0, 1);
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
        admin.TEST_ASSESSMENT_TYPE = row.getField("WIDAFORMNUMBER");
        admin.STUDENT_RACE_CODE = getRace(row);
        admin.STUDENT_MIGRANT_ED_IND = row.getField("MIGRANT");

        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScore(row, testMetadata) {

        var score = {};
        var grade = getGrade(row);
        var tier = row.getField("PAPER_TIER");
        if (tier === undefined || _util.trim(tier) === "") {
            // Do not map record is no score is found.
            tier = null;
        }
        var testNumber = getTestNumber(grade, tier, testMetadata.CODE,testMetadata.FIELD, row);
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "_SCALE_SCORE"),row.getField("SCALE_SCORE_-_" + testMetadata.FIELD));
        var proficiencyLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_PROFICIENCY_LEVEL"), row.getField("PROFICIENCY_LEVEL_-_" + testMetadata.FIELD));
        var lowerBound = _util.coalesce(row.getField(testMetadata.FIELD + "_CONFIDENCE_-_LOW_SCORE"), row.getField("CONFIDENCE_LOW_SCORE_-_" + testMetadata.FIELD));
        var upperBound = _util.coalesce(row.getField(testMetadata.FIELD + "_CONFIDENCE_-_HIGH_SCORE"), row.getField("CONFIDENCE_HIGH_SCORE_-_" + testMetadata.FIELD));

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "") {
            // Do not map record is no score is found.
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_LOWER_BOUND"] = lowerBound;
            score["TEST_UPPER_BOUND"] = upperBound;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = proficiencyLevel;
        score["TEST_PRIMARY_RESULT"] = decodeProficiencyLevel(proficiencyLevel);

        return score;
    }
    function mapRawScore(row, testMetadata, signature) {

        var score = {};
        var grade = getGrade(row);
        var tier = row.getField("PAPER_TIER");
        var sigName= signature.getFormat().getFormatName();

        if(sigName === "psui_wida_alt_21_22" || sigName === "psui_wida_summ_21_22") {
            return null;
        }

        if (tier === undefined || _util.trim(tier) === "") {
            // Do not map record is no score is found.
            tier = null;
        }
        var testNumber = getTestNumber(grade, tier, testMetadata.CODE,testMetadata.FIELD, row);
        var rawScore = row.getField(testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "") {
            // Do not map record is no score is found.
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = rawScore;
        if (!isNaN(rawScore)) {
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
        }
        if (rawScore === "X") {
            score["TEST_PRIMARY_RESULT_CODE"] = "0";
            score["TEST_PRIMARY_RESULT"] = rawScore;
        }

        return score;
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


        return assessmentAdminKey;

    }


    function getTestNumber(grade, tier, suffix,field, row) {
        let testNumber = '';
        var prLevel = _util.coalesce(row.getField(field + "_PROFICIENCY_LEVEL"), row.getField("PROFICIENCY_LEVEL_-_" + field));
        if (row.getRawField("LINEAGE_FILE").toString().indexOf("Alternate") > -1 ) {
            if (grade === "KG" || null == tier) {
                //Ignore Tier
                testNumber = "ALTACC" + grade + suffix;
            } else {
                testNumber = "ALTACC" + grade + tier + suffix;
            }
        }
        else if (grade === "KG" || null == tier) {
            //Ignore Tier
            testNumber = "ACC" + grade + suffix;
            if (prLevel==="A1" ||  prLevel==="A2" ||  prLevel==="A3" ||  prLevel==="P1" ||  prLevel==="P2" || prLevel==="P3"){
                testNumber = "ALT" + testNumber;
            }
        } else {
            testNumber = "ACC" + grade + tier + suffix;
            if (prLevel==="A1" ||  prLevel==="A2" ||  prLevel==="A3" ||  prLevel==="P1" ||  prLevel==="P2" || prLevel==="P3"){
                testNumber = "ALT" + testNumber;
            }
        }
        return testNumber;
    }


    function parseDate(rawDate , signature ) {

        let dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        }, formatter;

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if (rawDate.indexOf('/') !== -1) {
            formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
        } else if (rawDate.indexOf('-') !== -1) {
            formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
        }else if (rawDate.length > 6) {
            formatter = new java.text.SimpleDateFormat("MMddyyyy");
        } else {
            if (signature.getFormat().getFormatName() === "ACCESS_2122") {
               formatter = new java.text.SimpleDateFormat("yyyyMM");
            }
            else {
               formatter = new java.text.SimpleDateFormat("MMddyy");
            }
        }

        let javaDate = formatter.parse(rawDate);

        let calendar = java.util.Calendar.getInstance();
        calendar.setTime(javaDate);

        let year = calendar.get(java.util.Calendar.YEAR);
        let month = AppUtil.formatNumber(calendar.get(java.util.Calendar.MONTH) + 1);
        let day = AppUtil.formatNumber(calendar.get(java.util.Calendar.DAY_OF_MONTH));
        let standardDate = month + "/" + day + "/" + year;
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
