var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "TSIA";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
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
			print(`\nLoading using signature file ${signatureFormatName}\n`);


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
        {TEST: "TSIA", CODE: "RD", FIELD: "TSI_READING_PLACEMENT", MAP_FUNCTION: mapScores},
        {TEST: "TSIA", CODE: "MA", FIELD: "TSI_MATHEMATICS_PLACEMENT", MAP_FUNCTION: mapScores},
        {TEST: "TSIA", CODE: "WR", FIELD: "TSI_WRITING_PLACEMENT", MAP_FUNCTION: mapScores},
        {TEST: "TSIA2", CODE: "ELAR", FIELD: "TSIA2_ELAR_CRC", MAP_FUNCTION: mapScores},
        {TEST: "TSIA2", CODE: "MATH", FIELD: "TSIA2_MATH_CRC", MAP_FUNCTION: mapScores},
        {TEST: "TSIA2", CODE: "MATH_QR", FIELD: "QUANTITATIVE_REASONING", MAP_FUNCTION: mapStrandScores},
        {TEST: "TSIA2", CODE: "MATH_AR", FIELD: "ALGEBRAIC_REASONING", MAP_FUNCTION: mapStrandScores},
        {TEST: "TSIA2", CODE: "MATH_GSR", FIELD: "GEOMETRIC_AND_SPATIAL_REASONING", MAP_FUNCTION: mapStrandScores},
        {TEST: "TSIA2", CODE: "MATH_PSR", FIELD: "PROBABILISTIC_AND_STATISTICAL_REASONING", MAP_FUNCTION: mapStrandScores},
        {TEST: "TSIA2", CODE: "ELAR_TSA", FIELD: "TEXT_ANALYSIS_AND_SYNTHESIS", MAP_FUNCTION: mapStrandScores},
        {TEST: "TSIA2", CODE: "ELAR_CREC", FIELD: "CONTENT_REVISION_AND_EDITING_FOR_CONVENTIONS", MAP_FUNCTION: mapStrandScores},
        // ABE English Scores
        {TEST: "TSIA", CODE: "ELA_WOC", FIELD: "ABE_DIAGNOSTICS_WRITING_ORGANIZING_AND_COMPOSING", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_WD", FIELD: "ABE_WRITING_DIAGNOSTICS", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_WGS", FIELD: "ABE_DIAGNOSTICS_WRITING_GRAMMAR_AND_STRUCTURE", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_SS", FIELD: "SENTENCE_STRUCTURE", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_AGR", FIELD: "AGREEMENT", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_SL", FIELD: "SENTENCE_LOGIC", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_ER", FIELD: "ESSAY_REVISION", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_RDI", FIELD: "ABE_READING_DIAGNOSTICS", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_RVM", FIELD: "ABE_DIAGNOSTICS_READING_VOCABULARY_AND_MEANING", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_RC", FIELD: "ABE_DIAGNOSTICS_READING_COMPREHENSION", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_SD", FIELD: "MAIN_IDEA_AND_SUPPORTING_DETAILS", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_UL", FIELD: "AUTHORS_USE_OF_LANGUAGE", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_TT", FIELD: "INFERENCES_IN_A_TEXT_OR_TEXTS", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "ELA_LA", FIELD: "LITERARY_ANALYSIS", MAP_FUNCTION: mapABEStrandScores},
        // ABE Maths Score
        {TEST: "TSIA", CODE: "MATH_MNS", FIELD: "ABE_DIAGNOSTICS_MATH_NUMBER_SENSE", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "MATH_FA", FIELD: "ABE_DIAGNOSTICS_MATH_PATTERNS_FUNCTIONS_AND_ALGEBRA", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "MATH_MSP", FIELD: "ABE_DIAGNOSTICS_MATH_STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "MATH_MGM", FIELD: "ABE_DIAGNOSTICS_MATH_GEOMETRY_AND_MEASUREMENT", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "MATH_MD", FIELD: "ABE_MATHEMATICS_DIAGNOSTICS", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "MATH_EAF", FIELD: "ELEMENTARY_ALGEBRA_AND_FUNCTIONS", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "MATH_IAF", FIELD: "INTERMEDIATE_ALGEBRA_AND_FUNCTIONS", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "MATH_GM", FIELD: "GEOMETRY_AND_MEASUREMENT", MAP_FUNCTION: mapABEStrandScores},
        {TEST: "TSIA", CODE: "MATH_SP", FIELD: "DATA_ANALYSIS_STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapABEStrandScores}

    ];
    // code for reading RD, math MA, writing WR
    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var collegeReadinessDecodes = {
        "N": "Not College Ready",
        "No": "Not College Ready",
        "Y": "College Ready",
        "Yes": "College Ready"
    };

    var GradeDecode = {
        "1st": "01",
        "1": "01",
        "01": "01",
        "2nd": "02",
        "2": "02",
        "02": "02",
        "3rd": "03",
        "3": "03",
        "03": "03",
        "4th": "04",
        "4": "04",
        "04": "04",
        "5th": "05",
        "5": "05",
        "05": "05",
        "6th": "06",
        "6": "06",
        "06": "06",
        "7th": "07",
        "7": "07",
        "07": "07",
        "8th": "08",
        "8": "08",
        "08": "08",
        "I am not yet in high school.": "--",
        "9th": "09",
        "9": "09",
        "09": "09",
        "10th": "10",
        "10": "10",
        "11th": "11",
        "11": "11",
        "12th": "12",
        "12": "12"

    };

    var strandDecodes = {
        "1" : "Basic",
        "2" : "Proficient",
        "3" : "Advanced",
        "--" : "--"
    };
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function passingScore(code, score) {
        if (code === 'RD') {
            if (score >= 351) {
                return "Yes";
            }
            else if (score < 351) {
                return "No";
            }
        }

        if (code === 'MA') {
            if (score >= 350) {
                return "Yes";
            }
            else if (score < 350) {
                return "No";
            }
        }

        return null;
    }

    function passingWritingScore(code, wrScore, wpScore) {
        if (code === 'WR') {
            if (wrScore >= 340 && wpScore >= 4) {
                return 'Yes';
            }
            else {
                return 'No';
            }
        }

        return null;
    }

    function passingTsia2Score(code, Score, diagnostic, wpField) {
        if (code === 'MATH') {
            if (Score >= '950' && Score <= '990') {
                return 'Yes';
            }else if (Score <'950' && diagnostic === '6'){
                return 'Yes'
            }
            else {
                return 'No';
            }
        }

        if (code === 'ELAR') {
            if (Score >= '945' && Score <= '990' && wpField >= '5') {
                return 'Yes';
            }else if (Score < '945' && diagnostic >='5' && wpField >='5'){
                return 'Yes'
            }
            else {
                return 'No';
            }
        }
        return null;
    }


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

        // Map score fields for each expected score mapping
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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        if(row.getField("BIRTH_DATE")!==null && row.getField("BIRTH_DATE") !== undefined) {
            if(row.getField("BIRTH_DATE").toString().indexOf("-")>-1){
                var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "MM-dd-yyyy");
            }
            else {
                var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "MM/dd/yyyy");
            }
        }
        else{
            var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "MM-dd-yyyy");
        }

        var fileTestDate = AppUtil.getDateObjByPattern(_util.coalesce(row.getField("TEST_END"),row.getField("TEST_START")), "M/dd/yyyy").STANDARD_DATE;

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
                    record.TEST_ADMIN_DATE = _util.coalesce(fileTestDate, '09/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4));
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
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SITE_ID"), row.getField("SITE_NAME"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SITE_ID"), row.getField("SCHOOL_ID"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"));
                     break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("SUPPLEMENTAL_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("SUPPLEMENTAL_STUDENT_ID");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("LAST_NAME");
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME = row.getField("MIDDLE_INITIAL");
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = row.getField("ADDRESS");
                    break;
                case "STUDENT_CITY":
                    record.STUDENT_CITY = row.getField("CITY");
                    break;
                case "STUDENT_STATE_ID" :
                    record.STUDENT_STATE_ID = row.getField("SUPPLEMENTAL_STUDENT_ID");
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = GradeDecode[row.getField("STUDENT_GRADE_CODE")];
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
    function mapScores(row, testMetadata) {
        var testScoreElement = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var score = row.getField(testMetadata.FIELD);
        var wpField = _util.trim(row.getField("TSI_WRITEPLACER"));
        var passingIndicator;
        var diagnostic = _util.coalesce(row.getField("TSIA2_"+testMetadata.CODE+"_DIAGNOSTIC"));
        var StandardError = row.getField("CSEM_" + testMetadata.FIELD);

        if(_util.trim(score) === null || _util.trim(score) === "") {
            return null;
        }

        if (testMetadata.CODE === 'WR') {
            passingIndicator = passingWritingScore(testMetadata.CODE, score, wpField);
        }else if (testMetadata.CODE === 'ELAR' || testMetadata.CODE === 'MATH'){
            passingIndicator = passingTsia2Score(testMetadata.CODE, score, diagnostic, wpField);
        }
        else {
            passingIndicator = passingScore(testMetadata.CODE, score);
        }

        testScoreElement["TEST_NUMBER"] = testNumber;
        if(!isNaN(score)){
            testScoreElement["TEST_SCORE_VALUE"] = score;
            testScoreElement["TEST_SCORE_TEXT"] = score;
            testScoreElement["TEST_RAW_SCORE"] = score;
        }
        testScoreElement["TEST_PASSED_INDICATOR"] = passingIndicator;
        testScoreElement["TEST_PRIMARY_RESULT_CODE"] = passingIndicator;
        testScoreElement["TEST_STANDARD_ERROR"] = StandardError;
        testScoreElement["TEST_PRIMARY_RESULT"] = collegeReadinessDecodes[passingIndicator] === undefined ? null : collegeReadinessDecodes[passingIndicator];
        testScoreElement["TEST_SECONDARY_RESULT"] = _util.coalesce(diagnostic,"--");
        if(testMetadata.CODE === 'WR' || testMetadata.CODE === 'ELAR'){
            testScoreElement["TEST_TERTIARY_RESULT"] = _util.coalesce(wpField,null)
        }

        return testScoreElement;
    }

    function mapStrandScores(row,testMetadata){
        var testScoreElement = {};
        var testNumber = testMetadata.TEST+testMetadata.CODE;
        var diagnosticTest = _util.trim(row.getField(testMetadata.FIELD));

        if(diagnosticTest === null || diagnosticTest === undefined || diagnosticTest === ""){
            return null;
        }

        testScoreElement["TEST_NUMBER"] = testNumber;
        testScoreElement["TEST_PRIMARY_RESULT_CODE"] = diagnosticTest.substring(0,1);
        testScoreElement["TEST_PRIMARY_RESULT"] = strandDecodes[diagnosticTest.substring(0,1)] === undefined ? null : strandDecodes[diagnosticTest.substring(0,1)];
        return testScoreElement;
    }


    function mapABEStrandScores(row,testMetadata){
            var testScoreElement = {};
            var testNumber = testMetadata.TEST+testMetadata.CODE;
            var ScaleScore = row.getField(testMetadata.FIELD);
            var StandardError = _util.trim(row.getField("CSEM_" + testMetadata.FIELD));

            if(ScaleScore === null || ScaleScore === undefined || ScaleScore === ""){
                return null;
            }
            testScoreElement["TEST_NUMBER"] = testNumber;
            if(!isNaN(ScaleScore)){
                testScoreElement["TEST_SCALED_SCORE"] = ScaleScore;
                testScoreElement["TEST_SCORE_VALUE"] = ScaleScore;
                testScoreElement["TEST_SCORE_TEXT"] = ScaleScore;
            }

            testScoreElement["TEST_STANDARD_ERROR"] = StandardError;


            return testScoreElement;
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}`;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        var mathScore = _util.trim(srcRecord.getField("TSI_MATHEMATICS_PLACEMENT"));
        var readingScore =  _util.trim(srcRecord.getField("TSI_READING_PLACEMENT"));
        var writingScore =  _util.trim(srcRecord.getField("TSI_WRITING_PLACEMENT"));
        var elar =  _util.trim(srcRecord.getField("TSIA2_ELAR_CRC"));
        var math2 =  _util.trim(srcRecord.getField("TSIA2_MATH_CRC"));
        var subject = "";
        if((mathScore!== null)&&(!readingScore)&&(!writingScore)){
            subject = "MATH";
        }
        else if((!mathScore)&&(readingScore!==null)&&(!writingScore)){
            subject = "RD";
        }
        else if((!mathScore)&&(!readingScore)&&(writingScore!==null)){
            subject = "WR";
        }
        else if((mathScore!==null)&&(readingScore!==null)&&(!writingScore)){
            subject = "MATH_RD";
        }
        else if((mathScore!==null)&&(!readingScore)&&(writingScore!==null)){
            subject = "MATH_WR";
        }
        else if((!mathScore)&&(readingScore!==null)&&(writingScore!==null)){
            subject = "ELA";
        }
        else if((elar !== null)&& (!math2)){
            subject = "ELAR"
        }
        else if((math2 !== null)&&(!elar)){
            subject = "MATH2"
        }
        else if((math2 !== null)&&(elar !== null)){
            subject = "ELAR_MATH2"
        }
        else{
            subject = "ELA_MATH"
        }
        assessmentAdminKey = assessmentAdminKey +"_"+subject;

        return assessmentAdminKey;
    }

    return module;
}());