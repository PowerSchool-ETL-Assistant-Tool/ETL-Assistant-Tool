var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CA_ESGI";
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
          {TEST: "ESGI", CODE:"", FIELD: "", MAP_FUNCTION: mapScaleScore}
      ];


    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
    var gradeDecode = {
        "0": "KG",
        "Grade 0": "KG",
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
        "Grade 99": "Graduated",
        "99": "Graduated",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };

      var performanceLevelDecode = {
        "1" : { DESC:"Unsatisfactory", PASS_IND: "No"}
        ,"2" : { DESC:"Needs Improvement", PASS_IND: "No"}
        ,"3" : { DESC:"Satisfactory", PASS_IND: "Yes"}
        ,"4" : { DESC:"Outstanding", PASS_IND: "Yes"}
        ,"" : { DESC: null, PASS_IND: null}
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

        function dateConverter(dateString) {
            // Check if dateString is null, undefined, or an empty string
            if (!dateString || typeof dateString !== 'string' || dateString.trim() === '') {
                return { finalDates: null, months: null, days: null, years: null, season: null };
            }

            var dateParts, dateObj, year, month, day;

            // Check for the presence of time and strip it out for initial processing
            var timeIndex = dateString.indexOf(" ");
            if (timeIndex !== -1) {
                dateString = dateString.split(" ")[0];
            }

            // Replace dashes with slashes for consistent processing
            dateString = dateString.replace(/-/g, '/');

            // Handle YYYY/MM/DD, DD/MM/YYYY, MM/DD/YYYY, and M/D/YYYY formats
            if (dateString.match(/^\d{4}\/\d{1,2}\/\d{1,2}$/)) { // YYYY/M/D or YYYY/MM/DD format
                dateParts = dateString.split('/');
                year = dateParts[0];
                month = dateParts[1];
                day = dateParts[2];
            } else if (dateString.match(/^\d{1,2}\/\d{1,2}\/\d{4}$/)) { // D/M/YYYY or M/D/YYYY
                dateParts = dateString.split('/');
                if (parseInt(dateParts[0], 10) > 12) { // DD/MM/YYYY format
                    day = dateParts[0];
                    month = dateParts[1];
                    year = dateParts[2];
                } else if (parseInt(dateParts[1], 10) > 12) { // MM/DD/YYYY format
                    month = dateParts[0];
                    day = dateParts[1];
                    year = dateParts[2];
                } else {
                    // Ambiguous case, default to MM/DD/YYYY
                    month = dateParts[0];
                    day = dateParts[1];
                    year = dateParts[2];
                }
            } else {
                return { finalDates: null, months: null, days: null, years: null, season: null };
            }

            dateObj = new Date("${year}/${month}/${day}");
            if (isNaN(dateObj.getTime())) {
                return { finalDates: null, months: null, days: null, years: null, season: null };
            }

            month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
            day = ('0' + dateObj.getDate()).slice(-2);
            year = dateObj.getFullYear();

            var finalDate = month + '/' + day + '/' + year;
            return { finalDates: finalDate, months: month, days: day, years: year };
        }


        function getSeason(dateObj) {
            var month = parseInt(dateObj.months, 10);
            var day = parseInt(dateObj.days, 10);

            var season;

            if ((month === 8) || (month === 9) || (month === 10) || (month === 11) ) {
                season = 'FALL'; // September 1 to December 31
            } else if ((month === 12) || (month === 1 )|| (month === 2) ||(month === 3)) {
                season = 'WINTER'; // January 1 to March 15
            } else if ((month === 4) ||(month === 5) || (month === 6) || (month === 7 ) ) {
                season = 'SPRING'; // March 16 to May 31
            } else {
                season = null;
            }

            return season;
        }

//Winter months( 12, 01, 02, 03), Spring(04,05,06,07), Fall(08,09,10,11)--UIHN-74277

    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();


        var birthDateObject = dateConverter(row.getField("BIRTH_DATE"));
        var assessmentDateObject = dateConverter(row.getField("TEST_ADMIN_DATE"));
        var season = getSeason(assessmentDateObject);



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
                    record.REPORTING_PERIOD = _util.coalesce(season,hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    if (assessmentDateObject.finalDates === null) {
                        var defaultYear = hierarchy.SCHOOL_YEAR.substring(5, 9);
                        record.TEST_ADMIN_DATE = "05/15/" + defaultYear;
                    } else {
                        record.TEST_ADMIN_DATE = assessmentDateObject.finalDates;
                    }
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                        ,row.getField("DISTRICT_STUDENT_ID")
                    );
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
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.months, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.days, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.years, null);
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NAME"), row.getField("STATE_SCHOOL_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("STATE_SCHOOL_ID"));
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
    function mapScaleScore(row, testMetadata) {
        var score = {};

        var subjectName = getSubjectName(row);
        var testNumber = testMetadata.TEST + "_" + subjectName;

        var maxScore = _util.trim(row.getField("MAX_SCORE"));
        var countingScore = _util.trim(row.getField("CORRECT_ANSWERS"));

        var proficiencyLvl = _util.trim(row.getField("PERFORMANCE_LEVELS"));


//         Check for key fields and do not map score and exit if conditions met.
        if (!countingScore || _util.trim(countingScore) === "--" || _util.trim(countingScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = countingScore;

        if(!isNaN(countingScore)){
            score["TEST_SCORE_VALUE"] = countingScore;
            score["TEST_SCALED_SCORE"] = countingScore;
        }
        if(!isNaN(maxScore)){
            score["TEST_RAW_SCORE"] = maxScore;
        }


        if(proficiencyLvl){
    	score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[proficiencyLvl].PASS_IND;
    	score["TEST_PRIMARY_RESULT_CODE"] = proficiencyLvl;
    	score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[proficiencyLvl].DESC;
    	}

        return score;
    }

        function getSubjectName(row) {
            var testName = row.getField("TEST_NAME");

            // Check if testName exists
            if (!testName) {
                return null;
            }

            var test = _util.trim(testName).toUpperCase();

            var subject = null;

            if (test.indexOf("ADDITION AND SUBTRACTION FLUENCY TO 5") > -1) {
                subject = "ADD_SUB_5";
            } else if (test.indexOf("ADDITION AND SUBTRACTION TO 10") > -1) {
                subject = "ADD_SUB_10";
            } else if (test.indexOf("BENCHMARK KINDERGARTEN HIGH FREQUENCY WORDS") > -1) {
                subject = "BKHFW";
            } else if (test.indexOf("CLASSIFICATION") > -1) {
                subject = "CLASS";
            } else if (test.indexOf("COLORS FOR KSEP") > -1) {
                subject = "C_KSEP";
            } else if (test.indexOf("INFORMATIONAL ASK AND ANSWER QUESTIONS") > -1) {
                subject = "IAAQ";
            } else if (test.indexOf("INFORMATIONAL MAIN TOPIC AND DETAILS") > -1) {
                subject = "IMTD";
            } else if (test.indexOf("LETTER IDENTIFICATION") > -1) {
                subject = "LI";
            } else if (test.indexOf("LETTER-SOUND CORRESPONDENCE") > -1) {
                subject = "LSC";
            } else if (test.indexOf("LITERATURE ASK AND ANSWER QUESTIONS") > -1) {
                subject = "LAAQ";
            } else if (test.indexOf("LITERATURE CHARACTERS SETTING AND EVENTS") > -1) {
                subject = "LCSE";
            } else if (test.indexOf("LITERATURE RETELLING WITH DETAILS") > -1) {
                subject = "LRD";
            } else if (test.indexOf("OBJECT COUNTING TO 20") > -1) {
                subject = "OBJ_COUNT_20";
            } else if (test.indexOf("SHAPES FOR KSEP") > -1) {
                subject = "S_KSEP";
            } else if (test.indexOf("UPPERCASE LETTERS") > -1) {
                subject = "UPLTRS";
            } else if (test.indexOf("CONCEPTOS DE LO IMPRESO") > -1) {
                subject = "CONCP_DE_LI";
            } else if (test.indexOf("CONSONANT LETTER SOUNDS") > -1) {
                subject = "CONS_LS";
            } else if (test.indexOf("CONTANDO SILABAS") > -1) {
                subject = "CONT_SYL";
            } else if (test.indexOf("COUNTING SYLLABLES") > -1) {
                subject = "COUNT_SYL";
            } else if (test.indexOf("LOWERCASE LETTER NAMES") > -1) {
                subject = "LC_LN";
            } else if (test.indexOf("NOMBRE DE LETRAS MAYUSCULAS") > -1) {
                subject = "NUM_DE_LET_MYS";
            } else if (test.indexOf("NOMBRE DE LETRAS MINUSCULAS") > -1) {
                subject = "NUM_DE_LET_MIN";
            } else if (test.indexOf("PRINT CONCEPTS") > -1) {
                subject = "PRNT_CONCP";
            } else if (test.indexOf("SONIDO DE CONSONANTES") > -1) {
                subject = "SON_DE_CON";
            } else if (test.indexOf("UPPERCASE LETTER NAMES") > -1) {
                subject = "UC_LN";
            } else if (test.indexOf("BLEND ONSETS & RIMES") > -1) {
                subject = "BL_ON_RI";
            } else if (test.indexOf("BLEND PHONEMES") > -1) {
                subject = "BL_PH";
            } else if (test.indexOf("CONSONANT LETTER SOUNDS") > -1) {
                subject = "CH_LE_SD";
            } else if (test.indexOf("COMBINAR PALABRAS BISILABAS") > -1) {
                subject = "CO_PA_BI";
            } else if (test.indexOf("COUNT & SEGMENT PHONEMES") > -1) {
                subject = "CO_SE_PH";
            } else if (test.indexOf("WONDERS HIGH FREQUENCY WORDS") > -1) {
                 subject = "WO_HI_FR_WO";
            } else if (test.indexOf("SONIDOS DE LAS LETRAS") > -1) {
                 subject = "SO_DE_LA_LE";
            } else if (test.indexOf("SHORT VOWEL SOUNDS") > -1) {
                 subject = "SH_VO_SO";
            } else if (test.indexOf("SEPARA Y CUENTA SILABAS") > -1) {
                 subject = "SE_Y_CU_SI";
            } else if (test.indexOf("SEGMENT ONSETS & RIMES") > -1) {
                 subject = "SE_ON_RI";
            } else if (test.indexOf("MARAVILLAS PALABRAS DE USO FRECUENTE") > -1) {
                 subject = "MA_PA_DE_US_FR";
            } else if (test.indexOf("RECONOCER TILDE SOBRE UNA VOCAL") > -1) {
                 subject = "RE_TI_SO_UN_VO";
            } else if (test.indexOf("COMBINAN LOS SONIDOS CONSONANTICOS Y VOCALICOS DE UNA SILABA") > -1) {
                 subject = "CO_SO_CO_VO_UN_SI";
            } else if (test.indexOf("ISOLATE FINAL SOUND") > -1) {
                 subject = "IS_FI_SO";
            } else if (test.indexOf("ISOLATE INITIAL SOUND") > -1) {
                 subject = "IS_IN_SO";
            } else if (test.indexOf("ISOLATE MEDIAL SOUND") > -1) {
                 subject = "IS_ME_SO";
            } else if (test.indexOf("PRODUCE RHYMING WORDS") > -1) {
                 subject = "PR_RH_WO";
            } else if (test.indexOf("RECOGNIZE RHYMING WORDS") > -1) {
                 subject = "RE_RH_WO";
            } else if (test.indexOf("SPOKEN WORDS REPRESENTED BY WRITTEN LANGUAGE") > -1) {
                 subject = "SP_WO_RE_WR_LA";
            } else if (test.indexOf("FRY 1ST 100 WORDS") > -1) {
                 subject = "FRY_1_100_WO";
            } else if (test.indexOf("UNDERSTAND WORDS ARE SEPARATED BY SPACES") > -1) {
                  subject = "UN_WO_SE_SP";
            } else if (test.indexOf("LAS VOCALES") > -1) {
                  subject = "LA_VO";
            } else if (test.indexOf("LAS VOCALES-SONIDOS") > -1) {
                   subject = "LA_VO_SO";
            } else if (test.indexOf("LENGUAJE ORAL SE REPRESENTA EN EL LENGUAJE ESCRITO") > -1) {
                   subject = "LE_OR_SE_RE_ES";
            } else if (test.indexOf("IDENTIFICA LA SILABA CON ENFASIS DE LA VOZ") > -1) {
                   subject = "ID_LA_SI_CO_EN_VO";
            } else if (test.indexOf("COMBINAR 2-3 SONIDOS PARA HACER PALABRAS") > -1) {
                   subject = "CO_SO_PA_HA_PA";
            } else if (test.indexOf("PALABRAS SE SEPARAN POR ESPACIOS EN BLANCO") > -1) {
                   subject = "PA_SE_PO_ES_BL";
            } else if (test.indexOf("RECONOCER PALABRAS QUE RIMAN") > -1) {
                   subject = "RE_PA_QU_RI";
            } else if (test.indexOf("SEPARAN LOS SONIDOS FINALES") > -1) {
                   subject = "SE_LO_SO_FI";
            } else if (test.indexOf("SEPARAN LOS SONIDOS INICIALES") > -1) {
                    subject = "SE_LO_SO_IN";
            } else if (test.indexOf("SEPARAN LOS SONIDOS MEDIOS") > -1) {
                    subject = "SE_LO_SO_ME";
            } else if (test.indexOf("PRIMERAS 100 PALABRAS") > -1) {
                    subject = "PR_100_PA";
            } else if (test.indexOf("PRODUCIR PALABRAS QUE RIMAN") > -1) {
                     subject = "PR_PA_Q_RI";
            }


            return subject;
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
    function groupAssessmentByNaturalKey(signature, hierarchy, one, two, row) {
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord,row) {

        // Generate the assessmentAdminKey using hierarchy values and the converted date
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Adding Subject to the natural Key
        var subject = getSubjectName(srcRecord);
            //Null Check
        if (subject != null) {
                assessmentAdminKey += "_" + subject;
            }

        var testAdminDate = srcRecord.getField("TEST_ADMIN_DATE");
        var assessmentDateObject = dateConverter(testAdminDate);

        if (assessmentDateObject.finalDates === null) {
            var defaultYear = hierarchy.SCHOOL_YEAR.substring(5, 9);
            assessmentAdminKey += "_05/15/" + defaultYear;
        } else {
            assessmentAdminKey += "_" + assessmentDateObject.finalDates;
        }


        // Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });



        // Examples of adding additional values (if needed)
        // assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        // assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);

        // Return the generated assessment admin key
        return assessmentAdminKey;
    }

    return module;
}());