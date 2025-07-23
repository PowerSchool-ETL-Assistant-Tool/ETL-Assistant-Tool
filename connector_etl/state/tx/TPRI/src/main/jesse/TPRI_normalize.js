var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "TPRI";
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
        {TEST: "TPRI", CODE:"OVR", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "TPRI", CODE:"ACC1", FIELD: "ACCURACY1", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"ACC2", FIELD: "ACCURACY2", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"FLU1", FIELD: "FLUENCY1", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"FLU2", FIELD: "FLUENCY2", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"COMP1", FIELD: "COMPREHENSION1", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"COMP2", FIELD: "COMPREHENSION2", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"CONCIEN", FIELD: "CONCIENCIA_FONOLOGICA", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"CONOCIEM", FIELD: "CONOCIMIENTO_GRAFOFONEMAS", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"PHON", FIELD: "PHONEMIC_AWARENESS", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"GRAPH", FIELD: "GRAPHOPHONEMIC_KNOWLEDGE", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"WORD", FIELD: "WORD_READING", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"FLU1EQUA", FIELD: "FLUENCY1_EQUATING", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"FLU2EQUA", FIELD: "FLUENCY1_EQUATING", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"AVRFLU", FIELD: "AVERAGE_FLUENCY", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"AVRFLUEQUA", FIELD: "AVERAGE_FLUENCY_EQUATING", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "TPRI", CODE:"WARMUP", FIELD: "WARM_UP", MAP_FUNCTION: mapStrandScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeDecode = {
        "1": "01",
        "01": "01",
        "G01": "01",
        "Grade 1": "01",
        "2": "02",
        "02": "02",
        "G02": "02",
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
        "GKG": "KG",
        "" : null
       ,null : null
    };

    var primaryDecode = {
       "1" : "No Intervention Needed"
       , "2" : "Possible Intervention Needed"
       , "3" : "Moderate Intervention Needed"
       , "4" : "Significant Intervention Needed"
       , "5" : "Significant Intervention Needed"
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

        function getTestPeriodAndAdminDate(row, hierarchy) {
            var periodName = null;
            var testAdminDate = null;
            var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
            var schoolYear = hierarchy.SCHOOL_YEAR.substring(5, 9);

            if (fileName.indexOf("EOY") > -1) {
                periodName = "EOY";
                testAdminDate = "06/15/" + schoolYear;
            } else if (fileName.indexOf("BOY") > -1) {
                periodName = "BOY";
                testAdminDate = "09/15/" + schoolYear;
            } else if (fileName.indexOf("MOY") > -1) {
                periodName = "MOY";
                testAdminDate = "01/15/" + schoolYear;
            } else {
                periodName = "ALL";
                testAdminDate = "05/15/" + schoolYear;
            }

            return {
                periodName: periodName,
                testAdminDate: testAdminDate
            };
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
                }

                var testInfo = getTestPeriodAndAdminDate(row, hierarchy);


                var birthDate = _util.coalesce(row.getField("BIRTH_DATE"));
                if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
                    birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
                }
                var studentLastName = '';
                var studentFirstName = '';

                if (row.getField('STUDENT_NAME')) {
                    var studentName = row.getField('STUDENT_NAME');
                    studentLastName = studentName.split(',')[0];
                    var firstNameSeparator = studentName.split(',')[1].split(' ');
                    studentFirstName = studentName.split(',')[1];
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
                    record.REPORTING_PERIOD = testInfo.periodName;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testInfo.testAdminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
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
                    record.STUDENT_FIRST_NAME = studentFirstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = studentLastName;
                    break;
//                case "STUDENT_MIDDLE_NAME":
//                    record.STUDENT_MIDDLE_NAME= studentMiddleInitial;
//                    break;
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"),"DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
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
//
//        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
//            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
//        }
//        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
        function mapScaledScore(row, testMetadata) {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE;
            var scaleScore = row.getField("BAND");
            var rawScore = row.getField("SCREENING");
//    		var achievLevel = row.getField("TIER");
    		var groupingFactor = row.getField("GROUPING_FACTOR");
//          var intervention = row.getField("INTERVENTION");
            var progressMeasure = row.getField("PROGRESS_MEASURE");
            var from = row.getField("FROM");
            var status = row.getField("STATUS");
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
            score["TEST_RAW_SCORE"] = rawScore;

        	score["TEST_PRIMARY_RESULT_CODE"] = scaleScore;
        	score["TEST_PRIMARY_RESULT"] = primaryDecode[scaleScore];
        	score["TEST_SECONDARY_RESULT"] = progressMeasure;
//        	score["TEST_TERTIARY_RESULT"] = intervention;
        	score["TEST_QUATERNARY_RESULT"] = groupingFactor;
        	score["TEST_PERCENTAGE_SCORE"] = from;
        	score["TEST_SCORE_ATTRIBUTES"] = status;
        	score["TEST_GROWTH_TARGET_1"] = row.getField("BOY_TO_MOY");
        	score["TEST_GROWTH_TARGET_2"] = row.getField("MOY_TO_EOY");
        	score["TEST_GROWTH_TARGET_3"] = row.getField("BOY_TO_EOY");

            return score;
        }

        function mapStrandScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD);
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === 'FRU' || scaleScore === 'SK' || scaleScore === 'LIS') {
            return null;
        }
        if(scaleScore.indexOf("/") > -1){

        var scoreParts = scaleScore.split('/').map(part => part.trim());
            if(scoreParts.length === 2) {
                score["TEST_ITEMS_POSSIBLE"] = scoreParts[1];
                score["TEST_SCALED_SCORE"] = scoreParts[0];
                score["TEST_SCORE_TEXT"] = `${scoreParts[0]}/${scoreParts[1]}`;
            }
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	if(!isNaN(scaleScore)){
        if(testNumber.indexOf("ACC") > -1){
        score["TEST_PERCENTAGE_SCORE"] = scaleScore;
        }
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_SCORE_TEXT"] = scaleScore;
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

        //Add conformed MM/dd/yyyy test/completion date as the last value
        //Test/completion date should not be present in the NATURAL_KEY of any signatures, it is to be added here
        //If the test date is truly not needed, this section can be deleted when creating a new connector
//        var fileTestDate = row.getField("TEST_DATE");
//        if(fileTestDate!==undefined && fileTestDate!==null) {
//            fileTestDate = fileTestDate.toString();
//            //The template contains an example of having multiple date strings. If your connector only has one, only take what is inside the ELSE statement and remove the rest of the IF/ELSE code
//            // If your connector has multiple dates with / or -, consider if the string length can be used for an IF/ELSEIF check
//            if(fileTestDate.indexOf("/")>-1) {
//                assessmentAdminKey = assessmentAdminKey + "_" + AppUtil.getDateObjByPattern(row.getField(fileTestDate), "M/d/yyyy").STANDARD_DATE;
//            }
//            else{
//                assessmentAdminKey = assessmentAdminKey + "_" + AppUtil.getDateObjByPattern(row.getField(fileTestDate), "MM-dd-yyyy").STANDARD_DATE;
//            }
//        }
        
        return assessmentAdminKey;
    }

    return module;
}());