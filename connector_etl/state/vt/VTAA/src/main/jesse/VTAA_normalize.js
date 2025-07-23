var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "VTAA";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
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
            print(`Loading using signature file ${signatureFormatName}`);

            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            var lineNumber = 0;
            const fileFullName = file.getFullName();

            _dataflow.create("RECORD BUILD")
                .input("INPUT", AppUtil.getInputDataflow(file, signature))
                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {

                    json.LINEAGE_FILE = fileFullName;
                    json.LINEAGE_LINE = (++lineNumber).toString();
                    output.RECORDS.put(json);
                })
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
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
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row.getSourceRow)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"], function(output, rows) {
                    try{
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                    }
                })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        if(mappingObject.SCORE_MAPPINGS === null || mappingObject.SCORE_MAPPINGS.length === 0) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                        } else {
                            output.RECORDS.put(row);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                    }
                })
                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
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

    var scoresToMap = [
        {TEST: "VTAA", MAP_FUNCTION: mapTotalScore}
    ];

    //Extend grades
    var gradeLookup = {
          "KG": "KG"
        , "01": "01"
        , "1": "01"
        , "G1": "01"
        , "grade 1": "01"
        , "02": "02"
        , "2": "02"
        , "G2": "02"
        , "grade 2": "02"
        , "03": "03"
        , "3": "03"
        , "G3": "03"
        , "grade 3": "03"
        , "04": "04"
        , "4": "04"
        , "G4": "04"
        , "grade 4": "04"
        , "05": "05"
        , "5": "05"
        , "G5":"05"
        , "grade 5": "05"
        , "06": "06"
        , "6": "06"
        , "G6": "06"
        , "grade 6": "06"
        , "07": "07"
        , "7": "07"
        , "G7": "07"
        , "grade 7": "07"
        , "08": "08"
        , "8": "08"
        , "G8": "08"
        , "grade 8": "08"
        , "09": "09"
        , "9": "09"
        , "G9": "09"
        , "grade 9": "09"
        , "10": "10"
        , "G10": "10"
        , "grade 10": "10"
        , "11": "11"
        , "G11": "11"
        , "grade 11": "11"
        , "12": "12"
        , "G12": "12"
        , "grade 12": "12"
        , null: null
        , "": null
     };

     //Extend subjects for Summative from file field
     var decodeSubject = {
        "ELA": "ELA"
        , "Mathematics": "MA"
        , "Science": "SCI"
        , null: "UNK"
        , "": "UNK"
     };

     var decodePassedInd = {
        "Beginning": "No"
        , "Approaching": "No"
        ,"Meets": "Yes"
        , "Exceeds ": "Yes"
        , "Exceeds": "Yes"
        , "": "UNK"
     }

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

        //Map normalized try {
        record = mapNormalizedAdminFields(signature, hierarchy, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Scores Mappings From Here Generic Build
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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var studentName = row.getField("STUDENT_NAME");
        var studentFirstName = studentName.split(',')[1];
        var studentLastName = studentName.split(',')[0];

        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        var birthDate = row.getField("STUDENT_DOB");
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        var testDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        var testDate = _util.coalesce(row.getField("TEST_COMPLETION_DATE"), row.getField("DATE_TAKEN"));
        if(testDate !== null && testDate !== undefined && testDate !== "") {
            testDateObject = AppUtil.getMonthFollowedByDay(testDate);
        }

        var testWindow = row.getField("TEST_REASON");

        var period = null;

        if (testWindow) {
            period = testWindow.split(' ')[0].toUpperCase();
        }

        normalizedFileFields.forEach(function (field) {
           switch (field) {
             case "ASSESSMENT_ADMIN_KEY":
                record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                break;
             case "SYS_PARTITION_VALUE":
                record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                break;
             case "DISTRICT_CODE":
                record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                break;
             case "SCHOOL_YEAR":
                record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                break;
             case "PARTICIPATION_YEAR":
                record.PARTICIPATION_YEAR = _util.coalesce(hierarchy.SCHOOL_YEAR);
                break;
             case "REPORTING_PERIOD":
                record.REPORTING_PERIOD =_util.coalesce(period, hierarchy.REPORTING_PERIOD);
                break;
             case "ASSESSMENT_VENDOR":
                record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                break;
             case "ASSESSMENT_PRODUCT":
                record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                break;
             case "TEST_ADMIN_DATE":
                record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;
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
                record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("ENROLLED_SCHOOL"));
                break;
             case "SCHOOL_STATE_ID":
                record.SCHOOL_STATE_ID = _util.coalesce(row.getField("ENROLLED_DISTRICT"));
                break;
             case "SCHOOL_NAME":
                record.SCHOOL_NAME = _util.coalesce(row.getField("ENROLLED_SCHOOL"));
                break;
             case "SCHOOL_LOCAL_ID":
                record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("ENROLLED_SCHOOL"));
                break;
             case "STUDENT_STATE_ID":
                record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"));
                break;
             case "STUDENT_VENDOR_ID":
                record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                break;
             case "STUDENT_FIRST_NAME":
                record.STUDENT_FIRST_NAME = studentFirstName;
                break;
             case "STUDENT_LAST_NAME":
                record.STUDENT_LAST_NAME = studentLastName;
                break;
             case "STUDENT_GENDER_CODE":
                record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER")) !== null ? _util.coalesce(row.getField("GENDER")).substring(0, 1) : null;
                break;
             case "STUDENT_GRADE_CODE":
                record.STUDENT_GRADE_CODE = gradeLookup[row.getField("ENROLLED_GRADE")];
                break;
             case "PARTICIPATION_GRADE":
                record.PARTICIPATION_GRADE = gradeLookup[row.getField("ENROLLED_GRADE")];
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
    function mapAdditionalAdminFields(row){
        var admin = {};
        return admin;
    }

    function mapTotalScore(row) {
        let score = {};

        var testNumber = decodeTestNumber(row);

        let scaleScore = row.getField('SCALE_SCORE');
        let scoreStandardError = row.getField('SCALE_SCORE_STDERROR');
        let primaryResult = row.getField('PERFORMANCE');

        if (scaleScore === null || scaleScore === undefined || scaleScore == "") {
           return null;
        }

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;

        if (!isNaN(scaleScore)) {
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (!isNaN(scoreStandardError)) {
        score["TEST_STANDARD_ERROR"] = scoreStandardError;
        }

        score["TEST_PRIMARY_RESULT"] = primaryResult;

        score["TEST_PASSED_INDICATOR"] = decodePassedInd[primaryResult];

        return score;
     }

     function decodeTestNumber(row) {

        let testSubject = decodeSubject[row.getField('TEST_SUBJECT')];

        let grade = gradeLookup[row.getField('ENROLLED_GRADE')];

        return _assessmentIdentifier + '_' + testSubject + '_' + grade;
     }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

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

        var testWindow = srcRecord.getField("TEST_REASON");

        var period = null;

        if (testWindow) {
            period = testWindow.split(' ')[0].toUpperCase();
        }

        var reportingPeriod = _util.coalesce(period, hierarchy.REPORTING_PERIOD);

        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${reportingPeriod}`;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        var grade = gradeLookup[srcRecord.getField("ENROLLED_GRADE")];

        var subject = decodeSubject[srcRecord.getField("TEST_SUBJECT")];

        assessmentAdminKey = assessmentAdminKey + '_' + subject + '_' + grade;

        return assessmentAdminKey;
    }

    return module;
}());