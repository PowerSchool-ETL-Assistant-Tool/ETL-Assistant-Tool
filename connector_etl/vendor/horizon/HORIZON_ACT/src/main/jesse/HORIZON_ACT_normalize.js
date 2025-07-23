var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "HORIZON_ACT";
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
        {TEST: "HOR_ACT", CODE:"EN", FIELD: "ENGLISH", MAP_FUNCTION: mapScaledScore}
        , { TEST: "HOR_ACT", CODE: "MA", FIELD: "MATH", MAP_FUNCTION: mapScaledScore }
        , { TEST: "HOR_ACT", CODE: "RD", FIELD: "READING", MAP_FUNCTION: mapScaledScore }
        , { TEST: "HOR_ACT", CODE: "SCI", FIELD: "SCIENCE", MAP_FUNCTION: mapScaledScore }


        , { TEST: "HOR_ACT", CODE: "POW", FIELD: "PRODUCTION_OF_WRITING", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "KOL", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "CSE", FIELD: "CONVENTIONS_OF_STANDARD_ENGLISH", MAP_FUNCTION: mapRawScore }

        , { TEST: "HOR_ACT", CODE: "PHM", FIELD: "PREP_HIGHER_MATH", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "NQ", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "ALG", FIELD: "ALGEBRA", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "FUNC", FIELD: "FUNCTIONS", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "GEO", FIELD: "GEOMETRY", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "STATPRO", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "IES", FIELD: "INTEGRATING_ESSENTIAL_SKILLS", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "MODEL", FIELD: "MODELING", MAP_FUNCTION: mapRawScore }

        , { TEST: "HOR_ACT", CODE: "KID", FIELD: "KEY_IDEAS_DETAILS", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "CAS", FIELD: "CRAFT_AND_STRUCTURE", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "IKI", FIELD: "INTEGRATION_OF_KNOWLEDGE_AND_IDEAS", MAP_FUNCTION: mapRawScore }

        , { TEST: "HOR_ACT", CODE: "ID", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "SI", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapRawScore }
        , { TEST: "HOR_ACT", CODE: "EMIER", FIELD: "EVAL_OF_MODELS_INFERENCES_EXP_RESULTS", MAP_FUNCTION: mapRawScore }
        //English standard scores
        , { TEST: "HOR_ACT", CODE: "ORG_201", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_301", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_302", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_401", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_402", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_403", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_404", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_405", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_501", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_502", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_503", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_504", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_505", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_601", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_602", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_603", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_604", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_701", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ORG_702", FIELD: "ORGANIZATION_UNITY_AND_COHESION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_201", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_301", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_302", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_303", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_401", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_402", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_403", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_501", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_502", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_503", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_504", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_601", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_602", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_603", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_701", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_702", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TOD_703", FIELD: "TOPIC_DEVELOPMENT_IN_TERMS_OF_PURPOSE_&_FOCUS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_201", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_301", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_302", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_401", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_402", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_403", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_404", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_501", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_502", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_503", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_504", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_505", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_601", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_602", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_603", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_604", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_701", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "KLA_702", FIELD: "KNOWLEDGE_OF_LANGUAGE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_201", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_301", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_302", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_401", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_402", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_403", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_404", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_501", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_502", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_503", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_504", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_601", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_602", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_603", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_604", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_701", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PUN_702", FIELD: "PUNCTUATION_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_201", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_202", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_301", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_302", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_401", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_501", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_502", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_601", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_602", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SST_701", FIELD: "SENTENCE_STRUCTURE_AND_FORMATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_201", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_202", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_301", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_302", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_303", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_304", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_305", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_401", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_402", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_403", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_404", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_501", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_502", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_503", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_601", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_602", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_603", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_701", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "USG_702", FIELD: "USAGE_CONVENTIONS", MAP_FUNCTION: mapStandardScore }

        //Math standard scores
        , { TEST: "HOR_ACT", CODE: "AF_201", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_201", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_202", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_301", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_302", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_303", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_304", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_301", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_302", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_303", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_401", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_402", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_403", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_401", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_402", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_403", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_404", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_405", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_406", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_501", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_507", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_508", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_509", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_510", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_511", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_512", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_513", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_514", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_502", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_503", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_501", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_502", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_503", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_504", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_505", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_506", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_601", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_606", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_602", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_603", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_604", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_601", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_602", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_603", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_604", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_605", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_701", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_702", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_703", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_704", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_705", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "AF_706", FIELD: "ALGEBRA_FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_701", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_702", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "A_703", FIELD: "ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_201", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_201", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_301", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_302", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_303", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_304", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_301", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_401", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_402", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_403", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_401", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_501", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_507", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_508", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_509", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_510", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_511", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_502", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_503", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_501", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_502", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_503", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_504", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_505", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_506", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_601", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_602", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_603", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_604", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_601", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_602", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_603", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_604", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_701", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_704", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_705", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_706", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_707", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_702", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_703", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_704", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_705", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "FA_706", FIELD: "FUNCTIONS_ALGEBRA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_701", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_702", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "F_703", FIELD: "FUNCTIONS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_201", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_203", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_202", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_203", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_301", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_302", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_303", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_304", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_401", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_402", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_403", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_404", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_405", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_406", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_407", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_501", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_510", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_511", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_512", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_502", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_503", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_504", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_505", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_506", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_507", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_508", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_509", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_601", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_602", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_603", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_604", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_605", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_606", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_607", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_608", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_609", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_701", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_702", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_703", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "G_704", FIELD: "GEOMETRY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_201", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_202", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_203", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_301", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_302", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_303", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_401", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_402", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_403", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_404", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_405", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_406", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_501", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_502", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_503", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_504", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_505", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_601", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_602", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_603", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_604", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_605", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_606", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_607", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_701", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_702", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_703", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_704", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_705", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "N_706", FIELD: "NUMBER_AND_QUANTITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_201", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_202", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_301", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_302", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_303", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_304", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_305", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_401", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_402", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_403", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_404", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_405", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_301", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_501", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_502", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_503", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_504", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_505", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_506", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_701", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_702", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_703", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_704", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "S_705", FIELD: "STATISTICS_AND_PROBABILITY", MAP_FUNCTION: mapStandardScore }
        //Reading
        , { TEST: "HOR_ACT", CODE: "PPV_201", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_301", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_401", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_402", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_501", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_502", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_503", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_601", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_602", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_701", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "PPV_702", FIELD: "PURPOSE_AND_POINT_OF_VIEW", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_201", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_301", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_302", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_401", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_402", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_403", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_404", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_501", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_502", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_503", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_504", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_505", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_601", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_602", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_603", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_701", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_702", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "TST_703", FIELD: "TEXT_STRUCTURE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_201", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_301", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_302", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_401", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_402", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_501", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_502", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_503", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_504", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_601", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_602", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_603", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_701", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_702", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "WME_703", FIELD: "WORD_MEANINGS_AND_WORD_CHOICE", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_201", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_301", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_401", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_402", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_501", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_502", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_503", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_601", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_602", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_701", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_702", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "ARG_703", FIELD: "ARGUMENTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SYN_201", FIELD: "MULTIPLE_TEXTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SYN_301", FIELD: "MULTIPLE_TEXTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SYN_401", FIELD: "MULTIPLE_TEXTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SYN_501", FIELD: "MULTIPLE_TEXTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SYN_601", FIELD: "MULTIPLE_TEXTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SYN_701", FIELD: "MULTIPLE_TEXTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_201", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_202", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_301", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_302", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_401", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_402", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_403", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_404", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_501", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_502", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_503", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_504", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_505", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_506", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_601", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_602", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_603", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_604", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_605", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_701", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_702", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_703", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_704", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_705", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "CLR_706", FIELD: "CLOSE_READING", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_201", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_301", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_401", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_402", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_403", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_501", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_502", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_503", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_601", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_602", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_701", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IDT_702", FIELD: "CENTRAL_IDEAS_THEMES_AND_SUMMARIES", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_201", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_202", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_301", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_302", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_401", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_402", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_403", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_501", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_502", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_503", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_504", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_505", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_601", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_602", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_603", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_604", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_605", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_701", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_702", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_703", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_704", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "REL_705", FIELD: "RELATIONSHIPS", MAP_FUNCTION: mapStandardScore }
        //Science scores
        , { TEST: "HOR_ACT", CODE: "EMI_201", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_301", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_302", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_401", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_402", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_403", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_404", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_501", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_502", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_503", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_504", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_505", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_601", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_602", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_603", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_701", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "EMI_702", FIELD: "EVALUATION_MODELS_INFERENCES_ANDEXPERIMENTAL_RESULTS", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_201", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_202", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_203", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_301", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_302", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_303", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_304", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_401", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_402", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_403", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_404", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_501", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_502", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_503", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_504", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_505", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_601", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_602", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_603", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_701", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "IOD_702", FIELD: "INTERPRETATION_OF_DATA", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_201", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_202", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_301", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_302", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_303", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_401", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_402", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_403", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_404", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_405", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_501", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_502", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_503", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_601", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_602", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_701", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_702", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }
        , { TEST: "HOR_ACT", CODE: "SIN_703", FIELD: "SCIENTIFIC_INVESTIGATION", MAP_FUNCTION: mapStandardScore }

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
       "Does Not Meet Benchmark" : "1"
       ,"Did Not Meet Benchmark" : "1"
       ,"Does not Meet Benchmark" : "1"
       , "At/Above Benchmark" : "2"
       ,"" : null
       ,null : null
      };

    var passDecode = {
       "At/Above Benchmark" : "Yes"
       ,"Does Not Meet Benchmark" : "No"
       ,"Does not Meet Benchmark" : "No"
       ,"Did Not Meet Benchmark" : "No"
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
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        //TODO make sure all fields in this function are set appropriately or removed if not used
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
        var birthDateObject = AppUtil.getDateObjByPattern(row.getField("STUDENT_BIRTHDATE"), "yyyy-MM-dd");

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
                    record.REPORTING_PERIOD = _util.coalesce(row.getField("ADMINISTRATION"),hierarchy.REPORTING_PERIOD);
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = getTestAdminDate(row, hierarchy);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID_VERSION_1")
                        , row.getField("STATE_STUDENT_ID_VERSION_2")
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
                    record.STUDENT_GENDER_CODE = _util.trim(row.getField("GENDER"));
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

                //School Information
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOLCODE"), row.getField("SCHOOL_LOCAL_ID"),row.getField("SCHOOL_STATE_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOLCODE"));
                     break;
                case "SCHOOL_STATE_ID":
                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("SCHOOLCODE"));
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
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");
		var performance = row.getField("PERFORMANCE_LEVEL");

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""){
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;

    	score["TEST_PASSED_INDICATOR"] = passDecode[performance];
    	score["TEST_PRIMARY_RESULT_CODE"] = primaryDecode[performance];
    	score["TEST_PRIMARY_RESULT"] = performance;

        return score;
    }
    function mapStandardScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var scaleScore = row.getField(testMetadata.CODE);

        // Check for key fields and do not map score and exit if conditions met.
        if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === ""){
            return null;
        }

        // Set score fields
        score["TEST_NUMBER"] = testNumber;
        score["TEST_SCORE_TEXT"] = scaleScore;
        score["TEST_SCORE_VALUE"] = scaleScore;
        score["TEST_SCALED_SCORE"] = scaleScore;
        return score;
    }

    function mapRawScore(row, testMetadata) {
        var score = {};
        var testNumber = testMetadata.TEST + "_" + testMetadata.CODE;
        var rawScore = row.getField(testMetadata.FIELD + "_RAW_SCORE");

        // Check for key fields and do not map score and exit if conditions met.
        if(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "") {
            return null;
        }

    	// Set score fields
    	score["TEST_NUMBER"] = testNumber;
    	score["TEST_SCORE_TEXT"] = rawScore;
        score["TEST_SCORE_VALUE"] = rawScore;
        score["TEST_RAW_SCORE"] = rawScore;

        return score;
    }


    function getTestAdminDate(row, hierarchy) {
        var date = null;
        var period = _util.coalesce(row.getField("ADMINISTRATION"),hierarchy.REPORTING_PERIOD);

        if(period === "FALL" || period === "Fall"){
           date = "09/15/" + hierarchy.SCHOOL_YEAR.substring(0, 4)
        }

        else if(period === "WINTER" || period === "Winter"){
                date = "01/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9)
        }

        else if (period === "SPRING" || period === "Spring" || period === "ALL"){
                 date = "05/15/" + hierarchy.SCHOOL_YEAR.substring(5, 9)
        }
        return date;
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