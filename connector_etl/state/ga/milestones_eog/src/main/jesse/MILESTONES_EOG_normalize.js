var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "Milestones_EOG";
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
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
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
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
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
        { TEST: "GA_MIL", CODE: "ELA", FIELD: "_ELA", MAP_FUNCTION: mapScaledScore }
        , { TEST: "GA_MIL", CODE: "MATH", FIELD: "_MATH", MAP_FUNCTION: mapScaledScore }
        , { TEST: "GA_MIL", CODE: "SCI", FIELD: "_SCI", MAP_FUNCTION: mapScaledScore }
        , { TEST: "GA_MIL", CODE: "SS", FIELD: "_SOC", MAP_FUNCTION: mapScaledScore }
        , { TEST: "GA_MIL", CODE: "PHY_SCI", FIELD: "_PHY_SCI", MAP_FUNCTION: mapScaledScore }

        , { TEST: "GA_MIL", CODE: "RD_VOC", FIELD: "READING_AND_VOCABULARY", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "KEY_IDEAS", FIELD: "KEY_IDEAS_AND_DETAILS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "CR_STR_IN_KW_IDEAS", FIELD: "CRAFT_AND_STRUCTURE_INTEGRATION_OF_KNOWLEDGE_AND_IDEAS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "VOC_ACQ_USE", FIELD: "VOCABULARY_ACQUISITION_AND_USE", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "RD_LIT_TXT", FIELD: "READING_LITERARY_TEXT", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "RD_INF_TXT", FIELD: "READING_INFORMATIONAL_TEXT", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "WR_LNG", FIELD: "WRITING_AND_LANGUAGE", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "LNG", FIELD: "LANGUAGE", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "NUM_EXPN_EQN", FIELD: "NUMBERS_EXPRESSIONS_AND_EQUATIONS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "ALG_FUNC", FIELD: "ALGEBRA_AND_FUNCTIONS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "GEOM", FIELD: "GEOMETRY", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "STCS_PROB", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "MTR", FIELD: "MATTER", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "ERG", FIELD: "ENERGY", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "MTN", FIELD: "MOTION", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "WVS", FIELD: "WAVES", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "FRC", FIELD: "FORCE", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "CHEM_ATM_NR_TR_PRD_TBL", FIELD: "CHEMISTRY_ATOMIC_AND_NUCLEAR_THEORY_AND_THE_PERIODIC_TABLE", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "CHEM_CML_RN_PRTS_MTR", FIELD: "CHEMISTRY_CHEMICAL_REACTIONS_AND_PROPERTIES_OF_MATTER", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "PHY_ERG_FRC_MTN", FIELD: "PHYSICS_ENERGY_FORCE_AND_MOTION", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "PHY_WVS_ELEC_MGNSM", FIELD: "PHYSICS_WAVES_ELECTRICITY_AND_MAGNETISM", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "HIS", FIELD: "HISTORY", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "GEOG", FIELD: "GEOGRAPHY", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "GOVT_CVS", FIELD: "GOVERNMENT_CIVICS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "ECON", FIELD: "ECONOMICS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "OPS_ALG_TKG", FIELD: "OPERATIONS_AND_ALGEBRAIC_THINKING", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "NUM_OPS", FIELD: "NUMBER_AND_OPERATIONS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "MES_DATA", FIELD: "MEASUREMENT_AND_DATA", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "NUM_OPS_BASE_10", FIELD: "NUMBER_AND_OPERATIONS_IN_BASE_10", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "NUM_OPS_FRS", FIELD: "NUMBER_AND_OPERATIONS_FRACTIONS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "RAT_PROP_RESPS", FIELD: "RATIOS_AND_PROPORTIONAL_RELATIONSHIPS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "NUM_SYS", FIELD: "THE_NUMBER_SYSTEM", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "EXP_EQUAS", FIELD: "EXPRESSIONS_AND_EQUATIONS", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "EARTH_SCI", FIELD: "EARTH_SCIENCE", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "PHY_SCI_DOM", FIELD: "PHYSICAL_SCIENCE", MAP_FUNCTION: mapDomainMasteryScore }
        , { TEST: "GA_MIL", CODE: "LIFE_SCI", FIELD: "LIFE_SCIENCE", MAP_FUNCTION: mapDomainMasteryScore }

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
  var gradeDecode = {
        "0": "KG",
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
        "13": "13",
        "Grade 13": "13",
        "-9": "ALT",
        "-6": "ALT",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
        , "": null
        , null: null
    };


    var contentAreaDecode = {
        "01": "9_LIT_COMP"
        , "02": "A_LIT_COMP"
        , "03": "CORD_ALG"
        , "04": "ANA_GEOM"
        , "05": "BIO"
        , "06": "PS"
        , "07": "US_HIS"
        , "08": "ECON_BUS_FE"
        , "09": "ALG_1"
        , "10": "GEOM"
    };

    var achievLevelDecode = {
        "1": "Beginning Learner"
        , "2": "Developing Learner"
        , "3": "Proficient Learner"
        , "4": "Distinguished Learner"
        , "": "No Score"
        , null: "No Score"
    };

    var achievLevelPassingDecode = {
        "1": "No"
        , "2": "No"
        , "3": "Yes"
        , "4": "Yes"
        , "": null
        , null: null
    };

    var readStatusDecode = {
        "1": "Below Grade Level"
        , "2": "Grade Level or Above"
        ,"Grade Level or Above" : "1"
        ,"Below Grade Level" : "2"
        , "9": "Too few points to report"
        , "": null
        , null: null
    };

    var traitDecode = {
        "": null
        , null: null
        , "A": null
        , "B": "Copied"
        , "C": "Too limited to score"
        , "D": "Non English/Foreign Language"
        , "E": "Off Topic"
        , "F": "Offensive"
        , "G": "Illegible/Incomprehensible"
    };

    var masteryCategoryDecode = {
        "1": "Remediate Learning"
        , "2": "Monitor Learning"
        , "3": "Accelerate Learning"
        , "Accelerate Learning": "3"
        , "Monitor Learning": "2"
        , "Remediate Learning": "1"
        , "9": "Too few points to report"
        , "": null
        , null: null
    };


    var stretchBandDecode = {
        "1": "Below the Stretch Band"
        , "2": "Within the Stretch Band"
        , "3": "Above the Stretch Band"
        , "": null
        , null: null
    };

var months = {
        "JAN": "01",
        "FEB": "02",
        "MAR":  "03",
        "APR":  "04",
        "MAY":  "05",
        "JUN":  "06",
        "JUL":  "07",
        "AUG":  "08",
        "SEP":  "09",
        "OCT":  "10",
        "NOV":  "11",
        "DEC":  "12"
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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function (testMetadata) {
            try {
                //component
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                //claims strands
                for (var i = 1; i <= 9; i++) {
                    var masteryClaim = mapClaimScore(row, testMetadata, i,signature);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, masteryClaim);
                }
                //writing strands
                if(testMetadata.CODE === "ELA"){
                var trait1 = mapWritingScore(row, testMetadata, "EXTWRT1",signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, trait1);
                var trait2 = mapWritingScore(row, testMetadata, "EXTWRT2",signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, trait2);
                var narrative = mapWritingScore(row, testMetadata, "NARRWRT",signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, narrative);
                }
            } catch (exception) {
                print(e);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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
        var signatureFormatName = signature.getFormat().getFormatName();
        var month = row.getField("STUDOBMONTH_RPT");
        var day = row.getField("STUDOBDAY_RPT");
        var testdate= row.getField("TESTDATE");
        if(signatureFormatName !== "AUTOMATION_70_1_COLS" && signatureFormatName !== "GA_ASSM_RESULTS"){
        if(month !== null && day !== null){
           if(month.length === 1){
                month = "0"+ month
           }
           if(day.length === 1){
                    day = "0"+ day
           }
        }
        if(testdate.length === 5){
        testdate = "0"+ testdate
        }else{
        testdate = testdate
        }
        var testAdminDate = AppUtil.getDateObjByPattern(testdate, "MMddyy").STANDARD_DATE;

        if (row.getField("STUDOBDAY_RPT")) {
            if(signatureFormatName === "EOG_21_22"){
                var birthDateString = row.getField("STUDOBYEAR_RPT") + "-" + month + "-" + day
            }
            else{
                 var birthDateString = row.getField("STUDOBYEAR_RPT") + "-" + row.getField("STUDOBMONTH_RPT") + "-" + row.getField("STUDOBDAY_RPT")
            }
        }
        }

        if(signatureFormatName === "AUTOMATION_70_1_COLS")
         {
            var FullName = row.getField("STUDENT_NAME");

            if(FullName !== undefined && FullName !== null && FullName !== ""){
                if(FullName.indexOf(",") > -1) {
                    var LastName = FullName.split(",")[0].trim()
                if(FullName.split(",")[1].trim().indexOf(" ") > -1){
                    var FirstName = FullName.split(",")[1].trim().split(" ")[0].trim()
                    var MiddleName = FullName.split(",")[1].trim().split(" ")[1].trim()
                    }
                    else{
                        var FirstName = FullName.split(",")[1].trim()
                        }
                    }
                else if(FullName.indexOf(' ') > -1) {
                var LastName = FullName.split(" ")[0].trim()
                var FirstName = FullName.split(" ")[1].trim()
                    }
                else {
                var LastName = FullName
                }
               }
         }
        var birthDate =  _util.coalesce(row.getField("STUDOB_RPT"),row.getField("STUDENT_DOB"));
        if (row.getField("STUDOB_RPT") !== null) {
            birthDateString = row.getField("STUDOB_RPT");
        } else if(row.getField("STUDENT_DOB") !== null) {
            birthDateString = row.getField("STUDENT_DOB");
        }

        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        birthDateObject = AppUtil.getMonthFollowedByDay(birthDateString);
        var accomodationYesNo = "No";
        if (row.getField("AccomIEP_COLLECTED_ELA") == 1 || row.getField("AccomELTPC_COLLECTED_ELA") == 1 || row.getField("Accom504IAP_COLLECTED_ELA") == 1 ||
            row.getField("AccomST_COLLECTED_ELA") == 1 || row.getField("AccomPRS_COLLECTED_ELA") == 1 || row.getField("AccomRSP_COLLECTED_ELA") == 1 ||
            row.getField("AccomSCH_COLLECTED_ELA") == 1 ||
            // MATH
            row.getField("AccomIEP_COLLECTED_MATH") == 1 || row.getField("AccomELTPC_COLLECTED_MATH") == 1 || row.getField("Accom504IAP_COLLECTED_MATH") == 1 ||
            row.getField("AccomST_COLLECTED_MATH") == 1 || row.getField("AccomPRS_COLLECTED_MATH") == 1 || row.getField("AccomRSP_COLLECTED_MATH") == 1 ||
            row.getField("AccomSCH_COLLECTED_MATH") == 1 ||
            // SCIENCE
            row.getField("AccomIEP_COLLECTED_SCI") == 1 || row.getField("AccomELTPC_COLLECTED_SCI") == 1 || row.getField("Accom504IAP_COLLECTED_SCI") == 1 ||
            row.getField("AccomST_COLLECTED_SCI") == 1 || row.getField("AccomPRS_COLLECTED_SCI") == 1 || row.getField("AccomRSP_COLLECTED_SCI") == 1 ||
            row.getField("AccomSCH_COLLECTED_SCI") == 1 ||
            // SOCIAL STUDIES
            row.getField("AccomIEP_COLLECTED_SOC") == 1 || row.getField("AccomELTPC_COLLECTED_SOC") == 1 || row.getField("Accom504IAP_COLLECTED_SOC") == 1 ||
            row.getField("AccomST_COLLECTED_SOC") == 1 || row.getField("AccomPRS_COLLECTED_SOC") == 1 || row.getField("AccomRSP_COLLECTED_SOC") == 1 ||
            row.getField("AccomSCH_COLLECTED_SOC") == 1
        ) {
            accomodationYesNo = "Yes";
        }
        let assessmentPeriod = ((admin) => {
            if (admin && admin.toUpperCase().indexOf("SPRING") > -1) {
                return 'SPRING';
            } else if (admin && admin.toUpperCase().indexOf("WINTER") > -1) {
                return 'WINTER';
            } else if (admin && admin.toUpperCase().indexOf("SUMMER") > -1) {
                return 'SUMMER';
            } else {
                return 'ALL';
            }
        })(row.getField("TESTADMIN"));
        var onlineYesNo = "No";
        if (row.getField("Audio_ELA") == 1 || row.getField("AudioPassages_ELA") == 1 || row.getField("HumanReader_ELA") == 1 ||
            row.getField("ColorChooser_ELA") == 1 || row.getField("ContrastingColor_ELA") == 1 || row.getField("Masking_ELA") == 1 ||
            // MATH
            row.getField("Audio_MATH") == 1 || row.getField("AudioPassages_MATH") == 1 || row.getField("HumanReader_MATH") == 1 ||
            row.getField("ColorChooser_MATH") == 1 || row.getField("ContrastingColor_MATH") == 1 || row.getField("Masking_MATH") == 1 ||
            // SCIENCE
            row.getField("Audio_SCI") == 1 || row.getField("AudioPassages_SCI") == 1 || row.getField("HumanReader_SCI") == 1 ||
            row.getField("ColorChooser_SCI") == 1 || row.getField("ContrastingColor_SCI") == 1 || row.getField("Masking_SCI") == 1 ||
            // SOCIAL STUDIES
            row.getField("Audio_SOC") == 1 || row.getField("AudioPassages_SOC") == 1 || row.getField("HumanReader_SOC") == 1 ||
            row.getField("ColorChooser_SOC") == 1 || row.getField("ContrastingColor_SOC") == 1 || row.getField("Masking_SOC") == 1
        ) {
            onlineYesNo = "Yes";
        }



        try {
            normalizedFileFields.forEach(function (field) {
                switch (field) {
                    case "ASSESSMENT_ADMIN_KEY":
                        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                        break;
                    case "SYS_PARTITION_VALUE":
                        record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                        break;
                    case "DISTRICT_CODE":
                        record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                        break;
                    case "SCHOOL_YEAR":
                        record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                        break;
                    case "REPORTING_PERIOD":
                        record.REPORTING_PERIOD = _util.coalesce(assessmentPeriod, hierarchy.REPORTING_PERIOD);
                        break;
                    case "ASSESSMENT_VENDOR":
                        record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                        break;
                    case "ASSESSMENT_PRODUCT":
                        record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                        break;
                    case "TEST_ADMIN_DATE":
                        record.TEST_ADMIN_DATE = _util.coalesce(testAdminDate,getTestAdminDate(row, hierarchy),"05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9));
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
                    case "SCHOOL_VENDOR_ID":
                        record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHCODE_RPT"), row.getField("SCHNAME_RPT"),"DISTRICT");
                        break;
                    case "SCHOOL_LOCAL_ID":
                        record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHCODE_RPT"));
                        break;
                    case "SCHOOL_NAME":
                        record.SCHOOL_NAME = _util.coalesce(row.getField("SCHNAME_RPT"));
                        break;
                    case "STUDENT_STATE_ID":
                        //Required for student matching.  Tracks new keys to match.
                        record.STUDENT_STATE_ID = _util.coalesce(row.getField("GTID_RPT"), row.getField("STATE_STUDENT_ID"));
                        break;
                    case "STUDENT_LOCAL_ID":
                        record.STUDENT_LOCAL_ID =  _util.coalesce(row.getField("STUDENT_VENDOR_ID"),row.getField("GTID_RPT"));
                        break;
                    case "STUDENT_VENDOR_ID":
                        record.STUDENT_VENDOR_ID =  _util.coalesce(row.getField("STUDENT_VENDOR_ID"),row.getField("GTID_RPT"), row.getField("STATE_STUDENT_ID"));
                        break;
                    case "STUDENT_FIRST_NAME":
                        record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUFIRSTNAME_RPT"),FirstName,null);
                        break;
                    case "STUDENT_MIDDLE_NAME":
                        record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("STUMIDINITIAL_RPT"),MiddleName,null);
                        break;
                    case "STUDENT_LAST_NAME":
                        record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STULASTNAME_RPT"),LastName,null);
                        break;
                    case "STUDENT_GENDER_CODE":
                        record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUGENDER_RPT"),null);
                        break;
                    case "STUDENT_GRADE_CODE":
                        record.STUDENT_GRADE_CODE = _util.coalesce(row.getField("STUGRADE_RPT"), row.getField("TESTEDGRADE_RPT"), row.getField("GISGRADE_RPT") ,gradeDecode[row.getField("STUDENT_GRADE")]);
                        break;
                    case "TEST_INTERVENTION_DESC":
                        record.TEST_INTERVENTION_DESC = _util.coalesce(accomodationYesNo,null);
                        break;
                    case "TEST_INTERVENTION_DESC_2":
                        record.TEST_INTERVENTION_DESC_2 = _util.coalesce(onlineYesNo,null);
                        break;
                    case "TEST_REPORTING_DATE":
                        record.TEST_REPORTING_DATE = "01/01/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
                        break;

                    default:
                        record[field] = row.getField(field);
                        break;
                }
            });
        }
        catch (e) {
            print(e);
        }

        return record;
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param row A JSON object containing row values being processed
     * @returns {{}}
     */
    function mapAdditionalAdminFields(admin, row) {
        admin["COURSE_CODE"] = _util.coalesce(row.getField("COURSENUM_PREID"));
        admin["COURSE_SECTION"] = _util.coalesce(row.getField("COURSESEC_PREID"));
        return admin;
    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata,signature) {
        try {

            var score = {};
            if(signature.getFormat().getFormatName() === "AUTOMATION_70_1_COLS"){
            var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
            }else{
            testNumber = generateTestNumber(row, testMetadata);
            }
            var scaleScore = row.getField("SS" + testMetadata.FIELD);

            var achievLevel = row.getField("ACHLEVEL" + testMetadata.FIELD);
            var achievLevelDesc = row.getField("ACHIEVEMENT_LEVEL_DESCRIPTION" + testMetadata.FIELD);

            var sem = row.getField("CONDSEM" + testMetadata.FIELD);

            // Lexile Range - Lexile Low 100 less then Lexile.  Lexile high is 50 more than Lexile
            if(testMetadata.CODE === "ELA"){
                var lexile = row.getField("LEXILEL");
                var readStatus = row.getField("READINGSTATUS");
            }

            var lexLowerBound = row.getField("LEXILELOW");
            var lexUpperBound = row.getField("LEXILEHIGH");

            var trait1Score = row.getField("EXTWRT1SCORE");
            var trait1CondCode = row.getField("EXTWRT1CONDCODE");

            var trait2Score = row.getField("EXTWRT2SCORE");
            var trait2CondCode = row.getField("EXTWRT2CONDCODE");

            var narrativeScore = row.getField("NARRWRTSCORE");
            var narrativeCondCode = row.getField("NARRWRTCONDCODE");


            var nationalPercentile = row.getField("NRT_NP" + testMetadata.FIELD);

            var nationalPercentileLow = row.getField("NRT_NPRANGE" + testMetadata.FIELD) === null ? null : row.getField("NRT_NPRANGE" + testMetadata.FIELD).split("-")[0];
            var nationalPercentileHigh = row.getField("NRT_NPRANGE" + testMetadata.FIELD) === null ? null : row.getField("NRT_NPRANGE" + testMetadata.FIELD).split("-")[1];


            var nce = row.getField("NRT_NCE" + testMetadata.FIELD);

            var stretchBandCode = row.getField("STRETCHBAND");
           if(signature.getFormat().getFormatName() !== "AUTOMATION_70_1_COLS"){
           if(isNaN(nationalPercentileHigh)){
                nationalPercentileHigh = nationalPercentileHigh.toUpperCase();
                nationalPercentileHigh = parseInt(months[nationalPercentileHigh]);
                  if(nationalPercentileLow !== null){
                       if(nationalPercentileLow.length === 1){
                       nationalPercentileLow = "0" + nationalPercentileLow
                       }
                       else{
                       nationalPercentileLow = nationalPercentileLow
                       }
                  }
                if(nationalPercentileLow>nationalPercentileHigh){
                       nationalPercentileLow = nationalPercentileLow - nationalPercentileHigh;
                       nationalPercentileHigh = nationalPercentileLow + nationalPercentileHigh;
                       nationalPercentileLow = nationalPercentileHigh - nationalPercentileLow;
                }
            }
        }
            // Check for key fields and do not map score and exit if conditions met.
            if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === " ") &&
              (achievLevel === null || achievLevel === undefined || _util.trim(achievLevel) === "--" || _util.trim(achievLevel) === "" || achievLevel === "0" || achievLevel === " ")) {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_PASSED_INDICATOR"] = achievLevelPassingDecode[achievLevel];

            score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
            if(signature.getFormat().getFormatName() === "AUTOMATION_70_1_COLS"){
             score["TEST_PRIMARY_RESULT"] = achievLevelDesc;
            }else{
            score["TEST_PRIMARY_RESULT"] = achievLevelDecode[achievLevel];
            }

            score["TEST_STANDARD_ERROR"] = sem;
            score["TEST_READING_LEVEL"] = lexile;
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = lexLowerBound + "-" + lexUpperBound;

            score["TEST_SECONDARY_RESULT_CODE"] = readStatus;
            score["TEST_SECONDARY_RESULT"] = readStatusDecode[readStatus];

            score["TEST_TERTIARY_RESULT_CODE"] = stretchBandCode;
            score["TEST_TERTIARY_RESULT"] = stretchBandDecode[stretchBandCode];

            score["TEST_QUATERNARY_RESULT_CODE"] = trait2Score;
            score["TEST_QUATERNARY_RESULT"] = traitDecode[trait2CondCode];

            score["TEST_CUSTOM_RESULT_CODE"] = narrativeScore;
            score["TEST_CUSTOM_RESULT"] = traitDecode[narrativeCondCode];

            score["TEST_PERCENTILE_SCORE"] = nationalPercentile;

            if(!isNaN(nationalPercentileLow)){
            score["TEST_LOWER_BOUND"] = nationalPercentileLow;
            }
            if(!isNaN(nationalPercentileHigh)){
            score["TEST_UPPER_BOUND"] = nationalPercentileHigh;
            }

            score["TEST_NCE_SCORE"] = nce;
            return score;
        }
        catch (e) {
            print(e);
        }
    }

    function mapClaimScore(row, testMetadata, masteryClaimNumber,signature) {
        try {
            var score = {};

            var testNumber = generateTestNumber(row, testMetadata) + "_M" + masteryClaimNumber;
            var masterCategory = row.getField("MASTERYCATEGORYDOM" + masteryClaimNumber + testMetadata.FIELD);

            // Check for key fields and do not map score and exit if conditions met.
            if (masterCategory === null || masterCategory === undefined || _util.trim(masterCategory) === "--" || _util.trim(masterCategory) === "") {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_PRIMARY_RESULT_CODE"] = masterCategory;
            score["TEST_PRIMARY_RESULT"] = masteryCategoryDecode[masterCategory];
            return score;
        }
        catch (e) {
            print(e);
        }
    }


    function mapWritingScore(row, testMetadata, fileFieldPrefix,signature) {
        try {
            var score = {};

            var testNumber = generateTestNumber(row, testMetadata) + "_" + fileFieldPrefix;
            var writingScore = row.getField(fileFieldPrefix + "SCORE");
            var writingCondCode = row.getField(fileFieldPrefix + "CONDCODE");

            // Check for key fields and do not map score and exit if conditions met.
            if (writingScore === null || writingScore === undefined || _util.trim(writingScore) === "--" || _util.trim(writingScore) === "") {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCALED_SCORE"] = writingScore;
            score["TEST_PRIMARY_RESULT_CODE"] = writingCondCode;
            score["TEST_PRIMARY_RESULT"] = traitDecode[writingCondCode];
            return score;
        }
        catch (e) {
            print(e);
        }
    }

     function mapDomainMasteryScore(row, testMetadata,signature) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
            var domainMastery = row.getField(testMetadata.FIELD + "_DOMAIN_MASTERY");


            // Check for key fields and do not map score and exit if conditions met.
            if (domainMastery === null || domainMastery === undefined || _util.trim(domainMastery) === "--" || _util.trim(domainMastery) === "" || domainMastery === " ") {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_PRIMARY_RESULT_CODE"] = masteryCategoryDecode[domainMastery];
            score["TEST_PRIMARY_RESULT"] = domainMastery;
            return score;
        }
        catch (e) {
            print(e);
        }
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
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        return assessmentAdminKey;
    }


    function getTestAdminDate(row, hierarchy) {

            var testDate = {
                RAW_DATE : null
               , MONTH : null
               , DAY : null
               , YEAR : null
               , STANDARD_DATE : null
           };
           try {

                var testDate1 = row.getField("ELA_TEST_DATE");
                var testDate2 = row.getField("MATH_TEST_DATE");
                var testDate3 = row.getField("SCIENCE_TEST_DATE");
                var testDate4 = row.getField("SOCIAL_STUDIES_TEST_DATE");
                var testDate5 = row.getField("HS_PHYSICAL_SCIENCE_TEST_DATE");

                var dates = [];
                if(testDate1 !== null && testDate1 !== " " && testDate1 !== undefined){
                    testDate1 = testDate1.substring(0,10);
                    dates.push(new Date(testDate1 + "Z"));
                }
                if(testDate2 !== null && testDate2 !== " " && testDate2 !== undefined){
                    testDate2 = testDate2.substring(0,10);
                    dates.push(new Date(testDate2 + "Z"));
                }

                if(testDate3 !== null && testDate3 !== " " && testDate3 !== undefined){
                    testDate3 = testDate3.substring(0,10);
                    dates.push(new Date(testDate3 +"Z"));
                }

                if(testDate4 !== null && testDate4 !== " " && testDate4 !== undefined){
                    testDate4 = testDate4.substring(0,10);
                    dates.push(new Date(testDate4 +"Z"));
                }

               if(testDate5 !== null && testDate5 !== " " && testDate5 !== undefined){
                    testDate5 = testDate5.substring(0,10);
                    dates.push(new Date(testDate5 +"Z"));
                }
                if(dates.length == 0 ) {
                     testDate = AppUtil.getMonthFollowedByDay("05/15/" + hierarchy.SCHOOL_YEAR).STANDARD_DATE;
                     return testDate;
                 }
                  var maximumDate=new Date(Math.max.apply(null, dates));

                var isoD = maximumDate.toISOString();

                var format = (isoD.substring(0,10));
                testDate = parseDate(format).STANDARD_DATE;
                }
                catch (e) {
                // ignore expected range errors
                if (e.name !== 'RangeError') {
                    print(e);
                }
            }
       return testDate;

        }


        function parseDate(rawDate) {

                var dateObj = {
                    RAW_DATE : rawDate
                    , MONTH : null
                    , DAY : null
                    , YEAR : null//2018-03-07
                    , STANDARD_DATE : null
                };

                // Exit if no value is provided.
                if(_util.trim(_util.coalesce(rawDate, "")) === "") {
                    return dateObj;
                }

                var format;

                if (rawDate.indexOf('/') > -1) {
                    if (rawDate.split('/')[0].length === 4) {
                            format = 'yyyy/MM/dd';
                    } else if(rawDate.length() === 10){
                        format = 'MM/dd/yyyy';
                    } else {
                        format = 'M/dd/yyyy';
                    }
                } else if (rawDate.indexOf('-') > -1) {
                    if (rawDate.split('-')[0].length === 4) {
                            format = 'yyyy-MM-dd';
                    } else if(rawDate.length() === 10){
                        format = 'MM-dd-yyyy';
                    } else {
                        format = 'M-dd-yyyy';
                    }
                }

                var formatter = new java.text.SimpleDateFormat(format);
                var javaDate = formatter.parse(rawDate);

                var calendar = java.util.Calendar.getInstance();
                calendar.setTime(javaDate);

                var year = calendar.get(java.util.Calendar.YEAR);
                var month = AppUtil.formatNumber(calendar.get(java.util.Calendar.MONTH) + 1);
                var day = AppUtil.formatNumber(calendar.get(java.util.Calendar.DAY_OF_MONTH));
                var standardDate = month + "/" + day + "/" + year;
                dateObj.MONTH = month;
                dateObj.DAY = day;
                dateObj.YEAR = year;
                dateObj.STANDARD_DATE = standardDate;

                return dateObj;
            }

     function generateTestNumber(row, testMetadata) {

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

        if (testMetadata.CODE === "ELA" && row.getField("EXTWRTGENRE") !== null) {
            testNumber = testNumber + row.getField("EXTWRTGENRE");
        }

        return testNumber;

       }

    return module;


}());
