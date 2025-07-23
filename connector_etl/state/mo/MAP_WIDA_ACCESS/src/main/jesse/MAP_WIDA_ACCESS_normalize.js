var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MAP_WIDA_ACCESS";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
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

                    // Report when no scores are found.
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
            {TEST: "MAP_WIDA_ACCESS", CODE: "OVR", FIELD:"TOTAL_BATTERY", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "MAP_WIDA_ACCESS", CODE: "ORAL", FIELD: "ORAL", MAP_FUNCTION: mapScore}
            , {TEST: "MAP_WIDA_ACCESS", CODE: "LIT", FIELD: "LITERACY", MAP_FUNCTION: mapScore}
            , {TEST: "MAP_WIDA_ACCESS", CODE: "COMP", FIELD: "COMPREHENSION", MAP_FUNCTION: mapScore}
            , {TEST: "MAP_WIDA_ACCESS", CODE: "LIS", FIELD: "LISTENING", MAP_FUNCTION: mapStrandScore}
            , {TEST: "MAP_WIDA_ACCESS", CODE: "SPE", FIELD: "SPEAKING", MAP_FUNCTION: mapStrandScore}
            , {TEST: "MAP_WIDA_ACCESS", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapStrandScore}
            , {TEST: "MAP_WIDA_ACCESS", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapStrandScore}
        ];

    function decodeProficiencyLevel(profLevel) {
        var primaryResult = {};
        var firstNumber = profLevel.substring(0, 1);

            if (firstNumber === "1") {
                primaryResult = "Entering";
            } else if (firstNumber === "2") {
                primaryResult = "Emerging";
            } else if (firstNumber === "3") {
                primaryResult = "Developing";
            } else if (firstNumber === "4") {
                primaryResult = "Expanding";
            } else if (firstNumber === "5") {
                primaryResult = "Bridging";
            } else if (firstNumber === "6") {
                primaryResult = "Reaching";
            } else if (firstNumber === "N") {
                primaryResult = "N/A";
            }else if (firstNumber === "0") {
                primaryResult = null;
            }
        return primaryResult;
    }

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeLookup = {
        "0" 	: "KG",
        "00" 	: "KG",
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
       ,"" : null
       ,null : null
    };

    function decodeGradeCode(gradeCode) {
        if(gradeCode == null) {
            return null;
        }
        var lkpGradeObj = gradeLookup[gradeCode];
        if(lkpGradeObj == undefined || lkpGradeObj == null) {
            return null;
        }
        return lkpGradeObj;
    }

    function decodeRaceCode(raceCode) {
        if(raceCode === undefined || raceCode === null ) {
            return null;
        }
        var lkpRaceObj = raceLookup[raceCode];
        if(lkpRaceObj == undefined || lkpRaceObj == null) {
            return null;
        }
        return lkpRaceObj.GRADE_CODE;
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
        var testDateObject = {
                                   RAW_DATE : null
                                   , MONTH : null
                                   , DAY : null
                                   , YEAR : null
                                   , STANDARD_DATE : null
                               };
        var birthDateObject = parseDate(row.getField("DATE_OF_BIRTH"));

        testDateObject = parseDate(row.getField("TEST_DATE"));

        //Loop through normalized fields and map if possible.
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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = '05/01/' + row.getField("YEAR");
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"),row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(
                        testDateObject.STANDARD_DATE,
                        "05" + "/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9)
                    );
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
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeLookup[row.getField("GRADE_LEVEL")]);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"),row.getField("MOSIS_STATE_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("MOSIS_STATE_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("MOSIS_STATE_ID"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('MIDDLE_INITIAL');
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

        admin.TEST_EXEMPTION_DESC = _util.trim(row.getField("TEST_EXEMPTION_SPEAKING"));
        admin.TEST_EXEMPTION_CODE = "SPK";
        admin.TEST_EXEMPTION_DESC_2 = _util.trim(row.getField("TEST_EXEMPTION_LISTENING"));
        admin.TEST_EXEMPTION_CODE_2 = "LIS";
        admin.TEST_EXEMPTION_DESC_3 = _util.trim(row.getField("TEST_EXEMPTION_READING"));
        admin.TEST_EXEMPTION_CODE_3 = "RD";
        admin.TEST_EXEMPTION_DESC_4 = _util.trim(row.getField("TEST_EXEMPTION_WRITING"));
        admin.TEST_EXEMPTION_CODE_4 = "WR";
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapCompositeScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField("OVERALL_SCALE_SCORE");
        var performanceLevel = row.getField("OVERALL_PROFICIENCY_LEV");
        var rawScore = row.getField("TOTAL_BATTERY_RAW_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NA") {
            return null;
        }

        if (performanceLevel) {
            score.TEST_PRIMARY_RESULT_CODE = performanceLevel;
            score.TEST_PRIMARY_RESULT = decodeProficiencyLevel(performanceLevel);
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_RAW_SCORE"] = rawScore;
        //Passing and performance set by benchmarks
        return score;
    }

    function mapScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var performanceLevel = row.getField(testMetadata.FIELD + "_PROFICIENCY_LEVEL");
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");


        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NA") {
            return null;
        }

        if (performanceLevel) {
            score.TEST_PRIMARY_RESULT_CODE = performanceLevel;
            score.TEST_PRIMARY_RESULT = decodeProficiencyLevel(performanceLevel);
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        return score;
    }

    function mapStrandScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var performanceLevel = row.getField(testMetadata.FIELD + "_PROFICIENCY_LEV");
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");
        var inv = row.getField("TEST_INVALIDATION_" + testMetadata.FIELD);


        // Check for key fields and do not map score and exit if conditions met.
        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === "" || inv === "Y" || _util.trim(scaleScore) === "NA") {
            return null;
        }

        if (performanceLevel) {
            score.TEST_PRIMARY_RESULT_CODE = performanceLevel;
            score.TEST_PRIMARY_RESULT = decodeProficiencyLevel(performanceLevel);
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
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
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        return assessmentAdminKey;
    }


    function generateTestNumber(row, testMetadata) {

        var testNumber = null;
        testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        return testNumber;
    }

    /*
    if (rawDate.indexOf('-') > -1) {
            var positionOne = rawDate.indexOf('-');
            var positionTwo = rawDate.indexOf('-', (positionOne+1));

            month = padDateElement(rawDate.substring(positionOne + 1, positionTwo));
            day = padDateElement(rawDate.substring(positionTwo + 1, positionTwo + 3));
            year = padDateElement(rawDate.substring(0, positionOne));
        }
    */

    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        var formatter = new java.text.SimpleDateFormat("MMddyy");
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
    return module;
}());
