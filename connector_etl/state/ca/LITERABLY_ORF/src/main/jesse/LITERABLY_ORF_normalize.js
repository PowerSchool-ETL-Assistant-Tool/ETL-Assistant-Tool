var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LITERABLY_ORF";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
//    module.createNormalizedFile = function(file, signature) {
//		try {
//
//			var signatureFormatName = signature.getFormat().getFormatName();
//			print("Loading using signature file ${signatureFormatName}");
//
//
//			//Initialize path and lineage variables.
//			var normalizedFile = AppUtil.createResultsFile(file);
//
//			print("Normalized file: ${normalizedFile}");
//
//			var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
//			var lineNumber = 0;
//			const fileFullName = file.getFullName();
//
//
//			//Process data file records.
//			_dataflow.create("RECORD BUILD")
//				.input("INPUT", AppUtil.getInputDataflow(file, signature))
//				.transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {
//
//					json.LINEAGE_FILE = fileFullName;
//					json.LINEAGE_LINE = (++lineNumber).toString();
//					output.RECORDS.put(json);
//				})
//				.group_by("ADMINISTRATION GROUPING" , function(one, two){
//
//					try {
//						var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
//						var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);
//
//						return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
//					} catch(exception) {
//						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
//					}
//
//				})
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
//				.transform("NORMALIZE RECORDS", ["RECORDS"],
//					function(output, rows) {
//						try{
//
//							var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);
//
//							normalizedRecords.forEach(function(record){
//								output.RECORDS.put(record);
//							});
//
//						} catch(exception) {
//							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
//						}
//
//
//					})
//				.transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
//					try {
//						var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);
//
//						// Report when no scores are found.
//						if(mappingObject.SCORE_MAPPINGS.length === 0){
//							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
//						} else {
//							output.RECORDS.put(row);
//						}
//					} catch(exception) {
//						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
//					}
//				})
//				.output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
//				.execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);
//
//			return normalizedFile;
//
//		} catch(exception) {
//			throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
//		}
//    };


   module.createNormalizedFile = function(file, signature) {
        try {
            let normalizedFile = AppUtil.createResultsFile(file);
            const hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
            const fileRows = createRecords(file, signature);
            let normalizedRows = [], normalizedRecords = [];

            fileRows.forEach(function(rows) {
                try{
                    mapNormalizedRecords(signature, hierarchy, rows).forEach(function(normRecord) {
                        normalizedRows.push(normRecord)
                    });

                } catch(exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "mapNormalizedRecords error: ${exception}", JSON.stringify(rows)));
                }
            });


            normalizedRows.forEach(function(row) {
                try {
                    const mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

                    if(mappingObject.SCORE_MAPPINGS.length === 0) {
                        AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
                    } else {
                        normalizedRecords.push(row);
                    }


                } catch(exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
                }

            });
            writeNormalizedRecords(normalizedFile, normalizedRecords);

            return normalizedFile;
        } catch(exception) {
            throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
        }
    };

/** Java classes **/
    const DelimitedRecordParser = Java.type("com.hoonuit.fileParser.recordParser.DelimitedRecordParser");
    const BufferedReader = Java.type("java.io.BufferedReader");
    const InputStreamReader = Java.type('java.io.InputStreamReader');
    const CSVWriter = Java.type("com.opencsv.CSVWriter");
    const FileWriter = Java.type("java.io.FileWriter");
    const File = Java.type("java.io.File");

