var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CELDT";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false; // Potentially true?  Requires further live testing.

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
                .group_by("ADMINISTRATION GROUPING" , function(one, two){

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + '|' + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try{
                        if(!multipleRowsPerGroupingExpected && rows.length > 1){

                            //Report error for each row
                            rows.forEach(function(row){
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("TRANSFORMATION", ["RECORDS"],
                    function(output, rows) {
                        try{

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function(record){
                                output.RECORDS.put(record);
                            });

                        } catch(exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }


                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        // Report when no scores are found.
                        if(mappingObject.SCORE_MAPPINGS.length === 0){
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

    var scoresToMap =
    [
        //CELDT Scores to Process
        {TEST: "CELDT", CODE: "LSN", SUBJECT: "LISTEN"}
        , {TEST: "CELDT", CODE: "SPK", SUBJECT: "SPEAK"}
        , {TEST: "CELDT", CODE: "RD", SUBJECT: "READ"}
        , {TEST: "CELDT", CODE: "WRT", SUBJECT: "WRITE"}
        , {TEST: "CELDT", CODE: "CPR", SUBJECT: "COMP"}
        , {TEST: "CELDT", CODE: "OVR", SUBJECT: "OVERALL"}

    ];


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var performanceLevelMetadata =
    {
        "1" : {LEVEL: '1', DESC: 'Beginning', PASS_IND:'No'},
        "2" : {LEVEL: '2', DESC: 'Early Intermediate', PASS_IND:'No'},
        "3" : {LEVEL: '3', DESC: 'Intermediate', PASS_IND:'Yes'},
        "4" : {LEVEL: '4', DESC: 'Early Advanced', PASS_IND:'Yes'},
        "5" : {LEVEL: '5', DESC: 'Advanced', PASS_IND:'Yes'}
    };




    /***********************************************************************************
        Assessment-specific decode functions
    ***********************************************************************************/

    function decodeGradeCode(gradeCode){
    	if(gradeCode === "0" || gradeCode === "00") {
    		return "KG";
    	} else {

    		if(gradeCode.length < 2){
    			return '0' + gradeCode;
    		} else {
    			return gradeCode;
    		}

    	}
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
    function mapNormalizedRecords(signature, hierarchy, rows){
        var normalizedRecords = [];

        //Only expect a single row.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        AppUtil.nullSafePush(normalizedRecords, mapNormalizedRecord(signature, hierarchy, row));


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
    function mapNormalizedRecord(signature, hierarchy, row){
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
            var score = mapScore(row, testMetadata);

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
    function mapNormalizedAdminFields(signature, hierarchy, row){
        // Map standard normalized assessment fields.
        var record = AppUtil.mapNormalizedAssessmentFields(signature, hierarchy, row);


        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);

        record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
        record.STUDENT_VENDOR_ID = row.getField("STUDENT_STATE_ID");
        record.STUDENT_GRADE_CODE = decodeGradeCode(row.getField("STUDENT_GRADE_CODE"));
        record.STUDENT_STREET_ADDRESS = _util.trim(_util.trim(_util.coalesce(row.getField("STUDENT_ADDRESS_LINE_1"), "")) + " " + _util.trim(_util.coalesce(row.getField("STUDENT_ADDRESS_LINE_2"), "")));
        record.TEST_REPORTING_DATE = "01/01/" + hierarchy.SCHOOL_YEAR.substring(5, 9);

        var testDate = row.getField("TEST_ADMIN_DATE_STR");

        if(testDate.length < 8 ){
            testDate = "0" + testDate;
        }
        record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(testDate,"MMddyyyy").STANDARD_DATE;

        /*  pre UIHN-9419:
        var folderDistrictCode = AssessmentLoader.config.DISTRICT_CODE;
        var districtCode = _util.coalesce(
                                            row.getField("COUNTY_CODE") + row.getField("DISTRICT_CODE")
                                            , row.getField("COUNTY_CODE") + row.getField("COUNTY_DISTRICT_RES")
                                            , folderDistrictCode
                                            , ""
                                         );

        record.DISTRICT_CODE = districtCode;
        */
        record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; // pre UIHN-9419:  districtCode;

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
    function mapAdditionalAdminFields(row){

        var admin = {};

        return admin;
    }



    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function mapScore(row, testMetadata){

        var score = {};

        var testNumber = _assessmentIdentifier + testMetadata.CODE;
        var passInd = null;

        var scaleScore = row.getField(testMetadata.SUBJECT +  "_TEST_SCALED_SCORE");
        var rawScore = row.getField(testMetadata.SUBJECT +  "_TEST_RAW_SCORE");
        var standardError = row.getField(testMetadata.SUBJECT +  "_TEST_STANDARD_ERROR");
        var performanceLevelCode = _util.trim(row.getField(testMetadata.SUBJECT + "_TEST_PRIMARY_RESULT_CODE"));


        // Do not map score if primary value is not set.
        if(_util.trim(_util.coalesce(scaleScore,"")) === ""){
            return null;
        }

        // Set score mapping fields.
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_STANDARD_ERROR"] = standardError;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelCode;
        score["TEST_PRIMARY_RESULT"] = performanceLevelMetadata[performanceLevelCode] === undefined ? null : performanceLevelMetadata[performanceLevelCode].DESC;


        //Set passing indicator based on the CELDT CRITERION if reviewing the overall score
        if(testMetadata.SUBJECT === "OVERALL"){

            var celdtCriterion = row.getField('CELDT_CRITERION');

            if(_util.trim(_util.coalesce(celdtCriterion,"")) === ""){
                score["TEST_PASSED_INDICATOR"] = 'No';
            } else if(celdtCriterion == '1' && +performanceLevelCode > 3){
                score["TEST_PASSED_INDICATOR"] = 'Yes';
            } else {
                score["TEST_PASSED_INDICATOR"] = 'No';
            }

        } else {
            score["TEST_PASSED_INDICATOR"] = performanceLevelMetadata[performanceLevelCode] === undefined ? null : performanceLevelMetadata[performanceLevelCode].PASS_IND;
        }


        return score;

    }

    /***************************************************************************
        Utility Functions
    ***************************************************************************/


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

            var formatter = new java.text.SimpleDateFormat("MMddyyyy");
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

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two){

        try {

           // Note: Admin year isn't required for sorting. Should be left blank.
           var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
           var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);

           if(assessmentAdminKey_one === assessmentAdminKey_two){
               return 1;
           } else {
               return -1;
           }

       } catch (exception) {
           throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
       }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord){

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE
            + "_" + _util.coalesce(srcRecord.getField("SCHOOL_YEAR"), "") // Called the Edition field in the source file.
            + "_" + _util.coalesce(srcRecord.getField("BATCH_SCAN"), "")
            + "_" + _util.coalesce(srcRecord.getField("TEST_ADMIN_DATE_STR"), "");

        return assessmentAdminKey;

    }



    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());
