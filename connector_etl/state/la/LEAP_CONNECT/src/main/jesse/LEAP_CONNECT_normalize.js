var AppNormalize = (function () {
    const module = {};
    const _thisModuleName = "AppNormalize";
    const _assessmentIdentifier = "LEAP_CONNECT";
    const _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    const multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = (file, signature) => {
        try {

            const normalizedFile = AppUtil.createResultsFile(file);
            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const fileFullName = file.getFullName();
            let lineNumber = 0;

            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");
            print("Normalized file: ${normalizedFile}");

            _dataflow.create("RECORD BUILD")
                .input("INPUT", AppUtil.getInputDataflow(file, signature))
                .transform("ADD LINEAGE FIELD", ["RECORDS"], (output, json) => {

                    json.LINEAGE_FILE = fileFullName;
                    json.LINEAGE_LINE = (++lineNumber).toString();
                    output.RECORDS.put(json);
                })
                .group_by("ADMINISTRATION GROUPING", (one, two) => {
                    try {
                        const rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        const rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            hierarchy.SOURCE_FILE.getFilePath(),
                            "HIGH",
                            one.LINEAGE_LINE,
                            "ADMINISTRATION GROUPING dataflow error: ${exception}",
                            JSON.stringify(one) + "|" + JSON.stringify(two))
                        );
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], (output, rows) => {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach((row) => {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                                    file.getFilePath(),
                                    "WARNING",
                                    json.LINEAGE_LINE,
                                    "Duplicate record natural key in source assessment file.",
                                    JSON.stringify(row))
                                );
                            });
                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            hierarchy.SOURCE_FILE.getFilePath(),
                            "WARNING",
                            rows[0].LINEAGE_LINE,
                            "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}",
                            JSON.stringify(rows))
                        );
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], (output, rows) => {
                    try {
                        const normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);
                        normalizedRecords.forEach((record) => {
                            output.RECORDS.put(record);
                        });
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            hierarchy.SOURCE_FILE.getFilePath(),
                            "HIGH",
                            rows[0].LINEAGE_LINE,
                            "TRANSFORMATION dataflow error: ${exception}",
                            JSON.stringify(rows))
                        );
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
                        if (mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                                file.getFilePath(),
                                "WARNING",
                                row.LINEAGE_LINE,
                                "No scores found.",
                                JSON.stringify(row))
                            );
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            hierarchy.SOURCE_FILE.getFilePath(),
                            "HIGH",
                            _util.coalesce(row.LINEAGE_LINE, -1),
                            "SCORE COUNT CHECK dataflow error: ${exception}",
                            JSON.stringify(row))
                        );
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;
        } catch (exception) {
            throw new Error("${_thisModuleName}.createNormalizedFile Exception: ${exception}");
        }
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = (file) => {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    const SCORES_TO_MAP = [
        { TEST: 'LC', CODE: 'ELA', fn: collectMultipleScores },
        { TEST: 'LC', CODE: 'MATH', fn: collectMultipleScores },
        { TEST: 'LC', CODE: 'SCIENCE', fn: collectMultipleScores },
        { TEST: 'LC', CODE: 'LIFE_SCI', FIELD: 'LIFE_SCIENCE', fn: collectSingleScore },
        { TEST: 'LC', CODE: 'PHY_SCI', FIELD: 'PHYSICAL_SCIENCE', fn: collectSingleScore },
        { TEST: 'LC', CODE: 'SCI_AS_INQ', FIELD: 'SCIENCE_AS_INQUIRY', fn: collectSingleScore },
        { TEST: 'LC', CODE: 'EARTH_SPACE_ENV_SCI', FIELD: 'EARTH_SPACE_AND_ENVIRONMENTAL_SCIENCE', fn: collectSingleScore }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    const GRADE_DECODE = {
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
        "Kindergarten": "KG"
        , "": null
        , null: null
    };

    const ACHIEVEMENT_LEVEL_DECODE = {
        'Exceeds Standard': 'EST',
        'Meets Standard': 'MST',
        'Working Toward Standard': 'WST',
        'Near Goal': 'NRG',
        'Above Goal': 'ABG',
        'At Goal': 'ATG',
        'Below Goal': 'BLG',
        'Level 1': 'LEVEL_1',
        'Level 2': 'LEVEL_2',
        'Level 3': 'LEVEL_3',
        'Level 4': 'LEVEL_4',
        '': null,
        null: null,
        undefined: null
    };

    const ACHIEVEMENT_PASS_DECODE = {
        'Exceeds Standard': 'Yes',
        'Meets Standard': 'Yes',
        'Working Toward Standard': 'No',
        'Near Goal': 'No',
        'Above Goal': 'Yes',
        'At Goal': 'Yes',
        'Below Goal': 'No',
        'Level 1': 'No',
        'Level 2': 'No',
        'Level 3': 'Yes',
        'Level 4': 'Yes',
        '': null,
        null: null,
        undefined: null
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
        const normalizedRecords = [];
        const row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        const record = mapNormalizedRecord(signature, hierarchy, row);
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
        let record = {};
        let mappingObject = {};

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
        SCORES_TO_MAP.forEach((testMetadata) => {
            try {
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, (testMetadata.fn)(row, testMetadata, record.REPORTING_PERIOD));
            } catch (exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                    hierarchy.SOURCE_FILE.getFilePath(),
                    "HIGH", row.LINEAGE_LINE,
                    "Score mapping error: ${exception}",
                    JSON.stringify(row))
                );
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
        let record = {};

        if (!module.normalizedFileFields) {
            module.normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        }

        let dob = row.getField('DOB');

        let adminDate = row.getField('ADMINISTRATION_DATE');

        let birthDateObject = AppUtil.getEmptyDateObj();

        if (dob) {
            let format = 'MM/dd/yyyy';

            try {
                birthDateObject = AppUtil.getDateObjByPattern(dob, format);
            } catch (error) {
                throw new Error("Unhandled DATE_OF_BIRTH format '${dob}'");
            }
        }

        let schoolYear = hierarchy.SCHOOL_YEAR.substr(5);

        let testAdminDate = (() => {
            let dateObj, format = 'yy-MMM';
            try {
                if (!adminDate) {
                    dateObj = AppUtil.getEmptyDateObj();
                } else if (adminDate.split('-').length === 3) {
                    format = 'MM-dd-yyyy'
                    dateObj = AppUtil.getDateObjByPattern(adminDate, format);
                } else if (adminDate.split('/').length === 3) {
                    format = 'MM/dd/yyyy'
                    dateObj = AppUtil.getDateObjByPattern(adminDate, format);
                } else {
                    let parts = adminDate.split('-');
                    let firstPart=parts[0], secondPart = parts[1];
                    let _adminDate = adminDate;
                    if (/[a-zA-Z]/.test(firstPart)) {
                        _adminDate = `${secondPart}-${firstPart}`;
                        let temp = secondPart;
                        secondPart = firstPart;
                        firstPart = temp;
                    }

                    let year = 'yy';
                    let month = 'MM';
                    if (firstPart.length === 4) {
                        year = 'yyyy';
                    }

                    if (secondPart.length === 3) {
                        month = 'MMM';
                    } else if (secondPart.length > 3) {
                        month = 'MMMM';
                    }

                    format = `${year}-${month}`;
                    dateObj = AppUtil.getDateObjByPattern(_adminDate, format);
                }
            } catch (error) {
                throw new Error("Unhandled ADMINISTRATION_DATE format '${adminDate}' : Error: ${error}");
            }
            return dateObj.STANDARD_DATE;
        })();

        let reportingPeriod = (() => {
            // Identify period based on testAdminDate and fallback to hierarchy.REPORTING_PERIOD
            const PERIOD_DATE_RANGE = {
                WINTER: { start: Date.parse('01/15/' + schoolYear), end: Date.parse('05/14/' + schoolYear) },
                SPRING: { start: Date.parse('05/15/' + schoolYear), end: Date.parse('09/14/' + (+schoolYear - 1)) },
                FALL: { start: Date.parse('09/15/' + (+schoolYear - 1)), end: Date.parse('01/14/') + schoolYear }
            };
            let parsedAdminDate = Date.parse(testAdminDate);
            if (parsedAdminDate >= PERIOD_DATE_RANGE.WINTER.start && parsedAdminDate <= PERIOD_DATE_RANGE.WINTER.end) {
                return 'WINTER';
            } else if (parsedAdminDate >= PERIOD_DATE_RANGE.SPRING.start && parsedAdminDate <= PERIOD_DATE_RANGE.SPRING.end) {
                return 'SPRING';
            } else if (parsedAdminDate >= PERIOD_DATE_RANGE.FALL.start && parsedAdminDate <= PERIOD_DATE_RANGE.FALL.end) {
                return 'FALL';
            } else {
                return hierarchy.REPORTING_PERIOD;
            }
        })();

        module.normalizedFileFields.forEach((field) => {
            switch (field) {
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
                    record.REPORTING_PERIOD = _util.coalesce(reportingPeriod, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testAdminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.trim(row.getField("LASID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.trim(row.getField("LASID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.trim(row.getField("LASID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.trim(row.getField('FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.trim(row.getField('LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.trim(row.getField('MIDDLE_INITIAL'));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = GRADE_DECODE[_util.trim(row.getField('GRADE'))];
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
                    record.SCHOOL_VENDOR_ID = _util.trim(row.getField("SCHOOL_SYSTEM_NBR"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.trim(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.trim(row.getField("SCHOOL_NBR"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.trim(row.getField("SCHOOL_NBR"));
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
        return {};
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function collectMultipleScores(row, testMetadata, reportingPeriod) {

        let achievementLevel = _util.trim(row.getField(testMetadata.CODE + '_ACHIEVEMENT'));
        let rawScore = _util.trim(row.getField(testMetadata.CODE + '_RAW_SCORE'));
        let scaleScore = _util.trim(row.getField(testMetadata.CODE + '_SCALE_SCORE'));

        if (scaleScore === null || scaleScore === undefined || scaleScore === '' || scaleScore === '--') {
            return null;
        }

        let score = {
            TEST_NUMBER: generateTestNumber(row, testMetadata)
        };

        if (!isNaN(scaleScore)) {
            score.TEST_SCALED_SCORE = scaleScore;
            score.TEST_SCORE_VALUE = scaleScore;
        }

        if (!isNaN(rawScore)) {
            score.TEST_RAW_SCORE = rawScore;
        }

        if (achievementLevel) {
            score.TEST_PRIMARY_RESULT = achievementLevel;
            score.TEST_PRIMARY_RESULT_CODE = ACHIEVEMENT_LEVEL_DECODE[achievementLevel];
            score.TEST_PASSED_INDICATOR = ACHIEVEMENT_PASS_DECODE[achievementLevel];
        }

        score.TEST_SCORE_TEXT = scaleScore;

        return score;
    }

    function collectSingleScore(row, testMetadata, reportingPeriod) {
        let scaleScore = _util.trim(row.getField(testMetadata.FIELD));

        if (scaleScore === null || scaleScore === undefined || scaleScore === '' || scaleScore === '--') {
            return null;
        }

        let score = {
            TEST_NUMBER: generateTestNumber(row, testMetadata)
        };

        if (!isNaN(scaleScore)) {
            score.TEST_SCALED_SCORE = scaleScore;
            score.TEST_RAW_SCORE = scaleScore;
            score.TEST_SCORE_VALUE = scaleScore;
        }

        score.TEST_SCORE_TEXT = scaleScore;

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
            const assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
            const assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);
            if (assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }
        } catch (exception) {
            throw new Error("${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}");
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
        let assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        signature.getFormat().getNaturalKey().forEach((key) => {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        assessmentAdminKey = assessmentAdminKey.trim();

        return assessmentAdminKey;
    }

    function generateTestNumber(row, tmd) {
        return tmd.TEST +
            '_' + tmd.CODE +
            '_' + GRADE_DECODE[_util.trim(row.getField('GRADE'))];
    }

    return module;
}());