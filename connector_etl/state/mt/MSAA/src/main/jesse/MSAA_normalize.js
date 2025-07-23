var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MSAA";
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
          {TEST: "MSAA", CODE:"MAT", FIELD: "MAT", MAP_FUNCTION: mapMatScore},
          {TEST: "MSAA", CODE:"ELA", FIELD: "ELA", MAP_FUNCTION: mapElaScore},
          {TEST: "MSAA", CODE:"WRP_1", FIELD: "WRP_1_", MAP_FUNCTION: mapTraitScore},
          {TEST: "MSAA", CODE:"WRP_2", FIELD: "WRP_2_", MAP_FUNCTION: mapTraitScore},
          {TEST: "MSAA", CODE:"WRP_3", FIELD: "WRP_3_", MAP_FUNCTION: mapTraitScore},
          {TEST: "MSAA", CODE:"RD_PCT", FIELD: "RD_", MAP_FUNCTION: mapSubScore},
          {TEST: "MSAA", CODE:"WR_PCT", FIELD: "WR_", MAP_FUNCTION: mapSubScore}
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
        "1" : { DESC:"Novice", PASS_IND: "No"}
        ,"2" : { DESC:"Nearing Proficiency", PASS_IND: "No"}
        ,"3" : { DESC:"Proficient", PASS_IND: "Yes"}
        ,"4" : { DESC:"Advanced", PASS_IND: "Yes"}
        ,"" : { DESC: "Not Specified", PASS_IND: "No"}
        ,null : { DESC: "Not Specified", PASS_IND: "No"}
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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row,hierarchy);

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

        function dateConverter(dateString) {
            if (!dateString || typeof dateString !== 'string' || dateString.trim() === '') {
                return { finalDates: null, months: null, days: null, years: null };
            }

            var dateObj, year, month, day;

            // Strip the time part if present by splitting on the space
            if (dateString.indexOf(" ") !== -1) {
                dateString = dateString.split(" ")[0];  // Keep only the date part (YYYY-MM-DD)
            }

            // Replace dashes with slashes for consistent date parsing
            dateString = dateString.replace(/-/g, '/');

            // Create the Date object
            dateObj = new Date(dateString);

            // Handle invalid date scenarios
            if (isNaN(dateObj.getTime())) {
                return { finalDates: null, months: null, days: null, years: null };
            }

            // Format the date into MM/DD/YYYY
            month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
            day = ('0' + dateObj.getDate()).slice(-2);
            year = dateObj.getFullYear();

            var finalDate = month + '/' + day + '/' + year;
            return { finalDates: finalDate, months: month, days: day, years: year };
        }



    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();



        var birthDateObject = dateConverter(row.getField("BIRTH_DATE"));


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
                    var matScore = row.getField("MATSCALEDSCORE");
                    var matTestDateField = row.getField("MATH_TEST_ADMIN_DATE");

                    if (matScore && matTestDateField) {
                        var matTestDate = dateConverter(matTestDateField);

                        if (matTestDate.finalDates) {
                            record.TEST_ADMIN_DATE = matTestDate.finalDates;
                        }
                    } else if (hierarchy && hierarchy.SCHOOL_YEAR) {
                            var defaultYear = hierarchy.SCHOOL_YEAR.substring(5, 9);
                            record.TEST_ADMIN_DATE = "05/15/" + defaultYear;
                        }
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                        ,row.getField("DISTRICT_STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.months, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.days, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.years, null);
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NAME"), row.getField("STATE_SCHOOL_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("STATE_SCHOOL_ID"));
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
    function mapAdditionalAdminFields(row,hierarchy) {
        var admin = {};

        var elaScore = row.getField("ELASCALEDSCORE");
        var elaTestDateField = row.getField("ELA_TEST_ADMIN_DATE");

        if (elaScore && elaTestDateField) {
            var elaTestDate = dateConverter(elaTestDateField);

            if (elaTestDate.finalDates) {
                admin.TEST_INTERVENTION_DESC = elaTestDate.finalDates;
            }
            } else {
                var defaultYear = hierarchy.SCHOOL_YEAR.substring(5, 9);
                admin.TEST_INTERVENTION_DESC = "05/15/" + defaultYear;
            }

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapMatScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" +testMetadata.CODE;

        var matscaleScore = _util.trim(row.getField("MATSCALEDSCORE"));

        var proficiencyLvlMat = _util.trim(row.getField("PROFICIENCY_LEVEL_MAT"));

        var matReportingStatus = row.getField("MAT_STATUS");
        var matRawScore = row.getField("MAT_RAW_SCORE");
        var matItemScore = row.getField("MAT_ITEM_SCORE");
        var matFieldItem = row.getField("MAT_FIELD_ITEM");



//         Check for key fields and do not map score and exit if conditions met.
        if (matscaleScore === null || matscaleScore === undefined || _util.trim(matscaleScore) === "--" || _util.trim(matscaleScore) === "")
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;

        if(!isNaN(matscaleScore)){

            score["TEST_SCALED_SCORE"] = matscaleScore;
            }

        if (!isNaN(matRawScore)) {
            score["TEST_RAW_SCORE"] = matRawScore;
        }

        if (!isNaN(matItemScore)) {
            score["TEST_SCORE_VALUE"] = matItemScore;
        }

        if (!isNaN(matFieldItem)) {
            score["TEST_SCORE_TEXT"] = matFieldItem;
        }



        if(proficiencyLvlMat){
    	score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[proficiencyLvlMat].PASS_IND;
    	score["TEST_PRIMARY_RESULT_CODE"] = proficiencyLvlMat;
    	score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[proficiencyLvlMat].DESC;
    	}

    	score["TEST_CUSTOM_RESULT"] = matReportingStatus;


        return score;
    }


    function mapElaScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" +testMetadata.CODE;


        var elascaleScore = _util.trim(row.getField("ELASCALEDSCORE"));


        var proficiencyLvlEla = _util.trim(row.getField("PROFICIENCY_LEVEL_ELA"));


        var elaReportingStatus = row.getField("ELA_STATUS");

        var elaRawScore = row.getField("ELA_RAW_SCORE");
        var elaItemScore = row.getField("ELA_ITEM_SCORE");
        var elaFieldItem = row.getField("ELA_FIELD_ITEM");


