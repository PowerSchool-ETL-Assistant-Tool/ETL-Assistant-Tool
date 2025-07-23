var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "WORKKEYS";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {

            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName} \n");


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print("Normalized file: ${normalizedFile} \n");

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
                .group_by("ADMINISTRATION GROUPING", function (one, two) {

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"],
                    function (output, rows) {
                        try {

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function (record) {
                                output.RECORDS.put(record);
                            });

                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }


                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        // Report when no scores are found.
                        if (mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;

        } catch (exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        } n
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function (file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    var scoresToMap = [
        { TEST: "WORKKEYS", CODE: "_TOT", FIELD: "OVERALL", MAP_FUNCTION: mapScaledScore },
        { TEST: "WORKKEYS", CODE: "BW", FIELD: "_DEV", MAP_FUNCTION: mapStrandScaledScore },
        { TEST: "WORKKEYS", CODE: "BW", FIELD: "_ORG", MAP_FUNCTION: mapStrandScaledScore },
        { TEST: "WORKKEYS", CODE: "BW", FIELD: "_WC", MAP_FUNCTION: mapStrandScaledScore },
        { TEST: "WORKKEYS", CODE: "BW", FIELD: "_GRAM", MAP_FUNCTION: mapStrandScaledScore },
        { TEST: "WORKKEYS", CODE: "BW", FIELD: "_MECH", MAP_FUNCTION: mapStrandScaledScore },

        { TEST: "WORKKEYS", CODE: "LEVEL", FIELD: "_SCORE", TRACKER: "ADMIN", MAP_FUNCTION: mapLevelScore },
        { TEST: "WORKKEYS", CODE: "TOT_WAM", FIELD: "OVERALL_WORKKEYS_APPLIED_MATH", TRACKER: "ADMIN", MAP_FUNCTION: mapAdditionalScore },
        { TEST: "WORKKEYS", CODE: "TOT_WGL", FIELD: "OVERALL_WORKKEYS_GRAPHIC_LITERACY", TRACKER: "ADMIN", MAP_FUNCTION: mapAdditionalScore },
        { TEST: "WORKKEYS", CODE: "TOT_WWD", FIELD: "OVERALL_WORKKEYS_WORKPLACE_DOCUMENTS", TRACKER: "ADMIN", MAP_FUNCTION: mapAdditionalScore }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    //TODO add any additional decodes
    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "10": "10",
        "Grade 10": "10",
        "11": "11",
        "Grade 11": "11",
        "12": "12",
        "Grade 12": "12",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG",
        "12th Grade": "12",
        "12th grade": "12",
        "11th Grade": "11",
        "11th grade": "11",
        "10th Grade": "10",
        "10th grade": "10",
        "perfernotrespond": null,
        "Dual enrollment-12th grade & college": "12/college",
        "": null,
        null: null
    };

    primaryDecodeStrand = {
        "1": "LEVEL 1"
        , "2": "LEVEL 2"
        , "3": "LEVEL 3"
        , "4": "LEVEL 4"
        , "5": "LEVEL 5"
        , "": null
        , null: null
    };

    primaryDecodeOverall = {
        "1": "BRONZE"
        , "2": "BRONZE"
        , "3": "BRONZE"
        , "4": "SILVER"
        , "5": "GOLD"
        , "6": "PLATINUM"
        , "<3": "BRONZE"
        , "<1": "BRONZE"
        , "N" : "No credential"
        , "B" : "BRONZE"
        , "G" : "GOLD"
        , "S" : "SILVER"
        , "P" : "PLATINUM"
        , "": null
        , null: null
    };




    var testDecode = {
        "Business Writing": "BW"
        , "Reading for Information": "RI"
        , "WorkKeys Workplace Documents": "WWD"
        , "WorkKeys Graphic Literacy": "WGL"
        , "WorkKeys Applied Math": "WAM"
        , "Workplace Observation": "WO"
        , "Alfabetizacion Grafica - Graphic Literacy": "SGL"
        , "Documentos de Trabajo - Workplace Documents": "SWD"
        , "Matematicas Aplicadas - Applied Math": "SAM"
    }

    var decodeScoresKeys = {
        "OVERALL_WORKKEYS_APPLIED_MATH": "WorkKeys Applied Math",
        "OVERALL_WORKKEYS_GRAPHIC_LITERACY": "WorkKeys Graphic Literacy",
        "OVERALL_WORKKEYS_WORKPLACE_DOCUMENTS": "WorkKeys Workplace Documents",
        "LEVEL": "Level"
    }
    var passDecode = {
            "BRONZE" :  {CODE: "<=3", PASS_IND: "No"},
            "<1" :  {CODE: "<1", PASS_IND: "No"},
            "<3" :  {CODE: "<=3", PASS_IND: "No"},
            "3" :  {CODE: "3", PASS_IND: "No"}
            ,"SILVER" : {CODE: "4", PASS_IND: "Yes"}
            ,"4" : {CODE: "4", PASS_IND: "Yes"}
            ,"GOLD" : {CODE: "5", PASS_IND: "Yes"}
            ,"5" : {CODE: "5", PASS_IND: "Yes"}
            ,"PLATINUM" : {CODE: "6", PASS_IND: "Yes"}
            ,"6" : {CODE: "6", PASS_IND: "Yes"}
            ,"7" : {CODE: "7", PASS_IND: "Yes"}
            ,"N/A"  : {CODE: null, PASS_IND: null}
            ,"N"  : {CODE: "No credential", PASS_IND: "No"}
            ,"B"  : {CODE: "<=3", PASS_IND: "No"}
            ,"S"  : {CODE: "4", PASS_IND: "Yes"}
            ,"G"  : {CODE: "5", PASS_IND: "Yes"}
            ,"P"  : {CODE: "6", PASS_IND: "Yes"}
            ,"" : {CODE: null, PASS_IND: null}
            ,null : {CODE: null, PASS_IND: null}
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

        if (signature.getFormat().getFormatName() === 'WORKKEYS_18' ||
            signature.getFormat().getFormatName() === 'WORKKEYS_26') {
            var scoresByDate = setAdminByDate(signature, hierarchy, row);
            for (var scoreDateKey in scoresByDate) {
                AppUtil.nullSafePush(normalizedRecords, mapNormalizedRecord(signature, hierarchy, row, scoreDateKey, scoresByDate[scoreDateKey]));
            }
        } else {
            var record = mapNormalizedRecord(signature, hierarchy, row);
            AppUtil.nullSafePush(normalizedRecords, record);
        }

        return normalizedRecords;
    }

    function setAdminByDate(signature, hierarchy, row) {
        var scoresByDate = {};
        scoresToMap.forEach(function (scoreData) {
            var scoreDateKey;
            if (scoreData.TRACKER === "ADMIN" && scoreData.FIELD === "OVERALL_WORKKEYS_APPLIED_MATH") {
                var mathDate = _util.coalesce(row.getField(scoreData.FIELD + "_TEST_DATE"), "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(5,9)}");
                if (mathDate && (mathDate.indexOf('/') > -1 || mathDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.FIELD + '#' + String(mathDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapAdditionalScore(signature, row, scoreData));
            } else if (scoreData.TRACKER === "ADMIN" && scoreData.FIELD === "OVERALL_WORKKEYS_GRAPHIC_LITERACY") {
                var literacyDate = _util.coalesce(row.getField(scoreData.FIELD + "_TEST_DATE"), "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(5,9)}");
                if (literacyDate && (literacyDate.indexOf('/') > -1 || literacyDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.FIELD + '#' + String(literacyDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapAdditionalScore(signature, row, scoreData));
            } else if (scoreData.TRACKER === "ADMIN" && scoreData.FIELD === "OVERALL_WORKKEYS_WORKPLACE_DOCUMENTS") {
                var documentsDate = _util.coalesce(row.getField(scoreData.FIELD + "_TEST_DATE"), "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(5,9)}");
                if (documentsDate && (documentsDate.indexOf('/') > -1 || documentsDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.FIELD + '#' + String(documentsDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapAdditionalScore(signature, row, scoreData));
            } else if (scoreData.TRACKER === "ADMIN" && scoreData.FIELD === "_SCORE") {
                var levelDate = _util.coalesce(row.getField("CERTIFICATE_ISSUE_DATE"), "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(5,9)}");
                if (levelDate && (levelDate.indexOf('/') > -1 || levelDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.CODE + '#' + String(levelDate);
                    scoresByDate[scoreDateKey] = [];
                }
                AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapLevelScore(signature, row, scoreData));
            }
        });

        return scoresByDate;
    }

    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     * @returns {Object}
     */
    function mapNormalizedRecord(signature, hierarchy, row, scoreDateKey, scores) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        if (signature.getFormat().getFormatName() === 'WORKKEYS_18' ||
            signature.getFormat().getFormatName() === 'WORKKEYS_26') {
            mappingObject.SCORE_MAPPINGS = scores;
            record = mapNormalizedAdminFields(signature, hierarchy, row, scoreDateKey);
        } else {
            record = mapNormalizedAdminFields(signature, hierarchy, row);
        }

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        if (signature.getFormat().getFormatName() !== 'WORKKEYS_18' &&
            signature.getFormat().getFormatName() !== 'WORKKEYS_26') {
            scoresToMap.forEach(function (testMetadata) {
                try {
                    var score = (testMetadata.MAP_FUNCTION)(signature, row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
                }
            });
        }

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
    }

            function dateConverter(dateString) {
                if (!dateString || typeof dateString !== 'string' || dateString.trim() === '') {
                    return { finalDates: null, months: null, days: null, years: null };
                }

                var dateParts, dateObj, year, month, day;

                // Strip time
                var timeIndex = dateString.indexOf(" ");
                if (timeIndex !== -1) {
                    dateString = dateString.split(" ")[0];
                }
                dateString = dateString.replace(/-/g, '/');

                // Handle MMddyyyy format
                if (dateString.match(/^\d{8}$/)) {
                    if (parseInt(dateString.substring(0, 4), 10) > 1900) { // Likely YYYYMMDD format
                        year = dateString.substring(0, 4);
                        month = dateString.substring(4, 6);
                        day = dateString.substring(6, 8);
                    } else { // MMddyyyy format
                        month = dateString.substring(0, 2);
                        day = dateString.substring(2, 4);
                        year = dateString.substring(4, 8);
                    }
                }
                // Handle YYYY/MM/DD, DD/MM/YYYY, or MM/DD/YYYY
                else if (dateString.match(/^\d{4}\/\d{2}\/\d{2}$/)) { // YYYY/MM/DD format
                    dateParts = dateString.split('/');
                    year = dateParts[0];
                    month = dateParts[1];
                    day = dateParts[2];
                } else if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) { // DD/MM/YYYY or MM/DD/YYYY
                    dateParts = dateString.split('/');
                    if (parseInt(dateParts[0], 10) > 12) { // DD/MM/YYYY format
                        day = dateParts[0];
                        month = dateParts[1];
                        year = dateParts[2];
                    } else if (parseInt(dateParts[1], 10) > 12) { // MM/DD/YYYY format
                        month = dateParts[0];
                        day = dateParts[1];
                        year = dateParts[2];
                    } else {
                        // default to MM/DD/YYYY
                        month = dateParts[0];
                        day = dateParts[1];
                        year = dateParts[2];
                    }
                } else {
                    return { finalDates: null, months: null, days: null, years: null };
                }

                dateObj = new Date(`${year}/${month}/${day}`);
                if (isNaN(dateObj.getTime())) {
                    return { finalDates: null, months: null, days: null, years: null };
                }

                month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
                day = ('0' + dateObj.getDate()).slice(-2);
                year = dateObj.getFullYear();

                var finalDate = month + '/' + day + '/' + year;
                return { finalDates: finalDate, months: month, days: day, years: year };
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
    function mapNormalizedAdminFields(signature, hierarchy, row, scoreDateKey) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var dateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        var testDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        if (row.getField("DATE_OF_BIRTH")) {
            var birthDateObject = _util.coalesce(AppUtil.getMonthFollowedByDay(row.getField("DATE_OF_BIRTH")), parseSmallDate(row.getField("DATE_OF_BIRTH")));
        } else {
            var birthDateObject = dateObject;
        }

        var rawTestDate = row.getField("CREATION_DATE");
        var assessmentDateObject = dateConverter(rawTestDate);

        var getScoreDate, getScoreType, testDateObject;

        var testDate = row.getField("TEST_ADMIN_DATE");

        if (scoreDateKey) {
            getScoreDate = scoreDateKey.split('#')[1];
            getScoreType = scoreDateKey.split('#')[0];
            testDateObject = AppUtil.getMonthFollowedByDay(getScoreDate);
        } else if (testDate && (testDate !== null || testDate !== undefined)) {
            if (signature.getFormat().getFormatName() === 'WORKKEYS_12'){
                 testDateObject = AppUtil.getMonthFollowedByDay(testDate);
            }
            else{
              testDateObject = parseSmallDate(testDate);
            }
        }

        testDate = _util.coalesce(testDateObject.STANDARD_DATE, "05/15/" + "${hierarchy.SCHOOL_YEAR.substring(5,9)}");
        var period = 'ALL';
        if (signature.getFormat().getFormatName() === 'WORKKEYS_18' ||
            signature.getFormat().getFormatName() === 'WORKKEYS_26') {
            period = getAdminPeriod(testDate);
        } else if (signature.getFormat().getFormatName() === 'WORKKEYS_48_COLS') {
            period = getPeriodFromRow(row);
        }

        normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, testDate, getScoreType);
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
                    record.REPORTING_PERIOD = _util.coalesce(period, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(assessmentDateObject.finalDates,testDate);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"), row.getField("SSID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"), row.getField("SSID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"), row.getField("SSID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = row.getField("GENDER");
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.trim(row.getField("ADDRESS1")) + " " + (_util.trim(row.getField("ADDRESS2")) || "");
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STATE"), "");
                    break;
                case "STUDENT_CITY":
                    record.STUDENT_CITY = _util.coalesce(row.getField("CITY"));
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = _util.coalesce(row.getField("ZIP"));
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

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"), row.getField("REALM"), row.getField("SCHOOL_NUMBER"), row.getField('SCHOOL_CODE'));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("REALM"), row.getField('SCHOOL_CODE'));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("REALM"), row.getField('SCHOOL_CODE'));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("REALM"), row.getField("SCHOOL_NAME"));
                    break;

                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }

    //Workkeys currently uses one period unless specified per signature, per UIHN-39133
    function getAdminPeriod(testDate) {
        let period = 'ALL';
        let month = testDate.substring(0, 2);
        if (month === "08" || month === "09" || month === "10" || month === "11") {
            period = "FALL";
        }else if (month === "12" || month === "01" || month === "02" || month === "03") {
            period = "WINTER"
        }else if (month === "04" || month === "05" || month === "06" || month === "07") {
            period = "SPRING";
        }
        return period;
    }

    function getPeriodFromRow(row) {
        var period = "ALL";
        var fileName = row.getField("TEST_CYCLE").toUpperCase();

        if (fileName.indexOf("SPRING") > -1) {
            period = "SPRING";
        } else if (fileName.indexOf("WINTER") > -1) {
            period = "WINTER";
        } else if (fileName.indexOf("FALL") > -1) {
            period = "FALL";
        } else if (fileName.indexOf("SUMMER") > -1) {
            period = "SUMMER";
        }

        return period;
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(row) {
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(signature, row, testMetadata) {
        if(testMetadata.FIELD !== "OVERALL") {
            return null;
        }
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE + "_" +  testDecode[row.getField("TEST TITLE")];
        var scaleScore = _util.coalesce(row.getField("SCALE_SCORE"),row.getField(testMetadata.FIELD + "SCALE_SCORE"));
		var achievLevel = row.getField("LEVEL_SCORE");


        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
    	score["TEST_PRIMARY_RESULT"] = primaryDecodeOverall[achievLevel];

        return score;
    }

    function mapStrandScaledScore(signature, row, testMetadata) {
        var score = {};
        if (testMetadata.FIELD === "OVERALL") {
            return null;
        }
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + testMetadata.FIELD + "_" + testDecode[row.getField("TEST TITLE")];
        var achievLevel = row.getField(testMetadata.CODE + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if (achievLevel === null || achievLevel === undefined || _util.trim(achievLevel) === "--" || _util.trim(achievLevel) === "") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = achievLevel;
        if (!isNaN(achievLevel)) {
            score["TEST_SCORE_VALUE"] = achievLevel;
            score["TEST_SCALED_SCORE"] = achievLevel;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
        score["TEST_PRIMARY_RESULT"] = primaryDecodeStrand[achievLevel];

        return score;
    }


    function mapLevelScore(signature, row, testMetadata) {

        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var levelScore = row.getField("LEVEL" + testMetadata.FIELD);

        if (levelScore === null || levelScore === undefined || _util.trim(levelScore) === "--" || _util.trim(levelScore) === "") {
            return null;
        }

        levelScore = levelScore.toUpperCase();

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if (passDecode[levelScore]) {
            // Handle cases where levelScore exists in passDecode
            score["TEST_PRIMARY_RESULT"] = levelScore;
            score["TEST_SCORE_TEXT"] = levelScore;
            score["TEST_PASSED_INDICATOR"] = passDecode[levelScore].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = passDecode[levelScore].CODE;
        } else if (primaryDecodeOverall[levelScore] !== undefined) {
            // Handle cases where levelScore exists in primaryDecodeOverall
            score["TEST_PRIMARY_RESULT_CODE"] = levelScore;
            score["TEST_PRIMARY_RESULT"] = primaryDecodeOverall[levelScore];
            score["TEST_SCORE_TEXT"] = primaryDecodeOverall[levelScore];
        } else {
            // Handle invalid or unexpected levelScore
            score["TEST_PRIMARY_RESULT"] = null;
            score["TEST_SCORE_TEXT"] = null;
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT_CODE"] = null;
        }



        return score;
    }

    function mapAdditionalScore(signature, row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var testtype = row.getField(testMetadata.FIELD + "_TEST_TYPE");

        // Check for key fields and do not map score and exit if conditions met.
        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_SCORE_ATTRIBUTES"] = testtype;

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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, testDate, scoreType) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        if (scoreType) {
            var decodedScoreType = decodeScoresKeys[scoreType];
            assessmentAdminKey = assessmentAdminKey + "_" + decodedScoreType + "_" + testDate;
        } else if (srcRecord.getField("CREATION_DATE")) {
              var rawTestDate = srcRecord.getField("CREATION_DATE");
              var assessmentDateObject = dateConverter(rawTestDate);
              var formattedDate = assessmentDateObject.finalDates;

              assessmentAdminKey = assessmentAdminKey + "_" + formattedDate;
          } else {
              assessmentAdminKey = assessmentAdminKey + "_" + testDate;
          }

        return assessmentAdminKey;
    }


    function parseSmallDate(rawDate, hierarchy) {

        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }
        else if (rawDate.indexOf("-") > -1 && rawDate.split("-")[1].length === 3) {
            var formatter = new java.text.SimpleDateFormat("dd-MMM-yy");
        }
        else if (rawDate.length > 4 && rawDate.indexOf("/") > -1) {
            var formatter = new java.text.SimpleDateFormat("dd/MM/yy");
        }
        else if (rawDate.length > 9 && rawDate.indexOf("-") > -1) {
            var formatter = new java.text.SimpleDateFormat("dd-MM-yyyy");
        }
        else if (rawDate.length > 9 && rawDate.indexOf("/") > -1) {
            var formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
        }
        else if (rawDate.length > 4 && rawDate.indexOf("-") > -1) {
            var formatter = new java.text.SimpleDateFormat("dd-MM-yy");
        }
        else if (rawDate.length() === 5) {
            var formatter = new java.text.SimpleDateFormat("MMyyyy");
        }
        else if (rawDate.length() === 6) {
            var formatter = new java.text.SimpleDateFormat("MMyyyy");
        }
        else if (rawDate.length() > 4) {
            var formatter = new java.text.SimpleDateFormat("MMMM yyyy");
        }
        else if (rawDate.length() === 3) {
            var formatter = new java.text.SimpleDateFormat("Myy");
        } else {
            var formatter = new java.text.SimpleDateFormat("MMyy");
        }
        //var formatter = new java.text.SimpleDateFormat("MMyy");
        if (rawDate.length() === 5) {
            rawDate = "0" + rawDate;
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

    return module;
}());