var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ELDA";
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

                        if(mappingObject.SCORE_MAPPINGS.length === 0) {
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
        // ELDA Overall
        {TEST: "ELDA", CODE:"_OVERALL", FIELD: "_OVERALL", MAP_FUNCTION: mapOverallScore}
        // Comprehension
        ,{TEST: "ELDA", CODE:"_COMPR", FIELD: "_OVERALL", MAP_FUNCTION: mapComprehensionScore}
        // Reading
        ,{TEST: "ELDA", CODE:"_READING", FIELD: "_RD", MAP_FUNCTION: mapComponentScore}
        // Writing
        ,{TEST: "ELDA", CODE:"_WRITING", FIELD: "_WT", MAP_FUNCTION: mapComponentScore}
        // Listening
        ,{TEST: "ELDA", CODE:"_LISTENING", FIELD: "_LIS", MAP_FUNCTION: mapComponentScore}
        // Speaking
        ,{TEST: "ELDA", CODE:"_SPEAKING", FIELD: "_SPK", MAP_FUNCTION: mapComponentScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

      var proficiencyLvlDecode = {
             "1" : "Beginning Proficiency"
             ,"2" : "Lower Intermediate Proficiency"
             ,"3" : "Upper Intermediate Proficiency"
             ,"4" : "Advanced Proficiency"
             ,"5" : "Full English Proficiency"
             ,"" : null
             ,null : null
      };

      var productionLvlDecode = {
           "1" : "Level 1"
           ,"2" : "Level 2"
           ,"3" : "Level 3"
           ,"4" : "Level 4"
           ,"5" : "Level 5"
           ,"" : null
           ,null : null
      };

      var comprehensionLvlDecode = {
             "1" : "Level 1"
             ,"2" : "Level 2"
             ,"3" : "Level 3"
             ,"4" : "Level 4"
             ,"5" : "Level 5"
             ,"" : null
             ,null : null
      };
      var overallProficiencyDecode = {
              "Emerging" : "E"
              ,"Progressing 1" : "P1"
              ,"Progressing 2" : "P2"
              ,"Progressing 3" : "P3"
              ,"Transitioning/Proficient" : "T"
              ,"" : null
              ,null : null
      };
      var compositeLvlDecode = {
           "1" : "Level 1"
           ,"2" : "Level 2"
           ,"3" : "Level 3"
           ,"4" : "Level 4"
           ,"5" : "Level 5"
           ,"" : null
           ,null : null
      };
    var gradeDecode = {
       "KG" : "KG"
        , "0" : "KG"
        , "1" : "01"
        , "01" : "01"
        , "2" : "02"
        , "02" : "02"
        , "3" : "03"
        , "03" : "03"
        , "4" : "04"
        , "04" : "04"
        , "5" : "05"
        , "05" : "05"
        , "6" : "06"
        , "06" : "06"
        , "7" : "07"
        , "07" : "07"
        , "8" : "08"
        , "08" : "08"
        , "9" : "09"
        , "09" : "09"
        , "10" : "10"
        , "11" : "11"
        , "12" : "12"
        ,"T9"  : "T9"
        ,"15"  : "15"
        ,"20"  : "PS"
        ,"PS"  : "PS"
        ,"24"  : "PK"
        ,"PK"  : "PK"
        ,"25"  : "KG"
        ,"35"  : "35"
        , null : null
        , "" : null
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
            print(exception);
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
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
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("DOB"), "yyyy-MM-dd");

        var testRptDate = null;

        if(row.getField("TEST_DATE_MONTH") == null || row.getField("TEST_DATE_MONTH") == undefined || row.getField("TEST_DATE_MONTH") == "" ||
            row.getField("TEST_DATE_YEAR") == null || row.getField("TEST_DATE_YEAR") == undefined || row.getField("TEST_DATE_YEAR") == "") {
               testRptDate = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
        } else {
             testRptDate = row.getField("TEST_DATE_MONTH") + "/15/" + row.getField("TEST_DATE_YEAR");
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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(row.getField("TEST_DATE_MONTH") +"/15/" + row.getField("TEST_DATE_YEAR"), "M/d/yyyy").STANDARD_DATE;
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(row.getField("SUMMARIZED_DOB_MONTH"), birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(row.getField("SUMMARIZED_DOB_DAY"), birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(row.getField("SUMMARIZED_DOB_YEAR"), birthDateObject.YEAR, null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = AssessmentLoader.config.DISTRICT_CODE + "" + _util.coalesce(row.getField("SCHOOL_CODE"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = AssessmentLoader.config.DISTRICT_CODE + "" +_util.coalesce(row.getField("SCHOOL_CODE"));
                     break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = null;
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                     break;
                 case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_ID"));
                      break;
                 case "STUDENT_FIRST_NAME":
                     record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                     break;
                 case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_INITIAL"));
                     break;
                 case "STUDENT_LAST_NAME":
                     record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                     break;
                 case "STUDENT_GENDER_CODE":
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("SUMMARIZED_GENDER"), row.getField("LAP_GENDER"), row.getField("BUBBLED_GENDER"));
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeDecode[_util.coalesce(row.getField("SUMMARIZED_REPORTING_GRADE"), row.getField("BUBBLED_GRADE"))];
                     break;
                 case "TEST_REPORTING_DATE":
                 	record.TEST_REPORTING_DATE = testRptDate;
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
    function mapComponentScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var rawScore = row.getField("RAW_SCORE" + testMetadata.FIELD);
        var scaleScore = row.getField("SCALED_SCORE" + testMetadata.FIELD);
        var proficiencyLvl = row.getField("PROFICIENCY_LEVEL" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;

    	score["TEST_RAW_SCORE"] = rawScore;

        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

        score["TEST_PRIMARY_RESULT_CODE"] = proficiencyLvl;
    	score["TEST_PRIMARY_RESULT"] = proficiencyLvlDecode[proficiencyLvl];
        return score;
    }

    function mapOverallScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var compositeLvlScore = row.getField("COMPOSITE_LEVEL" + testMetadata.FIELD);
        var productionLvlScore = row.getField("PRODUCTION_LEVEL" + testMetadata.FIELD);
        var compositeScore = row.getField("COMPOSITE_SCORE" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if((compositeLvlScore === null || compositeLvlScore === undefined || _util.trim(compositeLvlScore) === "--" || _util.trim(compositeLvlScore) === "") &&
          (productionLvlScore === null || productionLvlScore === undefined || _util.trim(productionLvlScore) === "--" || _util.trim(productionLvlScore) === "")){
            return null;
        }
        var proficiency = mapOverallProficiency(row, testMetadata);
        var proficiencyDecode = overallProficiencyDecode[proficiency];
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCALED_SCORE"] = compositeScore;

        score["TEST_PRIMARY_RESULT_CODE"] = proficiencyDecode;
        score["TEST_PRIMARY_RESULT"] = proficiency;

        score["TEST_SECONDARY_RESULT_CODE"] = compositeLvlScore;
        score["TEST_SECONDARY_RESULT"] = compositeLvlDecode[compositeLvlScore];

        score["TEST_TERTIARY_RESULT_CODE"] = productionLvlScore;
        score["TEST_TERTIARY_RESULT"] = productionLvlDecode[productionLvlScore];

        return score;
    }

    function mapComprehensionScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var comprehensionLvlScore = row.getField("COMPREHENSION_LEVEL" + testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(comprehensionLvlScore === null || comprehensionLvlScore === undefined || _util.trim(comprehensionLvlScore) === "--" || _util.trim(comprehensionLvlScore) === ""){
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        score["TEST_SCALED_SCORE"] = comprehensionLvlScore;

        score["TEST_PRIMARY_RESULT_CODE"] = comprehensionLvlScore;
        score["TEST_PRIMARY_RESULT"] = comprehensionLvlDecode[comprehensionLvlScore];

        return score;
    }

    function mapOverallProficiency(row, testMetadata){
        var lowest = 10;
        var highest = 0;
        var decode = 'Not all subjects provided';
        var readingProficiencyLvl = row.getField("PROFICIENCY_LEVEL_RD");
        var writingProficiencyLvl = row.getField("PROFICIENCY_LEVEL_WT");
        var listeningProficiencyLvl = row.getField("PROFICIENCY_LEVEL_LIS");
        var speakingProficiencyLvl = row.getField("PROFICIENCY_LEVEL_SPK");

        //Determine lowest score
        if(readingProficiencyLvl<lowest){
            lowest = readingProficiencyLvl;
        }
        if(writingProficiencyLvl<lowest){
            lowest = writingProficiencyLvl;
        }
        if(listeningProficiencyLvl<lowest){
            lowest = listeningProficiencyLvl;
        }
        if(speakingProficiencyLvl<lowest){
            lowest = speakingProficiencyLvl;
        }

        //Determine highest score
        if(readingProficiencyLvl>highest){
            highest = readingProficiencyLvl;
        }
        if(writingProficiencyLvl>highest){
            highest = writingProficiencyLvl;
        }
        if(listeningProficiencyLvl>highest){
            highest = listeningProficiencyLvl;
        }
        if(speakingProficiencyLvl>highest){
            highest = speakingProficiencyLvl;
        }

        if(highest<3){
            decode = 'Emerging';
        }
        else if(highest>=3 && lowest < 2){
            decode = 'Progressing 1';
        }
        else if(highest>=3 && lowest < 3){
            decode = 'Progressing 2';
        }
        else if(highest>=3 && lowest < 4){
            decode = 'Progressing 3';
        }
        else if(highest>=4 && lowest >= 4){
            decode = 'Transitioning/Proficient';
        }

        return decode;

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

        return assessmentAdminKey;
    }

    return module;
}());