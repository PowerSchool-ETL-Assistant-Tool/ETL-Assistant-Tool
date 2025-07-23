var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "FSA_3_8";
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

            print("Loading using signature file ${signature.getFormat().getFormatName()}\n");

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


    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var scoresToMap = [
       {TEST: "FSA", CODE:"_EARN_1", FIELD: "EARN1_PTPOS1", MAP_FUNCTION: mapItemScore}
       ,{TEST: "FSA", CODE:"_EARN_2", FIELD: "EARN2_PTPOS2", MAP_FUNCTION: mapItemScore}
       ,{TEST: "FSA", CODE:"_EARN_3", FIELD: "EARN3_PTPOS3", MAP_FUNCTION: mapItemScore}
       ,{TEST: "FSA", CODE:"_EARN_4", FIELD: "EARN4_PTPOS4", MAP_FUNCTION: mapItemScore}
       ,{TEST: "FSA", CODE:"_EARN_5", FIELD: "EARN5_PTPOS5", MAP_FUNCTION: mapItemScore}
       ,{TEST: "FSA", CODE:"_EARN_WD1", FIELD: "EARN_WD1_PTPOS_WD1", MAP_FUNCTION: mapItemScore}
       ,{TEST: "FSA", CODE:"_EARN_WD2", FIELD: "EARN_WD2_PTPOS_WD2", MAP_FUNCTION: mapItemScore}
       ,{TEST: "FSA", CODE:"_EARN_WD3", FIELD: "EARN_WD3_PTPOS_WD3", MAP_FUNCTION: mapItemScore}
       ,{TEST: "FSA", CODE:"", FIELD: "", MAP_FUNCTION: mapScaledScore}
    ];


    const SUBJECT_DECODE = {
        'Mathematics': 'MATH',
        'MATHEMATICS' : 'MATH',
        'CIVICS': 'CIV',
        'ELA': 'ELA',
        'U.S. HISTORY': 'HIST',
        'BIOLOGY 1': 'BIO1',
        'Algebra 1': 'ALG1',
        'Algebra 2': 'ALG2',
        'Geometry': 'GEOM',
        null: 'SCI'
    };

    const PASS_INDICATOR_DECODE = {
        '1.0': 'No',
        '1': 'No',
        '2.0': 'No',
        '2': 'No',
        '3.0': 'Yes',
        '3': 'Yes',
        '4.0': 'Yes',
        '4': 'Yes',
        '5.0': 'Yes',
        '5': 'Yes',
        '': 'NA',
        null: 'NA',
        undefined: 'NA'
    };

    const PERF_LEVEL_TO_TEXT_DECODE = {
        '1.0': 'Inadequate',
        '1': 'Inadequate',
        '2.0': 'Below Satisfactory',
        '2': 'Below Satisfactory',
        '3.0': 'Satisfactory',
        '3': 'Satisfactory',
        '4.0': 'Above Satisfactory',
        '4': 'Above Satisfactory',
        '5.0': 'Mastery',
        '5': 'Mastery',
        '': 'NA',
        null: 'NA',
        undefined: 'NA'
    };

    const GRADE_DECODE = {
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

//        try {
//            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapScaledScore(row, record['REPORTING_PERIOD']));
//        } catch (exception) {
//            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
//        }

        scoresToMap.forEach(function(testMetadata) {
          try {
               var score = (testMetadata.MAP_FUNCTION)(row, testMetadata,  record['REPORTING_PERIOD']);
               AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                   // AppUtil.nullSafePush(mapScaledScore(row, record['REPORTING_PERIOD']));
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

        if (!module.normalizedFileFields) {
            module.normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        }

        var birthDateObject = AppUtil.getEmptyDateObj();

        let schoolYear = _util.coalesce(row.getField('YEAR'), hierarchy.SCHOOL_YEAR);
        if(schoolYear.indexOf("-") > -1){
            schoolYear = schoolYear.substring(5, 9);
        } else {
            schoolYear = schoolYear.substring(0, 4);
        }
        let assessmentPeriod = ((admin) => {
            if(signature.getFormat().getFormatName() === "FSA_3_8_COLS_12"){
                return 'SPRING';
            } if (admin && admin.toUpperCase().indexOf("SPRING") > -1) {
                return 'SPRING';
            } else if (admin && admin.toUpperCase().indexOf("WINTER") > -1) {
                return 'WINTER';
            } else {
                return 'FALL';
            }
        })(row.getField("ADMINISTRATION"));

        if(row.getField("FLEID")){
            var studentId = row.getField("FLEID").replace('FL', '').replace('X', '').replace(/^0+/, '');
        }

        module.normalizedFileFields.forEach(function (field) {
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
                    record.REPORTING_PERIOD = _util.coalesce(assessmentPeriod, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTestAdminDate(schoolYear, assessmentPeriod);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(
                        studentId
                    );
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.trim(row.getField('FLEID'));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.trim(row.getField('FLEID'));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.trim(row.getField('FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.trim(row.getField('LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.trim(row.getField('MI'));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = null;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = GRADE_DECODE[_util.coalesce(_util.trim(row.getField('GRADE')),row.getField('STUDENT_GRADE'))];
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
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.trim(row.getField('SCHOOL_NAME'));
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL"),
                        row.getField("SCHOOL_NAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOL")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("SCHOOL")
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

    function mapScaledScore(row, testMetadata, assessmentPeriod) {
        let score = {};

        let subject = row.getField("SUBJECT");
        let grade = _util.coalesce(row.getField("GRADE"), row.getField("STUDENT_GRADE"));

        let testNumber = generateTestNumber(subject, grade, assessmentPeriod);

        let scaleScore = row.getField("SCALE_SCORE");
        let rawScore = row.getField("RAW_SCORE");
        let performanceLevel = _util.trim(row.getField("PERFORMANCE_LEVEL"));

        if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
            && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""))
        {
            return null;
        }

        score.TEST_NUMBER = testNumber;
        score.TEST_SCORE_TEXT = scaleScore;

        if (!isNaN(scaleScore)) {
            score.TEST_SCALED_SCORE = scaleScore;
            score.TEST_SCORE_VALUE = scaleScore;
        }
        if (!isNaN(rawScore)) {
            score.TEST_RAW_SCORE = rawScore;
        }

        if (performanceLevel) {
            score.TEST_PASSED_INDICATOR = PASS_INDICATOR_DECODE[performanceLevel];
            score.TEST_PRIMARY_RESULT_CODE = performanceLevel;
            score.TEST_PRIMARY_RESULT = PERF_LEVEL_TO_TEXT_DECODE[performanceLevel];
        }

        return score;
    }

    function mapItemScore(row, testMetadata, assessmentPeriod) {

        var score = {};
        var grade = _util.coalesce(row.getField("GRADE"), row.getField("STUDENT_GRADE"));
        if(grade=== null || grade=== ''){
        return null;
        }
        var subject = row.getField("SUBJECT");

       var testNumber =  'FSA_' + SUBJECT_DECODE[subject] + testMetadata.CODE;

       //Values are in X/Y format ex. 8/10
        var both = row.getField(testMetadata.FIELD);
       //TODO if both is null or / return null
        if(both === null || both === undefined || _util.trim(both) === "--" || _util.trim(both) === "" || _util.trim(both) === "/" ){
        return null;
        }
        var ptPoss = both.toString().split("/")[1];
        var earn = both.toString().split("/")[0];

        ptPoss = parseInt(ptPoss,10);
        earn = parseInt(earn,10);
        var percentage = (earn / ptPoss)*100;

       // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if(ptPoss){
            score["TEST_ITEMS_POSSIBLE"] = ptPoss;
        }
        if(earn){
            score["TEST_ITEMS_ATTEMPTED"] = earn;
            score["TEST_SCORE_VALUE"] = percentage;
            score["TEST_PERCENTAGE_SCORE"] = percentage;
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
        var grade = _util.trim(_util.coalesce(srcRecord.getField('GRADE')),srcRecord.getField('STUDENT_GRADE'));
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        assessmentAdminKey = assessmentAdminKey + "_" +grade;

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    function getTestAdminDate(testYear, reportingPeriod) {
        let testAdminDate = null, testAdminDateObj = AppUtil.getEmptyDateObj();
        if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'WINTER') {
            testAdminDate = '01/15/' + testYear;
        } else if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'SPRING') {
            testAdminDate = '05/15/' + testYear;
        } else {
            testAdminDate = '09/15/' + (testYear - 1);
        }
        testAdminDateObj = AppUtil.getDateObjByPattern(testAdminDate, "MM/dd/yyyy");
        return testAdminDateObj.STANDARD_DATE;
    }

    function generateTestNumber(subjectName, grade, assessmentPeriod) {
        return 'FSA_' + SUBJECT_DECODE[subjectName] + '_' + GRADE_DECODE[grade] + '_' + assessmentPeriod;
    }

    return module;
}());