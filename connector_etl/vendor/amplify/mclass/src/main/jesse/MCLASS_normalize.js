var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "mclass";
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
     ***************************************************************************///MCLASS_DIBELS_RISK_INDI

     //TODO update scoresToMap
    var scoresToMap = [
        {TEST: "MCLASS_DIBELS", CODE:"_TRC_AM", FIELD: "ASSESSMENT_MEASURE", MAP_FUNCTION: mapTRCAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_COMP", FIELD: "COMPOSITE", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_PATHWAYACHIV", FIELD: "PATHWAYACHIEVED_COMPOSITE", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_FSF", FIELD: "FSF", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_LNF", FIELD: "LNF", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_PSF", FIELD: "PSF", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_NWF_CLS", FIELD: "NWF_CLS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_NWF_WWR", FIELD: "NWF_WWR", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DORF_ACCU", FIELD: "DORF_ACCURACY", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DORF_FLU", FIELD: "DORF_FLUENCY", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DORF_RET", FIELD: "DORF_RETELL", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DORF_ERR", FIELD: "DORF_ERRORS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DORF_RETQUA", FIELD: "DORF_RETELL_QUALITY", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DAZE", FIELD: "DAZE", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DAZE_CRT", FIELD: "DAZE_CORRECT", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DAZE_INCRT", FIELD: "DAZE_INCORRECT", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_VOC", FIELD: "VOCABULARY", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_SPELL", FIELD: "SPELLING", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_LAN", FIELD: "LAN", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_LTR_NMS", FIELD: "LETTER_NAMES", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_PHON_AWR", FIELD: "PHONEMIC_AWARENESS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_LTR_SNDS", FIELD: "LETTER_SOUNDS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DECO", FIELD: "DECODING", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_WORD_RD", FIELD: "WORD_READING", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_READ_ACCU", FIELD: "READING_ACCURACY", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_READ_FLU", FIELD: "READING_FLUENCY", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_ERR_RATE", FIELD: "ERROR_RATE", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_READ_COMP", FIELD: "READING_COMPREHENSION", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_CRCT_RESP", FIELD: "CORRECT_RESPONSES", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_INCRCT_RESP", FIELD: "INCORRECT_RESPONSES", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_RAN", FIELD: "RAN", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_RISK_INDI", FIELD: "RISK_INDICATOR", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_NOM_LET", FIELD: "ASSESSMENT_MEASURE_FLUIDEZ_EN_NOMBRAR_LETRAS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_SEG_FONE", FIELD: "ASSESSMENT_MEASURE_FLUIDEZ_EN_LA_SEGMENTATION_DE_FONEMAS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_PALA_SENTIDO", FIELD: "ASSESSMENT_MEASURE-FLUIDEZ_EN_LAS_PALABRAS_SIN_SENTIDO", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_LECT_ORAL", FIELD: "ASSESSMENT_MEASURE-FLUIDEZ_EN_LA_LECTURA_ORAL", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_LAS_PALABRAS", FIELD: "ASSESSMENT_MEASURE-FLUIDEZ_EN_EL_USO_DE_LAS_PALABRAS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_RELATO_ORAL", FIELD: "ASSESSMENT_MEASURE-FLUIDEZ_EN_EL_RELATO_ORAL", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_NOMBRAR_FNL", FIELD: "NOMBRAR_LETRAS_FNL", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_CONCIENC_FSS", FIELD: "CONCIENCIA_FONOLOGICA_FSS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_CONCIENC_QQ", FIELD: "CONCIENCIA_FONOLOGICA_QQ", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_SONI_FSL", FIELD: "SONIDOS_DE_LETRAS_FSL", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_SONI_FSLK", FIELD: "SONIDOS_DE_LETRAS_FSL_K_INICIO", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_DECODIFI_LSS", FIELD: "DECODIFICACION_LSS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_LECTU_FEP", FIELD: "LECTURA_DE_PALABRAS_FEP", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_FLUID_FLO", FIELD: "FLUIDEZ_EN_LA_LECTURA_FLO", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_PRECI_FLOP", FIELD: "PRECISION_EN_LA_LECTURA_FLO_PREC", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_COMPRE_COMCP", FIELD: "COMPRENSION_BASICA_CP", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_ORT", FIELD: "ORTOGRAFIA", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_LEN", FIELD: "LENGUAJE_ORAL", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_VOCA", FIELD: "VOCABULARIO", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_COCP", FIELD: "CORRECT_RESPONSES_CP", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_ICOCP", FIELD: "INCORRECT_RESPONSES_CP", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_ORAL", FIELD: "ORAL_LANGUAGE", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}
        ,{TEST: "MCLASS_DIBELS", CODE:"_PAB", FIELD: "PA_BLENDING_PA_B", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}

        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_OVR", FIELD: "ASSESSMENT_MEASURE_1_OVERALL_", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//TODO overall is its own score//Math COMPOSITE
        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_NI", FIELD: "ASSESSMENT_MEASURE_NUMBER_IDENTIFICATION", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//COMPONENT
        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_NF", FIELD: "ASSESSMENT_MEASURE_NUMBER_FACTS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//COMPONENT
        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_QD", FIELD: "ASSESSMENT_MEASURE_QUANTITY_DISCRIMINATION", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//COMPONENT
        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_CNT", FIELD: "ASSESSMENT_MEASURE_COUNTING", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//COMPONENT
        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_MN", FIELD: "ASSESSMENT_MEASURE_MISSING_NUMBER", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//COMPONENT
        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_NN", FIELD: "ASSESSMENT_MEASURE_NEXT_NUMBER", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//COMPONENT
        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_COMP", FIELD: "ASSESSMENT_MEASURE_COMPUTATION", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//COMPONENT
        ,{TEST: "MCLASS_DIBELS", CODE:"_AM_CP", FIELD: "ASSESSMENT_MEASURE_CONCEPTS", MAP_FUNCTION: mapMClassAssessmentMeasureOverallScore}//COMPONENT
        ,{TEST: "MCLASS_DIBELS", CODE:"", FIELD: "", MAP_FUNCTION: mapOverallScore}//COMPONENT






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

    var proficiencyDecode = {
        "Far Below Proficient" : 1,
        "Below Proficient" : 2,
        "Above Proficient" : 3,
        "Proficient" : 4
      };

    var perfLevels =
        {
            "": "--",
            "Well Below Benchmark": "WB",
            "Below Benchmark": "BB",
            "Above Benchmark": "AB",
            "Benchmark": "B",
            "At Benchmark": "B",
            "At or Above Benchmark": "AAB",
            "Not Determined": "ND",
            "Red" : "R",
            "Yellow" : "Y",
            "Pass" : "P",
            "Green" : "G",
            "Benchmark" : "BM",
            "Strategic" : "STRAT",
            "Intensive" : "INT",
            "Deficit" : "DEF",
            "Emerging" : "EMER",
            "Established" : "EST"
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
        var studentName = row.getField("STUDENT_NAME");
        if(studentName !== null && studentName !== undefined) {
            studentName = studentName.split(",",2);
            var lastName = studentName[0];
            var firstName = studentName[1].trim();
        }
        var birthDateObject = {
            RAW_DATE: null
            , MONTH: null
            , DAY: null
            , YEAR: null
            , STANDARD_DATE: null
        };
        var dateOfBirth = row.getField("DATE_OF_BIRTH");
        if(dateOfBirth !== null && dateOfBirth !== undefined) {
            birthDateObject = parseDate(dateOfBirth);
        }
        var dataFilePeriod = row.getField("PERIOD");
        var period;

        switch (dataFilePeriod) {
            case "BOY->MOY":
            case "MOY":
                period = "MOY";
                break;
            case "MOY->EOY":
            case "After EOY":
            case "EOY":
                period = "EOY";
                break;
            case "BOY":
                period = "BOY";
                break;
            default:
                period = dataFilePeriod || hierarchy.REPORTING_PERIOD;
                break;
        }

        var mainDate = row.getField("CLIENT_DATE");
        if (mainDate !== null && mainDate !== "" && mainDate !== undefined) {
            if (mainDate.length >= 8 && mainDate.indexOf("-") >= 1 && mainDate.split("-")[0].length === 4) {
                mainDate = AppUtil.getDateObjByPattern(mainDate, "yyyy-MM-dd").STANDARD_DATE;
            } else if (mainDate.length >= 8 && mainDate.indexOf("/") >= 1 && mainDate.split("/")[0].length === 1) {
                mainDate = AppUtil.getDateObjByPattern(mainDate, "M/dd/yyyy").STANDARD_DATE;
            } else if (mainDate.length >= 8 && mainDate.indexOf("/") >= 1 && mainDate.split("/")[0].length === 2) {
                mainDate = AppUtil.getDateObjByPattern(mainDate, "MM/dd/yyyy").STANDARD_DATE;
            } else if (mainDate.length >= 8 && mainDate.indexOf("/") >= 1 && mainDate.split("/")[0].length === 2) {
                mainDate = AppUtil.getDateObjByPattern(mainDate, "dd/MM/yyyy").STANDARD_DATE;
            } else {
                mainDate = AppUtil.getDateObjByPattern(mainDate, "dd-MM-yyyy").STANDARD_DATE;
            }
        }

        var testDate;
        if(period === "BOY") {
            testDate = '09/15/' + hierarchy.SCHOOL_YEAR.substring(0, 4);
        } else if(period === "MOY") {
            testDate = '01/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
        } else {
            testDate = '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9);
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
                    record.REPORTING_PERIOD = period;
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(AppUtil.getDateObjByPattern(row.getField("TEST_ADMIN_DATE"), "MM/dd/yyyy").STANDARD_DATE, mainDate, testDate);
                    break;

                //Student Information
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_STATE_ID"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = row.getField("STUDENT_LOCAL_ID");
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(firstName, row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(lastName, row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= row.getField('STUDENT_MIDDLE_NAME');
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"), "DISTRICT");
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_STATE_ID":
                    record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_STATE_ID"),row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"), row.getField("SCHOOL_NAME"));;
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
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

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
     function mapTRCAssessmentMeasureOverallScore(row, testMetadata) {
     // No scores present for TRC
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var proficiencyLevel = row.getField("TRC_PROFICIENCY_LEVEL");
        var performanceLevel = row.getField("BOOK_PERFORMANCE_LEVEL");
         if(proficiencyLevel === null || proficiencyLevel === undefined || _util.trim(proficiencyLevel) === "--" || _util.trim(proficiencyLevel) === "") {
             return null;
         }
        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_PRIMARY_RESULT_CODE"] = proficiencyDecode[proficiencyLevel];
        score["TEST_PRIMARY_RESULT"] = proficiencyLevel;
        return score;
     }

     function mapOverallScore(row, testMetadata) {

        var score = {};
        var testNumber = testMetadata.TEST + "_" + getSubjectName(row);
        var scaleScore = row.getField("OVERALL_SCALESCORE");
        var measure = row.getField("MEASURE");

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
         score["TEST_SCORE_ATTRIBUTES"] = measure;

        return score;
     }

     function mapMClassAssessmentMeasureOverallScore(row, testMetadata) {
         var score = {};
         var testNumber = testMetadata.TEST + testMetadata.CODE;
         var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "_SCORE"), null);
         var assessmentMeasureLevel = _util.coalesce(row.getField(testMetadata.FIELD + "_LEVEL"), row.getField(testMetadata.FIELD + "_LEVELS"),  row.getField(testMetadata.FIELD + "LEVELS"), null);
         var nationalNormPercentile = replaceSpecialChar(_util.coalesce(row.getField(testMetadata.FIELD + "_NATIONAL_NORM_PERCENTILE"),row.getField(testMetadata.FIELD + "_LOCAL_PERCENTILE")));
         var dibelsLexile = row.getField("DIBELS_COMPOSITE_SCORE_LEXILE");
         var semesterGrowth = row.getField(testMetadata.FIELD + "_SEMESTER_GROWTH");
         var yearGrowth = row.getField(testMetadata.FIELD + "_YEAR_GROWTH");
         var levels = _util.coalesce(row.getField("ASSESSMENT_MEASURE-INSTRUCTIONAL_RECOMMENDATION-LEVELS"));
         var assessmentGrade =  gradeDecode[row.getField('ASSESSMENT_GRADE')];
         var assessmentEdition = row.getField("ASSESSMENT_EDITION");
         var assessmentName = row.getField("ASSESSMENT");


         // Check for key fields and do not map score and exit if conditions met.
         if(((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""
            ||  _util.coalesce(row.getField("COMPLETENESS"), null) === "False") &&  assessmentMeasureLevel === null) &&
            (levels === null || levels === undefined || _util.trim(levels) === "--" || _util.trim(levels) === ""))
         {

             return null;
         }
        // Set score fields
         score["TEST_NUMBER"] = testNumber;
         score["TEST_SCORE_TEXT"] = scaleScore;
         if(!isNaN(scaleScore)){
             score["TEST_SCORE_VALUE"] = scaleScore;
             score["TEST_SCALED_SCORE"] = scaleScore;
         }

         score["TEST_READING_LEVEL"] = removeLexileAlphaChar(dibelsLexile);
         score["TEST_PERCENTILE_SCORE"] = parseInt(nationalNormPercentile);
         score["TEST_PRIMARY_RESULT_CODE"] = perfLevels[assessmentMeasureLevel];

         if(assessmentMeasureLevel === "At or Above Benchmark" ){
         var replacedLevel = assessmentMeasureLevel.replace("o","O");
         score["TEST_PRIMARY_RESULT"] = replacedLevel;
         }else{
         score["TEST_PRIMARY_RESULT"] = assessmentMeasureLevel;
         }

         score["TEST_QUATERNARY_RESULT_CODE"] = "Semester";
         score["TEST_SECONDARY_RESULT"] = levels;
         score["TEST_QUATERNARY_RESULT"] = semesterGrowth;
         score["TEST_CUSTOM_RESULT_CODE"] = "Year";
         score["TEST_CUSTOM_RESULT"] = yearGrowth;
         score["TEST_GRADE_EQUIVALENT"] = assessmentGrade;
         score["TEST_SCORE_ATTRIBUTES"]	= assessmentEdition;
         score["TEST_TERTIARY_RESULT"] = assessmentName;

         return score;
      }


      function removeLexileAlphaChar(value) {
      if(value === undefined || value === null) {
          return null;
       } else {
          return value.replace("L", "").replace("BR", "-");
       }
     }

    function getSubjectName(row) {
        var subjects = row.getField("MEASURE");
        var subjName = subjects;
        if (subjects === 'Conciencia fonologica (FSS)') {
            subjName = 'CONCIENC_FSS';
        } else if (subjects === 'Sonidos de letras (FSL)') {
            subjName = 'SONI_FSL';
        } else if (subjects === 'Fluidez en la lectura (FLO)') {
            subjName = 'FLUID_FLO';
        } else if (subjects === 'Lectura de palabras (FEP)') {
            subjName = 'LECTU_FEP';
        } else if (subjects === 'Precision en la lectura (FLO-Prec)') {
            subjName = 'PRECI_FLOP';
        } else if (subjects === 'Decodificacion (LSS)') {
            subjName = 'DECODIFI_LSS';
        } else if (subjects === 'Comprension basica (CP)') {
            subjName = 'COMPRE_COMCP';
        } else if (subjects === 'Decoding (NWF-WRC)') {
            subjName = 'DECO';
        } else if (subjects === 'Letter Sounds (NWF-CLS)') {
            subjName = 'LTR_SNDS';
        } else if (subjects === 'Phonemic Awareness (PSF)') {
            subjName = 'PHON_AWR';
        } else if (subjects === 'Reading Comprehension (Maze)') {
            subjName = 'READ_COMP';
        } else if (subjects === 'Reading Accuracy (ORF-Accu)') {
            subjName = 'READ_ACCU';
        } else if (subjects === 'Reading Fluency (ORF)') {
            subjName = 'READ_FLU';
        } else if (subjects === 'Word Reading (WRF)') {
            subjName = 'WORD_RD';
        }
        return subjName;
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
    function replaceSpecialChar(value) {
        if(value !== null) {
//            return value.replace(/\D/g,"").trim();
              return value.replace(/[^\d.]/g, "").trim();
        }
    }

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

    function parseDate(rawDate) {

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

        if (rawDate.length >= 8 && rawDate.indexOf("-") >= 1) {
            var formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        } else {
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
    /**
     * Generates an Assessment Admin Key using a combination of hierarchy values and natural keys from an assessment signature
     *
     * @param signature The java signature of the file
     * @param hierarchy A JSON object containing file hierarchy values
     * @param srcRecord The assessment record being processed
     * @returns {string}
     */
    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {
        var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}_${hierarchy.REPORTING_PERIOD}";
        var clientDate =  srcRecord.getField("CLIENT_DATE");
        var enrollDate =  srcRecord.getField("ENROLLMENT_DATE");
        var dateOfBirth = srcRecord.getField("DATE_OF_BIRTH");

    function formatDate(dateString) {
        if (dateString !== null && dateString !== "" && dateString !== undefined) {
            if (dateString.length >= 8 && dateString.indexOf("-") >= 1 && dateString.split("-")[0].length === 4) {
                // yyyy-MM-dd
                return AppUtil.getDateObjByPattern(dateString, "yyyy-MM-dd").STANDARD_DATE;
            } else if (dateString.length >= 8 && dateString.indexOf("/") >= 1 && dateString.split("/")[0].length === 1) {
                // M/dd/yyyy
                return AppUtil.getDateObjByPattern(dateString, "M/dd/yyyy").STANDARD_DATE;
            } else if (dateString.length >= 8 && dateString.indexOf("/") >= 1 && dateString.split("/")[0].length === 2) {
                // MM/dd/yyyy
                return AppUtil.getDateObjByPattern(dateString, "MM/dd/yyyy").STANDARD_DATE;
            } else if (dateString.length >= 8 && dateString.indexOf("/") >= 1 && dateString.split("/")[0].length === 2) {
                // dd/MM/yyyy
                return AppUtil.getDateObjByPattern(dateString, "dd/MM/yyyy").STANDARD_DATE;
            } else {
                // dd-MM-yyyy
                return AppUtil.getDateObjByPattern(dateString, "dd-MM-yyyy").STANDARD_DATE;
            }
        }
        return dateString;
    }

    clientDate = formatDate(clientDate);
    enrollDate = formatDate(enrollDate);

    var birthDateObject = {
        STANDARD_DATE: null
    };
    if (dateOfBirth !== null && dateOfBirth !== undefined) {
        birthDateObject = parseDate(dateOfBirth);
    }

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });

        if(signature.format.formatName === "mclass_2122"){
            assessmentAdminKey = assessmentAdminKey + "_" + clientDate + "_" + enrollDate;
            if (birthDateObject.STANDARD_DATE !== null) {
                assessmentAdminKey = assessmentAdminKey + "_" + birthDateObject.STANDARD_DATE;
        }
        }
        //Examples of adding additional values
        //assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
        //assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);


        if(signature.format.formatName === "Amplify_mclass_2122_English"){
            assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}" + "_" + srcRecord.getField("STUDENT_ID") + "_" + srcRecord.getField("STUDENT_FIRST_NAME") + "_" + srcRecord.getField("STUDENT_LAST_NAME") + "_" + srcRecord.getField("PERIOD");
        }
        return assessmentAdminKey;

    }

    return module;
}());