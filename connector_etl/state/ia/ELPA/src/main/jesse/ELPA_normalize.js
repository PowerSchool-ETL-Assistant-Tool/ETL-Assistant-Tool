var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ELPA";
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
			print("Loading using signature file ${signatureFormatName}\n");

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
        {TEST: "ELPA", CODE:"TOT", FIELD: "ELPA21_SUMMATIVE_OVERALL", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "ELPA", CODE:"COMP", FIELD: "ELPA21_SUMMATIVE_COMPREHENSION", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "ELPA", CODE:"LIST", FIELD: "LISTENING", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "ELPA", CODE:"READ", FIELD: "READING", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "ELPA", CODE:"SPEAK", FIELD: "SPEAKING", MAP_FUNCTION: mapScaleScore}
        ,{TEST: "ELPA", CODE:"WRIT", FIELD: "WRITING", MAP_FUNCTION: mapScaleScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "Grade 01": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "Grade 02": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "Grade 03": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "Grade 04": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "Grade 05": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "Grade 06": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "Grade 07": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "Grade 08": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "Grade 09": "09",
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
        "Kinderga": "KG",
        "K5": "K5"
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
        var birthDateObject = parseDate(row.getField("STUDENT_DOB"));
        var sigName = signature.getFormat().getFormatName();
        var period = parsePeriod(row.getField("TEST_SEASON"), hierarchy,sigName);
        var studentName = row.getField("STUDENT_NAME");
        var studentFirstName = '';
        var studentLastName = '';
        if (studentName !== null && studentName.indexOf(',') > -1) {
            studentFirstName = studentName.split(",",2)[1];
            studentLastName = studentName.split(",",2)[0];
        } else if (studentName !== null && studentName.indexOf(',') === -1) {
            studentFirstName = studentName;
        } else if (row.getField("STUDENT_FIRST_NAME")) {
            studentFirstName = row.getField("STUDENT_FIRST_NAME");
            studentLastName = row.getField("STUDENT_LAST_NAME");
        }


        var newGrade = parseGrade(sigName, row);

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
                    record.REPORTING_PERIOD = period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTestAdminDate(row, hierarchy.SCHOOL_YEAR);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_LOCAL_STUDENT_ID_NUMBER"),row.getField("STUDENT_ID"));
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
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('STUDENT_FIRST_NAME'), studentFirstName);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField('STUDENT_LAST_NAME'), studentLastName);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = newGrade;
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_CODE"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_CODE"));
                     break;

                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }

//This function takes grade based on the signature if the listed signature is being used, otherwise it picks from GRADE column
    function parseGrade(sigName, row) {
        let newGrade = '';
        if(sigName === "MCSD_KG") {
            newGrade = gradeDecode["K"];
        } else if(sigName === "MCSD_G1") {
            newGrade = gradeDecode["1"];
        } else if(sigName === "MCSD_G2") {
            newGrade = gradeDecode["2"];
        } else if(sigName === "MCSD_G3") {
            newGrade = gradeDecode["3"];
        } else if(sigName === "MCSD_G4") {
            newGrade = gradeDecode["4"];
        } else if(sigName === "MCSD_G5") {
            newGrade = gradeDecode["5"];
        } else if(sigName === "MCSD_G6") {
            newGrade = gradeDecode["6"];
        } else if(sigName === "MCSD_G7") {
            newGrade = gradeDecode["7"];
        } else if(sigName === "MCSD_G8"
                || sigName === "ELP_G8") {
            newGrade = gradeDecode["8"];
        } else if(sigName === "MCSD_G9") {
            newGrade = gradeDecode["9"];
        } else if(sigName === "MCSD_G10") {
            newGrade = gradeDecode["10"];
        } else if(sigName === "MCSD_G11") {
            newGrade = gradeDecode["11"];
        } else if(sigName === "MCSD_G12") {
            newGrade = gradeDecode["12"];
        } else if(sigName === "ELP_K5_1") {
            newGrade = gradeDecode["K5"];
        }
         else {
            newGrade = gradeDecode[row.getField('ENROLLED_GRADE')];
        }
        return newGrade;
    }

