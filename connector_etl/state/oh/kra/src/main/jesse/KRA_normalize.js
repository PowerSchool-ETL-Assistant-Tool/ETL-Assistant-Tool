var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "KRA";
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
     ***************************************************************************/

     //TODO update scoresToMap
    var scoresToMap = [
        {TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A101", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A104", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A121", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A115", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A117", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A138", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A123", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A143", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A147", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A149", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A152", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A174", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A177", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_A191", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_F115", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_C104", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_B191", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_B174", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_B123", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_B138", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_D143", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_D147", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_D149", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", FIELD2: "MA_LEVEL_G117", NAME: "MATHEMATICS", MAP_FUNCTION: mapMAScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B35", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B42", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_C43", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_C49", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B55", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_A58", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_C12", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_A25", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_A64", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B68", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_D69", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B32", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B43", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B49", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B58", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B64", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B12", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B69", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", FIELD2: "SF_LEVEL_B25", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapSFScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A160", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A127", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A180", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A163", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_H101", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_H103", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_H104", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_H106", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A155", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A195", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A164", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A132", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A130", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A136", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A134", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A19", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_B20", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_H106-R", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_H103-R", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_D160", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_D127", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_D180", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A101", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_B103", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_B104", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_C106", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_B164", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_C132", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_B130", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_B136", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", FIELD2: "LL_LEVEL_A106", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapLLScore}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD: "PD_", FIELD2: "PD_LEVEL_A01", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapPDScore}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD: "PD_", FIELD2: "PD_LEVEL_B05", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapPDScore}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD: "PD_", FIELD2: "PD_LEVEL_B06", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapPDScore}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD: "PD_", FIELD2: "PD_LEVEL_C08", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapPDScore}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD: "PD_", FIELD2: "PD_LEVEL_A10", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapPDScore}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD: "PD_", FIELD2: "PD_LEVEL_B09", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapPDScore}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD: "PD_", FIELD2: "PD_LEVEL_A15", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapPDScore}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD: "MA_", NAME: "MATHEMATICS", MAP_FUNCTION: mapComponentScore}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD: "SF_", NAME: "SOCIAL_FOUNDATION", MAP_FUNCTION: mapComponentScore}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD: "LL_", NAME: "LANGUAGE_AND_LITERACY", MAP_FUNCTION: mapComponentScore}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD: "PD_", NAME: "PHYSICAL_WELL_BEING_AND_MOTOR_DEVELOPMENT", MAP_FUNCTION: mapComponentScore}
        ,{TEST: "KRA_", CODE:"OVR_", FIELD: "OVERALL_", NAME: "OVERALL", MAP_FUNCTION: mapOverallScore}

