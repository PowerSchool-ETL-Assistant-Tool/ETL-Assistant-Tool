var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ALEKS";
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
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, exception, JSON.stringify(one) + '|' + JSON.stringify(two)));
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try{
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
                            //Report error for each row
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK: ${exception}", JSON.stringify(rows)));
                    }

                })
                .transform("TRANSFORM", ["RECORDS"],
                    function(output, rows) {
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });
                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\"))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG);

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

    var scoresToMap =
        [
        {TEST: "ALEKS", CODE:"INK", NUMBER:"INK",FIELD: "INITIAL", MAP_FUNCTION: mapInitialScore}
        ,{TEST: "ALEKS", CODE:"LNK", NUMBER:"LNK",FIELD: "LATEST", MAP_FUNCTION: mapLatestScore}
        ,{TEST: "ALEKS", CODE:"PIE", NUMBER:"SRT",FIELD: "INITIAL", MAP_FUNCTION: mapPieScore}
        ,{TEST: "ALEKS", CODE:"PIE", NUMBER:"END",FIELD: "LATEST", MAP_FUNCTION: mapPieScore}
        ,{TEST: "ALEKS", CODE:"INK", NUMBER:"STD",FIELD: "INITIAL", MAP_FUNCTION: mapStandardsScore}
        ,{TEST: "ALEKS", CODE:"LNK", NUMBER:"STD",FIELD: "LATEST", MAP_FUNCTION: mapStandardsScore}
        ];
    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
	var decodeGradeLevel = {
        "-" : null
		,"Middle School" : null
		,"High School" : null
        , "1st Grade" : "01"
        , "2nd Grade" : "02"
        , "3rd Grade" : "03"
        , "4th Grade" : "04"
        , "5th Grade" : "05"
        , "6th Grade" : "06"
        , "7th Grade" : "07"
        , "8th Grade" : "08"
        , "9th Grade" : "09"
        , "10th Grade" : "10"
        , "11th Grade" : "11"
        , "12th Grade" : "12"
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
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param array Array containing JSON objects representing raw data by physical name.
     * @returns {array} Mapped normalized records.
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];

        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        var record = mapNormalizedRecord(signature, hierarchy, row);

        AppUtil.nullSafePush(normalizedRecords, record);

        return normalizedRecords;

    }


    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} Mapped normalized record.
     */
    function mapNormalizedRecord(signature, hierarchy, row) {
        var record = {};
        var mappingObject = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
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
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var testDateObject =parseDate(row);

		var firstName = _util.trim(row.getField("STUDENT_FULL_NAME").split(",")[1]);
		var lastName = _util.trim(row.getField("STUDENT_FULL_NAME").split(",")[0]);

        //Loop through normalized fields and map if possible.
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID =  "DISTRICT";
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE,"05/15/"+ hierarchy.SCHOOL_YEAR.substring(5,9));
//                   "05/15/"+ hierarchy.SCHOOL_YEAR.substring(5,9)
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = null;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = null;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = null;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesceEmptyString(row.getField("STUDENT_LOCAL_ID")).split("@")[0];
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesceEmptyString(row.getField("STUDENT_USERNAME"));
					break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(firstName);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(null);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(lastName);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(decodeGradeLevel[row.getField("CLASS_GRADE")], decodeGradeLevel[row.getField("STUDENT_GRADE_CODE")]);
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
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {
        var admin = {};
        admin.TEST_INTERVENTION_DESC = row.getField("CLASS_NAME");
        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

	     function mapInitialScore(row, testMetadata) {
			var score = {};
            var subject = row.getField("COURSE_PRODUCT");
            if(subject !== null && subject !== undefined && subject !== "" && subject !== "-") {
               var testNumber = generateTestNumber(row, testMetadata);
            }else {
               var testNumber = testMetadata.TEST + '_' + testMetadata.FIELD;
            }

			var mastery = row.getField("INITIAL_MASTERED");
			var latestMastery = row.getField("LATEST_MASTERED");
			var masteryItems = row.getField("INITIAL_NUMBER_MASTERED");
			var totalItems = row.getField("INITIAL_TOTAL_NUMBER");
			var timeTaken = row.getField("INITIAL_TIME");
			var reason = row.getField("INITIAL_REASON");
			var testType = row.getField("TYPE_OF_DATA");

			// Check for key fields and do not map score and exit if conditions met.
			// Set score fields
			if(testType !== "Student"){
			    return null;
			}
			if(mastery !== null && mastery !== undefined && _util.trim(mastery) !== "--" && _util.trim(mastery) !== "-" && _util.trim(mastery) !== ""
				&& latestMastery !== null && latestMastery !== undefined && _util.trim(latestMastery) !== "--" && _util.trim(latestMastery) !== "-" && _util.trim(latestMastery) !== "") {
				masteryRaw = mastery.replace("%","");
				if((row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== null && (row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== undefined && (row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== "-"){
				    if((row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")).toString().indexOf("Related")>-1){
					    testNumber = testNumber + "_RTI";
				    }
				}

				score["TEST_NUMBER"] = testNumber;

				score["TEST_SCORE_TEXT"] = mastery;

				if(!isNaN(masteryRaw)){
				score["TEST_SCORE_VALUE"] = masteryRaw;
				score["TEST_SCALED_SCORE"] = masteryRaw;
				score["TEST_PERCENTAGE_SCORE"] =  masteryRaw;
                }
                if(!isNaN(masteryItems)){
				score["TEST_ITEMS_ATTEMPTED"] = masteryItems;
				}
				score["TEST_ITEMS_POSSIBLE"] =  totalItems;

				score["TEST_SCORE_ATTRIBUTES"] = reason;
				return score;
			}
			return null;
		 }


	     function mapLatestScore(row, testMetadata) {
			var score = {};
            var subject = row.getField("COURSE_PRODUCT");
            if(subject !== null && subject !== undefined && subject !== "" && subject !== "-") {
            var testNumber = generateTestNumber(row, testMetadata);
            }else{
            var testNumber = testMetadata.TEST + '_' + testMetadata.FIELD;
            }

			var mastery = row.getField("LATEST_MASTERED");
			var masteryItems = row.getField("LATEST_NUMBER_MASTERED");
			var totalItems = row.getField("LATEST_TOTAL_NUMBER");
			var timeTaken = row.getField("LATEST_TIME");
			var reason = row.getField("LATEST_REASON");
			var weekTime = convertMinutes(row.getField("TIME_WEEK_TIME"));
			var totalTime = convertMinutes(row.getField("TIME_TOTAL_TIME"));
			var testType = row.getField("TYPE_OF_DATA");

             if(testType !== "Student"){
         			return null;
             }
			// Check for key fields and do not map score and exit if conditions met.
			// Set score fields
			if(mastery !== null && mastery !== undefined && _util.trim(mastery) !== "--" && _util.trim(mastery) !== "-" && _util.trim(mastery) !== "") {
				masteryRaw = mastery.replace("%","");
				if((row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== null && (row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== undefined && (row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== "-"){
				    if((row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")).toString().indexOf("Related")>-1){
					      testNumber = testNumber + "_RTI";
					}
				}
				score["TEST_NUMBER"] = testNumber;

				score["TEST_SCORE_TEXT"] = mastery;

				if(!isNaN(masteryRaw)){
				score["TEST_SCORE_VALUE"] = masteryRaw;
				score["TEST_SCALED_SCORE"] = masteryRaw;
				score["TEST_PERCENTAGE_SCORE"] =  masteryRaw;
                }
                if(!isNaN(masteryItems)){
				score["TEST_ITEMS_ATTEMPTED"] = masteryItems;
				}
                score["TEST_ITEMS_POSSIBLE"] =  totalItems;

				score["TEST_SCORE_ATTRIBUTES"] = reason;

				score["TEST_PRIMARY_RESULT"] = weekTime;
				if(!isNaN(totalTime)){
				score["TEST_SECONDARY_RESULT"] = totalTime;
				}

				return score;
			}
			return null;
		 }

	     function mapPieScore(row, testMetadata) {
			var score = {};

		    var subject = row.getField("COURSE_PRODUCT");
            if(subject !== null && subject !== undefined && subject !== "" && subject !== "-")  {
            var testNumber = generateTestNumber(row, testMetadata)+"_" + testMetadata.NUMBER;
            }else{
            var testNumber = testMetadata.TEST + '_' + testMetadata.FIELD + "_" + testMetadata.NUMBER;
            }

			var percent = row.getField(testMetadata.FIELD+"_PIE_PROGRESS_PERCENT");
			var latestMastery = row.getField("LATEST_MASTERED");
			var progressItems = row.getField(testMetadata.FIELD+"_PIE_PROGRESS_NUMBER_OF_TOPICS");
			var totalItems = row.getField(testMetadata.FIELD+"_PIE_PROGRESS_TOTAL_NUMBER");
            var testType = row.getField("TYPE_OF_DATA");

            if(testType !== "Student"){
                return null;
            }
			// Check for key fields and do not map score and exit if conditions met.
			// Set score fields
			if(percent !== null && percent !== undefined && _util.trim(percent) !== "--" && _util.trim(percent) !== "-" && _util.trim(percent) !== ""
				&& latestMastery !== null && latestMastery !== undefined && _util.trim(latestMastery) !== "--" && _util.trim(latestMastery) !== "-" && _util.trim(latestMastery) !== "") {
				percentRaw = percent.replace("%","");
				if((row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== null && (row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== undefined && (row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")) !== "-"){
				   if((row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")).toString().indexOf("Related")>-1){
					     testNumber = testNumber + "_RTI";
				   }
				}

				score["TEST_NUMBER"] = testNumber;
				score["TEST_SCORE_TEXT"] = percent;

				if(!isNaN(percentRaw)){
				score["TEST_SCORE_VALUE"] = percentRaw;
				score["TEST_SCALED_SCORE"] = percentRaw;
				score["TEST_PERCENTAGE_SCORE"] =  percentRaw;
                }
                if(!isNaN(progressItems)){
				score["TEST_ITEMS_ATTEMPTED"] = progressItems;
				}
				if(!isNaN(totalItems)){
				score["TEST_ITEMS_POSSIBLE"] =  totalItems;
				}
				return score;
			}
			return null;
		 }

	     function mapStandardsScore(row, testMetadata) {
			var score = {};

            var subject = row.getField("COURSE_PRODUCT");
            if(subject !== null && subject !== undefined && subject !== "" && subject !== "-") {
            var testNumber = generateTestNumber(row, testMetadata)+"_" + testMetadata.NUMBER;
            }else{
             var testNumber = testMetadata.TEST + '_' + testMetadata.FIELD + "_" + testMetadata.NUMBER;
            }

			var percent = row.getField(testMetadata.FIELD+"_STANDARDS_PROGRESS_PERCENT");
			var latestMastery = row.getField("LATEST_MASTERED");
			var progressItems = row.getField(testMetadata.FIELD+"_STANDARDS_PROGRESS");
			var totalItems = row.getField(testMetadata.FIELD+"_STANDARDS_TOTAL_NUMBER");

			var title = row.getField(testMetadata.FIELD+"_STANDARDS_TITLE");

			// Check for key fields and do not map score and exit if conditions met.
			// Set score fields
			if(percent !== null && percent !== undefined && _util.trim(percent) !== "--" && _util.trim(percent) !== "-" && _util.trim(percent) !== ""
				&& latestMastery !== null && latestMastery !== undefined && _util.trim(latestMastery) !== "--" && _util.trim(latestMastery) !== "-" && _util.trim(latestMastery) !== "") {
				percentRaw = percent.replace("%","");
				if((row.getField(testMetadata.FIELD+"_STANDARDS_TITLE")).toString().indexOf("Related")>-1){
					testNumber = testNumber + "_RTI";
				}
				score["TEST_NUMBER"] = testNumber;
				score["TEST_SCORE_TEXT"] = percent;
				score["TEST_SCORE_VALUE"] = percentRaw;
				score["TEST_SCALED_SCORE"] = percentRaw;

				score["TEST_ITEMS_ATTEMPTED"] = progressItems;
				score["TEST_ITEMS_POSSIBLE"] =  totalItems;
				score["TEST_PERCENTAGE_SCORE"] =  percentRaw;

				score["TEST_SCORE_ATTRIBUTES"] = title;
				return score;
			}
			return null;
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

	 function convertMinutes(rowField){
		 var minutes = null;
		 var hourPart = 0;
		 var minutePart = 0;
		if(rowField !== null && rowField !== undefined && _util.trim(rowField) !== "--" && _util.trim(rowField) !== "-" && _util.trim(rowField) !== "") {
			rowField = rowField.toString().substring(0, rowField.toString().length - 1);//remove "m"
			if(rowField.indexOf("h")>-1){
				var timeArray = rowField.toString().split("h");
				hourPart = parseInt(timeArray[0]) * 60;
				minutePart = timeArray[1];
			}
			else{
				minutePart = rowField;
			}
			minutes = parseInt(hourPart) + parseInt(minutePart);
		}
		if(minutes==0){
			return null;
		}
		 return minutes;
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
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }

	function parseDate(row) {
		var rawDate = row.getField("LATEST_END_DATE");
        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };
//        if(rawDate === undefined || rawDate === null || rawDate === " " && signature.getFormat().getFormatName() === "ALEKS_28_1_COLS"){     //TODO looking up to the signature name is probably best alone
////            rawDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);   //TODO would need year from file path, do these get separate admins?
////          latest 05/15/YYYY
////             initial 09/15/YYYY-1
//            return dateObj;
//
//        }
        if(rawDate === "-") {
            rawDate = row.getField("INITIAL_END_DATE");
        }
		if(rawDate === "-") {
            return dateObj;
        }
        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }


        var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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



     function generateTestNumber(row, testMetadata) {
            var subject = row.getField("COURSE_PRODUCT");
            var subName = "";
            var testNumber = null;

            if(subject !== null && subject !== undefined && subject !== "" && subject !== "-")
            {

                if(subject.indexOf("Algebra 1") > -1 ) {
                    subName = "ALG1";
                } else if(subject.indexOf("Trigonometry") > -1 )  {
                    subName = "ALG2_TRG";
                } else if(subject.indexOf("Product") > -1 ) {
                    subName = "PRDT";
                } else if(subject.indexOf("Essentials") > -1 ) {
                    subName = "ESS_ALG";
                } else if(subject.indexOf("Geometry") > -1) {
                    subName = "HS_GEOM";
                } else if(subject.indexOf("Mathematics - LV 3") > -1) {
                    subName = "MATH_LV3";
                }else if(subject.indexOf("Mathematics - LV 4") > -1 ) {
                    subName = "MATH_LV4";
                } else if(subject.indexOf("Mathematics - LV 5") > -1 ) {
                    subName = "MATH_LV5";
                } else if(subject.indexOf("Math Course 3") > -1) {
                    subName = "MS_MATH_CR3";
                } else if(subject.indexOf("Math Course 2") > -1) {
                    subName = "MS_MATH_CR2";
                } else if(subject.indexOf("Math Course 1 / LV 6") > -1) {
                    subName = "MS_MATH_CR1";
                } else if(subject.indexOf("Calculus") > -1) {
                    subName = "PRE_CAL";
                }
         }
            if (subName) {
                testNumber = testMetadata.TEST + '_' + testMetadata.CODE  + "_" + subName;
                }
            return testNumber;
        }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());