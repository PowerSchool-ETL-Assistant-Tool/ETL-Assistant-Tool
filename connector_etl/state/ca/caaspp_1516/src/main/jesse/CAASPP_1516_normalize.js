var AppNormalize = (function() {
    var module = {};
    var _assessmentIdentifier = "CAASPP";
    var _thisModuleName = "AppNormalize";
	var fileHierarchy = "";
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
            print(`Loading using signature file ${signatureFormatName}`);

            //Initialize path and lineage variables.
            var normalizedFile = AppUtil.createResultsFile(file);
            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            fileHierarchy = AppUtil.getAssessmentHierarchyDetails(file);
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
                 .sort("SORT", (one, two) => {

                    var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                    var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                    return groupAdministration(rowOne, rowTwo);
                 })
                .group_by("DUPLICATION_GROUP" , function(one, two) {

                    var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                    var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                    return groupAdministration(rowOne, rowTwo);
                })
                .transform("NORMALIZE RECORDS", ["RECORDS"],function(output, rows) {

                 var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

                  if(rows.length > 1) {
                      rows.forEach(function (row, index) {
                         if (index > 0) {
                              AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "Duplicate rows found.", JSON.stringify(row)));
                         }
                      });
                  }
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


    function mapNormalizedRecords(signature, hierarchy, rows) {

        var normalizedRecords = [];
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        var record = mapNormalizedRecord(signature, hierarchy, row);

        AppUtil.nullSafePush(normalizedRecords, record);

        return normalizedRecords;
    }

    function mapNormalizedRecord(signature, hierarchy, row) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized try {
        record = mapNormalizedAdminFields(signature, hierarchy, record, row);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(mappingObject.ADMIN_MAPPINGS, row);

        //Scores Mappings From Here Generic Build
        try {
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapScore(row));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapClaimScore(row, "1"));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapClaimScore(row, "2"));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapClaimScore(row, "3"));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapClaimScore(row, "4"));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapDomainScore(row, "1"));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapDomainScore(row, "2"));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapDomainScore(row, "3"));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapWERScore(row, 'COV'));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapWERScore(row, 'DEV_EEL'));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapWERScore(row, 'POR'));
            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, mapCSA_CAAS(row));
         } catch (exception) {
            mappingObject.ERROR_MESSAGE = exception.message;
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
         }

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = "Edvantage CAASPP Loader v0.1";
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
    }


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
        Assessment-specific decodes
    ***************************************************************************/

    var gradeLookup = {
         "KN" 	: "KG"
         ,"KG" 	: "KG"
         ,"01"	: "01"
         ,"1"	: "01"
         ,"02"	: "02"
         ,"2"	: "02"
         ,"03"	: "03"
         ,"3"	: "03"
         ,"04"	: "04"
         ,"4"	: "04"
         ,"05"	: "05"
         ,"5"	: "05"
         ,"06"	: "06"
         ,"6"	: "06"
         ,"07"	: "07"
         ,"7"	: "07"
         ,"08"	: "08"
         ,"8"	: "08"
         ,"09"	: "09"
         ,"9"	: "09"
         ,"10"	: "10"
         ,"11"	: "11"
         ,"12"	: "12"
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

    var achieveLevels =
        {
            "4" : {LEVEL: "4", DESC: "Standard Exceeded", PASS_IND: "Yes"},
            "3" : {LEVEL: "3", DESC: "Standard Met", PASS_IND: "Yes"},
            "2" : {LEVEL: "2", DESC: "Standard Nearly Met", PASS_IND: "No"},
            "1" : {LEVEL: "1", DESC: "Standard Not Met", PASS_IND: "No"},
            "9" : {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"},
            "Standard Exceeded" : {LEVEL: "4", DESC: "Standard Exceeded", PASS_IND: "Yes"},
            "Standard Met" : {LEVEL: "3", DESC: "Standard Met", PASS_IND: "Yes"},
            "Standard Nearly Met": {LEVEL: "2", DESC: "Standard Nearly Met", PASS_IND: "No"},
            "Standard Not Met": {LEVEL: "1", DESC: "Standard Not Met", PASS_IND: "No"},
            "Did not attempt": {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"},
        };


    var claimLevels =
        {
            "3" : {LEVEL: "3", DESC: "Above Standard", PASS_IND: "Yes"},
            "2" : {LEVEL: "2", DESC: "At or Near Standard", PASS_IND: "No"},
            "1" : {LEVEL: "1", DESC: "Below Standard", PASS_IND: "No"},
            "9" : {LEVEL: "9", DESC: "Did not attempt", PASS_IND: "No"}
        };


    var csaLevels =
        {
            "3" : {LEVEL: "3", DESC: "High Degree", PASS_IND: "Yes"},
            "2" : {LEVEL: "2", DESC: "Moderate Degree", PASS_IND: "Yes"},
            "1" : {LEVEL: "1", DESC: "Limited Degree", PASS_IND: "No"}
        };

    var domainLevels =
        {
            "3" : {LEVEL: "3", DESC: "Above Standard", PASS_IND: "Yes"},
            "2" : {LEVEL: "2", DESC: "Near Standard", PASS_IND: "No"},
            "1" : {LEVEL: "1", DESC: "Below Standard", PASS_IND: "No"}
        };

    var domainCSALevels =
        {
            "2" : {LEVEL: "2", DESC: "On Track", PASS_IND: "Yes"},
            "1" : {LEVEL: "1", DESC: "Not On Track", PASS_IND: "No"}
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
            "INC" : {CODE: "INC", DESC: "Incomplete - No Score"},
            "LOSS" : {CODE: "LOSS", DESC: "Lowest obtainable scale score"},
            "NE" : {CODE: "NE", DESC: "Non-English Learner"},
            "NEL" : {CODE: "NEL", DESC: "Exempted from Smarter Balanced or CAA for ELA"},
            "NT" : {CODE: "NT", DESC: "Not Tested"},
            "NTC" : {CODE: "NTC", DESC: "Student did not have opportunity to test due to moving schools"},
            "NTE" : {CODE: "NTE", DESC: "Not tested due to medical emergency"},
            "PGE" : {CODE: "PGE", DESC: "Not tested by parent/guardian request"},
            "SCL" : {CODE: "SCL", DESC: "Completed test and grade/level administered does not match enrolled grade"},
            "T" : {CODE: "T", DESC: "Provided no answers"},
            "INC0" : {CODE: "INC0", DESC: "Incomplete - Lowest Obtainable Score"},
            "INC1" : {CODE: "INC1", DESC: "Incomplete - Lowest Obtainable Score + 1"}
        };

    var WERDecodes =
    {
        "B" : {CODE: "B", DESC: "BLANK"},
        "I" : {CODE: "INS", DESC: "Insufficient"},
        "L" : {CODE: "NL", DESC: "Nonscorable, Language"},
        "T" : {CODE: "OT", DESC: "Off Topic"},
        "M" : {CODE: "OP", DESC: "Off Purpose"},
         null : {CODE: null, DESC: null},
         "" : {CODE: null, DESC: null}
    }

    var includeCodes = {
        "E" :   "Exempt",
        "N" :   "Not Completed",
        "T" :   "Tested Not Met",
        "R" :   "Invalidated",
        "Y" :   "Completed"
    };

	var genreDecode = {
		"ARGU" : "Argumentative",
		"EXPL" : "Explanatory",
		"INFO" : "Informational",
		"NARR" : "Narrative",
		"OPIN" : "Opinion",
		"" : "",
		null : ""
	};

	 var subjectDecode = {
            "ELA" :   "01",
            "Math" :   "02",
            "1": "01",
            "2": "02",
            "01": "01",
            "02": "02"
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

    function decodeGradeCode(gradeCode) {
        if(gradeCode == null) {
             return null;
        }
        var lkpGradeObj = gradeLookup[gradeCode];
        if(lkpGradeObj == undefined || lkpGradeObj == null) {
             return null;
        }
        return lkpGradeObj;
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
    function mapStatusFlag(row) {
        var primaryScore = _util.coalesce(row.getField("SCALE_SCORE"), row.getField("RAW_SCORE")
            , row.getField("RAW_SCORE_1"), row.getField("RAW_SCORE_2"), row.getField("RAW_SCORE_3"), row.getField("RAW_SCORE_4"));
        var statusFlag = _util.trim(row.getField("SCORE_STATUS"));

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
        Assessment-specific score functions
    ***********************************************************************************/

    /**
     * Maps normalized administration fields.
     *
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, record, row) {

        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateString = '';
        var birthDateObject;


        //Date fields to be split
        if (row.getField("STUDENT_DOB") !== null && row.getField("STUDENT_DOB") !== undefined){
           if(row.getField("STUDENT_DOB").toString().length >= 9 && row.getField("STUDENT_DOB").toString().indexOf('-') > -1 && signature.getFormat().getFormatName() === "CAASPP_364_1_COLS") {
               var dateOfBirth = row.getField("STUDENT_DOB");
               birthDateObject = getDate(dateOfBirth);
           } else {
               birthDateObject = AppUtil.getMonthFollowedByDay(row.getField("STUDENT_DOB"));
           }
        }
        else {
            birthDateString = row.getField("STUDENT_DOB_YEAR") + "-" + row.getField("STUDENT_DOB_MONTH") + "-" + row.getField("STUDENT_DOB_DAY")
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDateString)
        }



        //Shared fields
        var schoolYear = hierarchy.SCHOOL_YEAR;

        /* pre UIHN-9419:
        var folderDistrictCode = AssessmentLoader.config.DISTRICT_CODE;
        var districtCode = (_util.coalesce(
                                            row.getField("TESTED_COUNTY_DISTRICT_CODE_1")
                                            , row.getField("TESTED_COUNTY_DISTRICT_CODE_2")
                                            , row.getField("CALPADS_DISTRICT_CODE")
                                            , folderDistrictCode
                                            , ""
                                            )
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
            row.getField("TESTED_COUNTY_DISTRICT_CODE_1")
            , row.getField("TESTED_COUNTY_DISTRICT_CODE_2")
            , row.getField("CALPADS_DISTRICT_CODE")
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
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(hierarchy, signature, row);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("FINAL_TESTED_SCHOOL_CODE")
                        , row.getField("SCHOOL_VENDOR_ID")
                        , row.getField("TESTED_SCHOOL_NAME_2")
                        , ""
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(
                        row.getField("FINAL_TESTED_SCHOOL_NAME")
                        , row.getField("SCHOOL_NAME")
                        , row.getField("TESTED_SCHOOL_NAME_2")
                        , ""
                    );
                break;
                case "SCHOOL_LOCAL_ID":

                    //Determine school code
                    var schoolCode = _util.coalesce(
                        row.getField("SCHOOL_VENDOR_ID")
                        , row.getField("TESTED_SCHOOL_CODE_1")
                        , row.getField("TESTED_SCHOOL_CODE_2")
                        , row.getField("TESTED_SCHOOL_CODE_3")
                        , row.getField("TESTED_SCHOOL_CODE_4")
                        , row.getField("CALPADS_SCHOOL_CODE")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE_1")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE_2")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE_3")
                        , row.getField("TESTED_CHARTER_SCHOOL_CODE_4")
                        , ""
                    );

                    //Remove district code from school code.
                    // record.SCHOOL_LOCAL_ID = schoolCode.replace(districtCode, "");  // pre UIHN-9419
                    record.SCHOOL_LOCAL_ID = schoolCode.replace(AssessmentLoader.config.DISTRICT_CODE, "");
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = schoolYear; //TODO deriveSchoolYear?
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = formatTestDate(row, schoolYear, signature);
                    break;
             //   case "TEST_REPORTING_DATE":
             //     record.TEST_REPORTING_DATE = '01/01/' + schoolYear.substring(5, 9);
             //     break;
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
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = decodeGradeCode(_util.coalesce(row.getField("GRADE_ASSESSED"), row.getField("CALPADS_GRADE")));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("STUDENT_GENDER_CODE")) === "Male" ? "M" : "F";
                    break;
                case "STUDENT_VENDOR_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_VENDOR_ID = row.getField("STUDENT_STATE_ID");
                    break;
                case "STUDENT_LOCAL_ID":
                  record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("STUDENT_STATE_ID"));
                  break;
                case "STUDENT_STATE_ID":
                    //Required for student matching.  Tracks new keys to match.
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"),row.getField("STUDENT_VENDOR_ID"));
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
     * Maps additional administration fields.
     *
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(admin, row) {


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

        /*
            The test format has changed and only one condition code may be displayed at a time.  The old field formats could be used if desired, but this format may be more descriptive.
        */
        var conditionCode = _util.trim(row.getField("STUDENT_CONDITION_CODE"));
        var includeCode = _util.trim(row.getField("INCLUDE_INDICATOR"));
        admin["TEST_EXEMPTION_CODE"] = conditionCode;
        admin["TEST_EXEMPTION_DESC"] = conditionCodes[conditionCode] === undefined ? null : conditionCodes[conditionCode].DESC;
        admin["TEST_EXEMPTION_CODE_2"] = includeCode;
        admin["TEST_EXEMPTION_DESC_2"] = includeCodes[includeCode] === undefined ? null : includeCodes[includeCode];
        return admin;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    /**
     * Maps scores based on the test type provided in the raw data.
     *
     * @param row Module representing raw data by logical name.
     * @returns {object} JavaScript object containing score row mappings.
     */
    function mapScore(row) {

        var testNumber = getTestNumber(row);

        //Check for score value before anything else.
        var scaleScore = row.getField("SCALE_SCORE");
        var rawScore = row.getField("RAW_SCORE");
        var perfLevel = row.getField("PERFORMANCE_LEVEL");
        var achieveLevel = row.getField("ACHIEVEMENT_LEVEL");
        //var domain1 = row.getField("DOMAIN_1_LEVEL");
        //var domain2 = row.getField("DOMAIN_2_LEVEL");
        //var domain3 = row.getField("DOMAIN_3_LEVEL");
        var growthScore = row.getField("GROWTH_SCORE");
        var standardError = row.getField("STANDARD_ERROR_MEASUREMENT_SCORE");
       // var standardErrors= row.getField("STANDARD_ERROR_MEASUREMENT_SCORES");
        var maxScore= row.getField("STANDARD_ERROR_MEASUREMENT_MAX");
        var minScore= row.getField("STANDARD_ERROR_MEASUREMENT_MIN");
        var lexileScore = row.getField("LEXILE_QUANTILE_MEASURE");



        var record = {};

        record["TEST_NUMBER"] = testNumber;
        record["TEST_QUATERNARY_RESULT_CODE"] = row.getField("ATTEMPTEDNESS");
        record["TEST_QUATERNARY_RESULT"] = decodeAttemptedFlag(row.getField("ATTEMPTEDNESS"));
        record["TEST_GROWTH_RESULT"] = growthScore;
        record["TEST_STANDARD_ERROR"] = standardError;
        record["TEST_LOWER_BOUND"] = minScore;
        record["TEST_UPPER_BOUND"] = maxScore;
        if (lexileScore) {
        record["TEST_READING_LEVEL"] = lexileScore.replace("BR", "").replace("L", "").replace("Q", "").replace("EM", "");
        }


        //Mark if record has score is blank,
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) == "" || scaleScore == "NS") {
            // Do not map record is no score is found.
            return null;

            /*
                Original mapping.  Caused unexpected TEST_NUMBER values to be generated.

            record["TEST_SCORE_TEXT"] = "NT";
            record["TEST_SCORE_VALUE"] = null;
            record["TEST_SCALED_SCORE"] = null;
            record["TEST_RAW_SCORE"] = null;
            record["TEST_PRIMARY_RESULT_CODE"] = "NT";
            record["TEST_PRIMARY_RESULT"] = "Not Tested";
            record["TEST_PASSED_INDICATOR"] = "N";
            */
        } else {
            record["TEST_SCORE_TEXT"] = scaleScore;
            record["TEST_SCORE_VALUE"] = scaleScore;
            record["TEST_SCALED_SCORE"] = scaleScore;
            record["TEST_RAW_SCORE"] = rawScore;

            if(_util.trim(achieveLevel) !== "" && _util.trim(achieveLevel) !== null) {

                if(testNumber && testNumber.toString().indexOf("CACSA") > -1){
                    record["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
                    record["TEST_PRIMARY_RESULT"] = csaLevels[achieveLevel] === undefined ? null : csaLevels[achieveLevel].DESC;
                    record["TEST_PASSED_INDICATOR"] = csaLevels[achieveLevel] === undefined ? null : csaLevels[achieveLevel].PASS_IND;

                }else{
                    record["TEST_PRIMARY_RESULT_CODE"] = achieveLevels[achieveLevel] === undefined ? null : achieveLevels[achieveLevel].LEVEL;
                    record["TEST_PRIMARY_RESULT"] = achieveLevels[achieveLevel] === undefined ? null : achieveLevels[achieveLevel].DESC;
                    record["TEST_PASSED_INDICATOR"] = achieveLevels[achieveLevel] === undefined ? null : achieveLevels[achieveLevel].PASS_IND;
                }
            } else if (_util.trim(perfLevel) !== "" && _util.trim(perfLevel) !== null) {
                record["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
                record["TEST_PRIMARY_RESULT"] = perfLevels[perfLevel] === undefined ? null : perfLevels[perfLevel].DESC;
                record["TEST_PASSED_INDICATOR"] = perfLevels[perfLevel] === undefined ? null : perfLevels[perfLevel].PASS_IND;
            }
            /*if((domain1 !== null && domain1 !== "")||(domain2 !== null && domain2 !== "")||(domain3 !== null && domain3 !== "")){
				if(testNumber.toString().indexOf("CACSA") > -1){
                    record["TEST_SECONDARY_RESULT_CODE"] = domain1;
                    record["TEST_SECONDARY_RESULT"] = domainCSALevels[domain1] === undefined ? null : domainCSALevels[domain1].DESC;
                    record["TEST_TERTIARY_RESULT_CODE"] = domain2;
                    record["TEST_TERTIARY_RESULT"] = domainCSALevels[domain2] === undefined ? null : domainCSALevels[domain2].DESC;
                    record["TEST_CUSTOM_RESULT_CODE"] = domain3;
                    record["TEST_CUSTOM_RESULT"] = domainCSALevels[domain3] === undefined ? null : domainCSALevels[domain3].DESC;
				}else{
                    record["TEST_SECONDARY_RESULT_CODE"] = domain1;
                    record["TEST_SECONDARY_RESULT"] = domainLevels[domain1] === undefined ? null : domainLevels[domain1].DESC;
                    record["TEST_TERTIARY_RESULT_CODE"] = domain2;
                    record["TEST_TERTIARY_RESULT"] = domainLevels[domain2] === undefined ? null : domainLevels[domain2].DESC;
                    record["TEST_CUSTOM_RESULT_CODE"] = domain3;
                    record["TEST_CUSTOM_RESULT"] = domainLevels[domain3] === undefined ? null : domainLevels[domain3].DESC;
				}
			}*/




        }

        return record;

    }



    /**
     * Maps claim scores based on the test type provided in the raw data and a given claim number 1-4.
     *
     * @param module Module representing raw data by logical name.
     * @param string The claim number to map.
     * @returns {object} JavaScript object containing score row mappings.
     */
    function mapClaimScore(row, claimNumber) {

        var testNumber = getClaimTestNumber(row, claimNumber);

        if(testNumber === null) {
            return null;
        }

        //Check for performance value before anything else. (Smarter_Claim_1_Performance_Level)
        var perfLevel = row.getField("SMARTER_CLAIM_" + claimNumber + "_PERFORMANCE_LEVEL");
        var claimScore = row.getField( 'SMARTERCOMP_CLAIM_' + claimNumber + '_SCORE');
//        var claimPerformanceLevel = row.getField( 'SMARTERCOMP_CLAIM_' + claimNumber + '_PL');
        var standardError = row.getField("STANDARD_ERROR_MEASUREMENT_SCORE");
        var record = {};

        record["TEST_NUMBER"] = testNumber;
        record["TEST_QUATERNARY_RESULT_CODE"] = row.getField("ATTEMPTEDNESS");
        record["TEST_QUATERNARY_RESULT"] = decodeAttemptedFlag(row.getField("ATTEMPTEDNESS"));
        record["TEST_STANDARD_ERROR"] = standardError;

        record["TEST_SCALED_SCORE"] = claimScore;
        if (claimScore === null || claimScore === undefined || claimScore == "") {
            return null;
        }
//        record["TEST_SECONDARY_RESULT_CODE"] = claimPerformanceLevel;
//        record["TEST_SECONDARY_RESULT"] = claimLevels[claimPerformanceLevel];

            //{LEVEL: "9", DESC: "Did not attempt", PASS_IND: "N"}
        if(perfLevel === null || perfLevel === undefined || _util.trim(perfLevel) == "" || perfLevel == "9" || _util.trim(perfLevel) == "NS") {
            // Do not map record is no score is found.
            return null;
        } else {
            record["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
            record["TEST_PRIMARY_RESULT"] = claimLevels[perfLevel] === undefined ? null : claimLevels[perfLevel].DESC;
            record["TEST_PASSED_INDICATOR"] = claimLevels[perfLevel] === undefined ? null : claimLevels[perfLevel].PASS_IND;
        }

       return record;



    }

    function mapDomainScore(row, claimNumber) {

       var testNumber = getTestNumber(row)+"D"+claimNumber;

       if(testNumber === "D"+claimNumber) {
           return null;
       }

       var domain = row.getField("DOMAIN_" + claimNumber + "_LEVEL");
       var standardError = row.getField("STANDARD_ERROR_MEASUREMENT_SCORE");
       var record = {};

       record["TEST_NUMBER"] = testNumber;
       record["TEST_STANDARD_ERROR"] = standardError;

           //{LEVEL: "9", DESC: "Did not attempt", PASS_IND: "N"}
       if(domain === null || domain === undefined || _util.trim(domain) == "" || domain == "9" || _util.trim(domain) == "NS") {
           // Do not map record is no score is found.
           return null;
       } else {
				if(testNumber.toString().indexOf("CACSA") > -1){
                    record["TEST_PRIMARY_RESULT_CODE"] = domain;
                    record["TEST_PRIMARY_RESULT"] = domainCSALevels[domain] === undefined ? null : domainCSALevels[domain].DESC;
                    record["TEST_PASSED_INDICATOR"] = domainCSALevels[domain] === undefined ? null : domainCSALevels[domain].PASS_IND;
				}else{
                    record["TEST_PRIMARY_RESULT_CODE"] = domain;
                    record["TEST_PRIMARY_RESULT"] = domainLevels[domain] === undefined ? null : domainLevels[domain].DESC;
                    record["TEST_PASSED_INDICATOR"] = domainLevels[domain] === undefined ? null : domainLevels[domain].PASS_IND;
				}


       }



       return record;

    }

    function mapWERScore(row, fieldSuffix) {

        var testNumber = getTestNumber(row) + '_WER_' + fieldSuffix;

        if(testNumber === '_WER_' + fieldSuffix) {
            return null;
        }

        var genre = row.getField("GENRE");
        var standardError = row.getField("STANDARD_ERROR_MEASUREMENT_SCORE");

        var record = {};
        var scoreValue = row.getField("WER_" + fieldSuffix);

// The request was to add the sum of these 3 mentioned fields
//UIHN-81890
        var werPor = row.getField("WER_POR");
        var werDevEel = row.getField("WER_DEV_EEL");
        var werCov = row.getField("WER_COV");
        var sumWer = parseInt(werPor) + parseInt(werDevEel) + parseInt(werCov) ;


        record["TEST_NUMBER"] = testNumber;
        record["TEST_STANDARD_ERROR"] = standardError;

        var WER_Condition_Code = row.getField("WER_"+fieldSuffix+"_CONDITION_CODE");
        //"WER_DEV_EEL_CONDITION_CODE" as ref

            //{LEVEL: "9", DESC: "Did not attempt", PASS_IND: "N"}
        if((scoreValue === null || scoreValue === undefined || _util.trim(scoreValue) == "") && (WER_Condition_Code === null || WER_Condition_Code === undefined || _util.trim(WER_Condition_Code) == "")) {
            // Do not map record is no score is found.
            return null;
        } else {
            record["TEST_SCORE_TEXT"] = genre;
            record["TEST_PRIMARY_RESULT"] = genreDecode[genre];
            record["TEST_SCORE_VALUE"] = scoreValue;
        }

        //Wrapped the WER decodes here
        record["TEST_SCORE_ATTRIBUTES"] = WERDecodes[WER_Condition_Code].DESC;
        record["TEST_CUSTOM_RESULT"] = sumWer;

        return record;

    }


    function mapCSA_CAAS(row) {
        var record = {};
        var testNumber = getTestNumber(row)+"_ITEMS";

        var answered = row.getField("TOTAL_NUM_ITEMS_ANSWERED");
        var itemNum  = row.getField("TOTAL_NUM_ITEMS");
        var percent  = row.getField("OVERALL_PERCENT_CORRECT");
        var prelimCAA  = row.getField("PRELIMINARY_INDICATOR_CAA");
        var standardError = row.getField("STANDARD_ERROR_MEASUREMENT_SCORE");

        record["TEST_NUMBER"] = testNumber;

            //{LEVEL: "9", DESC: "Did not attempt", PASS_IND: "N"}
        if(answered === null || answered === undefined || _util.trim(answered) == "") {
            // Do not map record is no score is found.
            return null;
        } else {
            record["TEST_SCORE_TEXT"] = percent;
            record["TEST_SCORE_VALUE"] = percent;
            record["TEST_PERCENTAGE_SCORE"] = percent;
            record["TEST_ITEMS_ATTEMPTED"] = answered;
            record["TEST_ITEMS_POSSIBLE"] = itemNum;
            record["TEST_STANDARD_ERROR"] = standardError;
            if(prelimCAA !== null && prelimCAA !== undefined && _util.trim(prelimCAA) !== ""){
                record["TEST_SECONDARY_RESULT_CODE"] = "PRELIM_CAA";
                record["TEST_SECONDARY_RESULT"] = prelimCAA;
            }

        }


        return record;

    }


    /***************************************************************************
        Test number lookups
    ***************************************************************************/

    /**
     * Determines appropriate test number based on record test type and grade.
     *
     * @param module Module representing raw data by logical name.
     * @returns {string} Generated TEST_NUMBER value.
     */
    function getTestNumber(row) {

        var testNumber = null;
        var recordType = row.getField("RECORD_TYPE");
        var CAPA_Level = row.getField("CAPA_LEVEL");
        var testGradeLevel = _util.coalesce(row.getField("GRADE_ASSESSED"), row.getField("CALPADS_GRADE"), "NA");

        //Empty strings should be marked as NA.
        if(_util.trim(testGradeLevel) === "") {
            testGradeLevel = "NA";
        }

        //Pad grades with zeroes.
        if(testGradeLevel.length == 1) {
            testGradeLevel = "0" + testGradeLevel;
        }


        if(recordType && recordType.length == 1) {
            recordType = "0" + recordType;
        }
		if(fileHierarchy.SCHOOL_YEAR === "2015-2016"){
			switch(recordType) {
				case "01": //Smarter Balanced for ELA
					testNumber = "SBAC_GR" + testGradeLevel + "_ELA";
					break;
				case "02": //Smarter Balanced for Math
					testNumber = "SBAC_GR" + testGradeLevel + "_MA";
					break;
				case "03": //CAA for ELA
					testNumber = "CACAA_ELA" + testGradeLevel;
					break;
				case "04": //CAA for Mathematics
					testNumber = "CACAA_MA" + testGradeLevel;
					break;
				case "05": //CST for Science
					testNumber = "CACST_SCI" + testGradeLevel;
					break;
				case "06": //CMA for Science
					testNumber = "CACMA_SCI" + testGradeLevel;
					break;
				case "07": //CAPA for Science
					testNumber = "CACAPA_SCI" + CAPA_Level;
					break;
				case "08": //STS for RLA
					testNumber = "CASTS_ELA" + testGradeLevel;
					break;
				default:
					break;
			}

		}
		else if(fileHierarchy.SCHOOL_YEAR === "2016-2017"){
			switch(recordType) {
				case '01': //Smarter Balanced for ELA
					testNumber = 'SBAC_GR' + testGradeLevel + '_ELA';
					break;
				case '02': //Smarter Balanced for Math
					testNumber = 'SBAC_GR' + testGradeLevel + '_MA';
					break;
				case '03': //CAA for ELA
					testNumber = 'CACAA_ELA' + testGradeLevel;
					break;
				case '04': //CAA for Mathematics
					testNumber = 'CACAA_MA' + testGradeLevel;
					break;
				case '05': //CST for Science
					testNumber = 'CACAA_SCI' + testGradeLevel;
					break;
				case '06': //CMA for Science
					testNumber = 'CACAST_SCI' + testGradeLevel;
					break;
				case '07': //CAPA for Science
					testNumber = 'CACAPA_SCI' + CAPA_Level;
					break;
				case '08': //STS for RLA
					testNumber = 'CASTS_ELA' + testGradeLevel;
					break;
				default:
					break;
			}
		}
		else if(fileHierarchy.SCHOOL_YEAR === "2017-2018" || fileHierarchy.SCHOOL_YEAR === "2018-2019" ){
			 switch(recordType) {
				case '01': //Smarter Balanced for ELA
					testNumber = 'SBAC_GR' + testGradeLevel + '_ELA';
					break;
				case '02': //Smarter Balanced for Math
					testNumber = 'SBAC_GR' + testGradeLevel + '_MA';
					break;
				case '03': //CAA for ELA
					testNumber = 'CACAA_ELA' + testGradeLevel;
					break;
				case '04': //CAA for Mathematics
					testNumber = 'CACAA_MA' + testGradeLevel;
					break;
				case '05': //CST for Science
					testNumber = 'CACAA_SCI' + testGradeLevel;
					break;
				case '06': //CMA for Science
					testNumber = 'CACAST_SCI' + testGradeLevel;
					break;
				case '07': //STS for RLA
					testNumber = 'CASTS_ELA' + testGradeLevel;
					break;
                case '09': //Spanish
                    testNumber = 'CACSA' + testGradeLevel;
                    break;
        		case 'ELA': //Smarter Balanced for ELA
        			testNumber = 'SBAC_GR' + testGradeLevel + '_ELA';
        			break;
        		case 'Math': //Smarter Balanced for Math
        			testNumber = 'SBAC_GR' + testGradeLevel + '_MA';
        			break;
       			case 'CAA ELA': //CAA for ELA
    				testNumber = 'CACAA_ELA' + testGradeLevel;
        			break;
        		case 'CAA Math': //CAA for Mathematics
        			testNumber = 'CACAA_MA' + testGradeLevel;
        			break;
        		case 'CAST': //CST for Science
        			testNumber = 'CACAST_SCI' + testGradeLevel;
        			break;
        		case 'CAA Science': //CMA for Science
        			testNumber = 'CACAA_SCI' + testGradeLevel;
        			break;
				default:
					break;
			}
		}
		else if(row.getField("RECORD_IDENTIFIER") === "Preliminary"){
             switch(recordType) {
                case '01': //Smarter Balanced for ELA
                    testNumber = 'SBAC_PRE_GR' + testGradeLevel + '_ELA';
                    break;
                case '02': //Smarter Balanced for Math
                    testNumber = 'SBAC_PRE_GR' + testGradeLevel + '_MA';
                    break;
                case '03': //CAA for ELA
                    testNumber = 'CACAA_PRE_ELA' + testGradeLevel;
                    break;
                case '04': //CAA for Mathematics
                    testNumber = 'CACAA_PRE_MA' + testGradeLevel;
                    break;
                case '06': //CAST for Science
                    testNumber = 'CACAST_PRE_SCI' + testGradeLevel;
                    break;
                default:
                    break;
            }
        }
        else {
            switch(recordType) {
                case '01': //Smarter Balanced for ELA
                    testNumber = 'SBAC_GR' + testGradeLevel + '_ELA';
                    break;
                case '02': //Smarter Balanced for Math
                    testNumber = 'SBAC_GR' + testGradeLevel + '_MA';
                    break;
                case '03': //CAA for ELA
                    testNumber = 'CACAA_ELA' + testGradeLevel;
                    break;
                case '04': //CAA for Mathematics
                    testNumber = 'CACAA_MA' + testGradeLevel;
                    break;
                case '05': //CAA for Science
                    testNumber = 'CACAA_SCI' + testGradeLevel;
                    break;
                case '06': //CAST for Science
                    testNumber = 'CACAST_SCI' + testGradeLevel;
                    break;
                case '09': //Spanish
                    testNumber = 'CACSA' + testGradeLevel;
                    break;
                default:
                    break;
            }
        }
        return testNumber;

    }


    /**
     * Determines appropriate test number based on record test type, grade, and claim number.
     *
     * @param module Module representing raw data by logical name.
     * @param string The claim number to map.
     * @returns {string} Generated TEST_NUMBER value.
     */
    function getClaimTestNumber(row, claimNumber) {

        var testNumber = null;
        var recordType = subjectDecode[row.getField("RECORD_TYPE")];
        var testGradeLevel = _util.coalesce(row.getField("GRADE_ASSESSED"), row.getField("CALPADS_GRADE"), "NA");

        //Empty strings should be marked as NA.
        if(_util.trim(testGradeLevel) === "") {
            testGradeLevel = "NA";
        }

        //Pad grades with zeroes.
        if(testGradeLevel.length == 1) {
            testGradeLevel = "0" + testGradeLevel;
        }

        switch(recordType) {
            case "01": //Smarter Balanced for ELA
                testNumber = "SBAC_GR" + testGradeLevel + "_ELA";
                switch(claimNumber) {
                    case "1":
                        testNumber = testNumber + "_RD";
                        break;
                    case "2":
                        testNumber = testNumber + "_WR";
                        break;
                    case "3":
                        testNumber = testNumber + "_LSSPK";
                        break;
                    case "4":
                        testNumber = testNumber + "_RI";
                        break;
                    default:
                        // No other codes have claims. Prevent from loading.
                        testNumber = null;
                        break;
                }
                break;
            case "02": //Smarter Balanced for Math
                testNumber = "SBAC_GR" + testGradeLevel + "_MA";
                switch(claimNumber) {
                    case "1":
                        testNumber = testNumber + "_CNPR";
                        break;
                    case "2":
                        testNumber = testNumber + "_PSMDLDA";
                        break;
                    case "3":
                        testNumber = testNumber + "_CR";
                        break;
                    case "4":
                        // No other codes have claims. Prevent from loading.
                        testNumber = null;
                        break;
                    default:
                        // No other codes have claims. Prevent from loading.
                        testNumber = null;
                        break;
                }
                break;
            default:
                // No other codes have claims. Prevent from loading.
                testNumber = null;
                break;
        }

        return testNumber;

    }



    /***************************************************************************
        Utility functions
    ***************************************************************************/

    /**
     * Determines administration equality for grouping.
     *
     * @param module First row data by logical name.
     * @param module Second row data by logical name.
     * @returns {string} Row equality value.
     */
    function groupAdministration(one, two) {

        var sortKeyOne = getSortKey(one);
        var sortKeyTwo = getSortKey(two);

        if(sortKeyOne > sortKeyTwo)
            return 1;
        else if(sortKeyOne < sortKeyTwo)
            return -1;
        return 0;
    }


    /**
     * Generate sorting key.
     *
     * @param module Row data by logical name.
     * @returns {string} Sorting key.
     */
    function getSortKey(record) {
        return _util.coalesce(record.getField("RECORD_TYPE"),"")
            + "_" + _util.coalesce(record.getField("STUDENT_LOCAL_ID"),"")
            + "_" + _util.coalesce(record.getField("STUDENT_STATE_ID"),"")
            + "_" + _util.coalesce(record.getField("TEST_COMPLETION_DATE_1"), record.getField("TEST_COMPLETION_DATE_2"), record.getField("TEST_COMPLETION_DATE_3"));
    }


    /**
     * Generate test administration date in MM/DD/YYYY format. Defaults to 03/15 of the administration school year.
     *
     * @param module Row data by logical name.
     * @param string Administration school year
     * @returns {string} Test date in MM/DD/YYYY format.
     */
    function formatTestDate(row, schoolYear, signature) {

    	var fullDate = _util.coalesce(
    			row.getField("TEST_COMPLETION_DATE_1")
    			, row.getField("TEST_COMPLETION_DATE_2")
    			, row.getField("TEST_COMPLETION_DATE_3")
    		)
    	if(fullDate === null || fullDate === undefined || fullDate === "") {
    	    fullDate = "03/15/" + schoolYear.substring(5, 9);
    	} else if(fullDate.toString().length >= 9 && fullDate.toString().indexOf('-') > -1 && signature.getFormat().getFormatName() === "CAASPP_364_1_COLS") {
            fullDate = getDate(fullDate).STANDARD_DATE;
    	} else {
    	    fullDate = AppUtil.getMonthFollowedByDay(fullDate).STANDARD_DATE;
    	}
        return fullDate;
    }
     function getDate(datePatt) {
             var dateObj = {
                  MONTH : null
                 , DAY : null
                 , YEAR : null
                 , STANDARD_DATE : null
             };
             var splitDate = datePatt.split("-");
             dateObj.DAY = splitDate[0];
             dateObj.MONTH = splitDate[1];
             dateObj.YEAR = splitDate[2];

             dateObj.STANDARD_DATE = dateObj.MONTH + "/" + dateObj.DAY + "/" + dateObj.YEAR;
             return dateObj;
          }

    function parseDate(rawDate){

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === ""){
            return dateObj;
        }

        var formatter;

        if (rawDate.length === 8 && rawDate.indexOf('/') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('dd/MM/yy');

        }else if(rawDate.length === 6 && rawDate.indexOf('/') == -1) {
            formatter = new java.text.SimpleDateFormat("ddMMyy");
        }
        else if (rawDate.length >= 6 && rawDate.length <=8) {
            formatter = new java.text.SimpleDateFormat('MM/dd/yy');
        }
          else if (rawDate.length >= 9 && rawDate.indexOf('/') !== -1 ) {
             formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
        }
        else
        {
            formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
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

    function generateAssessmentAdminKey(hierarchy, signature, row) {

         var recordType = row.getField("RECORD_TYPE");
         var student_id = row.getField("STUDENT_LOCAL_ID") ? row.getField("STUDENT_LOCAL_ID") : row.getField("STUDENT_STATE_ID");
        // var student_state_id =  row.getField("STUDENT_STATE_ID")
         var testCompDate =  _util.coalesce(row.getField("TEST_COMPLETION_DATE_1"), row.getField("TEST_COMPLETION_DATE_2"));

        var assessmentAdminKey = `${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${recordType}_${student_id}`;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(row.getField(key),"");
        });

        return assessmentAdminKey;
    }

    /***************************************************************************
        Return final module object
    ***************************************************************************/

    return module;
}());

