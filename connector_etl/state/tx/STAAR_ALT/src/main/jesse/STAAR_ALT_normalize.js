var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "STAAR_ALT";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /** Java classes **/
    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
    const BufferedReader = Java.type("java.io.BufferedReader");
    const InputStreamReader = Java.type('java.io.InputStreamReader');
    const CSVWriter = Java.type("com.opencsv.CSVWriter");
    const FileWriter = Java.type("java.io.FileWriter");
    const File = Java.type("java.io.File");

    const SignatureFormatType = {
        DELIMITED: 'class com.versifit.fileDetector.recordFormat.DelimitedRecordFormat',
        FIXED_LENGTH: 'class com.versifit.fileDetector.recordFormat.FixedWidthRecordFormat'
    };

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
       try {
            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const records = getRecords(file, signature);

            print("\nLoading using signature file ${signature.getFormat().getFormatName()}\n");

            let normalizedFile = AppUtil.createResultsFile(file);

            print("\nNormalized file: ${normalizedFile}");

            let normalizedRows = [], normalizedRecords = [];

            records.forEach((record) => {
                try {
                    // Removing white spaces
                    if (typeof record === 'object') {
                        for (let key in record) {
                            if (typeof record[key] === 'string') {
                                record[key] = _util.trim(record[key]);
                            }
                        }
                    }

                    mapNormalizedRecords(signature, hierarchy, [record])
                        .forEach((normalizedRecord) => {
                            normalizedRows.push(normalizedRecord);
                        });
                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH",
                        record.LINEAGE_LINE,
                        "mapNormalizedRecords error: ${exception}",
                        JSON.stringify(record)
                    ));
                }
            });

            normalizedRows.forEach((row) => {
                try {
                    const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    if (mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            file.getFilePath(),
                            "WARNING",
                            row.LINEAGE_LINE,
                            "No scores found.",
                            JSON.stringify(row)
                        ));
                    } else {
                        normalizedRecords.push(row);
                    }

                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH",
                        _util.coalesce(row.LINEAGE_LINE, -1),
                        "SCORE COUNT CHECK dataflow error: ${exception}",
                        JSON.stringify(row)
                    ));
                }
            });

            writeNormalizedRecords(normalizedFile, normalizedRecords);

