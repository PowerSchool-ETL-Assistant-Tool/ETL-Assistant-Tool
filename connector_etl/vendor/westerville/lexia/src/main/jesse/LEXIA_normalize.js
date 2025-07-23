var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "Lexia";
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
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {

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
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
                            //Report error for each row
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }

                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function(output, rows) {
                    try{
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if(mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
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

    var scoresToMap =
        [
        {TEST: "LEXIA", MAP_FUNCTION: mapScore}
        ];
    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
	var decodeGradeLevel = {
        "-" : null
		,"Middle School" : null
		,"High School" : null
		,"Other" : null
        , "PreK" : "PK"
        , "Kindergarten" : "KG"
        , "1st Grade" : "01"
        , "2nd Grade" : "02"
        , "3rd Grade" : "03"
        , "4th Grade" : "04"
        , "5th Grade" : "05"
        , "6th Grade" : "06"
        , "7th Grade" : "07"
        , "8th Grade" : "08"
        , "9th Grade" : "09"
        , "10th Grade" : "10"
        , "11th Grade" : "11"
        , "12th Grade" : "12"
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
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param array Array containing JSON objects representing raw data by physical name.
     * @returns {array} Mapped normalized records.
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];

        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        var record = mapNormalizedRecord(signature, hierarchy, row);

        AppUtil.nullSafePush(normalizedRecords, record);

        return normalizedRecords;

    }


    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} Mapped normalized record.
     */
    function mapNormalizedRecord(signature, hierarchy, row) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
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
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DATE_OF_BIRTH"), "M/d/yyyy");
        var testDateObject = AppUtil.getDateObjByPattern(row.getField("ACTIVITY_END_TIME"), "M/d/yyyy");


        //Loop through normalized fields and map if possible.
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL_CODE")
                    );
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesceEmptyString(testDateObject.STANDARD_DATE, row.getField("PREDICTOR_DATE"));
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesceEmptyString(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesceEmptyString(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesceEmptyString(birthDateObject.YEAR, null);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesceEmptyString(row.getField("USERNAME"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("LEXIA_ID"));
					break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesceEmptyString(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(null);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesceEmptyString(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(decodeGradeLevel[row.getField("GRADE_LABEL")]);
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesceEmptyString(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesceEmptyString(row.getField("SCHOOL_CODE"));
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesceEmptyString(row.getField("SCHOOL_CODE"));
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
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {
        var admin = {};
        //admin.COURSE_CODE = row.getField("CLASSES");
        //admin.COURSE_SECTION = row.getField("CLASS_NAMES");
        admin.VENDOR_STAFF_ID = row.getField("STAFF");
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

	     function mapScore(row, testMetadata) {
			var score = {};
			var activityID = row.getField("ACTIVITY_ID");
			var activityTime = row.getField("ACTIVITY_END_TIME");
			if(activityID === null && activityID === undefined && _util.trim(activityID) === "--" && _util.trim(activityID) === "-" && _util.trim(activityID) === "") {
				return null;
			}
			if(activityTime === null && activityTime === undefined && _util.trim(activityTime) === "--" && _util.trim(activityTime) === "-" && _util.trim(activityTime) === "") {
				return null;
			}
				var testNumber = testMetadata.TEST + "_"
				 + activityID;
				var levelName = row.getField("LEVELNAME");
				var timeTaken = row.getField("WEEK_TIME"); //numeric, student's value
				var timeTarget = row.getField("WEEKLY_USAGE_TARGET");//numeric, goal value
				var activityName = row.getField("ACTIVITY_NAME");//needed for XTBL_TESTS
				var activitySubject = row.getField("READING_FOCUS");//needed for XTBL_TESTS
				var percentCompleted = row.getField("PERCENT_COMPLETED");
				var attempts = row.getField("ATTEMPTS_AT_STANDARD"); //# of attempts (at standard)
				var levelMaterial = row.getField("GRADE_LEVEL_MATERIAL");//text value ex 'Beg to Mid 1st'
				var predictor = row.getField("PREDICTOR");
				var riskLevel = row.getField("RISK_LEVEL");
				var accuracy = row.getField("ACCURACY");
				var rate = row.getField("RATE");

				var unitsToBenchmark = row.getField("UNITS_TO_BENCHMARK");
				var weekUnits = row.getField("WEEK_UNITS");
				var weeklyUnitsTarget = row.getField("WEEKLY_UNITS_TARGET");
				var certificateDelivered = row.getField("CERTIFICATE_DELIVERED");
				var skillBuilderDelivered = row.getField("SKILLBUILDER_DELIVERED");
				var lessonsDelivered  = row.getField("LESSONS_DELIVERED");

				//print(testNumber);
				//print(levelName);
				//print(JSON.stringify(row));
				// Check for key fields and do not map score and exit if conditions met.
				// Set score fields
				if(levelName !== null && levelName !== undefined && _util.trim(levelName) !== "--" && _util.trim(levelName) !== "-" && _util.trim(levelName) !== "") {
					score["TEST_NUMBER"] = testNumber;
					score["TEST_SCORE_TEXT"] = levelName;
					score["TEST_PRIMARY_RESULT"] = levelName;
					var levelRaw = row.getField("LEVELNAME").toString().replace("Level ","");
					score["TEST_PRIMARY_RESULT_CODE"] = levelRaw;

					score["TEST_SECONDARY_RESULT_CODE"] = levelRaw;
					score["TEST_SECONDARY_RESULT"] = levelMaterial;

					score["TEST_TERTIARY_RESULT_CODE"] = predictor;
					score["TEST_TERTIARY_RESULT"] = riskLevel;

					score["TEST_QUATERNARY_RESULT_CODE"] = "ACC";
					score["TEST_QUATERNARY_RESULT"] = accuracy;

					score["TEST_CUSTOM_RESULT_CODE"] = "RATE";
					score["TEST_CUSTOM_RESULT"] = rate;

					score["TEST_ITEMS_ATTEMPTED"] = attempts;
					score["TEST_GROWTH_RESULT_CODE"] = timeTaken;
					score["TEST_GROWTH_TARGET_1"] = timeTarget;
					var timeDiff = row.getField("MEETING_TARGET_USAGE");
					if(timeDiff=="1"){
						score["TEST_GROWTH_RESULT"] = "Met weekly usage target";
					}
					else{
						score["TEST_GROWTH_RESULT"] = "Did not meet weekly usage target";
					}
					score["TEST_SCORE_ATTRIBUTES"] = activityID + "|" +
														activityName + "|" + activitySubject;
					score["TEST_PERCENTAGE_SCORE"] = percentCompleted;

					//Added 4/18/19
					score["TEST_ITEMS_POSSIBLE"] = unitsToBenchmark;
					score["TEST_RAW_SCORE"] = weekUnits;
					score["TEST_PREDICTED_SCORE"] = weeklyUnitsTarget;
					score["TEST_GROWTH_TARGET_2"] = certificateDelivered;
					score["TEST_GROWTH_TARGET_3"] = skillBuilderDelivered;
					score["TEST_GROWTH_TARGET_4"] = lessonsDelivered;
				}
				else{
					return null;
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

       var assessmentAdminKey = null;

       // Set base assessment admin key information
       assessmentAdminKey = _assessmentIdentifier
           + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
           + "_" + AssessmentLoader.config.DISTRICT_CODE
		   + "_" + hierarchy.SCHOOL_YEAR;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }


    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());