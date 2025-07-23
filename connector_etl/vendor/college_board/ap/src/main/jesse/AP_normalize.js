var AppNormalize = (function () {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "AP";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false; // Potentially true?  Requires further live testing.

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
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + '|' + JSON.stringify(two)));
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
                .transform("TRANSFORMATION", ["RECORDS"],
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
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found for at least one year.", JSON.stringify(row)));
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
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
  /*  module.mergeAssessment = function (file) {
        try {
            var assessmentPath = AppUtil.getAssessmentDir(file);
            var assessmentName = assessmentPath.split("/").slice(-3)[0];
            var normalFileName = assessmentPath + assessmentName + ".normal";
            var normalFile = _file.open(normalFileName);
            var fileCounter = 0;
            var normalFileArray = [];
            var prevRecord = null;

            if (normalFile.exists()) {
                normalFile.delete();
            }

            var mergeRecords = _dataflow.create("MERGING NORMAL FILES");
            var assessmentNormalSet = _file.fileset(assessmentPath, function (assessmentFile) {
                return assessmentFile.split(".").slice(-1)[0] === "normal";
            });

            assessmentNormalSet.forEach(function (f) {
                mergeRecords.input("INPUT" + ++fileCounter, _io.delim_input_ext(f.getFilePath(), "\t", "\"", "\\"));
                normalFileArray.push("INPUT" + fileCounter);
            });

            mergeRecords.merge("MERGE FILES", normalFileArray);
            mergeRecords.sort("SORT RECORDS", function (one, two) {

                if (one["ASSESSMENT_ADMIN_KEY"] > two["ASSESSMENT_ADMIN_KEY"]) {
                    return 1;
                }
                else if (one["ASSESSMENT_ADMIN_KEY"] == two["ASSESSMENT_ADMIN_KEY"] && one["TEST_SCORE_ATTRIBUTES"] > two["TEST_SCORE_ATTRIBUTES"]) {
                    return -1;
                }
                else if (one["ASSESSMENT_ADMIN_KEY"] == two["ASSESSMENT_ADMIN_KEY"] && two["TEST_SCORE_ATTRIBUTES"] > one["TEST_SCORE_ATTRIBUTES"]) {
                    return 1;
                }
                else if (one["ASSESSMENT_ADMIN_KEY"] < two["ASSESSMENT_ADMIN_KEY"]) {
                    return -1;
                }
                else {
                    return 0;
                }
            });

            mergeRecords.transform("EXTRACT DUPES", ["RECORDS"],
                function (output, json) {

                    // Copy the row and remove the lineage fields.  These fields would always cause the records from two files to be unique in cases where two files reported the same data.
                    var copyRow = AppUtil.copyObj(json);
                    copyRow.LINEAGE_SOURCE = null;
                    copyRow.LINEAGE_SIGNATURE = null;
                    copyRow.LINEAGE_FILE = null;
                    copyRow.LINEAGE_LINE = null;

                    if (JSON.stringify(copyRow) !== prevRecord) {
                        // Set the copy row to the previous record
                        prevRecord = JSON.stringify(copyRow);

                        // Forward the real row
                        output.RECORDS.put(json);
                    }
                    else if (json.LINEAGE_FILE.indexOf(file.getFilePath()) > -1) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH", json.LINEAGE_LINE, "Duplicate record in master assessment normal file.", JSON.stringify(json)));
                    }
                });

            mergeRecords.output("OUTPUT", _io.delim_output(normalFileName, "\t", "\"", "\\", false));
            mergeRecords.execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

            return normalFileName;
        } catch (exception) {
            throw "${_thisModuleName}.mergeAssessment Exception: ${exception}";
        }

    };
    */
    module.mergeAssessment = function(file) {
            return AppDataflow.mergeAssessment(file);
        };



    /***************************************************************************
        Assessment-specific Objects
    ***************************************************************************/



    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var irregularityCodeValues = {
        "1": { DECODE: "Score not yet available - student will be contacted by 8/1" },
        "2": { DECODE: "Score delayed - will be reported as soon as possible" },
        "3": { DECODE: "Score delayed - will be reported as soon as possible" },
        "4": { DECODE: "Score canceled - student’s choice per options received" },
        "5": { DECODE: "Score delayed - will be reported as soon as possible" },
        "6": { DECODE: "Score delayed - will be reported as soon as possible" },
        "7": { DECODE: "Pending student response to options provided" },
        "8": { DECODE: "Score delayed - will be reported as soon as possible" },
        "9": { DECODE: "Score delayed - will be reported as soon as possible" },
        "10": { DECODE: "Score delayed - will be reported as soon as possible" },
        "11": { DECODE: "School reports certified disability" },
        "12": { DECODE: "Score delayed - will be reported as soon as possible" },
        "13": { DECODE: "Score delayed - will be reported as soon as possible" },
        "14": { DECODE: "Score delayed - will be reported as soon as possible" },
        "15": { DECODE: "Score not available" },
        "16": { DECODE: "No score available: Makeup exam was requested but not taken" },
        "17": { DECODE: "Score Cancelled: Makeup exam was requested but not taken" },
        "18": { DECODE: "Score delayed - will be reported as soon as possible" },
        "19": { DECODE: "Score canceled" },
        "20": { DECODE: "School reported undertiming of 5 minutes or less" },
        "34": { DECODE: "School reported distraction during exam" },
        "37": { DECODE: "Portion of exam lost - score projected from remainder" },
        "38": { DECODE: "Media not scorable - score projected from remainder" },
        "39": { DECODE: "School started exam late" },
        "40": { DECODE: "School reported undertiming of more than 5 minutes" },
        "42": { DECODE: "Portion unscorable - score projected from remainder" },
        "44": { DECODE: "Score projected from multiple-choice section" },
        "51": { DECODE: "Score projected from free-response section" },
        "57": { DECODE: "Score projected from multiple-choice and free-resp. sections" },
        "66": { DECODE: "School reported overtiming of more than 5 minutes" },
        "79": { DECODE: "Score projected from 80% of exam" },
        "80": { DECODE: "Score delayed - will be reported as soon as possible" },
        "81": { DECODE: "Score delayed - will be reported as soon as possible" },
        "82": { DECODE: "Score delayed - will be reported as soon as possible" },
        "83": { DECODE: "Score delayed - will be reported as soon as possible" },
        "84": { DECODE: "Score delayed - will be reported as soon as possible" },
        "85": { DECODE: "Score delayed - will be reported as soon as possible" },
        "86": { DECODE: "Score delayed - will be reported as soon as possible" },
        "87": { DECODE: "Score canceled due to missing portion of exam" },
        "88": { DECODE: "Score delayed - will be reported as soon as possible" },
        "89": { DECODE: "Score delayed - will be reported as soon as possible" },
        "90": { DECODE: "Score delayed - will be reported as soon as possible" },
        "91": { DECODE: "One or more performance tasks not scored" },
        "92": { DECODE: "Score canceled" },
        "93": { DECODE: "Score delayed - will be reported as soon as possible" },
        "94": { DECODE: "Score canceled at student's request" },
        "95": { DECODE: "Second exam canceled - was not authorized" },
        "96": { DECODE: "Score not yet available" },
        "97": { DECODE: "Score delayed - will be reported as soon as possible" },
        "98": { DECODE: "Score withheld on college report at student's request" }
    }

    var educationLevelDecodes = {
        "3": { DECODE: "<9" } //Less than 9th Grade
        , "4": { DECODE: "09" } //9th Grade
        , "5": { DECODE: "10" } //10th Grade
        , "6": { DECODE: "11" } //11th Grade
        , "7": { DECODE: "12" } //12th Grade
        , "8": { DECODE: "NA" } //No longer in high school
        , "11": { DECODE: "UNK" } //Unknown
    };

    var primaryResultDecodes = {
        "5": { DECODE: "Extremely Well Qualified", PASSED_IND: "Yes" }
        , "4": { DECODE: "Well Qualified", PASSED_IND: "Yes" }
        , "3": { DECODE: "Qualified", PASSED_IND: "Yes" }
        , "2": { DECODE: "Possibly Qualified", PASSED_IND: "No" }
        , "1": { DECODE: "No Recommendation", PASSED_IND: "No" }
    };

    var decodeSubject = {
        "Biology": { DECODE: "BIOL"}
       ,"Calculus AB": {DECODE: "CALCAB"}
       ,"Calculus BC": {DECODE: "CALCBC"}
       ,"Chemistry": {DECODE: "CHEM"}
       ,"Computer Science AB": {DECODE: "COMSCB"}
       ,"English Language and Composition": {DECODE: "ENGLAN"}
       ,"English Literature and Composition": {DECODE: "ENGLIT"}
       ,"Government & Politics: United States": {DECODE: "GOV_POLI_US"}
       ,"PHYSICS 1:  ALGEBRA BASED": {DECODE: "PHYS1"}
       ,"PHYSICS 2:  ALGEBRA BASED": {DECODE: "PHYS2"}
       ,"Statistics": {DECODE: "STAT"}
       ,"United States History": {DECODE: "USHIST"}
       ,"World History": {DECODE: "WDHIST"}
       ,"Studio Art-2-D Design" : {DECODE: "STUDART2DDES"}
       ,"Studio Art-3-D Design" : {DECODE: "STUDART3DDES"}
       ,"Human Geography" : {DECODE: "HUMANGEOG"}
       ,"Art History" : {DECODE: "ARTHIST"}
       ,"Biology" : {DECODE: "HUMANGEOG"}
       ,"Chinese Language & BIO" :{DECODE: "CHINLANBIO"}
       ,"Computer Science A" : {DECODE: "COMPSCIA"}
       ,"European History" : {DECODE: "EUROHIS"}
       ,"Environmental Science" : {DECODE: "ENVISCI"}
       ,"French Language" : {DECODE: "FRENLANG"}
       ,"Latin" : {DECODE: "LANG"}
       ,"Macroeconomics" : {DECODE: "MACROECO"}
       ,"Microeconomics" : {DECODE: "MICROECO"}
       ,"Music Theory" : {DECODE: "MUSITHEO"}
       ,"Physics C - Electricity & Magnetism" : {DECODE: "PHYSCELECT"}
       ,"Physics C - Mechanics" : {DECODE: "PHYSCMECH"}
       ,"Psychology" : {DECODE: "PHYSIO"}
       ,"SEMINAR (CAPSTONE)" : {DECODE: "SEMICAPST"}
       ,"RESEARCH (CAPSTONE)" : {DECODE: "RESERCAPST"}
       ,"Spanish Language" : {DECODE: "SPANLANG"}
       ,"Spanish Literature" : {DECODE: "SPANLIT"}
       ,"Studio Art-Drawing" : {DECODE: "STUDIOARTDRAW"}

    };



    /***********************************************************************************
        Assessment-specific decode functions
    ***********************************************************************************/

    function decodeGradeCode(gradeCode) {
        if (gradeCode == null) {
            return null;
        }
        var lkpGradeObj = gradeLookup[gradeCode];
        if (lkpGradeObj == undefined || lkpGradeObj == null) {
            return null;
        }
        return lkpGradeObj;
    }

    function decodeRaceCode(raceCode) {
        if (raceCode === undefined || raceCode === null) {
            return null;
        }
        var lkpRaceObj = raceLookup[raceCode];
        if (lkpRaceObj == undefined || lkpRaceObj == null) {
            return null;
        }
        return lkpRaceObj.GRADE_CODE;
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

        //Only expect a single row.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        //Map all scores and sort by year.
        var scoresByYear = sortScoresByYear(signature, hierarchy, row);

        //Create normalized admin for each school year.
        for (var adminYear in scoresByYear) {
            AppUtil.nullSafePush(normalizedRecords, mapNormalizedRecord(signature, hierarchy, row, adminYear, scoresByYear[adminYear]));
        }


        return normalizedRecords;

    }


    function sortScoresByYear(signature, hierarchy, row) {

        var scoresByYear = {};

        //Loop through 30 potential buckets
        for (var i = 1; i < 31; i++) {

            var columnSuffix = String(i);

            //Pad single digits
            while (columnSuffix.length < 2) {
                columnSuffix = "0" + columnSuffix;
            }

            var adminYear = row.getField("ADMIN_YEAR_" + columnSuffix);

            //Exit on first null adminYear, there should be no data in buckets afterwards
            if (_util.trim(_util.coalesce(adminYear, "")) === "") {
                break;
            }

            // Create year bucket if it doesn't exist.
            if (scoresByYear[adminYear] === undefined) {
                scoresByYear[adminYear] = [];
            }

            //Add score mapping to year array.
            AppUtil.nullSafePush(scoresByYear[adminYear], mapScore(signature, row, columnSuffix, hierarchy));
        }

        return scoresByYear;

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
    function mapNormalizedRecord(signature, hierarchy, row, adminYear, scores) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = scores;
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, adminYear);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row, adminYear);

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
    function mapNormalizedAdminFields(signature, hierarchy, row, adminYear) {

        // Map standard normalized assessment fields.
        var record = AppUtil.mapNormalizedAssessmentFields(signature, hierarchy, row);

        var testDateStr = "0501" + ("0" + adminYear).slice(-2);
        var birthDateStr = _util.coalesce(row.getField("DATE_OF_BIRTH"), "");
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };

        try {
            if (birthDateStr.length === 5 || birthDateStr.length === 6) {
                birthDateStr = (("000000" + birthDateStr).slice(-6));
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MMddyy");

            } else if (birthDateStr.length >= 8 && birthDateStr.length <= 10) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateStr, "MM/dd/yyyy");
            } else {
                birthDateObject;
            }
        } catch (exception) {
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing test date string: ${exception}", JSON.stringify(row.getSourceRow())));
        }

        var testDateObject = AppUtil.getEmptyDateObj(testDateStr);

        //Dates in file are MMDDYY format prior to alternate 2020 header
        try {
            //var header = hierarchy.SOURCE_FILE.getFileHeader();
            
            if (JSON.stringify(row).toUpperCase().indexOf("IRREGULARITY CODE .1 01")>-1) {//For headers with dots date is different
                testDateObject = AppUtil.getDateObjByPattern(testDateStr, "ddMMyy");
            } else {
                testDateObject = AppUtil.getDateObjByPattern(testDateStr, "MMddyy");
            }

        } catch (exception) {
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing test date string: ${exception}", JSON.stringify(row.getSourceRow())));
        }

        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, adminYear) + "_" + hierarchy.SCHOOL_YEAR;
        //record.SCHOOL_YEAR = getPARTICIPATION_YEAR(adminYear);  //Use the school year of the file to help improve matches.  Student admin information should be current to the school year of the file.
        record.SCHOOL_LOCAL_ID = row.getField("SCHOOL_VENDOR_ID");
        record.SCHOOL_STATE_ID = row.getField("SCHOOL_VENDOR_ID");
        record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;

        record.STUDENT_GRADE_CODE = educationLevelDecodes[_util.trim(row.getField("EDUCATION_LEVEL"))] === undefined ? null : educationLevelDecodes[_util.trim(row.getField("EDUCATION_LEVEL"))].DECODE;
        record.STUDENT_LOCAL_ID = row.getField("STUDENT_VENDOR_ID");
        record.STUDENT_STATE_ID = row.getField("STUDENT_VENDOR_ID");
        record.STUDENT_STREET_ADDRESS = _util.trim(_util.trim(_util.coalesce(row.getField("STUDENT_ADDRESS_LINE_1"), "")) + " " + _util.trim(_util.coalesce(row.getField("STUDENT_ADDRESS_LINE_2"), "")));
        record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("STUDENT_GENDER_CODE"), "").substring(0,1);
        //Birthdate fields
        if (row.getField("DATE_OF_BIRTH") === null || row.getField("DATE_OF_BIRTH") === "") {
           // record.STUDENT_DOB = null;
            record.STUDENT_DOB_MONTH = null;
            record.STUDENT_DOB_DAY = null;
            record.STUDENT_DOB_YEAR = null;
        } else {
           // record.STUDENT_DOB = _util.coalesce(birthDateObject.STANDARD_DATE, null);
            record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
            record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
            record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
        }

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
    function mapAdditionalAdminFields(row, adminYear) {

        var admin = {};

        return admin;
    }



    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function mapScore(signature, row, columnSuffix, hierarchy) {
        var mapping = {};
        var examTitle = row.getField("EXAM_TITLE");
        var testNumber;

        if (_util.trim(row.getField("EXAM_CODE_" + columnSuffix)) !== null && _util.trim(row.getField("EXAM_CODE_" + columnSuffix)) !== "" && _util.trim(row.getField("EXAM_CODE_" + columnSuffix)) !== "" && _util.trim(row.getField("EXAM_CODE_" + columnSuffix)) !== undefined) {
            testNumber = "APEXAM_" + ("0" + row.getField("EXAM_CODE_" + columnSuffix)).slice(-2);
        } else if (_util.trim(row.getField("LDOE_EXAM_CODE_" + columnSuffix)) !== null && _util.trim(row.getField("LDOE_EXAM_CODE_" + columnSuffix)) !== "" && _util.trim(row.getField("LDOE_EXAM_CODE_" + columnSuffix)) !== "" && _util.trim(row.getField("LDOE_EXAM_CODE_" + columnSuffix)) !== undefined) {
            testNumber = "APEXAM_" + (row.getField("LDOE_EXAM_CODE_" + columnSuffix));
        } else {
              testNumber = "APEXAM_" + decodeSubject[_util.trim(row.getField("EXAM_TITLE"))].DECODE;
        }

        var score = _util.coalesce(row.getField("EXAM_GRADE_" + columnSuffix),row.getField("SCORE"));
        var irregularityCodeOne = row.getField("IRREGULARITY_CODE_#1_" + columnSuffix);
        var irregularityCodeTwo = row.getField("IRREGULARITY_CODE_#2_" + columnSuffix);



        var testRptDateStr = row.getField("DATE_OF_THIS_REPORT");
        // Used for sorting normalized file in module.mergeAssessment

            if(testRptDateStr !== null && testRptDateStr !== "" && testRptDateStr !== undefined){
                if(testRptDateStr.length === 10){
                    testRptDateStr = testRptDateStr;
                }
                else{
                    testRptDateStr = ("000000" + row.getField("DATE_OF_THIS_REPORT")).slice(-6);
                     var testRptDateObject = AppUtil.getEmptyDateObj(testRptDateStr);
                }
            }
            else {
                testRptDateStr = "";
                var testRptDateObject = null;
            }




        try {
            if (testRptDateStr === null || testRptDateStr === "" || testRptDateStr === undefined) {
                testRptDateStr = null;
            }
            else if (signature.getFormat().getFormatName() === "AP_STUDENT_DATAFILE_FORMAT_DELIM" || signature.getFormat().getFormatName() === "AP_STUDENT_DATAFILE_FORMAT_DELIM_ALT_HEADER"){
                if(testRptDateStr !== undefined && testRptDateStr !== null) {
                    if(testRptDateStr.length === 10){
                        testRptDateObject = AppUtil.getDateObjByPattern(testRptDateStr, "MM/dd/yyyy");
                    }
                    else if(testRptDateStr.length === 5) {
                        if(testRptDateStr.length === 5) {
                            testRptDateStr = '0'+testRptDateStr;
                        }
                        testRptDateObject = AppUtil.getDateObjByPattern(testRptDateStr, "MMddyy");
                    }
                    else {
                        if(hierarchy.SCHOOL_YEAR==="2016-2017"||hierarchy.SCHOOL_YEAR==="2018-2019"){
                            if(hierarchy.SCHOOL_YEAR==="2018-2019" && signature.getFormat().getFormatName() === "AP_STUDENT_DATAFILE_FORMAT_DELIM_ALT_HEADER"){
                                testRptDateObject = AppUtil.getDateObjByPattern(testRptDateStr, "ddMMyy");
                            }
                            else{
                                testRptDateObject = AppUtil.getDateObjByPattern(testRptDateStr, "ddMMyy");
                            }
                        }
                        else{
                            testRptDateObject = AppUtil.getDateObjByPattern(testRptDateStr, "MMddyy");
                        }
                    }
                }
            }
            else if( signature.getFormat().getFormatName() === "AP_22_23_190_COLS"){
                testRptDateObject = AppUtil.getMonthFollowedByDay(testRptDateStr);
            }
            else {
               testRptDateObject = AppUtil.getDateObjByPattern(testRptDateStr, "MMddyy");
            }
        } catch (exception) {
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", row.getRawField("LINEAGE_LINE"), "Error parsing report date string: ${exception}", JSON.stringify(row.getSourceRow())));
        }

        if (testRptDateObject !== undefined && testRptDateObject !== null) {
            mapping["TEST_SCORE_ATTRIBUTES"] = testRptDateObject.STANDARD_DATE;
        }

        // Check for key fields and do not map score and exit if conditions met.
        if (_util.trim(score) === null
            || _util.trim(testNumber) === ""
            || _util.trim(score) === ""
            || _util.trim(score) === undefined) {
            return null;

        }



        mapping["TEST_NUMBER"] = testNumber;
        mapping["TEST_SCORE_VALUE"] = score;
        mapping["TEST_SCORE_TEXT"] = score;
        mapping["TEST_PRIMARY_RESULT_CODE"] = score;
        mapping["TEST_PRIMARY_RESULT"] = primaryResultDecodes[score] === undefined ? "@UNK" : primaryResultDecodes[score].DECODE;
        mapping["TEST_PASSED_INDICATOR"] = primaryResultDecodes[score] === undefined ? "@UNK" : primaryResultDecodes[score].PASSED_IND;

        if (irregularityCodeOne) {
            mapping["TEST_SECONDARY_RESULT_CODE"] = irregularityCodeOne;
            mapping["TEST_SECONDARY_RESULT"] = irregularityCodeValues[irregularityCodeOne] === undefined ? "@UNK" : irregularityCodeValues[irregularityCodeOne].DECODE;
        }
        if (irregularityCodeTwo) {
            mapping["TEST_TERTIARY_RESULT_CODE"] = irregularityCodeTwo;
            mapping["TEST_TERTIARY_RESULT"] = irregularityCodeValues[irregularityCodeTwo] === undefined ? "@UNK" : irregularityCodeValues[irregularityCodeTwo].DECODE;
        }


        return mapping;
    }



    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {

            // Note: Admin year isn't required for sorting. Should be left blank.
            var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, "");
            var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, "");

            if (assessmentAdminKey_one === assessmentAdminKey_two) {
                return 1;
            } else {
                return -1;
            }

        } catch (exception) {
            throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
        }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, adminYear) {

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_VENDOR_ID"), "")
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_FIRST_NAME"), "").toUpperCase()
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_MIDDLE_NAME"), "").toUpperCase()
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_LAST_NAME"), "").toUpperCase()
            + "_" + _util.coalesce(adminYear, "")

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        return assessmentAdminKey;

    }


    function getPARTICIPATION_YEAR(adminYear) {

        if (adminYear == undefined || adminYear == null) {
            return null;
        }


        var year = parseInt(adminYear, 10);
        var schoolYear;

        if (year < 10) {
            year = "200" + year;
        }
        else if (year < 25) {
            year = "20" + year;
        }
        else if (year < 100) {
            year = "19" + year;
        }
        else if (year < 1000) {
            year = "1" + year;
        }

        return String(year - 1) + "-" + String(year);
    }



    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());