//            _dataflow.create("RECORD BUILD")
//                .input("INPUT", AppUtil.getInputDataflow(file, signature))
//                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
//
// json.LINEAGE_FILE = fileFullName;
//                    json.LINEAGE_LINE = (++lineNumber).toString();
//                    output.RECORDS.put(json);
//                })
//                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
//                    try {
//                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
//                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
//
//                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
//                    }
//                })
//                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
//                    try{
//                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
//                            rows.forEach(function(row) {
//                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
//                            });
//
//                        } else {
//                            output.RECORDS.put(rows);
//                        }
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
//                    }
//                })
//                .transform("NORMALIZE RECORDS", ["RECORDS"], function(output, rows) {
//                    try{
//                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);
//                        normalizedRecords.forEach(function(record) {
//                            output.RECORDS.put(record);
//                        });
//
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
//                    }
//                })
//                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
//                    try {
//                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
//
//                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
//                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
//                        } else {
//                            output.RECORDS.put(row);
//                        }
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
//                    }
//                })
//                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
//                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);
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
        // Line 782
    var scoresToMap = [
    {TEST: "STAAR_ALT", CODE:"RD", FIELD: "READING", MAP_FUNCTION: mapScores},
    {TEST: "STAAR_ALT", CODE:"WR", FIELD: "WRITING", MAP_FUNCTION: mapScores},
    {TEST: "STAAR_ALT", CODE:"SS", FIELD: "SOCIAL_STUDIES", MAP_FUNCTION: mapScores},
    {TEST: "STAAR_ALT", CODE:"MA", FIELD: "MATHEMATICS", MAP_FUNCTION: mapScores},
    {TEST: "STAAR_ALT", CODE:"SCI", FIELD: "SCIENCE", MAP_FUNCTION: mapScores},
    {TEST: "STAAR_ALT", CODE:"ALG", FIELD: "ALGEBRA", MAP_FUNCTION: mapScores},

    {TEST: "STAAR_ALT", CODE:"", FIELD: "", MAP_FUNCTION: mapScaledScore},
    {TEST: "STAAR_ALT", CODE:"1", FIELD: "REPORTING_CATEGORY_SCORES_", MAP_FUNCTION: mapSubScore},
    {TEST: "STAAR_ALT", CODE:"2", FIELD: "REPORTING_CATEGORY_SCORES_", MAP_FUNCTION: mapSubScore},
    {TEST: "STAAR_ALT", CODE:"3", FIELD: "REPORTING_CATEGORY_SCORES_", MAP_FUNCTION: mapSubScore},
    {TEST: "STAAR_ALT", CODE:"4", FIELD: "REPORTING_CATEGORY_SCORES_", MAP_FUNCTION: mapSubScore},

    ];


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

    var scoreCodeDefaultDecode = {
        "3" : "Student previously achieved Level II: Satisfactory"
        , "2" : "Student had history but did not indicate Level II: Satisfactory"
        , "1" : "Score code was left blank or multiple values were gridded in the field"
        , "0" : "The score code was not defaulted"

    };

    var onlineTestDisruptionFlag = {
        "1" : "Inactivity"
        , "2" : "Test Version"
        , "3" : "Both Inactivity and Test Version"
        ,"": null
        ," ": null
    };

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

    var progressMeasureDecode={
        "2" : "Accelerated"
        , "1" : "Expected"
        , "0" : "Limited"
        , "": null
        ," ": null
        ,null : null
    };

    var satisfactoryPerformanceDecode={
        "1" : "Yes"
        , "0" : "No"
        , "": null
        ," ": null
    };

    var academicPerformanceDecode={
        "1" : "Yes"
       ,"0" : "No"
       , "": null
       ," ": null
       ,null: null
    };
    var performanceLevelDecode = {
        "1" : "Yes",
        "2" : "Yes",
        "3" : "Yes",
        "":  "No",
        " ": "No",
        null: "No",
    };

    var testerRetesterDecode={
        "F" : "First-Time Tester"
        , "R" : "Retester"
    };

    var monthDecode={
        "03" : "March"
        , "04" : "April"
        , "05" : "May"
        , "06" : "June"
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
        //print(`passed record ${JSON.stringify(record)}`);

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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata.CODE, testMetadata.FIELD);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
        var birthDateStr = _util.coalesce(row.getField("DATE_OF_BIRTH"), "");
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        var numericPeriod = row.getField("ADMINISTRATION_DATE");
        var period;
        if(numericPeriod !== null && numericPeriod !== undefined) {
            numericPeriod === "0421" ? period = "Spring" : period = hierarchy.REPORTING_PERIOD;
        } else {
            period = hierarchy.REPORTING_PERIOD;
        }

        try {
            if (birthDateStr !== null && birthDateStr !== undefined ) {
               //birthDateStr = (("00000000" + birthDateStr).slice(-8));
                birthDateObject = AppUtil.getMonthFollowedByDay(birthDateStr);// AppUtil.getMonthFollowedByDay
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
                    record.REPORTING_PERIOD = period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = formatTestDate(row.getField("ADMINISTRATION_DATE")).STANDARD_DATE;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, "");
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, "");
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, "");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("SEX_CODE"));
                    break;
                case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE_LEVEL"))];
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
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"),row.getField("LOCAL_STUDENT_ID"));
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
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = row.getField("CAMPUS_NAME");
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
        var admin = {};
        /*
        admin.TEST_EXEMPTION_CODE = _util.coalesce(row.getField("SCORE_CODE_INFORMATION_READING"));
        admin.TEST_EXEMPTION_DESC = scoreCodeDecode[row.getField("SCORE_CODE_INFORMATION_READING")];
        admin.TEST_EXEMPTION_CODE_2 = row.getField("SCORE_CODE_INFORMATION_MATHEMATICS");
        admin.TEST_EXEMPTION_DESC_2 = scoreCodeDecode[row.getField("SCORE_CODE_INFORMATION_MATHEMATICS")];
        admin.TEST_EXEMPTION_CODE_3 = row.getField("SCORE_CODE_INFORMATION_WRITING");
        admin.TEST_EXEMPTION_DESC_3 = scoreCodeDecode[row.getField("SCORE_CODE_INFORMATION_WRITING")];
        admin.TEST_EXEMPTION_CODE_4 = row.getField("SCORE_CODE_INFORMATION_SOCIAL_STUDIES");
        admin.TEST_EXEMPTION_DESC_4 = scoreCodeDecode[row.getField("SCORE_CODE_INFORMATION_SOCIAL_STUDIES")];
        admin.TEST_INTERVENTION_CODE = row.getField("SCORE_CODE_INFORMATION_SCIENCE");
        admin.TEST_INTERVENTION_DESC = scoreCodeDecode[row.getField("SCORE_CODE_INFORMATION_SCIENCE")];
        */
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScores(row, testNumberCode, testField){
        var record = {};
        var code = testNumberCode;
        var version = _util.coalesce(row.getField(testField +'_TEST_VERSION'), "");
        var progressMeasure = row.getField(testField+'_STAAR_PROGRESS_MEASURE');
        var levelTwoPerformance = row.getField('LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE_IN_' + testField);
        var levelThreePerformance = row.getField('LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE_IN_' + testField);
        var testedGrade = row.getField("SCORE_CODE_INFORMATION_" + testField);
        var language = row.getField(testField+'_LANGUAGE_VERSION'); //NOT AVAILABLE
        if (language === null || language === "" || language === undefined) {
            language = "E"; // Default to English
        }
        var testNumber = "STAAR_ALT_" + code + "_" + version + "_" + language;

        var scaleScore = row.getField(testField + '_SCALE_SCORE');
        var rawScore = row.getField(testField + '_RAW_SCORE');
        if(rawScore === undefined || rawScore === null || rawScore == "" || rawScore == "--"){
            return null;
        }
        if(scaleScore!==""){
            scaleScore = parseInt(scaleScore,10);
            record["TEST_SCORE_TEXT"] = scaleScore;
            record["TEST_SCORE_VALUE"] = scaleScore;
            record["TEST_SCALED_SCORE"] = scaleScore;
        }
        rawScore = parseInt(rawScore,10);
        record["TEST_NUMBER"] = testNumber;
        record["TEST_RAW_SCORE"] = rawScore;
        record["TEST_PRIMARY_RESULT"] = satisfactoryPerformanceDecode[levelTwoPerformance];
        record["TEST_PRIMARY_RESULT_CODE"] = levelTwoPerformance;
        record["TEST_SECONDARY_RESULT"] = progressMeasureDecode[progressMeasure];
        record["TEST_SECONDARY_RESULT_CODE"] = progressMeasure;
        record["TEST_PASSED_INDICATOR"] = satisfactoryPerformanceDecode[levelTwoPerformance];
        record["TEST_TERTIARY_RESULT"] = satisfactoryPerformanceDecode[levelThreePerformance];
        record["TEST_TERTIARY_RESULT_CODE"] = levelThreePerformance;
        if(testedGrade != null){
            record["TEST_SCORE_ATTRIBUTES"] = scoreCodeDecode[testedGrade];
        }
        if(undefined === progressMeasureDecode[progressMeasure]){
            record["TEST_SECONDARY_RESULT"] = null;
        }

        return record;
    }

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = null;
        var test = null;
    	    	var subName = _util.coalesce(row.getField("TESTSUBJECT"),row.getField("TEST_NAME").substring(37).trim());
    	if(subName === undefined || subName === null || subName == "" || subName == "--"){
    		return null;
    	}
    	subName = subName.toString();
    	if(subName === "MATH" || subName =="Mathematics"){
    	test = "MA";
    	}
    	else if(subName === "READ" || subName == "Reading"){
    	test = "RD";
    	}
    	else if(subName === "SCI"|| subName == "Science"){
    	test = "SCI";
    	}
    	else if(subName === "SOCSTUD"|| subName == "Social Studies"){
    	test = "SS";
    	}
    	else if(subName === "WRI"|| subName == "Writing"){
    	test = "WR";
    	}
    	if(test === undefined || test === null || test == "" || test == "--"){
    		return null;
    	}

    	var version = _util.coalesce(row.getField('TEST_VERSION'));
        var scaleScore = row.getField('SCALE_SCORE');
        var rawScore = row.getField('RAW_SCORE');
        var scoreCode = row.getField('SCORE_CODE');
        var progressMeasure = row.getField('STAAR_PROGRESS_MEASURE');
        var levelTwoPerformance = row.getField('SATISFACTORY_ACADEMIC_PERFORMANCELEVEL_II');
        var academicPerformance = row.getField('ACCOMPLISHED_ACADEMIC_PERFORMANCELEVEL_III');
        var satisfactoryGradeLevel = row.getField('MEETS_GRADE_LEVEL');
        var mastersGradeLevel = row.getField('MASTERS_GRADE_LEVEL');
        var satisfactoryPerformance = row.getField('APPROACHES_GRADE_LEVEL');
        var overallPerfLevel = row.getField("OVERALL_PERFORMANCE_LEVEL");
        if (overallPerfLevel === undefined || overallPerfLevel === null || overallPerfLevel === "") {
            return null;
        }
        var language = row.getField('TEST_LANGUAGE_VERSION'); //NOT AVAILABLE
        if (language === null || language === "" || language === undefined) {
            language = "E";
        }     // Default to English
        var grade = row.getField('GRADE_LEVEL');
        var percentile = row.getField('PERCENTILE');


        //        var testNumber = "STAAR_ALT_" + test + "_" + version + "_" + language;
        if (version === null) {
            testNumber = "STAAR_ALT_" + test + "_" + language;
        } else {
            testNumber = "STAAR_ALT_" + test + "_" + version + "_" + language;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

    	if(scaleScore === undefined || scaleScore === null || scaleScore == "" || scaleScore == "--"){
    		return null;
    	}

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_PRIMARY_RESULT"] = satisfactoryPerformanceDecode[levelTwoPerformance] || performanceLevelDecode[overallPerfLevel];
        score["TEST_PRIMARY_RESULT_CODE"] = levelTwoPerformance || overallPerfLevel;
        score["TEST_SECONDARY_RESULT_CODE"] = progressMeasure;
        score["TEST_SECONDARY_RESULT"] = progressMeasureDecode[progressMeasure];
        score["TEST_QUATERNARY_RESULT"] = academicPerformanceDecode[academicPerformance];
        score["TEST_QUATERNARY_RESULT_CODE"] = academicPerformance;
        score["TEST_SCORE_ATTRIBUTES"] = scoreCodeDecode[scoreCode];
        if(undefined === progressMeasureDecode[progressMeasure]){
            score["TEST_SECONDARY_RESULT"] = null;
        }
        score["TEST_GRADE_EQUIVALENT"] = grade;
        score["TEST_PERCENTILE_SCORE"] = percentile;

        var highestStandardMet = null;
                if(satisfactoryPerformanceDecode[mastersGradeLevel] === "Yes" || overallPerfLevel === "3"){
                    highestStandardMet = "Masters Grade Level";
                    score["TEST_PASSED_INDICATOR"] = "Yes";
                }
                else if(satisfactoryPerformanceDecode[satisfactoryGradeLevel] === "Yes" || overallPerfLevel === "2"){
                    highestStandardMet = "Meets Grade Level";
                    score["TEST_PASSED_INDICATOR"] = "Yes";

                }
                else if(satisfactoryPerformanceDecode[satisfactoryPerformance] === "Yes" || overallPerfLevel === "1"){
                    highestStandardMet = "Approaches Grade Level";
                    score["TEST_PASSED_INDICATOR"] = "Yes";

                }
                else{
                    highestStandardMet = "Does Not Approach Grade Level";
                    score["TEST_PASSED_INDICATOR"] = "No";
                }
                score["TEST_CUSTOM_RESULT"] = highestStandardMet;
                score["TEST_CUSTOM_RESULT_CODE"] = "HIGHEST_ST";

        return score;
    }


    function mapSubScore(row, testNumberCode, testField) {
        var score = {};
        var code = testNumberCode;
        var testNumber = null;
        var test = null;
    	var subName = row.getField("TESTSUBJECT");
    	if(subName === undefined || subName === null || subName == "" || subName == "--"){
    		return null;
    	}
    	subName = subName.toString();
    	if(subName === "MATH"){
    	test = "MA";
    	}
    	else if(subName === "READ"){
    	test = "RD";
    	}
    	else if(subName === "SCI"){
    	test = "SCI";
    	}
    	else if(subName === "SOCSTUD"){
    	test = "SS";
    	}
    	else if(subName === "WRI"){
    	test = "WR";
    	}
    	if(test === undefined || test === null || test == "" || test == "--"){
    		return null;
    	}

    	var version = _util.coalesce(row.getField('TEST_VERSION'));
        var scaleScore = row.getField(testField + testNumberCode);
        var language = row.getField('TEST_LANGUAGE_VERSION');
        if (language === null || language === "" || language === undefined) {
            language = "E";
        }

        var testNumber = "STAAR_ALT_" + test + "_RC_" + testNumberCode + "_" + version + "_" + language;

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

    	if(scaleScore === undefined || scaleScore === null || scaleScore == "" || scaleScore == "--"){
    		return null;
    	}

        score["TEST_SCALED_SCORE"] = scaleScore;

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
    function formatTestDate(dateStr){
        var dateObj = {};
        var fullDateStr = null;
        var month = null;
        var day = null;
        var year = null;

        //year = parseInt(getLoaderParameter("SCHOOL_YEAR").substring(0,4));
         // New logic: if 8-digit input like MMDDYYYY
         if (dateStr.length === 8) {
                month = dateStr.substring(0, 2);
                day = dateStr.substring(2, 4);
                year = dateStr.substring(4, 8);
                fullDateStr = month + "/" + day + "/" + year;

                dateObj.FULL_DATE = fullDateStr;
                dateObj.MONTH = month;
                dateObj.DAY = day;
                dateObj.YEAR = year;
                dateObj.STANDARD_DATE = fullDateStr;

                return dateObj;
            }

        if (dateStr.length === 3){
        dateStr = "0" + dateStr;
        }
        var rawPeriod = dateStr.substring(0,2);
        year = "20"+dateStr.substring(2,4);

        var monthText = monthDecode[rawPeriod];
        if(monthText=="March"){
            day = "01";
            month = "03";
            dateStr = month + "/" + day + "/"+ year;
        }
        else if(monthText=="April"){
            day = "01";
            month = "04";
            dateStr = month + "/" + day + "/"+ year;
        }
        else if (monthText=="May"){
            day = "01";
            month = "05";
            dateStr = month + "/" + day + "/"+ year;
        }
        else if(monthText=="June"){
            day = "01";
            month = "06";
            dateStr = month + "/" + day + "/"+ year;
        }
        else{
            dateStr = "02/"+"01/"+ year;
        }
        fullDateStr = dateStr;

        dateObj.FULL_DATE = fullDateStr;
        dateObj.MONTH = month;
        dateObj.DAY = day;
        dateObj.YEAR = year;
        dateObj.STANDARD_DATE = fullDateStr;

        return dateObj;
    }

    function writeNormalizedRecords(file, data) {
        try {
            const normalFile = _file.open(file);
            const normalFilePath = normalFile.getParent();
            const normalFileName = normalFile.getName();
            const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
            let rowArray = null;
            const header = Object.keys(data[0]);

            writer.writeNext(header);

            data.forEach(function (row) {
                rowArray = [];

                for (let key in row) {
                    rowArray.push(row[key]);
                }
                writer.writeNext(rowArray);
            })

            writer.close();
        } catch (exception) {
            throw "${_thisModuleName}.writeNormalizedRecords Exception: ${exception}";
        }
    }

    function getRecords(file, signature) {
        try {
            const format = signature.getFormat();
            const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
			const fileFullName = file.getFullName();
            let lineNumber = 0;
            let recordsArray = [];

            let record, row;

            if (signature.getFormat().getClass().toString().equals(SignatureFormatType.DELIMITED)) {
                let fieldDelimiter = format.getFieldDelim();
                let textDelimiter = format.getQuoteDelim();
                let delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
                let fieldNames = delimitedRecordParser.parseRow(reader);
                while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                    let index = 0;

                    record = { LINEAGE_FILE: null, LINEAGE_LINE: null };

                    for (const key in fieldNames) {
                        record[fieldNames[index]] = row.get(index++);
                    }

                    record.LINEAGE_FILE = fileFullName;
					record.LINEAGE_LINE = (++lineNumber).toString();

                    recordsArray.push((record));
                }
            } else if (signature.getFormat().getClass().toString().equals(SignatureFormatType.FIXED_LENGTH)) {
                let fields = format.getFields();
                while ((row = reader.readLine()) !== null) {
                    record = { LINEAGE_FILE: null, LINEAGE_LINE: null };
                    fields.forEach(field => {
                        record[field.getPhysicalName()] = row.substring(
                            field.getFieldOffset().getOffsetStart() - 1,
                            field.getFieldOffset().getOffsetEnd()
                        ).trim();
                    });
                    record.LINEAGE_FILE = fileFullName;
                    record.LINEAGE_LINE = (++lineNumber).toString();

                    recordsArray.push(record);
                }
            } else {
                throw new Error("Invalid Signature Format");
            }

            return recordsArray;
        } catch (exception) {
            throw "${_thisModuleName}.createRecords Exception: ${exception}";
        }
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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        // Extract subject from TEST_NAME
        var testName = _util.coalesce(srcRecord.getField("TEST_NAME"), "");
        var subject = "";

        if (testName !== "") {
            // Extract subject from TEST_NAME (assuming it's at the end after position 37)
            var subName = testName.substring(37).trim();

            if (subName === "MATH" || subName === "Mathematics") {
                subject = "MA";
            } else if (subName === "READ" || subName === "Reading") {
                subject = "RD";
            } else if (subName === "SCI" || subName === "Science") {
                subject = "SCI";
            } else if (subName === "SOCSTUD" || subName === "Social Studies") {
                subject = "SS";
            } else if (subName === "WRI" || subName === "Writing") {
                subject = "WR";
            } else {
                // If no match, use the original subject name
                subject = subName;
            }
        }

        // Add subject to assessment admin key if found
        if (subject !== "") {
            assessmentAdminKey = assessmentAdminKey + "_" + subject;
        }
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key),""));
        });
        return assessmentAdminKey;
    }
    return module;
}());