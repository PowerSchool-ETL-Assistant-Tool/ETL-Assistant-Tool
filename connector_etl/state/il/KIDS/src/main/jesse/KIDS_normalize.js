var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "KIDS";
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
		}n
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
        // APPROACHES TO LEARNING or Attitudes to Learning – Self-Regulation
         {TEST: "KIDS_", CODE:"ALT_REG_", FIELD: "CURIOSITY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"ALT_REG_", FIELD: "SELF_CONTROL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"ALT_REG_", FIELD: "PERSISTENCE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"ALT_REG_", FIELD: "SHARING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"ATL_REG_", FIELD: "SED_TOT", MAP_FUNCTION: mapScaledScore}

        // Social and Emotional Development
        ,{TEST: "KIDS_", CODE:"SED_", FIELD: "SELF_IDENTITY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"SED_", FIELD: "FEELINGS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"SED_", FIELD: "INTERACTION_WITH_ADULTS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"SED_", FIELD: "INTERACTION_WITH_PEERS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"SED_", FIELD: "SOCIODRAMATIC_PLAY", MAP_FUNCTION: mapScaledScore}

        // Language and Literacy Development
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "UNDERSTANDING_OF_LANGUAGE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "RESPONSIVENESS_TO_LANGUAGE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "USE_OF_LANGUAGE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "CONVERSATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "INTEREST_IN_LITERACY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "COMPREHENSION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "PRINT_CONCEPTS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "PHONOLOGICAL_AWARENESS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "LETTER_KNOWLEDGE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "WRITING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"LLD_", FIELD: "TOT", MAP_FUNCTION: mapScaledScore}

         //Cognition Math and Science
        ,{TEST: "KIDS_", CODE:"COG-MATH_", FIELD: "CLASSIFICATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"COG-MATH_", FIELD: "NUMBER_SENSE_OF_QUANTITY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"COG-MATH_", FIELD: "MATH_OPERATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"COG-MATH_", FIELD: "MEASUREMENT", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"COG-MATH_", FIELD: "PATTERNING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"COG-MATH_", FIELD: "SHAPES", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"MATH_", FIELD: "TOT", MAP_FUNCTION: mapScaledScore}

        ,{TEST: "KIDS_", CODE:"COG-SCI_", FIELD: "CAUSE_AND_EFFECT", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"COG-SCI_", FIELD: "INQUIRY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"COG-SCI_", FIELD: "DOCUMENTATION_AND_COMMUNICATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"COG-SCI_", FIELD: "NATURAL_WORLD", MAP_FUNCTION: mapScaledScore}

        // Physical Development – Health
        ,{TEST: "KIDS_", CODE:"PD_", FIELD: "PERCEPTUAL_MOTOR", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"PD_", FIELD: "GROSS_LOCOMOTOR", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"PD_", FIELD: "GROSS_MOTOR_MANIPULATIVE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"PD_", FIELD: "FINE_MOTOR", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HLTH_", FIELD: "SAFETY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HLTH_", FIELD: "PERSONAL_CARE_ROUTINE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HLTH_", FIELD: "ACTIVE_PHYSICAL_PLAY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HLTH_", FIELD: "NUTRITION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HLTH_", FIELD: "KNOWLEDGE_OF_WELLNESS", MAP_FUNCTION: mapScaledScore}

        // History-Social Science
        ,{TEST: "KIDS_", CODE:"HSS_", FIELD: "SENSE_OF_TIME", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HSS_", FIELD: "SENSE_OF_PLACE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HSS_", FIELD: "ECOLOGY", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HSS_", FIELD: "CONFLICT_NEGOTIATION", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"HSS_", FIELD: "RESP_CNDCT_AS_GRP_MEM", MAP_FUNCTION: mapScaledScore}

        // English Language Development
        ,{TEST: "KIDS_", CODE:"ELD_", FIELD: "RECEPTIVE_ENGLISH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"ELD_", FIELD: "EXPRESSIVE_ENGLISH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"ELD_", FIELD: "UNDERSTANDING_RESPONSE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"ELD_", FIELD: "SYM_LTR_PRINT", MAP_FUNCTION: mapScaledScore}


        // Visual and Performing Arts
        ,{TEST: "KIDS_", CODE:"VPA_", FIELD: "VISUAL_ART", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"VPA_", FIELD: "MUSIC", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"VPA_", FIELD: "DRAMA", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"VPA_", FIELD: "DANCE", MAP_FUNCTION: mapScaledScore}

        // Spanish
        ,{TEST: "KIDS_", CODE:"SPAN_", FIELD: "RECEPTIVE_ENGLISH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"SPAN_", FIELD: "EXPRESSIVE_ENGLISH", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"SPAN_", FIELD: "PHONOLOGICAL_AWARENESS", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "KIDS_", CODE:"SPAN_", FIELD: "WRITING", MAP_FUNCTION: mapScaledScore}
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
        "PRE" : "PK"
       ,"" : null
       ,null : null
    };

    var assignedDecodes = {
        1 : "Building Earlier",
        2 : "Building Middle",
        3 : "Building Later",
        4 : "Integrating Earlier",
        5 : "Integrating Middle",
        6 : "Integrating Later",
        7 : "UR",
        8 : "UR",
        9 : "UR",
        "u" : "UR",
        "" : "--",
        " " : "--"
    }

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

        var fullName = row.getField("NAME");
        if(fullName) {
            if(fullName.toUpperCase().match("AVERAGE")) {
              return null;
            }
        }
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

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

        var birthDateObject = parseDate(row.getField("STUDENT_BIRTHDATE"));
        var fullName = row.getField("NAME");
        if(fullName !== null && fullName !== undefined) {
          var lastName = fullName.split(" ")[0];
          var firstName = fullName.split(" ")[1];
          var middleName = null
          if(fullName.match(/ /g).length>1) {
            middleName = fullName.split(" ")[2];
          }
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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD.toUpperCase();
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce('09/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID")
                        , row.getField("ICODE"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("ICODE")
                        ,row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        ,row.getField("ICODE")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('STUDENT_FIRST_NAME'), firstName, "");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField('STUDENT_LAST_NAME'), lastName, "");
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField('STUDENT_MIDDLE_NAME'), middleName, "");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce((_util.trim(row.getField("GENDER")+"-").substring(0,1)).toUpperCase(), null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField('GRADE_LEVEL')], "KG");
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"), row.getField("SCHOOL_LOCAL_ID"),
                    row.getField("SCHOOL_STATE_ID"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                     break;

                default:
                    record[field] = row.getField(field);
                    break;
            }
        });
        return record;
    }

    function parseDate(rawDate) {

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

            if (rawDate.indexOf('/') > -1) {
               formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            } else if (rawDate.indexOf('-') > -1){
               formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
            } else {
               formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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
    function mapScaledScore(row, testMetadata, signature) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD;
        var scaleScore = _util.trim(row.getField(testMetadata.CODE + testMetadata.FIELD));
        var achieveLevel = _util.trim(row.getField(testMetadata.CODE + testMetadata.FIELD));
        var secondaryResult = _util.trim(row.getField(testMetadata.CODE + testMetadata.FIELD + '_E'));
        var performanceLevel =  _util.trim(row.getField(testMetadata.CODE + testMetadata.FIELD + '_CRITERION_ZONE'));
         var primary = row.getField("READY_ALL_3");

        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
        // Set score fields
        score.TEST_NUMBER = testNumber;
        if (!isNaN(scaleScore)) {
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_SCORE_TEXT"] = scaleScore;

        if(signature.getFormat().getFormatName() === "KIDS") {
            score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            score["TEST_PRIMARY_RESULT"] = assignedDecodes[achieveLevel];
            score["TEST_SECONDARY_RESULT"] = secondaryResult;
        }else {
            score["TEST_PRIMARY_RESULT"] = performanceLevel;
            score["TEST_SECONDARY_RESULT"] = primary;
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

        return assessmentAdminKey;
    }

    return module;
}());