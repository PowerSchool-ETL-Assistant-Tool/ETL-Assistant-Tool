var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "PARCC";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;
    /**
     * This function will convert the source file given into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
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
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, exception, JSON.stringify(one) + '|' + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try{
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK: ${exception}", JSON.stringify(rows)));
                    }

                })
                .transform("TRANSFORM", ["RECORDS"],
                    function(output, rows) {

                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
                    if(mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;

        } catch(exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };

    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function(file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    var scoresToMap =
        [
            //Overall Scores and Performance
            {TEST: "PARCC", CODE: "OVR", FIELD:"OVERALL", MAP_FUNCTION: mapOverallScore},
            //RD and WR scale Scores
            {TEST: "PARCC", CODE: "RD", FIELD:"READING", MAP_FUNCTION: mapOtherScores},
            {TEST: "PARCC", CODE: "WR", FIELD:"WRITING", MAP_FUNCTION: mapOtherScores},
            //Subclaim Individual Performances
            {TEST: "PARCC", CODE: "RD", FIELD:"READING", CATEGORY:"LITERARY", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "PARCC", CODE: "RD", FIELD:"READING", CATEGORY:"INFORMATIONAL", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "PARCC", CODE: "RD", FIELD:"READING", CATEGORY:"VOCABULARY", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "PARCC", CODE: "WR", FIELD:"WRITING", CATEGORY:"EXPRESSION", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "PARCC", CODE: "WR", FIELD:"WRITING", CATEGORY:"CONVENTIONS", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "PARCC", CODE: "MA", FIELD:"MATHEMATICS", CATEGORY:"MAJORCONTENT", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "PARCC", CODE: "MA", FIELD:"MATHEMATICS", CATEGORY:"REASONING", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "PARCC", CODE: "MA", FIELD:"MATHEMATICS", CATEGORY:"MODELINING", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "PARCC", CODE: "MA", FIELD:"MATHEMATICS", CATEGORY:"SUPPORTINGCONTENT", MAP_FUNCTION: mapIndividualPerformance}
        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "03"	: "03"
        ,"Level 3": "03"
        ,"3"	: "03"
        ,"04"	: "04"
        ,"Level 4"	: "04"
        ,"4"	: "04"
        ,"05"	: "05"
        ,"Level 5"	: "05"
        ,"5"	: "05"
        ,"06"	: "06"
        ,"Level 6"	: "06"
        ,"6"	: "06"
        ,"07"	: "07"
        ,"Level 7"	: "07"
        ,"7"	: "07"
        ,"08"	: "08"
        ,"Level 8"	: "08"
        ,"8"	: "08"
    };

    //To be
    var decodePerformanceLevel = {
        "1": { TEST_RESULT: 'Did not yet meet expectations', PASS_IND: 'No', READINESS: 'Not College Ready' },
        "2": { TEST_RESULT: 'Partially met expectations', PASS_IND: 'No', READINESS: 'Not College Ready' },
        "3": { TEST_RESULT: 'Approached expectations', PASS_IND: 'No', READINESS: 'Not College Ready' },
        "4": { TEST_RESULT: 'Met expectations', PASS_IND: 'Yes', READINESS: 'College Ready' },
        "5": { TEST_RESULT: 'Exceeded expectations', PASS_IND: 'Yes', READINESS: 'College Ready' },
        null: { TEST_RESULT: null, PASS_IND: "--", READINESS: '--' },
        "": { TEST_RESULT: null, PASS_IND: "--", READINESS: '--' },
        "0": { TEST_RESULT: null, PASS_IND: '--', READINESS: '--' },
        undefined: { TEST_RESULT: null, PASS_IND: "--", READINESS: '--' }
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

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row)

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
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

        var birthDateObject = parseDate(row.getField("STUDENT_DOB"));

        var testCode = row.getField("TEST_CODE");

        var gradeFromTestCode = testCode.slice(-2);

        var grade = _util.coalesce(gradeLookup[row.getField("STUDENT_GRADE_CODE")], gradeFromTestCode);

        normalizedFileFields.forEach(function (field) {
            switch(field) {
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
                    record.REPORTING_PERIOD =  _util.coalesce(getTEST_ADMIN_PERIOD(row, hierarchy).toUpperCase(),
                    hierarchy.REPORTING_PERIOD.toUpperCase());
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = null;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //School Info
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = row.getField("SCHOOL_LOCAL_ID");
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"));
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(getTEST_ADMIN_DATE(row, hierarchy));
                    break;
                //Student Info
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
                    record.STUDENT_GRADE_CODE = grade;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("STUDENT_LOCAL_ID");
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("STUDENT_STATE_ID");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("STUDENT_FIRST_NAME");
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField("STUDENT_MIDDLE_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("STUDENT_LAST_NAME");
                    break;
                default:
                    record[field] = row.getField(field);
                    break
            }
        });

        return record;

    }

    function getTEST_ADMIN_DATE(row, hierarchy) {

        var testDate = '';

        for (var i=4; i>=1; i--) {
             testField = 'UNIT_' + i + '_END_DATE';
             if (row.getField(testField) === null || row.getField(testField) === undefined
                 || row.getField(testField) === '') {
                 continue;
             } else {
                 testDate = row.getField(testField);
                 break;
             }
        }

        if (testDate === null || testDate === undefined || testDate === ''
            || parseDate(testDate).STANDARD_DATE === '01/01/1900') {
            testDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
        } else {
            testDate = parseDate(testDate).STANDARD_DATE;
        }

        return testDate;
    }

    function getTEST_ADMIN_PERIOD(row, hierarchy) {
      var testPeriod = 'Unknown';
      var testAdminDate = getTEST_ADMIN_DATE(row, hierarchy);
      var month = testAdminDate.substring(0,2);

      if( month === "08" || month === "09" || month === "10" || month === "11") {
         testPeriod = "Fall";
      }else if(month === "12" || month === "01" || month === "02") {
         testPeriod = "Winter";
      }else if(month === "03" || month === "04" || month === "05" || month === "06" || month === "07") {
         testPeriod = "Spring";
      }

      return testPeriod;
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapOverallScore(row, testMetadata) {

        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);

        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
        var studentGrowthPercentile = row.getField("SGP");

        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === ""
        || _util.trim(scaleScore) === "N/A" ||  _util.trim(scaleScore) === "Undetermined") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }

        //Pass Results
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].TEST_RESULT;
        score["TEST_PASSED_INDICATOR"] = decodePerformanceLevel[performanceLevel].PASS_IND;

        //Collage Readiness
        score["TEST_SECONDARY_RESULT"] = decodePerformanceLevel[performanceLevel].READINESS;

        if (!isNaN(studentGrowthPercentile)) {
            score["TEST_GROWTH_PERCENTILE"] = studentGrowthPercentile;
        }

        return score;
    }

    function mapOtherScores(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);

        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");

        if((_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === ""
           || _util.trim(scaleScore) === "N/A" || _util.trim(scaleScore) === "Undetermined")) {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        return score;
    }

    function mapIndividualPerformance(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata) + testMetadata.CATEGORY;

        var performanceLevel = row.getField(testMetadata.FIELD + '_SUBCLAIM_' + testMetadata.CATEGORY);

        if((_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === ""
           || _util.trim(performanceLevel) === "N/A" || _util.trim(performanceLevel) === "Undetermined")) {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].TEST_RESULT;

        return score;
    }
    /***************************************************************************
     Utility Functions
     ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);
            if(assessmentAdminKey_one === assessmentAdminKey_two) {
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
        var period = getTEST_ADMIN_PERIOD(srcRecord, hierarchy).toUpperCase();

        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE
            + "_" + period
            + "_" + hierarchy.SCHOOL_YEAR;
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {
        var testNumber = null;
        var testSubject = '';
        var testCode = row.getField("TEST_CODE");
        if (testCode.indexOf('ELA') > -1) {
           testSubject = 'ELA';
        } else if (testCode.indexOf('MAT') > -1) {
           testSubject = 'MAT';
        }

        var gradeFromTestCode = testCode.slice(-2);
        var grade = _util.coalesce(gradeLookup[row.getField("STUDENT_GRADE_CODE")], gradeFromTestCode);

        testNumber = testMetadata.TEST + testSubject + grade + testMetadata.CODE;
        return testNumber;
    }

    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        var formatter;

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if (rawDate.indexOf('/') > -1) {
           formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if (rawDate.indexOf('-') > -1){
           formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
        } else {
           formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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

    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
