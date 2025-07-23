var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "WYTOPP";
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
        { TEST: "WYTOPP", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WYTOPP", CODE: "EN", FIELD: "ENGLISH", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WYTOPP", CODE: "MA_OVR", FIELD: "MATH_OVERALL", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WYTOPP", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WYTOPP", CODE: "SC", FIELD: "SCIENCE", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WYTOPP", CODE: "ACTSTEM", FIELD: "STEM", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WYTOPP", CODE: "ALT_MA", FIELD: "MATH_WY_ALT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WYTOPP", CODE: "ALT_RD", FIELD: "READING_WY_ALT", MAP_FUNCTION: mapScaledScore }
        , { TEST: "WYTOPP", CODE: "ALT_SC", FIELD: "SCIENCE_WY_ALT", MAP_FUNCTION: mapScaledScore }

        , { TEST: "WYTOPP", CODE: "MATH_ALG_THINKING", FIELD: "MATH_OPERATIONS_AND_ALGEBRAIC_THINKING", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_NUM_OP_BT", FIELD: "MATH_NUMBERS_AND_OPERATIONS_BASE_TEN", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_FRAC", FIELD: "MATH_NUMBERS_AND_OPERATIONS_FRACTIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_MEAS", FIELD: "MATH_MEASUREMENT_AND_DATA", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_RT_PROP", FIELD: "MATH_RATIOS_AND_PROPORTIONAL_RELATIONSHIPS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PAWS_MATH_GEO", FIELD: "MATH_C_SCALE_GEOMETRY", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PAWS_MATH_MEAS", FIELD: "MATH_C_SCALE_MEASUREMENT", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PAWS_MATH_ALG", FIELD: "MATH_C_SCALE_OPS_ALGEBRA", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PAWS_MATH_BASE_TEN", FIELD: "PAWS_MATH_C_SCALE_BASE_TEN", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PAWS_MATH_FRAC", FIELD: "PAWS_MATH_C_SCALE_FRACTIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PAWS_MATH_EQN", FIELD: "PAWS_MATH_C_SCALE_EQUATIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PAWS_MATH_FUNC", FIELD: "PAWS_MATH_C_SCALE_FUNCTIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PAWS_MATH_NUM", FIELD: "PAWS_MATH_C_SCALE_NUMBER_SYS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_EXPN", FIELD: "MATH_EXPRESSIONS_AND_EQUATIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_STATPROB", FIELD: "MATH_STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_FUNC", FIELD: "MATH_FUNCTIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_NQ", FIELD: "MATH_NUMBERS_AND_QUANTITIES", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_ALG", FIELD: "MATH_ALGEBRA", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_CON", FIELD: "MATH_CONGRUENCE", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_TRIG", FIELD: "MATH_SIMILARITY_RIGHT_TRIANGLES_AND_TRIGONOMETRY", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_GEO_EQN", FIELD: "MATH_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_GEO_MOD", FIELD: "MATH_GEOMETRIC_MEASUREMENT_AND_DIMENSION_AND_MODELING", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "RD_LIT", FIELD: "READING_LITERATURE", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "RD_INF", FIELD: "READING_INFORMATIONAL", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "RD_VOC_ACQ", FIELD: "READING_LANGUAGE_VOCABULARY_ACQUISITION_AND_USE", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "RD_LISN", FIELD: "READING_ELA_LISTENING", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "RD_WRTN", FIELD: "READING_ELA_WRITING", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "SC_ER_SP", FIELD: "SCIENCE_EARTH_AND_SPACE", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "LIFE_SC", FIELD: "LIFE_SCIENCE", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "PHY_SCI", FIELD: "PHYSICAL_SCIENCE", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "WRRDSGN_IA", FIELD: "WRITING_DOMAIN_IDEAS_ANALYSIS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "WRRDSGN_DS", FIELD: "WRITING_DOMAIN_DEVELOPMENT_SUPPORT", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "WRRDSGN_ORG", FIELD: "WRITING_DOMAIN_ORGANIZATION", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "WRRDSGN_UC", FIELD: "WRITING_DOMAIN_USE_CONVENTIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_GEO", FIELD: "MATH_GEOMETRY", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_NS", FIELD: "MATH_THE_NUMBER_SYSTEM", MAP_FUNCTION: mapRawScore }
        , { TEST: "WYTOPP", CODE: "MATH_NQA", FIELD: "MATH_NUMBER_AND_QUANTITY", MAP_FUNCTION: mapRawScore }

        , { TEST: "WYTOPP", CODE: "TOT", FIELD: "COMPOSITE", MAP_FUNCTION: mapCompositeScore }

        , { TEST: "WYTOPP", CODE: "ELA_OVR", FIELD: "ELA", MAP_FUNCTION: mapOverallScore }
        , { TEST: "WYTOPP", CODE: "MA_OVR_WY_ALT1", FIELD: "MATH_OVERALL_WY_ALT1", MAP_FUNCTION: mapOverallScore }
        , { TEST: "WYTOPP", CODE: "SC_OVR", FIELD: "SCIENCE_OVERALL", MAP_FUNCTION: mapOverallScore }
        , { TEST: "WYTOPP", CODE: "RD_OVR", FIELD: "READING_OVERALL", MAP_FUNCTION: mapOverallScore }
        , { TEST: "WYTOPP", CODE: "MA_OVR_WY_ALT2", FIELD: "MATH_OVERALL_WY_ALT2", MAP_FUNCTION: mapOverallScore }
        , { TEST: "WYTOPP", CODE: "ALT_RD_OVR", FIELD: "READING_OVERALL_WY_ALT", MAP_FUNCTION: mapOverallScore }
        , { TEST: "WYTOPP", CODE: "ALT_SC_OVR", FIELD: "SCIENCE_OVERALL_WY_ALT", MAP_FUNCTION: mapOverallScore }

        , { TEST: "WYTOPP", CODE: "ALT", FIELD: "SCALED", MAP_FUNCTION: mapAltScores }


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

    var performanceLevelCode = {
       "1": "1"
       ,"2":"2"
       ,"3": "3"
       ,"4": "4" 
       ,"Below Basic": "BB"
       ,"Advanced": "AD"
       ,"Proficient": "PRO"
       ,"At or Approaching": "ATA"
       ,"On or Above": "ONA"
       ,"Basic": "BAS"
       ,"Low": "LOW"
       ,"Developing Skills": "DEV_SKL"
       ,"Demonstrating Skills": "DEM_SKL"
       ,"" : null
       ,"n/a":  null
       ,null : null
      };

    var performanceLevel = {
        "1": "Below Basic"
        ,"2": "Basic"
        ,"3": "Proficient"
        ,"4": "Advanced"
        ,"Below Basic": "Below Basic"
        ,"Advanced":  "Advanced"
        ,"Proficient": "Proficient"
        ,"At or Approaching": "At or Approaching"
        ,"On or Above": "On or Above"
        ,"Basic": "Basic"
        ,"Low": "Low"
        ,"Developing Skills": "Developing Skills"
        ,"Demonstrating Skills": "Demonstrating Skills"
        ,"": null
        ,"n/a": null
        ,null: null
        };

    var passDecode = {
       "4" : "Yes"
       ,"3" : "Yes"
       ,"2" : "No"
       ,"1" : "No"
       ,"" : null
       ,null : null
      };


    var understandingComplexTextDecode = {
         "0": "Below proficiency"
       , "1": "Proficient"
       , "2": "Above proficiency"
       , "-": "Unable to calculate",
         ".": null,
         null: null
    };


     var progressTowardCareerReadinessDecode = {
         "0": "Insufficient progress toward an NCRC level"
       , "1": "Progress toward Bronze Level NCRC"
       , "2": "Progress toward Silver level NCRC"
       , "3": "Progress toward Gold level NCRC"
       , "4": "Progress toward Platinum level NCRC"
       , "-": "Unable to calculate",
         ".": null,
         null: null
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
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));;
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
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };
        var birthDate =  _util.coalesce(row.getField("STUDENT_BIRTHDATE"),row.getField("BIRTH_DATE"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "" && birthDate !== "0" && birthDate !== ".") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);//MM/dd/yyyy,MMddyyyy,yyyymmdd
        }
        else{
                birthDateObject  = birthDate;
        }

        var testAdminDate = null;
        var testDate = row.getField("TEST_ADMIN_DATE");
        if(testDate !== null && testDate !== undefined && testDate !== "" && testDate !== "0" && testDate !== ".") {
          testAdminDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;//MM/dd/yyyy,MMddyyyy,yyyymmdd
         }else{
               testAdminDate  = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9);
         }


        var studentname = row.getField("STUDENT_NAME");
           if (studentname !== null && studentname !== undefined && studentname !== ""){
            var firstName = studentname.split(",")[1];
            var lastName = studentname.split(",")[0];
            }

        var schoolName = row.getField("SCHOOL_INFO");
        if (schoolName !== null && schoolName !== undefined && schoolName !== ""){
                    var schoolId = schoolName.split("(")[1].replace(")","");
                    var finalSchoolName = schoolName.split("(")[0];
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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testAdminDate ;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("LOCAL_STUDENT_ID"),row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"),row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(firstName, row.getField("STUDENT_FIRST_NAME"),row.getField("FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(lastName, row.getField("STUDENT_LAST_NAME"),row.getField("LAST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"),row.getField("MIDDLE_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                      record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField('GRADE')],gradeDecode[row.getField('GRADE_TESTED')]);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(schoolId,row.getField("SCHOOL_ID"),row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("DISTRICT_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(finalSchoolName,row.getField("SCHOOL_NAME"));
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

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
        var nationNormScore = row.getField(testMetadata.FIELD + "_NATIONAL_NORM")
        var sem = row.getField(testMetadata.FIELD +"_SEM");
		var perfLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
		var lexile = row.getField("LEXILELEVEL");
        var percentage = row.getField(testMetadata.FIELD + "_SGP");
        if(row.getField("SGP")!==undefined){
            if(row.getField("LEXILELEVEL")!=="N/A" && testMetadata.FIELD == "ELA"){
                percentage = row.getField("SGP");
            }
            else if(row.getField("QUANTILE_SCORE")!=="N/A" && testMetadata.FIELD == "MATH_OVERALL"){
                percentage = row.getField("SGP");
            }
        }
        var percentageLower = row.getField(testMetadata.FIELD + "_SGP_LOWER");
        var percentageUpper = row.getField(testMetadata.FIELD + "_SGP_HIGHER");
        var quantile = row.getField("QUANTILE_SCORE")
        var nce = row.getField(testMetadata.FIELD + "NCE");
        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === ".")
        && (nationNormScore === null || nationNormScore === undefined || _util.trim(nationNormScore) === "--" || _util.trim(nationNormScore) === "" || _util.trim(nationNormScore) === ".")
        && (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === "" || _util.trim(perfLevel) === "."))
        {
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
    	score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelCode[perfLevel];
    	score["TEST_PRIMARY_RESULT"] = performanceLevel[perfLevel];

        if(!isNaN(nationNormScore)){
            score["TEST_PERCENTILE_SCORE"] = nationNormScore;
        }

        if(percentage !== null && percentage !== "N/A" && percentage !== "Insufficient to score"){
    	    score["TEST_PERCENTAGE_SCORE"] = percentage.replace("%","");
    	}

        score["TEST_LOWER_BOUND"] = percentageLower;
        score["TEST_UPPER_BOUND"] = percentageUpper;
        score["TEST_DECILE_SCORE"] = removeAlphaChar(quantile);

    	score["TEST_STANDARD_ERROR"] = sem;
    	score["TEST_READING_LEVEL"] = removeAlphaChar(lexile);
        score["TEST_NCE_SCORE"] = nce;

        return score;
    }

     function mapCompositeScore(row, testMetadata) {
         var score = {};

         var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
         var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
         //COMBINED_ENGLISH_WRITING_SCALED_SCORE
         var nationNormScore = row.getField(testMetadata.FIELD + "_NATIONAL_NORM");
         var careerReadinessCode = row.getField("PROGRESS_TOWARD_CAREER_READINESS_CODE");
         var careerReadinessDesc = progressTowardCareerReadinessDecode[row.getField("PROGRESS_TOWARD_CAREER_READINESS_CODE")];

         // Check for key fields and do not map score and exit if conditions met.
         if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === ".")
         && (nationNormScore === null || nationNormScore === undefined || _util.trim(nationNormScore) === "--" || _util.trim(nationNormScore) === "" || _util.trim(nationNormScore) === "."))
         {
            return null;
         }

         // Set score fields
         score["TEST_NUMBER"] = testNumber;
         score["TEST_SCORE_TEXT"] = scaleScore;
         score["TEST_SCORE_VALUE"] = scaleScore;
         score["TEST_SCALED_SCORE"] = scaleScore;

         if(!isNaN(nationNormScore)){
         score["TEST_PERCENTILE_SCORE"] = nationNormScore;
         }
         score["TEST_PRIMARY_RESULT_CODE"] = careerReadinessCode;
         score["TEST_PRIMARY_RESULT"] = careerReadinessDesc;

            return score;
         }


    function mapRawScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
        var sem = row.getField(testMetadata.FIELD + "_SCALED_SCORE_SEM");
        var perfLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
        var percentile = row.getField("PERCENTILE");
        var nce = row.getField(testMetadata.FIELD + "NCE");

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === ".")
        && (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === "" || _util.trim(perfLevel) === ".")
        && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || _util.trim(rawScore) === ".")
        && (sem === null || sem === undefined || _util.trim(sem) === "--" || _util.trim(sem) === "" || _util.trim(sem) === "."))
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_RAW_SCORE"] = rawScore;

        score["TEST_PASSED_INDICATOR"] = passDecode[perfLevel];
    	score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelCode[perfLevel];
    	score["TEST_PRIMARY_RESULT"] = performanceLevel[perfLevel];

        score["TEST_STANDARD_ERROR"] = sem;


    	score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_NCE_SCORE"] = nce;

        return score;
    }

    function mapOverallScore(row, testMetadata) {
            var score = {};
            var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
            var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
            var sem = row.getField(testMetadata.FIELD + "_SCALED_SCORE_SEM");
            var perfLevel = row.getField(testMetadata.FIELD + "_PERFORMANCE_LEVEL");
            var nationNormScore = row.getField(testMetadata.FIELD + "_NATIONAL_NORM");
            var textComplexCode = row.getField("UNDERSTANDING_COMPLEX_TEXT_CODE");
            var textComplexDesc = understandingComplexTextDecode[row.getField("UNDERSTANDING_COMPLEX_TEXT_CODE")];
            // Check for key fields and do not map score and exit if conditions met.
           if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === ".")
           && (nationNormScore === null || nationNormScore === undefined || _util.trim(nationNormScore) === "--" || _util.trim(nationNormScore) === "" || _util.trim(nationNormScore) === ".")
           && (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === "" || _util.trim(perfLevel) === "."))
           {
               return null;
           }
                        // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;

            score["TEST_PASSED_INDICATOR"] = passDecode[perfLevel];
    	    score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelCode[perfLevel];
    	    score["TEST_PRIMARY_RESULT"] = performanceLevel[perfLevel];

            if(!isNaN(nationNormScore)){
            score["TEST_PERCENTILE_SCORE"] = nationNormScore;
            }
            score["TEST_SECONDARY_RESULT_CODE"] = textComplexCode;
            score["TEST_SECONDARY_RESULT"] = textComplexDesc;
            score["TEST_STANDARD_ERROR"] = sem;
            return score;
        }

    function mapAltScores (row, testMetadata){
            var score = {};
            var subject = getSubject(row);

            if (subject && subject !== "") {
                testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + subject;
             } else {
               return null; // Return null to indicate invalid test number
             }

            var scaleScore = row.getField(testMetadata.FIELD + "_SCORE");
            var standardError = row.getField(testMetadata.FIELD + "_SCORE_STANDARD_ERROR");
            var perfLevel = row.getField("PERFORMANCE_LEVEL");
            var sgp = row.getField("SGP");
            var lexile = row.getField("LEXILELEVEL");
            var quantile = row.getField("QUANTILE_SCORE");
            var rdLevel = null;
            if(subject == "ELA"){
                rdLevel = lexile;
            }
            else if(subject == "MA"){
                rdLevel = quantile;   
            }

            // Check for key fields and do not map score and exit if conditions met.
         if (
             (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "N/A") &&
             (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === "" || _util.trim(perfLevel) === ".") &&
             (standardError === null || standardError === undefined || _util.trim(standardError) === "--" || _util.trim(standardError) === "" || _util.trim(standardError) === "N/A"))
         {
             return null;
         }

         if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_TEXT"] = scaleScore;
         }
         if(!isNaN(standardError)){
            score["TEST_STANDARD_ERROR"] = standardError;
         }
         if(!isNaN(sgp)){
            score["TEST_PERCENTAGE_SCORE"] = sgp;
         }
         score["TEST_NUMBER"] = testNumber;
         score["TEST_PRIMARY_RESULT_CODE"] = performanceLevelCode[perfLevel];
         score["TEST_PRIMARY_RESULT"] = performanceLevel[perfLevel];
         score["TEST_READING_LEVEL"] = removeAlphaChar(rdLevel);
         return score;
    }


        function getSubject(row) {
            var subject = row.getField("TEST_SUBJECT");
            if (subject && subject !== "") {
                subject = subject.toUpperCase(); // Only call toUpperCase if subject exists
                if (subject.indexOf('ELA') > -1) {
                    return 'ELA';
                } else if (subject.indexOf('MATHEMATICS') > -1) {
                    return 'MA';
                } else if (subject.indexOf('SCIENCE') > -1) {
                    return 'SCI';
                }
            }
            return null; // Return null if no match or if subject is null/undefined
        }



     function removeAlphaChar(value) {
            if(value === undefined || value === null) {
                return null;
            }
            if((/[a-zA-Z]/g.test(value))){
                value = value.replace(/[a-zA-Z]/g, '').trim();
            }
            return value;
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

        if (signature.getFormat().getFormatName() === 'WYTOPP_20_COLS'){
            var testAdminDate = null;
            var testAdminDate = srcRecord.getField("TEST_ADMIN_DATE");
            if(testAdminDate !== null && testAdminDate !== undefined && testAdminDate !== "") {
            testAdminDate = AppUtil.getMonthFollowedByDay(testAdminDate).STANDARD_DATE;
            }

            assessmentAdminKey = assessmentAdminKey + "_" + testAdminDate;
        }
        else{

        assessmentAdminKey = assessmentAdminKey;

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        }
        return assessmentAdminKey;

    }
    return module;
}());