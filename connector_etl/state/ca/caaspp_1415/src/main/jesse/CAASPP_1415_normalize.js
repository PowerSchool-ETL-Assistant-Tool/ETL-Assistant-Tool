var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessment = "CAASPP_1415";
    var _assessmentIdentifier = "CAASPP_1415";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     *  Create a normalized assessment file for a given file and signature.
     *
     * @param file The source assessment data file.
     * @param signature The signature object matched to the assessment data file.
     * @returns {file} Normalized data file based on the source file.
     */
    module.createNormalizedFile = function(file, signature) {
        try {

            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");

            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);
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
                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, exception, JSON.stringify(one) + '|' + JSON.stringify(two)));
                    }
                })
                .transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
                    try{
                        if(!multipleRowsPerGroupingExpected && rows.length > 1) {
                            //Report error for each row
                            rows.forEach(function(row) {
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
                            });

                        } else {
                            output.RECORDS.put(rows);
                        }
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK: ${exception}", JSON.stringify(rows)));
                    }

                })
                .transform("TRANSFORM", ["RECORDS"],
                    function(output, rows) {
                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                        normalizedRecords.forEach(function(record) {
                            output.RECORDS.put(record);
                        });

                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    // Report when no scores are found.
                    if(mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        output.RECORDS.put(row);
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

    /*
        This object contains the possible admin records to map and their related scores.
    */
    var adminsToMap =
    [
        {
            TEST_CODE: "ELA"
            , TEST_TYPE: "SBAC_ELA"
            , SCORES :
                [
                    {TEST_CODE: "ELA", TEST_TYPE: "SBAC_ELA", STRAND_LEVEL: "", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACScore}
                    , {TEST_CODE: "ELA_RD", TEST_TYPE: "SBAC_ELA", STRAND_LEVEL: "1", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACClaimScore} //Reading
                    , {TEST_CODE: "ELA_WR", TEST_TYPE: "SBAC_ELA", STRAND_LEVEL: "2", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACClaimScore} //Writing
                    , {TEST_CODE: "ELA_LSSPK", TEST_TYPE: "SBAC_ELA", STRAND_LEVEL: "3", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACClaimScore} //Listening and Speaking
                    , {TEST_CODE: "ELA_RI", TEST_TYPE: "SBAC_ELA", STRAND_LEVEL: "4", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACClaimScore} //Research and Inquiry
                ]

        }

        , {
            TEST_CODE: "MA"
            , TEST_TYPE: "SBAC_MA"
            , SCORES :
                [
                    {TEST_CODE: "MA", TEST_TYPE: "SBAC_MA", STRAND_LEVEL: "", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACScore}
                    , {TEST_CODE: "MA_PSMDLDA", TEST_TYPE: "SBAC_MA", STRAND_LEVEL: "1", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACClaimScore} //Problem Solving
                    , {TEST_CODE: "MA_CNPR", TEST_TYPE: "SBAC_MA", STRAND_LEVEL: "2", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACClaimScore} //Concepts and Procedures
                    , {TEST_CODE: "MA_CR", TEST_TYPE: "SBAC_MA", STRAND_LEVEL: "3", MAP_TEST_NUM_FUNCTION: getSBACTestNumber, MAP_SCORE_FUNCTION: mapSBACClaimScore} //Communicating Reasoning
                ]
        }

        , {
            TEST_CODE: null
            , TEST_TYPE: "SCI"
            , SCORES :
                [
                    {TEST_CODE: "SCI", TEST_TYPE: "SCI", STRAND_LEVEL: "", MAP_TEST_NUM_FUNCTION: getScienceTestNumber, MAP_SCORE_FUNCTION: mapCAASPPScore}
                ]
        }

        , {
            TEST_CODE: null
            , TEST_TYPE: "RLA"
            , SCORES :
                [
                    {TEST_CODE: "RLA", TEST_TYPE: "RLA", STRAND_LEVEL: "", MAP_TEST_NUM_FUNCTION: getRLATestNumber, MAP_SCORE_FUNCTION: mapCAASPPScore}
                ]
        }


    ];



    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/
    var achieveLevels =
        {
            "4" : {LEVEL: "4", DESC: "Standard Exceeded", PASS_IND: "Yes"},
            "3" : {LEVEL: "3", DESC: "Standard Met", PASS_IND: "Yes"},
            "2" : {LEVEL: "2", DESC: "Standard Nearly Met", PASS_IND: "No"},
            "1" : {LEVEL: "1", DESC: "Standard Not Met", PASS_IND: "No"},
            "9" : {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"}
        };


    var claimLevels =
        {
            "3" : {LEVEL: "3", DESC: "Above Standard", PASS_IND: "Yes"},
            "2" : {LEVEL: "2", DESC: "At or Near Standard", PASS_IND: "No"},
            "1" : {LEVEL: "1", DESC: "Below Standard", PASS_IND: "No"},
            "9" : {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"}
        };


    var perfLevels =
        {
            "5" : {LEVEL: "5", DESC: "Advanced", PASS_IND: "Yes"},
            "4" : {LEVEL: "4", DESC: "Proficient", PASS_IND: "Yes"},
            "3" : {LEVEL: "3", DESC: "Basic", PASS_IND: "Yes"},
            "2" : {LEVEL: "2", DESC: "Below Basic", PASS_IND: "No"},
            "1" : {LEVEL: "1", DESC: "Far Below Basic", PASS_IND: "No"},
            "9" : {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"}
        };

    var disabilityTypes =
        {
            "AUT" : {CODE: "AUT", TYPE: "Autism"},
            "DB" : {CODE: "DB", TYPE: "Deaf-blindness"},
            "EMN" : {CODE: "EMN", TYPE: "Emotional disturbance"},
            "HI" : {CODE: "HI", TYPE: "Hearing impairment"},
            "ID" : {CODE: "ID", TYPE: "Intellectual Disability"},
            "MD" : {CODE: "MD", TYPE: "Multiple disabilities"},
            "OI" : {CODE: "OI", TYPE: "Orthopedic impairment"},
            "OHI" : {CODE: "OHI", TYPE: "Other health impairment"},
            "SLD" : {CODE: "SLD", TYPE: "Specific learning disability"},
            "SLI" : {CODE: "SLI", TYPE: "Speech or language impairment"},
            "TBI" : {CODE: "TBI", TYPE: "Traumatic brain injury"},
            "VI" : {CODE: "VI", TYPE: "Visual Impairment"}
        };


    var conditionCodes =
        {
            "AURN" : {CODE: "AURN", DESC: "Approved unlisted resource that does not change construct being measured"},
            "AURY" : {CODE: "AURY", DESC: "Approved unlisted resource that changes construct being measured"},
            "C" : {CODE: "C", DESC: "Observed Cheating"},
            "INC" : {CODE: "INC", DESC: "Incomplete Test"},
            "LOSS" : {CODE: "LOSS", DESC: "Lowest obtainable scale score"},
            "NE" : {CODE: "NE", DESC: "Non-English Learner"},
            "NEL" : {CODE: "NEL", DESC: "Exempted from Smarter Balanced or CAA for ELA"},
            "NT" : {CODE: "NT", DESC: "Not Tested"},
            "NTC" : {CODE: "NTC", DESC: "Student did not have opportunity to test due to moving schools"},
            "NTE" : {CODE: "NTE", DESC: "Not tested due to medical emergency"},
            "PGE" : {CODE: "PGE", DESC: "Not tested by parent/guardian request"},
            "SCL" : {CODE: "SCL", DESC: "Completed test and grade/level administered does not match enrolled grade"},
            "T" : {CODE: "T", DESC: "Provided no answers"}
        };


    /***********************************************************************************
        Assessment-specific decode functions
    ***********************************************************************************/

    /**
     * Returns disability indicator if disability code exists.
     *
     * @param string Disability code.
     * @returns {string} Disability indicator.
     */
    function decodeDisabilityIndicator(code) {

        if (code == null || _util.trim(code) === "") {
            return "N";
        } else {
            return "Y";
        }
    }


    /**
     * Returns LEP Status.
     *
     * @param string LEP status code.
     * @returns {string} LEP status.
     */
    function decodeLEPIndicator(code) {

        if (code == null || _util.trim(code) === ""|| _util.toUppercase(code) === "NO") {
            return "English Proficient";
        } else if (_util.toUppercase(code) === "YES") {
            return "Limited English Proficient";
        } else {
            return null;
        }
    }


    /**
     * Returns Status flag based on given score and invalid status flag.
     *
     * @param object An object representing the data row by logical name.
     * @param string Test type being processed.
     * @returns {string} Status flag.
     */
    function mapStatusFlag(row, testType) {
        var primaryScore = _util.coalesce(row.getField(testType + "_SCALE_SCORE"));
        var statusFlag = _util.trim(row.getField(testType + "_INVALID_STATUS_FLAG"));

        //Set to VIRTUAL if record has no actual score.
        if(primaryScore === undefined || _util.trim(primaryScore) === "") {
            return "VIRTUAL";
        } else if(statusFlag === "I") {
            return "INVALID";
        } else if(statusFlag === "V") {
            return "VALID";
        } else {
            return "UNKNOWN:" + statusFlag;
        }
    }

    /**
     * Returns Absent Status.
     *
     * @param string Absent status code.
     * @returns {string} Absent status.
     */
    function decodeAbsentCode(code) {
        if(_util.trim(code) === "Y") {
            return "Absent";
        } else if(code === null || _util.trim(code) === "N" || _util.trim(code) === "") {
            return "Present";
        } else {
            return "UNKNOWN:" + _util.trim(code);
        }
    }


    /**
     * Returns Cheating Status.
     *
     * @param string Cheating status code.
     * @returns {string} Cheating status.
     */
    function decodeCheatingCode(code) {
        if(_util.trim(code) === "Y") {
            return "Observed Cheating";
        } else if(code === null || _util.trim(code) === "N" || _util.trim(code) === "") {
            return "No Cheating Observed";
        } else {
            return "UNKNOWN:" + _util.trim(code);
        }
    }


    /**
     * Returns Blank Document Status.
     *
     * @param string Blank Document status code.
     * @returns {string} Blank Document status.
     */
    function decodeBlankDocumentCode(code) {
        if(_util.trim(code) === "Y") {
            return "Special Conditions - Blank, Moved, Medical"; //"Blank due to student moving, illness, medical emergency, or tested at previous school";
        } else if(code === null || _util.trim(code) === "N" || _util.trim(code) === "") {
            return "";
        } else {
            return "UNKNOWN:" + _util.trim(code);
        }
    }


    /**
     * Returns Parent Exemption Status.
     *
     * @param string Parent Exemption status code.
     * @returns {string} Parent Exemption status.
     */
    function decodeParentExemptionCode(code) {
        if(_util.trim(code) === "Y") {
            return "Parent or Guardian requested exemption";
        } else if(code === null || _util.trim(code) === "N" || _util.trim(code) === "") {
            return "";
        } else {
            return "UNKNOWN:" + _util.trim(code);
        }
    }


    /**
     * Returns Attempted Status.
     *
     * @param string Attempted status code.
     * @returns {string} Attempted status.
     */
    function decodeAttemptedFlag(code) {
        if(_util.trim(code) === "N") {
            return "Nonparticipant";
        } else if(_util.trim(code) === "P") {
            return "Participant";
        } else if(_util.trim(code) === "Y") {
            return "Attempted";
        } else {
            return "Did not log on to both the PT and CAT";
        }
    }


    /**
     * Returns Economic Disadvantage Status.
     *
     * @param string Economic Disadvantage status code.
     * @returns {string} Economic Disadvantage status.
     */
    function decodeEconomicDisadvantageStatus(code) {

    	if (code == null || code === ""|| _util.toUppercase(code) === "NO") {
    		return "Not Economically Disadvantaged";
    	} else if (_util.toUppercase(code) === "YES") {
    		return "Economically Disadvantaged";
    	} else {
    		return null;
    	}
    }


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

        //Loop through all potential admin types and attempt to map normalized admin and scores.
        adminsToMap.forEach(
            //e = element value, i = element index, a = array being traversed
            function(adminMetadata) {

                var record = mapSingleNormalizedRecord(signature, hierarchy, row, adminMetadata);

                AppUtil.nullSafePush(normalizedRecords, record);

            }
        );

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
    function mapSingleNormalizedRecord(signature, hierarchy, row, adminMetadata) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];


        //Map normalized admin fields
        record = mapNormalizedAdminFields(hierarchy, record, row, adminMetadata);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row, adminMetadata);

        //Map score fields for each expected score mapping
        adminMetadata.SCORES.forEach(function(scoreMetadata) {
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, (scoreMetadata.MAP_SCORE_FUNCTION)(row, scoreMetadata));
        });

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
    function mapNormalizedAdminFields(hierarchy, record, row, adminMetadata) {

        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        //Shared fields
        var schoolYear = hierarchy.SCHOOL_YEAR;

        /*  pre UIHN-9419:
        var folderDistrictCode = AssessmentLoader.config.DISTRICT_CODE;
        var districtCode = _util.coalesce(
                                            row.getField("DISTRICT_CODE_ELA_NON_PT")
                                            ,row.getField("DISTRICT_CODE_ELA_PT")
                                            ,row.getField("DISTRICT_CODE_MATHEMATICS_NON_PT")
                                            ,row.getField("DISTRICT_CODE_MATHEMATICS_PT")
                                            ,row.getField("DISTRICT_CODE_CST_CMA_CAPA")
                                            ,row.getField("DISTRICT_CODE_STS_FOR_RLA")
                                            ,row.getField("COUNTY_DISTRICT_OF_RESIDENCE")
                                            , folderDistrictCode
                                            , ""
                                          );

        //District code fields are length 14, 7 district code numbers followed by 7 school code numbers or 7 zeroes
        if(districtCode.length > 7){
            districtCode = districtCode.substring(0,7);
        }
        */

        //Use the folder district code for now.  The file uses ending zeroes used for padding. (Ex: "12345" is "12345000000").  May need to be re-visited?
        //var districtCode = folderDistrictCode;
        /*
        var districtCode = removeEndZeroPadding(_util.coalesce(
			row.getField(testType + "_NONPT_DISTRICTCODE"]
			, row.getField(testType + "_PT_DISTRICTCODE"]
			, row.getField(testType + "_DISTRICTCODE"]
			, row.getField("DISTRICTCODE"]
            , folderDistrictCode
            , ""
        ));
        */

        //Loop through normalized fields and map if possible.
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "SYS_PARTITION_VALUE":
                    record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                    break;
                case "TENANT_CODE":
                    record.TENANT_CODE = AssessmentLoader.config.TENANT_CODE;
                    break;
                case "DISTRICT_CODE":
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE; // pre UIHN-9419:  districtCode;
                    break;
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = "CAASPP"
                        + "_" + row.getField("RECORD_TYPE")
                        + "_" + row.getField("STUDENT_LOCAL_ID")
                        + "_" + row.getField("STUDENT_STATE_ID")
                        + "_" + schoolYear
                        + "_" + _util.coalesce(
                                row.getField(adminMetadata.TEST_TYPE + "_NONPT_TESTDATE")
                                , row.getField(adminMetadata.TEST_TYPE + "_PT_TESTDATE")
                                , row.getField(adminMetadata.TEST_TYPE + "_TESTDATE")
                            )
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField(adminMetadata.TEST_TYPE + "_NONPT_SCHOOLNAME")
                        , row.getField(adminMetadata.TEST_TYPE + "_PT_SCHOOLNAME")
                        , row.getField(adminMetadata.TEST_TYPE + "_SCHOOLNAME")
                        , ""
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField(adminMetadata.TEST_TYPE + "_NONPT_SCHOOLNAME")
                        , row.getField(adminMetadata.TEST_TYPE + "_PT_SCHOOLNAME")
                        , row.getField(adminMetadata.TEST_TYPE + "_SCHOOLNAME")
                        , ""
                    );
                break;
                case "SCHOOL_LOCAL_ID":

                    //Determine school code
                    var schoolCode = _util.coalesce(
                        row.getField(adminMetadata.TEST_TYPE + "_NONPT_SCHOOLCODE")
                        , row.getField(adminMetadata.TEST_TYPE + "_PT_SCHOOLCODE")
                        , row.getField(adminMetadata.TEST_TYPE + "_SCHOOLCODE")
                        , ""
                    );

                    //Remove district code from school code.
                    // record.SCHOOL_LOCAL_ID = schoolCode.replace(districtCode, "");  // pre UIHN-9419
                    record.SCHOOL_LOCAL_ID = schoolCode.replace(AssessmentLoader.config.DISTRICT_CODE, "");
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = schoolYear; //TODO derive school year from testing date?
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = formatTestDate(row, adminMetadata.TEST_TYPE, schoolYear);
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = "01/01/" + schoolYear.substring(5, 9);
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
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = row.getField("STUDENT_DOB_MONTH");
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = row.getField("STUDENT_DOB_DAY");
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = row.getField("STUDENT_DOB_YEAR");
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("STUDENT_GENDER_CODE")) === "Male" ? "M" : "F";
                    break;
                case "STUDENT_VENDOR_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_VENDOR_ID = row.getField("STUDENT_STATE_ID");
                    break;
                case "STUDENT_STATE_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_STATE_ID = row.getField("STUDENT_STATE_ID");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField("STUDENT_FIRST_NAME");
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField("STUDENT_LAST_NAME");
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
    function mapAdditionalAdminFields(admin, row, adminMetadata) {


        //Special Education Information
        var disabilityType = _util.trim(row.getField("PRIMARY_DISABILITY_TYPE"));
        admin["TEST_INTERVENTION_CODE"] = disabilityType;
        admin["TEST_INTERVENTION_DESC"] = disabilityTypes[disabilityType] === undefined ? null : disabilityTypes[disabilityType].TYPE;
        admin["STUDENT_SPECIAL_ED_IND"] = decodeDisabilityIndicator(disabilityType);

        //Additional Student Information
        var lepStatus = _util.trim(row.getField("LEP_STATUS"));
        var economicDisadvantageStatus = _util.trim(row.getField("ECONOMIC_DISADVANTAGE_STATUS"));

        admin["STUDENT_LEP_CODE"] = lepStatus;
        admin["TEST_INTERVENTION_CODE_2"] = lepStatus;
        admin["TEST_INTERVENTION_DESC_2"] = decodeLEPIndicator(lepStatus);
        admin["TEST_INTERVENTION_CODE_3"] = economicDisadvantageStatus;
        admin["TEST_INTERVENTION_DESC_3"] = decodeEconomicDisadvantageStatus(economicDisadvantageStatus);
        admin["TEST_INTERVENTION_DESC_4"] = _util.trim(row.getField("ENGLISH_LANGUAGE_PROFICIENCY_LEVEL"));
        admin["TEST_RECORD_TYPE"] = mapStatusFlag(row); // Invalid status flag

        //Exemption codes
        var studentAbsence = row.getField(adminMetadata.TEST_TYPE + "_STUDENT_ABSENCE");
        var cheating = row.getField(adminMetadata.TEST_TYPE + "_CHEATING");
        var blankDocument = row.getField(adminMetadata.TEST_TYPE + "_BLANK_DOCUMENT");
        var parentGuardianExempt = row.getField(adminMetadata.TEST_TYPE + "_PARENT_GUARDIAN_EXEMPT");
        admin["TEST_EXEMPTION_CODE"] = studentAbsence;
        admin["TEST_EXEMPTION_CODE_2"] = cheating;
        admin["TEST_EXEMPTION_CODE_3"] = blankDocument;
        admin["TEST_EXEMPTION_CODE_4"] = parentGuardianExempt;
        admin["TEST_EXEMPTION_DESC"] = decodeAbsentCode(studentAbsence);
        admin["TEST_EXEMPTION_DESC_2"] = decodeCheatingCode(cheating);
        admin["TEST_EXEMPTION_DESC_3"] = decodeBlankDocumentCode(blankDocument);
        admin["TEST_EXEMPTION_DESC_4"] = decodeParentExemptionCode(parentGuardianExempt);

        return admin;
    }



    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    /**
     * Maps SBAC scoring fields.
     *
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing score type metadata.
     * @returns {object} JavaScript object containing score row mappings.
     */
    function mapSBACScore(row, scoreMetadata) {

        var record = {};
    	var testNumber = scoreMetadata.MAP_TEST_NUM_FUNCTION(row, scoreMetadata) + "_14_15";

    	//Check for score value before anything else.
    	var scaleScore = row.getField(scoreMetadata.TEST_TYPE + "_SCALE_SCORE");
    	var rawScore = row.getField(scoreMetadata.TEST_TYPE + "_RAW_SCORE");
    	var achieveLevel = _util.coalesce(row.getField(scoreMetadata.TEST_TYPE + "_PERFORMANCE_LEVEL"));

        record["TEST_NUMBER"] = testNumber;
        record["TEST_QUATERNARY_RESULT_CODE"] = row.getField(scoreMetadata.TEST_TYPE + "_ATTEMPTED_FLAG");
        record["TEST_QUATERNARY_RESULT"] = decodeAttemptedFlag(row.getField(scoreMetadata.TEST_TYPE + "_ATTEMPTED_FLAG"));

        //Mark if record has score is blank,
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) == "" || scaleScore == "NS") {
            // Do not map record is no score is found.
            return null;

            /*
                Original mapping.  Caused unexpected TEST_NUMBER values to be generated.

            record["TEST_SCORE_TEXT"] = "NT";
            record["TEST_PRIMARY_RESULT_CODE"] = "NT";
            record["TEST_PRIMARY_RESULT"] = "Not Tested";
            record["TEST_PASSED_INDICATOR"] = "N";
            */
    	} else {
            record["TEST_SCORE_TEXT"] = scaleScore;
            record["TEST_SCORE_VALUE"] = scaleScore;
            record["TEST_SCALED_SCORE"] = scaleScore;
            record["TEST_RAW_SCORE"] = rawScore;
            record["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            record["TEST_PRIMARY_RESULT"] = achieveLevels[achieveLevel] === undefined ? null : achieveLevels[achieveLevel].DESC;
            record["TEST_PASSED_INDICATOR"] = achieveLevels[achieveLevel] === undefined ? null : achieveLevels[achieveLevel].PASS_IND;
        }

    	return record;

    }


    /**
     * Maps SBAC claim scoring fields.
     *
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing score type metadata.
     * @returns {object} JavaScript object containing score row mappings.
     */
    function mapSBACClaimScore(row, scoreMetadata) {

        var record = {};
    	var testNumber = scoreMetadata.MAP_TEST_NUM_FUNCTION(row, scoreMetadata) + "_14_15";

    	//Check for performance value before anything else.
    	var perfLevel = _util.coalesce(row.getField(scoreMetadata.TEST_TYPE + "_CLAIM" + scoreMetadata.STRAND_LEVEL + "_PERFORMANCE_LEVEL"));

    	record["TEST_NUMBER"] = testNumber;
            record["TEST_QUATERNARY_RESULT_CODE"] = row.getField(scoreMetadata.TEST_TYPE + "_ATTEMPTED_FLAG");
            record["TEST_QUATERNARY_RESULT"] = decodeAttemptedFlag(row.getField(scoreMetadata.TEST_TYPE + "_ATTEMPTED_FLAG"));

            //{LEVEL: "9", DESC: "Did not attempt", PASS_IND: "N"}
    	if(perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) == "" || perfLevel == "9" || _util.trim(perfLevel) == "NS") {
            // Do not map record is no score is found.
            return null;

            /*
                Original mapping.  Caused unexpected TEST_NUMBER values to be generated.

            record["TEST_PRIMARY_RESULT_CODE"] = "NT";
            record["TEST_PRIMARY_RESULT"] = "Not Tested";
            record["TEST_PASSED_INDICATOR"] = "N";
            */
    	} else {
            record["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
            record["TEST_PRIMARY_RESULT"] = claimLevels[perfLevel] === undefined ? null : claimLevels[perfLevel].DESC;
            record["TEST_PASSED_INDICATOR"] = claimLevels[perfLevel] === undefined ? null : claimLevels[perfLevel].PASS_IND;
        }

    	return record;

    }


    /**
     * Maps standard CAASPP scoring fields.
     *
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing score type metadata.
     * @returns {object} JavaScript object containing score row mappings.
     */
    function mapCAASPPScore(row, scoreMetadata) {

        var record = {};
    	var testNumber = scoreMetadata.MAP_TEST_NUM_FUNCTION(row, scoreMetadata) + "_14_15";

    	//Check for score value before anything else.
    	var scaleScore = row.getField(scoreMetadata.TEST_TYPE + "_SCALE_SCORE");
    	var rawScore = row.getField(scoreMetadata.TEST_TYPE + "_RAW_SCORE");
    	var perfLevel = row.getField(scoreMetadata.TEST_TYPE + "_PERFORMANCE_LEVEL");
    	var itemsAttempt = row.getField(scoreMetadata.TEST_TYPE + "_ITEMS_ATTEMPTED");


    	record["TEST_NUMBER"] = testNumber;

        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) == "" || _util.trim(scaleScore) == "NS") {
            // Do not map record is no score is found.
            return null;

            /*
                Original mapping.  Caused unexpected TEST_NUMBER values to be generated.

            record["TEST_SCORE_TEXT"] = "NT";
            record["TEST_PRIMARY_RESULT_CODE"] = "NT";
            record["TEST_PRIMARY_RESULT"] = "Not Tested";
            record["TEST_PASSED_INDICATOR"] = "N";
            */
    	} else {
            record["TEST_SCORE_TEXT"] = scaleScore;
            record["TEST_SCORE_VALUE"] = scaleScore;
            record["TEST_SCALED_SCORE"] = scaleScore;
            record["TEST_RAW_SCORE"] = rawScore;
            record["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
            record["TEST_PRIMARY_RESULT"] = perfLevels[perfLevel] === undefined ? null : perfLevels[perfLevel].DESC;
            record["TEST_PASSED_INDICATOR"] = perfLevels[perfLevel] === undefined ? null : perfLevels[perfLevel].PASS_IND;
            record["TEST_ITEMS_ATTEMPTED"] = itemsAttempt;
        }

    	return record;

    }


    /***************************************************************************
        Test number lookups
    ***************************************************************************/

    /**
     * Determines appropriate SBAC test number based on given metadata and grade.
     *
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing score type metadata.
     * @returns {string} Generated TEST_NUMBER value.
     */
    function getSBACTestNumber(row, scoreMetadata) {
        var testGradeLevel =
            _util.coalesce(
                row.getField(scoreMetadata.TEST_TYPE + "_GRADE_TESTED")
                , "NA"
            );

        //Empty strings should be marked as NA.
        if(_util.trim(testGradeLevel) === "") {
            testGradeLevel = "NA";
        }

        //Pad grades with zeroes.
        if(testGradeLevel.length == 1) {
            testGradeLevel = "0" + testGradeLevel;
        }

        var testNumber = "SBAC_GR" +  testGradeLevel + "_" + scoreMetadata.TEST_CODE;

        return testNumber;

    }



    /**
     * Determines appropriate CAASPP Science test number based on given metadata and row record information.
     *
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing score type metadata.
     * @returns {string} Generated TEST_NUMBER value.
     */
    function getScienceTestNumber(row, scoreMetadata) {
        var RECORD_TYPE = row.getField("RECORD_TYPE");
        var CSTCMAResultsReported = row.getField("SCI_RESULTSREPORTED");
        var CAPA_LEVEL = row.getField("CAPA_LEVEL");
        var testGradeLevel = _util.coalesce(row.getField("SCI_GRADE_TESTED"), "NA");

        var testNumber = "SCI";

        var testType = "";


        //Empty strings should be marked as NA.
        if(_util.trim(testGradeLevel) === "") {
            testGradeLevel = "NA";
        }

        //Find Test Type
        if(RECORD_TYPE == "01") {
            if(CSTCMAResultsReported == "1") {
                testType = "CACST_";
            } else if (CSTCMAResultsReported == "2") {
                testType = "CACMA_";
            } else {
                //Not Applicable.  No scores should be loaded? Maybe add something in case valid scores are present?
                //Will currently be defaulted to CST until more details about "Not Applicable" are given.
                //testType = "CACST_CMA_";
                testType = "CACST_";
            }
        } else if(RECORD_TYPE == "02") {
            testType = "CACAPA_";
        } else if(RECORD_TYPE == "03") {
            testType = "CASTS_";
        } else {
            testType = "@ERR_";
        }

        testNumber = testType + testNumber;

        //CAPA tests use CAPA level instead of test grade.  There is also only 1 Math test type.
        if(RECORD_TYPE == "02") {
            testNumber = testNumber + CAPA_LEVEL;
        } else {
            testNumber = testNumber + testGradeLevel;
        }



        return testNumber;


    }



    /**
     * Determines appropriate CAASPP RLA test number based on given metadata and row record information.
     *
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing score type metadata.
     * @returns {string} Generated TEST_NUMBER value.
     */
    function getRLATestNumber(row, scoreMetadata) {
        var RECORD_TYPE = row.getField("RECORD_TYPE");
        var testGradeLevel = _util.coalesce(row.getField("RLA_GRADE_TESTED"), "NA");

        var testNumber = "ELA";

        var testType = "CASTS_";

        //Empty strings should be marked as NA.
        if(_util.trim(testGradeLevel) === "") {
            testGradeLevel = "NA";
        }

        testNumber = testType + testNumber + testGradeLevel;


        return testNumber;


    }



    /***************************************************************************
        Utility functions
    ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {

           // Note: Admin year isn't required for sorting. Should be left blank.
           var assessmentAdminKey_one = generateAssessmentAdminSortKey(signature, hierarchy, one);
           var assessmentAdminKey_two = generateAssessmentAdminSortKey(signature, hierarchy, two);

           if(assessmentAdminKey_one === assessmentAdminKey_two) {
               return 1;
           } else {
               return -1;
           }

       } catch (exception) {
           throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
       }

    }

    function generateAssessmentAdminSortKey(signature, hierarchy, srcRecord){

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey =  _util.coalesce(srcRecord.getField("RECORD_TYPE"),"")
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_LOCAL_ID"),"")
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_STATE_ID"),"")
            + "_" + _util.coalesce(srcRecord.getField("SBAC_ELA_PT_TESTDATE"),"")
            + "_" + _util.coalesce(srcRecord.getField("SBAC_ELA_NONPT_TESTDATE"),"")
            + "_" + _util.coalesce(srcRecord.getField("SBAC_MA_PT_TESTDATE"),"")
            + "_" + _util.coalesce(srcRecord.getField("SBAC_MA_NONPT_TESTDATE"),"")
            + "_" + _util.coalesce(srcRecord.getField("SCI_TESTDATE"),"")
            + "_" + _util.coalesce(srcRecord.getField("RLA_TESTDATE"),"");

        return assessmentAdminKey;

    }

    /**
     * Generate test administration date in MM/DD/YYYY format. Defaults to 03/15 of the administration school year.
     *
     * @param module Row data by logical name.
     * @param string The defined test type.
     * @param string Administration school year
     * @returns {string} Test date in MM/DD/YYYY format.
     */
    function formatTestDate(row, testType, schoolYear) {


        var fullDate = _util.coalesce(
                row.getField(testType + "_NONPT_TESTDATE")
                , row.getField(testType + "_PT_TESTDATE")
                , row.getField(testType + "_TESTDATE")
                , ""
            );

        var month = fullDate.substring(0, 2);
        var day = fullDate.substring(2, 4);
        var year = fullDate.substring(4, 8);

        if(month == null || _util.trim(month) == "") {
            month = "03";
        }

        // Default to 15th if no day is found.
        if(day == null || _util.trim(day) == "") {
            day = "15";
        }

        if(year == null || _util.trim(year) == "") {
            year = schoolYear.substring(5, 9);
        }

        return month + "/" + day + "/" + year;
    }


    /***************************************************************************
        Return final module object
    ***************************************************************************/

    return module;
}());
