var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AK_STAR";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
   /* module.createNormalizedFile = function(file, signature) {
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
    };*/

       module.createNormalizedFile = function(file, signature) {
            try {
                let normalizedFile = AppUtil.createResultsFile(file);
                const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
                const fileRows = createRecords(file, signature);
                let normalizedRows = [], normalizedRecords = [];

                fileRows.forEach(function(rows) {
                    try{
                        mapNormalizedRecords(signature, hierarchy, rows).forEach(function(normRecord) {
                            normalizedRows.push(normRecord)
                        });

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "mapNormalizedRecords error: ${exception}", JSON.stringify(rows)));
                    }
                });


                normalizedRows.forEach(function(row) {
                    try {
                        const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            normalizedRecords.push(row);
                        }


                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }

                });
                writeNormalizedRecords(normalizedFile, normalizedRecords);

                return normalizedFile;
            } catch(exception) {
                throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
            }
        };


        /** Java classes **/
            const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
            const BufferedReader = Java.type("java.io.BufferedReader");
            const InputStreamReader = Java.type('java.io.InputStreamReader');
            const CSVWriter = Java.type("com.opencsv.CSVWriter");
            const FileWriter = Java.type("java.io.FileWriter");
            const File = Java.type("java.io.File");

/***************************************************************************
     Utility Functions
     ***************************************************************************/

    function createRecords(file, signature) {
        try {
            const format = signature.getFormat();
            const fieldDelimiter = format.getFieldDelim();
            const textDelimiter = format.getQuoteDelim();
            const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
            const delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
            let lineNumber = 0;
            let recordsArray = [];
            const fieldNames = delimitedRecordParser.parseRow(reader);
            let row, record;

            while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                let index = 0;
                record = {};

                for (const key in fieldNames) {
                    record[fieldNames[index]] = row.get(index++);
                }
                record.LINEAGE_FILE = file.getFullName();
                record.LINEAGE_LINE = (++lineNumber).toString();
                const rowArray = [];
                rowArray.push(record);
                recordsArray.push((rowArray));
            }

            return recordsArray;
        } catch (exception) {
            throw "${_thisModuleName}.createRecords Exception: ${exception}";
        }
    }

    /**
     * Creates a Processed file containing the audit types of error for the file processed
     *
     * @param file A fully qualified string path to the normalFile
     * @param data The audit statistics of the file that was processed
     */
    function writeNormalizedRecords(file, data) {
        try {
            const normalFile = _file.open(file);
            const normalFilePath = normalFile.getParent();
            const normalFileName = normalFile.getName()
            const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
            let rowArray = null;
            const header = Object.keys(data[0]);

            writer.writeNext(header);

            data.forEach(function(row) {
                rowArray = [];

                for (let key in row) {
                     rowArray.push(row[key]);
                }
                writer.writeNext(rowArray);
            })

            writer.close();
        } catch (exception) {
            throw "${_thisModuleName}.writeNormalizedRecords Exception: ${exception}";
        }
    }



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
        {TEST: "AK_STAR", CODE:"_ELA", FIELD: "ELA_", MAP_FUNCTION: mapScaledScore},
        {TEST: "AK_STAR", CODE:"_MATH", FIELD: "MATH_", MAP_FUNCTION: mapScaledScore},
        {TEST: "AK_STAR", CODE:"_RD", FIELD: "READING_", MAP_FUNCTION: mapScaledScore},
        {TEST: "AK_STAR", CODE:"_LNG_USG", FIELD: "LANGUAGE_USAGE_", MAP_FUNCTION: mapScaledScore},
        {TEST: "AK_STAR", CODE:"_MATH_OVR_INS_AR", FIELD: "MATH_OVERALL_INSTRUCTIONAL_AREA_", MAP_FUNCTION: mapScaledScore},
        {TEST: "AK_STAR", CODE:"_ELA_RD", FIELD: "READING", MAP_FUNCTION: mapStrandScaledScore},
        {TEST: "AK_STAR", CODE:"_ELA_WR_LAN", FIELD: "WRITING_AND_LANGUAGE", MAP_FUNCTION: mapStrandScaledScore},
        {TEST: "AK_STAR", CODE:"_MATH_CON", FIELD: "CONTENT", MAP_FUNCTION: mapStrandScaledScore},
        {TEST: "AK_STAR", CODE:"_MATH_ARG_MOD", FIELD: "ARGUMENTATION_AND_MODELING", MAP_FUNCTION: mapStrandScaledScore},
        {TEST: "AK_STAR", CODE:"_RD_RIT", FIELD: "READING", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_LNG_USG_RIT", FIELD: "LANGUAGE_USAGE", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_MA_RIT", FIELD: "MATH", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_ELA_RD_INS_1", FIELD: "READING_INSTRUCTIONAL_AREA_1", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_ELA_RD_INS_2", FIELD: "READING_INSTRUCTIONAL_AREA_2", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_ELA_RD_INS_3", FIELD: "READING_INSTRUCTIONAL_AREA_3", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_ELA_LNG_INS_1", FIELD: "LANGUAGE_USAGE_INSTRUCTIONAL_AREA_1", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_ELA_LNG_INS_2", FIELD: "LANGUAGE_USAGE_INSTRUCTIONAL_AREA_2", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_ELA_LNG_INS_3", FIELD: "LANGUAGE_USAGE_INSTRUCTIONAL_AREA_3", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_MATH_INS_1", FIELD: "MATH_INSTRUCTIONAL_AREA_1", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_MATH_INS_2", FIELD: "MATH_INSTRUCTIONAL_AREA_2", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_MATH_INS_3", FIELD: "MATH_INSTRUCTIONAL_AREA_3", MAP_FUNCTION: mapInstructionalScore},
        {TEST: "AK_STAR", CODE:"_MATH_INS_4", FIELD: "MATH_INSTRUCTIONAL_AREA_4", MAP_FUNCTION: mapInstructionalScore},

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
        "Proficient" : {CODE: "P", DESC: "Proficient", PASS_IND: "Yes"}
        ,"Approaching Proficient" : {CODE: "AP", DESC: "Approaching Proficient", PASS_IND: "No"}
        ,"Needs Support" : {CODE: "NS", DESC: "Needs Support", PASS_IND: "No"}
        ,"Advanced" : {CODE: "A", DESC: "Advanced", PASS_IND: "Yes"}
        ,"" : {CODE: null, DESC: null, PASS_IND: null}
        ,null : {CODE: null, DESC: null, PASS_IND: null}
      };

    var starDecode = {
        1 : "*"
       ,2 : "**"
       ,3 : "***"
       ,"" : null
       ,null: null
      };


    var decodeAttemptFlag = {
        "Y" : "1"
        ,"N" : "0"
        ,"" : null
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
        var birthDate = row.getField("STUDENT_DATE_OF_BIRTH");
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }
       // var birthDateObject = AppUtil.getMonthFollowedByDay(row.getField("STUDENT_DATE_OF_BIRTH"));

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
                    record.TEST_ADMIN_DATE = "03/28/"+hierarchy.SCHOOL_YEAR.substring(5,9);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
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
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = (row.getField("STUDENT_GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('STUDENT_GRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"),row.getField("SCHOOL_NAME_ENROLLED_LOCATION"),"DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE_ENROLLED_LOCATION"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME_ENROLLED_LOCATION"), row.getField("SCHOOL_NAME"));
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
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
        var sem = row.getField(testMetadata.FIELD + "STANDARD_ERROR_MEASUREMENT");
		var achievLevel = row.getField(testMetadata.FIELD + "ACHIEVEMENT_LEVEL");
		var totalItems = row.getField(testMetadata.FIELD + "TOTAL_ITEMS");
	    var itemsAttempted = row.getField(testMetadata.FIELD + "ITEMS_ATTEMPTED_COUNT");
        var attemptFlag = row.getField(testMetadata.FIELD + "VALID_ATTEMPT_FLAG");

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
          (itemsAttempted === null || itemsAttempted === undefined || _util.trim(itemsAttempted) === "--" || _util.trim(itemsAttempted) === ""))
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PASSED_INDICATOR"] = primaryDecode[achievLevel].PASS_IND;
    	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achievLevel].CODE;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel].DESC;
       	score["TEST_STANDARD_ERROR"] = sem;
        score["TEST_ITEMS_POSSIBLE"] = totalItems;
        score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;

        score["TEST_QUATERNARY_RESULT"] = attemptFlag;
        score["TEST_QUATERNARY_RESULT_CODE"] = decodeAttemptFlag[attemptFlag];
        return score;
    }

    function mapStrandScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCORE");

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

        score["TEST_PRIMARY_RESULT"] = starDecode[scaleScore];
        score["TEST_PRIMARY_RESULT_CODE"] = scaleScore;
        return score;
    }

    function mapInstructionalScore(row, testMetadata) {
        var score = {};
        var testNumber = getTestNumber(row, testMetadata);
        var scaleScore = row.getField(testMetadata.FIELD + "_RIT_SCALE_SCORE");
        var rawScore = row.getField(testMetadata.FIELD + "_RIT_SCORE");

        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
         (rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === ""))
        {
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
        return score;

    }

    function getTestNumber(row, testMetadata){

            var testName = row.getField(testMetadata.FIELD + "_NAME");
            var sub = null;
            var testNumber = null;

            if(testName){
            if (testName.indexOf("Literary Text") > -1) {
                sub = "LIT_TXT";
            }
            else if (testName.indexOf("Informational Text") > -1) {
                sub = "INFO_TXT";
            }
            else if (testName.indexOf("Vocabulary") > -1) {
                sub = "VOC";
            }
            else if (testName.indexOf("Language: Understand, Edit for Grammar, Usage") > -1) {
                sub = "LN_UST_ED_GR_USG";
            }
            else if (testName.indexOf("Language: Understand, Edit Mechanics") > -1) {
                sub = "LN_UST_ED_MECH";
            }
            else if (testName.indexOf("Writing: Plan, Organize, Develop, Revise, Research") > -1) {
                sub = "WR_PL_ORG_DEV_REV_RSRCH";
            }
            else if (testName.indexOf("Operations and Algebraic Thinking") > -1) {
                sub = "OPR_ALG_THNK";
            }
            else if (testName.indexOf("Number and Operations") > -1) {
                sub = "NUM_OPR";
            }
            else if (testName.indexOf("The Real and Complex Number Systems") > -1) {
                sub = "RL_CMPLX_NUM_SYS";
            }
            else if (testName.indexOf("Geometry") > -1) {
                sub = "GEO";
            }
            else if (testName.indexOf("Measurement and Data") > -1) {
                sub = "MSRMNT_DATA";
            }
            else if (testName.indexOf("Statistics and Probability") > -1) {
                sub = "STAT_PROB";
            }
            testNumber = testMetadata.TEST + testMetadata.CODE + "_" + sub;
            }
            else {
            testNumber = testMetadata.TEST + testMetadata.CODE;
            }


            return testNumber;
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
        var schoolinf = _util.coalesce(srcRecord.getField("SCHOOL_NAME"),srcRecord.getField("SCHOOL_NAME_ENROLLED_LOCATION"),"DISTRICT")
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        assessmentAdminKey = assessmentAdminKey + "_" + schoolinf

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());