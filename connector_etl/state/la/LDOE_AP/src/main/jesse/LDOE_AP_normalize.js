var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LDOE_AP";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false; // Potentially true?  Requires further live testing.

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
                .group_by("ADMINISTRATION GROUPING" , function(one, two){

                    try {
                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
                    } catch(exception) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + '|' + JSON.stringify(two)));
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
                .transform("TRANSFORMATION", ["RECORDS"],
                    function(output, rows) {
                        try{

                            var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

                            normalizedRecords.forEach(function(record){
                                output.RECORDS.put(record);
                            });

                        } catch(exception) {
                            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
                        }


                    })
                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
                    try {
                        var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                        // Report when no scores are found.
                        if(mappingObject.SCORE_MAPPINGS.length === 0){
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
                        }//TODO determine if a sort by the assessment period or customer pref or to use first or last seen version.
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
                                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",json.LINEAGE_LINE, "Duplicate record in master assessment normal file.", JSON.stringify(json)));
                            }
                        });

                    mergeRecords.output("OUTPUT", _io.delim_output(normalFileName, "\t", "\"", "\\", false));
                    mergeRecords.execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

                    return normalFileName;
                } catch(exception) {
                    throw "${_thisModuleName}.mergeAssessment Exception: ${exception}";
                }

    };



    /***************************************************************************
        Assessment-specific Objects
    ***************************************************************************/
    var scoresToMap = [
        {TEST: "APEXAM_", CODE:"13", FIELD: "ARTHIS", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"14", FIELD: "ARTSTD", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"15", FIELD: "ARTST2", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"16", FIELD: "ART3D", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"20", FIELD: "BIOL", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"66", FIELD: "CALCAB", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"68", FIELD: "CALCBC", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"25", FIELD: "CHEM", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"28", FIELD: "CHINES", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"31", FIELD: "COMSCA", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"58", FIELD: "GOVCOM", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"57", FIELD: "GOVUS", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"53", FIELD: "HUMGEO", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"35", FIELD: "ECONMA", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"34", FIELD: "ECONMI", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"36", FIELD: "ENGLAN", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"37", FIELD: "ENGLIT", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"40", FIELD: "ENVSCI", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"43", FIELD: "EURHIS", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"48", FIELD: "FRNLAN", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"55", FIELD: "GERLA", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"62", FIELD: "ITAL", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"64", FIELD: "JAPAN", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"60", FIELD: "LATINV", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"78", FIELD: "PHYSB", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"80", FIELD: "PHYSM", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"82", FIELD: "PHYSEM", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"85", FIELD: "PSYCH", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"87", FIELD: "SPANLA", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"89", FIELD: "SPANLT", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"90", FIELD: "STAT", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"07", FIELD: "USHIST", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"93", FIELD: "WDHIST", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"83", FIELD: "PHYS1", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"84", FIELD: "PHYS2", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"22", FIELD: "CPSTNS", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"CPSTNR", FIELD: "CPSTNR", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"32", FIELD: "COMSCP", MAP_FUNCTION: mapScore}
        //new in 16-17 file
        ,{TEST: "APEXAM_", CODE:"COMSCB", FIELD: "COMSCB", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"51", FIELD: "FRENLT", MAP_FUNCTION: mapScore}
        ,{TEST: "APEXAM_", CODE:"LATINC", FIELD: "LATINC", MAP_FUNCTION: mapScore}
    ];


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/


    var educationLevelDecodes = {
        "3" : {DECODE: "<9"} //Less than 9th Grade
        ,"4" : {DECODE: "09"} //9th Grade
        ,"5" : {DECODE: "10"} //10th Grade
        ,"6" : {DECODE: "11"} //11th Grade
        ,"7" : {DECODE: "12"} //12th Grade
        ,"8" : {DECODE: "NA"} //No longer in high school
        ,"11" : {DECODE: "UNK"} //Unknown
    };

    var primaryResultDecodes = {
        "5" : {DECODE: "Extremely Well Qualified", PASSED_IND: "Yes"}
        ,"4" : {DECODE: "Well Qualified", PASSED_IND: "Yes"}
        ,"3" : {DECODE: "Qualified", PASSED_IND: "Yes"}
        ,"2" : {DECODE: "Possibly Qualified", PASSED_IND: "No"}
        ,"1" : {DECODE: "No Recommendation", PASSED_IND: "No"}
    };




    /***********************************************************************************
        Assessment-specific decode functions
    ***********************************************************************************/

    function decodeGradeCode(gradeCode){
    	if(gradeCode == null){
    		return null;
    	}
    	var lkpGradeObj = gradeLookup[gradeCode];
    	if(lkpGradeObj == undefined || lkpGradeObj == null){
    		return null;
    	}
    	return lkpGradeObj;
    }

    function decodeRaceCode(raceCode){
    	if(raceCode === undefined || raceCode === null ){
    		return null;
    	}
    	var lkpRaceObj = raceLookup[raceCode];
    	if(lkpRaceObj == undefined || lkpRaceObj == null){
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
    function mapNormalizedRecords(signature, hierarchy, rows){
        var normalizedRecords = [];

        //Only expect a single row.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);

        //Create normalized admin for each school year.
        AppUtil.nullSafePush(normalizedRecords, mapNormalizedRecord(signature, hierarchy, row));


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
    function mapNormalizedRecord(signature, hierarchy, row){

        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
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
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, hierarchy);

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
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */
    function mapNormalizedAdminFields(signature, hierarchy, row){


        // Map standard normalized assessment fields.
        var record = AppUtil.mapNormalizedAssessmentFields(signature, hierarchy, row);


        /*
            Map normalized fields requiring assessment-specific logic.
        */
        // Get raw date values
        var testDateStr = "0501" + ("0" + hierarchy.SCHOOL_YEAR).slice(-4);
        var birthDateStr = ("000000" + row.getField("DATE_OF_BIRTH")).slice(-6);

        //Create empty objects as default.
        var birthDateObject = {
                                RAW_DATE : null
                                , MONTH : null
                                , DAY : null
                                , YEAR : null
                                , STANDARD_DATE : null
                             };



        var testDateObject = AppUtil.getEmptyDateObj(testDateStr);

        //Dates in file are MMDDYY format
        try {
            testDateObject = AppUtil.getDateObjByPattern(testDateStr, "MMddyy");
        } catch(exception){
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING",row.getRawField("LINEAGE_LINE"), "Error parsing test date string: ${exception}", JSON.stringify(row.getSourceRow())));
        }


        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row) + "_" + hierarchy.SCHOOL_YEAR;
        record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);      // pre UIHN-9419:  was not being set at all
        record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:  was not being set at all
        record.SCHOOL_LOCAL_ID = row.getField("PREVIOUS_AI_CODE_1");
        record.SCHOOL_STATE_ID = row.getField("PREVIOUS_AI_CODE_1");
        record.TEST_ADMIN_DATE = testDateObject.STANDARD_DATE;

        record.STUDENT_GRADE_CODE = educationLevelDecodes[_util.trim(row.getField("EDUCATION_LEVEL"))] === undefined ? null : educationLevelDecodes[_util.trim(row.getField("EDUCATION_LEVEL"))].DECODE;
        record.STUDENT_LOCAL_ID = row.getField("STUDENT_VENDOR_ID");
        record.STUDENT_STATE_ID = row.getField("STUDENT_VENDOR_ID");
        record.STUDENT_STREET_ADDRESS = _util.trim(_util.trim(_util.coalesce(row.getField("STUDENT_ADDRESS_LINE_1"), "")) + " " + _util.trim(_util.coalesce(row.getField("STUDENT_ADDRESS_LINE_2"), "")));

        //Birthdate fields
        //record.STUDENT_DOB = null;
        record.STUDENT_DOB_MONTH = null;
        record.STUDENT_DOB_DAY = null;
        record.STUDENT_DOB_YEAR = null;


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
    function mapAdditionalAdminFields(row){

        var admin = {};

        return admin;
    }



    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/

    function mapScore(row, testMetadata, hierarchy) {
    	var mapping = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
    	var score = row.getField(testMetadata.FIELD+"GR");

        // Used for sorting normalized file in module.mergeAssessment
    	var testRptDateStr = row.getField("DATE_OF_THIS_REPORT");
    	var testRptDateObject = AppUtil.getEmptyDateObj(testRptDateStr);

        // Dates in file are MMDDYY format
        try {
            testRptDateObject = AppUtil.getDateObjByPattern(testRptDateStr, "MM/dd/yyyy");
        } catch(exception){
            AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING",row.getRawField("LINEAGE_LINE"), "Error parsing reporting date string: ${exception}", JSON.stringify(row.getSourceRow())));
        }

        mapping["TEST_SCORE_ATTRIBUTES"] = testRptDateObject.STANDARD_DATE;

        // Check for key fields and do not map score and exit if conditions met.
    	if(_util.trim(score) === null || _util.trim(testNumber) === "" || _util.trim(score) === "" || _util.trim(score) === undefined) {

    		return null;
    	}

    	mapping["TEST_NUMBER"] = testNumber;
        mapping["TEST_SCORE_VALUE"] = score;
        mapping["TEST_SCORE_TEXT"] = score;
        mapping["TEST_PRIMARY_RESULT_CODE"] = score;
        mapping["TEST_PRIMARY_RESULT"] = primaryResultDecodes[score] === undefined ? "@UNK" : primaryResultDecodes[score].DECODE;
        mapping["TEST_PASSED_INDICATOR"] = primaryResultDecodes[score] === undefined ? "@UNK" : primaryResultDecodes[score].PASSED_IND;

    	return mapping;
    }



    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two){

        try {

           // Note: Admin year isn't required for sorting. Should be left blank.
           var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, "");
           var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, "");

           if(assessmentAdminKey_one === assessmentAdminKey_two){
               return 1;
           } else {
               return -1;
           }

       } catch (exception) {
           throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
       }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord){

        var assessmentAdminKey = null;

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_VENDOR_ID"), "")
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_FIRST_NAME"), "").toUpperCase()
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_MIDDLE_NAME"), "").toUpperCase()
            + "_" + _util.coalesce(srcRecord.getField("STUDENT_LAST_NAME"), "").toUpperCase()

        return assessmentAdminKey;

    }



    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());
