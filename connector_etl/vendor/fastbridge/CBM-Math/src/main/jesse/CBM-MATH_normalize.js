var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CBM-Math";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;
  /**
    *
    * Admin period values to generate separate admin keys
    */
    var adminPeriods = [
        "Fall",
        "Winter",
        "Spring"
    ];
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
		}n
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
        {TEST: "CBM_MATH", CODE:"AUTOL1", FIELD:"AUTO_L1_GOM_", MAP_FUNCTION: mapScaledScore},
        {TEST: "CBM_MATH", CODE:"AUTOL2", FIELD:"AUTO_L2_GOM_", MAP_FUNCTION: mapScaledScore},
        {TEST: "CBM_MATH", CODE:"AUTOL3", FIELD:"AUTO_L3_GOM_", MAP_FUNCTION: mapScaledScore},

        {TEST: "CBM_MATH", CODE:"PROCL2", FIELD:"PROC_L2_GOM_", MAP_FUNCTION: mapScaledScore},
        {TEST: "CBM_MATH", CODE:"PROCL3", FIELD:"PROC_L3_GOM_", MAP_FUNCTION: mapScaledScore},
        {TEST: "CBM_MATH", CODE:"PROCL4", FIELD:"PROC_L4_GOM_", MAP_FUNCTION: mapScaledScore},
        {TEST: "CBM_MATH", CODE:"PROCL5", FIELD:"PROC_L5_GOM_", MAP_FUNCTION: mapScaledScore},
        {TEST: "CBM_MATH", CODE:"PROCL6", FIELD:"PROC_L6_GOM_", MAP_FUNCTION: mapScaledScore},

        {TEST: "CBM_MATH", CODE:"CAP", FIELD:"CBMMATH_CAP_", MAP_FUNCTION: mapScaledScore},

        //GROWTH SCORES
        {TEST: "CBM_MATH", CODE:"AUTOL1_FWG", FIELD1:"AUTO_L1_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"AUTOL2_FWG", FIELD1:"AUTO_L2_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"AUTOL3_FWG", FIELD1:"AUTO_L3_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},

        {TEST: "CBM_MATH", CODE:"PROCL2_FWG", FIELD1:"PROC_L2_GOM_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL3_FWG", FIELD1:"PROC_L3_GOM_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL4_FWG", FIELD1:"PROC_L4_GOM_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL5_FWG", FIELD1:"PROC_L5_GOM_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL6_FWG", FIELD1:"PROC_L6_GOM_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},

        {TEST: "CBM_MATH", CODE:"AUTOL1_FSG", FIELD1:"AUTO_L1_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"AUTOL2_FSG", FIELD1:"AUTO_L2_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"AUTOL3_FSG", FIELD1:"AUTO_L3_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},

        {TEST: "CBM_MATH", CODE:"PROCL2_FSG", FIELD1:"PROC_L2_GOM_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL3_FSG", FIELD1:"PROC_L3_GOM_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL4_FSG", FIELD1:"PROC_L4_GOM_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL5_FSG", FIELD1:"PROC_L5_GOM_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL6_FSG", FIELD1:"PROC_L6_GOM_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},

        {TEST: "CBM_MATH", CODE:"AUTOL1_WSG", FIELD1:"AUTO_L1_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"AUTOL2_WSG", FIELD1:"AUTO_L2_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"AUTOL3_WSG", FIELD1:"AUTO_L3_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},

        {TEST: "CBM_MATH", CODE:"PROCL2_WSG", FIELD1:"PROC_L2_GOM_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL3_WSG", FIELD1:"PROC_L3_GOM_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL4_WSG", FIELD1:"PROC_L4_GOM_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL5_WSG", FIELD1:"PROC_L5_GOM_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"PROCL6_WSG", FIELD1:"PROC_L6_GOM_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore},

        {TEST: "CBM_MATH", CODE:"AUTOL3_FMG", FIELD1:"AUTO_L1_", FIELD2:"_FROM_FALL_TO_FEB-MAR", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"AUTOL3_FMG", FIELD1:"AUTO_L2_", FIELD2:"_FROM_FALL_TO_FEB-MAR", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"AUTOL3_FMG", FIELD1:"AUTO_L3_", FIELD2:"_FROM_FALL_TO_FEB-MAR", MAP_FUNCTION: mapGrowthScore},

        {TEST: "CBM_MATH", CODE:"CAP_FWG", FIELD1:"CBMMATH_CAP_", FIELD2:"_FROM_FALL_TO_WINTER", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"CAP_FSG", FIELD1:"CBMMATH_CAP_", FIELD2:"_FROM_FALL_TO_SPRING", MAP_FUNCTION: mapGrowthScore},
        {TEST: "CBM_MATH", CODE:"CAP_WSG", FIELD1:"CBMMATH_CAP_", FIELD2:"_FROM_WINTER_TO_SPRING", MAP_FUNCTION: mapGrowthScore}

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
     //TODO add any additional decodes
     var gradeDecode = {
            "Kindergarten": "KG",
            "One" : "01",
            "Two" : "02",
            "Three" : "03",
            "Four" : "04",
            "Five" : "05",
            "Six" : "06",
            "Seven" : "07",
            "Eight" : "08",
            "Nine" : "09",
            "Ten" : "10",
            "Eleven": "11",
            "Twelve": "12",
            "Primary" : "PK"
           ,"" : null
           ,null : null
        };

    var primaryDecode = {
        "VL"     :   "Very Low Risk",
        "CP"     :   "Very Low Risk",
        "LR"     :   "Low Risk",
        "highRisk"     :   "High Risk",
        "someRisk"     :   "Some Risk",
        "lowRisk"     :   "Low Risk",
        "Low Risk"     :   "Low Risk",
        "Some Risk"     :   "Some Risk",
        "Very Low Risk"     :   "Very Low Risk",
        "High Risk"     :   "High Risk",
        "EX"     : "Exceeds",
        "EC"     : "Exceeds",
        "AD"    : "AD",
        "OT"    : "On Track",
        null    : null,
        ""      : null
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
        // Map a normalized record for different period
        adminPeriods.forEach(function(period){
            var record = mapNormalizedRecord(signature, hierarchy, row, period);
            AppUtil.nullSafePush(normalizedRecords, record);
        });
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
    function mapNormalizedRecord(signature, hierarchy, row, period) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map normalized admin fields
        record = mapNormalizedAdminFields(signature, hierarchy, row, period);

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        //Map score fields for each expected score mapping
        scoresToMap.forEach(function(testMetadata) {
            try {
                var score = (testMetadata.MAP_FUNCTION)(row, testMetadata, period, signature);
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
    function mapNormalizedAdminFields(signature, hierarchy, row, period) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = parseDate(row.getField("STUDENT_BIRTHDATE"));
        var springDate = _util.coalesce(row.getField("SPRING_AUTO_L1_GOM_FINAL_DATE"),row.getField("SPRING_AUTO_L2_GOM_FINAL_DATE"),row.getField("SPRING_AUTO_L3_GOM_FINAL_DATE"),"");
        var winterDate = _util.coalesce(row.getField("WINTER_AUTO_L1_GOM_FINAL_DATE"),row.getField("WINTER_AUTO_L2_GOM_FINAL_DATE"),row.getField("WINTER_AUTO_L3_GOM_FINAL_DATE"),
                        row.getField("WINTER_FEB-MAR_AUTO_L1_GOM_FINAL_DATE"),row.getField("WINTER_FEB-MAR_AUTO_L2_GOM_FINAL_DATE"),row.getField("WINTER_FEB-MAR_AUTO_L3_GOM_FINAL_DATE"),"");
        var fallDate = _util.coalesce(row.getField("FALL_AUTO_L1_GOM_FINAL_DATE"),row.getField("FALL_AUTO_L2_GOM_FINAL_DATE"),row.getField("FALL_AUTO_L3_GOM_FINAL_DATE"),"");
        if(period === "Fall") {
            recentDate = fallDate;
        } else if(period === "Winter") {
            recentDate = winterDate;
        } else if(period ==="Spring") {
            recentDate = springDate;
        }


        var testDateObject = parseDate(recentDate);
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row, period);
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
                    record.REPORTING_PERIOD = period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, '05/15/' + hierarchy.SCHOOL_YEAR.substring(0,4));
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STUDENT_ID")));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STATE_STUDENT_ID")));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(AppUtil.extractNumerical(row.getField("STUDENT_ID")));
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
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"),"").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.trim(gradeDecode[row.getField('GRADE')]);
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"),row.getField("DISTRICT"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"));
                     break;
                case "SCHOOL_NAME":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NAME"));

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

        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
        }
        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    function mapScaledScore(row, testMetadata, period, signature) {
        var score = {};
        var grade = gradeDecode[row.getField("GRADE")];
        var Signature  = signature.getFormat().getFormatName()
        if(signature.getFormat().getFormatName() === 'CBM_MATH_short' && grade === "06" && period === "WINTER") {
            var testNumber = testMetadata.TEST + "_" + period + "_FEB-MAR"+"_" +testMetadata.CODE;
            var scaleScore = row.getField(period + "_FEB-MAR" + "_" + testMetadata.FIELD + "IC_PER_MINUTE");
            var itemsAttempted = row.getField(period +"_FEB-MAR" + "_" +testMetadata.FIELD +"ITEMS_ATTEMPTED");
            var itemsPossible = row.getField(period +"_FEB-MAR" + "_" +testMetadata.FIELD +"ITEMS_CORRECT");
            var standardError = row.getField(period +"_FEB-MAR" + "_" +testMetadata.FIELD +"ERROR(ITEMS_ATTEMPTED_-_ITEMS_CORRECT)");
		    var primary =  row.getField(period + "_FEB-MAR" + "_" +testMetadata.FIELD +"RISK_LEVEL");
		    var percentileSchool = row.getField(period +"_FEB-MAR" + "_" +testMetadata.FIELD +"PERCENTILE_AT_SCHOOL");
		    var percentileLEA = row.getField(period + "_FEB-MAR" + "_" +testMetadata.FIELD +"PERCENTILE_AT_LEA");
		    var percentileNation = row.getField(period + "_FEB-MAR" + "_" +testMetadata.FIELD +"PERCENTILE_AT_NATION");
		    var uniqueDate = row.getField(period + "_FEB-MAR" + "_" + testMetadata.FIELD +"FINAL_DATE");
        }
        else{
        period = period.toUpperCase();
        var testNumber = testMetadata.TEST + "_" + period + "_" +testMetadata.CODE;
        var scaleScore = row.getField(period + "_" + testMetadata.FIELD + "IC_PER_MINUTE");
        var itemsAttempted = row.getField(period + "_" +testMetadata.FIELD +"ITEMS_ATTEMPTED");
        var itemsPossible = row.getField(period + "_" +testMetadata.FIELD +"ITEMS_CORRECT");
        var standardError = row.getField(period + "_" +testMetadata.FIELD +"ERROR(ITEMS_ATTEMPTED_-_ITEMS_CORRECT)");
		var primary =  row.getField(period + "_" +testMetadata.FIELD +"RISK_LEVEL");
		var percentileSchool = row.getField(period + "_" +testMetadata.FIELD +"PERCENTILE_AT_SCHOOL");
		var percentileLEA = row.getField(period + "_" +testMetadata.FIELD +"PERCENTILE_AT_LEA");
		var percentileNation = row.getField(period + "_" +testMetadata.FIELD +"PERCENTILE_AT_NATION");
		var uniqueDate = row.getField(period + "_" + testMetadata.FIELD +"FINAL_DATE");
        }
        // We're rejecting the row if test admin date is not present in the row.
        if(period === "FALL") {
            if(!_util.coalesce(row.getField("FALL_AUTO_L1_GOM_FINAL_DATE"),row.getField("FALL_AUTO_L2_GOM_FINAL_DATE"),row.getField("FALL_AUTO_L3_GOM_FINAL_DATE"),row.getField("FALL_CBMMATH_CAP_FINAL_DATE"),
            row.getField("FALL_PROC_L2_GOM_FINAL_DATE"),row.getField("FALL_PROC_L3_GOM_FINAL_DATE"),row.getField("FALL_PROC_L4_GOM_FINAL_DATE"),row.getField("FALL_PROC_L5_GOM_FINAL_DATE"),row.getField("FALL_PROC_L6_GOM_FINAL_DATE"),"")) {
                return null;
            }
        } else if(period === "WINTER") {
            if(!_util.coalesce(row.getField("WINTER_AUTO_L1_GOM_FINAL_DATE"),row.getField("WINTER_AUTO_L2_GOM_FINAL_DATE"),row.getField("WINTER_AUTO_L3_GOM_FINAL_DATE"),
            row.getField("WINTER_FEB-MAR_AUTO_L1_GOM_FINAL_DATE"),row.getField("WINTER_FEB-MAR_AUTO_L2_GOM_FINAL_DATE"),row.getField("WINTER_FEB-MAR_AUTO_L3_GOM_FINAL_DATE"),row.getField("WINTER_CBMMATH_CAP_FINAL_DATE"),
            row.getField("WINTER_PROC_L2_GOM_FINAL_DATE"),row.getField("WINTER_PROC_L3_GOM_FINAL_DATE"),row.getField("WINTER_PROC_L4_GOM_FINAL_DATE"),row.getField("WINTER_PROC_L5_GOM_FINAL_DATE"),row.getField("WINTER_PROC_L6_GOM_FINAL_DATE"),"")) {
                return null;
            }
        } else if(period ==="SPRING") {
            if(!_util.coalesce(row.getField("SPRING_AUTO_L1_GOM_FINAL_DATE"),row.getField("SPRING_AUTO_L2_GOM_FINAL_DATE"),row.getField("SPRING_AUTO_L3_GOM_FINAL_DATE"),row.getField("SPRING_CBMMATH_CAP_FINAL_DATE"),
            row.getField("SPRING_PROC_L2_GOM_FINAL_DATE"),row.getField("SPRING_PROC_L3_GOM_FINAL_DATE"),row.getField("SPRING_PROC_L4_GOM_FINAL_DATE"),row.getField("SPRING_PROC_L5_GOM_FINAL_DATE"),row.getField("SPRING_PROC_L6_GOM_FINAL_DATE"),"")) {
                return null;
            }
        }
       //  Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
            return null;
        }
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore; //Changes as per the requirements of the ticket UIHN-44932
    	scaleScore = parseFloat(scaleScore);
        if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = _util.coalesce(itemsPossible, scaleScore); //Changes as per the requirements of the ticket UIHN-44932
            score["TEST_SCALED_SCORE"] = _util.coalesce(itemsPossible, scaleScore); //Changes as per the requirements of the ticket UIHN-44932
        }
        score["TEST_ITEMS_ATTEMPTED"] = parseInt(itemsAttempted);
        score["TEST_ITEMS_POSSIBLE"] = parseInt(itemsPossible);
        score["TEST_STANDARD_ERROR"] = standardError;
    	score["TEST_PRIMARY_RESULT_CODE"] = primary;
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[primary];
        score["TEST_SECONDARY_RESULT_CODE"] = "SCH";
        score["TEST_SECONDARY_RESULT"] = percentileSchool;
        score["TEST_TERTIARY_RESULT_CODE"] = "LEA";
        score["TEST_TERTIARY_RESULT"] = percentileLEA;
        score["TEST_QUATERNARY_RESULT_CODE"] = "NAT";
        score["TEST_QUATERNARY_RESULT"] = percentileNation;
        score["TEST_PERCENTILE_SCORE"] = parseInt(percentileNation);
        score["TEST_SCORE_ATTRIBUTES"] = uniqueDate;

        return score;
    }

    function mapGrowthScore(row, testMetadata, period, signature) {
        var score = {};
        var grade = gradeDecode[row.getField("GRADE")];
        var Signature  = signature.getFormat().getFormatName()
        if(signature.getFormat().getFormatName() === 'CBM_MATH_short' && grade === "06" && period === "WINTER") {
            var testNumber = testMetadata.TEST + "_" + period + "_FEB-MAR" + "_" + testMetadata.CODE;
            var growthScore = row.getField(period + "_FEB-MAR" + "_" + testMetadata.FIELD+"GROWTH_SCORE"+testMetadata.FIELD_2);
            var growthSchool = row.getField(period +"_FEB-MAR" + "_" + testMetadata.FIELD+"SCHOOL_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
            var growthDistrict = row.getField(period +"_FEB-MAR" + "_" + testMetadata.FIELD+"DISTRICT_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
            var growthNational = row.getField(period +"_FEB-MAR" + "_" + testMetadata.FIELD+"NATIONAL_GROWTH_PERCENTILE"+testMetadata.FIELD_2);
            var growthStart = row.getField(period + "_FEB-MAR" + "_" + testMetadata.FIELD+"GROWTH_PERCENTILE_BY_START_SCORE"+testMetadata.FIELD_2);
        }
        else{
        period = period.toUpperCase();
        var testNumber = testMetadata.TEST + "_" + period + "_" + testMetadata.CODE;
        var growthScore = row.getField(period + "_" + testMetadata.FIELD1+"GROWTH_SCORE"+testMetadata.FIELD2);
        var growthSchool = row.getField(period + "_" + testMetadata.FIELD1+"SCHOOL_GROWTH_PERCENTILE"+testMetadata.FIELD2);
        var growthDistrict = row.getField(period + "_" + testMetadata.FIELD1+"DISTRICT_GROWTH_PERCENTILE"+testMetadata.FIELD2);
        var growthPercentile = row.getField(period + "_" + testMetadata.FIELD1+"NATIONAL_GROWTH_PERCENTILE"+testMetadata.FIELD2);
        var growthStart = row.getField(period + "_" + testMetadata.FIELD1+"GROWTH_PERCENTILE_BY_START_SCORE"+testMetadata.FIELD2);
        }
        // Check for key fields and do not map score and exit if conditions met.
        if(growthScore === null || growthScore === undefined || _util.trim(growthScore) === "--" || _util.trim(growthScore) === "") {
            return null;
        }
        if(growthPercentile!==undefined && growthPercentile!==null){
            growthPercentile = parseInt(growthPercentile);
        }
        if(growthStart!==undefined && growthStart!==null){
            growthStart = parseInt(growthStart);
        }
        if(growthSchool!==undefined && growthSchool!==null){
            growthSchool = parseInt(growthSchool);
        }
        if(growthDistrict!==undefined && growthDistrict!==null){
            growthDistrict = parseInt(growthDistrict);
        }

    	// Set score fields
    	growthScore = parseFloat(growthScore);
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = growthScore;
        score["TEST_GROWTH_RESULT"] = growthScore;
        if(!isNaN(growthScore)){
            score["TEST_SCORE_VALUE"] = growthScore;
            score["TEST_SCALED_SCORE"] = growthScore;
        }
    	score["TEST_PERCENTILE_SCORE"] = growthPercentile;
    	score["TEST_GROWTH_PERCENTILE"] = growthPercentile;
    	score["TEST_GROWTH_TARGET_1"] = growthStart;
    	score["TEST_GROWTH_TARGET_2"] = growthSchool;
    	score["TEST_GROWTH_TARGET_3"] = growthDistrict;

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
            // Sending different periods to generate assessment admin key
            for(var i=0; i<adminPeriods.length; i++) {
                var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one, adminPeriods[i]);
                var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two, adminPeriods[i]);
                if(assessmentAdminKey_one === assessmentAdminKey_two) {
                    return 1;
                } else {
                    return -1;
                }
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
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord, period) {
        var assessmentAdminKey = null;
        // Set base assessment admin key information based on period
        if(period===undefined){
             assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";
        }
        else{
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${period}";
        }
        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        // Add the Final date
        if(period === "FALL") {
            if(_util.coalesce(srcRecord.getField("FALL_AUTO_L1_GOM_FINAL_DATE"),srcRecord.getField("FALL_AUTO_L2_GOM_FINAL_DATE"),srcRecord.getField("FALL_AUTO_L3_GOM_FINAL_DATE"))) {
                assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("FALL_AUTO_L1_GOM_FINAL_DATE"),srcRecord.getField("FALL_AUTO_L2_GOM_FINAL_DATE"),srcRecord.getField("FALL_AUTO_L3_GOM_FINAL_DATE"),"")+"_"+ srcRecord.getField("SCHOOL_NAME")+ "_"+srcRecord.getField("STUDENT_ID")+ "_" + srcRecord.getField("GRADE");
            } else {
                // Default date for FALL
                assessmentAdminKey = assessmentAdminKey +  "_" + "09/15/" +"${hierarchy.SCHOOL_YEAR.substring(0,4)}"+"_"+ srcRecord.getField("SCHOOL_NAME")+ "_"+srcRecord.getField("STUDENT_ID")+ "_" + srcRecord.getField("GRADE");
            }
        } else if(period === "WINTER") {
            if(_util.coalesce(srcRecord.getField("WINTER_AUTO_L1_GOM_FINAL_DATE"),srcRecord.getField("WINTER_AUTO_L2_GOM_FINAL_DATE"),srcRecord.getField("WINTER_AUTO_L3_GOM_FINAL_DATE"),srcRecord.getField("WINTER_FEB-MAR_AUTO_L1_GOM_FINAL_DATE"),srcRecord.getField("WINTER_FEB-MAR_AUTO_L2_GOM_FINAL_DATE"),srcRecord.getField("WINTER_FEB-MAR_AUTO_L3_GOM_FINAL_DATE"))) {
                assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("WINTER_AUTO_L1_GOM_FINAL_DATE"),srcRecord.getField("WINTER_AUTO_L2_GOM_FINAL_DATE"),srcRecord.getField("WINTER_AUTO_L3_GOM_FINAL_DATE"),srcRecord.getField("WINTER_FEB-MAR_AUTO_L1_GOM_FINAL_DATE"),srcRecord.getField("WINTER_FEB-MAR_AUTO_L2_GOM_FINAL_DATE"),srcRecord.getField("WINTER_FEB-MAR_AUTO_L3_GOM_FINAL_DATE"),"")+"_"+srcRecord.getField("SCHOOL_NAME")+ "_"+srcRecord.getField("STUDENT_ID")+ "_" + srcRecord.getField("GRADE");
            } else {
                // Default date for WINTER
                assessmentAdminKey = assessmentAdminKey +  "_" + "01/15/" +"${hierarchy.SCHOOL_YEAR.substring(0,4)}"+"_"+ srcRecord.getField("SCHOOL_NAME")+ "_"+srcRecord.getField("STUDENT_ID")+ "_" + srcRecord.getField("GRADE");
            }
        } else if(period ==="SPRING") {
            if(_util.coalesce(srcRecord.getField("SPRING_AUTO_L1_GOM_FINAL_DATE"),srcRecord.getField("SPRING_AUTO_L2_GOM_FINAL_DATE"),srcRecord.getField("SPRING_AUTO_L3_GOM_FINAL_DATE"))) {
                assessmentAdminKey = assessmentAdminKey +  "_" + _util.coalesce(srcRecord.getField("SPRING_AUTO_L1_GOM_FINAL_DATE"),srcRecord.getField("SPRING_AUTO_L2_GOM_FINAL_DATE"),srcRecord.getField("SPRING_AUTO_L3_GOM_FINAL_DATE"),"")+"_"+srcRecord.getField("SCHOOL_NAME")+ "_"+srcRecord.getField("STUDENT_ID")+ "_" + srcRecord.getField("GRADE");
            } else {
                // Default date for SPRING
                assessmentAdminKey = assessmentAdminKey +  "_" + "05/15/"+"${hierarchy.SCHOOL_YEAR.substring(0,4)}" +"_"+ srcRecord.getField("SCHOOL_NAME")+ "_"+srcRecord.getField("STUDENT_ID")+ "_" + srcRecord.getField("GRADE");
            }
        }
        return assessmentAdminKey;
    }

        function parseDate(rawDate){

        var dateObj = {
            RAW_DATE : rawDate
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        };

        // Exit if no value is provided.
        if(_util.trim(_util.coalesce(rawDate, "")) === ""){
            return dateObj;
        }

        var formatter;

        if (rawDate.length >= 8 && rawDate.indexOf('/') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
        } else if (rawDate.length >= 8 && rawDate.indexOf('-') !== -1 ) {
            formatter = new java.text.SimpleDateFormat('MM-dd-yyyy');
        } else {
            formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
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

    return module;
}());