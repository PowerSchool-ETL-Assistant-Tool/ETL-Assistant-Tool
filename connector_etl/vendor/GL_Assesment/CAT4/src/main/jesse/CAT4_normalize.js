var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "CAT4";
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
        //regular CAT4 scores
        {TEST: "CAT4_", CODE:"VERB_OVR", FIELD: "VERBAL_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CAT4_", CODE:"QUANT_OVR", FIELD: "QUANTITATIVE_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CAT4_", CODE:"NON_VERB_OVR", FIELD: "NON_VERBAL_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CAT4_", CODE:"SPATIAL_OVR", FIELD: "SPATIAL_", MAP_FUNCTION: mapScaledScore}
        ,{TEST: "CAT4_", CODE:"SPATIAL_SUB1", FIELD:"SPATIAL_SUBTEST1", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CAT4_", CODE:"SPATIAL_SUB2",FIELD:"SPATIAL_SUBTEST2", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CAT4_", CODE:"VERB_SUB1",FIELD:"VERBAL_SUBTEST1", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CAT4_", CODE:"VERB_SUB2",FIELD:"VERBAL_SUBTEST2", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CAT4_", CODE:"QUANT_SUB1",FIELD:"QUANTITATIVE_SUBTEST1", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CAT4_", CODE:"QUANT_SUB2",FIELD:"QUANTITATIVE_SUBTEST2", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CAT4_", CODE:"NON_VERB_SUB1",FIELD:"NON_VERBAL_SUBTEST1", MAP_FUNCTION: mapStrandScore}
        ,{TEST: "CAT4_", CODE:"NON_VERB_SUB2",FIELD:"NON_VERBAL_SUBTEST2", MAP_FUNCTION: mapStrandScore}

        //CAT4 KS2 Scores
        ,{TEST: "CAT4_KS2_", CODE:"ENGLISH",FIELD:"KS2_ENGLISH_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS2_", CODE:"READING",FIELD:"KS2_READING_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS2_", CODE:"GRAMMAR_PUNCTUATION_&_SPELLING",FIELD:"KS2_GRAMMAR_PUNCTUATION_&_SPELLING_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS2_", CODE:"WRITING",FIELD:"KS2_WRITING_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS2_", CODE:"SCIENCE",FIELD:"KS2_SCIENCE_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS2_", CODE:"MATHS",FIELD:"KS2_MATHS_", MAP_FUNCTION: mapKsStrandLevels}

        //CAT4 KS1 Scores
        ,{TEST: "CAT4_KS1", CODE:"ENGLISH",FIELD:"KS1_ENGLISH_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS1_", CODE:"SCIENCE",FIELD:"KS1_SCIENCE_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS1_", CODE:"MATHS",FIELD:"KS1_MATHS_", MAP_FUNCTION: mapKsStrandLevels}

        //CAT4 KS3 Scores
        ,{TEST: "CAT4_KS3_", CODE:"ENGLISH",FIELD:"KS3_ENGLISH_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"SCIENCE",FIELD:"KS3_SCIENCE_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"MATHS",FIELD:"KS3_MATHS_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"ART",FIELD:"KS3_ART_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"D&T",FIELD:"KS3_D&T_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"GEOGRAPHY",FIELD:"KS3_GEOGRAPHY_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"HISTORY",FIELD:"KS3_HISTORY_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"ICT",FIELD:"KS3_ICT_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"MFL",FIELD:"KS3_MFL_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"MUSIC",FIELD:"KS3_MUSIC_", MAP_FUNCTION: mapKsStrandLevels}
        ,{TEST: "CAT4_KS3_", CODE:"PE",FIELD:"KS3_PE_", MAP_FUNCTION: mapKsStrandLevels}

        //CAT4 GCSE Scores
        ,{TEST: "CAT4_GCSE_", CODE:"ART_&_DESIGN",FIELD:"GCSE_ART_&_DESIGN_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"BIOLOGY",FIELD:"GCSE_BIOLOGY_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"BUSINESS",FIELD:"GCSE_BUSINESS_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"CHEMISTRY",FIELD:"GCSE_CHEMISTRY_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"CITIZENSHIP_STUDIES",FIELD:"GCSE_CITIZENSHIP_STUDIES_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"COMPUTER_SCIENCE",FIELD:"GCSE_COMPUTER_SCIENCE_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"DESIGN_&_TECHNOLOGY",FIELD:"GCSE_DESIGN_&_TECHNOLOGY_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"DRAMA",FIELD:"GCSE_DRAMA_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"ENGLISH_LANGUAGE",FIELD:"GCSE_ENGLISH_LANGUAGE_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"ENGLISH_LITERATURE",FIELD:"GCSE_ENGLISH_LITERATURE_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"FOOD_PREPARATION_AND_NUTRITION",FIELD:"GCSE_FOOD_PREPARATION_AND_NUTRITION_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"FRENCH",FIELD:"GCSE_FRENCH_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"GEOGRAPHY",FIELD:"GCSE_GEOGRAPHY_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"GERMAN",FIELD:"GCSE_GERMAN_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"HISTORY",FIELD:"GCSE_HISTORY_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"ICT",FIELD:"GCSE_ICT_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"MATHS",FIELD:"GCSE_MATHS_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"MEDIA_STUDIES",FIELD:"GCSE_MEDIA_STUDIES_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"MUSIC",FIELD:"GCSE_MUSIC_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"PHYSICAL_EDUCATION",FIELD:"GCSE_PHYSICAL_EDUCATION_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"PHYSICS",FIELD:"GCSE_PHYSICS_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"RELIGIOUS_STUDIES",FIELD:"GCSE_RELIGIOUS_STUDIES_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"SCIENCE_COMBINED",FIELD:"GCSE_SCIENCE_COMBINED_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"SOCIOLOGY",FIELD:"GCSE_SOCIOLOGY_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"SPANISH",FIELD:"GCSE_SPANISH_", MAP_FUNCTION: mapGCSEStrandScores}
        ,{TEST: "CAT4_GCSE_", CODE:"STATISTICS",FIELD:"GCSE_STATISTICS_", MAP_FUNCTION: mapGCSEStrandScores}

        //CAT4 AS Scores
        ,{TEST: "CAT4_AS_", CODE:"ACCOUNTING",FIELD:"AS_ACCOUNTING", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"ART_AND_DESIGN",FIELD:"AS_ART_AND_DESIGN", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"BIOLOGY",FIELD:"AS_BIOLOGY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"BUSINESS_STUDIES",FIELD:"AS_BUSINESS_STUDIES", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"CHEMISTRY",FIELD:"AS_CHEMISTRY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"COMPUTER_SCIENCE",FIELD:"AS_COMPUTER_SCIENCE", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"DESIGN_AND_TECHNOLOGY",FIELD:"AS_DESIGN_AND_TECHNOLOGY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"ECONOMICS",FIELD:"AS_ECONOMICS", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"ENGLISH_LANGUAGE",FIELD:"AS_ENGLISH_LANGUAGE", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"ENGLISH_LITERATURE",FIELD:"AS_ENGLISH_LITERATURE", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"FINANCE",FIELD:"AS_FINANCE", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"FRENCH",FIELD:"AS_FRENCH", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"GEOGRAPHY",FIELD:"AS_GEOGRAPHY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"GOVERNMENT_AND_POLITICS",FIELD:"AS_GOVERNMENT_AND_POLITICS", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"HISTORY",FIELD:"AS_HISTORY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"LAW",FIELD:"AS_LAW", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"MATHS",FIELD:"AS_MATHS", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"MEDIA_STUDIES",FIELD:"AS_MEDIA_STUDIES", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"PHYSICAL_EDUCATION",FIELD:"AS_PHYSICAL_EDUCATION", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"PHYSICS",FIELD:"AS_PHYSICS", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"PSYCHOLOGY",FIELD:"AS_PSYCHOLOGY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"RELIGIOUS_STUDIES",FIELD:"AS_RELIGIOUS_STUDIES", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"SOCIOLOGY",FIELD:"AS_SOCIOLOGY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_AS_", CODE:"SPANISH",FIELD:"AS_SPANISH", MAP_FUNCTION: mapAsStrandScores}

        //CAT4 A Scores
        ,{TEST: "CAT4_A_", CODE:"ART_AND_DESIGN",FIELD:"A_ART_AND_DESIGN", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"BIOLOGY",FIELD:"A_BIOLOGY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"BUSINESS_STUDIES",FIELD:"A_BUSINESS_STUDIES", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"CHEMISTRY",FIELD:"A_CHEMISTRY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"CLASSICAL_CIVILISATION",FIELD:"A_CLASSICAL_CIVILISATION", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"COMPUTER_SCIENCE",FIELD:"A_COMPUTER_SCIENCE", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"DESIGN_AND_TECHNOLOGY",FIELD:"A_DESIGN_AND_TECHNOLOGY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"DRAMA_AND_THEATRE",FIELD:"A_DRAMA_AND_THEATRE", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"ECONOMICS",FIELD:"A_ECONOMICS", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"ENGLISH_LANGUAGE",FIELD:"A_ENGLISH_LANGUAGE", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"ENGLISH_LITERATURE",FIELD:"A_ENGLISH_LITERATURE", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"FRENCH",FIELD:"A_FRENCH", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"GEOGRAPHY",FIELD:"A_GEOGRAPHY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"GOVERNMENT_AND_POLITICS",FIELD:"A_GOVERNMENT_AND_POLITICS", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"HISTORY",FIELD:"A_HISTORY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"LAW",FIELD:"A_LAW", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"MATHS",FIELD:"A_MATHS", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"MEDIA_STUDIES",FIELD:"A_MEDIA_STUDIES", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"MUSIC",FIELD:"A_MUSIC", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"PHYSICAL_EDUCATION",FIELD:"A_PHYSICAL_EDUCATION", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"PHYSICS",FIELD:"A_PHYSICS", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"PSYCHOLOGY",FIELD:"A_PSYCHOLOGY", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"RELIGIOUS_STUDIES",FIELD:"A_RELIGIOUS_STUDIES", MAP_FUNCTION: mapAsStrandScores}
        ,{TEST: "CAT4_A_", CODE:"SOCIOLOGY",FIELD:"A_SOCIOLOGY", MAP_FUNCTION: mapAsStrandScores}
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
       "1" : "Low"
       ,"2" : "Low"
       ,"3" : "Low Average"
       ,"4" : "Low Average"
       ,"5" : "Average"
       ,"6" : "High Average"
       ,"7" : "High Average"
       ,"8" : "High"
       ,"9" : "High"
       ,"0" : null
       ,"" : null
       ,null : null
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

    function dateConverter(dateString) {
        var dateParts, dateObj, year, month, day;
        // Check for the presence of time and strip it out for initial processing
        var timeIndex = dateString.indexOf(" ");
        if (timeIndex !== -1) {
          dateString = dateString.split(" ")[0];
        }
        // Replace dashes with slashes for consistent processing
        dateString = dateString.replace(/-/g, '/');
        // Handle YYYY/MM/DD or YYYY/DD/MM
        if (dateString.match(/^\d{4}\/\d{2}\/\d{2}$/)) {
          dateParts = dateString.split('/');
          if (dateParts[1] > 12) { // It's in YYYY/DD/MM format
              dateString = dateParts[0] + '/' + dateParts[2] + '/' + dateParts[1];
          }
        }
        // Handle DD/MM/YYYY
        else if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
          dateParts = dateString.split('/');
          if (parseInt(dateParts[0], 10) > 12) {
              dateString = dateParts[1] + '/' + dateParts[0] + '/' + dateParts[2];
          }
        }
        dateObj = new Date(dateString);
        month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
        day = ('0' + dateObj.getDate()).slice(-2);
        year = dateObj.getFullYear();
        var finalDate =  month + '/' + day + '/' + year;
        return { finalDates: finalDate, months: month, days: day, years: year };
    }
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var finalBirthDate;
        var birthDate = row.getField("STUDENT_BIRTHDATE");
            if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
            if(signature.getFormat().getFormatName() === "CAT4_60_COLS") {
                finalBirthDate = dateConverter(birthDate).finalDates;
            }else{
                finalBirthDate = dateConverter(birthDate).finalDates;
            }
            }

        var testAdminDate;
        var testAdminDateParse = row.getField("TEST_ADMIN_DATE");
              if(testAdminDateParse !== undefined && testAdminDateParse !== null && testAdminDateParse !== "") {
              if (signature.getFormat().getFormatName() === "CAT4_60_COLS") {
                    testAdminDate = dateConverter(testAdminDateParse).finalDates;
             } else {
                  testAdminDate = dateConverter(testAdminDateParse).finalDates;
             }
             }
        var flName = row.getRawField("LINEAGE_FILE").toString().toUpperCase();
        var fileName =  flName.substring(flName.lastIndexOf('/')+1).replaceAll('%20','_');

        var grade = null;
        if(fileName.indexOf("GRADE1") > -1){
            grade = "01";
        }else if(fileName.indexOf("GRADE2") > -1 || fileName.indexOf("G2") > -1){
            grade = "02";
        }else if(fileName.indexOf("GRADE3") > -1 || fileName.indexOf("GRADE_3") > -1 || fileName.indexOf("G3") > -1){
            grade = "03";
        }else if(fileName.indexOf("GRADE4") > -1 || fileName.indexOf("G4") > -1){
            grade = "04";
        }else if(fileName.indexOf("GRADE5") > -1 || fileName.indexOf("GRADE_5") > -1 || fileName.indexOf("G5") > -1){
            grade = "05";
        }else if(flName.indexOf("GRADE6") > -1 || flName.indexOf("G6") > -1){
            grade = "06";
        }else if(fileName.indexOf("GRADE7") > -1 || fileName.indexOf("GRADE_7") > -1 || flName.indexOf("G7") > -1){
            grade = "07";
        }else if(fileName.indexOf("GRADE8") > -1 || flName.indexOf("G8") > -1){
            grade = "08";
        }else if(fileName.indexOf("GRADE9") > -1 || fileName.indexOf("GRADE_9") > -1 || fileName.indexOf("G9") > -1){
            grade = "09";
        }else if(fileName.indexOf("GRADE10") > -1 || fileName.indexOf("G10") > -1){
            grade = "10";
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
                    record.TEST_ADMIN_DATE = testAdminDate;
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_VENDOR_ID")
                        ,row.getField("STATE_STUDENT_ID_VERSION_1")
                        ,row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                         row.getField("STUDENT_VENDOR_ID")
                        ,row.getField("STATE_STUDENT_ID_VERSION_1")
                        ,row.getField("STATE_STUDENT_ID_VERSION_2")
                        ,row.getField("STUDENT_ID")
                    );
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
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER")+"-").substring(0,1);
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(grade, null);
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = _util.coalesce((dateConverter(birthDate).months), null);
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = _util.coalesce((dateConverter(birthDate).days), null);
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = _util.coalesce((dateConverter(birthDate).years), null);
                    break;

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_VENDOR_ID"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_VENDOR_ID"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOL_NUMBER"), row.getField("SCHOOL_VENDOR_ID"));
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

        return admin;
    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/
    //TODO update scoring functions to match what is set up in scoresToMap for the fields provided
    function mapScaledScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "SAS");
		var achievLevel = row.getField(testMetadata.FIELD + "STANINE");
        var percentile = row.getField(testMetadata.FIELD + "NPR");
        var ovrSAS = row.getField("MEAN_SAS");
        var rawScore = row.getField(testMetadata.FIELD + "TOTAL_RAW_SCORE");
        var testAttemptNumber = row.getField(testMetadata.FIELD + "NO_ATTEMPT");
        var passDecode = null;

        // Check for key fields and do not map score and exit if conditions met.
        if(( scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "")
           &&(achievLevel === null || achievLevel === undefined || _util.trim(achievLevel) === "--" || _util.trim(achievLevel) === "")
           &&(percentile === null || percentile === undefined || _util.trim(percentile) === "--" || _util.trim(percentile) === "")
           &&(ovrSAS === null || ovrSAS === undefined || _util.trim(ovrSAS) === "--" || _util.trim(ovrSAS) === "")
           &&(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")){
            return null;
        }

        if (ovrSAS >=50 && ovrSAS < 75 ){
            passDecode = "No";
        }else if(ovrSAS >= 75 && ovrSAS <= 145) {
            passDecode = "Yes";
        }
        // The below logic is for stanine scores - UIHN-50133
         if (ovrSAS <= 73 ){
              var scoreAttributes = "01";
         }else if(ovrSAS <= 81) {
                    scoreAttributes = "02";
         }else if(ovrSAS <= 88) {
                    scoreAttributes = "03";
         }else if(ovrSAS <= 96) {
                    scoreAttributes = "04";
         }else if(ovrSAS <= 103) {
                    scoreAttributes = "05";
         }else if(ovrSAS <= 111) {
                    scoreAttributes = "06";
         }else if(ovrSAS <= 118) {
                    scoreAttributes = "07";
         }else if(ovrSAS <= 126) {
                    scoreAttributes = "08";
         }else if(ovrSAS >= 127) {
                    scoreAttributes = "09";
         }
    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
        score["TEST_SCORE_VALUE"] = parseInt(scaleScore);
        score["TEST_SCALED_SCORE"] = parseInt(scaleScore);
        }

        if(testAttemptNumber !== undefined && testAttemptNumber !== null && testAttemptNumber !== "" && !isNaN(testAttemptNumber) && testAttemptNumber ){
            score["TEST_ATTEMPT_NUMBER"] = parseInt(testAttemptNumber);
        }

    	score["TEST_PASSED_INDICATOR"] = passDecode;
        score["TEST_PRIMARY_RESULT_CODE"] = parseInt(achievLevel);
    	score["TEST_PRIMARY_RESULT"] = primaryDecode[achievLevel];
        score["TEST_STANINE_SCORE"] = parseInt(achievLevel);
        score["TEST_SCORE_TO_PREDICTED_RESULT"] = parseInt(ovrSAS);
    	score["TEST_PERCENTILE_SCORE"] = parseInt(percentile);
        score["TEST_RAW_SCORE"] = parseInt(rawScore);
        score["TEST_SCORE_ATTRIBUTES"] = scoreAttributes;

        return score;

    }


	 function mapStrandScore(row, testMetadata) {
	    var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");
	    score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        if(!isNaN(scaleScore)){
        score["TEST_SCORE_VALUE"] = parseInt(scaleScore);
        score["TEST_SCALED_SCORE"] = parseInt(scaleScore);
        }
        return score;
     }

     function mapKsStrandLevels(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var ksLevel = row.getField(testMetadata.FIELD + "LEVEL");
        var ksLevelIfChallenged = row.getField(testMetadata.FIELD + "LEVEL_IF_CHALLENGED");
        var ksRetrospectiveLevel = row.getField(testMetadata.FIELD + "RETROSPECTIVE_LEVEL");

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = ksLevel;
        score["TEST_PRIMARY_RESULT"] = ksLevel;
        score["TEST_SECONDARY_RESULT"] = ksLevelIfChallenged;
        score["TEST_TERTIARY_RESULT"] = ksRetrospectiveLevel;

        return score;
     }

     function mapGCSEStrandScores(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var gcseGrades = row.getField(testMetadata.FIELD + "GRADE");
        var gcseGradesIfChallenged = row.getField(testMetadata.FIELD + "GRADE_IF_CHALLENGED");
        var gcsePointsScale = row.getField(testMetadata.FIELD + "POINTS_SCALE");
        var gcsePointsScaleIfChallenged = row.getField(testMetadata.FIELD + "POINTS_SCALE_IF_CHALLENGED");
        var attainmentEightScore = row.getField("ATTAINMENT_8_SCORE");
        var gcseProbOfGradeFiveEngMath = row.getField("GCSE_PROB_OF_GRADE_5_OR_ABOVE_IN_ENGLISH_AND_MATHS");
        var gcseProbOfGradeFivePlusNineToFiveEngMath = row.getField("GCSE_PROB_OF_5_GRADES_9_5_INC_ENGLISH_AND_MATHS");
        var gcseProbOfGradeFivePlusAtoCEngMath = row.getField("GCSE_PROB_OF_5_A_TO_C_INC_ENGLISH_AND_MATHS");

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = gcseGrades;
        score["TEST_PRIMARY_RESULT"] = gcseGrades;
        score["TEST_SECONDARY_RESULT"] = gcseGradesIfChallenged;

        //clean up GCSE probability scores
        if(gcseProbOfGradeFiveEngMath){
        gcseProbOfGradeFiveEngMath = gcseProbOfGradeFiveEngMath.replace(/%\s*$/, "");
        }

        if(gcseProbOfGradeFivePlusNineToFiveEngMath){
        gcseProbOfGradeFivePlusNineToFiveEngMath = gcseProbOfGradeFivePlusNineToFiveEngMath.replace(/%\s*$/, "");4
        }

        if(gcseProbOfGradeFivePlusAtoCEngMath){
        gcseProbOfGradeFivePlusAtoCEngMath = gcseProbOfGradeFivePlusAtoCEngMath.replace(/%\s*$/, "");
        }

        //Map GCSE probability scores
        score["TEST_GROWTH_TARGET_1"] = gcseProbOfGradeFiveEngMath;
        score["TEST_GROWTH_TARGET_2"] = gcseProbOfGradeFivePlusNineToFiveEngMath;
        score["TEST_GROWTH_TARGET_3"] = gcseProbOfGradeFivePlusAtoCEngMath;

        //Map point Scale Scores
        if((gcsePointsScale === undefined && gcsePointsScale === null && gcsePointsScale === "")
        && (gcsePointsScaleIfChallenged === undefined && gcsePointsScaleIfChallenged === null && gcsePointsScaleIfChallenged === "")
        && (!isNaN(gcsePointsScale) && !isNaN(gcsePointsScaleIfChallenged))
        && (gcsePointsScale === "--" && gcsePointsScaleIfChallenged === "--")){
            return null;
        } else {
            score["TEST_SCALED_SCORE"] = parseInt(gcsePointsScale);
            score["TEST_RAW_SCORE"] = parseInt(gcsePointsScaleIfChallenged);
        }

        //Map 8th Attainment Score
        if(attainmentEightScore) {
         if(attainmentEightScore !== undefined && attainmentEightScore!== null && attainmentEightScore !== "--" && attainmentEightScore !== "" && !isNaN(attainmentEightScore)){
            score["TEST_SCORE_VALUE"] = parseInt(attainmentEightScore);
         }
        }

        return score;
     }

     function mapAsStrandScores(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + testMetadata.CODE;
        var asGrades = row.getField(testMetadata.FIELD);
        var asGradesIfChallenged = row.getField(testMetadata.FIELD + "_IF_CHALLENGED");

        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = asGrades;
        score["TEST_PRIMARY_RESULT"] = asGrades;
        score["TEST_SECONDARY_RESULT"] = asGradesIfChallenged;

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
        return assessmentAdminKey;
    }

    return module;
}());