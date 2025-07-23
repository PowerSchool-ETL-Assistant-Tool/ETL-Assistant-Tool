var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "HSPT";
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
        {TEST: "HSPT", CODE:"VB", FIELD: "VERBAL", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "HSPT", CODE:"RD", FIELD: "READING", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "HSPT", CODE:"LAN", FIELD: "LANGUAGE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "HSPT", CODE:"MA", FIELD: "MATH", MAP_FUNCTION: mapScaledScore}
       ,{TEST: "HSPT", CODE:"QUAN", FIELD: "QUANTITATIVE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "HSPT", CODE:"OVR", FIELD: "COMPOSITE", MAP_FUNCTION: mapScaledScore}
          //Raw Score
        ,{TEST: "HSPT", CODE:"VBRS", FIELD: "VBRS_RAW", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"QTRS", FIELD: "QTRS_RAW", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"RDRS", FIELD: "RDRS_RAW", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"MTRS", FIELD: "MTRS_RAW", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"LNRS", FIELD: "LNRS_RAW", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"TCRS", FIELD: "TCRS_RAW", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"TBRS", FIELD: "TBRS_RAW", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"CMRS", FIELD: "CMRS_RAW", MAP_FUNCTION: mapCombinedScore}

        //Standard Score
        ,{TEST: "HSPT", CODE:"VBSS", FIELD: "VBSS", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"QTSS", FIELD: "QTSS", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"RDSS", FIELD: "RDSS", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"MTSS", FIELD: "MTSS", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"LNSS", FIELD: "LNSS", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"TCSS", FIELD: "TCSS", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"TBSS", FIELD: "TBSS", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"CMSS", FIELD: "CMSS", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"PACT", FIELD: "PACT", MAP_FUNCTION: mapCombinedScore}
        ,{TEST: "HSPT", CODE:"ESAT", FIELD: "ESAT", MAP_FUNCTION: mapCombinedScore}

        // Equivalent Score
        ,{TEST: "HSPT", CODE:"RDGE", FIELD: "RDGE", MAP_FUNCTION: mapEquivalentScore}
        ,{TEST: "HSPT", CODE:"MTGE", FIELD: "MTGE", MAP_FUNCTION: mapEquivalentScore}
        ,{TEST: "HSPT", CODE:"LNGE", FIELD: "LNGE", MAP_FUNCTION: mapEquivalentScore}

        // Quotient Score
        ,{TEST: "HSPT", CODE:"CSQ", FIELD: "CSQ", MAP_FUNCTION: mapQuotientScore}


        //Percentile
        ,{TEST: "HSPT", CODE:"CMNP", FIELD: "CMNP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"CMLP", FIELD: "CMLP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"VBNP", FIELD: "VBNP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"VBLP", FIELD: "VBLP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"QTNP", FIELD: "QTNP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"RDNP", FIELD: "RDNP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"RDLP", FIELD: "RDLP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"MTNP", FIELD: "MTNP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"MTLP", FIELD: "MTLP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"LNNP", FIELD: "LNNP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"LNLP", FIELD: "LNLP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"TCNP", FIELD: "TCNP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"TBNP", FIELD: "TBNP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"TCLP", FIELD: "TCLP", MAP_FUNCTION: mapPercentileScore}
        ,{TEST: "HSPT", CODE:"TBLP", FIELD: "TBLP", MAP_FUNCTION: mapPercentileScore}

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


                function dateConverter(dateString) {

                    if (!dateString || typeof dateString !== 'string' || dateString.trim() === '' || dateString === '--') {
                        return { finalDates: null, months: null, days: null, years: null };
                    }

                    var dateParts, dateObj, year, month, day;

                    // Time Strip
                    var timeIndex = dateString.indexOf(" ");
                    if (timeIndex !== -1) {
                        dateString = dateString.split(" ")[0];
                    }

                    var originalString = dateString;
                    dateString = dateString.replace(/-/g, '/');

                    // Handle YYYY/MM/DD or YYYY-MM-DD format
                    if (dateString.match(/^\d{4}\/\d{2}\/\d{2}$/)) { // YYYY/MM/DD
                        dateParts = dateString.split('/');
                        year = dateParts[0];
                        month = dateParts[1];
                        day = dateParts[2];
                    }
                    // Handle DD-MM-YYYY or DD/MM/YYYY
                    else if (originalString.match(/^\d{2}-\d{2}-\d{4}$/) || dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
                        dateParts = originalString.split(/[-\/]/);
                        day = dateParts[0];
                        month = dateParts[1];
                        year = dateParts[2];
                    }
                    // Handle MM/DD/YYYY
                    else if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
                        dateParts = dateString.split('/');
                        if (parseInt(dateParts[0], 10) > 12) { // DD/MM/YYYY
                            day = dateParts[0];
                            month = dateParts[1];
                            year = dateParts[2];
                        } else { // MM/DD/YYYY
                            month = dateParts[0];
                            day = dateParts[1];
                            year = dateParts[2];
                        }
                    }
                    // Handle MMddyyyy or YYYYMMDD
                    else if (dateString.match(/^\d{8}$/)) {
                        if (parseInt(dateString.substring(0, 4), 10) > 1900) { // YYYYMMDD
                            year = dateString.substring(0, 4);
                            month = dateString.substring(4, 6);
                            day = dateString.substring(6, 8);
                        } else { // MMddyyyy
                            month = dateString.substring(0, 2);
                            day = dateString.substring(2, 4);
                            year = dateString.substring(4, 8);
                        }
                    } else {
                        return { finalDates: null, months: null, days: null, years: null };
                    }

                    dateObj = new Date(`${year}/${month}/${day}`);
                    if (isNaN(dateObj.getTime())) {
                        return { finalDates: null, months: null, days: null, years: null };
                    }

                    month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
                    day = ('0' + dateObj.getDate()).slice(-2);
                    year = dateObj.getFullYear();

                    var finalDate = `${month}/${day}/${year}`;
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
//        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

        var birthDateObject = dateConverter(row.getField("STUDENT_BIRTHDATE"));

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
                    var defaultDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
                        var parsedDate = AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "M/dd/yy");
                        record.TEST_ADMIN_DATE = _util.coalesce(parsedDate ? parsedDate.STANDARD_DATE : null, defaultDate);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('STUDENT_FIRST_NAME'),null);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField('STUDENT_LAST_NAME'),null);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField('STUDENT_MIDDLE_NAME'),null);
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"),null)
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField('GRADE')],null);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"),row.getField("SCHOOL_NAME"),"DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"));
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
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore > 100 ) {
            return null;
        }
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if(scaleScore >=0 && scaleScore <=59){
           score["TEST_PRIMARY_RESULT"] = "Level 1" ;
           } else if(scaleScore >=60 && scaleScore <=69){
           score["TEST_PRIMARY_RESULT"] = "Level 2";
           }else if(scaleScore >=70 && scaleScore <=79){
           score["TEST_PRIMARY_RESULT"] = "Level 3";
           }else if(scaleScore >=80 && scaleScore <=89){
           score["TEST_PRIMARY_RESULT"] = "Level 4";
           }else if(scaleScore >=90 && scaleScore <=100){
           score["TEST_PRIMARY_RESULT"] = "Level 5";
          }

        return score;
    }

    function mapCombinedScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore == null || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_RAW_SCORE"] = scaleScore;
        }

        return score;
    }


    function mapPercentileScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

        var percentile = row.getField(testMetadata.FIELD + "_PERCENTILE");

    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = percentile;
        if(!isNaN(percentile)){
            score["TEST_SCORE_VALUE"] = percentile;
            score["TEST_RAW_SCORE"] = percentile;
        }

        return score;
    }

    function mapEquivalentScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var equivalent = row.getField(testMetadata.FIELD + "_EQUIVALENT");
    
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = equivalent;
    
        var equivalentValue = parseFloat(equivalent);
    
        if (!isNaN(equivalentValue)) {
            score["TEST_SCORE_VALUE"] = equivalentValue;
            score["TEST_RAW_SCORE"] = equivalentValue;
        }

    
        return score;
    }

    function mapQuotientScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

        var quotient = row.getField(testMetadata.FIELD + "_QUOTIENT");

    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = quotient;
        if(!isNaN(quotient)){
            score["TEST_SCORE_VALUE"] = quotient;
            score["TEST_RAW_SCORE"] = quotient;
        }

        if (quotient == null || isNaN(quotient)) {
          score["TEST_PRIMARY_RESULT"] = "Invalid score";
        } else if (quotient < 70) {
          score["TEST_PRIMARY_RESULT"] = "Level 1";
        } else if (quotient <= 89) {
          score["TEST_PRIMARY_RESULT"] = "Level 2";
        } else if (quotient <= 99) {
          score["TEST_PRIMARY_RESULT"] = "Level 3";
        } else if (quotient <= 109) {
          score["TEST_PRIMARY_RESULT"] = "Level 4";
        } else {
          score["TEST_PRIMARY_RESULT"] = "Level 5";
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
        var assessmentAdminKey = "${_assessmentIdentifier}_${AssessmentLoader.config.TENANT_CODE}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());