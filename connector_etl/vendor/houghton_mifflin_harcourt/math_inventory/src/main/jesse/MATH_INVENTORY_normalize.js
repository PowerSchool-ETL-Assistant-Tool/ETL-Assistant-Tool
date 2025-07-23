var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MATH_INVENTORY";
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
            print("\nLoading using signature file ${signature.getFormat().getFormatName()}\n");
            var normalizedFile = AppUtil.createResultsFile(file);
            print("\nNormalized file: ${normalizedFile}");
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
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try{
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function(output, rows) {
                    try{
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found / No assessment start or end dates.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch(exception) {
                        print(exception);
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
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
    var scoresToMap = [
        {TEST: "MAINV", NUMBER: "LEX", CODE:"LEX", FIELD: "LEXILE_", MAP_FUNCTION: mapLexileScore}
        ,{TEST: "MAINV", NUMBER: "SMI", CODE:"SMI", FIELD: "SMI_", MAP_FUNCTION: mapSMIScore}
        ,{TEST: "MAINV", NUMBER: "SMIOVR", CODE:"SMIOVR", FIELD: "SMI_", MAP_FUNCTION: mapSMIOVRScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var decodeStudentGrade = {
            "1"   : "01"
            ,"01"  : "01"
            ,"2"  : "02"
            ,"02"  : "02"
            ,"3"  : "03"
            ,"03"  : "03"
            ,"4"  : "04"
            ,"04"  : "04"
            ,"5"  : "05"
            ,"05"  : "05"
            ,"6"  : "06"
            ,"06"  : "06"
            ,"7"  : "07"
            ,"07"  : "07"
            ,"8"  : "08"
            ,"08"  : "08"
            ,"9"  : "09"
            ,"09"  : "09"
            ,"10"  : "10"
            ,"11"  : "11"
            ,"12"  : "12"
            ,"KG"  : "KG"
            ,"K"  : "KG"
            ,null  : null
            ,""    : null
        };

    var performanceDecode =
        {
            "Below Basic" :  {LEVEL: "1", DESC: "Below Basic"},
            "Basic"       :  {LEVEL: "2", DESC: "Basic"},
            "Proficient"  :  {LEVEL: "3", DESC: "Proficient"},
            "Advanced"    :  {LEVEL: "4", DESC: "Advanced"},
            "" : null,
            null : null
        };

    var performanceDecodePassFail =
        {
            "Advanced" : "Yes",
            "AD" : "Yes",
            "Proficient" :"Yes",
            "PR" : "Yes",
            "Basic": "No",
            "B" : "No",
            "Below Basic" : "No",
            "BB" : "No",
            "" : null,
            null : null
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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                if(testMetadata.NUMBER === "SMI"){
                    for(var j=1;j<=36;j++){
                        var score = (testMetadata.MAP_FUNCTION)(row, testMetadata,j);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                    }
                }
                else{
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                }
            } catch(exception) {
                print(exception);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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

        var testDate = getLatestTestDate(row,hierarchy);

        var birthDateString = row.getField("BIRTH_DATE");
        var birthDateObject = AppUtil.getDateObjByPattern(birthDateString, "M/d/yyyy");
        var sy = "";
        if(hierarchy == "undefined") {
            sy = getSY(row)
        } else {
            sy =  hierarchy.SCHOOL_YEAR;
        }

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
                    record.SCHOOL_YEAR = sy;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = _util.coalesce(getTEST_ADMIN_PERIOD(row, hierarchy), hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDate;
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_ID"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                     break;

                case "STUDENT_STATE_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("SIS_ID"), row.getField("USER_ID"), row.getField("USER_NAME"));
                    break;
                case "STUDENT_LOCAL_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("SIS_ID"), row.getField("USER_ID"), row.getField("USER_NAME"));
                    break;
                case "STUDENT_VENDOR_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("SIS_ID"), row.getField("USER_ID"), row.getField("USER_NAME"));
                    break;
                 case "STUDENT_FIRST_NAME":
                     record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                     break;
                 case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("MIDDLE_NAME"));
                     break;
                 case "STUDENT_LAST_NAME":
                     record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = decodeStudentGrade[_util.coalesce(row.getField("GRADE"))];
                     break;
                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }
    function getSY(row) {
        var studentYear1 = row.getField("EXPORT_START_DATE").substring(0,4);
        var studentYear2 = parseInt(studentYear1) + 1;
        var studentYear = studentYear1 + "-" + studentYear2.toString();
        return studentYear;
    }
    function getLatestTestDate(row, hierarchy) {
        try {
            var dates = [];
            var sy = "";
            if(hierarchy == "undefined") {
                sy = getSY(row)
            } else {
                sy =  hierarchy.SCHOOL_YEAR;
            }
            for (let i = 1; i <= 36; i++) {
                var smi_test_date_value = row.getField('SMI_TEST_DATE' + '_' + i);
                var modDate = row.getField("LEXILE_MOD_DATE");

                if (smi_test_date_value === null && modDate === null) {
                    if(hierarchy == "undefined") {
                        return null;
                    }else {
                         dates.push(new Date("05/15/" + sy.substring(5, 9)));
                    }
                }
                if (smi_test_date_value !== null && smi_test_date_value !== "") {
                    dates.push(new Date(smi_test_date_value));
                }
                if (modDate !== null && modDate !== "") {
                    dates.push(new Date(modDate));
                }
            }
            var maximumDate = new Date(Math.max.apply(null, dates)).toLocaleDateString('en-US');
            var latestDate = AppUtil.getMonthFollowedByDay(maximumDate).STANDARD_DATE;

            return latestDate;
        } catch (e) {
            // ignore expected range errors
            if (e.name !== 'RangeError') {
                print(e + "\n");
            }
        }

    }

    function getTEST_ADMIN_PERIOD(row, hierarchy) {
        var testAdminPeriod = null;
        var periodDate = getLatestTestDate(row, hierarchy);
            var sdObj = periodDate;
            if(sdObj != null){
            var sd = parseDate(sdObj).STANDARD_DATE;
            var month = sd.substring(0, 2);
            if (month === "07" || month === "08" || month === "09" || month === "10" || month === "11")
                testAdminPeriod = "FALL";
            else if (month === "12" || month === "01" || month === "02" || month === "03")
                testAdminPeriod = "WINTER";
            else if (month === "04" || month === "05" || month === "06")
                testAdminPeriod = "SPRING";
             }else{
                testAdminPeriod = "ALL";
             }
        return testAdminPeriod;
    }

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

        var format;

        if (rawDate.indexOf('/') > -1) {
            if (rawDate.split('/')[0].length === 4) {
                    format = 'yyyy/MM/dd';
            } else if(rawDate.length() === 10){
                format = 'MM/dd/yyyy';
            } else {
                format = 'M/dd/yyyy';
            }
        } else if (rawDate.indexOf('-') > -1) {
            if (rawDate.split('-')[0].length === 4) {
                    format = 'yyyy-MM-dd';
            } else if(rawDate.length() === 10){
                format = 'MM-dd-yyyy';
            } else {
                format = 'M-dd-yyyy';
            }
        }

        var formatter = new java.text.SimpleDateFormat(format);
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

    function mapLexileScore(row, testMetadata) {
        var score = {};
        var scaleScore = row.getField("LEXILE_SCORE");
        var modDate = row.getField("LEXILE_MOD_DATE");

        if(scaleScore === null || scaleScore === "#NULL!" || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
           return null;
        }

        var testNumber = generateTestNumber(row, testMetadata, null);

       // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_READING_LEVEL"] = scaleScore;
        score["TEST_SCORE_ATTRIBUTES"] = AppUtil.getMonthFollowedByDay(modDate).STANDARD_DATE;
        return score;
    }

    function mapSMIScore(row, testMetadata, bucket) {
        var score = {};
        var testDate = row.getField(testMetadata.FIELD+"TEST_DATE_"+bucket);
        var testDuration = row.getField(testMetadata.FIELD+"TEST_DURATION_"+bucket);
        var performanceLevel = row.getField(testMetadata.FIELD+"PERFORMANCE_LEVEL_"+bucket);
        var quantileScores = row.getField(testMetadata.FIELD+"QUANTILE_SCORES_"+bucket);

        var additionFact = row.getField(testMetadata.FIELD+"FLUENT_ON_TESTED_ADD_FACTS_"+bucket);
        var multiplicationFact = row.getField(testMetadata.FIELD+"FLUENT_ON_TESTED_MULTI_FACTS_"+bucket);

        if (testDate === null || testDate === undefined || testDate === "") {
            return null;
        }

        var testNumber = generateTestNumber(row, testMetadata, bucket);

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_PRIMARY_RESULT_CODE"] = performanceDecode[performanceLevel].LEVEL;
    	score["TEST_PRIMARY_RESULT"] = performanceDecode[performanceLevel].DESC;
    	score["TEST_PASSED_INDICATOR"] = performanceDecodePassFail[performanceLevel];
    	score["TEST_SCALED_SCORE"] = quantileScores;

    	score["TEST_SECONDARY_RESULT_CODE"] = "MFS_ADD";
    	score["TEST_SECONDARY_RESULT"] = additionFact;

    	score["TEST_TERTIARY_RESULT_CODE"] = "MFS_MULTI";
    	score["TEST_TERTIARY_RESULT"] = multiplicationFact;

        score["TEST_QUATERNARY_RESULT"] = testDuration;
        score["TEST_SCORE_ATTRIBUTES"] = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;

        return score;
    }

    function mapSMIOVRScore(row, testMetadata) {
        var score = {};

        var lastQuantileDate = row.getField("SMI_LAST_QUANTILE_DATE");
        var lastQuantileScore = row.getField("SMI_LAST_QUANTILE");

        var performanceLevel = row.getField("SMI_LAST_PERFORMANCE_LEVEL");

        var percentile = row.getField("SMI_PERCENTILE");
        var nce = row.getField("SMI_NCE");
        var stanineScore = row.getField("SMI_STANINE");
        var testScore    = row.getField("SMI_TEST_TAKEN");

        var growthNumber = row.getField("SMI_GROWTH_IN_DATE_RANGE");

        if(lastQuantileDate === null || lastQuantileDate === undefined || lastQuantileDate === "") {
            return null;
        }

        var testNumber = generateTestNumber(row, testMetadata, null);

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceDecode[performanceLevel].LEVEL;;
        score["TEST_PRIMARY_RESULT"] = performanceDecode[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = performanceDecodePassFail[performanceLevel];

        score["TEST_SCALED_SCORE"] = lastQuantileScore;
        score["TEST_SCORE_ATTRIBUTES"] = AppUtil.getMonthFollowedByDay(lastQuantileDate).STANDARD_DATE;
        score["TEST_STANINE_SCORE"] = stanineScore;
        score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_NCE_SCORE"] = nce;
        score["TEST_SCORE_VALUE"] = testScore;

        score["TEST_GROWTH_TARGET_1"] = growthNumber;
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

            if(assessmentAdminKey_one === assessmentAdminKey_two) {
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
        var sy = "";
        if(hierarchy == "undefined") {
            sy = getSY(row)
        } else {
            sy =  hierarchy.SCHOOL_YEAR;
        }
        var period = getTEST_ADMIN_PERIOD(srcRecord,hierarchy);
        var periodInfo = _util.coalesce(period,hierarchy.REPORTING_PERIOD)
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${sy}_${hierarchy.REPORTING_PERIOD}_${periodInfo}";
        var testDate = getLatestTestDate(srcRecord, hierarchy);

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key),""));
        });
        assessmentAdminKey = assessmentAdminKey + "_" + testDate;
        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata, attempt) {
            var testNumber = testMetadata.TEST + "_" + testMetadata.NUMBER;
            if(attempt !== null){
                testNumber = testNumber + "_" + attempt;
            }
            return testNumber;
        }

    return module;

}());
