var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LA_DIBELS";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v0.1";
    var multipleRowsPerGroupingExpected = false;

/** Java classes **/
    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
    const BufferedReader = Java.type("java.io.BufferedReader");
    const InputStreamReader = Java.type('java.io.InputStreamReader');
    const CSVWriter = Java.type("com.opencsv.CSVWriter");
    const FileWriter = Java.type("java.io.FileWriter");
    const File = Java.type("java.io.File");

    const SignatureFormatType = {
        DELIMITED: 'class com.versifit.fileDetector.recordFormat.DelimitedRecordFormat',
        FIXED_LENGTH: 'class com.versifit.fileDetector.recordFormat.FixedWidthRecordFormat'
    };

    /**
     * This function will convert the source file given into the normalized assessment format.
     *`
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
        try {
            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const records = getRecords(file, signature);

            print("\nLoading using signature file ${signature.getFormat().getFormatName()}\n");

            let normalizedFile = AppUtil.createResultsFile(file);

            print("\nNormalized file: ${normalizedFile}");

            let normalizedRows = [], normalizedRecords = [];

            records.forEach((record) => {
                try {
                    // Removing white spaces
                    if (typeof record === 'object') {
                        for (let key in record) {
                            if (typeof record[key] === 'string') {
                                record[key] = _util.trim(record[key]);
                            }
                        }
                    }

                    mapNormalizedRecords(signature, hierarchy, [record])
                        .forEach((normalizedRecord) => {
                            normalizedRows.push(normalizedRecord);
                        });
                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH",
                        record.LINEAGE_LINE,
                        "mapNormalizedRecords error: ${exception}",
                        JSON.stringify(record)
                    ));
                }
            });

            normalizedRows.forEach((row) => {
                try {
                    const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
                    if (mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            file.getFilePath(),
                            "WARNING",
                            row.LINEAGE_LINE,
                            "No scores found.",
                            JSON.stringify(row)
                        ));
                    }  else if(row.STUDENT_LOCAL_ID === '#N/A'){
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                            file.getFilePath(),
                            "WARNING",
                            row.LINEAGE_LINE,
                            "No scores found or StudentID #N/A",
                            JSON.stringify(row)
                        ));
                    } else {
                        normalizedRecords.push(row);
                    }

                } catch (exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(
                        hierarchy.SOURCE_FILE.getFilePath(),
                        "HIGH",
                        _util.coalesce(row.LINEAGE_LINE, -1),
                        "SCORE COUNT CHECK dataflow error: ${exception}",
                        JSON.stringify(row)
                    ));
                }
            });

            writeNormalizedRecords(normalizedFile, normalizedRecords);

//            var signatureFormatName = signature.getFormat().getFormatName();
//            print("Loading using signature file ${signatureFormatName}");
//            var normalizedFile = AppUtil.createResultsFile(file);
//            var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
//            var lineNumber = 0;            const fileFullName = file.getFullName();
//
//            //Process data file records.
//            _dataflow.create("RECORD BUILD")
//                .input("INPUT", AppUtil.getInputDataflow(file, signature))
//                .transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
//
// json.LINEAGE_FILE = fileFullName;
//                    json.LINEAGE_LINE = (++lineNumber).toString();
//                    output.RECORDS.put(json);
//                })
//                .group_by("ADMINISTRATION GROUPING" , function(one, two) {
//                    try {
//                        var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
//                        var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
//
//                        return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
//                    } catch(exception) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
//                    }
//                })
//				.transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
//					try{
//						if(!multipleRowsPerGroupingExpected && rows.length > 1){
//
//							//Report error for each row
//							rows.forEach(function(row){
//								AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
//							});
//
//						} else {
//							output.RECORDS.put(rows);
//						}
//					} catch(exception) {
//						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
//					}
//				})
//                .transform("TRANSFORM", ["RECORDS"],
//                    function(output, rows) {
//                        var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);
//
//                        normalizedRecords.forEach(function(record) {
//                            output.RECORDS.put(record);
//                        });
//
//                    })
//                .transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
//                    var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
//
//                    // Report when no scores are found.
//                    if(mappingObject.SCORE_MAPPINGS.length === 0) {
//                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "HIGH",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
//                    } else {
//                        output.RECORDS.put(row);
//                    }
//                })
//                .output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
//                .execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

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
            // DIBELS 8th STRANDS
            {TEST: "LA_DIBELS", STRAND: "TOT"    , FIELD: "COMPOSITE", SHORT:"COMPOSITE"},
            {TEST: "LA_DIBELS", STRAND: "LNF"    , FIELD: "LNF", SHORT:"LNF"},
            {TEST: "LA_DIBELS", STRAND: "PSF"    , FIELD: "PSF", SHORT:"PSF"},
            {TEST: "LA_DIBELS", STRAND: "WRF"    , FIELD: "WRF", SHORT:"WRF"}, //new
            {TEST: "LA_DIBELS", STRAND: "NWFCLS" , FIELD: "NWF-CLS", SHORT:"NWF"},
            {TEST: "LA_DIBELS", STRAND: "MAZERD" , FIELD: "MAZE_RD", SHORT:"MAZE"},
            {TEST: "LA_DIBELS", STRAND: "MAZECR" , FIELD: "MAZE_CR", SHORT:"MAZE"},
            {TEST: "LA_DIBELS", STRAND: "MAZEICR" , FIELD: "MAZE_ICR", SHORT:"MAZE"},
            {TEST: "LA_DIBELS", STRAND: "VOCABULARY" , FIELD: "VOCABULARY", SHORT:"VOCABULARY"},
            {TEST: "LA_DIBELS", STRAND: "SPELLING" , FIELD: "SPELLING", SHORT:"SPELLING"},
            {TEST: "LA_DIBELS", STRAND: "RAN" , FIELD: "RAN", SHORT:"RAN"},
            {TEST: "LA_DIBELS", STRAND: "RISKIND" , FIELD: "RISK_INDICATOR", SHORT:"RISK_INDICATOR"},
            {TEST: "LA_DIBELS", STRAND: "NWFWRC" , FIELD: "NWF-WRC", SHORT:"NWF"}, //new
            {TEST: "LA_DIBELS", STRAND: "ORFWC" , FIELD: "ORF-WORDSCORRECT", SHORT:"ORF"}, //renamed from DORF
            {TEST: "LA_DIBELS", STRAND: "ORFERR", FIELD: "ORF-ERRORS", SHORT:"ORF"}, //renamed from DORF
            {TEST: "LA_DIBELS", STRAND: "ORFACC", FIELD: "ORF-ACCURACY", SHORT:"ORF"}, //renamed from DORF
            {TEST: "LA_DIBELS", STRAND: "MAZECOR", FIELD: "MAZE-CORRECT", SHORT:"MAZE"}, //renamed from DAZE
            {TEST: "LA_DIBELS", STRAND: "MAZEINC", FIELD: "MAZE-INCORRECT", SHORT:"MAZE"}, //renamed from DAZE
            {TEST: "LA_DIBELS", STRAND: "MAZEADJ", FIELD: "MAZE-ADJUSTED", SHORT:"MAZE"}, //renamed from DAZE
            {TEST: "LA_DIBELS", STRAND: "GRGOAL", FIELD: "GROWTH_GOAL", SHORT:"GROWTH_GOAL"}, //renamed from DAZE
            {TEST: "LA_DIBELS", STRAND: "ORFFLU", FIELD: "ORF-FLUENCY", SHORT:"ORF"}
        ];


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var gradeLevels =
        [
            {GRADE_CODE: "08", FIELD: "8TH"}//This should be fully removed
        ];

    var gradeDecode = {
        "1": "01",
        "01": "01",
        "Grade 1": "01",
        "2": "02",
        "02": "02",
        "Grade 2": "02",
        "3": "03",
        "03": "03",
        "Grade 3": "03",
        "4": "04",
        "04": "04",
        "Grade 4": "04",
        "5": "05",
        "05": "05",
        "Grade 5": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "9": "09",
        "09": "09",
        "Grade 9": "09",
        "10": "10",
        "Grade 10": "10",
        "11": "11",
        "Grade 11": "11",
        "12": "12",
        "Grade 12": "12",
        "KG": "KG",
        "KN": "KG",
        "K": "KG",
        "Kindergarten": "KG"
       ,"" : null
       ,null : null
    };
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
            "Core^ Support": {
                TEST_PRIMARY_RESULT_CODE: "C^S",
                TEST_PRIMARY_RESULT: "Core^ Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "At Or Above Benchmark"
            },
            "--": {
                TEST_PRIMARY_RESULT_CODE: "--",
                TEST_PRIMARY_RESULT: "--",
                TEST_SECONDARY_RESULT_CODE: "--",
                TEST_SECONDARY_RESULT: "--"
            }
        };

    var benchmarkLevels =
        {
      "Well Below Benchmark" : "WB",
      "Below Benchmark" : "BB",
      "At Benchmark" : "ATB",
      "Above Benchmark" : "AB",
      "Well Above Average" : "WAA",
      "Well Below Average" : "WBA",
      "Above Average" : "AA",
      "Below Average" : "BA",
      "Average" : "A",
      "Tested Out" : "TO",
      "" : null,
      "--" : "--",
      null : null,
      undefined : null
    };
    var assessPeriods =
    [
        {PERIOD_CODE: "BEG", FIELD: "BEGINNING"},
        {PERIOD_CODE: "MID", FIELD: "MIDDLE"},
        {PERIOD_CODE: "END", FIELD: "END"}
    ];

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


        gradeLevels.forEach(function(gradeLevel) {
           // if(gradeLevel.GRADE_CODE == _util.coalesce(row.getField("ASSESSMENT_GRADE"), row.getField("GRADE"))){//TODO
                if (row.getField("YEAR_${gradeLevel.FIELD}") !== null && row.getField("YEAR_${gradeLevel.FIELD}") !== "") {

                     year = row.getField("YEAR_${gradeLevel.FIELD}");
                     assessPeriods.forEach(function(assessPeriod) {
                        var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year, assessPeriod);
                        AppUtil.nullSafePush(normalizedRecords, record);
                    })
                }
                else if (row.getField("YEAR") !== null && row.getField("YEAR") !==""){
                print()
                   year = row.getField("YEAR");
                   if(signature.getFormat().getFormatName() !== "LA_DIBELS_COL_106"){

                        for(var i=0; i<assessPeriods.length; i++){
                           var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year,assessPeriods[i],i);
                           AppUtil.nullSafePush(normalizedRecords, record);
                        }
                   }

                   else {
                           var myAssessPeriod = null;
                           var myAssessPeriodIndex = null; //TODO this needs to be set to the index (0,1,2) of the appropriate period slot ex. Beginning is likely 0 (if issues, 1)                   var assessPeriodDecode = //TODO this needs to be set to an object {} like the following:
                           var myAssessPeriodDecode =
                           [
                                {PERIOD_CODE: "BEG", FIELD: "BEGINNING",INDEX: 0, FILE_PERIOD = "BOY"},
                                {PERIOD_CODE: "MID", FIELD: "MIDDLE", INDEX: 1, FILE_PERIOD = "MOY"},
                                {PERIOD_CODE: "END", FIELD: "END", INDEX: 2, FILE_PERIOD = "EOY"}
                            ];
                            for(var i=0; i<myAssessPeriodDecode.length; i++){//Loop thru OBY MOY EOY to find a hit
                                if(myAssessPeriodDecode[i].FILE_PERIOD == row.getField("BENCHMARK_PERIOD")){
                                    //print(myAssessPeriodDecode[i].PERIOD_CODE+ "||||||"+ row.getField("BENCHMARK_PERIOD")+ "\n");
                                    myAssessPeriod = myAssessPeriodDecode[i];
                                    myAssessPeriodIndex = i;
                                }
                            }
                            if(myAssessPeriod !== null){
                           //EX if your file's row is Beginning, myAssesPeriod must be {PERIOD_CODE: "BEG", FIELD: "BEGINNING"}
                           // If known from the Index, can call assessPeriods[#] to return this object
                               //print("myAssesPeriodIndex" + myAssessPeriod.PERIOD_CODE + " | " + myAssessPeriod.FIELD + "\n");
                               var record = mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year,myAssessPeriod,myAssessPeriodIndex);
                               AppUtil.nullSafePush(normalizedRecords, record);
                           }
                    }
                }
            //}

        });

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
    function mapSingleNormalizedRecord(signature, hierarchy, row, gradeLevel, year, assessPeriod,assessPeriodIndex) {
        var record = {};
        var mappingObject = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];
        //var assessPeriod = getAssesssPeriod(row);
        var syncDate = row.getField("SYNC_DATE");
       // var enrollmentDate = row.getField("TESTDATE");
        var testDate = null;
        if(row.getField("TESTDATE")!==null && row.getField("TESTDATE")!==undefined){
          testDate = AppUtil.getMonthFollowedByDay(row.getField("TESTDATE")).STANDARD_DATE;
        }

        record = mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, year, assessPeriod,assessPeriodIndex);

        strandsAndFields.forEach(function(strandsAndField) {
            if(row.getField("${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}") !== null && row.getField("${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}") !== "") {

                var assessmentCode = "${strandsAndField.FIELD}_${gradeLevel.FIELD}_${assessPeriod.FIELD}";
                var score = row.getField("${assessmentCode}");
                var performanceCode = _util.coalesce(row.getField("BENCHMARK_STATUS_${assessmentCode}"), "--");
                var dateField = _util.coalesce(row.getField("DATE_${assessmentCode}"), "--");
                try{

                mappingObject.SCORE_MAPPINGS.push(
                    {
                        "TEST_NUMBER" : "${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}",
                        "TEST_SCORE_VALUE" : score,
                        "TEST_SCORE_TEXT" : score,
                        "TEST_PERCENTILE_SCORE": isNaN(row.getField("DISTRICT_PERCENTILE_${assessmentCode}")) ? null : row.getField("DISTRICT_PERCENTILE_${assessmentCode}"),
                        "TEST_PRIMARY_RESULT_CODE" : perfLevels[performanceCode].TEST_PRIMARY_RESULT_CODE,
                        "TEST_PRIMARY_RESULT" : perfLevels[performanceCode].TEST_PRIMARY_RESULT,
                        "TEST_SECONDARY_RESULT_CODE" : perfLevels[performanceCode].TEST_SECONDARY_RESULT_CODE,
                        "TEST_SECONDARY_RESULT" : perfLevels[performanceCode].TEST_SECONDARY_RESULT,
                        "TEST_TERTIARY_RESULT_CODE" : isNaN(row.getField("NATIONAL_DDS_PERCENTILE_${assessmentCode}")) ? null : row.getField("NATIONAL_DDS_PERCENTILE_${assessmentCode}"),
                        "TEST_SCORE_ATTRIBUTES" : dateField,
                        "TEST_TERTIARY_RESULT" : syncDate,
                        "TEST_QUATERNARY_RESULT" : testDate,

                    }
                );
                }
                catch(exception){
                    print(exception);
                }
            }

            else if (row.getField("${strandsAndField.FIELD}") !== null && row.getField("${strandsAndField.FIELD}") !== ""){

                var assessmentCode = "${strandsAndField.FIELD}";
                var score = row.getField("${assessmentCode}");
                var performanceCode = _util.coalesce(row.getField("BENCHMARK_STATUS_${assessmentCode}"), "--");
                var dateField = _util.coalesce(row.getField("DATE_${assessmentCode}"), "--");
                //var testNumber = generateTestNumber(signature, hierarchy, row, gradeLevel, year, assessPeriod, assessPeriodIndex);
                try{
                mappingObject.SCORE_MAPPINGS.push(
                    {
                        "TEST_NUMBER" : "${strandsAndField.TEST}${strandsAndField.STRAND}" + "${assessPeriodIndex}",
                        "TEST_SCORE_VALUE" : score,
                        "TEST_SCORE_TEXT" : score,
                        "TEST_PERCENTILE_SCORE": isNaN(row.getField("DISTRICT_PERCENTILE_${assessmentCode}")) ? null : row.getField("DISTRICT_PERCENTILE_${assessmentCode}"),
                        "TEST_PRIMARY_RESULT_CODE" : perfLevels[performanceCode].TEST_PRIMARY_RESULT_CODE,
                        "TEST_PRIMARY_RESULT" : perfLevels[performanceCode].TEST_PRIMARY_RESULT,
                        "TEST_SECONDARY_RESULT_CODE" : perfLevels[performanceCode].TEST_SECONDARY_RESULT_CODE,
                        "TEST_SECONDARY_RESULT" : perfLevels[performanceCode].TEST_SECONDARY_RESULT,
                        "TEST_TERTIARY_RESULT_CODE" : isNaN(row.getField("NATIONAL_DDS_PERCENTILE_${assessmentCode}")) ? null : row.getField("NATIONAL_DDS_PERCENTILE_${assessmentCode}"),
                        "TEST_SCORE_ATTRIBUTES" : dateField,
                        "TEST_TERTIARY_RESULT" : syncDate,
                        "TEST_QUATERNARY_RESULT" : testDate,
                    }
                );
                }
                catch(exception){
                    print(exception);
                }
             }


            //Special end check for growth goal records
            //LA_DIBELS##ENDGRGOAL test number format
            //Outcome is currently unknown value so is disabled
                var goalSigName = signature.getFormat().getFormatName();
                if(strandsAndField.FIELD == "GROWTH_GOAL" && goalSigName.toString().indexOf("FULL")>-1 && goalSigName.toString().indexOf("DIBELS_8TH")>-1){
                    var score = row.getField("${strandsAndField.FIELD}_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}");
                    if(score === "N/A"){
                        score = null;
                    }
                    if(score !== undefined && score !== null){
                        var performanceCode = _util.coalesce(row.getField("${strandsAndField.FIELD}_MET_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}"), "--");
                        var type = _util.coalesce(row.getField("${strandsAndField.FIELD}_TYPE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}"), "--");
                        var months = _util.coalesce(row.getField("MONTHS_OF_GROWTH_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}"), "--");
                        var dateField = _util.coalesce(row.getField("DATE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}"), "--");
                        //var outcomeScore = _util.coalesce(row.getField("OUTCOME_SCORE_${gradeLevel.FIELD}"), "--");
                        try{

                        mappingObject.SCORE_MAPPINGS.push(
                            {
                                "TEST_NUMBER" : "${strandsAndField.TEST}${gradeLevel.GRADE_CODE}${assessPeriod.PERIOD_CODE}${strandsAndField.STRAND}",
                                "TEST_SCORE_VALUE" : score,
                                "TEST_SCALED_SCORE" : score,
                                "TEST_SCORE_TEXT" : score,
                                "TEST_PRIMARY_RESULT_CODE" : performanceCode,
                                "TEST_SECONDARY_RESULT" : row.getField("GROWTH_PERCENTILE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}"),
                                "TEST_SECONDARY_RESULT_CODE" : "%TILE",
                                //"TEST_RAW_SCORE" : outcome,
                                "TEST_GROWTH_RESULT" : months,
                                "TEST_SCORE_ATTRIBUTES" : type + " - " + dateField,
                                "TEST_TERTIARY_RESULT" : syncDate,
                                "TEST_QUATERNARY_RESULT" : testDate,
                            }
                        );
                        }
                        catch(exception){
                            print(exception);
                        }
                    }
                }else if(goalSigName === "LA_DIBELS_COL_106"){
                     var score = row.getField("${strandsAndField.FIELD}_SCORE");
                     var performanceCode = _util.coalesce(row.getField("${strandsAndField.FIELD}_LEVELS"), "--");

                        if(score === "N/A"){
                            score = null;
                        }
                        if((score === undefined || score === null || score === "") && (performanceCode === null || performanceCode === undefined || performanceCode === ""|| performanceCode === "--")){
                            return null;
                        }else{
                           // var type = _util.coalesce(row.getField("${strandsAndField.FIELD}_TYPE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}"), "--");
                            var year = _util.coalesce(row.getField("${strandsAndField.FIELD}_YEAR_GROWTH"), "--");
                            var semGrowth = _util.coalesce(row.getField("${strandsAndField.FIELD}_SEMESTER_GROWTH"), "--");
                            var nationalNormPercentile = _util.coalesce(row.getField("${strandsAndField.FIELD}_NATIONAL_NORM_PERCENTILE"), "--");
                            var res = row.getField("${strandsAndField.FIELD}_NATIONAL_NORM_PERCENTILE");
                            //var dateField = _util.coalesce(row.getField("DATE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}"), "--");
                            //var outcomeScore = _util.coalesce(row.getField("OUTCOME_SCORE_${gradeLevel.FIELD}"), "--");

                            var lexileScore = row.getField("${strandsAndField.FIELD}_SCORE_LEXILE");
                            if(lexileScore !== null){
                                lexileScore = lexileScore.replace("BR", "").replace("L", "");
                                }
                            if(nationalNormPercentile === "Discontinue"){
                                nationalNormPercentile = null;
                            }else if(nationalNormPercentile === "Tested Out"){
                                nationalNormPercentile = null;
                            }
                            try{


                            mappingObject.SCORE_MAPPINGS.push(
                                {
                                    "TEST_NUMBER" : "${strandsAndField.TEST}" + gradeDecode[row.getField("ASSESSMENT_GRADE")] + "${assessPeriod.PERIOD_CODE}"+ "${strandsAndField.STRAND}",
                                    "TEST_SCORE_VALUE" : parseInt(score),
                                    "TEST_SCALED_SCORE" : parseInt(score),
                                    "TEST_SCORE_TEXT" : score,
                                    "TEST_PRIMARY_RESULT" : performanceCode,
                                    "TEST_PRIMARY_RESULT_CODE" : benchmarkLevels[performanceCode],
                                    "TEST_SECONDARY_RESULT" : semGrowth,//row.getField("GROWTH_PERCENTILE_COMPOSITE_${gradeLevel.FIELD}_${assessPeriod.FIELD}"),//
                                    "TEST_SECONDARY_RESULT_CODE" : "%TILE",
                                    "TEST_PERCENTILE_SCORE" : parseInt(nationalNormPercentile),
                                    "TEST_READING_LEVEL" : lexileScore,
                                    "TEST_GROWTH_RESULT" : year,
                                   // "TEST_SCORE_ATTRIBUTES" : type + " - " + dateField,
                                   "TEST_TERTIARY_RESULT" : syncDate,
                                   "TEST_QUATERNARY_RESULT" : testDate,
                                   "TEST_CUSTOM_RESULT" : res,
                                }
                            );
                            }
                            catch(exception){
                                print(exception);
                            }
                        }
                }

        });



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
    function mapNormalizedAdminFields(signature, hierarchy, row, gradeLevel, year, assessPeriod) {

        var record = {};
        var birthDateField = row.getField("BIRTH_DATE");
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
                                  RAW_DATE : null
                                  , MONTH : null
                                  , DAY : null
                                  , YEAR : null
                                  , STANDARD_DATE : null
                              };
        //var birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "MM/dd/yyyy");
        if (birthDateField !== null && birthDateField !== "" && birthDateField !== undefined){
            if (birthDateField.indexOf("-") >= 4){
                birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "yyyy-MM-dd");
            } else {
                birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "MM/dd/yyyy");
            }
        } else {
            birthDateObject;
        }

        var sigName = signature.getFormat().getFormatName();
        if(row.getField("BENCHMARK_PERIOD") !== null && row.getField("BENCHMARK_PERIOD") !== "" && row.getField("BENCHMARK_PERIOD") !== undefined){
        var benchmarkPeriod = row.getField("BENCHMARK_PERIOD").toUpperCase();
        }
        var newGrade = parseGrade(sigName, gradeLevel);
        //var assessPeriod = getAssesssPeriod(row);
        //Loop through normalized fields and map if possible.
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, gradeLevel, assessPeriod);
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

                   //record.REPORTING_PERIOD = _util.coalesce(benchmarkPeriod, getTEST_ADMIN_PERIOD(assessPeriod));
                    record.REPORTING_PERIOD = _util.coalesce(benchmarkPeriod, getTEST_ADMIN_PERIOD(assessPeriod));

                    break;


                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTEST_ADMIN_DATE_STR(assessPeriod, hierarchy, row);

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
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("SECONDARY_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("SECONDARY_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"), row.getField("FIRST"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(null);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"), row.getField("LAST"));
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
                    //record.STUDENT_GRADE_CODE = gradeLevel.GRADE_CODE;
                    record.STUDENT_GRADE_CODE = _util.coalesce(newGrade,gradeDecode[row.getField("ASSESSMENT_GRADE")]);

                    //record.STUDENT_GRADE_CODE = newGrade;
                    break;


                case "TEST_LOCATION":
                    record.TEST_LOCATION = _util.coalesce(row.getField("TEST_LOCATION"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_ID"));
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"));
                    break;
                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }

    function parseGrade(sigName, gradeLevel) {
        if(sigName === "DIBELS_8TH_FAYETTE_20_21_K_FALL" || sigName === "DIBELS_FULL" || sigName === "DIBELS_8TH_MIDDLE" || sigName === "DIBELS_1ST_22_23" || sigName === "DIBELS_3RD_22_23"
            || sigName === "DIBELS_1ST_BEG_42C" || sigName === "DIBELS_1ST_END_42C" || sigName === "DIBELS_2ND_BEG_34C" || sigName === "DIBELS_2ND_END_43C" || sigName === "DIBELS_2ND_MID_35C"
            || sigName === "DIBELS_K_BEG_32C" || sigName === "DIBELS_K_END_33C" || sigName === "DIBELS_K_MID_32C") {
            newGrade = gradeLevel.GRADE_CODE;
        } else {
            newGrade = null;
        }
        return newGrade;
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
        }

        return period;
    }


    function getTEST_ADMIN_DATE_STR(assessPeriod, hierarchy, row) {
        var date = null;
        var schoolYear = hierarchy.SCHOOL_YEAR;

        if (row.getField('CLIENT_DATE')  !== null && row.getField('CLIENT_DATE') !== "" && row.getField('CLIENT_DATE') !== undefined){
            date = AppUtil.getMonthFollowedByDay(row.getField('CLIENT_DATE')).STANDARD_DATE;
        }
        else {
            switch (assessPeriod.FIELD) {
            case "BEGINNING":
                date = "10/15/" + schoolYear.substring(0, 4);
                break;
            case "MIDDLE":
                date = "01/15/" + schoolYear.substring(5, 8);
                break;
            case  "END":
                date = "04/15/" + schoolYear.substring(5, 8);
                break;
            default:
                date = "05/15/" + schoolYear.substring(0, 4);
                break;
            }
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


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, gradeLevel, assessPeriod) {

        var assessmentAdminKey = null;
        var schoolYear = hierarchy.SCHOOL_YEAR;
        var clientDate;

        // Set base assessment admin key information
               if(assessPeriod===undefined){
                   assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
               }
               else{
                   assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${assessPeriod.FIELD}";
               }

        if(srcRecord.getField('CLIENT_DATE')  !== null && srcRecord.getField('CLIENT_DATE') !== "" && srcRecord.getField('CLIENT_DATE') !== undefined){
            clientDate = AppUtil.getMonthFollowedByDay(srcRecord.getField('CLIENT_DATE')).STANDARD_DATE;
        } else {
            switch (assessPeriod.FIELD) {
            case "BEGINNING":
                clientDate = "10/15/" + schoolYear.substring(0, 4);
                break;
            case "MIDDLE":
                clientDate = "01/15/" + schoolYear.substring(5, 8);
                break;
            case  "END":
                clientDate = "04/15/" + schoolYear.substring(5, 8);
                break;
            default:
                clientDate = "05/15/" + schoolYear.substring(0, 4);
                break;
            }
        }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + clientDate + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }

    function getAssesssPeriod(row){
        var begCheck = row.getField("FORM_LNF_K_BEGINNING");
        var midCheck = row.getField("FORM_LNF_K_MIDDLE");
        var endCheck = row.getField("FORM_LNF_K_END");
        if((JSON.stringify(row)).indexOf("_BEGINNING")>-1){
            return 'BEGINNING';
        }
        else if((JSON.stringify(row)).indexOf("_MIDDLE")>-1){
            return 'MIDDLE';
        }
        else if((JSON.stringify(row)).indexOf("_END")>-1){
            return 'END';
        }
        return '';
    }

    function writeNormalizedRecords(file, data) {
        try {
            const normalFile = _file.open(file);
            const normalFilePath = normalFile.getParent();
            const normalFileName = normalFile.getName();
            const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
            let rowArray = null;
            const header = Object.keys(data[0]);

            writer.writeNext(header);

            data.forEach(function (row) {
                rowArray = [];

                for (let key in row) {
                    rowArray.push(row[key]);
                }
                writer.writeNext(rowArray);
            })

            writer.close();
        } catch (exception) {
            throw "${_thisModuleName}.writeNormalizedRecords Exception: ${exception}";
        }
    }


    function getRecords(file, signature) {
        try {
            const format = signature.getFormat();
            const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
            const fileFullName = file.getFullName();
            let lineNumber = 0;
            let recordsArray = [];

            let record, row;

            if (signature.getFormat().getClass().toString().equals(SignatureFormatType.DELIMITED)) {
                let fieldDelimiter = format.getFieldDelim();
                let textDelimiter = format.getQuoteDelim();
                let delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
                let fieldNames = delimitedRecordParser.parseRow(reader);
                while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                    let index = 0;

                    record = { LINEAGE_FILE: null, LINEAGE_LINE: null };

                    for (const key in fieldNames) {
                        record[fieldNames[index]] = row.get(index++);
                    }

                    record.LINEAGE_FILE = fileFullName;
					record.LINEAGE_LINE = (++lineNumber).toString();

                    recordsArray.push((record));
                }
            } else if (signature.getFormat().getClass().toString().equals(SignatureFormatType.FIXED_LENGTH)) {
                let fields = format.getFields();
                while ((row = reader.readLine()) !== null) {
                    record = { LINEAGE_FILE: null, LINEAGE_LINE: null };
                    fields.forEach(field => {
                        record[field.getPhysicalName()] = row.substring(
                            field.getFieldOffset().getOffsetStart() - 1,
                            field.getFieldOffset().getOffsetEnd()
                        ).trim();
                    });
                    record.LINEAGE_FILE = fileFullName;
					record.LINEAGE_LINE = (++lineNumber).toString();

                    recordsArray.push(record);
                }
            } else {
                throw new Error("Invalid Signature Format");
            }

            return recordsArray;
        } catch (exception) {
            throw "${_thisModuleName}.createRecords Exception: ${exception}";
        }
    }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());