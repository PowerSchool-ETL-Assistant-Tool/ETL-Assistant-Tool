var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IREADY_LESSON";
    var _thisLineageSource = `Edvantage ${_assessmentIdentifier} Loader v1.0`;
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function (file, signature) {
        try {

            var signatureFormatName = signature.getFormat().getFormatName();
            print(`Loading using signature file ${signatureFormatName}\n`);


            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);

            print(`Normalized file: ${normalizedFile}\n`);

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
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
                    }

                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try {
                        if (!multipleRowsPerGroupingExpected && rows.length > 1) {

                            //Report error for each row
                            rows.forEach(function (row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"],
                    function (output, rows) {
                        try {

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function (record) {
                                output.RECORDS.put(record);
                            });

                        } catch (exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }


                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        // Report when no scores are found.
                        if (mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch (exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalizedFile;

        } catch (exception) {
            throw `${_thisModuleName}.createNormalizedFile Exception: ${exception}`;
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

             { MAP_FUNCTION: mapLessonScore, SUBJECT: 'OVERALL', TEST_NUMBER_SUFFIX: 'OVERALL', NAME: 'OVERALL' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'PHON_AWARE', NAME: 'PHONOLOGICAL_AWARENESS' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'PHONICS', NAME: 'PHONICS' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'HI_FREQ_WORD', NAME: 'HIGH-FREQUENCY_WORDS' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'VOCAB', NAME: 'VOCABULARY' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'READING_COMP', NAME: 'READING_COMPREHENSION' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'ELA', TEST_NUMBER_SUFFIX: 'READING_COMP_CLS_READING', NAME: 'READING_COMPREHENSION_CLOSE_READING' }

            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'NUM_OPS', NAME: 'NUMBER_AND_OPERATIONS' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'ALG', NAME: 'ALGEBRA_AND_ALGEBRAIC_THINKING' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'MEASURE', NAME: 'MEASUREMENT_AND_DATA' }
            , { MAP_FUNCTION: mapLessonScore, SUBJECT: 'MATH', TEST_NUMBER_SUFFIX: 'GEO', NAME: 'GEOMETRY' }
            , { MAP_FUNCTION: mapScaledScore, SUBJECT: '', TEST_NUMBER_SUFFIX: '', NAME: '' }

        ];


    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var ref_GradeDecodes = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "KG",
        "K": "KG",
        "" : null,
        null : null
    };

    var ref_GradeDecodesNum = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "0",
        "K": "0",
        "" : null,
        null : null
    };

    var lessonGradeDecode = {
        "1": "01",
        "01": "01",
        "2": "02",
        "02": "02",
        "3": "03",
        "03": "03",
        "4": "04",
        "04": "04",
        "5": "05",
        "05": "05",
        "6": "06",
        "06": "06",
        "7": "07",
        "07": "07",
        "8": "08",
        "08": "08",
        "9": "09",
        "09": "09",
        "10": "10",
        "11": "11",
        "12": "12",
        "KG": "0",
        "K": "0",
        "" : null,
        null : null
    };

    var lessonLevelDecode = {

        "Early": "Early",
        "Emerging": "Emerging",
        "Extra": "Extra",
        "Late": "Late",
        "Mid": "Mid",
        "" : null,
        null : null

    };

    var passDecode = {

        "Passed": "Yes",
        "Not Passed": "No",
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
//        for (var i = 0; i <= 5; i++) {
//            //There are 6 buckets, bucket 0 is most recent, buckets 1-5 represent other attempts
//            var record = mapNormalizedRecord(signature, hierarchy, row, i);
        var record = mapNormalizedRecord(signature, hierarchy, row);
            AppUtil.nullSafePush(normalizedRecords, record);
//       }
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
        scoresToMap.forEach(function (testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata,signature);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch (exception) {
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
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        if(row.getField("COMPLETION_DATE") !== "NULL"){
            if (row.getField("COMPLETION_DATE") !== null && row.getField("COMPLETION_DATE") !== undefined) {
                var format = getDateFormat(row.getField("COMPLETION_DATE"));
                var testDate = AppUtil.getDateObjByPattern(row.getField("COMPLETION_DATE"), format).STANDARD_DATE;
            }
            else {
                var testDate = null;
            }
        }else{
            var testDate = null;
        }
        var studentId = row.getField("STUDENT_ID");
        if(studentId !== null && studentId !== undefined && studentId !== "") {
           if(studentId.indexOf("_") > -1) {
             studentId = studentId.split("_")[0];
           }
           else {
             studentId = studentId;
           }
        }
        var studentGenderCode = null;
        var genderCode = row.getField("GENDER");
        if (genderCode != null){
            studentGenderCode = _util.trim(row.getField("GENDER") + "-").substring(0, 1).toUpperCase();
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
                case "PARTICIPATION_YEAR":
                    record.PARTICIPATION_YEAR = _util.coalesce(row.getField("ACADEMIC_YEAR"));
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(row, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = testDate;
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
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = studentId;
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = studentId;
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = studentId;
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = studentGenderCode;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(ref_GradeDecodes[row.getField("STUDENT_GRADE")]);
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = _util.coalesce(ref_GradeDecodes[row.getField("STUDENT_GRADE")]);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL"), row.getField("SCHOOL_ID"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL"));
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

    function mapLessonScore(row, testMetadata,signature) {
        var score = {};
        var subject = "";
        var isELA = false;

        if (row.getField("SUBJECT") == "Reading") {
            subject = "ELA";
            isELA = true;
        }

        if (isELA == false || row.getField("SUBJECT") == "Math"){
            subject = "MATH";
            isELA = false;
        }

        if (testMetadata.SUBJECT !== 'OVERALL' && testMetadata.SUBJECT !== subject) {
            return null;
        }

        //If a signature doesn't have lessons, don't add lessons
        if(signature.format.formatName !== "LA_iReadyELA" && signature.format.formatName !== "LA_iReadyMATH"){
            return null;
        }

      if (row.getField("COMPLETION_DATE") === undefined || row.getField("COMPLETION_DATE") === null) {
          return null;
      }

      var testNumber = 'IREADY_LES_' + subject + '_' + testMetadata.TEST_NUMBER_SUFFIX;
      var PassedScore = row.getField(testMetadata.NAME + '_LESSONS_PASSED');
      var FailedScore = row.getField(testMetadata.NAME + '_LESSONS_NOT_PASSED');
      var CompletedScore = row.getField(testMetadata.NAME + '_LESSONS_COMPLETED');
      var PassRateScore = row.getField(testMetadata.NAME + '_PASS_RATE_%');
      var TimeOnTaskScore = row.getField(testMetadata.NAME + '_TIME_ON_TASK_MIN');

      if (PassedScore === null || PassedScore === ""){
        PassedScore = "0";
        score["TEST_CUSTOM_RESULT"] = "Zero Score";
      }
      if(FailedScore === null || FailedScore === ""){
        FailedScore = "0";
      }
      if(CompletedScore === null || CompletedScore === ""){
        CompletedScore = "0";
        score["TEST_CUSTOM_RESULT"] = "Zero Score";
      }
      if(PassRateScore === null || PassRateScore === ""){
         PassRateScore = "0";
      }
      if(TimeOnTaskScore === null || TimeOnTaskScore === ""){
         TimeOnTaskScore = "0";
         score["TEST_CUSTOM_RESULT"] = "Zero Score";
      }

      score["TEST_NUMBER"] = testNumber;
      score["TEST_SCORE_TEXT"] = PassedScore;
      if (!isNaN(PassedScore) && PassedScore !== "0") {
          score["TEST_SCORE_VALUE"] = parseInt(PassedScore);
          score["TEST_SCALED_SCORE"] = parseInt(PassedScore);
          score["TEST_ITEMS_ATTEMPTED"] = parseInt(PassedScore);
      }
      else if (PassedScore === "0"){
          score["TEST_SCORE_VALUE"] =PassedScore;
          score["TEST_SCALED_SCORE"] = PassedScore;
          score["TEST_ITEMS_ATTEMPTED"] = PassedScore;
      }

      if(!isNaN(FailedScore) && FailedScore !== "0"){
        score["TEST_RAW_SCORE"] = parseInt(FailedScore);
      }
      else if(FailedScore === "0"){
        score["TEST_RAW_SCORE"] = FailedScore;
      }

      if(CompletedScore !== "0") {
        score["TEST_ITEMS_POSSIBLE"] = parseInt(CompletedScore);
      }
      else{
         score["TEST_ITEMS_POSSIBLE"] = CompletedScore;
      }

      if(PassRateScore !== "0"){
        score["TEST_PERCENTAGE_SCORE"] = parseInt(PassRateScore);
      }
      else{
        score["TEST_PERCENTAGE_SCORE"] =PassRateScore;
      }

      score["TEST_SCORE_ATTRIBUTES"] = TimeOnTaskScore;

      if (testMetadata.SUBJECT == "OVERALL") {
          if (row.getField("ANNUAL_TYPICAL_GROWTH_MEASURE") !== null) {
              score["TEST_GROWTH_TARGET_1"] = row.getField("ANNUAL_TYPICAL_GROWTH_MEASURE");
          }
          if (row.getField("ANNUAL_STRETCH_GROWTH_MEASURE") !== null) {
              score["TEST_GROWTH_TARGET_2"] = row.getField("ANNUAL_STRETCH_GROWTH_MEASURE");
          }
      }
      return score;
    }

    function mapScaledScore(row, testMetadata) {
        var score = {};

        var subject = "";

        if (row.getField("SUBJECT") === "Reading") {
            var subject = "ELA";
        }
        if (row.getField("SUBJECT") === "Math"){
            var subject = "MATH";
        }
          var testNumber = 'IREADY_LES_' + subject + '_' + getSubjectFromDomain(row);
          var scaleScore = row.getField("SCALE_SCORE");
          var lessonGrade = row.getField("LESSON_GRADE");
          var lessonLevel = row.getField("LESSON_LEVEL");
          var passedorNot = row.getField("PASSED_OR_NOT_PASSED");
          var timeOnTask = row.getField("OVERALL_TIME_ON_TASK_MIN");
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
            }
          score["TEST_PASSED_INDICATOR"] = passDecode[passedorNot];
          score["TEST_PRIMARY_RESULT"] = lessonLevel;
          score["TEST_PRIMARY_RESULT_CODE"] = lessonLevelDecode[lessonLevel];
          score["TEST_GRADE_EQUIVALENT"] = lessonGradeDecode[lessonGrade];
          score["TEST_SCORE_ATTRIBUTES"] =timeOnTask;

      return score;
    }

    function getSubjectFromDomain(row, testMetadata) {

            var subject = null;
            var domain = row.getField("DOMAIN");
            if(domain){
            var domainName = domain.toString().toUpperCase();
            if(domainName.indexOf("VOCABULARY")>-1){
                subject = "VOCAB";
            }
            else if (domainName.indexOf("PHONICS")>-1) {
                subject = "PHONICS";
            }
            else if(domainName.indexOf("COMPREHENSION")>-1){
                subject = "READING_COMP";
            }
            else if(domainName.indexOf("COMPREHENSION: CLOSE READING")>-1){
                subject = "READING_COMP_CLS_READING";
            }
            else if(domainName.indexOf("HIGH-FREQUENCY WORDS")>-1){
                subject = "HI_FREQ_WORD";
            }
            else if(domainName.indexOf("PHONOLOGICAL AWARENESS")>-1){
                subject = "PHON_AWARE";
            }
            else if(domainName.indexOf("NUMBER AND OPERATIONS")>-1){
                subject = "NUM_OPS";
            }
            else if(domainName.indexOf("ALGEBRA AND ALGEBRAIC THINKING")>-1){
                subject = "ALG";
            }
            else if(domainName.indexOf("MEASUREMENT AND DATA")>-1){
                subject = "MEASURE";
            }
            else if(domainName.indexOf("GEOMETRY")>-1){
                subject = "GEO";
            }
            return subject;
            }
        }
    /***************************************************************************
     Utility Functions
     ***************************************************************************/
    function getDateObject(rawDate) {

        var dateObj = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        // Check to see if date string exists
        if (rawDate !== undefined && rawDate !== null) {

            var year = '';
            var month = '';
            var day = '';

            if (rawDate.indexOf('-') > -1) {
                var positionOne = rawDate.indexOf('-');
                var positionTwo = rawDate.indexOf('-', (positionOne + 1));

                month = padDateElement(rawDate.substring(positionOne + 1, positionTwo));
                day = padDateElement(rawDate.substring(positionTwo + 1, positionTwo + 3));
                year = padDateElement(rawDate.substring(0, positionOne));
            } else if (rawDate.indexOf('/') > -1) {
                var positionOne = rawDate.indexOf('/');
                var positionTwo = rawDate.indexOf('/', (positionOne + 1));

                month = padDateElement(rawDate.substring(0, positionOne));
                day = padDateElement(rawDate.substring(positionOne + 1, positionTwo));
                year = padDateElement(rawDate.substring(positionTwo + 1, positionTwo + 5));

            }

            // Add century if missing
            if (year !== '' && year < 100) {
                year = '20' + year;
            }

            var standardDate = month + '/' + day + '/' + year;

            dateObj.RAW_DATE = rawDate;
            dateObj.MONTH = month;
            dateObj.DAY = day;
            dateObj.YEAR = year;
            dateObj.STANDARD_DATE = standardDate != '//' ? standardDate : null;

        }



        return dateObj;
    }

    function padDateElement(element) {
        if (element.length == 1)
            return '0' + element;
        else
            return element;
    }

    function getDateFormat(rawDate) {
        var format;

        if (rawDate.indexOf('/') > -1) {
            if (rawDate.split('/')[0].length === 4) {
                format = 'yyyy/MM/dd';
            }
            else if (rawDate.length === 9) {
                format = "M/dd/yyyy";
            }
            else if (rawDate.length === 10) {
                format = "MM/dd/yyyy";
            }
            else {
                format = 'MM/dd/yy';
            }
        } else if (rawDate.indexOf('-') > -1) {
            if (rawDate.split('-')[0].length === 4) {
                format = 'yyyy-MM-dd';
            } else if (rawDate.split('-')[1].length === 3) {
                format = 'dd-MMM-yy';
            } else if (rawDate.split('-')[2].length === 4) {
                format = 'MM-dd-yyyy';
            }
            else {
                format = 'MM-dd-yy';
            }
        }
        return format
    }

    function getTEST_ADMIN_PERIOD(row, filePeriod) {
        var testAdminPeriod = filePeriod;
        var windowSplit = "";
        var window = _util.trim(row.getField("Window"));
    if(row.getField("COMPLETION_DATE") !== "NULL"){
        if (filePeriod === 'ALL' && row.getField("COMPLETION_DATE") !== null && window === null) {
            var format = getDateFormat(row.getField("COMPLETION_DATE"));

            var sd = AppUtil.getDateObjByPattern(row.getField("COMPLETION_DATE"), format).STANDARD_DATE;
            var month = sd.substring(0, 2);

            if (month === "07" || month === "08" || month === "09" || month === "10")
                testAdminPeriod = "Fall";
            else if (month === "11" || month === "12" || month === "01" || month === "02")
                testAdminPeriod = "Winter";
            else if (month === "03" || month === "04" || month === "05" || month === "06")
                testAdminPeriod = "Spring";

        }
        else if (filePeriod === "ALL" && window !== null){
            if(window === "Beginning of Year"){
                testAdminPeriod = "BOY";
            } else if(window === "Middle of Year"){
                testAdminPeriod = "MOY";
            } else if(window === "End of Year"){
                testAdminPeriod = "EOY";
            }

        }
    }
        return testAdminPeriod;
    }

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

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
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
        var isELA = false;
        if ((JSON.stringify(srcRecord)).indexOf("LEXILE_MEASURE") > -1 || (JSON.stringify(srcRecord)).indexOf("PHONICS_LESSONS_COMPLETED") >-1 ) {
            subject = "ELA";
            isELA = true;
        }
        if (isELA == false) {
            subject = "MATH";
        }

        var sigName= signature.getFormat().getFormatName();


        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}` + "_" + subject;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function (key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
        });

        //Add date manually to conform
        if(srcRecord.getField("COMPLETION_DATE") !== "NULL"){
            if (srcRecord.getField("COMPLETION_DATE") !== null && srcRecord.getField("COMPLETION_DATE") !== undefined) {
                var format = getDateFormat(srcRecord.getField("COMPLETION_DATE"));
                var testDate = AppUtil.getDateObjByPattern(srcRecord.getField("COMPLETION_DATE"), format).STANDARD_DATE;
            }
            else {
                var testDate = null;
            }
        }else {
             var testDate = null;
        }
        assessmentAdminKey = assessmentAdminKey + "_" + testDate;

        //If a signature doesn't have lessons, don't add lessons
        if(signature.format.formatName === "LA_iReadyELA" || signature.format.formatName === "LA_iReadyMATH"){
            assessmentAdminKey = assessmentAdminKey + "_LESSON";
        }

        return assessmentAdminKey;
    }

    return module;
}());