var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MT_SBAC";
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
          {TEST: "MT_SBAC", CODE:"SCI_TOT", FIELD: "SS_TOT", MAP_FUNCTION: mapScaleScore},
          {TEST: "MT_SBAC", CODE:"", FIELD: "", MAP_FUNCTION: mapSrc1Score},
          {TEST: "MT_SBAC", CODE:"", FIELD: "", MAP_FUNCTION: mapSrc2Score},
          {TEST: "MT_SBAC", CODE:"", FIELD: "", MAP_FUNCTION: mapSrc3Score},
          {TEST: "MT_SBAC", CODE:"", FIELD: "", MAP_FUNCTION: mapSrc4Score},
          {TEST: "MT_SBAC", CODE:"", FIELD: "", MAP_FUNCTION: mapSrc5Score},
          {TEST: "MT_SBAC", CODE:"", FIELD: "", MAP_FUNCTION: mapSrc6Score}
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

        function dateConverter(dateString) {
            // Check if dateString is null, undefined, or an empty string
            if (!dateString || typeof dateString !== 'string' || dateString.trim() === '') {
                return { finalDates: null, months: null, days: null, years: null };
            }

            var dateParts, dateObj, year, month, day;

            // Check for the presence of time and strip it out for initial processing
            var timeIndex = dateString.indexOf(" ");
            if (timeIndex !== -1) {
                dateString = dateString.split(" ")[0];
            }

            // Replace dashes with slashes for consistent processing
            dateString = dateString.replace(/-/g, '/');

            // Handle MMddyyyy format
            if (dateString.match(/^\d{8}$/)) {
                if (parseInt(dateString.substring(0, 4), 10) > 1900) { // Likely YYYYMMDD format
                    year = dateString.substring(0, 4);
                    month = dateString.substring(4, 6);
                    day = dateString.substring(6, 8);
                } else { // MMddyyyy format
                    month = dateString.substring(0, 2);
                    day = dateString.substring(2, 4);
                    year = dateString.substring(4, 8);
                }
            }
            // Handle YYYY/MM/DD, DD/MM/YYYY, or MM/DD/YYYY
            else if (dateString.match(/^\d{4}\/\d{2}\/\d{2}$/)) { // YYYY/MM/DD format
                dateParts = dateString.split('/');
                year = dateParts[0];
                month = dateParts[1];
                day = dateParts[2];
            } else if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) { // DD/MM/YYYY or MM/DD/YYYY
                dateParts = dateString.split('/');
                if (parseInt(dateParts[0], 10) > 12) { // DD/MM/YYYY format
                    day = dateParts[0];
                    month = dateParts[1];
                    year = dateParts[2];
                } else if (parseInt(dateParts[1], 10) > 12) { // MM/DD/YYYY format
                    month = dateParts[0];
                    day = dateParts[1];
                    year = dateParts[2];
                } else {
                    // Ambiguous case, default to MM/DD/YYYY
                    month = dateParts[0];
                    day = dateParts[1];
                    year = dateParts[2];
                }
            } else {
                return { finalDates: null, months: null, days: null, years: null };
            }

            // Create the Date object
            dateObj = new Date(`${year}/${month}/${day}`);
            if (isNaN(dateObj.getTime())) {
                return { finalDates: null, months: null, days: null, years: null };
            }

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
        var assessmentDateObject = dateConverter(row.getField("TEST_ADMIN_DATE"));


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
                    if (assessmentDateObject.finalDates === null) {
                        var defaultYear = hierarchy.SCHOOL_YEAR.substring(5, 9);
                        record.TEST_ADMIN_DATE = "05/15/" + defaultYear;
                    } else {
                        record.TEST_ADMIN_DATE = assessmentDateObject.finalDates;
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
    function mapAdditionalAdminFields(row) {
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaleScore(row, testMetadata) {
        var score = {};

        var subjectName = getSubjectFromFilename(row);

        if (subjectName === null) {
            return null; //
        }

        var testNumber = testMetadata.TEST + "_" + subjectName;

        var scaleScore = row.getField("SS_TOT");
        var numItem = row.getField("NUM_ITEM_TOT");
        var assmntnumItem = row.getField("ASSESSMENT_ITEMS");
        var rawTotal = row.getField("RAW_TOT");
        var thetaTotal = row.getField("THETA_TOT");
        var semThetaTotal = row.getField("SEM_THETA_TOT");
        var semTotal = row.getField("SEM_TOT");

        var proficiencyLvl = _util.trim(row.getField("PERFORMANCE_LEVEL"));

        // Check for key fields and exit if conditions are not met
        if (!scaleScore || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(thetaTotal)) {
            score["TEST_SCORE_TEXT"] = thetaTotal;
        }
        if (!isNaN(semThetaTotal)) {
            score["TEST_SCORE_VALUE"] = semThetaTotal;
        }
        if (!isNaN(scaleScore)) {
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if (!isNaN(semTotal)) {
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = semTotal;
        }
        if (!isNaN(numItem)) {
            score["TEST_ITEMS_ATTEMPTED"] = numItem;
        }
        if (!isNaN(assmntnumItem)) {
            score["TEST_ITEMS_POSSIBLE"] = assmntnumItem;
        }
        if (!isNaN(rawTotal)) {
            score["TEST_RAW_SCORE"] = rawTotal;
        }

        if (proficiencyLvl) {
            score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[proficiencyLvl].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = proficiencyLvl;
            score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[proficiencyLvl].DESC;
        }

        return score;
    }

    function mapSrc1Score(row, testMetadata) {
        var score = {};

        var srcSubject = getSubjectFromField(row, "SRC1");

        if (srcSubject === null) {
            return null;
        }

        var testNumber = testMetadata.TEST + "_" + srcSubject;

        var src1scaleScore = row.getField("SRC1_SS_TOT");
        var src1numItem = row.getField("SRC1_NUM_ITEM_TOT");
        var src1thetaTotal = row.getField("SRC1_THETA_TOT");
        var src1semThetaTotal = row.getField("SRC1_SEM_THETA_TOT");
        var src1semTotal = row.getField("SRC1_SEM_TOT");

        var src1proficiencyLvl = _util.trim(row.getField("SRC1_PERFORMANCE_LEVEL"));

        // Check if the scale score is valid
        if (!src1scaleScore || _util.trim(src1scaleScore) === "--" || _util.trim(src1scaleScore) === "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(src1thetaTotal)) {
            score["TEST_SCORE_TEXT"] = src1thetaTotal;
        }
        if (!isNaN(src1semThetaTotal)) {
            score["TEST_SCORE_VALUE"] = src1semThetaTotal;
        }
        if (!isNaN(src1scaleScore)) {
            score["TEST_SCALED_SCORE"] = src1scaleScore;
        }
        if (!isNaN(src1semTotal)) {
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = src1semTotal;
        }
        if (!isNaN(src1numItem)) {
            score["TEST_ITEMS_ATTEMPTED"] = src1numItem;
        }

        if (src1proficiencyLvl) {
            score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[src1proficiencyLvl].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = src1proficiencyLvl;
            score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[src1proficiencyLvl].DESC;
        }

        return score;
    }


        function mapSrc2Score(row, testMetadata) {
            var score = {};

            var srcSubject = getSubjectFromField(row, "SRC2");

            if (srcSubject === null) {
                return null;
            }

            var testNumber = testMetadata.TEST + "_" + srcSubject;

            var src2scaleScore = row.getField("SRC2_SS_TOT");
            var src2numItem = row.getField("SRC2_NUM_ITEM_TOT");
            var src2thetaTotal = row.getField("SRC2_THETA_TOT");
            var src2semThetaTotal = row.getField("SRC2_SEM_THETA_TOT");
            var src2semTotal = row.getField("SRC2_SEM_TOT");

            var src2proficiencyLvl = _util.trim(row.getField("SRC2_PERFORMANCE_LEVEL"));

            if (src2scaleScore === null || src2scaleScore === undefined || _util.trim(src2scaleScore) === "--" || _util.trim(src2scaleScore) === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;

            if (!isNaN(src2thetaTotal)) {
                score["TEST_SCORE_TEXT"] = src2thetaTotal;
            }
            if (!isNaN(src2semThetaTotal)) {
                score["TEST_SCORE_VALUE"] = src2semThetaTotal;
            }
            if (!isNaN(src2scaleScore)) {
                score["TEST_SCALED_SCORE"] = src2scaleScore;
            }
            if (!isNaN(src2semTotal)) {
                score["TEST_SCORE_TO_PREDICTED_RESULT"] = src2semTotal;
            }
            if (!isNaN(src2numItem)) {
                score["TEST_ITEMS_ATTEMPTED"] = src2numItem;
            }

            if (src2proficiencyLvl) {
                score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[src2proficiencyLvl].PASS_IND;
                score["TEST_PRIMARY_RESULT_CODE"] = src2proficiencyLvl;
                score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[src2proficiencyLvl].DESC;
            }

            return score;
        }

    function mapSrc3Score(row, testMetadata) {
        var score = {};

        var srcSubject = getSubjectFromField(row, "SRC3");

        if (srcSubject === null) {
            return null;
        }

        var testNumber = testMetadata.TEST + "_" + srcSubject;

        var src3scaleScore = row.getField("SRC3_SS_TOT");
        var src3numItem = row.getField("SRC3_NUM_ITEM_TOT");
        var src3thetaTotal = row.getField("SRC3_THETA_TOT");
        var src3semThetaTotal = row.getField("SRC3_SEM_THETA_TOT");
        var src3semTotal = row.getField("SRC3_SEM_TOT");

        var src3proficiencyLvl = _util.trim(row.getField("SRC3_PERFORMANCE_LEVEL"));

        if (src3scaleScore === null || src3scaleScore === undefined || _util.trim(src3scaleScore) === "--" || _util.trim(src3scaleScore) === "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(src3thetaTotal)) {
            score["TEST_SCORE_TEXT"] = src3thetaTotal;
        }
        if (!isNaN(src3semThetaTotal)) {
            score["TEST_SCORE_VALUE"] = src3semThetaTotal;
        }
        if (!isNaN(src3scaleScore)) {
            score["TEST_SCALED_SCORE"] = src3scaleScore;
        }
        if (!isNaN(src3semTotal)) {
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = src3semTotal;
        }
        if (!isNaN(src3numItem)) {
            score["TEST_ITEMS_ATTEMPTED"] = src3numItem;
        }

        if (src3proficiencyLvl) {
            score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[src3proficiencyLvl].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = src3proficiencyLvl;
            score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[src3proficiencyLvl].DESC;
        }

        return score;
    }

    function mapSrc4Score(row, testMetadata) {
        var score = {};

        var srcSubject = getSubjectFromField(row, "SRC4");

        if (srcSubject === null) {
            return null;
        }

        var testNumber = testMetadata.TEST + "_" + srcSubject;

        var src4scaleScore = row.getField("SRC4_SS_TOT");
        var src4numItem = row.getField("SRC4_NUM_ITEM_TOT");
        var src4thetaTotal = row.getField("SRC4_THETA_TOT");
        var src4semThetaTotal = row.getField("SRC4_SEM_THETA_TOT");
        var src4semTotal = row.getField("SRC4_SEM_TOT");

        var src4proficiencyLvl = _util.trim(row.getField("SRC4_PERFORMANCE_LEVEL"));

        if (src4scaleScore === null || src4scaleScore === undefined || _util.trim(src4scaleScore) === "--" || _util.trim(src4scaleScore) === "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(src4thetaTotal)) {
            score["TEST_SCORE_TEXT"] = src4thetaTotal;
        }
        if (!isNaN(src4semThetaTotal)) {
            score["TEST_SCORE_VALUE"] = src4semThetaTotal;
        }
        if (!isNaN(src4scaleScore)) {
            score["TEST_SCALED_SCORE"] = src4scaleScore;
        }
        if (!isNaN(src4semTotal)) {
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = src4semTotal;
        }
        if (!isNaN(src4numItem)) {
            score["TEST_ITEMS_ATTEMPTED"] = src4numItem;
        }

        if (src4proficiencyLvl) {
            score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[src4proficiencyLvl].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = src4proficiencyLvl;
            score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[src4proficiencyLvl].DESC;
        }

        return score;
    }

    function mapSrc5Score(row, testMetadata) {
        var score = {};

        var srcSubject = getSubjectFromField(row, "SRC5");

        if (srcSubject === null) {
            return null;
        }

        var testNumber = testMetadata.TEST + "_" + srcSubject;

        var src5scaleScore = row.getField("SRC5_SS_TOT");
        var src5numItem = row.getField("SRC5_NUM_ITEM_TOT");
        var src5thetaTotal = row.getField("SRC5_THETA_TOT");
        var src5semThetaTotal = row.getField("SRC5_SEM_THETA_TOT");
        var src5semTotal = row.getField("SRC5_SEM_TOT");

        var src5proficiencyLvl = _util.trim(row.getField("SRC5_PERFORMANCE_LEVEL"));

        if (src5scaleScore === null || src5scaleScore === undefined || _util.trim(src5scaleScore) === "--" || _util.trim(src5scaleScore) === "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(src5thetaTotal)) {
            score["TEST_SCORE_TEXT"] = src5thetaTotal;
        }
        if (!isNaN(src5semThetaTotal)) {
            score["TEST_SCORE_VALUE"] = src5semThetaTotal;
        }
        if (!isNaN(src5scaleScore)) {
            score["TEST_SCALED_SCORE"] = src5scaleScore;
        }
        if (!isNaN(src5semTotal)) {
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = src5semTotal;
        }
        if (!isNaN(src5numItem)) {
            score["TEST_ITEMS_ATTEMPTED"] = src5numItem;
        }

        if (src5proficiencyLvl) {
            score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[src5proficiencyLvl].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = src5proficiencyLvl;
            score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[src5proficiencyLvl].DESC;
        }

        return score;
    }

    function mapSrc6Score(row, testMetadata) {
        var score = {};

        var srcSubject = getSubjectFromField(row, "SRC6");

        if (srcSubject === null) {
            return null;
        }

        var testNumber = testMetadata.TEST + "_" + srcSubject;

        var src6scaleScore = row.getField("SRC6_SS_TOT");
        var src6numItem = row.getField("SRC6_NUM_ITEM_TOT");
        var src6thetaTotal = row.getField("SRC6_THETA_TOT");
        var src6semThetaTotal = row.getField("SRC6_SEM_THETA_TOT");
        var src6semTotal = row.getField("SRC6_SEM_TOT");

        var src6proficiencyLvl = _util.trim(row.getField("SRC6_PERFORMANCE_LEVEL"));

        if (src6scaleScore === null || src6scaleScore === undefined || _util.trim(src6scaleScore) === "--" || _util.trim(src6scaleScore) === "") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(src6thetaTotal)) {
            score["TEST_SCORE_TEXT"] = src6thetaTotal;
        }
        if (!isNaN(src6semThetaTotal)) {
            score["TEST_SCORE_VALUE"] = src6semThetaTotal;
        }
        if (!isNaN(src6scaleScore)) {
            score["TEST_SCALED_SCORE"] = src6scaleScore;
        }
        if (!isNaN(src6semTotal)) {
            score["TEST_SCORE_TO_PREDICTED_RESULT"] = src6semTotal;
        }
        if (!isNaN(src6numItem)) {
            score["TEST_ITEMS_ATTEMPTED"] = src6numItem;
        }

        if (src6proficiencyLvl) {
            score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[src6proficiencyLvl].PASS_IND;
            score["TEST_PRIMARY_RESULT_CODE"] = src6proficiencyLvl;
            score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[src6proficiencyLvl].DESC;
        }

        return score;
    }


       function getSubjectFromFilename(row) {
           var subject = null;
           var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();

           if (fileName.indexOf("ELA") > -1) {
               subject = "ELA";
           } else if (fileName.indexOf("MATH") > -1) {
               subject = "MATH";
           }

           return subject;
       }

    function getSubjectFromField(row, srcType) {
        var subject = null;

        var label = row.getField(srcType + "_LABEL");

        if (!label) {
            return null;
        }
        label = _util.trim(label).toUpperCase();

        if (label === "READ") {
            subject = "RD";
        } else if (label === "L&SP") {
            subject = "LSP";
        } else if (label === "WRI") {
            subject = "WR";
        } else if (label === "C&PR") {
            subject = "CPR";
        } else if (label === "PROB") {
            subject = "PROB";
        } else if (label === "REAS") {
            subject = "REAS";
        } else {
            return null;
            }


        return subject;
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