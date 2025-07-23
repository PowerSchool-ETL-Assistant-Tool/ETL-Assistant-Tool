var AppNormalize = (function() {
	var module = {};
	var _thisModuleName = "AppNormalize";
	var _assessmentIdentifier = "AP_PSAT_SAT";
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
				.transform("ADD LINEAGE FIELD", ["RECORDS"], function(output, json) {

					json.LINEAGE_FILE = fileFullName;
					json.LINEAGE_LINE = (++lineNumber).toString();
					output.RECORDS.put(json);
				})
				.group_by("ADMINISTRATION GROUPING", function(one, two) {

					try {
						var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
						var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

						return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
					} catch (exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
					}

				})
				.transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function(output, rows) {
					try {
						if (!multipleRowsPerGroupingExpected && rows.length > 1) {

							//Report error for each row
							rows.forEach(function(row) {
								AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
							});

						} else {
							output.RECORDS.put(rows);
						}
					} catch (exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
					}
				})
				.transform("NORMALIZE RECORDS", ["RECORDS"],
					function(output, rows) {
						try {

							var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

							normalizedRecords.forEach(function(record) {
								output.RECORDS.put(record);
							});

						} catch (exception) {
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
						}


					})
				.transform("SCORE COUNT CHECK", ["RECORDS"], function(output, row) {
					try {
						var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

						// Report when no scores are found.
						if (mappingObject.SCORE_MAPPINGS.length === 0) {
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING", row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
						} else {
							output.RECORDS.put(row);
						}
					} catch (exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
					}
				})
				.output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\", false))
				.execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

			return normalizedFile;

		} catch (exception) {
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
		// Latest SAT
		{
			TEST: "AP_PSAT_SAT",
			CODE: "TOT_MR",
			FIELD: "SAT_TOTAL_SCORE",
			MAP_FUNCTION: mapTotalScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ERW_MR",
			FIELD: "SAT_ERW_SCORE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "MA_MR",
			FIELD: "SAT_MATH_SCORE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ER_MR",
			FIELD: "SAT_ESSAY_READING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EA_MR",
			FIELD: "SAT_ESSAY_ANALYSIS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EW_MR",
			FIELD: "SAT_ESSAY_WRITING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "RD_MR",
			FIELD: "SAT_TEST_SCORE_READING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "WR_MR",
			FIELD: "SAT_TEST_SCORE_WRITING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "MATH_MR",
			FIELD: "SAT_TEST_SCORE_MATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EVI_MR",
			FIELD: "SAT_SUBSCORE_EVIDENCE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CONT_MR",
			FIELD: "SAT_SUBSCORE_CONTEXT",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EXP_MR",
			FIELD: "SAT_SUBSCORE_EXPRESSIDEAS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CONV_MR",
			FIELD: "SAT_SUBSCORE_CONVENTIONS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ALG_MR",
			FIELD: "SAT_SUBSCORE_ALGEBRA",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "PS_MR",
			FIELD: "SAT_SUBSCORE_PROBLEMSOLVING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "AM_MR",
			FIELD: "SAT_SUBSCORE_ADVANCEDMATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "SOCI_MR",
			FIELD: "SAT_CROSS_TEST_SCORE_HISTORY_SOCIALSTUDIES",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "SCI_MR",
			FIELD: "SAT_CROSS_TEST_SCORE_SCIENCE",
			MAP_FUNCTION: mapScore
		}

		//Highest Composite SAT
		, {
			TEST: "AP_PSAT_SAT",
			CODE: "TOT_HC",
			NAME: "SAT_TOTAL_SCORE",
			MAP_FUNCTION: mapTotalScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ERW_HC",
			NAME: "SAT_ERW_SCORE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "MA_HC",
			NAME: "SAT_MATH_SCORE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ER_HC",
			NAME: "SAT_ESSAY_READING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EA_HC",
			NAME: "SAT_ESSAY_ANALYSIS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EW_HC",
			NAME: "SAT_ESSAY_WRITING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "RD_HC",
			NAME: "SAT_TEST_SCORE_READING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "WR_HC",
			NAME: "SAT_TEST_SCORE_WRITING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "MATH_HC",
			NAME: "SAT_TEST_SCORE_MATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EVI_HC",
			NAME: "SAT_SUBSCORE_EVIDENCE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CONT_HC",
			NAME: "SAT_SUBSCORE_CONTEXT",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EXP_HC",
			NAME: "SAT_SUBSCORE_EXPRESSIDEAS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CONV_HC",
			NAME: "SAT_SUBSCORE_CONVENTIONS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ALG_HC",
			NAME: "SAT_SUBSCORE_ALGEBRA",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "PS_HC",
			NAME: "SAT_SUBSCORE_PROBLEMSOLVING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "AM_HC",
			NAME: "SAT_SUBSCORE_ADVANCEDMATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "SOCI_HC",
			NAME: "SAT_CROSS_TEST_SCORE_HISTORY_SOCIALSTUDIES",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "SCI_HC",
			NAME: "SAT_CROSS_TEST_SCORE_SCIENCE",
			MAP_FUNCTION: mapScore
		}
		//GR", MAP_FUNCTION
		//", MAP_FUNCTION
		// Additional subjects
		, {
			TEST: "AP_PSAT_SAT",
			CODE: "ARTHIS",
			FIELD: "ARTHIS",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "",
			FIELD: "TOTAL",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ARTSTD",
			FIELD: "ARTSTD",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ARTST2",
			FIELD: "ARTST2",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ART3D",
			FIELD: "ART3D",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "BIOL",
			FIELD: "BIOL",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CALCAB",
			FIELD: "CALCAB",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CALCBC",
			FIELD: "CALCBC",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CHEM",
			FIELD: "CHEM",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CHINES",
			FIELD: "CHINES",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "COMSCA",
			FIELD: "COMSCA",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ECONMA",
			FIELD: "ECONMA",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ECONMI",
			FIELD: "ECONMI",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ENGLAN",
			FIELD: "ENGLAN",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ENGLIT",
			FIELD: "ENGLIT",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ENVSCI",
			FIELD: "ENVSCI",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "EURHIS",
			FIELD: "EURHIS",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "FRNLAN",
			FIELD: "FRNLAN",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "GERLA",
			FIELD: "GERLA",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "GOVCOM",
			FIELD: "GOVCOM",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "GOVUS",
			FIELD: "GOVUS",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "HUMGEO",
			FIELD: "HUMGEO",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "ITAL",
			FIELD: "ITAL",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "JAPAN",
			FIELD: "JAPAN",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "LATIN",
			FIELD: "LATINV",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "MUSIC",
			FIELD: "MUSICT",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "PHYSM",
			FIELD: "PHYSM",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "PHYSEM",
			FIELD: "PHYSEM",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "PSYCH",
			FIELD: "PSYCH",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "SPANLA",
			FIELD: "SPANLA",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "SPANLT",
			FIELD: "SPANLT",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "STAT",
			FIELD: "STAT",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "USHIST",
			FIELD: "USHIST",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "WDHIST",
			FIELD: "WDHIST",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "PHYS1",
			FIELD: "PHYS1",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "PHYS2",
			FIELD: "PHYS2",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CPSTNS",
			FIELD: "CPSTNS",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "CPSTNR",
			FIELD: "CPSTNR",
			MAP_FUNCTION: mapAdditionalSubjectScore
		}, {
			TEST: "AP_PSAT_SAT",
			CODE: "COMSCP",
			FIELD: "COMSCP",
			MAP_FUNCTION: mapAdditionalSubjectScore
		},{
          	TEST: "AP_PSAT_SAT",
          	CODE: "CALSUBSCORE",
          	FIELD: "CALSUBSCORE",
          	MAP_FUNCTION: mapAdditionalSubjectScore
        },{
            TEST: "AP_PSAT_SAT",
            CODE: "2D_ARTDS",
            FIELD: "2D_ARTDS",
            MAP_FUNCTION: mapAdditionalSubjectScore
        },{
            TEST: "AP_PSAT_SAT",
            CODE: "DRAWNG",
            FIELD: "DRAWNG",
            MAP_FUNCTION: mapAdditionalSubjectScore
        },{
            TEST: "AP_PSAT_SAT",
            CODE: "HG",
            FIELD: "HG",
            MAP_FUNCTION: mapAdditionalSubjectScore
        },{
            TEST: "AP_PSAT_SAT",
            CODE: "MACECO",
            FIELD: "MACECO",
            MAP_FUNCTION: mapAdditionalSubjectScore
        }

		//PSAT
		, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_TOTAL",
			FIELD: "_TOTAL",
			MAP_FUNCTION: mapTotalScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_ERW",
			FIELD: "_ERW",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_MA",
			FIELD: "_MATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_RD",
			FIELD: "_TEST_SCORE_READING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_WR",
			FIELD: "_TEST_SCORE_WRITING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_MATH",
			FIELD: "_TEST_SCORE_MATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_EVI",
			FIELD: "_SUBSCORE_EVIDENCE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_CONT",
			FIELD: "_SUBSCORE_CONTEXT",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_EXP",
			FIELD: "_SUBSCORE_EXPRESSIDEAS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_CONV",
			FIELD: "_SUBSCORE_CONVENTIONS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_ALG",
			FIELD: "_SUBSCORE_ALGEBRA",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_PS",
			FIELD: "_SUBSCORE_PROBLEMSOLVING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_SOC",
			FIELD: "_CROSS_TEST_SCORE_HISTORY_SOCIALSTUDIES",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_8_9",
			CODE: "PSAT_SCI",
			FIELD: "_CROSS_TEST_SCORE_SCIENCE",
			MAP_FUNCTION: mapScore
		}

		//NMSQT
		, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_TOT",
			FIELD: "_TOTAL",
			MAP_FUNCTION: mapTotalScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_ERW",
			FIELD: "_ERW",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_MA",
			FIELD: "_MATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_RD",
			FIELD: "_TEST_SCORE_READING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_WR",
			FIELD: "_TEST_SCORE_WRITING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_MATH",
			FIELD: "_TEST_SCORE_MATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_EVI",
			FIELD: "_SUBSCORE_EVIDENCE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_CONT",
			FIELD: "_SUBSCORE_CONTEXT",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_EXP",
			FIELD: "_SUBSCORE_EXPRESSIDEAS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_CONV",
			FIELD: "_SUBSCORE_CONVENTIONS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_ALG",
			FIELD: "_SUBSCORE_ALGEBRA",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_PS",
			FIELD: "_SUBSCORE_PROBLEMSOLVING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_AM",
			FIELD: "_SUBSCORE_ADVANCEDMATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_SOC",
			FIELD: "_CROSS_TEST_SCORE_HISTORY_SOCIALSTUDIES",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_NMSQT",
			CODE: "PSAT_SCI",
			FIELD: "_CROSS_TEST_SCORE_SCIENCE",
			MAP_FUNCTION: mapScore
		}

		//PSAT_10
		, {
			TEST: "PSAT_10",
			CODE: "PSAT_TOT",
			FIELD: "_TOTAL",
			MAP_FUNCTION: mapTotalScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_ERW",
			FIELD: "_ERW",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_MA",
			FIELD: "_MATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_RD",
			FIELD: "_TEST_SCORE_READING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_WR",
			FIELD: "_TEST_SCORE_WRITING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_MATH",
			FIELD: "_TEST_SCORE_MATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_EVI",
			FIELD: "_SUBSCORE_EVIDENCE",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_CONT",
			FIELD: "_SUBSCORE_CONTEXT",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_EXP",
			FIELD: "_SUBSCORE_EXPRESSIDEAS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_CONV",
			FIELD: "_SUBSCORE_CONVENTIONS",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_ALG",
			FIELD: "_SUBSCORE_ALGEBRA",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_PS",
			FIELD: "_SUBSCORE_PROBLEMSOLVING",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_AM",
			FIELD: "_SUBSCORE_ADVANCEDMATH",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_SOC",
			FIELD: "_CROSS_TEST_SCORE_HISTORY_SOCIALSTUDIES",
			MAP_FUNCTION: mapScore
		}, {
			TEST: "PSAT_10",
			CODE: "PSAT_SCI",
			FIELD: "_CROSS_TEST_SCORE_SCIENCE",
			MAP_FUNCTION: mapScore
		}

	];

	/***************************************************************************
	 Assessment-specific decodes
	 ***************************************************************************/
	var genderDecode = {
		"M": "Male",
		"F": "Female",
		"A": "Another",
		"U": "Unknown",
		"": null,
		null: null
	};

	var raceDecode = {
		"0": "No Response",
		"1": "American Indian or Alaska Native",
		"2": "Asian(including Indian and Philippines)",
		"3": "Black or African American",
		"4": "Hispanic or Latino",
		"8": "Native Hawaiian or Other Pacific Islander",
		"9": "White (including Middle Eastern origin)",
		"10": "Other",
		"12": "Two or more races, non-Hispanic",
		"": null,
		null: null
	};
    var performanceLevelDecode = {
            "1" : {DESC:  "No Recommendation" , PASS_IND: "No"}
            ,"2" : {DESC: "Possibly Qualified" ,  PASS_IND: "No"}
            ,"3" : {DESC: "Qualified" ,  PASS_IND: "Yes"}
            ,"4" : {DESC: "Well Qualified" ,  PASS_IND: "Yes"}
            ,"5" : {DESC: "Extremely Well Qualified" ,  PASS_IND: "Yes"}
            ,"" : { DESC: null, PASS_IND: null}
            ,null : { DESC: null, PASS_IND: null}
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
			} catch (exception) {
				AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",  row.getRawField("LINEAGE_LINE"), "Score mapping error: ${exception}", JSON.stringify(row)));
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

	function parseDate(rawDate) {

		var dateObj = {
			RAW_DATE: rawDate,
			MONTH: null,
			DAY: null,
			YEAR: null,
			STANDARD_DATE: null
		};

		// Exit if no value is provided.
		var formatter;
		if (_util.trim(_util.coalesce(rawDate, "")) === "") {
			return dateObj;
		}

		if (rawDate.length === 8 && rawDate.indexOf("/") > -1){
             formatter = new java.text.SimpleDateFormat("MM/dd/yy");
        } else if (rawDate.split("/")[0].length === 4 && rawDate.indexOf("/") > -1) {
             formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
        } else if (rawDate.length === 8 && rawDate.indexOf("-") > -1) {
             formatter = new java.text.SimpleDateFormat("MM-dd-yy");
        } else if (rawDate.split("-")[0].length === 4 && rawDate.indexOf("-") > -1) {
             formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        } else {
            if(rawDate.indexOf("/") > -1){
                formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
            } else if(rawDate.indexOf("-") > -1){
                formatter = new java.text.SimpleDateFormat("MM-dd-yyyy");
            }
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
		var birthDateObject = parseDate((row.getField("DATE_OF_BIRTH")));
		var testDateObject = parseDate(_util.coalesce(row.getField("SAT_ASMT_DT_MR"), row.getField("SAT_ASMT_DT_HC"), row.getField("PSAT_8_9_TEST_DT"), row.getField("PSAT_NMSQT_TEST_DT"), row.getField("PSAT_10_TEST_DT"), row.getField("TEST_DATE")));
		var testReportingObject = parseDate(row.getField("DATE_OF_THIS_REPORT"));

		normalizedFileFields.forEach(function(field) {
			switch (field) {
				case "ASSESSMENT_ADMIN_KEY":
					record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
					break;
				case "SYS_PARTITION_VALUE":
					record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
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
					record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, '05/15/' + hierarchy.SCHOOL_YEAR.substring(5, 9));
					break;
				case "TEST_REPORTING_DATE":
					record.TEST_REPORTING_DATE = testReportingObject.STANDARD_DATE;
					break;

					//Student Information
				case "STUDENT_STATE_ID":
					record.STUDENT_STATE_ID = _util.coalesce(row.getField("STUDENT_IDENTIFIER"), row.getField("AP_NUMBER"));
					break;
				case "STUDENT_VENDOR_ID":
					record.STUDENT_VENDOR_ID = _util.coalesce(row.getField("STUDENT_IDENTIFIER"), row.getField("AP_NUMBER"));
					break;
				case "STUDENT_FIRST_NAME":
					record.STUDENT_FIRST_NAME = row.getField('FIRST_NAME');
					break;
				case "STUDENT_LAST_NAME":
					record.STUDENT_LAST_NAME = row.getField('LAST_NAME');
					break;
				case "STUDENT_MIDDLE_NAME":
					record.STUDENT_MIDDLE_NAME = row.getField('MIDDLE_INITIAL');
					break;
				case "STUDENT_GENDER_CODE":
					record.STUDENT_GENDER_CODE = row.getField('GENDER');
					break;
				case "STUDENT_STREET_ADDRESS":
					record.STUDENT_STREET_ADDRESS = row.getField('STUDENT_STREET_ADDRESS_1');
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
					record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("INSTITUTION_NAME"), row.getField("SCHOOL_NAME"), row.getField("DISTRICT_CODE"));
					break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
				case "SCHOOL_LOCAL_ID":
				    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("AI_CODE"),row.getField("SCHOOL_LOCAL_ID"));
					break;
					//                case "SCHOOL_STATE_ID":
					//                     record.SCHOOL_STATE_ID = _util.coalesce(row.getField("ORGANIZATION" ),row.getField("SCHOOL_STATE_ID"));
					//                     break;
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
		//
		//        if(row.getField("ENG_LEARNER")==="1"||row.getField("ENG_LEARNER")==="2"){
		//            admin.STUDENT_LEP_CODE = row.getField("ENG_LEARNER");
		//        }
		//        admin.TEST_INTERVENTION_DESC = row.getField("INTERVENTION_CODE");

		return admin;
	}

	/***********************************************************************************
	 Assessment-specific score functions
	 ***********************************************************************************/

	function mapScore(row, testMetadata) {
		var score = {};
		var testNumber = testMetadata.TEST + '_' + testMetadata.CODE;
		var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "_MR"), row.getField(testMetadata.TEST + testMetadata.FIELD));
		var rawScore = row.getField(testMetadata.NAME + "_HC");
		// Check for key fields and do not map score and exit if conditions met.
		if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
			(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")) {
			return null;
		}

		// Set score fields
		score["TEST_NUMBER"] = testNumber;
		score["TEST_SCORE_TEXT"] = scaleScore;
		if (!isNaN(scaleScore)) {
			score["TEST_SCORE_VALUE"] = scaleScore;
			score["TEST_SCALED_SCORE"] = scaleScore;
		}
		if (!isNaN(rawScore)) {
			score["TEST_RAW_SCORE"] = rawScore;
		}
		return score;
	}

	function mapTotalScore(row, testMetadata) {
		var score = {};
		var testNumber = testMetadata.TEST + '_' + testMetadata.CODE;
		var scaleScore = _util.coalesce(row.getField(testMetadata.FIELD + "_MR"), row.getField(testMetadata.TEST + testMetadata.FIELD));
		var rawScore = row.getField(testMetadata.NAME + "_HC");
		// Check for key fields and do not map score and exit if conditions met.
		if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
			(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")) {
			return null;
		}

		// Set score fields
		score["TEST_NUMBER"] = testNumber;
		score["TEST_SCORE_TEXT"] = scaleScore;
		if (!isNaN(scaleScore)) {
			score["TEST_SCORE_VALUE"] = scaleScore;
			score["TEST_SCALED_SCORE"] = scaleScore;
		}
		if (!isNaN(rawScore)) {
			score["TEST_RAW_SCORE"] = rawScore;
		}
		return score;
	}

	function mapAdditionalSubjectScore(row, testMetadata) {
		var score = {};
		if (row.getField("ITEM_DESCRIPTION")) {
			var testNumber = generateTestNumber(row, testMetadata);
			var subject = row.getField("ITEM_DESCRIPTION");
		} else {
			var testNumber = testMetadata.TEST + '_' + testMetadata.FIELD;
		}
		var scaleScore = _util.coalesce(row.getField(testMetadata.CODE + "GR"), row.getField(testMetadata.TEST + testMetadata.FIELD), row.getField("SCALE_" + testMetadata.FIELD));
		var rawScore = _util.coalesce(row.getField(testMetadata.CODE + "YR"), row.getField("NUMERIC_" + testMetadata.FIELD));
		var perfLevel = row.getField("STANDARD_PERFORMANCE_LEVEL");
		// Set score fields
		if ((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
			(rawScore === null || rawScore === undefined || _util.trim(rawScore) === "--" || _util.trim(rawScore) === "")) {
			return null;
		}
		score["TEST_NUMBER"] = testNumber;
		score["TEST_SCORE_TEXT"] = scaleScore;
		if (!isNaN(scaleScore)) {
			score["TEST_SCORE_VALUE"] = scaleScore;
			score["TEST_SCALED_SCORE"] = scaleScore;

		}
		score["TEST_SCORE_TO_PREDICTED_RESULT"] = rawScore;
		score["TEST_SCORE_ATTRIBUTES"] = subject;
		score["TEST_PASSED_INDICATOR"] = performanceLevelDecode[perfLevel].PASS_IND;
		score["TEST_PRIMARY_RESULT_CODE"] = perfLevel;
		score["TEST_PRIMARY_RESULT"] = performanceLevelDecode[perfLevel].DESC;
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

			if (assessmentAdminKey_one === assessmentAdminKey_two) {
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
			assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key), "");
		});

		//Examples of adding additional values
		//assessmentAdminKey = assessmentAdminKey + "_" + fieldDecode[srcRecord.getField("FIELD")];
		//assessmentAdminKey = assessmentAdminKey + "_05/01/" + hierarchy.SCHOOL_YEAR.toString().substring(5,8);
		return assessmentAdminKey;
	}

	function generateTestNumber(row, testMetadata) {
		var sub = null;
		var testNumber = null;
		var SubjectName = row.getField("ITEM_DESCRIPTION").toUpperCase();
		if (SubjectName.indexOf('ART HISTORY') > -1) {
			sub = "ARTHIS";
		} else if (SubjectName.indexOf('BIOLOGY') > -1) {
			sub = "BIOL";
		} else if (SubjectName.indexOf('CALCULUS AB') > -1) {
			sub = "CALCAB";
		} else if (SubjectName.indexOf('CALCULUS BC') > -1) {
			sub = "CALCBC";
		} else if (SubjectName.indexOf('CHEMISTRY') > -1) {
			sub = "CHEM";
		} else if (SubjectName.indexOf('COMPUTER SCIENCE A') > -1) {
			sub = "COMSCA";
		} else if (SubjectName.indexOf('COMPUTER SCIENCE PRINCIPLES') > -1) {
			sub = "COMSCP";
		} else if (SubjectName.indexOf('ENVIRONMENTAL') > -1) {
			sub = "ENVSCI";
		} else if (SubjectName.indexOf('FRENCH') > -1) {
			sub = "FRNLAN";
		} else if (SubjectName.indexOf('GERMAN') > -1) {
			sub = "GERLA";
		} else if (SubjectName.indexOf('ITALIAN') > -1) {
			sub = "ITAL";
		} else if (SubjectName.indexOf('JAPANESE') > -1) {
			sub = "JAPAN";
		} else if (SubjectName.indexOf('SPANISH LANGUAGE') > -1) {
			sub = "SPANLA";
		} else if (SubjectName.indexOf('LATIN') > -1) {
			sub = "LATINV";
		} else if (SubjectName.indexOf('LITERATURE') > -1) {
			sub = "ENGLIT";
		} else if (SubjectName.indexOf('MACROECONOMICS') > -1) {
			sub = "ECONMA";
		} else if (SubjectName.indexOf('PHYSICS') > -1) {
			sub = "PHYS1";
		} else if (SubjectName.indexOf('PSYCHOLOGY') > -1) {
			sub = "PSYCH";
		} else if (SubjectName.indexOf('LANGUAGE') > -1) {
			sub = "ENGLAN";
		} else if (SubjectName.indexOf('STUDIO ART 2D') > -1) {
			sub = "ARTST2";
		} else if (SubjectName.indexOf('STUDIO ART 3D') > -1) {
			sub = "ART3D";
		} else if (SubjectName.indexOf('STUDIO ART DRAWING') > -1) {
			sub = "ARTSTD";
		} else if (SubjectName.indexOf('US HISTORY') > -1) {
			sub = "USHIST";
		} else if (SubjectName.indexOf('GOVERNMENT') > -1) {
			sub = "GOVUS";
		} else if (SubjectName.indexOf('WORLD HISTORY') > -1) {
			sub = "WDHIST";
		} else if (SubjectName.indexOf('STATISTICS') > -1) {
			sub = "STAT";
		}
		if (sub) {
			testNumber = testMetadata.TEST + '_' + sub + testMetadata.CODE;
		}
		return testNumber;
	}


	return module;
}());