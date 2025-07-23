var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "TELPAS";
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
        {TEST_NUMBER_SUFFIX:"TOT", TEST_FIELD_SUFFIX: "COMPOSITE", MAP_FUNCTION: mapOverallScore}
        /* Not using onwards.
       ,{TEST_NUMBER_SUFFIX:"2011", TEST_FIELD_SUFFIX: "SPRING_2011", MAP_FUNCTION: mapOverallScore}
       ,{TEST_NUMBER_SUFFIX:"2012", TEST_FIELD_SUFFIX: "SPRING_2012", MAP_FUNCTION: mapOverallScore}
       ,{TEST_NUMBER_SUFFIX:"2013", TEST_FIELD_SUFFIX: "SPRING_2013", MAP_FUNCTION: mapOverallScore}
       ,{TEST_NUMBER_SUFFIX:"2014", TEST_FIELD_SUFFIX: "SPRING_2014", MAP_FUNCTION: mapOverallScore}
       ,{TEST_NUMBER_SUFFIX:"2015", TEST_FIELD_SUFFIX: "SPRING_2015", MAP_FUNCTION: mapOverallScore}
       ,{TEST_NUMBER_SUFFIX:"2019", TEST_FIELD_SUFFIX: "SPRING_2019", MAP_FUNCTION: mapOverallScore}
       ,{TEST_NUMBER_SUFFIX:"2020", TEST_FIELD_SUFFIX: "SPRING_2020", MAP_FUNCTION: mapOverallScore}
       */
