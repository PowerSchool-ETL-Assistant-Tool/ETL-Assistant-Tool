var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NH_DIBELS8TH";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
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
     * This function will convert the source file given into the normalized assessment format.
     *`
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
                    }  else if(row.STUDENT_LOCAL_ID === '#N/A'){
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            file.getFilePath(),
                            "WARNING",
                            row.LINEAGE_LINE,
                            "No scores found or StudentID #N/A",
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

    var strandsAndFields =
        [
            // DIBELS 8th STRANDS
            {TEST: "NH_DIB8TH", STRAND: "TOT"    , FIELD: "COMPOSITE", SHORT:"COMPOSITE"},
            {TEST: "NH_DIB8TH", STRAND: "LNF"    , FIELD: "LNF", SHORT:"LNF"},
            {TEST: "NH_DIB8TH", STRAND: "PSF"    , FIELD: "PSF", SHORT:"PSF"},
            {TEST: "NH_DIB8TH", STRAND: "WRF"    , FIELD: "WRF", SHORT:"WRF"}, //new
            {TEST: "NH_DIB8TH", STRAND: "NWFCLS" , FIELD: "NWF-CLS", SHORT:"NWF"},
            {TEST: "NH_DIB8TH", STRAND: "MAZERD" , FIELD: "MAZE_RD", SHORT:"MAZE"},
            {TEST: "NH_DIB8TH", STRAND: "MAZECR" , FIELD: "MAZE_CR", SHORT:"MAZE"},
            {TEST: "NH_DIB8TH", STRAND: "MAZEICR" , FIELD: "MAZE_ICR", SHORT:"MAZE"},
            {TEST: "NH_DIB8TH", STRAND: "VOCABULARY" , FIELD: "VOCABULARY", SHORT:"VOCABULARY"},
            {TEST: "NH_DIB8TH", STRAND: "SPELLING" , FIELD: "SPELLING", SHORT:"SPELLING"},
            {TEST: "NH_DIB8TH", STRAND: "RAN" , FIELD: "RAN", SHORT:"RAN"},
            {TEST: "NH_DIB8TH", STRAND: "RISKIND" , FIELD: "RISK_INDICATOR", SHORT:"RISK_INDICATOR"},
            {TEST: "NH_DIB8TH", STRAND: "NWFWRC" , FIELD: "NWF-WRC", SHORT:"NWF"}, //new
            {TEST: "NH_DIB8TH", STRAND: "ORFWC" , FIELD: "ORF-WORDSCORRECT", SHORT:"ORF"}, //renamed from DORF
            {TEST: "NH_DIB8TH", STRAND: "ORFERR", FIELD: "ORF-ERRORS", SHORT:"ORF"}, //renamed from DORF
            {TEST: "NH_DIB8TH", STRAND: "ORFACC", FIELD: "ORF-ACCURACY", SHORT:"ORF"}, //renamed from DORF
            {TEST: "NH_DIB8TH", STRAND: "MAZECOR", FIELD: "MAZE-CORRECT", SHORT:"MAZE"}, //renamed from DAZE
            {TEST: "NH_DIB8TH", STRAND: "MAZEINC", FIELD: "MAZE-INCORRECT", SHORT:"MAZE"}, //renamed from DAZE
            {TEST: "NH_DIB8TH", STRAND: "MAZEADJ", FIELD: "MAZE-ADJUSTED", SHORT:"MAZE"}, //renamed from DAZE
            {TEST: "NH_DIB8TH", STRAND: "GRGOAL", FIELD: "GROWTH_GOAL", SHORT:"GROWTH_GOAL"}, //renamed from DAZE
            {TEST: "NH_DIB8TH", STRAND: "ORFFLU", FIELD: "ORF-FLUENCY", SHORT:"ORF"},
            {TEST: "NH_DIB8TH", STRAND: "OUTCOME", FIELD: "OUTCOME_SCORE", SHORT: "OUTCOME"},
            {TEST: "NH_DIB8TH", STRAND: "REMOTE", FIELD: "REMOTE", SHORT: "REMOTE"}

        ];




    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var gradeLevels =
        [
            {GRADE_CODE: "KG", FIELD: "K"},
            {GRADE_CODE: "01", FIELD: "1ST"},
            {GRADE_CODE: "02", FIELD: "2ND"},
            {GRADE_CODE: "03", FIELD: "3RD"},
            {GRADE_CODE: "04", FIELD: "4TH"},
            {GRADE_CODE: "05", FIELD: "5TH"},
            {GRADE_CODE: "06", FIELD: "6TH"},
            {GRADE_CODE: "07", FIELD: "7TH"},
            {GRADE_CODE: "08", FIELD: "8TH"}
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
            "Core^ Support": {
                TEST_PRIMARY_RESULT_CODE: "C^S",
                TEST_PRIMARY_RESULT: "Core^ Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "At Or Above Benchmark"
            },
            "--": {
                TEST_PRIMARY_RESULT_CODE: "--",
                TEST_PRIMARY_RESULT: "--",
                TEST_SECONDARY_RESULT_CODE: "--",
                TEST_SECONDARY_RESULT: "--"
            }
        };

    var benchmarkLevels =
        {
      "Well Below Benchmark" : "WB",
      "Below Benchmark" : "BB",
      "At Benchmark" : "ATB",
      "Above Benchmark" : "AB",
      "Well Above Average" : "WAA",
      "Well Below Average" : "WBA",
      "Above Average" : "AA",
      "Below Average" : "BA",
      "Average" : "A",
      "Tested Out" : "TO",
      "" : null,
      "--" : "--",
      null : null,
      undefined : null
    };
    var assessPeriods =
            [
                {PERIOD_CODE: "BEG", FIELD: "BEGINNING"},
                {PERIOD_CODE: "MID", FIELD: "MIDDLE"},
                {PERIOD_CODE: "END", FIELD: "END"}
            ];

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
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        gradeLevels.forEach(function(gradeLevel) {
            if (row.getField(`YEAR_${gradeLevel.FIELD}`) !== null && row.getField(`YEAR_${gradeLevel.FIELD}`) !== "") {
                year = row.getField(`YEAR_${gradeLevel.FIELD}`);
                assessPeriods.forEach(function(assessPeriod) {
                    strandsAndFields.forEach(function(strandsAndField) {
                        var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year, assessPeriod, strandsAndField);
                        AppUtil.nullSafePush(normalizedRecords, record);
                    });
                });
            } else if (row.getField("YEAR") !== null && row.getField("YEAR") !== "") {
                year = row.getField("YEAR");
                if (signature.getFormat().getFormatName() !== "DIBELS_8TH_COLS_1303") {
                    assessPeriods.forEach(function(assessPeriod, i) {
                        strandsAndFields.forEach(function(strandsAndField) {
                            var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year, assessPeriod, strandsAndField);
                            AppUtil.nullSafePush(normalizedRecords, record);
                        });
                    });
                } else {
                    var myAssessPeriodDecode = [
                        {PERIOD_CODE: "BEG", FIELD: "BEGINNING", INDEX: 0, FILE_PERIOD: "BOY"},
                        {PERIOD_CODE: "MID", FIELD: "MIDDLE", INDEX: 1, FILE_PERIOD: "MOY"},
                        {PERIOD_CODE: "END", FIELD: "END", INDEX: 2, FILE_PERIOD: "EOY"}
                    ];

                    var myAssessPeriod = myAssessPeriodDecode.find(period => period.FILE_PERIOD === row.getField("BENCHMARK_PERIOD"));
                    if (myAssessPeriod) {
                        strandsAndFields.forEach(function(strandsAndField) {
                            var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year, myAssessPeriod, strandsAndField);
                            AppUtil.nullSafePush(normalizedRecords, record);
                        });
                    }
                }
            }
        });

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
    function mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year, assessPeriod, strandsAndField) {
        var record = {};
        var mappingObject = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        record = mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, year, assessPeriod);

        if (row.getField(`${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}`) !== null && row.getField(`${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}`) !== "") {
            var assessmentCode = `${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}`;
            var score = row.getField(`${assessmentCode}`);
            var performanceCode = _util.coalesce(row.getField(`BENCHMARK_STATUS_${assessmentCode}`), "--");
            var rawDate = row.getField(`DATE_${assessmentCode}`);
            var dateField = dateConverter(rawDate);

            try {
                mappingObject.SCORE_MAPPINGS.push({
                    "TEST_NUMBER": `${strandsAndField.TEST}${gradeLevel.FIELD}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}`,
                    "TEST_SCORE_VALUE": score,
                    "TEST_SCORE_TEXT": score,
                    "TEST_PERCENTILE_SCORE": isNaN(row.getField(`DISTRICT_PERCENTILE_${assessmentCode}`)) ? null : row.getField(`DISTRICT_PERCENTILE_${assessmentCode}`),
                    "TEST_PRIMARY_RESULT_CODE": perfLevels[performanceCode].TEST_PRIMARY_RESULT_CODE || "--",
                    "TEST_PRIMARY_RESULT": perfLevels[performanceCode].TEST_PRIMARY_RESULT || "--",
                    "TEST_SECONDARY_RESULT_CODE": perfLevels[performanceCode].TEST_SECONDARY_RESULT_CODE || "--",
                    "TEST_SECONDARY_RESULT": perfLevels[performanceCode].TEST_SECONDARY_RESULT || "--",
                    "TEST_TERTIARY_RESULT_CODE": isNaN(row.getField(`NATIONAL_DDS_PERCENTILE_${assessmentCode}`)) ? null : row.getField(`NATIONAL_DDS_PERCENTILE_${assessmentCode}`),
                    "TEST_SCORE_ATTRIBUTES": dateField.finalDates
                });
            } catch (exception) {
                print(exception);
            }
        }

        // Outcome Scores
        if (strandsAndField.FIELD === "OUTCOME" && row.getField(`OUTCOME_SCORE_${gradeLevel.FIELD}`)) {
            var outcomeCode = `OUTCOME_SCORE_${gradeLevel.FIELD}`;
            var outcomeScore = row.getField(outcomeCode);

            try {
                mappingObject.SCORE_MAPPINGS.push({
                    "TEST_NUMBER": `${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}`,
                    "TEST_SCORE_VALUE": outcomeScore,
                    "TEST_SCORE_TEXT": outcomeScore,
                });
            } catch (exception) {
                print(exception);
            }
        }

        // Remote Scores
        if (strandsAndField.FIELD === "REMOTE" && row.getField(`${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}`)) {
            var remoteCode = `${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}`;
            var remoteValue = row.getField(remoteCode);

            try {
                mappingObject.SCORE_MAPPINGS.push({
                    "TEST_NUMBER": `${strandsAndField.TEST}${gradeLevel.FIELD}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}`,
                    "TEST_SCORE_VALUE": remoteValue,
                    "TEST_SCORE_TEXT": remoteValue,

                });
            } catch (exception) {
                print(exception);
            }
        }

        if (strandsAndField.FIELD === "GROWTH_GOAL" && signature.getFormat().getFormatName() === "DIBELS_8TH_COLS_1303")  {
            var growthScore = row.getField(`${strandsAndField.FIELD}_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}`);
            if (growthScore && growthScore !== "N/A") {
                var growthPerformanceCode = _util.coalesce(row.getField(`${strandsAndField.FIELD}_MET_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}`), "--");
                var growthType = _util.coalesce(row.getField(`${strandsAndField.FIELD}_TYPE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}`), "--");
                var growthMonths = _util.coalesce(row.getField(`MONTHS_OF_GROWTH_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}`), "--");
                var growthDateField = _util.coalesce(row.getField(`DATE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}`), "--");

                try {
                    mappingObject.SCORE_MAPPINGS.push({
                        "TEST_NUMBER": `${strandsAndField.TEST}${gradeLevel.FIELD}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}`,
                        "TEST_SCORE_VALUE": growthScore,
                        "TEST_SCALED_SCORE": growthScore,
                        "TEST_SCORE_TEXT": growthScore,
                        "TEST_PRIMARY_RESULT_CODE": growthPerformanceCode,
                        "TEST_SECONDARY_RESULT": row.getField(`GROWTH_PERCENTILE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}`),
                        "TEST_SECONDARY_RESULT_CODE": "%TILE",
                        "TEST_GROWTH_RESULT": growthMonths,
                        "TEST_SCORE_ATTRIBUTES": `${growthType} - ${growthDateField}`

                    });
                } catch (exception) {
                    print(exception);
                }
            }
        }

        // Add system fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
    }


        function dateConverter(dateString) {

            if (!dateString || typeof dateString !== 'string' || dateString.trim() === '' || dateString === '--') {
                return { finalDates: null, months: null, days: null, years: null };
            }

            var dateParts, dateObj, year, month, day;

            // Time Strip
            var timeIndex = dateString.indexOf(" ");
            if (timeIndex !== -1) {
                dateString = dateString.split(" ")[0];
            }

            var originalString = dateString;
            dateString = dateString.replace(/-/g, '/');

            // Handle YYYY/MM/DD or YYYY-MM-DD format
            if (dateString.match(/^\d{4}\/\d{2}\/\d{2}$/)) { // YYYY/MM/DD
                dateParts = dateString.split('/');
                year = dateParts[0];
                month = dateParts[1];
                day = dateParts[2];
            }
            // Handle DD-MM-YYYY or DD/MM/YYYY
            else if (originalString.match(/^\d{2}-\d{2}-\d{4}$/) || dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
                dateParts = originalString.split(/[-\/]/);
                day = dateParts[0];
                month = dateParts[1];
                year = dateParts[2];
            }
            // Handle MM/DD/YYYY
            else if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
                dateParts = dateString.split('/');
                if (parseInt(dateParts[0], 10) > 12) { // DD/MM/YYYY
                    day = dateParts[0];
                    month = dateParts[1];
                    year = dateParts[2];
                } else { // MM/DD/YYYY
                    month = dateParts[0];
                    day = dateParts[1];
                    year = dateParts[2];
                }
            }
            // Handle MMddyyyy or YYYYMMDD
            else if (dateString.match(/^\d{8}$/)) {
                if (parseInt(dateString.substring(0, 4), 10) > 1900) { // YYYYMMDD
                    year = dateString.substring(0, 4);
                    month = dateString.substring(4, 6);
                    day = dateString.substring(6, 8);
                } else { // MMddyyyy
                    month = dateString.substring(0, 2);
                    day = dateString.substring(2, 4);
                    year = dateString.substring(4, 8);
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

            var finalDate = `${month}/${day}/${year}`;
            return { finalDates: finalDate, months: month, days: day, years: year };
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
    function mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, year, assessPeriod) {

        var record = {};
        var birthDateField = row.getField("BIRTH_DATE");
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
                                  RAW_DATE : null
                                  , MONTH : null
                                  , DAY : null
                                  , YEAR : null
                                  , STANDARD_DATE : null
                              };

        var birthDateObject = dateConverter(row.getField("BIRTH_DATE"));


        var sigName = signature.getFormat().getFormatName();
        if(row.getField("BENCHMARK_PERIOD") !== null && row.getField("BENCHMARK_PERIOD") !== "" && row.getField("BENCHMARK_PERIOD") !== undefined){
        var benchmarkPeriod = row.getField("BENCHMARK_PERIOD").toUpperCase();
        }
        var newGrade = parseGrade(sigName, gradeLevel);
        //var assessPeriod = getAssesssPeriod(row);
        //Loop through normalized fields and map if possible.
        normalizedFileFields.forEach(function (field) {
            switch(field) {
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
                    record.REPORTING_PERIOD = _util.coalesce(benchmarkPeriod, getTEST_ADMIN_PERIOD(assessPeriod));

                    break;


                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTEST_ADMIN_DATE_STR(assessPeriod, year,row);

                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.months, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.days, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.years, null);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("SECONDARY_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"), row.getField("FIRST"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"), row.getField("LAST"));
                    break;
                case "STUDENT_GENDER_CODE":
                    var genderField = row.getField("GENDER");
                    record.STUDENT_GENDER_CODE = _util.coalesce(genderField ? genderField.substring(0, 1) : null, null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(newGrade);
                    break;

                case "SCHOOL_NAME":
                       var gradeLevels = [
                           { GRADE_CODE: "K", FIELD: "K" },
                           { GRADE_CODE: "1ST", FIELD: "1ST" },
                           { GRADE_CODE: "2ND", FIELD: "2ND" },
                           { GRADE_CODE: "3RD", FIELD: "3RD" },
                           { GRADE_CODE: "4TH", FIELD: "4TH" },
                           { GRADE_CODE: "5TH", FIELD: "5TH" },
                           { GRADE_CODE: "6TH", FIELD: "6TH" },
                           { GRADE_CODE: "7TH", FIELD: "7TH" },
                           { GRADE_CODE: "8TH", FIELD: "8TH" }
                       ];

                       record.SCHOOL_NAME = "DISTRICT";

                       for (var i = 0; i < gradeLevels.length; i++) {
                           var gradeLevel = gradeLevels[i];
                           var schoolNameField = "SCHOOL_" + gradeLevel.FIELD;
                           if (row.getField(schoolNameField) !== null && row.getField(schoolNameField) !== "") {
                               record.SCHOOL_NAME = row.getField(schoolNameField);
                               break;
                           }
                       }
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_ID"));
                    break;
                case "SCHOOL_VENDOR_ID":
                           var gradeLevels = [
                               { GRADE_CODE: "K", FIELD: "K" },
                               { GRADE_CODE: "1ST", FIELD: "1ST" },
                               { GRADE_CODE: "2ND", FIELD: "2ND" },
                               { GRADE_CODE: "3RD", FIELD: "3RD" },
                               { GRADE_CODE: "4TH", FIELD: "4TH" },
                               { GRADE_CODE: "5TH", FIELD: "5TH" },
                               { GRADE_CODE: "6TH", FIELD: "6TH" },
                               { GRADE_CODE: "7TH", FIELD: "7TH" },
                               { GRADE_CODE: "8TH", FIELD: "8TH" }
                           ];

                           record.SCHOOL_VENDOR_ID = "DISTRICT";

                           for (var i = 0; i < gradeLevels.length; i++) {
                               var gradeLevel = gradeLevels[i];
                               var institutionalIdField = "SCHOOL_INSTITUTIONAL_ID_" + gradeLevel.FIELD;
                               if (row.getField(institutionalIdField) !== null && row.getField(institutionalIdField) !== "") {
                                   record.SCHOOL_VENDOR_ID = row.getField(institutionalIdField);
                                   break;
                               }
                           }
                    break;

                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }

    function parseGrade(sigName, gradeLevel) {
        if(sigName === "DIBELS_8TH_COLS_1303") {
            newGrade = gradeLevel.GRADE_CODE;
        } else {
            newGrade = null;
        }
        return newGrade;
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

    function getTEST_ADMIN_PERIOD(assessPeriod) {

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
        }

        return period;
    }


    function getTEST_ADMIN_DATE_STR(assessPeriod, year,row) {
        var date = null;
        if (row.getField('CLIENT_DATE')  !== null && row.getField('CLIENT_DATE') !== "" && row.getField('CLIENT_DATE') !== undefined){
            date = AppUtil.getMonthFollowedByDay(row.getField('CLIENT_DATE')).STANDARD_DATE;
        }
        else {
        switch (assessPeriod.FIELD) {
            case "BEGINNING":
                date = "10/15/"+year;
                break;
            case "MIDDLE":
                year = parseInt(year) + 1;
                date = "01/15/"+year;
                break;
            case  "END":
                year = parseInt(year) + 1;
                date = "04/15/"+year;
            break;

        }
}
        return date;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/



    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two, gradeLevel, assessPeriod) {

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


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, gradeLevel, assessPeriod) {

        var assessmentAdminKey = null;

        // Set base assessment admin key information
               if(assessPeriod===undefined){
                   assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
               }
               else{
                   assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${assessPeriod.FIELD}";
               }



        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }

    function getAssesssPeriod(row){
        var begCheck = row.getField("FORM_LNF_K_BEGINNING");
        var midCheck = row.getField("FORM_LNF_K_MIDDLE");
        var endCheck = row.getField("FORM_LNF_K_END");
        if((JSON.stringify(row)).indexOf("_BEGINNING")>-1){
            return 'BEGINNING';
        }
        else if((JSON.stringify(row)).indexOf("_MIDDLE")>-1){
            return 'MIDDLE';
        }
        else if((JSON.stringify(row)).indexOf("_END")>-1){
            return 'END';
        }
        return '';
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

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());