var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "SBAC";
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

    var scoresToMap = [//todo test metadata
        {TEST: "CT_SBAC_", CODE:"ELA", FIELD: "", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CT_SBAC_", CODE:"ELARD", FIELD: "READING", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"ELALIS", FIELD: "LISTENING", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"ELAWR", FIELD: "WRITING_AND_RESEARCH", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"MA", FIELD: "", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CT_SBAC_", CODE:"SCI", FIELD: "", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CT_SBAC_", CODE:"MACR", FIELD: "COMMUNICATING_REASONING", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"MACP", FIELD: "CONCEPTS_AND_PROCEDURES", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"MAPSMDA", FIELD: "PROBLEM_SOLVING", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"SCIES", FIELD: "EARTH/SPACE_SCIENCES", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"SCILS", FIELD: "LIFE_SCIENCES", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"SCIPS", FIELD: "PHYSICAL_SCIENCES", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CT_CTAA_", CODE:"ELA", FIELD: "ELA", MAP_FUNCTION: mapCTAAScore}
        ,{TEST: "CT_CTAA_", CODE:"MA", FIELD: "MATH", MAP_FUNCTION: mapCTAAScore}
        ,{TEST: "CT_SBAC_", CODE:"CTAS", FIELD: "", MAP_FUNCTION: mapCTASScaledScore}
        ,{TEST: "CT_SBAC_", CODE:"CTAS_ES", FIELD: "EARTH_SYSTEMS", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"CTAS_NR", FIELD: "NATURAL_RESOURCES", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"CTAS_LO", FIELD: "LIVING_ORGANISMS", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"CTAS_HE", FIELD: "HEALTHY_ECOSYSTEMS", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"CTAS_FM", FIELD: "FORCES_AND_MOTION", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"CTAS_EED", FIELD: "USING_ENERGY_EVERY_DAY", MAP_FUNCTION: mapCTASStrandScore}
        ,{TEST: "CT_SBAC_", CODE:"IAB", FIELD: "", MAP_FUNCTION: mapIABScore}
    ];


    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
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
        "Grade 05": "05",
        "6": "06",
        "06": "06",
        "Grade 6": "06",
        "Grade 06": "06",
        "7": "07",
        "07": "07",
        "Grade 7": "07",
        "Grade 07": "07",
        "8": "08",
        "08": "08",
        "Grade 8": "08",
        "Grade 08": "08",
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
        "N/A": null
       ,"" : null
       ,null : null
    };

         var primaryDecode = {
                     "Level 1: Does Not Meet the Achievement Standard": "Level 1: Does Not Meet the Achievement Standard"
                    ,"Level 1: Does Not Meet": "Level 1: Does Not Meet the Achievement Standard"
                    ,"Below Standard" :"Level 1: Does Not Meet the Achievement Standard"
                    ,"Level 2: Approaching the Achievement Standard" : "Level 2: Approaching the Achievement Standard"
                    ,"Level 2: Approaching Standard" : "Level 2: Approaching the Achievement Standard"
                    ,"Approaching Standard" :"Level 2: Approaching the Achievement Standard"
                    ,"Level 3: Meets the Achievement Standard" : "Level 3: Meets the Achievement Standard"
                    ,"Level 3:  Meets" : "Level 3: Meets the Achievement Standard"
                    ,"Level 3": "Level 3: Meets the Achievement Standard"
                    ,"Level 4: Exceeds the Achievement Standard" : "Level 4: Exceeds the Achievement Standard"
                    ,"Above Standard":"Level 4: Exceeds the Achievement Standard"
            //   -- Commenting out "Nonparticipant" and "Participant No Score", as it is now going into 'No scores Found' reject.
            //        , "Nonparticipant": null
            //        , "Participant No Score": null
            };
            var performanceLevelDecode = {

                "Level 1" : {CODE: "1", DESC: "Level 1: Does Not Meet the Achievement Standard", PASS_IND: "No"}
                ,"Level 1: Does Not Meet" : {CODE: "1", DESC: "Level 1: Does Not Meet the Achievement Standard", PASS_IND: "No"}
                ,"Level 1: Does Not Meet the Achievement Standard" : {CODE: "1", DESC: "Level 1: Does Not Meet the Achievement Standard", PASS_IND: "No"}
                ,"Does Not Meet (Level 1)" : {CODE: "1", DESC: "Level 1: Does Not Meet the Achievement Standard", PASS_IND: "No"}
                ,"Not Met (Level 1)" : {CODE: "1", DESC: "Level 1: Does Not Meet the Achievement Standard", PASS_IND: "No"}
                ,"Below Standard" : {CODE: "1", DESC: "Level 1: Does Not Meet the Achievement Standard", PASS_IND: "No"}
                ,"1" : {CODE: "1", DESC: "Level 1: Does Not Meet the Achievement Standard", PASS_IND: "No"}

                ,"Level 2" : {CODE: "2", DESC: "Level 2: Approaching the Achievement Standard", PASS_IND: "No"}
                ,"Level 2: Approaching" : {CODE: "2", DESC: "Level 2: Approaching the Achievement Standard", PASS_IND: "No"}
                ,"Level 2: Approaching the Achievement Standard" : {CODE: "2", DESC: "Level 2: Approaching the Achievement Standard", PASS_IND: "No"}
                ,"Approaching (Level 2)" : {CODE: "2", DESC: "Level 2: Approaching the Achievement Standard", PASS_IND: "No"}
                ,"Approaching Standard" : {CODE: "2", DESC: "Level 2: Approaching the Achievement Standard", PASS_IND: "No"}
                ,"At/Near Standard" : {CODE: "2", DESC: "Level 2: Approaching the Achievement Standard", PASS_IND: "No"}
                ,"2" : {CODE: "2", DESC: "Level 2: Approaching the Achievement Standard", PASS_IND: "No"}

                ,"Level 3" : {CODE: "3", DESC: "Level 3: Meets the Achievement Standard", PASS_IND: "Yes"}
                ,"Level 3: Meets" : {CODE: "3", DESC: "Level 3: Meets the Achievement Standard", PASS_IND: "Yes"}
                ,"Level 3: Meets the Achievement Standard" : {CODE: "3", DESC: "Level 3: Meets the Achievement Standard", PASS_IND: "Yes"}
                ,"Met (Level 3)" : {CODE: "3", DESC: "Level 3: Meets the Achievement Standard", PASS_IND: "Yes"}
                ,"Meets (Level 3)" : {CODE: "3", DESC: "Level 3: Meets the Achievement Standard", PASS_IND: "Yes"}
                ,"3" : {CODE: "3", DESC: "Level 3: Meets the Achievement Standard", PASS_IND: "Yes"}

                ,"Level 4" : {CODE: "4", DESC: "Level 4: Exceeds the Achievement Standard", PASS_IND: "Yes"}
                ,"Level 4: Exceeds" : {CODE: "4", DESC: "Level 4: Exceeds the Achievement Standard", PASS_IND: "Yes"}
                ,"Level 4: Exceeds the Achievement Standard" : {CODE: "4", DESC: "Level 4: Exceeds the Achievement Standard", PASS_IND: "Yes"}
                ,"Exceeded (Level 4)" : {CODE: "4", DESC: "Level 4: Exceeds the Achievement Standard", PASS_IND: "Yes"}
                ,"Above Standard" : {CODE: "4", DESC: "Level 4: Exceeds the Achievement Standard", PASS_IND: "Yes"}
                ,"4" : {CODE: "4", DESC: "Level 4: Exceeds the Achievement Standard", PASS_IND: "Yes"}

                ,"n/a" : {CODE: null, DESC: null, PASS_IND: null}
                ,"Nonparticipant" : {CODE: null, DESC: null, PASS_IND: null}
                ,"Participant No Score" : {CODE: null, DESC: null, PASS_IND: null}
                ,"N/A"  : {CODE: null, DESC: null, PASS_IND: null}
                ,"Insufficient to score" : {CODE: null, DESC: null, PASS_IND: null}
                ,"Invalidated" : {CODE: null, DESC: null, PASS_IND: null}
                ,"" : {CODE: null, DESC: null, PASS_IND: null}
                ,null : {CODE: null, DESC: null, PASS_IND: null}


            };

