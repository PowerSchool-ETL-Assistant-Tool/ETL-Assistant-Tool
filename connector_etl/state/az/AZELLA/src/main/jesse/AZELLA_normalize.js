var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AZELLA";
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

    var scoresToMap = [
        {TEST: "AZELLA", CODE:"LIST", FIELD: "LIST", MAP_FUNCTION: mapLIST},
        {TEST: "AZELLA", CODE:"WR", FIELD: "WR", MAP_FUNCTION: mapWR},
        {TEST: "AZELLA", CODE:"RE", FIELD: "RE", MAP_FUNCTION: mapRE},
        {TEST: "AZELLA", CODE:"RC", FIELD: "RC", MAP_FUNCTION: mapRC},
        {TEST: "AZELLA", CODE:"IC", FIELD: "IC", MAP_FUNCTION: mapIC},
        {TEST: "AZELLA", CODE:"PC", FIELD: "PC", MAP_FUNCTION: mapPC},
        {TEST: "AZELLA", CODE:"SP", FIELD: "SP", MAP_FUNCTION: mapSP},
        {TEST: "AZELLA", CODE:"LIT", FIELD: "LIT", MAP_FUNCTION: mapLIT},
        {TEST: "AZELLA", CODE:"LA", FIELD: "LA", MAP_FUNCTION: mapLA},
        {TEST: "AZELLA", CODE:"ORAL", FIELD: "ORAL", MAP_FUNCTION: mapORAL},
        {TEST: "AZELLA", CODE:"COMP", FIELD: "COMP", MAP_FUNCTION: mapCOMP},
        {TEST: "AZELLA", CODE:"TOT", FIELD: "TOT", MAP_FUNCTION: mapTOT},
        {TEST: "AZELLA", CODE:"TOTCOMB", FIELD: "TOTCOMB", MAP_FUNCTION: mapTOTCOMB},
        {TEST: "AZELLA", CODE:"KPT", FIELD: "KPT", MAP_FUNCTION: mapKPT}

    ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/


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

        try {
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
            mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);


            //Map score fields for each expected score mapping
            scoresToMap.forEach(function (testMetadata) {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);
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
        catch(e)
        {
            print(e)
        }
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
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var prodTestId = generateAssessmentAdminKey(signature, hierarchy, row);
        var adminElement = null;


        if (prodTestId != null && !prodTestId.equals('')) {
            var birthValue = row.getField('BIRTH DATE');
            if (birthValue != null && birthValue !== '') {
                if (birthValue.length == 7) {
                    birthValue = '0' + birthValue;
                    var birthDateObject = AppUtil.getMonthFollowedByDay(birthValue);
                } else if (birthValue.length >= 9 || birthValue.length >= 8) {
                    birthDateObject = AppUtil.getMonthFollowedByDay(birthValue);
                }
            }

            var value = row.getField('TEST DATE');

            if(value == undefined || value == null){
                //Default to 05/15/[School Year]
                value = '05/15/' + hierarchy.SCHOOL_YEAR.substring(0,4);
            }

            if(value.length == 7)
                value = '0' + value;

            var testDateObj = AppUtil.getMonthFollowedByDay(value);
            var term = getTermPeriod(row,hierarchy);

            var studentLastName = '';
            var studentFirstName = '';
            var studentMiddleInitial = '';

            if (row.getField('STUDENT_NAME')) {
                var studentName = row.getField('STUDENT_NAME');
                studentLastName = studentName.split(',')[0];
                var firstNameSeparator = studentName.split(',')[1].split(' ');
                var middleInitial = firstNameSeparator[firstNameSeparator.length-1];
                if (middleInitial.length === 1) {
                    studentMiddleInitial = middleInitial;
                    studentFirstName = firstNameSeparator.slice(0,-1).join(' ');
                } else {
                    studentFirstName = studentName.split(',')[1];
                }
            } else {
                studentFirstName = _util.coalesce(row.getField('FIRST NAME'), row.getField('FIRSTNAME'));
                studentLastName = _util.coalesce(row.getField('LAST NAME'), row.getField('LASTNAME'));
                studentMiddleInitial = row.getField('MI');
            }

            /* School Info */
            var schName = '';
            var schId = '';

            if (row.getField('SCHOOLNAME')) {
                var schInfo = row.getField('SCHOOLNAME');
                schName = schInfo.split('(')[0];
                schId = schInfo.split('(')[1].replace(")","");

            } else {
                schName = row.getField('SCH NAME');
                schId = row.getField('SCH CODE');
            }


            normalizedFileFields.forEach(function (field) {
                switch (field) {
                    case "PROD_TEST_ID":
                        record.PROD_TEST_ID = generateAssessmentAdminKey(signature, hierarchy, row);
                        break;
                    case "TEST_ADMIN_PERIOD":
                        record.TEST_ADMIN_PERIOD = getTEST_ADMIN_PERIOD(row,hierarchy);
                        break;
                    case "TEST_ADMIN_DATE_STR":
                        record.TEST_ADMIN_DATE_STR = getTEST_ADMIN_DATE_STR(row,hierarchy);
                        break;

                    case "STUDENT_LOCAL_ID":
                        record.STUDENT_LOCAL_ID = _util.coalesce(getDISTRICT_STUDENT_ID(row),row.getField('SSID'));
                        break;
                    case "STUDENT_STATE_ID":
                        record.STUDENT_STATE_ID = row.getField('SSID');
                        break;
                    case "STUDENT_VENDOR_ID":
                        record.STUDENT_VENDOR_ID = row.getField('SSID');
                        break;
                    //Student Information
                    case "STUDENT_FIRST_NAME":
                        record.STUDENT_FIRST_NAME = studentFirstName;
                        break;
                    case "STUDENT_LAST_NAME":
                        record.STUDENT_LAST_NAME = studentLastName;
                        break;
                    case "STUDENT_MIDDLE_NAME":
                        record.STUDENT_MIDDLE_NAME= studentMiddleInitial;
                        break;
                    case "STUDENT_GENDER_CODE":
                        record.STUDENT_GENDER_CODE = row.getField('GENDER');
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
                    case "STUDENT_GRADE_CODE":
                        record.STUDENT_GRADE_CODE = getTEST_STUDENT_GRADE(row);
                        break;

                    //School Information
                    case "SCHOOL_VENDOR_ID":
                        record.SCHOOL_VENDOR_ID = _util.trim(_util.coalesce(row.getField('SCH CODE'), schId,  "")).toUpperCase();
                        break;
                    case "SCHOOL_LOCAL_ID":
                        record.SCHOOL_LOCAL_ID = _util.coalesce(getDISTRICT_SCHOOL_ID(row), schId);
                        break;
                    case "SCHOOL_STATE_ID":
                        record.SCHOOL_STATE_ID = schId;
                        break;
                    case "SCHOOL_NAME":
                        record.SCHOOL_NAME = schName;
                        break;
                    case "DISTRICT_CODE":
                        record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   _util.trim(_util.coalesce(row.getField('DIST CODE'),AssessmentLoader.config.DISTRICT_CODE));
                        break;
                    case "SCHOOL_YEAR":
                        record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                        break;
                    case "REPORTING_PERIOD":
                        record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                        break;
                    case "ASSESSMENT_ADMIN_KEY":
                        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                        break;
                    case "SYS_PARTITION_VALUE":
                        record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                        break;
                    case "ASSESSMENT_VENDOR":
                        record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                        break;
                    case "ASSESSMENT_PRODUCT":
                        record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                        break;
                    case "TEST_ADMIN_DATE":
                        record.TEST_ADMIN_DATE = testDateObj.STANDARD_DATE;
                        break;
                    default:
                        record[field] = row.getField(field);
                        break;
                }
            });

            return record;
        }
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(admin, row) {
        var admin = {};
        return admin;
    }


    function getTermPeriod(row,hierarchy){
        var cycle = _util.coalesce(row.getField('CYCLE'))

        if(cycle == undefined || cycle == null){
            return hierarchy.ASSESSMENT_PERIOD;
        } else {
            /*
             * 	See if the cycle follows the format of “azellaxxsp” (where xx is the 2 digit year when the test was administered).
             *
             * If cycle is numeric, set to admin period to "PLACE".
             *
             * If cycle is “azellaxxsp”, set the admin period to "REASSESS"
             *
             */
            if(cycle.indexOf('azella') === 0){
                return "REASSESS";
            } else {
                return "PLACE";
            }
        }
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapLIST(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('L WSCO'), row.getField('RS LSTNG'));
        var scaleScore = _util.coalesce(row.getField('L SSCO'), row.getField('SS LSTNG'), row.getField('LISTENING'));

        if (signature.getFormat().getFormatName() === "AZELLA_2023_2024") {
            if (scaleScore === null || scaleScore === "" || scaleScore === undefined) {
                return null;
            }
        }
        else if((score == null || score == '') && (row.getField('SS LSTNG')===undefined || row.getField('SS LSTNG')===null || row.getField('LISTENING')===null))
            return null;


        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = scaleScore;
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] = scaleScore;
        childElement["TEST_PRIMARY_RESULT_CODE"] =  _util.coalesce(row.getField('L PROF'), row.getField('PL LSTNG'), row.getField('PROFICIENCY'));
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('L PROF'), row.getField('PL LSTNG'), row.getField('PROFICIENCY')));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('L PROF'), row.getField('PL LSTNG'), row.getField('PROFICIENCY')));

        return childElement;
    }

    function mapWR(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('W WSCO'), row.getField('RS WRTNG'));
        var scaleScore = _util.coalesce(row.getField('W SSCO'), row.getField('SS T WRTNG'), row.getField('SS PWRTNG'), row.getField('WRITING_SCALED_SCORE'));

        if (signature.getFormat().getFormatName() === "AZELLA_2023_2024") {
            if (scaleScore === null || scaleScore === "" || scaleScore === undefined) {
                return null;
            }
        }
        else if((score == null || score == '') && (row.getField('SS PWRTNG')===undefined || row.getField('SS PWRTNG')===null || row.getField('WRITING_SCALED_SCORE')===null))
            return null;

        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = scaleScore;
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] = scaleScore;
        childElement["TEST_PRIMARY_RESULT_CODE"] =  _util.coalesce(row.getField('W PROF'), row.getField('PL T WRTNG'), row.getField('PL WRTNG'), row.getField('WRITING_PROFICIENCY'));
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('W PROF'), row.getField('PL T WRTNG'), row.getField('PL WRTNG'), row.getField('WRITING_PROFICIENCY')));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('W PROF'), row.getField('PL T WRTNG'), row.getField('PL WRTNG'), row.getField('WRITING_PROFICIENCY')));

        return childElement;
    }

    function mapRE(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('R WSCO'), row.getField('RS RDNG'));
        var scaleScore = _util.coalesce(row.getField('R SSCO'), row.getField('SS RDNG'), row.getField('READING_SCALED_SCORE'));

        if (signature.getFormat().getFormatName() === "AZELLA_2023_2024") {
            if (scaleScore === null || scaleScore === "" || scaleScore === undefined) {
                return null;
            }
        }
        else if((score == null || score == '') && (row.getField('SS RDNG')===undefined || row.getField('SS RDNG')===null || row.getField('READING_SCALED_SCORE')===null))
            return null;

        var childElement =  {};


        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = scaleScore;
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] =  scaleScore;
        childElement["TEST_PRIMARY_RESULT_CODE"] =  _util.coalesce(row.getField('R PROF'), row.getField('PL RDNG'), row.getField('READING_PROFICIENCY'));
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('R PROF'), row.getField('PL RDNG'), row.getField('READING_PROFICIENCY')));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('R PROF'), row.getField('PL RDNG'), row.getField('READING_PROFICIENCY')));

        return childElement;
    }
    function mapRC(row,testMetadata, signature){
        var score = row.getField("RC WSCO");
        if((score == null || score == ''))
            return null;

        var childElement =  {};


        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_PRIMARY_RESULT_CODE"] = row.getField('RC_PROF');
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(row.getField('RC_PROF'));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(row.getField('RC_PROF'));

        return childElement;
    }
    function mapPC(row,testMetadata, signature){
        var score = row.getField("PC WSCO");
        if((score == null || score == ''))
            return null;

        var childElement =  {};


        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_PRIMARY_RESULT_CODE"] = row.getField('PC_PROF');
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(row.getField('PC_PROF'));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(row.getField('PC_PROF'));

        return childElement;
    }
    function mapIC(row,testMetadata, signature){
        var score = row.getField("IC WSCO");
        if((score == null || score == ''))
            return null;

        var childElement =  {};


        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_PRIMARY_RESULT_CODE"] = row.getField('IC_PROF');
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(row.getField('IC_PROF'));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(row.getField('IC_PROF'));

        return childElement;
    }

    function mapSP(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('S WSCO'), row.getField('RS SPKG'));
        var scaleScore = _util.coalesce(row.getField('S SSCO'), row.getField('SS SPKG'), row.getField('SPEAKING_SCALED_SCORE'));

        if (signature.getFormat().getFormatName() === "AZELLA_2023_2024"){
            if(scaleScore === null || scaleScore === "" || scaleScore === undefined) {
                return null;
            }
        } else if ((score == null || score == '') && (row.getField('SS SPKG') === undefined || row.getField('SS SPKG') === null)) {
            return null;
        }


        var childElement =  {};
        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = scaleScore;
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] =  scaleScore;
        childElement["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(row.getField('S PROF'), row.getField('PL SPKG'), row.getField('PL SPKG'), row.getField('SPEAKING_PROFICIENCY'));
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('S PROF'), row.getField('PL SPKG'), row.getField('SPEAKING_PROFICIENCY')));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('S PROF'), row.getField('PL SPKG'), row.getField('SPEAKING_PROFICIENCY')));


        return childElement;
    }

    function mapLIT(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('LIT WSCO'));
        if((score == null || score == '') && (row.getField('LIT SSCO')===undefined || row.getField('LIT SSCO')===null))
            return null;

        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = _util.coalesce(row.getField('LIT SSCO'));
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] =  _util.coalesce(row.getField('LIT SSCO'));
        childElement["TEST_PRIMARY_RESULT_CODE"] =  _util.coalesce(row.getField('LIT PROF'));
        childElement["TEST_PRIMARY_RESULT"] =  getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('LIT PROF')));
        childElement["TEST_PASSED_INDICATOR"] =getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('LIT PROF')));


        return childElement;
    }
    function mapLA(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('LA WSCO'));
        if((score == null || score == '') && (row.getField('LA SSCO')===undefined || row.getField('LA SSCO')===null))
            return null;

        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = _util.coalesce(row.getField('LA SSCO'));
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] =  _util.coalesce(row.getField('LA SSCO'));
        childElement["TEST_PRIMARY_RESULT_CODE"] =  _util.coalesce(row.getField('LA PROF'));
        childElement["TEST_PRIMARY_RESULT"] =  getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('LA PROF')));
        childElement["TEST_PASSED_INDICATOR"] =getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('LA PROF')));


        return childElement;
    }

    function mapORAL(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('O WSCO'), row.getField('RS ORAL'));
        if((score == null || score == '') && (row.getField('SS ORAL')===undefined || row.getField('SS ORAL')===null))
            return null;

        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = _util.coalesce(row.getField('O SSCO'), row.getField('SS ORAL'));
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] =  _util.coalesce(row.getField('O SSCO'), row.getField('SS ORAL'));
        childElement["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(row.getField('O PROF'), row.getField('PL ORAL'));
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('O PROF'), row.getField('PL ORAL')));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('O PROF'), row.getField('PL ORAL')));

        return childElement;
    }

    function mapCOMP(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('C WSCO'), row.getField('RS COMP'));
        if((score == null || score == '') && (row.getField('SS COMP')===undefined || row.getField('SS COMP')===null))
            return null;

        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = _util.coalesce(row.getField('C SSCO'), row.getField('SS COMP'));
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] =  _util.coalesce(row.getField('C SSCO'), row.getField('SS COMP'));
        childElement["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(row.getField('C PROF'), row.getField('PL COMP'));
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('C PROF'), row.getField('PL COMP')));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('C PROF'), row.getField('PL COMP')));


        return childElement;
    }

    function mapTOT(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('TOT RAW SCORE'), row.getField('RS T COMP'));
        var scaleScore = _util.coalesce(row.getField('SCALE SCORE'), row.getField('SCALED SCORE'), row.getField('SS T COMP'), row.getField('TOTAL SCALE SCORE'));

        if (signature.getFormat().getFormatName() === "AZELLA_2023_2024"){
            if(scaleScore === null || scaleScore === "" || scaleScore === undefined) {
                return null;
            }
        }
        else if((score == null || score == '') && (row.getField('SS T COMP')===undefined || row.getField('SS T COMP')===null || row.getField('TOTAL SCALE SCORE')===null)) {
            return null;
        }
        var test = row.getField("AZELLATEST");

        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = scaleScore;
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] =  scaleScore;
        childElement["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(row.getField('PROFICIENCY'), row.getField('PL T COMP'), row.getField('OVERALL PL'));
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('PROFICIENCY'), row.getField('PL T COMP'), row.getField('OVERALL PL')));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('PROFICIENCY'), row.getField('PL T COMP'), row.getField('OVERALL PL')));
        childElement["TEST_SCORE_ATTRIBUTES"] = test;

        return childElement;
    }


    function mapTOTCOMB(row,testMetadata, signature){
        var score = _util.coalesce(row.getField('TC WGT RAW SCORE'));
        var scaleScore = row.getField('TC SSCO');
        if((score === null || score === '') && (scaleScore === null || scaleScore === "" || scaleScore === undefined)){
            return null;
        }
        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = scaleScore;
        childElement["TEST_RAW_SCORE"] = score;
        childElement["TEST_SCALED_SCORE"] =  scaleScore;
        childElement["TEST_PRIMARY_RESULT_CODE"] =  _util.coalesce(row.getField('TC PROF'));
        childElement["TEST_PRIMARY_RESULT"] = getTEST_PRIMARY_RESULT(_util.coalesce(row.getField('TC PROF')));
        childElement["TEST_PASSED_INDICATOR"] = getTEST_PASSED_INDICATOR(_util.coalesce(row.getField('TC PROF')));


        return childElement;
    }


    function mapKPT(row,testMetadata,  signature){
        var scaleScore = row.getField('KPT');
        if(scaleScore === null || scaleScore === "" || scaleScore === undefined){
            return null;
        }
        var childElement =  {};

        childElement["TEST_NUMBER"] = generateTestNumber(row, testMetadata);
        childElement["TEST_SCORE_VALUE"] = scaleScore;
        childElement["TEST_SCALED_SCORE"] =  scaleScore;

        return childElement;
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

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
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

        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(_util.trim(srcRecord.getField(key)), "");
        });

        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {
        var testNumber = testMetadata.TEST  + getTEST_STUDENT_GRADE(row) + testMetadata.CODE;
        return testNumber;

    }

    function getTEST_ADMIN_PERIOD(row,hierarchy){
        var cycle = _util.coalesce(row.getField('CYCLE'))

        if(cycle == undefined || cycle == null){
            return hierarchy.ASSESSMENT_PERIOD;
        } else {
            /*
             * 	See if the cycle follows the format of “azellaxxsp” (where xx is the 2 digit year when the test was administered).
             *
             * If cycle is numeric, set to admin period to "PLACE".
             *
             * If cycle is “azellaxxsp”, set the admin period to "REASSESS"
             *
             */
            if(cycle.indexOf('azella') === 0){
                return "REASSESS";
            } else {
                return "PLACE";
            }
        }


    }

    function getTEST_ADMIN_DATE_STR(row,hierarchy){
        var value = _util.coalesce(row.getField('TEST DATE'));
        if(value == undefined || value == null){
            //Default to 05/15/[School Year]
            value = '05/15/' + hierarchy.SCHOOL_YEAR.substring(0,4);
        }

        if(value.length == 7)
            value = '0' + value;

        return value.substring(0,2) + '/' + value.substring(2,4) + '/' + value.substring(4,8);
    }

    function getDISTRICT_STUDENT_ID(row) {
        if (row.getField('STU_ID') !== undefined || row.getField('STU_ID') !== null) {
            return row.getField('STU_ID');
        }
        else {
            var value = row.getField('SCHOOL ID'), rtnValue = '';
            if (value == null || value == '')
                return null

            var i = 0;
            while (i < value.length && value.charAt(i) == '0')
                i++;

            while (i < value.length)
                rtnValue += value.charAt(i++);
        }
        return rtnValue;
    }

    function getTEST_STUDENT_GRADE(row){
        var value = _util.coalesce(row.getField('GRADE OF STUDENT'), row.getField('GRADE'));
        if(value.length == 1)
            value = '0' + value;

        if(value == '00')
            return 'KG';

        return value;
    }

    function getDISTRICT_SCHOOL_ID(rowValues){
        var value = rowValues['SCH NAME'];
        if(value == null)
            return null;

        return _util.trim(value);
    }

    function getTEST_PRIMARY_RESULT(value){
        if(value === '0' || value === 'PE/E/B' || value === 'PrE/E/B')
            return 'Pre-Emergent/Emergent/Basic'
        else if(value === '1' || value === 'PE/E' || value === 'PrE/E')
            return 'Pre-Emergent/Emergent';
        else if(value === '2' || value === 'BAS' || value === 'B')
            return 'Basic';
        else if(value === '3' || value === 'B/I')
            return 'Basic/Intermediate';
        else if(value === '4' || value === 'INT' || value === 'I')
            return 'Intermediate';
        else if(value === '5' || value === 'PROF' || value === 'P')
            return 'Proficient';
        else if(value === 'X')
            return 'No Overall Proficiency Level';
        else
            return 'Unknown';
    }

    function getTEST_PASSED_INDICATOR(field){
        if(field === '5' || field === 'PROF' || field === 'P') {
            return 'Yes';
        }
        return 'No';
    }

    return module;

}());
