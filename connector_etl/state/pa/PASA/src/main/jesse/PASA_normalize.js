var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "PASA";
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
        //Subjects
        {TEST: "PASA", CODE:"_RD", FIELD: "_READING", MAP_FUNCTION: mapRawScore}
        ,{TEST: "PASA", CODE:"_MA", FIELD: "_MATHEMATICS", MAP_FUNCTION: mapRawScore}
        ,{TEST: "PASA", CODE:"_ELA", FIELD: "_ELA", MAP_FUNCTION: mapRawScore}
        ,{TEST: "PASA", CODE:"_SCI", FIELD: "_SCIENCE", MAP_FUNCTION: mapRawScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

      var primaryDecode = {
           "A" : "Advanced"
           ,"Advanced" : "Advanced"
           ,"B" : "Basic"
           ,"Basic" : "Basic"
           ,"BB" : "Below Basic"
           ,"Below Basic" : "Below Basic"
           ,"P" : "Proficient"
           ,"Proficient" : "Proficient"
           ,"P" : "No Score"
           ,"Ot" : "No Score"
           ,"NE" : "No Score"
           ,"MuC" : "No Score"
           ,"NR" : "No Score"
           ,"M" : "No Score"
           ,"NS" : "No Score"
           ,"-" : "No Score"
           ,"PO" : "No Score"
           ,"Ab" : "No Score"
           ,"ME" : "No Score"
           ,"MO" : "No Score"
           ,"Eab" : "No Score"
           ,"EAb" : "No Score"
           ,"CA" : "No Score"
           ,"EL1" : "No Score"
           ,"N/A" : "No Score"
           ,"NV" : "No Score"
           ,"" : null
           ,null : null
      };
      var primaryCodify = {
           "A" : "A"
           ,"Advanced" : "A"
           ,"B" : "B"
           ,"Basic" : "B"
           ,"BB" : "BB"
           ,"Below Basic" : "BB"
           ,"P" : "P"
           ,"Proficient" : "P"
           ,"P" : "P"
           ,"Ot" : "Ot"
           ,"NE" : "NE"
           ,"MuC" : "MuC"
           ,"NR" : "NR"
           ,"M" : "M"
           ,"NS" : "NS"
           ,"-" : "-"
           ,"PO" : "PO"
           ,"Ab" : "Ab"
           ,"ME" : "ME"
           ,"MO" : "MO"
           ,"Eab" : "Eab"
           ,"EAb" : "EAb"
           ,"CA" : "CA"
           ,"EL1" : "EL1"
           ,"N/A" : "N/A"
           ,"NV" : "NV"
           ,"" : null
           ,null : null
      };

      var passDecode = {
           "A" : "Yes"
           ,"Advanced" : "Yes"
           ,"B" : "No"
           ,"Basic" : "No"
           ,"BB" : "No"
           ,"Below Basic" : "No"
           ,"P" : "Yes"
           ,"Proficient" : "Yes"
           ,"P" : null
           ,"Ot" : null
           ,"NE" : null
           ,"MuC" : null
           ,"NR" : null
           ,"M" : null
           ,"NS" : null
           ,"-" : null
           ,"PO" : null
           ,"Ab" : null
           ,"ME" : null
           ,"MO" : null
           ,"Eab" : null
           ,"CA" : null
           ,"EL1" : null
           ,"N/A" : null
           ,"NV" : null
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


        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
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
        var birth = row.getField("BIRTHDATE");
        if(birth.toString().length==7){
            birth = "0"+birth;
        }
        var birthDateObject = AppUtil.getDateObjByPattern(birth, "MMddyyyy");

        var gradeFile = row.getRawField("LINEAGE_FILE");
        var gradeVal = null;

        if(gradeFile.toString().indexOf("Gr3")>-1){
            gradeVal = "03";
        }
        else if(gradeFile.toString().indexOf("Gr4")>-1){
            gradeVal = "04";
        }
        else if(gradeFile.toString().indexOf("Gr5")>-1){
            gradeVal = "05";
        }
        else if(gradeFile.toString().indexOf("Gr6")>-1){
            gradeVal = "06";
        }
        else if(gradeFile.toString().indexOf("Gr7")>-1){
            gradeVal = "07";
        }
        else if(gradeFile.toString().indexOf("Gr8")>-1){
            gradeVal = "08";
        }
        else if(gradeFile.toString().indexOf("Gr9")>-1){
            gradeVal = "09";
        }
        else if(gradeFile.toString().indexOf("Gr10")>-1){
            gradeVal = "10";
        }
        else if(gradeFile.toString().indexOf("Gr11")>-1){
            gradeVal = "11";
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
                    record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern("05/15/"+row.getField("TESTED_YEAR"), "MM/dd/yyyy").STANDARD_DATE;
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("ATTRIBUTED_SCHOOL_CODE"));
                    break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("ATTRIBUTED_SCHOOL_CODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("ATTRIBUTED_SCHOOL_NAME"));
                     break;
                 case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("PASECUREID"));
                      break;
                 case "STUDENT_LOCAL_ID":
                      record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("LOCAL_STUDENT_ID"));
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
                     record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = _util.coalesce(gradeVal);
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

        admin.TEST_EXEMPTION_DESC = _util.trim(row.getField("DAFM"));
        admin.TEST_EXEMPTION_CODE = "DAFM";
        admin.TEST_EXEMPTION_DESC_2 = _util.trim(row.getField("SAFM"));
        admin.TEST_EXEMPTION_CODE_2 = "SAFM";
        admin.TEST_EXEMPTION_DESC_3 = _util.trim(row.getField("DAFS"));
        admin.TEST_EXEMPTION_CODE_3 = "DAFS";
        admin.TEST_EXEMPTION_DESC_4 = _util.trim(row.getField("SAFS"));
        admin.TEST_EXEMPTION_CODE_4 = "SAFS";

        admin.TEST_INTERVENTION_DESC = _util.trim(row.getField("STAFM"));
        admin.TEST_INTERVENTION_CODE = "STAFM";
        admin.TEST_INTERVENTION_DESC_2 = _util.trim(row.getField("STAFS"));
        admin.TEST_INTERVENTION_CODE_2 = "STAFS";
        admin.TEST_INTERVENTION_DESC_3 = _util.trim(row.getField("DAFR"));
        admin.TEST_INTERVENTION_CODE_3 = "DAFR";
        admin.TEST_INTERVENTION_DESC_4 = _util.trim(row.getField("SAFR"));
        admin.TEST_INTERVENTION_CODE_4 = "SAFR";

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapRawScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var performanceLevel = row.getField("PERFORMANCE_LEVEL"+testMetadata.FIELD);
        //Only present on older records
        var scaleScore = row.getField("SCALE_SCORE"+testMetadata.FIELD);
        var rawScore = row.getField("RAW_SCORE"+testMetadata.FIELD);

        // Check for key fields and do not map score and exit if conditions met.
        if(performanceLevel === null || performanceLevel === undefined || _util.trim(performanceLevel) === "--" || _util.trim(performanceLevel) === "") {
            return null;
        }
        //May be removed someday so kept as a separate return null
        if(primaryDecode[performanceLevel]==="No Score"){
            /*score["TEST_SCALED_SCORE"] = null;
            score["TEST_SCORE_VALUE"] = null;
            score["TEST_RAW_SCORE"] = rawScore;

            return score;*/
            return null;
        }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;

        if( primaryCodify[performanceLevel]!== null &&  primaryCodify[performanceLevel] !== "" &&  primaryCodify[performanceLevel] !== undefined){
            score["TEST_PRIMARY_RESULT_CODE"] = primaryCodify[performanceLevel];
        }
        score["TEST_PRIMARY_RESULT"] = primaryDecode[performanceLevel];
        score["TEST_PASSED_INDICATOR"] = passDecode[performanceLevel];

        //Only present on older records
        score["TEST_SCALED_SCORE"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_RAW_SCORE"] = rawScore;

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

        return assessmentAdminKey;
    }

    return module;
}());