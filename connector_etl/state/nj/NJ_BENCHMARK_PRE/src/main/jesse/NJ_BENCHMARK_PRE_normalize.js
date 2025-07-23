var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "NJ_BENCHMARK_PRE";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
//  module.createNormalizedFile = function(file, signature) {
//          try {
//              let normalizedFile = AppUtil.createResultsFile(file);
//              const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
//              const fileRows = createRecords(file, signature);
//              let normalizedRows = [], normalizedRecords = [];
//
//              fileRows.forEach(function(rows) {
//                  try{
//                      mapNormalizedRecords(signature, hierarchy, rows).forEach(function(normRecord) {
//                          normalizedRows.push(normRecord)
//                      });
//
//                  } catch(exception) {
//                      AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "mapNormalizedRecords error: ${exception}", JSON.stringify(rows)));
//                  }
//              });
//
//
//              normalizedRows.forEach(function(row) {
//                  try {
//                      const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
//
//                      if(mappingObject.SCORE_MAPPINGS.length === 0) {
//                          AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
//                      } else {
//                          normalizedRecords.push(row);
//                      }
//
//                  } catch(exception) {
//                      AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
//                  }
//              });
//
//              writeNormalizedRecords(normalizedFile, normalizedRecords);
//
//              return normalizedFile;
//          } catch(exception) {
//              throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
//          }
//      };
//
//    /** Java classes **/
//    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
//    const BufferedReader = Java.type("java.io.BufferedReader");
//    const InputStreamReader = Java.type('java.io.InputStreamReader');
//    const CSVWriter = Java.type("com.opencsv.CSVWriter");
//    const FileWriter = Java.type("java.io.FileWriter");
//    const File = Java.type("java.io.File");
//
//    /***************************************************************************
//     Utility Functions
//     ***************************************************************************/
//
//    function createRecords(file, signature) {
//        try {
//            const format = signature.getFormat();
//            const fieldDelimiter = format.getFieldDelim();
//            const textDelimiter = format.getQuoteDelim();
//            const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
//            const delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
//            let lineNumber = 0;
//            let recordsArray = [];
//            const fieldNames = delimitedRecordParser.parseRow(reader);
//            let row, record;
//
//            while ((row = delimitedRecordParser.parseRow(reader)) != null) {
//                let index = 0;
//                record = {};
//
//                for (const key in fieldNames) {
//                    record[fieldNames[index]] = row.get(index++);
//                }
//                record.LINEAGE_FILE = file.getFullName();
//                record.LINEAGE_LINE = (++lineNumber).toString();
//                const rowArray = [];
//                rowArray.push(record);
//                recordsArray.push((rowArray));
//            }
//
//            return recordsArray;
//        } catch (exception) {
//            throw "${_thisModuleName}.createRecords Exception: ${exception}";
//        }
//    }
//
//    /**
//     * Creates a Processed file containing the audit types of error for the file processed
//     *
//     * @param file A fully qualified string path to the normalFile
//     * @param data The audit statistics of the file that was processed
//     */
//    function writeNormalizedRecords(file, data) {
//        try {
//            const normalFile = _file.open(file);
//            const normalFilePath = normalFile.getParent();
//            const normalFileName = normalFile.getName()
//            const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
//            let rowArray = null;
//            const header = Object.keys(data[0]);
//
//            writer.writeNext(header);
//
//            data.forEach(function(row) {
//                rowArray = [];
//
//                for (let key in row) {
//                     rowArray.push(row[key]);
//                }
//                writer.writeNext(rowArray);
//            })
//
//            writer.close();
//        } catch (exception) {
//            throw "${_thisModuleName}.writeNormalizedRecords Exception: ${exception}";
//        }
//    }
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
        {TEST: "NJ_LG",  MAP_FUNCTION: mapScaledScore}
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

    var subjectDecode = {
        "English Language and Literature" : "ELA",
        "Fine and Performing Arts" : "FPA",
        "Foreign Language and Literature" : "FLL",
        "Life and Physical Sciences" : "LPS",
        "Mathematics" : "MA",
        "Social Sciences and History" : "SSH",
        "Special/Exceptional Education" : "SEE",
        "Physical Education" : "PS",
        "" : null,
        null : null
    };

    var primaryDecode = {
      "Basic Standards": { DESC: "Basic Standards", CODE: "BS"},
      "Below Basic Standards": { DESC: "Below Basic Standards", CODE: "BBS"},
      "Exceeds Standards": { DESC: "Exceeds Standards", CODE: "ES"},
      "Far Below Basic Standards": { DESC: "Far Below Basic Standards", CODE: "FBBS"},
      "Meets Standards": { DESC: "Meets Standards", CODE: "MS"},
      "" : { DESC: "", CODE: null},
      null: { DESC: null, CODE: null},
      };

    var adminPeriodDecodes = {
        "1" : "MP1",
        "2" : "MP2",
        "3" : "MP3",
        "4" : "MP4",
        "5" : "Summer",
        "PRE" : "PRE",
        //"POST" : "POST",
        "NULL" : "ALL",
        "" : null,
        null : null
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
        var pType = null;//default value for non pre/post tests

        var folderType = _util.coalesce(row.getField("ASSESSMENT_ID"));
        pType = testDecode[folderType];
        var record = mapNormalizedRecord(signature, hierarchy, row, pType);

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
    function mapNormalizedRecord(signature, hierarchy, row, pType) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, pType);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row, pType);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, pType, signature);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                //AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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
    function mapNormalizedAdminFields(signature, hierarchy, row, pType) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var studentBirthDate = row.getField("STUDENT_BIRTHDATE");
        if(studentBirthDate!=='NULL'){
            var birthDateObject = AppUtil.getDateObjByPattern(studentBirthDate, "yyyy-MM-dd");
        }
        var finalDate = null;
        var dateCompletedTestAdmin = _util.coalesce(row.getField("TEST_ADMIN_DATE_STR") ,row.getField("DATESTUDENTCOMPLETEDTEST"));
        //original date stuff
        if(dateCompletedTestAdmin!==null) {
            if (dateCompletedTestAdmin.toString().indexOf("-") > -1) {
                finalDate = AppUtil.getDateObjByPattern(dateCompletedTestAdmin, "dd-MM-yyyy").STANDARD_DATE;
            }
            else if (dateCompletedTestAdmin.toString().indexOf("/") > -1) {
                finalDate = AppUtil.getDateObjByPattern(dateCompletedTestAdmin, "MM/dd/yyyy").STANDARD_DATE;
            }
            else{
                finalDate = AppUtil.getDateObjByPattern(dateCompletedTestAdmin, "yyyy-MM-dd").STANDARD_DATE;
            }
        }
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, pType);
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
                    record.REPORTING_PERIOD = _util.coalesce(adminPeriodDecodes[row.getField("TEST_ADMIN_PERIOD")],hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = finalDate;
                    break;
                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("DISTRICT_STUDENT_ID");
                    break;
                case "STUDENT_STATE_ID":
                        record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"), row.getField("STATE_STUDENT_ID_VERSION_2"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("DISTRICT_STUDENT_ID"), row.getField("STATE_STUDENT_ID"), row.getField("STUDENT_ID"));
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
                    record.STUDENT_GENDER_CODE = _util.coalesce(_util.coalesce(row.getField("GENDER"), "").substring(0,1));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField("TEST_STUDENT_GRADE")]);
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
                        record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("VENDOR_SCHOOL_ID")
                        , row.getField("SCHOOL_LOCAL_ID")
                        , row.getField("SCHOOL_STATE_ID")
                        , row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = row.getField("DISTRICT_SCHOOL_ID");
                     break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = row.getField("SCHOOL_NUMBER");
                     break;
                case "SCHOOL_NAME" :
                    record.SCHOOL_NAME = row.getField("VENDOR_SCHOOL_ID");
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
    function mapAdditionalAdminFields(row, pType) {
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};
        var staffID = null;
        var courseCode = null;
        var courseSection = null;
        var teacherName = null;
        var teacherLastName = null;
        var teacherFirstName = null;
        var partYear = null;
        var lep = null;
        var sped = null;
        var rawAdminDateStr = null;
        var race = null;
        var population = null;
        var windStartDate = null;

        staffID = _util.trim(row.getField("STAFF_CODE"));
        courseCode = row.getField("COURSE_CODE");
        courseSection = row.getField("COURSE_SECTION");
        teacherLastName = row.getField("TEACHER_LAST_NAME");
        teacherFirstName = row.getField("TEACHER_FIRST_NAME");
        teacherName = teacherLastName + ", " + teacherFirstName;
        partYear = row.getField("SCHOOL_YEAR_ID");
        lep = row.getField("LEP");
        sped = row.getField("SPED").substring(0,1);
        rawAdminDateStr = row.getField("TEST_ADMIN_DATE_STR");
        race = row.getField("RACE_ETHNICITY_NAME");
        population = row.getField("STUDENT_POPULATION");
        windStartDate = row.getField("WINDOW_START_DATE");{
            if (windStartDate.toString().indexOf("-") > -1) {
                windStartDate = AppUtil.getDateObjByPattern(windStartDate, "dd-MM-yyyy").STANDARD_DATE;
            }
            else if (windStartDate.toString().indexOf("/") > -1) {
                windStartDate = AppUtil.getDateObjByPattern(windStartDate, "MM/dd/yyyy").STANDARD_DATE;
            }
            else{
                windStartDate = AppUtil.getDateObjByPattern(windStartDate, "yyyy-MM-dd").STANDARD_DATE;
            }
            }
        admin.VENDOR_STAFF_ID = teacherName;
        admin.COURSE_CODE = courseCode;
        admin.COURSE_SECTION = courseSection;
        admin.TEST_TEACHER = staffID;
        if(!isNaN(partYear)){
            admin.PARTICIPATION_YEAR = partYear + "-" + (parseInt(partYear) + 1);
        }
        admin.STUDENT_LEP_CODE = lep;
        admin.STUDENT_SPECIAL_ED_IND = sped;
        admin.TEST_INTERVENTION_DESC = rawAdminDateStr;
        admin.STUDENT_RACE_CODE = race;
        admin.TEST_INTERVENTION_DESC_2 =population;
        admin.TEST_INTERVENTION_DESC_3 = windStartDate;

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    var testDecode = {
        "BENCHMARK" : "BNCH",
        "Benchmark" : "BNCH",
        "District Benchmark (reports in KPI)" : "BNCH",
        "District Benchmark" : "BNCH",
        "PRE-POST SGOs" : "PRESGO",//Short sig should only have Benchmark and Pre types
        //"Post-SGO" : "PRPOSGO",
        //"Post-SGO " : "PRPOSGO",
        "PRE SGO" : "PRESGO",
        "Pre SGO" : "PRESGO",
        "PRE SGOs" : "PRESGO",
        "Pre-SGO" : "PRESGO",
        "PRE SGO " : "PRESGO",
        "" : "ID NOT PROVIDED",//Must be fixed, these custom files cannot skip providing this field
        null : "ID NOT PROVIDED"//Must be fixed, these custom cannot skip providing this field
    };
    function mapScaledScore(row, testMetadata, pType, signature) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata, pType, signature);
		var perfLevel = row.getField("TEST_PRIMARY_RESULT");
		var scaleScore = row.getField("TOTAL_NO_OF_POINTS_ACHIEVED");
		var pointsPoss = row.getField("TEST_NO_OF_POINTS_POSSIBLE");
        var percentage = row.getField("TEST_PERCENTAGE_SCORE");
        var passInd = row.getField("TEST_PASSED_INDICATOR");
        var eightyPlus = row.getField("80_PLUS");
        var diff = _util.coalesce(row.getField("POST_PRE"));
        var impr = _util.coalesce(row.getField("IMPROVEMENT"));
        var subRecodeRea = row.getField("TEST_SUBJECT_RECODE_REA");


        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === "NULL") {
            return null;
        }
        var folderType = _util.coalesce(row.getField("ASSESSMENT_ID"));
        var testValue = testDecode[folderType];
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber+"_"+testValue;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PASSED_INDICATOR"] = passInd;
    	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[perfLevel].CODE;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[perfLevel].DESC;
    	score["TEST_PERCENTAGE_SCORE"] = percentage;
    	score["TEST_SECONDARY_RESULT_CODE"] = eightyPlus;
        score["TEST_TERTIARY_RESULT_CODE"] = "MASID";
        score["TEST_TERTIARY_RESULT"] =  row.getField("MASTER_ID");
    	score["TEST_ITEMS_POSSIBLE"] = pointsPoss;
        score["TEST_ITEMS_ATTEMPTED"] = scaleScore;
        if(diff!=='NULL'){
            score["TEST_GROWTH_RESULT"] = diff;
        }
        if(impr!=='NULL'){
            score["TEST_GROWTH_RESULT_CODE"] = impr;
        }
        score["TEST_SCORE_ATTRIBUTES"] = subRecodeRea;

        return score;
    }

   function generateTestNumber(row, testMetadata, pType, signature){
        //var testName = _util.coalesce(row.getField("TEST_NAME"), row.getField(pType + "_TEST_NAME"));
        //var subject = _util.coalesce(row.getField("TEST_SUBJECT"), row.getField(pType + "_TEST_SUBJECT"));
        var testNumber = testMetadata.TEST + "_" + row.getField("MASTER_ID");
    return testNumber;
   }

   function remove(testName){
       var unwanted = ["20021-2022", "2021-2022", "2022-2023", "2023-2024", "2021-22", "2022-23", "2023-24", "21-22", "22-23", "23-24", "2024", "2023", "2022", "2010", "20" ,"21", "22", "23", "24", "-", ";"];
       for(i of unwanted){
           if(testName.indexOf(i) > -1){
               var newTestName = testName.replaceAll(i, "")
               testName = newTestName;
           }else{
                newTestName = testName;
           }
       }
           newTestName = newTestName.replace(/[\])}[{(]/g,"").replaceAll(" ", "_");
       return newTestName;
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
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, null);
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, null);

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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, pType) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        if(pType!==null){
            assessmentAdminKey = assessmentAdminKey + "_" + pType;//_BNCH
        }

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
        return assessmentAdminKey;
    }

    return module;
}());