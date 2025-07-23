var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IDEL";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *`
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {

            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");

            var normalizedFile = AppUtil.createResultsFile(file);

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
                .transform("TRANSFORM", ["RECORDS"],
                    function (output, rows) {
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if (mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;
        } catch (exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
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

    const ALLOWED_PERF_LEVELS = [
        "Intensive Support",
        "Strategic Support",
        "Core Support",
        "Well Below Benchmark",
        "Below Benchmark",
        "At or Above Benchmark"
    ];

    const GRADE_LEVEL_DECODE = {
        "K": { GRADE_CODE: "KG", FIELD: "K" },
        "1": { GRADE_CODE: "01", FIELD: "1ST" },
        "2": { GRADE_CODE: "02", FIELD: "2ND" },
        "3": { GRADE_CODE: "03", FIELD: "3RD" },
        null: { GRADE_CODE: "", FIELD: "" },
        undefined: { GRADE_CODE: "", FIELD: "" }
    };

    var strandsAndFields =
        [
            { TEST: "DIBIDEL", STRAND: "FSF", FIELDS: ["FSF"] },
            { TEST: "DIBIDEL", STRAND: "FSI", FIELDS: ["FSI"] },
            { TEST: "DIBIDEL", STRAND: "FNL", FIELDS: ["FNL"] },
            { TEST: "DIBIDEL", STRAND: "FSFTLP", FIELDS: ["FSF-TLP", "FSF_TLP"] },
            { TEST: "DIBIDEL", STRAND: "FSFSIL", FIELDS: ["FSF-SIL", "FSF_SIL"] },
            { TEST: "DIBIDEL", STRAND: "FUP", FIELDS: ["FUP"] },
            { TEST: "DIBIDEL", STRAND: "IR", FIELDS: ["IR"] },
            { TEST: "DIBIDEL", STRAND: "FPS", FIELDS: ["FPS"] },
            { TEST: "DIBIDEL", STRAND: "FPSTSL", FIELDS: ["FPS-TSL", "FPS_TSL"] },
            { TEST: "DIBIDEL", STRAND: "FPSNPC", FIELDS: ["FPS-NPC", "FPS_NPC"] },
            { TEST: "DIBIDEL", STRAND: "FPSSOL", FIELDS: ["FSF-SOL", "FSF_SOL"] },
            { TEST: "DIBIDEL", STRAND: "FLO", FIELDS: ["FLO"] },
            { TEST: "DIBIDEL", STRAND: "FLOPALABRASCORRECTAS", FIELDS: ["FLO-PALABRASCORRECTAS", "FLO_PALABRAS_CORRECTAS"] },
            { TEST: "DIBIDEL", STRAND: "FLOERRORES", FIELDS: ["FLO-ERRORES", "FLO_ERRORES"] },
            { TEST: "DIBIDEL", STRAND: "FLOPRECISION", FIELDS: ["FLO-PRECISION", "FLO_PRECISION"] },
            { TEST: "DIBIDEL", STRAND: "FLOFRO", FIELDS: ["FLO-FRO", "FLO_FRO"] }
        ];

    const STRANDS_N_FIELDS_DECODE = {
        "FLO-Palabras Correctas": { TEST: "DIBIDEL", STRAND: "FLOPALABRASCORRECTAS" },
        "FLO-Errores": { TEST: "DIBIDEL", STRAND: "FLOERRORES" },
        "FLO-FRO": { TEST: "DIBIDEL", STRAND: "FLOFRO" },
        "FPS-TSL": { TEST: "DIBIDEL", STRAND: "FPSTSL" },
        "FPS-NPC": { TEST: "DIBIDEL", STRAND: "FPSNPC" }

    };


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/
    var gradeLevels =
        [
            { GRADE_CODE: "KG", FIELD: "K" },
            { GRADE_CODE: "01", FIELD: "1ST" },
            { GRADE_CODE: "02", FIELD: "2ND" },
            { GRADE_CODE: "03", FIELD: "3RD" }
        ];

    var assessPeriods =
        [
            { PERIOD_CODE: "BEG", FIELD: "BEGINNING" },
            { PERIOD_CODE: "MID", FIELD: "MIDDLE" },
            { PERIOD_CODE: "END", FIELD: "END" }
        ];

    var perfLevels =
    {
        "Intensive Support": {
            TEST_PRIMARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT: "Intensive Support",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark"
        },
        "Strategic Support": {
            TEST_PRIMARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT: "Strategic Support",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark"
        },
        "Core Support": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "At Or Above Benchmark"
        },
        "--": {
            TEST_PRIMARY_RESULT_CODE: "--",
            TEST_PRIMARY_RESULT: "--",
            TEST_SECONDARY_RESULT_CODE: "--",
            TEST_SECONDARY_RESULT: "--"
        },
        "Well Below Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "IS",
            TEST_PRIMARY_RESULT: "Intensive Support",
            TEST_SECONDARY_RESULT_CODE: "WB",
            TEST_SECONDARY_RESULT: "Well Below Benchmark"
        },
        "Below Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "SS",
            TEST_PRIMARY_RESULT: "Strategic Support",
            TEST_SECONDARY_RESULT_CODE: "BB",
            TEST_SECONDARY_RESULT: "Below Benchmark"
        },
        "At or Above Benchmark": {
            TEST_PRIMARY_RESULT_CODE: "CS",
            TEST_PRIMARY_RESULT: "Core Support",
            TEST_SECONDARY_RESULT_CODE: "AB",
            TEST_SECONDARY_RESULT: "At Or Above Benchmark"
        }
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
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param array Array containing JSON objects representing raw data by physical name.
     * @returns {array} Mapped normalized records.
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];
        var year = "";
        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        if (signature.getFormat().getFormatName().indexOf('MIXED') > -1) {
            record = mapSingleNormalizedRecordForMixedScores(signature, hierarchy, row);
            AppUtil.nullSafePush(normalizedRecords, record);
        } else {
            gradeLevels.forEach(function (gradeLevel) {
                if (row.getField("YEAR_${gradeLevel.FIELD}") !== null && row.getField("YEAR_${gradeLevel.FIELD}") !== "") {
                    year = row.getField("YEAR_${gradeLevel.FIELD}");
                    assessPeriods.forEach(function (assessPeriod) {
                        var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year);
                        AppUtil.nullSafePush(normalizedRecords, record);
                    });
                }
                //Acadience
                else if (row.getField("YEAR") !== null && row.getField("YEAR") !== "") {
                    year = row.getField("YEAR");
                    assessPeriods.forEach(function (assessPeriod) {
                        var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year);
                        AppUtil.nullSafePush(normalizedRecords, record);
                    });
                }
            });
        }

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
    function mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year) {

        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        record = mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year);

        let signatureName = signature.getFormat().getFormatName(), score;

        strandsAndFields.forEach((strandAndFields) => {
            score = collectScatteredScores(signatureName, row, strandAndFields, gradeLevel, assessPeriod);
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
        });

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
    }

    function mapSingleNormalizedRecordForMixedScores(signature, hierarchy, row) {

        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        record = mapNormalizedAdminFields(signature, hierarchy, row);

        let score = collectMixedScores(signature, row);
        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

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
    function mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year) {

        var record = {};

        if (!module.normalizedFileFields) {
            module.normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        }

        var birthDateObject = AppUtil.getDateObjByPattern(_util.coalesce(row.getField("STUDENT_BIRTHDATE"), row.getField("BIRTH_DATE")), "yyyy-MM-dd");
        var schoolInfo,
            schoolName,
            testAdminDate;

        if (assessPeriod && gradeLevel && year) {
            testAdminDate = getTestAdminDate(assessPeriod, year);
        } else {
            testAdminDate = AppUtil.getDateObjByPattern(row.getField('ASSESSMENT_DATES'), 'MM/dd/yyyy').STANDARD_DATE;
            gradeLevel = GRADE_LEVEL_DECODE[_util.trim(row.getField('GRADE_LEVEL'))];
            if(signature.getFormat().getFormatName() === "DIBELS_IDEL_MIXED_K_3_21"){
                assessPeriod = { PERIOD_CODE: "PMON", FIELD: "PMON" };
            }else{
                assessPeriod = getAssessmentPeriodByTestAdminDate(testAdminDate);
            }
        }

        let schoolCode = row.getField("SCHOOL_INSTITUTIONAL_ID_${gradeLevel.FIELD}");
        schoolInfo = row.getField("SCHOOL_${gradeLevel.FIELD}");

        if (undefined === row.getField("SCHOOL_${gradeLevel.FIELD}") || null === row.getField("SCHOOL_${gradeLevel.FIELD}")) {
            schoolName = row.getField("SCHOOL_NAME");
            schoolCode = null;
        } else {
            schoolName = schoolInfo.substring(0, schoolInfo.lastIndexOf(" "));
            schoolCode = schoolCode || schoolInfo.substr(schoolInfo.lastIndexOf(" ") + 1);
        }

        //Loop through normalized fields and map if possible.
        module.normalizedFileFields.forEach(function (field) {
            switch (field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, gradeLevel, assessPeriod);
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
                    record.REPORTING_PERIOD = getTestAdminPeriod(assessPeriod);
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
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = birthDateObject.DAY;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("STUDENT_LOCAL_ID");
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("STUDENT_ID");
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"), row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.coalesce(row.getField("STUDENT_ADDRESS"));
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STUDENT_STATE"));
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = _util.coalesce(row.getField("STUDENT_ZIP_CODE"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeLevel.GRADE_CODE;
                    break;
                case "TEST_LOCATION":
                    record.TEST_LOCATION = _util.coalesce(row.getField("TEST_LOCATION"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = schoolName;
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = schoolCode;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        schoolCode,
                        schoolName,
                        row.getField("SCHOOL_UID_3"),
                        'DISTRICT'
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
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {
        var admin = {};

        return admin;
    }

    function getTestAdminPeriod(assessPeriod) {

        var period = null;

        switch (assessPeriod.FIELD) {
            case "BEGINNING":
                period = "Beginning";
                break;

            case "MIDDLE":
                period = "Middle";
                break;
            case "END":
                period = "End";
                break;
            case "PMON":
                period = "PMON";
                break;
        }

        return period;
    }


    function getTestAdminDate(assessPeriod, year) {
        var date = null;
        //return "01/01/1900";
        switch (assessPeriod.FIELD) {

            case "BEGINNING":
                date = "10/15/${year}";
                break;
            case "MIDDLE":
                year = parseInt(year) + 1;
                date = "01/15/${year}";
                break;
            case "END":
                year = parseInt(year) + 1;
                date = "04/15/${year}";
                break;
        }
        return date;
    }

    function getAssessmentPeriodByTestAdminDate(testAdminDate) {

        let parsedAdminDate = Date.parse(testAdminDate);
        let schoolYear = new Date(testAdminDate).getFullYear();

        const PERIOD_DATE_RANGE = {
            MIDDLE: { start: Date.parse('01/15/' + schoolYear), end: Date.parse('04/14/' + (+schoolYear - 1)) },
            END: { start: Date.parse('04/15/' + schoolYear), end: Date.parse('10/14/' + (+schoolYear - 1)) },
            BEGINNING: { start: Date.parse('10/15/' + (+schoolYear - 1)), end: Date.parse('01/14/') + schoolYear }
        };

        if (parsedAdminDate >= PERIOD_DATE_RANGE.MIDDLE.start && parsedAdminDate <= PERIOD_DATE_RANGE.MIDDLE.end) {
            return { PERIOD_CODE: "MID", FIELD: "MIDDLE" };
        } else if (parsedAdminDate >= PERIOD_DATE_RANGE.END.start && parsedAdminDate <= PERIOD_DATE_RANGE.END.end) {
            return { PERIOD_CODE: "END", FIELD: "END" };
        } else if (parsedAdminDate >= PERIOD_DATE_RANGE.BEGINNING.start && parsedAdminDate <= PERIOD_DATE_RANGE.BEGINNING.end) {
            return { PERIOD_CODE: "BEG", FIELD: "BEGINNING" };
        } else {
            return { PERIOD_CODE: "BEG", FIELD: "BEGINNING" };
        }
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function collectMixedScores(signature, row) {
        let strandAndFields = STRANDS_N_FIELDS_DECODE[_util.trim(row.getField('MEASURE'))];
        let gradeLevel = GRADE_LEVEL_DECODE[_util.trim(row.getField('GRADE_LEVEL'))];
        if(signature.getFormat().getFormatName() === "DIBELS_IDEL_MIXED_K_3_21"){
        var assessPeriod = { PERIOD_CODE: "PMON", FIELD: "PMON" };
        }else{
        var assessPeriod = getAssessmentPeriodByTestAdminDate(
            AppUtil.getDateObjByPattern(row.getField('ASSESSMENT_DATES'), 'MM/dd/yyyy').STANDARD_DATE
        );}

        let scoreValue = row.getField("SCORE");

        if ([null, undefined, '', '--', 'N/A'].some((falsey) => scoreValue === falsey)) {
            return null;
        }

        let score = {
            TEST_NUMBER: `${strandAndFields.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandAndFields.STRAND}`,
            TEST_SCORE_TEXT: scoreValue
        };

        if (!isNaN(scoreValue)) {
            score.TEST_SCORE_VALUE = scoreValue;
            score.TEST_SCALED_SCORE = scoreValue;
        }
        else {
            score.TEST_PRIMARY_RESULT = scoreValue;
        }

        return score;
    }

    function collectScatteredScores(signatureName, row, strandAndFields, gradeLevel, assessPeriod) {
        let assessmentCode, scoreValue;

        if (signatureName === 'DIBELS_IDEL_K_3_21' && strandAndFields.FIELDS[1]!==undefined) {
            assessmentCode = `${strandAndFields.FIELDS[1]}_${gradeLevel.FIELD}_${assessPeriod.FIELD}`;
        } else {
            assessmentCode = `${strandAndFields.FIELDS[0]}_${gradeLevel.FIELD}_${assessPeriod.FIELD}`;
        }


        scoreValue = _util.trim(row.getField(assessmentCode));

        if ([null, undefined, '', '--', 'N/A'].some((falsey) => scoreValue === falsey)) {
            return null;
        }

        let districtPercentile = (() => {
            let pValue = _util.trim(
                _util.coalesce(
                    row.getField(`DISTRICT_PERCENTILE_${assessmentCode}`)
                )
            );
            if (isNaN(pValue) || pValue > 10000) { // Practically percentile is between 0 to 100. Need to confirm.
                return null;
            }
            return pValue;
        })();

        let schoolPercentile = (() => {
            let pValue = _util.trim(
                _util.coalesce(
                    row.getField(`SCHOOL_PERCENTILE_${assessmentCode}`)
                )
            );
            if (isNaN(pValue) || pValue > 10000) { // Practically percentile is between 0 to 100. Need to confirm.
                return null;
            }
            return pValue;
        })();

        let perfLevel = _util.coalesce(
            row.getField(`NEED_FOR_SUPPORT_${assessmentCode}`),
            row.getField(`BNCH_STATUS_${assessmentCode}`),
            row.getField(`BENCHMARK_STATUS_${assessmentCode}`),
            "--"
        );

        let score = {
            TEST_NUMBER: `${strandAndFields.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandAndFields.STRAND}`,
            TEST_SCORE_TEXT: scoreValue,
            TEST_READING_LEVEL: _util.coalesce(
                row.getField(`LEXILE_${assessmentCode}`),
                "--"
            )
        };

        if (!isNaN(scoreValue)) {
            score.TEST_SCORE_VALUE = scoreValue;
            score.TEST_SCALED_SCORE = scoreValue;
        }
        else {
            score.TEST_PRIMARY_RESULT = scoreValue;
        }

        if (districtPercentile !== null && !isNaN(districtPercentile)) {
            score.TEST_PERCENTILE_SCORE = districtPercentile;
        }

        if (schoolPercentile !== null && !isNaN(schoolPercentile)) {
            score.TEST_PERCENTAGE_SCORE = schoolPercentile;
        }

        // Mapping only allowed performance levels
        if (ALLOWED_PERF_LEVELS.some((allowedPerfLevel) => allowedPerfLevel === perfLevel)) {
            score.TEST_PRIMARY_RESULT = perfLevels[perfLevel].TEST_PRIMARY_RESULT;
            score.TEST_PRIMARY_RESULT_CODE = perfLevels[perfLevel].TEST_PRIMARY_RESULT_CODE;

            score.TEST_SECONDARY_RESULT = perfLevels[perfLevel].TEST_SECONDARY_RESULT;
            score.TEST_SECONDARY_RESULT_CODE = perfLevels[perfLevel].TEST_SECONDARY_RESULT_CODE;
        }

        return score;
    }


    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two, gradeLevel, assessPeriod) {
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

    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, gradeLevel, assessPeriod) {

        var assessmentAdminKey = null;
        //print(assessPeriod.FIELD);
        // Set base assessment admin key information
        if (assessPeriod === undefined) {
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        }
        else {
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${assessPeriod.FIELD}";
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        if (signature.getFormat().getFormatName().indexOf('MIXED') > -1) {
            assessmentAdminKey += `_${STRANDS_N_FIELDS_DECODE[_util.trim(srcRecord.getField('MEASURE'))].STRAND}`;
        }

        return assessmentAdminKey;

    }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());