var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MCA_ON_DEMAND";
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
                        try {
                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function(record) {
                                output.RECORDS.put(record);
                            });
                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }
                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {

                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if(mappingObject.SCORE_MAPPINGS.length == 0 &&  row.INCLUDE_INDICATOR === "N") {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "LOW",row.LINEAGE_LINE, "Include indicator is No.", JSON.stringify(row)));
                    }
                    else if(mappingObject.SCORE_MAPPINGS.length == 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\"))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG);

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
            // Initial ELPAC Scores to Process
            {TEST: "MCA", CODE: "TOT", FIELD:"", MAP_FUNCTION: mapTotalScore}
             ,{TEST: "MCA", CODE: "RS1", FIELD: "RS1", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MCA", CODE: "RS2", FIELD: "RS2", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MCA", CODE: "RS3", FIELD: "RS3", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MCA", CODE: "RS4", FIELD: "RS4", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MCA", CODE: "SC5", FIELD: "SC5", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MCA", CODE: "SC6", FIELD: "SC6", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MCA", CODE: "SC7", FIELD: "SC7", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MCA", CODE: "SC8", FIELD: "SC8", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MCA", CODE: "SC9", FIELD: "SC9", MAP_FUNCTION: mapStrandScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KN" 	: "KG"
        ,"01"	: "01"
		,"1"	: "01"
        ,"02"	: "02"
        ,"2"	: "02"
        ,"03"	: "03"
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
        ,"09"	: "09"
        ,"9"	: "09"
        ,"10"	: "10"
        ,"11"	: "11"
        ,"12"	: "12"
    };

    var subjectLookup = {
        "Read" 	: "RD"
        , "Reading" 	: "RD"
        ,"Science"	: "SCI"
        ,"Math"	: "MA"
        ,"Mathematics" : "MA"
        ,null	: null
    }


	var decodeConditionCodes = {
        "NC" 	: "Not Completed"
        ,"NA"	: "Not Attempted"
        ,"REF-P" 	: "Not Attempted"
        ,"REF-S"	: "Not Attempted"
        ,null	: null
    };

	var passDecode = {
        "Does Not Meet" : "No"
        ,"Below Expectations" : "No"
        ,"Partially Meets": "No"
        ,"Meets" : "Yes"
        ,"Exceeds": "Yes"
        ,"At or Near Expectations": "Yes"
        ,"Above Expectations": "Yes"
        ,null	: null
    };

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

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

    function decodeSubject(subject) {
        if(subject == null) {
            return null;
        }
        var lkpSubjectObj = subjectLookup[subject];
        if(lkpSubjectObj == undefined || lkpSubjectObj == null) {
            return null;
        }
        return lkpSubjectObj;
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
            var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

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

        var birthDateObject = parseDate(row.getField("DATE_OF_BIRTH"));
        var testDateObject = parseDate(row.getField("TEST_DATE"));
         var schoolCode = row.getField("SCH_CODE");
         var schoolID;
          if(schoolCode.indexOf('-') > -1) {
          schoolID = schoolCode.toString().split("-")[2];
          }
          else{
          schoolID = schoolCode;
          }


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
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        schoolID, row.getField("SCHOOL")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        schoolID
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        schoolID
                    );
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
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADE")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("LOCAL_USE_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = null; //Currently broken from vendor - _util.coalesceEmptyString(row.getField("MARSS_SSID_NUMBER"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesceEmptyString(row.getField("LOCAL_USE_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = testDateObject.STANDARD_DATE;
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

        if (_util.trim(row.getField("SCALE_SCORE")) !== "") {
            admin.TEST_INTERVENTION_CODE = _util.trim(row.getField("SCALE_SCORE"));
            admin.TEST_INTERVENTION_DESC = decodeConditionCodes[admin.TEST_INTERVENTION_CODE] === undefined ? null : decodeConditionCodes[admin.TEST_INTERVENTION_CODE];
        }

        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapTotalScore(row, testMetadata, signature) {
        var score = {};

        var testNumber =  testMetadata.TEST
                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + testMetadata.CODE
                             + "_" + decodeGradeCode(row.getField("GRADE"));

        var achievementLevel = row.getField("ACHIEVEMENT_LEVEL");
        var scaledScore = row.getField("SCALE_SCORE");
        var lexileQuantile = row.getField("LEXILE_QUANTILE");


         // Get the signature file name from the lineage
         var signatureFileName = signature.getFormat().getFormatName();


        // For MCA_ON_DEMAND_50, process if either scaled score OR achievement level is available
        // For all other signatures, require scaled score to be available
        if (signatureFileName === "MCA_ON_DEMAND_50") {
            if ((scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") &&
                (achievementLevel === undefined || achievementLevel === null || _util.trim(achievementLevel) === "")) {
                return null;
            }
        } else if (scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
        score["TEST_PRIMARY_RESULT"] = achievementLevel;
        score["TEST_SECONDARY_RESULT"] = lexileQuantile;
        score["TEST_PASSED_INDICATOR"] = passDecode[achievementLevel];
        return score;
    }

    function mapStrandScore(row, testMetadata, signature) {
        var score = {};
        var testNumber =  testMetadata.TEST
                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + testMetadata.CODE
                             + "_" + decodeGradeCode(row.getField("GRADE"));
        var scaledScore = row.getField(testMetadata.FIELD);
        var performanceLevel = row.getField(testMetadata.FIELD+"_PL");

         // Get the signature file name from the lineage
         var signatureFileName = signature.getFormat().getFormatName();

        // For MCA_ON_DEMAND_50, process if either scaled score OR performance level is available
        // For all other signatures, require scaled score to be available
        if (signatureFileName === "MCA_ON_DEMAND_50") {
            if ((scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") &&
                (performanceLevel === undefined || performanceLevel === null || _util.trim(performanceLevel) === "")) {
                return null;
            }
        } else if (scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
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

        signature.getFormat().getNaturalKey().forEach(function(key) {
            if(key === "TEST_DATE") {
                var testDate = parseDate(srcRecord.getField(key));
                // Fix: Use concatenation instead of template string
                assessmentAdminKey = assessmentAdminKey + "_" + testDate.STANDARD_DATE;
            } else {
                assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
            }
        });

        return assessmentAdminKey;
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

        var formatter;
        try {
            if(rawDate.indexOf("/") > -1) {
                // MM/DD/YYYY or M/D/YYYY format
                formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            } else if(rawDate.indexOf("-") > -1) {
                // YYYY-MM-DD or YYYY-M-D format
                formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
            } else if(rawDate.indexOf(".") > -1) {
                // MM.DD.YYYY or M.D.YYYY format
                formatter = new java.text.SimpleDateFormat("MM.dd.yyyy");
            } else if(rawDate.length == 8) {
                // 8-digit format like YYYYMMDD or YYYYDDMM
                if(/^\d{4}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])$/.test(rawDate)) {
                    // If it matches YYYYMMDD pattern
                    formatter = new java.text.SimpleDateFormat("yyyyMMdd");
                } else {
                    // Assume YYYYDDMM format
                    formatter = new java.text.SimpleDateFormat("yyyyddMM");
                }
            } else if(rawDate.length == 6) {
                // 6-digit format like MMDDYY
                formatter = new java.text.SimpleDateFormat("MMddyy");
            } else {
                // Default format for other cases
                formatter = new java.text.SimpleDateFormat("yyyyMMdd");
            }

            formatter.setLenient(true); // Allow for more flexible parsing
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
        } catch (e) {
            // If parsing fails, keep the default null values
            console.log("Error parsing date: " + rawDate + ", " + e.message);
        }

        return dateObj;
    }


    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());

