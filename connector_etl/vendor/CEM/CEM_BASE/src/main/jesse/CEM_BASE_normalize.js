var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CEM_BASE";
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
           {TEST: "CEM_BASE_", CODE:"LIT", NAME: "SOY_", FIELD: "_LITERACY_SCORE", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_BASE_", CODE:"MA", NAME: "SOY_", FIELD: "_MATHS_SCORE", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_BASE_", CODE:"OVR", NAME: "SOY_", FIELD: "_OVERALL_SCORE", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_BASE_", CODE:"LIT", NAME: "EOY_", FIELD: "_LITERACY_SCORE", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_BASE_", CODE:"MA", NAME: "EOY_", FIELD: "_MATHS_SCORE", MAP_FUNCTION: mapScaledScore}
          ,{TEST: "CEM_BASE_", CODE:"OVR", NAME: "EOY_", FIELD: "_OVERALL_SCORE", MAP_FUNCTION: mapScaledScore}
       ];
//SOY_STANDARDISED_MATHS_SCORE
       /***************************************************************************
        Assessment-specific decodes
        ***************************************************************************/
        //TODO add any additional decodes
       var gradeDecode = {
           "EC2O": "02",
           "EC2Y": "02",
           "EC2G": "02",
           "" : null,
           null : null
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
           var record = {};
           var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

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
                       record.REPORTING_PERIOD = "ALL";
                       break;
                   case "ASSESSMENT_VENDOR":
                       record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                       break;
                   case "ASSESSMENT_PRODUCT":
                       record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                       break;
                   case "TEST_ADMIN_DATE":
                       record.TEST_ADMIN_DATE = _util.coalesce(AppUtil.getDateObjByPattern(row.getField("DATETIME_OF_SOY"), "dd/MM/yyyy").STANDARD_DATE,'05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
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
                       record.STUDENT_FIRST_NAME = row.getField('STUDENT_FIRST_NAME');
                       break;
                   case "STUDENT_LAST_NAME":
                       record.STUDENT_LAST_NAME = row.getField('STUDENT_LAST_NAME');
                       break;
                   case "STUDENT_MIDDLE_NAME":
                       record.STUDENT_MIDDLE_NAME = row.getField('STUDENT_MIDDLE_NAME');
                       break;
                   case "STUDENT_GENDER_CODE":
                       record.STUDENT_GENDER_CODE = row.getField('GENDER');
                       break;
                   case "STUDENT_GRADE_CODE":
                       record.STUDENT_GRADE_CODE = gradeDecode[row.getField('GRADE')];
                       break;

                   // School Information
                   case "SCHOOL_VENDOR_ID":
                       record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                       break;
                   case "SCHOOL_LOCAL_ID":
                       record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                       break;
                   case "SCHOOL_STATE_ID":
                       record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                       break;
                   case "SCHOOL_NAME":
                       record.SCHOOL_NAME = row.getField("SCHOOL_NAME");
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
           var interDesc = AppUtil.getDateObjByPattern(row.getField("DATETIME_OF_EOY"), "dd/MM/yyyy").STANDARD_DATE;
           admin.TEST_INTERVENTION_DESC = interDesc;
           return admin;
       }

       /***********************************************************************************
        Assessment-specific score functions
        ***********************************************************************************/
       //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
       function mapScaledScore(row, testMetadata) {
               var score = {};
               var testNumber = testMetadata.TEST + testMetadata.NAME + testMetadata.CODE;
               var scaleScore = row.getField(testMetadata.NAME + "STANDARDISED" + testMetadata.FIELD);
          	   var rawScore = row.getField(testMetadata.NAME + "AGE_ADJUSTED_STANDARDISED" + testMetadata.FIELD);
          	   var growthResult = row.getField(testMetadata.NAME + "PROGRESS_COMPARISON" + testMetadata.FIELD);
          	   var age = row.getField(testMetadata.NAME + "AGE_IN_MONTHS");
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

               if (rawScore != null && !isNaN(rawScore)) {
                    rawScore = Math.round(rawScore);
               } else
               {
               return null;
               }
               var secondaryResult = "";
               if (rawScore <= 90) {
                    secondaryResult = "D";
               }else if (rawScore >= 91 && rawScore <= 100) {
                    secondaryResult = "C";
               }else if (rawScore >= 101 && rawScore <= 110) {
                    secondaryResult = "B";
               }else if (rawScore >= 111) {
                    secondaryResult = "A";
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
               score["TEST_GROWTH_RESULT"] = growthResult;
               score["TEST_SCORE_ATTRIBUTES"] = age;
               score["TEST_RAW_SCORE"] = rawScore;
               score["TEST_PRIMARY_RESULT"] = primaryResult;
               score["TEST_SECONDARY_RESULT"] = secondaryResult;

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