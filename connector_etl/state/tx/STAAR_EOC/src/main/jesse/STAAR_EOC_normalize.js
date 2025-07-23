var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "STAAR_EOC";
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
            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");

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
    var scoresToMap = [{TEST: "STAAR", CODE:"ALG1", FIELD: "ALGEBRA_I", DEC: "A1", MAP_FUNCTION: mapScores},
                     {TEST: "STAAR", CODE:"ALG2", FIELD: "ALGEBRA_II", DEC: "A2",  MAP_FUNCTION: mapScores},
                     {TEST: "STAAR", CODE:"ENG1", FIELD: "ENGLISH_I", DEC: "E1",  MAP_FUNCTION: mapScores},
                     {TEST: "STAAR", CODE:"ENG2", FIELD: "ENGLISH_II", DEC: "E2",  MAP_FUNCTION: mapScores},
                     {TEST: "STAAR", CODE:"ENG3", FIELD: "ENGLISH_III", DEC: "E3",  MAP_FUNCTION: mapScores},
                     {TEST: "STAAR", CODE:"BIO", FIELD: "BIOLOGY", DEC: "BI",  MAP_FUNCTION: mapScores},
                     {TEST: "STAAR", CODE:"USHIST", FIELD: "US_HISTORY", DEC: "US",  MAP_FUNCTION: mapScores}];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var scoreCodeDecode = {
        "A" : "A: Absent"
        , "O" : "O: Other (illness, irregularity, etc)"
        , "S" : "S: Score"
        , "D" : "D: No information available for this subject"
        , "P" : "P: Previously Achieved Level II: Satisfactory"
        , "W" : "W: Parental Waiver"
        , "M" : "M: Medical Exception"
        , "N" : "N: No Authentic Academic Response"
        , "R" : "R: Not appropriate SSI retest"
        , "*" : "*: No information available"
        , null : null
        , "" : null
    };

    var otherCodeDecode = {
    	"3" : "O3: The score code was defaulted to “O” because the student previously met graduation requirements for the subject"
    	, "1" : "O1: The score code was defaulted to “O” because either the score code was left blank or multiple values were gridded in the score code field"
    	, "0" : "O: Other (illness, irregularity, etc)"
    };


    var onlineTestDisruptionFlag = {
    	"1" : "Inactivity"
    	, "2" : "Test Version"
    	, "3" : "Both Inactivity and Test Version"
    	,"": null
    	," ": null
    };

    var shortAnswerItemDecode = {
    	"0" : "Insufficient"
    	, "1" : "Partially Sufficient"
    	, "2" : "Sufficient"
    	, "3" : "Exemplary"
    };

    //A written comp. score of 1 is not possible
    var writtenCompositionDecode = {
    	"0" : "Nonscorable"
    	, "2" : "Very Limited"
    	, "3" : "Between Very Limited and Basic"
    	, "4" : "Basic"
    	, "5" : "Between Basic and Satisfactory"
    	, "6" : "Satisfactory"
    	, "7" : "Between Satisfactory and Accomplished"
    	, "8" : "Accomplished"
    };

    var progressMeasureDecodeOLD={
    	"2" : "Exceeded"
    	, "1" : "Met"
    	, "0" : "Did Not Meet"
    	, "": null
    	," ": null
    };
    var progressMeasureDecode={
    	"2" : "Accelerated"
    	, "1" : "Expected"
    	, "0" : "Limited"
    	, "": null
    	," ": null
    };

    var appPerformanceDecode={
    	 "1" : "Yes"
    	, "0" : "No"
    	, "": null
    	," ": null
    	,null: null
    };

    var satisfactoryPerformanceDecode={
    	 "1" : "Yes"
    	, "0" : "No"
    	, "": null
    	," ": null
    	,null: null
    };

    var academicPerformanceDecode={
            "1" : "Yes"
           ,"0" : "No"
           , "": null
           ," ": null
           ,null: null
        };

    var passingDecode = {
        "Satisfactory" : "Yes" // Old Years
        , "Unsatisfactory" : "No" // Old Years
        , "Masters Grade Level" : "Yes" // New Years
        , "Meets Grade Level" : "Yes"
        , "Approaches Grade Level" : "No"
        , "Does Not Approach Grade Level" : "No"
    };

    var testerRetesterDecode={
    	 "F" : "First-Time Tester"
    	, "R" : "Retester"
    };

    var testDecode= {
    	"A1" : "ALG1"
    	, "A2" : "ALG2"
    	, "E1" : "ENG1"
    	, "E2" : "ENG2"
    	, "E3" : "ENG3"
    	, "BI" : "BIO"
    	, "US" : "USHIST"
    	, null: null
    	, "" : null
    };

    var periodDecode={
    	"15":"Spring"
    	, "16":"Summer"
    	, "13":"Fall"
    	, "" : "ALL"
    	, null : "ALL"
    };

    var taTesterDecode = {
    	 "0" : "Examinee is not a TAKS/TAAS/TEAMS tester"
    	, "1" : "Examinee will receive a TAKS/TAAS/TEAMS Report Card"
    	, "2": "Examinee will receive a STAAR Report Card"
    	,"": null
    	," ": null
    	,null: null
    };
    var gradeDecode = {
        "1" 	: "01"
        ,"Grade 1" 	: "01"
        ,"01" 	: "01"
        ,"Grade 01" 	: "01"
        ,"2" 	: "02"
        ,"Grade 2" 	: "02"
        ,"02" 	: "02"
        ,"Grade 02" 	: "02"
        ,"3" 	: "03"
        ,"Grade 3" 	: "03"
        ,"03" 	: "03"
        ,"Grade 03" 	: "03"
        ,"4" 	: "04"
        ,"Grade 4" 	: "04"
        ,"04" 	: "04"
        ,"Grade 04" 	: "04"
        ,"5" 	: "05"
        ,"Grade 5" 	: "05"
        ,"05" 	: "05"
        ,"Grade 05" 	: "05"
        ,"6" 	: "06"
        ,"Grade 6" 	: "06"
        ,"06" 	: "06"
        ,"Grade 06" 	: "06"
        ,"7" 	: "07"
        ,"Grade 7" 	: "07"
        ,"07" 	: "07"
        ,"Grade 07" 	: "07"
        ,"8" 	: "08"
        ,"Grade 8" 	: "08"
        ,"08" 	: "08"
        ,"Grade 08" 	: "08"
        ,"9" 	: "09"
        ,"Grade 9" 	: "09"
        ,"09" 	: "09"
        ,"Grade 09" 	: "09"
        ,"10" 	: "10"
        ,"Grade 10" 	: "10"
        ,"11" 	: "11"
        ,"Grade 11" 	: "11"
        ,"12" 	: "12"
        ,"Grade 12" 	: "12"
        ,"14" 	: "14"
        ,"Grade 14" 	: "14"
        , null	: null
        ,""	: null
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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, hierarchy);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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
        //var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DATE_OF_BIRTH"), "MMddyyyy");
        var birthDateStr = _util.coalesce(row.getField("DATE_OF_BIRTH"), "");
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        try {
            if (birthDateStr.length <= 10 && birthDateStr.indexOf('/')>-1 && signature.getFormat().getFormatName() === 'STAAR_2023_118_COL') {
             birthDateObject = AppUtil.getMonthFollowedByDay(birthDateStr);
            }
            else if (birthDateStr.length === 7 || birthDateStr.length === 8) {
                birthDateStr = (("00000000" + birthDateStr).slice(-8));
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMddyyyy");
            }
            else if (birthDateStr.indexOf('-')>-1){
                 birthDateObject = AppUtil.getMonthFollowedByDay(birthDateStr)
            }
            else {
                birthDateObject;
            }
        } catch (exception) {
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing test date string: ${exception}", JSON.stringify(row.getSourceRow())));
        }

        var vendorStudentID = row.getField("LOCAL_STUDENT_ID");
        if(vendorStudentID===null||vendorStudentID ===""){
            vendorStudentID = row.getField("STUDENT_ID");
        }

        var adminDate = row.getField("ADMINISTRATION_DATE");

        var period = periodDecode[adminDate.substring(0,2)];

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
                    record.REPORTING_PERIOD = _util.coalesce(period,hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = formatTestDate(row.getField("ADMINISTRATION_DATE"),row.getField("FIRST_TIME_TESTER_RETESTER")).STANDARD_DATE;
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
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("SEX_CODE"));
                    break;
                case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE_LEVEL_CODE"))];
                     break;
                case "STUDENT_VENDOR_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_VENDOR_ID = vendorStudentID;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = vendorStudentID;
                    break;
                case "STUDENT_STATE_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_STATE_ID = row.getField("LOCAL_STUDENT_ID");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("COUNTY_DISTRICT_CAMPUS_NUMBER"));
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
    function mapAdditionalAdminFields(row){
        var admin = {};

        /*admin.TEST_EXEMPTION_CODE = _util.coalesce(row.getField("ALGEBRA_I_SCORE_CODE"));
        admin.TEST_EXEMPTION_DESC = scoreCodeDecode[row.getField("ALGEBRA_I_SCORE_CODE")];
        admin.TEST_EXEMPTION_CODE_2 = row.getField("BIOLOGY_SCORE_CODE");
        admin.TEST_EXEMPTION_DESC_2 = scoreCodeDecode[row.getField("BIOLOGY_SCORE_CODE")];
        admin.TEST_EXEMPTION_CODE_3 = row.getField("ENGLISH_I_SCORE_CODE");
        admin.TEST_EXEMPTION_DESC_3 = scoreCodeDecode[row.getField("ENGLISH_I_SCORE_CODE")];
        admin.TEST_EXEMPTION_CODE_4 = row.getField("ENGLISH_II_SCORE_CODE");
        admin.TEST_EXEMPTION_DESC_4 = scoreCodeDecode[row.getField("ENGLISH_II_SCORE_CODE")];
        admin.TEST_INTERVENTION_CODE = row.getField("US_HISTORY_SCORE_CODE");
        admin.TEST_INTERVENTION_DESC = scoreCodeDecode[row.getField("US_HISTORY_SCORE_CODE")];
        */
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/


    function mapScores(row, testMetadata, hierarchy){
        //var testScoreElement = new com.versifit.utl.UTLDataElement("com.versifit.utl.generic.testscore");
        var record = {};
        //var code = testDecode[mapFirstAvailable(rowValues['END_OF_COURSE_CODE'])];
        var code = testDecode[row.getField('END_OF_COURSE_CODE')];
        if(code!==testMetadata.CODE){
            return null;
        }
        //var substitute = mapFirstAvailable(rowValues['SUBSTITUTE_ASSESSMENT']);
        var substitute = row.getField(testMetadata.FIELD+'_SUBSTITUTE_ASSESSMENT');
        //var version = mapFirstAvailable(rowValues['TEST_VERSION']);
        var version = _util.coalesce(row.getField(testMetadata.FIELD+'_TEST_VERSION'),"");
        //var progressMeasure = mapFirstAvailable(rowValues['STAAR_PROGRESS_MEASURE']);
        var progressMeasure = row.getField(testMetadata.FIELD+'_STAAR_PROGRESS_MEASURE');
        var approachesGradeLevel = _util.coalesce(row.getField(testMetadata.FIELD + '_APPROACHES_GRADE_LEVEL'),row.getField('APPROACHES_GRADE_LEVEL'), row.getField('APPROACHES_GRADE_LEVEL_AT_THE_STUDENTS_STANDARD'));
        //var satisfactoryPerformance = mapFirstAvailable(rowValues['LEVEL_II_SATISFACTORY_ACACEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD']);

        var satisfactoryPerformance = _util.coalesce(row.getField(testMetadata.FIELD+'_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE_AT_THE_STUDENTS_STANDARD'), row.getField('LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE'), row.getField('SATISFACTORY_ACADEMIC_PERFORMANCELEVEL_II'));
        //var subjectPerformance = mapFirstAvailable(rowValues['ALGEBRA_I_PERFORMANCE_INFORMATION'],rowValues['BIOLOGY_PERFORMANCE_INFORMATION'],rowValues['ENGLISH_II_PERFORMANCE_INFORMATION'],rowValues['US_HISTORY_PERFORMANCE_INFORMATION']);
        var academicPerformance = row.getField('ACCOMPLISHED_ACADEMIC_PERFORMANCE');
        var subjectPerformance = row.getField(testMetadata.FIELD + '_PERFORMANCE_INFORMATION');
        if(substitute === "1"){
            var testNumber = 'STAARSUB' + code + version;
        }
        else{
            var testNumber = 'STAAR' + code + version;
        }
        //Set alternate flag to test number
        if(row.getField("TEST_VERSION")==="T"){
            testNumber = testNumber + "T";
        }
        var scaleScore =  _util.coalesce(row.getField(testMetadata.FIELD + '_SCALE_SCORE'),row.getField('SCALE_SCORE'));
        var rawScore = _util.coalesce(row.getField(testMetadata.FIELD + '_RAW_SCORE'),row.getField('RAW_SCORE'));
        if(rawScore === undefined || rawScore === null || rawScore == "" || rawScore == "--"){
            return null;
        }
        scaleScore = parseInt(scaleScore,10);
        rawScore = parseInt(rawScore,10);
        //testScoreElement.setFieldValue("TEST_NUMBER",testNumber);
        record["TEST_NUMBER"] = testNumber;
        //testScoreElement.setFieldValue("TEST_SCORE_TEXT", scaleScore);
        record["TEST_SCORE_TEXT"] = scaleScore;
        //testScoreElement.setFieldValue("TEST_SCORE_VALUE", scaleScore);
        record["TEST_SCORE_VALUE"] = scaleScore;
        //testScoreElement.setFieldValue("TEST_SCALED_SCORE",  scaleScore);
        record["TEST_SCALED_SCORE"] = scaleScore;
        //testScoreElement.setFieldValue("TEST_RAW_SCORE",  rawScore);
        record["TEST_RAW_SCORE"] = rawScore;
        //testScoreElement.setFieldValue("TEST_SECONDARY_RESULT", progressMeasureDecode[progressMeasure]);
        record["TEST_SECONDARY_RESULT"] = progressMeasureDecode[progressMeasure];
        //testScoreElement.setFieldValue("TEST_SECONDARY_RESULT_CODE",  progressMeasure);
        record["TEST_SECONDARY_RESULT_CODE"] = progressMeasure;
        //testScoreElement.setFieldValue("TEST_PRIMARY_RESULT", satisfactoryPerformanceDecode[satisfactoryPerformance]);
        record["TEST_PRIMARY_RESULT"] = satisfactoryPerformanceDecode[satisfactoryPerformance];
        //testScoreElement.setFieldValue("TEST_PRIMARY_RESULT_CODE",  satisfactoryPerformance);
        record["TEST_PRIMARY_RESULT_CODE"] = satisfactoryPerformance;
        //testScoreElement.setFieldValue("TEST_PASSED_INDICATOR",  satisfactoryPerformanceDecode[satisfactoryPerformance]);
        record["TEST_PASSED_INDICATOR"] = _util.coalesce(satisfactoryPerformanceDecode[satisfactoryPerformance],appPerformanceDecode[approachesGradeLevel]);

        //testScoreElement.setFieldValue("TEST_TERTIARY_RESULT", satisfactoryPerformanceDecode[subjectPerformance]);
        record["TEST_TERTIARY_RESULT"]= satisfactoryPerformanceDecode[subjectPerformance];
        //testScoreElement.setFieldValue("TEST_TERTIARY_RESULT_CODE",  subjectPerformance);
        record["TEST_TERTIARY_RESULT_CODE"] = subjectPerformance;

        record["TEST_QUATERNARY_RESULT"] = academicPerformanceDecode[academicPerformance];
        record["TEST_QUATERNARY_RESULT_CODE"] = academicPerformance;

       // var meetsGradeLevel = mapFirstAvailable(rowValues['LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE']);
        var meetsGradeLevel = _util.coalesce(row.getField(testMetadata.FIELD + '_MEETS_GRADE_LEVEL'),row.getField('MEETS_GRADE_LEVEL'));
        var approachesGradeLevel = _util.coalesce(row.getField(testMetadata.FIELD + '_APPROACHES_GRADE_LEVEL'),row.getField('APPROACHES_GRADE_LEVEL'), row.getField('APPROACHES_GRADE_LEVEL_AT_THE_STUDENTS_STANDARD'));

        //var mastersGradeLevel = mapFirstAvailable(rowValues['LEVEL_II_ADVANCED_ACADEMIC_PERFORMANCE']);
        var mastersGradeLevel = _util.coalesce(row.getField(testMetadata.FIELD + '_MASTERS_GRADE_LEVEL'),row.getField('MASTERS_GRADE_LEVEL'));// LEVEL_II_ADVANCED_ACADEMIC_PERFORMANCE
        var highestStandardMet = null;
        if(satisfactoryPerformanceDecode[mastersGradeLevel]=="Yes"){
            highestStandardMet = "Masters Grade Level";
			if(hierarchy.SCHOOL_YEAR.toString()=="2015-2016"||hierarchy.SCHOOL_YEAR.toString()=="2014-2015"){
				highestStandardMet = "Advanced";
			}
            hierarchy.SCHOOL_YEAR
        }
        else if(satisfactoryPerformanceDecode[meetsGradeLevel]=="Yes"){
            highestStandardMet = "Meets Grade Level";
			if(hierarchy.SCHOOL_YEAR.toString()=="2015-2016"||hierarchy.SCHOOL_YEAR.toString()=="2014-2015"){
				highestStandardMet = "Satisfactory";
			}
        }
        else if(_util.coalesce(row.getField(testMetadata.FIELD + '_SCORE_CODE'),row.getField('SCORE_CODE'))=="O" && substitute === "1"){
            highestStandardMet = "Meets Grade Level";
			if(hierarchy.SCHOOL_YEAR.toString()=="2015-2016"||hierarchy.SCHOOL_YEAR.toString()=="2014-2015"){
				highestStandardMet = "Satisfactory";
			}
        }
        else if(satisfactoryPerformanceDecode[approachesGradeLevel]=="Yes"){
            highestStandardMet = "Approaches Grade Level";
			if(hierarchy.SCHOOL_YEAR.toString()=="2015-2016"||hierarchy.SCHOOL_YEAR.toString()=="2014-2015"){
				highestStandardMet = "Satisfactory";
			}
        }
        else if(_util.coalesce(row.getField(testMetadata.FIELD + '_SCORE_CODE'),row.getField('SCORE_CODE'))=="1" && substitute === "0"){
            highestStandardMet = "Approaches Grade Level";
        	if(hierarchy.SCHOOL_YEAR.toString()=="2015-2016"||hierarchy.SCHOOL_YEAR.toString()=="2014-2015"){
        	    highestStandardMet = "Satisfactory";
            }
        }
        else{
            highestStandardMet = "Does Not Approach Grade Level";
			if(hierarchy.SCHOOL_YEAR.toString()=="2015-2016"||hierarchy.SCHOOL_YEAR.toString()=="2014-2015"){
				highestStandardMet = "Unsatisfactory";
			}
        }
        //testScoreElement.setFieldValue("TEST_CUSTOM_RESULT", highestStandardMet);
        record["TEST_CUSTOM_RESULT"] = highestStandardMet;
        //testScoreElement.setFieldValue("TEST_CUSTOM_RESULT_CODE", "HIGHEST_ST");
        record["TEST_CUSTOM_RESULT_CODE"] = "HIGHEST_ST";
        record["TEST_CUSTOM_PASS_IND"] = passingDecode[highestStandardMet]; //satisf Yes, unsatisf No for old years, For Spl Case UIHN-47319
        // masters/meets Yes, approaches/does not approach No  // For Spl Case UIHN-47319

        //}
        //testScoreElement.setFieldValue("TEST_PERCENTILE_SCORE",mapFirstAvailable(rowValues['PERCENTILE']));
        record["TEST_PERCENTILE_SCORE"] = row.getField('ITEM_LEVEL_PERCENTILE'); // PERCENTILE
        //testScoreElement.setFieldValue("TEST_GROWTH_RESULT", mapFirstAvailable(rowValues['ELL_PROGRESS_MEASURE']));
        //record["TEST_GROWTH_RESULT"] = mapFirstAvailable(rowValues['ELL_PROGRESS_MEASURE']);

        var engII = row.getField('ENGLISH_II_PERFORMANCE_INFORMATION');
        if(engII === undefined || engII === null || engII == "" || engII == "--"){
                //testScoreElement.setFieldValue("TEST_READING_LEVEL", mapFirstAvailable(rowValues['LEXILE_MEASURE']));
                record["TEST_READING_LEVEL"] = row.getField('LEXILE_MEASURE');
        }


        var testedGrade = _util.coalesce(row.getField(testMetadata.FIELD + '_SCORE_CODE'),row.getField('SCORE_CODE'));
        if(testedGrade != null){
            record["TEST_SCORE_ATTRIBUTES"] = scoreCodeDecode[testedGrade];
        }
        return record;
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
    function formatTestDate(dateStr,retestFlag){
        var dateObj = {};
        var fullDateStr = null;
        var month = null;
        var day = null;
        var year = null;

        year = "20"+dateStr.substring(2,4);
        var rawPeriod = dateStr.substring(0,2);

        var periodText = periodDecode[rawPeriod];

        if(periodText=="Spring"){
            day = "15";
            if(retestFlag === "R"){
                day = "20";
            }
            month = "05";
            dateStr = month + "/" + day + "/"+ year;
        }
        else if (periodText=="Fall"){
            day = "15";
            if(retestFlag === "R"){
                day = "20";
            }
            month = "09";
            year = parseInt(year);
            dateStr = month + "/" + day + "/"+ year;
        }
        else if(periodText=="Summer"){
            day = "15";
            if(retestFlag === "R"){
                day = "20";
            }
            month = "01";
            dateStr = month + "/" + day + "/"+ year;
        }
        else{
            dateStr = "06/"+"15/"+ year;
            if(retestFlag === "R"){
                dateStr = "06/"+"20/"+ year;
            }
        }

        fullDateStr = dateStr;


        dateObj.STANDARD_DATE = fullDateStr;
        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;

        return dateObj;
    }

    function formatPeriod(dateStr){
        var rawPeriod = dateStr.substring(0,2);
        return  periodDecode[rawPeriod];
    }

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
    try {
        // Initialize the assessmentAdminKey with relevant identifiers
        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;

        // Get and process the DATE_OF_BIRTH field
        var birthD = _util.coalesce(srcRecord.getField("DATE_OF_BIRTH"), "");
        var birthDateObject1 = {
            RAW_DATE: null,
            MONTH: null,
            DAY: null,
            YEAR: null,
            STANDARD_DATE: null
        };

        if (birthD) {
            try {
                if (birthD.length <= 10 && birthD.indexOf('/') > -1 && signature.getFormat().getFormatName() === 'STAAR_2023_118_COL') {
                    birthDateObject1 = AppUtil.getMonthFollowedByDay(birthD);
                } else if (birthD.length === 7 || birthD.length === 8) {
                    var birthDateStr = ("00000000" + birthD).slice(-8);
                    birthDateObject1 = AppUtil.getDateObjByPattern(birthDateStr, "MMddyyyy");
                } else if (birthD.indexOf('-') > -1) {
                    birthDateObject1 = AppUtil.getMonthFollowedByDay(birthD);
                }
            } catch (exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                    hierarchy.SOURCE_FILE.getFilePath(),
                    "WARNING",
                    srcRecord.getRawField("LINEAGE_LINE"),
                    `Error parsing birth date string: ${exception}`,
                    JSON.stringify(srcRecord.getSourceRow())
                ));
            }
        }

        // Add natural key fields to the assessmentAdminKey
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey += "_" + _util.trim(_util.coalesce(srcRecord.getField(key), ""));
        });

        // Append birthDateObject1 and formatted administration date to the assessmentAdminKey
        var formattedAdminDate = formatTestDate(
            srcRecord.getField("ADMINISTRATION_DATE"),
            srcRecord.getField("FIRST_TIME_TESTER_RETESTER")
        ).STANDARD_DATE;

        assessmentAdminKey += `_${formattedAdminDate}`;

        if (signature.getFormat().getFormatName() !== 'STAAR_2018_EOC' && signature.getFormat().getFormatName() !== 'STAAR_EOC_2020') {
            assessmentAdminKey += `_${birthDateObject1.STANDARD_DATE}`;
        }

        return assessmentAdminKey;
    } catch (exception) {
        throw new Error("Error in generateAssessmentAdminKey: " + exception.message);
    }
}
    return module;
}());