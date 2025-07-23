var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "ISAT_ALT";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
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
    				.transform("NORMALIZE RECORDS", ["RECORDS"],
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
    				.output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
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

         //TODO update scoresToMap
        var scoresToMap = [
            {TEST: "ISAT_ALT", CODE:"OVR", MAP_FUNCTION: mapScaledScore},
            {TEST: "ISAT_ALT", CODE:"ELA_LIT_OVR", FIELD: "ALTERNATE_ELA_LITERACY_", MAP_FUNCTION: mapScore},
            {TEST: "ISAT_ALT", CODE:"MAT_OVR", FIELD: "ALTERNATE_MATHEMATICS_", MAP_FUNCTION: mapScore},
            {TEST: "ISAT_ALT", CODE:"SCI_OVR", FIELD: "ALTERNATE_SCIENCE_", MAP_FUNCTION: mapScore}
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
            "Kindergarten": "KG"
           ,"" : null
           ,null : null
        };

         var primaryDecode = {
            "1" :  {CODE: "Level 1", DESC: "Not met achievement standard", PASS_IND: "No"}
            ,"2" : {CODE: "Level 2", DESC: "Nearly met the achievement level", PASS_IND: "No"}
            ,"3" : {CODE: "Level 3", DESC: "Met the achievement level", PASS_IND: "Yes"}
            ,"4" : {CODE: "Level 4", DESC: "Exceeded the achievement level", PASS_IND: "Yes"}
            ,"Level 1" : {CODE: "Level 1", DESC: "Not met achievement standard", PASS_IND: "No"}
            ,"Level 2" : {CODE: "Level 2", DESC: "Nearly met the achievement level", PASS_IND: "No"}
            ,"Level 3" : {CODE: "Level 3", DESC: "Met the achievement level", PASS_IND: "Yes"}
            ,"Level 4" : {CODE: "Level 4", DESC: "Exceeded the achievement level", PASS_IND: "Yes"}
            ,"" : {CODE: null, DESC: null, PASS_IND: null}
            ,null : {CODE: null, DESC: null, PASS_IND: null}
            ,undefined : {CODE: null, DESC: null, PASS_IND: null}
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
            // student name = firstname,lastname and split first_name and last name

            var fullName = row.getField("STUDENT_NAME")? row.getField("STUDENT_NAME").split(',') :null;
            var lastName = null;
            var firstName = null;
            var middleName = null;
            if(fullName && fullName.length === 4){
                lastName = fullName[0];
                firstName = fullName[1]+' '+fullName[2]
                middleName = fullName[3]
            }
            else if(fullName && fullName.length === 3){
                var lastName = fullName[0];
                var firstName = fullName[1];
                var middleName = fullName[2];
            }
            else if(fullName && fullName.length === 2){
                var lastName = fullName[0];
                var firstName = fullName[1];
            }
            var districtNumber = row.getField("ENROLLED_SCHOOL") ? row.getField("ENROLLED_SCHOOL").split('(')[1].split('_')[0] : null;
            var schoolNumber = row.getField("ENROLLED_SCHOOL")? row.getField("ENROLLED_SCHOOL").split('_')[1].split(')')[0] : null;
            var schoolName = row.getField("ENROLLED_SCHOOL")? row.getField("ENROLLED_SCHOOL").split('(')[0] :null;
            var birthDateObject = {
                        RAW_DATE : null
                        , MONTH : null
                        , DAY : null
                        , YEAR : null
                        , STANDARD_DATE : null
                    }
            var birthDate = row.getField("STUDENT_DATE_OF_BIRTH");
            if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
            }

            var reportingPeriod = "ALL";  // Default reporting period
            var period = row.getField("TEST_REASON")? row.getField("TEST_REASON").split(' ')[0] : 'ALL';
            if(period == "Spring"){
                reportingPeriod = "Spring";
            }else if(period == "Fall"){
                reportingPeriod = "Fall";
            }else if(period == "Winter"){
                reportingPeriod = "Winter";
            }else{
                reportingPeriod = 'ALL';
            }
            var testDate = null;
            if(row.getField("TEST_DATE")!==null && row.getField("TEST_DATE")!==undefined){
            testDate = AppUtil.getMonthFollowedByDay(row.getField("TEST_DATE")).STANDARD_DATE;
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
                            record.REPORTING_PERIOD = reportingPeriod
                            break;
                        case "ASSESSMENT_VENDOR":
                            record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                            break;
                        case "ASSESSMENT_PRODUCT":
                            record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                            break;
                        case "TEST_ADMIN_DATE":
                            record.TEST_ADMIN_DATE =  testDate;
                            break;

                        // Student Information
                        case "STUDENT_LOCAL_ID":
                            record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID_1"));
                            break;
                        case "STUDENT_STATE_ID":
                            record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID_2"));
                            break;
                        case "STUDENT_VENDOR_ID":
                            record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                            break;
                        case "STUDENT_FIRST_NAME":
                            record.STUDENT_FIRST_NAME = _util.coalesce(row.getField('STUDENT_FIRST_NAME'), firstName);
                            break;
                        case "STUDENT_LAST_NAME":
                            record.STUDENT_LAST_NAME = _util.coalesce(row.getField('STUDENT_LAST_NAME'), lastName);
                            break;
                        case "STUDENT_MIDDLE_NAME":
                            record.STUDENT_MIDDLE_NAME = _util.coalesce(row.getField('STUDENT_MIDDLE_NAME'), middleName);
                            break;
                        case "STUDENT_GENDER_CODE":
                            record.STUDENT_GENDER_CODE = row.getField('GENDER');
                            break;
                        case "STUDENT_GRADE_CODE":
                            record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE_LEVEL')];
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

                        // School Information
                        case "SCHOOL_VENDOR_ID":
                            record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), schoolNumber);
                            break;
                        case "SCHOOL_LOCAL_ID":
                            record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER_1"));
                            break;
                        case "SCHOOL_STATE_ID":
                            record.SCHOOL_STATE_ID = _util.coalesce(row.getField("DISTRICT_TESTED"), districtNumber);
                            break;
                        case "SCHOOL_NAME":
                            record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), schoolName);
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
            function mapScaledScore(row, testMetadata) {
                        var score = {};
                        var testNumber = generateTestNumber(row, testMetadata);
                        var scaleScore = row.getField("SCORE");
                		var achievLevel = row.getField("PERFORMANCE_LEVEL");
                        // Check for key fields and do not map score and exit if conditions met.
                        if(scaleScore === null || scaleScore === undefined || scaleScore === 'Insufficient to score' || scaleScore === 'Invalidated' || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                            return null;
                        }

                    	// Set score fields
                    	score["TEST_NUMBER"] = testNumber;
                    	score["TEST_SCORE_TEXT"] = scaleScore;
                        if(!isNaN(scaleScore)){
                            score["TEST_SCORE_VALUE"] = scaleScore;
                            score["TEST_SCALED_SCORE"] = scaleScore;
                        }

                        if(achievLevel){
                            score["TEST_PASSED_INDICATOR"] = primaryDecode[achievLevel].PASS_IND;
                            score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achievLevel].CODE;
                            score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel].DESC;
                	    }

                        return score;
                    }


            function mapScore(row, testMetadata) {
                    var score = {};
                    var testNumber = testMetadata.TEST + "_"+ testMetadata.CODE;
                     if(row.getField("ASSESSMENT_NAME")){
                        // return from here.
                        return null;
                     }

                    var scaleScore = _util.coalesce(row.getField("SCORE"),row.getField(testMetadata.FIELD + "SCALE_SCORE"))                                              //row.getField("SCORE");
            		var achievLevel = _util.coalesce(row.getField("PERFORMANCE_LEVEL"),row.getField(testMetadata.FIELD + "PERFORMANCE_LEVEL"));
            		var sem = row.getField(testMetadata.FIELD + "STANDARD_ERROR");

                    // Check for key fields and do not map score and exit if conditions met.
                    if(scaleScore === null || scaleScore === undefined || scaleScore === 'Insufficient to score' || scaleScore === 'Invalidated' || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                        return null;
                    }

                	// Set score fields
                	score["TEST_NUMBER"] = testNumber;
                	score["TEST_SCORE_TEXT"] = scaleScore;
                    if(!isNaN(scaleScore)){
                        score["TEST_SCORE_VALUE"] = scaleScore;
                        score["TEST_SCALED_SCORE"] = scaleScore;
                    }

                    if(achievLevel){
                        score["TEST_PASSED_INDICATOR"] = primaryDecode[achievLevel].PASS_IND;
                        score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[achievLevel].CODE;
                        score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel].DESC;
            	    }
            	    if(sem && !isNaN(sem)){
                        	    score["TEST_STANDARD_ERROR"] = sem;
                        	}

                    return score;
                }


        function generateTestNumber(row, testMetadata) {

            var testNumber = null;
            var testSubject = _util.trim(row.getField("ASSESSMENT_NAME"));
            if(testSubject === 'IDAA ELA'){
                subject = 'ELA';
            } else if(testSubject === 'IDAA Math'){
                subject = 'MAT';
            }
            else if(testSubject === 'IDAA Science'){
                subject = 'SCI';
            }
            if(testSubject) {
                 testNumber = testMetadata.TEST + "_" + subject + "_" + testMetadata.CODE;
            } else {
                 testNumber = testMetadata.TEST + "_"+ testMetadata.CODE;
            }
            return testNumber;
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

        function subjectFromSignatureName(signature, row){
                //For Handling Duplicates
                var sub = null;

                if(signature.getFormat().getFormatName() === 'ISAT_ALT_12_COLS'){
                    sub = 'ALT_ALL'
                }else if(signature.getFormat().getFormatName() === 'ISAT_ALT_ELA_19_COLS'){
                    sub = 'ALT_ELA'
                }else if(signature.getFormat().getFormatName() === 'ISAT_ALT_MATH_19_COLS'){
                    sub = 'ALT_MATH'
                }else if(signature.getFormat().getFormatName() === 'ISAT_ALT_SCI_19_COLS'){
                    sub = 'ALT_SCI'
                }
                return sub
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

            // Generate the assessmentAdminKey using hierarchy values and the converted date
            var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
            var subject = subjectFromSignatureName(signature, srcRecord);
            var testAdminDate = srcRecord.getField("TEST_DATE");
            if(testAdminDate !== null && testAdminDate !== undefined && testAdminDate !== "") {
            var adminDate = AppUtil.getMonthFollowedByDay(testAdminDate).STANDARD_DATE;
            }

            // Add natural key fields
            signature.getFormat().getNaturalKey().forEach(function(key) {
                assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
            });

             assessmentAdminKey = assessmentAdminKey + "_" + adminDate;

             //Examples of adding additional values
             if(subject && subject!== null){
                 assessmentAdminKey = assessmentAdminKey + "_" +subject;
             }

            // Examples of adding additional values (if needed)
            // assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
            // assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);

            // Return the generated assessment admin key
            return assessmentAdminKey;
        }

        return module;
    }());