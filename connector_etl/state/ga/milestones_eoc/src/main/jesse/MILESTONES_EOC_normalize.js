var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "Milestones_EOC";
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
            var normalizedFile = AppUtil.createResultsFile(file);
             print("Normalized file: ${normalizedFile}");
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
        {TEST: "GA_MIL", FIELD: "CONTENTAREACODE", MAP_FUNCTION: mapScaledScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var contentAreaDecode = {
            "01" : "9_LIT_COMP"
            ,"02" : "A_LIT_COMP"
            ,"03" : "CORD_ALG"
            ,"04" : "ANA_GEOM"
            ,"05" : "BIO"
            ,"06" : "PS"
            ,"07" : "US_HIS"
            ,"08" : "ECON_BUS_FE"
            ,"09" : "ALG_1"
            ,"10" : "GEOM"
        };

    var achievLevelDecode = {
           "1"  : "Beginning Learner"
           ,"2" : "Developing Learner"
           ,"3" : "Proficient Learner"
           ,"4" : "Distinguished Learner"
           ,""  : "No Score"
           ,null: "No Score"
    };

    var achievLevelPassingDecode = {
           "1"  : "No"
           ,"2" : "No"
           ,"3" : "Yes"
           ,"4" : "Yes"
           ,""  : null
           ,null: null
    };

    var readStatusDecode = {
           "1"  : "Below Grade Level"
           ,"2" : "Grade Level or Above"
           ,"9" : "Too few points to report"
           ,""  : null
           ,null: null
    };

    var traitDecode = {
           ""  : null
           ,null : null
           ,"A"  : null
           ,"B"  : "Copied"
           ,"C"  : "Too limited to score"
           ,"D"  : "Non English/Foreign Language"
           ,"E"  : "Off Topic"
           ,"F"  : "Offensive"
           ,"G"  : "Illegible/Incomprehensible"
        };

    var masteryCategoryDecode = {
        "1"   : "Remediate Learning"
        ,"2"  : "Monitor Learning"
        ,"3"  : "Accelerate Learning"
        ,"9"  : "Too few points to report"
        ,""   : null
        ,null : null
    };


    var stretchBandDecode = {
            "1"   : "Below the Stretch Band"
            ,"2"  : "Within the Stretch Band"
            ,"3"  : "Above the Stretch Band"
            ,""   : null
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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                //component
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                //claims strands
                for(var i=1;i<=8;i++){
                    var masteryClaim = mapClaimScore(row, testMetadata,i);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, masteryClaim);
                }
                //writing strands
                 var trait1 = mapWritingScore(row, testMetadata,"EXTWRT1");
                 AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, trait1);
                 var trait2 = mapWritingScore(row, testMetadata,"EXTWRT2");
                 AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, trait2);
                 var narrative = mapWritingScore(row, testMetadata,"NARRWRT");
                 AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, narrative);
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

        var birthDateString = row.getField("STUDOBYEAR_RPT") + "-" + row.getField("STUDOBMONTH_RPT") + "-" + row.getField("STUDOBDAY_RPT")
        var birthDate = row.getField("STUDENT_DOB");

        var birthDateObject = {
                                RAW_DATE : null
                                , MONTH : null
                                , DAY : null
                                , YEAR : null
                                , STANDARD_DATE : null
                              };

         if (row.getField("STUDOBMONTH_RPT") === "00" || row.getField("STUDOBDAY_RPT") === "00") {
            birthDateObject;
        } else if ((birthDateString.toString().length == 10)) {
            birthDateObject = AppUtil.getDateObjByPattern(birthDateString, "yyyy-MM-dd");
        } else if(birthDate && signature.getFormat().getFormatName() === "MILESTONES_EOC_COL19"){
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        var adminDate = _util.coalesce(row.getField("TESTDATE"));
            if(adminDate !== null && adminDate !== undefined && adminDate !== "") {
                adminDate = AppUtil.getMonthFollowedByDay(adminDate).STANDARD_DATE;
            }


        var accomodationYesNo = "No";
        if(row.getField("ACCOMIEP_COLLECTED")== 1 || row.getField("ACCOMELTPC_COLLECTED")== 1 || row.getField("ACCOMIAP_COLLECTED")== 1 ||
           row.getField("ACCOMST_COLLECTED")== 1 || row.getField("ACCOMPRS_COLLECTED")== 1 || row.getField("ACCOMRSP_COLLECTED")== 1 ||
           row.getField("ACCOMSCH_COLLECTED")== 1 ){
            accomodationYesNo = "Yes";
        }

        var onlineYesNo = "No";
                if(row.getField("AUDIO")== 1 || row.getField("COLORCHOOSER")== 1 || row.getField("CONTRASTINGCOLOR")== 1 ||
                   row.getField("AUDIOPASSAGES")== 1 || row.getField("HUMANREADER")== 1 || row.getField("MASKING")== 1){
                    onlineYesNo = "Yes";
                }
                 if(signature.getFormat().getFormatName() === "MILESTONES_EOC_COL19"){
                    var FullName = row.getField("STUDENT_NAME");
                    var FirstName = '';
                    var MiddleName = '';
                    var LastName = '';
                    if(FullName !== undefined && FullName !== null && FullName !== ""){
                        if(FullName.indexOf(',') !== -1) {
                            LastName = FullName.split(",")[0].trim()

                        if(FullName.split(",")[1].trim().indexOf(' ') !== -1){
                            FirstName = FullName.split(",")[1].trim().split(" ")[0].trim()
                            MiddleName = FullName.split(",")[1].trim().split(" ")[1].trim()
                            }
                            else{
                                FirstName = FullName.split(",")[1].trim()
                                }
                            }
                        else if(FullName.indexOf(' ') !== -1) {
                        LastName = FullName.split(" ")[0].trim()
                        FirstName = FullName.split(" ")[1].trim()
                            }
                        else {
                        LastName = FullName
                        }
                       }
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
                    record.TEST_ADMIN_DATE = _util.coalesce(adminDate, "05/15/"+hierarchy.SCHOOL_YEAR.substring(5,9));
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHCODE_RPT")
                                        , row.getField("SCHNAME_RPT"),"DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHCODE_RPT"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHNAME_RPT"));
                     break;
                 case "STUDENT_STATE_ID":
                      record.STUDENT_STATE_ID = _util.coalesce(row.getField("GTID_RPT"),row.getField("STATE_STUDENT_ID"));
                      break;
                 case "STUDENT_VENDOR_ID":
                      record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_NUMBER"));
                      break;
                 case "STUDENT_FIRST_NAME":
                     record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUFIRSTNAME_RPT"),FirstName,null);
                     break;
                 case "STUDENT_MIDDLE_NAME":
                     record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUMIDINITIAL_RPT"),MiddleName,null);
                     break;
                 case "STUDENT_LAST_NAME":
                     record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STULASTNAME_RPT"),LastName,null);
                     break;
                 case "STUDENT_GENDER_CODE":
                     record.STUDENT_GENDER_CODE =  _util.coalesce(row.getField("STUGENDER_RPT"),null);
                     break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = _util.coalesce(row.getField("STUGRADE_RPT"),null);
                     break;
                 case "TEST_INTERVENTION_DESC":
                     record.TEST_INTERVENTION_DESC = _util.coalesce(accomodationYesNo,null);
                     break;
                 case "TEST_INTERVENTION_DESC_2":
                     record.TEST_INTERVENTION_DESC_2 = _util.coalesce(onlineYesNo,null);
                     break;
                 case "TEST_REPORTING_DATE":
                      record.TEST_REPORTING_DATE = "01/01/" + hierarchy.SCHOOL_YEAR.substring(5, 9);
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
    function mapAdditionalAdminFields(admin, row) {
         admin["COURSE_CODE"] =  null;//_util.coalesce(row.getField("COURSENUM_PREID"));
         admin["COURSE_SECTION"] =  null;//_util.coalesce(row.getField("COURSESEC_PREID"));

       return admin;
    }


    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata);

        var scaleScore = _util.coalesce(row.getField("SS"), row.getField("ALGEBRA_I_SCALE_SCORE"));

        var grdConvScore = _util.coalesce(row.getField("GCS"), row.getField("GRADE_CONVERSION_SCORE"));

		var achievLevel = _util.coalesce(row.getField("ACHLEVEL"), row.getField("ALGEBRA_I_ACHIEVEMENT_LEVEL"));

		var sem = row.getField("CONDSEM");

        // Lexile Range - Lexile Low 100 less then Lexile.  Lexile high is 50 more than Lexile
		var lexile = row.getField("LEXILEL");
		var readStatus = row.getField("READINGSTATUS");

		var trait1Score = row.getField("EXTWRT1SCORE");
        var trait1CondCode = row.getField("EXTWRT1CONDCODE");

        var trait2Score = row.getField("EXTWRT2SCORE");
        var trait2CondCode = row.getField("EXTWRT2CONDCODE");

        var narrativeScore = row.getField("NARRWRTSCORE");
        var narrativeCondCode = row.getField("NARRWRTCONDCODE");

        var nationalPercentile = row.getField("NRT_NP");
        var nationalPercentileLow = row.getField("NRT_NPRANGE").split("-")[0];
        var nationalPercentileHigh = row.getField("NRT_NPRANGE").split("-")[1];

        var nce = row.getField("NRT_NCE");

        var stretchBandCode = row.getField("STRETCHBAND");



        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	score["TEST_SCORE_VALUE"] = scaleScore;
    	score["TEST_SCALED_SCORE"] = scaleScore;
    	score["TEST_PASSED_INDICATOR"] = achievLevelPassingDecode[achievLevel];

    	score["TEST_PERCENTAGE_SCORE"] = grdConvScore;

    	score["TEST_PRIMARY_RESULT_CODE"] = achievLevel;
    	score["TEST_PRIMARY_RESULT"] = achievLevelDecode[achievLevel];

    	score["TEST_STANDARD_ERROR"] = sem;
    	score["TEST_READING_LEVEL"] = lexile;

    	score["TEST_SECONDARY_RESULT_CODE"] = readStatus;
        score["TEST_SECONDARY_RESULT"] = readStatusDecode[readStatus];

        score["TEST_TERTIARY_RESULT_CODE"] = stretchBandCode;
        score["TEST_TERTIARY_RESULT"] = stretchBandDecode[stretchBandCode];

        score["TEST_QUATERNARY_RESULT_CODE"] = trait2Score;
        score["TEST_QUATERNARY_RESULT"] = traitDecode[trait2CondCode];

        score["TEST_CUSTOM_RESULT_CODE"] = narrativeScore;
        score["TEST_CUSTOM_RESULT"] = traitDecode[narrativeCondCode];

        score["TEST_PERCENTILE_SCORE"] = nationalPercentile;
        score["TEST_LOWER_BOUND"] = nationalPercentileLow;
        score["TEST_UPPER_BOUND"] = nationalPercentileHigh;

        score["TEST_NCE_SCORE"] = nce;

        return score;
    }

    function mapClaimScore(row, testMetadata, masteryClaimNumber) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata) + "_M" + masteryClaimNumber;
        var masterCategory = row.getField("MASTERYCATEGORYDOM" + masteryClaimNumber);

        // Check for key fields and do not map score and exit if conditions met.
        if(masterCategory === null || masterCategory === undefined || _util.trim(masterCategory) === "--" || _util.trim(masterCategory) === "") {
              return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = masterCategory;
    	score["TEST_PRIMARY_RESULT"] = masteryCategoryDecode[masterCategory];
        return score;
    }


    function mapWritingScore(row, testMetadata, fileFieldPrefix) {
        var score = {};
        var testNumber = generateTestNumber(row, testMetadata) + "_" + fileFieldPrefix;
        var writingScore = row.getField(fileFieldPrefix+"SCORE");
        var writingCondCode = row.getField(fileFieldPrefix+"CONDCODE");

        // Check for key fields and do not map score and exit if conditions met.
        if(writingScore === null || writingScore === undefined || _util.trim(writingScore) === "--" || _util.trim(writingScore) === "") {
              return null;
        }

        // Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCALED_SCORE"] = writingScore;
    	score["TEST_PRIMARY_RESULT_CODE"] = writingCondCode;
    	score["TEST_PRIMARY_RESULT"] = traitDecode[writingCondCode];

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

    function generateTestNumber(row, testMetadata) {
            var testNumber = testMetadata.TEST + "_" + contentAreaDecode[row.getField(testMetadata.FIELD)];
            var writingGENRE = row.getField("EXTWRTGENRE");
            var testName = row.getField("TEST_NAME");

           if(writingGENRE !== null && writingGENRE !== undefined && _util.trim(writingGENRE) !== "--" && _util.trim(writingGENRE) !== "" &&
              writingGENRE !== 'null'){
                testNumber = testNumber + row.getField("EXTWRTGENRE");
           }else if(testName && testName.indexOf("Algebra I") > -1){
                testNumber = testMetadata.TEST + "_ALGI";
            }

            return testNumber;

        }

    return module;
}());
