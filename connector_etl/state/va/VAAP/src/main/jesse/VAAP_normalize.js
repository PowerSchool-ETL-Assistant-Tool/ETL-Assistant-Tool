var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "vaap";
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
          { TEST: "VAAP", MAP_FUNCTION: mapScore }
         ,{TEST: "VAAP", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "1", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VAAP", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "2", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VAAP", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "3", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VAAP", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "4", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VAAP", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "5", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VAAP", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "6", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VAAP", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "7", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VAAP", CODE: "TEST", FIELD:"TEST",FIELD_2: "", MAP_FUNCTION: mapReportingScore}
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
          "1": "Advanced"
        , "2": "Proficient"
        , "3": "Does Not Meet Proficiency"
        , "9": "No Score (NS)"
        , "": null
        , null: null
    };

    var passDecode = {
        "1": "Yes"
        , "2": "Yes"
        , "3": "No"
        , "9": null
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
        scoresToMap.forEach(function (tmd) {
            try {
                var score = (tmd.MAP_FUNCTION)(row, tmd);

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
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getDateString(
                        _util.coalesce(row.getField("TEST_DAY"), null),
                        _util.coalesce(row.getField("TEST_MONTH"), null),
                        _util.coalesce(row.getField("TEST_YEAR"), null)
                    );
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(
                        row.getField("STUDENT_ID"),
                        row.getField("STUDENT_NUMBER")
                        , row.getField("UIN")
                        , row.getField("UUID")
                    );
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STATE_TESTING_IDENTIFIER_STI")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STUDENT_ID")
                        , row.getField("UIN")
                        , row.getField("UUID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(
                        row.getField('STUDENT_FIRST_NAME')
                        , row.getField('FIRST_NAME')
                    );
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(
                        row.getField('STUDENT_LAST_NAME')
                        , row.getField('LAST_NAME')
                    );
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(
                        row.getField('STUDENT_MIDDLE_NAME')
                        , row.getField('MIDDLE_INITIAL')
                    );
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(row.getField("DOB_MONTH"), '');
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(row.getField("DOB_DAY"), '');
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(row.getField("DOB_YEAR"), '');
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL_VENDOR_ID"),
                        row.getField("SCHOOL_LOCAL_ID"),
                        row.getField("SCHOOL_STATE_ID"),
                        row.getField("SCHOOL_NAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOL_NUMBER")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("SCHOOL_NUMBER")
                        , row.getField("SCHOOL_CODE")
                    );
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
        return {};
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScore(row, tmd) {
        let score = {};
        var testName = _util.coalesce(row.getField('TEST_MINI_NAME'), row.getField('TEST_NAME'))
        if(testName !== null && testName !== "" && testName !== undefined){
            var tmn = testName;
        }
        let testNumber = getTestNumber(tmd, tmn, gradeDecode[row.getField('GRADE')]);
        let scoreValue = _util.coalesce(row.getField('SUBJECT_WEIGHTED_SCORE'),row.getField('TEST_SCALED_SCORE'));

        // Do not map if there is no score value
        if (!scoreValue) {
            return null;
        }

        let performanceScore = row.getField('PERFORMANCE_LEVEL');

        if (performanceScore === null || performanceScore === undefined || _util.trim(performanceScore) === "--" || _util.trim(performanceScore) === "") {
            // Either calculate the performanceScore or return null
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scoreValue;

        if (!isNaN(scoreValue)) {
            score["TEST_SCORE_VALUE"] = scoreValue;
            score["TEST_SCALED_SCORE"] = scoreValue;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = performanceScore;
        score["TEST_PASSED_INDICATOR"] = passDecode[performanceScore];
        score["TEST_PRIMARY_RESULT"] = primaryDecode[performanceScore];

        return score;
    }

   function mapReportingScore(row, testMetadata,tmd) {

        var score = {}
        var testNumber = null;
        var scaleScore = null;
        var tmn = _util.coalesce(row.getField('TEST_MINI_NAME'), row.getField('TEST_NAME'))
        if(tmn !== null && tmn !== "" && tmn !== undefined){
            var testName = tmn;
        }
        var subName=null;
        if (testName.indexOf('Reading') !== -1) {
             subName = 'READ';
        } else if (testName.indexOf('Writing') !== -1) {
             subName = 'WRIT';
        } else if (testName.indexOf('Hist/Soc') !== -1) {
             subName =  'HIST';
        } else if (testName.indexOf('Science') !== -1) {
             subName = 'SCI';
        } else if (testName.indexOf('Mathematics') !== -1) {
             subName = 'MATH';
        }

        if(testMetadata.CODE === "RPT") {
            testNumber =  testMetadata.TEST + "_" + subName +"_"+testMetadata.CODE+ "_" + testMetadata.FIELD_2;
            scaleScore =row.getField(testMetadata.FIELD +"_UNWEIGHTED_SCORE_"+ testMetadata.FIELD_2);
        }
        else if (testMetadata.CODE === "TEST") {
            testNumber =  testMetadata.TEST + "_"+ subName +"_"+ testMetadata.CODE;
            scaleScore = row.getField(testMetadata.FIELD +"_UNWEIGHTED_SCORE");

        }

        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                return null;
        }

       score["TEST_NUMBER"] = testNumber;
       score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
          score["TEST_SCORE_VALUE"] = scaleScore;
          score["TEST_SCALED_SCORE"] = scaleScore;

          return score;
        }
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

    function getTestNumber(tmd, tmn, grade) {
        let testNumber = '';
        let testCode = '';
        if (tmn) {
            if (tmn.indexOf('Reading') !== -1) {
                testCode = 'G_' + grade + '_READ';
            } else if (tmn.indexOf('Writing') !== -1) {
                testCode = 'G_' + grade + '_WRIT';
            } else if (tmn.indexOf('Hist/Soc') !== -1) {
                testCode = 'G_' + grade + '_HIST';
            } else if (tmn.indexOf('Science') !== -1) {
                testCode = 'G_' + grade + '_SCI';
            } else if (tmn.indexOf('Mathematics') !== -1) {
                testCode = 'G_' + grade + '_MATH';
            }
        }
        testNumber = tmd.TEST + '_' + testCode;
        return testNumber;
    }

    function getDateString(day, month, year) {
        let dateString = null;
        if (day && month && year) {
            month = ("0" + month).slice(-2);
            day = ("0" + day).slice(-2);
            dateString = AppUtil.getDateObjByPattern(month + '/' + day + '/' + year, "MM/dd/yyyy").STANDARD_DATE;
        }
        return dateString;
    }

    return module;
 }());