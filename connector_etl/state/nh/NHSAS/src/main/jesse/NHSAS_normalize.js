var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NHSAS";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
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
                .group_by("ADMINISTRATION GROUPING", function (one, two) {

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"],
                    function (output, rows) {
                        try {

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function (record) {
                                output.RECORDS.put(record);
                            });

                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }


                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        // Report when no scores are found.
                        if (mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;

        } catch (exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        } n
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

    //TODO update scoresToMap
    var scoresToMap = [
        { TEST: "NHSAS_", CODE: "ELA_OVERALL", FIELD: "ELA/READING_", MAP_FUNCTION: mapScaledScore },
        { TEST: "NHSAS_", CODE: "MATH_OVERALL", FIELD: "MATHEMATICS_", MAP_FUNCTION: mapScaledScore },
        { TEST: "NHSAS_", CODE: "SCI_OVERALL", FIELD: "SCIENCE_", MAP_FUNCTION: mapScaledScore },
        { TEST: "NHSAS_", CODE: "READ_LIT_SUBCAT", FIELD: "READING_LITERARY_TEXT_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "READ_INFO_SUBCAT", FIELD: "READING_INFORMATIONAL_TEXT_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "OPR_ALG_SUBCAT", FIELD: "OPERATIONS_AND_ALGEBRAIC_THINKING_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "NUM_OPR_SUBCAT", FIELD: "NUMBER_AND_OPERATIONS_IN_BASE_10_AND_FRACTIONS_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "M_D_G_SUBCAT", FIELD: "MEASUREMENT,_DATA_AND_GEOMETRY_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "MOD_PROB_SUBCAT", FIELD: "MODELING_AND_PROBLEM_SOLVING_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "MATH_SUBCAT", FIELD: "USE_MATHEMATICAL_REASONING_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "PHY_SCI_SUBCAT", FIELD: "PHYSICAL_SCIENCES_DISCIPLINE_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "LIFE_SCI_SUBCAT", FIELD: "LIFE_SCIENCES_DISCIPLINE_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "EAS_SCI_SUBCAT", FIELD: "EARTH_AND_SPACE_SCIENCES_DISCIPLINE_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "RAT_PROP_SUBCAT", FIELD: "RATIOS_AND_PROPORTIONAL_RELATIONSHIPS_AND_NUMBER_SYSTEM_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "EXP_EQ_SUBCAT", FIELD: "EXPRESSIONS_AND_EQUATIONS_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "GEO_SUBCAT", FIELD: "GEOMETRY_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "STAT_PROB_SUBCAT", FIELD: "STATISTICS_AND_PROBABILITY_REPORTING_CATEGORY_", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "NHSAS_", CODE: "OVERALL", FIELD: "OVR_", MAP_FUNCTION: mapOvrScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    //TODO add any additional decodes
var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "3": "03",
        "03": "03",
        "G3":"03",
        "Grade 3": "03",
        "grade 3": "03",
        "4": "04",
        "04": "04",
        "G4":"04",
        "Grade 4": "04",
        "grade 4": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "grade 5": "05",
        "G5": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "grade 6": "06",
        "G6":"06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "grade 7": "07",
        "G7":"07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "grade 8": "08",
        "G8":"08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "10": "10",
        "Grade 10": "10",
        "11": "11",
        "Grade 11": "11",
        "grade 11": "11",
        "G11":"11",
        "12": "12",
        "Grade 12": "12",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG",
        "NA" : "NA",
        "N/A": "NA",
         "": null,
        null: null
    };

    var subjectDecodes = {
        "ELA": "ELA",
        "English Language Arts": "ELA",
        "MA": "MATH",
        "Mathematics": "MATH",
        "Science": "SCI",
        "SC": "SCI",
        "SCIENCE": "SCI",
        "MATH": "MATH"
    };
    var performanceDecodes = {
        '1': { DECODE: 'Below Proficient', AS_NUMBER: 'Level 1', PASS_IND : 'No' },
        '2': { DECODE: 'Approaching Proficient', AS_NUMBER: 'Level 2', PASS_IND : 'No' },
        '3': { DECODE: 'Proficient', AS_NUMBER: 'Level 3', PASS_IND : 'Yes' },
        '4': { DECODE: 'Highly Proficient', AS_NUMBER: 'Level 4', PASS_IND : 'Yes' },
        "Level 1" : {DECODE: 'Below Proficient', AS_NUMBER: 'Level 1', PASS_IND : 'No'},
        "Level 2" : {DECODE: 'Approaching Proficient', AS_NUMBER: 'Level 2', PASS_IND : 'No'},
        "Level 3" : {DECODE: 'Proficient', AS_NUMBER: 'Level 3', PASS_IND : 'Yes'},
        "Level 4" : {DECODE: 'Highly Proficient', AS_NUMBER: 'Level 4', PASS_IND : 'Yes'},
        "Level 1 - Below Proficient" : {DECODE: 'Below Proficient', AS_NUMBER: 'Level 1', PASS_IND : 'No'},
        "Level 2 - Approaching Proficient" : {DECODE: 'Approaching Proficient', AS_NUMBER: 'Level 2', PASS_IND : 'No'},
        "Level 3 - Proficient" : {DECODE: 'Proficient', AS_NUMBER: 'Level 3', PASS_IND : 'Yes'},
        "Level 4 - Above Proficient" : {DECODE: 'Highly Proficient', AS_NUMBER: 'Level 4', PASS_IND : 'Yes'},
        '': null,
        null: null
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
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param rows A JSON array of record objects being processed
     * @returns {Array}
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
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

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch (exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
            }
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
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateStr = _util.coalesce(row.getField("STUDENT_DOB"), "");

        if (birthDateStr.length == 7) {
            birthDateStr = '0' + birthDateStr;
            var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMddyyyy");
        }
        else{
            var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yyyy");
        }

       var value  = '0515' + hierarchy.SCHOOL_YEAR.substring(5, 9);
       if(value.length == 7){
       value = '0' + value;
       }
       var finalDate = null;
       if(row.getField("DATE_TAKEN")!==null && row.getField("DATE_TAKEN")!==undefined){
       finalDate = AppUtil.getDateObjByPattern(row.getField("DATE_TAKEN"), "MM/dd/yyyy").STANDARD_DATE;
       }
       else{
       finalDate = AppUtil.getDateObjByPattern(value, "MMddyyyy").STANDARD_DATE;
       }
        var fullName = row.getField("LAST_FIRST");
        if(fullName !== undefined && fullName !== null && fullName !== ""){
        var lastName = fullName.split(",")[0].trim();
        var firstName = fullName.split(",")[1].trim();
        }

        var schoolName = row.getField("ENROLLED_SCHOOL");
        if(schoolName !== undefined && schoolName !== null && schoolName !== ""){
        var schoolLocalId = schoolName.split("-").pop().replace(')', '');
        var schName = schoolName.split("(")[0];
        }
    function adminPeriod(row){
        var period = null;
        var testType = row.getField("TEST_REASON");
            if(testType === null || testType === undefined || testType === ""){
                return null;
            }
            if (testType.indexOf("Spring") > -1){
                period = "SPRING"
            }else if(testType.indexOf("Fall") > -1){
                period = "FALL"
            }else if(testType.indexOf("Winter") > -1){
                period = "WINTER"
            }
            return period
        }


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
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = _util.coalesce(adminPeriod(row), hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE =  _util.coalesce(row.getField("TEST_COMPLETION_DATE"), finalDate, "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("LASID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID"),row.getField("LASID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("LASID"),row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(
                        row.getField("STUDENT_FIRST_NAME"), firstName
                    );
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(
                        row.getField("STUDENT_LAST_NAME"), lastName
                    );
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('ENROLLED_GRADE')];
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

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOL_STATE_ID"), schName, row.getField("ENROLLED_SCHOOL"), row.getField("ASSESSMENT_ID"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"), row.getField("ASSESSMENT_ID"),schoolLocalId);
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"), row.getField("ASSESSMENT_ID"));
                    break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = schName;
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
    function mapAdditionalAdminFields(row) {
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

//        if (row.getField("ENG_LEARNER") === "1" || row.getField("ENG_LEARNER") === "2") {
//            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
//        }
//        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var grade = _util.coalesce(row.getField("ENROLLED_GRADE"),row.getField("GRADE_LEVEL"), 'NA');

        if (grade != null && grade.length < 2) {
            grade = '0' + grade;
        }

       var testNumber = testMetadata.TEST + gradeDecode[grade] + '_' + testMetadata.CODE;

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + 'SCALE_SCORE'));
        var sgp = row.getField(testMetadata.FIELD + 'SGP');
        var standardError = _util.coalesce(row.getField('OVERALL_-_STANDARD_ERROR_FOR_' + testMetadata.FIELD + 'SCALE_SCORE'));
        var achievementLevel = _util.coalesce(row.getField(testMetadata.FIELD + 'ACHIEVEMENT_LEVEL'));

        if (scaleScore === null || scaleScore === undefined || scaleScore == "") {
            return null;
        }
        score["TEST_NUMBER"] = testNumber;

        if (scaleScore !== 'NA' && scaleScore !== 'N/A') {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (standardError !== 'NA' && standardError !== 'N/A') {
            score["TEST_STANDARD_ERROR"] = standardError;
        }

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_PERCENTILE_SCORE"] = sgp;

        var decode = performanceDecodes[achievementLevel];
        if (decode != null && decode != undefined) {
            score['TEST_PRIMARY_RESULT'] = decode.DECODE;
            score['TEST_PRIMARY_RESULT_CODE'] = decode.AS_NUMBER;
            score['TEST_PASSED_INDICATOR'] = decode.PASS_IND;
        }

        return score;
    }


    function mapOvrScore(row, testMetadata) {
        var score = {};
        var lexileScore = row.getField("REPORTED_LEXILE_MEASURE");
        var quantileScore = row.getField("REPORTED_QUANTILE_MEASURE");
        var lexile;
        var quantile;
        var grade = _util.coalesce(row.getField("ENROLLED_GRADE"),row.getField("GRADE_LEVEL"), 'NA');

        if (grade != null && grade.length < 2) {
            grade = '0' + grade;
        }
        if (lexileScore !== null) {
            lexile = lexileScore.replace("L", "");
        }
        if (quantileScore !== null ) {
            quantile = quantileScore.replace("Q", "").replace("EM", "");
        }

        var testSubject = row.getField("TEST_SUBJECT");
        if(testSubject){
            var testNumber = testMetadata.TEST + gradeDecode[grade] + '_' + subjectDecodes[testSubject] +'_' + testMetadata.CODE;
        } else{
            var testNumber = testMetadata.TEST + gradeDecode[grade] + '_' + testMetadata.CODE;
        }

        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + 'SCALE_SCORE'));
        var standardError = row.getField(testMetadata.FIELD + 'SCALE_SCORE_STANDARD_ERROR');

        var achievementLevel = row.getField('PERFORMANCE_LEVEL');


        if (scaleScore === null || scaleScore === undefined || scaleScore == ""){
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_READING_LEVEL"] = lexile;
        score["TEST_QUARTILE_SCORE"] = quantile;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if(!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if(!isNaN(standardError)) {
        score["TEST_STANDARD_ERROR"] = standardError;
        }

        var decode = performanceDecodes[achievementLevel];
        if (decode != null && decode != undefined) {
            score['TEST_PRIMARY_RESULT'] = decode.DECODE;
            score['TEST_PRIMARY_RESULT_CODE'] = decode.AS_NUMBER;
            score['TEST_PASSED_INDICATOR'] = decode.PASS_IND;
        }

        return score;
    }

    function mapSubCategoryScore(row, testMetadata) {
        var score = {};
        var grade = _util.coalesce(row.getField("ENROLLED_GRADE"), 'NA');

        if (grade != null && grade.length < 2) {
            grade = '0' + grade;
        }

        var testNumber = testMetadata.TEST + grade + '_' + testMetadata.CODE;
        var scaleScore = _util.coalesce(row.getField('SUBCATEGORY_-_' + testMetadata.FIELD + 'SCALE_SCORE'));
        var standardError = _util.coalesce(row.getField('SUBCATEGORY_-_STANDARD_ERROR_FOR_' + testMetadata.FIELD + 'SCALE_SCORE'));
        var performanceCategory = _util.coalesce(row.getField('SUBCATEGORY_-_' + testMetadata.FIELD + 'PERFORMANCE_CATEGORY'));

        if (scaleScore === null || scaleScore === undefined || scaleScore == "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (scaleScore !== 'NA' && scaleScore !== 'N/A') {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (standardError !== 'NA' && standardError !== 'N/A') {
            score["TEST_STANDARD_ERROR"] = standardError;
        }

        score["TEST_SCORE_TEXT"] = scaleScore;

        if (performanceCategory != null && performanceCategory != undefined) {
            score['TEST_PRIMARY_RESULT'] = performanceCategory;
        }

        return score;
    }

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

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }
        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());