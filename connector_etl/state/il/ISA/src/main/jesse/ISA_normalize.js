var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ISA";
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
        {TEST: "ISA_", CODE:"_SCI_OVR", FIELD: "SCALE_", MAP_FUNCTION: mapOverallScore},
        {TEST: "ISA_", CODE:"_SCI_LIFE", FIELD: "LIFE_", MAP_FUNCTION: mapScienceScore},
        {TEST: "ISA_", CODE:"_SCI_EARTH", FIELD: "EARTH_SPACE_", MAP_FUNCTION: mapScienceScore},
        {TEST: "ISA_", CODE:"_SCI_PHYS", FIELD: "PHYSICAL_", MAP_FUNCTION: mapScienceScore},
        {TEST: "ISA_", CODE: "RD", FIELD:"READING", MAP_FUNCTION: mapScienceScore},
        {TEST: "ISA_", CODE: "WR", FIELD:"WRITING", MAP_FUNCTION: mapScienceScore},

        //ClaimSCores
        {TEST: "ISA_",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"1_CAT1", NAME: "ELASUBCLAIM1CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},
        {TEST: "ISA_",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"2_CAT2", NAME: "ELASUBCLAIM2CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},
        {TEST: "ISA_",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"3_CAT3", NAME: "ELASUBCLAIM3CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},
        {TEST: "ISA_",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"4_CAT4", NAME: "SELAUBCLAIM4CATEGORY", MAP_FUNCTION: mapSubclaimsCategory},
        {TEST: "ISA_",  FIELD:"SUB_MA", CODE: "SUB_ELA", CATEGORY:"5_CAT5", NAME: "ELASUBCLAIM5CATEGORY", MAP_FUNCTION: mapSubclaimsCategory}
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
        "SCI05": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "SCI08": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "SCI09": "09",
        "10": "10",
        "Grade 10": "10",
        "SCI10": "10",
        "11": "11",
        "Grade 11": "11",
        "SCI11": "11",
        "12": "12",
        "Grade 12": "12",
        "SCI12": "12",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
       "Proficient" : "Meets the standard"
       , "Not Proficient" : "Does not meet the standard"
       , "Exemplary" : "Exceeds the standard"
       , "Developing" : "Does not meet the standard"
       , "Emerging" : "Shows a partial application of knowledge and skills"
       , "Suppressed (S9)" : "Suppressed (S9)"
       , "Suppressed (S10)" : "Suppressed (S10)"
       , "Suppressed (S15)" : "Suppressed (S15)"
       , "Suppressed (S16)" : "Suppressed (S16)"
       , "BLANK" : null
       ,"" : null
       ,null : null
      };
    
    var numericDecode = {
        "1": "Emerging",
        "2": "Developing",
        "3": "Proficient",
        "4": "Exemplary",
        "" : null,
        null : null
    };

    var passDecode = {
       "Proficient" : "YES"
       , "Not Proficient" : "NO"
       , "Exemplary" : "YES"
       , "Developing" : "NO"
       , "Emerging" : "NO"
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
    function mapNormalizedAdminFields(signature, hierarchy, row) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }

        var birthDate = _util.coalesce(row.getField("DATE_OF_BIRTH"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }
        //print(JSON.stringify(birthDateObject))
        var fullName = row.getField("STUDENT_FULL_NAME");
        var firstName, lastName;
        if(fullName !== null && fullName !== undefined){
            firstName = _util.trim(fullName.split(",")[1]);
            lastName = fullName.split(",")[0];
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
                    record.TEST_ADMIN_DATE = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID =  _util.coalesce(row.getField("STUDENT_STATE_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID =  _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(firstName,row.getField('FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(lastName,row.getField('LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_ID"),row.getField("SCHOOL_NAME"));
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

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapOverallScore(row, testMetadata) {
        var score = {};
        var gradeObj = gradeDecode[row.getField("GRADE")];
        var testNumber = testMetadata.TEST + gradeObj + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "SCORE");
		var achieveLevel = row.getField("PERFORMANCE_BAND");
		var achieveLevelNum = row.getField("PERFORMANCE_NUMBER");
		var scoredItems = row.getField("NUMBER_OF_TEST_ITEMS_ATTEMPTED");
		var totItems = row.getField("TOTAL_NUMBER_OF_TEST_ITEMS");
		var testCSEM = row.getField("TESTCSEM");


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
            score["TEST_STANDARD_ERROR"] = testCSEM;
        }
        if(!isNaN(scoredItems)){
            score["TEST_ITEMS_ATTEMPTED"] = scoredItems;
        }
        if(!isNaN(totItems)){
            score["TEST_ITEMS_POSSIBLE"] = totItems;
        }


        if(achieveLevelNum !== null && achieveLevelNum !== undefined) {
            achieveLevel = numericDecode[achieveLevelNum];
        }
        if(gradeObj === '05'){
            if(achieveLevel === 'Not Proficient' && scaleScore >=200 && scaleScore <=295){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Proficient' && scaleScore >=296 && scaleScore <=400){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Proficient' && scaleScore >=599 && scaleScore <=628){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if((achieveLevel === 'Proficient' || achieveLevel === '3') && scaleScore >=799 && scaleScore <=832){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Exemplary' && scaleScore >=629 && scaleScore <=700){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else if((achieveLevel === 'Exemplary' || achieveLevel === '4') && scaleScore >=833 && scaleScore <=900){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Developing' && scaleScore >=576 && scaleScore <=597){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else if((achieveLevel === 'Developing' || achieveLevel === '2') && scaleScore >=770 && scaleScore <=798){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Emerging' && scaleScore >=500 && scaleScore <=575){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else if((achieveLevel === 'Emerging' || achieveLevel === '1') && scaleScore >=700 && scaleScore <=769){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else {
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }
        }
        if (gradeObj === '08'){
            if(achieveLevel === 'Not Proficient' && scaleScore >=200 && scaleScore <=292){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Proficient' && scaleScore >=293 && scaleScore <=400){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Proficient' && scaleScore >=597 && scaleScore <=624){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else if((achieveLevel === 'Proficient' || achieveLevel === '3') && scaleScore >=799 && scaleScore <=831){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Exemplary' && scaleScore >=625 && scaleScore <=700){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else if((achieveLevel === 'Exemplary' || achieveLevel === '4') && scaleScore >=832 && scaleScore <=900){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Developing' && scaleScore >=566 && scaleScore <=596){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else if((achieveLevel === 'Developing' || achieveLevel === '2') && scaleScore >=771 && scaleScore <=798){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if(achieveLevel === 'Emerging' && scaleScore >=500 && scaleScore <=565){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else if((achieveLevel === 'Emerging' || achieveLevel === '1') && scaleScore >=700 && scaleScore <=770){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else {
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }
        }
        if(gradeObj === '09'){
            score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
            score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
        }
        if (gradeObj === '11'){
            if(achieveLevel === 'Not Proficient' && scaleScore >=200 && scaleScore <=292){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if((achieveLevel === 'Proficient' || achieveLevel === '3') && scaleScore >=796 && scaleScore <=833){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if((achieveLevel === 'Developing' || achieveLevel === '2') && scaleScore >=773 && scaleScore <=795){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            } else if((achieveLevel === 'Emerging' || achieveLevel === '1') && scaleScore >=700 && scaleScore <=772){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else if((achieveLevel === 'Exemplary' || achieveLevel === '4') && scaleScore >=834 && scaleScore <=900){
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }else {
                    score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
                    score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
            }
        }
        if(gradeObj === '10'){
            score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
            score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
        }
        if(gradeObj === '12'){
            score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            score["TEST_PRIMARY_RESULT"] = primaryDecode[achieveLevel];
            score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
        }

        return score;
    }


    function mapScienceScore(row, testMetadata) {
        var score = {};
        var gradeObj = gradeDecode[_util.coalesce(row.getField("TEST_TAKEN"), row.getField("GRADE"))];//Use test's grade, not student's grade
        var testNumber = testMetadata.TEST + gradeObj + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "SCIENCE_SCALE_SCORE");
        var percentileRank = row.getField(testMetadata.FIELD + "SCIENCE_PERCENTILE_RANK");
        var testCSEM = row.getField(testMetadata.FIELD + "_CSEM");

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
            score["TEST_STANDARD_ERROR"] = testCSEM;
        }
        print(testNumber+ " scaled score "+scaleScore+"\n");
        if(!isNaN(percentileRank)) {
            score["TEST_PERCENTILE_SCORE"] = percentileRank;
           // score["TEST_PRIMARY_RESULT"] = percentileRank;
            //score["TEST_PRIMARY_RESULT_CODE"] = "PTILE";
        }

        return score;
    }

    function mapSubclaimsCategory(row, testMetadata) {
                var score = {};
                var subject = null;
                var mapCode = null;
                var category = null;
                var testCode = _util.coalesce(row.getField("TEST"));
                if(testCode !== null && testCode !== undefined) {
                    if((testCode.indexOf("MAT")> -1) || testCode === 'M'){
                        subject = 'MAT';
                    } else if((testCode.indexOf("ELA")> -1) || testCode === 'E'){
                        subject = 'ELA';
                    }
                } else {
                    return null;
                }

                if (subject === "ELA"){
                    if(testMetadata.CODE === "SUB_ELA"){
                        category = testMetadata.CATEGORY.split("_")[1];//1_cat1
                    }
                } else if (subject === "MAT"){
                    if(testMetadata.FIELD === "SUB_MA"){
                        category = testMetadata.CATEGORY.split("_")[1];

                    }
                }
                var testNumber = testMetadata.TEST + subject + gradeLookup[row.getField("STUDENT_GRADE_CODE")] + "_" + category;
                var performanceLevel = row.getField("SUBCLAIM" + testMetadata.CATEGORY);

                if((_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === ""
                   || _util.trim(performanceLevel) === "N/A" || _util.trim(performanceLevel) === "n/a" || _util.trim(performanceLevel) === "Undetermined")) {
                   return null;
                }
                score["TEST_NUMBER"] = testNumber;
                score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
                score["TEST_PRIMARY_RESULT"] = decodePerformanceLevel[performanceLevel].TEST_RESULT;

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
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        

        return assessmentAdminKey;
    }

    return module;
}());