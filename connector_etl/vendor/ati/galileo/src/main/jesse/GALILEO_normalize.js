var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "GALILEO";
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
    var scoresToMap = [
        {TEST: "GK12_", CODE:"",FIELD:"DL_SCORE", MAP_FUNCTION: mapScore}
    ];
    var scoresToMap1 = [
        {TEST: "GK12_", CODE:"_1", FIELD: "_1", MAP_FUNCTION: mapScore1}
    ];
    var scoresToMap2 = [
        {TEST: "GK12_", CODE:"_2", FIELD: "_2", MAP_FUNCTION: mapScore2}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/
    var gradeLookup = {
        "K" 	: "KG"
        ,"KG" 	: "KG"
        ,"0" 	: "KG"
        ,"00" 	: "KG"
        ,"01"	: "01"
        ,"1"	: "01"
        ,"02"	: "02"
        ,"2"	: "02"
        ,"03"	: "03"
        ,"3"	: "03"
        ,"04"	: "04"
        ,"4"	: "04"
        ,"05"	: "05"
        ,"5"	: "05"
        ,"06"	: "06"
        ,"6"	: "06"
        ,"07"	: "07"
        ,"7"	: "07"
        ,"08"	: "08"
        ,"8"	: "08"
        ,"09"	: "09"
        ,"9"	: "09"
        ,"10"	: "10"
        ,"11"	: "11"
        ,"12"	: "12"
        ,"HS"   : "12"
        ,null   : null
        ,""     : null
    };

    //CSPS does not prefer TEXT field, kept for labeling purposes
   var  decodePrimaryResult = {
          "L1" : {PASSED: "No", TEXT: "Level 1"}
          ,"L2" : {PASSED: "No", TEXT: "Level 2"}
          ,"L3" : {PASSED: "No", TEXT: "Level 3"}
          ,"L4" : {PASSED: "Yes", TEXT: "Level 4"}
          ,"L5" : {PASSED: "Yes", TEXT: "Level 5"}
          ,"R" : {PASSED: "No", TEXT: "Red"}
          ,"Y" : {PASSED: "No", TEXT: "Yellow"}
          ,"G" : {PASSED: "Yes", TEXT: "Green"}
          ,"PP" : {PASSED: "No", TEXT: "Partially Proficient"}
          ,"MP" : {PASSED: "No", TEXT: "Minimally Proficient"}
          ,"P" : {PASSED: "Yes", TEXT: "Proficient"}
          ,"HP" : {PASSED: "Yes", TEXT: "Highly Proficient"}
          ,"A" : {PASSED: "No", TEXT: "Approaching"}
          ,"M" : {PASSED: "Yes", TEXT: "Monitor"}
          ,"E" : {PASSED: "Yes", TEXT: "Enrich"}
          ,"FFB" : {PASSED: "No", TEXT: "Falls Far Below"}
          ,"I" : {PASSED: "No", TEXT: "Intervene"}
          ,"S" : {PASSED: "Yes", TEXT: "Support"}
          ,"S " : {PASSED: "Yes", TEXT: "Support"}
          ,"---" : {PASSED: null, TEXT: null}
          , null : {PASSED: null, TEXT: null}
   };
    /***********************************************************************************
     Assessment-specific decode functions
     ***********************************************************************************/

   function getTestValue(testName, row){


        var testValue = null;
        if(testName === undefined || testName === null){
            return testValue;
        }
        testName = testName.toString().toUpperCase();


        var period = _util.coalesce(row.getField("TERM"),getTestPeriod(testName));//get period from function, part of test_number
        var gradeValue = gradeLookup[row.getField("GRADE_LEVEL")];
        var typePart = null;
        if(testName.indexOf("TE EL")>-1||testName.indexOf("TEEL")>-1){
            typePart = "ELA";
        }
        else if(testName.indexOf("TE EM")>-1||testName.indexOf("TEEM")>-1){
            typePart = "MA";
        }
        else if(testName.indexOf("CCR-R")>-1){
            typePart = "ELA";
        }
        else if(testName.indexOf("ALG")>-1){
            typePart = "MA_ALG";
        } else if(testName.indexOf("MATH")>-1){
            typePart = "MA";
        } else if(testName.indexOf("ELA")>-1 || testName.indexOf("ENGLISH")>-1){
            typePart = "ELA";
        }
        else if(testName.indexOf("SCIENCE")>-1){
            typePart = "SCI";
        }
        else if(testName.indexOf("READING")>-1){
            typePart = "ELA";
        }
        else if(testName.indexOf("GEOMETRY")>-1){
            typePart = "MA_GEO";
        } else if(testName.indexOf("FINANCIAL LITERACY")>-1){
            typePart = "LIT_FIN";
        } else if(testName.indexOf("EARLY LITERACY")>-1){
            typePart = "ER_LIT";
        } else if(testName.indexOf("CIVICS")>-1){
            typePart = "CIV";
        } else if(testName.indexOf("FINANCIAL LITERACY")>-1){
            typePart = "FIN_LIT";
        }
        testValue = "GK12_Gr"+gradeValue+"_"+typePart+"_"+period;
        return testValue;

   }

   //Preserving in case of need of use
   function getTestPeriod(testName){
        var period = null;
        if(testName === undefined || testName === null){
            return period;
        }
        if(testName.indexOf("TE EL 00")>-1||testName.indexOf("TEEL 00")>-1){
            period = "TEEL0";
        }
        else if(testName.indexOf("TE EL 01")>-1||testName.indexOf("TEEL 01")>-1){
            period = "TEEL1";
        }
        else if(testName.indexOf("TE EL 02")>-1||testName.indexOf("TEEL 02")>-1){
            period = "TEEL2";
        }
        else if(testName.indexOf("TE EL 03")>-1||testName.indexOf("TEEL 03")>-1){
            period = "TEEL3";
        }
        else if(testName.indexOf("TE EM 00")>-1||testName.indexOf("TEEM 00")>-1){
            period = "TEEM0";
        }
        else if(testName.indexOf("TE EM 01")>-1||testName.indexOf("TEEM 01")>-1){
            period = "TEEM1";
        }
        else if(testName.indexOf("TE EM 02")>-1||testName.indexOf("TEEM 02")>-1){
            period = "TEEM2";
        }
        else if(testName.indexOf("TE EM 03")>-1||testName.indexOf("TEEM 03")>-1){
            period = "TEEM3";
        }
        else if(testName.indexOf("ADB 1")>-1||testName.indexOf("ADB1")>-1){
            period = "ADB1";
        }
        else if(testName.indexOf("ADB 2")>-1||testName.indexOf("ADB2")>-1){
            period = "ADB2";
        }
        else if(testName.indexOf("ADB 3")>-1||testName.indexOf("ADB3")>-1){
            period = "ADB3";
        }
        else if(testName.indexOf("ADB 4")>-1||testName.indexOf("ADB4")>-1){
            period = "ADB4";
        }
        else if(testName.indexOf("Fall")>-1){
            period = "Fall";
        }
        else if(testName.indexOf("Spring")>-1){
            period = "Spring";
        }
        else {
            period = "ALL";
        }

        return period;
   }
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
        var record = "";
        if (signature.getFormat().getFormatName() === "GALILEO_33_COLS" ){

            for (var i = 1; i <=2 ; i++) {
              if(row.getField("DL_SCORE_" + i)!==undefined){
                  record = mapNormalizedRecord(signature, hierarchy, row, i);
                  AppUtil.nullSafePush(normalizedRecords, record);
              }
            }
        }else{
            record = mapNormalizedRecord(signature, hierarchy, row,'0');
            AppUtil.nullSafePush(normalizedRecords, record);
        }

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
    function mapNormalizedRecord(signature, hierarchy, row,i=null) {
        var record = {};
        var mappingObject = {};

        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        if ((signature.getFormat().getFormatName() === "GALILEO_33_COLS" ) && (i =='1')){
            //Map score fields for each expected score mapping
            scoresToMap1.forEach(function(testMetadata) {
                try {
                    //Map normalized admin fields
                    record = mapNormalizedAdminFields(signature, hierarchy, row,i);
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch(exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
                }
            });
        }
        else if ((signature.getFormat().getFormatName() === "GALILEO_33_COLS" ) && (i =='2')){
            //Map score fields for each expected score mapping
            scoresToMap2.forEach(function(testMetadata) {
                try {
                    //Map normalized admin fields
                    record = mapNormalizedAdminFields(signature, hierarchy, row,i);
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);

                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch(exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
                }
            });
        }
        else{
            //Map normalized admin fields
            record = mapNormalizedAdminFields1(signature, hierarchy, row);

            //Map score fields for each expected score mapping
            scoresToMap.forEach(function(testMetadata) {
                try {
                    var score = (testMetadata.MAP_FUNCTION)(row, testMetadata);
                    AppUtil.nullSafePush(mappingObject.SCORE_MAPPINGS, score);
                } catch(exception) {
                    AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",row.LINEAGE_LINE, "Score mapping error: ${exception}", JSON.stringify(row)));
                }
            });
        }

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
    function mapNormalizedAdminFields1(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {};
        try{
        if(row.getField("BIRTH_DATE")!= null || row.getField("BIRTH_DATE")!= undefined ){
          if(row.getField("BIRTH_DATE")==="1/1/1949" || row.getField("BIRTH_DATE")==="---"|| row.getField("BIRTH_DATE")===""){
             birthDateObject = {
                 RAW_DATE : null
                 , MONTH : null
                 , DAY : null
                 , YEAR : null
                 , STANDARD_DATE : null
             };

          } else if(row.getField("BIRTH_DATE").toString().indexOf("/")>-1){
             birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "M/d/yyyy");
          }

         else {
             birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "dd-MM-yyyy");
         }
         }
        }catch(e){
            print(e+"\r\n");
        }

        var dateString = row.getField("TEST_DATE");


        var dateFormat = "dd-MM-yyyy";
        if(dateString===null||dateString===undefined||dateString=="---"){
            dateString = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5, 9);
            dateFormat = "M/d/yyyy";
        }
        else if(dateString.indexOf("/")>-1){
            dateFormat = "M/d/yyyy";
        }
        else{
            dateFormat = "dd-MM-yyyy";
        }
        var finalDate = AppUtil.getDateObjByPattern(dateString, dateFormat).STANDARD_DATE;
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
                    record.REPORTING_PERIOD = _util.coalesce(row.getField("TERM"),getTestPeriod(row.getField("TEST")));
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
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL"));
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL"));
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    var genderCode = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    if(genderCode && genderCode !== "N" && genderCode !== "-"){
                        record.STUDENT_GENDER_CODE = genderCode;
                    } else {
                        record.STUDENT_GENDER_CODE = null;
                    }
                    break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeLookup[row.getField("GRADE_LEVEL")];
                     break;
                default:
                    record[field] = row.getField(field);
                    break;
            }
        });
        return record;
    }

    function mapNormalizedAdminFields(signature, hierarchy, row,i=null) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = {};
        try{
        if(row.getField("BIRTH_DATE")!= null || row.getField("BIRTH_DATE")!= undefined ){
          if(row.getField("BIRTH_DATE")==="1/1/1949" || row.getField("BIRTH_DATE")==="---"|| row.getField("BIRTH_DATE")===""){
             birthDateObject = {
                 RAW_DATE : null
                 , MONTH : null
                 , DAY : null
                 , YEAR : null
                 , STANDARD_DATE : null
             };

          } else if(row.getField("BIRTH_DATE").toString().indexOf("/")>-1){
             birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "M/d/yyyy");
          }

         else {
             birthDateObject = AppUtil.getDateObjByPattern(row.getField("BIRTH_DATE"), "dd-MM-yyyy");
         }
         }
        }catch(e){
            print(e+"\r\n");
        }
        if (signature.getFormat().getFormatName() === "GALILEO_33_COLS" ){
            if (i =='1'){
                var dateString = row.getField("TEST_DATE_1");
                test_name = row.getField("TEST_1");
                var school_1 = _util.coalesce(row.getField("SCHOOL_1"));
            }else if (i =='2'){
                var dateString = row.getField("TEST_DATE_2");
                test_name = row.getField("TEST_2");
                var school_2 = _util.coalesce(row.getField("SCHOOL_2"));
            }

        }else{
            var dateString = row.getField("TEST_DATE");

        }


        var dateFormat = "dd-MM-yyyy";
        if(dateString===null||dateString===undefined||dateString=="---"){
            dateString = "05/15/"+hierarchy.SCHOOL_YEAR.substring(5, 9);
            dateFormat = "M/d/yyyy";
        }
        else if(dateString.indexOf("/")>-1){
            dateFormat = "M/d/yyyy";
        }
        else{
            dateFormat = "dd-MM-yyyy";
        }
        var finalDate = AppUtil.getDateObjByPattern(dateString, dateFormat).STANDARD_DATE;
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    if (signature.getFormat().getFormatName() === "GALILEO_33_COLS" ){
                        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row)+ "_" + test_name;
                    }else{
                        record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                    }
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
                    record.REPORTING_PERIOD = _util.coalesce(row.getField("TERM"),getTestPeriod(_util.coalesce(row.getField("TEST"),test_name)));
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
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce(birthDateObject.MONTH, null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce(birthDateObject.DAY, null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce(birthDateObject.YEAR, null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    if (signature.getFormat().getFormatName() === "GALILEO_33_COLS" ){
                        if (i =='1'){
                            record.SCHOOL_VENDOR_ID = _util.coalesce( "---".equals(row.getField("SCHOOL_1")) ? null : row.getField("SCHOOL_1"));
                        }else if (i =='2'){
                            record.SCHOOL_VENDOR_ID = _util.coalesce( "---".equals(row.getField("SCHOOL_2")) ? null : row.getField("SCHOOL_2"));
                        }
                    }else{
                        record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL"));
                    }

                    break;
                case "SCHOOL_NAME":
                    if (signature.getFormat().getFormatName() === "GALILEO_33_COLS" ){
                        if (i =='1'){
                            record.SCHOOL_NAME = _util.coalesce( "---".equals(row.getField("SCHOOL_1")) ? null : row.getField("SCHOOL_1"));
                        }else if (i =='2'){
                            record.SCHOOL_NAME = _util.coalesce( "---".equals(row.getField("SCHOOL_2")) ? null : row.getField("SCHOOL_2"));
                        }
                    }else{
                        record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL"));
                    }
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(row.getField("STATE_ID"));
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LAST_NAME"));
                    break;
                case "STUDENT_GENDER_CODE":
                    var genderCode = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                    if(genderCode && genderCode !== "N" && genderCode !== "-"){
                        record.STUDENT_GENDER_CODE = genderCode;
                    } else {
                        record.STUDENT_GENDER_CODE = null;
                    }
                    break;
                 case "STUDENT_GRADE_CODE":
                     record.STUDENT_GRADE_CODE = gradeLookup[row.getField("GRADE_LEVEL")];
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
    function mapAdditionalAdminFields(row){
    //Add commented lines if files remain multi-year
        //var acaYear = row.getField("ACAYEAR");
        //var acaSplit = acaYear.split("-");
        //var acaFull = "20"+acaSplit[0]+"-20"+acaSplit[1];
        var admin = {};

        admin.TEST_INTERVENTION_DESC = row.getField("CLASS");

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
     function mapScore(row, testMetadata) {
        var score = {};
        var testNumber = getTestValue(row.getField("TEST"),row);
        var rawScore = row.getField('SUM_SCORE');
        var scaleScore = row.getField('DL_SCORE');
     	var percentile = row.getField('PERCENTILE_RANK');
     	var correct = row.getField('PERCENT_CORRECT');
     	var primaryResult = row.getField('PERFORMANCE');
     	var nce = row.getField('NCE');
     	var expectedGrowth = row.getField('EXPECTED_GROWTH');
     	var actualGrowth = row.getField('ACTUAL_GROWTH');
     	var metGrowth = row.getField('MET_GROWTH');

     	if(scaleScore === null || scaleScore === undefined || scaleScore == "" || scaleScore == "---"){
     		return null;
     	}
     	if(expectedGrowth == "N/A" || expectedGrowth == "n/a"){
            expectedGrowth = null;
        } else {
            expectedGrowth;
        }
     	score["TEST_NUMBER"] = testNumber;
     	score["TEST_SCORE_TEXT"] = scaleScore;
     	if(!isNaN(scaleScore)){
     	score["TEST_SCORE_VALUE"] = scaleScore;
     	score["TEST_SCALED_SCORE"] = scaleScore;
     	}
     	score["TEST_RAW_SCORE"] = rawScore;
     	score["TEST_PRIMARY_RESULT_CODE"] = primaryResult;
     	score["TEST_PRIMARY_RESULT"] = decodePrimaryResult[primaryResult].TEXT;
     	score["TEST_PERCENTILE_SCORE"] = percentile;
     	score["TEST_PERCENTAGE_SCORE"] = correct;
     	score["TEST_NCE_SCORE"] = nce;
     	score["TEST_GROWTH_TARGET_1"] = expectedGrowth;
     	score["TEST_GROWTH_RESULT"] = actualGrowth;
     	score["TEST_GROWTH_RESULT_CODE"] = metGrowth;
     	score["TEST_PASSED_INDICATOR"] = decodePrimaryResult[primaryResult].PASSED;

     	return score;
     }

    function mapScore1(row, testMetadata) {

        var score = {};
        var testNumber = getTestValue(row.getField("TEST_1"),row);
        var rawScore = row.getField('SUM_SCORE');
        var scaleScore = row.getField("DL_SCORE_1");
        var percentile = row.getField('PERCENTILE_RANK');
        var correct = row.getField('PERCENT_CORRECT');
        var primaryResult = row.getField("PERFORMANCE_1");
        var nce = row.getField('NCE');
        var expectedGrowth = row.getField('EXPECTED_GROWTH');
        var actualGrowth = row.getField('ACTUAL_GROWTH');
        var metGrowth = row.getField('MET_GROWTH');

        if(scaleScore === null || scaleScore === undefined || scaleScore == "" || scaleScore == "---"){
            return null;
        }
        if(expectedGrowth == "N/A" || expectedGrowth == "n/a"){
            expectedGrowth = null;
        } else {
            expectedGrowth;
        }
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        }
        score["TEST_RAW_SCORE"] = rawScore;
        score["TEST_PRIMARY_RESULT_CODE"] = primaryResult.trim();
        score["TEST_PRIMARY_RESULT"] = decodePrimaryResult[primaryResult.trim()].TEXT;
        score["TEST_PERCENTILE_SCORE"] = percentile;
        score["TEST_PERCENTAGE_SCORE"] = correct;
        score["TEST_NCE_SCORE"] = nce;
//        score["TEST_GROWTH_TARGET_1"] = parseInt(expectedGrowth);
//        score["TEST_GROWTH_RESULT"] = actualGrowth;
//        score["TEST_GROWTH_RESULT_CODE"] = metGrowth;
        score["TEST_PASSED_INDICATOR"] = decodePrimaryResult[primaryResult].PASSED;

        return score;
     }
        function mapScore2(row, testMetadata) {

            var score = {};
            var testNumber = getTestValue(row.getField("TEST_2"),row);
            var rawScore = row.getField('SUM_SCORE');
            var scaleScore = row.getField("DL_SCORE_2");
            var percentile = row.getField('PERCENTILE_RANK');
            var correct = row.getField('PERCENT_CORRECT');
            var primaryResult = row.getField("PERFORMANCE_2");
            var nce = row.getField('NCE');
            var expectedGrowth = row.getField('EXPECTED_GROWTH');
            var actualGrowth = row.getField('ACTUAL_GROWTH');
            var metGrowth = row.getField('MET_GROWTH');

            if(scaleScore === null || scaleScore === undefined || scaleScore == "" || scaleScore == "---"){
                return null;
            }
            if(expectedGrowth == "N/A" || expectedGrowth == "n/a"){
                expectedGrowth = null;
            } else {
                expectedGrowth;
            }
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            if(!isNaN(scaleScore)){
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;
            }
            score["TEST_RAW_SCORE"] = rawScore;
            score["TEST_PRIMARY_RESULT_CODE"] = primaryResult.trim();
            score["TEST_PRIMARY_RESULT"] = decodePrimaryResult[primaryResult.trim() ].TEXT;
            score["TEST_PERCENTILE_SCORE"] = percentile;
            score["TEST_PERCENTAGE_SCORE"] = correct;
            score["TEST_NCE_SCORE"] = nce;
            score["TEST_GROWTH_TARGET_1"] = parseInt(expectedGrowth);
            score["TEST_GROWTH_RESULT"] = actualGrowth;
            score["TEST_GROWTH_RESULT_CODE"] = metGrowth;
            score["TEST_PASSED_INDICATOR"] = decodePrimaryResult[primaryResult].PASSED;

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


        return assessmentAdminKey;
    }

    return module;
}());
