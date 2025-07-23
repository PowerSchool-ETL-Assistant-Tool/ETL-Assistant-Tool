var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LAUSD_CAASPP";
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
        {TEST: "CA", CODE:"ELA", FIELD: "ELA", SUBIND: "ELA", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CA", CODE:"MA", FIELD: "MATH", SUBIND: "MATH",MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CA", CODE:"SCI", FIELD: "SCIENCE", SUBIND: "SCI",MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CA", CODE:"ETH_SE_SCI", FIELD: "EARTH_SPACE_SCI", SUBIND: "ETH_SE_SCI",MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CA", CODE:"PHY_SCI", FIELD: "PHYSICAL_SCI", SUBIND: "PHY_SCI",MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CA", CODE:"LIFE_SCI", FIELD: "LIFE_SCI", SUBIND: "LIFE_SCI",MAP_FUNCTION: mapScaledScore}
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

    var conditionCodes =
              {
                  "AURN" : {CODE: "AURN", DESC: "Approved unlisted resource that does not change construct being measured"},
                  "AURY" : {CODE: "AURY", DESC: "Approved unlisted resource that changes construct being measured"},
                  "C" : {CODE: "C", DESC: "Observed Cheating"},
                  "INC" : {CODE: "INC", DESC: "Incomplete - No Score"},
                  "LOSS" : {CODE: "LOSS", DESC: "Lowest obtainable scale score"},
                  "NE" : {CODE: "NE", DESC: "Non-English Learner"},
                  "NEL" : {CODE: "NEL", DESC: "Exempted from Smarter Balanced or CAA for ELA"},
                  "NT" : {CODE: "NT", DESC: "Not Tested"},
                  "NTC" : {CODE: "NTC", DESC: "Student did not have opportunity to test due to moving schools"},
                  "NTE" : {CODE: "NTE", DESC: "Not tested due to medical emergency"},
                  "PGE" : {CODE: "PGE", DESC: "Not tested by parent/guardian request"},
                  "SCL" : {CODE: "SCL", DESC: "Completed test and grade/level administered does not match enrolled grade"},
                  "T" : {CODE: "T", DESC: "Provided no answers"},
                  "INC0" : {CODE: "INC0", DESC: "Incomplete - Lowest Obtainable Score"},
                  "INC1" : {CODE: "INC1", DESC: "Incomplete - Lowest Obtainable Score + 1"}
              };
               var achieveLevels =
                      {
                          "4" : {LEVEL: "4", DESC: "Standard Exceeded", PASS_IND: "Yes"},
                          "3" : {LEVEL: "3", DESC: "Standard Met", PASS_IND: "Yes"},
                          "2" : {LEVEL: "2", DESC: "Standard Nearly Met", PASS_IND: "No"},
                          "1" : {LEVEL: "1", DESC: "Standard Not Met", PASS_IND: "No"},
                          "9" : {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"},
                          "Standard Exceeded" : {LEVEL: "4", DESC: "Standard Exceeded", PASS_IND: "Yes"},
                          "Standard Met" : {LEVEL: "3", DESC: "Standard Met", PASS_IND: "Yes"},
                          "Standard Nearly Met": {LEVEL: "2", DESC: "Standard Nearly Met", PASS_IND: "No"},
                          "Standard Not Met": {LEVEL: "1", DESC: "Standard Not Met", PASS_IND: "No"},
                          "Did not attempt": {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"},
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

        var subjects = ["ELA", "MATH", "SCI", "ETH_SE_SCI", "PHY_SCI", "LIFE_SCI"];
        subjects.forEach(function(subject) {
            var processRecord = false;

            // Alternative check.
            if (subject === "ETH_SE_SCI" || subject === "PHY_SCI" || subject === "LIFE_SCI") {
                processRecord = !!row.getField(subject + "_SCALE_SCORE");
            } else if (subject === "MATH") {
                processRecord = !!row.getField("MATH_ATTEMP_FLAG") || !!row.getField("MATH_SCALE_SCORE");
            } else {
                // Standard Check
                processRecord = !!row.getField(subject + "_ATTEMP_FLAG");
            }

            if (processRecord) {
                var record = mapNormalizedRecord(signature, hierarchy, row, subject);
                AppUtil.nullSafePush(normalizedRecords, record);
            }
        });



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
    function mapNormalizedRecord(signature, hierarchy, row,subj) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row,subj);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, subj);

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
    function mapNormalizedAdminFields(signature, hierarchy, row,subj) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var studentdob = row.getField("STUDENT_BIRTH_DATE");

        if(studentdob!==null && studentdob!==undefined && studentdob!== '')
        {
               studentdob = studentdob.split('T')[0];
        }
        var birthDateObject = AppUtil.getDateObjByPattern(studentdob, "yyyy-MM-dd");

        var testdate = row.getField("TEST_COMPLETION_DATE");
        if(testdate!==null && testdate!==undefined && testdate!== ''){
                testdate = testdate.split('T')[0];
        var testAdminDate = AppUtil.getDateObjByPattern(testdate, "yyyy-MM-dd").STANDARD_DATE;
        }

        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row) + "_" + subj;
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
                    record.TEST_ADMIN_DATE = _util.coalesce(testAdminDate,'05/15/' + hierarchy.SCHOOL_YEAR.substring(0,4));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_DISTRICT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_STATE_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        , row.getField("STUDENT_STATE_ID")
                        , row.getField("STUDENT_DISTRICT_ID")
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
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('CALPADS_GRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"),"DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("LOCATION_CODE"), row.getField("SCHOOL_NUMBER"));
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
    function mapScaledScore(row, testMetadata,subj) {
        var score = {};

        // Limit the function to run only if testMetadata.SUBIND matches subj
        if (testMetadata.SUBIND !== subj) {
            return null; // Exit early if the condition is not met
        }

        var filename = row.getRawField("LINEAGE_FILE").toString().split("/sources/")[1];
        if(filename.indexOf("CAA")>-1){
            var assessmentType = "CAA";
        }else if(filename.indexOf("CAST") > -1){
            var assessmentType = "CAST";
        }

        var gradeCode = gradeDecode[_util.coalesce(row.getField('CALPADS_GRADE'), row.getField('GRADE'))];
        var testNumber =  testMetadata.TEST + "_" + assessmentType + "_" + testMetadata.CODE + "_" + gradeCode;

            var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");

            var perfLevel = row.getField(testMetadata.FIELD + "_ACHIEVE_LVL");

            var sem = row.getField(testMetadata.FIELD + "_SEM");
            var itemsAttempted = row.getField(testMetadata.FIELD + "_ITEM_ATTEMP");
            var conditionCodeVal = row.getField(testMetadata.FIELD +  "_CONDITION_CODE");
            var testedGrade = row.getField("ENROLLED_GRADE"); // CAST_TO_MIS file UIHN-62747
            var gradeTested = row.getField(testMetadata.FIELD + "_GRADE_TESTED"); // CAA file UIHN-62747

            if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) == "") && (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) == "")) {
                        return null;

                    }
                         score["TEST_SCORE_TEXT"] = scaleScore;
                         score["TEST_SCORE_VALUE"] = scaleScore;
                         score["TEST_SCALED_SCORE"] = scaleScore;
                         score["TEST_PRIMARY_RESULT"] = achieveLevels[perfLevel].DESC;
                         score["TEST_PRIMARY_RESULT_CODE"] = achieveLevels[perfLevel].LEVEL;
                         score["TEST_PASSED_INDICATOR"] = achieveLevels[perfLevel].PASS_IND;
                         score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;
                         if(conditionCodes[conditionCodeVal] !== undefined){
                            score["TEST_SCORE_ATTRIBUTES"] = conditionCodes[conditionCodeVal].DESC;
                         }
                         score["TEST_STANDARD_ERROR"] = sem;
                         score["TEST_NUMBER"] = testNumber;
                         score["TEST_GRADE_EQUIVALENT"] = _util.coalesce(gradeDecode[testedGrade],gradeDecode[gradeTested]);

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

        var lastTestDateTime = srcRecord.getField("TEST_COMPLETION_DATE");

            if ( lastTestDateTime!==null && lastTestDateTime!==undefined && lastTestDateTime!== '')
            {

                if (lastTestDateTime.indexOf(' ') > -1) {
                    // Split the string to separate date and time
                    var datePart = lastTestDateTime.split(' ')[0];
                    var dateComponents = datePart.split('-'); // Split by hyphen

                    // Rearrange into mm/dd/yyyy format
                    var formattedDate = dateComponents[1] + '/' + dateComponents[2] + '/' + dateComponents[0];
                    assessmentAdminKey = assessmentAdminKey + "_"  + formattedDate;
                }
            }

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());