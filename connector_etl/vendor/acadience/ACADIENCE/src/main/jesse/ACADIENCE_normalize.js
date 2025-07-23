var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ACADIENCE";
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
            { TEST: "ACADIENCE", CODE: "LNF", FIELD: "LNF", MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "FSF", FIELD: "FSF", MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "PSF", FIELD: "PSF" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "NWF_CLS", FIELD: "NWF_CLS" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "NWF_WWR", FIELD: "NWF_WWR" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "ORF", FIELD: "ORF" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "ORF_WC", FIELD: "ORF_WC" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "ORF_ACC", FIELD: "ORF_ACCURACY" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "RETELL", FIELD: "RETELL" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "MAZE", FIELD: "MAZE" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "MAZE_ADJ", FIELD: "MAZE_ADJUSTED" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "MAZE_ADJ_TOT", FIELD: "MAZE_TOTAL_ADJUSTED" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "MAZE_TOT", FIELD: "MAZE_TOTAL" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "SR", FIELD: "SR" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "SR_TOT", FIELD: "SR_TOTAL" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "OR", FIELD: "OR" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "ORWC_TOT", FIELD: "OR_WC_TOTAL" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "OR_ACC_TOT", FIELD: "OR_ACCURACY_TOTAL" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "OR_COMP_TOT", FIELD: "OR_COMP_TOTAL" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "READ_COMP", FIELD: "READING_COMPOSITE" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "BQD", FIELD: "BQD", MAP_FUNCTION: mapScaledScore } ,
            { TEST: "ACADIENCE", CODE: "NIF", FIELD: "NIF", MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "NNF", FIELD: "NNF", MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "AQD", FIELD: "AQD", MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "MNF", FIELD: "MNF", MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "COMP", FIELD: "COMP", MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "C_A", FIELD: "C_A" , MAP_FUNCTION: mapScaledScore },
            { TEST: "ACADIENCE", CODE: "MATH_COMP", FIELD: "MATH_COMPOSITE", MAP_FUNCTION: mapScaledScore },

            //RAN Scores
            { TEST: "ACADIENCE", CODE: 'RAN_OBJECTS' , FIELD: 'OBJECTS', MAP_FUNCTION: mapRANStrandScore},
            { TEST: "ACADIENCE", CODE: 'RAN_LETTERS' , FIELD: 'LETTERS', MAP_FUNCTION: mapRANStrandScore},
            { TEST: "ACADIENCE", CODE: 'RAN_NUMBERS' , FIELD: 'NUMBERS', MAP_FUNCTION: mapRANStrandScore},
            { TEST: "ACADIENCE", CODE: 'RAN_TOTAL' , FIELD: 'RAN', MAP_FUNCTION: mapTotalRANScore},

            //Composite Goal Scores
            { TEST: "ACADIENCE", CODE: "MATH_COMP_GOAL", FIELD: "MATH_COMPOSITE", MAP_FUNCTION: mapCompositeGoalScore },
            { TEST: "ACADIENCE", CODE: "READ_COMP_GOAL", FIELD: "READ_COMPOSITE", MAP_FUNCTION: mapCompositeGoalScore },

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

    var statusLevels = {
        "well below benchmark": "Well Below Benchmark",
        "below benchmark": "Below Benchmark",
        "above benchmark": "Above Benchmark",
        "at benchmark": "At Benchmark",
        "at or above benchmark": "At or Above Benchmark",
        "Above Benchmark": "Above Benchmark",
        "Well Below Benchmark": "Well Below Benchmark",
        "Below Benchmark": "Below Benchmark",
        "At Benchmark": "At Benchmark",
        "Benchmark": "At Benchmark",
        "benchmark": "At Benchmark",
        "At or Above Benchmark": "At or Above Benchmark",
        "below threshold": "Below Threshold",
        "valid": "Valid",
        "": "",
        "--": "--",
        null : null
    }

    var pathwayLevels = {
        "typical": "Typical",
        "Typical": "Typical",
        "above typical": "Above Typical",
        "Above Typical": "Above Typical",
        "below typical": "Below Typical",
        "Below Typical": "Below Typical",
        "well above typical": "Well Above Typical",
        "Well Above Typical": "Well Above Typical",
        "well below typical": "Well Below Typical",
        "Well Below Typical": "Well Below Typical",
        "": "",
        "--": "--",
        null : null
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


        var defaultDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);

        // Parse BIRTH_DATE
        var birthDateObject = dateConverter(row.getField("BIRTH_DATE"));
        var adminDate = generateAdminDate(row, hierarchy);



            normalizedFileFields.forEach(function (field) {
                switch (field.trim()) {
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
                    record.REPORTING_PERIOD = getShortAdminPeriod(row);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //TEST_ADMIN_DATE must always finish/print as MM/dd/YYYY format
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = adminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_SIS_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"));
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
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        let score = {};

        let grade = gradeDecode[row.getField("GRADE")];

        let adminPeriod = getShortAdminPeriod(row);

        let testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + grade;
        if (adminPeriod) {
            testNumber += "_" + adminPeriod;
        }
        let scaleScore = row.getField(testMetadata.FIELD + "_SCORE");
        let nationalPercentile = _util.trim(row.getField(testMetadata.FIELD + "_NATIONAL_PERCENTILE"));
        let pathway = row.getField(testMetadata.FIELD + "_PATHWAY");
        let status = row.getField(testMetadata.FIELD + "_STATUS");
        let gate = row.getField(testMetadata.FIELD + "_GATE");
        let lexile = row.getField(testMetadata.FIELD + "_READING");
        let subjectDate = dateConverter(row.getField(testMetadata.FIELD + "_DATE"));

        // Trim and validate numeric format
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        {
            return null; // Exit early for invalid scores
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        //Percentile must be numeric but these values need inclusion, see UIHN-77510
        if(nationalPercentile === ">99"){
            nationalPercentile = "100";
        }
        if(nationalPercentile === "<1"){
            nationalPercentile = "0";
        }
        score["TEST_PERCENTILE_SCORE"] = nationalPercentile;
        score["TEST_PRIMARY_RESULT"] = pathway;
        score["TEST_NCE_SCORE"] = gate;
        score["TEST_SECONDARY_RESULT"] = status;
        if(lexile !== undefined && lexile !== null && lexile !== ""){
            score["TEST_READING_LEVEL"] = lexile.replace("BR", "").replace("L", "");
        }
        score["TEST_SCORE_ATTRIBUTES"] = subjectDate && subjectDate.finalDates ? subjectDate.finalDates : null;

        return score;
    }

    function mapRANStrandScore(row, testMetadata) {
        let score = {};

        let grade = gradeDecode[row.getField("GRADE")];

        let adminPeriod = getShortAdminPeriod(row);

        let testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + grade;
        if (adminPeriod) {
            testNumber += "_" + adminPeriod;
        }
        let errors = row.getField('RAN_' + testMetadata.FIELD + '_ERRORS');
        let seconds = row.getField('RAN_' + testMetadata.FIELD + '_SECONDS');
        let status = row.getField('RAN_' + testMetadata.FIELD + '_STATUS');

        if (!errors || _util.trim(errors) === "--") {
            return null;
        }

        score["TEST_NUMBER"] = testNumber;

        if (!isNaN(errors)) {
            score["TEST_SCORE_TEXT"] = errors;
            score["TEST_SCORE_VALUE"] = errors;
            score["TEST_SCALED_SCORE"] = errors;
        }

        if (!isNaN(seconds)) {
            score["TEST_RAW_SCORE"] = seconds;
        }

        if (status) {
            score["TEST_PRIMARY_RESULT"] = status;
        }
        return score;
    }

        function mapTotalRANScore(row, testMetadata) {
            let score = {};
            let grade = gradeDecode[row.getField("GRADE")];

            let adminPeriod = getShortAdminPeriod(row);

            let testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + grade;
            if (adminPeriod) {
                testNumber += "_" + adminPeriod;
            }
            let scaleScore = row.getField('TOTAL_' + testMetadata.FIELD + '_ERRORS');
            let rawScore = row.getField('TOTAL_' + testMetadata.FIELD + '_SECONDS');
            let totalstatus = row.getField('TOTAL_' + testMetadata.FIELD + '_STATUS');
            let ranDate = row.getField( testMetadata.FIELD + "_DATE");


            if (!scaleScore || _util.trim(scaleScore) === "--") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;

            if (!isNaN(scaleScore)) {
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }

            if (!isNaN(rawScore)) {
                score["TEST_RAW_SCORE"] = rawScore;
            }
            if (totalstatus) {
                score["TEST_PRIMARY_RESULT"] = totalstatus;
            }

            return score;
        }

        //Math and Reading Goal Scores
    function mapCompositeGoalScore(row, testMetadata) {
        let score = {};

        let grade = gradeDecode[row.getField("GRADE")];

        let adminPeriod = getShortAdminPeriod(row);

        let testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + grade;
        if (adminPeriod) {
            testNumber += "_" + adminPeriod;
        }
        let scaleScore = row.getField(testMetadata.FIELD + "_GOAL");
        let pathway = row.getField(testMetadata.FIELD + "_GOAL_PATHWAY");
        let goalstatus = row.getField(testMetadata.FIELD + "_GOAL_STATUS");

        // Trim and validate numeric format
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        {
            return null; // Exit early for invalid scores
        }

        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_PRIMARY_RESULT"] = pathway;
        score["TEST_SECONDARY_RESULT"] = goalstatus;


        return score;
    }

    function getShortAdminPeriod(row) {
        const benchmarkPeriod = row.getField("BENCHMARK_PERIOD");

        if (!benchmarkPeriod) {
            return null;
        }

        const periodMapping = {
            BOY: "BEG",
            BEGINNING: "BEG",
            MOY: "MID",
            MIDDLE: "MID",
            EOY: "END",
            END: "END"
        };

        // Trim, convert to uppercase, and map to short period
        const trimmedPeriod = _util.trim(benchmarkPeriod);
        if (!trimmedPeriod) {
            return null;
        }
        const normalizedPeriod = trimmedPeriod.toUpperCase();
        return periodMapping[normalizedPeriod] || null;
    }

    function generateAdminDate(row, hierarchy) {

      var benchmarkPeriod = row.getField("BENCHMARK_PERIOD");
      if (!hierarchy.SCHOOL_YEAR || hierarchy.SCHOOL_YEAR.length < 9) {
        return null;
      }

      // Check if benchmarkPeriod is null or undefined
      if (!benchmarkPeriod) {
        // Default to END period if benchmark period is not available
        return "04/15/${hierarchy.SCHOOL_YEAR.substring(5, 9)}";
      }

      var firstYear = hierarchy.SCHOOL_YEAR.substring(0, 4);
      var secondYear = hierarchy.SCHOOL_YEAR.substring(5, 9);

      var period = benchmarkPeriod.toUpperCase();

      if (period === "BOY" || period === "BEGINNING") {
        return "10/15/${firstYear}";
      } else if (period === "MOY" || period === "MIDDLE") {
        return "01/15/${secondYear}";
      } else if (period === "EOY" || period === "END") {
        return "04/15/${secondYear}";
      } else {
        return "04/15/${secondYear}";
      }
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

        
        return assessmentAdminKey;
    }

    return module;
}());