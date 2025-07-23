var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "WIDA_SCREENER";
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
								AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
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
        { TEST: "SCR", CODE: "LIS", FIELD: "LISTENING", MAP_FUNCTION: mapScore },
        { TEST: "SCR", CODE: "SP", FIELD: "SPEAKING", MAP_FUNCTION: mapScore },
        { TEST: "SCR", CODE: "WR", FIELD: "WRITING", MAP_FUNCTION: mapScore },
        { TEST: "SCR", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapScore },
        { TEST: "SCR", CODE: "ORAL", FIELD: "ORAL", MAP_FUNCTION: mapScore },
        { TEST: "SCR", CODE: "LIT", FIELD: "LITERACY", MAP_FUNCTION: mapScore },
        { TEST: "SCR", CODE: "OVR", FIELD: "OVERALL", MAP_FUNCTION: mapScore }
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
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/
     function getGrade(row) {
        var gradeValue = row.getField('GRADE');

        if (gradeValue === undefined || gradeValue === null) {
            gradeValue = "";
        } else if (gradeValue === "0" || gradeValue === "00") {
            gradeValue = "KG";
        } else if (gradeValue === "K") {
            gradeValue = "KG";
        } else if (gradeValue !=="K" && gradeValue.length === 1) {
             gradeValue = "0" + gradeValue;
        }

        return gradeValue;
    }
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
        var record = mapSingleNormalizedRecord(signature, hierarchy, row);

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
    function mapSingleNormalizedRecord(signature, hierarchy, row) {
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
     //.aaaa
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var format = signature.getFormat().getFormatName()

        var birthDateObject = parseDate(row.getField('BIRTH_DATE') , signature);
        var testDateObject = parseDate(row.getField("DATE_OF_TESTING") , signature);

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
                    record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOLCODE"),
                        row.getField("SCHOOL_NUMBER"),
                        'DISTRICT' // As there is no school information in the data file
                    );
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOLCODE"),
                        row.getField("SCHOOL_NUMBER"),
                        'DISTRICT' // As there is no school information in the data file
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("SCHOOLNAME"),
                        row.getField("SCHOOL_NAME")
                    );
                    break;
                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STATESTUDENTID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATESTUDENTID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STATESTUDENTID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRSTNAME"), row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField("MIDDLEINITIAL"), row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LASTNAME"), row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0, 1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = getGrade(row);
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
    }

    function mapScore(row, testMetadata) {
        try{
        var score = {};
        var testNumber = getTestNumber(testMetadata.CODE,testMetadata.FIELD, row);
        var proficiencyLevel = row.getField(testMetadata.FIELD + "_PROFICIENCY_LEVEL");

        // Check for key fields and do not map score and exit if conditions met.
        if (proficiencyLevel === null || proficiencyLevel === undefined || _util.trim(proficiencyLevel) === "") {
            // Do not map record is no score is found.
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = proficiencyLevel;
        score["TEST_PRIMARY_RESULT"] = decodeProficiencyLevel(proficiencyLevel);
        return score;
        }catch(exception) {
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(row.getField("LINEAGE_FILE"), "HIGH", row.getField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
        }
    }

    function decodeProficiencyLevel(profLevel) {
        var primaryResult = "@UNK";
        if (profLevel === "" || profLevel == null) {
            primaryResult = null;
        } else {
            var firstNumber = profLevel.substring(0, 1);
            primaryResult = "@UNK";
            if (profLevel === "A1") {
                primaryResult = "Initiating";
            }
            else if (profLevel === "A2") {
                primaryResult = "Exploring";
            }
            else if (profLevel === "A3") {
                primaryResult = "Engaging";
            }
            else if (profLevel === "P1") {
                primaryResult = "Entering";
            }
            else if (profLevel === "P2") {
                primaryResult = "Emerging";
            }
            else if (profLevel === "P3") {
                primaryResult = "Developing";
            }
            else if (profLevel === "NA" || profLevel === " NA") {
                primaryResult = "Not Available";
            }
            else if (firstNumber === "1") {
                primaryResult = "Entering";
            } else if (firstNumber === "2") {
                primaryResult = "Emerging"; // primaryResult = "Beginning";
            } else if (firstNumber === "3") {
                primaryResult = "Developing";
            } else if (firstNumber === "4") {
                primaryResult = "Expanding";
            } else if (firstNumber === "5") {
                primaryResult = "Bridging";
            } else if (firstNumber === "6") {
                primaryResult = "Reaching";
            } else if (firstNumber === "N") {
                primaryResult = "N/A";
            }
        }
        return primaryResult;
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

    function getTestNumber(code, field, row) {
        // Format should be SCR_xx_CODE or SCR_KG_xxx for kindergarten
        var grade = getGrade(row);

        var testNumber = "SCR_" + grade + "_" + code;

        return testNumber;
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
//        signature.getFormat().getNaturalKey().forEach(function (key) {
//            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
//        });
        assessmentAdminKey = assessmentAdminKey + "_" + srcRecord.getField("STATESTUDENTID") + "_" + parseDate(srcRecord.getField("DATE_OF_TESTING") , signature).STANDARD_DATE;



        return assessmentAdminKey;
    }

     function parseDate(rawDate , signature ) {

            let dateObj = {
                RAW_DATE: rawDate
                , MONTH: null
                , DAY: null
                , YEAR: null
                , STANDARD_DATE: null
            }, formatter;

            // Exit if no value is provided.
            if (_util.trim(_util.coalesce(rawDate, "")) === "") {
                return dateObj;
            }

            
            // Extract only the date part if the date includes time and/or timezone (like "9/4/2024 2:24:29 PM CDT")
            if (rawDate.indexOf(' ') !== -1) {
                rawDate = rawDate.split(' ')[0]; // Take only the date part before the first space
            }

            if (rawDate.indexOf('/') !== -1) {
                formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
            } else if (rawDate.indexOf('-') !== -1) {
                formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
            }else if (rawDate.length > 6) {
                formatter = new java.text.SimpleDateFormat("MMddyyyy");
            } else {
                if (signature.getFormat().getFormatName() === "ACCESS_2122") {
                   formatter = new java.text.SimpleDateFormat("yyyyMM");
                }
                else {
                   formatter = new java.text.SimpleDateFormat("MMddyy");
                }
            }

            let javaDate = formatter.parse(rawDate);

            let calendar = java.util.Calendar.getInstance();
            calendar.setTime(javaDate);

            let year = calendar.get(java.util.Calendar.YEAR);
            let month = AppUtil.formatNumber(calendar.get(java.util.Calendar.MONTH) + 1);
            let day = AppUtil.formatNumber(calendar.get(java.util.Calendar.DAY_OF_MONTH));
            let standardDate = month + "/" + day + "/" + year;
            dateObj.MONTH = month;
            dateObj.DAY = day;
            dateObj.YEAR = year;
            dateObj.STANDARD_DATE = standardDate;

            return dateObj;
        }

    return module;
}());