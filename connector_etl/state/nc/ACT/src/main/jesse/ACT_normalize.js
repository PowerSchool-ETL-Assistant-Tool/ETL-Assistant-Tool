var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NC_ACT";
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
            var normalizedFile = AppUtil.createResultsFile(file);
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
                    if(mappingObject.SCORE_MAPPINGS.length == 0) {
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
        {TEST: "ACT", CODE:"WR", FIELD: "WRITING", MAP_FUNCTION: mapSingleScore}
        ,{TEST: "ACT", CODE:"EN", FIELD: "ENGLISH", MAP_FUNCTION: mapSingleScore}
        ,{TEST: "ACT", CODE:"MA", FIELD: "MATH", MAP_FUNCTION: mapSingleScore}
        ,{TEST: "ACT", CODE:"RD", FIELD: "READING", MAP_FUNCTION: mapSingleScore}
        ,{TEST: "ACT", CODE:"SC", FIELD: "SCIENCE", MAP_FUNCTION: mapSingleScore}
        ,{TEST: "ACT", CODE: "STEM", FIELD: "STEM", MAP_FUNCTION: mapSingleScore }
        ,{TEST: "ACT", CODE:"TOT", FIELD: "COMPOSITE", MAP_FUNCTION: mapCompositeScore}
        ,{TEST: "ACT", CODE: "ELA", FIELD: "ELA", MAP_FUNCTION: mapELAScore }
        ,{TEST: "ACT", CODE: "WRRDSGN_IA", FIELD: "WRITING_DOMAIN_IDEAS_ANALYSIS", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "WRRDSGN_DS", FIELD: "WRITING_DOMAIN_DEVELOPMENT_SUPPORT", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "WRRDSGN_ORG", FIELD: "WRITING_DOMAIN_ORGANIZATION", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "WRRDSGN_UC", FIELD: "WRITING_DOMAIN_USE_CONVENTIONS", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "ENG_POW", FIELD: "ENGLISH_PRODUCTION_OF_WRITING", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "ENG_KOL", FIELD: "ENGLISH_KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "ENG_CSE", FIELD: "ENGLISH_CONVENTIONS_OF_STANDARD_ENGLISH", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "MATH_PHM", FIELD: "MATH_PREP_HIGHER_MATH", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "MATH_NQ", FIELD: "MATH_NUMBER_AND_QUANTITY", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "MATH_ALG", FIELD: "MATH_ALGEBRA", MAP_FUNCTION: mapRawScore }
        ,{TEST: "ACT", CODE: "SUM", FIELD: "SUM_OF_SCALE_SCORES", MAP_FUNCTION: mapOverallScaledScore }
        ];



    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "1st Grade": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "2nd Grade": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "3rd Grade": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "4th Grade": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "5th Grade": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "6th Grade": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "7th Grade": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "8th Grade": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "9th Grade": "09",
        "10": "10",
        "Grade 10": "10",
        "10th Grade": "10",
        "10th":"10",
        "11": "11",
        "Grade 11": "11",
        "11th Grade": "11",
        "11th":"11",
        "12": "12",
        "Grade 12": "12",
        "12th Grade": "12",
        "12th":"12",
        "H.S. Graduate":"13",
        "College Student":"14",
        "Other":"15",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
        , "": null
        , null: null
    };

    var progressTowardCareerReadinessDecode = {
        "0" : "Insufficient progress toward an NCRC level"
        , "1" : "Progress toward Bronze Level NCRC"
        , "2" : "Progress toward Silver level NCRC"
        , "3" : "Progress toward Gold level NCRC"
        , "4" : "Progress toward Platinum level NCRC"
        , "-" : "Unable to calculate"
        , "": null
        , null: null
    };


    var understandingComplexTextDecode = {
        "0" : "Below proficiency"
        , "1" : "Proficient"
        , "2" : "Above proficiency"
        , "-" : "Unable to calculate"
        , "": null
        , null: null
    };

    var understandingComplexTextDecode2 = {
        "Below proficiency"      :  "0"
        ,"Proficient"            :  "1"
        ,"Above proficiency"     :  "2"
        ,"Unable to calculate"   :  "-"
        , "": null
        , null: null
    };

    var metDecode = {
        "N"     : "Below College Ready"
        , "Y"   : "College Ready"
        , ""    : null
        , null  : null
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
        record = mapNormalizedAdminFields(signature, hierarchy, row);

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

        var birthDateObject = parseDate(row.getField("STUDENT_EXPANDED_BIRTHDATE_STR"));
        var testDateObject = parseSmallDate(row.getField("TEST_DATE"));

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
                        row.getField("ACT_SCHOOL_CODE")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = null;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE,'05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
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
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_VENDOR_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STUDENT_VENDOR_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STUDENT_VENDOR_ID")
                    );
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.coalesce(row.getField("STUDENT_ADDRESS"));
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STUDENT_STATE"));
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = _util.coalesce(row.getField("STUDENT_ZIP_CODE"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENT_GENDER_CODE"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE_LEVEL"))];
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
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {
        var admin = {};

        return admin;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function mapSingleScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
		var careerReadinessCode = row.getField(testMetadata.FIELD + "_CR_BENCHMARK");
		var nationNormScore = row.getField(testMetadata.FIELD + "_NATIONAL_NORM");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_SCORE_VALUE"] = scaleScore;
    	score["TEST_SCALED_SCORE"] = scaleScore;
    	score["TEST_PRIMARY_RESULT_CODE"] = careerReadinessCode;
    	score["TEST_PASSED_INDICATOR"] = careerReadinessCode;
    	score["TEST_PRIMARY_RESULT"] = metDecode[careerReadinessCode];
    	if (nationNormScore !== "" && nationNormScore !== undefined && nationNormScore !== "---" && nationNormScore !== "--") {
            score["TEST_PERCENTILE_SCORE"] = nationNormScore;
        }

        return score;
    }


    function mapCompositeScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
		var careerReadinessCode = row.getField(testMetadata.FIELD + "_CR_BENCHMARK");
		var progressReadinessCode = row.getField("PROGRESS_TOWARD_CAREER_READINESS_CODE");
		var proficiencyFlag = row.getField("PROF_DEN");
		var proficiencyNumber = row.getField("PROF_NUM");
		var nationNormScore = row.getField(testMetadata.FIELD + "_NATIONAL_NORM");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_SCORE_VALUE"] = scaleScore;
    	score["TEST_SCALED_SCORE"] = scaleScore;
    	if(progressReadinessCode==undefined || progressReadinessCode==null){
            score["TEST_PRIMARY_RESULT_CODE"] = careerReadinessCode;
            score["TEST_PASSED_INDICATOR"] = careerReadinessCode;
            score["TEST_PRIMARY_RESULT"] = metDecode[careerReadinessCode];
    	}
    	else{
            score["TEST_PRIMARY_RESULT_CODE"] = progressReadinessCode;
            score["TEST_PRIMARY_RESULT"] = progressTowardCareerReadinessDecode[progressReadinessCode];
    	}
    	score["TEST_SECONDARY_RESULT_CODE"] = proficiencyFlag;
    	score["TEST_SECONDARY_RESULT"] = proficiencyNumber;
    	if (nationNormScore !== "" && nationNormScore !== undefined && nationNormScore !== "---" && nationNormScore !== "--") {
            score["TEST_PERCENTILE_SCORE"] = nationNormScore;
        }

        return score;
    }

    function mapOverallScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var sumOfScaleScores = row.getField(testMetadata.FIELD);
        // Check for key fields and do not map score and exit if conditions met.
        if (sumOfScaleScores === null || sumOfScaleScores === undefined || _util.trim(sumOfScaleScores) === "---" || _util.trim(sumOfScaleScores) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCALED_SCORE"] = sumOfScaleScores;
        score["TEST_SCORE_VALUE"] = sumOfScaleScores;
        score["TEST_SCORE_TEXT"] = sumOfScaleScores;

        return score;
    }


    function mapRawScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");


        // Check for key fields and do not map score and exit if conditions met.
        // Set score fields
        if (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            rawScore = row.getField('POINTS_EARNED_' + testMetadata.FIELD);
        }
        if (rawScore !== null && rawScore !== undefined && _util.trim(rawScore) !== "--" && _util.trim(rawScore) !== "") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_ITEMS_POSSIBLE"] = row.getField('POINTS_POSSIBLE_' + testMetadata.FIELD);
            score["TEST_PERCENTAGE_SCORE"] = row.getField('PERCENT_CORRECT_' + testMetadata.FIELD);
            score["TEST_LOWER_BOUND"] = row.getField('READINESS_LOWER_BOUND_' + testMetadata.FIELD);
            return score;
        }

        return null;
    }


    function mapELAScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
        var nationNormScore = row.getField(testMetadata.FIELD + "_NATIONAL_NORM");
        var textComplexCode = _util.coalesce(row.getField("UNDERSTANDING_COMPLEX_TEXT_CODE"),understandingComplexTextDecode2[row.getField("UNDERSTANDING_COMPLEX_TEXT_DESC")]);
        var textComplexDesc = _util.coalesce(understandingComplexTextDecode[row.getField("UNDERSTANDING_COMPLEX_TEXT_CODE")],row.getField("UNDERSTANDING_COMPLEX_TEXT_DESC"));
        //var sigName= signature.getFormat().getFormatName();

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "--") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        if (nationNormScore !== "" && nationNormScore !== undefined && nationNormScore !== "---" && nationNormScore !== "--"  ) {
            score["TEST_PERCENTILE_SCORE"] = nationNormScore;
        }
        score["TEST_SECONDARY_RESULT_CODE"] = textComplexCode;
        score["TEST_SECONDARY_RESULT"] = textComplexDesc;
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
           + "_" + AssessmentLoader.config.DISTRICT_CODE
		   + "_" + hierarchy.SCHOOL_YEAR;


       //Add natural key fields
       signature.getFormat().getNaturalKey().forEach(function(key) {
           assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
       });


       return assessmentAdminKey;

    }


    function generateTestNumber(row, testMetadata) {

        var testNumber = testMetadata.TEST + testMetadata.CODE;

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

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }
        if (rawDate.length() > 8) {
            var formatter = new java.text.SimpleDateFormat("MM/dd/YYYY");
        }
        else if (rawDate.length === 7) {
            rawDate = "0" + rawDate;
            var formatter = new java.text.SimpleDateFormat("MMddyyyy");
        }
        else if (rawDate.length === 8) {
            var formatter = new java.text.SimpleDateFormat("MMddyyyy");
        }
        else{
            var formatter = new java.text.SimpleDateFormat("yyyyMMdd");
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


	    function parseSmallDate(rawDate) {

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

        if (rawDate.length === 5){
            rawDate = "0" + rawDate;
            var formatter = new java.text.SimpleDateFormat("MMddyy");
        }
        else if (rawDate.length === 6){
            var formatter = new java.text.SimpleDateFormat("MMddyy");
        }
        else{
            var formatter = new java.text.SimpleDateFormat("yyyyMMdd");
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