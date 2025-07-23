var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NYSAA";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;
    var connectorName  = 'state.ny.NYSAA';

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

     /** This will come from -> src/main/resource/scores/mapping.json
    var scoresToMap = [
        {TEST: "ASR", CODE:"ELA_OVR", FIELD: "LANGUAGE_ARTS_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ASR", CODE:"MATH_OVR", FIELD: "MATHEMATICS_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "ASR", CODE:"SCI_OVR", FIELD: "SCIENCE_", MAP_FUNCTION: mapScaledScore}
    ];
    */

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
       "Level 4" : "Yes"
       ,"Level 3" : "Yes"
       ,"Level 2" : "No"
       ,"Level 1" : "No"
       ,"" : null
       ,null : null
    };

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

        var data = AppUtil.getStandardMappingScoreFields();

        var scores = JSON.stringify(data.SUBJECT_LIST);

        var connectorNameObj = connectorName.split('.')[2];

        var SUBJECT = JSON.parse(scores);

        var decodeGradeKey = Object.keys(data.decodeConnection)[0];
        var decodeGrade = data.decodeConnection[decodeGradeKey];

        var gradeDecode = JSON.parse(JSON.stringify(data.DECODE_LIST[0][decodeGrade]));

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, data.DATE_LIST, gradeDecode, decodeGradeKey);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        SUBJECT.forEach(function(testMetadata) {
            try {
                var score = mapScaledScore(row , testMetadata, connectorNameObj);

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
    function mapNormalizedAdminFields(signature, hierarchy, row, patternList, gradeDecode, decodeGradeKey) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = mapDateLogics(row.getField("STUDENT_BIRTHDATE"), hierarchy, row, patternList);
        var testDateObject = mapDateLogics(row.getField("TEST_ADMIN_DATE"), hierarchy, row, patternList);

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
                    record.REPORTING_PERIOD = _util.coalesce( getTestAdminPeriod(testDateObject.STANDARD_DATE, row, hierarchy));
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce( getTestAdminDate(testDateObject.STANDARD_DATE, row, hierarchy));
                    break;

                //Student Information
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("STUDENT_GENDER_CODE")+"-").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField(decodeGradeKey)];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), "DISTRICT");
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

     function mapScaledScore(row, testMetadata, connectorNameObj) {
        const score = {};
        const subject = testMetadata;
        const shortenedSubject = subject.split('_').map(word => word.substring(0, 4)).join('_');
        const testNumber = connectorNameObj + "_" + shortenedSubject;
        const scaleScore = row.getField(testMetadata + "_TEST_SCALED_SCORE");

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
            score["TEST_PRIMARY_RESULT_CODE"] = scaleScore;
        }
        if(scaleScore === 999 || scaleScore === "999") {
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = null;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = null;
                score["TEST_SCALED_SCORE"] = null;
                score["TEST_RAW_SCORE"] = null;
            }
            score["TEST_PASSED_INDICATOR"] = null;
            score["TEST_PRIMARY_RESULT"] = "Medically Excused";
            score["TEST_PRIMARY_RESULT_CODE"] = "MedEx";
        }
        score["TEST_RAW_SCORE"] = isNaN(row.getField(testMetadata + "_TEST_RAW_SCORE")) ? null : row.getField(testMetadata + "_TEST_RAW_SCORE");
        score["TEST_PASSED_INDICATOR"] = passDecode[row.getField(testMetadata + "_TEST_PRIMARY_RESULT").replace("NYSAA-", "")];
        score["TEST_CUSTOM_PASS_IND"] = row.getField(testMetadata + "_TEST_CUSTOM_PASS_IND");
        score["TEST_PRIMARY_RESULT"] = row.getField(testMetadata + "_TEST_PRIMARY_RESULT").replace("NYSAA-", "");
        score["TEST_SECONDARY_RESULT_CODE"] = row.getField(testMetadata + "_TEST_SECONDARY_RESULT");
        score["TEST_SECONDARY_RESULT"] = row.getField(testMetadata + "_TEST_SECONDARY_RESULT");
        score["TEST_TERTIARY_RESULT_CODE"] = row.getField(testMetadata + "_TEST_TERTIARY_RESULT_CODE");
        score["TEST_TERTIARY_RESULT"] = row.getField(testMetadata + "_TEST_TERTIARY_RESULT");
        score["TEST_QUATERNARY_RESULT_CODE"] = row.getField(testMetadata + "_TEST_QUATERNARY_RESULT_CODE");
        score["TEST_QUATERNARY_RESULT"] = row.getField(testMetadata + "_TEST_QUATERNARY_RESULT");
        score["TEST_CUSTOM_RESULT_CODE"] = row.getField(testMetadata + "_TEST_CUSTOM_RESULT_CODE");
        score["TEST_CUSTOM_RESULT"] = row.getField(testMetadata + "_TEST_CUSTOM_RESULT_CODE");
        score["TEST_SCORE_TO_PREDICTED_RESULT"] = row.getField(testMetadata + "_TEST_SCORE_TO_PREDICTED_RESULT");
        score["TEST_ITEMS_POSSIBLE"] = isNaN(row.getField(testMetadata + "_TEST_ITEMS_POSSIBLE")) ? null : row.getField(testMetadata + "_TEST_ITEMS_POSSIBLE");
        score["TEST_ITEMS_ATTEMPTED"] = isNaN(row.getField(testMetadata + "_TEST_ITEMS_ATTEMPTED")) ? null : row.getField(testMetadata + "_TEST_ITEMS_ATTEMPTED");
        score["TEST_PREDICTED_SCORE"] = isNaN(row.getField(testMetadata + "_TEST_PREDICTED_SCORE")) ? null : row.getField(testMetadata + "_TEST_PREDICTED_SCORE");
        score["TEST_LOWER_BOUND"] = isNaN(row.getField(testMetadata + "_TEST_LOWER_BOUND")) ? null : row.getField(testMetadata + "_TEST_LOWER_BOUND");
        score["TEST_UPPER_BOUND"] = isNaN(row.getField(testMetadata + "_TEST_UPPER_BOUND")) ? null : row.getField(testMetadata + "_TEST_UPPER_BOUND");
        score["TEST_NCE_SCORE"] = isNaN(row.getField(testMetadata + "_TEST_NCE_SCORE")) ? null : row.getField(testMetadata + "_TEST_NCE_SCORE");
        score["TEST_PERCENTAGE_SCORE"] = isNaN(row.getField(testMetadata + "_TEST_PERCENTAGE_SCORE")) ? null : row.getField(testMetadata + "_TEST_PERCENTAGE_SCORE");
        score["TEST_PERCENTILE_SCORE"] = isNaN(row.getField(testMetadata + "_TEST_PERCENTILE_SCORE")) ? null : row.getField(testMetadata + "_TEST_PERCENTILE_SCORE");
        score["TEST_GRADE_EQUIVALENT"] = row.getField(testMetadata + "_TEST_GRADE_EQUIVALENT");
        score["TEST_READING_LEVEL"] = row.getField(testMetadata + "_TEST_READING_LEVEL");
        score["TEST_SCHOOL_ABILITY_INDEX"] = isNaN(row.getField(testMetadata + "_TEST_SCHOOL_ABILITY_INDEX")) ? null : row.getField(testMetadata + "_TEST_SCHOOL_ABILITY_INDEX");
        score["TEST_GROWTH_PERCENTILE"] = isNaN(row.getField(testMetadata + "_TEST_GROWTH_PERCENTILE")) ? null : row.getField(testMetadata + "_TEST_GROWTH_PERCENTILE");
        score["TEST_GROWTH_RESULT_CODE"] = row.getField(testMetadata + "_TEST_GROWTH_RESULT_CODE");
        score["TEST_GROWTH_RESULT"] = row.getField(testMetadata + "_TEST_GROWTH_RESULT");
        score["TEST_GROWTH_TARGET_1"] = isNaN(row.getField(testMetadata + "_TEST_GROWTH_TARGET_1")) ? null : row.getField(testMetadata + "_TEST_GROWTH_TARGET_1");
        score["TEST_GROWTH_TARGET_2"] = isNaN(row.getField(testMetadata + "_TEST_GROWTH_TARGET_2")) ? null : row.getField(testMetadata + "_TEST_GROWTH_TARGET_2");
        score["TEST_GROWTH_TARGET_3"] = isNaN(row.getField(testMetadata + "_TEST_GROWTH_TARGET_3")) ? null : row.getField(testMetadata + "_TEST_GROWTH_TARGET_3");
        score["TEST_GROWTH_TARGET_4"] = isNaN(row.getField(testMetadata + "_TEST_GROWTH_TARGET_4")) ? null : row.getField(testMetadata + "_TEST_GROWTH_TARGET_4");
        score["TEST_GROWTH_TARGET_5"] = isNaN(row.getField(testMetadata + "_TEST_GROWTH_TARGET_5")) ? null : row.getField(testMetadata + "_TEST_GROWTH_TARGET_5");
        score["TEST_GROWTH_TARGET_6"] = isNaN(row.getField(testMetadata + "_TEST_GROWTH_TARGET_6")) ? null : row.getField(testMetadata + "_TEST_GROWTH_TARGET_6");
        score["TEST_STANDARD_ERROR"] = isNaN(row.getField(testMetadata + "_TEST_STANDARD_ERROR")) ? null : row.getField(testMetadata + "_TEST_STANDARD_ERROR");
        score["TEST_Z_SCORE"] = isNaN(row.getField(testMetadata + "_TEST_Z_SCORE")) ? null : row.getField(testMetadata + "_TEST_Z_SCORE");
        score["TEST_T_SCORE"] = isNaN(row.getField(testMetadata + "_TEST_T_SCORE")) ? null : row.getField(testMetadata + "_TEST_T_SCORE");
        score["TEST_STANINE_SCORE"] = isNaN(row.getField(testMetadata + "_TEST_STANINE_SCORE")) ? null : row.getField(testMetadata + "_TEST_STANINE_SCORE");
        score["TEST_QUARTILE_SCORE"] = row.getField(testMetadata + "_TEST_QUARTILE_SCORE");
        score["TEST_DECILE_SCORE"] = row.getField(testMetadata + "_TEST_DECILE_SCORE");
        score["TEST_SCORE_ATTRIBUTES"] = row.getField(testMetadata + "_TEST_SCORE_ATTRIBUTES");

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

        return assessmentAdminKey;
    }

    function getTestAdminPeriod(testDate, row, hierarchy) {
        var adminPeriod = null;
        if (testDate) {
            //if test Date available
            var month = testDate.substring(0,2);
            if( month === "08" || month === "09" || month === "10" || month === "11"){
                adminPeriod = "FALL";
            }
            else if(month === "12" || month === "01" || month === "02" || month === "03") {
                adminPeriod = "WINTER";
            }
            else if(month === "04" || month === "05" || month === "06" || month === "07") {
                adminPeriod = "SPRING";
            }
        } else if (testDate === null || testDate === undefined) {
            adminPeriod = hierarchy.REPORTING_PERIOD;
        }
        return adminPeriod;
     }


     function getTestAdminDate(testDate, row, hierarchy) {
        var adminDate = null;
        if (testDate) {
            adminDate = testDate;
        } else {
            var period = getTestAdminPeriod(testDate, row, hierarchy);
            if(period === 'FALL'){
                adminDate = "09/15/"+hierarchy.SCHOOL_YEAR.substring(0, 4);
            }else if(period === 'WINTER'){
                adminDate = "01/15/"+hierarchy.SCHOOL_YEAR.substring(5);
            } else if(period === 'SPRING'){
                adminDate = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5);
            }else {
                adminDate = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5);
            }
        }
        return adminDate;
     }

    function mapDateLogics(dateStr, hierarchy, row, patterns) {
        var date = {RAW_DATE:null,MONTH:null,DAY:null,YEAR:null,STANDARD_DATE:null};
        if (dateStr) {
            for (let index = 0; index < patterns.length; index++) {
                date = module.mapDateObject(hierarchy, row, dateStr, patterns[index]);
                if (date && date.STANDARD_DATE !== null) break;
            }
        }
        if (date === null) {
           testDateObject = AppUtil.getEmptyDateObj(dateStr);
           AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing date string:" +dateStr, JSON.stringify(row.getSourceRow())));
        }
        return date;
    }

    module.mapDateObject = function(hierarchy, row, dateStr, pattern) {
        var testDateObject = {RAW_DATE:null,MONTH:null,DAY:null,YEAR:null,STANDARD_DATE:null};
        try {
           testDateObject = AppUtil.getDateObjByPattern(dateStr, pattern);
        } catch (exception) {
              // Error will be reported in final check.
        }
        return testDateObject;
     }

    return module;
}());