//Commenting strandDecode and passDecode as they are handled in the performanceLevelDecode
//    var strandDecode = {
//         "Below Standard" : "Level 1: Does Not Meet the Achievement Standard"
//        ,"Approaching Standard" : "Level 2: Approaching the Achievement Standard"
//        ,"Above Standard" : "Level 4: Exceeds the Achievement Standard"
//    }
//    var passDecode = {
//        "Exceeded (Level 4)" : "Yes"
//        ,"Level 4: Exceeds the Achievement Standard" : "Yes"
//        ,"Level 4: Exceeds" : "Yes"
//        ,"Level 4" : "Yes"
//        ,"Above Standard" : "Yes"
//        ,"Approaching (Level 2)" : "No"
//        ,"Level 2: Approaching the Achievement Standard" : "No"
//        ,"Level 2: Approaching" : "No"
//        ,"Level 2" : "No"
//        ,"Approaching Standard" : "No"
//        ,"Below Standard" : "No"
//        ,"Met (Level 3)" : "Yes"
//        ,"Level 3" : "Yes"
//        ,"Level 3: Meets the Achievement Standard" : "Yes"
//        ,"Level 3: Meets" : "Yes"
//        ,"Level 3" : "Yes"
//        ,"Not Met (Level 1)": "No"
//        ,"Level 1: Does Not Meet the Achievement Standard": "No"
//        ,"Level 1: Does Not Meet": "No"
//        ,"Level 1": "No"
//        ,"Nonparticipant" : null
//        ,"n/a" : null
//        ,"N/A"  : null
//        ,"Insufficient to score" : null
//        ,"Invalidated" : null
//        ,"" : null
//        ,null : null
//      };

    var monthDecode = {
        "Jan" : "01"
        ,"January" : "01"
        ,"Feb" : "02"
        ,"February" : "02"
        ,"Mar" : "03"
        ,"March" : "03"
        ,"Apr" : "04"
        ,"April" : "04"
        ,"May" : "05"
        ,"Jun" : "06"
        ,"June" : "06"
        ,"Jul" : "07"
        ,"July" : "07"
        ,"Aug" : "08"
        ,"August" : "08"
        ,"Sep" : "09"
        ,"September" : "09"
        ,"Oct" : "10"
        ,"October" : "10"
        ,"Nov" : "11"
        ,"November" : "11"
        ,"Dec" : "12"
        ,"December" : "12"
    }
    var subjectDecode = {
        "ELA"   : "ELA"
        ,"Math" : "MA"
        ,"MATH" : "MA"
        ,"MA" : "MA"
        ,"Mathematics" : "MA"
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
                AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
            RAW_DATE: null,
            MONTH: null,
            DAY: null,
            YEAR: null,
            STANDARD_DATE: null
        };
        var birthDate = row.getField("DATE_OF_BIRTH");
        if (birthDate) {
            // If birthDate contains a comma (e.g., "January 1, 2020")
            if (birthDate.indexOf(",") > -1) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDate, "MMMM d, yyyy");
            }
            // If birthDate contains a "T" (ISO 8601 format, e.g., "2020-01-01T00:00:00")
            else if (birthDate.indexOf("T") > -1) {
                birthDate = birthDate.split("T")[0]; // Extract just the date portion
                birthDateObject = AppUtil.getDateObjByPattern(birthDate, "yyyy-MM-dd");
            }
            // If the date is in the format "ddMMMyyyy" (e.g., "09Apr2015")
            else if (/^\d{2}[A-Za-z]{3}\d{4}$/.test(birthDate)) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDate, "ddMMMyyyy");
            }
            // If the date is in the format "dd-MMM-yy" (e.g., "27-Oct-10")
            else if (/^\d{2}-[A-Za-z]{3}-\d{2}$/.test(birthDate)) {
                birthDateObject = AppUtil.getDateObjByPattern(birthDate, "dd-MMM-yy");
            }
            // If the date is in a month-day format (e.g., "Apr 9")
            else {
                birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
            }
        }


       var lasttestdate = row.getField("LAST_TEST_DATE");
       if ( lasttestdate!==null && lasttestdate!==undefined && lasttestdate!== '')
       {
       //lasttestdate = lasttestdate.split('T')[0];
       if (lasttestdate.indexOf('T') > -1)
       {
            lasttestdate = lasttestdate.split('T')[0];
       } else {
            lasttestdate = lasttestdate.split(' ')[0];
       }
       }
       var finalDate = null;
       if(row.getField("TEST_COMPLETION_DATE")!==null && row.getField("TEST_COMPLETION_DATE")!==undefined){
           finalDate = AppUtil.getMonthFollowedByDay(row.getField("TEST_COMPLETION_DATE")).STANDARD_DATE;
       }else if(row.getField("DATE_TAKEN")!==null && row.getField("DATE_TAKEN")!==undefined){
            finalDate = AppUtil.getDateObjByPattern(row.getField("DATE_TAKEN"), "MM/dd/yyyy").STANDARD_DATE;
       }else if(lasttestdate!==null && lasttestdate!==undefined){
            finalDate = AppUtil.getDateObjByPattern(lasttestdate, "yyyy-MM-dd").STANDARD_DATE;
       }else{
           finalDate = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9);
       }
        var firstName,lastName = null;
        if(row.getField("FULL_NAME")){
            firstName  = row.getField("FULL_NAME").toString().split(",")[1];
            lastName  = row.getField("FULL_NAME").toString().split(",")[0];
        }
        /*var schcode = row.getField("SCHOOL_CODE");
        var schcodeValue = null;
        if(schcode.indexOf('(') >= 1) {
           schcodeValue = schcode.substring(schcode.indexOf("(")+1,schcode.length()-2);
        } else {
           schcodeValue = schcode;//Redwood High School (300) 30
        }*/

        if(row.getField("SCHOOL_CODE")){
         var schoolName = row.getField("SCHOOL_CODE");
         var schoolId = schoolName.split("(").pop().replace(')', '');
         var schName = schoolName.split("(")[0];
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
                    record.REPORTING_PERIOD = hierarchy.REPORTING_PERIOD;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = finalDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("SASID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = row.getField("SASID");
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = row.getField("SASID");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(firstName,row.getField('STUDENT_FIRST_NAME'));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME =  _util.coalesce(lastName,row.getField('STUDENT_LAST_NAME'));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = birthDateObject ? _util.coalesce(birthDateObject.MONTH, null) : null;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = birthDateObject ? _util.coalesce(birthDateObject.DAY, null) : null;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = birthDateObject ? _util.coalesce(birthDateObject.YEAR, null) : null;
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(schoolId, row.getField("SCHOOL_CODE"), schName, row.getField("SCHOOL_NAME"),row.getField("SCHOOL_STATE_ID"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(schoolId, row.getField("SCHOOL_CODE"), schName, row.getField("SCHOOL_NAME"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"),schoolId, row.getField("SCHOOL_CODE"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"), schName);
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
        var admin = {};

        var staffID = _util.trim(row.getField("STAFF_ID"));
        admin.DISTRICT_STAFF_ID = staffID;

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var subject = subjectDecode[row.getField("SUBJECT")];

        // If subject column is present then it will execute if condition
        if((subject !== null || subject !== undefined) && (subject == testNumber.split("_")[2])) {
           var scaleScore = row.getField("VERTICAL_SCALE_SCORE");
           var target = row.getField("TARGET");
           var lexile_quantile = row.getField("LEXILE_QUANTILE_MEASURE") === null ? null : row.getField("LEXILE_QUANTILE_MEASURE").toString().replace("L","").replace("Q","").replace("BR","").replace("EM","");
           var lexile_quantileLower = row.getField("LOWER_RANGE") === null ? null : row.getField("LOWER_RANGE").toString().replace("L","").replace("Q","").replace("EM","").replace("BR","");
           var lexile_quantileUpper = row.getField("UPPER_RANGE") === null ? null : row.getField("UPPER_RANGE").toString().replace("L","").replace("Q","").replace("EM","").replace("BR","");
           var performanceLevelDescription = row.getField("PERFORMANCE_LEVEL_DESCRIPTION") ? row.getField("PERFORMANCE_LEVEL_DESCRIPTION") : row.getField("ACHIEVEMENT_LEVEL") ? row.getField("ACHIEVEMENT_LEVEL") : null;
           var sem = row.getField("SCALE_SCORE_STANDARD_ERROR");

        }        // if the subject name is mentioned in file name then it will execute else condition
        else
        {
           var scaleScore = row.getField("SBAC_" + testMetadata.CODE + "_SCALE_SCORE");
           var lexile_quantile = row.getField("SBAC_" + testMetadata.CODE + "_LEXILE_QUANTILE_MEASURE") === null ? null : row.getField("SBAC_" +testMetadata.CODE + "_LEXILE_QUANTILE_MEASURE").toString().replace("L","").replace("Q","").replace("BR","").replace("EM","");
           var lexile_quantileLower = row.getField("LOWER_RANGE") === null ? null : row.getField("LOWER_RANGE").toString().replace("L","").replace("Q","").replace("EM","").replace("BR","");
           var lexile_quantileUpper = row.getField("UPPER_RANGE") === null ? null : row.getField("UPPER_RANGE").toString().replace("L","").replace("Q","").replace("EM","").replace("BR","");
           var performanceLevelDescription = row.getField("SBAC_" + testMetadata.CODE + "_PERFORMANCE");
           var sem = row.getField("SBAC_" + testMetadata.CODE + "_SCALE_SCORE_STANDARD_ERROR");
        }

        // Check for key fields and do not map score and exit if conditions met.
        if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" || scaleScore === "Insufficient to score" || scaleScore === "Invalidated" || scaleScore === ".")
         && (performanceLevelDescription === null || performanceLevelDescription === undefined || _util.trim(performanceLevelDescription) === "--" || _util.trim(performanceLevelDescription) === "" || performanceLevelDescription === "Insufficient to score" || performanceLevelDescription === "Invalidated" || performanceLevelDescription === "Nonparticipant" || performanceLevelDescription === "Participant No Score" ))
         {
            return null;
        }


    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	if(scaleScore != null){
    	scaleScore = scaleScore.toString().replace(",","");
    	}
        if (!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
        if(!isNaN(target) && (target !== ".")){
            score["TEST_GROWTH_TARGET_1"] = target;
        }
    	score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[performanceLevelDescription].PASS_IND;
    	score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[performanceLevelDescription].DESC;
    	score["TEST_PRIMARY_RESULT_CODE"] =  row.getField("ACHIEVEMENT_LEVEL") ? row.getField("ACHIEVEMENT_LEVEL") : performanceLevelDecode[performanceLevelDescription].CODE;
    	score["TEST_READING_LEVEL"] = lexile_quantile;
        score["TEST_LOWER_BOUND"] = lexile_quantileLower;
        score["TEST_UPPER_BOUND"] = lexile_quantileUpper;
        if(!isNaN(sem)){
            score["TEST_STANDARD_ERROR"] = sem;
        }


        return score;
    }

    function mapStrandScore(row, testMetadata){
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;

        var perfScore = row.getField(testMetadata.FIELD+"_PERFORMANCE");

        // Check for key fields and do not map score and exit if conditions met.
        if(perfScore === null || perfScore === undefined || _util.trim(perfScore) === "--" || _util.trim(perfScore) === "" || perfScore === "Insufficient to score" ||perfScore === "Invalidated") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = perfScore;

        score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[perfScore].DESC;
        score["TEST_PRIMARY_RESULT_CODE"] =  performanceLevelDecode[perfScore].CODE;
        score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[perfScore].PASS_IND;

        return score;
    }

    function mapCTAAScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField("CTAA_"+testMetadata.FIELD+ "_SCALE_SCORE");
        var performanceLevelDescription = row.getField("CTAA_"+testMetadata.FIELD+ "_PERFORMANCE");
        var sem = row.getField("CTAA_"+testMetadata.FIELD+ "_SCALE_SCORE_STANDARD_ERROR");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
    	scaleScore = scaleScore.toString().replace(",","");
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
        }
    	score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[performanceLevelDescription].PASS_IND;
    	score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[performanceLevelDescription].DESC;
    	score["TEST_PRIMARY_RESULT_CODE"] =  performanceLevelDecode[performanceLevelDescription].CODE;
        if(!isNaN(sem)){
            score["TEST_STANDARD_ERROR"] = sem;
        }


        return score;
    }

    function mapCTASScaledScore(row, testMetadata) {
       var score = {};
       var testNumber = testMetadata.TEST + testMetadata.CODE;

       var scaleScore = row.getField("SBAC_" + testMetadata.CODE + "_SCALE_SCORE" );
       var itemPossible = row.getField("SBAC_"+ testMetadata.CODE + "_POINTS_POSSIBLE");
       var performanceLevelDescription = row.getField("SBAC_" + testMetadata.CODE + "_PERFORMANCE");

           // Check for key fields and do not map score and exit if conditions met.
       if(scaleScore === null || scaleScore === undefined ) {
          return null;
       }

           // Set score fields
       score["TEST_NUMBER"] = testNumber;
       score["TEST_SCORE_TEXT"] = scaleScore;
       if(!isNaN(scaleScore)){
          score["TEST_SCORE_VALUE"] = scaleScore;
          score["TEST_SCALED_SCORE"] = scaleScore;
       }
       score["TEST_ITEMS_POSSIBLE"] = itemPossible;
       score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[performanceLevelDescription].PASS_IND;
       score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[performanceLevelDescription].DESC;
       return score;
    }

    function mapCTASStrandScore(row, testMetadata) {
       var score = {};
       var testNumber = testMetadata.TEST + testMetadata.CODE;

       var scaleScore = row.getField(testMetadata.FIELD + "_SCORE" );
       var itemPossible = row.getField(testMetadata.FIELD + "_POINTS_POSSIBLE");

       // Check for key fields and do not map score and exit if conditions met.
       if(scaleScore === null || scaleScore === undefined ) {
          return null;
       }

       // Set score fields
       score["TEST_NUMBER"] = testNumber;
       score["TEST_SCORE_TEXT"] = scaleScore;
       if(!isNaN(scaleScore)){
          score["TEST_SCORE_VALUE"] = scaleScore;
          score["TEST_SCALED_SCORE"] = scaleScore;
       }
       score["TEST_ITEMS_POSSIBLE"] = itemPossible;

    return score;
    }

    function mapIABScore (row, testMetadata) {
           var score = {};
           var testNumber = testMetadata.TEST + testMetadata.CODE;
            subType = row.getField("ASSESSMENT_SUB_TYPE")
            assessmentName = row.getField("ASSESSMENT_NAME")

           if (subType === null || assessmentName === null) {
               return null;
               }

           if ((subType !==null && subType.toString().indexOf("IAB") !== -1) && assessmentName !==null && (assessmentName.toString().indexOf("ELA - Revision") !== -1)) {
                testNumber = testNumber + "_" + row.getField("GRADE") + "_REV_ELA"
           }else if ((subType !==null && subType.toString().indexOf("IAB") !== -1) && assessmentName !==null && (assessmentName.toString().indexOf("ELA - Research") !== -1)) {
                testNumber = testNumber + "_" + row.getField("GRADE") + "_RES_ELA"
           }

           var scaleScore = row.getField("SCALE_SCORE");
           var achlevel = row.getField("ACHIEVEMENT_LEVEL")

           // Check for key fields and do not map score and exit if conditions met.
           if(scaleScore === null || scaleScore === undefined ) {
              return null;
           }

           // Set score fields
           score["TEST_NUMBER"] = testNumber;
           score["TEST_SCORE_TEXT"] = scaleScore;
           if(!isNaN(scaleScore)){
              score["TEST_SCORE_VALUE"] = scaleScore;
              score["TEST_SCALED_SCORE"] = scaleScore;
           }
           score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[achlevel].PASS_IND;
           score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[achlevel].DESC;
           score["TEST_PRIMARY_RESULT_CODE"] = achlevel;

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
         var lasttestdate1 = srcRecord.getField("LAST_TEST_DATE");
               if ( lasttestdate1!==null && lasttestdate1!==undefined && lasttestdate1!== '')
               {
            if (lasttestdate1.indexOf('T') > -1)
            {
            lasttestdate1 = lasttestdate1.split('T')[0];
            } else {
            lasttestdate1 = lasttestdate1.split(' ')[0];
            }
              }
       var finalDate1 = null;
       if(srcRecord.getField("DATE_TAKEN")!==null && srcRecord.getField("DATE_TAKEN")!==undefined && srcRecord.getField("DATE_TAKEN").indexOf("/") ){
            finalDate1 = AppUtil.getMonthFollowedByDay(srcRecord.getField("DATE_TAKEN")).STANDARD_DATE;
       }else if(srcRecord.getField("DATE_TAKEN")!==null && srcRecord.getField("DATE_TAKEN")!==undefined && srcRecord.getField("DATE_TAKEN").indexOf("-") ){
            finalDate1 = AppUtil.getMonthFollowedByDay(srcRecord.getField("DATE_TAKEN")).STANDARD_DATE;
       }else if(lasttestdate1!==null && lasttestdate1!==undefined){
            finalDate1 = AppUtil.getDateObjByPattern(lasttestdate1, "yyyy-MM-dd").STANDARD_DATE;
       }else {
       finalDate1 = "05/15/" + hierarchy.SCHOOL_YEAR.toString().substring(5,9);
       }
       var sigName = signature.getFormat().getFormatName();
       assessmentAdminKey = assessmentAdminKey + "_" + finalDate1 + "_" + sigName.split("_")[1] ;
       return assessmentAdminKey;
    }

    return module;
}());