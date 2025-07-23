var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "PVAAS";
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
        {TEST: "PVAAS", MAP_FUNCTION: mapScaledScore}
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
 		var percentile = row.getField("PROBABILITY_OF_SCORING_IN_THE_INDICATED_PERFORMANCE_LEVEL/AT_BENCHMARK_OR_ABOVE");
        var performance_level = row.getField("PROJECTION")
        performance_level = performance_level.match(/\(([^)]+)\)/);
        performance_level = performance_level ? performance_level[1] : null;
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
    	score["TEST_PRIMARY_RESULT"] = performance_level

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
//        assessmentAdminKey = assessmentAdminKey.replace(/\s+/g, '_').replace(/[^\w.]/g, '')
//        assessmentAdminKey = assessmentAdminKey.replace(/[()]/g, '').replace(/\s+/g, '_').replace(/[^\w._-]/g, '');
        assessmentAdminKey = assessmentAdminKey.replace(/[()\-\[\]{}]/g, '').replace(/\s+/g, '_');

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    var subPassDecode = {
       'PSSA ENGLISH LANGUAGE ARTS' : "PSSA_ELA"
       ,'PSSA MATH' : "PSSA_MA"
       ,'PSSA SCIENCE' : "PSSA_SCI"
       ,"ENGLISH" : "ENG"
       ,"WRITING" : "WR"
       ,"MATH" : "MA"
       ,"SCIENCE" : "SCI"
       ,"READING" : "RD"
       ,"BIOLOGY" : "BIO"
       ,"CALCULUS AB" : "CALC_AB"
       ,'ENGLISH LANGUAGE AND COMPOSITION': "EL_COMP"
       ,'English Literature and Composition': "ENG_LIT_COMP"
       ,'PSYCHOLOGY':"PSYCH"
       ,'STATISTICS':"STATS"
       ,'UNITED STATES GOVERNMENT AND POLITICS':"GOV_P"
       ,'UNITED STATES HISTORY': "HIST"
       ,'ALGEBRA I':"ALG_I"
       ,'LITERATURE':"LIT"
       ,'READING AND WRITING':"RD_WR"
       ,"ACCESS FOR ELLS COMPOSITE":"AC_EL_COMP"
    };
    var gradePassDecode = {
    '1ST': '1'
    , '2ND':'2'
    , '3RD':'3'
    , '4TH':'4'
    , '5TH':'5'
    , '6TH':'6'
    , '7TH':'7'
    , '8TH':'8'
    , '9TH':'9'
    , '10TH':'10'
    , '11TH':'11'
    , '12TH':'12'
    }
    function generateTestNumber(row, testMetadata) {
        var sub = null;
        var testNumber = null;
        var SubjectName = row.getField("PROJECTION").toUpperCase();

        const list1 = ['1ST', '2ND', '3RD', '4TH', '5TH', '6TH', '7TH', '8TH', '9TH', '10TH', '11TH', '12TH','ACT','AP','KEYSTONE','SAT','PSAT 8/9','PSAT NMSQT'];
        const list2 = ['ACCESS FOR ELLS COMPOSITE','PSSA ENGLISH LANGUAGE ARTS', 'PSSA MATH', 'PSSA SCIENCE', 'ENGLISH', 'WRITING','MATH','SCIENCE','READING','BIOLOGY','CALCULUS AB','ENGLISH LANGUAGE AND COMPOSITION','PSYCHOLOGY','STATISTICS','UNITED STATES GOVERNMENT AND POLITICS','UNITED STATES HISTORY','ALGEBRA I','LITERATURE','READING AND WRITING'];

        let found = false;

        for (let i = 0; i < list1.length && !found; i++) {
          const grade = list1[i];

          for (let j = 0; j < list2.length && !found; j++) {
            const subject = list2[j];
            const combined = grade + ' ' + subject;

            if (SubjectName.indexOf(combined) > -1) {
              const short_sub_name = subPassDecode[subject];
              const short_grade = gradePassDecode[grade]
              if(short_grade){
                sub = short_grade + '_' + short_sub_name;
              }else
                sub = grade + '_' + short_sub_name;

              found = true;
            }
          }
        }
//            if (SubjectName.indexOf('(BASIC)') > -1) {
//                 sub = sub + "_BASIC";
//    		}else if (SubjectName.indexOf('(PROFICIENT)') > -1) {
//                sub =  sub + "_PROF";
//            }else if (SubjectName.indexOf('(ADVANCED)') > -1) {
//                sub =  sub + "_ADV";
//            }else if (SubjectName.indexOf('(EMERGING ELP - 2.0)') > -1) {
//                sub =  sub + "_EMRG_2";
//            }else if (SubjectName.indexOf('(DEVELOPING ELP - 3.0)') > -1) {
//                sub =  sub + "_DEV_3";
//            }else if (SubjectName.indexOf('(EXPANDING ELP - 4.0)') > -1) {
//                sub =  sub + "_EXPD_4";
//            }else if (SubjectName.indexOf('(BRIDGING ELP - 5.0)') > -1) {
//                sub =  sub + "_BRIDG_5";
//            }else if (SubjectName.indexOf('(REACHING ELP - 6.0)') > -1) {
//                sub =  sub + "_REACH_6";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 23)') > -1) {
//                sub =  sub + "_PA_H_ED_23";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 25)') > -1) {
//                sub =  sub + "_PA_H_ED_25";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 27)') > -1) {
//                sub =  sub + "_PA_H_ED_27";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 30)') > -1) {
//                sub =  sub + "_PA_H_ED_30";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 570)') > -1) {
//                sub =  sub + "_PA_H_ED_570";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 600)') > -1) {
//                sub =  sub + "_PA_H_ED_600";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 620)') > -1) {
//                sub =  sub + "_PA_H_ED_620";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 670)') > -1) {
//                sub =  sub + "_PA_H_ED_670";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 560)') > -1) {
//                sub =  sub + "_PA_H_ED_560";
//            }else if (SubjectName.indexOf('(PA HIGHER ED 580)') > -1) {
//                sub =  sub + "_PA_H_ED_580";
//            }else if (SubjectName.indexOf('(5)') > -1) {
//              sub =  sub + "_5";
//            }else if (SubjectName.indexOf('(COLLEGE READINESS BENCHMARK)') > -1) {
//                sub =  sub + "_CLG_RD_BENCH";
//            }else if (SubjectName.indexOf('(50TH PERCENTILE)') > -1) {
//                sub =  sub + "_50_PCNTL";
//            }else if (SubjectName.indexOf('(80TH PERCENTILE)') > -1) {
//                sub =  sub + "_80_PCNTL";
//            }else if (SubjectName.indexOf('(2 OR HIGHER)') > -1) {
//                sub =  sub + "_2_HIGHER";
//            }else if (SubjectName.indexOf('(3 OR HIGHER)') > -1) {
//                sub =  sub + "_3_HIGHER";
//            }else if (SubjectName.indexOf('(4 OR HIGHER)') > -1) {
//                sub =  sub + "_4_HIGHER";
//            }
            if (sub) {
    			testNumber = testMetadata.TEST + '_' + sub.replace(/\s+/g, '_');
    		}else if (combined){
    		    //for missing tests
    		    testNumber = testMetadata.TEST + '_' + combined.replace(/\s+/g, '_');
    		}

    		    return testNumber
        }
    return module;
}());