//This function takes the period from TEST_SEASON column of data file while removing any numeric characters
    function parsePeriod(season, hierarchy, sigName) {
        var period = '';
        if(season !== null && season !== undefined && season !== "" && season !== "N/A") {
            if(sigName === "ELPA_COL_28") {
                period = season.split(" ")[0];
            } else {
                var newPeriod = season.replace(/[0-9]/g,"");
                period = _util.trim(newPeriod);
            }
        }
        else {
            period = hierarchy.REPORTING_PERIOD;
        }
        return period;
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

        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        }
        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaleScore(row, testMetadata, signature) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALE_SCORE");
        var stdError = row.getField(testMetadata.FIELD + "_SCALE_SCORE_STANDARD_ERROR");
        var performance = _util.coalesce( row.getField(testMetadata.FIELD + "_PERFORMANCE"),
        row.getField(testMetadata.FIELD + "_DESCRIPTOR"));
        var percentage = row.getField(testMetadata.FIELD + "_PERCENT_SCORE");
        var proficiencyStatus = row.getField(testMetadata.FIELD + "_PROFICIENCY_STATUS");
        // Check for key fields and do not map score and exit if conditions met.
        var sigName = signature.getFormat().getFormatName();
        if(sigName === "ELPA_COL_28") {
            if( (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")  && (proficiencyStatus === null || proficiencyStatus === undefined || _util.trim(proficiencyStatus) === "--" || _util.trim(proficiencyStatus) === "")) {
                return null;
            }
            score["TEST_SECONDARY_RESULT"] = proficiencyStatus;
        } else {
            if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                return null;
            }
        }
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(stdError)){
    	    score["TEST_STANDARD_ERROR"] = stdError;
        }
        if(percentage){
    	    score["TEST_PERCENTAGE_SCORE"] = percentage.split('%')[0];
        }
        score["TEST_PRIMARY_RESULT"] = performance;

        return score;
    }

    function mapRawScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD + "RAW_SCORE");
        var percentile = row.getField("PERCENTILE");
        var nce = row.getField(testMetadata.FIELD + "NCE");

        // Check for key fields and do not map score and exit if conditions met.
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = rawScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
        }

    	score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_NCE_SCORE"] = nce;

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
    function parseDate(rawDate) {
        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if ((rawDate.length >= 8) && (rawDate.length <= 10) && (rawDate.indexOf("/") > -1))
        {
            var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        }
        else if (rawDate.length === 7) {
            rawDate = "0" + rawDate;
            var formatter = new java.text.SimpleDateFormat("MMddyyyy");
        }
        else if (rawDate.length === 8 && rawDate[4] === "2") // This condition works for 21st century
        {
            var formatter = new java.text.SimpleDateFormat("MMddyyyy");
        }
        else if (rawDate.length === 5)
        {
            rawDate = "0" + rawDate;
            var formatter = new java.text.SimpleDateFormat("MMddyy");
        }
        else if (rawDate.length === 6)
        {
            var formatter = new java.text.SimpleDateFormat("MMddyy");
        }
        else {
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

    function getTestAdminDate(row, year) {
          if((row.getField("DATE_TAKEN")!==undefined) && (row.getField("DATE_TAKEN") !== null)){
                if(row.getField("DATE_TAKEN").indexOf("/") >-1){
                return AppUtil.getDateObjByPattern(row.getField("DATE_TAKEN"), "MM/dd/yyyy").STANDARD_DATE;
                }else if(row.getField("DATE_TAKEN").indexOf("-") >-1){
                return AppUtil.getDateObjByPattern(row.getField("DATE_TAKEN"), "yyyy-MM-dd").STANDARD_DATE;
                }
          }
          else {
            return '05/15/' + year.substring(5, 9);
          }
        }

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
        return assessmentAdminKey;
    }

    return module;
}());