var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AZSCI";
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

    var scoresToMap = [
        { TEST: "AZSCI", CODE: "SCI_", FIELD: "Science", MAP_FUNCTION: mapOverall }
        ,
        { TEST: "AZSCI", CODE: "PS_", FIELD: "Physical Science", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZSCI", CODE: "ES_", FIELD: "Earth and Space Science", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZSCI", CODE: "LS_", FIELD: "Life Science", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZSCI", CODE: "IP_", FIELD: "Investigating Practices", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZSCI", CODE: "SP_", FIELD: "Sensemaking Practices", MAP_FUNCTION: mapScaledScore },
        { TEST: "AZSCI", CODE: "CP_", FIELD: "Critiquing Practices", MAP_FUNCTION: mapScaledScore }
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
        "Kindergarten": "KG"
        , "": null
        , null: null
    };

    var primaryDecode = {
          "1": { DESC:"Below Mastery", PASS_IND: "No"}
        , "2": { DESC:"At or Around Mastery", PASS_IND: "No"}
        , "3": { DESC:"Above Mastery", PASS_IND: "Yes"}
        , "": { DESC:null, PASS_IND: null}
        , null: { DESC:null, PASS_IND: null}
    };

    var primaryOverallDecode = {
          "1": { DESC:"Minimally proficient"}
        , "2": { DESC:"Partially Proficient"}
        , "3": { DESC:"Proficient"}
        , "4": { DESC:"Highly Proficient"}
        , "": { DESC:null, PASS_IND: null}
        , null: { DESC:null, PASS_IND: null}
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        if (row.getField("BIRTH_DATE") !== null) {
            var birthDate = _util.trim(row.getField("BIRTH_DATE"));
            if (birthDate.length <= 4) {
                var birthDateObject = {
                    RAW_DATE: null
                    , MONTH: null
                    , DAY: null
                    , YEAR: null
                    , STANDARD_DATE: null
                };
            }

            else if (birthDate.length == 7) {
                var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "Mddyyyy");
            }
            else if (birthDate.length == 5) {
                var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "Mddyy");
            }
            else if (birthDate.length == 6) {
                var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MMddyy");
            }
            else {
                var birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MMddyyyy");
            }

        }

        var period = getASSESSMENT_PERIOD(row);
        var schoolYear = _util.coalesce(hierarchy.SCHOOL_YEAR);
        var testDateObj = {};

        if (period == 'FALL')
            testDateObj = AppUtil.getDateObjByPattern('09/15/' + schoolYear.substring(0, 4), 'MM/dd/yyyy');
        else if (period == 'WINTER')
            testDateObj = AppUtil.getDateObjByPattern('01/15/' + schoolYear.substring(5, 9), 'MM/dd/yyyy');
        else if (period == 'SPRING')
            testDateObj = AppUtil.getDateObjByPattern('05/15/' + schoolYear.substring(5, 9), 'MM/dd/yyyy');

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
                    record.REPORTING_PERIOD = _util.coalesce(getASSESSMENT_PERIOD(row),hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObj.STANDARD_DATE;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("SSID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("SSID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("SSID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField("MI");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = getTEST_STUDENT_GRADE(row, hierarchy);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField('SCH_ENTITY'));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField('SCH_ENTITY'));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField('SCH_ENTITY'));
                    break;
                case "SCHOOL_NAME":
                   record.SCHOOL_NAME = _util.coalesce(row.getField("SCH_NAME"));
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

        if (row.getField("ENG_LEARNER") === "1" || row.getField("ENG_LEARNER") === "2") {
            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        }
        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

     //FIELD FUNCTIONS
    function getTEST_STUDENT_GRADE(row, hierarchy) {
        try {
            var gradeCode = _util.trim(_util.coalesce(row.getField('GRADE_OF_TEST'), row.getField('GRADE'), ''));
            if ((gradeCode == null) || (gradeCode == '')) {
                var schoolYear = _util.coalesce(hierarchy.SCHOOL_YEAR);
                var gradeCohort = _util.trim(_util.coalesce(row.getField('COHORT')));
                var period = getASSESSMENT_PERIOD(row);
                if (gradeCohort == null || gradeCohort == '' || schoolYear == null || schoolYear == '' || period == null || period == '')
                    return null;
                if (period == gradeCohort)
                    return gradeCode = '12';
                if (gradeCohort == '8' || gradeCohort == '9')
                    gradeCohort = '0' + gradeCohort;
                return gradeCode = parseInt(12 + (parseInt(schoolYear.substring(5, 9)) - parseInt('20' + gradeCohort)));
            } else {
                if (gradeCode == '3' || gradeCode == '4' || gradeCode == '5' || gradeCode == '6' || gradeCode == '7' || gradeCode == '8' || gradeCode == '9')
                    return gradeCode = '0' + gradeCode;
            }
            return gradeCode;
        }
        catch (e) {
            print(e)
        }
    }

    function getASSESSMENT_PERIOD(row) {
        var seasonCode = row.getField('SEASON');

        if (seasonCode == 'FA')
            return 'FALL';
        else if (seasonCode == 'WI')
            return 'WINTER';
        else if (seasonCode == 'SP')
            return 'SPRING';
        else
            return ALL;
    }
    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapOverall(row, testMetadata, signature) {
        var score = {};
        var grade = row.getField("GRADE_OF_TEST");

        var scaleScore = row.getField(testMetadata.CODE + "SCALE_SCORE");
        var rawScore = row.getField(testMetadata.CODE + "RAW_SCORE");
        var achievLevel = row.getField(testMetadata.CODE + "PERF_LVL");
        var pointsPossible = row.getField(testMetadata.CODE + "PTS_POSS");
        var passedIndicator = row.getField(testMetadata.CODE + "P/F");

        var passFail;
        if (passedIndicator == 'P')
            passFail = 'Yes';
        else if (passedIndicator == 'F')
            passFail = 'No';
        else
            passFail = null;

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

            if (grade === null) {
                // Check if signature format is "AZSCI_SPRING_COL221" and grade is null
                if (signature.getFormat().getFormatName() === "AZSCI_SPRING_COL221") {
                    // Generate testNumber without grade
                    var testNumber = testMetadata.TEST + "_" + testMetadata.CODE.replace("_", "");
                } else {
                    return null; // If grade is null and it's not the desired signature format, exit
                }
            } else {
                // When grade is not null, use the gradeDecode to get the testNumber
                var testNumber = testMetadata.TEST + testMetadata.CODE + gradeDecode[grade];
            }


        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_PASSED_INDICATOR"] = passFail;
        score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
        score["TEST_PRIMARY_RESULT"] = primaryOverallDecode[achievLevel].DESC;

        if (!isNaN(pointsPossible)) {
            score["TEST_ITEMS_POSSIBLE"] = _util.trim(pointsPossible);
        }
        return score;
    }

    function mapScaledScore(row, testMetadata, signature) {
        var score = {};
        var grade = row.getField("GRADE_OF_TEST");

        var scaleScore = row.getField(testMetadata.CODE + "SCALE_SCORE");
        var rawScore = row.getField(testMetadata.CODE + "RAW_SCORE");
        var achievLevel = row.getField(testMetadata.CODE + "PERF_LVL");
        var pointsPossible = row.getField(testMetadata.CODE + "PTS_POSS");

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
            if (grade === null) {
                // Check if signature format is "AZSCI_SPRING_COL221" and grade is null
                if (signature.getFormat().getFormatName() === "AZSCI_SPRING_COL221") {
                    // Generate testNumber without grade
                    var testNumber = testMetadata.TEST + "_" + testMetadata.CODE.replace("_", "");
                } else {
                    return null; // If grade is null and it's not the desired signature format, exit
                }
            } else {
                // When grade is not null, use the gradeDecode to get the testNumber
                var testNumber = testMetadata.TEST + testMetadata.CODE + gradeDecode[grade];
            }



        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
        score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = primaryDecode[achievLevel].PASS_IND;


        if (!isNaN(pointsPossible)) {
            score["TEST_ITEMS_POSSIBLE"] = _util.trim(pointsPossible);
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