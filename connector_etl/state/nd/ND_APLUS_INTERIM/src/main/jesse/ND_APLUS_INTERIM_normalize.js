var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ND_APLUS_INTERIM";
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
			print(`Loading using signature file ${signatureFormatName}\n`);


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
        {TEST: "NDA", CODE:"GRADE", FIELD: "MEASURE", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "NDA", CODE:"FALL_WIN", FIELD: "FALLWIN", MAP_FUNCTION: mapPeriodScore}
        ,{TEST: "NDA", CODE:"WIN_SPR", FIELD: "WINSPR", MAP_FUNCTION: mapPeriodScore}
        ,{TEST: "NDA", CODE:"FALL_SPR", FIELD: "FALLSPR", MAP_FUNCTION: mapPeriodScore}
        ,{TEST: "NDA", FIELD: "THETA", MAP_FUNCTION: mapThetaScore}
        ,{TEST: "NDA",  FIELD: "OVR", MAP_FUNCTION: mapSubjectsScores}
        ,{TEST: "NDA",  FIELD: "CLAIM1",  MAP_FUNCTION: mapClaimScores}
        ,{TEST: "NDA",  FIELD: "CLAIM2",  MAP_FUNCTION: mapClaimScores}
        ,{TEST: "NDA",  FIELD: "CLAIM3",  MAP_FUNCTION: mapClaimScores}
        ,{TEST: "NDA",  FIELD: "CLAIM4",  MAP_FUNCTION: mapClaimScores}
        ,{TEST: "NDA",  FIELD: "CLAIM5",  MAP_FUNCTION: mapClaimScores}
        ,{TEST: "NDA",  FIELD: "CLAIM6",  MAP_FUNCTION: mapClaimScores}
        ,{TEST: "NDA",  FIELD: "CLAIM7",  MAP_FUNCTION: mapClaimScores}
        ,{TEST: "NDA",  FIELD: "CLAIM8",  MAP_FUNCTION: mapClaimScores}
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
        "Kindergarten": "KG",
        "PK": "PK",
        "Pre-K": "PK",
        "PRE-K": "PK",
        "" : null
       ,null : null
    };

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
       "Adv" : "Yes"
       ,"Advanced" : "Yes"
       ,"Bas" : "No"
       ,"Basic" : "No"
       ,"Bel" : "No"
       ,"Below Basic" : "No"
       ,"Pro" : "Yes"
       ,"Proficient" : "Yes"
       ,"" : null
       ,null : null
      };

    var decodeSubject = {
        "Auditory Vocabulary"                   : "AUDIT_VOC"
        ,"Concepts & Applications"              : "CONC_APP"
        ,"Correct Writing Sequences"            : "CORR_WR_SEQ"
        ,"Early Literacy"                       : "EAR_LIT"
        ,"Early Numeracy"                       : "EAR_NUM"
        ,"Initial Sounds"                       : "INIT_SO"
        ,"Letter Naming Fluency"                : "LET_NAM_FLU"
        ,"Letter Word Sounds Fluency"           : "LET_WOR_SO_FLU"
        ,"Math"                                 : "MATH"
        ,"Math Facts Fluency-1 Digit"           : "MAT_FAC_FLU1_DIG"
        ,"Math Facts Fluency-Tens"              : "MAT_FAC_FLU_TENS"
        ,"Mathematics Concepts & Applications"  : "MAT_CONC_APP"
        ,"Mental Computation Fluency"           : "MENT_COMP_FLU"
        ,"Nonsense Word Fluency"                : "NON_WOR_FLU"
        ,"Number Comparison Fluency-Pairs"      : "NUM_COMP_FLU_PAIR"
        ,"Number Comparison Fluency-Triads"     : "NUM_COMP_FLU_TRI"
        ,"Number Naming Fluency"                : "NUM_NAM_FLU"
        ,"Number Sense Fluency"                 : "NUM_SEN_FLU"
        ,"Oral Reading Fluency"                 : "ORAL_READ_FLU"
        ,"Phoneme Segmentation"                 : "PHON_SEG"
        ,"Quantity Difference Fluency"          : "QUAN_DIFF_FLU"
        ,"Quantity Total Fluency"               : "QUAN_TOT_FLU"
        ,"Reading"                              : "READ"
        ,"Reading Comprehension"                : "READ_COMP"
        ,"Reading Maze"                         : "READ_MAZ"
        ,"Silent Reading Fluency"               : "SIL_READ_FLU"
        ,"Total Words Written"                  : "TOT_WOR_WR"
        ,"Vocabulary"                           : "VOCA"
        ,"Word Reading Fluency"                 : "WOR_READ_FLU"
        ,"Words Spelled Correctly"              : "WOR_SPEL_COR"

    };

    var resultDecode = {
            "Level 1"  :   "1",
            "Level 2"  :   "2",
            "Level 3"   :  "3",
            "Level 4"   :  "4"
           ,"" : null
           ,null : null
    };
    var perfDecode = {
            "1"  : "Level 1",
            "2"  : "Level 2",
            "3"  : "Level 3",
            "4"  : "Level 4",
            "5"  : "Level 5",
           "" : null,
           null : null
    };
    var passDecode = {
           "1" : "No"
          ,"2" : "No"
          ,"3" : "Yes"
          ,"4" : "Yes"
          ,"5" : "Yes"
          ,"" : null
          ,null : null
    };

    function primary(natl) {
        if(natl >= 1 && natl <=10)
            return 'Level 1'
        else if(natl >= 11 && natl <=25)
            return 'Level 2'
        else if(natl >= 26 && natl <=39)
            return 'Level 3'
        else if(natl >= 40 && natl <=99)
            return 'Level 4'
        else
            return null;
    }
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function decodeAssessmentCode(subject, row){
        var assessmentCode = null;
        var subjectVal = decodeSubject[subject];
        //var levelVal = decodeLevel[level];

        if((subjectVal === null || subjectVal === undefined)&&subject!==null){
            print("Test decode not found: "+subject);
            //print(JSON.stringify(row));
            return assessmentCode;
        }
        assessmentCode = subjectVal;
        return assessmentCode;
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
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateObject = { RAW_DATE : null
                                           , MONTH : null
                                           , DAY : null
                                           , YEAR : null
                                           , STANDARD_DATE : null};
        if (row.getField("DOB") !== null) {
            birthDateObject = parseDate(row.getField("DOB"));
        }
        var newPeriod = row.getField("PERIOD");
        var period;

        if(newPeriod !== null && newPeriod !== undefined && newPeriod !== "N/A") {
            period = newPeriod;
        } else {
            period = hierarchy.REPORTING_PERIOD;
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
                    record.REPORTING_PERIOD = period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTestAdminDate(row, hierarchy.SCHOOL_YEAR);

                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_ID")
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
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
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

//        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
//            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
//        }
//        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }
    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata) {

        var score = {};
        //var testNumber = testMetadata.TEST + testMetadata.CODE;
        var type = row.getField("TYPE");
        if(type!= null){
        if(type.indexOf("Colors & Shapes") > -1){
            type = "C_S";
        }else if(type.indexOf("Objects") > -1){
            type = "OBJ";
        }else{
            type = type;
        }
        }
        if(row.getField("RELATED_FORM") !== null && row.getField("RELATED_FORM") !== undefined) {
           var testNumber = testMetadata.TEST + "_" + row.getField("RELATED_FORM") + "_" + type;
        } else {
           var testNumber = testMetadata.TEST + "_" + type;
        }
        var measureGrade = row.getField(testMetadata.FIELD + "_GRADE");
        var formCode = row.getField("FORM_CODE");
        var scaleScore = row.getField("SCORE");
        var rawScore = _util.trim(row.getField("VERTICAL_SCORE"));
        var standardError = _util.trim(row.getField("ERRORS"));
        var accuracy = removePercentageChar(row.getField("ACCURACY"));
        var lexile = row.getField("LEXILE");
        var quantile = removeStringChar(row.getField("QUANTILE"));
        var natl = _util.trim(row.getField("NATL"));
        var riskStatus = _util.trim(row.getField("RISK_STATUS"));

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }
        if(!isNaN(rawScore)){
            score["TEST_RAW_SCORE"] = rawScore;
        }
        score["TEST_PRIMARY_RESULT"] = primary(natl);
        score["TEST_PRIMARY_RESULT_CODE"] = resultDecode[primary(natl)];
        score["TEST_SECONDARY_RESULT"] = riskStatus;
        score["TEST_PERCENTILE_SCORE"] = natl;
    	score["TEST_PERCENTAGE_SCORE"] = accuracy;
    	score["TEST_TERTIARY_RESULT"] = formCode;
        if(!isNaN(standardError)){
    	    score["TEST_STANDARD_ERROR"] = standardError;
    	}
    	score["TEST_READING_LEVEL"] = lexile;
    	score["TEST_DECILE_SCORE"] = quantile;

        return score;
    }


    function mapPeriodScore(row, testMetadata) {

        var score = {};
        var type = row.getField("TYPE");
        if(type!= null){
        if(type.indexOf("Colors & Shapes") > -1){
            type = "C_S";
        }else if(type.indexOf("Objects") > -1){
            type = "OBJ";
        }else{
            type = type;
        }
        }
        //var testNumber = testMetadata.TEST + testMetadata.CODE;
       // var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
                if(row.getField("RELATED_FORM") !== null && row.getField("RELATED_FORM") !== undefined) {
                   var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + row.getField("RELATED_FORM") + "_" + type;
                } else {
                   var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + type;
                }
        var roi = _util.trim(row.getField(testMetadata.FIELD + "ROI"));
        var sgp = _util.trim(row.getField(testMetadata.FIELD + "SGP"));

    	if(roi === null || roi === undefined || _util.trim(roi) === "--" || _util.trim(roi) === "") {
            return null;
        }
        if(sgp === null || sgp === undefined || _util.trim(sgp) === "--" || _util.trim(sgp) === "") {
            return null;
        }

    	// Set score fields

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SECONDARY_RESULT"] = roi;
        score["TEST_GROWTH_PERCENTILE"] = sgp;
        return score;
    }

    function mapSubjectsScores(row, testMetadata) {
    var score = {};
    var subject = row.getField("SUBJECT");
    if(subject != null){
    if(subject.indexOf("ELA") > -1){
    var testNumber = testMetadata.TEST + "_ELA_" + testMetadata.FIELD;
    }else if(subject.indexOf("Math") > -1){
     testNumber = testMetadata.TEST + "_MATH_" + testMetadata.FIELD;
     }
     }
    var scaleScore = row.getField("TEST_SCORE");
    var rawScore = _util.trim(row.getField("RAW_SCORE"));
    var perfLevel = row.getField("PERFORMANCE_LEVEL");
    var lexQuartilScore = row.getField("LEXILE_QUANTILE_SCORE");
    var percentScore = row.getField("PERCENTCORRECTSCORE");

        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCALED_SCORE"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
        }
        if(!isNaN(rawScore)){
            score["TEST_RAW_SCORE"] = rawScore;
        }
        score["TEST_PRIMARY_RESULT"] = perfDecode[perfLevel];
        score["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
        score["TEST_READING_LEVEL"] = lexQuartilScore;
        score["TEST_PERCENTAGE_SCORE"] = percentScore;
        score["TEST_PASSED_INDICATOR"] = passDecode[perfLevel];
        return score;
    }

    function mapThetaScore(row, testMetadata){

    var score = {};
    var subject = row.getField("SUBJECT");
    if(subject !== null){
    if(subject.indexOf("ELA") > -1){
    var testNumber = testMetadata.TEST + "_ELA_" + testMetadata.FIELD;
    }else if(subject.indexOf("Math") > -1){
     testNumber = testMetadata.TEST + "_MATH_" + testMetadata.FIELD;
     }
     }
    var testThetaScoreScoring = row.getField("TESTTHETASCORESCORING");
    var testThetaSemScoring = row.getField("TESTTHETASEMSCORESCORING");
    var semScore = row.getField("TESTSEMSCORESCORING");

     if(testThetaScoreScoring === null || testThetaScoreScoring === undefined || _util.trim(testThetaScoreScoring) === "--" || _util.trim(testThetaScoreScoring) === "") {
                return null;
     }
     // Set score fields
    score["TEST_NUMBER"] = testNumber;
    score["TEST_STANDARD_ERROR"] = semScore;
    score["TEST_SCALED_SCORE"] = testThetaScoreScoring;
    score["TEST_SCORE_ATTRIBUTES"] = testThetaSemScoring;

        return score;

    }

    function mapClaimScores(row, testMetadata) {
        var score = {};
        var subject = row.getField("SUBJECT");
        if(subject !== null){
        if(subject.indexOf("ELA") > -1){
        var testNumber = testMetadata.TEST + "_ELA_" + testMetadata.FIELD;
        }else if(subject.indexOf("Math") > -1){
         testNumber = testMetadata.TEST + "_MATH_" + testMetadata.FIELD;
         }
         }
        var rawScore = _util.trim(row.getField("RAW_SCORE_" + testMetadata.FIELD));
        var percentScore = row.getField("PERCENT_SCORE_" + testMetadata.FIELD);
        var repCatScore = row.getField("REPCATPROFILESCORE_" + testMetadata.FIELD);
        var repCatUpperBound = row.getField("REPCATUPPERBOUND_" + testMetadata.FIELD);
        var reCatLowerBound = row.getField("REPCATLOWERBOUND_" + testMetadata.FIELD);

            if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;

            if(!isNaN(rawScore)){
                score["TEST_RAW_SCORE"] = rawScore;
            }
            score["TEST_PERCENTAGE_SCORE"] = percentScore;
            score["TEST_SCORE_VALUE"] = repCatScore;
            score["TEST_UPPER_BOUND"] = repCatUpperBound;
            score["TEST_LOWER_BOUND"] = reCatLowerBound;
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

    function removePercentageChar(value) {
        if(value !== undefined && value !== null) {
            return value.replace("%","");
        }
    }
     //This function removes all the non numeric characters
    function removeStringChar(value) {
        if(value !== undefined && value !== null) {
            return value.replace(/\D/g,"");
        }
    }

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

    function getTestAdminDate(row, year) {

          if((row.getField("TEST_ADMIN_DATE")!==undefined) && ( row.getField("TEST_ADMIN_DATE") !== null)){
           var dateLen = row.getField("TEST_ADMIN_DATE").split("-")[0].length;

                if(row.getField("TEST_ADMIN_DATE").indexOf("/") >-1) {
                   return AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "MM/dd/yyyy").STANDARD_DATE;
                }else if(row.getField("TEST_ADMIN_DATE").indexOf("-") >-1 && dateLen <= 2) {
                   return AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "dd-MM-yyyy").STANDARD_DATE;
                }else if(row.getField("TEST_ADMIN_DATE").indexOf("-") >-1 && dateLen > 2) {
                   return AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "yyyy-MM-dd").STANDARD_DATE;
                }
          }

          else {
            return '05/15/' + year.substring(5, 9);
          }
        }

    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if ((rawDate.length >= 8) && (rawDate.length <= 10) && (rawDate.indexOf("/") > -1))
        {
            var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
        }
        else if (rawDate.length === 7) {
            rawDate = "0" + rawDate;
            var formatter = new java.text.SimpleDateFormat("MMddyyyy");
        }
        else if (rawDate.length === 8 && rawDate[4] === "2") // This condition works for 21st century
        {
            var formatter = new java.text.SimpleDateFormat("MMddyyyy");
        }
        else if (rawDate.length === 5)
        {
            rawDate = "0" + rawDate;
            var formatter = new java.text.SimpleDateFormat("MMddyy");
        }
        else if (rawDate.length === 6)
        {
            var formatter = new java.text.SimpleDateFormat("MMddyy");
        }
        else {
            var formatter = new java.text.SimpleDateFormat("yyyyMMdd");
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
        var adminDate;
        if((srcRecord.getField("TEST_ADMIN_DATE")!==undefined) && (srcRecord.getField("TEST_ADMIN_DATE") !== null)){
           var dateLen = srcRecord.getField("TEST_ADMIN_DATE").split("-")[0].length;
                if (srcRecord.getField("TEST_ADMIN_DATE").indexOf("/") > -1) {
                    if (dateLen === 2) {
                        // Handle dd/MM/yyyy format
                        adminDate = AppUtil.getDateObjByPattern(srcRecord.getField("TEST_ADMIN_DATE"), "dd/MM/yyyy").STANDARD_DATE;
                    } else {
                        // Handle MM/dd/yyyy format
                        adminDate = AppUtil.getDateObjByPattern(srcRecord.getField("TEST_ADMIN_DATE"), "MM/dd/yyyy").STANDARD_DATE;
                    }
                    }
                else if (srcRecord.getField("TEST_ADMIN_DATE").indexOf("-") > -1 && dateLen === 2) {
                        // Handle DD-MM-YYYY format
                        adminDate = AppUtil.getDateObjByPattern(srcRecord.getField("TEST_ADMIN_DATE"), "dd-MM-yyyy").STANDARD_DATE;
                }
                else if (srcRecord.getField("TEST_ADMIN_DATE").indexOf("-") > -1 && dateLen === 4) {
                        // Handle YYYY-MM-DD format
                        adminDate = AppUtil.getDateObjByPattern(srcRecord.getField("TEST_ADMIN_DATE"), "yyyy-MM-dd").STANDARD_DATE;
                }
                else if (testDate.length === 8 && !isNaN(testDate)) {
                        // Handle ddMMyyyy format
                        adminDate = AppUtil.getDateObjByPattern(testDate, "ddMMyyyy").STANDARD_DATE;
                    }
          }
          else {
             adminDate = '05/15/' + year.substring(5, 9);
          }
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
     assessmentAdminKey = assessmentAdminKey + "_" + adminDate;
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());