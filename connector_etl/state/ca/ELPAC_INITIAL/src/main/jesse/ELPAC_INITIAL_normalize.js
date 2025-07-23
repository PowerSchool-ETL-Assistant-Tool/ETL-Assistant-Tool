var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ELPAC_INITIAL";
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
            print(`Loading using signature file ${signatureFormatName}\n`);


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
                    if (mappingObject.SCORE_MAPPINGS.length === 0 && row.INCLUDE_INDICATOR === "N") {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "LOW", row.LINEAGE_LINE, "Include indicator is No.", JSON.stringify(row)));
                    }
                    else if (mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG);

            return normalizedFile;

        } catch (exception) {
            throw `${_thisModuleName}.createNormalizedFile Exception: ${exception}`;
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
            // Initial ELPAC Scores to Process
            { TEST: "ELPAC", CODE: "OVR", FIELD: "", MAP_FUNCTION: mapCompositeScore }
            , { TEST: "ELPAC", CODE: "ORAL", FIELD: "ORAL_LANGUAGE", MAP_FUNCTION: mapTotalScore }
            , { TEST: "ELPAC", CODE: "WL", FIELD: "WRITTEN_LANGUAGE", MAP_FUNCTION: mapTotalScore }
            , { TEST: "ELPAC", CODE: "LIS", FIELD: "LISTENING", MAP_FUNCTION: mapSubScore }
            , { TEST: "ELPAC", CODE: "SPE", FIELD: "SPEAKING", MAP_FUNCTION: mapSubScore }
            , { TEST: "ELPAC", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapSubScore }
            , { TEST: "ELPAC", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapSubScore }
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KN": "KG"
        , "KG": "KG"
        , "TK": "TK"
        , "01": "01"
        , "1": "01"
        , "02": "02"
        , "2": "02"
        , "03": "03"
        , "3": "03"
        , "04": "04"
        , "4": "04"
        , "05": "05"
        , "5": "05"
        , "06": "06"
        , "6": "06"
        , "07": "07"
        , "7": "07"
        , "08": "08"
        , "8": "08"
        , "09": "09"
        , "9": "09"
        , "10": "10"
        , "11": "11"
        , "12": "12"
        , "UE": null //ungraded elementary
        , "US": null //ungraded secondary
        , "UG": null //ungraded
    };


    var decodePerformanceLevel = {
        "1": "Level 1"
        , "2": "Level 2"
        , "3": "Level 3"
        , "4": "Level 4"
        , null: null
    };

    var decodePerformanceLevelStrand = {
        "3": "Well Developed"
        , "2": "Somewhat/Moderately"
        , "1": "Beginning"
        , "Well Developed": "4"
        , "Well developed": "4"
        , "Somewhat to moderately developed": "3"
        , "Minimally developed": "2"
        , "Beginning to develop": "1"
        , "Initial Fluent English Proficient (IFEP)": "IFEP"
        , "Novice English Learner": "NEL"
        , "Intermediate English Learner": "IEL"
        , "": null
        , null: null
    };

    var decodeConditionCodes = {
        "ALT": "Alternate Assessment"
        , "NT": "Not Tested"
        , null: null
    };

    var decodeAttemptedness = {
        "N": "Non-Completion",
        "P": "Partial-Completion",
        "Y": "Completion"
    };
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

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

    function decodeRaceCode(raceCode) {
        if (raceCode === undefined || raceCode === null) {
            return null;
        }
        var lkpRaceObj = raceLookup[raceCode];
        if (lkpRaceObj == undefined || lkpRaceObj == null) {
            return null;
        }
        return lkpRaceObj.GRADE_CODE;
    }

    function decodeGenderCode(genderCode) {
        if (genderCode.indexOf('F') > -1) {
            return "F";
        }
        return "M";
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

        var testDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        var test_date = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5, 9);
        var flag = false;
                try {
            if (row.getField("TESTING_COMPLETED_DATE") !== null && row.getField("TESTING_COMPLETED_DATE") !== undefined ) {
                testDateObject = parseDate(row.getField("TESTING_COMPLETED_DATE"));
                flag = true;
            } else {
                var dates = [];
                var mappedDate = null;
                //Some students only have certain dates, only those should be included or it causes an undefined date object.
                if (row.getField("TESTING_COMPLETED_DATE_LISTENING") !== null) {
                    mappedDate = mapDateObject(hierarchy, row, row.getField("TESTING_COMPLETED_DATE_LISTENING"))
                    dates.push(new Date(mappedDate.STANDARD_DATE + "Z"));
                    flag = true;
                }
                if (row.getField("TESTING_COMPLETED_DATE_READING") !== null) {
                    mappedDate = mapDateObject(hierarchy, row, row.getField("TESTING_COMPLETED_DATE_READING"))
                    dates.push(new Date(mappedDate.STANDARD_DATE + "Z"));
                    flag = true;
                }
                if (row.getField("TESTING_COMPLETED_DATE_SPEAKING") !== null) {
                    mappedDate = mapDateObject(hierarchy, row, row.getField("TESTING_COMPLETED_DATE_SPEAKING"))
                    dates.push(new Date(mappedDate.STANDARD_DATE + "Z"));
                    flag = true;
                }
                if (row.getField("TESTING_COMPLETED_DATE_WRITING") !== null) {
                    mappedDate = mapDateObject(hierarchy, row, row.getField("TESTING_COMPLETED_DATE_WRITING"))
                    dates.push(new Date(mappedDate.STANDARD_DATE + "Z"));
                    flag = true;
                }
                if (flag == false){
                    mappedDate = mapDateObject(hierarchy, row, test_date);
                    dates.push(new Date(mappedDate.STANDARD_DATE + "Z"));
                }
                var maximumDate = new Date(Math.max.apply(null, dates));
                var isoD = maximumDate.toISOString();

                var format = (isoD.substring(0, 10));
                testDateObject = parseDate(format);
            }
        }
        catch (e) {
            print(e);
            print("FORMAT: " + format + "\n");
            print("LISTENING DATE: " + row.getField("TESTING_COMPLETED_DATE_LISTENING") + "\n");
            print("READING DATE: " + row.getField("TESTING_COMPLETED_DATE_READING") + "\n");
            print("SPEAKING DATE: " + row.getField("TESTING_COMPLETED_DATE_SPEAKING") + "\n");
            print("WRITING DATE: " + row.getField("TESTING_COMPLETED_DATE_WRITING") + "\n");
            print("MAX: " + maximumDate + "\n");
        }

        /*  pre UIHN-9419:
        var trimmedDistrictCode =  _util.coalesce(
                                                    row.getField("TESTED_COUNTY_DISTRICT_CODE")
                                                    , row.getField("CALPADS_DISTRICT_CODE")
                                                    , AssessmentLoader.config.DISTRICT_CODE
                                                    , ""
                                                  );

        if(trimmedDistrictCode.length > 7){
            trimmedDistrictCode = trimmedDistrictCode.substring(0,7);
            }
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; // pre UIHN-9419:  trimmedDistrictCode;
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
                        row.getField("TESTED_SCHOOL_CODE")
                        , row.getField("TESTED_SCHOOL_CODE_LISTENING")
                        , row.getField("TESTED_SCHOOL_CODE_SPEAKING")
                        , row.getField("TESTED_SCHOOL_CODE_READING")
                        , row.getField("TESTED_SCHOOL_CODE_WRITING")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE")
                        , row.getField("CALPADS_SCHOOL_CODE")
                        , row.getField("CALPADS_CHARTER_CODE")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("TESTED_SCHOOL_NAME")
                        ,row.getField("TESTEDSCHOOLNAME1")
                        , row.getField("TESTED_SCHOOL_NAME_LISTENING")
                        , row.getField("TESTED_SCHOOL_NAME_SPEAKING")
                        , row.getField("TESTED_SCHOOL_NAME_READING")
                        , row.getField("TESTED_SCHOOL_NAME_WRITING")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("TESTED_SCHOOL_CODE")
                        , row.getField("TESTED_SCHOOL_CODE_LISTENING")
                        , row.getField("TESTED_SCHOOL_CODE_SPEAKING")
                        , row.getField("TESTED_SCHOOL_CODE_READING")
                        , row.getField("TESTED_SCHOOL_CODE_WRITING")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE")
                        , row.getField("CALPADS_SCHOOL_CODE")
                        , row.getField("CALPADS_CHARTER_CODE")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("TESTED_SCHOOL_CODE")
                        , row.getField("TESTED_SCHOOL_CODE_LISTENING")
                        , row.getField("TESTED_SCHOOL_CODE_SPEAKING")
                        , row.getField("TESTED_SCHOOL_CODE_READING")
                        , row.getField("TESTED_SCHOOL_CODE_WRITING")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE")
                        , row.getField("CALPADS_SCHOOL_CODE")
                        , row.getField("CALPADS_CHARTER_CODE")
                    );
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("STUDENT_FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("STUDENT_LAST_NAME");
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField("STUDENT_MIDDLE_NAME");
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
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADE_ASSESSED"), row.getField("CALPADS_GRADE")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("STUDENT_LOCAL_ID"), row.getField("STUDENT_STATE_ID"),row.getField("SSID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesceEmptyString(row.getField("SSID"), row.getField("STUDENT_STATE_ID"));
                    break;
                case "STUDENT_DISTRICT_ID":
                    record.STUDENT_DISTRICT_ID = _util.coalesceEmptyString(row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesceEmptyString(row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.trim(row.getField("STUDENT_ADDRESS_LINE_1")) + " " + (_util.trim(row.getField("STUDENT_ADDRESS_LINE_2")) || "");
                    break;
                case "STUDENT_STATE_CODE":
                    // Remove leading "US-" from code. Ex: "US-CA"
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STUDENT_STATE_NAME"), "").replace("US-", "");
                    break;
                case "STUDENT_CITY":
                    record.STUDENT_CITY = _util.coalesce(row.getField("STUDENT_ADDRESS_CITY"));
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = _util.coalesce(row.getField("STUDENT_ZIP_CODE"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesceEmptyString(row.getField("STUDENT_GENDER"), "").substring(0, 1);
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = "01/01/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
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

        if (_util.trim(row.getField("CONDITION_CODE")) !== "") {
            admin.TEST_INTERVENTION_CODE = _util.trim(row.getField("CONDITION_CODE"));
            admin.TEST_INTERVENTION_DESC = decodeConditionCodes[admin.TEST_INTERVENTION_CODE] === undefined ? null : decodeConditionCodes[admin.TEST_INTERVENTION_CODE];
        }
        admin.TEST_INTERVENTION_CODE_2 = row.getField("ATTEMPTEDNESS");
        admin.TEST_INTERVENTION_DESC_2 = decodeAttemptedness[admin.TEST_INTERVENTION_CODE_2] === undefined ? null : decodeAttemptedness[admin.TEST_INTERVENTION_CODE_2];

        admin.TEST_INTERVENTION_CODE_3 = row.getField("SPECIAL_EDUCATION_FOR_TESTING");
        admin.TEST_INTERVENTION_DESC_3 = "SPECIAL EDUCATION"

        //Is in slot 4 to align with summative ELPAC
        admin.TEST_INTERVENTION_CODE_4 = "NPSFLAG";
        admin.TEST_INTERVENTION_DESC_4 = row.getField("NPS_SCHOOL_FLAG");

        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapCompositeScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField("OVERALL_SCALE_SCORE");
        var performanceLevel = row.getField("OVERALL_PERFORMANCE_LEVEL");

        // Check for key fields and do not map score and exit if conditions met.
        if (row.getField("TESTED_STATUS") === "N" || row.getField("INCLUDE_INDICATOR") === "N" || _util.trim(testNumber) === "" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NS") {
            return null;
        }


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevelStrand[performanceLevel];

        return score;
    }



    function mapTotalScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if (row.getField("TESTED_STATUS") === "N" || row.getField("INCLUDE_INDICATOR") === "N" || _util.trim(performanceLevel) === "" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NS" || _util.trim(performanceLevel) === "NS" || performanceLevel === null || performanceLevel === undefined ) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevelStrand[performanceLevel];
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        return score;
    }

    function mapSubScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");


        // Check for key fields and do not map score and exit if conditions met.
        if (row.getField("TESTED_STATUS") === "N" || row.getField("INCLUDE_INDICATOR") === "N" || _util.trim(testNumber) === "" || _util.trim(rawScore) === "" || rawScore === undefined || rawScore === null || _util.trim(rawScore) === "NS") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = rawScore;
        score["TEST_SCORE_VALUE"] = rawScore;
        score["TEST_RAW_SCORE"] = rawScore;
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
            throw `${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}`;
        }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });


        return assessmentAdminKey;

    }


    function generateTestNumber(row, testMetadata) {

        var testNumber = null;
        var recordType = _util.coalesce(row.getField("ASSESSMENT_TYPE"), row.getField("CONDITION_CODE"), row.getField("RECORDTYPE"));

        // Check if score should be mapped as an alternate score
        if(recordType === "ALT" || recordType === "24") {
            testNumber = testMetadata.TEST
                + "_ALT"
                + "_" + "IE"
                + "_" + testMetadata.CODE
                + "_" + decodeGradeCode(row.getField("GRADE_ASSESSED"));
        } else {
            testNumber = testMetadata.TEST
                + "_" + "IE"
                + "_" + testMetadata.CODE
                + "_" + decodeGradeCode(row.getField("GRADE_ASSESSED"));
        }

        return testNumber;

    }

    /*
    if (rawDate.indexOf('-') > -1) {
            var positionOne = rawDate.indexOf('-');f
            var positionTwo = rawDate.indexOf('-', (positionOne+1));

            month = padDateElement(rawDate.substring(positionOne + 1, positionTwo));
            day = padDateElement(rawDate.substring(positionTwo + 1, positionTwo + 3));
            year = padDateElement(rawDate.substring(0, positionOne));
        }
    */

    function parseDate(rawDate) {
        try {
            var dateObj = {
                RAW_DATE: rawDate
                , MONTH: null
                , DAY: null
                , YEAR: null
                , STANDARD_DATE: null
            };

            // Exit if no value is provided.
            if (_util.trim(_util.coalesce(rawDate, "")) === "") {
                return dateObj;
            }

            var formatter;

            // Check for format MM-dd-yyyy
            if (rawDate.toString().substring(0, 3).search("-") >= 0 && rawDate.split("-")[2].length === 4) {
                formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
            } else if (rawDate.toString().substring(0, 3).search("/") >= 0 && rawDate.split("/")[2].length === 4) {
                formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            } else if (rawDate.toString().substring(0, 3).search("/") >= 0 && rawDate.split("/")[2].length === 2) {
                formatter = new java.text.SimpleDateFormat("MM/dd/yy");
            } else if (rawDate.toString().substring(0, 3).search("-") >= 0 && rawDate.split("-")[2].length === 2) {
                formatter = new java.text.SimpleDateFormat("MM-dd-yy");
            }
            else {
                formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
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
        catch (e) {
            print("Error in date parsing: " + e);
        }
    }

    function mapDateObject(hierarchy, row, dateStr) {

        //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
        try {
            testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
        } catch (exception) {
            // Error will be reported in final check.
        }

        if (testDateObject === null) {
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
            } catch (exception) {
                // Error will be reported in final check.
            }
        }
        if (testDateObject === null) {
            try {
                testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd-MM-yyyy");
                var year = dateStr.toString().substring(6, 10);
                var month = dateStr.toString().substring(3, 5);
                var day = dateStr.toString().substring(0, 2);
                var standardDate = month + "-" + day + "-" + year;
                testDateObject.MONTH = month;
                testDateObject.DAY = day;
                testDateObject.YEAR = year;
                testDateObject.STANDARD_DATE = standardDate;
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




    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());