//       ,{TEST_NUMBER_SUFFIX:"ALT", TEST_FIELD_SUFFIX: "ALTERNATE", MAP_FUNCTION: mapOverallScore}
       ,{TEST_NUMBER_SUFFIX:"RD", TEST_FIELD_SUFFIX: "READING", MAP_FUNCTION: mapSubScore}
       ,{TEST_NUMBER_SUFFIX:"WR", TEST_FIELD_SUFFIX: "WRITING", MAP_FUNCTION: mapSubScore}
       ,{TEST_NUMBER_SUFFIX:"LI", TEST_FIELD_SUFFIX: "LISTENING", MAP_FUNCTION: mapSubScore}
       ,{TEST_NUMBER_SUFFIX:"SP", TEST_FIELD_SUFFIX: "SPEAKING", MAP_FUNCTION: mapSubScore}
        ,{TEST: "TELPAS", CODE:"RD", FIELD: "READING", MAP_FUNCTION: mapScore}
       ,{TEST: "TELPAS", CODE:"WR", FIELD: "WRITING", MAP_FUNCTION: mapScore}
        ,{TEST: "TELPAS", CODE:"LI", FIELD: "LISTENING", MAP_FUNCTION: mapScore}
        ,{TEST: "TELPAS", CODE:"SP", FIELD: "SPEAKING", MAP_FUNCTION: mapScore}
        ,{TEST: "TELPAS", CODE:"ALT", FIELD: "ALTERNATE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "TELPAS", CODE:"TOT", FIELD: "COMPOSITE", MAP_FUNCTION: mapScaledScore}
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


    var decodeProficiencyRating = {
        "4": "Advanced High",
        "3": "Advanced",
        "2": "Intermediate",
        "1": "Beginning",
        "0": "No Rating Available",
        "": "No Rating Available",
        "8": "No Rating Available",
        "9": "No Rating Available"
    };

    var decodeScoreCode = {
        "S": "Score",
        "B": "Score code was left blank",
        "X": "Not Tested: ARD Decision",
        "E": "Extenuating Circumstances, do not score",
        "A": "Absent (grades 2-12)",
        "O": "Other",
        "": null
    };

    var decodeAlternateRating = {
        "0": "Score code does not equal to S",
        "1": "Awareness",
        "2": "Imitation",
        "3": "Early Independence",
        "4": "Developing Independence",
        "5": "Basic Fluency",
        "": null,
        null: null
    };

    var decodeYearlyIndicator= {
        "0": "Lower or the same as previous year",
        "1": "One level higher than previous year",
        "2": "Two levels higher than previous year",
        "3": "Three levels higher than previous year",
        "": null,
        null: null
    };

    var satisfactoryPerformanceDecode={
        "1" : "Yes"
        , "0" : "No"
        , "": null
        ," ": null
    };

    var progressMeasureDecode={
        "2" : "Accelerated"
        , "1" : "Expected"
        , "0" : "Limited"
        , "": null
        ," ": null
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
                var score = (testMetadata.MAP_FUNCTION)(signature, row, testMetadata);

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
        var birthDateObject = AppUtil.getMonthFollowedByDay(row.getField("DATE_OF_BIRTH"));
        var schoolVen = row.getField("COUNTY_DISTRICT_CAMPUS_NUMBER");
    	if(schoolVen === null || schoolVen === ""){
    		schoolVen = "DISTRICT";
    	}

        var school = row.getField("COUNTY_DISTRICT_CAMPUS_NUMBER");
    	if(school!= null ){
    		school = school.toString().substring(6);
    	} else {
    		school = null;
    	}

        var testDate;
        if (row.getField("ADMINISTRATION_DATE")) {
            var testDateObject = "15" + row.getField("ADMINISTRATION_DATE");
        } else {
            var testDate = row.getField("TEST_DATE");
            if (testDate && testDate !== "") {
                testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
            }
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   row.getField("COUNTY_DISTRICT_CAMPUS_NUMBER");
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
                    //record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(row.getField("ADMINISTRATION_DATE") + hierarchy.SCHOOL_YEAR.substring(5), "MMddyyyy").STANDARD_DATE;
                    record.TEST_ADMIN_DATE  = _util.coalesce(AppUtil.getDateObjByPattern(testDateObject, "ddMMyy").STANDARD_DATE, testDate);
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

                //System Fields
               case "PROD_TEST_ID":
                   record.PROD_TEST_ID = prodTestId;
                   break;
                case "SYS_LINEAGE":
                   record.SYS_LINEAGE = row.getLineage().toString();
                   break;

               //Student ID and Matching Fields
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("LOCAL_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("LOCAL_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("LOCAL_STUDENT_ID"));
                    break;

               //Student Detail Fields
               case "STUDENT_FIRST_NAME":
                   record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                   break;
               case "STUDENT_MIDDLE_NAME":
                   record.STUDENT_MIDDLE_NAME = row.getField("MIDDLE_INITIAL");
                   break;
               case "STUDENT_LAST_NAME":
                   record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                   break;
               case "STUDENT_GRADE_CODE":
                   record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE_LEVEL_CODE')];
                    break;
               case "PARTICIPATION_GRADE":
                   record.PARTICIPATION_GRADE = gradeDecode[row.getField('GRADE_LEVEL_CODE')];
                   break;
               case "STUDENT_GENDER_CODE":
                   record.STUDENT_GENDER_CODE = row.getField("SEX_CODE");
                   break;
               case "STUDENT_STREET_ADDRESS":
                   record.STUDENT_STREET_ADDRESS = row.getField("STREET_ADDRESS");
                   break;
               case "STUDENT_CITY":
                   record.STUDENT_CITY = row.getField("CITY");
                   break;
               case "STUDENT_STATE_CODE":
                   record.STUDENT_STATE_CODE = row.getField("STATE_CODE");
                   break;
               case "STUDENT_POSTAL_CODE":
                   record.STUDENT_POSTAL_CODE = row.getField("POSTAL_CODE");
                   break;

               //School Fields
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = school;
                    break;
               case "SCHOOL_STATE_ID":
                   record.SCHOOL_STATE_ID =  schoolVen;
                   break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = schoolVen;
                    break;
                case "SCHOOL_NAME":
                record.SCHOOL_NAME = row.getField("CAMPUS_NAME");
                break;
               //Test Date Fields
               case "PARTICIPATION_YEAR":
                   record.PARTICIPATION_YEAR = getLoaderParameter("SCHOOL_YEAR");
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
       return {}
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapOverallScore(signature, row,testMetadata){
    if(signature.getFormat().getFormatName() === "TELPAS_2016"||signature.getFormat().getFormatName() === "TELPAS_2016-2017"||signature.getFormat().getFormatName() === "TELPAS_2017"||signature.getFormat().getFormatName() === "TELPAS_2017-2018"||signature.getFormat().getFormatName() === "TELPAS_2018" || signature.getFormat().getFormatName() === "TELPAS_60_COLS" || signature.getFormat().getFormatName() === "TELPASTXT_COLS_60") {
    	var testScoreElement = {};
    	var dataFileName = row.getRawField("LINEAGE_FILE").toString().toLowerCase();
    	if(alternateRatingFromFileName(dataFileName)){
    	    var testNumber = 'ALT_TELPAS_' + testMetadata.TEST_NUMBER_SUFFIX;
    	}else {
    	    var testNumber = 'TELPAS_' + testMetadata.TEST_NUMBER_SUFFIX;
    	}
    	var scaleScore = row.getField('TELPAS_'+ testMetadata.TEST_FIELD_SUFFIX + '_SCORE');
    	var primaryResult =  _util.coalesce( row.getField('TELPAS_'+ testMetadata.TEST_FIELD_SUFFIX + '_RATING'));

    	var rawScore = row.getField('TELPAS_COMPREHENSION_SCORE');
    	var yearlyIndicator = row.getField('YEARLY_PROGRESS_INDICATOR');
    	if(signature.getFormat().getFormatName() === "TELPAS_60_COLS" || signature.getFormat().getFormatName() === "TELPASTXT_COLS_60"){
    	if((scaleScore === null || scaleScore === "" || scaleScore === undefined) && (primaryResult != null  && primaryResult != "" && primaryResult != undefined)){
    	testScoreElement["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
    	if(alternateRatingFromFileName(dataFileName)){
            testScoreElement["TEST_PRIMARY_RESULT"] = decodeAlternateRating[primaryResult];
            testScoreElement["TEST_SCORE_TEXT"] = decodeAlternateRating[primaryResult];
        } else {
            testScoreElement["TEST_PRIMARY_RESULT"] = decodeProficiencyRating[primaryResult];
            testScoreElement["TEST_SCORE_TEXT"] = decodeProficiencyRating[primaryResult];
        }
    }
    }
    	else if(scaleScore === undefined || scaleScore === null || scaleScore == "" || scaleScore == "--" ){
    		return null;
    	}
    	//scaleScore = parseInt(scaleScore,10);
    	scaleScore = Math.round(scaleScore);
    	testScoreElement["TEST_NUMBER"] = testNumber;

    	if(scaleScore!= null){
    	    testScoreElement["TEST_SCORE_VALUE"] = scaleScore.toString().replace("S","").replace("X","");
    		testScoreElement["TEST_SCALED_SCORE"] = scaleScore.toString().replace("S","").replace("X","");
    	}

    	if(rawScore !== null && rawScore !== "" && rawScore !== undefined){
    		rawScore = parseInt(rawScore,10);
    	} else {
    		rawScore = null;
    	}

    	testScoreElement["TEST_RAW_SCORE"] = rawScore;
    	testScoreElement["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
    	if(alternateRatingFromFileName(dataFileName)){
    	    testScoreElement["TEST_PRIMARY_RESULT"] = decodeAlternateRating[primaryResult];
    	    testScoreElement["TEST_SCORE_TEXT"] = decodeAlternateRating[primaryResult];
    	} else {
    	    testScoreElement["TEST_PRIMARY_RESULT"] = decodeProficiencyRating[primaryResult];
    	    testScoreElement["TEST_SCORE_TEXT"] = decodeProficiencyRating[primaryResult];
    	}if(yearlyIndicator){
    	testScoreElement["TEST_GROWTH_RESULT_CODE"] = yearlyIndicator;
    	testScoreElement["TEST_GROWTH_RESULT"] = decodeYearlyIndicator[yearlyIndicator];
    	}

    	return testScoreElement;
    }
    }

        function mapSubScore(signature, row,testMetadata){
        if(signature.getFormat().getFormatName() === "TELPAS_2016"||signature.getFormat().getFormatName() === "TELPAS_2016-2017"||signature.getFormat().getFormatName() === "TELPAS_2017"||signature.getFormat().getFormatName() === "TELPAS_2017-2018"||signature.getFormat().getFormatName() === "TELPAS_2018" || signature.getFormat().getFormatName() === "TELPAS_60_COLS" || signature.getFormat().getFormatName() === "TELPASTXT_COLS_60"){
           var testScoreElement = {};
           var dataFileName = row.getRawField("LINEAGE_FILE").toString().toLowerCase();
           if(alternateRatingFromFileName(dataFileName)){
               var testNumber = 'ALT_TELPAS_' + testMetadata.TEST_NUMBER_SUFFIX;
           } else {
               var testNumber = 'TELPAS_' + testMetadata.TEST_NUMBER_SUFFIX;
           }
           var testName = testMetadata.TEST_FIELD_SUFFIX;
           var proficiency = row.getField(testName +'_PROFICIENCY_RATING');
           var scaleScore =  row.getField(testName +'_SCALE_SCORE');
           var rawScore =  row.getField(testName +'_RAW_SCORE');

           testScoreElement["TEST_NUMBER"] = testNumber;
           testScoreElement["TEST_SECONDARY_RESULT_CODE"] = row.getField(testName +'_SCORE_CODE');
           testScoreElement["TEST_SECONDARY_RESULT"] = decodeScoreCode[row.getField(testName +'_SCORE_CODE')];

           if(scaleScore !== null){
              testScoreElement["TEST_SCALED_SCORE"] = scaleScore.toString().replace("S","").replace("X","");
           }
           if(rawScore !== null){
              testScoreElement["TEST_RAW_SCORE"] = rawScore;
           }

           testScoreElement["TEST_SCORE_VALUE"] = proficiency;

           if(alternateRatingFromFileName(dataFileName)){
               testScoreElement["TEST_PRIMARY_RESULT_CODE"] = proficiency;
               testScoreElement["TEST_PRIMARY_RESULT"] = decodeAlternateRating[proficiency];
               testScoreElement["TEST_SCORE_TEXT"] = decodeAlternateRating[proficiency];
           } else {
               testScoreElement["TEST_PRIMARY_RESULT_CODE"] = proficiency;
               testScoreElement["TEST_PRIMARY_RESULT"] = decodeProficiencyRating[proficiency];
               testScoreElement["TEST_SCORE_TEXT"] = decodeProficiencyRating[proficiency];
           }

           return testScoreElement;
        }
        }

    function mapScaledScore(signature, row, testMetadata) {
        var score = {};
        var testNumber = null;
        var test = null;
    	var subName = row.getField("TESTSUBJECT");
    	if(subName === undefined || subName === null || subName == "" || subName == "--"){
    		return null;
    	}
    	subName = subName.toString();
    	if((subName === "READ")&&(testMetadata.CODE === "RD")){
    	test = "RD";
    	}
    	else if((subName === "WRIT")&&(testMetadata.CODE === "WR")){
    	test = "WR";
    	}
    	else if((subName === "SPEA")&&(testMetadata.CODE === "SP")){
    	test = "SP";
    	}
    	else if((subName === "LIST")&&(testMetadata.CODE === "LI")){
    	test = "LI";
    	}
    	else if((testMetadata.CODE === "TOT")&&(testMetadata.FIELD === "COMPOSITE")){
    	test = "TOT";
    	}
    	if(test === undefined || test === null || test == "" || test == "--"){
    		return null;
    	}

    	var dataFileName = row.getRawField("LINEAGE_FILE").toString().toLowerCase();
    	if(alternateRatingFromFileName(dataFileName)){
    	    var testNumber = 'ALT_TELPAS_' + test;
    	}else {
    	    var testNumber = 'TELPAS_' + test;
    	}

    	var scaleScore = row.getField('TELPAS_'+ testMetadata.FIELD + '_SCORE');
    	var primaryResult = row.getField('TELPAS_'+ testMetadata.FIELD + '_RATING');
    	var yearlyIndicator = row.getField('YEARLY_PROGRESS_INDICATOR');

       var satisfactoryGradeLevel = row.getField('MEETS_GRADE_LEVEL');
       var progressMeasure = row.getField('STAAR_PROGRESS_MEASURE');
       var lexile = row.getField('LEXILE_MEASURE');
       var quantile = row.getField('QUANTILE_MEASURE');
       var enrolledGrade = gradeDecode[row.getField('ENROLLED_GRADE')];
       var percentile = row.getField("PERCENTILE");

        if(((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        && (lexile === null || lexile === undefined || _util.trim(lexile) === "--" || _util.trim(lexile) === "")
        && (quantile === null || quantile === undefined || _util.trim(quantile) === "--" || _util.trim(quantile) === "")
        && (percentile === null || percentile === undefined || _util.trim(percentile) === "--" || _util.trim(percentile) === "")))

        {
            return null;
        }
//
//    	if(scaleScore === undefined || scaleScore === null || scaleScore == "" || scaleScore == "--"){
//    		return null;
//    	}
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

           if(!isNaN(satisfactoryGradeLevel)){
           score["TEST_TERTIARY_RESULT_CODE"] = satisfactoryGradeLevel;
           }
           score["TEST_TERTIARY_RESULT"] = satisfactoryPerformanceDecode[satisfactoryGradeLevel];

           if(!isNaN(progressMeasure)){
           score["TEST_QUATERNARY_RESULT_CODE"] = progressMeasure;
           }
           score["TEST_QUATERNARY_RESULT"] = progressMeasureDecode[progressMeasure];


           score["TEST_GRADE_EQUIVALENT"] = enrolledGrade;

           if(!isNaN(lexile)){
           score["TEST_READING_LEVEL"] = lexile;
           }
           if(!isNaN(quantile)){
           score["TEST_QUARTILE_SCORE"] = quantile;
           }
           if(!isNaN(percentile)){
           score["TEST_PERCENTILE_SCORE"] = percentile;
           }


        score["TEST_GROWTH_RESULT_CODE"] = yearlyIndicator;
        score["TEST_GROWTH_RESULT"] = decodeYearlyIndicator[yearlyIndicator];
    	score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
    	if(alternateRatingFromFileName(dataFileName)){
    	    score["TEST_PRIMARY_RESULT"] = decodeAlternateRating[primaryResult];
    	    score["TEST_SCORE_TEXT"] = decodeAlternateRating[primaryResult];
    	} else {
    	    score["TEST_PRIMARY_RESULT"] = decodeProficiencyRating[primaryResult];
    	    score["TEST_SCORE_TEXT"] = decodeProficiencyRating[primaryResult];
    	}
        return score;
    }

    function mapScore(signature, row, testMetadata) {
        var score = {};
    	var subName = row.getField("TESTSUBJECT");
    	if(subName === undefined || subName === null || subName == "" || subName == "--"){
    		return null;
    	}
    	subName = subName.toString();

    	if((subName === "READ" )&&(testMetadata.CODE === "RD")){
    	var test = "RD";
    	}
    	else if((subName === "WRIT" )&&(testMetadata.CODE === "WR")){
    	var test = "WR";
    	}
    	else if((subName === "SPEA" )&&(testMetadata.CODE === "SP")){
    	var test = "SP";
    	}
    	else if((subName === "LIST" )&&(testMetadata.CODE === "LI")){
    	var test = "LI";
    	}
    	else if((testMetadata.CODE === "TOT")&&(testMetadata.FIELD === "COMPOSITE")){
    	var test = "TOT";
    	}
    	if(test === undefined || test === null || test === "" || test === "--"){
    		return null;
    	}

    	var dataFileName = row.getRawField("LINEAGE_FILE").toString().toLowerCase();
    	if(alternateRatingFromFileName(dataFileName)){
    	    var testNumber = 'ALT_TELPAS_' + test;
    	}else {
    	    var testNumber = 'TELPAS_' + test;
    	}

    	var proficiency = row.getField('PROFICIENCY_RATING');
    	var scaleScore =  row.getField('SCALE_SCORE');
    	var rawScore =  row.getField('RAW_SCORE');
    	var scoreCode = row.getField('SCORE_CODE');

    	score["TEST_NUMBER"] = testNumber;
    	if((scaleScore === null || scaleScore === "" || scaleScore === undefined) && (rawScore === null || rawScore === "" || rawScore === undefined)){
    		return null
    	}
    		score["TEST_SCALED_SCORE"] = scaleScore;
    		score["TEST_RAW_SCORE"] = rawScore;

        score["TEST_SCORE_VALUE"] = proficiency;
    	score["TEST_SECONDARY_RESULT_CODE"] = scoreCode;
    	score["TEST_SECONDARY_RESULT"] = decodeScoreCode[scoreCode];
    	if(alternateRatingFromFileName(dataFileName)){
    	    score["TEST_PRIMARY_RESULT_CODE"] = proficiency;
    	    score["TEST_PRIMARY_RESULT"] = decodeAlternateRating[proficiency];
    	    score["TEST_SCORE_TEXT"] = decodeAlternateRating[proficiency];
    	} else {
    	    score["TEST_PRIMARY_RESULT_CODE"] = proficiency;
    	    score["TEST_PRIMARY_RESULT"] = decodeProficiencyRating[proficiency];
    	    score["TEST_SCORE_TEXT"] = decodeProficiencyRating[proficiency];
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


    function alternateRatingFromFileName(dataFileName) {
        var rating;
        dataFileName = dataFileName.toLowerCase();

        var fileVariation = ['alternate', 'alt'];

        for (const alt of fileVariation) {
            if(dataFileName.indexOf(alt) !== -1){
                    return alt;
            }
        }
        return rating;
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

        return assessmentAdminKey;
    }

    return module;
}());
