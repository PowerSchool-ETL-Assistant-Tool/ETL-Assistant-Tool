var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ROME_WTW";
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
						// Move debug print after adding to output
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

     //Update scoresToMap for WTW assessment formats with periods (Fall/Spring)
    var scoresToMap = [
        // WTW Kindergarten scores - Fall period
        {TEST: "WTW", CODE: "BP",  FIELD: "BEGINNING_PHONEMES", MAP_FUNCTION: mapRawScore},
        {TEST: "WTW", CODE: "MP",  FIELD: "MIDDLE_PHONEMES", MAP_FUNCTION: mapRawScore},
        {TEST: "WTW", CODE: "EP",  FIELD: "ENDING_PHONEMES", MAP_FUNCTION: mapRawScore},
        {TEST: "WTW", CODE: "TPA",  FIELD: "TOTAL_PHONETICALLY_ACCEPTABLE", MAP_FUNCTION: mapTotalPoints},

        // WTW Primary, Elementary, Upper scores - Fall period
       {TEST: "WTW", CODE: "WSC", FIELD: "WORDS_SPELLED_CORRECTLY", MAP_FUNCTION: mapRawScore},
       {TEST: "WTW", CODE: "FP", FIELD: "FEATURE_POINTS", MAP_FUNCTION: mapRawScore},
       {TEST: "WTW", CODE: "TP", FIELD: "TOTAL_POINTS", MAP_FUNCTION: mapTotalPoints},
       //{TEST: "WTW", CODE: "SS", FIELD: "SPELLING_STAGE", MAP_FUNCTION: mapSpellingStage},
       //{TEST: "WTW", CODE: "PRO", FIELD: "PROFICIENCY_LEVEL", MAP_FUNCTION: mapProficiencyLevel},
   ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeDecode = {
            "1": "1",
            "01": "1",
            "Grade 1": "1",
            "2": "2",
            "02": "2",
            "Grade 2": "2",
            "3": "3",
            "03": "3",
            "Grade 3": "3",
            "4": "4",
            "04": "4",
            "Grade 4": "4",
            "5": "5",
            "05": "5",
            "Grade 5": "5",
            "6": "6",
            "06": "6",
            "Grade 6": "6",
            "7": "7",
            "07": "7",
            "Grade 7": "7",
            "8": "8",
            "08": "8",
            "Grade 8": "8",
            "9": "9",
            "09": "9",
            "Grade 9": "9",
            "10": "10",
            "Grade 10": "10",
            "11": "11",
            "Grade 11": "11",
            "12": "12",
            "Grade 12": "12",
            "KG": "KG",
            "KGJ": "KG",
            "KGM": "KG",
            "KN": "KG",
            "K": "KG",
            "Kindergarten": "KG",
            "0": "0",
            "PK": "0",
            "-1": "EC2"
            ,"" : null
            ,null : null
        };

    var proficiencyDecode = {
        "1": "Emerging",
        "Emerging": "Emerging",
        "2": "Developing",
        "Developing": "Developing",
        "3": "Achieving",
        "Achieving": "Achieving",
        "4": "Exceeding",
        "Exceeding": "Exceeding",
        "": null,
        null: null
    };

    var passDecode = {
        "1": "No",
        "Emerging": "No",
        "2": "No",
        "Developing": "No",
        "3": "Yes",
        "Achieving": "Yes",
        "4": "Yes",
        "Exceeding": "Yes",
        "": null,
        null: null
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));            }
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

    function testAdminDate(date) {
        var testDateString = date;
        if(testDateString !== null && testDateString !== undefined){
            var testDateArray = testDateString.toString().split("/");
            testDateString = testDateArray[0]+"/15/"+testDateArray[1];
        }
        return testDateString;
    }
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
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "MM/dd/yyyy");
        var testDateString = testAdminDate(row.getField("TEST_DATE"));

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
                    reporting_period = _util.coalesce(row.getField("REPORTING_PERIOD"),hierarchy.REPORTING_PERIOD);
                    if(reporting_period) {
                        record.REPORTING_PERIOD = reporting_period.toUpperCase()
                    }
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //TEST_ADMIN_DATE must always finish/print as MM/dd/YYYY format
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDateString
                    break;
                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
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
                    record.STUDENT_GENDER_CODE = null;
                    break;
                case "STUDENT_GRADE_CODE":
                    var grade = gradeDecode[row.getField('GRADE')];
                    // grade should be padded with leading zeroes if it is a number
                    if (grade && !isNaN(parseInt(grade))) {
                        grade = ("00" + grade).slice(-2);
                    }
                    record.STUDENT_GRADE_CODE = grade;
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_ID"));
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

        admin.TEST_INTERVENTION_DESC = row.getField("HOME_ROOM");
        admin.TEST_INTERVENTION_CODE = "HOME ROOM";

        return admin;
    }

    function getAssessmentLevel(row) {
        var assessment_level = row.getField("ASSESSMENT_LEVEL");
        if (assessment_level === null || assessment_level === undefined || _util.trim(assessment_level) === "") {
            return null;
        }
        assessment_level = assessment_level.toUpperCase();
        switch(assessment_level) {
            case "PRIMARY":
                return 'PR';
            case "ELEMENTARY":
                return 'EL';
            case "UPPER":
                return 'UP';
            case "KINDERGARTEN":
                return 'KG';
        }
        return null;
    }

    function generateTestNumber(testMetadata, row) {
        // EXPECTED FORMAT: WTW_BP_KG, WTW_PRO_PR_01
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;

        var assessment_level_code = getAssessmentLevel(row);
        if (assessment_level_code) {
            testNumber = testNumber + "_" + assessment_level_code;
        }

        var grade = row.getField('GRADE');
        var decodedGrade = gradeDecode[grade] || null;
        if (decodedGrade) {
            testNumber = testNumber + "_" + decodedGrade;
        }

        //OUTPUT: WTW_BP_01, WTW_PRO_01
        return testNumber;
    }

    function mapRawScore(row, testMetadata) {
        var score = {};

        var assessment_level = getAssessmentLevel(row);
        if(assessment_level === null || assessment_level === undefined || _util.trim(assessment_level) === "") {
            return null;
        }

        // Check for key fields and do not map score and exit if conditions met.
        var rawScore = row.getField(testMetadata.FIELD);
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }

        var testNumber = generateTestNumber(testMetadata, row);
        
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        // Convert rawScore to a number if possible before checking isNaN
        var numericScore = parseFloat(rawScore);
        if(!isNaN(numericScore)){
            score["TEST_SCALED_SCORE"] = numericScore;
        } else {
            score["TEST_SCORE_TEXT"] = rawScore;
        }

        return score;
    }

    function getProficiencyLevel(row) {
        var proficiency = {
            'LEVEL': null,
            'CODE': null
        }
        var proficiencyLevel = row.getField("PROFICIENCY_LEVEL");
        if(proficiencyLevel === null || proficiencyLevel === undefined || _util.trim(proficiencyLevel) === "") {
            return null;
        }

        proficiency['LEVEL'] = (proficiencyDecode[proficiencyLevel]) || null;
        var proficiencyLevelString = proficiency['LEVEL'].toUpperCase();

        switch(proficiencyLevelString) {
            case "EMERGING":
                proficiency['CODE'] = '1';
                break;
            case "DEVELOPING":
                proficiency['CODE'] = '2';
                break;
            case "ACHIEVING":
                proficiency['CODE'] = '3';
                break;
            case "EXCEEDING":
                proficiency['CODE'] = '4';
                break;
        }

        return proficiency;
    }

    function mapTotalPoints(row, testMetadata) {
        var score = {};

        var assessment_level = getAssessmentLevel(row)
        if(assessment_level === null || assessment_level === undefined || _util.trim(assessment_level) === "") {
            return null;
        }
        // Check for key fields and do not map score and exit if conditions met.
        var totalPoints = row.getField(testMetadata.FIELD);
        if(totalPoints === null || totalPoints === undefined || _util.trim(totalPoints) === "") {
            return null;
        }

        var testNumber = generateTestNumber(testMetadata, row);

        var spellingStage = row.getField("SPELLING_STAGE");

        // Set score fields - combine total points with spelling stage
        var combinedScore = totalPoints
        if(spellingStage) {
            combinedScore = combinedScore + " - " + spellingStage;
        }
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = combinedScore;
        
        // Convert totalPoints to a number if possible
        var numericScore = parseFloat(totalPoints);
        if(!isNaN(numericScore)){
            score["TEST_SCALED_SCORE"] = numericScore;
        }

        // Set performance level information based on proficiency level
        // Map performance level using the decode tables
        var proficiencyData = getProficiencyLevel(row);
        if(proficiencyData && proficiencyData['LEVEL'] && proficiencyData['CODE']) {
            score["TEST_PRIMARY_RESULT"] = proficiencyData['LEVEL'];
            score["TEST_PRIMARY_RESULT_CODE"] = proficiencyData['CODE'];
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
            if(key === "TEST_DATE") {
                var testDate = testAdminDate(_util.coalesce(srcRecord.getField(key),""))
                assessmentAdminKey = assessmentAdminKey + "_" + testDate
            } else {
                assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
            }
        });

        // Add administration period (Fall/Spring) to the key
        var adminPeriod = _util.coalesce(srcRecord.getField("REPORTING_PERIOD"), "");
        if (adminPeriod && adminPeriod !== "") {
            assessmentAdminKey = assessmentAdminKey + "_" + adminPeriod.toUpperCase();
        }

        return assessmentAdminKey;
    }

    return module;
}());