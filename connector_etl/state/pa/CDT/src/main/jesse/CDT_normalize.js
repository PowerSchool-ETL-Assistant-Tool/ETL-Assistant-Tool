var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CDT";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
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
            print(`Loading using signature file ${signatureFormatName}\n`);

            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();

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
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function (output, rows) {
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
    var scoresToMap = [
        { TEST: "CDT",CODE: "TOTAL", MAP_FUNCTION: mapScaleScore },
        { TEST: "CDT",CODE: "DC1", MAP_FUNCTION: mapScaleScore },
        { TEST: "CDT",CODE: "DC2", MAP_FUNCTION: mapScaleScore },
        { TEST: "CDT",CODE: "DC3", MAP_FUNCTION: mapScaleScore },
        { TEST: "CDT",CODE: "DC4", MAP_FUNCTION: mapScaleScore },
        { TEST: "CDT",CODE: "DC5", MAP_FUNCTION: mapScaleScore }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
        "KG" : "KG"
        , "1": "01"
        , "01": "01"
        , "2": "02"
        , "02": "02"
        , "3" : "03"
        , "03": "03"
        , "4": "04"
        , "04": "04"
        , "'04": "04"
        , "5": "05"
        , "05": "05"
        , "'05": "05"
        , "6": "06"
        , "06": "06"
        , "'06": "06"
        , "7": "07"
        , "07": "07"
        , "'07": "07"
        , "8": "08"
        , "08": "08"
        , "'08": "08"
        , "9": "09"
        , "09": "09"
        , "'09": "09"
        , "10": "10"
        , "11": "11"
        , "12": "12"
        , null: null
        , "": null
    };

    var decodeAssessmentSubject = {
        "Algebra I": "ALGI"
        ,"Biology": "BIO"
        ,"Reading/Lit Grades 6-HS": "LIT"
        ,"Math Grades 6-8" : "MATH"
        ,"Math Grades 3-5" : "MATH"
        ,"Writing/Eng Comp Gr 6-HS" : "WRIT"
        ,"Reading Grades 3-5" : "RD"
        ,"Geometry" : "GEO"
    }

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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

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
        try {
            var record = {};
            var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

            var birth = row.getField("DOB");

            if(birth.toString().length==7){
               birth = "0"+birth;
            }

           var birthDateObject = AppUtil.getDateObjByPattern(birth, "MMddyyyy");

           var testEndDate = row.getField("TEST_END_DATE");

           if (testEndDate !== null && testEndDate !== undefined && testEndDate !== "") {
               testEndDate = testEndDate.split(' ')[0];
               testEndDate = AppUtil.getMonthFollowedByDay(testEndDate, "MM/dd/yyyy").STANDARD_DATE;
           }

            normalizedFileFields.forEach(function (field) {
                switch (field) {
                    case "ASSESSMENT_ADMIN_KEY":
                        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                        break;
                    case "SYS_PARTITION_VALUE":
                        record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                        break;
                    case "DISTRICT_CODE":
                        record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                        break;
                    case "SCHOOL_YEAR":
                        record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                        break;
                    case "REPORTING_PERIOD":
                        record.REPORTING_PERIOD = _util.coalesce(getTestAdminPeriod(testEndDate) ,hierarchy.REPORTING_PERIOD);
                        break;
                    case "ASSESSMENT_VENDOR":
                        record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                        break;
                    case "ASSESSMENT_PRODUCT":
                        record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                        break;
                    case "TEST_ADMIN_DATE":
                        record.TEST_ADMIN_DATE = testEndDate;
                        break;
                    case "SCHOOL_VENDOR_ID":
                        record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("DISTRICT_CODE"));
                        break;
                    case "SCHOOL_LOCAL_ID":
                        record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
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
                    case "STUDENT_STATE_ID":
                        record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"));
                        break;
                    case "STUDENT_VENDOR_ID":
                        record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                        break;
                    case "STUDENT_LOCAL_ID":
                        record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                        break;
                    case "STUDENT_GRADE_CODE":
                        record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
                        break;
                    default:
                        record[field] = row.getField(field);
                        break;
                }
            });
            return record;
        }
        catch (e) {
            print("mapNormalizedAdminFields issues" + e);
        }
    }

    function getTestAdminPeriod(testEndDate) {
        var testAdminPeriod = null;
        var month = testEndDate.substring(0,2);
        if( month === "08" || month === "09" || month === "10" || month === "11")
            testAdminPeriod = "Fall";
        else if(month === "12" || month === "01" || month === "02")
            testAdminPeriod = "Winter";
        else if(month === "03" || month === "04" || month === "05" || month === "06" || month === "07")
            testAdminPeriod = "Spring";
        return testAdminPeriod.toUpperCase();
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(admin, row) {
        return admin;
    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaleScore(row, testMetadata) {

        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);

        var scaleScore = row.getField(testMetadata.CODE + '_SCALE_SCORE');

        var lowerScaleScore = row.getField(testMetadata.CODE + '_SEM_LOWER_SCALE_SCORE');

        var upperScaleScore = row.getField(testMetadata.CODE + '_SEM_UPPER_SCALE_SCORE');

        var assessmentName = decodeAssessmentSubject[row.getField("ASSESSMENT_NAME")];

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (!isNaN(lowerScaleScore)) {
            score["TEST_LOWER_BOUND"] = lowerScaleScore;
        }

        if (!isNaN(upperScaleScore)) {
            score["TEST_UPPER_BOUND"] = upperScaleScore;
        }

        var test_primary_result_code = '';
        var test_primary_result = '';

        //Survey Docs - UIHN-30918
        if ((assessmentName === 'ALGI' && scaleScore >= 400 && scaleScore <= 1133) ||
        (assessmentName === 'BIO' && scaleScore >= 400 && scaleScore <= 1011) ||
        (assessmentName === 'LIT' && scaleScore >= 200 && scaleScore <= 1032)) {
            test_primary_result_code = 'Red';
            test_primary_result = 'Area of Need';
        } else if ((assessmentName === 'ALGI' && scaleScore >= 1134 && scaleScore <= 1296) ||
        (assessmentName === 'BIO' && scaleScore >= 1012 && scaleScore <= 1184) ||
        (assessmentName === 'LIT' && scaleScore >= 1033 && scaleScore <= 1247)) {
            test_primary_result_code = 'Green';
            test_primary_result = 'Approaching Grade Level';
        } else if ((assessmentName === 'ALGI' && scaleScore >= 1297 && scaleScore <= 2000) ||
        (assessmentName === 'BIO' && scaleScore >= 1185 && scaleScore <= 2000) ||
        (assessmentName === 'LIT' && scaleScore >= 1248 && scaleScore <= 2000)) {
            test_primary_result_code = 'Blue';
            test_primary_result = 'Exceeding Grade Level';
        }

        score["TEST_PRIMARY_RESULT_CODE"] = test_primary_result_code;
        score["TEST_PRIMARY_RESULT"] = test_primary_result;

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
            throw `${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}`;
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

        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;

        // Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key), ""));
        });

        // Add normalized test end date to the key
        var testEndDate = srcRecord.getField("TEST_END_DATE");
        if (testEndDate !== null && testEndDate !== undefined && testEndDate !== "") {
            testEndDate = testEndDate.split(' ')[0];
            testEndDate = AppUtil.getMonthFollowedByDay(testEndDate, "MM/dd/yyyy").STANDARD_DATE;
            assessmentAdminKey = assessmentAdminKey + "_" + testEndDate;
        }

        return assessmentAdminKey;
    }


    function generateTestNumber(row, testMetadata) {

        var grade = gradeDecode[row.getField("GRADE")];

        var subject = decodeAssessmentSubject[row.getField("ASSESSMENT_NAME")];

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + subject + "_" + grade;

        return testNumber;

    }

    return module;


}());