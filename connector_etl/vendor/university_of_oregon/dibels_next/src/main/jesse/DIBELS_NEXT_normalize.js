var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "DIBELS Next";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

    /**
     * This function will convert the source file given into the normalized assessment format.
     *`
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
        try {

            var signatureFormatName = signature.getFormat().getFormatName();
            print("Loading using signature file ${signatureFormatName}");

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

    var strandsAndFields =
        [
            // DIBELS V6 STRANDS

            // DIBELS NEXT STRANDS
            {TEST: "DIBNXT", STRAND: "FSF"    , FIELD: "FSF"},
            {TEST: "DIBNXT", STRAND: "ISF"    , FIELD: "ISF"},
            {TEST: "DIBNXT", STRAND: "LNF"    , FIELD: "LNF"},
            {TEST: "DIBNXT", STRAND: "PSF"    , FIELD: "PSF"},
            {TEST: "DIBNXT", STRAND: "NWFCLS" , FIELD: "NWF-CLS"},
            {TEST: "DIBNXT", STRAND: "NWFWWR" , FIELD: "NWF-WWR"},
            {TEST: "DIBNXT", STRAND: "DORFWC" , FIELD: "DORF-WORDSCORRECT"},
            {TEST: "DIBNXT", STRAND: "DORFERR", FIELD: "DORF-ERRORS"},
            {TEST: "DIBNXT", STRAND: "DORFACC", FIELD: "DORF-ACCURACY"},
            {TEST: "DIBNXT", STRAND: "DORFRT" , FIELD: "DORF-RETELL"},
            {TEST: "DIBNXT", STRAND: "DORFRQ" , FIELD: "DORF-RETELLQUALITY"},
            {TEST: "DIBNXT", STRAND: "DAZECOR", FIELD: "DAZE-CORRECT"},
            {TEST: "DIBNXT", STRAND: "DAZEINC", FIELD: "DAZE-INCORRECT"},
            {TEST: "DIBNXT", STRAND: "DAZEADJ", FIELD: "DAZE-ADJUSTED"},
            {TEST: "DIBNXT", STRAND: "TOT"    , FIELD: "COMPOSITE"},
            {TEST: "DIBNXT", STRAND: "NWF"    , FIELD: "NWF"},
            {TEST: "DIBNXT", STRAND: "NWFWRC"    , FIELD: "NWF-WRC"},
            {TEST: "DIBNXT", STRAND: "WRF"    , FIELD: "WRF"},
            {TEST: "DIBNXT", STRAND: "WUF"    , FIELD: "WUF"},
            {TEST: "DIBNXT", STRAND: "ORF"    , FIELD: "ORF"},
            {TEST: "DIBNXT", STRAND: "ORFWC"    , FIELD: "ORF-WORDSCORRECT"},
            {TEST: "DIBNXT", STRAND: "ORFERR"    , FIELD: "ORF-ERRORS"},
            {TEST: "DIBNXT", STRAND: "ORFACC"    , FIELD: "ORF-ACCURACY"},
            {TEST: "DIBNXT", STRAND: "ORFRT"    , FIELD: "ORF-RETELL"},
            {TEST: "DIBNXT", STRAND: "MAZE"    , FIELD: "MAZE"},
            {TEST: "DIBNXT", STRAND: "MAZEC"    , FIELD: "MAZE-CORRECT"},
            {TEST: "DIBNXT", STRAND: "MAZEINC"    , FIELD: "MAZE-INCORRECT"},
            {TEST: "DIBNXT", STRAND: "MAZEADJ"    , FIELD: "MAZE-ADJUSTED"}
        ];


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/
    var gradeLevels =
        [
            {GRADE_CODE: "KG", FIELD: "K"},
            {GRADE_CODE: "01", FIELD: "1ST"},
            {GRADE_CODE: "02", FIELD: "2ND"},
            {GRADE_CODE: "03", FIELD: "3RD"},
            {GRADE_CODE: "04", FIELD: "4TH"},
            {GRADE_CODE: "05", FIELD: "5TH"},
            {GRADE_CODE: "06", FIELD: "6TH"},
            {GRADE_CODE: "07", FIELD: "7TH"},
            {GRADE_CODE: "08", FIELD: "8TH"}
        ];

    var assessPeriods =
        [
            {PERIOD_CODE: "BEG", FIELD: "BEGINNING"},
            {PERIOD_CODE: "MID", FIELD: "MIDDLE"},
            {PERIOD_CODE: "END", FIELD: "END"}
        ];

    var perfLevels =
        {
            "Intensive Support": {
                TEST_PRIMARY_RESULT_CODE: "IS",
                TEST_PRIMARY_RESULT: "Intensive Support",
                TEST_SECONDARY_RESULT_CODE: "WB",
                TEST_SECONDARY_RESULT: "Well Below Benchmark"
            },
            "Strategic Support": {
                TEST_PRIMARY_RESULT_CODE: "SS",
                TEST_PRIMARY_RESULT: "Strategic Support",
                TEST_SECONDARY_RESULT_CODE: "BB",
                TEST_SECONDARY_RESULT: "Below Benchmark"
            },
            "Core Support": {
                TEST_PRIMARY_RESULT_CODE: "CS",
                TEST_PRIMARY_RESULT: "Core Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "At Or Above Benchmark"
            },
            "--": {
                TEST_PRIMARY_RESULT_CODE: "--",
                TEST_PRIMARY_RESULT: "--",
                TEST_SECONDARY_RESULT_CODE: "--",
                TEST_SECONDARY_RESULT: "--"
            },
            "Well Below Benchmark": {
                TEST_PRIMARY_RESULT_CODE: "IS",
                TEST_PRIMARY_RESULT: "Intensive Support",
                TEST_SECONDARY_RESULT_CODE: "WB",
                TEST_SECONDARY_RESULT: "Well Below Benchmark"
            },
            "Below Benchmark": {
                TEST_PRIMARY_RESULT_CODE: "SS",
                TEST_PRIMARY_RESULT: "Strategic Support",
                TEST_SECONDARY_RESULT_CODE: "BB",
                TEST_SECONDARY_RESULT: "Below Benchmark"
            },
            "At or Above Benchmark": {
                TEST_PRIMARY_RESULT_CODE: "CS",
                TEST_PRIMARY_RESULT: "Core Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "At Or Above Benchmark"
            }
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
        var year = "";
        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);
        if (signature.getFormat().getFormatName().indexOf('PMON') > -1) {
            record = mapSingleNormalizedRecordForPmonScores(signature, hierarchy, row);
            AppUtil.nullSafePush(normalizedRecords, record);
        } else {
        gradeLevels.forEach(function(gradeLevel) {
            if (row.getField("YEAR_${gradeLevel.FIELD}") !== null && row.getField("YEAR_${gradeLevel.FIELD}") !== "") {
                year = row.getField("YEAR_${gradeLevel.FIELD}");
                assessPeriods.forEach(function(assessPeriod) {
                    var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year);
                    AppUtil.nullSafePush(normalizedRecords, record);
                })
            }
            //Acadience
            else if(row.getField("YEAR") !== null && row.getField("YEAR") !== ""){
                year = row.getField("YEAR");
                assessPeriods.forEach(function(assessPeriod) {
                    var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year);
                    AppUtil.nullSafePush(normalizedRecords, record);
                })
            }
        });
    }
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
    function mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, assessPeriod, year) {
        var record = {};
        var mappingObject = {};
        var perfValues = ["Intensive Support", "Strategic Support", "Core Support", "Well Below Benchmark", "Below Benchmark", "At or Above Benchmark"];

        // nashorn doesn't have includes :(
        function inArray(theArray, val) {
            for (var i = 0; i < theArray.length; i++) {
                if (theArray[i] === val) { return true;}
            }
            return false;
        }

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];
        record = mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year);
        strandsAndFields.forEach(function(strandsAndField) {
           // print("${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}\n");
            if(row.getField("${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}") !== null && row.getField("${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}") !== "") {
                var assessmentCode = "${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}";
                var score = row.getField("${assessmentCode}");
                var lexileValue =  _util.coalesce(row.getField("LEXILE_${assessmentCode}"), "--");
                var performanceCode = _util.coalesce(row.getField("NEED_FOR_SUPPORT_${assessmentCode}"),row.getField("BNCH_STATUS_${assessmentCode}"), "--");
                var districtPercentile = row.getField("DISTRICT_PERCENTILE_${assessmentCode}");
                var schoolPercentile = row.getField("SCHOOL_PERCENTILE_${assessmentCode}");
                if ((((isNaN(districtPercentile) && districtPercentile))||((isNaN(schoolPercentile) && schoolPercentile))) > 1000)
                {
                    percentile = null;
                }
                else{
                    percentile = _util.coalesce(districtPercentile, schoolPercentile);
                    percentile = parseInt(percentile);
                }

                if(score!==null && !isNaN(score) && inArray(perfValues, performanceCode)){
                    mappingObject.SCORE_MAPPINGS.push(
                        {
                            "TEST_NUMBER" : "${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}",
                            "TEST_SCORE_VALUE" : score,
                            "TEST_SCORE_TEXT" : score,
                            "TEST_PERCENTILE_SCORE":parseInt(percentile) ,
                            "TEST_PRIMARY_RESULT_CODE" : perfLevels[performanceCode].TEST_PRIMARY_RESULT_CODE,
                            "TEST_PRIMARY_RESULT" : perfLevels[performanceCode].TEST_PRIMARY_RESULT,
                            "TEST_SECONDARY_RESULT_CODE" : perfLevels[performanceCode].TEST_SECONDARY_RESULT_CODE,
                            "TEST_SECONDARY_RESULT" : perfLevels[performanceCode].TEST_SECONDARY_RESULT,
                            "TEST_READING_LEVEL": lexileValue
                        }
                    );
                }
                else if(score!==null && !isNaN(score)){
                    mappingObject.SCORE_MAPPINGS.push(
                        {
                            "TEST_NUMBER" : "${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}",
                            "TEST_SCORE_VALUE" : score,
                            "TEST_SCORE_TEXT" : score,
                            "TEST_PERCENTILE_SCORE": percentile,
                            "TEST_READING_LEVEL": lexileValue
                        }
                    );
                }
            }
        });
        if(row.getField("MEASURE")!==null && row.getField("MEASURE")!==undefined && assessPeriod.FIELD === "END"){//if field exists and is unique to these files
            //LNF_K_BEGINNING need to match this info to match to a TEST_NUMBER = DIBNXTKGENDLNF
           // Measure ex LNF
           //Grade from Grade Level if exists or from signature name (files we have are KG)
           //BEG/MID/END from Month (our files look like END)
           var score = row.getField("SCORE");
           var testVal = row.getField("MEASURE");
           var gradeVal = "KG";//TODO change to from sig
           var periodVal = "END"//TODO change to base from Month
           if(score!==null && !isNaN(score)){//TODO and periodVal matches assessPeriod
                mappingObject.SCORE_MAPPINGS.push(
                    {
                        //"TEST_NUMBER" : "${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}",
                        "TEST_NUMBER" : testVal+gradeVal+periodVal,
                        "TEST_SCORE_VALUE" : score,
                        "TEST_SCORE_TEXT" : score
                    }
                );
            }
        }

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
    }

    function mapSingleNormalizedRecordForPmonScores(signature, hierarchy, row) {
        var record = {};
        var mappingObject = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];
        var year = row.getField("YEAR_k");
        var gradeLevel = {GRADE_CODE: "KG", FIELD: "K"};
        var assessPeriod = { PERIOD_CODE: "PMON", FIELD: "PMON" };
        record = mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year);
        var score = row.getField("SCORE");
        var testVal = row.getField("MEASURE");

        if(score!==null && !isNaN(score)){
            mappingObject.SCORE_MAPPINGS.push(
                    {
                        //"TEST_NUMBER" : "${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}",
                        "TEST_NUMBER" : "DIBNXT"+gradeLevel.GRADE_CODE+assessPeriod.PERIOD_CODE+testVal,//DIBNXTKGPMONFSF
                        "TEST_SCORE_VALUE" : score,
                        "TEST_SCORE_TEXT" : score
                    }
                );
            }
        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

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
    function mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, assessPeriod, year) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");
        var testDateObject = parseTestDate(row.getField("ASSESSMENT_DATES"));
        var schoolInfo = row.getField("SCHOOL_${gradeLevel.FIELD}");
        if(undefined ===row.getField("SCHOOL_${gradeLevel.FIELD}")||null ===row.getField("SCHOOL_${gradeLevel.FIELD}")){
            var schoolName = row.getField("SCHOOL_NAME");
            var schoolCode = null;
        }
        else{
            var schoolName = schoolInfo.substring(0, schoolInfo.lastIndexOf(" "));
            var schoolCode = schoolInfo.substr(schoolInfo.lastIndexOf(" ") + 1);
        }
        var tad = _util.coalesce(testDateObject.STANDARD_DATE, getTEST_ADMIN_DATE_STR(assessPeriod, year));
        //Loop through normalized fields and map if possible.
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, gradeLevel, assessPeriod, tad);
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
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(assessPeriod);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, getTEST_ADMIN_DATE_STR(assessPeriod, year));
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
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_LOCAL_ID"),row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("STUDENT_ID");
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("STUDENT_ID");
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
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = _util.coalesce(row.getField("STUDENT_ADDRESS"));
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = _util.coalesce(row.getField("STUDENT_STATE"));
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = _util.coalesce(row.getField("STUDENT_ZIP_CODE"));
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeLevel.GRADE_CODE;
                    break;
                case "TEST_LOCATION":
                    record.TEST_LOCATION = _util.coalesce(row.getField("TEST_LOCATION"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = schoolName;
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_UID_K"),schoolCode);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_UID_K"),schoolCode);
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
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {
        var admin = {};

        return admin;
    }

    function getTEST_ADMIN_PERIOD(assessPeriod) {

        var period = null;

        switch (assessPeriod.FIELD) {
            case "BEGINNING":
                period = "Beginning";
                break;

            case "MIDDLE":
                period = "Middle";
                break;
            case "END":
                period = "End";
                break;
            case "PMON":
                period = "Pmon";
                break;
        }

        return period;
    }


    function getTEST_ADMIN_DATE_STR(assessPeriod, year) {
        var date = null;
        //return "01/01/1900";
        switch (assessPeriod.FIELD) {

            case "BEGINNING":
                date = "10/15/${year}";
                break;
            case "MIDDLE":
                year = parseInt(year) + 1;
                date = "01/15/${year}";
                break;
            case  "END":
                year = parseInt(year) + 1;
                date = "04/15/${year}";
            break;
            case "PMON":
                year = parseInt(year) + 1;
                date = "04/15/${year}";
            break;
}
        return date;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two, gradeLevel, assessPeriod) {
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

    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, gradeLevel, assessPeriod, tad) {

        var assessmentAdminKey = null;
        //print(assessPeriod.FIELD);
        // Set base assessment admin key information
        if(assessPeriod===undefined){
             assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${tad}";
        }
        else{
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${assessPeriod.FIELD}_${tad}";
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        return assessmentAdminKey;

    }

    function parseTestDate(rawDate) {

        var dateObj = {
            RAW_DATE: rawDate
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        // Exit if no value is provided.
        if (_util.trim(_util.coalesce(rawDate, "")) === "") {
            return dateObj;
        }

        if ((rawDate.length === 8))
        {
            var formatter = new java.text.SimpleDateFormat("yyyyMMdd");
        }
        else {
            var formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
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