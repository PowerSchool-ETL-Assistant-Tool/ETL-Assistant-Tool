var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IXL";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
		try {

			var signatureFormatName = signature.getFormat().getFormatName();
			print("Loading using signature file ${signatureFormatName}");


			//Initialize path and lineage variables.
			var normalizedFile = AppUtil.createResultsFile(file);

			print("Normalized file: ${normalizedFile}");

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
				.group_by("ADMINISTRATION GROUPING" , function(one, two){

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
						if(!multipleRowsPerGroupingExpected && rows.length > 1){

							//Report error for each row
							rows.forEach(function(row){
								AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
							});

						} else {
							output.RECORDS.put(rows);
						}
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
					}
				})
				.transform("NORMALIZE RECORDS", ["RECORDS"],
					function(output, rows) {
						try{

							var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

							normalizedRecords.forEach(function(record){
								output.RECORDS.put(record);
							});

						} catch(exception) {
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
						}


					})
				.transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
					try {
						var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

						// Report when no scores are found.
						if(mappingObject.SCORE_MAPPINGS.length === 0){
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
						} else {
							output.RECORDS.put(row);
						}
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
					}
				})
				.output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
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
         // MATH
        {TEST: "IXL_", CODE:"MA_OVR", FIELD: "OVERALL_MATH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_OVR", FIELD: "MATH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_NO_OP_LVL", FIELD: "NUMBERS_AND_OPERATIONS_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_ALG_AT_LVL", FIELD: "ALGEBRA_AND_ALGEBRAIC_THINKING_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_FRA_LVL", FIELD: "FRACTIONS_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_GEO_LVL", FIELD: "GEOMETRY_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_MEA_LVL", FIELD: "MEASUREMENT_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_DS_PROB_LVL", FIELD: "DATA_STATISTICS_AND_PROBABILITY_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_NUM_SYS_LVL", FIELD: "NUMBER_SYSTEM", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_EXP_EQ_LVL", FIELD: "EXPRESSIONS_AND_EQUATIONS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_RAT_PRO_LVL", FIELD: "RATIOS_AND_PROPORTIONAL_RELATIONSHIPS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"MA_FUNC_LVL", FIELD: "FUNCTIONS", MAP_FUNCTION: mapScaledScore}
        // ELA
        ,{TEST: "IXL_", CODE:"ELA_OVR", FIELD: "OVERALL_ELA", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"ELA_OVR", FIELD: "ELA", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"RD_LVL_OVR", FIELD: "OVERALL_READING_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"RD_ST_LVL", FIELD: "READING_STRATEGIES_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"ELA_VOCAB_LVL", FIELD: "VOCABULARY_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"ELA_WR_ST_LVL", FIELD: "WRITING_STRATEGIES_LEVEL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IXL_", CODE:"ELA_GR_ME_LVL", FIELD: "GRAMMAR_AND_MECHANICS_LEVEL", MAP_FUNCTION: mapScaledScore}

        // SCIENCE
        ,{TEST: "IXL_", CODE:"SCI_OVR", FIELD: "SCIENCE", MAP_FUNCTION: mapScaledScore}

        // SOCIAL STUDIES
        ,{TEST: "IXL_", CODE:"SOSCI_OVR", FIELD: "SOCIAL_STUDIES", MAP_FUNCTION: mapScaledScore}

         // SPANISH
         ,{TEST: "IXL_", CODE:"SPA_OVR", FIELD: "SPANISH", MAP_FUNCTION: mapScaledScore}

        //Unknown
        ,{TEST: "IXL_", CODE:"OVR", FIELD: " ", MAP_FUNCTION: mapScaledScore}//Covers unclear cases where it is neither ELA or MATH and must be determined by file name
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

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
        "Kindergarten": "KG",
        "Pre-K": "PK"
       ,"" : null
       ,null : null
    };

    var monthDecode = {
        "January": "01",
        "February": "02",
        "March": "03",
        "April": "04",
        "May": "05",
        "June": "06",
        "July": "07",
        "August": "08",
        "September": "09",
        "October": "10",
        "November": "11",
        "December": "12",
        "" : null,
       null : null
    };

    var primaryDecode = {
       "ABOVE GRADE": "1"
       ,"ON GRADE": "2"
       ,"BELOW GRADE": "3"
       ,"FAR BELOW GRADE": "4"
       ,"" : null
       ,null : null
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
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
     function getAdminDate(row, hierarchy) {
        var adminDate = null;
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();

        var flName =  fileName.substring(fileName.lastIndexOf('/')+5);
        var dateFromFileName = flName.replace(/[^0-9]/g,'').toString();
        if(dateFromFileName && dateFromFileName.toString().length === 8){
            adminDate = parseDate(dateFromFileName).STANDARD_DATE;
        } else {
            switch(true){
                case (fileName.indexOf("DEC") > -1) : adminDate = "12/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
                    break;
                case (fileName.indexOf("NOV") > -1) : adminDate = "11/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
                    break;
                case (fileName.indexOf("OCT") > -1) : adminDate = "10/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
                    break;
                case ((fileName.indexOf("SEP") > -1) || (fileName.indexOf("FALL") > -1) || (fileName.indexOf("BOY") > -1)) : adminDate = "09/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
                    break;
                case (fileName.indexOf("AUG") > -1) : adminDate = "08/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
                    break;
                case (fileName.indexOf("JUL") > -1) : adminDate = "07/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
                    break;
                case (fileName.indexOf("JUN") > -1) : adminDate = "06/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
                    break;
                case (fileName.indexOf("MAY") > -1 || (fileName.indexOf("EOY") > -1)) : adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
                    break;
                case (fileName.indexOf("APR") > -1) : adminDate = "04/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
                    break;
                case (fileName.indexOf("MAR") > -1) : adminDate = "03/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
                    break;
                case (fileName.indexOf("FEB") > -1) : adminDate = "02/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
                    break;
                case ((fileName.indexOf("JAN") > -1) || (fileName.indexOf("WINTER") > -1) || (fileName.indexOf("MOY") > -1)) : adminDate = "01/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
                    break;
                default: adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
                    break;
            }
        }
        return adminDate;
     }

    function getTEST_ADMIN_PERIOD(row, hierarchy) {
        var testAdminPeriod = null;
        var testAdminDate = getAdminDate(row, hierarchy);
        if(testAdminDate!= null){
            var month = testAdminDate.substring(0, 2);
            if (month === "08" || month === "09" || month === "10" || month === "11"){
                testAdminPeriod = "FALL";
            } else if (month === "12" || month === "01" || month === "02"){
                testAdminPeriod = "WINTER";
            } else if (month === "03" || month === "04" || month === "05"){
                testAdminPeriod = "SPRING";
            } else if (month === "06" || month === "07"){
                testAdminPeriod = "SUMMER";
            }
        } else {
            testAdminPeriod = 'ALL';
        }
        return testAdminPeriod;
    }

    function mapNormalizedAdminFields(signature, hierarchy, row) {

        var record = {};
        var testAdminPeriod = null;
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var testAdminDate = getAdminDate(row, hierarchy);
        var reportingPeriod = getTEST_ADMIN_PERIOD(row, hierarchy);

        // School name from file name - UIHN-25686
        var lineageFile = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        var fileName = lineageFile.substring(lineageFile.lastIndexOf('/')+1);
        if (signature.getFormat().getFormatName() === "IXL_MATH_COLS_33") {
            if (fileName.indexOf('IXL') > -1) {
                var schName = fileName.replace('IXL-', '')
                                      .replace(/\d{2}-\d{2}/g, '')
                                      .replace(/[-\s]?Fall[-\s]?Math/gi, '')
                                      .replace(/LevelUp[-\s]?Benchmark[-\s]?Results/gi, '')
                                      .replace(/[0-9]{4}-[0-9]{2}-[0-9]{2}/g, '')
                                      .replace(/[0-9]/g, '')
                                      .replace(/[-]/g, ' ')
                                      .replace(/\.csv$/i, '')
                                      .trim();

                var schNameArray = schName.split(' ').filter(Boolean);
                var schoolOutput = schNameArray.slice(-4).join(' ').toUpperCase();
            }
        }


        if(fileName.indexOf('IXL') > -1){
            var schName = fileName.replace('IXL-','').replace(/[0-9]/g, '').replace(/[-]/g, ' ').replace('.CSV', '').trim();
        }

        var localID = row.getField("STUDENT_FULL_ID");
        if(localID !==null && localID.toString().indexOf("_")>-1){
            localID = localID.toString().split("_")[2];
        }else{
            localID = localID;
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
                    record.REPORTING_PERIOD = _util.coalesce(reportingPeriod, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(_util.coalesce(testAdminDate,
                                             "05/15/"+hierarchy.SCHOOL_YEAR.substring(5)), "MM/dd/yyyy").STANDARD_DATE;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"),localID);
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"),localID);
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"),localID);
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"), schoolOutput, schName, 'DISTRICT');
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), schName);
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
        var admin = {};
        admin.TEST_INTERVENTION_CODE = monthDecode[row.getField("ADMIN_PERIOD")];
        admin.TEST_INTERVENTION_DESC = row.getField("ADMIN_PERIOD");
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, testMetadata) {
        var score = {};
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        var grade = gradeDecode[row.getField("GRADE")];
        
        if(testMetadata.FIELD === " "){
            if(fileName.indexOf("ELA") >-1){
                var testNumber = testMetadata.TEST + grade +  '_' + "ELA_" + testMetadata.CODE;
            }else if(fileName.indexOf("MATH") >-1){
                testNumber = testMetadata.TEST + grade +  '_' + "MA_" + testMetadata.CODE;
            }else{
                testNumber = testMetadata.TEST + grade +  '_' + testMetadata.CODE;
            }
        }
        else{
            testNumber = testMetadata.TEST + grade +  '_' + testMetadata.CODE;
        }
        
        var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD), row.getField(testMetadata.FIELD + '_CURRENT_DIAGNOSTIC_LEVEL'),row.getField(testMetadata.CODE + "_SCORE"));
        var predictedScore = row.getField(testMetadata.FIELD + '_STARTING_DIAGNOSTIC_LEVEL');
        var itemAttempted = row.getField(testMetadata.FIELD + '_QUESTIONS_ANSWERED');
        var growthTarget1 = row.getField(testMetadata.FIELD + '_SKILLS_PRACTICED');
        var growthTarget2 = row.getField(testMetadata.FIELD + '_SKILLS_PROFICIENT');
        var growthTarget3 = row.getField(testMetadata.FIELD + '_SKILLS_MASTERED');
        var growthResult = row.getField(testMetadata.FIELD + '_DIAGNOSTIC_GROWTH');
        var achievLevel = row.getField(testMetadata.FIELD + '_TIER');
        var percentile = row.getField(testMetadata.FIELD + '_PERCENTILE');
        var overScore =  row.getField(testMetadata.FIELD + '_RAW_SCORE');
        var testTypeFetch = getTestTypeFromFile(row);

        if(testMetadata.FIELD === " " && row.getField('OVERALL_MIXED_CURRENT_DIAGNOSTIC_LEVEL')!== undefined){
            //When it is not clear if it is ELA or Math, but multiple fields are present
            scaleScore = row.getField('OVERALL_MIXED_CURRENT_DIAGNOSTIC_LEVEL');
            percentile = row.getField('OVERALL_MIXED_PERCENTILE');
            achievLevel = row.getField('OVERALL_MIXED_TIER');
        }

        // Check for key fields and do not map score and exit if conditions met.
        if (
        (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === "--" || scaleScore === "Incomplete") &&
        (itemAttempted === null || itemAttempted === undefined || _util.trim(itemAttempted) === "--" || _util.trim(itemAttempted) === "") &&
        (overScore === null || overScore === undefined || _util.trim(overScore) === "--" || _util.trim(overScore) === "")
        ) {
        return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_RAW_SCORE"] = overScore
        score["TEST_SCORE_TO_PREDICTED_RESULT"] = predictedScore;
        score["TEST_ITEMS_ATTEMPTED"] = itemAttempted;
        score["TEST_GROWTH_TARGET_1"] = growthTarget1;
        score["TEST_GROWTH_TARGET_2"] = growthTarget2;
        score["TEST_GROWTH_TARGET_3"] = growthTarget3;
        score["TEST_GROWTH_RESULT"] = growthResult;
        score["TEST_PRIMARY_RESULT"] = achievLevel;
        if(achievLevel){
            achievLevel = achievLevel.toUpperCase();
        }
        score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achievLevel];
        if(!isNaN(percentile)){
            score["TEST_PERCENTILE_SCORE"] = percentile;
        }
        score["TEST_SCORE_ATTRIBUTES"] = testTypeFetch;

        return score;
    }

        function getTestTypeFromFile(row) {
            var testtype = null;
            var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
            if (fileName.indexOf("BENCHMARK") > -1) {
                testtype = "BENCHMARK";
            } else if (fileName.indexOf("DIAGNOSTIC") > -1) {
                testtype = "DIAGNOSTIC";
            }
            return testtype;
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

    function parseDate(rawDate) {
        try {
            var dateObj = {
                RAW_DATE : rawDate
                , MONTH : null
                , DAY : null
                , YEAR : null
                , STANDARD_DATE : null
            };

            var formatter;

            // Exit if no value is provided.
            if(_util.trim(_util.coalesce(rawDate, "")) === "") {
                return dateObj;
            }

            if (rawDate.length() > 8 && rawDate.indexOf('/') > -1) {
               formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            } else if (rawDate.length() > 8 && rawDate.indexOf('-') > -1){
               formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
            } else {
               formatter = new java.text.SimpleDateFormat("yyyyMMdd");
            }
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
        catch (e) {
            print("Error in date parsing: " + e);
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
    function generateAssessmentAdminKey(signature, hierarchy, row) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(row.getField(key),"");
        });
        var adminDate = getAdminDate(row, hierarchy);
        var period = getTEST_ADMIN_PERIOD(row, hierarchy);
        assessmentAdminKey = assessmentAdminKey + "_" + adminDate + "_" + period;

        if(signature.getFormat().getFormatName() === "AUTOMATION_7_1_COLS" || signature.getFormat().getFormatName() === "IXL_ELA_MATH_MIXED"){
            var sub = null;
            if(fileName.indexOf("ELA") >-1){
                sub = "_ELA";
            }
            else if(fileName.indexOf("MATH") >-1){
                sub = "_MATH";
            }
            else {
                sub = '_OVERALL'
            }
            
            assessmentAdminKey = assessmentAdminKey + sub;
        }
        if (signature.getFormat().getFormatName() === "IXLMATH_COL14"){
            if(fileName.indexOf("ELA") >-1){
                var sub = "_ELA";
            }
            else if(fileName.indexOf("MATH") >-1){
                  sub = "_MATH";
            }
            assessmentAdminKey = assessmentAdminKey + sub;
        }

        if (signature.getFormat().getFormatName() === "IXM_ELACOL13"){
            if(fileName.indexOf("ELA") >-1){
               var sub = "_ELA";
            }
            else if(fileName.indexOf("MATH") >-1){
                   sub = "_MATH";
            }
            assessmentAdminKey = assessmentAdminKey + sub;
         }
        
        return assessmentAdminKey;
    }

    return module;
}());