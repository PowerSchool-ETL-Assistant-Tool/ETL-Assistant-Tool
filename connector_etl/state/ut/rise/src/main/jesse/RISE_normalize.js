var AppNormalize = (function () {
    const module = {};
    const _thisModuleName = "AppNormalize";
    const _assessmentIdentifier = "RISE";
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
                                "No Scores Found and/or No Test Admin Date.",
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
        { TEST: 'ELA', CODE: 'SUM', FIELD: 'SUMMATIVE_ELA', fn: collectOverallScores },
        { TEST: 'ELA', CODE: 'SUM', TYPE: 'MIXED', fn: collectMixedScores },
        { TEST: 'ELA', CODE: 'LANG', FIELD: 'LANGUAGE', fn: collectPerformanceScore },
        { TEST: 'ELA', CODE: 'LIST', FIELD: 'LISTENING', fn: collectPerformanceScore },
        { TEST: 'ELA', CODE: 'LC', FIELD: 'LISTENING_COMPREHENSION', fn: collectPerformanceScore },
        { TEST: 'ELA', CODE: 'RIT', FIELD: 'READING_INFORMATIONAL_TEXT', fn: collectPerformanceScore },
        { TEST: 'ELA', CODE: 'RL', FIELD: 'READING_LITERATURE', fn: collectPerformanceScore },

        { TEST: 'MATH', CODE: 'SUM', FIELD: 'SUMMATIVE_MATH', fn: collectOverallScores },
        { TEST: 'MATH', CODE: 'SUM', TYPE: 'MIXED', fn: collectMixedScores },
        { TEST: 'MATHEMATICS', CODE: 'SUM', TYPE: 'MIXED', fn: collectMixedScores },
        { TEST: 'SEC', CODE: 'SUM_MATH_I', TYPE: 'MIXED', fn: collectMixedScores },
        { TEST: 'MATH', CODE: 'MDG', FIELD: 'MEASUREMENT_AND_DATA_&_GEOMETRY', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'NOF', FIELD: 'NUMBER_AND_OPERATIONS_FRACTIONS', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'NOBT', FIELD: 'NUMBER_AND_OPERATIONS_IN_BASE_TEN', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'OAT', FIELD: 'OPERATIONS_AND_ALGEBRAIC_THINKING', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'EE', FIELD: 'EXPRESSIONS_AND_EQUATIONS', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'GSP', FIELD: 'GEOMETRY_STATISTICS_AND_PROBABILITY', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'RPR', FIELD: 'RATIOS_AND_PROPORTIONAL_RELATIONSHIPS', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'SP', FIELD: 'STATISTICS_AND_PROBABILITY', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'FUN', FIELD: 'FUNCTIONS', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'GNS', FIELD: 'GEOMETRY_THE_NUMBER_SYSTEM', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'ALG', FIELD: 'ALGEBRA', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'GEO', FIELD: 'GEOMETRY', fn: collectPerformanceScore },
        { TEST: 'MATH', CODE: 'NQFSP', FIELD: 'NUMBER_QUANTITY_FUNCTIONS_STATISTICS_&_PROBABILITY', fn: collectPerformanceScore },

        { TEST: 'SCI', CODE: 'SUM', FIELD: 'SUMMATIVE_SCIENCE', fn: collectOverallScores },
        { TEST: 'SCI', CODE: 'SUM', TYPE: 'MIXED', fn: collectMixedScores },
        { TEST: 'SCIENCE', CODE: 'SUM', TYPE: 'MIXED', fn: collectMixedScores },
        { TEST: 'SCI', CODE: 'EWPC', FIELD: 'EARTHS_WEATHER_PATTERNS_AND_CLIMATE', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'EAM', FIELD: 'ENERGY_AFFECTS_MATTER', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'SCE', FIELD: 'STABILITY_AND_CHANGE_IN_ECOSYSTEMS', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'SMSS', FIELD: 'STRUCTURE_AND_MOTION_WITHIN_THE_SOLAR_SYSTEM', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'CST', FIELD: 'CHANGES_IN_SPECIES_OVER_TIME', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'CET', FIELD: 'CHANGES_TO_EARTH_OVER_TIME', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'FBM', FIELD: 'FORCES_ARE_INTERACTIONS_BETWEEN_MATTER', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'RI', FIELD: 'REPRODUCTION_AND_INHERITANCE', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'SFL', FIELD: 'STRUCTURE_AND_FUNCTION_OF_LIFE', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'ESTPS', FIELD: 'ENERGY_IS_STORED_AND_TRANSFERRED_IN_PHYSICAL_SYSTEMS', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'INSR', FIELD: 'INTERACTIONS_WITH_NATURAL_SYSTEMS_AND_RESOURCES', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'LSSTME', FIELD: 'LIFE_SYSTEMS_STORE_AND_TRANSFER_MATTER_AND_ENERGY', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'MEIPW', FIELD: 'MATTER_AND_ENERGY_INTERACT_IN_THE_PHYSICAL_WORLD', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'ET', FIELD: 'ENERGY_TRANSFER', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'OPS', FIELD: 'OBSERVABLE_PATTERNS_IN_THE_SKY', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'OFE', FIELD: 'ORGANISMS_FUNCTIONING_IN_THEIR_ENVIRONMENT', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'WP', FIELD: 'WAVE_PATTERNS', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'CIES', FIELD: 'CHARACTERISTICS_AND_INTERACTION_OF_EARTHS_SYSTEMS', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'CME', FIELD: 'CYCLING_OF_MATTER_IN_ECOSYSTEMS', fn: collectPerformanceScore },
        { TEST: 'SCI', CODE: 'PCM', FIELD: 'PROPERTIES_AND_CHANGES_OF_MATTER', fn: collectPerformanceScore },

        { TEST: 'WRITE', CODE: 'SUM', FIELD: 'SUMMATIVE_WRITING', fn: collectOverallScores },
        { TEST: 'WRITE', CODE: 'SUM', TYPE: 'MIXED', fn: collectMixedScores },
        { TEST: 'WRITE', CODE: 'ICSE', FIELD: 'INFORMATIVE_CONVENTIONS_OF_STANDARD_ENGLISH', fn: collectCoreScore },
        { TEST: 'WRITE', CODE: 'IEE', FIELD: 'INFORMATIVE_EVIDENCE_AND_ELABORATION', fn: collectCoreScore },
        { TEST: 'WRITE', CODE: 'IPFO', FIELD: 'INFORMATIVE_PURPOSE_FOCUS_AND_ORGANIZATION', fn: collectCoreScore },
        { TEST: 'WRITE', CODE: 'OCSE', FIELD: 'OPINION_CONVENTIONS_OF_STANDARD_ENGLISH', fn: collectCoreScore },
        { TEST: 'WRITE', CODE: 'OEE', FIELD: 'OPINION_EVIDENCE_AND_ELABORATION', fn: collectCoreScore },
        { TEST: 'WRITE', CODE: 'OPFO', FIELD: 'OPINION_PURPOSE_FOCUS_AND_ORGANIZATION', fn: collectCoreScore },
        { TEST: 'WRITE', CODE: 'ACSE', FIELD: 'ARGUMENTATIVE_CONVENTIONS_OF_STANDARD_ENGLISH', fn: collectCoreScore },
        { TEST: 'WRITE', CODE: 'AEE', FIELD: 'ARGUMENTATIVE_EVIDENCE_AND_ELABORATION', fn: collectCoreScore },
        { TEST: 'WRITE', CODE: 'APFO', FIELD: 'ARGUMENTATIVE_PURPOSE_FOCUS_AND_ORGANIZATION', fn: collectCoreScore }
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

    const GENDER_DECODE = {
        "Male": "M",
        "Female": "F",
        "M": "M",
        "F": "F",
        "": null,
        null: null,
        undefined: null
    };

    const PERFORMANCE_DECODE = {
        'Above Standard': { DECODE: 'AS', PASS: 'Yes' ,TEXT:'Above Standard'},
        'At/Near Standard': { DECODE: 'NS', PASS: 'Yes' ,TEXT:'At/Near Standard'},
        'Below Standard': { DECODE: 'BS', PASS: 'No' ,TEXT:'Below Standard'},
        'Invalidated': { DECODE: 'IN', PASS: null ,TEXT:'Invalidated'},
        "Insufficient to score" : {DECODE: 'ITS', PASS: null ,TEXT:'Insufficient to score'},
        "1 - Below Proficient" : {DECODE: 'BP', PASS: 'No', TEXT: 'Below Proficient'},
        "2 - Approaching Proficient" : {DECODE: 'AP', PASS: 'No' ,TEXT:'Approaching Proficient'},
        "3 - Proficient" : {DECODE: 'Prof', PASS: 'Yes' ,TEXT:'Proficient'},
        "4 - Highly Proficient" : {DECODE: 'HP', PASS: 'Yes' ,TEXT:'Highly Proficient'},
        "Below Proficient" : {DECODE: 'BP', PASS: 'No', TEXT: 'Below Proficient'},
        "Approaching Proficient" : {DECODE: 'AP', PASS: 'No' ,TEXT:'Approaching Proficient'},
        "Proficient" : {DECODE: 'Prof', PASS: 'Yes' ,TEXT:'Proficient'},
        "Highly Proficient" : {DECODE: 'HP', PASS: 'Yes' ,TEXT:'Highly Proficient'},
        '': null,
        null: null
    }
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
            if (testMetadata.TYPE === 'MIXED') {
                try {
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, testMetadata.fn(row, testMetadata));
                } catch (error) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH", row.LINEAGE_LINE,
                        "Score mapping error: ${exception}",
                        JSON.stringify(row))
                    );
                }
                for (let i = 1; i <= 9; i++) {
                    try {
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, collectItrativeMixedScores(row, testMetadata, i));
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            hierarchy.SOURCE_FILE.getFilePath(),
                            "HIGH", row.LINEAGE_LINE,
                            "Score mapping error: ${exception}",
                            JSON.stringify(row))
                        );
                    }
                }
            } else {
                try {
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, testMetadata.fn(row, testMetadata));
                } catch (error) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH", row.LINEAGE_LINE,
                        "Score mapping error: ${exception}",
                        JSON.stringify(row))
                    );
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

        let dob = _util.coalesce(
            row.getField("DOB"),
            row.getField("STUDENT_DOB")
        );

        let birthDateObject;

        try {
            if (dob && dob.indexOf("/") > -1) {
                birthDateObject = AppUtil.getDateObjByPattern(dob, "MM/dd/yyyy");
            } else if (dob && dob.indexOf("-") > -1) {
                birthDateObject = AppUtil.getDateObjByPattern(dob, "MM-dd-yyyy");
            } else if (dob && dob.length === 8) {
                birthDateObject = AppUtil.getDateObjByPattern(dob, "MMddyyyy");
            } else {
                dob = '0' + dob;
                birthDateObject = AppUtil.getDateObjByPattern(dob, "MMddyyyy");
            }
        } catch (error) {
            if (AssessmentLoader.config.ENABLE_DEBUG) {
                _util.printException(error);
            }
        }

        let testAdminDateObject;
        let  tad = _util.coalesce(row.getField("TEST_COMPLETION_DATE"),row.getField("TEST_END"), row.getField("TEST_START"), row.getField("DATE_TAKEN"));

        if(tad !== null && tad !== "" && tad !== undefined){
        if (tad && tad.indexOf("/") > -1) {
            testAdminDateObject = AppUtil.getDateObjByPattern(tad, "MM/dd/yyyy");
        } else if (tad && tad.indexOf("-") > -1) {
            testAdminDateObject = AppUtil.getDateObjByPattern(tad, "MM-dd-yyyy");
        } else if (tad && tad.length === 8) {
            testAdminDateObject = AppUtil.getDateObjByPattern(tad, "MMddyyyy");
        } else {
            tad = '0' + tad;
            testAdminDateObject = AppUtil.getDateObjByPattern(tad, "MMddyyyy");
        }
        }
        else if(tad === null || tad === "" || tad === undefined) {
           testAdminDateObject = {RAW_DATE: null
                               , MONTH: null
                               , DAY: null
                               , YEAR: null
                              , STANDARD_DATE: null};
        }


        let testAdminDate = testAdminDateObject.STANDARD_DATE;

        let student = (() => {
            try {
                let fullName = row.getField("STUDENT_NAME");
                if (fullName) {
                    let nameChunks = fullName.split(",").map(c => c.trim());
                    if (nameChunks.length > 0) {
                        return { FIRST_NAME: nameChunks[1], LAST_NAME: nameChunks[0], MIDDLE_NAME: null };
                    }
                } else {
                    return {
                        FIRST_NAME: row.getField('FIRST_NAME'),
                        LAST_NAME: row.getField('LAST_NAME'),
                        MIDDLE_NAME: row.getField('MI')
                    }
                }
            } catch (error) {
                if (AssessmentLoader.config.ENABLE_DEBUG) {
                    _util.printException(error);
                }
            }
        })();

        let adminInfo = (() => {
            try {
                let admin = row.getField("ADMIN");
                if (admin) {
                    let infoChunks = admin.split(" ");
                    if (infoChunks.length > 0) {
                        return {
                            SCHOOL_YEAR: infoChunks[0],
                            ASSESSMENT_PERIOD: infoChunks[1] ? infoChunks[1].toString().toUpperCase() : null,
                            ASSESSMENT_TYPE: infoChunks[2]
                        };
                    } else {
                        return { SCHOOL_YEAR: null, ASSESSMENT_PERIOD: null, ASSESSMENT_TYPE: null };
                    }
                } else if (testAdminDate) {
                    return { SCHOOL_YEAR: null, ASSESSMENT_PERIOD: getAssessmentPeriodByTestAdminDate(testAdminDate, hierarchy), ASSESSMENT_TYPE: null };
                } else {
                    return null;
                }
            } catch (error) {
                if (AssessmentLoader.config.ENABLE_DEBUG) {
                    _util.printException(error);
                }
                return null;
            }
        })();

        let school = (() => {
            let schoolInfo = _util.trim(_util.coalesce(
                row.getField("ENROLLED_SCHOOL"),
                row.getField("SCHOOL_NAME")
            ));

            let schoolCode = row.getField("SCHOOL_NUM");

            if (schoolInfo) {
                if (schoolInfo.indexOf("(") > -1 && schoolInfo.indexOf("-") > -1) {
                    schoolInfo = schoolInfo.replace(/[()]/g, '');
                    return {
                        NAME: schoolInfo.substring(0, schoolInfo.lastIndexOf(" ")),
                        CODE: schoolInfo.substring(schoolInfo.lastIndexOf(" ") + 1, schoolInfo.length).split('-')[1]
                    };
                } else {
                    return {
                        NAME: schoolInfo,
                        CODE: schoolCode
                    };
                }
            } else {
                return {
                    NAME: null,
                    CODE: null
                };
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
                    record.SCHOOL_YEAR = _util.coalesce(
                        adminInfo && adminInfo.SCHOOL_YEAR ? `${+adminInfo.SCHOOL_YEAR - 1}-${adminInfo.SCHOOL_YEAR}` : null,
                        hierarchy.SCHOOL_YEAR
                    );
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = _util.coalesce(
                        adminInfo && adminInfo.ASSESSMENT_PERIOD,
                        hierarchy.REPORTING_PERIOD
                    );
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
                    record.STUDENT_LOCAL_ID = _util.coalesce(
                        row.getField("LOCAL_ID"),
                        row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("SSID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("LOCAL_ID"),
                        row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = student.FIRST_NAME;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = student.LAST_NAME;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = student.MIDDLE_NAME;
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = GENDER_DECODE[row.getField("GENDER")];
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = GRADE_DECODE[_util.coalesce(row.getField('S_GRADE'),row.getField('GRADE'))];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(school.CODE, "DISTRICT");
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = school.NAME;
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = school.CODE;
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

    function collectMixedScores(row, testMetadata) {

        let  tad = _util.coalesce(row.getField("TEST_END"), row.getField("TEST_START"), row.getField("DATE_TAKEN"));

        if (tad == null || tad == undefined) {
             return null;
        }

        if(row.getField("TEST_SUBJ_ID") !== null){
        var testSubject = (row.getField("TEST_SUBJ_ID")).toUpperCase();

        if(testSubject === 'ELA'){
           if(row.getField("TEST_NAME").indexOf('Writing') > -1){
               testSubject = 'WRITE';
           }

           else{
               testSubject = 'ELA';
           }
        }

        if(testSubject.split(" ")[0] === testMetadata.TEST){
        var scaleScore = _util.trim(row.getField("SCALE_SCORE"));
        var itemsAttempted = _util.trim(row.getField("ITEMS_ATT_OP"));
        var totalRawScore = _util.trim(row.getField("TOT_RS"));
        var standardError = _util.trim(row.getField("SS_CSEM"));

        var thetaScore =  _util.trim(row.getField("THETA_SCORE"));
        var thetaSE    =  _util.trim(row.getField("THETA_CSEM"));
        }
        }


        else if(row.getField("TEST_SUBJ_ID") === null){
        var scaleScore = _util.trim(row.getField("SCALE_SCORE"));
        var itemsAttempted = _util.trim(row.getField("ITEMS_ATT_OP"));
        var totalRawScore = _util.trim(row.getField("TOT_RS"));
        var standardError = _util.trim(row.getField("SS_CSEM"));

        var thetaScore =  _util.trim(row.getField("THETA_SCORE"));
        var thetaSE    =  _util.trim(row.getField("THETA_CSEM"));

        }

        if ([null, undefined, 'Insufficient to score', 'Invalidated', 'n/a', 'N/A', '--', 'DUPLICATE_TEXT', 'N', 'NOT_ENOUGH_DATA', 'PROMPT_COPY_MATCH'].some(falsy => falsy === scaleScore)) {
            return null;
        }

        let score = {
            TEST_NUMBER: generateTestNumber(testMetadata),
            TEST_SCORE_TEXT: scaleScore,
            TEST_ITEMS_ATTEMPTED: itemsAttempted
        };

        let performance = (() => {

         if(row.getField("PROF_LVL") !==null || row.getField("PROFICIENCY_LEVEL") !==null){
            var profLevel = _util.trim(row.getField("PROF_LVL"));
            var profCode = _util.trim(row.getField("PROFICIENCY_LEVEL"));
            if ([null, undefined, 'Insufficient to score', 'Invalidated', 'n/a', 'N/A', '--', 'DUPLICATE_TEXT', 'N', 'NOT_ENOUGH_DATA', 'PROMPT_COPY_MATCH'].some(falsy => falsy === profLevel)) {
                return null;
            } else {
                return {
                    LEVEL: PERFORMANCE_DECODE[profLevel].TEXT,
                    PASSED: PERFORMANCE_DECODE[profLevel].PASS,
                    CODE: profCode
                }
            }
        }

        else if (row.getField("PERFORMANCE") !==null){
            var perf = _util.trim(row.getField("PERFORMANCE"));
            if ([null, undefined, 'Insufficient to score', 'Invalidated', 'n/a', 'N/A', '--', 'DUPLICATE_TEXT', 'N', 'NOT_ENOUGH_DATA', 'PROMPT_COPY_MATCH'].some(falsy => falsy === perf)) {
                 return null;
            } else if (perf.indexOf('-') > -1) {
                 let perfChunks = perf.split('-').map(pc => pc.trim());
                     return {
                         LEVEL: perfChunks[1],
                         CODE: perfChunks[0],
                         PASSED: PERFORMANCE_DECODE[perf].PASS
                 }
                 } else {
                      return {
                        LEVEL: PERFORMANCE_DECODE[perf].TEXT,
                        CODE: PERFORMANCE_DECODE[perf].DECODE,
                        PASSED: PERFORMANCE_DECODE[perf].PASS
                 }
                 }
        }
        })();

        if (performance) {
            score.TEST_PRIMARY_RESULT = performance.LEVEL;
            score.TEST_PRIMARY_RESULT_CODE = performance.CODE;
            score.TEST_PASSED_INDICATOR = performance.PASSED;
        }

        if (standardError && !isNaN(standardError)) {
            score.TEST_STANDARD_ERROR = standardError;
        }

        if (!isNaN(scaleScore)) {
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_SCALED_SCORE = scaleScore;
        }

        if (totalRawScore && !isNaN(totalRawScore)) {
            score.TEST_RAW_SCORE = totalRawScore;
        }

        if (thetaScore && !isNaN(thetaScore)) {
            score.TEST_TERTIARY_RESULT_CODE = 'THETASC'
            score.TEST_TERTIARY_RESULT = thetaScore;
        }

        if (thetaSE && !isNaN(thetaSE)) {
            score.TEST_QUATERNARY_RESULT_CODE = 'THETASE'
            score.TEST_QUATERNARY_RESULT = thetaSE;
        }

        return score;
    }

    function collectPerformanceScore(row, testMetadata) {
        let performance = _util.trim(row.getField(testMetadata.FIELD + "_PERFORMANCE"));

        if ([null, undefined, 'Insufficient to score', 'n/a', 'N/A', '--', 'DUPLICATE_TEXT', 'N', 'NOT_ENOUGH_DATA', 'PROMPT_COPY_MATCH'].some(falsy => falsy === performance)) {
            return null;
        }

        return {
            TEST_NUMBER: generateTestNumber(testMetadata),
            TEST_PRIMARY_RESULT: PERFORMANCE_DECODE[performance].TEXT,
            TEST_PRIMARY_RESULT_CODE: PERFORMANCE_DECODE[performance].DECODE,
            TEST_PASSED_INDICATOR: PERFORMANCE_DECODE[performance].PASS
        };
    }

    function collectItrativeMixedScores(row, testMetadata, i) {

        let  tad = _util.coalesce(row.getField("TEST_END"), row.getField("TEST_START"), row.getField("DATE_TAKEN"));

        if (tad == null || tad == undefined) {
             return null;
        }

        if(row.getField("TEST_SUBJ_ID") !== null){
        var testName = (row.getField("TEST_SUBJ_ID")).toUpperCase();

        if(testName.split(" ")[0] === testMetadata.TEST){
        var fieldPrefix = `S${i}_OP_`;
        var scaleScore = _util.trim(row.getField(fieldPrefix + "SS"));
        var maxScore = _util.trim(row.getField(fieldPrefix + "MAX"));
        var rawScore = _util.trim(row.getField(fieldPrefix + "RS"));
        var standardError = _util.trim(row.getField(fieldPrefix + "SEM"));
        var ws = _util.trim(row.getField(fieldPrefix + "WS"));
        }
        }

        else if (row.getField("TEST_SUBJ_ID") === null){
        var fieldPrefix = `S${i}_OP_`;
        var scaleScore = _util.trim(row.getField(fieldPrefix + "SS"));
        var maxScore = _util.trim(row.getField(fieldPrefix + "MAX"));
        var rawScore = _util.trim(row.getField(fieldPrefix + "RS"));
        var standardError = _util.trim(row.getField(fieldPrefix + "SEM"));
        var ws = _util.trim(row.getField(fieldPrefix + "WS"));

        }

        if ([null, undefined, 'Insufficient to score', 'Invalidated', 'n/a', 'N/A', '--', 'DUPLICATE_TEXT', 'N', 'NOT_ENOUGH_DATA', 'PROMPT_COPY_MATCH'].some(falsy => falsy === scaleScore)) {
            return null;
        }
        let score = {
            TEST_NUMBER: generateTestNumber(testMetadata, i),
            TEST_SCORE_TEXT: scaleScore
        };

        if (rawScore && !isNaN(rawScore)) {
            score.TEST_RAW_SCORE = rawScore;
        }

        if (maxScore && !isNaN(maxScore)) {
            score.TEST_UPPER_BOUND = maxScore;
        }

        if (ws && !isNaN(ws)) {
            score.TEST_Z_SCORE = ws;
        }

        if (standardError && !isNaN(standardError)) {
            score.TEST_STANDARD_ERROR = standardError;
        }

        if (!isNaN(scaleScore)) {
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_SCALED_SCORE = scaleScore;
        }

        return score;
    }

    function collectCoreScore(row, testMetadata) {

        let  tad = _util.coalesce(row.getField("TEST_END"), row.getField("TEST_START"), row.getField("DATE_TAKEN"));

        if (tad == null || tad == undefined) {
             return null;
        }

        let coreScore = _util.trim(row.getField(testMetadata.FIELD));

        if ([null, undefined, 'Insufficient to score', 'Invalidated', 'n/a', 'N/A', '--', 'DUPLICATE_TEXT', 'N', 'NOT_ENOUGH_DATA', 'PROMPT_COPY_MATCH'].some(falsy => falsy === coreScore)) {
            return null;
        }

        let score = {
            TEST_NUMBER: generateTestNumber(testMetadata),
            TEST_SCORE_TEXT: coreScore
        };

        if (!isNaN(coreScore)) {
            score.TEST_SCORE_VALUE = coreScore;
            score.TEST_SCALED_SCORE = coreScore;
        }

        return score;
    }

    function collectOverallScores(row, testMetadata) {

        let  tad = _util.coalesce(row.getField("TEST_END"), row.getField("TEST_START"), row.getField("DATE_TAKEN"));

        if (tad == null || tad == undefined) {
             return null;
        }

        let scaleScore = _util.trim(row.getField(testMetadata.FIELD + "_SCALE_SCORE"));

        if ([null, undefined, 'Insufficient to score', 'Invalidated', 'n/a', 'N/A', '--', 'DUPLICATE_TEXT', 'N', 'NOT_ENOUGH_DATA', 'PROMPT_COPY_MATCH'].some(falsy => falsy === scaleScore)) {
            return null;
        }

        let score = {
            TEST_NUMBER: generateTestNumber(testMetadata),
            TEST_SCORE_TEXT: scaleScore
        };

        if (!isNaN(scaleScore)) {
            score.TEST_SCALED_SCORE = scaleScore;
            score.TEST_SCORE_VALUE = scaleScore;
        }

        let performance = (() => {
            let perf = _util.trim(row.getField(testMetadata.FIELD + "_PERFORMANCE"));
            if ([null, undefined, 'Insufficient to score', 'Invalidated', 'n/a', 'N/A', '--', 'DUPLICATE_TEXT', 'N', 'NOT_ENOUGH_DATA', 'PROMPT_COPY_MATCH'].some(falsy => falsy === perf)) {
                return null;
            } else if (perf.indexOf('-') > -1) {
                let perfChunks = perf.split('-').map(pc => pc.trim());
                return {
                    LEVEL: perfChunks[1],
                    CODE: perfChunks[0],
                    PASSED: PERFORMANCE_DECODE[perf].PASS
                }
            } else {
                return {
                    LEVEL: PERFORMANCE_DECODE[perf].TEXT,
                    CODE: PERFORMANCE_DECODE[perf].DECODE,
                    PASSED: PERFORMANCE_DECODE[perf].PASS
                }
            }
        })();

        if (performance) {
            score.TEST_PRIMARY_RESULT = performance.LEVEL;
            score.TEST_PRIMARY_RESULT_CODE = performance.CODE;
            score.TEST_PASSED_INDICATOR = performance.PASSED;
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
          erates an Assessment Admin Key using a combination of hierarchy values and natural keys from an assessment signature
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param srcRecord The assessment record being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;

        // Helper to parse date to standard date
        const parseDate = (dateStr) => {

            if (!dateStr) return {RAW_DATE: null, MONTH: null, DAY: null, YEAR: null, STANDARD_DATE: null};
            try {
                if (dateStr.indexOf("/") > -1 ) {
                    return AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
                } else if (dateStr.indexOf("-") > -1 ) {
                    return AppUtil.getDateObjByPattern(dateStr, "MM-dd-yyyy");
                } else if (dateStr.length === 8 && /^\d+$/.test(dateStr)) {
                     return AppUtil.getDateObjByPattern(dateStr, "MMddyyyy");
                } else if (/^\d{6,7}$/.test(dateStr)) {
                    return AppUtil.getDateObjByPattern("0" + dateStr, "MMddyyyy");
                }
            } catch (err) {
                // fallback
                print(err)
            }

            return {RAW_DATE: null, MONTH: null, DAY: null, YEAR: null, STANDARD_DATE: null};
        };

        // Append natural keys
        signature.getFormat().getNaturalKey().forEach((key) => {
            var value = _util.coalesce(srcRecord.getField(key), "");
            if (key.toUpperCase() === "DATE_TAKEN" && value !== "") {
                var dateObj = parseDate(value);
                value = dateObj.STANDARD_DATE || "";
            }
            assessmentAdminKey += "_" + value;
        });

//         Append file name in admin key for uniqueness
        var subname = null;
        var fileName =srcRecord.getRawField("LINEAGE_FILE");
        // Normalize file name to lower case for case-insensitive comparison
        var lowerFileName = fileName.toLowerCase();

        if (lowerFileName.indexOf("math") > -1) {
            subname = "Math";
        } else if (lowerFileName.indexOf("science") > -1) {
            subname = "Science";
        }
        if (subname){
        assessmentAdminKey += "_" + subname;
        }

        // Determine TEST_ADMIN_DATE
        if (srcRecord.getField('ADMIN') === null) {
            var tad = _util.coalesce(
                srcRecord.getField("TEST_COMPLETION_DATE"),
                srcRecord.getField("TEST_END"),
                srcRecord.getField("TEST_START"),
                srcRecord.getField("DATE_TAKEN")
            );

            var testAdminDateObject = parseDate(tad);
            var testAdminDate = testAdminDateObject.STANDARD_DATE;

            assessmentAdminKey += "_" + getAssessmentPeriodByTestAdminDate(testAdminDate, hierarchy);
        }

        return assessmentAdminKey;
    }




    function generateTestNumber(tmd, i) {
        if (i) {
            return `${tmd.TEST}S${i}OP`;
        } else {
            return `${tmd.TEST}${tmd.CODE}`;
        }
    }

    function getAssessmentPeriodByTestAdminDate(testAdminDate, hierarchy) {
        let schoolYear = new Date(testAdminDate).getFullYear();
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
    }

    return module;
}());
