var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CHECK_INS";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;
    var subject;

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
            print("Loading using signature file ${signatureFormatName}\n");

            var normalizedFile = AppUtil.createResultsFile(file);
            print("Normalized file: ${normalizedFile}\n");

            subject = determineFileSubject(_fileDetector.getSignatureName(signature));

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
        }
    };

    var fileNamesToSubjects = {
        "Bio_Ecosystems": "BIO",
        "Bio_Evolution": "BIO",
        "Bio_LivOrganisms": "BIO",
        "BIO_ECOSYSTEM": "BIO",
        "BIO_FUNCT": "BIO",
        "BIO_MOL": "BIO",
        "Bio_Molecular": "BIO",
        "19_MATH": "MA",
        "20_MATH": "MA",
        "21_MATH": "MA",
        "MATH_SPRING": "MA",
        "22_MATH": "MA",
        "Math_2122": "MA",
        "MATH_CHECKINS": "MA",
        "Math": "MA",
        "Math_2022": "MA",
        "Math_Yearless": "MA",
        "Math_15Cols": "MA",
        "Math_10": "MA",
        "Math_15txt": "MA",
        "Reading": "RD",
        "19_READING": "RD",
        "23_READING_CHECKINS": "RD",
        "SPRING_READING": "RD",
        "Reading_2022": "RD",
        "Reading_12Cols": "RD",
        "READING_CHECKINS": "RD",
        "Bio_SubscoreEcosystems" : "BIO",
        "Bio_SubScoreMolecular" : "BIO",
        "Sci_2022": "SCI",
        "20_SCI": "SCI",
        "Sci_Earth": "SCI",
        "Sci": "SCI",
        "sci": "SCI",
        "SCI": "SCI",
        "CHECK_IN": "ALL"
    };

    // Subject From Sig Formats
    function determineFileSubject(format) {
        var type =  format.substring(format.lastIndexOf('_', format.lastIndexOf('_')-1)+1);
        print("the type name is " + type + "\n");
        subject = fileNamesToSubjects[type];
        print("the subject name is " + subject + "\n");
        return subject;
    }

    var courseSubjects = {
        "Biology" : "BIO"
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
         //Map Total Scores
        { TEST: "CHECK_INS", CODE: "MOL_BIO", FIELD:"MOLECULAR_BIOLOGY", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "ECO_BIO", FIELD:"ECOSYSTEMS_BIOLOGY", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_EVAL_GEN", FIELD:"EVOLUTION_AND_GENETICS", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_STRUCT_FUN", FIELD:"STRUCTURE_AND_FUNCTION", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_STRUCT_FUN", FIELD:"STRUCTURE_FUNCTIONS_SCI", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_ECO", FIELD:"ECOSYSTEMS_SCI", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_EVAL_GEN", FIELD:"EVOLUTION_AND_GENETICS_SCI", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_MOL_BIO", FIELD:"MOLECULAR_BIOLOGY_SCI", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO", FIELD:"BIO", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA", FIELD:"MATH", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD", FIELD:"READ", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "EG", FIELD:"ENG_SCORE", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI", FIELD:"SCI", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", FIELD:"SCORE", FIELD1: "PERCENT", FIELD2: "PERCENTAGE", MAP_FUNCTION: mapScaledScore },

        //Map strand Scores
        { TEST: "CHECK_INS", CODE: "BIO_1.1", FIELD:"BIO_1.1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_1.2", FIELD:"BIO_1.2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_2.1", FIELD:"BIO_2.1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_2.2", FIELD:"BIO_2.2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_3.1", FIELD:"BIO_3.1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_3.2", FIELD:"BIO_3.2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_3.3", FIELD:"BIO_3.3", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_3.4", FIELD:"BIO_3.4", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_3.5", FIELD:"BIO_3.5", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_4.1", FIELD:"BIO_4.1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "BIO_4.2", FIELD:"BIO_4.2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_CALC_INA", FIELD:"CALC_INACTIVE", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_CALC_ACT", FIELD:"CALC_ACTIVE", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_GRID_ITEM", FIELD:"GRIDDLE_ITEMS", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_RATIO_PROP", FIELD:"RATIOS_AND_PROP_RELATION", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_RATIO_PROP_1", FIELD:"RATIOS_AND_PROP_RELATION_1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_RATIO_PROP_2", FIELD:"RATIOS_AND_PROP_RELATION_2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_RATIO_PROP_3", FIELD:"RATIOS_AND_PROP_RELATION_3", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_RATIO_PROP_4", FIELD:"RATIOS_AND_PROP_RELATION_4", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_NUM_SYS", FIELD:"NUMBERS_SYSTEM", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_EXP_EQA", FIELD:"EXPRESSIONS_AND_EQUATION", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_EXP_EQA_1", FIELD:"EXPRESSIONS_AND_EQUATION_1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_EXP_EQA_2", FIELD:"EXPRESSIONS_AND_EQUATION_2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_EXP_EQA_3", FIELD:"EXPRESSIONS_AND_EQUATION_3", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_EXP_EQA_4", FIELD:"EXPRESSIONS_AND_EQUATION_4", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_EXP_EQA_5", FIELD:"EXPRESSIONS_AND_EQUATION_5", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_ALG", FIELD:"ALGEBRA", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_ALG_1", FIELD:"ALGEBRA_1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_ALG_2", FIELD:"ALGEBRA_2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_ALG_3", FIELD:"ALGEBRA_3", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_FUNC", FIELD:"FUNCTIONS", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_FUNC_2", FIELD:"FUNCTIONS_2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_GEOM", FIELD:"GEOMETRY", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_GEOM_1", FIELD:"GEOMETRY_1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_GEOM_2", FIELD:"GEOMETRY_2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_GEOM_3", FIELD:"GEOMETRY_3", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_GEOM_4", FIELD:"GEOMETRY_4", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_GEOM_5", FIELD:"GEOMETRY_5", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_STAT_PROB", FIELD:"STAT_AND_PROBABILITY", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_OPE_ALG", FIELD:"OPERATION_ALG_THINK", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_NUM_OPS", FIELD:"NUM_OPS_BASE_10", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_NUM_OPS_1", FIELD:"NUM_OPS_BASE_10_1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_NUM_OPS_2", FIELD:"NUM_OPS_BASE_10_2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_NUM_OPS_3", FIELD:"NUM_OPS_BASE_10_3", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_NUM_OPS_4", FIELD:"NUM_OPS_BASE_10_4", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MA_MEAS", FIELD:"MEASUREMENT_AND_DATA", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG", FIELD:"LANGUAGE", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG_4", FIELD:"LANGUAGE_4", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG_5A", FIELD:"LANGUAGE_5A", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LIT", FIELD:"READ_LITERATURE", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LIT_2", FIELD:"READ_LITERATURE_2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LIT_4", FIELD:"READ_LITERATURE_4", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LIT_6", FIELD:"READ_LITERATURE_6", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_INF", FIELD:"READ_INFORMATION", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_INF_5", FIELD:"READ_INFORMATION_5", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_INF_8", FIELD:"READ_INFORMATION_8", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG_INF_1", FIELD:"READ_LITERATURE_AND_INFORMATION_1", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG_INF_2", FIELD:"READ_LITERATURE_AND_INFORMATION_2", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG_INF_3", FIELD:"READ_LITERATURE_AND_INFORMATION_3", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG_INF_4", FIELD:"READ_LITERATURE_AND_INFORMATION_4", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG_INF_5", FIELD:"READ_LITERATURE_AND_INFORMATION_5", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_LANG_INF_6", FIELD:"READ_LITERATURE_AND_INFORMATION_6", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_COMP_WC", FIELD:"COMP_WEATHER_CHANGES", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_MATTER", FIELD:"MATTER", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_ENERGY", FIELD:"ENERGY", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_PRED_WEA", FIELD:"PREDICT_WEATHER", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_FOR_MOT", FIELD:"FORCES_AND_MOTION", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_GLOBAL_WEA", FIELD:"GLOBAL_WEATHER", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_EARTH_SYS", FIELD:"EARTH_SYSTEMS", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "SCI_EARTH_HIST", FIELD:"EARTH_HISTORY", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "RD_SECTION", FIELD:"READ_SECTION", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MATH_CALC_INA", FIELD:"MATH_CALC_INACTIVE", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "MATH_CALC_ACT", FIELD:"MATH_CALC_ACTIVE", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "OA_10", FIELD:"OA_[10]", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "5.OA.2_5", FIELD:"OA_[10]", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "5.OA.3_5", FIELD:"5.OA.3_[5]", MAP_FUNCTION: mapScaledScore },
        { TEST: "CHECK_INS", CODE: "4.OA.1_5", FIELD:"4.OA.1_[5]", MAP_FUNCTION: mapScaledScore },
//        { TEST:"CHECK_INS", FIELD:"SCORE1", FIELD1: "PERCENT", MAP_FUNCTION: mapScaledScore },
//        { TEST:"CHECK_INS", FIELD:"SCORE1", FIELD1: "PERCENTAGE", MAP_FUNCTION: mapScaledScore }
   ];

    /***************************************************************************
     Assessment-specific decodes
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
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
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
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();;
        var flName =  fileName.substring(fileName.indexOf("-") >-1);

        const PERIOD_INFO = (() => {
            let term = row.getField("DATE_COMPLETED");
            let testDateObj = row.getField("TESTDATE");
            let yearObj = _util.coalesce(row.getField("YEAR"), row.getField("TESTDATE"));
            let period = '';
            let year = '';
            if (term) {
                period = term.split(' ')[0].toUpperCase();
                year = term.split(' ')[1];
            } else if (testDateObj === 'NCCkin1' ) {
                period = "NCCkin1";
                year = yearObj.split('-')[0];
            } else if (testDateObj === 'NCCkinSem1'){
                period = "NCCkinSem1";
                year = yearObj.split('-')[0];
            } else if (testDateObj === 'NCCkin2'){
                period = "NCCkin2";
                year = yearObj.split('-')[0];
            } else if (testDateObj === 'NCCkinSem2'){
                period = "NCCkinSem2";
                year = yearObj.split('-')[0];
            } else if (testDateObj === 'NCCkin1Sem1'){
                period = "NCCkin1Sem1";
                year = yearObj.split('-')[0];
            } else if (testDateObj === 'NCCkin1Sem2'){
                period = "NCCkin1Sem2";
                year = yearObj.split('-')[0];
            } else if (testDateObj === 'NCCkin2Sem1'){
                period = "NCCkin2Sem1";
                year = yearObj.split('-')[0];
            } else if (testDateObj === 'NCCkin2Sem2'){
                period = "NCCkin2Sem2";
                year = yearObj.split('-')[0];
            } else if (testDateObj!==null && (testDateObj.indexOf('EOY') >-1)){
                period = "EOY";
                year = parseInt(yearObj.match(/\d+/)); //2019-2020
            } else if ((testDateObj !==null && (testDateObj == 'F4X19')) || (testDateObj !==null && (testDateObj == 'F4X20'))){
                period = "FALL";
                year = yearObj.slice(3,5);
                year = parseInt('20' + year); //(F4X19, F4X20) 2019-2020
            } else if (testDateObj !==null && (testDateObj == 'S4X20')){
                period = "SPRING";
                year = yearObj.slice(3,5);
                year = parseInt('20' + year); //S4X19 2019-2020
            } else if (testDateObj === 'NCCkin3'){
                period = "NCCkin3";
                year = yearObj.split('-')[0]; //2021-2022
            } else if (flName.indexOf("CHECK-IN%201") > -1 || flName.indexOf("CHECK%20IN%201") > -1 || flName.indexOf("CHECK_IN%201") > -1 || flName.indexOf("CHECKIN1") > -1 || flName.indexOf("CHECK-IN-1") > -1 || flName.indexOf("CHECK_IN_1") > -1){
                period = "CHECKIN1";
                year = hierarchy.SCHOOL_YEAR.substring(0,4);
            } else if (flName.indexOf("CHECK-IN-2") > -1 || flName.indexOf("CHECK-IN_2") > -1 && flName.indexOf("S2") > -1 ){
                period = "NCCkin2Sem2";
                year = hierarchy.SCHOOL_YEAR.substring(0,4);
            } else if ((flName.indexOf("CHECK-IN%203") > -1 || flName.indexOf("CHECKIN3") > -1 || flName.indexOf("CHECK-IN-3") > -1 || flName.indexOf("CHECK_IN_3") > -1 ) && flName.indexOf("S2") > -1){
                period = "NCCkin3Sem2";
                year = hierarchy.SCHOOL_YEAR.substring(0,4);
            } else if ((flName.indexOf("CHECK-IN%204") > -1  || flName.indexOf("CHECKIN4") > -1 || flName.indexOf("CHECK-IN-4") > -1 || flName.indexOf("CHECK_IN_4") > -1 ) && flName.indexOf("S2") > -1){
                period = "NCCkin4Sem2";
                year = hierarchy.SCHOOL_YEAR.substring(0,4);
            }else if (flName.indexOf("CHECK-IN%204") > -1  || flName.indexOf("CHECKIN4") > -1 || flName.indexOf("CHECK-IN-4") > -1 || flName.indexOf("CHECK_IN_4") > -1){
               period = "CHECKIN4";
               year = hierarchy.SCHOOL_YEAR.substring(0,4);
            }else if (flName.indexOf("CHECK-IN%203") > -1 || flName.indexOf("CHECKIN3") > -1 || flName.indexOf("CHECK-IN-3") > -1 || flName.indexOf("CHECK_IN_3") > -1){
               period = "CHECKIN3";
               year = hierarchy.SCHOOL_YEAR.substring(0,4);
            } else if (flName.indexOf("CHECK-IN%202") > -1 || flName.indexOf("CHECK-IN_2") > -1 || flName.indexOf("CHECKIN2") > -1 || flName.indexOf("CHECK-IN-2") > -1 || flName.indexOf("CHECK_IN_2") > -1 ){
               period = "CHECKIN2";
               year = hierarchy.SCHOOL_YEAR.substring(0,4);
            }
            else {
                period = hierarchy.REPORTING_PERIOD.toUpperCase();
                year = hierarchy.SCHOOL_YEAR.substring(0,4);
            }
            return {
                period: period,
                year: year
            }
        })();

        var adminDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var tad = _util.coalesce(row.getField("TEST_ADMIN_DATE"));
        if(tad !== null && tad !== undefined && tad !== "") {
            adminDateObject = AppUtil.getMonthFollowedByDay(tad);
        }

        	    var flName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();;
        	    var fileName =  flName.substring(flName.lastIndexOf('/')+1).replaceAll('%20','_');
                var grade = null
                    if(fileName.indexOf("GRADE%203") >-1 || fileName.indexOf("GRADE_3") >-1 || fileName.indexOf("GRADE-3") >-1 || fileName.indexOf("GRADE3") >-1  || flName.indexOf("GR_3") >-1 || flName.indexOf("RD3") >-1 || flName.indexOf("MA3") >-1 || flName.indexOf("ELA3") >-1 || flName.indexOf("CHECKIN3") >-1 || flName.indexOf("MATH_3") >-1 ||  flName.indexOf("3RD_GRADE") >-1 || flName.indexOf("MATH_3") >-1 || flName.indexOf("GR3") >-1) {
                         grade = "03";
                    } else if (fileName.indexOf("GRADE%204") >-1 || fileName.indexOf("GRADE_4") >-1  || fileName.indexOf("GRADE-4") >-1 || fileName.indexOf("GRADE4") >-1 || flName.indexOf("GR_4") >-1 || flName.indexOf("MA4") >-1 || flName.indexOf("CHECKIN4") >-1 || flName.indexOf("ELA4") >-1 || flName.indexOf("GRADE4") >-1 || flName.indexOf("GR4") >-1 || flName.indexOf("4TH_GRADE") >-1 || flName.indexOf("4TH_NC") >-1) {
                         grade = "04";
                    } else if (flName.indexOf("GRADE%205") >-1 || fileName.indexOf("GRADE_5") >-1  || fileName.indexOf("GRADE-5") >-1 || fileName.indexOf("GRADE5") >-1 || flName.indexOf("GR_5") >-1 || flName.indexOf("MA5")>-1 || flName.indexOf("SCI5")>-1 || flName.indexOf("GRADE5") >-1 || flName.indexOf("GR5") >-1 || flName.indexOf("5TH_GRADE") >-1){
                         grade = "05";
                    } else if (fileName.indexOf("GRADE%206") >-1 || fileName.indexOf("GRADE_6") >-1  || fileName.indexOf("GRADE-6") >-1 || fileName.indexOf("GRADE6") >-1 || flName.indexOf("GR_6") >-1 || flName.indexOf("MA6") >-1 || flName.indexOf("GR6") >-1 || flName.indexOf("6TH_GRADE") >-1) {
                         grade = "06";
                    } else if (fileName.indexOf("GRADE%207") >-1 || fileName.indexOf("GRADE_7") >-1  || fileName.indexOf("GRADE-7") >-1 || fileName.indexOf("GRADE7") >-1 || flName.indexOf("GR_7") >-1 || flName.indexOf("ELA7")>-1 || flName.indexOf("GR7") >-1 || flName.indexOf("7TH_GRADE") >-1) {
                         grade = "07";
                    } else if (fileName.indexOf("GRADE%208") >-1 || fileName.indexOf("GRADE_8") >-1  || fileName.indexOf("GRADE-8") >-1 || fileName.indexOf("GRADE8") >-1 || flName.indexOf("GR_8") >-1 || flName.indexOf("GR8") >-1 || flName.indexOf("RD8") >-1 || flName.indexOf("8TH_GRADE") >-1 || flName.indexOf("GRADE8") >-1) {
                         grade = "08";
                    }


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
                    record.REPORTING_PERIOD = PERIOD_INFO.period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(adminDateObject.STANDARD_DATE,getTestAdminDate(PERIOD_INFO.year, PERIOD_INFO.period));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("STUDENT_LOCAL_ID");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.trim(row.getField('STUDENT_FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.trim(row.getField('STUDENT_LAST_NAME'));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField('STUDENT_LOCAL_ID');
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField('STUDENT_LOCAL_ID');
                    break;
			    case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(grade, null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), "DISTRICT");
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

    function mapScaledScore(row, testMetadata, signature) {

        let score = {};

        let testNumber = getTestNumber(row, testMetadata, signature);
        let scaleScore = row.getField(testMetadata.FIELD);
        let percentCorrect = _util.coalesce(row.getField(testMetadata.FIELD1+"_CORRECT"), row.getField(testMetadata.FIELD2+"_CORRECT"));
        let possiblePoint = row.getField("POSSIBLE_SCORE")

        if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") && (percentCorrect === null || percentCorrect === undefined || _util.trim(percentCorrect) === "--" || _util.trim(percentCorrect) === "" || percentCorrect === "#VALUE!")) {
            return null;
        }

        score.TEST_NUMBER = testNumber;
        score.TEST_SCORE_TEXT = scaleScore;
        if (percentCorrect !== null && percentCorrect.endsWith("%")) {
          percentCorrect = percentCorrect.replace("%", '');
          score.TEST_PERCENTILE_SCORE = percentCorrect;
        } else {
        score.TEST_PERCENTILE_SCORE = percentCorrect;
        }

        if (!isNaN(scaleScore)) {
            score.TEST_SCORE_VALUE = scaleScore;
            score.TEST_SCALED_SCORE = scaleScore;
            score.TEST_ITEMS_POSSIBLE = possiblePoint;
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

         function subjectAndGradeFromSignature(signature, row){
         // For Handling the Duplicates
         var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();

         var flName =  fileName.substring(fileName.lastIndexOf('/')+1).replaceAll('%20','_');
         flName = flName.replaceAll('%23','#');
         var sub = null;
         var grade_code = null;

         if(flName.indexOf("SCIENCE") >-1){
            sub = '_SCI';
         } else if ((flName.indexOf("READING_#1") >-1) || (flName.indexOf("1READING") >-1)){
            sub = '_RD_1';
         } else if (flName.indexOf("READING_#2") >-1){
            sub = '_RD_2';
         } else if ((flName.indexOf("READING") >-1) || (flName.indexOf("RD3") >-1)  || (flName.indexOf("RD8") >-1) || ((flName.indexOf("READ") >-1))){
            sub = '_READ';
         } else if ((flName.indexOf("1_ELA") >-1) || (flName.indexOf("1_ELA") >-1)){
            sub = '_ELA_1';
         } else if ((flName.indexOf("ENGLISH") >-1) || (flName.indexOf("ELA4") >-1) || (flName.indexOf("ELA7") >-1) || (flName.indexOf("ELA3") >-1) || (flName.indexOf("ELA") >-1)){
            sub = '_ENGLISH';
         } else if ((flName.indexOf("MATH_#1") >-1) || (flName.indexOf("1_MATH") >-1) || (flName.indexOf("1_MATH_1") >-1) || (flName.indexOf("2_MATH_1") >-1) || (flName.indexOf("MATH_1") >-1) || (flName.indexOf("MATH1_CHECK") >-1)){
            sub = '_MATH_1';
         } else if ((flName.indexOf("MATH_#2") >-1) || (flName.indexOf("2_MATH") >-1)){
            sub = '_MATH_2';
         } else if ((flName.indexOf("ECOSYSTEMS") >-1) || (flName.indexOf("BIO_ECOSYSTEMS") >-1)){
            sub = '_ECO_BIO';
         } else if (flName.indexOf("EVOLUTION") >-1){
            sub = '_BIO_EVAL_GEN';
         } else if (flName.indexOf("LIVING_ORGANISMS") >-1){
            sub = '_BIO_LIV_ORGANISMS';
         } else if ((flName.indexOf("LIFE_SCI") >-1) || (flName.indexOf("LIFE_SCIENCE") >-1)){
            sub = '_LIFE_SCIENCE';
         } else if ((flName.indexOf("STRUCTURES") >-1) || (flName.indexOf("STRUCT_FUNCT") >-1) || (flName.indexOf("BIO_STRUCT_&_FUNCT") >-1)){
            sub = '_BIO_STRUCT_FUN';
         } else if ((flName.indexOf("MOLECULAR") >-1) || ((flName.indexOf("FALL_MOL_BIO")) >-1)){
            sub = '_MOL_BIO';
         } else if ((flName.indexOf("PHY_SCI") >-1) || (flName.indexOf("PHYSICAL_SCIENCE") >-1)){
            sub = '_PHY_SCI';
         } else if ((flName.indexOf("EARTH_SCI") >-1) || (flName.indexOf("EARTH_SCIENCE") >-1)){
            sub = '_EARTH_SCI';
         } else if ((flName.indexOf("NCCI_1_Math_1_Fall") >-1) || (flName.indexOf("MA") >-1) || (flName.indexOf("NCCI_1_MATH_1_FALL_&_YL") >-1) || (flName.indexOf("NCCI_1_MATH_1_SPRING") >-1) || (flName.indexOf("MATHEMATICS") >-1)){
            sub = '_MATH';
         } else {
            sub = null;
         }

         if (((flName.indexOf("GR_3")) >-1) || (flName.indexOf("RD3") >-1) || ((flName.indexOf("MA3")) >-1) || ((flName.indexOf("ELA3")) >-1) || ((flName.indexOf("CHECKIN3")) >-1) ||  ((flName.indexOf("MATH_3")) >-1) ||  ((flName.indexOf("3RD_GRADE")) >-1) || ((flName.indexOf("MATH_3")) >-1) || ((flName.indexOf("GR3")) >-1) || ((flName.indexOf("GRADE_3")) >-1) || ((flName.indexOf("MATH3")) >-1)){
            grade_code = '_03';
         } else if (flName.indexOf("1_#1") > -1){
            grade_code = '_01';
         } else if (flName.indexOf("ENGLISH_II") > -1 || flName.indexOf("ENGLISH_2") > -1 || flName.indexOf("ENGLISH2") > -1 ){
            grade_code = '_02';
         } else if (((flName.indexOf("GR_4")) >-1) || ((flName.indexOf("MA4")) >-1) || ((flName.indexOf("CHECKIN4")) >-1) || ((flName.indexOf("ELA4")) >-1) || ((flName.indexOf("GRADE4")) >-1) ||((flName.indexOf("GR4")) >-1) || ((flName.indexOf("4TH_GRADE")) >-1) || ((flName.indexOf("4TH_NC")) >-1) || ((flName.indexOf("GRADE_4")) >-1)){
            grade_code = '_04';
         } else if (((flName.indexOf("GR_5")) >-1) || ((flName.indexOf("MA5"))>-1) || ((flName.indexOf("SCI5"))>-1) || ((flName.indexOf("GRADE5")) >-1) || ((flName.indexOf("GR5")) >-1) || ((flName.indexOf("5TH_GRADE")) >-1) || ((flName.indexOf("GRADE_5")) >-1)){
            grade_code = '_05';
         } else if (((flName.indexOf("GR_6")) >-1) || ((flName.indexOf("MA6")) >-1) || ((flName.indexOf("GR6")) >-1) || ((flName.indexOf("6TH_GRADE")) >-1) || ((flName.indexOf("GRADE_6")) >-1)){
            grade_code = '_06';
         } else if (((flName.indexOf("GR_7")) >-1) || ((flName.indexOf("ELA7"))>-1) || ((flName.indexOf("GR7")) >-1) || ((flName.indexOf("7TH_GRADE")) >-1) || ((flName.indexOf("GRADE_7")) >-1)){
            grade_code = '_07';
         } else if (((flName.indexOf("GR_8")) >-1) || ((flName.indexOf("GR8")) >-1) || ((flName.indexOf("RD8")) >-1) || ((flName.indexOf("8TH_GRADE")) >-1) || ((flName.indexOf("GRADE_8")) >-1) || ((flName.indexOf("GRADE8")) >-1)){
           grade_code = '_08';
         } else if ((flName.indexOf("FALL_STRUCT_FUNCT")) >-1){
           grade_code = '_FALL_FUNCT';
         } else if ((flName.indexOf("FALL_MOL_BIO")) >-1){
           grade_code = 'FALL_MOL';
         } else if ((flName.indexOf("NCCK3_EARTH_SCIENCE")) >-1){
           grade_code = '_NCCK3_EARTH_SCI';
         } else if (((flName.indexOf("BIO_ECOSYSTEM")) >-1) || (flName.indexOf("BIO-ECOSYSTEMS")) >-1){
           grade_code = '_BIO_ECOSYSTEM';
         } else if ((flName.indexOf("NCCK")) >-1){
           grade_code = 'NCCK_BIO_MOLECULAR';
         } else if ((flName.indexOf("MOLECULAR_SUBSCORE")) >-1){
           grade_code = 'BIO_MOLECULAR_SUBSCORE';
         } else if (flName.indexOf("LIVING_ORGANISMS") >-1){
           grade_code = '_BIO_LIV';
         } else if (flName.indexOf("BIOLOGY_EVOLUTION") >-1){
           grade_code = '_BIO_EVAL';
         } else if (flName.indexOf("MATH_1") >-1  || (flName.indexOf("MATH1")) >-1){
           grade_code = '_01';
         } else if (flName.indexOf("CHS_CHECK_IN_1") >-1){
           grade_code = 'CHS_CHECK_IN_1';
         } else if (flName.indexOf("CHS_CHECK_IN_2") >-1){
           grade_code = 'CHS_CHECK_IN_2';
         }else if (flName.indexOf("EVOLUTION") >-1){
           grade_code = '_BIO_EG';
         }else if (flName.indexOf("MOLECULAR") >-1){
            grade_code = '_BIO_MOL';
         }else if (flName.indexOf("BIO_STRUCT_&_FUNCT") >-1){
            grade_code = '_BIO_SF';
         }
         else {
            grade_code = null;
         }
         return (sub + grade_code);
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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${subject}";

        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = _util.trim(assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), ""));
        });

        var std = subjectAndGradeFromSignature(signature, srcRecord)
            if(std === null || std === undefined || _util.trim(std) === "--" || _util.trim(std) === ""){
                return null;
            } else{
                assessmentAdminKey = _util.trim( assessmentAdminKey + std );
            }
        return assessmentAdminKey;
    }

    function getTestAdminDate(year, period) {
        let testAdminDate = null, testAdminDateObj = AppUtil.getEmptyDateObj();
         if (period === 'WINTER') {
             testAdminDate = '01/15/' + (parseInt(year) +1) ;
         } else if (period === 'SPRING') {
             testAdminDate = '05/15/' + (parseInt(year) + 1);
         } else if (period === 'EOY' ) {
            testAdminDate = '01/15/' + (parseInt(year) + 1);
         } else if (period === 'FALL') {
             testAdminDate = '09/15/' + parseInt(year);
         } else if (period === 'NCCkin1' ||period === 'NCCkin1Sem1' ||period === 'NCCkinSem1') {
             testAdminDate = '09/15/' + parseInt(year);
         } else if (period === 'NCCkin2' ||period === 'NCCkin1Sem2' ||period === 'NCCkinSem2') {
             testAdminDate = '03/15/' + (parseInt(year) +1);
         } else if (period === 'NCCkin2Sem1') {
             testAdminDate = '11/15/' + parseInt(year);
         } else if (period === 'NCCkin2Sem2') {
             testAdminDate = '05/31/' + (parseInt(year) +1);
         } else if (period === 'CheckIn1') {
             testAdminDate = '10/21/'+ parseInt(year);
         } else if (period === 'CheckIn4') {
            testAdminDate = '12/21/'+ parseInt(year);
         } else if (period === 'CheckIn3') {
            testAdminDate = '11/30/'+ parseInt(year);
         } else if (period === 'CheckIn2' || period === 'CHECKIN2') {
            testAdminDate = '01/28/'+ (parseInt(year) +1);
         }
         else {
             testAdminDate = '05/15/' + (parseInt(year) + 1);
         }
        testAdminDateObj = AppUtil.getDateObjByPattern(testAdminDate, "MM/dd/yyyy");
        return testAdminDateObj.STANDARD_DATE;
    }

    function getTestNumber(row, tmd, signature){
        var testNumber;
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        var flName =  fileName.substring(fileName.lastIndexOf('/')+1).replaceAll('%20','');

        if(tmd.FIELD === "SCORE" ){

        var subject = row.getField("COURSE_SUBJECT");
        if(flName.indexOf("FALLASSESSMENT1") > -1){
            var periodAssment = "FALL_A1";
        }else if(flName.indexOf("FALLASSESSMENT2") > -1){
            var periodAssment = "FALL_A2";
        }else if(flName.indexOf("SPRINGASSESSMENT1") > -1){
            var periodAssment = "SPRING_A1";
        }else if(flName.indexOf("SPRINGASSESSMENT2") > -1){
            var periodAssment = "SPRING_A2";
        }

        if(subject !== null && subject !== undefined && subject !== ""){
            testNumber = tmd.TEST + "_" + courseSubjects[subject] + "_" + periodAssment;
        }else{
            if(flName.indexOf("SCIENCE") >-1){
                 testNumber = tmd.TEST + '_' + 'SCI';
            }else if(flName.indexOf("READING") >-1){
                testNumber = tmd.TEST + '_' + 'RD';
            }else if((flName.indexOf("MATH_#1") >-1) || (flName.indexOf("1_MATH") >-1) || (flName.indexOf("MATH_1") >-1) || (flName.indexOf("MATH1") >-1)){
                testNumber = tmd.TEST + '_' + 'MA_1';
            }else if((flName.indexOf("MATH_#2") >-1) || (flName.indexOf("2_MATH") >-1) || (flName.indexOf("MATH_2") >-1) || (flName.indexOf("MATH2") >-1)){
                testNumber = tmd.TEST + '_' + 'MA_2';
            }else if((flName.indexOf("MATH_#3") >-1) || (flName.indexOf("3_MATH") >-1) || (flName.indexOf("MATH_3") >-1) || (flName.indexOf("MATH3") >-1)){
                testNumber = tmd.TEST + '_' + 'MA_3';
            }else if(flName.indexOf("MATH") >-1){
                testNumber = tmd.TEST + '_' + 'MA';
            } else if ((flName.indexOf("ENGLISH2") >-1) || (flName.indexOf("ENGLISH_2") >-1)){
                testNumber = tmd.TEST + '_' + 'ENG_2';
            }else if(flName.indexOf("ENGLISH") >-1){
                 testNumber = tmd.TEST + '_' + 'ELA';
            }else if(flName.indexOf("ECOSYSTEMS") >-1){
                testNumber = tmd.TEST + '_' + 'ECO_BIO';
            }else if(flName.indexOf("EVOLUTION") >-1){
                testNumber = tmd.TEST + '_' + 'BIO_EVAL_GEN';
            }else if(flName.indexOf("STRUCTURES") >-1){
                testNumber = tmd.TEST + '_' + 'BIO_STRUCT_FUN';
            }else if (flName.indexOf("MOLECULAR") >-1){
                testNumber = tmd.TEST + '_' + 'MOL_BIO';
            }else if (flName.indexOf("BIOLOGY") >-1){
                testNumber = tmd.TEST + '_' + 'BIO';
            }
            return testNumber;
        }
        }
        else{
            return  tmd.TEST + '_' + tmd.CODE;
        }

        return testNumber;

}
    return module;
}());