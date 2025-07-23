var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "BENCHMARK_ADVANCE";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;
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

    var scoresToMap =
        [
            //Scores to Process
            {TEST: "BEBA_", MAP_FUNCTION: mapScore}
            ,{TEST: "BEBA_", MAP_FUNCTION: mapTestScore}
        ];



    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/
    function getGrade(fileGrade){
        var gradeVal = 'UNK';
        var gradeString = fileGrade.toString();
        if(gradeString.indexOf("Gr._2")>-1){
            gradeVal = "02";
        }
        else if(gradeString.indexOf("Gr._3")>-1){
            gradeVal = "03";
        }
        else if(gradeString.indexOf("Gr._4")>-1){
            gradeVal = "04";
        }
        else if(gradeString.indexOf("Gr._5")>-1){
            gradeVal = "05";
        }
        return gradeVal;
    }

    function getAssessmentFlags(filePath){
        var assessVal = 'UNK';
        var fileName = filePath.toString();

        if(fileName.indexOf("Interim")>-1){
            assessVal = "INT";
        }
        else if(fileName.indexOf("Unit_1")>-1){
            assessVal = "U1";
        }
        else if(fileName.indexOf("Unit_2")>-1){
            assessVal = "U2";
        }
        else if(fileName.indexOf("Unit_3")>-1){
            assessVal = "U3";
        }
        else if(fileName.indexOf("Unit_4")>-1){
            assessVal = "U4";
        }
        else if(fileName.indexOf("Unit_5")>-1){
            assessVal = "U5";
        }
        else if(fileName.indexOf("Unit_6")>-1){
            assessVal = "U6";
        }

        if(fileName.indexOf("Assess_2")>-1){
            assessVal = assessVal+"A2";
        }
        else{
            assessVal = assessVal+"A1";
        }
        return assessVal;

    }

