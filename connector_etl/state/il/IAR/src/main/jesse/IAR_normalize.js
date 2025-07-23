var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IAR";
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
            print("Loading using signature file ${signatureFormatName}\n");

            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);
            print("Normalized file: ${normalizedFile}\n");

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
        [
            //Overall Scores and Performance
            {TEST: "IAR", CODE: "OVR", FIELD:"OVERALL", MAP_FUNCTION: mapOverallScore},
            //RD and WR scale Scores
            {TEST: "IAR", CODE: "RD", FIELD:"READING", MAP_FUNCTION: mapOtherScores},
            {TEST: "IAR", CODE: "WR", FIELD:"WRITING", MAP_FUNCTION: mapOtherScores},

            {TEST: "IAR", CODE: "LIF", FIELD:"LIFE", MAP_FUNCTION: mapScienceStrands},
            {TEST: "IAR", CODE: "EAR", FIELD:"EARTH", MAP_FUNCTION: mapScienceStrands},
            {TEST: "IAR", CODE: "PHYS", FIELD:"PHYSICAL", MAP_FUNCTION: mapScienceStrands},
            //Subclaim Individual Performances
            {TEST: "IAR", CODE: "RD", FIELD:"READING", CATEGORY:"LITERARY", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "IAR", CODE: "RD", FIELD:"READING", CATEGORY:"INFORMATIONAL", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "IAR", CODE: "RD", FIELD:"READING", CATEGORY:"VOCABULARY", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "IAR", CODE: "WR", FIELD:"WRITING", CATEGORY:"EXPRESSION", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "IAR", CODE: "WR", FIELD:"WRITING", CATEGORY:"CONVENTIONS", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "IAR", CODE: "MA", FIELD:"MATHEMATICS", CATEGORY:"MAJORCONTENT", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "IAR", CODE: "MA", FIELD:"MATHEMATICS", CATEGORY:"REASONING", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "IAR", CODE: "MA", FIELD:"MATHEMATICS", CATEGORY:"MODELINING", MAP_FUNCTION: mapIndividualPerformance},
            {TEST: "IAR", CODE: "MA", FIELD:"MATHEMATICS", CATEGORY:"SUPPORTINGCONTENT", MAP_FUNCTION: mapIndividualPerformance},

            //Both (Reading and Mathematics) Performance Mapping in same function
            {TEST: "IAR", CODE: "RD_MA", FIELD:"READING_SUBCLAIM_OR_MATHEMATICS", CATEGORY:"LITERARY_REASONING", MAP_FUNCTION: mapBothPerformances},
            {TEST: "IAR", CODE: "RD_MA", FIELD:"READING_SUBCLAIM_OR_MATHEMATICS", CATEGORY:"INFORMATIONAL_MODELINING", MAP_FUNCTION: mapBothPerformances},
            {TEST: "IAR", CODE: "RD_MA", FIELD:"READING_SUBCLAIM_OR_MATHEMATICS", CATEGORY:"VOCABULARY_SUPPORTINGCONTENT", MAP_FUNCTION: mapBothPerformances},
            // Mapping Reading Scale Score and Math Subclaim (Major Content) performance
            {TEST: "IAR", CODE: "RD_MA", FIELD:"READING_OR_MATHEMATICS", CATEGORY:"READING_MAJORCONTENT", MAP_FUNCTION: mapRDScaleScoreAndWRPerformance},


             {TEST: "IAR",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"1_CAT1", NAME: "ELASUBCLAIM1CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},
             {TEST: "IAR",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"2_CAT2", NAME: "ELASUBCLAIM2CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},
             {TEST: "IAR",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"3_CAT3", NAME: "ELASUBCLAIM3CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},
             {TEST: "IAR",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"4_CAT4", NAME: "SELAUBCLAIM4CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},
             {TEST: "IAR",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"5_CAT5", NAME: "ELASUBCLAIM5CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},

             //unit possible
             {TEST: "IAR", CODE:"U1", FIELD: "UNIT1", MAP_FUNCTION: mapUnitScore}
             ,{TEST: "IAR", CODE:"U2", FIELD: "UNIT2", MAP_FUNCTION: mapUnitScore}
             ,{TEST: "IAR", CODE:"U3", FIELD: "UNIT3", MAP_FUNCTION: mapUnitScore}

        ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var genderLookup = {
         "1": "F"
        ,"2": "M"
        ,"M": "M"
        ,"F": "F"
        ,"MALE":"M"
        ,"FEMALE":"F"
        ,"male":"M"
        ,"female":"F"
        ,"" : null
         ,null : null
    };

    var gradeLookup = {
        "03"	: "03"
        ,"Level 3": "03"
        ,"3"	: "03"
        ,"04"	: "04"
        ,"Level 4"	: "04"
        ,"4"	: "04"
        ,"05"	: "05"
        ,"Level 5"	: "05"
        ,"5"	: "05"
        ,"06"	: "06"
        ,"Level 6"	: "06"
        ,"6"	: "06"
        ,"07"	: "07"
        ,"Level 7"	: "07"
        ,"7"	: "07"
        ,"08"	: "08"
        ,"Level 8"	: "08"
        ,"8"	: "08"

    };

    //To be
    var decodePerformanceLevel = {
        "1": { TEST_RESULT: 'Did not yet meet expectations', PASS_IND: 'No', READINESS: 'Not College Ready' },
        "2": { TEST_RESULT: 'Partially met expectations', PASS_IND: 'No', READINESS: 'Not College Ready' },
        "3": { TEST_RESULT: 'Approached expectations', PASS_IND: 'No', READINESS: 'Not College Ready' },
        "4": { TEST_RESULT: 'Met expectations', PASS_IND: 'Yes', READINESS: 'College Ready' },
        "5": { TEST_RESULT: 'Exceeded expectations', PASS_IND: 'Yes', READINESS: 'College Ready' },
        "Did Not Yet Meet Expectations": { TEST_RESULT: '1', PASS_IND: 'No', READINESS: 'College Ready' },
        "Partially Met Expectations": { TEST_RESULT: '2', PASS_IND: 'No', READINESS: 'College Ready' },
        "Approached Expectations": { TEST_RESULT: '3', PASS_IND: 'No', READINESS: 'College Ready' },
        "Met Expectations": { TEST_RESULT: '4', PASS_IND: 'Yes', READINESS: 'College Ready' },
        "Exceeded Expectations": { TEST_RESULT: '5', PASS_IND: 'Yes', READINESS: 'College Ready' },
        null: { TEST_RESULT: null, PASS_IND: "No", READINESS: 'Not College Ready' },
        "": { TEST_RESULT: null, PASS_IND: "No", READINESS: 'Not College Ready' },
        undefined: { TEST_RESULT: null, PASS_IND: "No", READINESS: 'Not College Ready' },
        "n/a": { TEST_RESULT: null, PASS_IND: "No", READINESS: 'Not College Ready' },
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
        var studentName = row.getField('STUDENT_NAME');
        if(_util.trim(studentName) === null || _util.trim(studentName) === undefined || _util.trim(studentName) === ""|| _util.trim(studentName) === "1"){
            studentName = null;
        }
        var studentLastName = null;
        var studentFirstName = null;
        var studentMiddleInitial = null;

            if (studentName && studentName!== null && studentName.indexOf(',') > -1) {
                studentLastName = studentName.split(',')[0];
                var firstNameSeparator = studentName.split(',')[1].split(' ');
                var middleInitial = firstNameSeparator[firstNameSeparator.length-1];
                if (middleInitial.length === 1) {
                    studentMiddleInitial = middleInitial;
                    studentFirstName = firstNameSeparator.slice(0,-1).join(' ');
                } else {
                    studentFirstName = studentName.split(',')[1];
                }
            }
            var testAdminDateObj = row.getField("UNIT_1_END_DATE");
            if(testAdminDateObj !== null && testAdminDateObj !== undefined && testAdminDateObj !== ""){
                        testAdminDateObj = getDate(testAdminDateObj).STANDARD_DATE;
            }
            function getDate(date){
                     var splitDate = date.split(" ")[0];
                     return AppUtil.getMonthFollowedByDay(splitDate);
            }

          if (row.getField("SCHOOL_NAME_AND_CODE")) {
          var schoolName = row.getField("SCHOOL_NAME_AND_CODE");
          var matches = schoolName.match(/^(.*?)\s*\(([\d\w]+)\)$/);
          if (matches) {
          var schName = matches[1].trim(); // Extracts the school name
          var schoolId = matches[2]; // Extracts the school ID
          }
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
                    record.REPORTING_PERIOD =  _util.coalesce(getTEST_ADMIN_PERIOD(row, hierarchy.REPORTING_PERIOD));
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
                //School Info
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID =  _util.coalesce(row.getField("SCHOOL_LOCAL_ID"),schoolId);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"),schoolId);
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(getTEST_ADMIN_DATE(row, hierarchy), testAdminDateObj,
                    '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
                    break;
                //Student Info
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeLookup[row.getField("STUDENT_GRADE_CODE")];
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("STUDENT_LOCAL_ID"),row.getField("LOCALSTUDENTIDENTIFIER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("STUDENT_LOCAL_ID"),row.getField("STATESTUDENTIDENTIFIER"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("STUDENT_LOCAL_ID"),row.getField("STATESTUDENTIDENTIFIER"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(genderLookup[row.getField("GENDER")], "");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"),studentFirstName);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"),studentMiddleInitial);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"),studentLastName);
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"),schName);
                    break;
                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;

    }



    function getTEST_ADMIN_DATE(row, hierarchy) {
        var testDate;
        var adminPeriod = getTEST_ADMIN_PERIOD(row, hierarchy);

        testDate = parseDate(row.getField("UNIT_3_END_DATE"));
        if (testDate.STANDARD_DATE === '01/01/1900') {
        testDate = parseDate(row.getField("UNIT_2_END_DATE"));
        }
        if(adminPeriod === "FALL") {
            testDate = "09/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}";
        } else if(adminPeriod === "WINTER") {
            testDate = "01/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        } else if(adminPeriod === "SPRING") {
            testDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        }

        return testDate.STANDARD_DATE;
    }

    function getTEST_ADMIN_PERIOD(row, filePeriod) {
        var testAdminPeriod = filePeriod;

        if (filePeriod === 'ALL' && row.getField("UNIT_2_END_DATE") !== null) {

            var sdObj = _util.coalesce(row.getField("UNIT_3_END_DATE"), row.getField("UNIT_2_END_DATE"));
            var sd = parseDate(sdObj).STANDARD_DATE;
            if(sd === '01/01/1900'){
                sd = parseDate(row.getField("UNIT_2_END_DATE")).STANDARD_DATE;
            }
            var month = sd.substring(0, 2);

            if (month === "07" || month === "08" || month === "09" || month === "10")
                testAdminPeriod = "FALL";
            else if (month === "11" || month === "12" || month === "01" || month === "02")
                testAdminPeriod = "WINTER";
            else if (month === "03" || month === "04" || month === "05" || month === "06")
                testAdminPeriod = "SPRING";

        }
        else if(filePeriod === 'ALL' && row.getField("ADMINISTRATION_PERIOD") !== null) {
            var period = row.getField("ADMINISTRATION_PERIOD");
            if(period === "S")
              testAdminPeriod = "SPRING";
            else if(period === "F")
              testAdminPeriod = "FALL";
            else if(period === "W")
              testAdminPeriod = "WINTER";

        }
        else {
            return filePeriod;
        }
        return testAdminPeriod;
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

    function mapOverallScore(row, testMetadata) {

        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var totalTestedItems = row.getField("TOTAL_TEST_ITEMS_ATTEMPTED");
        var totalItems = row.getField("TOTAL_TEST_ITEMS");
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var performanceLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
        var performanceLevelCode = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL1");
        var studentGrowthPercentile = parseInt(row.getField("SGP"));
        var studentGrowthPercentile1 = parseInt(row.getField("STUDENT_GROWTH_PERCENTILE_COMPARED_TO_STATE_BASELINE"));
        var studentGrowthPercentile2 = parseInt(row.getField("STUDENT_GROWTH_PERCENTILE_COMPARED_TO_STATE_COHORT"));
        var studentGrowthPercentile3 = parseInt(row.getField("STUDENT_GROWTH_PERCENTILE_STANDARD_ERROR_STATE"));
        var testCSEM = row.getField("TESTCSEM");
        var reportedLexileQuantile = row.getField("REPORTED_LEXILE-QUANTILE");
        var lexileQuantileLRange = row.getField("LEXILE_QUANTILE_LOWER_RANGE");
        var lexileQuantilURange = row.getField("LEXILE_QUANTILE_UPPER_RANGE");
        var cohort = row.getField("COHORT_SGP");
        var baseline = row.getField("BASELINE_SGP");

        if(_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === ""
        || _util.trim(scaleScore) === "N/A" ||  _util.trim(scaleScore) === "Undetermined" || _util.trim(scaleScore) === "n/a" ) {
            return null;
        }


        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_STANDARD_ERROR"] = testCSEM;
        }
        if(reportedLexileQuantile){
             score["TEST_READING_LEVEL"] = reportedLexileQuantile.replace("L", "").replace("Q", "").replace("EM", "");
        }
        if(lexileQuantileLRange){
            score["TEST_LOWER_BOUND"] = lexileQuantileLRange.replace("L", "").replace("Q", "").replace("EM", "");
        }
        if(lexileQuantilURange){
            score["TEST_UPPER_BOUND"] = lexileQuantilURange.replace("L", "").replace("Q", "").replace("EM", "");
        }

        //Pass Results
        if(performanceLevelCode){
            score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevelCode].TEST_RESULT;
            score["TEST_PRIMARY_RESULT"] = performanceLevelCode;
            score["TEST_PASSED_INDICATOR"] = decodePerformanceLevel[performanceLevelCode].PASS_IND;
        }else{
            score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].TEST_RESULT;
            score["TEST_PASSED_INDICATOR"] = decodePerformanceLevel[performanceLevel].PASS_IND;
        }

        //Collage Readiness
        if(performanceLevelCode){
          score["TEST_SECONDARY_RESULT"] = decodePerformanceLevel[performanceLevelCode].READINESS;
        }else{
          score["TEST_SECONDARY_RESULT"] = decodePerformanceLevel[performanceLevel].READINESS;
        }

        if (!isNaN(studentGrowthPercentile)) {
        score["TEST_GROWTH_PERCENTILE"] = studentGrowthPercentile;
        }

        //Items Attempted
        if(totalTestedItems !== null && totalTestedItems !== undefined && _util.trim(totalTestedItems) !== "--" && _util.trim(totalTestedItems) !== ""){
            score["TEST_ITEMS_ATTEMPTED"] = totalTestedItems;
            score["TEST_ITEMS_POSSIBLE"] = totalItems;
        }
        score["TEST_GROWTH_TARGET_1"] = studentGrowthPercentile1;
        score["TEST_GROWTH_TARGET_2"] = studentGrowthPercentile2;
        score["TEST_GROWTH_TARGET_3"] = studentGrowthPercentile3;
        score["TEST_PERCENTILE_SCORE"] = cohort;
        score["TEST_PERCENTAGE_SCORE"] = baseline;
        return score;
    }


    function mapOtherScores(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);

        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var testCSEM = row.getField(testMetadata.FIELD + "_CSEM");

        if((_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === ""
           || _util.trim(scaleScore) === "N/A" || _util.trim(scaleScore) === "n/a" || _util.trim(scaleScore) === "Undetermined")) {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_STANDARD_ERROR"] = testCSEM;
        }

        return score;
    }

    function mapScienceStrands(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);

        var scaleScore = row.getField(testMetadata.FIELD + "_SCIENCE_SCALE_SCORE");
        var percentileRank = row.getField(testMetadata.FIELD + "_SCIENCE_PERCENTILE_RANK");

        if((_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === ""
            || _util.trim(scaleScore) === "N/A" || _util.trim(scaleScore) === "n/a" || _util.trim(scaleScore) === "Undetermined")) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if (!isNaN(percentileRank)) {
            score["TEST_PERCENTILE_SCORE"] = percentileRank;
        }

        return score;
    }
    
    function mapIndividualPerformance(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata) + testMetadata.CATEGORY;

        var performanceLevel = row.getField(testMetadata.FIELD + '_SUBCLAIM_' + testMetadata.CATEGORY);


        if((_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === ""
           || _util.trim(performanceLevel) === "N/A" || _util.trim(performanceLevel) === "n/a" || _util.trim(performanceLevel) === "Undetermined")) {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].TEST_RESULT;

        return score;
    }

    function mapBothPerformances(row, testMetadata) {
        var score = {};
        var subject = null;
        var mapCode = null;
        var category = null;
        var testCode = _util.coalesce(row.getField("TEST"));

        if(testCode !== null && testCode !== undefined) {
            if((testCode.indexOf("MAT")> -1) || testCode === 'M'){
                subject = 'MAT';
                //(subject + "--subjectFrom MAT");
            } else if((testCode.indexOf("ELA")> -1) || testCode === 'E'){
                subject = 'ELA';
            }
        } else {
            return null;
        }

        if (subject === "ELA"){
            if(testMetadata.CODE === "RD_MA"){
                mapCode = testMetadata.CODE.split("_")[0];
                category = testMetadata.CATEGORY.split("_")[0];
            }
        } else if (subject === "MAT"){
            if(testMetadata.CODE === "RD_MA"){
                mapCode = testMetadata.CODE.split("_")[1];
                category = testMetadata.CATEGORY.split("_")[1];
            }
        }


        var testNumber = testMetadata.TEST + subject + gradeLookup[row.getField("STUDENT_GRADE_CODE")] + mapCode + category;
        var performanceLevel = row.getField(testMetadata.FIELD + '_SUBCLAIM_' + testMetadata.CATEGORY);

        if((_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === ""
           || _util.trim(performanceLevel) === "N/A" || _util.trim(performanceLevel) === "n/a" || _util.trim(performanceLevel) === "Undetermined")) {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].TEST_RESULT;

        return score;
    }

    function mapRDScaleScoreAndWRPerformance(row, testMetadata) {
        var score = {};
        var subject = null;
        var mapCode = null;
        var category = null;
        var testCode = row.getField("TEST");

        if(testCode !== null && testCode !== undefined) {
            if((testCode.indexOf("MAT")> -1) || testCode === 'M'){
                subject = 'MAT';
            } else if((testCode.indexOf("ELA")> -1) || testCode === 'E'){
                subject = 'ELA';
              }
        } else {
            return null;
        }

        if (subject === "ELA"){
            if(testMetadata.CODE === "RD_MA"){
                 mapCode = testMetadata.CODE.split("_")[0];
            }
            var testNumber = testMetadata.TEST + subject + gradeLookup[row.getField("STUDENT_GRADE_CODE")] + mapCode;

            var scaleScore = row.getField(testMetadata.FIELD + '_SUBCLAIM_' + testMetadata.CATEGORY);

            if((_util.trim(scaleScore) === null || _util.trim(scaleScore) === undefined || _util.trim(scaleScore) === ""
                 || _util.trim(scaleScore) === "N/A" || _util.trim(scaleScore) === "n/a" || _util.trim(scaleScore) === "Undetermined")) {
                 return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;

            if (!isNaN(scaleScore)) {
                 score["TEST_SCORE_VALUE"] = scaleScore;
                 score["TEST_SCALED_SCORE"] = scaleScore;
            }
        } else if (subject === "MAT"){
            if(testMetadata.CODE === "RD_MA"){
                 mapCode = testMetadata.CODE.split("_")[1];
                 category = testMetadata.CATEGORY.split("_")[1];
            }

            var testNumber = testMetadata.TEST + subject + gradeLookup[row.getField("STUDENT_GRADE_CODE")] + mapCode + category ;
            var performanceLevel = row.getField(testMetadata.FIELD + '_SUBCLAIM_' + testMetadata.CATEGORY);

            if((_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === ""
                 || _util.trim(performanceLevel) === "N/A" || _util.trim(performanceLevel) === "n/a" || _util.trim(performanceLevel) === "Undetermined")) {
                 return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
            score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].TEST_RESULT;
        }

        return score;
    }


    function mapSubclaimsCategory(row, testMetadata) {
                var score = {};
                var subject = null;
                var mapCode = null;
                var category = null;
                var testCode = _util.coalesce(row.getField("TEST"));
                if(testCode !== null && testCode !== undefined) {
                    if((testCode.indexOf("MAT")> -1) || testCode === 'M'){
                        subject = 'MAT';
                    } else if((testCode.indexOf("ELA")> -1) || testCode === 'E'){
                        subject = 'ELA';
                    }
                } else {
                    return null;
                }

                if (subject === "ELA"){
                    if(testMetadata.CODE === "SUB_ELA"){
                        category = testMetadata.CATEGORY.split("_")[1];//1_cat1
                    }
                } else if (subject === "MAT"){
                    if(testMetadata.FIELD === "SUB_MA"){
                        category = testMetadata.CATEGORY.split("_")[1];

                    }
                }
                var testNumber = testMetadata.TEST + subject + gradeLookup[row.getField("STUDENT_GRADE_CODE")] + "_" + category;
                var performanceLevel = row.getField("SUBCLAIM" + testMetadata.CATEGORY);

                if((_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === ""
                   || _util.trim(performanceLevel) === "N/A" || _util.trim(performanceLevel) === "n/a" || _util.trim(performanceLevel) === "Undetermined")) {
                   return null;
                }
                score["TEST_NUMBER"] = testNumber;
                score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].TEST_RESULT;

                return score;
    }

    function mapUnitScore(row, testMetadata) {
            var score = {};
            var TestCode = row.getField("TEST");
            var testNumber = testMetadata.TEST + testMetadata.CODE + TestCode;
            var unitTotalItems = row.getField(testMetadata.FIELD + "_" + "TOTALTESTITEMS");
            var unitItemAttempted = row.getField(testMetadata.FIELD + "_" + "NUMBEROFATTEMPTEDITEMS");
            if(unitTotalItems === null || unitTotalItems === undefined || _util.trim(unitTotalItems) === "--" || _util.trim(unitTotalItems) === ""){
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            if(!isNaN(unitTotalItems)){
                score["TEST_ITEMS_POSSIBLE"] = unitTotalItems;
                score["TEST_ITEMS_ATTEMPTED"] = unitItemAttempted;
            }

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
       // var period = getTEST_ADMIN_PERIOD(srcRecord);

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
        var testNumber = null;
        var grade = gradeLookup[row.getField("STUDENT_GRADE_CODE")];
        var grade1 = gradeLevelFromTestCode(row, testMetadata);
        var testCode = _util.coalesce(row.getField("TEST_CODE"), row.getField("TEST"));
        if(testCode != null){
            if ((testCode.indexOf('ELA') > -1) || testCode === 'E') {
               testCode = 'ELA';
            }
            else if ((testCode.indexOf('MAT') > -1) || testCode === 'M' || (testCode.indexOf('Mathematics') > -1)) {
               testCode = 'MAT';
            }
            else if ((testCode.indexOf('SCI') > -1) || testCode === 'S' || (testCode.indexOf('Science') > -1)) {
                testCode = 'SCI';
            }
        }

        if(grade !== null && grade !== undefined && grade !== ""){
            testNumber = testMetadata.TEST + testCode + grade + testMetadata.CODE;
        }else{
            testNumber = testMetadata.TEST + testCode + grade1 + testMetadata.CODE;
        }

        return testNumber;
    }

  function gradeLevelFromTestCode(row, testMetadata) {
        var grade1 = null;
        var testCode = row.getField("TEST_CODE");
        if (testCode != null) {
        if (testCode.indexOf("Grade 03") > -1) {
            grade1 = "03";
        }
        if (testCode.indexOf("Grade 04") > -1) {
            grade1 = "04";
        }
        if (testCode.indexOf("Grade 05") > -1) {
            grade1 = "05";
        }
        if (testCode.indexOf("Grade 06") > -1) {
            grade1 = "06";
        }
        if (testCode.indexOf("Grade 07") > -1) {
            grade1 = "07";
        }
        if (testCode.indexOf("Grade 08") > -1) {
            grade1 = "08";
        }
      }
        return grade1;

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
       var splitedrawDate = rawDate.split("-");
        if (rawDate.length() > 8 && rawDate.indexOf('/') > -1) {
           formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else if (rawDate.length() > 8 && rawDate.indexOf('-') > -1 && splitedrawDate[0].length == 4){
           formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        } else if(rawDate.length() > 8 && rawDate.indexOf('-') > -1){
               formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
         }else {
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
