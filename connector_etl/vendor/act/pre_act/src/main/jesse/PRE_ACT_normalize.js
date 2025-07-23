var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "PRE-ACT";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *`
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {
            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}\n");
            var normalizedFile = AppUtil.createResultsFile(file);
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
                    if (mappingObject.SCORE_MAPPINGS.length == 0) {
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
            { TEST: "ACTPRE", CODE: "TOT", FIELD: "COMPOSITE", MAP_FUNCTION: mapScaledScore }
            , { TEST: "ACTPRE", CODE: "TOT", FIELD: "COMPOSITE", MAP_FUNCTION: mapScaledScoreV2 }

            , { TEST: "ACTPRE", CODE: "TOT_EST", FIELD: "COMPOSITE", MAP_FUNCTION: mapEstimateScore }

            , { TEST: "ACTPRE", CODE: "EN", FIELD: "ENGLISH", MAP_FUNCTION: mapScaledScore }
            , { TEST: "ACTPRE", CODE: "V2_EN", FIELD: "ENGLISH", MAP_FUNCTION: mapScaledScoreV2 }
            , { TEST: "ACTPRE", CODE: "RW_EN", FIELD: "ENGLISH", MAP_FUNCTION: mapRawScore }


            , { TEST: "ACTPRE", CODE: "EN_EST", FIELD: "ENGLISH", MAP_FUNCTION: mapEstimateScore }

            , { TEST: "ACTPRE", CODE: "MA", FIELD: "MATH", MAP_FUNCTION: mapScaledScore }
            , { TEST: "ACTPRE", CODE: "V2_MA", FIELD: "MATH", MAP_FUNCTION: mapScaledScoreV2 }
            , { TEST: "ACTPRE", CODE: "RW_MA", FIELD: "MATH", MAP_FUNCTION: mapRawScore }

            , { TEST: "ACTPRE", CODE: "MA_EST", FIELD: "MATH", MAP_FUNCTION: mapEstimateScore }

            , { TEST: "ACTPRE", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapScaledScore }
            , { TEST: "ACTPRE", CODE: "V2_RD", FIELD: "READING", MAP_FUNCTION: mapScaledScoreV2 }
            , { TEST: "ACTPRE", CODE: "RW_RD", FIELD: "READING", MAP_FUNCTION: mapRawScore }

            , { TEST: "ACTPRE", CODE: "RD_EST", FIELD: "READING", MAP_FUNCTION: mapEstimateScore }

            , { TEST: "ACTPRE", CODE: "SC", FIELD: "SCIENCE", MAP_FUNCTION: mapScaledScore }
            , { TEST: "ACTPRE", CODE: "V2_SC", FIELD: "SCIENCE", MAP_FUNCTION: mapScaledScoreV2 }
            , { TEST: "ACTPRE", CODE: "RW_SC", FIELD: "SCIENCE", MAP_FUNCTION: mapRawScore }

            , { TEST: "ACTPRE", CODE: "SC_EST", FIELD: "SCIENCE", MAP_FUNCTION: mapEstimateScore }

            , { TEST: "ACTPRE", CODE: "STEM", FIELD: "STEM", MAP_FUNCTION: mapScaledScore }
            , { TEST: "ACTPRE", CODE: "STEM", FIELD: "STEM", MAP_FUNCTION: mapScaledScoreV2 }

            , { TEST: "ACTPRE", CODE: "STEM_EST", FIELD: "STEM", MAP_FUNCTION: mapEstimateScore }
            //--------------------------------------------------------------------------------------------------------
            , { TEST: "ACTPRE", CODE: "EN_POW", FIELD: "ENGLISH_PRODUCTION_OF_WRITING", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "EN_KOL", FIELD: "ENGLISH_KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "EN_CSE", FIELD: "ENGLISH_CONVENTIONS_OF_STANDARD_ENGLISH", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "MA_PHM", FIELD: "MATH_PREP_HIGHER_MATH", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "MA_NQ", FIELD: "MATH_NUMBER_AND_QUANTITY", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "MA_ALG", FIELD: "MATH_ALGEBRA", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "MA_FUNC", FIELD: "MATH_FUNCTIONS", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "MA_GEO", FIELD: "MATH_GEOMETRY", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "MA_STATPRO", FIELD: "MATH_STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "MA_IES", FIELD: "MATH_INTEGRATING_ESSENTIAL_SKILLS", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "MA_MODEL", FIELD: "MATH_MODELING", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "RD_KID", FIELD: "READING_KEY_IDEAS_DETAILS", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "RD_CAS", FIELD: "READING_CRAFT_AND_STRUCTURE", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "RD_IKI", FIELD: "READING_INTEGRATION_OF_KNOWLEDGE_AND_IDEAS", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "SC_ID", FIELD: "SCIENCE_INTERPRETATION_OF_DATA", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "SC_SI", FIELD: "SCIENCE_SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapRawScore }
            , { TEST: "ACTPRE", CODE: "SC_EMIER", FIELD: "SCIENCE_EVAL_OF_MODELS_INFERENCES_EXP_RESULTS", MAP_FUNCTION: mapRawScore }

            , { TEST: "ACTPRE", CODE: "PREDPREACT_RD", FIELD: "READING", MAP_FUNCTION: mapPredicateScore }
            , { TEST: "ACTPRE", CODE: "PREDPREACT_EN", FIELD: "ENGLISH", MAP_FUNCTION: mapPredicateScore }
            , { TEST: "ACTPRE", CODE: "PREDPREACT_MA", FIELD: "MATH", MAP_FUNCTION: mapPredicateScore }
            , { TEST: "ACTPRE", CODE: "PREDPREACT_SC", FIELD: "SCIENCE", MAP_FUNCTION: mapPredicateScore }
            , { TEST: "ACTPRE", CODE: "PREDPREACT_TOT", FIELD: "COMPOSITE", MAP_FUNCTION: mapPredicateScore }
            , { TEST: "ACTPRE", CODE: "PREDPREACT_STEM", FIELD: "STEM", MAP_FUNCTION: mapPredicateScore }


        ];


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var accommodationDecodes = {
        "0": "Reserved for future use"
        , "1": "Extended time/standard materials"
        , "2": "Large-print test/standard time"
        , "3": "Large-print test/extended time"
        , "4": "Audio DVD test/extended time"
        , "5": "Reader script/extended time"
        , "6": "Braille test/extended time"
        , "7": "Scribe/standard time"
        , "8": "Scribe/extended time"
        , "9": "Assistive communication device/extended time"
        , "": null
    };

    var understandingComplexTextDecode = {
        "0" :  {CODE: "0", DESC: "Below"}
        ,"1" : {CODE: "1", DESC: "Proficient"}
        ,"2" : {CODE: "2", DESC: "Above proficiency"}
        ,"-" : {CODE: "-", DESC: "Unable to calculate"}
        ,"Below" : {CODE: "0", DESC: "Below"}
        ,"Proficient" : {CODE: "1", DESC: "Proficient"}
        ,"Above proficiency" : {CODE: "2", DESC: "Above proficiency"}
        ,"Unable to calculate" : {CODE: "-", DESC: "Unable to calculate"}
        ,"" : {CODE: null, DESC: null}
        ,null : {CODE: null, DESC: null}
    };
    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "8": "08",
        "08": "08",
        "8th": "08",
        "Grade 8": "08",
        "9": "09",
        "09": "09",
        "9th": "09",
        "Grade 9": "09",
        "10": "10",
        "Grade 10": "10",
        "10th": "10",
        "10th Grade": "10",
        "11": "11",
        "11th": "11",
        "Grade 11": "11",
        "12": "12",
        "Grade 12": "12",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG",
        "0": "KG",
        "Other":"15"
       ,"" : null
       ,null : null

    };

    var months = {
        "JAN": "01",
        "FEB": "02",
        "MAR":  "03",
        "APR":  "04",
        "MAY":  "05",
        "JUN":  "06",
        "JUL":  "07",
        "AUG":  "08",
        "SEP":  "09",
        "OCT":  "10",
        "NOV":  "11",
        "DEC":  "12"
    };

    /***********************************************************************************
        Assessment-specific decode functions
    ***********************************************************************************/
    function decodeAccommodations(value) {

        if (value !== undefined || value !== null) {
            var decode = accommodationDecodes[value];

            if (decode !== undefined || decode !== null) {
                return decode;
            }
        }

        return null;

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
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);


        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
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

      //  var birthDateObject = module.mapDateObject(hierarchy, row, row.getField("STUDENT_BIRTHDATE_STR"));
        var birthDateStr = _util.coalesce(row.getField("STUDENT_BIRTHDATE_STR"), "");
                 if(birthDateStr.indexOf("/")>-1){
                     var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yyyy");
                 }else if(birthDateStr.indexOf("-")>-1){
                     var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM-dd-yyyy");
                 }else{
                     var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "yyyyMMdd");
                 }

        const testDateObject = module.mapDateObject(hierarchy, row, _util.coalesce(row.getField("TEST_DATE"), hierarchy.SCHOOL_YEAR.substring(5, 9) + '0515'));

        var studentGenderCode = null;
        var genderCode = row.getField("GENDER");
        if (genderCode != null){
        studentGenderCode = _util.trim(row.getField("GENDER") + "-").substring(0, 1);
        }

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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "PARTICIPATION_YEAR":
                    record.PARTICIPATION_YEAR = hierarchy.SCHOOL_YEAR;
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
                    record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ATTENDED_SITE_CODE"),
                        row.getField("HSCODE"),
                        row.getField("SCHOOL_ATTEND_CODE")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_ATTEND_CODE"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_ATTEND_CODE"));
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
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("LOCAL_ID_NUMBER")
                        , row.getField("STUDENT_ID_NUMBER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STUDENT_ID_NUMBER")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STUDENT_ID_NUMBER")
                    );
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.coalesce(row.getField("MAILING_ADDRESS"), row.getField("ADDRESS1"));
                    break;
                case "STUDENT_CITY":
                    record.STUDENT_CITY = _util.coalesce(row.getField("CITY"));
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STATE"));
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = _util.coalesce(row.getField("ZIP"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = studentGenderCode;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("REPORTING_GRADE"))];
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = gradeDecode[_util.coalesce(row.getField("REPORTING_GRADE"))];
                    break;
                case "TEST_LOCATION":
                    record.TEST_LOCATION = _util.coalesce(row.getField("TEST_LOCATION"));
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
        admin["TEST_INTERVENTION_CODE"] = row.getField("ACCOMMODATION");
        admin["TEST_INTERVENTION_DESC"] = decodeAccommodations(row.getField("ACCOMMODATION"));

        //Indicator Fields
        if (row.getField('SE') === "Y") {
            admin["STUDENT_SPECIAL_ED_IND"] = row.getField('SE');
        }
        if (row.getField('LEP') === "Y") {
            admin["STUDENT_LEP_CODE"] = row.getField('LEP');
        }
        if (row.getField('FL') === "Y") {
            admin["STUDENT_FOODSERVICE_IND"] = row.getField('FL');
        }
        if (row.getField('ME') === "Y") {
            admin["STUDENT_MIGRANT_ED_IND"] = row.getField('ME');
        }
        if (row.getField('M') === "Y" || row.getField('R') === "Y") {
            admin["TITLE1_TARGET_ASSIST_IND"] = "Y";
        }
        return admin;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function mapScaledScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "_SCALED_SCORE"),row.getField(testMetadata.FIELD + "_SCORE"));
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");
        var nationNormScore = row.getField(testMetadata.FIELD + "_NATIONAL_NORM");
        var preLowerBound = row.getField("PREACT_" + testMetadata.FIELD + "_LOW");
        var preUpperBound = row.getField("PREACT_" + testMetadata.FIELD + "_HIGH");
        var predicateLowerBound = row.getField("PRED_ACT_" + testMetadata.FIELD + "_LOW");
        var predicateUpperBound = row.getField("PRED_ACT_" + testMetadata.FIELD + "_HIGH");

        var textComplexCode = understandingComplexTextDecode[row.getField("UNDERSTANDING_COMPLEX_TEXT_CODE")].CODE;
        var textComplexDesc = understandingComplexTextDecode[row.getField("UNDERSTANDING_COMPLEX_TEXT_CODE")].DESC;

        var performanceLevelDecode = null;
        var performanceLevel = null;
        var testPass = null;

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "**") {
            return null;
        }
        if (testNumber.indexOf("EN") > -1) {
            if (scaleScore >= 0 && scaleScore <= 17) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
                testPass = "No";
            }
            else if (scaleScore >= 18 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
                testPass = "Yes";
            }
        }

        if (testNumber.indexOf("MA") > -1) {
            if (scaleScore >= 0 && scaleScore <= 21) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
                testPass = "No";
            }
            else if (scaleScore >= 22 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
                testPass = "Yes";
            }
        }
        if (testNumber.indexOf("RD") > -1) {
            if (scaleScore >= 0 && scaleScore <= 21) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
                testPass = "No";
            }
            else if (scaleScore >= 22 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
                testPass = "Yes";
            }
        }

        if (testNumber.indexOf("SC") > -1) {
            if (scaleScore >= 0 && scaleScore <= 22) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
                testPass = "No";
            }
            else if (scaleScore >= 23 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
                testPass = "Yes";
            }
        }

        if (testNumber.indexOf("STEM") > -1) {
            if (scaleScore >= 0 && scaleScore <= 25) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
                testPass = "No";
            }
            else if (scaleScore >= 26 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
                testPass = "Yes";
            }
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if (scaleScore != "--" && scaleScore != "**") {
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_LOWER_BOUND"] = preLowerBound;
            score["TEST_UPPER_BOUND"] = preUpperBound;
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = predicateLowerBound + "-" + predicateUpperBound;
            if (nationNormScore !== "" && nationNormScore !== undefined && nationNormScore !== "---") {
                score["TEST_PERCENTILE_SCORE"] = nationNormScore;
            }
        }

        score["TEST_SECONDARY_RESULT_CODE"] = textComplexCode;
        score["TEST_SECONDARY_RESULT"] = textComplexDesc;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelDecode;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PASSED_INDICATOR"] = testPass
        return score;
    }

    function mapScaledScoreV2(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD);
        var performanceLevelDecode = null;
        var performanceLevel = null;

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        if (testNumber.indexOf("EN") > -1) {
            if (scaleScore >= 0 && scaleScore <= 17) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
            }
            else if (scaleScore >= 18 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
            }
        }

        if (testNumber.indexOf("MA") > -1) {
            if (scaleScore >= 0 && scaleScore <= 21) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
            }
            else if (scaleScore >= 22 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
            }
        }
        if (testNumber.indexOf("RD") > -1) {
            if (scaleScore >= 0 && scaleScore <= 21) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
            }
            else if (scaleScore >= 22 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
            }
        }

        if (testNumber.indexOf("SC") > -1) {
            if (scaleScore >= 0 && scaleScore <= 22) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
            }
            else if (scaleScore >= 23 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
            }
        }

        if (testNumber.indexOf("STEM") > -1) {
            if (scaleScore >= 0 && scaleScore <= 25) {
                performanceLevelDecode = "NCR";
                performanceLevel = "Not College Ready";
            }
            else if (scaleScore >= 26 && scaleScore <= 999) {
                performanceLevelDecode = "CR";
                performanceLevel = "College Ready";
            }
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if (scaleScore != "--" && scaleScore != "**") {
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelDecode;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;

        return score;
    }

    function mapRawScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");


        // Check for key fields and do not map score and exit if conditions met.
        // Set score fields
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" && _util.trim(rawScore) !== "**") {
            rawScore = row.getField('POINTS_EARNED_' + testMetadata.FIELD);
        }

        if (rawScore !== null && rawScore !== undefined && _util.trim(rawScore) !== "--" && _util.trim(rawScore) !== "" && _util.trim(rawScore) !== "**") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
            return score;
        }

        return null;
    }

    function mapEstimateScore(row, testMetadata) {
        var score = {};

        var low,high;
        var predictedScore = row.getField("PREDICTED_ACT_" + testMetadata.FIELD + "_SCORE");
        if (predictedScore){

        if(predictedScore.indexOf("-")>-1) {
            var low = parseInt(predictedScore.split("-")[0]);
            var high = predictedScore.split("-")[1];
        }
        if(isNaN(high)){
            high = high.toUpperCase();
            high = parseInt(months[high]);

            if(low>high){
                high = high+ low;
                low = high -low;
                high = high - low;
            }
        }
        }


        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
        var nationNormScore = row.getField(testMetadata.FIELD + "_NATIONAL_NORM");
        var estLowerBound = _util.coalesce (low,row.getField("EST._ACT_" + testMetadata.FIELD + "_LOW"));
        var estUpperBound = _util.coalesce (high,row.getField("EST._ACT_" + testMetadata.FIELD + "_HIGH"));

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "--") {
            return null;
        }


        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if (scaleScore != "--" && scaleScore != "**") {
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_LOWER_BOUND"] = estLowerBound;
            score["TEST_UPPER_BOUND"] = estUpperBound;
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = estLowerBound + "-" + estUpperBound;
            if (nationNormScore !== "" && nationNormScore !== undefined && nationNormScore !== "---") {
                score["TEST_PERCENTILE_SCORE"] = nationNormScore;
            }
        }
        return score;
    }
     function mapPredicateScore(row, testMetadata) {
         var score = {};
         var testNumber = generateTestNumber(row, testMetadata);

         var predicateUpperBound = row.getField("PRED_PREACT_" + testMetadata.FIELD + "_HIGH");
         var predicateLowerBound = row.getField("PRED_PREACT_" + testMetadata.FIELD + "_LOW");


        if((predicateUpperBound === null || predicateUpperBound === undefined || _util.trim(predicateUpperBound) === "--" || _util.trim(predicateUpperBound) === "" || _util.trim(predicateUpperBound) === "**") &&
           (predicateLowerBound === null || predicateLowerBound === undefined || _util.trim(predicateLowerBound) === "--" || _util.trim(predicateLowerBound) === "" || _util.trim(predicateLowerBound) === "**"))
           {
              return null;
           }

    	// Set score fields
    	 score["TEST_NUMBER"] = testNumber;
    	 score["TEST_LOWER_BOUND"] = predicateLowerBound;
         score["TEST_UPPER_BOUND"] = predicateUpperBound;
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

        const testDateObject = module.mapDateObject(hierarchy, srcRecord, _util.coalesce(srcRecord.getField("TEST_DATE"), hierarchy.SCHOOL_YEAR.substring(5, 9) + '0515')).STANDARD_DATE;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        assessmentAdminKey = assessmentAdminKey + "_" + testDateObject;

        return assessmentAdminKey;

    }


    function generateTestNumber(row, testMetadata) {

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

        return testNumber;

    }

    /**
     * Attempt to parse date strings into our standard date object, writes reject if failures
     * Supported date formats
     * - yyyyMMdd
     * - dd-MMM
     *
     * @param hierarchy
     * @param row
     * @param dateStr - date string we want to parse
     * @returns {RAW_DATE, MONTH, DAY, YEAR, STANDARD_DATE} - last 4 properties will be null if this fails
     */
    module.mapDateObject = function (hierarchy, row, dateStr) {

        //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyyMMdd format or dd-MMM format.  Attempt to map both.
        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyyMMdd");
        } catch (exception) {
            // Error will be reported in final check.
        }
               
        if (testDateObject === null) {
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "MMMM yyyy");
            } catch (exception) {
                // Error will be reported in final check.
            }
        }

        if (testDateObject === null) {
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd-MMM");
                /**
                 * Set the school year depending on what month was detected
                 * - If before July (2nd half of school year) use the second year in school year folder name
                 * - Otherwise (first half of school year) use the first year in school year folder name
                 */
                if (testDateObject && testDateObject.MONTH) {
                    if (testDateObject.MONTH < 7) {
                        testDateObject.YEAR = hierarchy.SCHOOL_YEAR.substring(5, 9);
                    } else {
                        testDateObject.YEAR = hierarchy.SCHOOL_YEAR.substring(0, 4);
                    }
                    testDateObject.STANDARD_DATE = `${testDateObject.MONTH}/${testDateObject.DAY}/${testDateObject.YEAR}`;
                }
            } catch (exception) {
                // Error will be reported in final check.
                testDateObject = null;
            }
        }
        // Set default empty objects if mappings fail and report error.
        if (testDateObject === null) {
            testDateObject = AppUtil.getEmptyDateObj(dateStr);
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing date string: ${dateStr}", JSON.stringify(row.getSourceRow())));
        }

        return testDateObject;
    }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());