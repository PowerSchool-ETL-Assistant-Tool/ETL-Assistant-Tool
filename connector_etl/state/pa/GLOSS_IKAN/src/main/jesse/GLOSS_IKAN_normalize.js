var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "GLOSS_IKON";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
    var multipleRowsPerGroupingExpected = false;

    var months = [
        "JAN",
        "FEB",
        "MAR",
        "APR",
        "MAY",
        "JUNE",
        "JULY",
        "AUG",
        "SEP",
        "OCT",
        "NOV",
        "DEC"
    ];
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
        { TEST: "GLOSS",CODE: "SEP", MAP_FUNCTION: mapOverallScore },
        { TEST: "GLOSS",CODE: "DEC", MAP_FUNCTION: mapOverallScore },
        { TEST: "GLOSS",CODE: "MAR", MAP_FUNCTION: mapOverallScore },
        { TEST: "GLOSS",CODE: "JUNE", MAP_FUNCTION: mapOverallScore },

        { TEST: "IKAN",CODE: "SEP", MAP_FUNCTION: mapOverallScore },
        { TEST: "IKAN",CODE: "DEC", MAP_FUNCTION: mapOverallScore },
        { TEST: "IKAN",CODE: "MAR", MAP_FUNCTION: mapOverallScore },
        { TEST: "IKAN",CODE: "JUNE", MAP_FUNCTION: mapOverallScore }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
        "1": "01"
        , "01": "01"
        , "2": "02"
        , "02": "02"
        , "3": "03"
        , "03": "03"
        , "4": "04"
        , "04": "04"
        , "5": "05"
        , "05": "05"
        , "6": "06"
        , "06": "06"
        , "7": "07"
        , "07": "07"
        , "8": "08"
        , "08": "08"
        , "0": "KG"
        , null: null
        , "": null
    };

    var decodeStageScore = {
        "0": "0"
        , "1": "1"
        , "2": "2"
        , "3": "3"
        , "4": "4"
        , "5": "5"
        , "6": "6"
        , "7": "7"
        , "8": "8"
        , "E1": "0.5"
        , "E2": "1.5"
        , "E3": "2.5"
        , "E4": "3.5"
        , "E5": "4.5"
        , "E6": "5.5"
        , "E7": "6.5"
        , "E8": "7.5"
        , null: null
        , "": null
    };

    var decodeStageText = {
        "0": "Emergent"
        , "1": "One to One Counting"
        , "2": "Counting from One on Materials"
        , "3": "Counting from One by Imaging"
        , "4": "Advanced Counting"
        , "5": "Early Additive Part - Whole Thinking"
        , "6": "Advanced Additive Part - Whole Thinking"
        , "7": "Advanced Multiplicative Part - Whole"
        , "8": "Advanced Proportional Part - Whole"
        , "E1": "Emergent"
        , "E2": "One to One Counting"
        , "E3": "Counting from One on Materials"
        , "E4": "Counting from One by Imaging"
        , "E5": "Advanced Counting"
        , "E6": "Early Additive Part - Whole Thinking"
        , "E7": "Advanced Additive Part - Whole Thinking"
        , "E8": "Advanced Multiplicative Part - Whole"
        , null: null
        , "": null
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
        // Map a normalized record for different period
        months.forEach(function(period){
            var record = mapNormalizedRecord(signature, hierarchy, row, period);
            AppUtil.nullSafePush(normalizedRecords, record);
        });

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
    function mapNormalizedRecord(signature, hierarchy, row, period) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, period);


        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, period);

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
     function periodParse(hierarchy, period){
        var adminDate = null;
        if(period === "JAN"){
            adminDate = "01/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        } else if(period === "FEB"){
            adminDate = "02/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        } else if(period === "MAR"){
            adminDate = "03/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
        } else if(period === "APR"){
            adminDate = "04/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        } else if(period === "MAY"){
            adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        } else if(period === "JUNE"){
            adminDate = "06/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        } else if(period === "JULY"){
            adminDate = "07/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        } else if(period === "AUG"){
            adminDate = "08/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}";
        } else if(period === "SEP"){
            adminDate = "09/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}";
        } else if(period === "OCT"){
            adminDate = "10/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}";
        } else if(period === "NOV"){
            adminDate = "11/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}";
        } else if(period === "DEC"){
            adminDate = "12/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}";
        }
        return adminDate;
     }

    /**
     * Maps normalized administration fields based on a given set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     */

    function mapNormalizedAdminFields(signature, hierarchy, row, period) {
        try {
            var record = {};
            var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

            var adminDate = periodParse(hierarchy, period);
            var testAdminPeriod = null;

            if (period === "AUG" || period === "SEP" || period === "OCT" || period === "NOV"){
                testAdminPeriod = "FALL";
            } else if (period === "DEC" || period === "JAN" || period === "FEB" || period === "MAR"){
                testAdminPeriod = "WINTER";
            } else if (period === "APR" || period === "MAY" || period === "JUNE" || period === "JULY"){
                testAdminPeriod = "SPRING";
            }

            normalizedFileFields.forEach(function (field) {
                switch (field) {
                    case "ASSESSMENT_ADMIN_KEY":
                        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, period);
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
                        record.REPORTING_PERIOD = testAdminPeriod;
                        break;
                    case "ASSESSMENT_VENDOR":
                        record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                        break;
                    case "ASSESSMENT_PRODUCT":
                        record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                        break;
                    case "TEST_ADMIN_DATE":
                        record.TEST_ADMIN_DATE =  _util.coalesce(adminDate, "06/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9));
                        break;
                    case "SCHOOL_VENDOR_ID":
                        record.SCHOOL_VENDOR_ID = _util.coalesce("DISTRICT");
                        break;
                    case "SCHOOL_LOCAL_ID":
                        record.SCHOOL_LOCAL_ID = _util.coalesce("DISTRICT");
                        break;
                    case "SCHOOL_NAME":
                        record.SCHOOL_NAME = _util.coalesce("DISTRICT");
                        break;
                    case "STUDENT_STATE_ID":
                        record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                        break;
                    case "STUDENT_VENDOR_ID":
                        record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                        break;
                    case "STUDENT_LOCAL_ID":
                        record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
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
    function mapOverallScore(row, testMetadata, period) {

        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var testSplit = testNumber.split("_")[1];
        if(testSplit === period){
            var scoreField = row.getField(testMetadata.TEST + '_' + testMetadata.CODE);
        } else{
            return null;
        }

        // Check for key fields and do not map score and exit if conditions met.
        if (scoreField === null || scoreField === undefined || _util.trim(scoreField) === "--" || _util.trim(scoreField) === "") {
            return null;
        }

        var stageScaleScore = scoreField.split(' ')[1];

        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = stageScaleScore;

        if (!isNaN(stageScaleScore)) {
            score["TEST_SCALED_SCORE"] = stageScaleScore;
        }

        score["TEST_PRIMARY_RESULT"] = scoreField;

        var stageDecodeAsNumber = decodeStageScore[stageScaleScore];

        score["TEST_SECONDARY_RESULT_CODE"] = stageDecodeAsNumber;

        var decodedStageScoreText = decodeStageText[stageScaleScore];

        score["TEST_SECONDARY_RESULT"] = decodedStageScoreText;

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
            // Sending different periods to generate assessment admin key
            for(var i=0; i<months.length; i++) {
                var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, months[i]);
                var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, months[i]);
                if(assessmentAdminKey_one === assessmentAdminKey_two) {
                    return 1;
                } else {
                    return -1;
                }
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, period) {

        var prodIdIdentifier = '';

        if (signature.getFormat().getFormatName() === 'GLOSS') {
            prodIdIdentifier = 'GLOSS';
        } else if (signature.getFormat().getFormatName() === 'IKAN'){
            prodIdIdentifier = 'IKAN';
        }

        var assessmentAdminKey = `${prodIdIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}`;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key), ""));
        });

        return assessmentAdminKey;
    }


    function generateTestNumber(row, testMetadata) {

        var grade = gradeDecode[row.getField("GRADE")];

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + grade;

        return testNumber;

    }

    return module;


}());