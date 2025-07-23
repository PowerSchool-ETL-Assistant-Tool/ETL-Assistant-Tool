var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MCAPMISA";
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
         {TEST: "MCAPMISA", CODE:"OVR", MAP_FUNCTION: mapTotalScore}

        //,{TEST: "MCAP", CODE:"ISR",FIELD: "OVR", SUBJECT: "SCI", MAP_FUNCTION: mapOverallScores}


        //scores for Level2ElementScores
        ,{TEST: "MCAPMISA", CODE:"LVL2ELEM1", FIELD: "LEVEL2ELEMENT1", MAP_FUNCTION: elementScore}
        ,{TEST: "MCAPMISA", CODE:"LVL2ELEM2", FIELD: "LEVEL2ELEMENT2", MAP_FUNCTION: elementScore}
        ,{TEST: "MCAPMISA", CODE:"LVL2ELEM3", FIELD: "LEVEL2ELEMENT3", MAP_FUNCTION: elementScore}
        ,{TEST: "MCAPMISA", CODE:"LVL2ELEM4", FIELD: "LEVEL2ELEMENT4", MAP_FUNCTION: elementScore}
        ,{TEST: "MCAPMISA", CODE:"LVL2ELEM5", FIELD: "LEVEL2ELEMENT5", MAP_FUNCTION: elementScore}
        ,{TEST: "MCAPMISA", CODE:"LVL2ELEM6", FIELD: "LEVEL2ELEMENT6", MAP_FUNCTION: elementScore}
        ,{TEST: "MCAPMISA", CODE:"LVL2ELEM7", FIELD: "LEVEL2ELEMENT7", MAP_FUNCTION: elementScore}


        // UNIT SCORE
        ,{TEST: "MCAPMISA", CODE:"PHYSCI_", FIELD: "PHYSICALSCIENCE", MAP_FUNCTION: mapStrandSciPerformanceLevel} //TestPhysicalSciencePerformanceLevel
        ,{TEST: "MCAPMISA", CODE:"EARTHSPCSCI_", FIELD: "EARTHANDSPACESCIENCE", MAP_FUNCTION: mapStrandSciPerformanceLevel}//TestEarthandSpaceSciencePerformanceLevel
        ,{TEST: "MCAPMISA", CODE:"LISCI_", FIELD: "LIFESCIENCE", MAP_FUNCTION: mapStrandSciPerformanceLevel}//TestLifeSciencePerformanceLevel
        ,{TEST: "MCAPMISA", CODE:"EVFAMDI_", FIELD: "EVIDENCEFAMILYDATAINFORMATION", MAP_FUNCTION: mapStrandSciPerformanceLevel} //EvidenceFamilyDataAndInformationPeformanceLevel
        ,{TEST: "MCAPMISA", CODE:"EVFAMREA_", FIELD: "EVIDENCEFAMILYREASONING", MAP_FUNCTION: mapStrandSciPerformanceLevel}//EvidenceFamilyReasoningPeformanceLevel
        ,{TEST: "MCAPMISA", CODE:"EVFAMPH_", FIELD: "EVIDENCEFAMILYPHENOMENA", MAP_FUNCTION: mapStrandSciPerformanceLevel}//EvidenceFamilyPhenomenaPerformanceLevel
        ,{TEST: "MCAPMISA", CODE:"EVIMODCOM_", FIELD: "EVIDENCEFAMILYMODELCOMPONENTS", MAP_FUNCTION: mapStrandSciPerformanceLevel}//EvidenceFamilyModelComponentsPerformanceLevel
        ,{TEST: "MCAPMISA", CODE:"U1", FIELD: "UNIT1", MAP_FUNCTION: mapUnitScore}
        ,{TEST: "MCAPMISA", CODE:"U2", FIELD: "UNIT2", MAP_FUNCTION: mapUnitScore}
        ,{TEST: "MCAPMISA", CODE:"U3", FIELD: "UNIT3", MAP_FUNCTION: mapUnitScore}
        ,{TEST: "MCAPMISA", CODE:"U4", FIELD: "UNIT4", MAP_FUNCTION: mapUnitScore}

        //Sub Score
        ,{TEST: "MCAPMISA", CODE:"SUB1", FIELD: "SUBSCORE_1_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAPMISA", CODE:"SUB2", FIELD: "SUBSCORE_2_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAPMISA", CODE:"SUB3", FIELD: "SUBSCORE_3_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAPMISA", CODE:"SUB4", FIELD: "SUBSCORE_4_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAPMISA", CODE:"SUB5", FIELD: "SUBSCORE_5_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAPMISA", CODE:"SUB6", FIELD: "SUBSCORE_6_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAPMISA", CODE:"SUB7", FIELD: "SUBSCORE_7_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAPMISA", CODE:"SUB8", FIELD: "SUBSCORE_8_", MAP_FUNCTION: mapSubScore}

        //Sub Score Category
        ,{TEST: "MCAPMISA", CODE:"SUBCAT1", FIELD: "SUBSCORECAT_1_", MAP_FUNCTION: mapSubScoreCategory}
        ,{TEST: "MCAPMISA", CODE:"SUBCAT2", FIELD: "SUBSCORECAT_2_", MAP_FUNCTION: mapSubScoreCategory}
        ,{TEST: "MCAPMISA", CODE:"SUBCAT3", FIELD: "SUBSCORECAT_3_", MAP_FUNCTION: mapSubScoreCategory}
        ,{TEST: "MCAPMISA", CODE:"SUBCAT4", FIELD: "SUBSCORECAT_4_", MAP_FUNCTION: mapSubScoreCategory}
        ,{TEST: "MCAPMISA", CODE:"SUBCAT5", FIELD: "SUBSCORECAT_5_", MAP_FUNCTION: mapSubScoreCategory}
        ,{TEST: "MCAPMISA", CODE:"SUBCAT6", FIELD: "SUBSCORECAT_6_", MAP_FUNCTION: mapSubScoreCategory}
        ,{TEST: "MCAPMISA", CODE:"SUBCAT7", FIELD: "SUBSCORECAT_7_", MAP_FUNCTION: mapSubScoreCategory}
        ,{TEST: "MCAPMISA", CODE:"SUBCAT8", FIELD: "SUBSCORECAT_8_", MAP_FUNCTION: mapSubScoreCategory}

        // Test Conversion Grade important score to map
        ,{TEST: "MCAPMISA", CODE:"GRDCONV", FIELD: "GRADE_CONVERSION_", MAP_FUNCTION: mapFinalGrade}

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
    var performanceLevelDecode = {
        "1" : {DESC:  "Partially Met Expectations" , PASS_IND: "No"}
        ,"2" : {DESC: "Approached Expectations" ,  PASS_IND: "No"}
        ,"3" : {DESC: "Met Expectations" ,  PASS_IND: "Yes"}
        ,"4" : {DESC: "Exceeded Expectations" ,  PASS_IND: "Yes"}
        ,"5" : {DESC: "Exceeded Expectations" ,  PASS_IND: "Yes"}
        ,"" : {DESC: null ,  PASS_IND: ""}
        ,null : {DESC: null ,  PASS_IND: null}
        ,undefined  : {DESC: null , PASS_IND: null}
    };
    var primaryDecode = {
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
      var genderDecodes = {
      "1" : "M"
      ,"2" : "F"
      ,"F": "F"
      ,"M": "M"
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
                 AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
        var birthDateObject = row.getField("STUDENT_BIRTHDATE");
        if(birthDateObject !== null && birthDateObject !== undefined && birthDateObject !== ""){
            birthDateObject = getBirthObj(birthDateObject);
        }

    function getBirthObj(birthDate){
            trimmedDate = birthDate.split(" ")
            var birthdate = trimmedDate[0];
            return AppUtil.getMonthFollowedByDay(birthdate);
    }

    var testAdminDate = _util.coalesce(row.getField("TESTENDDATETIME"));


    if(testAdminDate!== null && testAdminDate !== undefined && testAdminDate !== "") {
        testAdminDate = AppUtil.getMonthFollowedByDay(testAdminDate).STANDARD_DATE;
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
                    record.REPORTING_PERIOD =  _util.coalesce(getReportingPeriod(row, hierarchy), hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE =  _util.coalesce(testAdminDate, adminDate(row, hierarchy) , getTestAdminDate(row, hierarchy) );
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_ID")
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
                    record.STUDENT_GENDER_CODE = genderDecodes[row.getField("GENDER")];

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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"),row.getField("SCHOOL"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL"));
                     break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
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
    function getReportingPeriod(row,hierarchy){
                if(row.getField("PERIOD_CODE")){
                var periodCode = row.getField("PERIOD_CODE").toUpperCase();
                if( periodCode !== null || periodCode !== undefined){
                    if(periodCode === "1" || periodCode === "FALL"){
                        periodCode = "FALL";
                    }else if(periodCode === "2" || periodCode === "WINTER"){
                        periodCode = "WINTER";
                    }else if(periodCode === "3" || periodCode === "SPRING"){
                        periodCode = "SPRING";
                    }else{
                        return null;
                    }
                }
                }
                return periodCode;
    }
    function adminDate(row,hierarchy){
            var testAdmin;
            var periodCode = getReportingPeriod(row,hierarchy);
            if(periodCode === "SPRING"){
            testAdmin = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5, 9);
            }
            else if(periodCode === "FALL"){
            testAdmin = "09/15/"+hierarchy.SCHOOL_YEAR.substring(0, 4);
            }
            else if(periodCode === "WINTER"){
            testAdmin = "01/15/"+hierarchy.SCHOOL_YEAR.substring(5, 9);
            }
            else{
            return null;
            }
            return testAdmin;
    }




    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapTotalScore(row, testMetadata) {
            var score = {};
            var subject = row.getField("TEST_CODE");
            var testNumber =  testMetadata.TEST + "_" + subject + "_" + testMetadata.CODE;//MCAPMISA_SCI05_OVR
            var scaleScore = row.getField("SCALE_SCORE");
            var perfLevel = row.getField("PERFORMANCE_LEVEL");
            var perfLevelName = performanceLevelDecode[row.getField("PERFORMANCE_LEVEL")];
            var rawScore = row.getField("RAW_SCORE");
            var items = row.getField("TOTAL_TEST_ITEMS");
            var itemsAttempted = row.getField("TOTAL_TEST_ITEMS_ATTEMPTED");
            var percentOfItemsAttempted =  row.getField("PERCENTOFITEMSATTEMPTED");
            var testCSEM = row.getField("TESTCSEM");
            var iRTTheta = row.getField("IRTTHETA");
            var className = row.getField("CLASS_NAME");

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
                score["TEST_RAW_SCORE"] = rawScore;
                score["TEST_ITEMS_POSSIBLE"] = items;
                score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;
                score["TEST_STANDARD_ERROR"] = testCSEM;
                score["TEST_Z_SCORE"] = iRTTheta;

            }
        	score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[perfLevel].PASS_IND;
        	score["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
        	score["TEST_PRIMARY_RESULT"] = perfLevelName.DESC;
        	score["TEST_PERCENTAGE_SCORE"] = percentOfItemsAttempted;
        	score["TEST_SCORE_ATTRIBUTES"] = className;
            return score;

        }

        function elementScore(row, testMetadata) {
                var score = {};
                var subject = row.getField("TEST_CODE");
                var testNumber =  testMetadata.TEST + "_" + subject + "_" + testMetadata.CODE;//MCAPMISA_SCI05_LVL2ELEM1
                var scaleScore = row.getField(testMetadata.CODE + "_" + "SCALESCORE"); //LVL2ELEM1_SCALESCORE
                var perfLevel = row.getField(testMetadata.CODE + "_" + "PERFORMANCELEVEL");//LVL2ELEM1_PERFORMANCELEVEL
                var perfLevelName = performanceLevelDecode[perfLevel];
                var totalTestItems =  row.getField(testMetadata.CODE + "_"  + "ATTEMPTEDITEMS");//LVL2ELEM1_ATTEMPTEDITEMS

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
                score["TEST_PASSED_INDICATOR"] = perfLevelName.PASS_IND;
                score["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
                score["TEST_PRIMARY_RESULT"] = perfLevelName.DESC;
                score["TEST_ITEMS_ATTEMPTED"] = totalTestItems;
                return score;
        }

        function mapUnitScore(row, testMetadata) {
                var score = {};
                var TestCode = row.getField("TEST_CODE");
                var testNumber = testMetadata.TEST + testMetadata.CODE + TestCode;
                var unitTotalItems = row.getField(testMetadata.FIELD + "_" + "TOTALTESTITEMS");
                var unitItemAttempted = row.getField(testMetadata.FIELD + "_" + "ATTEMPTEDITEMS");
                if(unitTotalItems === null || unitTotalItems === undefined || _util.trim(unitTotalItems) === "--" || _util.trim(unitTotalItems) === ""){
                    return null;
                }

                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                if(!isNaN(unitTotalItems)){
                    score["TEST_ITEMS_POSSIBLE"] = unitTotalItems;
                    score["TEST_ITEMS_ATTEMPTED"] = unitItemAttempted;
                }

                return score;
        }
        function mapStrandSciPerformanceLevel(row, testMetadata){
               var score = {};
               var TestCode = row.getField("TEST_CODE");
               var testNumber = testMetadata.TEST + testMetadata.CODE + TestCode;
               var prefLevel = row.getField(testMetadata.FIELD + "_" + "PERFORMANCE_LEVEL");
               var prefLevelDecode = performanceLevelDecode[prefLevel];


               // Check for key fields and do not map score and exit if conditions met.
               if( prefLevel === null || prefLevel === undefined || _util.trim(prefLevel) === "--" ) {
                  return null;
               }


               // Set score fields
               score["TEST_NUMBER"] = testNumber;
               score["TEST_PRIMARY_RESULT_CODE"] = prefLevel;
               score["TEST_PRIMARY_RESULT"] = prefLevelDecode.DESC;
               score["TEST_PASSED_INDICATOR"] = prefLevelDecode.PASS_IND;

               return score;
            }

        function mapSubScore(row, testMetadata) {
                var score = {};
                var subject = _util.coalesce(row.getField("TEST_CODE"));
                var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + subject;
                var subScaleScore = row.getField(testMetadata.FIELD  + "SS");

                // Check for key fields and do not map score and exit if conditions met.
                if(subScaleScore === null || subScaleScore === undefined || _util.trim(subScaleScore) === "--" || _util.trim(subScaleScore) === "")
                {
                    return null;
                }
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCALED_SCORE"] = subScaleScore;

                return score;
            }


        function mapSubScoreCategory(row, testMetadata) {
                var score = {};
                var subject = _util.coalesce(row.getField("TEST_CODE"));
                var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + subject;
                var subCategoryScaleScore = row.getField(testMetadata.FIELD  + "CAT");

                // Check for key fields and do not map score and exit if conditions met.
                if(subCategoryScaleScore === null || subCategoryScaleScore === undefined || _util.trim(subCategoryScaleScore) === "--" || _util.trim(subCategoryScaleScore) === "")
                {
                    return null;
                }
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCALED_SCORE"] = subCategoryScaleScore;

                return score;
            }

        function mapFinalGrade(row, testMetadata) {
                var score = {};
                var subject = row.getField("TEST_CODE");
                var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + subject;
                var gradeScore = row.getField("GRADE_CONVERSION_SCALE_SCORE");

                // Check for key fields and do not map score and exit if conditions met.
                if(gradeScore === null || gradeScore === undefined || _util.trim(gradeScore) === "--" || _util.trim(gradeScore) === "")
                {
                    return null;
                }
                // Set score fields
                score["TEST_NUMBER"] = testNumber;
                score["TEST_SCALED_SCORE"] = gradeScore;

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

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
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
                var testDate1 = row.getField("TEST1DATETIME");
                var testDate2 = row.getField("TEST2DATETIME");
                var testDate3 = row.getField("TEST3DATETIME");
                var testDate4 = row.getField("TEST4DATETIME");
                var dates = [];
                if(testDate1!==null && testDate1 !== ""){
                    testDate1 = testDate1.substring(0,10);
                    dates.push(new Date(testDate1 + "Z"));
                }
                if(testDate2!==null && testDate2 !== ""){
                    testDate2 = testDate2.substring(0,10);
                    dates.push(new Date(testDate2 + "Z"));
                }
                if(testDate3!==null && testDate3 !== ""){
                    testDate3 = testDate3.substring(0,10);
                    dates.push(new Date(testDate3 +"Z"));
                }
                if(testDate4!==null && testDate4 !== ""){
                    testDate4 = testDate4.substring(0,10);
                    dates.push(new Date(testDate4 +"Z"));
                }
                if(dates.length == 0) {
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


    return module;
}());