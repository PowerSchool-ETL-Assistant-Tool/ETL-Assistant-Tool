var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "WA_KIDS";
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
            print("Loading using signature file ${signatureFormatName}\n");
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
                .execute();

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
        {TEST: "WAKIDS", CODE:"", FIELD: "1A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "1B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "1C", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "1C1", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "1C2", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "1C3", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "1C4", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "2A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "2B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "2C", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "2D", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "3A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "3B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "4", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "4A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "4B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "4C", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "5", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "5A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "5B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "5C", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "6", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "6A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "6B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "6C", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "7A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "7B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "8A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "8B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "9A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "9B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "9C", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "9D", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "10A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "10B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "S8A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "S8B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "S9A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "S9B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "S9C", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "S9D", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "S10A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "S10B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "11A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "11B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "11C", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "11D", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "11E", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "12A", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "12B", MAP_FUNCTION: mapObjectiveScore}
       ,{TEST: "WAKIDS", CODE:"", FIELD: "13", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "14A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "14B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "15A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "15B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "15C", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "15D", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "16A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "16B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "17A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "17B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "18A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "18B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "18C", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "18D", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "18E", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "19A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "19B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "19C", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S15A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S15B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S15C", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S15D", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S16A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S16B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S17A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S17B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S18A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S18B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S18C", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S18D", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S18E", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S19A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S19B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "S19C", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "20A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "20B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "20C", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "20D", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "20E", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "20F", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "21A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "21B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "22A", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "22B", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "22C", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "23", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "24", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "25", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "26", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "27", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "28", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "29", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "30", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "31", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "32", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "33", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "34", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "35", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "36", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "37", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"", FIELD: "38", MAP_FUNCTION: mapObjectiveScore}
        ,{TEST: "WAKIDS", CODE:"SOCEM", FIELD: "SOCIALEMOTIONAL", MAP_FUNCTION: mapAreaScore}
        ,{TEST: "WAKIDS", CODE:"PHYS", FIELD: "PHYSICAL", MAP_FUNCTION: mapAreaScore}
        ,{TEST: "WAKIDS", CODE:"LANG", FIELD: "LANGUAGE", MAP_FUNCTION: mapAreaScore}
        ,{TEST: "WAKIDS", CODE:"COG", FIELD: "COGNITIVE", MAP_FUNCTION: mapAreaScore}
        ,{TEST: "WAKIDS", CODE:"LIT", FIELD: "LITERACY", MAP_FUNCTION: mapAreaScore}
        ,{TEST: "WAKIDS", CODE:"MATH", FIELD: "MATH", MAP_FUNCTION: mapAreaScore}
        ,{TEST: "WAKIDS", CODE:"SPN", FIELD: "SPANISHLANGUAGE", MAP_FUNCTION: mapAreaScore}
        ,{TEST: "WAKIDS", CODE:"SPNLIT", FIELD: "SPANISHLITERACY", MAP_FUNCTION: mapAreaScore}
        ,{TEST: "WAKIDS", CODE:"TOT", FIELD: "TOT", MAP_FUNCTION: mapOverallScore}

    ];


    var ageDecodeColors = {
        "1 to 2 years (Orange)": "Orange",
        "2 to 3 years (Yellow)": "Yellow",
        "Birth to 1 year (Red)": "Red",
        "Kindergarten (Purple)": "Purple",
        "Pre-K 4 class/grade (Blue)": "Blue",
        "Preschool 3 class/grade (Green)": "Green"
    };
    var ageDecodeGrade = {
        "1 to 2 years (Orange)": "PK",
        "2 to 3 years (Yellow)": "PK",
        "Birth to 1 year (Red)": "PK",
        "Kindergarten (Purple)": "KG",
        "Pre-K 4 class/grade (Blue)": "PK",
        "Preschool 3 class/grade (Green)": "PK"
    };
    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

    /***********************************************************************************
     Assessment-specific mapping functions
     ***********************************************************************************/
    function mapOverallScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = null;
            var overallMeasure = row.getField("NUMBEROFDOMAINSREADYFORKINDERGARTEN");
            var overallLang = "";
            if(overallMeasure === null || overallMeasure === undefined || overallMeasure === ""){
                overallMeasure = row.getField("NUMBEROFENGLISHDOMAINSREADYFORKG");
                overallLang = "English";
            }
            if(overallMeasure === null || overallMeasure === undefined || overallMeasure === ""){
                overallMeasure = row.getField("NUMBEROFESPANISHDOMAINSREADYFORKG");
                overallLang = "Spanish";
            }
            testNumber = testMetadata.TEST
                        + "TOT";

            if(overallMeasure === undefined || overallMeasure === null || overallMeasure === ""|| overallMeasure === "#NULL!"){
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_PRIMARY_RESULT = overallMeasure;
            score.TEST_SCORE_TEXT = overallMeasure;
            score.TEST_SCORE_ATTRIBUTES = overallLang;

            if(!isNaN(overallMeasure)){
                score.TEST_SCALED_SCORE = overallMeasure;
                score.TEST_SCORE_VALUE = overallMeasure;
            }

            return score;

        } catch(exception) {
           throw "${_thisModuleName}.mapObjectiveScore Exception: ${exception}";
        }
    }

    function mapObjectiveScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = null;
            var objective = testMetadata.FIELD;
            var objectiveScore = row.getField("OBJ"+objective);
            testNumber = testMetadata.TEST
                        + "_OBJ_" + objective;

            if(objectiveScore === undefined || objectiveScore === null || objectiveScore === "" || objectiveScore === "#NULL!"|| objectiveScore === "*"){
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_PRIMARY_RESULT_CODE = objectiveScore;
            score.TEST_PRIMARY_RESULT = "Level " + objectiveScore;
            score.TEST_SCORE_TEXT = objectiveScore;
            if(!isNaN(objectiveScore)){
                score.TEST_SCALED_SCORE = objectiveScore;
                score.TEST_SCORE_VALUE = objectiveScore;
            }
            return score;

        } catch(exception) {
           throw "${_thisModuleName}.mapObjectiveScore Exception: ${exception}";
        }
    }

    function mapAreaScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = null;
            var scaleScore = row.getField(testMetadata.FIELD+"SCALESCORE");
            var rawScore = row.getField(testMetadata.FIELD+"RAWSCORE");
            var level = row.getField(testMetadata.FIELD+"DEVELOPMENTLEVEL");
            var flag = row.getField(testMetadata.FIELD+"READINESSFLAG");
            testNumber = testMetadata.TEST
                        + testMetadata.CODE;

            if(scaleScore === undefined || scaleScore === null || scaleScore === "" || scaleScore === "#NULL!"){
                return null;
            }

            score.TEST_NUMBER = testNumber;
            score.TEST_PRIMARY_RESULT = scaleScore;
            score.TEST_SCORE_TEXT = scaleScore;
            if(!isNaN(scaleScore)){
                score.TEST_SCALED_SCORE = scaleScore;
                score.TEST_SCORE_VALUE = scaleScore;
            }
            if(!isNaN(rawScore)){
                score.TEST_RAW_SCORE = rawScore;
            }
            score.TEST_PASSED_INDICATOR = flag;
            score.TEST_PRIMARY_RESULT = level;
            return score;
        } catch(exception) {
           throw "${_thisModuleName}.mapObjectiveScore Exception: ${exception}";
        }
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

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);

            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(rows)));
            }
        });

        // for(var goalNumber = 1;goalNumber <= 8; goalNumber++) {
        //     try {
        //         var goalScore = mapGoalScore(row, goalNumber);
        //
        //         AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, goalScore);
        //     } catch(exception) {
        //         print(exception)
        //         AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Goal mapping error: ${exception}", JSON.stringify(rows)));
        //     }
        // }
        //
        // for(var projProfNumber=1; projProfNumber<=10; projProfNumber++) {
        //     try {
        //         var projProfScore = mapProjectedProficiencyScore(row, projProfNumber);
        //
        //         AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, projProfScore);
        //     } catch(exception) {
        //         AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "Proficiency mapping error: ${exception}", JSON.stringify(rows)));
        //     }
        // }

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
    function getAdminDate(row, hierarchy) {
        var adminDate = null;
        var period = getTEST_ADMIN_PERIOD(row,hierarchy);

        if(period === 'FALL'){
            adminDate = "09/15/${hierarchy.SCHOOL_YEAR.substring(0, 4)}"
        }else if(period === 'WINTER'){
            adminDate = "01/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        }else if(period === 'SPRING'){
            adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        }
        else {
            adminDate = "05/15/${hierarchy.SCHOOL_YEAR.substring(5)}";
        }
        return adminDate;
    }

    function getTEST_ADMIN_PERIOD(row,hierarchy) {
        var fileName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        var testAdminPeriod = null;

        if(fileName.indexOf('FALL') > -1){
            testAdminPeriod = "FALL";
        }else if(fileName.indexOf('WINTER') > -1){
            testAdminPeriod = "WINTER";
        } else if(fileName.indexOf('SPRING') > -1){
            testAdminPeriod = "SPRING";
        }
        else {
            testAdminPeriod = "ALL";
        }
        return testAdminPeriod;
    }

    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTHDATE"), "MM/dd/yyyy");
        var testAdminDate = getAdminDate(row, hierarchy);
        var reportingPeriod = getTEST_ADMIN_PERIOD(row,hierarchy);
        var genderVal = row.getField("GENDER");
            if(genderVal!==null &&genderVal!==undefined &&genderVal!==""){
                genderVal = genderVal.substring(0,1);
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
                    record.REPORTING_PERIOD = _util.coalesce(reportingPeriod, hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = AppUtil.getDateObjByPattern(_util.coalesce(testAdminDate,"05/15/"+hierarchy.SCHOOL_YEAR.substring(5, 9)), "MM/dd/yyyy").STANDARD_DATE;
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
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("CHILDFNAME"), null);
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("CHILDMI"),null);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("CHILDLNAME"), null);
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("CHILDID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATESTUDENTID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("CHILDID")
                    );
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(genderVal);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = row.getField("SCHOOLCODE");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = row.getField("SCHOOLCODE");
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
       return {};
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
        var periodValue = getTEST_ADMIN_PERIOD(srcRecord,hierarchy);
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });
        if(periodValue !== null && periodValue !== undefined){
            assessmentAdminKey = assessmentAdminKey + "_" + periodValue;
        }
        return assessmentAdminKey;
    }

    return module;
}());