var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AMATH";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;
    /**
    *
    * Admin period values to generate separate admin keys
    */
    var adminPeriods = [
        "Fall",
        "Winter",
        "Spring"
    ];
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
            print("Loading using signature file ${signatureFormatName} \n");

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
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found/ No Test Date", JSON.stringify(row)));
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
    var scoresToMap =
        [
           {TEST: "AMATH", CODE:"Fall", FIELD: "FALL_AMATH_", MAP_FUNCTION: mapScaledScore}
           , {TEST: "AMATH", CODE:"Fall_MS", FIELD: "FALL_MS_AMATH_", MAP_FUNCTION: mapScaledScore}
           , {TEST: "AMATH", CODE:"Winter", FIELD: "WINTER_AMATH_", MAP_FUNCTION: mapScaledScore}
           , {TEST: "AMATH", CODE:"Spring", FIELD: "SPRING_AMATH_", MAP_FUNCTION: mapScaledScore}
           , {TEST: "AMATH", CODE:"Spring_MS", FIELD: "SPRING_MS_AMATH_", MAP_FUNCTION: mapScaledScore}
           , {TEST: "AMATH", CODE:"Winter_FMA", FIELD: "FEB_MAR_AMATH_", MAP_FUNCTION: mapScaledScore}
           , {TEST: "AMATH", CODE:"Winter_FTW", FIELD: "_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Spring_FTS", FIELD: "_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Spring_WTS", FIELD: "_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"FALL_FTFMS", FIELD: "_FALL_TO_FALL_MS", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Spring_FTSMS", FIELD: "_FALL_TO_SPRING_MS", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Spring_SMSTS", FIELD: "_SPRING_MS_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Winter_FMSTW", FIELD: "_FALL_MS_TO_WINTER", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Spring_FMSTSMS", FIELD: "_FALL_MS_TO_SPRING_MS", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Spring_FMSTS", FIELD: "_FALL_MS_TO_SPRING", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Spring_WTSMS", FIELD: "_WINTER_TO_SPRING_MS", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Winter_FTFM", FIELD: "_FALL_TO_FEB_MAR", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Winter_WTFM", FIELD: "_WINTER_TO_FEB_MAR", MAP_FUNCTION: mapGrowthScore}
           , {TEST: "AMATH", CODE:"Spring_FMTS", FIELD: "_FEB_MAR_TO_SPRING", MAP_FUNCTION: mapGrowthScore}

        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
        "One"          :   "01",
        "Two"          :   "02",
        "Three"        :   "03",
        "Four"         :   "04",
        "Five"         :   "05",
        "Six"          :   "06",
        "Seven"        :   "07",
        "Eight"        :   "08",
        "Nine"         :   "09",
        "Ten"          :   "10",
        "Eleven"       :   "11",
        "Twelve"       :   "12",
        "Kindergarten" :   "KG",
        "Primary"      :   "PK",
        null           : null,
        ""             : null
    };
    var primaryDecode = {
        "VL"             :   "Very Low Risk",
        "CP"             :   "Very Low Risk",
        "highRisk"       :   "High Risk",
        "someRisk"       :   "Some Risk",
        "lowRisk"        :   "Low Risk",
        "Low Risk"       :   "Low Risk",
        "Some Risk"      :   "Some Risk",
        "Very Low Risk"  :   "Very Low Risk",
        "High Risk"      :   "High Risk",
        "EX"             :   "Exceeds",
        "EC"             :   "Exceeds",
        "LR"             :   "Low Risk",
        "HR"             :   "High Risk",
        "SR"             :   "Some Risk",
        "OT"             :   "On Track",
        "AD"             :   "Advanced",
        null             : null,
        ""               : null
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
        /*adminPeriods.forEach(function(period){
            var record = mapNormalizedRecord(signature, hierarchy, row, period);
            AppUtil.nullSafePush(normalizedRecords, record);
        });*/
        for(var i=0; i<adminPeriods.length; i++) {
            var record = mapNormalizedRecord(signature, hierarchy, row, adminPeriods[i], i);
            AppUtil.nullSafePush(normalizedRecords, record);
        }
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
    function mapNormalizedRecord(signature, hierarchy, row, period, periodIndex) {
        var record = {};
        var mappingObject = {};
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields

        record = mapNormalizedAdminFields(signature, hierarchy, row, period, periodIndex) ;

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, period, periodIndex);
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
    

    function mapNormalizedAdminFields(signature, hierarchy, row, period) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var springDate = _util.coalesce(row.getField("SPRING_AMATH_FINAL_DATE"), row.getField("SPRING_MS_AMATH_FINAL_DATE"));
        var winterDate = _util.coalesce(row.getField("WINTER_AMATH_FINAL_DATE"), row.getField("FEB_MAR_AMATH_FINAL_DATE"));
        var fallDate = _util.coalesce(row.getField("FALL_AMATH_FINAL_DATE"), row.getField("FALL_MS_AMATH_FINAL_DATE"));
        var recentDate;

        if(period === "Fall") {
            recentDate =  fallDate ;
        } else if(period === "Winter") {
            recentDate =  winterDate ;
        } else if(period === "Spring") {
            recentDate =  springDate ;
        } else {
            recentDate = null;
        }

        if(recentDate !== null && recentDate !== "" && recentDate !== undefined){
            var testAdminDate = AppUtil.getMonthFollowedByDay(recentDate).STANDARD_DATE;
        }

        if(row.getField("GENDER") !== null && row.getField("GENDER") !== "" && row.getField("GENDER") !== undefined){
            var gender = row.getField("GENDER").substring(0,1);
        }

        var birthDateObject = parseDate(row.getField("DOB"));

        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, period);
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
                    record.REPORTING_PERIOD = period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testAdminDate;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("LOCAL_ID")));
                    break;
              case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STATE_ID")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("LOCAL_ID")));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(gender, null);
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
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
       return {}
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata, period, periodIndex) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata, periodIndex);
        var testSplit = testNumber.split("_")[1];

        if(testSplit === period) {
           var scaleScore = row.getField(testMetadata.FIELD +"TEST_THETA");
           var primary = row.getField(testMetadata.FIELD +"RISK_LEVEL");
           var percentileSchool = row.getField(testMetadata.FIELD +"PERCENTILE_AT_SCHOOL");
           var percentileLEA = row.getField(testMetadata.FIELD +"PERCENTILE_AT_LEA");
           var percentileNation = row.getField(testMetadata.FIELD +"PERCENTILE_AT_NATION");
           var uniqueDate = row.getField(testMetadata.FIELD +"FINAL_DATE");
           var quantile = row.getField(testMetadata.FIELD +"QUANTILE");
         /*  if(quantile !== null && quantile !== undefined && quantile === ""){
           quantile = quantile.replace("Q","");
           }*/
        }
        else
        {
           return null;
        }

        //Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null
            || scaleScore === undefined
            || _util.trim(scaleScore) === "--"
            || _util.trim(scaleScore) === ""
            || uniqueDate === ""
            || uniqueDate === null) {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PRIMARY_RESULT_CODE"] = primary;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
    	score["TEST_SCORE_ATTRIBUTES"] = uniqueDate;
    	score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
    	score["TEST_SECONDARY_RESULT"] = percentileSchool;
    	score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
    	score["TEST_TERTIARY_RESULT"] = percentileLEA;
    	score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
    	score["TEST_QUATERNARY_RESULT"] = percentileNation;
    	score["TEST_PERCENTILE_SCORE"] = percentileNation;
    	if(quantile !== null && quantile !== "" && quantile !== undefined){
                    score["TEST_QUARTILE_SCORE"] = quantile.replace("Q","");
                }
    	//score["TEST_QUARTILE_SCORE"] = quantile;
        return score;
    }
    function mapGrowthScore(row, testMetadata, period, periodIndex) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata, periodIndex);
        var testSplit = testNumber.split("_")[1];

        if(testSplit === period) {
            var growthScore = row.getField("GROWTH_SCORE_FROM"+testMetadata.FIELD);
            var growthPercentile = row.getField("NATIONAL_GROWTH_PERCENTILE_FROM"+testMetadata.FIELD);
            var growthStart = row.getField("GROWTH_PERCENTILE_BY_START_SCORE_FROM"+testMetadata.FIELD);
            var growthSchool = row.getField("SCHOOL_GROWTH_PERCENTILE_FROM"+testMetadata.FIELD);
        }
        else {
            return null;
        }

        //Check for key fields and do not map score and exit if conditions met.
        if(growthScore === null || growthScore === undefined || _util.trim(growthScore) === "--" || _util.trim(growthScore) === "") {
            return null;
        }
        if(growthPercentile!==undefined&&growthPercentile!==null){
            growthPercentile = parseInt(growthPercentile);
        }
        if(growthStart!==undefined&&growthStart!==null){
            growthStart = parseInt(growthStart);
        }
        if(growthSchool!==undefined&&growthSchool!==null){
            growthSchool = parseInt(growthSchool);
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = growthScore;
        score["TEST_GROWTH_RESULT"] = growthScore;
        if(!isNaN(growthScore)){
            score["TEST_SCORE_VALUE"] = growthScore;
            score["TEST_SCALED_SCORE"] = growthScore;
        }
    	score["TEST_PERCENTILE_SCORE"] = growthPercentile;
    	score["TEST_GROWTH_PERCENTILE"] = growthPercentile;
    	score["TEST_GROWTH_TARGET_1"] = growthStart;
    	score["TEST_GROWTH_TARGET_2"] = growthSchool;

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
            for(var i=0; i<adminPeriods.length; i++) {
                var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, adminPeriods[i]);
                var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, adminPeriods[i]);
                if(assessmentAdminKey_one === assessmentAdminKey_two) {
                    return 1;
                } else {
                    return -1;
                }
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, period) {

        var assessmentAdminKey = null;
        // Set base assessment admin key information based on period
        if(period===undefined){
             assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        }
        else{
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}";
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        // Add the Final date
        if(period === "Fall") {
            if(_util.coalesce(srcRecord.getField("FALL_AMATH_FINAL_DATE"),srcRecord.getField("FALL_MS_AMATH_FINAL_DATE"))) {
                assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("FALL_AMATH_FINAL_DATE"),srcRecord.getField("FALL_MS_AMATH_FINAL_DATE"),"");
            } else {
                // Default date for FALL
                assessmentAdminKey = assessmentAdminKey +  "_" + "09/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
            }
        } else if(period === "Winter") {
            if(_util.coalesce(srcRecord.getField("WINTER_AMATH_FINAL_DATE"), srcRecord.getField("FEB_MAR_AMATH_FINAL_DATE"))) {
                assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("WINTER_AMATH_FINAL_DATE"), srcRecord.getField("FEB_MAR_AMATH_FINAL_DATE"), "");
            } else {
                // Default date for WINTER
                assessmentAdminKey = assessmentAdminKey +  "_" + "01/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
            }
        } else if(period === "Spring") {
            if(_util.coalesce(srcRecord.getField("SPRING_AMATH_FINAL_DATE"),srcRecord.getField("SPRING_MS_AMATH_FINAL_DATE"))) {
                assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("SPRING_AMATH_FINAL_DATE"),srcRecord.getField("SPRING_MS_AMATH_FINAL_DATE"),"");
            } else {
                // Default date for SPRING
                assessmentAdminKey = assessmentAdminKey +  "_" + "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(0,4)}";
            }
        }
        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata, periodIndex) {
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + periodIndex;
        return testNumber;
    }

        function parseDate(rawDate) {
            try{
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

                // Check for format MM-dd-yyyy
                if (rawDate.length() === 10 && rawDate.indexOf('/') !== -1) {
                    formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
                } else if (rawDate.length() === 10 && rawDate.indexOf('-') !== -1) {
                    formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
                } else if (rawDate.indexOf('/') !== -1 && rawDate.length() === 8) {
                    formatter = new java.text.SimpleDateFormat('MM/dd/yy');
                } else if (rawDate.indexOf('/') !== -1 && rawDate.length() === 7 && rawDate.split("/")[0].length() === 1) {
                    rawDate = "0" + rawDate;
                    formatter = new java.text.SimpleDateFormat('MM/dd/yy');
                } else if (rawDate.indexOf('/') !== -1 && rawDate.length() === 7 && rawDate.split("/")[1].length() === 1) {
                    formatter = new java.text.SimpleDateFormat('MM/d/yy');
                } else if (rawDate.indexOf('/') !== -1 && rawDate.length() === 6 && rawDate.split("/")[1].length() === 1) {
                    rawDate = "0" + rawDate;
                    formatter = new java.text.SimpleDateFormat('MM/d/yy');
                } else{
                    return dateObj;
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
            catch(e){
                print("Error in date parsing: "+e);
            }
        }

    return module;
}());