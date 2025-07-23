var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "PFT";
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
            print("Loading using signature file ${signatureFormatName}");
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
            { FUNCTION: mapTripleScore, SCORE_TYPE: 'Triple', CODE: "HIWT", NAME: "HEIGHTINCHES", SECONDARY_NAME: "HEIGHTFEET", TERTIARY_NAME: "WEIGHT", FORMULA: "None" }
            , { FUNCTION: mapDoubleScore, SCORE_TYPE: 'Double', CODE: "OMR", NAME: 'MILERUNSEC', SECONDARY_NAME: 'MILERUNMIN', FORMULA: "MILEVO2VAL" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "20MP", NAME: '20MPACER', FORMULA: "PACERVO2VAL" }
            , { FUNCTION: mapDoubleScore, SCORE_TYPE: 'Double', CODE: "WTS", NAME: "WALKTESTSEC", SECONDARY_NAME: "WALKTESTMIN", FORMULA: "WALKVO2VAL" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "HRB", NAME: "WALKTESTHEART RATE", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "SMT", NAME: "TRICEPS", FORMULA: "PERCENTFAT" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "SMC", NAME: "CALF", FORMULA: "PERCENTFAT" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "BIA", NAME: "BIOIMPEDANCE", FORMULA: "PERCENTFAT" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "CU", NAME: "CURLUP", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "TL", NAME: "TRUNKLIFT", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "PU", NAME: "PUSHUP", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "MPU", NAME: "MODPULLUP", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "FAH", NAME: "FLEXARMHANG", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "SRL", NAME: "SITREACHLEFT", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "SRR", NAME: "SITREACHRIGHT", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "SSL", NAME: "SHOULDERSTRLEFT", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "SSR", NAME: "SHOULDERSTRRIGHT", FORMULA: "None" }
            , { FUNCTION: mapSingleScore, SCORE_TYPE: 'Single', CODE: "BMI", NAME: "BODYMASSINDEX", FORMULA: "BODYMASSINDEX" }
            , { FUNCTION: mapOverallScore, SCORE_TYPE: 'Overall', CODE: "ASOVR", SOURCE: "SOURCE3", RESULT: "RESULT3" }
            , { FUNCTION: mapOverallScore, SCORE_TYPE: 'Overall', CODE: "ACOVR", SOURCE: "SOURCE1", RESULT: "RESULT1" }
            , { FUNCTION: mapOverallScore, SCORE_TYPE: 'Overall', CODE: "BCOVR", SOURCE: "SOURCE2", RESULT: "RESULT2" }
            , { FUNCTION: mapOverallScore, SCORE_TYPE: 'Overall', CODE: "FLXOVR", SOURCE: "SOURCE6", RESULT: "RESULT6" }
            , { FUNCTION: mapOverallScore, SCORE_TYPE: 'Overall', CODE: "TESOVR", SOURCE: "SOURCE4", RESULT: "RESULT4" }
            , { FUNCTION: mapOverallScore, SCORE_TYPE: 'Overall', CODE: "UBSOVR", SOURCE: "SOURCE5", RESULT: "RESULT5" }
            , { FUNCTION: mapTotalScore, SCORE_TYPE: 'Total', CODE: "OVRTOT" }
        ];


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var educationLevelDecodes = {
        "05": { DECODE: "05" }
        , "07": { DECODE: "07" }
        , "09": { DECODE: "09" }
        , "5": { DECODE: "05" }
        , "7": { DECODE: "07" }
        , "9": { DECODE: "09" }
        , "10": { DECODE: "10" }
        , "11": { DECODE: "11" }
        , "12": { DECODE: "12" }
        , "": { DECODE: "UNK" }
    };

    var sourceDecodes = {
        "1": { DECODE: "PACER" }
        , "2": { DECODE: "Mile Run" }
        , "3": { DECODE: "Walk Test" }
        , "4": { DECODE: "Skinfold" }
        , "5": { DECODE: "BMI" }
        , "6": { DECODE: "Bioelectric Impedance" }
        , "7": { DECODE: "Curl-up" }
        , "8": { DECODE: "Trunk Lift" }
        , "9": { DECODE: "Push-up" }
        , "A": { DECODE: "Modified Pull-Up" }
        , "B": { DECODE: "Pull-Up" }//not in current use
        , "C": { DECODE: "Flexed-Arm Hang" }
        , "D": { DECODE: "Sit and Reach" }
        , "E": { DECODE: "Shoulder Stretch" }
        , "": { DECODE: "UNK" }
    };

    var healthyFitnessZoneDecodes = {
        "": { DECODE: "Not Tested" }
        , "H": { DECODE: "In the Healthy Fitness Zone" }
        , "N": { DECODE: "Needs Improvement" }
        , "X": { DECODE: "Needs Improvement- Health Risk" }
        , "I": { DECODE: "Insufficient or Invalid" }
    }

    var parentGuardieanEducationLevelDecodes = {
        "10": { DECODE: "Graduate school/post graduate training" }
        , "11": { DECODE: "College graduate" }
        , "12": { DECODE: "Some college (include AA degree)" }
        , "13": { DECODE: "High school graduate" }
        , "14": { DECODE: "Not a high school graduate" }
        , "15": { DECODE: "Declined to state or unknown" }
    }; //not used but mapped for posterity

    var participationLevelDecodes = {
        "1": { DECODE: "Complete" }
        , "2": { DECODE: "Partial" }
        , "3": { DECODE: "None" }
        , "": { DECODE: "UNK" }
    };


    var genderDecodes = {
        "M": "M"
        , "m": "M"
        , "F": "F"
        , "f" : "F"
        , "Male":  "M"
        , "Female": "F"
        , "Nonbinary" :"N"
        , "N" : "N"
        , "X" : "X"
    };
