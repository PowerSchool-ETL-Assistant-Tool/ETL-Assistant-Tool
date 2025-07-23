var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "GAP_BENCHMARK";
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

    var scoresToMap = [];

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
        "HS": "HS",
        "Kindergarten": "KG"
        , "": null
        , null: null
    };

    var primaryDecode = {
        "Adv": "Advanced"
        , "Advanced": "Advanced"
        , "Bas": "Basic"
        , "Basic": "Basic"
        , "Bel": "Below Basic"
        , "Below Basic": "Below Basic"
        , "Pro": "Proficient"
        , "Proficient": "Proficient"
        , "": null
        , null: null
    };

    var passDecode = {
        "Adv": "Yes"
        , "Advanced": "Yes"
        , "Bas": "No"
        , "Basic": "No"
        , "Bel": "No"
        , "Below Basic": "No"
        , "Pro": "Yes"
        , "Proficient": "Yes"
        , "": null
        , null: null
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

        try {
            let score = mapScaledScore(row, hierarchy);
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
        } catch (exception) {
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
        }

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
        if (!module.normalizedFileFields) {
            module.normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        }
        var birthDateObject = AppUtil.getEmptyDateObj();
        let assessmentInfo = getAssessmentInfo(row, hierarchy)

        module.normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, assessmentInfo);
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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD.toUpperCase();
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTestAdminDate(assessmentInfo.TEST_YEAR, hierarchy.SCHOOL_YEAR, hierarchy.REPORTING_PERIOD);
                    break;

                //Student Information
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        , row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FNAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LNAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = null;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[assessmentInfo.TEST_GRADE] === 'HS' ? null : gradeDecode[assessmentInfo.TEST_GRADE];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHID")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHID")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("SCHID")
                    );
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
        let admin = {};
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, hierarchy) {
        let score = {};
        let testNumber = getTestNumber(row, hierarchy);
        let scaleScore = row.getField("SUGGNMARK");
        let testScoreText = row.getField("SUGGLMARK");
        let percentageScore = row.getField("PERCCORR");
        let primaryResult = row.getField("ACHLEV");
        let secondaryResult = row.getField("ACHLEVEXT");

        if (!scaleScore) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;

        if (!isNaN(percentageScore)) {
            score["TEST_PERCENTAGE_SCORE"] = Math.round(percentageScore * 100) / 100;//Repeating decimals for 2/3 could go past the Numeric(8,4) database result
        }

        if (testScoreText) {
            score["TEST_SCORE_TEXT"] = testScoreText;
        }

        if (primaryResult) {
            score["TEST_PRIMARY_RESULT"] = primaryResult;
        }

        if (secondaryResult) {
            score["TEST_SECONDARY_RESULT"] = secondaryResult;
        }

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
            let assessmentInfoOne = getAssessmentInfo(one, hierarchy);
            let assessmentInfoTwo = getAssessmentInfo(two, hierarchy);

            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, assessmentInfoOne);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, assessmentInfoTwo);

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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, assessmentInfo) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${assessmentInfo.PRODUCT}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    function getTestNumber(row, hierarchy) {
        let assessmentInfo = getAssessmentInfo(row, hierarchy);
        return assessmentInfo.PRODUCT +
            '_' + assessmentInfo.TEST_CODE +
            '_' + gradeDecode[assessmentInfo.TEST_GRADE] +
            '_' + hierarchy.REPORTING_PERIOD.toUpperCase();
    }

    /**
     * Assessment Info can be collected using TEST_ID column of data file.
     * The GAP_2021_2022 data file test id example 'ncmat32022ccomtrgpcumb' ({YEAR: 2022, GRADE: 03, CODE: MATH})
     * The BENCHMARK_2021_2022 data file test id example 'ncbiol2022sdomfs01cumb' ({YEAR: 2022, GRADE: KG, CODE: BIO})
     * @param {*} row
     * @param {*} hierarchy
     * @returns
     */
    function getAssessmentInfo(row, hierarchy) {
        let assessmentInfo = {}, infoChunks = null;
        const product = hierarchy.ASSESSMENT_PRODUCT;
        let testId = row.getField('TESTID'), temp;
        if (product === 'GAP') {
            if (testId && testId.indexOf('ncmat') === 0) {
                temp = testId.split('ncmat')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'MATH';
            } else if (testId && testId.indexOf('ncrea') === 0) {
                temp = testId.split('ncrea')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'ELA';
            } else if (testId && testId.indexOf('ncsci') === 0) {
                temp = testId.split('ncsci')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'SCI';
            }
            if (infoChunks) {
                assessmentInfo.TEST_GRADE = infoChunks.splice(0, 1).join('');
                assessmentInfo.TEST_YEAR = infoChunks.join('');
                assessmentInfo.PRODUCT = 'GAP';
            }
        } else if (product === 'BENCHMARK') {
            if ((testId && testId.indexOf('ncbiol') === 0) || (testId && testId.indexOf('tnbiol') === 0)) {
                temp = testId.indexOf('ncbiol') === 0 ? testId.split('ncbiol')[1] : testId.split('tnbiol')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'BIO';
            } else if (testId && testId.indexOf('ncccm') === 0) {
                temp = testId.split('ncccm')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'MATH' + infoChunks.splice(0, 1).join('');
            } else if ((testId && testId.indexOf('nceng') === 0) || (testId && testId.indexOf('tneng') === 0)) {
                temp = testId.indexOf('nceng') === 0 ? testId.split('nceng')[1] : testId.split('tneng')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'ELA' + infoChunks.splice(0, 1).join('');
            } else if ((testId && testId.indexOf('ncsci') === 0) || (testId && testId.indexOf('tnsci') === 0)) {
                temp = testId.indexOf('ncsci') === 0 ? testId.split('ncsci')[1] : testId.split('tnsci')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'SCI' + infoChunks.splice(0, 1).join('');
            } else if ((testId && testId.indexOf('ncmat') === 0) || (testId && testId.indexOf('tnmat') === 0)) {
                temp = testId.indexOf('ncmat') === 0 ? testId.split('ncmat')[1] : testId.split('tnmat')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'MATH' + infoChunks.splice(0, 1).join('');
            } else if ((testId && testId.indexOf('ncrea') === 0) || (testId && testId.indexOf('tnrea') === 0)) {
                temp = testId.split('ncrea') === 0 ? testId.split('ncrea')[1] : testId.split('tnrea')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'ELA' + infoChunks.splice(0, 1).join('');
            } else if ((testId && testId.indexOf('ncgeom') === 0) || (testId && testId.indexOf('tngeom') === 0)) {
                temp = testId.split('ncgeom') === 0 ? testId.split('ncgeom')[1] : testId.split('tngeom')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'GEOM' + infoChunks.splice(0, 1).join('');
            } else if ((testId && testId.indexOf('ncalg') === 0) || (testId && testId.indexOf('tnalg') === 0)) {
                temp = testId.split('ncalg') === 0 ? testId.split('ncalg')[1] : testId.split('tnalg')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'ALG' + infoChunks.splice(0, 1).join('');
            } else if ((testId && testId.indexOf('ncmalg') === 0) || (testId && testId.indexOf('tnmalg') === 0)) {
                temp = testId.split('ncmalg') === 0 ? testId.split('ncmalg')[1] : testId.split('tnmalg')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'ALG' + infoChunks.splice(0, 1).join('');
            }
            else if ((testId && testId.indexOf('ncsoc') === 0) || (testId && testId.indexOf('tnsoc') === 0)) {
                temp = testId.split('ncsoc') === 0 ? testId.split('ncsoc')[1] : testId.split('tnsoc')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'SOC' + infoChunks.splice(0, 1).join('');
            } else if ((testId && testId.indexOf('ncushi') === 0) || (testId && testId.indexOf('tnushi') === 0)) {
                temp = testId.split('ncushi') === 0 ? testId.split('ncushi')[1] : testId.split('tnushi')[1];
                infoChunks = temp.substr(0, temp.length - 12).split('');
                assessmentInfo.TEST_CODE = 'US_HISTORY' + infoChunks.splice(0, 1).join('');
            }
            if (infoChunks) {
                assessmentInfo.TEST_GRADE = 'HS';
                assessmentInfo.TEST_YEAR = infoChunks.join('');
                assessmentInfo.PRODUCT = 'BENCHMARK';
            }
        }
        return assessmentInfo;
    }

    function getTestAdminDate(testYear, hierarchySchYear,reportingPeriod) {
        let testAdminDate = null, testAdminDateObj = AppUtil.getEmptyDateObj();
        if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'WINTER') {
            testAdminDate = '01/15/' + testYear;
        } else if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'SPRING') {
            testAdminDate = '05/15/' + testYear;
        } else if (testYear){
            testAdminDate = '09/15/' + (testYear - 1);
        } else {
            testAdminDate = '05/15/' + hierarchySchYear.substring(5,9);
        }
        testAdminDateObj = AppUtil.getDateObjByPattern(testAdminDate, "MM/dd/yyyy");
        return testAdminDateObj.STANDARD_DATE;
    }

    return module;
}());