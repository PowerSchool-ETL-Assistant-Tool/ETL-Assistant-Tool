var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ELPAC";
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
            // ELPAC Scores to Process
            {TEST: "ELPAC", CODE: "OVR", FIELD:"", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "ELPAC", CODE: "ORAL", FIELD: "ORAL_LANGUAGE", MAP_FUNCTION: mapScore}
            , {TEST: "ELPAC", CODE: "WL", FIELD: "WRITTEN_LANGUAGE", MAP_FUNCTION: mapScore}
            , {TEST: "ELPAC", CODE: "LIS", FIELD: "LISTENING", MAP_FUNCTION: mapStrandScore}
            , {TEST: "ELPAC", CODE: "SPE", FIELD: "SPEAKING", MAP_FUNCTION: mapStrandScore}
            , {TEST: "ELPAC", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapStrandScore}
            , {TEST: "ELPAC", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapStrandScore}
            , {TEST: "ELPAC", CODE: "RI", FIELD: "RESEARCH_AND_INQUIRY", MAP_FUNCTION: mapStrandScore}
            , {TEST: "ELPAC", CODE: "CLS", FIELD: "CAST_LIFE", MAP_FUNCTION: mapStrandScore}
            , {TEST: "ELPAC", CODE: "CPS", FIELD: "CAST_PHYSICAL", MAP_FUNCTION: mapStrandScore}
            , {TEST: "ELPAC", CODE: "CEPS", FIELD: "CAST_EARTH_AND_SPACE", MAP_FUNCTION: mapStrandScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KG"   : "KG"
        ,"KN"   : "KG"
        ,"01"	: "01"
        ,"02"	: "02"
        ,"03"	: "03"
        ,"04"	: "04"
        ,"05"	: "05"
        ,"06"	: "06"
        ,"07"	: "07"
        ,"08"	: "08"
        ,"09"	: "09"
        ,"1"	: "01"
        ,"2"	: "02"
        ,"3"	: "03"
        ,"4"	: "04"
        ,"5"	: "05"
        ,"6"	: "06"
        ,"7"	: "07"
        ,"8"	: "08"
        ,"9"	: "09"
        ,"10"	: "10"
        ,"11"	: "11"
        ,"12"	: "12"
        ,"G1"   : "01"
        ,"G2"   : "02"
        ,"G3"   : "03"
        ,"G4"   : "04"
        ,"G5"   : "05"
        ,"G6"   : "06"
        ,"G7"   : "07"
        ,"G8"   : "08"
        ,"G9"   : "09"
        ,"G10"  : "10"
        ,"G11"  : "11"
        ,"G12"  : "12"
        ,"UE"	: "UE" //ungraded elementary
        ,"US"	: "US" //ungraded secondary
        ,"UG"	: "UG" //ungraded
    };


    var decodePerformanceLevel = {
    	'1' : {CODE: '1', DESC: 'Level 1', PASS: 'No'},
    	'2' : {CODE: '2', DESC: 'Level 2', PASS: "No"},
    	'3' : {CODE: '3', DESC: 'Level 3', PASS: 'Yes'},
    	'4' : {CODE: '4', DESC: 'Level 4', PASS: 'Yes'},
    	'E' : {CODE: 'E', DESC: 'Exempt', PASS: null},
    	'Level 1' : {CODE: '1', DESC: 'Level 1', PASS: 'No'},
    	'Level 2' : {CODE: '2', DESC: 'Level 2', PASS: 'No'},
    	'Level 3' : {CODE: '3', DESC: 'Level 3', PASS: 'Yes'},
    	'Level 4' : {CODE: '4', DESC: 'Level 4', PASS: 'Yes'},
    	null : {CODE: null, DESC: null, PASS: null}
    };

    var decodePerformanceLevelText = {
        "1" 	: "Minimally Developed"
        ,"2"	: "Somewhat Developed"
        ,"3"	: "Moderately Developed"
        ,"4"	: "Well Developed"
        ,"E"    : "Exempt"
        ,null	: null
    };

    var decodePerformanceLevelStrand = {
        "3" 	: "Well Developed"
        ,"2"	: "Somewhat/Moderately"
        ,"1"	: "Beginning"
        ,"1"    : "Beginning to Develop"
        ,"E"    : "Exempt"
        ,"Near Standard" : "NS"
        ,"Above Standard" : "AS"
        ,"Below Standard" : "BS"
        ,null	: null
    };

    var decodeConditionCodes = {
        "NT"    : "Not Tested",
        "AT"    : "Alternate Assessment"
    };

    var decodeAttemptedness = {
        "N"     : "Non-Completion",
        "P"     : "Partial-Completion",
        "Y"     : "Completion"
    };

    var decodeIncludeIndicator = {
        "N"     : "Did not test",
        "T"     : "Tested and received ALT condition code",
        "Y"     : "Student met completion/attemptedness"
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

        try{
            if (test_completed = row.getField("TESTING_COMPLETED_DATE")!== null && row.getField("TESTING_COMPLETED_DATE")!== ""){
                testDateObject = parseDate(row.getField("TESTING_COMPLETED_DATE"));
            }else {
                var dates = [];
                //Some students only have certain dates, only those should be included or it causes an undefined date object.
                if(row.getField("TESTING_COMPLETED_DATE_FINAL")!==null && row.getField("TESTING_COMPLETED_DATE_FINAL") !== ""){
                    dates.push(new Date(row.getField("TESTING_COMPLETED_DATE_FINAL")+"Z"));
                }
                if(row.getField("TESTING_COMPLETED_DATE_LISTENING")!==null && row.getField("TESTING_COMPLETED_DATE_LISTENING") !== ""){
                    dates.push(new Date(row.getField("TESTING_COMPLETED_DATE_LISTENING")+"Z"));
                }
                if(row.getField("TESTING_COMPLETED_DATE_READING")!==null && row.getField("TESTING_COMPLETED_DATE_READING") !== ""){
                    dates.push(new Date(row.getField("TESTING_COMPLETED_DATE_READING")+"Z"));
                }
                if(row.getField("TESTING_COMPLETED_DATE_SPEAKING")!==null && row.getField("TESTING_COMPLETED_DATE_SPEAKING") !== ""){
                    dates.push(new Date(row.getField("TESTING_COMPLETED_DATE_SPEAKING")+"Z"));
                }
                if(row.getField("TESTING_COMPLETED_DATE_WRITING")!==null && row.getField("TESTING_COMPLETED_DATE_WRITING") !== ""){
                    dates.push(new Date(row.getField("TESTING_COMPLETED_DATE_WRITING")+"Z"));
                }
                var maximumDate=new Date(Math.max.apply(null, dates));

                var isoD = maximumDate.toISOString();

                var format = (isoD.substring(0,10));
                //print(format);
                testDateObject = parseDate(format);
           }
        }
        catch(e) {
            // ignore expected range errors
            if(e.name !== 'RangeError') {
                print(e);
            }
        }

        /*  pre UIHN-9419:
        var trimmedDistrictCode =  _util.coalesce(
                    row.getField("TESTED_COUNTY_DISTRICT_CODE")
                    , row.getField("CALPADS_DISTRICT_CODE")
                    , AssessmentLoader.config.DISTRICT_CODE
                    , ""
                );

        if(trimmedDistrictCode.length > 7){
            trimmedDistrictCode = trimmedDistrictCode.substring(0,7)
            };
         */

        //Loop through normalized fields and map if possible.

        module.mapDateObject = function(hierarchy, row, dateStr) {
                //Create empty test date object.
                var adminDate = null

                if (adminDate === null) {
                   try {
                      adminDate = AppUtil.getDateObjByPattern(dateStr, "MMM dd, yyyy");
                   } catch (exception) {
                      // Error will be reported in final check.
                   }
                }
                if(adminDate === null){
                    try {
                        adminDate = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
                    } catch(exception){
                        // Error will be reported in final check.
                    }
                }
                // Set default empty objects if mappings fail and report error.
                if (adminDate === null) {
                   adminDate = AppUtil.getEmptyDateObj(dateStr);
                   AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing date string: ${dateStr}", JSON.stringify(row.getSourceRow())));
                }

                return adminDate;
             }
        normalizedFileFields.forEach(function (field) {

        const dateFormat = module.mapDateObject(hierarchy, row, row.getField("SUBMIT_DATE_TIME"));

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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; // pre UIHN-9419:  trimmedDistrictCode;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
//                case "TEST_REPORTING_DATE":
//                    record.TEST_REPORTING_DATE = '01/01/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
//                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("TESTED_SCHOOL_CODE")
                        , row.getField("TESTED_SCHOOL_CODE_FINAL")
                        , row.getField("TESTED_SCHOOL_CODE_LISTENING")
                        , row.getField("TESTED_SCHOOL_CODE_SPEAKING")
                        , row.getField("TESTED_SCHOOL_CODE_READING")
                        , row.getField("TESTED_SCHOOL_CODE_WRITING")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE")
                        , row.getField("CALPADS_SCHOOL_CODE")
                        , row.getField("CALPADS_CHARTER_CODE")
                        , row.getField("SCHOOL_NAME")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("TESTED_SCHOOL_NAME")
                        , row.getField("TESTED_SCHOOL_NAME_FINAL")
                        , row.getField("TESTED_SCHOOL_NAME_LISTENING")
                        , row.getField("TESTED_SCHOOL_NAME_SPEAKING")
                        , row.getField("TESTED_SCHOOL_NAME_READING")
                        , row.getField("TESTED_SCHOOL_NAME_WRITING")
                        , row.getField("SCHOOL_NAME")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("TESTED_SCHOOL_CODE")
                        , row.getField("TESTED_SCHOOL_CODE_FINAL")
                        , row.getField("TESTED_SCHOOL_CODE_LISTENING")
                        , row.getField("TESTED_SCHOOL_CODE_SPEAKING")
                        , row.getField("TESTED_SCHOOL_CODE_READING")
                        , row.getField("TESTED_SCHOOL_CODE_WRITING")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE")
                        , row.getField("CALPADS_SCHOOL_CODE")
                        , row.getField("CALPADS_CHARTER_CODE")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("TESTED_SCHOOL_CODE")
                        , row.getField("TESTED_SCHOOL_CODE_FINAL")
                        , row.getField("TESTED_SCHOOL_CODE_LISTENING")
                        , row.getField("TESTED_SCHOOL_CODE_SPEAKING")
                        , row.getField("TESTED_SCHOOL_CODE_READING")
                        , row.getField("TESTED_SCHOOL_CODE_WRITING")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE")
                        , row.getField("CALPADS_SCHOOL_CODE")
                        , row.getField("CALPADS_CHARTER_CODE")
                    );
                    break;
                case "TEST_ADMIN_DATE":
                    // record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    record.TEST_ADMIN_DATE = _util.coalesce(dateFormat.STANDARD_DATE, testDateObject.STANDARD_DATE, '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
                    break;
                // case "TEST_REPORTING_DATE":
                //     record.TEST_REPORTING_DATE = null;
                    // break;
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
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADE_ASSESSED"), row.getField("CALPADS_GRADE")));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"), row.getField("STUDENT_STATE_ID"));
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.trim(row.getField("STUDENT_ADDRESS_LINE_1")) + " " + _util.trim(row.getField("STUDENT_ADDRESS_LINE_2"));
                    break;
                case "STUDENT_CITY":
                    record.STUDENT_CITY = _util.trim(row.getField("STUDENT_CITY"));
                    break;
                case "STUDENT_STATE_CODE":
                    // Remove leading "US-" from code and "-CAM" from "MX_CAM" . Ex: "US-CA", "MA-CAM"
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STUDENT_STATE_CODE") === null ? null : row.getField("STUDENT_STATE_CODE").toString().replace("US-CA","CA").replace("MX-CAM","MX"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENT_GENDER"), "").substring(0,1);
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

        if (_util.trim(row.getField("CONDITION_CODE")) !== "") {
            admin.TEST_INTERVENTION_CODE = _util.trim(row.getField("CONDITION_CODE"));
            admin.TEST_INTERVENTION_DESC = decodeConditionCodes[admin.TEST_INTERVENTION_CODE] === undefined ? null : decodeConditionCodes[admin.TEST_INTERVENTION_CODE];
        }

        admin.TEST_INTERVENTION_CODE_2 = row.getField("ATTEMPTEDNESS");
        admin.TEST_INTERVENTION_DESC_2 = decodeAttemptedness[admin.TEST_INTERVENTION_CODE_2] === undefined ? null : decodeAttemptedness[admin.TEST_INTERVENTION_CODE_2];
        admin.TEST_INTERVENTION_CODE_3 = row.getField("INCLUDE_INDICATOR");
        admin.TEST_INTERVENTION_DESC_3 = decodeIncludeIndicator[admin.TEST_INTERVENTION_CODE_3] === undefined ? null : decodeIncludeIndicator[admin.TEST_INTERVENTION_CODE_3];
        admin.TEST_INTERVENTION_CODE_4 = "NPSFLAG";
        admin.TEST_INTERVENTION_DESC_4 = row.getField("NPS_SCHOOL_FLAG");
        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapCompositeScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField("OVERALL_SCALE_SCORE");
        var performanceLevel = _util.coalesce(row.getField("OVERALL_PERFORMANCE_LEVEL"), row.getField("PRELIMINARY_INDICATOR"));
        var rawScore = row.getField("OVERALL_RAW_SCORE");
        var sem = row.getField("OVERALL_SCALE_SCORE_STANDARD_ERROR_OF_MEASUREMENT");
        var itemAttempted = row.getField("OVERALL_ITEMS_ATTEMPTED");
        var lexileMeasure = row.getField("LEXILE_MEASURE");
        var lexileMin = row.getField("LEXILE_RANGE_MIN");
        var lexileMax = row.getField("LEXILE_RANGE_MAX");

        if(performanceLevel !== null && performanceLevel !== "" && performanceLevel !== undefined){
            if(performanceLevel.indexOf("(") > -1){
                performanceLevel = performanceLevel.split("(")[1].replace(")","");
            }
        }
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        } else if(scaleScore.indexOf("N")>-1 || scaleScore.indexOf("n")>-1) {
            return null;
        }
        if(row.getField("TESTED_STATUS") === "N" || row.getField("INCLUDE_INDICATOR") === "N" || _util.trim(testNumber) === "" || _util.trim(scaleScore) === "" || row.getField("OVERALL_PERFORMANCE_LEVEL") === "9") {
            return null;
        }
        if(performanceLevel === null || performanceLevel === undefined || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === "") {
            return null;
        } else if(performanceLevel.indexOf("N")>-1 || performanceLevel.indexOf("n")>-1) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = parseInt(scaleScore);
        score["TEST_SCALED_SCORE"] = parseInt(scaleScore);
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevel].CODE;
        score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = decodePerformanceLevel[performanceLevel].PASS;
        score["TEST_SECONDARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevel].CODE;
        score["TEST_SECONDARY_RESULT"] = decodePerformanceLevelText[decodePerformanceLevel[performanceLevel].CODE];
        score["TEST_PERCENTAGE_SCORE"] = row.getField("PERCENT_CORRECT");
        score["TEST_STANDARD_ERROR"] = sem;
        score["TEST_ITEMS_ATTEMPTED"] = itemAttempted;
        if(lexileMeasure !== null && lexileMeasure !== "" && lexileMeasure !== undefined){
            score["TEST_READING_LEVEL"] = lexileMeasure.replace("L","");
        }
        if(lexileMin !== null && lexileMin !== "" && lexileMin !== undefined){
            score["TEST_LOWER_BOUND"] = lexileMin.replace("L","");
        }
        if(lexileMax !== null && lexileMax !== "" && lexileMax !== undefined){
            score["TEST_UPPER_BOUND"] = lexileMax.replace("L","");
        }
        return score;
    }



    function mapScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var sem = row.getField(testMetadata.FIELD + "_STANDARD_ERROR_OF_MEASUREMENT");


        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        } else if(scaleScore.indexOf("N")>-1 || scaleScore.indexOf("n")>-1) {
            return null;
        }

        if(row.getField("TESTED_STATUS") === "N" || row.getField("INCLUDE_INDICATOR") === "N" || _util.trim(testNumber) === "" || _util.trim(performanceLevel) === "" || row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL") === "9") {
            return null;
        }

        if(performanceLevel === null || performanceLevel === undefined || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === "") {
            return null;
        } else if(performanceLevel.indexOf("N")>-1 || performanceLevel.indexOf("n")>-1) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = parseInt(scaleScore);
        score["TEST_SCALED_SCORE"] = parseInt(scaleScore);
        score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevel].CODE;
        score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = decodePerformanceLevel[performanceLevel].PASS;
        score["TEST_SECONDARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevel].CODE;
        score["TEST_SECONDARY_RESULT"] = decodePerformanceLevelText[decodePerformanceLevel[performanceLevel].CODE];
        score["TEST_STANDARD_ERROR"] = sem;


        return score;
    }

    function mapStrandScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var sem = row.getField(testMetadata.FIELD + "_STANDARD_ERROR_OF_MEASUREMENT");
        var itemAttempted = row.getField(testMetadata.FIELD + "_NUMBER_OF_ITEMS_ATTEMPTED");
        var achvLvl = row.getField(testMetadata.FIELD + "_SCIENCES");


        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore.indexOf("N") || scaleScore.indexOf("n"))
            && (performanceLevel === null || performanceLevel === undefined || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === "" || performanceLevel.indexOf("N")>-1 || performanceLevel.indexOf("n")>-1)
            && (achvLvl === null || achvLvl === undefined || _util.trim(achvLvl) === "--" || _util.trim(achvLvl) === "")){
            return null;
        }
        if(row.getField("TESTED_STATUS") === "N" || row.getField("INCLUDE_INDICATOR") === "N" || _util.trim(testNumber) === "" || _util.trim(performanceLevel) === "" || row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL") === "9") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = parseInt(scaleScore);
        score["TEST_SCALED_SCORE"] = parseInt(scaleScore);
        score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(performanceLevel, achvLvl);
        score["TEST_PRIMARY_RESULT"] = _util.coalesce(decodePerformanceLevelStrand[performanceLevel], decodePerformanceLevelStrand[achvLvl]);
        score["TEST_STANDARD_ERROR"] = sem;
        score["TEST_ITEMS_ATTEMPTED"] = itemAttempted;



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
        var recordType = _util.coalesce(row.getField("ASSESSMENT_TYPE"), row.getField("CONDITION_CODE"));

        // Check if score should be mapped as an alternate score
        if(recordType === "23" || recordType === "ALT") {
            testNumber = testMetadata.TEST
                +"_ALT"
                + "_" + "SE"
                + "_" + testMetadata.CODE
                + "_" + decodeGradeCode(row.getField("GRADE_ASSESSED"));
        } else {
            testNumber = testMetadata.TEST
                + "_" + "SE"
                + "_" + testMetadata.CODE
                + "_" + decodeGradeCode(row.getField("GRADE_ASSESSED"));
        }

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

        var format;

        if (rawDate.indexOf('/') > -1) {
            if (rawDate.split('/')[0].length === 4) {
                    format = 'yyyy/MM/dd';
                            } else {
                                format = 'MM/dd/yy';
                            }
          } else if (rawDate.indexOf('-') > -1) {
            if (rawDate.split('-')[0].length === 4) {
                    format = 'yyyy-MM-dd';
                            } else {
                                format = 'MM-dd-yy';
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




    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
