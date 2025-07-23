var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "MASTERY_CONNECT";
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
    var scoresToMap = [
     // Mathematics
     {TEST: "MASTERY_CONN_", CODE: "MA_OVERALL", FIELD:"_OVERALL_MA", MAP_FUNCTION: mapComponentScore}
     // Mathematics 03 Fall/Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SOLVE_PROB_IMEIT_LIQVOL_MASOBJ", FIELD:"MD.A_03_FALL_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_USE_PLACE_VUPOPMDA", FIELD:"NBT.A_03_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_REP_SOLV_PROB_INV_MULT_DIV", FIELD:"OA.A_03_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UND_PROP_MULT_RBMD", FIELD:"OA.B_03_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     // Mathematics 04 Fall/Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_EST_SOLVE_PROB_MEAS", FIELD:"MD_04_FALL_WINTER_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEN_UND_MULT_DIGT_WHOL_NUM", FIELD:"NBT.A_04_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_PLAC_UND_PROP_OP_MULT_DIGT_ARTH", FIELD:"NBT.B_04_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
      // Mathematics 05 Fall/Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UND_PLAC_VAL_SYS", FIELD:"NBT.A_05_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_PERF_OP_MULT_DIG_WHL_NUM_DEC_ONEHDTH", FIELD:"NBT.B_05_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_WR_INT_NUM_EXP", FIELD:"OA.A_05_FALL_WINTER", MAP_FUNCTION: mapStrandScore}
      // Mathematics 06 Fall/Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SOLV_REAL_WRLD_MAPROB_AREA_SURF_VOLM", FIELD:"G.A_06_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UND_RATO_CONC_RATO_REASN_SOLV_PROB", FIELD:"RP.A_06_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     // Mathematics 07 Fall/Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_DRW_CONST_DESC_GEOMFIG", FIELD:"G.A_07_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SOLV_REAL_MA_PROB_ANGL_ARA_SURF_VOL", FIELD:"G.B_07_FALL_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ANLZ_PROP_REALNSHP_SOLV_REALWLD_MA_PROB", FIELD:"RP.A_07_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     // Mathematics 08 Fall/Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UNDSTND_CONN_BTW_PROPREALNSHP_LN_LNREQ", FIELD:"EE.B_08_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UNDSTND_DESC_TRANS_TWODIMFIG_FACT_ANGL", FIELD:"G.A.A", MAP_FUNCTION: mapStrandScore}
     // Geometry 08 Fall/Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOM_OVERALL", FIELD:"_OVERALL_MA_GEOM", MAP_FUNCTION: mapComponentScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOM_CONGRU_UND_TRM_MOT_GEOM_THERM", FIELD:"G.CO_GEOM_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOM_SIMILARITY_RT_TRI_TRIG", FIELD:"G.SRT_GEOM_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOM_EXPRES_GEOM_PROP_EQUATNS", FIELD:"G.GPE_GEOM_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     // Algebra Fall/Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_OVERALL", FIELD:"_OVERALL_MA_ALG", MAP_FUNCTION: mapComponentScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_CREAT_EQUATNS", FIELD:"A.CED_ALG_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_REASN_EQUATNS_INEQUALTS", FIELD:"A.REI_ALG_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_SEE_STRUCTR_EXP", FIELD:"A.SSE_ALG_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_INTPRET_FUNCTNS", FIELD:"F.IF_ALG_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_QUANTITIES", FIELD:"N.Q_ALG_FALL_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}

     // Mathematics Spring
     // Mathematics 03 Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_REPRESNT_INTERPRT_DATA", FIELD:"MD.B", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOMTRIC_MEASUREMENT_UACARAMA", FIELD:"MD.C_03_FALL_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOMTRIC_MEASUREMENT_RPAPF_DBLAM", FIELD:"MD.D", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_DEVLOP_UND_FRACT_NUM", FIELD:"NF.A_03_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_REPRENT_SOLV_PROB_MULTI_DIV", FIELD:"QA.A", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UND_PROP_MULTI_RELANSHP_MULTI_DIV", FIELD:"QA.B", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_MULT_DIVID_WITHIN_100", FIELD:"QA.C", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SOLV_PROB_FOUR_OPR_IEPA", FIELD:"QA.D", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_REASON_SHAPES_ATTRIB", FIELD:"G.A", MAP_FUNCTION: mapStrandScore}

     // Mathematics 04 Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_DRAW_ILACSPLA", FIELD:"G.A_04_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     //,{TEST: "MASTERY_CONN_", CODE: "MA_EST_SOLVE_PROB_MEAS_RIDGMUCAMA", FIELD:"MD_04_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_EXND_UND_FRACT_EQUIV_COMP", FIELD:"NF.A_04_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_BLD_FRACT_BY_APPLY_EPUOWN", FIELD:"NF.B", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UND_DEC_NOT_FRACT_COMP_DEC_FRACT", FIELD:"NF.C", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_USE_FOUR_OPER_WHL_NUM_SOLV_PROB", FIELD:"QA.A_04_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GAIN_FAM_FACT_MULTP", FIELD:"QA.B_04_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEN_ANALYZE_PROB", FIELD:"QA.C_04_SPRING", MAP_FUNCTION: mapStrandScore}
     // Mathematics 05 Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GRAPH_PTS_SOLV_REALWRLD_PROB", FIELD:"G.A_05_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_CLAS_TWO_DIM_FIG_CAT_PROP", FIELD:"G.B_05_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_CONV_MEASUR_UNT_GIVN_MEASUR_SYS", FIELD:"MD_05_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_USE_EQIV_FRACT_ADD_SUB_FRACT", FIELD:"NF.A_05_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_APPY_EXND_PREV_UND_MULTI_DIV_MULT_DIV_FRAC", FIELD:"NF.B_05_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_WRT_INTERPT_NUM_EXPRS", FIELD:"QA.A_05_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ANALYZ_PATTRNS_RELATNSHPS", FIELD:"QA.B_05_SPRING", MAP_FUNCTION: mapStrandScore}
     // Mathematics 06 Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_APPLY_EXT_PREV_UND_ARTH_ALG_EXP", FIELD:"EE.A", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_REASN_SOLV_ONEVAR_EQU_INEQUAL", FIELD:"EE.B_06_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_REP_ANALYZ_QUAN_REL_DEP_IND_VAR", FIELD:"EE.C_06_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_APPY_EXT_PREV_UND_MULT_DIV_DIV_FRACT_FRACT", FIELD:"NS.A_06_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_COMP_MULT_DIGT_NUM_FND_FACT_MULT", FIELD:"NS.B", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_APPY_EXT_PREV_UND_NUM_RATNL_NUM", FIELD:"NS.C", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_DEV_UND_STAT_VAR", FIELD:"SP.A", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SUMM_DESCRB_DISTRIB", FIELD:"SP.B", MAP_FUNCTION: mapStrandScore}
     // Mathematics 07 Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_USE_PROP_OP_GEN_EQIV_EXP", FIELD:"EE.A_07_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SOLV_REL_LF_MA_PROB_ALG_EXP_EQU_INEQ", FIELD:"EE.B_07_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_APLY_EXT_PREV_UND_OP_FRAC_ADD_SUB_MULT_DIV_RN", FIELD:"NS.A_07_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_USE_RNDM_SAMP_DRW_INF_POP", FIELD:"SP.A_07_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_DRW_INF_COMP_INF_TWO_POP", FIELD:"SP.B_07_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_INVES_CHNC_PROC_DEV_USE_EVAL_PROB_MOD", FIELD:"SP.C", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SUMM_DESC_NUM_DT_STS", FIELD:"SP.D", MAP_FUNCTION: mapStrandScore}
     // Mathematics 08 Spring/Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_WRK_RADLS_INT_EXP", FIELD:"EE.A_08_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ANLYZ_SOLV_LIN_EQ_SYS_TWO_LIN_EQU", FIELD:"EE.C_08_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_DEF_EVAL_COMP_FUNC", FIELD:"F.A", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_USE_FUNC_MODL_REALSHP_QUAN", FIELD:"F.B", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UNDSTND_DESC_TRANS_TWODIMFIG_FACT_ANGL", FIELD:"G.A_08_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_UND_APLY_PYTH_THERM", FIELD:"G.B", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SOLV_REALWLD_MA_PROB_VOL_CYL_CNS_SHPRS", FIELD:"G.C", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_KNW_NUM_NOT_RAT_APP_RAT_NUM", FIELD:"NS.A_08_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_INV_PATRNS_ASSOC_BIV_DATA", FIELD:"SP.A_08_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_INV_CHNC_PROC_DEV_USE_EVAL_PROB_MOD", FIELD:"SP.B_08_SPRING", MAP_FUNCTION: mapStrandScore}
     // Geometry 08 Spring
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOM_CIRC_UND_APLY_THER_CIRC_SECT_CIRC", FIELD:"G.C_GEOM_SPRING", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOM_SIMILARITY", FIELD:"G.CO", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOM_GEO_MEAS_DIM_EXP_VOL_SUR_SOLV_PROB", FIELD:"G.GMD", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GEOM_MOD_GEOM_APLY_GEO_CONC_MOD_SIT", FIELD:"G.MG", MAP_FUNCTION: mapStrandScore}
     // Algebra Spring /Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_ARTH_POLY_RAT_EXPR", FIELD:"A.APR", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_BLD_FUNCT", FIELD:"F.BF_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_LIN_QUAD_EXP_MOD", FIELD:"F.LE_SPRING_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_ALG_INT_LIN_MOD", FIELD:"S.ID", MAP_FUNCTION: mapStrandScore}

     // Mathematics Winter
     // Mathematics 03 Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_MULT_DIV_WTHN_100", FIELD:"OA.C", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_SOLV_PROB_INV_FOUR_OP_IEPATTRN_ARTH", FIELD:"OA.D", MAP_FUNCTION: mapStrandScore}
     // Mathematics 04 Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_USE_FOUR_OPR_WHL_NUM_SOLV_PROB", FIELD:"OA.A_04_WINTER", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "MA_GAIN_FAM_FACT_MULTPLS", FIELD:"OA.B_04_WINTER", MAP_FUNCTION: mapStrandScore}
     // Mathematics 05 Winter
     ,{TEST: "MASTERY_CONN_", CODE: "MA_REP_INTRPT_DATA", FIELD:"MD", MAP_FUNCTION: mapStrandScore}

     // Reading - Fall, Spring, Winter
     ,{TEST: "MASTERY_CONN_", CODE: "RD_OVERALL", FIELD:"_OVERALL_RD", MAP_FUNCTION: mapComponentScore}
     ,{TEST: "MASTERY_CONN_", CODE: "RD_LIT", FIELD:"READLIT_ACH_LEV", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "RD_INFO", FIELD:"READINFO_ACH_LEV", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "RD_LANG", FIELD:"LANG_ACH_LEV", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "RD_FICT", FIELD:"FICT_ACH_LEV", MAP_FUNCTION: mapStrandScore}
     ,{TEST: "MASTERY_CONN_", CODE: "RD_NON_FICT", FIELD:"NONF_ACH_LEV", MAP_FUNCTION: mapStrandScore}
        // combined subject
     ,{TEST: "MASTERY_CONN_", CODE: "OVERALL", MAP_FUNCTION: mapCombinedScore}
    ];

    /***************************************************************************
     Assessment-specific decodes
     ***************************************************************************/

     var achievLvlDecode = {
          "1" : {LEVEL: "1", DESC: "Below", PASS_IND: "No"},
          "2" : {LEVEL: "2", DESC: "Approaching", PASS_IND: "No"},
          "3" : {LEVEL: "3", DESC: "On Track", PASS_IND: "Yes"},
          "4" : {LEVEL: "4", DESC: "Mastered", PASS_IND: "Yes"},
          "" : {LEVEL: "", DESC: "", PASS_IND: ""},
          null : {LEVEL: "", DESC: "", PASS_IND: ""}
       };

    var newachievLvlDecode = {
         "1" : {LEVEL: "1", DESC: "Minimal", PASS_IND: "No"},
         "1-" : {LEVEL: "1", DESC: "Minimal", PASS_IND: "No"},
         "-1" : {LEVEL: "1", DESC: "Minimal", PASS_IND: "No"},
         "1+" : {LEVEL: "1", DESC: "Minimal", PASS_IND: "No"},
         "1a" : {LEVEL: "1a", DESC: "Minimal", PASS_IND: "No"},
         "1b" : {LEVEL: "1b", DESC: "Minimal", PASS_IND: "No"},

         "2" : {LEVEL: "2", DESC: "Basic", PASS_IND: "No"},
         "2-" : {LEVEL: "2", DESC: "Basic", PASS_IND: "No"},
         "-2" : {LEVEL: "2", DESC: "Basic", PASS_IND: "No"},
         "2+" : {LEVEL: "2+", DESC: "Basic", PASS_IND: "No"},
         "2a" : {LEVEL: "2a", DESC: "Basic", PASS_IND: "No"},
         "2b" : {LEVEL: "2b", DESC: "Basic", PASS_IND: "No"},

         "3" : {LEVEL: "3", DESC: "Passing", PASS_IND: "Yes"},
         "3-" : {LEVEL: "3", DESC: "Passing", PASS_IND: "Yes"},
         "-3" : {LEVEL: "3", DESC: "Passing", PASS_IND: "Yes"},
         "3+" : {LEVEL: "3+", DESC: "Passing", PASS_IND: "Yes"},
         "3a" : {LEVEL: "3a", DESC: "Passing", PASS_IND: "Yes"},
         "3b" : {LEVEL: "3b", DESC: "Passing", PASS_IND: "Yes"},

         "4" : {LEVEL: "4", DESC: "Proficient", PASS_IND: "Yes"},
         "4-" : {LEVEL: "4-", DESC: "Proficient", PASS_IND: "Yes"},
         "-4" : {LEVEL: "4-", DESC: "Proficient", PASS_IND: "Yes"},
         "4+" : {LEVEL: "4+", DESC: "Proficient", PASS_IND: "Yes"},
         "4a" : {LEVEL: "4a", DESC: "Proficient", PASS_IND: "Yes"},
         "4b" : {LEVEL: "4b", DESC: "Proficient", PASS_IND: "Yes"},


         "5" : {LEVEL: "5", DESC: "Advanced", PASS_IND: "Yes"},
         "5-" : {LEVEL: "5-", DESC: "Advanced", PASS_IND: "Yes"},
         "-5" : {LEVEL: "5-", DESC: "Advanced", PASS_IND: "Yes"},
         "5+" : {LEVEL: "5+", DESC: "Advanced", PASS_IND: "Yes"},
         "5a" : {LEVEL: "5a", DESC: "Advanced", PASS_IND: "Yes"},
         "5b" : {LEVEL: "5b", DESC: "Advanced", PASS_IND: "Yes"},
         "" : {LEVEL: null, DESC: null, PASS_IND: null},
         null : {LEVEL: null, DESC: null, PASS_IND: null}
    }

     var gradeDecode = {
        "KG" : "KG"
         , "0" : "KG"
         , "1" : "01"
         , "01" : "01"
         , "2" : "02"
         , "02" : "02"
         , "3" : "03"
         , "03" : "03"
         , "4" : "04"
         , "04" : "04"
         , "5" : "05"
         , "05" : "05"
         , "6" : "06"
         , "06" : "06"
         , "7" : "07"
         , "07" : "07"
         , "8" : "08"
         , "08" : "08"
         , "9" : "09"
         , "09" : "09"
         , "10" : "10"
         , "11" : "11"
         , "12" : "12"
         ,"T9"  : "T9"
         ,"15"  : "15"
         ,"20"  : "PS"
         ,"PS"  : "PS"
         ,"P"  : "P"
         ,"HS"  : "HS"
         ,"24"  : "PK"
         ,"PK"  : "PK"
         ,"25"  : "KG"
         ,"35"  : "35"
         , null : null
         , "" : null
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
    function mapNormalizedAdminFields(signature, hierarchy, row) {
        var record = {};
        var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();

     var studentName = row.getField("STUDENT_NAME");
        if (studentName !== null) {
            var newName = studentName.split(",",2);
            var studentFirstName = newName[1];
            var studentLastName = newName[0];
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
                case "PARTICIPATION_YEAR":
                    record.PARTICIPATION_YEAR = hierarchy.SCHOOL_YEAR;
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
                    record.TEST_ADMIN_DATE = _util.coalesce(AppUtil.getDateObjByPattern(row.getField("TEST_DATE"), "MM-dd-yyyy").STANDARD_DATE,"05/15/" + hierarchy.SCHOOL_YEAR.substring(5,9));
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = null;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = null;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = null;
                    break;
                 case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                    );
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_ID")
                    );
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("FNAME"), studentFirstName);
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("LNAME"), studentLastName);
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = null;
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = _util.coalesce(gradeDecode[row.getField("GRADE")],null);
                    break;
                case "PARTICIPATION_GRADE":
                    record.PARTICIPATION_GRADE = _util.coalesce(gradeDecode[row.getField("GRADE")],null);
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_ID"),"DISTRICT");
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
        admin.VENDOR_STAFF_ID = row.getField("TEACHER_ID");

        return admin;

    }

    /***********************************************************************************
     Assessment-specific score functions
     ***********************************************************************************/



    function mapComponentScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + gradeDecode[row.getField("GRADE")] + "_" + testMetadata.CODE;
            var scaleScore = row.getField("ACH_LEV" + testMetadata.FIELD);
            var percentCorrect = row.getField("PERC_COR" + testMetadata.FIELD);
            var rangeLevel = row.getField("ACH_LEV_EXT" + testMetadata.FIELD);
            var topBottomOfClass = null;

           // Check for key fields and do not map score and exit if conditions met.
            if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                return null;
            }

            if(rangeLevel === null || rangeLevel === undefined || _util.trim(rangeLevel) === ""){
                topBottomOfClass;
            } else if (rangeLevel.indexOf("+") >= 0) {
                topBottomOfClass = "Top of Class";
            } else if (rangeLevel.indexOf("-") >= 0) {
                topBottomOfClass = "Bottom of Class";
            } else {
                topBottomOfClass = "Middle of Class";
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;

            score["TEST_PRIMARY_RESULT_CODE"] = scaleScore;
            score["TEST_PRIMARY_RESULT"] = achievLvlDecode[scaleScore].DESC;
            score["TEST_PASSED_INDICATOR"] = achievLvlDecode[scaleScore].PASS_IND;
            score["TEST_SECONDARY_RESULT"] = topBottomOfClass;

            score["TEST_PERCENTAGE_SCORE"] = percentCorrect;

            } catch (exception) {
                print(exception);
            }

            return score;
        }


    function mapStrandScore(row, testMetadata) {
        try {
            var score = {};
            var testNumber = testMetadata.TEST + gradeDecode[row.getField("GRADE")] + "_" + testMetadata.CODE;
            var scaleScore = row.getField(testMetadata.FIELD + "_SCALED_SCORE");

           // Check for key fields and do not map score and exit if conditions met.
            if(scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = scaleScore;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;

            // Round down for achieve level
            score["TEST_PRIMARY_RESULT_CODE"] = Math.floor(scaleScore);
            score["TEST_PRIMARY_RESULT"] = achievLvlDecode[Math.floor(scaleScore)].DESC;
            score["TEST_PASSED_INDICATOR"] = achievLvlDecode[Math.floor(scaleScore)].PASS_IND;

            } catch (exception) {
                print(exception);
            }

            return score;
        }


    function mapCombinedScore(row, testMetadata) {
            var score = {};
            if(row.getField("TEST_ID") !== null){
            var testNumber = generateTestNumber(row, testMetadata) + "_" + testMetadata.CODE;
            }
            var scaleScore = row.getField("SCALE_SCORE_" + testMetadata.CODE);
            var percentCorrect = row.getField("PERC_COR_" + testMetadata.CODE);
            var achieveLevel = row.getField("ACH_LEV_" + testMetadata.CODE);
            var rawScore = row.getField("SUGG_NMARK_" + testMetadata.CODE);
            var testScoreText = row.getField("SUGG_LMARK_" + testMetadata.CODE);

           // Check for key fields and do not map score and exit if conditions met.
            if((scaleScore === null || scaleScore === undefined || _util.trim(scaleScore) === "--" || _util.trim(scaleScore) === "") &&
            (percentCorrect === null || percentCorrect === undefined || _util.trim(percentCorrect) === "--" || _util.trim(percentCorrect) === "") &&
            (achieveLevel === null || achieveLevel === undefined || _util.trim(achieveLevel) === "--" || _util.trim(achieveLevel) === "")) {
                return null;
            }

            // Set score fields
            score["TEST_NUMBER"] = testNumber;
            score["TEST_SCORE_TEXT"] = testScoreText;
            score["TEST_SCORE_VALUE"] = scaleScore;
            score["TEST_SCALED_SCORE"] = scaleScore;

            // Round down for achieve level
            score["TEST_PRIMARY_RESULT_CODE"] = newachievLvlDecode[achieveLevel].LEVEL;
            score["TEST_PRIMARY_RESULT"] =  newachievLvlDecode[achieveLevel].DESC;
            score["TEST_PASSED_INDICATOR"] =  newachievLvlDecode[achieveLevel].PASS_IND;
            score["TEST_PERCENTAGE_SCORE"] = percentCorrect;
            score["TEST_RAW_SCORE"] = rawScore;


            return score;
        }


    function generateTestNumber(row, testMetadata) {
            var sub = null;
            var testNumber = null;
            var SubjectName = row.getField("TEST_ID");
            if(SubjectName !== null && SubjectName !== undefined && SubjectName !== ""){
        		if (SubjectName.indexOf('rea') > -1 || SubjectName.indexOf('eng')>-1) {
                      sub = "RD";
                } else if (SubjectName.indexOf('mat') > -1 ||  SubjectName.indexOf('Math') > -1 || SubjectName.indexOf('alg')>-1 ){
                      sub = "MA";
                } else if (SubjectName.indexOf('Science') > -1 ||  SubjectName.indexOf('sci') > -1 || SubjectName.indexOf('bio') > -1){
                      sub = "SCI";
                } else if (SubjectName.indexOf('ushi') > -1) {
                      sub = "USHIS";
                }
                }

                if(sub !== null){
        		testNumber = testMetadata.TEST + sub;
        		}
        		    return testNumber
            }

    /***************************************************************************
     Utility Functions
     ***************************************************************************/

     function getTEST_ADMIN_PERIOD(row, filePeriod) {
         var testAdminPeriod = filePeriod;

             if (row.getField("TEST_DATE") !== null || row.getField("TEST_DATE") !== ""){

                 var sd = AppUtil.getDateObjByPattern(row.getField("TEST_DATE"), "MM/dd/yyyy").STANDARD_DATE;
                 var month = MONTH(sd);

                 if(month === "07" || month === "08" || month === "09" || month === "10")
                     testAdminPeriod = "Fall";
                 else if(month === "11" || month === "12" || month === "01" || month === "02")
                     testAdminPeriod = "Winter";
                 else if(month === "03" || month === "04" || month === "05" || month === "06")
                     testAdminPeriod = "Spring";

             }
             else{
                 return filePeriod;
             }

         return testAdminPeriod;
     }


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