var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "STUDENT_LEVEL";
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
            //Scores to Process
            {TEST: "TN_", MAP_FUNCTION: mapScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/




    var testProductDecodes = {
        "MSAA/Alt-Science/Social Studies" 	: "MSAA_ALTSCI_SS"
        ,"Alt-Science/Social Studies" 	    : "ALTSCI_SS"
        ,"TNReady"	                        : "TNR"
        ,"TN Ready"	                        : "TNR"
        ,"MSAA"                             : "MSAA"
        ,"MSAA/Alt-Science"	                : "MSAA_ASCI"
        ,"ALT_SCI"	                        : "ALTSCI"
        ,"Alt-Social Studies"	            : "ALTSS"
        ,"EOC"	                            : "EOC"
        ,"Achievement"	                    : "ACH"
        ,"WIDA ACCESS"                      : "WA"
    };

    var testSubjectDecodes = {
        "ELA" 	            :"ELA"
        ,"English I"         :"ENG_I"
        ,"English II"        :"ENG_II"
        ,"English III"       :"ENG_III"
        ,"Math"	            : "MA"
        ,"Geometry"	        : "GEOM"
        ,"Algebra I"	    : "ALG_I"
        ,"Algebra II"	    : "ALG_II"
        ,"Integrated Math I"	    : "INT_MA_I"
        ,"Integrated Math II"	    : "INT_MA_II"
        ,"Integrated Math III"	    : "INT_MA_III"
        ,"Science"          : "SCI"
        ,"Chemistry"        : "CHEM"
        ,"Biology I"        : "BIO_I"
        ,"Social Studies"   : "SS"
        ,"US History"       : "USHIST"
        ,""                 : "NA"
        ,null               : "NA"
    };

    var performanceLevels = {
        "Below" 	            :"1"
        ,"Approaching"          :"2"
        ,"On Track"             :"3"
        ,"Mastered"             :"4"
        ,"Below Basic"          :"1"
        ,"Basic"                :"2"
        ,"Proficient"           :"3"
        ,"Advanced"             :"4"
        ,"1. Below" 	            :"1"
        ,"2. Approaching"          :"2"
        ,"3. On Track"             :"3"
        ,"4. Mastered"             :"4"
        ,"1. Below Basic"          :"1"
        ,"2. Basic"                :"2"
        ,"3. Proficient"           :"3"
        ,"4. Advanced"             :"4"
        ,null                      : null
    };
    var performanceText = {
        "Below" 	            :"Below"
        ,"Approaching"          :"Approaching"
        ,"On Track"             :"On Track"
        ,"Mastered"             :"Mastered"
        ,"Below Basic"          :"Below Basic"
        ,"Basic"                :"Basic"
        ,"Proficient"           :"Proficient"
        ,"Advanced"             :"Advanced"
        ,"1. Below" 	           :"Below"
        ,"2. Approaching"          :"Approaching"
        ,"3. On Track"             :"On Track"
        ,"4. Mastered"             :"Mastered"
        ,"1. Below Basic"          :"Below Basic"
        ,"2. Basic"                :"Basic"
        ,"3. Proficient"           :"Proficient"
        ,"4. Advanced"             :"Advanced"
        ,null                      : null
    };
    var performancePassing = {
        "Below" 	            :"No"
        ,"Approaching"          :"No"
        ,"On Track"             :"Yes"
        ,"Mastered"             :"Yes"
        ,"Below Basic"          :"No"
        ,"Basic"                :"No"
        ,"Proficient"           :"Yes"
        ,"Advanced"             :"Yes"
        ,"1. Below" 	           :"No"
        ,"2. Approaching"          :"No"
        ,"3. On Track"             :"Yes"
        ,"4. Mastered"             :"Yes"
        ,"1. Below Basic"          :"No"
        ,"2. Basic"                :"No"
        ,"3. Proficient"           :"Yes"
        ,"4. Advanced"             :"Yes"
        ,null                      : null
    };

    var ref_GradeDecodes = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "KG",
        "K": "KG",
        "0" : "KG",
        "All Grades": "AG",
        "Missing Grade": "MG"
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
        var schoolYear = hierarchy.SCHOOL_YEAR;
        var birthDateObject = {
                                  RAW_DATE : null
                                  , MONTH : null
                                  , DAY : null
                                  , YEAR : null
                                  , STANDARD_DATE : null
                              };


        var semester = "Spring";
        if(row.getField("SEMESTER")!==undefined && row.getField("SEMESTER")!==null){
            semester = row.getField("SEMESTER");
        }

        var datePart = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5);
        if(row.getField("SEMESTER")!==undefined && row.getField("SEMESTER")!==null
            && row.getField("SEMESTER")=="Fall"){
            datePart = "12/15/"+hierarchy.SCHOOL_YEAR.substring(0,4);
        }
        var testDateObject = {
                                 RAW_DATE : null
                                 , MONTH : null
                                 , DAY : null
                                 , YEAR : null
                                 , STANDARD_DATE : null
                             };
        testDateObject.STANDARD_DATE = datePart;

        /*  pre UIHN-9419:
        var trimmedDistrictCode =  _util.coalesce(
                    row.getField("SYSTEM")
                    ,AssessmentLoader.config.DISTRICT_CODE
                    , ""
                );
         */

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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   trimmedDistrictCode;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = semester;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
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
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL")
                        ,"DIST"
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATEL_ID = _util.coalesce(
                        row.getField("SCHOOL")
                        ,"DIST"
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(ref_GradeDecodes[row.getField("GRADE")]);
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

        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/


    function mapScore(row, testMetadata) {

        var score = {};

        var valid = row.getField("VALID_TEST");
        if(valid === "0"){
            return null;
        }
        var scaledScore = row.getField("SCALE_SCORE");
        var percentile = row.getField("PERCENTILE");
        var performance = row.getField("PERFORMANCE_LEVEL");

        var testNumber =testMetadata.TEST + testProductDecodes[row.getField("TEST")]
            + "_" + testSubjectDecodes[row.getField("SUBJECT")];

        // Check for key fields and do not map score and exit if conditions met.
        if((_util.trim(performance) === "" || _util.trim(performance) === null || _util.trim(performance) === undefined)&&
            (_util.trim(scaledScore) === "" || _util.trim(scaledScore) === null || _util.trim(scaledScore) === undefined)
        ) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCALED_SCORE"] = scaledScore;
            score["TEST_SCORE_VALUE"] = scaledScore;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevels[performance];
        score["TEST_PRIMARY_RESULT"] = performanceText[performance];
        score["TEST_PASSED_INDICATOR"] = performancePassing[performance];


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

        assessmentAdminKey = assessmentAdminKey + "_" +   testSubjectDecodes[srcRecord.getField("SUBJECT")];
        assessmentAdminKey = assessmentAdminKey + "_" +  hierarchy.SCHOOL_YEAR;

        var semester = "Spring";
        if(srcRecord.getField("SEMESTER")!==undefined && srcRecord.getField("SEMESTER")!==null){
            semester = srcRecord.getField("SEMESTER");
        }
        assessmentAdminKey = assessmentAdminKey + "_" +  semester;


        return assessmentAdminKey;

    }

    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
