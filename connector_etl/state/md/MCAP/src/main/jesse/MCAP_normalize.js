var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MCAP";
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
			print("Loading using signature file ${signatureFormatName}\n");

			//Initialize path and lineage variables.
			var normalizedFile = AppUtil.createResultsFile(file);

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
         {TEST: "MCAP_", CODE:"OVR", FIELD: "TEST_",  MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ALT_MCAP_", CODE:"OVR", FIELD: "OVR_",  MAP_FUNCTION: mapPerfLevel}
         //Level Scores
        ,{TEST: "MCAP_", CODE:"LEVEL2_", FIELD: "ELEMENT1_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL2_", FIELD: "ELEMENT2_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL2_", FIELD: "ELEMENT3_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL2_", FIELD: "ELEMENT4_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL2_", FIELD: "ELEMENT5_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL2_", FIELD: "ELEMENT6_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL2_", FIELD: "ELEMENT7_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "ELEMENT1_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "ELEMENT2_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "ELEMENT3_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "ELEMENT4_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "ELEMENT5_",MAP_FUNCTION: mapLevelScore}
        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "ELEMENT6_",MAP_FUNCTION: mapLevelScore}

        ,{TEST: "MCAP_", CODE:"PPR_UNIT_1", FIELD: "PAPER_UNIT1", MAP_FUNCTION: mapTotalScore}
        ,{TEST: "MCAP_", CODE:"PPR_UNIT_2", FIELD: "PAPER_UNIT2", MAP_FUNCTION: mapTotalScore}
        ,{TEST: "MCAP_", CODE:"PPR_UNIT_3", FIELD: "PAPER_UNIT3", MAP_FUNCTION: mapTotalScore}
        ,{TEST: "MCAP_", CODE:"PPR_UNIT_4", FIELD: "PAPER_UNIT4", MAP_FUNCTION: mapTotalScore}

        ,{TEST: "MCAP_", CODE:"ONL_UNIT_1", FIELD: "ONLINE_UNIT1", MAP_FUNCTION: mapTotalScore}
        ,{TEST: "MCAP_", CODE:"ONL_UNIT_2", FIELD: "ONLINE_UNIT2", MAP_FUNCTION: mapTotalScore}
        ,{TEST: "MCAP_", CODE:"ONL_UNIT_3", FIELD: "ONLINE_UNIT3", MAP_FUNCTION: mapTotalScore}
        ,{TEST: "MCAP_", CODE:"ONL_UNIT_4", FIELD: "ONLINE_UNIT4", MAP_FUNCTION: mapTotalScore}

        ,{TEST: "MCAP_", CODE:"OVR", FIELD: "SUMMATIVE_",  MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCAP_", CODE:"RD_OVR", FIELD: "READING_",  MAP_FUNCTION: mapComponentScore}
        ,{TEST: "MCAP_", CODE:"WR_OVR", FIELD: "WRITING_",  MAP_FUNCTION: mapComponentScore}

        ,{TEST: "MCAP_", CODE:"SUBCLM1", FIELD: "SUBCLAIM1_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "MCAP_", CODE:"SUBCLM2", FIELD: "SUBCLAIM2_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "MCAP_", CODE:"SUBCLM3", FIELD: "SUBCLAIM3_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "MCAP_", CODE:"SUBCLM4", FIELD: "SUBCLAIM4_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "MCAP_", CODE:"SUBCLM5", FIELD: "SUBCLAIM5_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "MCAP_", CODE:"SUBCLM6", FIELD: "SUBCLAIM6_", MAP_FUNCTION: mapSubClaimScore}

        ,{TEST: "MCAP_", CODE:"CLM1", FIELD: "CLAIM1_", MAP_FUNCTION: mapSubClaimScore}
        ,{TEST: "MCAP_", CODE:"CLM2", FIELD: "CLAIM2_", MAP_FUNCTION: mapSubClaimScore}
//        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "CLAIM1_",MAP_FUNCTION: mapSubClaimScore}
//        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "CLAIM2_",MAP_FUNCTION: mapSubClaimScore}
//        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "CLAIM3_",MAP_FUNCTION: mapSubClaimScore}
//        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "CLAIM4_",MAP_FUNCTION: mapSubClaimScore}
//        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "CLAIM5_",MAP_FUNCTION: mapSubClaimScore}
//        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "CLAIM6_",MAP_FUNCTION: mapSubClaimScore}
//        ,{TEST: "MCAP_", CODE:"LEVEL3_", FIELD: "CLAIM7_",MAP_FUNCTION: mapSubClaimScore}

        ,{TEST: "MCAP_", CODE:"OVR", FIELD: "SUB_",  MAP_FUNCTION: mapScaledScore}
        ,{TEST: "MCAP_", CODE:"SUB1", FIELD: "SUBSCORE1_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB2", FIELD: "SUBSCORE2_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB3", FIELD: "SUBSCORE3_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB4", FIELD: "SUBSCORE4_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB5", FIELD: "SUBSCORE5_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB6", FIELD: "SUBSCORE6_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB7", FIELD: "SUBSCORE7_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB8", FIELD: "SUBSCORE8_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB9", FIELD: "SUBSCORE9_", MAP_FUNCTION: mapSubScore}
        ,{TEST: "MCAP_", CODE:"SUB10", FIELD: "SUBSCORE10_", MAP_FUNCTION: mapSubScore}


    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/


    var perfLevelDecode = {
       "1" : { DESC:"Beginning Learner", PASS_IND: "No"}
      ,"2" : { DESC:"Developing Learner", PASS_IND: "No"}
      ,"3" : { DESC:"Proficient Learner", PASS_IND: "Yes"}
      ,"4" : { DESC:"Distinguished Learner", PASS_IND: "Yes"}
      ,"" : { DESC: null, PASS_IND: null}
      ,null : { DESC: null, PASS_IND: null}
    };

    var perfDecode = {
           "1" : { DESC:"Beginning Learner", PASS_IND: "No"}
          ,"2" : { DESC:"Developing Learner", PASS_IND: "No"}
          ,"3" : { DESC:"Proficient Learner", PASS_IND: "Yes"}
          ,"4" : { DESC:"Distinguished Learner", PASS_IND: "Yes"}
          ,"" : { DESC: null, PASS_IND: null}
          ,null : { DESC: null, PASS_IND: null}
        };

    var subGroupDecode = {
        "Reading" : "_RD"
       ,"READING" : "_RD"
       ,"Reading - RI" : "_RI"
       ,"Reading - RL" : "_RL"
       ,"Reading - RV" : "_RV"
       ,"Reading - RF" : "_RF"
       ,"Writing" : "_WR"
       ,"WRITING" : "_WR"
       ,"Writing - WC" : "_WC"
       ,"Writing - WE" : "_WE"
       ,"MATH" : "_MA"
       ,"Math" : "_MA"
       ,"Math Subclaim A": "_SC_A"
       ,"Math Subclaim C": "_SC_C"
       ,"Math Subclaim D": "_SC_D"
       ,"ISR Life Science": "_L_SCI"
       ,"ISR Physical Science": "_P_SCI"
       ,"ISR Earth and Space Science": "_EAS_SCI"
       ,"ISR 2. Claims and evidence": "_CL_EVI"
       ,"ISR 1. Data and information": "_DA_INFO"
       ,"Peoples of the Nations and World": "_PNW"
       ,"Civics" : "_CVCS"
       ,"Geography" : "_GEOG"
       ,"Economics" : "_ECO"
       ,"History" : "_HIST"
       ,"Skills and Processes" : "_SP"
       ,"ISR 6. Model components, relationships, and connections": "_MCRC"
       ,"" : null
       ,null : null
    };

    var subClaimCategoryDecode = {
        "1" : "Meets or Exceeds Students at Level 4"
       ,"2" : "Nearly Students at Level 3"
       ,"3" : "Below Students at Level 3"
       ,"" : null
       ,null : null
    };

    var subScorePerfDecode = {
        "1" : "Beginning Learner"
       ,"2" : "Developing Learner"
       ,"3" : "Proficient/Distinguished Learner"
       ,"" : null
       ,null : null
    };

    var subjectDecode = {
       "English Language Arts/Literacy" : "ELA"
       ,"ELA" : "ELA"
       ,"ELA10" : "ELA"
       ,"MATH": "MATH"
       ,"Math": "MATH"
       ,"Mathematics" : "MATH"
       ,"Integrated Math" : "MA_INT"
       ,"Algebra I" : "ALGI"
       ,"ALG01" : "ALGI"
       ,"Algebra II" : "ALGII"
       ,"ALG02" : "ALGII"
       ,"Geometry" : "GEO"
       ,"Spanish Language Arts/Literacy" : "SLA"
       ,"Science" : "SCI"
       ,"SCIENCE" : "SCI"
       ,"SCI08" : "SCI"
       ,"SCI05" : "SCI"
       ,"SOC08" : "SOC_STUD"
       ,"SOCSTUDY" : "SOC_STUDY"
       ,"English Language Arts" : "ELA"
       ,"MA" : "MATH"
       ,"MA_Sp" : "MATH"
       ,"EN" : "ELA"
      ,"" : null
      ,null : null
    };

    var genderDecode = {
        "1" : "M"
       ,"2" : "F"
       ,"F" : "F"
       ,"M" : "M"
       ,"Male" : "M"
       ,"MALE" : "M"
       ,"Female" : "F"
       ,"FEMALE" : "F"
       ,"" : null
       ,null : null
    };

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

     function getTEST_ADMIN_PERIOD(row, hierarchy) {

        var testAdminPeriod = row.getField('PERIOD');
        if(testAdminPeriod !== null && testAdminPeriod !== undefined && testAdminPeriod !== ""){
            if(testAdminPeriod.toUpperCase().indexOf('FALL') > -1 || testAdminPeriod.toUpperCase().indexOf('FALLBLOCK') > -1){
                testAdminPeriod = "FALL";
            }else if(testAdminPeriod.toUpperCase().indexOf('SPRING') > -1) { //|| testAdminPeriod.toUpperCase().indexOf('2') > -1)
                testAdminPeriod = "SPRING";
            }else if(testAdminPeriod.toUpperCase().indexOf('WINTER') > -1){ //|| testAdminPeriod.toUpperCase().indexOf('1') > -1)
                testAdminPeriod = "WINTER";

            }else{
                testAdminPeriod = hierarchy.REPORTING_PERIOD;
            }
        }else{
            testAdminPeriod = hierarchy.REPORTING_PERIOD;
        }
             return testAdminPeriod;
      }


    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        //var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = _util.coalesce(row.getField("DATEOFBIRTH"));

        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        var testDate = row.getField('TESTSTARTDATETIME');

        if(testDate !== null && testDate !== undefined && testDate !== ""){
            testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
        }

        var studentId = row.getField("STATE_STUDENT_ID");

        if(studentId){
            studentId = studentId.replace(/^0+/, '');
        }

        var schoolCode = row.getField("SCHOOL_CODE")

        if(schoolCode){
            schoolCode = schoolCode.replace(/^0+/, '');
        }

        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = _util.trim(generateAssessmentAdminKey(signature, hierarchy, row));
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
                    record.REPORTING_PERIOD = _util.coalesce(getTEST_ADMIN_PERIOD(row, hierarchy));
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDate, "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9));
                    break;

                //Student Information
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = birthDateObject.DAY;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"), studentId);
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(studentId, row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(studentId, row.getField("STUDENT_LOCAL_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.trim(row.getField('FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.trim(row.getField('LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.trim(row.getField('MIDDLE_NAME'));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = genderDecode[row.getField("GENDER")];
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(_util.trim(schoolCode), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.trim(schoolCode);
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(schoolCode, row.getField("SCHOOL_NAME"));
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
//        var admin = {};
//
//        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapScaledScore(row, testMetadata) {
        var score = {};

        var subject = _util.coalesce(row.getField("SUBJECT"), row.getField("TEST_CODE"));
        var testNumber = testMetadata.TEST + testMetadata.CODE + "_" + subjectDecode[subject];

        var itemsAttempted = row.getField(testMetadata.FIELD + "ITEMSATTEMPTEDCOUNT");
        var itemsPercentAttempted = row.getField(testMetadata.FIELD + "PERCENTATTEMPTEDCOUNT");
        var percentCorrect = _util.coalesce(row.getField(testMetadata.FIELD + "PERCENTCORRECT"), row.getField(testMetadata.FIELD + "CSEM"));
        var totalItems = row.getField(testMetadata.FIELD + "TOTALITEMS");
        var performanceLevel = _util.coalesce(row.getField(testMetadata.FIELD + "PERFORMANCELEVEL"), row.getField(testMetadata.FIELD + "ACHIEVEMENTLEVEL"));
        var scaleScore = row.getField(testMetadata.FIELD + "SCALESCORE");
		var rawScore = row.getField(testMetadata.FIELD + "RAWSCORE");
        var sgp = row.getField(testMetadata.FIELD + 'SGP_STATE');
        var sgpSe = row.getField(testMetadata.FIELD + 'SGP_SE_STATE');
        var testCode = row.getField('SCORINGTESTCODE');

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""))
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

        if(sgp === "<1000"){
            sgp = null;
        }

        if(!isNaN(sgp)){
            score["TEST_GROWTH_PERCENTILE"] = parseFloat(sgp);
            score["TEST_STANDARD_ERROR"] = parseFloat(sgpSe);
        }

        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;
        score["TEST_SCORE_TO_PREDICTED_RESULT"] = itemsPercentAttempted;
        score["TEST_PERCENTAGE_SCORE"] = percentCorrect;
        score["TEST_ITEMS_POSSIBLE"] = totalItems;
    	score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
    	score["TEST_PRIMARY_RESULT"] = perfLevelDecode[performanceLevel].DESC;
    	score["TEST_PASSED_INDICATOR"] = perfLevelDecode[performanceLevel].PASS_IND;

    	score["TEST_CUSTOM_RESULT"] = testCode;

        return score;
    }

   //mapPerfLevel
    function mapPerfLevel(row, testMetadata){
         var score = {};
         var subject = _util.coalesce(row.getField("SUBJECT"), row.getField("TEST_CODE"));
         var testNumber = testMetadata.TEST + testMetadata.CODE + "_" + subjectDecode[subject];
         var perfLevel = row.getField (testMetadata.FIELD + "PERF_LEVEL");
         // Check for key fields and do not map score and exit if conditions met.
         if(perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === ""){
            return null;
         }
         // Set score fields
           if(!isNaN(scaleScore)){
           score["TEST_NUMBER"] = testNumber;
           score["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
           score["TEST_PRIMARY_RESULT"] = perfDecode[perfLevel].DESC;
           score["TEST_PASSED_INDICATOR"] = perfDecode[perfLevel].PASS_IND;
           }
          return score;
    }


    function mapLevelScore(row, testMetadata){
        var score = {};

        var levelElementCode = row.getField(testMetadata.CODE + testMetadata.FIELD + "CODE");

        if(levelElementCode === null){
            return null;
        }

        var subject = row.getField("SUBJECT");

        var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD + subjectDecode[subject] + subGroupDecode[levelElementCode];
        var itemsAttempted = row.getField(testMetadata.CODE + testMetadata.FIELD + "NUMBEROFATTEMPTEDITEMS");
        var percentCorrect = row.getField(testMetadata.CODE + testMetadata.FIELD + "PERCENTCORRECT");
        var performanceLevel = _util.coalesce(row.getField(testMetadata.CODE + testMetadata.FIELD + "PERFORMANCELEVEL"), row.getField(testMetadata.FIELD + "ACHIEVEMENTLEVEL"));
        var scaleScore = row.getField(testMetadata.CODE + testMetadata.FIELD + "SCALESCORE");
        var rawScore = row.getField(testMetadata.CODE + testMetadata.FIELD + "RAWSCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""))
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

        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;
        score["TEST_PERCENTAGE_SCORE"] = percentCorrect;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PRIMARY_RESULT"] = perfLevelDecode[performanceLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = perfLevelDecode[performanceLevel].PASS_IND;

        return score;
    }

   function mapTotalScore(row, testMetadata) {
        var score = {};

        var subject = row.getField("SUBJECT");

        var testNumber = testMetadata.TEST + testMetadata.CODE + "_" + subjectDecode[subject];

        var totalItems = row.getField(testMetadata.FIELD + "_TOTAL_ITEMS");
        var totalTestedItems =  row.getField(testMetadata.FIELD + "_ATTEMPTED_ITEMS");

        // Check for key fields and do not map score and exit if conditions met.
        if((totalTestedItems === null || totalTestedItems === undefined || _util.trim(totalTestedItems) === "--" || _util.trim(totalTestedItems) === "")
          &&(totalItems === null || totalItems === undefined || _util.trim(totalItems) === "--" || _util.trim(totalItems) === "")){
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if(totalTestedItems !== null && totalTestedItems !== undefined && _util.trim(totalTestedItems) !== "--" && _util.trim(totalTestedItems) !== ""){
            score["TEST_ITEMS_ATTEMPTED"] = totalTestedItems;
            score["TEST_ITEMS_POSSIBLE"] = totalItems;
        }

        return score;
    }

    function mapSubClaimScore(row, testMetadata) {
        var score = {};

        var subject = row.getField("SUBJECT");

        var testNumber = testMetadata.TEST + testMetadata.CODE + "_" + subjectDecode[subject];
        var scaleScore = row.getField(testMetadata.FIELD + "SCALESCORE");
        var csem = row.getField(testMetadata.FIELD + "CSEM");
        var subClaimCategory = row.getField(testMetadata.FIELD + "CAT");


        // Check for key fields and do not map score and exit if conditions met.
        if((subClaimCategory === null || subClaimCategory === undefined || _util.trim(subClaimCategory) === "--" || _util.trim(subClaimCategory) === "")
         &&(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_PRIMARY_RESULT_CODE"] = subClaimCategory;
        score["TEST_PERCENTAGE_SCORE"] = csem;
        score["TEST_PRIMARY_RESULT"] = subClaimCategoryDecode[subClaimCategory];

        return score;
    }

    function mapComponentScore(row, testMetadata) {
        var score = {};

        var subject = row.getField("SUBJECT");

        var testNumber = testMetadata.TEST + testMetadata.CODE + "_" + subjectDecode[subject];

        var scaleScore = row.getField(testMetadata.FIELD + "SCALESCORE");
        var csem = row.getField(testMetadata.FIELD + "CSEM");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""){
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_PERCENTAGE_SCORE"] = csem;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        return score;

    }

    function mapSubScore(row, testMetadata) {
        var score = {};

        var subject = _util.coalesce(row.getField("TEST_CODE"));
        var testNumber = testMetadata.TEST + testMetadata.CODE + "_" + subjectDecode[subject]; //MCAP_SUB1_SOC_STUD -> Civics
        var subRawScore = row.getField(testMetadata.FIELD + "RS");
        var subScaleScore = row.getField(testMetadata.FIELD  + "SS");
        var perfLevel = row.getField(testMetadata.FIELD  + "PL");


        // Check for key fields and do not map score and exit if conditions met.
        if(subRawScore === null || subRawScore === undefined || _util.trim(subRawScore) === "--" || _util.trim(subRawScore) === "")
        {
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_RAW_SCORE"] = subRawScore;
        score["TEST_SCALED_SCORE"] = subScaleScore;
        score["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
        score["TEST_PRIMARY_RESULT"] = subScorePerfDecode[perfLevel];
        score["TEST_SCORE_TEXT"] = subScaleScore;
        score["TEST_SCORE_VALUE"] = subScaleScore;


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
        if( signature.getFormat().getFormatName() === "MCAP_351_COLS"){
                var testDate = srcRecord.getField('TESTSTARTDATETIME');
                if(testDate !== null && testDate !== undefined && testDate !== ""){
                    testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
                }
        assessmentAdminKey = assessmentAdminKey + "_" +testDate;
        }
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.trim(_util.coalesce(srcRecord.getField(key),""));
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());