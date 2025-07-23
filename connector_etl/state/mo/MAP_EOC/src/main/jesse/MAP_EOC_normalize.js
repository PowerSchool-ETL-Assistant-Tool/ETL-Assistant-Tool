var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MAP_EOC";
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


    var scoresToMap = [
        { TEST: "MAP_EOC", CODE: "EOC", MAP_FUNCTION: mapScaledScore },
        { TEST: "MAP_EOC", MAP_FUNCTION: mapOverallScaledScore },
        {TEST: "MAP_EOC", CODE:"1", FIELD: "REPORTING_CATEGORY_SCORES_", MAP_FUNCTION: mapScore},
        {TEST: "MAP_EOC", CODE:"2", FIELD: "REPORTING_CATEGORY_SCORES_", MAP_FUNCTION: mapScore},
        {TEST: "MAP_EOC", CODE:"3", FIELD: "REPORTING_CATEGORY_SCORES_", MAP_FUNCTION: mapScore},
        {TEST: "MAP_EOC", CODE:"4", FIELD: "REPORTING_CATEGORY_SCORES_", MAP_FUNCTION: mapScore},
        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

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
        "Grade 8": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "10": "10",
        "Grade 10": "10",
        "11": "11",
        "Grade 11": "11",
        "12": "12",
        "Grade 12": "12",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG",
        "E1": "E1",
        "E2": "E2",
        "A1": "A1",
        "A2": "A2",
        "GE": "GE",
        "B1": "B1",
        "AH": "AH",
        "GV": "GV"
        , "": null
        , null: null
    };

    var primaryDecode = {
        "Advanced": "Adv"
        , "Basic": "Bas"
        , "Below Basic": "BB"
        , "Proficient": "Prof"
        , "68.43% Proficient or Advanced": null
        , "Level Not Determined": "LOD"
        , "LOSS": "LOSS"
        , "": null
        , null: null
    };

      var performanceLevelDecode = {
        "Advanced" : { DESC:"Adv", PASS_IND: "Yes" , LEVEL_CODE: "5"}
        ,"Basic" : { DESC:"Bas", PASS_IND: "No", LEVEL_CODE: "3"}
        ,"Below Basic" : { DESC:"BB", PASS_IND: "No", LEVEL_CODE: "2"}
        ,"Proficient" : { DESC:"Prof", PASS_IND: "Yes", LEVEL_CODE: "4"}
        ,"" : { DESC: null, PASS_IND: null, LEVEL_CODE: null}
        ,null : { DESC: null, PASS_IND: null, LEVEL_CODE: null}
      };

    var passDecode = {
        "Advanced": "Yes"
        , "Basic": "No"
        , "Below Basic": "No"
        , "Proficient": "Yes"
        , "68.43% Proficient or Advanced": null
        , "Level Not Determined": "No"
        , "LOSS": "No"
        , "": null
        , null: null
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
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = row.getField("STUDENT_BIRTHDATE");
        var birthDate = null;

        if (birthDateObject !== null && birthDateObject.indexOf("-") >= 1) {
            birthDate = AppUtil.getDateObjByPattern(birthDateObject, "yyyy-MM-dd");
        }
        else if (birthDateObject !== null && birthDateObject.indexOf("/") >= 1) {
            birthDate = AppUtil.getDateObjByPattern(birthDateObject, "MM/dd/yyyy");
        }
        else if (birthDateObject !== null){
            birthDate = AppUtil.getDateObjByPattern(birthDateObject, "MMddyy");
        }
        else {
            birthDate = "null";
        }

        var testDateObj = row.getField("TEST_DATE");
        var testDate = null;
        if (testDateObj !== null) {
                    testDate = AppUtil.getDateObjByPattern(testDateObj, "MMddyy").STANDARD_DATE;
        }

        function removeAlphaChar(value){

           if(value === undefined || value === null) {
                return null;
           }

            if((/[a-zA-Z]/g.test(value))){
                value = value.replace(/[a-zA-Z]/g, '').trim();
            }

            return value;
        }


        const PERIOD_INFO = (() => {
            let term = row.getField("ADMINISTRATION");
            let period = '';
            let year = '';
            if (term && signature.getFormat().getFormatName() === "EOC_ALL") {
                   let parts = term.split(' ');
                    if (!isNaN(parts[0]) && parts[0].length === 4) {
                        year = parts[0];
                        period = parts[1].toUpperCase();
                     } else {
                         period = parts[0].toUpperCase();
                         year = parts[1];
                      }
            } else if (term && signature.getFormat().getFormatName() === "EOC_21_ALL") {
                year = term.split(' ')[0];
                period = term.split(' ')[1].toUpperCase();

            }
            else {
                period = hierarchy.REPORTING_PERIOD.toUpperCase();
                year = hierarchy.SCHOOL_YEAR.substring(0, 4);
            }
            return {
                period: period,
                year: year
            }
        })();

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
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = PERIOD_INFO.period;
                     //record.REPORTING_PERIOD = _util.coalesce(row.getField("ADMINISTRATION_WINDOW"),PERIOD_INFO.period);  // as per client 'ADMINISTRATION_WINDOW' column should not be considered
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDate, getTestAdminDate(PERIOD_INFO.year, PERIOD_INFO.period));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(removeAlphaChar(row.getField("STUDENT_NUMBER")), row.getField("DISTRICT_STUDENT_ID"),row.getField("STUDENT_STATE_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_STATE_ID")

                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_STATE_ID")

                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDate.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDate.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDate.YEAR, null);
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
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

        var admin = {};

        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var subject = row.getField("SUBJECT_NAME");
        var subName;

        if (subject === 'Algebra I') {
            subName = 'ALG';
        } else if (subject === 'Biology') {
            subName = 'BIO';
        } else if (subject === 'English II') {
            subName = 'ENG';
        } else if (subject === 'English Language Arts'  || subject === 'English Lanugage Arts') {
            subName = 'ELA';
        } else if (subject === 'Science') {
            subName = 'SCI';
        } else if (subject === 'Mathematics') {
            subName = 'MAT';
        } else if (subject === 'Government') {
             subName = 'SS';
        } else {

            return null;
        }
        var testNumber = testMetadata.TEST + "_" + subName;
        var scaleScore = row.getField("SCALE_SCORE");
        var performanceLevel = row.getField("PERFORMANCE_LEVEL");

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performanceLevel];
        score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
        score["TEST_RAW_SCORE"] = row.getField("RAW_SCORE");
        score["TEST_ITEMS_POSSIBLE"] = row.getField("POINTS_POSSIBLE");
        score["TEST_ITEMS_ATTEMPTED"] = row.getField("POINTS_EARNED");
        score["TEST_PERCENTAGE_SCORE"] = row.getField("PERCENT_POINTS_EARNED");

        return score;
    }


    function mapScore(row, testMetadata) {
        var score = {};
        var subject = row.getField("SUBJECT_NAME");
        var subName;

        if (subject === 'Algebra I') {
            subName = 'ALG';
        } else if (subject === 'Biology') {
            subName = 'BIO';
        } else if (subject === 'English II') {
            subName = 'ENG';
        } else if (subject === 'English Language Arts' || subject === 'English Lanugage Arts') {
            subName = 'ELA';
        } else if (subject === 'Science') {
            subName = 'SCI';
        } else if (subject === 'Mathematics') {
            subName = 'MAT';
        } else if (subject === 'Government') {
             subName = 'SS';
        } else {

            return null;
        }
        var testNumber = testMetadata.TEST + "_" + subName + "_RC_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + testMetadata.CODE);

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        return score;
    }

    function testType(row) {
        var testName = row.getField("TEST_NAME");
        if (testName == null) {
            return null;
        }

        var test = _util.trim(testName).toUpperCase();
        var test1 = null;

        if (test === 'MAP') {
            test1 = 'MAP';
        } else if (test === 'EOC') {
            test1 = 'EOC';
        } else if (test === 'MAPA') {
            test1 = 'MAPA';
        }

        return test1;
    }



    function mapOverallScaledScore(row, testMetadata) {
        var score = {};
        var testTypeValue = testType(row);
        var subjectName = getSubjectName(row);
        if (testTypeValue === 'MAPA' && subjectName != null) {
                testNumber = "${testMetadata.TEST}_MAPA_${subjectName}";
            } else if (testTypeValue != null && subjectName != null) {
                testNumber = "${testMetadata.TEST}_${testTypeValue}_${subjectName}";
            } else {
                return null; // Return null to indicate invalid test number
            }
        var scaleScore = null;

        if (testTypeValue) {
            if (testTypeValue === 'MAP') {
                scaleScore = parseFloat(row.getField("SCALE_SCORE"));
            } else if (testTypeValue === 'EOC') {
                scaleScore = parseFloat(row.getField("EOC_SCORE")); //MAPA has not been added as there is no scoring column to attribute it to.
            } else {
                return null;
            }
        }
        var performanceLevel = _util.trim(row.getField("PERFORMANCE_LEVEL"));
        var totalRawScore = parseFloat(row.getField("EOC_RAW_SCORE"));
        var totalPercentCorrect = parseFloat(row.getField("EOC_TOTAL_PERCENT_CORRECT"));
        var ptValue = parseFloat(row.getField("CALCULATED_INDEX_PT_VALUE"));

        // Check for key fields and do not map score and exit if conditions met.
        if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
           (totalRawScore === null || totalRawScore === undefined || _util.trim(totalRawScore) === "--" || _util.trim(totalRawScore) === "") &&
           (totalPercentCorrect === null || totalPercentCorrect === undefined || _util.trim(totalPercentCorrect) === "--" || _util.trim(totalPercentCorrect) === "") &&
           (ptValue === null || ptValue === undefined || _util.trim(ptValue) === "--" || _util.trim(ptValue) === ""))

        {
           return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
            if (!isNaN(scaleScore)) {
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }



            if (performanceLevel) {
                score["TEST_PRIMARY_RESULT"] = performanceLevel;
                score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelDecode[performanceLevel].DESC;
                score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[performanceLevel].PASS_IND;
                score["TEST_CUSTOM_RESULT_CODE"] = performanceLevelDecode[performanceLevel].LEVEL_CODE;
            }

            if (!isNaN(totalRawScore)) {
                score["TEST_RAW_SCORE"] = totalRawScore;
            }

            if (!isNaN(totalPercentCorrect)) {
                score["TEST_ITEMS_POSSIBLE"] = totalPercentCorrect;
            }

            if (!isNaN(ptValue)) {
            score["TEST_PERCENTAGE_SCORE"] = ptValue;
            }
        return score;
    }

    function getSubjectName(row) {
        var contentArea = _util.coalesce(row.getField("CONTENT_AREA"), row.getField("SUBJECT_NAME"));
        if (contentArea == null) {
            return null;
        }

        var subjects = _util.trim(contentArea).toUpperCase();
        var subjName = subjects;
        if (subjects === 'ALGEBRA I') {
            subjName = 'ALG';
        } else if (subjects === 'BIOLOGY') {
            subjName = 'BIO';
        } else if (subjects === 'ENGLISH LANGUAGE ARTS' || subjects === 'ENG. LANGUAGE ARTS' || subjects === 'ENGLISH LANUGAGE ARTS') {
            subjName = 'ELA';
        } else if (subjects === 'SCIENCE') {
            subjName = 'SCI';
        } else if (subjects === 'MATHEMATICS') {
            subjName = 'MAT';
        } else if (subjects === 'SOCIAL STUDIES' || subjects === 'GOVERNMENT') {
            subjName = 'SS';
        }
        return subjName;
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


        var subject = getSubjectName(srcRecord);

        if (signature.getFormat().getFormatName() === "MAP_EOC_113_COLS_DELIMITED" || signature.getFormat().getFormatName() === "EOC_ALL") {
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

            //Null Check
            if (subject != null) {
                assessmentAdminKey += "_" + subject;
            }
        }


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    function getTestAdminDate(year, period) {
        let testAdminDate = null, testAdminDateObj = AppUtil.getEmptyDateObj();
        if (period === 'WINTER') {
            testAdminDate = '01/15/' + year;
        } else if (period === 'SPRING') {
            testAdminDate = '05/15/' + year;
        } else if (period === 'FALL') {
            testAdminDate = '09/15/' + (parseInt(year) - 1);
        } else {
            //Unknown
            testAdminDate = '05/15/' + year;
        }
        testAdminDateObj = AppUtil.getDateObjByPattern(testAdminDate, "MM/dd/yyyy");
        return testAdminDateObj.STANDARD_DATE;
    }

    return module;
}());