var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "IBDP";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;
    //Components need Composite diploma award decode for their secondary result
    //In the data file this is only on the Composite
    //Composite runs first and sets the globalResult for its Components
    var globalResult = null;

    /**
     * This function will convert the source file given into the normalized assessment format.
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
                    if (mappingObject.ERROR_MESSAGE) {
                       AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, mappingObject.ERROR_MESSAGE, JSON.stringify(row)));
                    }
                    // Report when no scores are found.
                    else if(mappingObject.SCORE_MAPPINGS.length === 0) {
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

    var scoresToMap =
        [
            //Scores to Process
            {TEST: "IBDP_", MAP_FUNCTION: mapCompositeScore}
            ,{TEST: "IBDP_", MAP_FUNCTION: mapScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var decodePerformanceLevel = {
        "1" 	: "1"
        ,"2"	: "2"
        ,"3"	: "3"
        ,"4"	: "4"
        ,"5"	: "5"
        ,"6"	: "6"
        ,"7"	: "7"
        ,"A"	: "4"
        ,"B"	: "3"
        ,"C"	: "2"
        ,"D"	: "1"
        ,"E"	: "0"
        ,"F"	: "0"
        ,"N"	: "Non-Completion"
        ,"P"	: "Pass"
        ," "	: null
        ,""	    : null
        ,null	: null
    };
    var decodeResultCode = {
        "B" : "Bilingual Diploma"
        ,"C" : "Certificate Awarded"
        ,"D" : "Regular Diploma"
        ,"F" : "Diploma Not Awarded"
        ,"Diploma awarded" : "Diploma Awarded"
        ,"Diploma not awarded" : "Diploma Not Awarded"
        ,"Candidate withdrawn" : "Candidate Withdrawn"
        ,"I" : "Invalid Diploma Registration - Diploma Not Awarded"
        ,"J" : "CP Not Awarded"
        ,"K" : "CP Awarded"
        ,"L" : "Invalid CP Registration - CP Not Awarded"
        ,"P" : "Results Pending"
        ,"W" : "Withdrawn"
        ,""	    : ""
        ,null	: ""
    };
    var decodeResultCodePriorMay2016 = {
        "B" : "Bilingual Certificate Awarded"
        ,"C" : "Certificate Awarded"
        ,"D" : "Regular Diploma"
        ,"F" : "Certificate Not Awarded"
        ,"I" : "Invalid Registration - Certificate Not Awarded"
        ,"J" : "CP Not Awarded"
        ,"K" : "CP Awarded"
        ,"L" : "Invalid CP Registration - CP Not Awarded"
        ,"M" : "Certificate Awarded"
        ,"P" : "Results Pending"
        ,"S" : "Not Eligible for Certificate/Record of Achievement"
        ,"U" : "Uncertificated"
        ,"W" : "Withdrawn"
        ,""	    : ""
        ,null	: ""
    };
    var decodeLevel = {
        "HL" 	: "_HL"
        ,"SL"	: "_SL"
        ,"EE"	: "_EE"
        ,"TK"	: ""
        ,"RP"	: ""
        ," "	: ""
        ,""	    : ""
        ,null	: ""
    };
    var decodeGradeDescriptor = {
        "0" 	: "Grade 0"
        ,"1" 	: "Grade 1"
        ,"2"	: "Grade 2"
        ,"3"	: "Grade 3"
        ,"4"	: "Grade 4"
        ,"5"	: "Grade 5"
        ,"6"	: "Grade 6"
        ,"7"	: "Grade 7"
        ,"A"	: "Grade A"
        ,"B"	: "Grade B"
        ,"C"	: "Grade C"
        ,"D"	: "Grade D"
        ,"E"	: "Grade E"
        ,"N"	: "Grade N"
        ,"P"    : "Grade P"
        ," "	: ""
        ,""	    : ""
        ,null	: ""
    };
    var decodeSubject = {
        "ARABIC A: Literature self taugt"       : "ARAB_A_LIT"
        ,"ARABIC A: Literature self taug"       : "ARAB_A_LIT"
        ,"ARABIC AB."                           : "ARAB_AB"//NEW
        ,"ARABIC B"                             : "ARAB_B"
        ,"ARMENIAN A: Literature"               : "ARMN_A_LIT"
        ,"ASTRONOMY"                            : "ASTR"
        ,"BIOLOGY" 	                            : "BIO"
        ,"BUSINESS AND MANAGEMENT" 	            : "BUS_MAN"
        ,"BUSINESS MANAGEMENT" 	                : "BUS_MAN"
        ,"BUS.&MAN." 	                        : "BUS_MAN"
        ,"BUS.& MAN." 	                        : "BUS_MAN"
        ,"BUS. & MAN." 	                        : "BUS_MAN"
        ,"BUS MAN" 	                            : "BUS_MAN"
        ,"CHEMISTRY" 	                        : "CHEM"
        ,"CHINESE A"                            : "CHIN_A"
        ,"CHINESE A: Literature"                : "CHIN_A_LIT"
        ,"CHINESE A: Literature self tau"       : "CHIN_A_LIT"
        ,"CHINESE A: Lang and Literature"       : "CHIN_A_LANG_LIT"
        ,"CHINESE B"                            : "CHINESE_B"
        ,"CHINESE B - MANDARIN"                 : "CHINESE_B_MAND"
        ,"CLASSICAL GREEK"                      : "GREEK"
        ,"CLASS.GREEK"                          : "GREEK"
        ,"COMPUTER SCIENCE"                     : "COMP_SCI"
        ,"COMPUTER SC."                         : "COMP_SCI"
        ,"DANCE"                                : "DANCE"
        ,"DESIGN TECHNOLOGY"                    : "DSN_TECH"
        ,"DESIGN TECH."                         : "DSN_TECH"
        ,"ECONOMICS"	                        : "ECON"
        ,"ENGLISH B"                            : "ENG_B"
        ,"ENGLISH A"	                        : "ENG_A"
        ,"ENGLISH A1"                           : "ENG_A1"
        ,"ENGLISH A: Lang and Literature"       : "ENG_A_LANG_LIT"
        ,"ENGLISH A LAL"                        : "ENG_A_LANG_LIT"
        ,"ENGLISH A: Language and Literature"   : "ENG_A_LAN_LIT"
        ,"ENGLISH A: Literature"                : "ENG_A_LIT"
        ,"ENGLISH A LIT"                        : "ENG_A_LIT"
        ,"ENVIRONMENTAL SYSTEMS AND SOCIETIES"  : "ENV_SOC"
        ,"ENV. AND SOC."                        : "ENV_SOC"
        ,"ENVIRON.SYST."                        : "ENV_SYS"
        ,"FILM"                                 : "FILM"
        ,"FINNISH A: Literature self tau"       : "FINN_A_LIT"
        ,"FRENCH A: Lang and Literature"        : "FRENCH_A_LANG_LIT"
        ,"FRENCH A: Literature self taug"       : "FRENCH_A_LIT"//NEW
        ,"FRENCH B"	                            : "FRENCH_B"
        ,"FRENCH AB."	                        : "FRENCH_AB"
        ,"FURTH. MATHS"	                        : "FUR_MA"
        ,"GEOGRAPHY"	                        : "GEOG"
        ,"GERMAN A: Literature self taug"	    : "GERM_A_LIT"
        ,"GERMAN AB."	                        : "GERM_AB"
        ,"GERMAN B"	                            : "GERM_B"
        ,"GLOB. POL"                            :"GLOB_POL"
        ,"GLOBAL POLITICS"	                    : "GLB_POL"
        ,"GROUP A LANGUAGE A"	                : "GRP_A_LANG_A"
        ,"HEBREW B"	                            : "HEB_B"
        ,"HEBREW A: Literature self taug"	    : "HEB_A_LIT"
        ,"HINDI A: Literature self taugh"	    : "HINDI_A_LIT"//NEW
        ,"HISTORY"	                            : "HIST"
        ,"HISTORY AMERICAS"	                    : "HIST_AMER"
        ,"HIST.AMERICAS"	                    : "HIST_AMER"
        ,"HISTORY 2: AMERICAS"	                : "HIST_AMER"
        ,"HISTORY 2: AFRICA"	                : "HIST_AFR"
        ,"HIST. AFRICA AND MID. EAST"           :"HIST_AFRICA_MID_EST"
        ,"HISTORY 2: ASIA/OCEANIA"	            : "HIST_ASIA_OCEA"
        ,"HISTORY ASIA AND OCEANIA"             : "HIST_ASIA_OCEA"
        ,"HISTORY 2: EUROPE/MIDDLE EAST"	    : "HIST_EUR_MID"
        ,"HISTORY EUROPE"                       : "HIST_EUR"//new
        ,"HUMAN RIGHTS"	                        : "HU_RIGT"
        ,"INFORMATION TECHNOLOGY IN GLOBAL SOCIETY":"INFO_TECH_IN_GLOB"
        ,"ITALIAN B"	                        : "ITAL_B"
        ,"ITALIAN AB."	                        : "ITAL_AB"//new
        ,"ITGS"	                                : "ITGS"
        ,"JAPANESE A: Literature self tau"	    : "JPN_A_LIT"
        ,"JAPANES A: Literature self tau"	    : "JPN_A_LIT"
        ,"JAPANESE B"	                        : "JPN_B"
        ,"LANGUAGE A"	                        : "LANG_A"
        ,"LANGUAGE A: Literature"	            : "LANG_A_LIT"
        ,"LATIN"	                            : "LATIN"
        ,"LITERATURE AND PERFORMANCE"	        : "LIT_PERF"
        ,"MANDARIN AB"	                        : "MAND_AB"
        ,"MANDARIN AB."	                        : "MAND_AB"
        ,"MANDARIN B"                           : "MAND_B"
        ,"MATH ANALYSIS"                        : "MATH_ANALYSIS"
        ,"MATH APPS"                            : "MATH_APPS"
        ,"MATH.STUDIES"	                        : "MA_STD"
        ,"MATHEMATICS"	                        : "MA"
        ,"MATH.DISCRETE"	                    : "MA_DISC"
        ,"MATH.SET.REL.GRP."	                : "MA_SET_GRP"
        ,"MATH.STAT.PROB."	                    : "MA_STAT_PROB"
        ,"MATHEMATICS APPLICATIONS AND I"	    : "MA_APP_I"
        ,"MATHEMATICS ANALYSIS AND APPRO"	    : "MA_ANA_APPRO"//NEW
        ,"MUSIC"	                            : "MUS"
        ,"MUSIC CREATING"	                    : "MUS_CREA"
        ,"MUSIC GROUP PERF."	                : "MUS_GRP"
        ,"MUSIC GR.PERF"	                    : "MUS_GRP"
        ,"MUSIC SOLO PERF."	                    : "MUS_SOLO"
        ,"MUSIC SO.PERF"	                    : "MUS_SOLO"
        ,"PEACE&CON.ST."	                    : "PEACE_CON"
        ,"PHILOSOPHY"	                        : "PHIL"
        ,"PHYSICS"	                            : "PHYS"
        ,"PSYCHOLOGY"	                        : "PSYCH"
        ,"POLITICS"	                            : "POL"
        ,"POLISH B"	                            : "PLSH_B"
        ,"REF_PROJECT"	                        : "REF_PROJ"
        ,"REF PROJECT"	                        : "REF_PROJ"
        ,"RUSSIAN B"	                        : "RUS_B"
        ,"SOC.CUL.ANTH."                        : "SOC_CUL_ANTH"
        ,"SPANISH AB."	                        : "SPAN_AB"
        ,"SPANISH AB"	                        : "SPAN_AB"
        ,"SPANISH A"                            : "SPANISH_A"
        ,"SPANISH AB INITIO."                   : "SPANISH_AB_INITIO"
        ,"SPANISH A: Lang and Literature"	    : "SPAN_A_LANG_LIT"
        ,"SPANISH A: Literature self tau"	    : "SPAN_A_LIT"
        ,"SPANISH B"	                        : "SPAN_B"
        ,"SWAHILI B"	                        : "SWAH_B"
        ,"SPANISH A: Literature"                : "SPAN_A_LIT"
        ,"SPORTS EX SCI"	                    : "SPORT_EX_SCI"
        ,"TELUGU A: Literature self taug"       : "TELU_A_LIT"
        ,"THEATRE"	                            : "THEAT"
        ,"THEORY KNOWL."	                    : "THRY_KNLDG"
        ,"THEORY OF KNOWLEDGE."                 : "THRY_KNLDG"
        ,"URDU A: Literature self taught"	    : "URD_A_LIT"
        ,"URDU A: Literature self tau"	        : "URD_A_LIT"
        ,"VISUAL ARTS"	                        : "VIS_ARTS"
        ,"VISUAL ARTS OPTION A"	                : "VIS_ARTS_A"
        ,"VISUAL ARTS OPTION B"	                : "VIS_ARTS_B"
        ,"VIETNAMESE A1"                        : "VIT_A1"
        ,"WLD. STUDIES"                         : "WS"
        ,"WLD. STUDIES CONF"	                : "WS_CONF"
        ,"WLD. STUDIES CONF PEACE AND SE"	    : "WS_CONF_PEACE_SE"
        ,"WLD. STUDIES CULTURE"	                : "WS_CUL"
        ,"WLD. STUDIES CUL LANG AND IDE"	    : "WS_CUL_LANG_ID"
        ,"WLD. STUDIES CULT LANG AND IDE"	    : "WS_CUL_LANG_ID"
        ,"WLD. STUDIES ENV/ECO SUSTAINAB"	    : "WS_ENV_ECO_SU"
        ,"WLD. STUDIES SCI TEC"	                : "WS_SCI_TECH"
        ,"WLD. STUDIES SCI TECH AND SOC"	    : "WS_SCI_TECH_SOC"
        ,"WLD. STUDIES HEALTH AND DEV"	        : "WS_HLTH_DEV"
        ,"WLD. STUDIES EQUALITY AND INEQ"       : "WS_EQU_INEQ"
        ,"WORLD RELIGIONS"	                    : "WOR_RELIG"
        ,"WORLD RELIG."	                        : "WOR_RELIG"
        ,"WORLD RELIGIONS."                     : "WORLD_RELIGIONS"
        ,"DUMMY"	: ""
        ,"ALBANIAN A: Literature" : "ALB_A_LIT"
        ,"ARABIC A: Literature" : "ARAB_A_LIT"
        ,"FRENCH A: Literature" : "FRENCH_A_LIT"
        ,"ITALIAN A" : "ITAL_A"
        ,"ITALIAN A: Lang and Literature" : "ITAL_A_LANG_LIT"
        ,"KOREAN A" : "KOR_A"
        ,"KOREAN A: Literature self taug" : "KOR_A_LIT"
        ,"POLISH A: Literature self taug" : "PLSH_A_LIT"
        ," "	: null
        ,""	    : null
        ,null	: null
    };
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function decodeAssessmentCode(subject, level,row){
        var assessmentCode = null;
        var subjectVal = decodeSubject[subject];
        var levelVal = decodeLevel[level];

        if((subjectVal === null || subjectVal === undefined)&&subject!==null){
            let rejectBaseMessage = "Test decode not found: "+subject;
            print("\n${rejectBaseMessage}\n");
            throw new Error(rejectBaseMessage);
            //print(JSON.stringify(row));
            return assessmentCode;
        }
        assessmentCode = subjectVal + levelVal;
        return assessmentCode;
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

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        try {
        scoresToMap.forEach(function(testMetadata) {
            var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, hierarchy);

            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
        });
      } catch (exception) {
         mappingObject.ERROR_MESSAGE = exception.message;
      }
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
    function mapNormalizedAdminFields(signature, hierarchy, row) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

        var birthDateObject = parseDate(row.getField("DATE_OF_BIRTH"));
        var testYear = row.getField("YEAR");
        var testDateObject = parseDate(testYear);
        var fullName = row.getField("STUDENT_NAME");

        if (testYear !== null && row.getField("MONTH") === "MAY") {
            testDateObject = parseDate("05/15/${testYear}");
        }

        if(fullName !== null &&  fullName !== undefined && fullName.indexOf(",") > -1){
            var firstName = _util.trim(fullName.split(",")[1]);
            var lastName = fullName.split(",")[0];
        }
        else if(fullName !== null &&  fullName !== undefined && fullName.indexOf(" ") > -1 ){
            var firstName = _util.trim(fullName.split(" ")[1]);
            var lastName = fullName.split(" ")[0];
        }
        else{
            var firstName = row.getField("FIRST_NAME");
            var lastName = row.getField("LAST_NAME");
        }

        //Loop through normalized fields and map if possible.
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   _util.coalesce(AssessmentLoader.config.DISTRICT_CODE, "");
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
//                case "TEST_REPORTING_DATE":
//                    record.TEST_REPORTING_DATE = testDateObject.STANDARD_DATE;
//                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(
                        row.getField("SCHOOL_ID"),row.getField("SCHOOL_LEA"),row.getField("SCHOOL"),("OOD")
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        row.getField("SCHOOL_ID"),row.getField("SCHOOL")
                    );
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_LEA"),row.getField("COUNTY_DISTRICT_CAMPUS_NUMBER"),row.getField("SCHOOL"));
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject, '05/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4)).STANDARD_DATE;
                    break;
                case "TEST_ADMIN_DATE_STR":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject, '05/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4)).STANDARD_DATE;
                    break;
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
                    record.STUDENT_GRADE_CODE = _util.coalesce(row.getField("GRADE"),null);
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE =_util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = firstName;
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"),null);
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
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
    function mapAdditionalAdminFields(row) {

        var admin = {};

        return admin;
    }



    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/

    function mapCompositeScore(row, testMetadata, hierarchy) {

        var score = {};
        var testNumber =testMetadata.TEST + "DIPL";
        var scaleScore = row.getField("TOTAL_POINTS");
        var subPoints = row.getField("EE_TOK_POINTS");
        var result = row.getField("RESULT");
        var notes = row.getField("DIPLOMA_REQUIREMENTS_CODE");
        var category = row.getField("CATEGORY");


        // Check for key fields and do not map score and exit if conditions met.
        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === undefined) ||
           (scaleScore == 0 && result !== "P")) {
            return null;
        }
        globalResult = result;

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        score["TEST_PRIMARY_RESULT_CODE"] = result;

        if(parseInt(hierarchy.SCHOOL_YEAR.toString().slice(-4))<=2016){
            // 2016 and prior
            score["TEST_PRIMARY_RESULT"] = decodeResultCodePriorMay2016[result];
        }
        else{
            // 2017 and on
            score["TEST_PRIMARY_RESULT"] = decodeResultCode[result];
        }

        score["TEST_SECONDARY_RESULT"] = subPoints;
        score["TEST_TERTIARY_RESULT"] = category;
        score["TEST_SCORE_ATTRIBUTES"] = notes;

        return score;
    }

    function mapScore(row, testMetadata, hierarchy) {
        var score = {};

        var scaleScore = row.getField("GRADE");
        var testNumber =testMetadata.TEST + decodeAssessmentCode(row.getField("SUBJECT"),row.getField("LEVEL"),row);
        var predictedGrade = row.getField("PREDICTED_GRADE");
        var rawScore = row.getField("SCALED_TOTAL_MARK_FOR_SUBJECT");
        var level = row.getField("LEVEL");
        var category = row.getField("CATEGORY");
        var result = row.getField("RESULT");

        if(testNumber === "IBPD_null"){
            print("Test must be mapped: "+row.getField("SUBJECT")+ " "+row.getField("LEVEL"))
        }

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || _util.trim(scaleScore) === "" || _util.trim(scaleScore) === undefined)  {
            return null;
        }

        score["TEST_SECONDARY_RESULT_CODE"] = globalResult;

        // Diploma Awarded / Not awarded
        if(parseInt(hierarchy.SCHOOL_YEAR.toString().slice(-4))<=2016){
            // 2016 and prior
            score["TEST_SECONDARY_RESULT"] = decodeResultCodePriorMay2016[globalResult];
        }
        else{
            // 2017 and on
            score["TEST_SECONDARY_RESULT"] = decodeResultCode[globalResult];
        }

        var diff = null;
        var gradeDecode = decodePerformanceLevel[scaleScore];
        var predictedGradeDecode = decodePerformanceLevel[predictedGrade];
        if(!isNaN(gradeDecode)&&!isNaN(predictedGradeDecode)){
            diff = gradeDecode-predictedGradeDecode;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_PRIMARY_RESULT_CODE"] = scaleScore;
        score["TEST_PRIMARY_RESULT"] = decodeGradeDescriptor[scaleScore];
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(rawScore)){
            score["TEST_RAW_SCORE"] = rawScore;
        }
        score["TEST_SCORE_TO_PREDICTED_RESULT"] = predictedGrade;
        score["TEST_TERTIARY_RESULT"] = category;
        score["TEST_GROWTH_RESULT_CODE"] = diff;

        return score;
    }

    /***************************************************************************
     Utility Functions
     ***************************************************************************/

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


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE
            + "_" + hierarchy.SCHOOL_YEAR;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }


    function parseDate(rawDate) {

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if(rawDate.indexOf("/")>-1){
            var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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
        if(rawDate.length>10){
            var formatter = new java.text.SimpleDateFormat("dd-MMM-yyyy");
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
        var formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        var javaDate = formatter.parse(rawDate+"-01-01");

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
