var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IMSSA";
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
    
    var scoresToMap = [
        {TEST: "IMSSA", CODE:"ELA_LU_OVR", FIELD: "LANGUAGE_USAGE_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IMSSA", CODE:"MATH_OVR", FIELD: "MATHEMATICS_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "IMSSA", CODE:"RD_OVR", FIELD: "READING_", MAP_FUNCTION: mapScaledScore},


        //Map Achievement Sub Scores
        //Reading
        { TEST: "IMSSA_", CODE: "READ_LIT", FIELD: "LITERARY_TEXT", MAP_FUNCTION: mapSubCategoryScore},
        { TEST: "IMSSA_", CODE: "READ_INFO", FIELD: "INFORMATIONAL_TEXT", MAP_FUNCTION: mapSubCategoryScore},
        { TEST: "IMSSA_", CODE: "READ_COMP", FIELD: "COMPREHENSION", MAP_FUNCTION: mapSubCategoryScore},
        { TEST: "IMSSA_", CODE: "READ_AAI", FIELD: "ANALYSIS_AND_INTERPRETATION", MAP_FUNCTION: mapSubCategoryScore},

        //Language
        { TEST: "IMSSA_", CODE: "LANG_NWA", FIELD: "NARRATIVE_WRITING_ANALYSIS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "LANG_EWA", FIELD: "EXPOSITORY_WRITING_ANALYSIS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "LANG_ELC", FIELD: "ENGLISH_LANGUAGE_CONVENTIONS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "LANG_AWA", FIELD: "ARGUMENT_WRITING_ANALYSIS", MAP_FUNCTION: mapSubCategoryScore },


        //Math
        { TEST: "IMSSA_", CODE: "MATH_OAAT", FIELD: "OPERATIONS_AND_ALGEBRIC_THINKING", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_NAOB10",FIELD: "NUMBER_OPERATIONS_IN_BASE10", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_NAOF", FIELD: "NUMBER_OPERATIONS_FRACTIONS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_MAD", FIELD: "MEASUREMENT_DATA", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_GEOM", FIELD: "GEOMETRY", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_PS", FIELD: "PROBLEM_SOLVING", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_RAA", FIELD: "REASONING_AND_ARGUMENT", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_MA", FIELD: "MODELING", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_SARR", FIELD: "STRUCTURE_AND_REPEATED_REASONING", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_RAPR", FIELD: "RATIOS_PROPORTIONAL_RELATIONSHIPS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_NS",FIELD: "NUMBER_SYSTEM", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_EAE", FIELD: "EXPRESSIONS_EQUATIONS", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_SAP", FIELD: "STATISTICS_PROBABILITY", MAP_FUNCTION: mapSubCategoryScore },
        { TEST: "IMSSA_", CODE: "MATH_FA", FIELD: "FUNCTIONS", MAP_FUNCTION: mapSubCategoryScore }

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
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
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
        "Needs Support" :"NS"
       ,"On Target" : "OT"
       ,"Near Target" : "NT"
       ,"" : null
       ,null : null
      };

    var passDecode = {
       "Needs Support" : "No"
       ,"On Target" : "Yes"
       ,"Near Target" : "Yes"
       ,"" : null
       ,null : null
      };

    var decodePassInd = {
        //iMSSA
        "Near Target": "No",
        "Needs Support": "No",
        "On Target": "Yes",
        "Medical Exemption": "No",
        "Incomplete": "No",
        "Other": "No",
        "Withdrew Before Test Completion": "No",
        "Absent": "No",
        //NMSSA and NMASR
        "Advanced": "Yes",
        "Nearing Proficiency": "No",
        "Novice": "No",
        "Proficient": "Yes",
        "Above": "Yes",
        "At/Near": "No",
        "Below": "No",
        "Did Not Meet Minimum Attempt": "No",
        "Void Test": "No",
        "": "No"
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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject  = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };
        if(row.getField("STUDENT_BIRTHDATE")!==undefined) {
            birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        }
        var reportingPeriod = getTEST_ADMIN_PERIOD(row, hierarchy);
        var testAdminDate = getTEST_ADMIN_DATE(row, hierarchy);
        
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
                    record.REPORTING_PERIOD = reportingPeriod;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testAdminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
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
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField('GRADE'),row.getField('STUDENT_GRADE'))];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_CODE"),row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"),row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"),row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_NAME":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
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
        var admin = {};
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata) {
        var score = {};

        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE; //LANGUAGE_USAGE_SCALE_SCORE //MATHEMATICS_SCALE_SCORE //READING_SCALE_SCORE
        var scaleScore = row.getField(testMetadata.FIELD + "SCALE_SCORE");
		var achieveLevel = row.getField(testMetadata.FIELD + "ACHIEVEMENT_LEVEL");//READING_ACHIEVEMENT_LEVEL //LANGUAGE_USAGE_ACHIEVEMENT_LEVEL //MATHEMATICS_ACHIEVEMENT_LEVEL
        var readingLevel =  row.getField(testMetadata.FIELD + "SCORE");
        var projLevel =  row.getField(testMetadata.FIELD + "PROJECTION_LEVEL");
        var dateValue =  row.getField("DAY_" + testMetadata.FIELD + "COMPLETED");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined ||  _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PASSED_INDICATOR"] = passDecode[achieveLevel];
    	score["TEST_PRIMARY_RESULT"] = achieveLevel;
    	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achieveLevel];
    	score["TEST_SECONDARY_RESULT"] = projLevel;
    	score["TEST_SCORE_ATTRIBUTES"] = dateValue;
        if(readingLevel !== null && readingLevel !== "" && readingLevel !== undefined){
            score["TEST_READING_LEVEL"] = readingLevel.replace("L","").replace("Q", "");
        }
        
        return score;
    }

    function mapSubCategoryScore(row, testMetadata) {
        var score = {};
        var grade = "";
        var testNumber;
        var achievementLevel = _util.coalesce(row.getField(testMetadata.FIELD + '_ACHIEVEMENT_LEVEL'));
        if (achievementLevel === null || achievementLevel === undefined || achievementLevel === ""){
            return null;
        }
        var grade = gradeDecode[_util.coalesce(row.getField('GRADE'),row.getField('STUDENT_GRADE'))];
        testNumber = testMetadata.TEST +  testMetadata.CODE + '_' + grade;

        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT"] = achievementLevel;
        score["TEST_PASSED_INDICATOR"] = decodePassInd[achievementLevel];

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
        var period = getTEST_ADMIN_PERIOD(srcRecord, hierarchy);
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        assessmentAdminKey = assessmentAdminKey + "_" + period;

        return assessmentAdminKey;
    }

    function getTEST_ADMIN_PERIOD(row, hierarchy){
        var period = null;
        var window = row.getField("ASSESSMENT_WINDOW");
        if(window!= null){
            window = window.toString().toUpperCase();
            if(window.indexOf("BOY") > -1){
                period = "BOY";
            } else if(window.indexOf("MOY") > -1){
                period = "MOY";
            } else if(window.indexOf("EOY") > -1){
                period = "EOY";
            }
        } else {
            period = "ALL";
        }
        if(period === "ALL" && row.getField("DAY_READING_COMPLETED")!==undefined){
            var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
            if(fileName.indexOf("BOY")>-1||fileName.indexOf("BEGINNING")>-1) {
                period = "BOY";
            }
            else if(fileName.indexOf("MOY")>-1||fileName.indexOf("MIDDLE")>-1) {
                period = "BOY";
            }
            else if(fileName.indexOf("EOY")>-1||fileName.indexOf("END")>-1) {
                period = "EOY";
            }
        }
        return period;
    }

    function getTEST_ADMIN_DATE(row, hierarchy){
        var date = null;
        var period = getTEST_ADMIN_PERIOD(row, hierarchy);
        if(period!= null){
            if(period === "BOY"){
                date = "09/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
            } else if (period == "MOY"){
                date = "01/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
            } else if (period === "EOY"){
                date = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
            } else if (period === "ALL"){
                date = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}"
            }
        }
        if(row.getField("DAY_READING_COMPLETED")!==undefined){
            //File has specific dates, take the latest
            var readingDate = row.getField("DAY_READING_COMPLETED");
            var languageDate = row.getField("DAY_LANGUAGE_USAGE_COMPLETED");
            var mathDate = row.getField("DAY_MATHEMATICS_COMPLETED");
            var dates = [];

            //Some students only have certain dates, only those should be included or it causes an undefined date object.
            if(row.getField("DAY_READING_COMPLETED")!==null && row.getField("DAY_READING_COMPLETED") !== ""){
                dates.push(new Date(row.getField("DAY_READING_COMPLETED")+"Z"));
            }
            if(row.getField("DAY_LANGUAGE_USAGE_COMPLETED")!==null && row.getField("DAY_LANGUAGE_USAGE_COMPLETED") !== ""){
                dates.push(new Date(row.getField("DAY_LANGUAGE_USAGE_COMPLETED")+"Z"));
            }
            if(row.getField("DAY_MATHEMATICS_COMPLETED")!==null && row.getField("DAY_MATHEMATICS_COMPLETED") !== ""){
                dates.push(new Date(row.getField("DAY_MATHEMATICS_COMPLETED")+"Z"));
            }
            var maximumDate=new Date(Math.max.apply(null, dates));

            var isoD = maximumDate.toISOString();
            var format = (isoD.substring(0,10));
            //print(format);
            var testDateObject = {
                RAW_DATE : null
                , MONTH : null
                , DAY : null
                , YEAR : null
                , STANDARD_DATE : null
            };
            
            testDateObject = parseDate(format);
            date = testDateObject.STANDARD_DATE;
        }
        return date;
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

        var format;

        if (rawDate.indexOf('/') > -1) {
            if (rawDate.split('/')[0].length === 4) {
                format = 'yyyy/MM/dd';
            } else {
                format = 'MM/dd/yyyy';
            }
        } else if (rawDate.indexOf('-') > -1) {
            if (rawDate.split('-')[0].length === 4) {
                format = 'yyyy-MM-dd';
            } else {
                format = 'MM-dd-yyyy';
            }
        }

        var formatter = new java.text.SimpleDateFormat(format);
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
    return module;
}());