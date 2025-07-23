var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "iStation";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;
    var adminPeriod;

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
			print("\nLoading using signature file ${signatureFormatName}\n");

			//Initialize path and lineage variables.
			var normalizedFile = AppUtil.createResultsFile(file);

			print("\nNormalized file: ${normalizedFile}\n");

			adminPeriod = determineAdminPeriod(normalizedFile);

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
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No overall scores found/ No overall admin date value", JSON.stringify(row)));
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
		}n
    };

    // Name from signature 'formatName'
    function determineAdminPeriod(normalizedFile) {

        var fileName = normalizedFile.substring(normalizedFile.lastIndexOf('/')+1);

        if (fileName.indexOf('BOY')> -1) {
            adminPeriod = 'BOY';
        } else if (fileName.indexOf('MOY')> -1) {
            adminPeriod = 'MOY';
        } else if (fileName.indexOf('EOY')> -1) {
            adminPeriod = 'EOY';
        } else {
            adminPeriod = 'ALL';
        }

        return adminPeriod;
    }


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
        {TEST: "MCLASS_ISTATION", CODE:"_OVR", FIELD: "OVERALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_MATH_OVR", FIELD: "MATH_OVERALL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_LC2", FIELD: "LC2", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_LK", FIELD: "LK", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_PA", FIELD: "PA", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_AD", FIELD: "AD", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_CMP", FIELD: "CMP", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_ORF", FIELD: "ORF", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_VOC", FIELD: "VOC", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_SPL", FIELD: "SPL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_TF", FIELD: "TF", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_JAN", FIELD: "JANUARY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_FEB", FIELD: "FEBRUARY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_MAR", FIELD: "MARCH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_APR", FIELD: "APRIL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_MAY", FIELD: "MAY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_JUN", FIELD: "JUNE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_JUL", FIELD: "JULY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_AUG", FIELD: "AUGUST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_SEP", FIELD: "SEPTEMBER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_OCT", FIELD: "OCTOBER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_NOV", FIELD: "NOVEMBER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_DEC", FIELD: "DECEMBER", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_NS", FIELD: "NS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_MD", FIELD: "MD", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_G", FIELD: "G", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_CA", FIELD: "CA", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_NSY", FIELD: "NSY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_GM", FIELD: "GM", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_SDA", FIELD: "SDA", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_LS", FIELD: "LS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_LR", FIELD: "LR", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_COMP", FIELD: "COMP", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_COMP_AU", FIELD: "COMP_AU", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_FLU", FIELD: "FLU", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_FON", FIELD: "FON", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"_ESC", FIELD: "ESC", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCLASS_ISTATION", CODE:"", FIELD: "", MAP_FUNCTION: mapChScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeDecode = {
        "-1" : "PreK",
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
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
       1 : "Tier 1"
       ,2 : "Tier 2"
       ,3 : "Tier 3"
       ,4 : "Tier 4"
       ,5 : "Tier 5"
       ,"" : null
       ,null : null
      };

    var passDecode = {
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

      var disabilityTypes =
      {
          "AU" : {CODE: "AU", TYPE: "Autism"},
          "DB" : {CODE: "DB", TYPE: "Deaf-blindness"},
          "ED" : {CODE: "ED", TYPE: "Emotional disturbance"},
          "HI" : {CODE: "HI", TYPE: "Hearing impairment"},
          "ID" : {CODE: "ID", TYPE: "Intellectual Disability"},
          "MD" : {CODE: "MD", TYPE: "Multiple disabilities"},
          "OI" : {CODE: "OI", TYPE: "Orthopedic impairment"},
          "OH" : {CODE: "OH", TYPE: "Other health impairment"},
          "LD" : {CODE: "SLD", TYPE: "Specific learning disability"},
          "SI" : {CODE: "SLI", TYPE: "Speech or language impairment"},
          "TB" : {CODE: "TB", TYPE: "Traumatic brain injury"},
          "VI" : {CODE: "VI", TYPE: "Visual Impairment"}
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
        try {
            var normalizedRecords = [];
            var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
            var record = mapNormalizedRecord(signature, hierarchy, row);
            AppUtil.nullSafePush(normalizedRecords, record);
            return normalizedRecords;
        } catch(e) {
            print("Error in mapNormalizedRecords : " , e);
        }
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
        try {
            //Map normalized admin fields
            record = mapNormalizedAdminFields(signature, hierarchy, row);
            //Map non-normalized admin fields
            mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

            if(signature.getFormat().getFormatName() === "ISTATION_17_1_COLS"){
                var testAdminDate = AppUtil.getMonthFollowedByDay(row.getField("UDATE"));
            }else{
                var testAdminDate = returnAdminDate(row);
            }

            var date = testAdminDate.STANDARD_DATE;
            if(date !== null && date !== undefined && date !== ""){
                //Map score fields for each expected score mapping
                scoresToMap.forEach(function(testMetadata) {
                    try {
                        var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
                    }
                });
            }


            // System Fields
            record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
            record.LINEAGE_SOURCE = _thisLineageSource;
            record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
            record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
            record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");
        } catch(e) {
            print("Error in mapNormalizedRecord : ${e}");
        }
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
        var sigName = signature.getFormat().getFormatName();
        //var birthDateObject = parseDate(row.getField("BIRTHDATE"), sigName);
        const birthDateObject = module.mapDateObject(hierarchy, row, row.getField("BIRTHDATE"));

        /*var testAdminDate = parseDate(row.getField("OVERALL_ADMIN_DATE"));*/
        if(sigName === "ISTATION_17_1_COLS"){
            var testAdminDate = AppUtil.getMonthFollowedByDay(row.getField("UDATE"));
        }else{
            var testAdminDate = returnAdminDate(row);
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
                    record.REPORTING_PERIOD = _util.coalesce(adminPeriod, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    // Add Default date
                    record.TEST_ADMIN_DATE = _util.coalesce(testAdminDate.STANDARD_DATE,"05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"), null);
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('FNAME'), "");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField('LNAME'), "");
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField('MNAME'), "");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = row.getField('GENDER');
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_RACE_CODE":
                    record.STUDENT_RACE_CODE = _util.coalesce(row.getField('RACE'), "");
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"),
                                            row.getField("SCHOOL_LOCAL_ID"),
                                            row.getField("SCHOOL_STATE_ID"),
                                            row.getField("SCHOOL_NAME"),
                                            row.getField("DOMAIN"));
                    break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("DOMAIN"));
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
    function mapScaledScore(row, testMetadata) {
        var score = {};

        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCORE");
        var percentile = row.getField(testMetadata.FIELD + "_PTILE");
		var achieveLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_LEVEL"),row.getField(testMetadata.FIELD + "_TIER"));
		var standardError = row.getField(testMetadata.FIELD + "_SE");

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
    	// Map the Levels to TEST_PRIMARY_RESULT_CODE
    	// Add the Overall_LEVEL to TPRC
    	score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
    	// Get the decode for TEST_PRIMARY_RESULT
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel]; //Primary result decode
    	score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_STANDARD_ERROR"] = standardError;
        return score;
    }

        function mapChScore(row, testMetadata, signature) {
        var score = {};
        if(signature.getFormat().getFormatName() !== "ISTATION_17_1_COLS"){
        return null;
        }

        testNumber = generateTestNumber(row, testMetadata, signature)

        var scaleScore = _util.coalesce(row.getField("SCORE"));
        var percentile = _util.coalesce(row.getField("PTILE"));
		var achieveLevel = _util.coalesce(row.getField("LEVEL"));
		var standardError = _util.coalesce(row.getField("STDERR"));

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
    	// Map the Levels to TEST_PRIMARY_RESULT_CODE
    	// Add the Overall_LEVEL to TPRC
    	score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
    	// Get the decode for TEST_PRIMARY_RESULT
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel]; //Primary result decode
    	score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_STANDARD_ERROR"] = standardError;
        return score;
    }
    function generateTestNumber(row, testMetadata, signature){
            if((skill1 !== null || skill1 !== undefined || skill1 !== "") && (signature.getFormat().getFormatName() === "ISTATION_17_1_COLS")){
            var skill1 = row.getField("SKILL");
            var testIDCode = null;
            if(skill1.indexOf('Math') > -1){
                testIDCode = 'MATH_OVR';
            } else if(skill1.indexOf('NSE') > -1){
                testIDCode = 'NS';
            } else if(skill1.indexOf('CA') > -1){
                testIDCode = 'CA';
            } else if(skill1.indexOf('G') > -1){
                testIDCode = 'G';
            } else if(skill1.indexOf('MD') > -1){
                testIDCode = 'MD';
            }
            var testNumber = testMetadata.TEST + "_" + testIDCode;

            return testNumber;
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
        if(signature.getFormat().getFormatName() === "ISTATION_17_1_COLS"){
            var testAdminDate = AppUtil.getMonthFollowedByDay(srcRecord.getField("UDATE"));
        }else{
            var testAdminDate = returnAdminDate(srcRecord);
        }
        var someTestDate = testAdminDate.STANDARD_DATE;
        if(someTestDate !== null && someTestDate !== undefined) {
            assessmentAdminKey = assessmentAdminKey + "_" + someTestDate;
        } else {
            assessmentAdminKey = assessmentAdminKey + "_" + "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9);
        }
        return assessmentAdminKey;
    }

    function parseDate(rawDate , sigName) {

        var dateObj = {
            RAW_DATE: rawDate,
            MONTH: null,
            DAY: null,
            YEAR: null,
            STANDARD_DATE: null
        };

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        var format;

        if (rawDate.indexOf('/') > -1 && sigName === "iStation_20_22") {
                format = 'MM/dd/yyyy';
        }
        else if (rawDate.indexOf('-') > -1 && sigName === "iStation_20_22"){
                format = 'MM-dd-yyyy';
        }
        else{
            if (rawDate.indexOf('/') > -1) {
                if (rawDate.split('/')[0].length === 4) {
                    format = 'yyyy/MM/dd';
                } else {
                    format = 'dd/MM/yyyy';
                }
            } else if (rawDate.indexOf('-') > -1) {
                if (rawDate.split('-')[0].length === 4) {
                    format = 'yyyy-MM-dd';
                } else {
                    format = 'dd-MM-yyyy';
                }
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

    function returnAdminDate(row) {
        var dates = [];
        //Some students only have certain dates, only those should be included or it causes an undefined date object.
        if(row.getField("OVERALL_ADMIN_DATE")!==null && row.getField("OVERALL_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("OVERALL_ADMIN_DATE")+"Z");
            if(t == "Invalid Date"||(row.getField("OVERALL_ADMIN_DATE").indexOf('-') > -1&&row.getField("OVERALL_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("OVERALL_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("OVERALL_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("LC2_ADMIN_DATE")!==null && row.getField("LC2_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("LC2_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("LC2_ADMIN_DATE").indexOf('-') > -1&&row.getField("LC2_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("LC2_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("LC2_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("LK_ADMIN_DATE")!==null && row.getField("LK_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("LK_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("LK_ADMIN_DATE").indexOf('-') > -1&&row.getField("LK_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("LK_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("LK_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("PA_ADMIN_DATE")!==null && row.getField("PA_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("PA_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("PA_ADMIN_DATE").indexOf('-') > -1&&row.getField("PA_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("PA_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("PA_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("AD_ADMIN_DATE")!==null && row.getField("AD_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("AD_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("AD_ADMIN_DATE").indexOf('-') > -1&&row.getField("AD_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("AD_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("AD_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("CMP_ADMIN_DATE")!==null && row.getField("CMP_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("CMP_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("CMP_ADMIN_DATE").indexOf('-') > -1&&row.getField("CMP_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("CMP_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("CMP_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("VOC_ADMIN_DATE")!==null && row.getField("VOC_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("VOC_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("VOC_ADMIN_DATE").indexOf('-') > -1&&row.getField("VOC_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("VOC_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("VOC_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("SPL_ADMIN_DATE")!==null && row.getField("SPL_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("SPL_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("SPL_ADMIN_DATE").indexOf('-') > -1&&row.getField("SPL_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("SPL_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("SPL_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("TF_ADMIN_DATE")!==null && row.getField("TF_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("TF_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("TF_ADMIN_DATE").indexOf('-') > -1&&row.getField("TF_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("TF_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("TF_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("ORF_ADMIN_DATE")!==null && row.getField("ORF_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("ORF_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("ORF_ADMIN_DATE").indexOf('-') > -1&&row.getField("ORF_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("ORF_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("ORF_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("JANUARY_ADMIN_DATE")!==null && row.getField("JANUARY_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("JANUARY_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("JANUARY_ADMIN_DATE").indexOf('-') > -1&&row.getField("JANUARY_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("JANUARY_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("JANUARY_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("FEBRUARY_ADMIN_DATE")!==null && row.getField("FEBRUARY_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("FEBRUARY_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("FEBRUARY_ADMIN_DATE").indexOf('-') > -1&&row.getField("FEBRUARY_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("FEBRUARY_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("FEBRUARY_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("MARCH_ADMIN_DATE")!==null && row.getField("MARCH_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("MARCH_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("MARCH_ADMIN_DATE").indexOf('-') > -1&&row.getField("MARCH_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("MARCH_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("MARCH_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("APRIL_ADMIN_DATE")!==null && row.getField("APRIL_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("APRIL_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("APRIL_ADMIN_DATE").indexOf('-') > -1&&row.getField("APRIL_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("APRIL_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("APRIL_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("MAY_ADMIN_DATE")!==null && row.getField("MAY_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("MAY_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("MAY_ADMIN_DATE").indexOf('-') > -1&&row.getField("MAY_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("MAY_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("MAY_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("JUNE_ADMIN_DATE")!==null && row.getField("JUNE_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("JUNE_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("JUNE_ADMIN_DATE").indexOf('-') > -1&&row.getField("JUNE_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("JUNE_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("JUNE_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("JULY_ADMIN_DATE")!==null && row.getField("JULY_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("JULY_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("JULY_ADMIN_DATE").indexOf('-') > -1&&row.getField("JULY_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("JULY_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("JULY_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("AUGUST_ADMIN_DATE")!==null && row.getField("AUGUST_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("AUGUST_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("AUGUST_ADMIN_DATE").indexOf('-') > -1&&row.getField("AUGUST_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("AUGUST_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("AUGUST_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("SEPTEMBER_ADMIN_DATE")!==null && row.getField("SEPTEMBER_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("SEPTEMBER_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("SEPTEMBER_ADMIN_DATE").indexOf('-') > -1&&row.getField("SEPTEMBER_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("SEPTEMBER_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("SEPTEMBER_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("OCTOBER_ADMIN_DATE")!==null && row.getField("OCTOBER_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("OCTOBER_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("OCTOBER_ADMIN_DATE").indexOf('-') > -1&&row.getField("OCTOBER_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("OCTOBER_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("OCTOBER_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("NOVEMBER_ADMIN_DATE")!==null && row.getField("NOVEMBER_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("NOVEMBER_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("NOVEMBER_ADMIN_DATE").indexOf('-') > -1&&row.getField("NOVEMBER_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("NOVEMBER_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("NOVEMBER_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("DECEMBER_ADMIN_DATE")!==null && row.getField("DECEMBER_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("DECEMBER_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("DECEMBER_ADMIN_DATE").indexOf('-') > -1&&row.getField("DECEMBER_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("DECEMBER_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("DECEMBER_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("MATH_OVERALL_ADMIN_DATE")!==null && row.getField("MATH_OVERALL_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("MATH_OVERALL_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("MATH_OVERALL_ADMIN_DATE").indexOf('-') > -1&&row.getField("MATH_OVERALL_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("MATH_OVERALL_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("MATH_OVERALL_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("NS_ADMIN_DATE")!==null && row.getField("NS_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("NS_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("NS_ADMIN_DATE").indexOf('-') > -1&&row.getField("NS_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("NS_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("NS_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("MD_ADMIN_DATE")!==null && row.getField("MD_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("MD_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("MD_ADMIN_DATE").indexOf('-') > -1&&row.getField("MD_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("MD_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("MD_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("G_ADMIN_DATE")!==null && row.getField("G_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("G_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("G_ADMIN_DATE").indexOf('-') > -1&&row.getField("G_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("G_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("G_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("CA_ADMIN_DATE")!==null && row.getField("CA_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("CA_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("CA_ADMIN_DATE").indexOf('-') > -1&&row.getField("CA_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("CA_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("CA_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("GM_ADMIN_DATE")!==null && row.getField("GM_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("GM_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("GM_ADMIN_DATE").indexOf('-') > -1&&row.getField("GM_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("GM_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("GM_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("NSY_ADMIN_DATE")!==null && row.getField("NSY_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("NSY_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("NSY_ADMIN_DATE").indexOf('-') > -1&&row.getField("NSY_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("NSY_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("NSY_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("SDA_ADMIN_DATE")!==null && row.getField("SDA_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("SDA_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("SDA_ADMIN_DATE").indexOf('-') > -1&&row.getField("SDA_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("SDA_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("SDA_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("LR_ADMIN_DATE")!==null && row.getField("LR_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("LR_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("LR_ADMIN_DATE").indexOf('-') > -1&&row.getField("LR_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("LR_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("LR_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("COMP_AU_ADMIN_DATE")!==null && row.getField("COMP_AU_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("COMP_AU_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("COMP_AU_ADMIN_DATE").indexOf('-') > -1&&row.getField("COMP_AU_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("COMP_AU_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("COMP_AU_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("COMP_ADMIN_DATE")!==null && row.getField("COMP_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("COMP_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("COMP_ADMIN_DATE").indexOf('-') > -1&&row.getField("COMP_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("COMP_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("COMP_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("FLU_ADMIN_DATE")!==null && row.getField("FLU_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("FLU_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("FLU_ADMIN_DATE").indexOf('-') > -1&&row.getField("FLU_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("FLU_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("FLU_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("FON_ADMIN_DATE")!==null && row.getField("FON_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("FON_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("FON_ADMIN_DATE").indexOf('-') > -1&&row.getField("FON_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("FON_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("FON_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("LS_ADMIN_DATE")!==null && row.getField("ESC_ADMIN_DATE") !== "" && row.getField("ESC_ADMIN_DATE") !== null){
            let t = new Date(row.getField("ESC_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("ESC_ADMIN_DATE").indexOf('-') > -1&&row.getField("ESC_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("ESC_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("ESC_ADMIN_DATE")+"Z"));
            }
        }
        if(row.getField("LS_ADMIN_DATE")!==null && row.getField("LS_ADMIN_DATE") !== ""){
            let t = new Date(row.getField("LS_ADMIN_DATE")+"Z");
            if(t == "Invalid Date" || (row.getField("LS_ADMIN_DATE").indexOf('-') > -1&&row.getField("LS_ADMIN_DATE").split('-')[0].length === 2)) {
                var date = row.getField("LS_ADMIN_DATE");
                var arr = date.split("-");
                var result = arr[1] + '/' + arr[0] + '/' + arr[2];
                dates.push(new Date(result+"Z"));
            } else {
                dates.push(new Date(row.getField("LS_ADMIN_DATE")+"Z"));
            }
        }
        var maximumDate=new Date(Math.max.apply(null, dates));
        var isoD = maximumDate.toISOString();
        var format = (isoD.substring(0,10));
        return parseDate(format);
    }

    module.mapDateObject = function(hierarchy, row, dateStr) {
            //Create empty test date object.
        var testDateObject = null

        //Admin dates in file are yyyyMMdd format or dd-MMM format.  Attempt to map both.
        try {
           testDateObject = AppUtil.getDateObjByPattern(dateStr, "M/dd/yy");
        } catch (exception) {
              // Error will be reported in final check.
        }
        try {
           testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yy");
        } catch (exception) {
              // Error will be reported in final check.
        }
        try {
           testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy-MM-dd");
        } catch (exception) {
              // Error will be reported in final check.
        }

        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM/dd/yyyy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }
        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "MM-dd-yyyy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }

        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "yyyy/MM/dd");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }
        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd-MM-yyyy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }
        if (testDateObject === null) {
           try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd/MM/yyyy");
           } catch (exception) {
              // Error will be reported in final check.
           }
        }

        // Set default empty objects if mappings fail and report error.
        if (testDateObject === null) {
           testDateObject = AppUtil.getEmptyDateObj(dateStr);
           AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing date string: ${dateStr}", JSON.stringify(row.getSourceRow())));
        }

        return testDateObject;
     }

    return module;
}());