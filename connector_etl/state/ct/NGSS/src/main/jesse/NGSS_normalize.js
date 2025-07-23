var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NGSS";
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
        {TEST: "NGSS", CODE:"SCI", FIELD: "SUBJECT", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "NGSS", CODE:"EARSCI", FIELD: "PRACTICES_AND_CONCEPTS_IN_EARTH/SPACE_SCIENCES_PERFORMANCE", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "NGSS", CODE:"LIFSCI", FIELD: "PRACTICES_AND_CONCEPTS_IN_LIFE_SCIENCES_PERFORMANCE", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "NGSS", CODE:"PHYSCI", FIELD: "PRACTICES_AND_CONCEPTS_IN_PHYSICAL_SCIENCES_PERFORMANCE", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CTAS", CODE:"SCI", FIELD: "SUBJECT", MAP_FUNCTION: mapCTASScore}
        ,{TEST: "CTAS", CODE:"EARSCI", FIELD: "PT1_EARTH_SYSTEMS", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CTAS", CODE:"NATRE", FIELD: "PT2_NATURAL_RESOURCES", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CTAS", CODE:"LIVORG", FIELD: "PT3_LIVING_ORGANISMS", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CTAS", CODE:"HEALECO", FIELD: "PT4_HEALTHY_ECOSYSTEMS", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CTAS", CODE:"FORMOT", FIELD: "PT5_FORCES_AND_MOTION", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CTAS", CODE:"UEED", FIELD: "PT6_USING_ENERGY_EVERY_DAY", MAP_FUNCTION: mapCTASStrandScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
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
        "grade 5": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "grade 8": "08",
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
       ,"N/A": null
       ,"" : null
       ,null : null
    };


    var passDecode = {
       "Exceeded (Level 4)" : "Yes"
       ,"Level 4: Exceeded" : "Yes"
       ,"Level 4: Exceeds" : "Yes"
       ,"Level 4" : "Yes"
       ,"Met (Level 3)" : "Yes"
       ,"Level 3: Met" : "Yes"
       ,"Level 3" : "Yes"
       ,"Level 3: Meets" : "Yes"
       ,"Above Standard" : "Yes"
       ,"At Standard" : "Yes"
       ,"Approaching (Level 2)" : "No"
       ,"Level 2: Approaching" : "No"
       ,"Level 2" : "No"
       ,"Approaching Standard" : "No"
       ,"Not Met (Level 1)" : "No"
       ,"Level 1: Not Met" : "No"
       ,"Level 1: Does Not Meet" : "No"
       ,"Level 1" : "No"
       ,"Below Standard" : "No"
       ,"Nonparticipant" : "No"
       ,"Insufficient to score" : null
       ,"Invalidated" : null
       ,"n/a" : null
       ,"" : null
       ,null : null
      };

            var performanceLevelDecode = {
                 "Exceeded (Level 4)" : "4"
                ,"Level 4: Exceeds" : "4"
                ,"Level 4: Exceeded" : "4"
                ,"Level 4" : "4"
                ,"Meets (Level 3)" : "3"
                ,"Level 3: Meets" : "3"
                ,"Met (Level 3)" : "3"
                ,"Level 3: Met" :  "3"
                ,"Level 3" : "3"
                ,"Approaching (Level 2)" : "2"
                ,"Level 2: Approaching" : "2"
                ,"Level 2" : "2"
                ,"Does Not Meet (Level 1)" : "1"
                ,"Level 1: Does Not Meet" : "1"
                ,"Not Met (Level 1)" : "1"
                ,"Level 1: Not Met" :  "1"
                ,"Level 1" : "1"
                ,"Below Standard" : "1"
                ,"Approaching Standard" : "2"
                ,"Above Standard" : "4"

            };

            var perfLevelDecode = {
                 "Not Met" : "1"
                 ,"Met" : "2"
                 ,"Approaching" : "3"
                 ,"Exceeded" : "4"
                 ,"" : null
                 ,null : null
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
        //print("\n record: ${JSON.stringify(record)}\n");

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
        var birthDateStr = _util.coalesce(row.getField("DATE_OF_BIRTH"), "");

        if (birthDateStr && /^[0-9]{2}-[A-Za-z]{3}-[0-9]{2}$/.test(birthDateStr)) {
            // Convert to proper format manually
            var parts = birthDateStr.split("-");
            var day = parts[0];
            var monthStr = parts[1];
            var year = parts[2];

            // Expand year
            year = parseInt(year) < 30 ? "20" + year : "19" + year;

            // Map month abbreviation to number
            var monthMap = {
                Jan: "01", Feb: "02", Mar: "03", Apr: "04", May: "05", Jun: "06",
                Jul: "07", Aug: "08", Sep: "09", Oct: "10", Nov: "11", Dec: "12"
            };

            var month = monthMap[monthStr];
            if (!month) {
                throw new Error("Unrecognized month: " + monthStr);
            }

            birthDateStr = month + "/" + day + "/" + year;
            var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yyyy");
        }

        else if(birthDateStr!==null && birthDateStr.indexOf(",")>-1){
            var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMMM d, yyyy");
        }else if (birthDateStr.length === 7 || birthDateStr.length === 8) {
            if(birthDateStr.indexOf("/")>-1){
                var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "M/d/yyyy");
            }else{
                birthDateStr = (("00000000" + birthDateStr).slice(-8))
                var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMddyyyy");
            }

        }else if (birthDateStr.length === 9) {
            var birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/d/yyyy");
        }
        else {
            var birthDateObject = parseDate(birthDateStr, "M/d/yyyy");
        }
        var finalDate = null;
        if(row.getField("TEST_COMPLETION_DATE")!==null && row.getField("TEST_COMPLETION_DATE")!==undefined){
            finalDate = AppUtil.getDateObjByPattern(row.getField("TEST_COMPLETION_DATE"), "MM/dd/yyyy").STANDARD_DATE;
        }else if(row.getField("DATE_TAKEN")!==null && row.getField("DATE_TAKEN")!==undefined){
            finalDate = AppUtil.getDateObjByPattern(row.getField("DATE_TAKEN"), "MM/dd/yyyy").STANDARD_DATE;
        }else if (row.getField("SCHOOL_YEAR").length === 4){
            var Datestr1 = "05/15/"+row.getField("SCHOOL_YEAR");
            finalDate = AppUtil.getDateObjByPattern(Datestr1, "MM/dd/yyyy").STANDARD_DATE;
        }else if (row.getField("SCHOOL_YEAR").length === 9){
            var Datestr2 = "05/15/" + row.getField("SCHOOL_YEAR").substring(5);
            finalDate = AppUtil.getDateObjByPattern(Datestr2, "MM/dd/yyyy").STANDARD_DATE;
        }
        else{
            var Datestr3 = "05/15/20" + row.getField("SCHOOL_YEAR").substring(5, 7);
            finalDate = AppUtil.getDateObjByPattern(Datestr3, "MM/dd/yyyy").STANDARD_DATE;
        }
        var firstName,lastName = null;
        if(row.getField("FULL_NAME")!==undefined && row.getField("FULL_NAME")!==null){
            firstName  = row.getField("FULL_NAME").toString().split(",")[1];
            lastName  = row.getField("FULL_NAME").toString().split(",")[0];
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
            } else if(rawDate.length() === 10){
                format = 'MM/dd/yyyy';
            } else {
                format = 'M/d/yyyy';
            }
        } else if (rawDate.indexOf('-') > -1) {
            if (rawDate.split('-')[0].length === 4) {
                    format = 'yyyy-MM-dd';
            } else if(rawDate.length() === 10){
                format = 'MM-dd-yyyy';
            } else {
                format = 'M-d-yyyy';
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

    if(row.getField("SCHOOL_CODE")){
             var schoolName = row.getField("SCHOOL_CODE");
             if(schoolName.indexOf("-") > -1){
             var schoolId = schoolName.split("-").pop().replace(')', '');
             }else{
             var schoolId = schoolName.split("(").pop().replace(')', '');
             }
             var schName = schoolName.split("(")[0];
    }
    function adminPeriod(row){
        var period = null;
        var testType = row.getField("TEST_REASON");
            if(testType === null || testType === undefined || testType === ""){
                return null;
            }
            if (testType.indexOf("Spring") > -1){
                period = "SPRING"
            }else if(testType.indexOf("Fall") > -1){
                period = "FALL"
            }else if(testType.indexOf("Winter") > -1){
                period = "WINTER"
            }
            return period
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
                    record.REPORTING_PERIOD = _util.coalesce(adminPeriod(row),hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //no TEST_ADMIN_DATE in data file, function generates a date based on period
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = finalDate;
                    break;
                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("SASID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("SASID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("SASID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(firstName,row.getField('FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(lastName,row.getField('LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField('MIDDLE_NAME'),null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
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
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                //School Information
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"),schName);
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = schoolId;
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = schoolId;
                     break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"),schName);
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
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField("SCALE_SCORE");
        var standardError = row.getField("SCALE_SCORE_STANDARD_ERROR");
        var performance = row.getField("PERFORMANCE_LEVEL_DESCRIPTION");
        var perflevel = row.getField("PERFORMANCE_LEVEL");
        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "n/a") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_STANDARD_ERROR"] = standardError;
        }

    	score["TEST_PRIMARY_RESULT"] = performance;
        score["TEST_PRIMARY_RESULT_CODE"] =  performanceLevelDecode[performance];
        score["TEST_PASSED_INDICATOR"] = passDecode[performance];
        score["TEST_SECONDARY_RESULT"] = perflevel;
        score["TEST_SECONDARY_RESULT_CODE"] =  perfLevelDecode[perflevel];

        /*if(row.getField("PRACTICES_AND_CONCEPTS_IN_EARTH/SPACE_SCIENCES_PERFORMANCE")!==undefined && row.getField("PRACTICES_AND_CONCEPTS_IN_EARTH/SPACE_SCIENCES_PERFORMANCE")!==null){
            score["TEST_SECONDARY_RESULT"] = row.getField("PRACTICES_AND_CONCEPTS_IN_EARTH/SPACE_SCIENCES_PERFORMANCE");
            score["TEST_SECONDARY_RESULT_CODE"] = "EARTHSCI";

            score["TEST_TERTIARY_RESULT"] = row.getField("PRACTICES_AND_CONCEPTS_IN_LIFE_SCIENCES_PERFORMANCE");
            score["TEST_TERTIARY_RESULT_CODE"] = "LIFESCI";

            score["TEST_QUATERNARY_RESULT"] = row.getField("PRACTICES_AND_CONCEPTS_IN_PHYSICAL_SCIENCES_PERFORMANCE");
            score["TEST_QUATERNARY_RESULT_CODE"] = "PHYSCI";
        }*/

        return score;
    }

    function mapStrandScore(row, testMetadata){
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD);
        var performance = _util.coalesce(row.getField("PERFORMANCE_LEVEL_DESCRIPTION_" + testMetadata.CODE),row.getField(testMetadata.FIELD));
        var standardError = row.getField("SCALE_SCORE_STANDARD_ERROR_" + testMetadata.CODE);

        // Check for key fields and do not map score and exit if conditions met.
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "" || _util.trim(rawScore) === "n/a") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = rawScore;
    	if(!isNaN(rawScore)){
           score["TEST_SCORE_VALUE"] = rawScore;
           score["TEST_SCALED_SCORE"] = rawScore;
           score["TEST_STANDARD_ERROR"] = standardError;
        }

        score["TEST_PRIMARY_RESULT"] = _util.coalesce(performance,rawScore);
        score["TEST_PRIMARY_RESULT_CODE"] =  performanceLevelDecode[performance];
        score["TEST_PASSED_INDICATOR"] = passDecode[performance];
        return score;
    }


    function mapCTASScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField("CTAS_SCORE");
        var performance = row.getField("CTAS_PERFORMANCE");
        var points = row.getField("CTAS_POINTS_POSSIBLE");
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
            score["TEST_ITEMS_POSSIBLE"] = points;
        }

    	score["TEST_PRIMARY_RESULT"] = performance;
    	score["TEST_PRIMARY_RESULT_CODE"] =  performanceLevelDecode[performance];
        score["TEST_PASSED_INDICATOR"] = passDecode[performance];

        return score;
    }


    function mapCTASStrandScore(row, testMetadata){
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD+"_SCORE");
        var points = row.getField(testMetadata.FIELD+"_PP");
        var pointsEarned = row.getField(testMetadata.FIELD+"_PE");


        // Check for key fields and do not map score and exit if conditions met.
        if((rawScore === null || rawScore === undefined || _util.trim(rawScore) === "0" || _util.trim(rawScore) === "") && (points === null || points === undefined || _util.trim(points) === "0" || _util.trim(points) === "") && (pointsEarned === null || pointsEarned === undefined || _util.trim(pointsEarned) === "0" || _util.trim(pointsEarned) === "")) {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = rawScore;
        if(!isNaN(rawScore)){
            score["TEST_SCORE_VALUE"] = rawScore;
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_ITEMS_POSSIBLE"] = points;
        }
        score["TEST_ITEMS_ATTEMPTED"] = pointsEarned;

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
        var assessmentAdminKey = "${_assessmentIdentifier}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        var gradeStudent = gradeDecode[srcRecord.getField("GRADE")];
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        if (signature.format.formatName === "NGSS") {
            assessmentAdminKey = assessmentAdminKey + "_" + gradeStudent;
        }


        return assessmentAdminKey;
    }



    return module;
}());