var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CEM_CPI";
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
           {TEST: "CEM_CPI_", CODE:"OVR", NAME: "MA_", FIELD: "MATHEMATICS_", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_CPI_", CODE:"OVR", NAME: "ARITH_", FIELD: "ARITHMETIC_", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_CPI_", CODE:"OVR", NAME: "RD_", FIELD: "READING_", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_CPI_", CODE:"OVR", NAME: "SP_", FIELD: "SPELLING_", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_CPI_", CODE:"OVR", NAME: "DEV_", FIELD: "DEVELOPED_ABILITY_", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_CPI_", CODE:"NUM1", NAME: "", FIELD: "NUMBERS_1_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"NUM2", NAME: "", FIELD: "NUMBERS_2_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"MSAS", NAME: "", FIELD: "MEASURES_SHAPE_AND_SPACE_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"DH", NAME: "", FIELD: "DATA_HANDLING_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"ADD", NAME: "", FIELD: "ADDITION_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"SUB", NAME: "", FIELD: "SUBTRACTION_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"MULT", NAME: "", FIELD: "MULTIPLICATION_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"DIV", NAME: "", FIELD: "DIVISION_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"WRD_REC", NAME: "", FIELD: "WORD_RECOGNITION_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"WRD_DEC", NAME: "", FIELD: "WORD_DECODING_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"COMP", NAME: "", FIELD: "COMPREHENSION_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"PIC_VOCAB", NAME: "", FIELD: "PICTURE_VOCABULARY_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"NON_VERB", NAME: "", FIELD: "NON_VERBAL_", MAP_FUNCTION: mapStrandScore}
		  ,{TEST: "CEM_CPI_", CODE:"OVR", NAME: "", FIELD: "", MAP_FUNCTION: mapCompositeScore}
       ];

       /***************************************************************************
        Assessment-specific decodes
        ***************************************************************************/
        //TODO add any additional decodes
       var gradeDecode = {
		   "K-A": "KG",
		   "KGJ": "KG",
		   "KGM": "KG",
		   "K-D": "KG",
           "K-G": "KG",
           "K-M": "KG",
           "1C": "01",
           "1D": "01",
           "1N": "01",
           "1S": "01",
           "2B": "02",
           "2K": "02",
           "2M": "02",
           "2N": "02",
           "2G": "02",
           "2N": "02",
           "3B": "03",
           "3A": "03",
           "3C": "03",
           "3F": "03",
           "3D": "03",
           "3P": "03",
           "4B": "04",
           "4D": "04",
           "4H": "04",
           "4M": "04",
           "4T": "04",
           "5B": "05",
           "5C": "05",
           "5G": "05",
           "5M": "05",
           "5Z": "05",
           "" : null,
           null : null
       };
	   /* var genderDecode = {
        "Male": "M",
        "Female": "F",
        "M":"M",
		"F":"F",
        "" : null
       ,null : null
       };*/

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
           var record = {};
           var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
           //var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyyMMdd");
           var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

        var fullName = row.getField("STUDENT_NAME").split(' ')
            var lastName = null;
            var firstName = null;
            var middleName = null;
        if(fullName.length === 4){
            lastName = fullName[0];
            firstName = fullName[1]+' '+fullName[2]
            middleName = fullName[3]
        }
        else if(fullName.length === 3){
            var lastName = fullName[0];
            var firstName = fullName[1];
            var middleName = fullName[2];
        }
        else if(fullName.length === 2){
            var lastName = fullName[0];
            var firstName = fullName[1];
        }

        var defaultPeriod = getAdminPeriodByDate(row, hierarchy);

           normalizedFileFields.forEach(function (field) {
               switch (field) {
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
                       record.REPORTING_PERIOD = _util.coalesce(defaultPeriod, hierarchy.REPORTING_PERIOD);
                       break;
                   case "ASSESSMENT_VENDOR":
                       record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                       break;
                   case "ASSESSMENT_PRODUCT":
                       record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                       break;
                   case "TEST_ADMIN_DATE":
                       record.TEST_ADMIN_DATE = '09/07/' + hierarchy.SCHOOL_YEAR.substring(5, 9);// No admin dates will be coming for this assessment, Admin Date is set to default as per the clients survey
                       break;

                   // Additional fields for student information and school details
                   case "STUDENT_LOCAL_ID":
                       record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                       break;
                   case "STUDENT_STATE_ID":
                       record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_ID"));
                       break;
                   case "STUDENT_VENDOR_ID":
                       record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_ID"));
                       break;
                   case "STUDENT_FIRST_NAME":
                       record.STUDENT_FIRST_NAME = firstName;
                       break;
                   case "STUDENT_LAST_NAME":
                       record.STUDENT_LAST_NAME = lastName;
                       break;
                   case "STUDENT_MIDDLE_NAME":
                       record.STUDENT_MIDDLE_NAME = middleName;
                       break;
                   case "STUDENT_GENDER_CODE":
                       record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"), "").substring(0,1);
                       break;
                   case "STUDENT_GRADE_CODE":
                       record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
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
                       record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"), "DISTRICT");
                       break;
                   case "SCHOOL_LOCAL_ID":
                       record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NAME"), "DISTRICT");
                       break;
                   case "SCHOOL_STATE_ID":
                       record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NAME"), "DISTRICT");
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
       function mapScaledScore(row, testMetadata) {
           var score = {};
           var testNumber = testMetadata.TEST + testMetadata.NAME + testMetadata.CODE;
           var scaleScore = row.getField(testMetadata.FIELD + "AGE_STANDARDISED_SCORE");
           var rawScore = row.getField(testMetadata.FIELD + "AGE_EQUIVALENT_SCORE");
   		   var secondaryResult = row.getField(testMetadata.FIELD + "AGE_DIFFERENCE");
   		   //var rawScore = row.getField(testMetadata.FIELD + "AGE_STANDARDISED_SCORE");
   		   var ageAtAssessment = row.getField(testMetadata.FIELD + "AGE_AT_ASSESSMENT");
           if (scaleScore != null && !isNaN(scaleScore)) {
               scaleScore = Math.round(scaleScore);
           } else
           {
           return null;
           }
           var primaryResult = "";
           if (scaleScore <= 90) {
               primaryResult = "D";
           }else if (scaleScore >= 91 && scaleScore <= 100) {
               primaryResult = "C";
           }else if (scaleScore >= 101 && scaleScore <= 110) {
               primaryResult = "B";
           }else if (scaleScore >= 111) {
               primaryResult = "A";
           }
           // Check for key fields and do not map score and exit if conditions met.
           if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "" ) {
               return null;
           }

       	// Set score fields
       score["TEST_NUMBER"] = testNumber;
       score["TEST_SCORE_TEXT"] = scaleScore;
          if(!isNaN(scaleScore)){
               score["TEST_SCORE_VALUE"] = scaleScore;
               score["TEST_SCALED_SCORE"] = scaleScore;
          }
       score["TEST_RAW_SCORE"] = rawScore;
       score["TEST_SCORE_TO_PREDICTED_RESULT"] = ageAtAssessment;
       score["TEST_PRIMARY_RESULT"] = primaryResult;
       score["TEST_SECONDARY_RESULT"] = secondaryResult;

           return score;
       }

	   function mapStrandScore(row, testMetadata) {
           var score = {};
           var testNumber = testMetadata.TEST + testMetadata.CODE;
           var scaleScore = row.getField(testMetadata.FIELD + "AGE_EQUIVALENT_SCORE");
   		   var primaryResult = row.getField(testMetadata.FIELD + "AGE_DIFFERENCE");
   		   var ageAtAssessment = row.getField(testMetadata.FIELD + "AGE_AT_ASSESSMENT");

           // Check for key fields and do not map score and exit if conditions met.
           if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === " " ) {
               return null;
           }

       	// Set score fields
           score["TEST_NUMBER"] = testNumber;
           score["TEST_SCORE_TEXT"] = scaleScore;
               if(!isNaN(scaleScore)){
                   score["TEST_SCORE_VALUE"] = scaleScore;
                   score["TEST_SCALED_SCORE"] = scaleScore;
               }

           score["TEST_SCORE_TO_PREDICTED_RESULT"] = ageAtAssessment;
           score["TEST_PRIMARY_RESULT"] = primaryResult;

           return score;
       }

       function mapCompositeScore(row, testMetadata) {
           var score = {};
           var testNumber = testMetadata.TEST + testMetadata.CODE;
           var developedAbilityScore = row.getField("DEVELOPED_ABILITY_AGE_STANDARDISED_SCORE");
           var spellingScore = row.getField("SPELLING_AGE_STANDARDISED_SCORE");
           var readingScore = row.getField("READING_AGE_STANDARDISED_SCORE");
           var arithmeticScore = row.getField("ARITHMETIC_AGE_STANDARDISED_SCORE");
           var mathematicsScore = row.getField("MATHEMATICS_AGE_STANDARDISED_SCORE");
           if (developedAbilityScore === null || spellingScore === null || readingScore === null || arithmeticScore === null || mathematicsScore === null || isNaN(developedAbilityScore) || isNaN(spellingScore) || isNaN(readingScore) || isNaN(arithmeticScore) || isNaN(mathematicsScore))
           {
           return null;
           }

           developedAbilityScore = Math.round(developedAbilityScore);
           spellingScore = Math.round(spellingScore);
           readingScore = Math.round(readingScore);
           arithmeticScore = Math.round(arithmeticScore);
           mathematicsScore = Math.round(mathematicsScore);

           // Check for NaN values after rounding

           if (isNaN(developedAbilityScore) || isNaN(spellingScore) || isNaN(readingScore) || isNaN(arithmeticScore) || isNaN(mathematicsScore)) {
                   return null;
           }

           var totalScore = Math.round(developedAbilityScore + spellingScore + readingScore + arithmeticScore + mathematicsScore) ;
           var scoreText = Math.round(totalScore / 5 );
           var primaryResult = "";
           if (scoreText >= 0 && scoreText <= 90) {
               primaryResult = "D";
           }else if (scoreText >= 91 && scoreText <= 100) {
               primaryResult = "C";
           }else if (scoreText >= 101 && scoreText <= 110) {
               primaryResult = "B";
           }else if (scoreText >= 111) {
               primaryResult = "A";
           }
       	// Set score fields
       score["TEST_NUMBER"] = testNumber;
       score["TEST_SCORE_TEXT"] = scoreText;
       if(!isNaN(scoreText)){
           score["TEST_SCORE_VALUE"] = scoreText;
           score["TEST_SCALED_SCORE"] = scoreText;
       }
       score["TEST_PRIMARY_RESULT"] = primaryResult;
       return score;
       }

      function getAdminPeriodByDate(row, hierarchy){

       period = null;
       adminDate = null;
       defaultAdminDate = "09/07/" + hierarchy.SCHOOL_YEAR.substring(0, 4);
       if (defaultAdminDate == defaultAdminDate){
       period = "Fall";
       }else{
       period = "This Assessment is only for Fall"
       }
       return period;
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

           // Generate the assessmentAdminKey using hierarchy values and the converted date
           var assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_${hierarchy.SCHOOL_YEAR}";

           // Add natural key fields
           signature.getFormat().getNaturalKey().forEach(function(key) {
               assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
           });

           // Examples of adding additional values (if needed)
           // assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
           // assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);

           // Return the generated assessment admin key
           return assessmentAdminKey;
       }

       return module;
   }());