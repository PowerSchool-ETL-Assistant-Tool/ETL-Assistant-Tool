var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MTAS_ON_DEMAND";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
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
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + '|' + JSON.stringify(two)));
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
				.transform("TRANSFORMATION", ["RECORDS"],
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
						if(mappingObject.SCORE_MAPPINGS.length === 0 &&  row.getField("INCLUDE_INDICATOR") === "N") {
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "LOW",row.LINEAGE_LINE, "Include indicator is No.", JSON.stringify(row)));
						}
					else if(mappingObject.SCORE_MAPPINGS.length == 0) {
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

    var scoresToMap =
        [
            // Initial ELPAC Scores to Process
            {TEST: "MTAS", CODE: "TOT", FIELD:"", MAP_FUNCTION: mapTotalScore}
             ,{TEST: "MTAS", CODE: "ES1", FIELD: "ES1", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MTAS", CODE: "ES2", FIELD: "ES2", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MTAS", CODE: "ES3", FIELD: "ES3", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MTAS", CODE: "ES4", FIELD: "ES4", MAP_FUNCTION: mapStrandScore}
             ,{TEST: "MTAS", CODE: "ESTOT", FIELD: "ES_TOTAL", MAP_FUNCTION: mapStrandScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var gradeLookup = {
        "KN" 	: "KG"
        ,"01"	: "01"
		,"1"	: "01"
        ,"02"	: "02"
        ,"2"	: "02"
        ,"03"	: "03"
        ,"3"	: "03"
        ,"04"	: "04"
        ,"4"	: "04"
        ,"05"	: "05"
        ,"5"	: "05"
        ,"06"	: "06"
        ,"6"	: "06"
        ,"07"	: "07"
        ,"7"	: "07"
        ,"08"	: "08"
        ,"8"	: "08"
        ,"09"	: "09"
        ,"9"	: "09"
        ,"10"	: "10"
        ,"11"	: "11"
        ,"12"	: "12"
        ,"High School" : "HS"
    };

    var subjectLookup = {
        "Reading" 	: "RD"
        ,"Read" 	: "RD"
        ,"Science"	: "SCI"
        ,"Math"	: "MA"
        ,"Mathematics" : "MA"
        ,null	: null
    }


	var decodeConditionCodes = {
        "NC" 	: "Not Completed"
        ,"NA"	: "Not Attempted"
        ,null	: null
    };

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    function decodeGradeCode(gradeCode) {
        if(gradeCode == null) {
            return null;
        }
        var lkpGradeObj = gradeLookup[gradeCode];
        if(lkpGradeObj == undefined || lkpGradeObj == null) {
            return null;
        }
        return lkpGradeObj;
    }

    function decodeSubject(subject) {
        if(subject == null) {
            return null;
        }
        var lkpSubjectObj = subjectLookup[subject];
        if(lkpSubjectObj == undefined || lkpSubjectObj == null) {
            return null;
        }
        return lkpSubjectObj;
    }

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

        var record = mapSingleNormalizedRecord(signature, hierarchy, row);

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
    function mapSingleNormalizedRecord(signature, hierarchy, row) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row)

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
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

        var birthDateObject = parseDate(row.getField("DATE_OF_BIRTH"));
        var testDateObject = parseDate(row.getField("TEST_DATE"));

        var schoolCode = row.getField("SCH_CODE");
                 var schoolID;
                  if(schoolCode.indexOf('-') > -1) {
                  schoolID = schoolCode.toString().split("-")[2];
                  }
                  else{
                  schoolID = schoolCode;
                  }

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
                        schoolID
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL")
                    );
                 case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(
                        schoolID
                     );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(
                        schoolID
                    );
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = birthDateObject.DAY;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADE")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("MARSS_SSID_NUMBER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesceEmptyString(row.getField("MARSS_SSID_NUMBER"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesceEmptyString(row.getField("LOCAL_USE_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = testDateObject.STANDARD_DATE;
                    break;
                default:
                    record[field] = row.getField(field);
                    break
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

        if (_util.trim(row.getField("SCALE_SCORE")) !== "") {
            admin.TEST_INTERVENTION_CODE = _util.trim(row.getField("SCALE_SCORE"));
            admin.TEST_INTERVENTION_DESC = decodeConditionCodes[admin.TEST_INTERVENTION_CODE] === undefined ? null : decodeConditionCodes[admin.TEST_INTERVENTION_CODE];
        }

        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapTotalScore(row, testMetadata) {
        var score = {};

        var testNumber =  testMetadata.TEST
                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + testMetadata.CODE
                             + "_" + decodeGradeCode(row.getField("GRADE"));

        var achievementLevel = row.getField("ACHIEVEMENT_LEVEL");
        var scaledScore = row.getField("SCALE_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaledScore === undefined || scaledScore === null || _util.trim(scaledScore) === "") {
            return null;
        }

        // Set score fields
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaledScore;
        if(!isNaN(scaledScore)){
            score["TEST_SCORE_VALUE"] = scaledScore;
            score["TEST_SCALED_SCORE"] = scaledScore;
        }
        score["TEST_PRIMARY_RESULT"] = achievementLevel;
        return score;
    }

    function mapStrandScore(row, testMetadata) {
        var score = {};
        var testNumber =  testMetadata.TEST
                             + "_" + decodeSubject(row.getField("SUBJECT"))
                             + "_" + testMetadata.CODE
                             + "_" + decodeGradeCode(row.getField("GRADE"));

        var pointsEarned = row.getField(testMetadata.FIELD+"_EARNED");
        var pointsPossible = row.getField(testMetadata.FIELD+"_POSSIBLE");

        // Check for key fields and do not map score and exit if conditions met.
        if(pointsEarned === undefined || pointsEarned === null || _util.trim(pointsEarned) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_ITEMS_ATTEMPTED"] = pointsEarned;
        score["TEST_ITEMS_POSSIBLE"] = pointsPossible;

        return score;
    }

    /***************************************************************************
     Utility Functions
     ***************************************************************************/

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


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
      var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }




    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if(rawDate.length > 8 && rawDate.indexOf("/") > -1 )
        {
          var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        } else {
          var formatter = new java.text.SimpleDateFormat("yyyyMMdd");
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




    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());