//Decodes for ShoulderStretch
    var decodeSS = {
        "Y": "YES"
       ,"N": "NO"
       ,"" : null
       ,null : null
    };



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
        var studentAge = getStudentAge(hierarchy, row);

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
        scoresToMap.forEach(function (testMetadata) {
            //These functions require different parameters to calculate specific metrics
            //Double is for scores with a minute and second value to be calculated
            //Triple is for BMI - height (feet and inches) and weight
            let score = null;
            if (testMetadata.SCORE_TYPE == 'Single') {
                score = (testMetadata.FUNCTION)(row, testMetadata.NAME, testMetadata.CODE, studentAge, testMetadata.FORMULA);
            }
            else if (testMetadata.SCORE_TYPE == 'Double') {
                score = (testMetadata.FUNCTION)(row, testMetadata.NAME, testMetadata.SECONDARY_NAME, testMetadata.CODE, studentAge, testMetadata.FORMULA);
            }
            else if (testMetadata.SCORE_TYPE == 'Triple') {
                score = (testMetadata.FUNCTION)(row, testMetadata.NAME, testMetadata.SECONDARY_NAME, testMetadata.TERTIARY_NAME, testMetadata.CODE, studentAge, testMetadata.FORMULA);
            }
            else if (testMetadata.SCORE_TYPE == 'Overall') {
                score = (testMetadata.FUNCTION)(row, testMetadata.SOURCE, testMetadata.RESULT, testMetadata.CODE, studentAge);
            }
            else if (testMetadata.SCORE_TYPE == 'Total') {
                score = (testMetadata.FUNCTION)(row, testMetadata.CODE, studentAge);
            }

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
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        var testDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        let dob = extractDateString(row, "DOB");
        let testDate = extractDateString(row, "TESTDATE");

        if (dob) {
            //birthDateObject = AppUtil.getDateObjByPattern(dob, "MM/dd/yyyy");
            birthDateObject = AppUtil.getMonthFollowedByDay(dob);
        }

        if (testDate) {
            //testDateObject = AppUtil.getDateObjByPattern(testDate, "MM/dd/yyyy");
            testDateObject = AppUtil.getMonthFollowedByDay(testDate);
        }

        /*  pre UIHN-9419:
        var folderDistrictCode = AssessmentLoader.config.DISTRICT_CODE;
        var districtCode = _util.coalesce(
            row.getField("CCODE" + row.getField("DCODE"))
            , folderDistrictCode
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; //  pre UIHN-9419:  districtCode;
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
                        row.getField("SCODE")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCODE")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("SCODE")
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
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRSTNAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("MIDDLEINI"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LASTNAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = educationLevelDecodes[row.getField("GRADE")] === undefined ? null : educationLevelDecodes[row.getField("GRADE")].DECODE;
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
        admin.STUDENT_FOODSERVICE_IND = row.getField("NSLPELIGIBLE");
        admin.TEST_INTERVENTION_CODE = row.getField("PARTLEVEL");
        admin.TEST_INTERVENTION_DESC = participationLevelDecodes[row.getField("PARTLEVEL")] === undefined ? null : participationLevelDecodes[row.getField("PARTLEVEL")].DECODE;
        return admin;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/
    function mapTotalScore(row, code, age) {
        var mapping = {};
        var score = row.getField("SCORE");
        if (extractDateString(row, "TESTDATE") === null
            || extractDateString(row, "TESTDATE") === undefined
            || extractDateString(row, "TESTDATE") === "") {
            return null;
        }
        if (score === null || score === undefined || score === "" || score === "0") {
            return null;
        }
        var testNumber = "PFT" + code + "_" + genderDecodes[row.getField("GENDER")]; //No age, universal
        mapping["TEST_NUMBER"] = testNumber;
        mapping["TEST_SCORE_TEXT"] = score;
        return mapping;
    }

    function mapOverallScore(row, source, result, code, age) {
        var mapping = {};
        var testNumberAge = age;
        if (age > 17) {
            testNumberAge = "17+";
        }
        var testNumber = "PFT" + code + "_" + genderDecodes[row.getField("GENDER")] + "_" + testNumberAge;
        var score = row.getField("SCORE");
        mapping["TEST_NUMBER"] = testNumber;

        var primary = row.getField(source);
        var secondary = row.getField(result);
        if (extractDateString(row, "TESTDATE") === null ||
            extractDateString(row, "TESTDATE") === undefined ||
            extractDateString(row, "TESTDATE") === "") {
            return null;
        }
        if (primary === null || primary === undefined || primary === "") {
            return null;
        }
        if (secondary === null || secondary === undefined || secondary === "") {
            return null;
        }
        //flip flopped due to ordering of metric requirements
        mapping["TEST_SCORE_TEXT"] = score;
        mapping["TEST_SECONDARY_RESULT_CODE"] = primary;
        mapping["TEST_SECONDARY_RESULT"] = sourceDecodes[primary] === undefined ? null : sourceDecodes[primary].DECODE;
        mapping["TEST_PRIMARY_RESULT_CODE"] = secondary;
        mapping["TEST_PRIMARY_RESULT"] = healthyFitnessZoneDecodes[secondary] === undefined ? null : healthyFitnessZoneDecodes[secondary].DECODE;
        if (secondary == "H") {
            mapping["TEST_PASSED_INDICATOR"] = "Yes";
        }
        else {
            mapping["TEST_PASSED_INDICATOR"] = "No";
        }
        return mapping;
    }

    function mapSingleScore(row, name, code, age, formula) {
        var mapping = {};
        var testNumberAge = age;
        if (age > 17) {
            testNumberAge = "17+"
        }
        var testNumber = "PFT" + code + "_" + genderDecodes[row.getField("GENDER")] + "_" + testNumberAge;
        if (row.getField(name) === null || row.getField(name) === undefined || row.getField(name) === "") {
            return null;
        }
        if ((extractDateString(row, "TESTDATE") === null ||
            extractDateString(row, "TESTDATE") === undefined ||
            extractDateString(row, "TESTDATE") === "")) {
            return null;
        }
        var rawScore = row.getField(name);
        if (rawScore === null || rawScore === undefined || rawScore === "") {
            return null;
        }
        if (rawScore !== "Y" && rawScore !== "N" && rawScore !== "00" && rawScore !== "0") {
            rawScore = parseInteger(row.getField(name), 10);
        }
        if (rawScore === "9999") {
            return null;
        }
        if (rawScore === "0" || rawScore === "00"){
            rawScore = "0";
        }

        var scaledScore = null;
        if (formula != 'None') {
            scaledScore = scoreOnFunction(row, name, code, age, formula);
        }

        if (scaledScore == "Too young for VO2MAX") {
            mapping['TEST_PRIMARY_RESULT'] = "Too young for VO2MAX";
            mapping['TEST_NUMBER'] = testNumber;
            mapping['TEST_SCORE_TEXT'] = rawScore;
            if (!isNaN(rawScore)) {
                mapping['TEST_SCORE_VALUE'] = rawScore;
                mapping['TEST_RAW_SCORE'] = rawScore;
            }
            //return mapping;
        }
        else if (null == scaledScore) {

             mapping['TEST_NUMBER'] = testNumber;
             mapping['TEST_SCORE_TEXT'] = rawScore;

            if(rawScore == "Y" || rawScore == "N"){ //Decoded ShoulderStretch mapping
              mapping['TEST_SCORE_TEXT'] = decodeSS[rawScore];
              mapping['TEST_PRIMARY_RESULT_CODE'] = rawScore;
              mapping['TEST_PRIMARY_RESULT'] =  decodeSS[rawScore];
            }

            if (rawScore != null && !isNaN(rawScore)) {
                mapping['TEST_SCORE_VALUE'] = rawScore;
                mapping['TEST_RAW_SCORE'] = rawScore;

                mapping['TEST_SCALED_SCORE'] = rawScore;
            }
            //return mapping;
        }

        mapping['TEST_NUMBER'] = testNumber;
        mapping['TEST_SCORE_TEXT'] = scaledScore;

        if (rawScore != null && !isNaN(rawScore)) {
            mapping['TEST_RAW_SCORE'] = rawScore;
        }

        if (scaledScore != null && !isNaN(scaledScore)) {
            mapping['TEST_SCORE_VALUE'] = scaledScore;
            mapping['TEST_SCALED_SCORE'] = scaledScore;
        }
        return mapping;
    }

    function mapDoubleScore(row, name, name2, code, age, formula) {
        var mapping = {};
        var testNumberAge = age;
        if (age > 17) {
            testNumberAge = "17+"
        }
        var testNumber = "PFT" + code + "_" + genderDecodes[row.getField("GENDER")] + "_" + testNumberAge;
        if (row.getField(name) === null || row.getField(name) === undefined || row.getField(name) === "") {
            return null;
        }
        var n1 = row.getField(name);
        var n2 = row.getField(name2);
        if (n1 == "9999") {
            n1 = 0;
        }
        if (n2 == "9999") {
            n2 = 0;
        }
        var rawScore = parseInt(n1) + (parseInt(n2) * 60);
        if (extractDateString(row, "TESTDATE") === null || extractDateString(row, "TESTDATE") === undefined || extractDateString(row, "TESTDATE") === "") {
            return null;
        }
        if (rawScore === null || rawScore === undefined || rawScore === "" || rawScore === "9999") {
            return null;
        }

        var scaledScore = scoreOnFunction(row, name, code, age, formula);


        if (scaledScore === "Too young for VO2MAX") {
            mapping['TEST_PRIMARY_RESULT'] = "Too young for VO2MAX";
            mapping['TEST_NUMBER'] = testNumber;
            mapping['TEST_SCORE_TEXT'] = rawScore;
            mapping['TEST_SCORE_VALUE'] = rawScore;
            mapping['TEST_RAW_SCORE'] = rawScore;
            return mapping;
        }
        else if (null == scaledScore) {
            mapping['TEST_NUMBER'] = testNumber;
            mapping['TEST_SCORE_TEXT'] = rawScore;
            mapping['TEST_SCORE_VALUE'] = rawScore;
            mapping['TEST_RAW_SCORE'] = rawScore;
            mapping['TEST_SCALED_SCORE'] = rawScore;
            return mapping;
        }
        mapping['TEST_NUMBER'] = testNumber;
        mapping['TEST_SCORE_TEXT'] = scaledScore;
        mapping['TEST_SCORE_VALUE'] = scaledScore;
        mapping['TEST_SCALED_SCORE'] = scaledScore;
        mapping['TEST_RAW_SCORE'] = rawScore;
        return mapping;

    }

    function mapTripleScore(row, name, name2, name3, code, age, formula) {

        var mapping = {};
        var testNumberAge = age;
        if (age > 17) {
            testNumberAge = "17+"
        }
        var testNumber = "PFT" + code + "_" + genderDecodes[row.getField("GENDER")] + "_" + testNumberAge;
        var primary = row.getField(name);//inches
        var secondary = row.getField(name2);//feet
        var tertiary = row.getField(name3);//weight
        if (extractDateString(row, "TESTDATE") === null || extractDateString(row, "TESTDATE") === undefined || extractDateString(row, "TESTDATE") === "") {
            return null;
        }

        // set heightfeet/heightinches/weight value to null if it is missing
        if (primary === null || primary === undefined || primary === "") {
            primary = null;
        }
        if (secondary === null || secondary === undefined || secondary === "") {
            secondary = null;
        }
        if (tertiary === null || tertiary === undefined || tertiary === "") {
            tertiary = null;
        }

        mapping['TEST_NUMBER'] = testNumber;
        mapping['TEST_PRIMARY_RESULT_CODE'] = "INCH";

        // set inches result to null rather than 0 if missing
        if (secondary !== null) {
            var inchVal = parseInteger(primary);
            if (inchVal === "9999") {
                inchVal = 0;
            }
            var feetVal = parseInteger(secondary);
            if (feetVal === "9999") {
                feetVal = 0;
            }
            mapping['TEST_PRIMARY_RESULT'] = inchVal + feetVal * 12;
        } else {
            mapping['TEST_PRIMARY_RESULT'] = secondary;
        }

        mapping['TEST_SECONDARY_RESULT_CODE'] = "WT";
        mapping['TEST_SECONDARY_RESULT'] = tertiary;
        return mapping;
    }


    function scoreOnFunction(row, name, code, age, formula) {
        var score = null;
        var genderCode = null;
        var bmiValue = row.getField("BODYMASSINDEX");
        if(bmiValue === null) {
            let heightInFeet = row.getField("HEIGHTFEET");
            let heightInInches = row.getField("HEIGHTINCHES");
            let weightInPounds = row.getField("WEIGHT");
            let heightInMeters = (0.3048 * heightInFeet) + (0.0254 * heightInInches);
            let weightInKilo = (0.45359237 * weightInPounds);
            let heightSquare = (heightInMeters * heightInMeters);
            bmiValue = (weightInKilo / heightSquare);
        }
        if (row.getField("GENDER") == "M") {
            genderCode = 1;
        }
        else {
            genderCode = 0;
        }
        if (formula == "PACERVO2VAL" && null != row.getField("PACERVO2VAL") && "" != row.getField("PACERVO2VAL")) {
            score = row.getField("PACERVO2VAL");
        }
        if (formula == "MILEVO2VAL" && null != row.getField("MILEVO2VAL") && "" != row.getField("MILEVO2VAL")) {
            score = row.getField("MILEVO2VAL");
        }
        else if (formula == "MILEVO2VAL" && age > 9 && null != row.getField("MILERUNSEC") && "" != row.getField("MILERUNSEC") && bmiValue != null) {
            var timeM = parseInt(row.getField("MILERUNMIN"));
            var timeS = parseInt(row.getField("MILERUNSEC")) / 60;
            var p1 = 0.21 * age * genderCode;
            var p2 = 0.84 * bmiValue;
            var p3 = 8.41 * (timeM + timeS);
            var p4 = 0.34 * (timeM + timeS) * (timeM + timeS);
            score = p1 - p2 - p3 + p4 + 108.94;
            score = Math.round(score * 100) / 100;
        }
        else if (formula == "MILEVO2VAL" && age < 10 && null != row.getField("MILERUNSEC") && "" != row.getField("MILERUNSEC")) {
            score = "Too young for VO2MAX";//Dummy to be caught in map function
        }
        else if (formula == "WALKVO2VAL" && null != row.getField("WALKVO2VAL") && "" != row.getField("WALKVO2VAL")) {
            score = row.getField("WALKVO2VAL");
        }
        else if (formula == "WALKVO2VAL" && age > 12 && null != row.getField("WALKTESTSEC") && "" != row.getField("WALKTESTSEC")) {
            var p1 = 132.853 + (6.315 * genderCode);
            var p2 = (0.0769 * row.getField("WEIGHT"));
            var p3 = (0.3877 * age);
            var p4 = (3.2649 * (parseFloat(row.getField("WALKTESTMIN")) + (row.getField("WALKTESTSEC") / 60)));
            var p5 = (0.1565 * row.getField("WALKTESTHEART RATE"));
            score = p1 - p2 - p3 - p4 - p5;
            score = Math.round(score * 100) / 100;

        }
        else if (formula == "WALKVO2VAL" && age < 13 && null != row.getField("WALKTESTSEC") && "" != row.getField("WALKTESTSEC")) {
            score = "Too young for VO2MAX";//Dummy to be caught in map function
        }
        else if (formula == "PERCENTFAT" && null != row.getField("PERCENTFAT") && "" != row.getField("PERCENTFAT")) {
            score = row.getField("PERCENTFAT");
        }
        else if (formula == "PERCENTFAT" && null != row.getField("TRICEPS") && "" != row.getField("TRICEPS") && null != row.getField("CALF") && "" != row.getField("CALF")) {
            if (genderCode == 1) {//Male
                score = (0.735 * (parseFloat(row.getField("TRICEPS")) + parseFloat(row.getField("CALF")))) + 1.0;
            }
            else {
                score = (0.610 * (parseFloat(row.getField("TRICEPS")) + parseFloat(row.getField("CALF")))) + 5.0;
            }//Female
            score = Math.round(score * 100) / 100;
        }
        else if (formula == "BODYMASSINDEX" && null != row.getField("BODYMASSINDEX") && "" != row.getField("BODYMASSINDEX")) {
            score = row.getField("BODYMASSINDEX");
        }
        else if (formula == "BODYMASSINDEX" && row.getField("HEIGHTFEET") != "" && row.getField("HEIGHTFEET") != null) {
            score = Math.round(bmiValue * 100) / 100;
        }
        return score;
    }

    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function extractDateString(row, fieldName) {
        let extractedDate = row.getField(fieldName);
        if (extractedDate && extractedDate.indexOf("/") !== -1) {
            return extractedDate;
        } else if(extractedDate && extractedDate.indexOf("-") !== -1) {
            return extractedDate;
        } else if (row.getField("${fieldName}_M") && row.getField("${fieldName}_D") && row.getField("${fieldName}_Y")) {
            return row.getField("${fieldName}_M") + "/" + row.getField("${fieldName}_D") + "/" + row.getField("${fieldName}_Y");
        } else {
            return null;
        }
    }

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {

            // Note: Admin year isn't required for sorting. Should be left blank.
            var assessmentAdminKey_one = generateAssessmentAdminSortKey(signature, hierarchy, one);
            var assessmentAdminKey_two = generateAssessmentAdminSortKey(signature, hierarchy, two);

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }

        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }

    }

    function generateAssessmentAdminSortKey(signature, hierarchy, srcRecord) {

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE
            + "_" + hierarchy.SCHOOL_YEAR
            + "_" + hierarchy.REPORTING_PERIOD
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_VENDOR_ID"), "")

        return assessmentAdminKey;

    }

    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
         var middleIn = srcRecord.getField("MIDDLEINI");
         middleIn = middleIn ? middleIn.trim() : "";
         var firstName = srcRecord.getField("FIRSTNAME");
         firstName = firstName ? firstName.trim() : "";
         var lastName = srcRecord.getField("LASTNAME");
         lastName = lastName ? lastName.trim() : "";
         var stuId = srcRecord.getField("STUID");
         stuId = stuId ? stuId.trim() : "";
         var assessmentAdminKey = null;

        // Set base assessment admin key information
          assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${hierarchy.REPORTING_PERIOD}_${stuId}_${firstName}_${middleIn}_${lastName}`;

        return assessmentAdminKey;

    }

    function getPARTICIPATION_YEAR(adminYear) {
        if (_util.trim(adminYear) === "") {
            return null;
        }
        var year = parseInt(adminYear, 10);
        var schoolYear;

        if (year < 10) {
            year = "200" + year;
        }
        else if (year < 25) {
            year = "20" + year;
        }
        else if (year < 100) {
            year = "19" + year;
        }
        else if (year < 1000) {
            year = "1" + year;
        }

        return String(year - 1) + "-" + String(year);
    }

    function parseDateNative(value) {
        var dateObj = {
            RAW_DATE: value
            , STANDARD_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
        };

        if (_util.trim(_util.coalesce(value, "")) === "") {
            return dateObj;
        }

        let temDateObjNative = new Date(value);
        let month = temDateObjNative.getMonth() + 1;
        let day = temDateObjNative.getDate();
        let year = temDateObjNative.getFullYear();

        if (month.length < 2) {
            month = "0" + month;
        }
        if (day.length < 2) {
            day = "0" + day;
        }

        //Set Date
        dateObj.STANDARD_DATE = month + '/' + day + '/' + year;
        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;

        return dateObj;
    }

    function parseDate(value) {
        var dateObj = {
            RAW_DATE: value
            , STANDARD_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
        };

        //Save raw date value
        dateObj.RAW_DATE = value;

        if (_util.trim(_util.coalesce(value, "")) === "") {
            return dateObj;
        }

        var splitDate = value.split('/');

        var month = splitDate[0];
        if (month.length < 2) {
            month = "0" + month;
        }
        var day = splitDate[1];
        if (day.length < 2) {
            day = "0" + day;
        }
        var year = splitDate[2];


        //Set Date
        dateObj.STANDARD_DATE = month + '/' + day + '/' + year;
        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;

        return dateObj;
    }

    function getTestDateObject(rowValues) {
        var testDate = parseDate(rowValues['TESTDATE']);
        if (testDate.RAW_DATE == null) {
            var period = getLoaderParameter('ASSESSMENT_PERIOD');
            var schoolYear = getLoaderParameter('SCHOOL_YEAR').substring(0, 4);
            if (period == "Spring") {
                schoolYear = parseInt(schoolYear) + 1;
            }
            var dateObj = {
                RAW_DATE: null
                , STANDARD_DATE: "04/15/" + schoolYear
                , MONTH: null
                , DAY: null
                , YEAR: null
            }
            return dateObj;
        }
        return testDate;
    }

    function parseInteger(value) {
        while (null != value && value.length > 0 && value.charAt(0) == '0')
            value = value.substring(1, value.length);

        if (value == null || value == undefined || value == '' || isNaN(value))
            return "9999";

        return parseInt(value);
    }

    function getStudentAge(hierarchy, row) {
        if (row.getField("STUAGE") && row.getField("STUAGE") !== "") {
            return row.getField("STUAGE");
        }
        var ageCalc = "", ageDate;
        if (extractDateString(row, "TESTDATE") != "") {
            ageDate = parseDateNative(extractDateString(row, "DOB"));
            var testDate = parseDateNative(extractDateString(row, "TESTDATE"));

            ageCalc = parseInt(testDate.YEAR) - parseInt(ageDate.YEAR);
            if (testDate.MONTH < ageDate.MONTH) {
                ageCalc--;
            }
            if (testDate.MONTH == ageDate.MONTH && testDate.DAY < ageDate.DAY) {
                ageCalc--;
            }
        }
        else { //not guaranteed to be accurate, TESTDATE missing
            var period = hierarchy.REPORTING_PERIOD;
            var schoolYear = hierarchy.SCHOOL_YEAR.substring(0, 4);
            ageDate = parseDateNative(extractDateString(row, "DOB"));
            if (period == "Spring") {
                schoolYear = parseInt(schoolYear) + 1;
            }
            else {
                schoolYear = parseInt(schoolYear);
            }
            ageCalc = schoolYear - parseInt(ageDate.YEAR);
            if (period == "Spring" && ageDate.MONTH > 5) {
                ageCalc--;
            }
        }
        return ageCalc;
    }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());
