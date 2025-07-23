var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "VA_GROWTH";
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
          { TEST: "VA_GROWTH", MAP_FUNCTION: mapScore }
         ,{TEST: "VA_GROWTH", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "1", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VA_GROWTH", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "2", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VA_GROWTH", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "3", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VA_GROWTH", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "4", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VA_GROWTH", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "5", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VA_GROWTH", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "6", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VA_GROWTH", CODE: "RPT", FIELD:"REPORTING_CAT",FIELD_2: "7", MAP_FUNCTION: mapReportingScore}
         ,{TEST: "VA_GROWTH", CODE: "TEST", FIELD:"TEST",FIELD_2: "", MAP_FUNCTION: mapReportingScore}
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
        , "": null
        , null: null
    };

    var primaryDecode = {
        "5": "Fail/Below Basic"
        , "4": "Fail/Basic"
        , "3": "Fail/Does Not Meet"
        , "2": "Pass/Proficient"
        , "1": "Pass/Advanced"
        , "8": "Pass/Advanced"
        , "9": "Did Not Take"
        , "": null
        , null: null
    };

    var passDecode = {
        "1": "Yes"
        , "2": "Yes"
        , "3": "No"
        , "4": "No"
        , "5": "No"
        , "8": "Yes"
        , "9": null
        , "": null
        , null: null
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
        var date = null;
        var month = null;

        if (row.getField("DOB_DAY") !== null && row.getField("DOB_DAY") !== undefined && row.getField("DOB_DAY") !== "0") {
            date = ("0" + row.getField("DOB_DAY")).slice(-2);
        }
        if (row.getField("DOB_MONTH") !== null && row.getField("DOB_MONTH") !== undefined && row.getField("DOB_MONTH") !== "0") {
            month = ("0" + row.getField("DOB_MONTH")).slice(-2);
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
                    record.REPORTING_PERIOD = _util.coalesce(getAdminPeriod(row,hierarchy),hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getDateString(row, hierarchy);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STATE_TESTING_IDENTIFIER")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_ID")
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
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(month, '');
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(date, '');
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(row.getField("DOB_YEAR"), '');
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_CODE"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_CODE") );
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
    function mapScore(row, testMetadata) {
        let score = {};
        let testNumber = getTestNumber(testMetadata, row.getField('TEST_NAME'), gradeDecode[row.getField('GRADE')]);
        let scoreValue = row.getField('VERTICAL_SCALED_SCORE');
        var testStatus = row.getField("TESTING_STATUS");
       // let performanceScore = row.getField('PERFORMANCE_LEVEL');

        // Do not map if there is no score value
        if (!scoreValue) {
            return null;
        }


        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scoreValue;

        if (!isNaN(scoreValue)) {
            score["TEST_SCORE_VALUE"] = scoreValue;
            score["TEST_SCALED_SCORE"] = scoreValue;
        }
        score["TEST_SCORE_ATTRIBUTES"] = testStatus;


//        score["TEST_PRIMARY_RESULT_CODE"] = performanceScore;
//        score["TEST_PASSED_INDICATOR"] = passDecode[performanceScore];
//        score["TEST_PRIMARY_RESULT"] = primaryDecode[performanceScore];

        return score;
    }

    function mapReportingScore(row, testMetadata) {

        var score = {}
        var testNumber = null;
        var scaleScore = null;
        var performanceLevel = null;
        var testName =row.getField('TEST_NAME');
        var subName=null;
        if (testName.indexOf('Reading') !== -1) {
             subName = 'READ';
        } else if (testName.indexOf('Read') !== -1) {
            subName = 'READ';
        }else if (testName.indexOf('Writing') !== -1) {
             subName = 'WRIT';
        } else if (testName.indexOf('Hist/Soc') !== -1) {
             subName =  'HIST';
        } else if (testName.indexOf('Science') !== -1) {
             subName = 'SCI';
        } else if (testName.indexOf('Mathematics') !== -1) {
             subName = 'MATH';
        }else if (testName.indexOf('Math') !== -1) {
              subName = 'MATH';
         }

        if(testMetadata.CODE === "RPT") {
            testNumber =  testMetadata.TEST + "_" + subName +"_"+testMetadata.CODE+ "_" + testMetadata.FIELD_2;
            scaleScore =row.getField(testMetadata.FIELD +"_SCALED_SCORE_"+ testMetadata.FIELD_2);
        }
        else if (testMetadata.CODE === "TEST") {
            testNumber =  testMetadata.TEST + "_"+ subName +"_"+ testMetadata.CODE;
            scaleScore = row.getField(testMetadata.FIELD +"_SCALED_SCORE");
            performanceLevel = row.getField('PERFORMANCE_LEVEL');

        }

        if (scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_PRIMARY_RESULT_CODE"] = performanceLevel;
        score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];
        score["TEST_PRIMARY_RESULT"] = primaryDecode[performanceLevel];

        if (!isNaN(scaleScore)) {
          score["TEST_SCORE_VALUE"] = scaleScore;
          score["TEST_SCALED_SCORE"] = scaleScore;

          return score;
        }
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

        return assessmentAdminKey;
    }

    function getTestNumber(testMetadata, tmn, grade) {
        let testNumber = '';
        let testCode = '';
        if (tmn) {
            if (tmn.indexOf('Reading') !== -1) {
                testCode = 'G_' + grade + '_READ';
            } else if (tmn.indexOf('Read') !== -1) {
                 testCode = 'G_' + grade + '_READ';
            } else if (tmn.indexOf('Writing') !== -1) {
                testCode = 'G_' + grade + '_WRIT';
            } else if (tmn.indexOf('Hist/Soc') !== -1) {
                testCode = 'G_' + grade + '_HIST';
            } else if (tmn.indexOf('Science') !== -1) {
                testCode = 'G_' + grade + '_SCI';
            } else if (tmn.indexOf('Mathematics') !== -1) {
                testCode = 'G_' + grade + '_MATH';
            } else if (tmn.indexOf('Math') !== -1) {
                testCode = 'G_' + grade + '_MATH';
            }
        }
        testNumber = testMetadata.TEST + '_' + testCode;
        return testNumber;
    }


    function getDateString(row, hierarchy) {
        let dateString = null;
        var hierarchyPeriod = "${hierarchy.REPORTING_PERIOD}";

        var testDay = _util.coalesce(row.getField("TEST_DAY"), null);
        var testMonth = _util.coalesce(row.getField("TEST_MONTH"), null);
        var testYear = _util.coalesce(row.getField("TEST_YEAR"),null);
        var adminYear = _util.coalesce(row.getField("TEST_ADMINISTRATION_YEAR"), null);

        if(testYear !==null && testDay !== "00" && testDay !== "0" && testDay !== null){
            testMonth = ("0" + testMonth).slice(-2);
            testDay = ("0" + testDay).slice(-2);
            dateString =  AppUtil.getDateObjByPattern(testMonth + '/' + testDay + '/' + testYear, "MM/dd/yyyy").STANDARD_DATE;
        }
        else{
            if(adminYear === null){
                adminYear = "${hierarchy.SCHOOL_YEAR.substring(5)}"
            }
            if(hierarchyPeriod === "FALL"){
                month = "09";
                day = "15";
                dateString = AppUtil.getDateObjByPattern(month + '/' + day + '/' + adminYear, "MM/dd/yyyy").STANDARD_DATE;
            }
            else if(hierarchyPeriod === "SPRING"){
                month = "05";
                day = "15";
                dateString = AppUtil.getDateObjByPattern(month + '/' + day + '/' + adminYear, "MM/dd/yyyy").STANDARD_DATE;
            }
            else if(hierarchyPeriod === "WINTER"){
                month = "01";
                day = "15";
                dateString = AppUtil.getDateObjByPattern(month + '/' + day + '/' + adminYear, "MM/dd/yyyy").STANDARD_DATE;
            }
            else{
                month = "05";
                day = "15";
                dateString = AppUtil.getDateObjByPattern(month + '/' + day + '/' + adminYear, "MM/dd/yyyy").STANDARD_DATE;
            }
        }
        return dateString;
    }

    function getAdminPeriod(row,hierarchy){
        var testAdminPeriod = null;
        var testMonth = row.getField("TEST_MONTH");
        var month = ("0" + testMonth).slice(-2);
            if (month === "07" || month === "08" || month === "09" || month === "10" || month === "11")
                testAdminPeriod = "FALL";
            else if (month === "12" || month === "01" || month === "02" || month === "03")
                testAdminPeriod = "WINTER";
            else if (month === "04" || month === "05" || month === "06")
                testAdminPeriod = "SPRING";
            else {
            testAdminPeriod = "${hierarchy.REPORTING_PERIOD}";
            }
        return testAdminPeriod;
    }

    return module;
}());