//        for strand
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_COUNT", FIELD: "COUNT_TO_20", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_TELL_HOW_MANY", FIELD: "TELL_HOW_MANY", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_NUMRLS", FIELD: "NAME_NUMERALS", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_ADD_PRBLM", FIELD: "SOLVE_SIMPLE_ADDITION_PROBLEM", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_SHAPES", FIELD: "NAME_SHAPES", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_SAME_NUMBER", FIELD: "IDENTIFY_SET_THAT_HAS_THE_SAME_NUMBER_AS", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_LESS_THAN", FIELD: "IDENTIFY_SET_THAT_IS_LESS_THAN", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_PAIR_NUMERALS", FIELD: "PAIR_NUMERALS_WITH_SETS", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_DTRMIN_AMNT", FIELD: "DETERMINE_AMOUNT_NEEDED_TO_COMPLETE", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_ONE_ATRIBT", FIELD: "SORT_BY_ONE_ATTRIBUTE", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_HIGT", FIELD: "COMPARE_HEIGHT", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"MATH_", FIELD1: "MA_OBJBYSIZE", FIELD: "ORDER_OBJECTS_BY_SIZE", NAME: "MATHEMATICS", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_MATSHAPES", FIELD: "MATCH_SHAPES", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_PRPOSTN", FIELD: "USE_PREPOSITIONS", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_WOR_LTRS", FIELD: "DISTINGUISH_WORDS_FROM_LETTERS", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_RHYMIG_WRDV1", FIELD: "IDENTIFY_RHYMING_WORDS_V1", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_RHYMIG_WRDV2", FIELD: "IDENTIFY_RHYMING_WORDS_V2", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_BEGSNDV1", FIELD: "IDENTIFY_BEGINNING_SOUND", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_BEGSNDV2", FIELD: "IDENTIFY_BEGINNING_SOUND", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_STRDTL_G2", FIELD: "ANSWER_QUESTION_ABOUT_STORY_DETAIL_G2", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_STRDTL_G3", FIELD: "ANSWER_QUESTION_ABOUT_STORY_DETAIL_G3", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_STR_SQUN_G", FIELD: "IDENTIFY_STORY_SEQUENCE_G", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_NONS_SVRS", FIELD: "NAME_NOUNS_AND_VERBS", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_LTRS_UC", FIELD: "NAME_LETTERS_UPPERCASE", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_LTRS_LC", FIELD: "NAME_LETTERS_LOWERCASE", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_LTRSND", FIELD: "MAKE_LETTER_SOUNDS", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"LANGUAGE_LITERACY_", FIELD1: "LL_READ", FIELD: "DEMONSTRATE_HOW_PRINT_IS_READ", NAME: "LANGUAGE AND LITERACY", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_CONV", FIELD: "ENGAGE_IN_CONVERSATIONS", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_FN", FIELD: "WRITE_FIRST_NAME", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_REFVARSPECOM", FIELD: "USE_WORDS_THAT_REFLECT_VARIETY_SPECIFICITY_AND_COMPLEXITY", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_EX_EMO", FIELD: "EXPRESS_OWN_EMOTIONS", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_ADULTS", FIELD: "ASK_FAMILIAR_ADULTS_FOR_HELP", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_IMPBEH", FIELD: "CONTROL_IMPULSES_AND_BEHAVIOR", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_TAKTURN", FIELD: "WAIT_TO_TAKE_TURNS", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_FNACT", FIELD: "FOCUS_ON_ACTIVITIES", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_MULSTDIR", FIELD: "FOLLOW_MULTI-STEP_DIRECTIONS", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_SOLPROB", FIELD: "SOLVE_PROBLEMS", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_DESTLER", FIELD: "EXPRESS_A_DESIRE_TO_LEARN", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_PRTNDPLY", FIELD: "ENGAGE_WITH_PEERS_IN_PRETEND_PLAY", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_MATWPRS", FIELD: "SHARE_MATERIALS_WITH_PEERS", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"SOCIAL_", FIELD1: "SF_WHYRULNEED", FIELD: "EXPLAIN_WHY_RULES_ARE_NEEDED", NAME: "SOCIAL FOUNDATION", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_CROWENV", FIELD: "MOVE_THROUGH_A_CROWDED_ENVIRONMENT", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_RJTW", FIELD: "RUN,_JUMP,_AND/OR_HOP", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_BSTWS", FIELD: "BEND,_STRETCH,_AND/OR_TWIST", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_HOLDSCIS", FIELD: "HOLD_SCISSORS", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_WRITOOL", FIELD: "HOLD_WRITING_TOOL", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_BSFTYRULS", FIELD: "FOLLOW_BASIC_SAFETY_RULES", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_ADLTHLP", FIELD: "SHOW_OR_EXPLAIN_WAYS_THAT_ADULTS_HELP_TO_KEEP_PEOPLE_SAFE", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_PCARTSK", FIELD: "COMPLETE_PERSONAL_CARE_TASKS", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}
        ,{TEST: "KRA_", CODE:"PHYSICAL_MOTOR_", FIELD1: "PD_BHPRAC", FIELD: "FOLLOW_BASIC_HEALTH_PRACTICES", NAME: "PHYSICAL WELL BEING AND MOTOR DEVELOPMENT", MAP_FUNCTION: mapstrandScores}

    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

    var studentLevelDecode = {
        //Set in TOL-44
       "0" : {CODE: "0" , DESC: "Wrong Answer"}
       ,"1" : {CODE: "1" , DESC: "Partially Correct Answer"}
       ,"2" : {CODE: "2" , DESC: "Half Or More Of The Answer Is Correct"}
       ,"3" : {CODE: "3" , DESC: "Correct Answer"}
       ,"NS" : {CODE: "NS" , DESC: "Not Score"}
       //TOL-44 March 25, 2022, 9:35 AM
                //Hi Josh -
                //Scott has consulted our local SME on KRA (Jeff Wagner).  He took this to KRA directly and they could not tell him what the decodes should be either, so I guess we should just ignore these fields.
       ,"*0" : {CODE: "*0" , DESC: "N/A"}
       ,"*1" : {CODE: "*1" , DESC: "N/A"}
       ,"*2" : {CODE: "*2" , DESC: "N/A"}
       ,"*3" : {CODE: "*3" , DESC: "N/A"}
       //For SF and PD only, represent points
       ,"N" : {CODE: "0" , DESC: "Not Evident"}
       ,"I" : {CODE: "1", DESC: "In Progress"}
       ,"E" : {CODE: "E", DESC: "Evident"}
       ,"P" : {CODE: "2", DESC: "P"}
       ,"" : {CODE: "" , DESC: ""}
       ,null : {CODE: null , DESC: null}
    };

    var pldRecode = {
       "Demonstrating Readiness" : "DR"
       ,"Approaching Readiness" : "AR"
       ,"Emerging Readiness" : "ER"
       ,"" : null
       ,null : null
    };
    var genderDecodes = {
       "1" : "M"
       ,"2" : "F"
       ,"FEMALE": "F"
       ,"MALE": "M"
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
        var birthDateObject = parseDate(row.getField("STUDENT_DOB"));

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
                    record.TEST_ADMIN_DATE = getDefaultTestAdminDate(hierarchy.SCHOOL_YEAR.substring(5), hierarchy.PERIOD);
                    break;

                //Student Information
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STATE_STUDENT_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STATE_STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("DISTRICT_STUDENT_ID")
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
                    record.STUDENT_GENDER_CODE = genderDecodes[row.getField("STUDENT_GENDER")];
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
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"), row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                     record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("SCHOOL_ID"));
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
    function mapMAScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD2;
            var scaleScore = row.getField(testMetadata.FIELD + "SCORE");
            var achieveLevel = row.getField(testMetadata.FIELD2);
            var sem = row.getField(testMetadata.FIELD + "SEM");

            if(_util.trim(achieveLevel) === null || _util.trim(achieveLevel) === undefined || _util.trim(achieveLevel) === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = studentLevelDecode[achieveLevel].DESC;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }
            if(!isNaN(sem)){
                score["TEST_STANDARD_ERROR"] = sem;
            }
            score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            score["TEST_PRIMARY_RESULT"] = studentLevelDecode[achieveLevel].DESC;
            return score;
        } catch (err) {
            print("Error message : ${err}\n");
        }
    }

    function mapSFScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD2;
            var scaleScore = row.getField(testMetadata.FIELD + "SCORE");
            var achieveLevel = row.getField(testMetadata.FIELD2);
            var sem = row.getField(testMetadata.FIELD + "SEM");

            if(_util.trim(achieveLevel) === null || _util.trim(achieveLevel) === undefined || _util.trim(achieveLevel) === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = studentLevelDecode[achieveLevel].DESC;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }
            if(!isNaN(sem)){
                score["TEST_STANDARD_ERROR"] = sem;
            }
            score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            score["TEST_PRIMARY_RESULT"] = studentLevelDecode[achieveLevel].DESC;
            return score;
        } catch (err) {
            print("Error message : ${err}\n");
        }
    }

    function mapLLScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD2;
            var scaleScore = row.getField(testMetadata.FIELD + "SCORE");
            var achieveLevel = row.getField(testMetadata.FIELD2);
            var sem = row.getField(testMetadata.FIELD + "SEM");

            if(_util.trim(achieveLevel) === null || _util.trim(achieveLevel) === undefined || _util.trim(achieveLevel) === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = studentLevelDecode[achieveLevel].DESC;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }
            if(!isNaN(sem)){
                score["TEST_STANDARD_ERROR"] = sem;
            }
            score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            score["TEST_PRIMARY_RESULT"] = studentLevelDecode[achieveLevel].DESC;
            return score;
        } catch (err) {
            print("Error message : ${err}\n");
        }
    }

    function mapPDScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD2;
            var scaleScore = row.getField(testMetadata.FIELD2 + "SCORE");
            var achieveLevel = row.getField(testMetadata.FIELD2);
            var sem = row.getField(testMetadata.FIELD2 + "SEM");

            if(_util.trim(achieveLevel) === null || _util.trim(achieveLevel) === undefined || _util.trim(achieveLevel) === "") {
                return null;
            }

            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = studentLevelDecode[achieveLevel].DESC;
            if(!isNaN(scaleScore)){
                score["TEST_SCORE_VALUE"] = scaleScore;
                score["TEST_SCALED_SCORE"] = scaleScore;
            }
            if(!isNaN(sem)){
                score["TEST_STANDARD_ERROR"] = sem;
            }
            score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
            score["TEST_PRIMARY_RESULT"] = studentLevelDecode[achieveLevel].DESC;
            return score;
        } catch (err) {
            print("Error message : ${err}\n");
        }
    }
    function mapComponentScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.NAME;
            var overallScore = row.getField(testMetadata.FIELD + "SCORE");
            var sem = row.getField(testMetadata.FIELD + "SEM");

            if(overallScore === null
                || overallScore === undefined
                || _util.trim(overallScore) === "--"
                || _util.trim(overallScore) === "") {
                return null;
            }
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = overallScore;
            if(!isNaN(overallScore)){
                score["TEST_SCORE_VALUE"] = overallScore;
                score["TEST_SCALED_SCORE"] = overallScore;
              //  if(testMetadata.NAME === "LANGUAGE_AND_LITERACY"){
              if(overallScore >= 270){
                                      score["TEST_PRIMARY_RESULT"] = "Demonstrating Readiness";
                                      score["TEST_PRIMARY_RESULT_CODE"] = "DR";
                                      score["TEST_PASSED_INDICATOR"] = "Yes";
                                  }else if(overallScore >= 258){
                                      score["TEST_PRIMARY_RESULT"] = "Approaching Readiness";
                                      score["TEST_PRIMARY_RESULT_CODE"] = "AR";
                                      score["TEST_PASSED_INDICATOR"] = "No";
                                  }else if(overallScore >= 202){
                                      score["TEST_PRIMARY_RESULT"] = "Emerging Readiness";
                                      score["TEST_PRIMARY_RESULT_CODE"] = "ER";
                                      score["TEST_PASSED_INDICATOR"] = "No";
                                  }
                              }
                   /* if(overallScore >= 263){
                        score["TEST_PRIMARY_RESULT"] = "On Track";
                        score["TEST_PRIMARY_RESULT_CODE"] = "OT";
                    }
                    else{
                        score["TEST_PRIMARY_RESULT"] = "Not On Track";
                        score["TEST_PRIMARY_RESULT_CODE"] = "NOT";
                    }*/
                //}

            if(!isNaN(sem)){
                score["TEST_STANDARD_ERROR"] = sem;
            }
         return score;

        } catch (err) {
            print("Error message in component score : ${err}\n");
        }
        }

    function mapOverallScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + testMetadata.NAME;
            var overallScore = row.getField(testMetadata.FIELD + "SCORE");
            var sem = row.getField(testMetadata.FIELD + "SEM");
            var pld = row.getField("PLD");

            if(overallScore === null
                || overallScore === undefined
                || _util.trim(overallScore) === "--"
                || _util.trim(overallScore) === "") {
                return null;
            }
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = overallScore;
            if(!isNaN(overallScore)){
                score["TEST_SCORE_VALUE"] = overallScore;
                score["TEST_SCALED_SCORE"] = overallScore;
            }
            if(!isNaN(sem)){
                score["TEST_STANDARD_ERROR"] = sem;
            }
            score["TEST_PRIMARY_RESULT"] = pld;
            score["TEST_PRIMARY_RESULT_CODE"] = pldRecode[pld];
            return score;
        } catch (err) {
            print("Error message : ${err}\n");
        }
    }
    function mapstrandScores(row, testMetadata){
             var score = {};
             var testNumber = testMetadata.TEST + testMetadata.CODE + testMetadata.FIELD1;
             var achieveLevel = row.getField(testMetadata.FIELD1);
             if(_util.trim(achieveLevel) === null || _util.trim(achieveLevel) === undefined || _util.trim(achieveLevel) === "") {
                 return null;
             }

             score["TEST_NUMBER"] = testNumber;
             score["TEST_SCORE_TEXT"] = studentLevelDecode[achieveLevel].DESC;
             if(!isNaN(achieveLevel)){
                 score["TEST_SCORE_VALUE"] = achieveLevel;
                 score["TEST_SCALED_SCORE"] = achieveLevel;
             }
             score["TEST_PRIMARY_RESULT_CODE"] = achieveLevel;
             score["TEST_PRIMARY_RESULT"] = studentLevelDecode[achieveLevel].DESC;
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

    function getDefaultTestAdminDate(schoolYear, period) {
        let defaultTestAdminDate;
        if (schoolYear) {
            if (period) {
                period = period.toUpperCase();
            }
            switch (period) {
                case 'FALL':
                    defaultTestAdminDate = '09/15/' + schoolYear;
                    break;
                case 'WINTER':
                    defaultTestAdminDate = '01/15/' + schoolYear;
                    break;
                case 'SPRING':
                    defaultTestAdminDate = '05/15/' + schoolYear;
                    break;
                default:
                    defaultTestAdminDate = '05/15/' + schoolYear;
                    break;
            }
        } else {
            throw new Error("School Year not provided for default TEST_ADMIN_DATE");
        }
        return defaultTestAdminDate;
    }

        function parseDate(rawDate) {

            var dateObj = {
                RAW_DATE: null
                , MONTH: null
                , DAY: null
                , YEAR: null
                , STANDARD_DATE: null
            };
            var formatter;
            // Exit if no value is provided.
            if (_util.trim(_util.coalesce(rawDate, "")) === "") {
                return dateObj;
            }

            if (rawDate.indexOf('/') !== -1 && rawDate.split('/')[2].length === 4) {
                formatter = new java.text.SimpleDateFormat('MM/dd/yyyy');
            } else if (rawDate.indexOf('/') !== -1 && rawDate.split("/")[2].length === 2){
               rawDate.split("/")[2] = '20' + rawDate.split("/")[2];
                formatter = new java.text.SimpleDateFormat('MM/dd/yy');
            } else if (rawDate.indexOf('-') !== -1 && rawDate.substring(4, 5) === '-') {
                formatter = new java.text.SimpleDateFormat('yyyy-MM-dd');
            } else if (rawDate.indexOf('-') !== -1 && rawDate.substring(2, 3) === '-') {
                formatter = new java.text.SimpleDateFormat('dd-MM-yyyy');
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