var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MT_SBA";
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
        [   //ELA AND MATH SCORES AND PERFORMANCE
            {TEST: "SBA", CODE: "ELA", FIELD:"ELA", MAP_FUNCTION: mapScaleScore},
            {TEST: "SBA", CODE: "MA", FIELD:"MA", MAP_FUNCTION: mapScaleScore},
            {TEST: "SBA", CODE: "SCI", FIELD:"SCI", MAP_FUNCTION: mapScaleScore},
            //ELA SUBJECT PERFORMANCE BENCHMARKS
            {TEST: "SBA", CODE: "ELA", FIELD:"LIS", SUBJECT: "LISTENING", MAP_FUNCTION: mapPerformaneBenchmark},
            {TEST: "SBA", CODE: "ELA", FIELD:"RD", SUBJECT: "READING", MAP_FUNCTION: mapPerformaneBenchmark},
            {TEST: "SBA", CODE: "ELA", FIELD:"RES", SUBJECT: "RESEARCH", MAP_FUNCTION: mapPerformaneBenchmark},
            {TEST: "SBA", CODE: "ELA", FIELD:"WR", SUBJECT: "WRITING", MAP_FUNCTION: mapPerformaneBenchmark},
            {TEST: "SBA", CODE: "ELA", FIELD:"WRRES", SUBJECT: "WRITINGRESEARCH", MAP_FUNCTION: mapPerformaneBenchmark},
            //MATH SUBJECT PERFORMANCES BENCHMARKS
            {TEST: "SBA", CODE: "MA", FIELD:"REA", SUBJECT: "REASONING", MAP_FUNCTION: mapPerformaneBenchmark},
            {TEST: "SBA", CODE: "MA", FIELD:"PROC", SUBJECT: "PROCEDURES", MAP_FUNCTION: mapPerformaneBenchmark},
            {TEST: "SBA", CODE: "MA", FIELD:"PROB", SUBJECT: "PROBLEMSOLVING", MAP_FUNCTION: mapPerformaneBenchmark},
             //SCI SUBJECT PERFORMANCE BENCHMARKS
             {TEST: "SBA", CODE: "SCI", FIELD:"ESS", SUBJECT: "EARTHANDSPACESCIENCE", MAP_FUNCTION: mapPerformaneBenchmark},
             {TEST: "SBA", CODE: "SCI", FIELD:"LS", SUBJECT: "LIFESCIENCE", MAP_FUNCTION: mapPerformaneBenchmark},
             {TEST: "SBA", CODE: "SCI", FIELD:"PS", SUBJECT: "PHYSICALSCIENCE", MAP_FUNCTION: mapPerformaneBenchmark},

            //OTHER ELA RUBRIC SCORES
            {TEST: "SBA", CODE: "ELA", FIELD:"INF-CONV", RUBRIC: "INFORMATIONALCONVENTIONS", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"INF-ELAB", RUBRIC: "INFORMATIONALELABORATION", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"INF-PURP", RUBRIC: "INFORMATIONALPURPOSE", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"NAR-CONV", RUBRIC: "NARRATIVECONVENTIONS", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"NAR-ELAB", RUBRIC: "NARRATIVEELABORATION", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"NAR-PURP", RUBRIC: "NARRATIVEPURPOSE", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"OPI-CONV", RUBRIC: "OPINIONCONVENTIONS", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"OPI-ELAB", RUBRIC: "OPINIONELABORATION", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"OPI-PURP", RUBRIC: "OPINIONPURPOSE", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"ARG-CONV", RUBRIC: "ARGUMENTIVECONVENTIONS", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"ARG-ELAB", RUBRIC: "ARGUMENTIVEELABORATION", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"ARG-PURP", RUBRIC: "ARGUMENTIVEPURPOSE", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"EXP-CONV", RUBRIC: "EXPLANATORYCONVENTIONS", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"EXP-ELAB", RUBRIC: "EXPLANATORYELABORATION", MAP_FUNCTION: mapRubricScore},
            {TEST: "SBA", CODE: "ELA", FIELD:"EXP-PURP", RUBRIC: "EXPLANATORYPURPOSE", MAP_FUNCTION: mapRubricScore}
        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "03"	: "03"
        ,"3"	: "03"
        ,"04"	: "04"
        ,"4"	: "04"
        ,"05"	: "05"
        ,"5"	: "05"
        ,"06"	: "06"
        ,"6"	: "06"
        ,"07"	: "07"
        ,"7"	: "07"
        ,"08"	: "08"
        ,"8"	: "08"
        ,"09"	: "08"
        ,"9"	: "09"
    };

    var performanceDecodes = {
        "Level 1" 	: "Not Met Standard"
        ,"Level 2"	: "Nearly Met Standard"
        ,"Level 3"	: "Met Standard"
        ,"Level 4"    : "Exceeded Standard"
        ,null	: null
    };

    var passDecode = {
         "Level 1" 	: "No"
         ,"Level 2"	: "No"
         ,"Level 3"	: "Yes"
         ,"Level 4"    : "Yes"
         ,"Above Standard" : "Yes"
         ,"At/Near Standard" : "Yes"
         ,"Below Standard" : "No"
         ,null	: null
         ,"" : null
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
        var testDateObject = parseDate(row.getField("TEST_DATE"));

        var studentLastName = '';
        var studentFirstName = '';
        var studentMiddleName = '';

        if (row.getField('STUDENT_NAME')) {
            var studentName = row.getField('STUDENT_NAME');
            studentLastName = studentName.split(',')[0];
            var firstNameSeparator = studentName.split(',')[1].split(' ');
            var middleInitial = firstNameSeparator[firstNameSeparator.length-1];
            if (middleInitial.length === 1) {
                studentMiddleName = middleInitial;
                studentFirstName = firstNameSeparator.slice(0,-1).join(' ');
            } else {
                studentFirstName = studentName.split(',')[1];
            }
        } else {
            studentFirstName = row.getField('FIRST NAME');
            studentLastName = row.getField('LAST NAME');
            studentMiddleName = row.getField('MIDDLE NAME');
        }

           if(row.getField("ENROLLED_DISTRICT")){
              var districtName = row.getField("ENROLLED_DISTRICT");
              var districtLocalId = districtName.split("(").pop().replace(')', '');
              var dstName = districtName.split("(")[0];
              }

           if(row.getField("ENROLLED_SCHOOL")){
             var schoolName = row.getField("ENROLLED_SCHOOL");
             if(schoolName.indexOf("_") > -1){
             var schoolId = schoolName.split("_").pop().replace(')', '');
             }else{
             var schoolId = schoolName.split("(").pop().replace(')', '');
             }
             var schName = schoolName.split("(")[0];
        }

        const PERIOD_INFO = (() => {
            let term = row.getField("TEST_REASON");
            let period = '';
            let year = '';
            if (term) {
                period = term.split(' ')[0].toUpperCase();
                year = term.split(' ')[1];
            } else {
                period = hierarchy.REPORTING_PERIOD.toUpperCase();
                year = hierarchy.SCHOOL_YEAR.substring(0,4);
            }
            return {
                period: period,
                year: year
            }
        })();

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
                    record.REPORTING_PERIOD = PERIOD_INFO.period;
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("ENROLLED_SCHOOL"));
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
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeLookup[row.getField("ENROLLED_GRADE")]);
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = studentFirstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = studentLastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = studentMiddleName;
                    break;
                //School Information
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(schName,row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = districtLocalId;
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = schoolId;
                     break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(schName,row.getField("SCHOOL_NAME"));
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

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaleScore(row, testMetadata) {

        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var grade = gradeLookup[row.getField("ENROLLED_GRADE")];

        var standardError = row.getField(testMetadata.FIELD + "_" + grade + "_STDERROR");
        var scaleScore = row.getField(testMetadata.FIELD + "_" + grade + "_SCALE_SCORE");
        var performance = row.getField(testMetadata.FIELD + "_" + grade + "_PERFORMANCE");

        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === ""
        || _util.trim(scaleScore) === "N/A" || _util.trim(scaleScore) === "Insufficient to score"
        || _util.trim(scaleScore) === "Invalidated") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_STANDARD_ERROR"] = standardError;

        score["TEST_PRIMARY_RESULT_CODE"] = performance;
        //some decodes are unknown for now
        score["TEST_PRIMARY_RESULT"] = performanceDecodes[performance];
        score["TEST_PASSED_INDICATOR"] = passDecode[performance];

        return score;
    }

    function mapPerformaneBenchmark(row, testMetadata) {

        var score = {};
        var testNumber = generateTestNumber(row, testMetadata) + testMetadata.FIELD;
        var grade = gradeLookup[row.getField("ENROLLED_GRADE")];

        var performance = row.getField(testMetadata.CODE + "_" + grade +
        "_" + testMetadata.SUBJECT + "_PERFORMANCE");

        if(_util.trim(performance) === null || _util.trim(performance) === undefined || _util.trim(performance) === ""
           || _util.trim(performance) === "N/A" || _util.trim(performance) === "Insufficient to score") {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;
        //decodes are not available, subject to differentiate
        score["TEST_PRIMARY_RESULT_CODE"] = testMetadata.FIELD;
        score["TEST_PRIMARY_RESULT"] = performance;
        score["TEST_PASSED_INDICATOR"] = passDecode[performance];

        return score;
    }

    function mapRubricScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata) + testMetadata.FIELD;
        var grade = gradeLookup[row.getField("ENROLLED_GRADE")];

        var rubricScore = row.getField(testMetadata.CODE + "_" + grade + "_" +
        testMetadata.RUBRIC + "_PERFORMANCE");

        if(_util.trim(rubricScore) === null || _util.trim(rubricScore) === undefined || _util.trim(rubricScore) === ""
        || _util.trim(rubricScore) === "N/A" || _util.trim(rubricScore) === "Insufficient to score"
        || _util.trim(rubricScore) === "Insufficient" || _util.trim(rubricScore) === "Blank"
        || _util.trim(rubricScore) === "Invalidated" ) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        if(!isNaN(rubricScore)){
            score["TEST_RAW_SCORE"] = rubricScore;
        }
        score["TEST_SCORE_TEXT"] = rubricScore;
        score["TEST_PASSED_INDICATOR"] = passDecode[rubricScore];

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
        testNumber = testMetadata.TEST + gradeLookup[row.getField("ENROLLED_GRADE")] + testMetadata.CODE;
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

        if (rawDate.length() > 8 && rawDate.indexOf('/') > -1) {
           formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if (rawDate.length() > 8 && rawDate.indexOf('-') > -1){
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
