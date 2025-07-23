var AppNormalize = (function () {
  var module = {};
  var _thisModuleName = "AppNormalize";
  var _assessmentIdentifier = "ILEARN";
  var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
  var multipleRowsPerGroupingExpected = false;
  /**
   * This function will convert the source file given into the normalized assessment format.
   *
   * @param file The raw source file being reviewed.
   * @param signature The signature file details in JSON format.
   * @returns {String} The location of the normalized file.
   */
  module.createNormalizedFile = function (file, signature) {
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
              .group_by("ADMINISTRATION GROUPING", function (one, two) {

                  try {
                      var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                      var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                      return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                  } catch (exception) {
                      AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, exception, JSON.stringify(one) + '|' + JSON.stringify(two)));
                  }

              })
              .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                  try {
                      if (!multipleRowsPerGroupingExpected && rows.length > 1) {

                          //Report error for each row
                          rows.forEach(function (row) {
                              AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                          });

                      } else {
                          output.RECORDS.put(rows);
                      }
                  } catch (exception) {
                      AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK: ${exception}", JSON.stringify(rows)));
                  }

              })
              .transform("TRANSFORM", ["RECORDS"],
                  function (output, rows) {

                      var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                      normalizedRecords.forEach(function (record) {
                          output.RECORDS.put(record);
                      });

                  })
              .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                  var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
                  if (mappingObject.SCORE_MAPPINGS.length === 0) {
                      AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                  } else {
                      output.RECORDS.put(row);
                  }
              })
              .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
              .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

          return normalizedFile;

      } catch (exception) {
          throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
      }
  };

  /**
   * Merges a normalized file into the master normalized file.
   *
   * @param file The normalized assessment file to be merged.
   * @returns {file} The merged normalized file.
   */
  module.mergeAssessment = function (file) {
      return AppDataflow.mergeAssessment(file);
  };

  /***************************************************************************
   Assessment-specific Objects
   ***************************************************************************/

  var scoresToMap =
      [
          //Overall Scores
          { TEST: "ILEARN", CODE: "OVR", FIELD: "OVERALL", MAP_FUNCTION: mapOverallScore },
          //Reporting Scores
          { TEST: "ILEARN", CODE: "RPT", FIELD: "REPORTING", MAP_FUNCTION: mapReportingPerformanceLevel },
                //ELA
          { TEST: "ILEARN", CODE: "ELA_VOC_RPT", FIELD: "VOCABULARY", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "ELA_MEDLIT_RPT", FIELD: "MEDIA_LITERACY", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "ELA_WR_RPT", FIELD: "WRITING", MAP_FUNCTION: mapReportingPerformanceLevel },
                //MATH
          { TEST: "ILEARN", CODE: "MA_DAN_RPT", FIELD: "DATA_ANALYSIS", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "MA_PROB_RPT", FIELD: "PROBABILITY", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "MA_COMP_RPT", FIELD: "COMPUTATION", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "MA_GEO_RPT", FIELD: "GEOMETRY_AND_MEASUREMENT", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "MA_NUMS_RPT", FIELD: "NUMBER_SENSE", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "MA_ALG_RPT", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapReportingPerformanceLevel },
                //SCIENCE
          { TEST: "ILEARN", CODE: "SCI_QM_RPT", FIELD: "QUESTIONING_AND_MODELING", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SCI_INV_RPT", FIELD: "INVESTIGATING", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SCI_COMP_RPT", FIELD: "COMPUTATIONAL_THINKING", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SCI_CR_RPT", FIELD: "COMMUNICATING", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SCI_EVAL_RPT", FIELD: "EVALUATING_CLAIMS_WITH_EVIDENCE", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SCI_EXP_RPT", FIELD: "DEVELOPING_AND_USING_MODELS_TO_EXPLAIN_PROCESSES", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SCI_DESC_RPT", FIELD: "DEVELOPING_AND_USING_MODELS_TO_DESCRIBE_STRUCTURE_AND_FUNCTION", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SCI_ANA_RPT", FIELD: "ANALYZING_DATA_AND_MATHEMATICAL", MAP_FUNCTION: mapReportingPerformanceLevel },
                //SOCIAL SCIENCE
          { TEST: "ILEARN", CODE: "SOSCI_CIV_RPT", FIELD: "CIVICS", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SOSCI_GEOG_RPT", FIELD: "GEOGRAPHY", MAP_FUNCTION: mapReportingPerformanceLevel },
          { TEST: "ILEARN", CODE: "SOSCI_HIS_RPT", FIELD: "HISTORY", MAP_FUNCTION: mapReportingPerformanceLevel },
          //Scale Scores
          { TEST: "ILEARN", CODE: "ELA", FIELD: "ELA", MAP_FUNCTION: mapOverallScore },
          { TEST: "ILEARN", CODE: "MATH", FIELD: "MATH", MAP_FUNCTION: mapOverallScore },
          { TEST: "ILEARN", CODE: "SCI", FIELD: "SCIENCE", MAP_FUNCTION: mapOverallScore },
          { TEST: "ILEARN", CODE: "SOC", FIELD: "SOCIAL", MAP_FUNCTION: mapOverallScore },
          { TEST: "ILEARN", CODE: "BIO", FIELD: "BIO", MAP_FUNCTION: mapOverallScore }
      ];

  /***************************************************************************
   Assessment-specific decodes
   ***************************************************************************/

  var gradeLookup = {
      "03": "03"
      , "Level 3": "03"
      , "3": "03"
      , "04": "04"
      , "Level 4": "04"
      , "4": "04"
      , "05": "05"
      , "Level 5": "05"
      , "5": "05"
      , "06": "06"
      , "Level 6": "06"
      , "6": "06"
      , "07": "07"
      , "Level 7": "07"
      , "7": "07"
      , "08": "08"
      , "Level 8": "08"
      , "8": "08"
      , "09": "09"
      , "Level 9": "09"
      , "9": "09"
      , "10": "10"
      , "Level 10": "10"
      , "10": "10"
      , "11": "11"
      , "Level 11": "11"
      , "11": "11"
      , "12": "12"
      , "Level 12": "12"
      , "12": "12"

  };

  var decodeProficiencyLevel = {
      "Below Proficiency": "Did Not Pass"
      , "Approaching Proficiency": "Did Not Pass"
      , "At Proficiency": "Pass"
      , "Above Proficiency": "Pass"
      , "Undetermined": "Undetermined"
      , "N/A": "N/A"
  };

  var decodePerformanceLevel = {
      "Below": "Did Not Pass"
      , "At/Near": "Pass"
      , "Above": "Pass"
      , "Undetermined": "Undetermined"
      , "N/A": "N/A"
      , "Above": "Pass"
  };
  var readinessDecode = {
      "Invalidated": "No"
      , "Undetermined": "No"
      , "N/A": "N/A"
      , "No": "No"
      , "Yes": "Yes"
      , "Below": "No"
      , "At/Near": "Yes"
      , "Above": "Yes"
  };
  var encodes = {
       "0"	 : "0",
       "1"	 : "1",
       "2"	 : "2",
       "3"	 : "3",
       "4"	 : "4",
       "Insufficient" : "INS",
       "N/A" : "N/A",
       "Non-Scorable Language" : "NSL",
       "Off Topic" : "OT",
       "Off Purpose" : "OP",
       "Blank" : "Blank",
       ""   : null

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
   * @param object Signature file object.
   * @param JSON JSON object representing data path hierarchy.
   * @param array Array containing JSON objects representing raw data by physical name.
   * @returns {array} Mapped normalized records.
   */
  function mapNormalizedRecords(signature, hierarchy, rows) {
      var normalizedRecords = [];

      //Base administration off of first row in grouping and convert to lookup object.
      var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

      var record = mapSingleNormalizedRecord(signature, hierarchy, row);

      AppUtil.nullSafePush(normalizedRecords, record);

      return normalizedRecords;

  }

  /**
   * Map a normalized record for given row and set of administration metadata.
   *
   * @param object Signature file object.
   * @param JSON JSON object representing data path hierarchy.
   * @param module Module representing raw data by logical name.
   * @param JSON JSON object representing administration metadata.
   * @returns {object} Mapped normalized record.
   */
  function mapSingleNormalizedRecord(signature, hierarchy, row) {
      var record = {};
      var mappingObject = {};

      mappingObject.SCORE_MAPPINGS = [];
      mappingObject.ADMIN_MAPPINGS = {};
      mappingObject.ASSESSMENT_METADATA = {};
      mappingObject.ASSESSMENT_METADATA.TESTS = [];
      mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

      //Map normalized admin fields
      record = mapNormalizedAdminFields(signature, hierarchy, row)

      //Map score fields for each expected score mapping
      scoresToMap.forEach(function (testMetadata) {
          var score = {};
          if ((testMetadata.CODE).indexOf("RPT") === -1) {
              score = (testMetadata.MAP_FUNCTION)(row, testMetadata, signature);
              AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
          } else {
              for (let i = 1; i <= 7; i++) {
                  score = (testMetadata.MAP_FUNCTION)(row, testMetadata, i, signature);
                  AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
              }
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
   * @param JSON JSON object representing data path hierarchy.
   * @param object JavaScript object representing a normalized row mapping.
   * @param module Module representing raw data by logical name.
   * @param JSON JSON object representing administration metadata.
   * @returns {object} JavaScript object representing a normalized row mapping.
   */
   function getTEST_ADMIN_PERIOD(row,hierarchy) {
       var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
       var testDate =  getTestAdminDate(row.getField("TEST_ADMIN_DATE"));
       var testAdminPeriod = null;
       if(fileName.indexOf('FALL') > -1){
           testAdminPeriod = "FALL";
       }else if(fileName.indexOf('WINTER') > -1){
           testAdminPeriod = "WINTER";
       } else if(fileName.indexOf('SPRING') > -1){
           testAdminPeriod = "SPRING";
       }else if (testDate !== null && testDate !== undefined && testDate !== '' ) {
            var month = testDate.substring(0, 2);
            if (month === "07" || month === "08" || month === "09" || month === "10")
                testAdminPeriod = "FALL";
            else if (month === "11" || month === "12" || month === "01" || month === "02")
                testAdminPeriod = "WINTER";
            else if (month === "03" || month === "04" || month === "05" || month === "06")
                testAdminPeriod = "SPRING";
       }
       else {
           testAdminPeriod = "ALL";
       }
       return testAdminPeriod;
   }
   function getTestAdminDate(testDate){
        var testAdminDate = null;
        if(testDate){
            if(testDate.indexOf('-') > -1){
                testAdminDate = AppUtil.getDateObjByPattern(testDate, "MM-dd-yyyy").STANDARD_DATE;
            }
            else if(testDate.indexOf('/') > -1){
                testAdminDate = AppUtil.getDateObjByPattern(testDate, "MM/dd/yyyy").STANDARD_DATE;
            }
        }
        return testAdminDate;
   }

  function mapNormalizedAdminFields(signature, hierarchy, row) {
      var record = {};
      var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

      var testDateField = _util.coalesce(row.getField("STUDENT_DOB"),("05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9)));
      var birthDateObject = module.mapDateObject(hierarchy, row, testDateField);

      if (signature.getFormat().getFormatName() === "ILEARN_32_1_COLS" || signature.getFormat().getFormatName() === "ILEARN_22_1_COLS"
          || signature.getFormat().getFormatName() === "ILEARN_23_1_COLS" || signature.getFormat().getFormatName() === "ILEARN_24_1_COLS"
          || signature.getFormat().getFormatName() === "ILEARN_24_2_COLS" || signature.getFormat().getFormatName() === "ILEARN_32_2_COLS"
          || signature.getFormat().getFormatName() === "ILEARN_24_3_COLS"){

          var localName = row.getField("SCHOOL_ENROLLED_NAME");
          var schoolID = localName.match(/\(([^)]+)\)/)[1].split("_")[1];
          var schoolName = localName.replace(/\([^)]+\)/, '');

          var studentName = row.getField("STUDENT_NAME");
          var firstName = _util.trim(studentName.split(",")[1]);
          var lastName = _util.trim(studentName.split(",")[0]);

      } else if(signature.getFormat().getFormatName() === "ILEARN_55_1_COLS" || signature.getFormat().getFormatName() === "ilearn_54"){

          var localName = _util.coalesce(row.getField("SCHOOL_ENROLLED_NAME"), row.getField("SCHOOL_LOCAL_ID"));
              if(localName.indexOf("_") >= -1){
                var schoolID = localName.split("_")[1];
                var schoolName = row.getField("SCHOOL_NAME");
              }else{
                var schoolID = row.getField("SCHOOL_LOCAL_ID");
                var schoolName = row.getField("SCHOOL_NAME");
              }
      }
      normalizedFileFields.forEach(function (field) {
          switch (field) {
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
                  record.REPORTING_PERIOD = _util.coalesce(getTEST_ADMIN_PERIOD(row,hierarchy),hierarchy.REPORTING_PERIOD.toUpperCase());
                  break;
              case "TEST_REPORTING_DATE":
                  record.TEST_REPORTING_DATE = null;
                  break;
              case "ASSESSMENT_VENDOR":
                  record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                  break;
              case "ASSESSMENT_PRODUCT":
                  record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                  break;
              //School Info
              case "SCHOOL_LOCAL_ID":
                  record.SCHOOL_LOCAL_ID = row.getField("SCHOOL_LOCAL_ID");
                  break;
              case "SCHOOL_STATE_ID":
                  record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"));
                  break;
              case "SCHOOL_VENDOR_ID":
                  record.SCHOOL_VENDOR_ID = _util.coalesce(schoolID, row.getField("SCHOOL_LOCAL_ID"));
                  break;
              case "SCHOOL_NAME":
                  record.SCHOOL_NAME = _util.coalesce(schoolName, row.getField("SCHOOL_NAME"));
                  break;
              case "TEST_ADMIN_DATE":
                  record.TEST_ADMIN_DATE = _util.coalesce(getTestAdminDate(row.getField("TEST_ADMIN_DATE")),'05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
                  break;
              //Student Info
              case "STUDENT_DOB_MONTH":
                  record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
                  break;
              case "STUDENT_DOB_DAY":
                  record.STUDENT_DOB_DAY = birthDateObject.DAY;
                  break;
              case "STUDENT_DOB_YEAR":
                  record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
                  break;
              case "STUDENT_GRADE_CODE":
                  record.STUDENT_GRADE_CODE = gradeLookup[row.getField("STUDENT_GRADE_CODE")];
                  break;
              case "STUDENT_STATE_ID":
                  record.STUDENT_STATE_ID = row.getField("STUDENT_STATE_ID");
                  break;
              case "STUDENT_VENDOR_ID":
                  record.STUDENT_VENDOR_ID = row.getField("STUDENT_STATE_ID");
                  break;
              case "STUDENT_GENDER_CODE":
                  record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0, 1);
                  break;
              case "STUDENT_FIRST_NAME":
                  record.STUDENT_FIRST_NAME = _util.coalesce(firstName, row.getField("STUDENT_FIRST_NAME"));
                  break;
              case "STUDENT_LAST_NAME":
                  record.STUDENT_LAST_NAME = _util.coalesce(lastName, row.getField("STUDENT_LAST_NAME"));
                  break;
              default:
                  record[field] = row.getField(field);
                  break
          }
      });

      return record;

  }

  /**
   * Maps additional administration fields based on a given set of administration metadata.
   *
   * @param object JavaScript object representing a normalized row mapping.
   * @param module Module representing raw data by logical name.
   * @param JSON JSON object representing administration metadata.
   * @returns {object} JavaScript object containing administration row mappings.
   */

  /***********************************************************************************
   Assessment-specific score functions
   ***********************************************************************************/
  function mapOverallScore(row, testMetadata, signature) {
      var score = {};
      var testNumber = generateTestNumber(row, testMetadata, signature);
      var scaleScore = _util.trim(row.getField(testMetadata.FIELD + "_SCALE_SCORE"));
      var proficiency = row.getField(testMetadata.FIELD + "_PROFICIENCY_LEVEL");
      var readinessIndicator = _util.coalesce(row.getField("COLLEGE_AND_CAREER_READINESS_INDICATOR"),row.getField(testMetadata.FIELD + "_COLLEGE_AND_CAREER_READINESS_INDICATOR"));
      var lexileScore = _util.coalesce(row.getField("REPORTED_LEXILE"),row.getField("REPORTED_QUANTILE"),row.getField(testMetadata.FIELD + "_REPORTED_LEXILE"),row.getField(testMetadata.FIELD + "_REPORTED_QUANTILE"));
      var lexile;

      if (scaleScore === null || scaleScore === undefined || scaleScore === "" || scaleScore === "UND") {
        return null;
      }

      if (lexileScore) {
        lexile = lexileScore.replace("Q", "").replace("L", "");
      }

      score["TEST_NUMBER"] = testNumber;

      score["TEST_SCORE_TEXT"] = scaleScore;
      if (!isNaN(scaleScore)) {
          score["TEST_SCORE_VALUE"] = scaleScore;
          score["TEST_SCALED_SCORE"] = scaleScore;
      }
      score["TEST_READING_LEVEL"] = lexile;
      score["TEST_PRIMARY_RESULT"] = proficiency;
      score["TEST_PRIMARY_RESULT_CODE"] = decodeProficiencyLevel[proficiency];
      score["TEST_PASSED_INDICATOR"] = readinessDecode[readinessIndicator];

      //Readiness
      score["TEST_TERTIARY_RESULT"] = readinessIndicator;
      //Lexiles
      score["TEST_QUATERNARY_RESULT"] = lexile;

      return score;
  }

  function getSubject(row) {
      var subject = row.getField("TEST_NAME");
      if(subject){
        if (subject.indexOf('English') > -1) {
            return 'ELA'
        } else if (subject.indexOf('Mathematics') > -1) {
            return 'MA'
        } else if (subject.indexOf('Science') > -1) {
            return 'SCI'
        } else if (subject.indexOf('Biology') > -1) {
            return 'BIO'
        }
        return 'SOSCI';
      }
  }
  function mapReportingPerformanceLevel(row, testMetadata, i, signature) {
      var score = {};
      var testNumber = generateTestNumber(row, testMetadata , signature) + i;
      var performanceLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_CATEGORY_" + i + "_PERFORMANCE"),_util.trim(row.getField(testMetadata.FIELD + "_REPORTING_CATEGORY_ACHIEVEMENT")));
      if ((_util.trim(performanceLevel) === null || _util.trim(performanceLevel) === undefined || _util.trim(performanceLevel) === "" || _util.trim(performanceLevel) === "UND")) {
          return null;
      }
      score["TEST_NUMBER"] = testNumber;
      score["TEST_PRIMARY_RESULT"] = performanceLevel;
      score["TEST_PRIMARY_RESULT_CODE"] = decodePerformanceLevel[performanceLevel];
      score["TEST_PASSED_INDICATOR"] = readinessDecode[performanceLevel];
      return score;
  }


  /***************************************************************************
   Utility Functions
   ***************************************************************************/

  function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

      try {
          var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
          var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);
          if (assessmentAdminKey_one === assessmentAdminKey_two) {
              return 1;
          } else {
              return -1;
          }

      } catch (exception) {
          throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
      }
  }

  function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
      var assessmentAdminKey = null;
      var year = hierarchy.SCHOOL_YEAR.substring(5, 9);
      var adminPeriod = getTEST_ADMIN_PERIOD(srcRecord,hierarchy);
      // Set base assessment admin key information
      assessmentAdminKey = _assessmentIdentifier
          + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
          + "_" + AssessmentLoader.config.DISTRICT_CODE;
      if(signature.getFormat().getFormatName() === 'ilearn_54'){
          var subject = getSubject(srcRecord);
          assessmentAdminKey = assessmentAdminKey + "_" + subject;
      }
      //Add natural key fields
      signature.getFormat().getNaturalKey().forEach(function (key) {
          assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
      });
      assessmentAdminKey = assessmentAdminKey + "_" + adminPeriod + "_" + year;
      return assessmentAdminKey;
  }

  function generateTestNumber(row, testMetadata, signature) {
      //student grade is the student's grade (admin) not the grade of the tests
      //test grade should be pulled from the file name
      //if cannot be determined then fall back to student grade
      var testNumber = null;
      var subject = getSubject(row);

      var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
      var flName =  fileName.substring(fileName.lastIndexOf('/')+1).replaceAll('%20','_');
      var grade = null;
      if (flName.indexOf("Grade5") >-1 || flName.indexOf("GRADE8") >-1){
        grade = "08";
      }else if (flName.indexOf("Grade3") >-1 || flName.indexOf("GRADE3") >-1){
        grade = "03";
      }else if (flName.indexOf("Grade4") >-1 || flName.indexOf("GRADE4") >-1){
         grade = "04";
      }else if (flName.indexOf("Grade5") >-1 || flName.indexOf("GRADE5") >-1) {
         grade = "05";
      }else if (flName.indexOf("Grade6") >-1 || flName.indexOf("GRADE6") >-1){
         grade = "06";
      }else if (flName.indexOf("Grade7") >-1 || flName.indexOf("GRADE7") >-1){
         grade = "07";
      }else if (flName.indexOf("Grade8") >-1 || flName.indexOf("GRADE8") >-1){
         grade = "08";
      }else{
        grade = gradeLookup[row.getField("STUDENT_GRADE_CODE")];
      }
      if (signature.getFormat().getFormatName() === "ILEARN_32_1_COLS" || signature.getFormat().getFormatName() === "ILEARN_22_1_COLS"
      || signature.getFormat().getFormatName() === "ILEARN_23_1_COLS" || signature.getFormat().getFormatName() === "ILEARN_24_1_COLS"
      || signature.getFormat().getFormatName() === "ILEARN_24_2_COLS" || signature.getFormat().getFormatName() === "ILEARN_32_2_COLS"
      || signature.getFormat().getFormatName() === "ILEARN_24_3_COLS"){

        testNumber = testMetadata.TEST + grade + testMetadata.CODE;
      }
      else if(signature.getFormat().getFormatName() === 'ilearn_54'  || signature.getFormat().getFormatName() === 'ILEARN_55_1_COLS' ){
        testNumber = testMetadata.TEST + gradeLookup[row.getField("STUDENT_GRADE_CODE")] + subject + testMetadata.CODE;
      }
      else{
        testNumber = testMetadata.TEST + gradeLookup[row.getField("STUDENT_GRADE_CODE")] + testMetadata.CODE;
      }
      return testNumber;
  }

  module.mapDateObject = function (hierarchy, row, dateStr) {

          //Create empty test date object.
          var testDateObject = null

          //Admin dates in file are yyyy-MM-dd format or MM/dd/yyyy format.  Attempt to map both.
          try {
              testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd/MM/yyyy");
          } catch(exception){
              // Error will be reported in final check.
          }

          if(testDateObject === null){
              try {
                  testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd-MM-yyyy");
              } catch(exception){
                  // Error will be reported in final check.
              }
          }
          if(testDateObject === null){
              try {
                  testDateObject = AppUtil.getDateObjByPattern(dateStr, "MMddyyyy");
              } catch(exception){
                  // Error will be reported in final check.
              }
          }
          if(testDateObject === null){
              try {
                  testDateObject = AppUtil.getDateObjByPattern(dateStr, "Mddyyyy");
              } catch(exception){
                  // Error will be reported in final check.
              }
          }
          if(testDateObject === null){
              try {
                  testDateObject = AppUtil.getDateObjByPattern(dateStr, "dd/MM/yyyy");
              } catch(exception){
                  // Error will be reported in final check.
              }
          }
          if(testDateObject === null){
              try {
                  testDateObject = AppUtil.getDateObjByPattern(dateStr, "M/d/yyyy");
              } catch(exception){
                  // Error will be reported in final check.
              }
          }
          // Set default empty objects if mappings fail and report error.
          if(testDateObject === null){
              testDateObject = AppUtil.getEmptyDateObj(dateStr);
              AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING",row.getRawField("LINEAGE_LINE"), "Error parsing date string: ${dateStr}", JSON.stringify(row.getSourceRow())));
          }

          return testDateObject;
      }

  function parseDate(rawDate) {

      var dateObj = {
          RAW_DATE: rawDate
          , MONTH: null
          , DAY: null
          , YEAR: null
          , STANDARD_DATE: null
      };

      var formatter;

      // Exit if no value is provided.
      if (_util.trim(_util.coalesce(rawDate, "")) === "") {
          return dateObj;
      }

      if (rawDate.length() > 8 && rawDate.indexOf('/') > -1) {
          formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
      } else if (rawDate.length() > 8 && rawDate.indexOf('-') > -1) {
          formatter = new java.text.SimpleDateFormat("dd-MM-yyyy");
      }else if (rawDate.length() === 7 && (rawDate.indexOf('-') == -1 ||rawDate.indexOf('/') == -1 ) ) {
          formatter = new java.text.SimpleDateFormat("Mddyyyy");
      }else if (rawDate.length() === 8 && (rawDate.indexOf('-') == -1 ||rawDate.indexOf('/') == -1 ) ) {
          formatter = new java.text.SimpleDateFormat("MMddyyyy");
      }else {
          formatter = new java.text.SimpleDateFormat("dd/MM/yyyy");
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

  /*******************************************
   End of module.  Return module object.
   *******************************************/
  return module;
}());
