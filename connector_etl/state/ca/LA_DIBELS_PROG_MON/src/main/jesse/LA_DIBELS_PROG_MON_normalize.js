var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LA_DIBELS_PROG_MON";
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

    var strandsAndFields =
        [
            // DIBELS V6 STRANDS

            // DIBELS NEXT STRANDS
            {TEST: "LA_DIBNXT", STRAND: "PROGMON", FIELD: "PROGMON"}
        ];

    var lookUpTestNumber = {
        "Daze" : "DAZEADJ"
        , "DORF Accuracy" : "DORFACC"
        , "DORF Fluency" : "DORFWC"
        , "DORF Retell" : "DORFRT"
        , "First Sound Fluency" : "FSF"
        , "Nonsense Word Fluency - CLS" : "NWFCLS"
        , "Nonsense Word Fluency - WWR" : "NWFWWR"
        , "Phoneme Segmentation Fluency" : "PSF"
        , "Decoding (NWF-WRC)" : "NWFWRC"
        , "Letter Sounds (NWF-CLS)" : "NWFCLS"
        , "Phonemic Awareness (PSF)" : "PSF"
        , "Reading Accuracy (ORF-Accu)" : "ORFAccu"
        , "Reading Comprehension (Maze)" : "Maze"
        , "Reading Fluency (ORF)" : "ORF"
        , "Word Reading (WRF)" : "WRF"

    };


    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var gradeLevels =
        {
            "K": "KG",
            "1": "01",
            "2": "02",
            "3": "03",
            "4": "04",
            "5": "05",
            "6": "06",
            "P": "KG"
        };// Added P as KG referring to Grade Column for future use

    var assessPeriods =
        [
            {PERIOD_CODE: "BEG", FIELD: "BEGINNING"},
            {PERIOD_CODE: "MID", FIELD: "MIDDLE"},
            {PERIOD_CODE: "END", FIELD: "END"}
        ];

    var perfLevels =
        {
            "Intensive Support": {
                TEST_PRIMARY_RESULT_CODE: "IS",
                TEST_PRIMARY_RESULT: "Intensive Support",
                TEST_SECONDARY_RESULT_CODE: "WB",
                TEST_SECONDARY_RESULT: "Well Below Benchmark"
            },
            "Well Below Benchmark": {
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
            "Below Benchmark": {
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
            "Above Benchmark": {
                TEST_PRIMARY_RESULT_CODE: "CS",
                TEST_PRIMARY_RESULT: "Core Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "At Or Above Benchmark"
            },
            "Benchmark": {
                TEST_PRIMARY_RESULT_CODE: "CS",
                TEST_PRIMARY_RESULT: "Core Support",
                TEST_SECONDARY_RESULT_CODE: "AB",
                TEST_SECONDARY_RESULT: "Benchmark"
            },
            "--": {
                TEST_PRIMARY_RESULT_CODE: "--",
                TEST_PRIMARY_RESULT: "--",
                TEST_SECONDARY_RESULT_CODE: "--",
                TEST_SECONDARY_RESULT: "--"
            },
             "Not Determined": {
                 TEST_PRIMARY_RESULT_CODE: "--",
                 TEST_PRIMARY_RESULT: "Not Determined",
                 TEST_SECONDARY_RESULT_CODE: "--",
                 TEST_SECONDARY_RESULT: "--"
             },
            "": {
                TEST_PRIMARY_RESULT_CODE: "--",
                TEST_PRIMARY_RESULT: "--",
                TEST_SECONDARY_RESULT_CODE: "--",
                TEST_SECONDARY_RESULT: "--"
            },
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
        var year = (hierarchy.SCHOOL_YEAR).substring(0,4);
        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);


            var record = mapSingleNormalizedRecord(signature, hierarchy, row, year);
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
    function mapSingleNormalizedRecord(signature, hierarchy, row, year) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        record = mapNormalizedAdminFields(signature, hierarchy, row, year);

        strandsAndFields.forEach(function(strandsAndField) {
            var score = row.getField("SCORE");
            var scoreChange = row.getField("SCORE_CHANGE");
            var probeNumber = row.getField("PROBE_NUMBER");
            var totalProbes = row.getField("TOTAL_NUMBER_OF_PROBES");
            var measure = lookUpTestNumber[row.getField("MEASURE")];
            var clientDate = AppUtil.getMonthFollowedByDay(row.getField("CLIENT_DATE")).STANDARD_DATE;
            var syncDate = AppUtil.getMonthFollowedByDay(row.getField("SYNC_DATE")).STANDARD_DATE;

            mappingObject.SCORE_MAPPINGS.push(
                {
                    "TEST_NUMBER" : "LA_DIBNXT" + gradeLevels[row.getField("ASSESSMENT_GRADE")] + getShortAdminPeriod(row.getField("PM_PERIOD")) +measure+"_PROGMON",
                    "TEST_SCORE_VALUE" : score,
                    "TEST_SCORE_TEXT" : score,
                    "TEST_GROWTH_RESULT" : scoreChange,
                    "TEST_ITEMS_POSSIBLE" : totalProbes,
                    "TEST_ITEMS_ATTEMPTED" : probeNumber,
                    "TEST_TERTIARY_RESULT" : clientDate,
                    "TEST_QUATERNARY_RESULT" : syncDate

                }
            );

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
    function mapNormalizedAdminFields(signature, hierarchy, row, year) {

        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {
            RAW_DATE : null
            , MONTH : null
            , DAY : null
            , YEAR : null
            , STANDARD_DATE : null
        }
        var birthDate = row.getField("DATE_OF_BIRTH");
        if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
        }

        //Loop through normalized fields and map if possible.
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
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(row.getField("PM_PERIOD"));
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTEST_ADMIN_DATE_STR(row.getField("PM_PERIOD"), year);
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
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_PRIMARY_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID") // storing null since we do not have state student ID
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_PRIMARY_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = null;
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = null;
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = null;
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeLevels[_util.coalesce(row.getField("ASSESSMENT_GRADE"))];
                    break;
                case "TEST_LOCATION":
                    record.TEST_LOCATION = null;
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("PRIMARY_SCHOOL_ID"));
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
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
        switch (assessPeriod) {
            case "BOY->MOY":
                period = "FALL";
                break;
            case "MOY->EOY":
                period = "WINTER";
                break;
            case "After EOY":
                period = "SPRING";
                break;
        }

        return period;
    }

    function getShortAdminPeriod(assessPeriod) {

        var period = null;
        switch (assessPeriod) {
            case "BOY->MOY":
                period = "BEG";
                break;
            case "MOY->EOY":
                period = "MID";
                break;
            case "After EOY":
                period = "END";
                break;
        }

        return period;
    }

    function getTEST_ADMIN_DATE_STR(assessPeriod, year) {
        var date = null;

        switch (assessPeriod) {

            case "BOY->MOY":
                date = "10/15/${year}";
                break;
            case "MOY->EOY":
                year = parseInt(year) + 1;
                date = "01/15/${year}";
                break;
            case  "After EOY":
                year = parseInt(year) + 1;
                date = "04/15/${year}";
            break;
}
        return date;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/



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
        var measure = lookUpTestNumber[srcRecord.getField("MEASURE")];
        var clientDate = AppUtil.getMonthFollowedByDay(srcRecord.getField("CLIENT_DATE")).STANDARD_DATE;

        // Set base assessment admin key information
        assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_" + getTEST_ADMIN_PERIOD(srcRecord.getField("PM_PERIOD"));
        assessmentAdminKey = assessmentAdminKey + "_" + measure + "_" + clientDate;

        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());