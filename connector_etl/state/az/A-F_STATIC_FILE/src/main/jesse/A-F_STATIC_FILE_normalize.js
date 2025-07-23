var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "A-F_STATIC_FILE";
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
        {TEST: "A-F_STATIC", CODE:"SCI", FIELD: "_TOT", MAP_FUNCTION: mapScaledScore}

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
     var genderDecode = {
     "M" : "M",
     "F" : "F",
     "U" : "UNK",
     "Male": "M",
     "Female": "F",
     "Unknown": "UNK",
     "": null,
     null : null
     }

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
        "55" : "US",
        "66" : "UE",
        "77": "PK",
        "88" : "KG",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG",
        "-1": "KG",
        "55": "US",//Ungraded Secondary
        "66": "UE",//Ungraded Elementary
        "77": "PS" //Pre-School
       ,"" : null
       ,null : null
    };
    var performanceLevelDecode = {
        "1" : {DESC:  "Minimally Proficient/Falls Far Below " , PASS_IND: "No"}
        ,"2" : {DESC: "Partially Proficient/Approaches" ,  PASS_IND: "No"}
        ,"3" : {DESC: "Proficient/Meets" ,  PASS_IND: "Yes"}
        ,"4" : {DESC: "Highly Proficient/Exceeds" ,  PASS_IND: "Yes"}
        ,"" : {DESC: null ,  PASS_IND: ""}
        ,null : {DESC: null ,  PASS_IND: null}
        ,undefined : {DESC: null ,  PASS_IND: null}

    };
    var ELLProfLevelDecode = {
        "0" : {DESC:  null , PASS_IND: "No"}
        ,"1" : {DESC:  "Pre-Emergent/Emergent" , PASS_IND: "No"}
        ,"2" : {DESC: "Basic" ,  PASS_IND: "No"}
        ,"3" : {DESC: "Intermediate" ,  PASS_IND: "Yes"}
        ,"4" : {DESC: "Proficient" ,  PASS_IND: "Yes"}
        ,"" : {DESC: null ,  PASS_IND: ""}
        ,null : {DESC: null ,  PASS_IND: null}
        ,undefined : {DESC: null ,  PASS_IND: null}

    };
    var growthDecode = {
       "0" : "No growth"
       , "1" : "1 level change"
       ,"2" : "2 level changes"
       ,"3" : "3 level changes"
       ,"-1" :  "Negative growth"
       ,"." : null
       ,"" : null
       ,null : null
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
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
         if(birthDateObject !== null && birthDateObject !== undefined && birthDateObject !== "" && birthDateObject.indexOf(':') !== -1) {
                         birthDateObject = AppUtil.getDateObjByPattern(birthDateObject, "MMM dd yyyy hh:mma");
                  }
                  else if(birthDateObject !== null && birthDateObject !== undefined && birthDateObject !== "" && birthDateObject.indexOf('/') >-1){
                         var birthDateObject = AppUtil.getDateObjByPattern(birthDateObject, "MM/dd/yyyy");
                  }
                  else if(birthDateObject !== null && birthDateObject !== undefined && birthDateObject !== ""){
                       birthDateObject = getBirthObj(birthDateObject);
                  }
    function getBirthObj(birthDate){
             trimmedDate = birthDate.split(":")//Jan 16 2006 12:00AM
             var birthdate = trimmedDate[0];
             return AppUtil.getDateObjByPattern(birthdate, "ddMMMyyyy");
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
                    record.TEST_ADMIN_DATE = _util.coalesce('05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2") ,row.getField("STUDENT_ID")
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
                    record.STUDENT_GENDER_CODE =  genderDecode[row.getField('GENDER')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
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
        var grade = gradeDecode[row.getField("GRADE")];
        if(row.getField("SUBJECT_GRADE") != null){
        var testNumber = generateTestNumber(row, testMetadata) + "_" + grade;
        }
        else if(testMetadata.CODE === "SCI"){
        	 testNumber = testMetadata.TEST + '_' + testMetadata.CODE + testMetadata.FIELD +  "_" + grade;
        }
        var scaleScore = row.getField("SCALE_SCORE");
        var perf = row.getField("PERFORMANCE_LEVEL");
        var percentile = row.getField("SGPCY_PERCENTILE");
        var growth = row.getField("SGTCY");
        var sgtTarget = row.getField("SGT_SS_TARGET");
        var sgpCategory = row.getField("SGP_CATEGORY");
        var ELLProf = row.getField("ELL_PROF");
        var ELLGrowth = row.getField("ELL_GROWTH");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === ".")
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
        if(!isNaN(perf)){
    	score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[perf].PASS_IND;
    	score["TEST_PRIMARY_RESULT_CODE"] = perf;
    	score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[perf].DESC;
    	}
    	if(!isNaN(ELLProf)){
    	score["TEST_SECONDARY_RESULT_CODE"] = ELLProf;
        score["TEST_SECONDARY_RESULT"] = ELLProfLevelDecode[ELLProf].DESC;
        }
        if(!isNaN(percentile)){
    	score["TEST_GROWTH_PERCENTILE"] = percentile;
    	}
    	if(!isNaN(sgpCategory)){
    	score["TEST_PERCENTAGE_SCORE"] = sgpCategory;
    	}
    	if(!isNaN(growth)){
    	score["TEST_GROWTH_TARGET_1"] = growth;
    	}
    	if(!isNaN(growth)){
    	score["TEST_GROWTH_TARGET_2"] = sgtTarget;
    	}
    	if(!isNaN(growth)){
    	score["TEST_GROWTH_RESULT_CODE"] = ELLGrowth;
        score["TEST_GROWTH_RESULT"] = growthDecode[ELLGrowth];
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
    function generateTestNumber(row, testMetadata) {
            var sub = null;
            var testNumber = null;
            var SubjectName = row.getField("SUBJECT_GRADE");
            //if(SubjectName === null && SubjectName === undefined && SubjectName === ""){
                //return null;
            //}
            if(SubjectName !== null && SubjectName !== undefined && SubjectName !== ""){
        		if (SubjectName.indexOf('ELA') > -1) {
        			sub = "ELA";
        		} else if (SubjectName.indexOf('Mathematics') > -1 ||  SubjectName.indexOf('Math') > -1){
        			sub = "MATH";
                } else if (SubjectName.indexOf('Algebra I') > -1) {
        			sub = "ALG1";
                } else if (SubjectName.indexOf('Algebra II') > -1) {
                    sub = "ALG2";
                } else if (SubjectName.indexOf('Geometry') > -1) {
                    sub = "GEOM";
                } else if (SubjectName.indexOf('Science') > -1 ||  SubjectName.indexOf('Sci') > -1){
                    sub = "SCI";
                }
                }
                if (sub === "ELA" || sub === "MATH" || sub === "SCI") {
        			testNumber = testMetadata.TEST + '_' + sub + testMetadata.FIELD;
        		}
        		else{
        		testNumber = testMetadata.TEST + '_' + sub;
        		}
        		    return testNumber
            }

    return module;
}());