/***************************************************************************
     Utility Functions
     ***************************************************************************/

    function createRecords(file, signature) {
        try {
            const format = signature.getFormat();
            const fieldDelimiter = format.getFieldDelim();
            const textDelimiter = format.getQuoteDelim();
            const reader = new BufferedReader(new InputStreamReader(file.getFileContent().getInputStream()));
            const delimitedRecordParser = new DelimitedRecordParser(fieldDelimiter, textDelimiter)
            let lineNumber = 0;
            let recordsArray = [];
            const fieldNames = delimitedRecordParser.parseRow(reader);
            let row, record;

            while ((row = delimitedRecordParser.parseRow(reader)) != null) {
                let index = 0;
                record = {};

                for (const key in fieldNames) {
                    record[fieldNames[index]] = row.get(index++);
                }
                record.LINEAGE_FILE = file.getFullName();
                record.LINEAGE_LINE = (++lineNumber).toString();
                const rowArray = [];
                rowArray.push(record);
                recordsArray.push((rowArray));
            }

            return recordsArray;
        } catch (exception) {
            throw "${_thisModuleName}.createRecords Exception: ${exception}";
        }
    }

    /**
     * Creates a Processed file containing the audit types of error for the file processed
     *
     * @param file A fully qualified string path to the normalFile
     * @param data The audit statistics of the file that was processed
     */
    function writeNormalizedRecords(file, data) {
        try {
            const normalFile = _file.open(file);
            const normalFilePath = normalFile.getParent();
            const normalFileName = normalFile.getName()
            const writer = new CSVWriter(new FileWriter(new File(normalFilePath, normalFileName)), "\t");
            let rowArray = null;
            const header = Object.keys(data[0]);

            writer.writeNext(header);

            data.forEach(function(row) {
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

     //TODO update scoresToMap
    var scoresToMap = [
        {TEST: "LITERABLY_ORF", CODE:"WCPM", FIELD: "WCPM", MAP_FUNCTION: mapWCPMScore}
        ,{TEST: "LITERABLY_ORF", CODE:"COMPR", FIELD: "COMPREHENSION", MAP_FUNCTION: mapComprehensionScore}
        ,{TEST: "LITERABLY_ORF", CODE:"INSTRUCT", FIELD: "INSTRUCTIONAL_LEVEL", MAP_FUNCTION: mapInstructionalScore}
        ,{TEST: "LITERABLY_ORF", CODE:"RET", FIELD: "RETELL", MAP_FUNCTION: mapRetellScore}
        ,{TEST: "LITERABLY_ORF", CODE:"IND", FIELD: "INDEPENDENT_LEVEL", MAP_FUNCTION: mapIndependentScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
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
        "Kindergarten": "KG",
        "PK" : "PK"
       ,"" : null
       ,null : null
    };

    var primaryDecode = {
       "Adv" : "Advanced"
       , "Advanced" : "Advanced"
       ,"Bas" : "Basic"
       ,"Basic" : "Basic"
       ,"Bel" : "Below Basic"
       ,"Below Basic" : "Below Basic"
       ,"Pro" : "Proficient"
       ,"Proficient" : "Proficient"
       ,"" : null
       ,null : null
      };


    var decodeSubject = {
        "english" : "ELA"
        ,"English" : "ELA"
        ,"spanish" : "SPA"
        ,"Spanish" : "SPA"
    } ;

    var decodeTargetGrade = {
        "Exceeds target" : "ET"
        ,"Target met" : "TM"
        ,"Below target" : "BT"
        ,"Practice Needed" : "PN"
    };

    var passInd = {
        "Practice Needed" : "No"
        ,"Target met" : "Yes"
        ,"TRUE" : "Yes"
        ,"True" : "Yes"
        ,"False" : "No"
        ,"FALSE" : "No"
        ,"None" : null
    }

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
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
            } catch(exception) {
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
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

        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

    // Input date string
    var dateString = row.getField("TEST_ADMIN_DATE"); // Example input: "October 26, 2021 08:52 AM"

    // Parse the date string
    var dateObject = new Date(dateString);

    // Check if the date parsing was successful
    if (isNaN(dateObject)) {
        print("Invalid date format");
    } else {
        // Extract the month, day, and year
        var month = dateObject.getMonth() + 1; // getMonth() is 0-indexed
        var day = dateObject.getDate();
        var year = dateObject.getFullYear();

        // Format the month and day with padding
        var formattedMonth = (month < 10 ? '0' : '') + month; // Pad month if needed
        var formattedDay = (day < 10 ? '0' : '') + day;       // Pad day if needed

        // Format to mm/dd/yyyy
        var formattedDate = `${formattedMonth}/${formattedDay}/${year}`;
    }


    function getAdminPeriod(formattedDate) {
        let period = 'ALL';
        let month = formattedDate.substring(0, 2);
        if (month === "04" || month === "05" || month === "06") {
            period = "SPRING";
        }else if (month === "10" || month === "11") {
            period = "FALL"
        }else if (month === "12" || month === "01" || month === "02" || month === "03") {
            period = "WINTER";
        }else if (month === "08" || month === "09") {
            period = "BOY";
        }
        return period;
    }

//----------------Concatenating Student Name and using in Student_Vendor_Id if its "None"-----------//

    var StudentID = row.getField("STUDENT_ID");
    var finalStudentID = null;

    if (StudentID == "None"){
        var finalStudentID = row.getField('STUDENT_FIRST_NAME') + "_" + row.getField('STUDENT_LAST_NAME');
    }else{
        finalStudentID = StudentID;
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
                    record.REPORTING_PERIOD = _util.coalesce(getAdminPeriod(formattedDate), hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                //TEST_ADMIN_DATE must always finish/print as MM/dd/YYYY format
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = formattedDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(finalStudentID, row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE_WHEN_ASSESSED')];
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

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), "DISTRICT");
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
        //TODO add or remove any additional admin fields that are non-standard to the case statment above
        var admin = {};

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapWCPMScore(row, testMetadata) {
        var score = {};
        var sub = decodeSubject[row.getField("LANGUAGE")];
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + sub;
        var scaleScore = row.getField("EQUATED_" + testMetadata.FIELD);
        var rawScore = row.getField("RAW_" + testMetadata.FIELD);
        var perfLevel = row.getField(testMetadata.FIELD + "_CATEGORY");

        var grade = row.getField("GRADE_WHEN_ASSESSED");
        var textGradeLvl = row.getField("TEXT_GRADE_LEVEL");
        var targetGrade = null;

        if((grade !== null || grade !== "" || grade !== undefined || grade !== "K" || grade !== "PK") &&
            (textGradeLvl !== null || textGradeLvl !== "" || textGradeLvl !== undefined || grade !== "K" || grade !== "PK"))
        {
            testGradeLvl = Math.floor(textGradeLvl);
            if(textGradeLvl > grade ){//null > 1
                targetGrade = "Exceeds target";
            }else if(textGradeLvl == grade){
                targetGrade = "Target met";
            }else if(textGradeLvl < grade){
                targetGrade = "Below target";
            }
        }

        var accuracy = row.getField(testMetadata.FIELD + "_ACCURACY");
        var accuracyPercent = null;
        if(accuracy !== null || accuracy !== undefined){
            if(accuracy.indexOf(".") > -1){
                var finalAccuracy = Math.round(accuracy * 100);

                if(finalAccuracy >= 90){
                    accuracyPercent = "Target met";
                }else{
                    accuracyPercent = "Practice Needed";
                }
            }
        }

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }

        if (!isNaN(rawScore)) {
            if(rawScore < 29){
                score["TEST_SCORE_ATTRIBUTES"] = "Practice Needed";
            }else if(rawScore >= 29 && rawScore <= 59){
                score["TEST_SCORE_ATTRIBUTES"] = "On Track";
            }
            else if(rawScore >= 60){
                score["TEST_SCORE_ATTRIBUTES"] = "Target Met";
            }

            score["TEST_RAW_SCORE"] = rawScore;
        }
    	if(accuracyPercent !== null){
            score["TEST_PRIMARY_RESULT_CODE"] = accuracyPercent;
            score["TEST_PRIMARY_RESULT"] = decodeTargetGrade[accuracyPercent];
        }
        if(targetGrade !== null){
            score["TEST_SECONDARY_RESULT"] = targetGrade;
            score["TEST_SECONDARY_RESULT_CODE"] = decodeTargetGrade[targetGrade];
        }
        if(perfLevel !== null){
            score["TEST_TERTIARY_RESULT_CODE"] = perfLevel;
            score["TEST_TERTIARY_RESULT"] = perfLevel;
        }
        if(accuracyPercent !== null){
            score["TEST_PASSED_INDICATOR"] = passInd[accuracyPercent];
        }
        //Storing in Code as there are no primary result provided, And its not a mandatory column

        return score;
    }

    function mapComprehensionScore(row, testMetadata) {
        var score = {};
        var sub = decodeSubject[row.getField("LANGUAGE")];
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + sub;
        var percentage = row.getField(testMetadata.FIELD + "_PERCENTAGE").replace("%", "");
        var itemsPossible = row.getField(testMetadata.FIELD + "_ASKED");
        var itemsAttempted = row.getField(testMetadata.FIELD + "_CORRECT");

        // Check for key fields and do not map score and exit if conditions met.
        if(itemsPossible === null || itemsPossible === undefined || _util.trim(itemsPossible) === "--" || _util.trim(itemsPossible) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;

        if(percentage !== null){
    	    score["TEST_PERCENTAGE_SCORE"] = percentage;
    	}

        score["TEST_ITEMS_POSSIBLE"] = itemsPossible;
        score["TEST_ITEMS_ATTEMPTED"] = itemsAttempted;

        return score;
    }

    //This is the estimation of instruction hence everything is stored in Codes as it has integer values
    function mapInstructionalScore(row, testMetadata) {
        var score = {};
        var sub = decodeSubject[row.getField("LANGUAGE")];
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + sub;
        var instructionalLevel = row.getField(testMetadata.FIELD + "_SCORE");
        var instructionalLevelEstimated = row.getField(testMetadata.FIELD + "_ESTIMATED");
        var instructionalLevelPassed = row.getField(testMetadata.FIELD + "_PASSED");
        var instructionalLevelCategory = row.getField(testMetadata.FIELD + "_CATEGORY");

        // Check for key fields and do not map score and exit if conditions met.
        if(instructionalLevel === null || instructionalLevel === undefined || instructionalLevel === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_PRIMARY_RESULT_CODE"] = "SCORE";
    	score["TEST_PRIMARY_RESULT"] = instructionalLevel;

    	if(instructionalLevelEstimated !== null){
            score["TEST_SECONDARY_RESULT_CODE"] = "EST";
            score["TEST_SECONDARY_RESULT"] = instructionalLevelEstimated;
        }
        if(instructionalLevelCategory !== null || instructionalLevelCategory !== "N/A"){
            score["TEST_TERTIARY_RESULT_CODE"] = instructionalLevelCategory;
            score["TEST_SECONDARY_RESULT"] = instructionalLevelCategory; // No decodes are these are directly stored
        }

        if(instructionalLevelPassed !== null){
        score["TEST_PASSED_INDICATOR"] = passInd[instructionalLevelPassed];
        }

        return score;
    }


    //Retell score will be strand in its own
    function mapRetellScore(row, testMetadata) {
         var score = {};
         var sub = decodeSubject[row.getField("LANGUAGE")];
         var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + sub;
         var scaledRetellScore = row.getField(testMetadata.FIELD + "_SCORE");
            // Check for key fields and do not map score and exit if conditions met.
         if(scaledRetellScore === null || scaledRetellScore === undefined || _util.trim(scaledRetellScore) === "--" || _util.trim(scaledRetellScore) === "") {
            return null;
         }

        	// Set score fields
        	score["TEST_NUMBER"] = testNumber;
        	score["TEST_SCORE_TEXT"] = scaledRetellScore;
            if(!isNaN(scaledRetellScore)){
                score["TEST_SCORE_VALUE"] = scaledRetellScore;
                score["TEST_SCALED_SCORE"] = scaledRetellScore;
            }

            return score;
    }

    //Estimated Independent Level will be its on own score
    function mapIndependentScore(row, testMetadata) {
         var score = {};
         var sub = decodeSubject[row.getField("LANGUAGE")];
         var testNumber = testMetadata.TEST + "_" + testMetadata.CODE + "_" + sub;
         var estimatedIndependentLevel = row.getField("ESTIMATED_" + testMetadata.FIELD);
            // Check for key fields and do not map score and exit if conditions met.
            if(estimatedIndependentLevel === null || estimatedIndependentLevel === undefined || _util.trim(estimatedIndependentLevel) === "--" || _util.trim(estimatedIndependentLevel) === "") {
                return null;
            }

        	// Set score fields
        	score["TEST_NUMBER"] = testNumber;
        	score["TEST_SCORE_TEXT"] = estimatedIndependentLevel;
            if(!isNaN(estimatedIndependentLevel)){
                score["TEST_SCORE_VALUE"] = estimatedIndependentLevel;
                score["TEST_SCALED_SCORE"] = estimatedIndependentLevel;
            }

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

        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);

        //Add conformed MM/dd/yyyy test/completion date as the last value

    var dateString = srcRecord.getField("TEST_ADMIN_DATE"); // Example input: "October 26, 2021 08:52 AM"

    // Parse the date string
    var dateObject = new Date(dateString);

    // Check if the date parsing was successful
    if (isNaN(dateObject)) {
        print("Invalid date format");
    } else {
        // Extract the month, day, and year
        var month = dateObject.getMonth() + 1; // getMonth() is 0-indexed
        var day = dateObject.getDate();
        var year = dateObject.getFullYear();

        // Format the month and day with padding
        var formattedMonth = (month < 10 ? '0' : '') + month; // Pad month if needed
        var formattedDay = (day < 10 ? '0' : '') + day;       // Pad day if needed

        // Format to mm/dd/yyyy
        var formattedDate = `${formattedMonth}/${formattedDay}/${year}`;
    }

    assessmentAdminKey = assessmentAdminKey + "_" + formattedDate;
        
        return assessmentAdminKey;
    }

    return module;
}());