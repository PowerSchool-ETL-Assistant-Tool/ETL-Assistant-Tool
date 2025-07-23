var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AZ ACT ASPIRE";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returnVs {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
        try {
            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();
            var signatureFormatName = signature.getFormat().getFormatName();
            print(`Loading using signature file ${signatureFormatName}\n`);

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
        {
            TEST_IDENTIFIER: "COMP"
            , UNIQUE_KEYS: [
                "ENGLISH TEST EXTERNALLOGINKEY"
                , "MATHEMATICS TEST EXTERNALLOGINKEY"
                , "READING TEST EXTERNALLOGINKEY"
                , "SCIENCE TEST EXTERNALLOGINKEY"
                , "WRITING TEST EXTERNALLOGINKEY"
            ]
            , DATE_FIELDS: [
                "ENGLISH TEST ADMINISTRATION DATE"
                , "MATHEMATICS TEST ADMINISTRATION DATE"
                , "READING TEST ADMINISTRATION DATE"
                , "SCIENCE TEST ADMINISTRATION DATE"
                , "WRITING TEST ADMINISTRATION DATE"
            ]
            , TESTS:[
                {TEST_NUMBER_SUFFIX:"COMP", TEST_FIELD_ROOT: "COMPOSITE", MAP_FUNCTION: mapCompositeScore}
                //File ACT_ASPIRE_2019-2020 and potentially future files have reporting categories with labels, rather than by subject
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_1_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_2_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_3_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_4_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_5_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_6_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_7_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_8_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_9_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_10_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_11_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_12_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_13_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_14_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_15_", MAP_FUNCTION: mapRCScore}
                ,{TEST_NUMBER_SUFFIX:"TBD", TEST_FIELD_ROOT: "GENERAL_REPORTING_CATEGORY_16_", MAP_FUNCTION: mapRCScore}
            ]
        }
        , {
            TEST_IDENTIFIER: "EN"
            , UNIQUE_KEYS: [
                "ENGLISH TEST EXTERNALLOGINKEY"
            ]
            , DATE_FIELDS: ["ENGLISH TEST ADMINISTRATION DATE"]
            , TESTS:[
                {TEST_NUMBER_SUFFIX:"EN", TEST_FIELD_ROOT: "ENGLISH", MAP_FUNCTION: mapSubjectScore}
                , {TEST_NUMBER_SUFFIX:"EN_PRED", TEST_FIELD_ROOT: "ENGLISH", MAP_FUNCTION: mapPredictedScore}
                , {TEST_NUMBER_SUFFIX:"ENPOW", TEST_FIELD_ROOT: "PRODUCTION OF WRITING", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"ENKOL", TEST_FIELD_ROOT: "KNOWLEDGE OF LANGUAGE", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"ENCOSE", TEST_FIELD_ROOT: "CONVENTIONS OF STANDARD ENGLISH", MAP_FUNCTION: mapStrandScore}
            ]
        }
        , {
            TEST_IDENTIFIER: "MA"
            , UNIQUE_KEYS: [
                "MATHEMATICS TEST EXTERNALLOGINKEY"
                , "MATH TEST EXTERNALLOGINKEY"
            ]
            , DATE_FIELDS: [
                "MATHEMATICS TEST ADMINISTRATION DATE"
                , "MATH TEST ADMINISTRATION DATE"
            ]
            , TESTS:[
                // Subject Level Scores
                {TEST_NUMBER_SUFFIX:"MA", TEST_FIELD_ROOT: "MATHEMATICS", MAP_FUNCTION: mapSubjectScore}
                , {TEST_NUMBER_SUFFIX:"MA", TEST_FIELD_ROOT: "MATH", MAP_FUNCTION: mapSubjectScore}

                // Strand Scores
                , {TEST_NUMBER_SUFFIX:"MAGLP", TEST_FIELD_ROOT: "GRADE LEVEL PROGRESS", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAFND", TEST_FIELD_ROOT: "FOUNDATION", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAFND", TEST_FIELD_ROOT: "INTEGRATING ESSENTIAL SKILLS", MAP_FUNCTION: mapStrandScore}//Foundation upgraded to Integrating Essential Skills
                , {TEST_NUMBER_SUFFIX:"MAJE", TEST_FIELD_ROOT: "JUSTIFICATION AND EXPLANATION", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAMDL", TEST_FIELD_ROOT: "MODELING", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MANOF", TEST_FIELD_ROOT: "NUMBER AND OPERATIONS - FRACTIONS", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MANOB10", TEST_FIELD_ROOT: "NUMBER AND OPERATIONS IN BASE 10", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MANS", TEST_FIELD_ROOT: "THE NUMBER SYSTEM", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MANQ", TEST_FIELD_ROOT: "NUMBER AND QUANTITY", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAOA", TEST_FIELD_ROOT: "OPERATIONS AND ALGEBRAIC", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAEE", TEST_FIELD_ROOT: "EXPRESSIONS AND EQUATIONS", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MARPR", TEST_FIELD_ROOT: "RATIOS AND PROPORTIONAL RELATIONSHIPS", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAALG", TEST_FIELD_ROOT: "ALGEBRA", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAFNC", TEST_FIELD_ROOT: "FUNCTIONS", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAGEO", TEST_FIELD_ROOT: "GEOMETRY", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MAMD", TEST_FIELD_ROOT: "MEASURE AND DATA", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MASP", TEST_FIELD_ROOT: "STATISTICS AND PROBABILITY", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"MA_PRED", TEST_FIELD_ROOT: "MATH", MAP_FUNCTION: mapPredictedScore}
            ]
        }
        , {
            TEST_IDENTIFIER: "RD"
            , UNIQUE_KEYS: [
                "READING TEST EXTERNALLOGINKEY"
            ]
            , DATE_FIELDS: ["READING TEST ADMINISTRATION DATE"]
            , TESTS:[
                {TEST_NUMBER_SUFFIX:"RD", TEST_FIELD_ROOT: "READING", MAP_FUNCTION: mapSubjectScore}
                , {TEST_NUMBER_SUFFIX:"RD_PRED", TEST_FIELD_ROOT: "READING", MAP_FUNCTION: mapPredictedScore}
                , {TEST_NUMBER_SUFFIX:"RDKID", TEST_FIELD_ROOT: "KEY IDEAS AND DETAILS", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"RDCS", TEST_FIELD_ROOT: "CRAFT AND STRUCTURE", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"RDIKI", TEST_FIELD_ROOT: "INTEGRATION OF KNOWLEDGE AND IDEAS", MAP_FUNCTION: mapStrandScore}
            ]
        }
        , {
            TEST_IDENTIFIER: "SC"
            , UNIQUE_KEYS: [
                "SCIENCE TEST EXTERNALLOGINKEY"
            ]
            , DATE_FIELDS: ["SCIENCE TEST ADMINISTRATION DATE"]
            , TESTS:[
                {TEST_NUMBER_SUFFIX:"SC", TEST_FIELD_ROOT: "SCIENCE", MAP_FUNCTION: mapSubjectScore}
                , {TEST_NUMBER_SUFFIX:"SC_PRED", TEST_FIELD_ROOT: "SCIENCE", MAP_FUNCTION: mapPredictedScore}
                , {TEST_NUMBER_SUFFIX:"SCID", TEST_FIELD_ROOT: "INTERPRETATION OF DATA", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"SCSI", TEST_FIELD_ROOT: "SCIENTIFIC INVESTIGATION", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"SCMIER", TEST_FIELD_ROOT: "EVALUATION OF MODELS, INFERENCES, AND EXPERIMENTAL RESULTS", MAP_FUNCTION: mapStrandScore}
                , {TEST_NUMBER_SUFFIX:"SCES", TEST_FIELD_ROOT: "EARTH&SPACESCIENCE", MAP_FUNCTION: mapScienceStrandScore}
                , {TEST_NUMBER_SUFFIX:"SCLIFS", TEST_FIELD_ROOT: "LIFESCIENCE", MAP_FUNCTION: mapScienceStrandScore}
                , {TEST_NUMBER_SUFFIX:"SCPS", TEST_FIELD_ROOT: "PHYSICALSCIENCE", MAP_FUNCTION: mapScienceStrandScore}
            ]
        }
        , {
            TEST_IDENTIFIER: "WR"
            , UNIQUE_KEYS: [
                "WRITING TEST EXTERNALLOGINKEY"
            ]
            , DATE_FIELDS: ["WRITING TEST ADMINISTRATION DATE"]
            , TESTS:[
                {TEST_NUMBER_SUFFIX:"WR", TEST_FIELD_ROOT: "WRITING", MAP_FUNCTION: mapSubjectScore}
                , {TEST_NUMBER_SUFFIX:"WR_PRED", TEST_FIELD_ROOT: "WRITING", MAP_FUNCTION: mapPredictedScore}
                , {TEST_NUMBER_SUFFIX:"WRIA", TEST_FIELD_ROOT: "IDEAS AND ANALYSIS", MAP_FUNCTION: mapWritingStrandScore}
                , {TEST_NUMBER_SUFFIX:"WRDS", TEST_FIELD_ROOT: "DEVELOPMENT AND SUPPORT", MAP_FUNCTION: mapWritingStrandScore}
                , {TEST_NUMBER_SUFFIX:"WRORG", TEST_FIELD_ROOT: "ORGANIZATION", MAP_FUNCTION: mapWritingStrandScore}
                , {TEST_NUMBER_SUFFIX:"WRLUC", TEST_FIELD_ROOT: "LANGUAGE USE AND CONVENTIONS", MAP_FUNCTION: mapWritingStrandScore}
            ]
        }
        , {
            TEST_IDENTIFIER: "ELA"
            , UNIQUE_KEYS: [
                "ENGLISH TEST EXTERNALLOGINKEY"
                , "READING TEST EXTERNALLOGINKEY"
                , "WRITING TEST EXTERNALLOGINKEY"
            ]
            , DATE_FIELDS: [
                "ENGLISH TEST ADMINISTRATION DATE"
                , "READING TEST ADMINISTRATION DATE"
                , "WRITING TEST ADMINISTRATION DATE"
            ]
            , TESTS:[
                {TEST_NUMBER_SUFFIX:"ELA", TEST_FIELD_ROOT: "ELA", MAP_FUNCTION: mapELAScore}
            ]
        }
        , {
            TEST_IDENTIFIER: "STEM"
            , UNIQUE_KEYS: [
                "MATHEMATICS TEST EXTERNALLOGINKEY"
                , "MATH TEST EXTERNALLOGINKEY"
                , "SCIENCE TEST EXTERNALLOGINKEY"
            ]
            , DATE_FIELDS: [
                "MATHEMATICS TEST ADMINISTRATION DATE"
                , "MATH TEST ADMINISTRATION DATE"
                , "SCIENCE TEST ADMINISTRATION DATE"
            ]
            , TESTS:[
                {TEST_NUMBER_SUFFIX:"STEM", TEST_FIELD_ROOT: "STEM", MAP_FUNCTION: mapSTEMScore}
            ]
        }
    ];


    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var careerReadinessProgress = {
        "0" : "Insufficient progress toward an NCRC level"
        , "1" : "Progress toward Bronze Level NCRC"
        , "2" : "Progress toward Silver level NCRC"
        , "3" : "Progress toward Gold level NCRC"
        , "4" : "Progress toward Platinum level NCRC"
        , "-" : "Unable to calculate"
    };

    var textComplexityDecode = {
        "Y" : "Sufficient Progress with text complexity"
        , "N" : "Insufficient Progress with text complexity"
    };

    var actReadinessBenchmark = {
        "Y" : "Met ACT Readiness Benchmark"
        , "N" : "Below ACT Readiness Benchmark"
    };

    var actReadinessRange = {
        "Y" : "Within ACT Readiness Range"
        , "N" : "Below ACT Readiness Range"
    };


    var subjectReadinessLevel = {
        "E" : "Exceeding"
        , "R" : "Ready"
        , "C" : "Close"
        , "N" : "In Need of Support"
    };

    var growthDecode = {
        "F" : "Fast"
        , "A" : "Average"
        , "L" : "Low"
    };

    var labelLookup = {
        "POW" : "ENPOW"//English Production of Writing
        ,"COE" :"ENCOSE"//English Conventions of Standard English
        ,"KLA" : "ENKOL"//English Knowledge of Language
        ,"KID" : "RDKID"//Reading Key Ideas and Details
        ,"CAS" : "RDCS"//Reading Craft and Structure
        ,"IOK" : "RDIKI"//Reading Integration of Knowledge and Ideas
        ,"IAA" : "WRIA"//Writing Ideas and Analysis
        ,"DAS" : "WRDS"//Writing Development and Support
        ,"ORG" : "WRORG"//Writing Organization
        ,"LUC" : "WRLUC"//Writing Language Use and Conventions
        ,"IOD" : "SCID"//Science Interpretation of Data
        ,"SIN" : "SCSI"//Science Scientific Investigation
        ,"EMI" : "SCMIER"//Science Evaluation of Models, Inferences, and Experimental Results
        ,"GLP" : "MAGLP"//Mathematics Grade Level Progress
        ,"IES" : "MAIES"//Mathematics Integrating Essential Skills
        ,"JE" : "MAJE"//Mathematics Justification and Explanation
        ,"MODELING" : "MAMDL"//Mathematics Modeling
        ,"GLP_NF" : "MANOF"//Mathematics Number and Operations - Fractions
        ,"GLP_NBT" : "MANOB10"//Mathematics Number and Operations in Base 10
        ,"GLP_OA" : "MAOA"//Mathematics Operations and Algebraic Thinking
        ,"GLP_MD" : "MAMD"//Mathematics Measurement and Data
        ,"GLP_NS" : "MANS"//Mathematics The Number System
        ," GLP_EE" : "MAEE"//Mathematics Expressions & Equations
        ,"GLP_EE" : "MAEE"//Mathematics Expressions & Equations
        ,"GLP_RP" : "MARPR"//Mathematics Ratios and Proportional Relationships
        ,"GLP_F" : "MAFNC"//Mathematics Functions
        ," GLP_G" : "MAGEO"//Mathematics Geometry
        ,"GLP_G" : "MAGEO"//Mathematics Geometry
        ," GLP_S" : "MASP"//Mathematics Statistics and Probability
        ,"GLP_S" : "MASP"//Mathematics Statistics and Probability
        ,"GLP_N" : "MANQ"//Mathematics Number and Quantity
        ,"GLP_A" : "MAALG"//Mathematics Algebra
    }

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

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                testMetadata.TESTS.forEach(function(test) {
                    var score = (test.MAP_FUNCTION)(row, test, signature);

                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);

                    if ((test.TEST_FIELD_ROOT == "ENGLISH" || test.TEST_FIELD_ROOT == "MATH" || test.TEST_FIELD_ROOT == "READING" ||
                      test.TEST_FIELD_ROOT == "SCIENCE" ) && (score !==null ) && (test.MAP_FUNCTION === mapSubjectScore))
                    {
                        for (var i = 1; i <= 5; i++) {
                        var scr = mapScore(row, test, i, signature);
                        if (scr !== null) {
                            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, scr);
                        }
                        }

                    }
                })

            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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

        function dateConverter(dateString) {
            // Check if dateString is null, undefined, or an empty string
            if (!dateString || typeof dateString !== 'string' || dateString.trim() === '') {
                return { finalDates: null, months: null, days: null, years: null };
            }

            var dateParts, dateObj, year, month, day;

            // Check for the presence of time and strip it out for initial processing
            var timeIndex = dateString.indexOf(" ");
            if (timeIndex !== -1) {
                dateString = dateString.split(" ")[0];
            }

            // Replace dashes with slashes for consistent processing
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
                    // Ambiguous case, default to MM/DD/YYYY
                    month = dateParts[0];
                    day = dateParts[1];
                    year = dateParts[2];
                }
            } else {
                return { finalDates: null, months: null, days: null, years: null };
            }

            // Create the Date object
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
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateObject = dateConverter(row.getField("BIRTH_DATE"));
        var assessmentDateObject = dateConverter(row.getField("TEST_ADMIN_DATE"));

        normalizedFileFields.forEach(function (field) {
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
                    if (assessmentDateObject.finalDates === null) {
                        var defaultYear = hierarchy.SCHOOL_YEAR.substring(5, 9);
                        record.TEST_ADMIN_DATE = "05/15/" + defaultYear;
                    } else {
                        record.TEST_ADMIN_DATE = assessmentDateObject.finalDates;
                    }
                    break;
                case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("STUDENT_ACTUAL_GRADE"), null)];
                    break;
                case "STUDENT_VENDOR_ID":
                      record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"), row.getField("STUDENT_LOCAL_ID"));
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
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
       return {}
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapCompositeScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = "AZ_ASPIRE_" + testMetadata.TEST_NUMBER_SUFFIX;
            var scaleScore = _util.coalesce(row.getField("COMPOSITE SCORE"), row.getField("ACT ASPIRE COMPOSITE SCORE"));
            var careerReadiness = row.getField("PROGRESS TOWARD CAREER READINESS");
            var predictedScore = row.getField("COMPOSITEPREDICTEDACTSCORE");


            if (scaleScore === null || scaleScore === undefined || scaleScore === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_LOWER_BOUND"] = _util.coalesce(row.getField("THE ACT PROJECTED COMPOSITE SCORE RANGE LOW"), row.getField("ACT ASPIRE COMPOSITE SCORE RANGE LOWER BOUND"));
            score["TEST_UPPER_BOUND"] = _util.coalesce(row.getField("THE ACT PROJECTED COMPOSITE SCORE RANGE HIGH"), row.getField("ACT ASPIRE COMPOSITE SCORE RANGE UPPER BOUND"));
            score["TEST_PRIMARY_RESULT_CODE"] = careerReadiness;
            score["TEST_PRIMARY_RESULT"] = careerReadinessProgress[careerReadiness];
            score["TEST_PREDICTED_SCORE"] = parseInt(predictedScore);

            return score;
        } catch (exception) {
            throw "${_thisModuleName}.mapCompositeScore Exception: ${exception}";
        }
    }


    function mapELAScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = "AZ_ASPIRE_" + testMetadata.TEST_NUMBER_SUFFIX;
            var scaleScore = row.getField("ELA SCORE");
            var subjReadiness = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + " READINESS"),  row.getField(testMetadata.TEST_FIELD_ROOT + " ACT Readiness Benchmark"));
            var textComplex = row.getField("PROGRESS WITH TEXT COMPLEXITY");
            var prof = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "PROFICIENCYLEVEL"));
            var theta = _util.coalesce(row.getField("ELATHETASCORE"));

            if (scaleScore === null || scaleScore === undefined || scaleScore === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(subjReadiness,prof);
            score["TEST_PRIMARY_RESULT"] = _util.coalesce(actReadinessRange[subjReadiness], careerReadinessProgress[prof]);
            score["TEST_SECONDARY_RESULT_CODE"] = textComplex;
            score["TEST_SECONDARY_RESULT"] = textComplexityDecode[textComplex];

            if (!isNaN(theta)) {
                score["TEST_Z_SCORE"] = theta;
            }

            return score;
        } catch (exception) {
            throw "${_thisModuleName}.mapELAScore Exception: ${exception}";
        }
    }


    function mapSubjectScore(row, testMetadata, signature) {
        try {
            var score = {};
            var testNumber = "AZ_ASPIRE_" + testMetadata.TEST_NUMBER_SUFFIX;
            var scaleScore = row.getField(testMetadata.TEST_FIELD_ROOT + " SCALE SCORE");
            var actBenchmark = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + " ACT READINESS BENCHMARK"), row.getField(testMetadata.TEST_FIELD_ROOT + " ACT READINESS RANGE"));
            var subjReadiness = row.getField(testMetadata.TEST_FIELD_ROOT + " READINESS LEVEL");
            var growthCategory = row.getField(testMetadata.TEST_FIELD_ROOT + " GROWTH CATEGORY");

            var sem = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "SCALESCORECSEM"));
            var prof = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "PROFICIENCYLEVEL"));
            var rawScore = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "RAWSCORE"));
            var theta = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "THETASCORE"));

            /*
                 * Check for null values. Return no score record if null
                 *
                 * Check to see if score is a non-numeric code.
                 *  INV: Invalid Test Score
                 *  NE: Not English
                 *  OT: Off-topic
                 *  IL: Illegible
                 *
                 * If not null and not a code, map score value fields.
                 */
            if (scaleScore === null || scaleScore === undefined || scaleScore === "" || scaleScore === "Blank") {
                return null;
            } else if (scaleScore === "INV" || scaleScore === "NE" || scaleScore === "OT" || scaleScore === "IL") {
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
            } else {
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }

            if (!isNaN(rawScore)) {
                score["TEST_RAW_SCORE"] = rawScore;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_PERCENTILE_SCORE"] = row.getField(testMetadata.TEST_FIELD_ROOT + " NATIONAL PERCENTILE RANK");
            score["TEST_LOWER_BOUND"] = row.getField(testMetadata.TEST_FIELD_ROOT + " PROJECTED ACT SCORE RANGE LOWER");
            score["TEST_UPPER_BOUND"] = row.getField(testMetadata.TEST_FIELD_ROOT + " PROJECTED ACT SCORE RANGE UPPER");
            score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(actBenchmark, prof);
            score["TEST_PRIMARY_RESULT"] = _util.coalesce(actReadinessBenchmark[actBenchmark], careerReadinessProgress[prof]);
            score["TEST_SECONDARY_RESULT_CODE"] = subjReadiness;
            score["TEST_SECONDARY_RESULT"] = subjectReadinessLevel[subjReadiness];
            score["TEST_GROWTH_PERCENTILE"] = row.getField(testMetadata.TEST_FIELD_ROOT + " GROWTH PERCENTILE");
            score["TEST_GROWTH_RESULT_CODE"] = growthCategory;
            score["TEST_GROWTH_RESULT"] = growthDecode[growthCategory];

            // Map Text Complexity for Reading scores.
            if (testMetadata.TEST_NUMBER_SUFFIX === "RD") {
                var textComplex = row.getField("PROGRESS WITH TEXT COMPLEXITY");
                score["TEST_TERTIARY_RESULT_CODE"] = textComplex;
                score["TEST_TERTIARY_RESULT"] = growthDecode[textComplex];
            }

            if (!isNaN(sem)) {
                score["TEST_STANDARD_ERROR"] = sem;
            }

            if (!isNaN(theta)) {
                score["TEST_Z_SCORE"] = theta;
            }

            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapSubjectScore Exception: ${exception}";
        }
    }


    function mapScore(row, test, itr, signature) {
        var score = {};
        var fileName = signature.getFormat().getFormatName()

        if(fileName === "ACT_ASPIRE_2017" ||fileName === "ACT_ASPIRE_2018" || fileName === "ACT_ASPIRE_2019" || fileName === "ACT_ASPIRE_2020"){
           return null;
        }

        var testNumber = "AZ_ASPIRE_" + test.TEST_FIELD_ROOT + "_" + itr;
        var scaleScore = _util.coalesce(row.getField(test.TEST_FIELD_ROOT + "SCALESCORERC" + itr));
        var rawScore = _util.coalesce(row.getField(test.TEST_FIELD_ROOT + "RAWSCORERC" + itr));
        var theta = _util.coalesce(row.getField(test.TEST_FIELD_ROOT + "THETASCORERC" + itr));
        var scaleSEM = _util.coalesce(row.getField(test.TEST_FIELD_ROOT + "SCALESCORECSEMRC" + itr));
        // Check for key fields and do not map score and exit if conditions met.
        if ((rawScore === null || rawScore === "#NULL!" || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")
            && (scaleScore === null || scaleScore === "#NULL!" || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
            && (theta === null || theta === "#NULL!" || theta === undefined || _util.trim(theta) === "--" || _util.trim(theta) === "")
            && (scaleSEM === null || scaleSEM === "#NULL!" || scaleSEM === undefined || _util.trim(scaleSEM) === "--" || _util.trim(scaleSEM) === "")) {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;
        if (![null, undefined, '#NULL!', 'N', 'E'].some(falsy => falsy === scaleScore)) {
            score["TEST_SCORE_TEXT"] = scaleScore;
        }

        if (!isNaN(scaleScore)) {
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }

        if (rawScore && !isNaN(rawScore)) {
            score["TEST_RAW_SCORE"] = rawScore;
        }

        if (theta && !isNaN(theta)) {
            score["TEST_Z_SCORE"] = theta;
        }

        if (scaleSEM && !isNaN(scaleSEM)) {
            score["TEST_STANDARD_ERROR"] = scaleSEM;
        }

        return score;
    }

    function mapStrandScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = "AZ_ASPIRE_" + testMetadata.TEST_NUMBER_SUFFIX;

            var rawScore = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + " EARNED POINTS"), row.getField(testMetadata.TEST_FIELD_ROOT + " CAT 1 RAW SCORE"));
            var actReadiness = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + " ACT READINESS BENCHMARK"), row.getField(testMetadata.TEST_FIELD_ROOT + " ACT READINESS RANGE"));

            if (rawScore === null || rawScore === undefined || rawScore === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_ITEMS_POSSIBLE"] = row.getField(testMetadata.TEST_FIELD_ROOT + " TOTAL POINTS");
            score["TEST_PERCENTAGE_SCORE"] = row.getField(testMetadata.TEST_FIELD_ROOT + " PERCENT CORRECT");
            score["TEST_PRIMARY_RESULT_CODE"] = actReadiness;
            score["TEST_PRIMARY_RESULT"] = actReadinessRange[actReadiness];


            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapStrandScore Exception: ${exception}";
        }
    }


    function mapRCScore(row, testMetadata) {
        try {
            //Example physical fields: RptCat1Label,RptCat1RawScore,RptCat1PointsPossible,RptCat1PercentCorrect,RptCat1ReadinessRange,
            var score = {};
            var testNumber = "AZ_ASPIRE_";//Subject and other parts must be determined

            var label = row.getField(testMetadata.TEST_FIELD_ROOT + "LABEL");
            var rawScore = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "EARNED_POINTS"), row.getField(testMetadata.TEST_FIELD_ROOT + "RAW_SCORE"));
            var pointsPossible = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "POINTS_POSSIBLE"));
            var percentCorrect = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "PERCENT_CORRECT"));
            var readinessRange = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "READINESS_RANGE"));


            if (rawScore === null || rawScore === undefined || rawScore === "") {
                return null;
            }
            //Determine the subject after the null check
            var labelSubject = labelLookup[label];
            testNumber = testNumber + labelSubject;

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_ITEMS_POSSIBLE"] = pointsPossible;
            score["TEST_PERCENTAGE_SCORE"] = percentCorrect;
            score["TEST_PRIMARY_RESULT_CODE"] = readinessRange;
            score["TEST_PRIMARY_RESULT"] = actReadinessRange[readinessRange];

            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapRCScore Exception: ${exception}";
        }
    }


    function mapScienceStrandScore(row, testMetadata, signature) {

        var fileName = signature.getFormat().getFormatName();

        if(fileName === "ACT_ASPIRE_2017" ||fileName === "ACT_ASPIRE_2018" || fileName === "ACT_ASPIRE_2019" || fileName === "ACT_ASPIRE_2020"){
           return null;
        }

        try {
            var score = {};
            var testNumber = "AZ_ASPIRE_" + testMetadata.TEST_NUMBER_SUFFIX;
            var scaleScore = row.getField(testMetadata.TEST_FIELD_ROOT + "SCALESCORE");
            var rawScore = row.getField(testMetadata.TEST_FIELD_ROOT + "RAWSCORE");
            var sem = row.getField(testMetadata.TEST_FIELD_ROOT + "SCALESCORECSEM");
            var theta = row.getField(testMetadata.TEST_FIELD_ROOT + "THETASCORE");

            if (rawScore === null || rawScore === undefined || rawScore === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_Z_SCORE"] = theta;
            score["TEST_STANDARD_ERROR"] = sem;


            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapStrandScore Exception: ${exception}";
        }
    }

    function mapWritingStrandScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = "AZ_ASPIRE_" + testMetadata.TEST_NUMBER_SUFFIX;
            var rawScore = row.getField(testMetadata.TEST_FIELD_ROOT + " EARNED POINTS");

            if (rawScore === null || rawScore === undefined || rawScore === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = rawScore;
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_ITEMS_POSSIBLE"] = row.getField(testMetadata.TEST_FIELD_ROOT + " TOTAL POINTS");
            score["TEST_PERCENTAGE_SCORE"] = row.getField(testMetadata.TEST_FIELD_ROOT + " PERCENT CORRECT");

            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapWritingStrandScore Exception: ${exception}";
        }
    }

    function mapSTEMScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = "AZ_ASPIRE_" + testMetadata.TEST_NUMBER_SUFFIX;
            var scaleScore = row.getField("STEM SCORE");
            var stemReadiness = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + " READINESS"),row.getField(testMetadata.TEST_FIELD_ROOT + " ACT READINESS"),  row.getField(testMetadata.TEST_FIELD_ROOT + " ACT Readiness Benchmark"));
            var prof = _util.coalesce(row.getField(testMetadata.TEST_FIELD_ROOT + "PROFICIENCYLEVEL"));
            var theta = row.getField("STEMTHETASCORE");

            if (scaleScore === null || scaleScore === undefined || scaleScore === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_PRIMARY_RESULT_CODE"] = _util.coalesce(stemReadiness,prof);
            score["TEST_PRIMARY_RESULT"] =  _util.coalesce(actReadinessRange[stemReadiness],careerReadinessProgress[prof]);

            if (!isNaN(theta)) {
                score["TEST_Z_SCORE"] = theta;
            }

            return score;
        } catch(exception) {
            throw "${_thisModuleName}.mapSTEMScore Exception: ${exception}";
        }
    }

    function mapPredictedScore(row, testMetadata, signature) {
        var score = {};
        var fileName = signature.getFormat().getFormatName();

        if(fileName === "ACT_ASPIRE_2017" ||fileName === "ACT_ASPIRE_2018" || fileName === "ACT_ASPIRE_2019" || fileName === "ACT_ASPIRE_2020"){
           return null;
        }

        var testNumber = "AZ_ASPIRE_" + testMetadata.TEST_NUMBER_SUFFIX;
        var predictedScore = row.getField(testMetadata.TEST_FIELD_ROOT + "PREDICTEDACTSCORE");


        // Check for key fields and do not map score and exit if conditions met.
        if (predictedScore === null || predictedScore === undefined || _util.trim(predictedScore) === "--" || _util.trim(predictedScore) === "") {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = parseInt(predictedScore);

        if (!isNaN(predictedScore)) {
            score["TEST_SCORE_VALUE"] = parseInt(predictedScore);
            score["TEST_SCALED_SCORE"] = parseInt(predictedScore);
        }
        score["TEST_LOWER_BOUND"] = row.getField(testMetadata.TEST_FIELD_ROOT + " PROJECTED ACT SCORE RANGE LOWER");
        score["TEST_UPPER_BOUND"] = row.getField(testMetadata.TEST_FIELD_ROOT + " PROJECTED ACT SCORE RANGE UPPER");

        return score;
    }

    function generateTestNumber(row, testMetadata) {

        var testNumber = testMetadata.TEST_NUMBER_SUFFIX;

        return testNumber;

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

            if(assessmentAdminKey_one === assessmentAdminKey_two) {
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

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
            //Date Conformation
          var raw = srcRecord.getField("TEST_ADMIN_DATE");
          var dateObj = dateConverter(raw);
          var finalDate = dateObj.finalDates;
          if (!finalDate) {
            var defaultYear = hierarchy.SCHOOL_YEAR.substring(5, 9);
            finalDate = "05/15/" + defaultYear;
          }

          assessmentAdminKey += "_" + finalDate;
          return assessmentAdminKey;
        }

    return module;
}());