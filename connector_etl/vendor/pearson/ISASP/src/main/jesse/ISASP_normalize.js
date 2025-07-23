var AppNormalize = (function () {
    const module = {};
    const _thisModuleName = "AppNormalize";
    const _assessmentIdentifier = "ISASP";
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

            print("Loading using signature file: ${signature.getFormat().getFormatName()}\n");
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
        { TEST: 'ISASP_ELA', CODE: 'OVR', FIELD: 'ELA', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'RD', FIELD: 'READ', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'RD_DOK', FIELD: 'READ_DOK', fn: collectRepeatativeScores },
        { TEST: 'ISASP_ELA', CODE: 'LW', FIELD: 'LW', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'LW_DOK', FIELD: 'LW_DOK', fn: collectRepeatativeScores },
        { TEST: 'ISASP_ELA', CODE: 'KID', FIELD: 'KID', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'CS', FIELD: 'CS', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'IKI', FIELD: 'IKI', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'RPK', FIELD: 'RPK', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'PDW', FIELD: 'PDW', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'TTP', FIELD: 'TTP', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'COSEKLP', FIELD: 'COSEKLP', fn: collectScores },
        { TEST: 'ISASP_ELA', CODE: 'VAU', FIELD: 'VAU', fn: collectScores },
        { TEST: "ISASP_ELA", CODE:"PROMPT", FIELD: "PROMPT_TASK", fn: collectScores},
        {TEST: "ISASP_ELA", CODE:"ORGNZTN", FIELD: "ORGANIZATION", fn: collectScores},
        {TEST: "ISASP_ELA", CODE:"LANGUSE", FIELD: "LANGUSE",fn: collectScores},
        {TEST: "ISASP_ELA", CODE:"DEV", FIELD: "DEV",fn: collectScores},

        { TEST: 'ISASP_MATH', CODE: 'OVR', FIELD: 'MATH', fn: collectScores },
        { TEST: 'ISASP_MATH', CODE: 'D', FIELD: 'MATH_D', fn: collectRepeatativeScores },
        { TEST: 'ISASP_MATH', CODE: 'DOK', FIELD: 'MATH_DOK', fn: collectRepeatativeScores },

        { TEST: 'ISASP_SCI', CODE: 'OVR', FIELD: 'SCI', fn: collectScores },
        { TEST: 'ISASP_SCI', CODE: 'LS', FIELD: 'LS', fn: collectScores },
        { TEST: 'ISASP_SCI', CODE: 'PS', FIELD: 'PS', fn: collectScores },
        { TEST: 'ISASP_SCI', CODE: 'ES', FIELD: 'ES', fn: collectScores },

        { TEST: 'ISASP_SCI', CODE: 'DOK', FIELD: 'SCI_DOK', fn: collectRepeatativeScores }

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

    const ACHIEVE_LEVEL_DECODE = {
        'A': 'Advanced',
        'N': 'Not Yet Proficient',
        'P': 'Proficient',
        '': null,
        undefined: null,
        null: null
    };
    const ACHIEVE_LEVEL_PASS_DECODE = {
        'A': 'Yes',
        'N': 'No',
        'P': 'Yes',
        '': null,
        undefined: null,
        null: null
    };
    const perfDecode = {
         "1" : "Low"
        ,"2" : "Middle"
        ,"3": "High"
        ,"" : null,
        null : null
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
            let score;
            if (testMetadata.CODE !== 'D' && testMetadata.CODE.indexOf('DOK') === -1) {
                try {
                    score = (testMetadata.fn)(row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch (error) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH", row.LINEAGE_LINE,
                        "Score mapping error: ${exception}",
                        JSON.stringify(row))
                    );
                }
            } else if (testMetadata.CODE === 'D') {
                // Collecting scores for 5 Ds
                for (let repeatCount = 1; repeatCount <= 5; repeatCount++) {
                    try {
                        score = (testMetadata.fn)(row, testMetadata, repeatCount);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                    } catch (error) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            hierarchy.SOURCE_FILE.getFilePath(),
                            "HIGH", row.LINEAGE_LINE,
                            "Score mapping error: ${exception}",
                            JSON.stringify(row))
                        );
                    }
                }
            } else if (testMetadata.CODE.indexOf('DOK') > -1) {
                // Collecting scores for 3 DOKs
                for (let repeatCount = 1; repeatCount <= 3; repeatCount++) {
                    try {
                        score = (testMetadata.fn)(row, testMetadata, repeatCount);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                    } catch (error) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            hierarchy.SOURCE_FILE.getFilePath(),
                            "HIGH", row.LINEAGE_LINE,
                            "Score mapping error: ${exception}",
                            JSON.stringify(row))
                        );
                    }
                }
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

        let birthDateObject,
            rawBirthDate = row.getField("DATE_OF_BIRTH");
        rawBirthDate = ("00000000" + rawBirthDate).slice(-8);
        try {
            birthDateObject = AppUtil.getDateObjByPattern(rawBirthDate, "MMddyyyy");
        } catch (error) {
            let message = "Invalid Date Format for '${rawBirthDate}'";
            if (AssessmentLoader.config.ENABLE_DEBUG) {
                _util.printException("\n${message}\n");
            }
            throw new Error(message);
        }

        // let testAdminDate = getDefaultTestAdminDate(hierarchy.SCHOOL_YEAR.substr(5));
        let testAdminDate = guessAndGetTestAdminDate(row, hierarchy.SCHOOL_YEAR.substr(5));

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
                    record.TEST_ADMIN_DATE = testAdminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_ID"),
                        row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_ID"),
                        row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                // case "STUDENT_MIDDLE_NAME":
                //     record.STUDENT_MIDDLE_NAME = row.getField('STUDENT_MIDDLE_NAME');
                // break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = row.getField('GENDER');
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = GRADE_DECODE[row.getField('GRADE')];
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
                        row.getField("SCHOOL_NAME"),row.getField("SCHOOL_CODE"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_CODE"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
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

    function collectScores(row, testMetadata) {
        const score = {};
        const testNumber = generateTestNumber(row, testMetadata);
        const scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        const rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");
        const pntPoss = row.getField(testMetadata.FIELD + "_PNT_POSS");
        const achieveLevel = row.getField(testMetadata.FIELD + "_ACH_LVL");
        const itemsAttempt = row.getField(testMetadata.FIELD + "_ITEMS_ATTMPT");
        const perfLevel = row.getField(testMetadata.FIELD +"_PERF_LVL");

        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
         &&  (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === "")) {
            return null;
        }

        score.TEST_NUMBER = testNumber;
        score.TEST_SCORE_TEXT = scaleScore;

        if (!isNaN(scaleScore)) {
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_SCALED_SCORE = scaleScore;
            if (achieveLevel) {
                score.TEST_PRIMARY_RESULT = ACHIEVE_LEVEL_DECODE[achieveLevel];
                score.TEST_PASSED_INDICATOR = ACHIEVE_LEVEL_PASS_DECODE[achieveLevel];
                score.TEST_PRIMARY_RESULT_CODE = achieveLevel;
            }
            if(perfLevel){
             score.TEST_SECONDARY_RESULT = perfDecode[perfLevel];
             score.TEST_SECONDARY_RESULT_CODE = perfLevel;
            }

        }

        if (!isNaN(rawScore)) {
            score.TEST_RAW_SCORE = rawScore;
        }

        if (!isNaN(itemsAttempt)) {
            score.TEST_ITEMS_ATTEMPTED = itemsAttempt;
        }
        if (!isNaN(pntPoss)) {
           score.TEST_ITEMS_POSSIBLE = pntPoss;
        }


        return score;
    }

    function collectRepeatativeScores(row, testMetadata, repeatCount) {
        const score = {};
        if (!repeatCount) {
            print(`\n${JSON.stringify(testMetadata)}\n`);
        }
        const testNumber = generateTestNumber(row, testMetadata, repeatCount);
        const rawScore = row.getField(testMetadata.FIELD + repeatCount + "_RAW_SCORE");
        const pntPoss = row.getField(testMetadata.FIELD + repeatCount + "_PNT_POSS");
        const pctCorrect = row.getField(testMetadata.FIELD + repeatCount + "_PCT_CORRECT");
        const label = row.getField(testMetadata.FIELD + repeatCount + "_LABEL");
        const perfLevel = row.getField(testMetadata.FIELD + repeatCount + "_PERF_LVL");

        if((rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")
        &&  (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === "")) {
            return null;
        }

        score.TEST_NUMBER = testNumber;

        if (!isNaN(rawScore)) {
            score.TEST_RAW_SCORE = rawScore;
        }

        if (!isNaN(pntPoss)) {
            score.TEST_ITEMS_POSSIBLE = pntPoss;
        }

        if (pctCorrect && !isNaN(pctCorrect)) {
            score.TEST_PERCENTAGE_SCORE = pctCorrect;
        }

        if (label) {
            score.TEST_SECONDARY_RESULT = label;
            score.TEST_SECONDARY_RESULT_CODE = label;
        }
       if(perfLevel){
          score.TEST_TERTIARY_RESULT = perfDecode[perfLevel];
          score.TEST_TERTIARY_RESULT_CODE = perfLevel;
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

    function generateTestNumber(row, tmd, repeatCount) {
        const GRADE = GRADE_DECODE[row.getField('GRADE')];
        let testNumber = '';
        if (repeatCount) {
            testNumber = tmd.TEST + '_' + tmd.CODE + repeatCount + '_' + GRADE;
        } else {
            testNumber = tmd.TEST + '_' + tmd.CODE + '_' + GRADE;
        }
        return testNumber;
    }

    function getDefaultTestAdminDate(schoolYear, period) {
        let defaultTestAdminDate;
        if (schoolYear) {
            defaultTestAdminDate = '05/15/' + schoolYear;
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
    };

    function guessAndGetTestAdminDate(row, schoolYear) {
        let rawDates = [
            row.getField('READ_START_DATE'),
            row.getField('READ_END_DATE'),
            row.getField('MATH_START_DATE'),
            row.getField('MATH_END_DATE'),
            row.getField('LW_START_DATE'),
            row.getField('LW_END_DATE'),
            row.getField('SCI_START_DATE'),
            row.getField('SCI_END_DATE')
        ], testAdminDateCandidates;

        if (rawDates) {
            testAdminDateCandidates = rawDates.map((date) => {
                try {
                    return AppUtil.getDateObjByPattern(date, guessDateFormat(date)).STANDARD_DATE;
                } catch (error) {
                    if (AssessmentLoader.config.ENABLE_DEBUG) {
                        _util.printWarning("\nWarning: Invalid/Unhandled READ_END_DATE/MATH_END_DATE/LW_END_DATE format '${date}. Setting default TEST_ADMIN_DATE'\n")
                    }
                    return null;
                }
            }).filter((parsedDate) => parsedDate !== null).sort((a, b) => new Date(b).getTime() - new Date(a).getTime());
        }

        if (testAdminDateCandidates.length === 0) {
            // let message = 'No TEST_ADMIN_DATE found';
            // if (AssessmentLoader.config.ENABLE_DEBUG) {
            //     _util.printException(message);
            // }
            // throw new Error(message);
            return getDefaultTestAdminDate(schoolYear);
        }

        return testAdminDateCandidates[0];
    }

    function guessDateFormat(dateStr) {
        let separator = '';
        let format, dmyChunks;
        if (!dateStr) {
            return null;
        }
        if (dateStr.indexOf('/') > -1) {
            separator = '/';
        } else if (dateStr.indexOf('-') > -1) {
            separator = '-'
        }
        dmyChunks = dateStr.split(separator);
        if (dmyChunks[0].length === 4) {
            // Year at beginning
            format = "yy${separator}MM${separator}dd";
        } else if (dmyChunks[1] === 4) {
            // Year at middle
            format = "MM${separator}yy${separator}dd";
        } else {
            // Year at end
            format = "MM${separator}dd${separator}yy";
        }
        return format;
    }

    return module;
}());