function getTestName (row, hierarchy){

    var testNameRaw = row.getField("TEST_NAME");
    var testName = testNameRaw
      ? testNameRaw.toUpperCase().replace(/[\s-]+/g, "_"): "";
    var finalTestName = null;

    if(testName.indexOf("UNIT_1_UNIT_ASSESSMENT") > -1){
        finalTestName = "U1_UA";
    }
    else if(testName.indexOf("UNIT_1_ASSESSMENT") > -1){
        finalTestName = "U1_A";
    } else if(testName.indexOf("UNIT_1_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U1_W1_A";
    } else if(testName.indexOf("UNIT_1_UNIT_ASSESSMENT") > -1){
         finalTestName = "U1_UA";
    } else if(testName.indexOf("UNIT_1_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U1_W2_A";
    } else if(testName.indexOf("UNIT_2_ASSESSMENT") > -1){
        finalTestName = "U2_A";
    } else if(testName.indexOf("UNIT_2_PERFORMANCE_TASK") > -1){
        finalTestName = "U2_PT";
    } else if(testName.indexOf("UNIT_2_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U2_W1_A";
    } else if(testName.indexOf("UNIT_2_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U2_W2_A";
    } else if(testName.indexOf("UNIT_3_ASSESSMENT") > -1){
        finalTestName = "U3_A";
    } else if(testName.indexOf("UNIT_3_UNIT_ASSESSMENT") > -1){
        finalTestName = "U3_UA";
    } else if(testName.indexOf("UNIT_3_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U3_W1_A";
    } else if(testName.indexOf("UNIT_3_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U3_W2_A";
    } else if(testName.indexOf("UNIT_4_ASSESSMENT") > -1){
        finalTestName = "U4_A";
    } else if(testName.indexOf("UNIT_4_UNIT_ASSESSMENT") > -1){
        finalTestName = "U4_UA";
    } else if(testName.indexOf("UNIT_4_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U4_W1_A";
    } else if(testName.indexOf("UNIT_4_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U4_W2_A";
    } else if(testName.indexOf("UNIT_5_ASSESSMENT") > -1){
        finalTestName = "U5_A";
    } else if(testName.indexOf("UNIT_5_UNIT_ASSESSMENT") > -1){
        finalTestName = "U5_UA";
    } else if(testName.indexOf("UNIT_5_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U5_W1_A";
    } else if(testName.indexOf("UNIT_5_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U5_W2_A";
    } else if(testName.indexOf("UNIT_6_UNIT_ASSESSMENT") > -1){
        finalTestName = "U6_UA";
    } else if(testName.indexOf("UNIT_6_ASSESSMENT") > -1){
        finalTestName = "U6_A";
    } else if(testName.indexOf("UNIT_6_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U6_W1_A";
    } else if(testName.indexOf("UNIT_6_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U6_W2_A";
    } else if(testName.indexOf("UNIT_7_ASSESSMENT") > -1){
        finalTestName = "U7_A";
    } else if(testName.indexOf("UNIT_7_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U7_W1_A";
    } else if(testName.indexOf("UNIT_7_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U7_W2_A";
    } else if(testName.indexOf("UNIT_8_ASSESSMENT") > -1){
        finalTestName = "U8_A";
    } else if(testName.indexOf("UNIT_8_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U8_W1_A";
    } else if(testName.indexOf("UNIT_8_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U8_W2_A";
    } else if(testName.indexOf("UNIT_9_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U9_W1_A";
    } else if(testName.indexOf("UNIT_9_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U9_W2_A";
    } else if(testName.indexOf("UNIT_10_WEEK_1_ASSESSMENT") > -1){
        finalTestName = "U10_W1_A";
    } else if(testName.indexOf("UNIT_10_WEEK_2_ASSESSMENT") > -1){
        finalTestName = "U10_W2_A";
    } else if(testName.indexOf("INTERIM_ASSESSMENT_1") > -1){
        finalTestName = "INT_A1";
    } else if(testName.indexOf("INTERIM_ASSESSMENT_2") > -1){
        finalTestName = "INT_A2";
    } else if(testName.indexOf("PRE_ASSESSMENT") > -1){
        finalTestName = "PRE_A";
    } else if(testName.indexOf("UNIDAD_1_EVALUACI?N") > -1){
         finalTestName = "U1_A";
     } else if(testName.indexOf("UNIDAD_1_SEMANA_1_EVALUACI?N") > -1){
         finalTestName = "U1_W1_A";
     } else if(testName.indexOf("UNIDAD_1_SEMANA_2_EVALUACI?N") > -1){
         finalTestName = "U1_W2_A";
     } else if(testName.indexOf("UNIDAD_2_EVALUACI?N") > -1){
         finalTestName = "U2_A";
     } else if(testName.indexOf("UNIDAD_2_SEMANA_1_EVALUACI?N") > -1){
         finalTestName = "U2_W1_A";
     } else if(testName.indexOf("UNIDAD_2_SEMANA_2_EVALUACI?N") > -1){
         finalTestName = "U2_W2_A";
     } else if(testName.indexOf("UNIDAD_3_EVALUACI?N") > -1){
         finalTestName = "U3_A";
     } else if(testName.indexOf("UNIDAD_3_SEMANA_1_EVALUACI?N") > -1){
         finalTestName = "U3_W1_A";
     } else if(testName.indexOf("UNIDAD_3_SEMANA_2_EVALUACI?N") > -1){
         finalTestName = "U3_W2_A";
     } else if(testName.indexOf("UNIDAD_4_EVALUACI?N") > -1){
         finalTestName = "U4_A";
     } else if(testName.indexOf("UNIDAD_4_SEMANA_1_EVALUACI?N") > -1){
         finalTestName = "U4_W1_A";
     } else if(testName.indexOf("UNIDAD_4_SEMANA_2_EVALUACI?N") > -1){
         finalTestName = "U4_W2_A";
     } else if(testName.indexOf("UNIDAD_5_EVALUACI?N") > -1){
         finalTestName = "U5_A";
     } else if(testName.indexOf("UNIDAD_5_SEMANA_1_EVALUACI?N") > -1){
         finalTestName = "U5_W1_A";
     } else if(testName.indexOf("UNIDAD_5_SEMANA_2_EVALUACI?N") > -1){
         finalTestName = "U5_W2_A";
     } else if(testName.indexOf("UNIDAD_6_SEMANA_1_EVALUACI?N") > -1){
         finalTestName = "U6_W1_A";
     } else if(testName.indexOf("UNIDAD_6_SEMANA_2_EVALUACI?N") > -1){
         finalTestName = "U6_W2_A";
     } else if(testName.indexOf("UNIDAD_7_EVALUACI?N") > -1){
         finalTestName = "U7_A";
     } else if(testName.indexOf("UNIDAD_7_SEMANA_1_EVALUACI?N") > -1){
         finalTestName = "U7_W1_A";
     } else if(testName.indexOf("UNIDAD_7_SEMANA_2_EVALUACI?N") > -1){
         finalTestName = "U7_W2_A";
     }
     return finalTestName;
}

    var gradeDecode = {
             "1": "01",
             "01": "01",
             "Grade 1": "01",
             "1st Grade": "01",
             "2": "02",
             "02": "02",
             "Grade 2": "02",
             "2nd Grade": "02",
             "3": "03",
             "03": "03",
             "Grade 3": "03",
             "3rd Grade": "03",
             "4": "04",
             "04": "04",
             "Grade 4": "04",
             "4th Grade": "04",
             "5": "05",
             "05": "05",
             "Grade 5": "05",
             "5th Grade": "05",
             "6": "06",
             "06": "06",
             "Grade 6": "06",
             "6th Grade": "06",
             "7": "07",
             "07": "07",
             "Grade 7": "07",
             "7th Grade": "07",
             "8": "08",
             "08": "08",
             "Grade 8": "08",
             "8th Grade": "08",
             "9": "09",
             "09": "09",
             "Grade 9": "09",
             "9th Grade": "09",
             "10": "10",
             "Grade 10": "10",
             "10th Grade": "10",
             "10th":"10",
             "11": "11",
             "Grade 11": "11",
             "11th Grade": "11",
             "11th":"11",
             "12": "12",
             "Grade 12": "12",
             "12th Grade": "12",
             "12th":"12",
             "H.S. Graduate":"12",
             "16+":"16",
             "KG": "KG",
             "KN": "KG",
             "K": "KG",
             "Kindergarten": "KG"
             , "": null
             , null: null
         };
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
        scoresToMap.forEach(function(testMetadata) {
            var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, getGrade(row.getRawField("LINEAGE_FILE")));

            AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
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
    function mapNormalizedAdminFields(signature, hierarchy, row) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var schoolYear = hierarchy.SCHOOL_YEAR;
        var birthDateObject = {
                                  RAW_DATE : null
                                  , MONTH : null
                                  , DAY : null
                                  , YEAR : null
                                  , STANDARD_DATE : null
                              };
        var testDateObject = {
                                 RAW_DATE : null
                                 , MONTH : null
                                 , DAY : null
                                 , YEAR : null
                                 , STANDARD_DATE : "01/01/"+schoolYear.substring(5)
                             };
         var adminDate = parseDate(row)

        var fullName = row.getField("STUDENT_NAMES");
        var firstName = null;
        var lastName = null;
        if(fullName !== null && fullName !== undefined && fullName.indexOf && fullName.indexOf(",") > -1){
            firstName = _util.trim(fullName.split(",")[1]);
            lastName = fullName.split(",")[0];
        }else if(fullName !== null && fullName !== undefined && fullName.indexOf && fullName.indexOf(" ") > -1){
            firstName = _util.trim(fullName.split(" ")[1]);
            lastName = fullName.split(" ")[0];
        }

        //Loop through normalized fields and map if possible.
        normalizedFileFields.forEach(function (field) {
        try{
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
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;  // pre UIHN-9419:   _util.coalesce(AssessmentLoader.config.DISTRICT_CODE, "");;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "TEST_REPORTING_DATE":
                    record.TEST_REPORTING_DATE = testDateObject.STANDARD_DATE;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"), "DIST");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(
                        "DIST"
                    );
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(adminDate.STANDARD_DATE, testDateObject.STANDARD_DATE);
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
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField("STUDENT_GRADE")], getGrade(row.getRawField("LINEAGE_FILE")));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(firstName, row.getField("STUDENT_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = lastName;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("SIS_ID"), row.getField("STUDENT_SIS_ID"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("SIS_ID"), row.getField("STUDENT_SIS_ID"));
                    break;
                default:
                    record[field] = row.getField(field);
                    break
            }
            }catch(e){
            print("The error is " + e + "\n");
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


    function mapScore(row, testMetadata,grade) {

        var score = {};
        var raw = row.getField("RAW");
        var percent = row.getField("PERCENT");

        var testNumber =testMetadata.TEST + "STRAND_GR_"+grade+"_"+getAssessmentFlags(row.getRawField("LINEAGE_FILE"));

        // Check for key fields and do not map score and exit if conditions met.
        if((_util.trim(percent) === "" || _util.trim(percent) === null || _util.trim(percent) === undefined)&&
            (_util.trim(raw) === "" || _util.trim(raw) === null || _util.trim(raw) === undefined)
        ) {
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = percent;
        if(!isNaN(raw)){
            score["TEST_RAW_SCORE"] = raw;
        }
        if(!isNaN(percent)){
            score["TEST_SCORE_VALUE"] = percent;
        }
        return score;
    }

    function mapTestScore(row, testMetadata, hierarchy){

        var score = {};
        var studentGrade = gradeDecode[row.getField("STUDENT_GRADE")];
        var pointsEarned = row.getField("POINTS_EARNED");
        var totalPoints = row.getField("TOTAL_POINTS");
        var testScorePercent = row.getField("TEST_SCORE_PERCENTAGE");

        var testNumber = testMetadata.TEST + "GR_" + studentGrade + "_" + getTestName(row, hierarchy);

        if((_util.trim(pointsEarned) === "" || _util.trim(pointsEarned) === null || _util.trim(pointsEarned) === undefined)&&
                (_util.trim(totalPoints) === "" || _util.trim(totalPoints) === null || _util.trim(totalPoints) === undefined)
            ) {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;

            score["TEST_ITEMS_POSSIBLE"] = totalPoints;
            score["TEST_ITEMS_ATTEMPTED"] = pointsEarned;
            score["TEST_PERCENTAGE_SCORE"] = testScorePercent;

        return score;
    }


        function parseDate(row) {
        try{
            var rawDate = row.getField("TEST_ADMIN_DATE");

            var dateObj = {
                RAW_DATE: null,
                MONTH: null,
                DAY: null,
                YEAR: null,
                STANDARD_DATE: null
            };

            rawDate = rawDate ? rawDate.trim() : "";
            if (rawDate === "") {
                return dateObj;
            }

            var parsedDate;
            if (rawDate.indexOf("/") !== -1 && rawDate.match(/^\d{1,2}\/\d{1,2}\/\d{4}$/)) {
                // MM/DD/YYYY (allows single or double digit month/day)
                var parts = rawDate.split("/");
                var month = parseInt(parts[0], 10);
                var day = parseInt(parts[1], 10);
                var year = parseInt(parts[2], 10);
                parsedDate = new Date(year, month - 1, day);
            } else if (rawDate.indexOf("-") !== -1 && rawDate.match(/^\d{4}-\d{2}-\d{2}$/)) {
                // YYYY-MM-DD
                var parts = rawDate.split("-");
                var year = parseInt(parts[0], 10);
                var month = parseInt(parts[1], 10);
                var day = parseInt(parts[2], 10);
                parsedDate = new Date(year, month - 1, day);
            } else if (rawDate.indexOf("-") !== -1 && rawDate.match(/^\d{2}-\d{2}-\d{4}$/)) {
                // DD-MM-YYYY
                var parts = rawDate.split("-");
                var day = parseInt(parts[0], 10);
                var month = parseInt(parts[1], 10);
                var year = parseInt(parts[2], 10);
                parsedDate = new Date(year, month - 1, day);
            } else {
                return dateObj;
            }

            if (isNaN(parsedDate.getTime())) {
                return dateObj;
            }

            var month = (parsedDate.getMonth() + 1).toString();
            var day = parsedDate.getDate().toString();
            var year = parsedDate.getFullYear();

            if (month.length === 1) {
                month = "0" + month;
            }
            if (day.length === 1) {
                day = "0" + day;
            }

            var standardDate = month + "/" + day + "/" + year;

            dateObj.MONTH = month;
            dateObj.DAY = day;
            dateObj.YEAR = year;
            dateObj.STANDARD_DATE = standardDate;

            return dateObj;
            }catch(e){
            print ("The error in date function" + e + "\n");
            }
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

        var gradeStudent = gradeDecode[srcRecord.getField("STUDENT_GRADE")];

        // Set base assessment admin key information
        assessmentAdminKey = _assessmentIdentifier
            + "_" + _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)
            + "_" + AssessmentLoader.config.DISTRICT_CODE;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        if (signature.format.formatName === "BENCHMARK_24_COLS") {
            assessmentAdminKey = assessmentAdminKey + "_" + gradeStudent;
        }else{
        assessmentAdminKey = assessmentAdminKey + "_" + getGrade(srcRecord.getRawField("LINEAGE_FILE"));
        assessmentAdminKey = assessmentAdminKey + "_" + getAssessmentFlags(srcRecord.getRawField("LINEAGE_FILE"));
        }

        return assessmentAdminKey;

    }

    /*******************************************
     End of module.  Return module object.
     *******************************************/
    return module;
}());
