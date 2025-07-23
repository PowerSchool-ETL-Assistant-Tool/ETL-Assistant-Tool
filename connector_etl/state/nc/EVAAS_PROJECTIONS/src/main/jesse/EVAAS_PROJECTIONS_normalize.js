var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "EVAAS_PROJECTIONS";
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
        {TEST: "EVAAS", MAP_FUNCTION: mapScaledScore}
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
        "Kindergarten": "KG"
       ,"" : null
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
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var fullName = row.getField("STUDENT_NAME").split(' ')
        var lastName = null;
        var firstName = null;
        var middleName = null;
        if(fullName.length === 4){
            lastName = fullName[0];
            firstName = fullName[1]+' '+fullName[2]
            middleName = fullName[3]
        }
        else if(fullName.length === 3){
            var lastName = fullName[0];
            var firstName = fullName[1];
            var middleName = fullName[2];
        }
        else if(fullName.length === 2){
            var lastName = fullName[0];
            var firstName = fullName[1];
        }
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

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
                    record.TEST_ADMIN_DATE ="05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = firstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= middleName;
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = row.getField("GENDER");
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("DISTRICT_TESTED"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
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
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);
        var scaleScore = row.getField("PROJECTED_STATE_PERCENTILE");
 		var percentile = row.getField("PROBABILITY_OF_SCORING_LEVEL_3_OR_ABOVE");

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
         (percentile === null || percentile === undefined || _util.trim(percentile) === "--" || _util.trim(percentile) === "")){
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PERCENTILE_SCORE"] = percentile;

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

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    function generateTestNumber(row, testMetadata) {
        var sub = null;
        var testNumber = null;
        var SubjectName = row.getField("PROJECTION");
    		if (SubjectName.indexOf('4th EOG Math') > -1) {
    			sub = "4_EOG_MATH";
    		} else if (SubjectName.indexOf('4th EOG Reading') > -1) {
    			sub = "4_EOG_READING";
            } else if (SubjectName.indexOf('5th EOG Math') > -1) {
    			sub = "5_EOG_MATH";
            } else if (SubjectName.indexOf('5th EOG Reading') > -1) {
                sub = "5_EOG_READING";
            } else if (SubjectName.indexOf('5th EOG Science') > -1) {
                sub = "5_EOG_SCIENCE";
            } else if (SubjectName.indexOf('6th EOG Math') > -1) {
                sub = "6_EOG_MATH";
            } else if (SubjectName.indexOf('6th EOG Reading') > -1) {
                sub = "6_EOG_READING";
            } else if (SubjectName.indexOf('7th EOG Math') > -1) {
                sub = "7_EOG_MATH";
            } else if (SubjectName.indexOf('7th EOG Reading') > -1) {
                sub = "7_EOG_READING";
            } else if (SubjectName.indexOf('8th EOG Math') > -1) {
                sub = "8_EOG_MATH";
            } else if (SubjectName.indexOf('8th EOG Reading') > -1) {
                sub = "8_EOG_READING";
            } else if (SubjectName.indexOf('8th EOG Science') > -1) {
                sub = "8_EOG_SCIENCE";
            } else if (SubjectName.indexOf('EOC Biology I') > -1) {
                sub = "EOC_BIOLOGY_I";
            } else if (SubjectName.indexOf('EOC English II') > -1) {
                sub = "EOC_ENGLISH_II";
            } else if (SubjectName.indexOf('EOC Math 1') > -1) {
                sub = "EOC_MATH_1";
            } else if (SubjectName.indexOf('EOC Math 3') > -1) {
                sub = "EOC_MATH_3";
            }else if (SubjectName.indexOf('EOC Algebra II') > -1) {
                sub = "EOC_ALG_II";
            }else if (SubjectName.indexOf('EOC Algebra I') > -1) {
                sub = "EOC_ALG_I";
            }else if (SubjectName.indexOf('EOC English I') > -1) {
                sub = "EOC_ENGLISH_I";
            }else if (SubjectName.indexOf('EOC U.S. History') > -1) {
                sub = "EOC_HIST";
            }else if (SubjectName.indexOf('EOC Integrated Math III') > -1) {
                sub = "EOC_INT_MATH_III";
            }else if (SubjectName.indexOf('EOC Integrated Math II') > -1) {
                sub = "EOC_INT_MATH_II";
            }else if (SubjectName.indexOf('EOC Integrated Math I') > -1) {
                sub = "EOC_INT_MATH_I";
            }else if (SubjectName.indexOf('EOC Geometry') > -1) {
                sub = "EOC_GEOM";
            }else if (SubjectName.indexOf('ACT Composite') > -1) {
                sub = "ACT_CO";
            }else if (SubjectName.indexOf('ACT English') > -1) {
                sub = "ACT_ENG";
            }else if (SubjectName.indexOf('ACT Math') > -1) {
                sub = "ACT_Math";
            }else if (SubjectName.indexOf('ACT Reading') > -1) {
                sub = "ACT_RD";
            }else if (SubjectName.indexOf('ACT Science/Reasoning') > -1) {
                sub = "ACT_SCI/REAS";
            }else if (SubjectName.indexOf('6th Math') > -1) {
                sub = "6_MATH";
            }else if (SubjectName.indexOf('6th English Language Arts') > -1) {
                sub = "6_ELA";
            }else if (SubjectName.indexOf('6th Social Studies') > -1) {
                sub = "6_SOCSCI";
            }else if (SubjectName.indexOf('7th Math') > -1) {
                sub = "7_MATH";
            }else if (SubjectName.indexOf('7th English Language Arts') > -1) {
                sub = "7_ELA";
            }else if (SubjectName.indexOf('7th Social Studies') > -1) {
                sub = "7_SOCSCI";
            }else if (SubjectName.indexOf('5th Math') > -1) {
                sub = "5_MATH";
            }else if (SubjectName.indexOf('5th English Language Arts ') > -1) {
                sub = "5_ELA";
            }else if (SubjectName.indexOf('4th Math') > -1) {
                sub = "4_MATH";
            }else if (SubjectName.indexOf('4th English Language Arts ') > -1) {
                sub = "4_ELA";
            }else if (SubjectName.indexOf('3rd Math ') > -1) {
                sub = "3_MATH";
            }else if (SubjectName.indexOf('AP Biology') > -1) {
                sub = "AP_BIOLOGY";
            }else if (SubjectName.indexOf('AP English Language and Composition') > -1) {
                sub = "AP_EL_COM";
            }else if (SubjectName.indexOf('AP Human Geography') > -1) {
                sub = "AP_HUGEO";
            }else if (SubjectName.indexOf('AP Psychology') > -1) {
                sub = "AP_PSYCH";
            }else if (SubjectName.indexOf('AP Statistics') > -1) {
                sub = "AP_STATS";
            }else if (SubjectName.indexOf('AP US Government and Politics') > -1) {
                sub = "AP_USGOVP";
            }else if (SubjectName.indexOf('AP World History') > -1) {
                sub = "AP_WH";
            }else if (SubjectName.indexOf('8th Math') > -1) {
                sub = "8_MATH";
            }else if (SubjectName.indexOf('8th English Language Arts') > -1) {
                sub = "8_ELA";
            }else if (SubjectName.indexOf('8th Social Studies') > -1) {
                sub = "8_SOCSCI";
            }else if (SubjectName.indexOf('EOC Biology') > -1) {
                sub = "EOC_BIOLOGY";
            }else if (SubjectName.indexOf('6th Science') > -1) {
                sub = "6_SCIENCE";
            }else if (SubjectName.indexOf('5th Science') > -1) {
                sub = "5_SCIENCE";
            }else if (SubjectName.indexOf('AP English Literature and Composition') > -1) {
                sub = "AP_ENGLIT_CO";
            }else if (SubjectName.indexOf('8th Science') > -1) {
                sub = "8_SCIENCE";
            }else if (SubjectName.indexOf('7th Science') > -1) {
                sub = "7_SCIENCE";
            }else if (SubjectName.indexOf('3rd English Language Arts ') > -1) {
                sub = "3_ELA";
            }else if (SubjectName.indexOf('AP U.S. Government') > -1) {
                sub = "AP_USGOV";
            }else if (SubjectName.indexOf('AP U.S. History') > -1 || SubjectName.indexOf('AP US History') > -1 ) {
                sub = "AP_HIST";
            }else if (SubjectName.indexOf('AP English Literature') > -1) {
                sub = "AP_ENGLIT";
            }

            if (SubjectName.indexOf('(Level 2)') > -1) {
                 sub = sub + "_L2";
    		}else if (SubjectName.indexOf('(Level 3)') > -1) {
                sub =  sub + "_L3";
            }else if (SubjectName.indexOf('(Level 4)') > -1) {
                sub =  sub + "_L4";
            }else if (SubjectName.indexOf('(Level 5)') > -1) {
                sub =  sub + "_L5";
            }else if (SubjectName.indexOf('(Approaching)') > -1) {
                sub =  sub + "_AP";
            }else if (SubjectName.indexOf('(On Track)') > -1) {
                sub =  sub + "_OT";
            }else if (SubjectName.indexOf('(Mastered)') > -1) {
                sub =  sub + "_MS";
            }else if (SubjectName.indexOf('(Lottery Scholarship - 21)') > -1) {
                sub =  sub + "_LS_21";
            }else if (SubjectName.indexOf('(Benchmark - 18)') > -1) {
                sub =  sub + "_BNK_18";
            }else if (SubjectName.indexOf('(Avg for TN Grads-TBR&UT - 23)') > -1) {
                sub =  sub + "_AVG_TNGTBRUT_23";
            }else if (SubjectName.indexOf('(Avg for TN Engl Major Grads-TBR&UT - 24)') > -1) {
                sub =  sub + "_AVG_TNEMGTRBUT_24";
            }else if (SubjectName.indexOf('(TBR Exempt from Dev/Rem Math - 19)') > -1) {
                sub =  sub + "_TBR_EDEVR_MA_19";
            }else if (SubjectName.indexOf('(Benchmark - 22)') > -1) {
                sub =  sub + "_BNK_22";
            }else if (SubjectName.indexOf('(Avg for TN Math/Sci/Eng/Tech Grads - 26)') > -1) {
                sub =  sub + "_AVG_TNMA_SCI_ENG_TC_26";
            }else if (SubjectName.indexOf('(Avg for TN Grads-TBR&UT - 21)') > -1) {
                sub =  sub + "_AVG_TNGTBRUT_21";
            }else if (SubjectName.indexOf('(Avg for TN Nursing Grads-TBR&UT - 22)') > -1) {
                sub =  sub + "_AVG_TNNGTRBUT_22";
            }else if (SubjectName.indexOf('(Benchmark - 23)') > -1) {
                sub =  sub + "_BNK_23";
            }else if (SubjectName.indexOf('(2 or higher)') > -1) {
                sub =  sub + "_2_HIGHER";
            }else if (SubjectName.indexOf('(3 or higher)') > -1) {
                sub =  sub + "_3_HIGHER";
            }else if (SubjectName.indexOf('(4 or higher)') > -1) {
                sub =  sub + "_4_HIGHER";
            }else if (SubjectName.indexOf('(Approaching Expectations)') > -1) {
                sub =  sub + "_AP_EXP";
            }else if (SubjectName.indexOf('(Met Expectations)') > -1) {
                sub =  sub + "_MET_EXP";
            }else if (SubjectName.indexOf('(Exceeded Expectations)') > -1) {
                sub =  sub + "_EX_EXPS";
            }
            if (sub) {
    			testNumber = testMetadata.TEST + '_' + sub;
    		}
    		    return testNumber
        }
    return module;
}());