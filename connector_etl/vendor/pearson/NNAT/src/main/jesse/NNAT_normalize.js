var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NNAT";
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
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch(exception) {
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
            {TEST: "NNAT", CODE:"OVR", FIELD: "", MAP_FUNCTION: mapScaledScore},
            {TEST: "NNAT", CODE:"LCL", FIELD: "LOCAL_", MAP_FUNCTION: mapScaledScore},
        ];


    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
         "KN" 	: "KG"
         ,"KG" 	: "KG"
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
         ,"PK"  : "PK"
         , null : null
         , "" : null
     };
    /*var primaryDecode = {
        "VL"     :   "Very Low Risk",
        "CP"     :   "Very Low Risk",
        "highRisk"     :   "High Risk",
        "someRisk"     :   "Some Risk",
        "lowRisk"     :   "Low Risk",
        null    : null,
        ""      : null
    };*/

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
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
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


        if (row.getField("DOB").indexOf("/") > -1){
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "MM/dd/yyyy");
        }else if(row.getField("DOB").indexOf("-") > -1){
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "MM-dd-yyyy");
        }
        else{
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "MMddyyyy");
        }
      if(row.getField("SCHOOLNUM")!== null) {
      var schoolnum = row.getField("SCHOOLNUM").toString().replace(AssessmentLoader.config.DISTRICT_CODE,"");
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
                      record.TEST_ADMIN_DATE = getTestAdminDate(row, hierarchy);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENTID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENTID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRSTNAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LASTNAME"));
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
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesceEmptyString(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(schoolnum);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(schoolnum);
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOLNAME"));
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

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(row) {
       return {}
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata) {
             var score = {};
             var testNumber = testMetadata.TEST + "_" + testMetadata.CODE+"_"+ row.getField("TEST_LEVEL");
             var scaleScore = row.getField(testMetadata.FIELD +"SS");
             var rawScore = row.getField(testMetadata.FIELD +"RS");
             var nai = row.getField(testMetadata.FIELD +"NAI");
             var pr = row.getField(testMetadata.FIELD +"PR");
             var stanine = row.getField(testMetadata.FIELD +"STANINE");
             var nce = row.getField(testMetadata.FIELD +"NCE");
             var status = row.getField("SESSION_STATUS");
             var numAttempt = row.getField("NUMATTEMPTED");
             var form = row.getField("FORM");

             //Check for key fields and do not map score and exit if conditions met.
             if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                 return null;
             }
             if(status === null || status === undefined || _util.trim(scaleScore) === "Test cannot be scored due to insufficient responsesTest scores are available" || _util.trim(scaleScore) === "") {
                 return null;
             }

             // Set score fields
             score["TEST_NUMBER"] = testNumber;
             score["TEST_SCORE_TEXT"] = scaleScore;

             if(!isNaN(scaleScore)){
                 score["TEST_SCORE_VALUE"] = scaleScore;
                 score["TEST_SCALED_SCORE"] = scaleScore;
             }
             if(!isNaN(rawScore)){
                 score["TEST_RAW_SCORE"] = rawScore;
             }

         	score["TEST_SCORE_ATTRIBUTES"] = form;
             if(!isNaN(pr)){
                 score["TEST_PERCENTILE_SCORE"] = pr;
             }
             if(!isNaN(nce)){
                 score["TEST_NCE_SCORE"] = nce;
             }
             if(!isNaN(stanine)){
                 score["TEST_STANINE_SCORE"] = stanine;
             }
         	score["TEST_SECONDARY_RESULT_CODE"] = "NAI";
         	score["TEST_SECONDARY_RESULT"] = nai;
             if(!isNaN(numAttempt)){
                 score["TEST_ITEMS_ATTEMPTED"] = numAttempt;
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

            if(assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }
        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }
    }

    function getTestAdminDate(row, hierarchy) {
        // Retrieve the "TESTDATE" field from the row object
        var testDate = row.getField("TESTDATE");
        var testAdminDate = '';
        // Check if testDate is defined, not null, and not an empty string
        if (testDate !== undefined && testDate !== null &&
            testDate.trim() !== "") {
            // Handle dates with "/" delimiter
            if (testDate.indexOf("/") > -1) {
                testAdminDate = AppUtil.getDateObjByPattern(testDate,"MM/dd/yyyy").STANDARD_DATE;
            }
                // Handle dates with "-" delimiter
            else if (testDate.indexOf("-") > -1) {
                testAdminDate = AppUtil.getDateObjByPattern(testDate,"MM-dd-yyyy").STANDARD_DATE;
            }
                // Handle other date formats, e.g., MMddyyyy
            else if(testDate.length <= 8 ){
                testAdminDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
            }
            }
        // Handle cases where testDate is null or empty
        else { testAdminDate = '05/15/' +hierarchy.SCHOOL_YEAR.toString().substring(5, 9);
     }
    return testAdminDate;
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
        var signatureFormatName = signature.getFormat().getFormatName();

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        var someTestDate = getTestAdminDate(srcRecord, hierarchy);
        if(signatureFormatName === "NNAT" && someTestDate !== null && someTestDate !== undefined &&  someTestDate !== "") {
            assessmentAdminKey = assessmentAdminKey + "_" + someTestDate;
        }else {
             assessmentAdminKey = assessmentAdminKey + "_" + "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9);
         }

        return assessmentAdminKey;
    }

    return module;
}());