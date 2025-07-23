var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "comprehension_question";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
    var multipleRowsPerGroupingExpected = false;
   /**
    *
    * Admin period values to generate separate admin keys
    */
    var adminPeriods = [
        "Fall",
        "Winter",
        "Spring",
        "Summer",
        "Screening_Period_5"
    ];
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
			print(`Loading using signature file ${signatureFormatName}`);


			//Initialize path and lineage variables.
			var normalizedFile = AppUtil.createResultsFile(file);

			print(`Normalized file: ${normalizedFile}`);

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
			throw `${_thisModuleName}.createNormalizedFile Exception: ${exception}`;
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
        {TEST: "COMP", CODE:"FALL", FIELD: "FALL_COMPREHENSION_QUESTION_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP", CODE:"WINTER", FIELD: "WINTER_COMPREHENSION_QUESTION_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP", CODE:"SPRING", FIELD: "SPRING_COMPREHENSION_QUESTION_", MAP_FUNCTION: mapScaledScore},

        // NEW  COMPREHENSION_EFFICIENCY Columns
        {TEST: "COMP_E", CODE:"FALL", FIELD: "FALL_COMPREHENSION_EFFICIENCY_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_E", CODE:"WINTER", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_E", CODE:"SPRING", FIELD: "SPRING_COMPREHENSION_EFFICIENCY_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_E", CODE:"SUMMER", FIELD: "SUMMER_COMPREHENSION_EFFICIENCY_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_E", CODE:"SCREENING_PERIOD_5", FIELD: "SCREENING_PERIOD_5_COMPREHENSION_EFFICIENCY_", MAP_FUNCTION: mapScaledScore},

        //NEW COMPREHENSION_RECALL Columns
        {TEST: "COMP_RD", CODE:"FALL", FIELD: "FALL_COMPREHENSION_RECALL_DETAILED_COMP_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_RS", CODE:"FALL", FIELD: "FALL_COMPREHENSION_RECALL_SYNTHESIS_COMP_", MAP_FUNCTION: mapScaledScore},

        {TEST: "COMP_RD", CODE:"WINTER", FIELD: "WINTER_COMPREHENSION_RECALL_DETAILED_COMP_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_RS", CODE:"WINTER", FIELD: "WINTER_COMPREHENSION_RECALL_SYNTHESIS_COMP_", MAP_FUNCTION: mapScaledScore},

        {TEST: "COMP_RD", CODE:"SPRING", FIELD: "SPRING_COMPREHENSION_RECALL_DETAILED_COMP_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_RS", CODE:"SPRING", FIELD: "SPRING_COMPREHENSION_RECALL_SYNTHESIS_COMP_", MAP_FUNCTION: mapScaledScore},

        {TEST: "COMP_RD", CODE:"SUMMER", FIELD: "SUMMER_COMPREHENSION_RECALL_DETAILED_COMP_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_RS", CODE:"SUMMER", FIELD: "SUMMER_COMPREHENSION_RECALL_SYNTHESIS_COMP_", MAP_FUNCTION: mapScaledScore},

        {TEST: "COMP_RD", CODE:"SCREENING_PERIOD_5", FIELD: "SCREENING_PERIOD_5_COMPREHENSION_RECALL_DETAILED_COMP_", MAP_FUNCTION: mapScaledScore},
        {TEST: "COMP_RS", CODE:"SCREENING_PERIOD_5", FIELD: "SCREENING_PERIOD_5_COMPREHENSION_RECALL_SYNTHESIS_COMP_", MAP_FUNCTION: mapScaledScore},

        //NEW COMPREHENSION_EFFICIENCY Strand Scores

        {TEST: "COMP", CODE1:"FALL", CODE:"FALL_EC", FIELD: "FALL_COMPREHENSION_EFFICIENCY_COMBINED_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"FALL", CODE:"FALL_ET", FIELD: "FALL_COMPREHENSION_EFFICIENCY_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"FALL", CODE:"FALL_ETT", FIELD: "FALL_COMPREHENSION_EFFICIENCY_TEXT_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"FALL", CODE:"FALL_ETK", FIELD: "FALL_COMPREHENSION_EFFICIENCY_TEXT_KNOW_", MAP_FUNCTION: mapStrandScore},

        {TEST: "COMP", CODE1:"WINTER", CODE:"WINTER_EC", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_COMBINED_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"WINTER", CODE:"WINTER_ET", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"WINTER", CODE:"WINTER_ETT", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_TEXT_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"WINTER", CODE:"WINTER_ETK", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_TEXT_KNOW_", MAP_FUNCTION: mapStrandScore},

        {TEST: "COMP", CODE1:"SPRING", CODE:"SPRING_EC", FIELD: "SPRING_COMPREHENSION_EFFICIENCY_COMBINED_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SPRING", CODE:"SPRING_ET", FIELD: "SPRING_COMPREHENSION_EFFICIENCY_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SPRING", CODE:"SPRING_ETT", FIELD: "SPRING_COMPREHENSION_EFFICIENCY_TEXT_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SPRING", CODE:"SPRING_ETK", FIELD: "SPRING_COMPREHENSION_EFFICIENCY_TEXT_KNOW_", MAP_FUNCTION: mapStrandScore},

        {TEST: "COMP", CODE1:"SUMMER", CODE:"SUMMER_EC", FIELD: "SUMMER_COMPREHENSION_EFFICIENCY_COMBINED_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SUMMER", CODE:"SUMMER_ET", FIELD: "SUMMER_COMPREHENSION_EFFICIENCY_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SUMMER", CODE:"SUMMER_ETT", FIELD: "SUMMER_COMPREHENSION_EFFICIENCY_TEXT_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SUMMER", CODE:"SUMMER_ETK", FIELD: "SUMMER_COMPREHENSION_EFFICIENCY_TEXT_KNOW_", MAP_FUNCTION: mapStrandScore},

        {TEST: "COMP", CODE1:"SCREENING_PERIOD_5", CODE:"SCRN_PERD_5_EC", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_COMBINED_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SCREENING_PERIOD_5", CODE:"SCRN_PERD_5_ET", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SCREENING_PERIOD_5", CODE:"SCRN_PERD_5_ETT", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_TEXT_TEXT_", MAP_FUNCTION: mapStrandScore},
        {TEST: "COMP", CODE1:"SCREENING_PERIOD_5", CODE:"SCRN_PERD_5_ETK", FIELD: "WINTER_COMPREHENSION_EFFICIENCY_TEXT_KNOW_", MAP_FUNCTION: mapStrandScore},


        //GROWTH SCORE
        {TEST: "COMP", CODE:"WINTER_FWG", FIELD: "WINTER_COMPREHENSION_QUESTION_", FIELD_2: "_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"SPRING_FSG", FIELD: "SPRING_COMPREHENSION_QUESTION_", FIELD_2: "_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"SPRING_WSG", FIELD: "SPRING_COMPREHENSION_QUESTION_", FIELD_2: "_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},

        {TEST: "COMP", CODE:"FALL_FWG", FIELD_2: "_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"FALL_FSG", FIELD_2: "_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"WINTER_WSG", FIELD_2: "_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"FALL_FSUG", FIELD_2: "_FROM_FALL_TO_SUMMER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"WINTER_WSUG", FIELD_2: "_FROM_WINTER_TO_SUMMER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"SPRING_WSUG", FIELD_2: "_FROM_SPRING_TO_SUMMER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"FALL_FSP5G", FIELD_2: "_FROM_FALL_TO_SCREENING_PERIOD_5", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"WINTER_WSP5G", FIELD_2: "_FROM_WINTER_TO_SCREENING_PERIOD_5", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"SPRING_SSP5G", FIELD_2: "_FROM_SPRING_TO_SCREENING_PERIOD_5", MAP_FUNCTION: mapGrowthScore},
        {TEST: "COMP", CODE:"SUMMER_SUSP5G", FIELD_2: "_FROM_SUMMER_TO_SCREENING_PERIOD_5", MAP_FUNCTION: mapGrowthScore},


    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
var gradeDecode = {
        "Kindergarten": "KG",
        "One" : "01",
        "Two" : "02",
        "Three" : "03",
        "Four" : "04",
        "Five" : "05",
        "Six" : "06",
        "Seven" : "07",
        "Eight" : "08",
        "Nine" : "09",
        "Ten" : "10",
        "Eleven": "11",
        "Twelve": "12"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
        "VL"     :   "Very Low Risk",
        "CP"     :   "Very Low Risk",
        "LR"     :   "Low Risk",
        "highRisk"     :   "High Risk",
        "someRisk"     :   "Some Risk",
        "lowRisk"     :   "Low Risk",
        "Low Risk"     :   "Low Risk",
        "Some Risk"     :   "Some Risk",
        "Very Low Risk"     :   "Very Low Risk",
        "High Risk"     :   "High Risk",
        "EX"     : "Exceeds",
        "EC"     : "Exceeds",
        "AD"    : "AD",
        "OT"    : "On Track",
        null    : null,
        ""      : null
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
         // Map a normalized record for different period
        adminPeriods.forEach(function(period){
            var record = mapNormalizedRecord(signature, hierarchy, row, period);
            AppUtil.nullSafePush(normalizedRecords, record);
        });
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
    function mapNormalizedRecord(signature, hierarchy, row, period) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, period);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, period);

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
    function mapNormalizedAdminFields(signature, hierarchy, row, period) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var dateField = getTestDate(row, period, hierarchy);

        var testDateObject = parseDate(dateField);
        var birthDateObject = parseDate(row.getField("STUDENT_BIRTHDATE"));

        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, period);
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
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, '05/15/' + hierarchy.SCHOOL_YEAR.substring(0,4));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STUDENT_LOCAL_ID")));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STUDENT_STATE_ID")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STUDENT_LOCAL_ID")));
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
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENT_GENDER_CODE"),"").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('STUDENT_GRADE_CODE')];
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
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
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

    function getTestDate(row, period, hierarchy) {
        var testDate;
        var springDate = _util.coalesce(row.getField("SPRING_COMPREHENSION_QUESTION_FINAL_DATE"),row.getField("SPRING_COMPREHENSION_EFFICIENCY_FINAL_DATE"));
        var winterDate = _util.coalesce(row.getField("WINTER_COMPREHENSION_QUESTION_FINAL_DATE"),row.getField("WINTER_COMPREHENSION_EFFICIENCY_FINAL_DATE"));
        var fallDate = _util.coalesce(row.getField("FALL_COMPREHENSION_QUESTION_FINAL_DATE"),row.getField("FALL_COMPREHENSION_EFFICIENCY_FINAL_DATE"));
        var summerDate = _util.coalesce(row.getField("SUMMER_COMPREHENSION_EFFICIENCY_FINAL_DATE"));
        var screenDate = _util.coalesce(row.getField("SCREENING_PERIOD_5_COMPREHENSION_EFFICIENCY_FINAL_DATE"));

        if (period === 'Fall') {
            if (fallDate && fallDate !== null && fallDate !==undefined) {
                testDate = fallDate;
            } else {
                testDate = "09/15/" + `${hierarchy.SCHOOL_YEAR.substring(0,4)}`;
            }
        } else if (period === 'Winter') {
            if (winterDate && winterDate !== null && winterDate !==undefined) {
                testDate = winterDate;
            } else {
                testDate = "01/15/" + `${hierarchy.SCHOOL_YEAR.substring(5,9)}`;
            }
        } else if (period === 'Spring') {
            if (springDate && springDate !== null && springDate !==undefined) {
                testDate = springDate;
            } else {
                testDate = "05/15/" + `${hierarchy.SCHOOL_YEAR.substring(5,9)}`;
            }
        } else if (period === 'Summer') {
             if (summerDate && summerDate !== null && summerDate !==undefined) {
                 testDate = summerDate;
             } else {
                 testDate = "07/15/" + `${hierarchy.SCHOOL_YEAR.substring(0,4)}`;
             }
        } else if (period === 'Screening_Period_5') {
           if (screenDate && screenDate !== null && screenDate !==undefined) {
               testDate = screenDate;
           } else {
               testDate = "05/15/" + `${hierarchy.SCHOOL_YEAR.substring(0,4)}`;
           }
        } else {
            // from collease in admin function
            testDate = "05/15/" + `${hierarchy.SCHOOL_YEAR.substring(0,4)}`
        }

        return testDate;

    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata, period) {

        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "IC_PER_MINUTE");
        var itemsAttempted = row.getField(testMetadata.FIELD +"TOTAL_ITEMS");
        var itemsCorrect = row.getField(testMetadata.FIELD +"ITEMS_CORRECT");
        var totalAccuracy = row.getField(testMetadata.FIELD +"TOTAL_ACCURACY");
		var primary =  _util.coalesce(row.getField(testMetadata.FIELD +"RISK_LEVEL"),row.getField(testMetadata.CODE +"_COMPREHENSION_RECALL_RISK_LEVEL"));
		var percentileSchool = _util.coalesce(row.getField(testMetadata.FIELD +"PERCENTILE_AT_SCHOOL"),row.getField(testMetadata.CODE +"_COMPREHENSION_RECALL_PERCENTILE_AT_SCHOOL"));
		var percentileLEA = _util.coalesce(row.getField(testMetadata.FIELD +"PERCENTILE_AT_LEA"),row.getField(testMetadata.CODE +"_COMPREHENSION_RECALL_PERCENTILE_AT_LEA"));
		var percentileNation = _util.coalesce(row.getField(testMetadata.FIELD +"PERCENTILE_AT_NATION"),row.getField(testMetadata.CODE +"_COMPREHENSION_RECALL_PERCENTILE_AT_NATION"));
        var uniqueDate = _util.coalesce(row.getField(testMetadata.FIELD +"FINAL_DATE"),row.getField(testMetadata.CODE +"_COMPREHENSION_RECALL_FINAL_DATE"));

        period = period.toUpperCase();
        if (period !== testMetadata.CODE) {
            return null;
        }
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
        score["TEST_ITEMS_ATTEMPTED"] = parseInt(itemsCorrect);
        score["TEST_ITEMS_POSSIBLE"] = parseInt(itemsAttempted);
        score["TEST_PERCENTAGE_SCORE"] = totalAccuracy;
    	score["TEST_PRIMARY_RESULT_CODE"] = primary;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
        score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
         if(!isNaN(percentileSchool)){
        score["TEST_SECONDARY_RESULT"] = percentileSchool;
        }
        score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
         if(!isNaN(percentileLEA)){
        score["TEST_TERTIARY_RESULT"] = percentileLEA;
        }
        score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
        score["TEST_QUATERNARY_RESULT"] = percentileNation;
        score["TEST_PERCENTILE_SCORE"] = parseInt(percentileNation);
        score["TEST_SCORE_ATTRIBUTES"] = uniqueDate;
        return score;
    }

    function mapStrandScore(row, testMetadata, period) {
            var score = {};
            var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
            var scaleScore = row.getField(testMetadata.FIELD + "IC_PER_MINUTE");
            var itemsAttempted = row.getField(testMetadata.FIELD +"TOTAL");
            var itemsCorrect = row.getField(testMetadata.FIELD +"CORRECT");
            var totalAccuracy = row.getField(testMetadata.FIELD +"ACCURACY");

            period = period.toUpperCase();
            if (period !== testMetadata.CODE1) {
                return null;
            }
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
            score["TEST_ITEMS_ATTEMPTED"] = parseInt(itemsCorrect);
            score["TEST_ITEMS_POSSIBLE"] = parseInt(itemsAttempted);
            score["TEST_PERCENTAGE_SCORE"] = totalAccuracy;
            return score;
        }

    function mapGrowthScore(row, testMetadata, period) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" +testMetadata.CODE;
        var growthScore = _util.coalesce(row.getField(testMetadata.FIELD+"GROWTH_SCORE"+testMetadata.FIELD_2),row.getField("GROWTH_SCORE"+testMetadata.FIELD_2));
        var growthSchool = _util.coalesce(row.getField(testMetadata.FIELD+"SCHOOL_GROWTH_PERCENTILE"+testMetadata.FIELD_2),row.getField("SCHOOL_GROWTH_PERCENTILE"+testMetadata.FIELD_2));
        var growthDistrict = _util.coalesce(row.getField(testMetadata.FIELD+"DISTRICT_GROWTH_PERCENTILE"+testMetadata.FIELD_2),row.getField("DISTRICT_GROWTH_PERCENTILE"+testMetadata.FIELD_2));
        var growthNational = _util.coalesce(row.getField(testMetadata.FIELD+"NATIONAL_GROWTH_PERCENTILE"+testMetadata.FIELD_2),row.getField("NATIONAL_GROWTH_PERCENTILE"+testMetadata.FIELD_2));
        var growthStart = _util.coalesce(row.getField(testMetadata.FIELD+"GROWTH_PERCENTILE_BY_START_SCORE"+testMetadata.FIELD_2),row.getField("GROWTH_PERCENTILE_BY_START_SCORE"+testMetadata.FIELD_2));

        period = period.toUpperCase();
        if (period !== testMetadata.CODE.split('_')[0]) {
            return null;
        }
        // Check for key fields and do not map score and exit if conditions met.
        if(growthScore === null || growthScore === undefined || _util.trim(growthScore) === "--" || _util.trim(growthScore) === "") {
            return null;
        }
        if(growthNational!==undefined && growthNational!==null){
            growthNational = parseInt(growthNational);
        }
        if(growthStart!==undefined && growthStart!==null){
            growthStart = parseInt(growthStart);
        }
        if(growthSchool!==undefined && growthSchool!==null){
            growthSchool = parseInt(growthSchool);
        }
        if(growthDistrict!==undefined && growthDistrict!==null){
            growthDistrict = parseInt(growthDistrict);
        }
    	// Set score fields
        growthScore = parseFloat(growthScore);
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = growthScore;
        score["TEST_GROWTH_RESULT"] = growthScore;
        if(!isNaN(growthScore)){
            score["TEST_SCORE_VALUE"] = growthScore;
            score["TEST_SCALED_SCORE"] = growthScore;
        }
    	score["TEST_GROWTH_PERCENTILE"] = growthStart;
    	score["TEST_GROWTH_TARGET_1"] = growthSchool;
    	score["TEST_GROWTH_TARGET_2"] = growthDistrict;
    	score["TEST_GROWTH_TARGET_3"] = growthNational;
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
            // Sending different periods to generate assessment admin key
            for(var i=0; i<adminPeriods.length; i++) {
                var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, adminPeriods[i]);
                var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, adminPeriods[i]);
                if(assessmentAdminKey_one === assessmentAdminKey_two) {
                    return 1;
                } else {
                    return -1;
                }
            }

        } catch (exception) {
            throw `${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}`;
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, period) {

        var assessmentAdminKey = null;
        // Set base assessment admin key information based on period
        if(period===undefined){
             assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;
        }
        else{
             assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}`;
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        var testDate = getTestDate(srcRecord,period,hierarchy);

        assessmentAdminKey = assessmentAdminKey + "_" + testDate + "_" + srcRecord.getField("STUDENT_LOCAL_ID")
        return assessmentAdminKey;
    }

        function parseDate(rawDate){

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === ""){
            return dateObj;
        }

        var formatter;

        if (rawDate.length >= 8 && rawDate.indexOf('/') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
        } else if (rawDate.length >= 8 && rawDate.indexOf('-') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
        } else {
            formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
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

    return module;
}());