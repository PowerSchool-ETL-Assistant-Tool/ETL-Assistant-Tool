var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "STAR_CBM";
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
		}n
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
        {TEST: "STAR_CBM", CODE:"SC", FIELD: "SCALE", MAP_FUNCTION: mapScaledScore},
        {TEST: "STAR_CBM", CODE:"_RDOVR_FALL", FIELD: "FALL", MAP_FUNCTION: mapOverallRiskScore},
        {TEST: "STAR_CBM", CODE:"_RDOVR_WINTER", FIELD: "WINTER", MAP_FUNCTION: mapOverallRiskScore},
        {TEST: "STAR_CBM", CODE:"_RDOVRF_SPRING", FIELD: "SPRING", MAP_FUNCTION: mapOverallRiskScore}
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
        "R":"08",
        "Kindergarten": "KG",
        "Pre-K": "PK",
        "Other": "KG",
        "" : null,
       null : null
    };
    var testTypes = {
        "Addition to 10":"AD10",
        "Addition to 20":"AD20",
        "Mixed Addition and Subtraction": "MIXADSUB",
        "Multiplication to 100": "MUL100",
        "Quantity Comparison": "QUACOMP",
        "Numeral Recognition": "NUMREC",
        "Subtraction from 10": "SUB10",
        "Expressive Nonsense Words":"EXPNW",
        "Letter Naming":"LN",
        "Passage Oral Reading": "POR",
        "Letter Sounds": "LS",
        "Phoneme Segmentation": "PHSEG",
        "Receptive Nonsense Words": "RENW",
        "Rapid Picture Naming": "RPN",
        "Rapid Color Naming": "RCN",
        "Rapid Letter Naming" :"RLN",
        "Rapid Number Naming" :"RNN",
        "Encoding Field Test" :"EFT",
        "Sight and High-Frequency Words Field Test":"SHFW",
        "Pasajes para lectura en voz alta (español)":"POR",//Pasajes para lectura en voz alta (español) is known as Passage Oral Reading
        "Encoding":"ECD",
        "Sight and High-Frequency Words":"SHFW",
        "Palabras con sílabas compuestas":"WWCS",//Words with Compound Syllables
        "Palabras con sílabas simples":"WWSS",//Words with Simple Syllables
        "Combinaciones de letras":"LC",//Letter Combinations
        "Nombrar objetos rápidamente":"NOF",//Name Objects Fast
        "Nombrar colores rápidamente":"NCF",//Name Colors Fast
        "Nombrar letras rápidamente":"NLF",//Name Letter Fast
        "Nombrar números rápidamente":"NNF",//Name Numbers Fast
         "": null,
        null: null


    };
     var perfLevels = {

        "Intervention": { PASS_IND: "No", CODE: "INTER", DESC: "Intervention" },
        "On Watch": { PASS_IND: "No", CODE: "ONWCH", DESC: "On Watch" },
        "At/Above Benchmark": { PASS_IND: "Yes",CODE: "ATABV", DESC: "At/Above Benchmark" },
        "" : {PASS_IND: null, CODE: null, DESC: null},
        "null" :{ PASS_IND: null, CODE: null, DESC: null},
        "Satisfactory/Optimal": { PASS_IND: "Yes", CODE: "SATOPT", DESC: "Satisfactory/Optimal" },
        "Alert": { PASS_IND: "No", CODE: "ALRT", DESC: "Alert" },
        // Added numeric mappings
        "1": { PASS_IND: "Yes", CODE: "ATABV", DESC: "At/Above Benchmark" },
        "2": { PASS_IND: "No", CODE: "ONWCH", DESC: "On Watch" },
        "3": { PASS_IND: "No", CODE: "INTER", DESC: "Intervention" },
        null :{ PASS_IND: null, CODE: null, DESC: null}
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
        var birthDate = _util.coalesce(row.getField("BIRTHDATE"));
        var testDate = _util.coalesce(row.getField("COMPLETEDTESTDATE"));
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
           birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }
        if(testDate !== null && testDate !== undefined && testDate !== ""){
           testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
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
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(row);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDate, "05/15"+hierarchy.SCHOOL_YEAR.substring(5,9));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENTIDENTIFIER"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENTSTATEID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENTIDENTIFIER"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENTFIRSTNAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENTLASTNAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENTMIDDLENAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('CURRENTGRADE')];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOLIDENTIFIER"),'DISTRICT');
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOLSTATEID"),'DISTRICT');
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOLNAME"));
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
        var testInterventionDesc = _util.coalesce(row.getField("SEASON"));

        admin.TEST_INTERVENTION_DESC = testInterventionDesc;

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField("EQUATEDCORRECTPERMINUTE");
        var attempted =  row.getField("EQUATEDNUMBERATTEMPTED");
        var possible = row.getField("EQUATEDNUMBERCORRECT");
        var percentile = row.getField("EQUATEDPERCENTCORRECT");
        var decile = row.getField("DECILE");
        var quartile =  row.getField("QUARTILE");
        var percentilerank = row.getField("PERCENTILERANK");
        var primary = row.getField("BENCHMARKCATEGORY");
        var formId = row.getField("FORMID");


        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
        &&(percentile === null || percentile === undefined || _util.trim(percentile) === "--" || _util.trim(percentile) === "")){
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)&& scaleScore <= 9999){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_SCORE_ATTRIBUTES"] = formId;
    	score["TEST_PASSED_INDICATOR"] =  perfLevels[primary].PASS_IND;
    	score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[primary].CODE;
    	score["TEST_PRIMARY_RESULT"] = perfLevels[primary].DESC;

    	score["TEST_PERCENTILE_SCORE"] = percentilerank;
    	score["TEST_PERCENTAGE_SCORE"] = percentile;
        score["TEST_QUARTILE_SCORE"] = quartile;
        score["TEST_DECILE_SCORE"] = decile;
        score["TEST_ITEMS_POSSIBLE"] = attempted;
        score["TEST_ITEMS_ATTEMPTED"] = possible;




        return score;
    }
    
    function mapOverallRiskScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE + "_"+ gradeDecode[row.getField("CURRENTGRADE")];
        var scaleScore = row.getField("READINGOVERALLRISKSCORE"+testMetadata.FIELD);
        var percentilerank = row.getField("READINGOVERALLRISKPR"+testMetadata.FIELD);
        var primary = row.getField("READINGOVERALLRISKBENCHMARK"+testMetadata.FIELD);
        var formId = row.getField("FORMID");


        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""){
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)&& scaleScore <= 9999){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_PASSED_INDICATOR"] =  perfLevels[primary].PASS_IND;
        score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[primary].CODE;
        score["TEST_PRIMARY_RESULT"] = perfLevels[primary].DESC;

        score["TEST_PERCENTILE_SCORE"] = percentilerank;
        score["TEST_SCORE_ATTRIBUTES"] = formId;
        
        return score;
    }
    

    function generateTestNumber(row, testMetadata){

        var testType = testTypes[row.getField("MEASURENAME")];
        var grade = gradeDecode[row.getField("CURRENTGRADE")];
        var subject = _util.coalesce(row.getField("APPLICATIONNAME"), row.getField("ACTIVITY"));
        if(subject !== null && subject !== undefined && subject !== "")
        {
            subject = subject.toUpperCase();
            if(subject.indexOf("MATH") > -1) {
                subject = "MA";
            } else if (subject.indexOf("READING") > -1) {
                subject = "RD";
            }else if (subject.indexOf("LECTURA") > -1) {
                subject = "LECT";
            }
        }

        if(testType === null || testType === "" || testType === undefined){
            testType = "UNK";
        }

        var testNumber = testMetadata.TEST + "_" + testType + "_"+ grade + "_"+ subject;

        return testNumber;

    }
   function getTEST_ADMIN_PERIOD(row) {
        var testAdminPeriod = "Unknown";
        var adminPeriod = row.getField("SEASON");
        if (adminPeriod !== null && adminPeriod !== undefined && adminPeriod !== "")//Season column takes precedence over admin period
        {
            adminPeriod = adminPeriod.toUpperCase();
            if(adminPeriod.indexOf("FALL")>-1){
                testAdminPeriod = "FALL";
            }
            else if(adminPeriod.indexOf("SPRING")>-1){
                testAdminPeriod = "SPRING";
            }
            else if(adminPeriod.indexOf("WINTER")>-1){
                testAdminPeriod = "WINTER";
            }
        }
        else {
        var testDate = row.getField("COMPLETEDTESTDATE");
        if(testDate !== null && testDate !== undefined && testDate !== ""){
            var testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
        }

          var month = testDate.substring(0, 2);

          if (month === "08" || month === "09" || month === "10" || month === "11")
                testAdminPeriod = "FALL";
          else if (month === "12" || month === "01" || month === "02" || month === "03")
                testAdminPeriod = "WINTER";
          else if (month === "04" || month === "05" || month === "06" || month === "07")
                testAdminPeriod = "SPRING";
          }
        return testAdminPeriod
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
        var testDate = srcRecord.getField("COMPLETEDTESTDATE");
        var activityID = srcRecord.getField("ACTIVITYID");
        var period = getTEST_ADMIN_PERIOD(srcRecord);
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}";
        var testType = testTypes[srcRecord.getField("MEASURENAME")];
        var subject = _util.coalesce(srcRecord.getField("APPLICATIONNAME"), srcRecord.getField("ACTIVITY"));
           if(subject !== null && subject !== undefined && subject !== "") {
              subject = subject.toUpperCase();
              if(subject.indexOf("MATH") > -1) {
                 subject = "MA";
              } else if (subject.indexOf("READING") > -1) {
                 subject = "RD"
              }
           }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
       if(testDate !== null && testDate !== undefined && testDate !== ""){
           testDate = AppUtil.getMonthFollowedByDay(testDate).STANDARD_DATE;
       }

         assessmentAdminKey = assessmentAdminKey + '_' + activityID + '_' +  testType + '_' + subject + '_' + testDate;

        return assessmentAdminKey;
    }

    return module;
}());