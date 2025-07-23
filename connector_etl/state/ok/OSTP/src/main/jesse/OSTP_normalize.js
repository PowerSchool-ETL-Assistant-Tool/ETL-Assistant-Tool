var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "OSTP";
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
                    if(mappingObject.SCORE_MAPPINGS.length == 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute();

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
             {TEST: "OSTP",  FIELD:"ELA_-_READING/WRITING_PROCESS", CODE: "ELA_RDWRPRO", PARENT:"ELA_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"ELA_-_LANGUAGE", CODE: "ELA_LANG", PARENT:"ELA_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"ELA_-_CRITICAL_READING/WRITING", CODE: "ELA_RDWR", PARENT:"ELA_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"ELA_-", CODE: "ELA_OVR",  MAP_FUNCTION: mapOverallScore}
            , {TEST: "OSTP",  FIELD:"MATHEMATICS_-", CODE: "MA_OVR",  MAP_FUNCTION: mapOverallScore}
            , {TEST: "OSTP",  FIELD:"SCIENCE_-", CODE: "SCI_OVR",  MAP_FUNCTION: mapOverallScore}
            , {TEST: "OSTP",  FIELD:"ELA_-_VOCABULARY", CODE: "ELA_VOCAB", PARENT:"ELA_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"ELA_-_RESEARCH", CODE: "ELA_REA", PARENT:"ELA_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"ELA_-_WRITING_COMPOSITE_SCORE", CODE: "ELA_WRCOMP", PARENT:"ELA_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"MATHEMATICS_-_NUMBER_&_OPERATIONS", CODE: "MA_NUMOP", PARENT:"MATHEMATICS_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"MATHEMATICS_-_ALGEBRAIC_REASONING", CODE: "MA_ALGREG", PARENT:"MATHEMATICS_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"MATHEMATICS_-_GEOMETRY_&_MEASUREMENT", CODE: "MA_GEOMMEAS", PARENT:"MATHEMATICS_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"MATHEMATICS_-_DATA_&_PROBABILITY", CODE: "MA_DATPROB", PARENT:"MATHEMATICS_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"SCIENCE_-_PHYSICAL_SCIENCE", CODE: "SCI_PHYS", PARENT:"SCIENCE_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"SCIENCE_-_LIFE_SCIENCE", CODE: "SCI_LIFSCI", PARENT:"SCIENCE_-",  MAP_FUNCTION: mapStrandScore}
            , {TEST: "OSTP",  FIELD:"SCIENCE_-_EARTH_&_SPACE_SCIENCE", CODE: "SCI_EARSCI", PARENT:"SCIENCE_-",  MAP_FUNCTION: mapStrandScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KG"	: "KG"
        , "01"	: "01"
        , "Grade 01"	: "01"
        ,"02"	: "02"
        ,"Grade 02"	: "02"
        ,"03"	: "03"
        ,"Grade 03"	: "03"
        ,"04"	: "04"
        ,"Grade 04"	: "04"
        ,"05"	: "05"
        ,"Grade 05"	: "05"
        ,"06"	: "06"
        ,"Grade 06"	: "06"
        ,"07"	: "07"
        ,"Grade 07"	: "07"
        ,"08"	: "08"
        ,"Grade 08"	: "08"
        ,"09"	: "09"
        ,"Grade 09"	: "09"
        ,"10"	: "10"
        ,"Grade 10"	: "10"
        ,"11"	: "11"
        ,"Grade 11"	: "11"
        ,"12"	: "12"
        ,"Grade 12"	: "12"
    };

    var recodePerformanceLevel = {
        "Basic" 	: "BAS"
        ,"Below Basic"	: "BEL"
        ,"Proficient"	: "PRO"
        ,"Advanced"	: "ADV"
        ,"Below Standard": "BLS"
        ,"At/Near Standard": "ANS"
        ,"Above Standard": "ABS"
        ,null	: null
    };

    var passPerformanceLevel = {
        "Basic" 	: "No"
        ,"Below Basic"	: "No"
        ,"Below Standard": "No"
        ,"At/Near Standard": "Yes"
        ,"Above Standard": "Yes"
        ,"Proficient"	: "Yes"
        ,"Advanced"	: "Yes"
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
        var birthDateObject = {
                                        RAW_DATE : null
                                        , DAY : null
                                        , MONTH : null
                                        , YEAR : null
                                        , STANDARD_DATE : null
                                     };
        var birthDateStr = row.getField("BIRTH_DATE");
        var testDateObject = parseDate("05/01/"+hierarchy.SCHOOL_YEAR.toString().substring(5,9));
        
        if(birthDateStr !== undefined && birthDateStr!== null) {
            if (birthDateStr.indexOf("-") > -1) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "dd-MM-yyyy");
            } else if (birthDateStr.indexOf("/") > -1) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yyyy");
            } else {
                birthDateObject;
            }
        }
