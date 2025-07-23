var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "GROWTH_MEASURE";
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

     //TODO update scoresToMap
    var scoresToMap = [
        {TEST: "GM", CODE:"_OVR", FIELD: "", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "GM", CODE:"_MA_NUM", FIELD: "MATH_NUMBERS_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_MA_OP_ALG", FIELD: "MATH_OPERATIONS_AND_ALGEBRA_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_MA_MES_DA_PROB", FIELD: "MATH_MEASUREMENT_DATA_AND_PROBABILITY_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_MA_GEO", FIELD: "MATH_GEOMETRY_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_MA_FR_RA_PROP", FIELD: "MATH_FRACTIONS_RATIOS_AND_PROPORTIONS_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_MA_FUNC", FIELD: "MATH_FUNCTIONS_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_ELA_RD_COMP", FIELD: "ELA_READING_COMPREHENSION_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_ELA_LANG", FIELD: "ELA_LANGUAGE_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_ELA_PHON_AW", FIELD: "PHONOLOGICAL_AWARENESS_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_ELA_AL_KN", FIELD: "ALPHABET_KNOWLEDGE_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_ELA_LET_SO_CO", FIELD: "PWR_LETTER_SOUND_CORRESPONDENCES_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_ELA_HI_FREQ_WD", FIELD: "PWR_HIGH_FREQUENCY_WORDS_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_ELA_NON_WD_DE", FIELD: "PWR_NONSENSE_WORD_DECODING_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "GM", CODE:"_GR_MOY_BOY", FIELD: "MOY_BOY_GROWTH_", MAP_FUNCTION: mapGrowthScore}
        ,{TEST: "GM", CODE:"_GR_EOY_MOY", FIELD: "EOY_MOY_GROWTH_", MAP_FUNCTION: mapGrowthScore}
        ,{TEST: "GM", CODE:"_GR_EOY_BOY", FIELD: "EOY_BOY_GROWTH_", MAP_FUNCTION: mapGrowthScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
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
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
       "Far Below Level" : "1"
       ,"Below Level" : "2"
       ,"On Level" : "3"
       ,"Approaching" : "4"
       ,"Above Level" : "5"
       ,"" : null
       ,null : null
      };

    var passDecode = {
       "Far Below Level" : "No"
       ,"Below Level" : "No"
       ,"On Level" : "No"
       ,"Approaching" : "Yes"
       ,"Above Level" : "Yes"
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
               // AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var adminPeriod = row.getField("ADMIN_PERIOD").toUpperCase();
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

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
                    record.REPORTING_PERIOD = _util.coalesce(adminPeriod,hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //TEST_ADMIN_DATE must always finish/print as MM/dd/YYYY format
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = AppUtil.getMonthFollowedByDay(row.getField("TEST_ADMIN_DATE"), "MM-dd-yyyy").STANDARD_DATE;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_SASID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_SASID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_NAME"));
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
        var admin = {};

        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        }
        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
       var testNumber = null;
       var sub = row.getField("NAME");
       if (sub.indexOf('Math') > -1) {
           testNumber = testMetadata.TEST + "_" + "MA" + testMetadata.CODE;
       } else {
           testNumber = testMetadata.TEST + "_" + "ELA" + testMetadata.CODE;
       }
        var scaleScore = row.getField("SCALED_SCORE");
		var perfLevel = row.getField("PERFORMANCE_LEVEL_PRIMARY");
		var gradeLevelEq =  row.getField("GRADE_LEVEL_EQUIVALENCE");
		var gradeLevelCat =  row.getField("GRADE_LEVEL_EQUIVALENCE_CATEGORY");

		var lexileMin = row.getField("LEXILE_MIN");
		var lexileMax = row.getField("LEXILE_MAX");
		var quantileMin = row.getField("QUANTILE_MIN");
		var quantileMax = row.getField("QUANTILE_MAX");


        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PASSED_INDICATOR"] = passDecode[perfLevel];
    	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[perfLevel];
    	score["TEST_PRIMARY_RESULT"] =  perfLevel;

    	score["TEST_GRADE_EQUIVALENT"] = gradeLevelEq;
        score["TEST_LOWER_BOUND"] = lexileMin;
        score["TEST_UPPER_BOUND"] = lexileMax;

    	score["TEST_SCORE_ATTRIBUTES"] = gradeLevelCat;
    	if(quantileMin,quantileMax){
    	score["TEST_READING_LEVEL"] = quantileMin + "-" + quantileMax;
        }
        return score;
    }

    function mapStrandScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var level = row.getField(testMetadata.FIELD + "LEVEL");


        // Check for key fields and do not map score and exit if conditions met.
        if(level === null || level === undefined || _util.trim(level) === "--" || _util.trim(level) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_PRIMARY_RESULT"] = level;
        return score;
    }

    function mapGrowthScore(row, testMetadata) {
        var score = {};
        var testNumber = null;
        var subj = row.getField("NAME");
        if (subj.indexOf('Math') > -1) {
               testNumber = testMetadata.TEST + "_" + "MA" + testMetadata.CODE;
        } else {
               testNumber = testMetadata.TEST + "_" + "ELA" + testMetadata.CODE;
        }
        var growthLevel = row.getField(testMetadata.FIELD + "LEVEL");
        var growthIndex = row.getField(testMetadata.FIELD + "INDEX");


            // Check for key fields and do not map score and exit if conditions met.
        if(growthIndex === null || growthIndex === undefined || _util.trim(growthIndex) === "--" || _util.trim(growthIndex) === "") {
                return null;
        }

        	// Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT"] = growthLevel;
        if(!isNaN(growthIndex)){
        score["TEST_SCORE_TEXT"] = growthIndex;
        score["TEST_SCORE_VALUE"] = growthIndex;
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

            // Generate the assessmentAdminKey using hierarchy values and the converted date
            var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
            var date = srcRecord.getField("TEST_ADMIN_DATE");
            if(date !== null && date !== undefined && date !== ""){
            var adminDate = AppUtil.getMonthFollowedByDay(date).STANDARD_DATE;
            }

            // Add natural key fields
            signature.getFormat().getNaturalKey().forEach(function(key) {
                assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
            });
                assessmentAdminKey += "_" + adminDate;
            // Examples of adding additional values (if needed)
            // assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
            // assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);

            // Return the generated assessment admin key
            return assessmentAdminKey;
        }
    return module;
}());