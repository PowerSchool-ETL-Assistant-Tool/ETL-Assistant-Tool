var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LITERACY_ACT";
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
        {TEST: "LIT_ACT", CODE:"RD", FIELD: "READING"}
        ,{TEST: "LIT_ACT", CODE:"MA", FIELD: "MATH"}
        ,{TEST: "LIT_ACT", CODE:"LNF", FIELD: "LETTER_NAMING_FLUENCY"}
        ,{TEST: "LIT_ACT", CODE:"LSF", FIELD: "LETTER_SOUND_FLUENCY"}
        ,{TEST: "LIT_ACT", CODE:"NWR", FIELD: "NONSENSE_WORD_READING"}
        ,{TEST: "LIT_ACT", CODE:"SWF", FIELD: "SIGHT_WORD_FLUENCY"}
        ,{TEST: "LIT_ACT", CODE:"ORA", FIELD: "ORAL_READING_ACCURACY"}
        ,{TEST: "LIT_ACT", CODE:"COM", FIELD: "COMPREHENSION"}
        ,{TEST: "LIT_ACT", CODE:"VOC", FIELD: "VOCABULARY"}

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
        "Kindergarten": "KG",
        "0": "KG",
        "00": "KG",
        "99": "PRE-K"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
        "0" :  {CODE: "--", DESC: "--"}
        ,"1" :  {CODE: "1", DESC: "Inadequate"}
        ,"2" : {CODE: "2", DESC: "Below Satisfactory"}
        ,"3" : {CODE: "3", DESC: "Satisfactory"}
        ,"4" : {CODE: "4", DESC: "Proficient"}
        ,"5" : {CODE: "5", DESC: "Mastery"}
        ,"Intervention": { CODE: "INTER", DESC: "Intervention"}
        ,"On Watch": { CODE: "ONWCH", DESC: "On Watch"}
        ,"Urgent Intervention": { CODE: "URGIN", DESC: "Urgent Intervention"}
        ,"At/Above Benchmark": { CODE: "ATABV", DESC: "At/Above Benchmark"}
        ,"Well Below Benchmark": { CODE: "WB", DESC: "Well Below Benchmark"}
        ,"Below Benchmark": { CODE: "BB", DESC: "Below Benchmark"}
        ,"Above Benchmark": { CODE: "AB", DESC: "Above Benchmark"}
        ,"At Benchmark": { CODE: "B", DESC: "At Benchmark"}
        ,"One Grade Below": { CODE: "OGB", DESC: "One Grade Below"}
        ,"1 Grade Level Below": { CODE: "OGLB", DESC: "1 Grade Level Below"}
        ,"Early On-Grade": { CODE: "EG", DESC: "Early On-Grade"}
        ,"Early On Grade Level": { CODE: "EGL", DESC: "Early On Grade Level"}
        ,"Three or More Grades Below": { CODE: "TGB", DESC: "Three or More Grades Below"}
        ,"3 or More Grade Levels Below": { CODE: "TOMGLB", DESC: "3 or More Grade Levels Below"}
        ,"Two Grades Below": { CODE: "TB", DESC: "Two Grades Below"}
        ,"2 Grade Levels Below": { CODE: "TGLB", DESC: "2 Grade Levels Below"}
        ,"Mid On-Grade or Above": { CODE: "MGA", DESC: "Mid On-Grade or Above"}
        ,"Mid or Above Grade Level": { CODE: "MOAGL", DESC: "Mid or Above Grade Level"}
        ,"At or Above Benchmark": { CODE: "ATABV", DESC: "At or Above Benchmark"}
        ,"meets grade level expectations" : { CODE: "MGLE", DESC: "Meets Grade Level Expectations" }
        ,"below grade level expectations": { CODE: "BGLE", DESC: "Below Grade Level Expectations"}
        ,"exceeds grade level expectations": { CODE: "EGLE", DESC: "Exceeds Grade Level Expectations"}
        ,"exceeding grade level expectations": { CODE: "EXCGLE", DESC: "Exceeding Grade Level Expectations"}
        ,"approaching grade level expectations": { CODE: "AGLE", DESC: "Approaching Grade Level Expectations"}
        ,"Average": { CODE: "AVG", DESC: "Average"}
        ,"Well Below Average": { CODE: "WBAVG", DESC: "Well Below Average"}
        ,"Above Average": { CODE: "AAVG", DESC: "Above Average"}
        ,"Below Average": { CODE: "BAVG", DESC: "Below Average"}
        ,"Well Above Average": { CODE: "WAAVG", DESC: "Well Above Average"}
        ,"Approaching": { CODE: "APPR", DESC: "Approaching"}
        ,"Below": { CODE: "BEL", DESC: "Below"}
        ,"Above": { CODE: "ABV", DESC: "Above"}
        ,"On": { CODE: "ON", DESC: "On"}
        ,"Exceeds": { CODE: "EXC", DESC: "Exceeds"}
        ,"Meets": { CODE: "MEET", DESC: "Meets"}
        ,"High": { CODE: "HI", DESC: "High"}
        ,"HiAvg": { CODE: "HIAVG", DESC: "High Average"}
        ,"LoAvg": { CODE: "LOAVG", DESC: "Low Average"}
        ,"Low": { CODE: "LO", DESC: "Low"}
        ,"Avg": { CODE: "AVG", DESC: "Average"}
        ,"Bubble": { CODE: "BBL", DESC: "Bubble"}
        ,"N/A": {CODE: null, DESC: null}
        ,"No Score": {CODE: null, DESC: null}
        ," " : {CODE: null, DESC: null}
        ,"" : {CODE: null, DESC: null}
        ,null : {CODE: null, DESC: null}
      };

    var passDecode = {
        "Y" : "Yes",
        "N" : "No"
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

        var scoresByDate = setAdminByDate(signature, hierarchy, row);
        for (var scoreDateKey in scoresByDate) {
            AppUtil.nullSafePush(normalizedRecords, mapNormalizedRecord(signature, hierarchy, row, scoreDateKey, scoresByDate[scoreDateKey]));
        }
        return normalizedRecords;
    }
    function setAdminByDate(signature, hierarchy, row) {
            var scoresByDate  = {};

            scoresToMap.forEach(function (scoreData) {
                var scoreDateKey;
                var ScoreDate = row.getField(scoreData.FIELD + "_DATE_COMPLETED");
                if (ScoreDate && ScoreDate !== 'N/A' && (ScoreDate.indexOf('/') > -1 || ScoreDate.indexOf('-') > -1)) {
                    scoreDateKey = scoreData.FIELD + '#' + String(ScoreDate);
                    scoresByDate[scoreDateKey] = [];
                    AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapScaledScore(row, scoreData));
                }
                else{
                    //Needs default date
                    var defaultDate = getDefaultDate(row, hierarchy);
                    scoreDateKey = scoreData.FIELD + '#' + defaultDate;
                    scoresByDate[scoreDateKey] = [];
                    AppUtil.nullSafePush(scoresByDate[scoreDateKey], mapScaledScore(row, scoreData));
                }
            });

            return scoresByDate;
    }

    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param row A JSON object containing row values being processed
     * @returns {Object}
     */
    function mapNormalizedRecord(signature, hierarchy, row, scoreDateKey, scores) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = scores;
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, scoreDateKey);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
    }
    function getDefaultDate(row, hierarchy){
        var testAdminPeriod = null;
        if(row.getField("READING_BENCHMARK_PERIOD")!== null && row.getField("READING_BENCHMARK_PERIOD")!== "N/A"){
            testAdminPeriod = row.getField("READING_BENCHMARK_PERIOD");
        }else if(row.getField("MATH_BENCHMARK_PERIOD")!== null && row.getField("MATH_BENCHMARK_PERIOD")!== "N/A"){
            testAdminPeriod = row.getField("MATH_BENCHMARK_PERIOD");
        }else{
            testAdminPeriod = hierarchy.REPORTING_PERIOD;
        }
       var defaultDate;
       switch(testAdminPeriod){
        case 'BOY':
            defaultDate = "08/15/" + hierarchy.SCHOOL_YEAR.substring(0, 4);
            return defaultDate;
        case 'MOY':
            defaultDate = "12/15/" + hierarchy.SCHOOL_YEAR.substring(0, 4);
            return defaultDate;
        case 'EOY':
            defaultDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
            return defaultDate;
        default:
            defaultDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
            return defaultDate;
       }

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
    function mapNormalizedAdminFields(signature, hierarchy, row, scoreDateKey) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var scoreDate;
        var scoreType;

        if(scoreDateKey) {
            scoreType = scoreDateKey.split('#')[0];
            scoreDate = scoreDateKey.split('#')[1];
        }

        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = row.getField("STUDENTDATE_OF_BIRTH");
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }
        var testAdminPeriod = null;
        if(row.getField("READING_BENCHMARK_PERIOD")!== null && row.getField("READING_BENCHMARK_PERIOD")!== "N/A"){
            testAdminPeriod = row.getField("READING_BENCHMARK_PERIOD");
        }else if(row.getField("MATH_BENCHMARK_PERIOD")!== null && row.getField("MATH_BENCHMARK_PERIOD")!== "N/A"){
            testAdminPeriod = row.getField("MATH_BENCHMARK_PERIOD");
        }else{
            testAdminPeriod = hierarchy.REPORTING_PERIOD;
        }
    var testAdminDate = _util.coalesce(AppUtil.getMonthFollowedByDay(scoreDate).STANDARD_DATE, getDefaultDate(row, hierarchy));

        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, testAdminDate, scoreType);
                    break;
                case "SYS_PARTITION_VALUE":
                    record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                    break;
                case "TENANT_CODE":
                    record.TENANT_CODE = AssessmentLoader.config.TENANT_CODE;
                    break;
                case "DISTRICT_CODE":
                    record.DISTRICT_CODE = _util.coalesce(row.getField("LEA_CODE"));  //AssessmentLoader.config.DISTRICT_CODE;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = testAdminPeriod;
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
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_IDENTIFIER"),row.getField("SSID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_IDENTIFIER")
                        ,row.getField("SSID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_IDENTIFIER")
                        ,row.getField("SSID")
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
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('STUDENTGRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOLNAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_CODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = row.getField("SCHOOLNAME");
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
            if ((JSON.stringify(row)).indexOf("READING_ADMINISTRATION_MODE") > -1){
                admin["TEST_INTERVENTION_DESC"] = row.getField("READING_ADMINISTRATION_MODE");
            }else if ((JSON.stringify(row)).indexOf("READING_ADMINISTRATION_MODE") > -1){
                admin["TEST_INTERVENTION_DESC"] = row.getField("READING_ADMINISTRATION_MODE");
            }
        admin.TEST_INTERVENTION_CODE_2 = 'READ_WARN';
        admin.TEST_INTERVENTION_DESC_2 = row.getField("READING_WARNING_GIVEN");
        admin.TEST_INTERVENTION_CODE_3 = 'MATH_WARN';
        admin.TEST_INTERVENTION_DESC_3 = row.getField("MATH_WARNING_GIVEN");
        return admin;
    }

    function getTestNumber(row, testMetadata, testProduct) {
        var testNumber = testMetadata.TEST + "_" + testProduct + "_";
        var testType = null;
        if(testMetadata.CODE !== "MA"){
            testType = _util.trim(row.getField("READING_ASSESSMENT_NAME"));
        }else {
            testType = _util.trim(row.getField("MATH_ASSESSMENT_NAME"));
        }
        if(testType){
            testType = testType.toUpperCase();
        }
        switch(testType){
            case "EARLY LITERACY":
                testNumber = testNumber + "ERL_LIT" + "_" + testMetadata.CODE;
                break;
            case "READING":
                testNumber = testNumber + "RD" + "_" + testMetadata.CODE;
                break;
            case "MATH":
                testNumber = testNumber + "MA" + "_" + testMetadata.CODE;
                break;
            case "EARLY NUMERACY":
                testNumber = testNumber + "ERL_NUM" + "_" + testMetadata.CODE;
                break;
            case "I-READY DIAGNOSTIC":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "I-READY ADAPTIVE ASSESSMENT FOR MATH":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "I-READY ADAPTIVE ASSESSMENT FOR READING":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "LP 1":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "LP 2":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "LP 3":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "ISIPER.OVERALL":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "STAR READING":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "MCLASS":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "DIBELS 8TH EDITION":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "STAR EARLY LITERACY":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "STAR MATH":
                testNumber = testNumber + testMetadata.CODE;
                break;
            case "MAP READING FLUENCY":
                testNumber = testNumber + "FLCY_" + testMetadata.CODE;
                break;
            case "MAP GROWTH - READING":
                testNumber = testNumber + "GRWTH_" + testMetadata.CODE;
                break;
            case "MAP GROWTH - MATH":
                testNumber = testNumber + "GRWTH_" + testMetadata.CODE;
                break;
            case "N/A":
                testNumber = null;
                break;
            default:
                testNumber = null;
        }

        return testNumber;

    }
    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testProduct = row.getField("VENDOR").toUpperCase();
        var testNumber = getTestNumber(row,testMetadata,testProduct);
        var grade = row.getField('STUDENTGRADE');
        if (grade!== null && grade!== undefined && grade!== "" ) {
          grade = gradeDecode[grade];
        }else{
        return null ;
        }
        var scaleScore = row.getField(testMetadata.FIELD + "_SCORE");
        var growthScore = row.getField(testMetadata.FIELD + "_GROWTH_SCORE");
        var profLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_PROFICIENCY_LEVEL"),row.getField(testMetadata.FIELD + "_PROFICIENCY_RATING"));
		var achievLevel = _util.trim(row.getField(testMetadata.FIELD + "_ACHIEVEMENT_LEVEL"));
		var lexile = row.getField(testMetadata.FIELD + "_LEXILE_SCORE");
		var quantile = row.getField(testMetadata.FIELD + "_QUANTILE_SCORE");
        var percentage = row.getField(testMetadata.FIELD + "_PERCENTAGE");
        var gradeEquivalent = row.getField(testMetadata.FIELD + "_GRADE_LEVEL_EQUIVALENCY");
        var reading = row.getField("READING_ASSESSMENT_NAME");
        var vocabScore = row.getField("VOCABULARY_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "N/A" || _util.trim(scaleScore) === "No Score") &&
          (achievLevel === null || achievLevel === undefined || _util.trim(achievLevel) === "--" || _util.trim(achievLevel) === "" || _util.trim(achievLevel) === "N/A" || _util.trim(scaleScore) === "No Score"))||
            testNumber === null) {
            return null;
        }
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if (testProduct === "AMPLIFY"){
            score["TEST_SCORE_ATTRIBUTES"] = reading;
        }
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        //Added vocabScore as per UIHN-66582
        if(!isNaN(vocabScore)){
            score["TEST_RAW_SCORE"] = vocabScore;
        }
    if(growthScore !== null && growthScore !== undefined && growthScore !== "N/A" && growthScore !== "#N/A" && _util.trim(growthScore) !== "") {
        var cleanedGrowthScore = growthScore;

        // Remove % symbol if present
        if(typeof cleanedGrowthScore === 'string' && cleanedGrowthScore.indexOf('%') > -1) {
            cleanedGrowthScore = cleanedGrowthScore.replace("%","");
        }

        // Only set if it's a valid number after cleaning
        if(!isNaN(cleanedGrowthScore) && cleanedGrowthScore !== "") {
            score["TEST_GROWTH_TARGET_1"] = cleanedGrowthScore;
        }
    }
    	score["TEST_PASSED_INDICATOR"] = passDecode[profLevel];
    	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achievLevel].CODE;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel].DESC;
    	if(percentage !== null && percentage !== "N/A"){
    	score["TEST_PERCENTAGE_SCORE"] = percentage.replace("%","");
        }
    	if(lexile !== null && lexile !== "N/A" ){
    	    score["TEST_READING_LEVEL"] = removeAlphaChar(lexile);
        }
        if(quantile !== null && quantile !== "N/A"){
            score["TEST_QUARTILE_SCORE"] = removeAlphaChar(quantile);
        }
        if(gradeEquivalent !== "N/A")
        score["TEST_GRADE_EQUIVALENT"] = gradeEquivalent;
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, testAdminDate, scoreType) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        var testAdminPeriod = null;
            if(srcRecord.getField("READING_BENCHMARK_PERIOD")!== null && srcRecord.getField("READING_BENCHMARK_PERIOD")!== "N/A"){
                testAdminPeriod = srcRecord.getField("READING_BENCHMARK_PERIOD");
            }else if(srcRecord.getField("MATH_BENCHMARK_PERIOD")!== null && srcRecord.getField("MATH_BENCHMARK_PERIOD")!== "N/A"){
                testAdminPeriod = srcRecord.getField("MATH_BENCHMARK_PERIOD");
            }else{
                testAdminPeriod = hierarchy.REPORTING_PERIOD;
            }

        var assessmentName = null;
              if(srcRecord.getField("READING_ASSESSMENT_NAME")!== null && srcRecord.getField("READING_ASSESSMENT_NAME")!== "N/A"){
                assessmentName = srcRecord.getField("READING_ASSESSMENT_NAME");
              }
              else if(srcRecord.getField("MATH_ASSESSMENT_NAME")!== null && srcRecord.getField("MATH_ASSESSMENT_NAME")!== "N/A"){
                assessmentName = srcRecord.getField("MATH_ASSESSMENT_NAME");
              }
        var score = null;
            if(srcRecord.getField("READING_SCORE")!== null && srcRecord.getField("READING_SCORE")!== "N/A"){
                score = srcRecord.getField("READING_SCORE");
            }else if(srcRecord.getField("MATH_SCORE")!== null && srcRecord.getField("MATH_SCORE")!== "N/A"){
                score = srcRecord.getField("MATH_SCORE");
            }
        var letterAchievlevel = null;
            if(srcRecord.getField("LETTER_NAMING_FLUENCY_ACHIEVEMENT_LEVEL")!== null && srcRecord.getField("LETTER_NAMING_FLUENCY_ACHIEVEMENT_LEVEL")!== "N/A"){
                letterAchievlevel = srcRecord.getField("LETTER_NAMING_FLUENCY_ACHIEVEMENT_LEVEL");
            }
        var oralAchievlevel = null;
            if(srcRecord.getField("ORAL_READING_ACCURACY_ACHIEVEMENT_LEVEL")!== null && srcRecord.getField("ORAL_READING_ACCURACY_ACHIEVEMENT_LEVEL")!== "N/A"){
                oralAchievlevel = srcRecord.getField("ORAL_READING_ACCURACY_ACHIEVEMENT_LEVEL");
            }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        if(scoreType === null || scoreType === undefined || scoreType === 'N/A' || _util.trim(scoreType) === ""){
            if(score === null || score === undefined || score === "" || score === 'N/A'){
                assessmentAdminKey = assessmentAdminKey + "_" + testAdminPeriod + "_" + assessmentName + "_" + testAdminDate;
            }else {
                assessmentAdminKey = assessmentAdminKey + "_" + testAdminPeriod + "_" + assessmentName + "_" + score + '_' + testAdminDate;
            }
        }else if(score === null || score === undefined || score === "" || score === 'N/A'){
            assessmentAdminKey = assessmentAdminKey + "_" + testAdminPeriod + "_" + assessmentName  + "_" + scoreType + "_" + testAdminDate;
        } else {
            assessmentAdminKey = assessmentAdminKey + "_" + testAdminPeriod + "_" + assessmentName + "_" + score + "_" + scoreType + "_" + testAdminDate;
        }

        if(letterAchievlevel !== null && letterAchievlevel !== undefined && letterAchievlevel !== "" && letterAchievlevel !== 'N/A'){
            assessmentAdminKey = assessmentAdminKey + "_" + letterAchievlevel;
        }
        if(oralAchievlevel !== null && oralAchievlevel !== undefined && oralAchievlevel !== "" && oralAchievlevel !== 'N/A'){
             assessmentAdminKey = assessmentAdminKey + "_" + oralAchievlevel;
         }
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    function removeAlphaChar(value){

       if(value === undefined || value === null) {
            return null;
       }

        if((/[a-zA-Z]/g.test(value))){
            value = value.replace(/[a-zA-Z]/g, '').trim();
        }

        return value;
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