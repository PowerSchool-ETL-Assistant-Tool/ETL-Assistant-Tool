var AppNormalize = (function() {
    let module = {};
    const _thisModuleName = "AppNormalize";
    const _assessmentIdentifier = "CHECK_INS_v2";
    const  _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    const multipleRowsPerGroupingExpected = false;

    /** Java classes **/
    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
    const BufferedReader = Java.type("java.io.BufferedReader");
    const InputStreamReader = Java.type('java.io.InputStreamReader');
    const CSVWriter = Java.type("com.opencsv.CSVWriter");
    const FileWriter = Java.type("java.io.FileWriter");
    const File = Java.type("java.io.File");

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
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

     //TODO update scoresToMap
    const scoresToMap = [
        //Raw Scores
        {TEST: "CHECK_INS_V2", CODE:"", FIELD: "ITEMS_", MAP_FUNCTION: mapRawScore}

        //Domain Scores ex. CHECK_INS_V2_DOM_NUMOP
        ,{TEST: "CHECK_INS_V2", CODE:"DOM", FIELD: "DOM1", MAP_FUNCTION: mapDomainScore}
        ,{TEST: "CHECK_INS_V2", CODE:"DOM", FIELD: "DOM2", MAP_FUNCTION: mapDomainScore}
        ,{TEST: "CHECK_INS_V2", CODE:"DOM", FIELD: "DOM3", MAP_FUNCTION: mapDomainScore}
        ,{TEST: "CHECK_INS_V2", CODE:"DOM", FIELD: "DOM4", MAP_FUNCTION: mapDomainScore}
        ,{TEST: "CHECK_INS_V2", CODE:"DOM", FIELD: "DOM5", MAP_FUNCTION: mapDomainScore}

        //Standard Scores ex. CHECK_INS_V2_STD1
        ,{TEST: "CHECK_INS_V2", CODE:"STD1", FIELD: "STD1", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD2", FIELD: "STD2", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD3", FIELD: "STD3", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD4", FIELD: "STD4", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD5", FIELD: "STD5", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD6", FIELD: "STD6", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD7", FIELD: "STD7", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD8", FIELD: "STD8", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD9", FIELD: "STD9", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD10", FIELD: "STD10", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD11", FIELD: "STD11", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD12", FIELD: "STD12", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD13", FIELD: "STD13", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD14", FIELD: "STD14", MAP_FUNCTION: mapStandardScore}
        ,{TEST: "CHECK_INS_V2", CODE:"STD15", FIELD: "STD15", MAP_FUNCTION: mapStandardScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    const gradeDecode = {
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
       ,"" : null
       ,null : null
    };

    const primaryDecode = {
       "Adv" : "Advanced"
       , "Advanced" : "Advanced"
       ,"Bas" : "Basic"
       ,"Basic" : "Basic"
       ,"Bel" : "Below Basic"
       ,"Below Basic" : "Below Basic"
       ,"Pro" : "Proficient"
       ,"Proficient" : "Proficient"
       ,"" : null
       ,null : null
      };

    const passDecode = {
       "Adv" : "Yes"
       ,"Advanced" : "Yes"
       ,"Bas" : "No"
       ,"Basic" : "No"
       ,"Bel" : "No"
       ,"Below Basic" : "No"
       ,"Pro" : "Yes"
       ,"Proficient" : "Yes"
       ,"" : null
       ,null : null
      };

	const ntpDecode = {
     "NCCI 2.0 Biology - Ecosystems - Fall" : "BECF",
     "NCCI 2.0 Biology - Evolution - Fall" : "BEVF",
     "NCCI 2.0 Biology - Molecular - Fall" : "BMOF",
     "NCCI 2.0 Biology - Structure - Fall" : "BSTF",
     "NCCI 2.0 English II - Interim 1 - Fall" : "E2AF",
     "NCCI 2.0 English II - Interim 2 - Fall" : "E2BF",
     "NCCI 2.0 Mathematics Grade 3 - Test A" : "M3IA",
     "NCCI 2.0 Mathematics Grade 3 - Test B" : "M3IB",
     "NCCI 2.0 Mathematics Grade 3 - Test C" : "M3IC",
     "NCCI 2.0 Mathematics Grade 4 - Test A" : "M4IA",
     "NCCI 2.0 Mathematics Grade 4 - Test B" : "M4IB",
     "NCCI 2.0 Mathematics Grade 4 - Test C" : "M4IC",
     "NCCI 2.0 Mathematics Grade 5 - Test A" : "M5IA",
     "NCCI 2.0 Mathematics Grade 5 - Test B" : "M5IB",
     "NCCI 2.0 Mathematics Grade 5 - Test C" : "M5IC",
     "NCCI 2.0 Mathematics Grade 6 - Test A" : "M6IA",
     "NCCI 2.0 Mathematics Grade 6 - Test B" : "M6IB",
     "NCCI 2.0 Mathematics Grade 6 - Test C" : "M6IC",
     "NCCI 2.0 Mathematics Grade 7 - Test A" : "M7IA",
     "NCCI 2.0 Mathematics Grade 7 - Test B" : "M7IB",
     "NCCI 2.0 Mathematics Grade 7 - Test C" : "M7IC",
     "NCCI 2.0 Mathematics Grade 8 - Test A" : "M8IA",
     "NCCI 2.0 Mathematics Grade 8 - Test B" : "M8IB",
     "NCCI 2.0 Mathematics Grade 8 - Test C" : "M8IC",
     "NCCI 2.0 NC Math 1 - Interim 1 - Fall" : "MIAF",
     "NCCI 2.0 NC Math 1 - Interim 2 - Fall" : "MIBF",
     "NCCI 2.0 NC Math 3 - Interim 1 - Fall" : "MTAF",
     "NCCI 2.0 NC Math 3 - Interim 2 - Fall" : "MTBF",
     "NCCI 2.0 Reading Grade 3 - Test A" : "R3IA",
     "NCCI 2.0 Reading Grade 3 - Test B" : "R3IB",
     "NCCI 2.0 Reading Grade 3 - Test C" : "R3IC",
     "NCCI 2.0 Reading Grade 4 - Test A" : "R4IA",
     "NCCI 2.0 Reading Grade 4 - Test B" : "R4IB",
     "NCCI 2.0 Reading Grade 4 - Test C" : "R4IC",
     "NCCI 2.0 Reading Grade 5 - Test A" : "R5IA",
     "NCCI 2.0 Reading Grade 5 - Test B" : "R5IB",
     "NCCI 2.0 Reading Grade 5 - Test C" : "R5IC",
     "NCCI 2.0 Reading Grade 6 - Test A" : "R6IA",
     "NCCI 2.0 Reading Grade 6 - Test B" : "R6IB",
     "NCCI 2.0 Reading Grade 6 - Test C" : "R6IC",
     "NCCI 2.0 Reading Grade 7 - Test A" : "R7IA",
     "NCCI 2.0 Reading Grade 7 - Test B" : "R7IB",
     "NCCI 2.0 Reading Grade 7 - Test C" : "R7IC",
     "NCCI 2.0 Reading Grade 8 - Test A" : "R8IA",
     "NCCI 2.0 Reading Grade 8 - Test B" : "R8IB",
     "NCCI 2.0 Reading Grade 8 - Test C" : "R8IC",
     "NCCI 2.0 Science Grade 5 - Earth Science" : "S5ES",
     "NCCI 2.0 Science Grade 5 - Life Science" : "S5LS",
     "NCCI 2.0 Science Grade 5 - Physical Science" : "S5PS",
     "NCCI 2.0 Science Grade 8 - Earth Science" : "S8ES",
     "NCCI 2.0 Science Grade 8 - Life Science" : "S8LS",
     "NCCI 2.0 Science Grade 8 - Physical Science" : "S8PS",
     "NCCI 2.0 Biology - Ecosystems - Spring" : "BECS",
     "NCCI 2.0 Biology - Evolution - Spring" : "BEVS",
     "NCCI 2.0 Biology - Molecular - Spring" : "BMOS",
     "NCCI 2.0 Biology - Structure - Spring" : "BSTS",
     "NCCI 2.0 English II - Interim 1 - Spring" : "E2AS",
     "NCCI 2.0 English II - Interim 2 - Spring" : "E2BS",
     "NCCI 2.0 NC Math 1 - Interim 1 - Spring" : "MIAS",
     "NCCI 2.0 NC Math 1 - Interim 2 - Spring" : "MIBS",
     "NCCI 2.0 NC Math 3 - Interim 1 - Spring" : "MTAS",
     "NCCI 2.0 NC Math 3 - Interim 2 - Spring" : "MTBS",
     "NCCI 2.0 Biology - Ecosystem - Yearlong" : "BECY",
     "NCCI 2.0 Biology - Evolution - Yearlong" : "BEVY",
     "NCCI 2.0 Biology - Molecular - Yearlong" : "BMOY",
     "NCCI 2.0 Biology - Structure - Yearlong" : "BSTY",
     "NCCI 2.0 English II - Interim 1 - Yearlong" : "E2AY",
     "NCCI 2.0 English II - Interim 2 - Yearlong" : "E2BY",
     "NCCI 2.0 NC Math 1 - Interim 1 - Yearlong" : "MIAY",
     "NCCI 2.0 NC Math 1 - Interim 2 - Yearlong" : "MIBY",
     "NCCI 2.0 NC Math 3 - Interim 1 - Yearlong" : "MTAY",
     "NCCI 2.0 NC Math 3 - Interim 2 - Yearlong" : "MTBY",
     "" : null,
     null : null
    };


	const domDecodes = {
        "Ecosystems" : {CODE: "ECO", DESC: "Ecosystems", FIXED: "Ecosystems"},
        "Molecular Biology" : {CODE: "MO_BIO", DESC: "Molecular Biology", FIXED: "Molecular Biology"},
        "Structure and Functi" : {CODE: "ST_FUN", DESC: "Structure and Functi", FIXED: "Structure and Function"},
        "Reading for Informat" : {CODE: "RD_INF", DESC: "Reading for Informat", FIXED: "Reading for Information"},
        "Number and Operation" : {CODE: "NUM_OP", DESC: "Number and Operation", FIXED: "Number and Operations"},
        "Measurement and Data" : {CODE: "MES_DTA", DESC: "Measurement and Data", FIXED: "Measurement and Data"},
        "Geometry" : {CODE: "GEO", DESC: "Geometry", FIXED: "Geometry"},
        "Ratios & Proportiona" : {CODE: "RA_PO", DESC: "Ratios & Proportiona", FIXED: "Ratios & Proportions"},
        "Expressions & Equati" : {CODE: "EX_EQ", DESC: "Expressions & Equati", FIXED: "Expressions & Equations"},
        "Expressing Geometric" : {CODE: "EX_GEO", DESC: "Expressing Geometric", FIXED: "Expressing Geometric"},
        "Building Functions" : {CODE: "BLD_FUN", DESC: "Building Functions", FIXED: "Building Functions"},
        // No Fixed Found.
        "Conservation and Tra" : {CODE: "COV_T", DESC: "Conservation and Tra", FIXED: "Conservation and Tra"},
        "Evolution and Geneti" : {CODE: "EVO_GEN", DESC: "Evolution and Geneti", FIXED: "Evolution and Genetics"},
        "Reading for Literatu" : {CODE: "RD_LIT", DESC: "Reading for Literatu", FIXED: "Reading for Literature"},
        "Operations and Algeb" : {CODE: "OP_ALG", DESC: "Operations and Algeb", FIXED: "Operations and Algebra"},
        "The Number System" : {CODE: "NUM_SYS", DESC: "The Number System", FIXED: "The Number System"},
        "Functions" : {CODE: "FUNC", DESC: "Functions", FIXED: "Functions"},
        "Interpreting Categor" : {CODE: "INT_CAT", DESC: "Interpreting Categor", FIXED: "Interpreting Categorical"},
        "Creating Equations" : {CODE: "CR_EQ", DESC: "Creating Equations", FIXED: "Creating Equations"},
        "Forces and Motion" : {CODE: "FOR_MO", DESC: "Forces and Motion", FIXED: "Forces and Motion"},
        "Interpreting Functio" : {CODE: "INT_FUN", DESC: "Interpreting Functio", FIXED: "Interpreting Functions"},
        // No Fixed Found.
        "Linear, Quadratic, a" : {CODE: "LQA", DESC: "Linear, Quadratic, a", FIXED: "Linear, Quadratic, a"},
        "Matter" : {CODE: "MAT", DESC: "Matter", FIXED: "Matter"},
        "Reasoning with Equat" : {CODE: "RE_EQ", DESC: "Reasoning with Equat", FIXED: "Reasoning with Equations"},
        "Seeing Structure in" : {CODE: "SE_STR_I", DESC: "Seeing Structure in", FIXED: "Seeing Structure in"},
        "Properties and Chang" : {CODE: "PRO_CHA", DESC: "Properties and Chang", FIXED: "Properties and Change"},
        "" : {CODE: null, DESC: null , FIXED: null},
        null : {CODE: null, DESC: null , FIXED: null}
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
        let normalizedRecords = [];
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
        const  mappingObject = {};

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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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

	 function getTestAdminDate(hierarchyYear, reportingPeriod) {
		 let testAdminDate = null, testAdminDateObj = AppUtil.getEmptyDateObj();
		 var testYear = hierarchyYear.toString().split("-")[1];
		 if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'WINTER') {
			 testAdminDate = '01/15/' + testYear;
		 } else if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'SPRING') {
			 testAdminDate = '05/15/' + testYear;
		 }  else if (testYear && reportingPeriod && reportingPeriod.toUpperCase() === 'FALL') {
			testAdminDate = '09/15/' + hierarchyYear.toString().split("-")[0];
		 }
		 else {
			 testAdminDate = '05/15/' + testYear;//ALL
		 }
		 testAdminDateObj = AppUtil.getDateObjByPattern(testAdminDate, "MM/dd/yyyy");
		 return testAdminDateObj.STANDARD_DATE;
	 }
    function identifyReportingPeriod(period) {
        // Convert the period input to uppercase for case insensitivity
        period = period.toUpperCase();

        // Check the input period and return the corresponding reporting period
        if (period === 'F') {
            return 'Fall';
        } else if (period === 'S') {
            return 'Spring';
        } else if (period === 'Y') {
            return 'ALL';
        } else {
            return 'Invalid input. Please provide F, S, or Y as input.';
        }
    }
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        let record = {};
        const normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        const birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

        const studentGenderCode = null;
        const genderCode = row.getField("GENDER");
        if (genderCode != null){
            studentGenderCode = _util.trim(row.getField("GENDER") + "-").substring(0, 1).toUpperCase();
        }

        normalizedFileFields.forEach(function (field) {
            switch(field) {
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
                if(signature.getFormat().getFormatName() === "check_ins_2023_2024_69_COLS") {
                    record.REPORTING_PERIOD = identifyReportingPeriod(row.getField("TEST_CYCLE"));
                } else {
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                }
                break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    if(signature.getFormat().getFormatName() === "check_ins_2023_2024_9_COLS") {
                        record.TEST_ADMIN_DATE = getTestAdminDate(hierarchy.SCHOOL_YEAR, hierarchy.REPORTING_PERIOD)
                    } else {
                        record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "MM/dd/yyyy").STANDARD_DATE;
                        }
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"), row.getField("POWERSCHOOL_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"), row.getField("POWERSCHOOL_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"), row.getField("POWERSCHOOL_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = studentGenderCode;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"),"DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
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
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        let admin = {};
        admin.TEST_TEACHER = row.getField("TEACHER_NAME");
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
     // Added an extract numerals for '%' values
     function extractNumerical(input) {
       // Check for empty or invalid input
       if (input === "" || input === null || input === undefined || input === 0) {
         return input;
       }

       // Extract numbers, decimals, and the percentage sign using a regular expression
       var numericalChars = input.match(/[0-9.]/g);

       if (numericalChars) {
         // If characters are found, return them combined
         return numericalChars.join('');
       } else {
         // If no relevant characters are found, return the original value
         return input;
       }
     }
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapRawScore(row, testMetadata) {
        let score = {};
        var numberCorrectScore;
        var percentCorrectScore;
        var numberItemsAttempted;
        var testNumber;
        var ntpMap;
        var testName;
        var percentCorrectScoreFixed;

        testName = row.getField("TEST_NAME");
        ntpMap = row.getField("NTP_CODE");
        numberCorrectScore = _util.coalesce(row.getField(testMetadata.FIELD + "NUMBER_CORRECT"),row.getField("RAW_SCORE"));
        percentCorrectScore = row.getField(testMetadata.FIELD + "PERCENT_CORRECT");
        percentCorrectScoreFixed = extractNumerical(percentCorrectScore);
        numberItemsAttempted = row.getField(testMetadata.FIELD + "NUMBER_ITEMS_ATTEMPTED");
        if(ntpMap == undefined){
            ntpMap = ntpDecode[testName];
        }

        if(numberCorrectScore === null || numberCorrectScore === undefined || _util.trim(numberCorrectScore) === "--" || _util.trim(numberCorrectScore) === "") {
            return null;
        }
        //set test number
        testNumber = testMetadata.TEST + "_" + ntpMap;
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_ITEMS_POSSIBLE"] = numberItemsAttempted;
        score["TEST_PERCENTAGE_SCORE"] = percentCorrectScoreFixed;
        score["TEST_ITEMS_ATTEMPTED"] = numberCorrectScore;
        score["TEST_SCORE_VALUE"] = numberCorrectScore;
        score["TEST_RAW_SCORE"] = numberCorrectScore;

        return score;
    }

    function mapStandardScore(row, testMetadata) {
        let score = {};
        var testNumber;
        var standardScore;
        var standardScorePct;
        var ntpMap;
        var testName;

        testName = row.getField("TEST_NAME");
        ntpMap = row.getField("NTP_CODE");
        standardScore = row.getField(testMetadata.FIELD);
        standardScorePct = row.getField(testMetadata.FIELD + "_pct");
        if(ntpMap == undefined){
            ntpMap = ntpDecode[testName];
        }

        //null checks
        if(standardScorePct === null || standardScorePct === undefined || _util.trim(standardScorePct) === "--" || _util.trim(standardScorePct) === "") {
            return null;
        }

        //Set Test Number
        testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + ntpMap;

        //Set Score Fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_ATTRIBUTES"] = standardScore;
        score["TEST_PERCENTAGE_SCORE"] = standardScorePct;
        score["TEST_SCORE_VALUE"] = standardScorePct;

        return score;
    }

    function mapDomainScore(row, testMetadata) {
        let score = {};
        var testNumber;
        var domainScore;
        var domainScorePct;

        domainScore = row.getField(testMetadata.FIELD);
        domainScorePct = row.getField(testMetadata.FIELD + "_pct");
        //null checks
        if(domainScore === null || domainScore === undefined || _util.trim(domainScore) === "--" || _util.trim(domainScore) === "") {
            return null;
        }

        if(domainScorePct === null || domainScorePct === undefined || _util.trim(domainScorePct) === "--" || _util.trim(domainScorePct) === "") {
            return null;
        }

        //Set Test Number
        testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + domDecodes[domainScore].CODE;

        //Set Score Fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PERCENTAGE_SCORE"] = domainScorePct;
        score["TEST_SCORE_VALUE"] = domainScorePct;
        score["TEST_SCORE_ATTRIBUTES"] = domDecodes[domainScore].FIXED;

        return score;
    }

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
                record.LINEAGE_FILE = file.getFullName();
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
        let assessmentAdminKey = "${_assessmentIdentifier}_${AssessmentLoader.config.TENANT_CODE}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());