//         Check for key fields and do not map score and exit if conditions met.
          if (elascaleScore === null || elascaleScore === undefined || _util.trim(elascaleScore) === "--" || _util.trim(elascaleScore) === "")
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;


        if(!isNaN(elascaleScore)){
    	    score["TEST_SCALED_SCORE"] = elascaleScore;
    	    }

        if (!isNaN(elaRawScore)) {
            score["TEST_RAW_SCORE"] = elaRawScore;
        }

        if (!isNaN(elaItemScore)) {
            score["TEST_SCORE_VALUE"] = elaItemScore;
        }

        if (!isNaN(elaFieldItem)) {
            score["TEST_SCORE_TEXT"] = elaFieldItem;
        }



        if(proficiencyLvlEla){
    	score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[proficiencyLvlEla].PASS_IND;
    	score["TEST_PRIMARY_RESULT_CODE"] = proficiencyLvlEla;
    	score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[proficiencyLvlEla].DESC;
    	}
    	score["TEST_CUSTOM_RESULT"] = elaReportingStatus;


        return score;
    }

    function mapTraitScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" +testMetadata.CODE;

		var trait = row.getField(testMetadata.FIELD + "TRAIT");

        var wrReportingStatus = row.getField("WRP_STATUS");

        if (!trait || trait === "--") {
            return null;
        }
    	score["TEST_NUMBER"] = testNumber;


        if(!isNaN(trait)){
        score["TEST_NCE_SCORE"] = trait;
        }

    	score["TEST_CUSTOM_RESULT"] = wrReportingStatus;

        return score;
    }

    function mapSubScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" +testMetadata.CODE;

		var readWritePct = row.getField(testMetadata.FIELD + "PCT");


    	score["TEST_NUMBER"] = testNumber;

        if(!isNaN(readWritePct)){
        score["TEST_PERCENTAGE_SCORE"] = readWritePct;
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

        // Generate the assessmentAdminKey using hierarchy values and the converted date
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        // Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        // Examples of adding additional values (if needed)
        // assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        // assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);

        // Return the generated assessment admin key
        return assessmentAdminKey;
    }

    return module;
}());