//        var Day = birthDateObject.DAY;
//        var Month = birthDateObject.MONTH;
//        var StandardDate = Month+"/"+Day+"/"+birthDateObject.YEAR;
//        birthDateObject.STANDARD_DATE = StandardDate;
        //Loop through normalized fields and map if possible.
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row,testDateObject);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"),"DISTRICT");
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = row.getField("SCHOOL_ID");
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = '05/01/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
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
                    record.STUDENT_GRADE_CODE = decodeGradeCode(row.getField("ENROLLED_GRADE"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID_(STATE)"), row.getField("STUDENT_ID_(LOCAL)"),row.getField("LAST_NAME"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID_(STATE)"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                 case "STUDENT_FIRST_NAME":
                     record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                     break;
                 case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("MIDDLE_INITIAL"));
                     break;
                 case "STUDENT_LAST_NAME":
                     record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
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

    function mapStrandScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        var performanceLevel = row.getField(testMetadata.FIELD+"_PERFORMANCE_LEVEL");
        if(row.getField(testMetadata.PARENT+"_SPANISH")==="Y"||row.getField(testMetadata.PARENT+"_SPANISH")==="Yes"){
            testNumber=testNumber+"_SPAN";
        }

        // Check for key fields and do not map score and exit if conditions met.
        if( _util.trim(testNumber) === "" || performanceLevel===undefined || performanceLevel===null|| _util.trim(performanceLevel) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = recodePerformanceLevel[performanceLevel];
        score["TEST_PASSED_INDICATOR"] = passPerformanceLevel[performanceLevel];
        return score;
    }
    function mapOverallScore(row, testMetadata) {
        var score = {};

        var testNumber = generateTestNumber(row, testMetadata);
        if(row.getField(testMetadata.FIELD+"_SPANISH")==="Y"||row.getField(testMetadata.FIELD+"_SPANISH")==="Yes"){
            testNumber=testNumber+"_SPAN";
        }
        var performanceLevel = row.getField(testMetadata.FIELD+"_PERFORMANCE_LEVEL");
        var opi = row.getField(testMetadata.FIELD+"_OPI");
        var lexile,quantile;
        if(testMetadata.FIELD==="ELA_-"){
            lexile=row.getField("LEXILE_SCORE");
        }
        if(testMetadata.FIELD==="MATHEMATICS_-"){
            quantile=row.getField("MATHEMATICS_-_QUANTILE_SCORE");
        }

        // Check for key fields and do not map score and exit if conditions met.
        if( _util.trim(testNumber) === "" || performanceLevel===undefined || performanceLevel===null|| _util.trim(performanceLevel) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(!isNaN(opi)){
             score["TEST_SCORE_VALUE"] = opi;
             score["TEST_SCALED_SCORE"] = opi;
        }
        score["TEST_SCORE_TEXT"] = opi;

        score["TEST_PRIMARY_RESULT"] = performanceLevel;
        score["TEST_PRIMARY_RESULT_CODE"] = recodePerformanceLevel[performanceLevel];
        score["TEST_PASSED_INDICATOR"] = passPerformanceLevel[performanceLevel];
        score["TEST_READING_LEVEL"] = lexile;
        score["TEST_SECONDARY_RESULT_CODE"] = "QUANT";
        score["TEST_SECONDARY_RESULT"] = quantile;
        return score;
    }
    /***************************************************************************
     Utility Functions
     ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {
			var testDateObject1 = parseDate("05/01/"+hierarchy.SCHOOL_YEAR.toString().substring(5,9));
			var testDateObject2 = parseDate("05/01/"+hierarchy.SCHOOL_YEAR.toString().substring(5,9));
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one,testDateObject1);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two,testDateObject2);

            if(assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }

        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, testDateObject) {

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
           // + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE;

        if(signature.getFormat().getFormatName()!=="OSTP_Short") {
            //Add natural key fields
            signature.getFormat().getNaturalKey().forEach(function (key) {
                assessmentAdminKey = assessmentAdminKey + "_"
                    + testDateObject.YEAR + "" + testDateObject.MONTH + "_"
                    + _util.coalesce(srcRecord.getField(key), "");
            });
        }
        else{
            assessmentAdminKey = assessmentAdminKey + "_" + testDateObject.YEAR + "" + testDateObject.MONTH;
            signature.getFormat().getNaturalKey().forEach(function (key) {
                    assessmentAdminKey = assessmentAdminKey + "_"  + _util.coalesce(srcRecord.getField(key), "");
            }); 
        }


        return assessmentAdminKey;

    }


    function generateTestNumber(row, testMetadata) {

        var testNumber = null;
        testNumber = testMetadata.TEST + "_"+ testMetadata.CODE;
        return testNumber;
    }


    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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