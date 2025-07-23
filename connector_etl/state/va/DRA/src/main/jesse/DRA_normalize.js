var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "DRA";
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
        {TEST: "DRA", CODE:"PRE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "DRA", CODE:"POST", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "DRA", CODE:"MID", MAP_FUNCTION: mapScaledScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeDecode = {
       "KG" : "KG"
        , "K" : "KG"
        , "0" : "KG"
        , "1" : "01"
        , "01" : "01"
        , "2" : "02"
        , "02" : "02"
        , "3" : "03"
        , "03" : "03"
        , "4" : "04"
        , "04" : "04"
        , "5" : "05"
        , "05" : "05"
        , "6" : "06"
        , "06" : "06"
        , "7" : "07"
        , "07" : "07"
        , "8" : "08"
        , "08" : "08"
        , null : null
        , "" : null
    };

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function getPeriod(row){
        var testPeriod = "PRE";
        var postDate = row.getField("POST_TEST_DATE");
        if(null !== postDate && undefined !== postDate && "" !== postDate){
            testPeriod = "POST";
        }
        return testPeriod;
    }
    function getPeriodDate(row){
        var postDate = row.getField("POST_TEST_DATE");
        var preDate = row.getField("PRE_TEST_DATE");
        if(null !== postDate && undefined !== postDate && "" !== postDate){
           return postDate;
        }
        return preDate;
    }
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
        };

        var fullName = row.getField("LAST_NAME_FIRST_NAME");

        if(fullName !== null &&  fullName !== undefined ){
            var firstName = _util.trim(fullName.split(",")[1]);
            if(firstName !== null &&  firstName !== undefined ){
            if(firstName.indexOf(".")>-1){
                var middleName = firstName.substring(firstName.lastIndexOf(".")-1);
                firstName =   _util.trim(firstName.substring(0,firstName.lastIndexOf(".")-1));
            }
            else{
                var middleName = null;
            }
            var lastName = fullName.split(",")[0];
        }
        }
        else{
            var firstName = row.getField("STUDENT_FIRST_NAME");
            var lastName = row.getField("STUDENT_LAST_NAME");
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
                    record.REPORTING_PERIOD = _util.coalesce(getPeriod(row),hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = AppUtil.getMonthFollowedByDay(getPeriodDate(row), "MM/dd/yyyy").STANDARD_DATE;
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
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOL"),("DISTRICT")
                    );
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL"),("DISTRICT")
                    ).toString().substring(0,25);
                    break;

                //Student IDs and Match Results
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField('SSID');
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField('SSID');
                    break;

                //Student Information
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = firstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= middleName;
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = row.getField('GENDER');
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = gradeDecode[_util.coalesce(row.getField("GRADE"))];
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
    function mapAdditionalAdminFields(row){
        var admin = {};
        admin.TEST_INTERVENTION_CODE = "Interv.";
        admin.TEST_INTERVENTION_DESC = row.getField("STUDENT_INTERVENTIONS");
        admin.TEST_INTERVENTION_CODE_2 = "Created";
        admin.TEST_INTERVENTION_DESC_2 = row.getField("CREATED_BY");
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/


    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + '_' + testMetadata.CODE;

		var textLevel = row.getField(testMetadata.CODE + "_TEXT_LEVEL");
		var title = row.getField(testMetadata.CODE + "_TITLE");
		var comments = row.getField(testMetadata.CODE + "_COMMENTS");
		var tier = row.getField(testMetadata.CODE + "_TIER");
		var trueDate = row.getField(testMetadata.CODE + "_TEST_DATE");

        // Check for key fields and do not map score and exit if conditions met.
        if(textLevel === null || textLevel === undefined || _util.trim(textLevel) === "--" || _util.trim(textLevel) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = textLevel;
    	score["TEST_PRIMARY_RESULT"] = tier;
    	if(!isNaN(textLevel)){
    	    score["TEST_SCALED_SCORE"] = textLevel;
    	    score["TEST_SCORE_VALUE"] = textLevel;
    	}
    	else{
    	    //Value is A, which is below 1
    	    score["TEST_SCALED_SCORE"] = 0;
    	    score["TEST_SCORE_VALUE"] = 0;
    	}
    	score["TEST_SCORE_ATTRIBUTES"] = title;
    	score["TEST_SECONDARY_RESULT_CODE"] = "Comments";

    	// Truncate text to database field width
    	var comment = null;
    	if (comments === null || comments === "" || comments === undefined) {
    	    comment = comments;
    	}
    	else if (comments.length > 100) {
    	    comment = comments.substring(0,99);
    	} else {
    	    comment = comments;
    	}

    	score["TEST_SECONDARY_RESULT"] = comment;
    	score["TEST_TERTIARY_RESULT_CODE"] = "Date";
    	score["TEST_TERTIARY_RESULT"] = trueDate;

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