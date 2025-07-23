var AppNormalize = (function () {
    const module = {};
    const _thisModuleName = "AppNormalize";
    const _assessmentIdentifier = "KREADY";
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

            let lineNumber = 0;

            if (AssessmentLoader.config.ENABLE_DEBUG) {
                _util.printSuccess("Loading using signature file: ${signature.getFormat().getFormatName()}\n");
                _util.printSuccess("Normalized file: ${normalizedFile}");
            }

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
        { TEST: 'KREADY', CODE: 'OVR', FIELD: 'LL', fn: collectScore },
        { TEST: 'KREADY', CODE: 'UP', FIELD: 'USE_PREPOSITIONS', fn: collectScore },
        { TEST: 'KREADY', CODE: 'IRW_1', FIELD: 'IDENTIFY_RHYMING_WORDS_1', fn: collectScore },
        { TEST: 'KREADY', CODE: 'IRW_2', FIELD: 'IDENTIFY_RHYMING_WORDS_2', fn: collectScore },
        { TEST: 'KREADY', CODE: 'IBS', FIELD: 'IDENTIFY_BEGINNING_SOUND', fn: collectScore },
        { TEST: 'KREADY', CODE: 'NN', FIELD: 'NAME_NOUNS', fn: collectScore },
        { TEST: 'KREADY', CODE: 'NL', FIELD: 'NAME_LETTERS', fn: collectScore },
        { TEST: 'KREADY', CODE: 'MLS', FIELD: 'MAKE_LETTER_SOUNDS', fn: collectScore },
        { TEST: 'KREADY', CODE: 'WAW', FIELD: 'WRITE_A_WORD', fn: collectScore },
        { TEST: 'KREADY', CODE: 'WFN', FIELD: 'WRITE_FIRST_NAME', fn: collectScore },
        { TEST: 'KREADY', CODE: 'ETFI', FIELD: 'EXPRESS_THOUGHTS_FEELINGS_AND_IDEAS', fn: collectScore }
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
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, (testMetadata.fn)(row, testMetadata));
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

        let birthDateObject = AppUtil.getEmptyDateObj(); // No dob in the data file

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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getDefaultTestAdminDate(hierarchy.SCHOOL_YEAR.substring(5), hierarchy.PERIOD);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                    );
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
                        row.getField("SCHOOL_ID")
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOL_ID")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        row.getField("SCHOOL_ID")
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
        return {};
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function collectScore(row, testMetadata) {
        let score = {}, scaleScore, standardError;
        let testNumber = testMetadata.TEST + '_' + testMetadata.CODE;

        if (testMetadata.CODE === 'OVR') {
            standardError = _util.trim(row.getField(`${testMetadata.FIELD}_SEM`));
            scaleScore = _util.trim(row.getField(`${testMetadata.FIELD}_SCORE`));
            score.TEST_PRIMARY_RESULT = (() => {
                if (scaleScore >= 270 && scaleScore <= 297) {
                    return 'Demonstrating Readiness';
                } else if (scaleScore >= 258 && scaleScore <= 269) {
                    return 'Approaching Readiness';
                } else {
                    return 'Emerging Readiness';
                }
            })();
            score.TEST_PRIMARY_RESULT_CODE = score.TEST_PRIMARY_RESULT.split(' ').map((tprChunk) => tprChunk[0]).join('');
            score.TEST_STANDARD_ERROR = standardError;
        } else {
            scaleScore = _util.trim(row.getField(testMetadata.FIELD));
        }

        if ([null, undefined, 'NS', '--', '---'].some(v => v === scaleScore)) {
            return null;
        }

        score.TEST_NUMBER = testNumber;
        score.TEST_SCORE_TEXT = scaleScore;

        let result = (() => {
            if (scaleScore === 'P') {
                return 'Proficient';
            } else if (scaleScore === 'I') {
                return 'Intermediate';
            } else if (scaleScore === 'N') {
                return 'Not displayed';
            } else {
                return null;
            }
        })();

        if (result) {
            score.TEST_SECONDARY_RESULT = result;
            score.TEST_SECONDARY_RESULT_CODE = scaleScore;
        }

        if (!isNaN(scaleScore)) {
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_SCALE_SCORE = scaleScore;
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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        signature.getFormat().getNaturalKey().forEach((key) => {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });
        return assessmentAdminKey;
    }

    function getDefaultTestAdminDate(schoolYear, period) {
        let defaultTestAdminDate;
        if (schoolYear) {
            if (period) {
                period = period.toUpperCase();
            }
            switch (period) {
                case 'FALL':
                    defaultTestAdminDate = '09/15/' + schoolYear;
                    break;
                case 'WINTER':
                    defaultTestAdminDate = '01/15/' + schoolYear;
                    break;
                case 'SPRING':
                    defaultTestAdminDate = '05/15/' + schoolYear;
                    break;
                default:
                    defaultTestAdminDate = '05/15/' + schoolYear;
                    break;
            }
        } else {
            throw new Error("School Year not provided for default TEST_ADMIN_DATE");
        }
        return defaultTestAdminDate;
    }

    return module;
}());