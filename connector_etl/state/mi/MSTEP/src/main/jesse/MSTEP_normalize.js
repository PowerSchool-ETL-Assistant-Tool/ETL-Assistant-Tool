var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MSTEP";
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
        {TEST: "MSTEP_", CODE:"OVR", FIELD: "OVERALL_", MAP_FUNCTION: mapScaledScore},
        ,{TEST: "MSTEP_", NUMBER: "RL", FIELD: "", MAP_FUNCTION: mapItemScore}
        ,{TEST: "MSTEP_", CODE: "ESSAY", FIELD: "ESSAY_", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "MSTEP_", CODE: "RD", FIELD: "READING_", MAP_FUNCTION: mapReadingScore}


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

    //Performance level
    var perfLevelDecode = {
       "1" : { DESC:"Not proficient", PASS_IND: "No"}
       ,"2" : { DESC:"Partially proficient", PASS_IND: "No"}
       ,"3" : { DESC:"Proficient", PASS_IND: "Yes"}
       ,"4" : { DESC:"Advanced", PASS_IND: "Yes"}
      ,"" : { DESC: null, PASS_IND: null}
      ,null : { DESC: null, PASS_IND: null}
      };
    //Perf Indicator and Reading Description
    var NewLevelDecode = {
       "3" : { DESC:"Above Standard", PASS_IND: "Yes"}
      ,"2" : { DESC:"At/Near Standard", PASS_IND: "Yes"}
      ,"1" : { DESC:"Below Standard", PASS_IND: "No"}
      ,"Meets" : { DESC:"RA", PASS_IND: "Yes"}
      ,"Supports" : { DESC:"RS", PASS_IND: "Yes"}
      ,"Retention" : { DESC:"RB", PASS_IND: "No"}
      ,"NA" : { DESC: null, PASS_IND: null}
      ,null : { DESC: null, PASS_IND: null}
    };
    //EssayPointsEarned Levels
    var EssayDecode = {
       "4" : { DESC: null, PASS_IND: null}
      ,"3" : { DESC: null, PASS_IND: null}
      ,"2" : { DESC: null, PASS_IND: null}
      ,"1" : { DESC: null, PASS_IND: null}
      ,"B" : { DESC:"Blank", PASS_IND: null}
      ,"I" : { DESC:"Insufficient", PASS_IND: null}
      ,"L" : { DESC:"Nonscorable Language", PASS_IND: null}
      ,"T" : { DESC:"Off Topic", PASS_IND: null}
      ,"M" : { DESC:"Off Purpose", PASS_IND: null}
      ,"NA" : { DESC: null, PASS_IND: null}
      ,null : { DESC: null, PASS_IND: null}
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

                if (testMetadata.NUMBER === "RL") {
                    for (var i = 1; i <= 10; i++) {
                        var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, i);
                        AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                    }
                }
                else {


                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            }
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
        var dateParts, dateObj, year, month, day;
        // Check for the presence of time and strip it out for initial processing
        var timeIndex = dateString.indexOf(" ");
        if (timeIndex !== -1) {
          dateString = dateString.split(" ")[0];
        }
        // Replace dashes with slashes for consistent processing
        dateString = dateString.replace(/-/g, '/');
        // Handle YYYY/MM/DD or YYYY/DD/MM
        if (dateString.match(/^\d{4}\/\d{2}\/\d{2}$/)) {
          dateParts = dateString.split('/');
          if (dateParts[1] > 12) { // It's in YYYY/DD/MM format
              dateString = dateParts[0] + '/' + dateParts[2] + '/' + dateParts[1];
          }
        }
        // Handle DD/MM/YYYY
        else if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
          dateParts = dateString.split('/');
          if (parseInt(dateParts[0], 10) > 12) {
              dateString = dateParts[1] + '/' + dateParts[0] + '/' + dateParts[2];
          }
        }
        dateObj = new Date(dateString);
        month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
        day = ('0' + dateObj.getDate()).slice(-2);
        year = dateObj.getFullYear();
        var finalDate =  month + '/' + day + '/' + year;
        return { finalDates: finalDate, months: month, days: day, years: year };
    }

    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        /*var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = _util.coalesce(row.getField("BIRTH_DATE").substring(0,10));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }*/

        var birthDate = _util.coalesce(row.getField("BIRTH_DATE"));
        if(birthDate !== undefined && birthDate !== null && birthDate !== "") {
           var dateResult = dateConverter(birthDate);
           var day = dateResult.days;
           var month = dateResult.months;
           var year = dateResult.years;
        }

        var finalDate = null;
        var date = row.getField("TEST_ADMIN_DATE");
        if(date !== undefined || date !== null || date !== ""){
            finalDate = dateConverter(date).finalDates;
        }
        else{
            finalDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = finalDate;
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
                    record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_DOB_MONTH":
                    //record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    record.STUDENT_DOB_MONTH = month;
                    break;
                case "STUDENT_DOB_DAY":
                    //record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    record.STUDENT_DOB_DAY = day;
                    break;
                case "STUDENT_DOB_YEAR":
                    //record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    record.STUDENT_DOB_YEAR = year;
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("DISTRICT_CODE"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("DISTRICT_CODE"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
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

        var contentArea = _util.trim(row.getField("CONTENT_AREA").toUpperCase());
        var testNumber = testMetadata.TEST + contentArea + "_" + testMetadata.CODE;

        var scaleScore = row.getField(testMetadata.FIELD + "SCALESCORE");
		var perfLevel = row.getField(testMetadata.FIELD + "PERFORMANCELEVEL");
		var totalPoints = row.getField(testMetadata.FIELD + 'TOTALPOINTS');
		var growthTarget = row.getField(testMetadata.FIELD + 'GROWTHTARGET');
		var growthScore = row.getField(testMetadata.FIELD + 'GROWTHSCORE');
		var targetTime = row.getField(testMetadata.FIELD + 'TARGETTIMEFRAME');
		var standardError = row.getField(testMetadata.FIELD + 'STANDARD_ERROR');

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NA")
        && (perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) === "--" || _util.trim(perfLevel) === "" || _util.trim(perfLevel) === "NA")
        && (totalPoints === null || totalPoints === undefined || _util.trim(totalPoints) === "--" || _util.trim(totalPoints) === "" || _util.trim(totalPoints) === "NA")
        && (growthTarget === null || growthTarget === undefined || _util.trim(growthTarget) === "--" || _util.trim(growthTarget) === "" || _util.trim(growthTarget) === "NA")
        && (growthScore === null || growthScore === undefined || _util.trim(growthScore) === "--" || _util.trim(growthScore) === "" || _util.trim(growthScore) === "NA"))
        {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;

        if(!isNaN(scaleScore)){
    	score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(totalPoints)){
        score["TEST_ITEMS_POSSIBLE"] = totalPoints;
        }
        if(!isNaN(growthTarget)){
        score["TEST_GROWTH_TARGET_1"] = growthTarget;
        }
        if(!isNaN(standardError)){
        score["TEST_STANDARD_ERROR"] = standardError;
        }
        if(!isNaN(growthScore)){
        score["TEST_GROWTH_TARGET_2"] = growthScore;
        }
        if(!isNaN(targetTime)){
        score["TEST_GROWTH_TARGET_3"] = targetTime;
        }
    	score["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
        score["TEST_PRIMARY_RESULT"] = perfLevelDecode[perfLevel].DESC;
        score["TEST_PASSED_INDICATOR"] = perfLevelDecode[perfLevel].PASS_IND;

        return score;
    }

    function mapItemScore(row, testMetadata, rlNumber) {
        var score = {};

        var contentArea = _util.trim(row.getField("CONTENT_AREA").toUpperCase());
        var testNumber = testMetadata.TEST + contentArea + "_" + testMetadata.NUMBER + rlNumber;

        var ptPoss = row.getField("POINTS_POSSIBLE_" + testMetadata.NUMBER + rlNumber);//POINTS_POSSIBLE_RL1
        var points = row.getField("POINTS_" + testMetadata.NUMBER + rlNumber);//POINTS_RL1
        var perfIndicator = row.getField("PERF_INDICATOR_" + testMetadata.NUMBER+ rlNumber); //PERF_INDICATOR_RL1
        var pctCorrect = row.getField("PCT_CORRECT_" + testMetadata.NUMBER+ rlNumber); //PCT_CORRECT_RL1
        var standardError = row.getField("SSSE_" + testMetadata.NUMBER+ rlNumber); //SSSE_RL1
        var scaleScore = row.getField("SS_" + testMetadata.NUMBER+ rlNumber); //SS_RL1

        // Check for key fields and do not map score and exit if conditions met.
        if((ptPoss === null || ptPoss === undefined || _util.trim(ptPoss) === "--" || _util.trim(ptPoss) === "" || _util.trim(ptPoss) === "NA") &&
           (points === null || points === undefined || _util.trim(points) === "--" || _util.trim(points) === "" || _util.trim(points) === "NA") &&
           (pctCorrect === null || pctCorrect === undefined || _util.trim(pctCorrect) === "--" || _util.trim(pctCorrect) === "" || _util.trim(pctCorrect) === "NA") &&
           (standardError === null || standardError === undefined || _util.trim(standardError) === "--" || _util.trim(standardError) === "" || _util.trim(standardError) === "NA") &&
           (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NA") &&
           (perfIndicator === null || perfIndicator === undefined || _util.trim(perfIndicator) === "--" || _util.trim(perfIndicator) === "" || _util.trim(perfIndicator) === "NA"))
            {
            return null;
            }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        if(!isNaN(ptPoss)){
            score["TEST_ITEMS_POSSIBLE"] = ptPoss;
        }
        if(!isNaN(points)){
            score["TEST_ITEMS_ATTEMPTED"] = points;
        }
        if(perfIndicator){
            score["TEST_SECONDARY_RESULT_CODE"] = perfIndicator;
            score["TEST_SECONDARY_RESULT"] = NewLevelDecode[perfIndicator].DESC;
            score["TEST_CUSTOM_PASS_IND"] = NewLevelDecode[perfIndicator].PASS_IND;
        }
        if(!isNaN(scaleScore)){
    	score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(standardError)){
        score["TEST_STANDARD_ERROR"] = standardError;
        }
        if(!isNaN(pctCorrect)){
        score["TEST_PERCENTAGE_SCORE"] = pctCorrect;
        }

        return score;
        }

    function mapStrandScore(row, testMetadata) {
        var score = {};

        var testNumber = testMetadata.TEST + testMetadata.CODE;

        var essayPtsEarned = row.getField(testMetadata.FIELD + "PTS_EARNED"); //ESSAY_PTS_EARNED
        var essayPtsPossible = row.getField(testMetadata.FIELD + "PTS_POSSIBLE"); //ESSAY_PTS_POSSIBLE


        // Check for key fields and do not map score and exit if conditions met.
        if((essayPtsEarned === null || essayPtsEarned === undefined || _util.trim(essayPtsEarned) === "--" || _util.trim(essayPtsEarned) === "" || _util.trim(essayPtsEarned) === "NA") &&
           (essayPtsPossible === null || essayPtsPossible === undefined || _util.trim(essayPtsPossible) === "--" || _util.trim(essayPtsPossible) === "" || _util.trim(essayPtsPossible) === "NA"))
            {
            return null;
            }
        // Set score fields

        score["TEST_NUMBER"] = testNumber;

        if(!isNaN(essayPtsEarned)){
            score["TEST_TERTIARY_RESULT_CODE"] = essayPtsEarned;
            score["TEST_TERTIARY_RESULT"] = EssayDecode[essayPtsEarned].DESC;
        }
        if(!isNaN(essayPtsPossible)){
            score["TEST_NCE_SCORE"] = essayPtsPossible;
        }
        return score;
        }


    function mapReadingScore(row, testMetadata) {
        var score = {};

        var testNumber = testMetadata.TEST + testMetadata.CODE;

        var readingLevel = row.getField(testMetadata.FIELD + "LEVEL"); //READING_LEVEL
        var readingLevelDesc = row.getField(testMetadata.FIELD + "LEVEL_DESCRIPTION"); //READING_LEVEL_DESCRIPTION

        // Check for key fields and do not map score and exit if conditions met.
        if((readingLevel === null || readingLevel === undefined || _util.trim(readingLevel) === "--" || _util.trim(readingLevel) === "" || _util.trim(readingLevel) === "NA") &&
           (readingLevelDesc === null || readingLevelDesc === undefined || _util.trim(readingLevelDesc) === "--" || _util.trim(readingLevelDesc) === "" || _util.trim(readingLevelDesc) === "NA"))
            {
            return null;
            }

        score["TEST_NUMBER"] = testNumber;

        /*if(!isNaN(readingLevel))*/
            score["TEST_READING_LEVEL"] = readingLevel;

       /* if(!isNaN(readingLevelDesc))*/
            score["TEST_QUATERNARY_RESULT_CODE"] = NewLevelDecode[readingLevelDesc].DESC;
            score["TEST_QUATERNARY_RESULT"] = readingLevelDesc;
            score["TEST_CUSTOM_RESULT_CODE"] = NewLevelDecode[readingLevelDesc].PASS_IND;

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