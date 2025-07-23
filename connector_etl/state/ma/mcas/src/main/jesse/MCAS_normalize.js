var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MCAS";
    // var versionText = AssessmentLoader.currentAssessmentVersionText.replaceAll("\n", "");
    // var version = versionText.substring(versionText.indexOf("Version: ") + 9, versionText.indexOf("Application-name"));
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
   /* module.createNormalizedFile = function (file, signature) {
        try {
            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}\n");

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
                .transform("NORMALIZE RECORDS", ["RECORDS"], function (output, rows) {
                    try {
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function (record) {
                            output.RECORDS.put(record);
                        });

                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows.LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

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
        }
    };
    */

    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */


      module.createNormalizedFile = function(file, signature) {
           try {
               let normalizedFile = AppUtil.createResultsFile(file);
               const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
               const fileRows = createRecords(file, signature);
               let normalizedRows = [], normalizedRecords = [];

               fileRows.forEach(function(rows) {
                   try{
                       mapNormalizedRecords(signature, hierarchy, rows).forEach(function(normRecord) {
                           normalizedRows.push(normRecord)
                       });

                   } catch(exception) {
                       AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "mapNormalizedRecords error: ${exception}", JSON.stringify(rows)));
                   }
               });


               normalizedRows.forEach(function(row) {
                   try {
                       const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                       if(mappingObject.SCORE_MAPPINGS.length === 0) {
                           AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                       } else {
                           normalizedRecords.push(row);
                       }


                   } catch(exception) {
                       AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                   }

               });
               writeNormalizedRecords(normalizedFile, normalizedRecords);

               return normalizedFile;
           } catch(exception) {
               throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
           }
       };


    /** Java classes **/
        const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
        const BufferedReader = Java.type("java.io.BufferedReader");
        const InputStreamReader = Java.type('java.io.InputStreamReader');
        const CSVWriter = Java.type("com.opencsv.CSVWriter");
        const FileWriter = Java.type("java.io.FileWriter");
        const File = Java.type("java.io.File");


    /***************************************************************************
         Utility Functions
         ***************************************************************************/

        function createRecords(file, signature) {
            try {
                const format = signature.getFormat();
                const fieldDelimiter = format.getFieldDelim();
                const textDelimiter = format.getQuoteDelim();
                const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
                const delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
                const fileFullName = file.getFullName();
                let lineNumber = 0;
                let recordsArray = [];
                const fieldNames = delimitedRecordParser.parseRow(reader);
                let row, record;

                while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                    let index = 0;
                    record = {};

                    for (const key in fieldNames) {
                        record[fieldNames[index]] = row.get(index++);
                    }
                    record.LINEAGE_FILE = fileFullName;
                    record.LINEAGE_LINE = (++lineNumber).toString();
                    const rowArray = [];
                    rowArray.push(record);
                    recordsArray.push((rowArray));
                }

                return recordsArray;
            } catch (exception) {
                throw "${_thisModuleName}.createRecords Exception: ${exception}";
            }
        }

        /**
         * Creates a Processed file containing the audit types of error for the file processed
         *
         * @param file A fully qualified string path to the normalFile
         * @param data The audit statistics of the file that was processed
         */
        function writeNormalizedRecords(file, data) {
            try {
                const normalFile = _file.open(file);
                const normalFilePath = normalFile.getParent();
                const normalFileName = normalFile.getName()
                const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
                let rowArray = null;
                const header = Object.keys(data[0]);

                writer.writeNext(header);

                data.forEach(function(row) {
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

    module.mergeAssessment = function (file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/
    var scoresToMap = [
        { TEST: "MCAS", CODE: "ELA", MAP_FUNCTION: mapScaledScore },
        { TEST: "MCAS", CODE: "MATHEMATICS", MAP_FUNCTION: mapScaledScore },
        { TEST: "MCAS", CODE: "STE", MAP_FUNCTION: mapScaledScore },
        { TEST: "MCAS", CODE: "ELA", MAP_FUNCTION: mapAlternateScore },
        { TEST: "MCAS", CODE: "MATHEMATICS", MAP_FUNCTION: mapAlternateScore },
        { TEST: "MCAS", CODE: "STE", MAP_FUNCTION: mapAlternateScore },
        { TEST: "MCAS", CODE: "ELA", FIELD: "TOPIC_DEVELOPMENT", MAP_FUNCTION: mapELAStrand },
        { TEST: "MCAS", CODE: "ELA", FIELD: "PROMPT_CONVENTIONS", MAP_FUNCTION: mapELAStrand }
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var performanceLevel1 = {
        "A": "Advanced",
        "P": "Proficient",
        "NI": "Needs improvement",
        "F": "Failing",
        "W": "Warning",
        "E": "Exceeding expectations",
        "M": "Meeting expectations",
        "PM": "Partially meeting expectations",
        "NM": "Not meeting expectations",
        "INC": "Incomplete",
        "ABS": "Absence",
        "MED": "Medically documented absence",
        "LEP": "English Language Learner in US school for less than a year",
        "TRN": "Transferred",
        "DUP": "Students with multiple test records",
        "VAB": "Students with a STE booklet",
        "INV": "Student result was invalidated",
        "INP": "Incomplete ALT",
        "AWR": "Awareness ALT",
        "EMG": "Emerging ALT",
        "PRG": "Progressing ALT",
        "NIA": "Needs improvement ALT",
        "P_A": "Proficient ALT",
        "A_A": "Advanced ALT",
        "PAS": "Previously passed high school STE test",
        "PRF": "Previously failed high school STE test",
        null: null,
        " ": null,
        "": null
    };

    var performanceLevel2 = {
        "F": "Failing",
        "W": "Warning",
        "P": "Proficient",
        "NI": "Needs improvement",
        "A": "Advanced",
        "E": "Exceeding expectations",
        "M": "Meeting expectations",
        "PM": "Partially meeting expectations",
        "NM": "Not meeting expectations",
        "INC": "Incomplete",
        "ABS": "Absence",
        "MED": "Medically documented absence",
        "LEP": "English Language Learner in US school for less than a year",
        "TRN": "Transferred",
        "DUP": "Students with multiple test records",
        "VAB": "Students with a STE booklet",
        "INV": "Student result was invalidated",
        "INP": "Incomplete ALT",
        "AWR": "Awareness ALT",
        "EMG": "Emerging ALT",
        "PRG": "Progressing ALT",
        "NIA": "Needs improvement ALT",
        "P_A": "Proficient ALT",
        "A_A": "Advanced ALT",
        "PAS": "Previously passed high school STE test",
        "PRF": "Previously failed high school STE test",
        null: null,
        "": null
    };

    var passDecode = {
        "E": "Yes",
        "M": "Yes",
        "PM": "No",
        "NM": "No",
        "ABS": null,
        "DNT": null, //TODO missing in above decode? Likely Did not test
        "EMG": "No",
        "INP": null,
        "LEP": null,
        "PRG": "No",
        "F":"No",
        "NI":"No",
        "P": "Yes",
        "PAS":"Yes",
        "PRF":"No",
        "TRN":null,
        null: null,
        "": null
    };


    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/
    /**
     * Maps subject scaled score tests
     *
     * @param row The row being processed
     * @param testMetadata The metadata about the test
     * @returns {null} returns test score object
     */
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = "${testMetadata.TEST}_${testMetadata.CODE}";
        var scaleScore = row.getField("${testMetadata.CODE}_SCALED_SCORE");
        var rawScore = row.getField("${testMetadata.CODE}_RAW_SCORE");
        var predictedScore = row.getField("${testMetadata.CODE}_PREDICTED_SCORE");


        // Check for key fields and do not map score and exit if conditions met.
        if (isEmpty(scaleScore) && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_PREDICTED_SCORE"] = predictedScore;

        if (!isEmpty(row.getField("${testMetadata.CODE}_STUDENT_GROWTH_PERCENTILE"))) {
            score["TEST_GROWTH_PERCENTILE"] = row.getField("${testMetadata.CODE}_STUDENT_GROWTH_PERCENTILE");
        }

        if (!isEmpty(row.getField("${testMetadata.CODE}_PERCENT_OF_POSSIBLE_POINTS_SCORE"))) {
            score["TEST_PERCENTAGE_SCORE"] = row.getField("${testMetadata.CODE}_PERCENT_OF_POSSIBLE_POINTS_SCORE");
        }

        if (!isEmpty(performanceLevel1[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_1")])) {
            score["TEST_PRIMARY_RESULT_CODE"] = row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_1");
            score["TEST_PRIMARY_RESULT"] = performanceLevel1[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_1")];
            score["TEST_PASSED_INDICATOR"] = passDecode[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_1")];
        }

        if (!isEmpty(performanceLevel1[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_2")])) {
            score["TEST_SECONDARY_RESULT_CODE"] = row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_2");
            score["TEST_SECONDARY_RESULT"] = performanceLevel2[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_2")];
            score["TEST_CUSTOM_PASS_IND"] = passDecode[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_2")];
        }

        return score;
    }

    /**
     * Maps alternate assessment data
     *
     * @param row The row being processed
     * @param testMetadata The metadata about the test
     * @returns {null} returns test score object
     */
    function mapAlternateScore(row, testMetadata) {
        if (row.getField("${testMetadata.CODE}_ALTERNATE_INDICATOR") !== "1") {
            return;
        }

        var score = {};
        score["TEST_NUMBER"] = "${testMetadata.TEST}_${testMetadata.CODE}_ALT";
        score["TEST_SCALED_SCORE"] = 0;

        if (!isEmpty(performanceLevel1[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_1")])) {
            score["TEST_PRIMARY_RESULT_CODE"] = row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_1");
            score["TEST_PRIMARY_RESULT"] = performanceLevel1[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_1")];
            score["TEST_PASSED_INDICATOR"] = passDecode[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_1")];
        }

        if (!isEmpty(performanceLevel1[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_2")])) {
            score["TEST_SECONDARY_RESULT_CODE"] = row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_2");
            score["TEST_SECONDARY_RESULT"] = performanceLevel2[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_2")];
            score["TEST_CUSTOM_PASS_IND"] = passDecode[row.getField("${testMetadata.CODE}_PERFORMANCE_LEVEL_2")];
        }

        return score;
    }

    /**
     * Maps ela strand assessment data
     *
     * @param row The row being processed
     * @param testMetadata The metadata about the test
     * @returns {null} returns test score object
     */
    function mapELAStrand(row, testMetadata) {
        var score = {};
        var testNumber = "${testMetadata.TEST}_${testMetadata.CODE}_${testMetadata.FIELD}";
        var scaleScore = row.getField("${testMetadata.CODE}_${testMetadata.FIELD}");

        // Check for key fields and do not map score and exit if conditions met.
        if (isEmpty(scaleScore)) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
            score["TEST_RAW_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        return score;
    }

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
        var attemptednessSubjects = ["ELA", "MATHEMATICS", "STE"];

        attemptednessSubjects.forEach(function (subject) {
            var record = mapNormalizedRecord(signature, hierarchy, row, subject);
            AppUtil.nullSafePush(normalizedRecords, record);
        });

        return normalizedRecords;
    }

    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     * @param subject The subject being processed
     * @returns {Object}
     */
    function mapNormalizedRecord(signature, hierarchy, row, subject) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, subject);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                if (testMetadata.CODE === subject) {
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                }
            } catch (exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
     * @param subject The subject being processed
     */
    function mapNormalizedAdminFields(signature, hierarchy, row, subject) {

        var birthDateField = row.getField("DOB");

        if (birthDateField !== null && birthDateField !== undefined && birthDateField.toString().length < 10) {
            var birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "MM/dd/yy");
        }

        else if (birthDateField !== null && birthDateField !== undefined) {
            if (birthDateField.indexOf("-") >= 4) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "yyyy-MM-dd");
            }
            else if (birthDateField.indexOf("-") >= 2) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "MM-dd-yyyy");
            }
            else {
                var birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "MM/dd/yyyy");
            }
        }
        else {
            var birthDateObject = {
                RAW_DATE: null
                , MONTH: null
                , DAY: null
                , YEAR: null
                , STANDARD_DATE: null
            };
        }


        // Map standard normalized assessment fields.
        var record = AppUtil.mapNormalizedAssessmentFields(signature, hierarchy, row);

        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, subject);
        record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);      // pre UIHN-9419:  was not being set at all
        record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:  was not being set at all
        record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
        record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
        record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
        record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
        record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"),row.getField("SCHOOL_CODE"));
        record.SCHOOL_NAME = _util.coalesce(
            row.getField("SCHOOL_NAME")
        );
        record.SCHOOL_LOCAL_ID = _util.coalesce(
            row.getField("SCHOOL_LOCAL_ID")
        );
        record.STUDENT_STATE_ID = _util.coalesce(
            row.getField("STUDENT_STATE_ID")
        );
        record.STUDENT_VENDOR_ID = _util.coalesce(
            row.getField("STUDENT_STATE_ID")
        );
        record.STUDENT_FIRST_NAME = row.getField("STUDENT_FIRST_NAME");
        record.STUDENT_LAST_NAME = row.getField("STUDENT_LAST_NAME");
        record.STUDENT_MIDDLE_NAME = row.getField("STUDENT_MIDDLE_INITIAL");
        record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
        record.STUDENT_DOB_DAY = birthDateObject.DAY;
        record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
        record.STUDENT_GRADE_CODE = row.getField("GRADE");
        record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1).toUpperCase();
        record.TEST_REPORTING_DATE = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
        record.TEST_ADMIN_DATE = "05/15/" + row.getField("ADMIN_YEAR");
        return record;
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(row) {
        return {}
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    /***************************************************************************
     Utility Functions
     ***************************************************************************/
    /**
     * Determines if a variable has a variable
     *
     * @param val The value being checked
     * @returns {boolean}
     */
    function isEmpty(val) {
        return (val === null || val === undefined || _util.trim(val) === "--" || _util.trim(val) === "")
    }

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
     * @param subject The subject being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, subject) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

//        var testsubjects = ["ELA", "MATHEMATICS", "STE"];
//        testsubjects.forEach(function (test) {
//
//            });
         var attemptedness = srcRecord.getField("${subject}_ATTEMPTEDNESS");
         assessmentAdminKey = "${assessmentAdminKey}_${subject}";
         var signatureFormatName = signature.getFormat().getFormatName();
         if(signatureFormatName !== "MCAS_2020_265_headers"){
            assessmentAdminKey = "${assessmentAdminKey}_${subject}_${attemptedness}";
         }
        return assessmentAdminKey;
    }
    return module;
}());
