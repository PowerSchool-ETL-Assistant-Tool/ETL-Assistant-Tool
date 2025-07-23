{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "SAT_DELIMITED_202021",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": [],
		"fields": [{
				"physicalName": "ai_cd",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "ai_org_nm",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "cohort_yr",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "district_name",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "last_nm",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "first_nm",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "middle_initial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "person_gender_cd",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F"],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "aggregate_ethnicity",
				"otherPossibleNames": [],
				"logicalName": "DERIVED_AGGREGATE_RACE_ETH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "birth_dt",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "person_id",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "state_cd",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "zip5",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_ZIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 17,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "country_iso_cd",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_COUNTRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "hs_grad_dt",
				"otherPossibleNames": [],
				"logicalName": "PROJ_GRAD_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "saa_ind",
				"otherPossibleNames": [],
				"logicalName": "SAA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_sat_date",
				"otherPossibleNames": [],
				"logicalName": "LATEST_ASSESSMENT_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "latest_sat_ed_level",
				"otherPossibleNames": [],
				"logicalName": "LATEST_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rsat_total_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rsat_ebrw_section_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rsat_math_section_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rsat_reading_test_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rsat_writlang_test_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rsat_math_test_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "anlys_scnc_x_test_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "anlys_hstry_x_test_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rlvnt_wrds_cntxt_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "cmmnd_of_evidence_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "exprssn_of_ideas_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "stnd_eng_cnvntns_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "heart_of_algebra_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "pssprt_to_adv_math_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "prb_slv_dat_anlys_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "essay_reading_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "essay_anlys_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_ANALYSIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "essay_writing_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "csat_reading_test_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "csat_math_test_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "csat_writing_test_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "csat_essay_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "csat_writ_mult_choice_sbscr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "total_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "ebrw_section_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "math_section_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "reading_test_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "writlang_test_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "math_test_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "anlys_scnc_x_test_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "anlys_hstry_x_test_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rlvnt_wrds_cntxt_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "cmmnd_of_evidence_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "exprssn_of_ideas_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "stnd_eng_cnvntns_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "heart_of_algebra_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "pssprt_to_adv_math_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "prb_slv_dat_anlys_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "c_reading_test_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "c_math_test_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "c_writlang_test_nr_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "total_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "ebrw_section_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "math_section_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "reading_test_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "writlang_test_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "math_test_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "anlys_scnc_x_test_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "anlys_hstry_x_test_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "rlvnt_wrds_cntxt_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "cmmnd_of_evidence_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "exprssn_of_ideas_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "stnd_eng_cnvntns_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "heart_of_algebra_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "pssprt_to_adv_math_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "prb_slv_dat_anlys_us_pctl",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "studentid_school",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ID_SCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "studentid_district",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "studentid_state",
				"otherPossibleNames": [],
				"logicalName": "STATE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "ebrw_readiness_ind",
				"otherPossibleNames": [],
				"logicalName": "EBRW_CCR_BENCHMARK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "math_readiness_ind",
				"otherPossibleNames": [],
				"logicalName": "MATH_CCR_BENCHMARK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sat_subject_exams_ct",
				"otherPossibleNames": [],
				"logicalName": "FILLER_36",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_date",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_1_id",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_1_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_1_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_1_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_1_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_2_id",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_2_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_2_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_2_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_2_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_3_id",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_3_scr",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_3_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_3_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latest_subj_3_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_date",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_1_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_1_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_1_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_1_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_1_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_2_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_2_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_2_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_2_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_2_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_3_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_3_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_3_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_3_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n2_subj_3_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_date",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_1_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_1_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_1_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_1_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_1_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_2_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_2_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_2_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 121
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_2_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_2_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 123
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_3_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 124
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_3_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 125
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_3_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 126
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_3_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n3_subj_3_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_date",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_1_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_1_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_1_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_1_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_1_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_2_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_2_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_2_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_2_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_2_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_3_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_3_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_3_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_3_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n4_subj_3_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_date",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_1_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_1_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_1_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_1_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_1_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_2_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_2_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_2_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_2_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 154
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_2_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 155
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_3_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 156
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_3_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 157
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_3_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 158
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_3_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 159
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n5_subj_3_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 160
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_date",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 161
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_1_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 162
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_1_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 163
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_1_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 164
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_1_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 165
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_1_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 166
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_2_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 167
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_2_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 168
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_2_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 169
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_2_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 170
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_2_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 171
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_3_id",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 172
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_3_scr",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 173
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_3_subscr_1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 174
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_3_subscr_2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 175
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "n6_subj_3_subscr_3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 176
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "gpa_grade_cd",
				"otherPossibleNames": [],
				"logicalName": "GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 177
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "first_language_cd",
				"otherPossibleNames": [],
				"logicalName": "FIRST_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "best_language_cd",
				"otherPossibleNames": [],
				"logicalName": "BEST_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 179
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "chinese_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_CHIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 180
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "french_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_FRENCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 181
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "german_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_GERM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 182
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "greek_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_GREEK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 183
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "hebrew_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_HEBR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 184
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "italian_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ITALIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 185
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "japanese_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_JAP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 186
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "korean_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_KOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 187
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "latin_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_LATIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 188
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "russian_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_RUSSN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 189
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "spanish_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_SPAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 190
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "other_lang_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_OTHLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 191
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "pre_algebra_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_PREALG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 192
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "algebra_i_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 193
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "algebra_ii_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ALGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 194
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "geometry_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 195
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "trigonometry_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_TRIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 196
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "pre_calculus_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_PRECALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 197
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "calculus_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_CALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 198
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "integrated_math_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_INTMATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 199
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "statistics_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_STAT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 200
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "comp_science_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_COMPSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 201
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "other_math_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_OTHRMATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 202
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "amer_lit_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_AMLIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 203
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "brit_lit_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_BRITLIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 204
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "cmpstn_writ_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_COMP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 205
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "eng_lang_arts_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENGLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 206
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "world_lit_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_LITOTHR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 207
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "journalism_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_JOURN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 208
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "creative_writ_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_CREATIVEWR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 209
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "communications_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_COMM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 210
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "public_speak_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_PUBSPK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 211
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "esl_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENGSECLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 212
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "biology_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 213
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "chemistry_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_CHEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 214
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "earth_science_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENVSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 215
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "physics_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_PHYS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 216
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "engineering_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENGINEER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 217
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "other_science_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_OTHRSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 218
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "us_hist_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 219
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "us_govt_civics_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_USGVT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 220
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "euro_hist_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_EURHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 221
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "world_hist_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_WRLDHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 222
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "ancnt_hist_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ANCNTHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 223
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "economics_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_ECON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 224
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "geog_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_GEOGR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 225
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "psychology_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_PSYCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 226
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sociology_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_SOCIOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 227
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "other_soc_stdy_durhon",
				"otherPossibleNames": [],
				"logicalName": "HSD_OTHRSOCSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 228
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_noexp",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_NONE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 229
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_theater_prdct",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_ACTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 230
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_art_hist",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_HISTORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 231
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_dance",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_DANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 232
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_theater_appr",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_DRAMA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 233
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_music_hist",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_MUSIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 234
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_music_perf",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_INST_VOCAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 235
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_photgrphy_film",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_FILM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 236
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "art_mus_art_design",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_ART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 237
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "hs_no_activity_ind",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY_PARTICIPATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 238
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv1_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 239
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv1_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 240
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv1_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 241
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv1_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 242
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv1_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 243
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv1_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 244
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv2_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 245
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv2_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 246
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv2_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 247
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv2_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 248
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv2_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 249
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv2_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 250
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv3_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 251
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv3_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 252
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv3_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 253
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv3_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 254
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv3_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 255
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv3_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 256
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv4_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 257
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv4_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 258
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv4_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 259
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv4_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 260
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv4_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 261
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv4_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 262
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv5_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 263
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv5_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 264
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv5_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 265
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv5_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 266
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv5_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 267
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv5_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 268
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv6_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 269
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv6_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 270
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv6_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 271
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv6_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 272
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv6_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 273
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv6_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 274
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv7_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 275
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv7_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 276
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv7_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 277
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv7_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 278
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv7_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 279
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv7_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 280
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv8_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 281
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv8_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 282
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv8_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 283
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv8_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 284
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv8_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 285
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv8_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 286
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv9_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 287
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv9_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 288
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv9_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 289
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv9_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 290
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv9_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 291
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv9_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 292
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv10_code",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 293
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv10_9th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 294
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv10_10th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 295
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv10_11th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 296
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv10_12th_grade",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 297
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "actv10_award",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 298
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "any_sport",
				"otherPossibleNames": [],
				"logicalName": "SPORTS_PARTICIPATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 299
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sport1",
				"otherPossibleNames": [],
				"logicalName": "SPORT1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 300
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sport2",
				"otherPossibleNames": [],
				"logicalName": "SPORT2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 301
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sport3",
				"otherPossibleNames": [],
				"logicalName": "SPORT3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 302
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sport4",
				"otherPossibleNames": [],
				"logicalName": "SPORT4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 303
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sport5",
				"otherPossibleNames": [],
				"logicalName": "SPORT5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 304
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sport6",
				"otherPossibleNames": [],
				"logicalName": "SPORT6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 305
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_type_4_yr",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE_4YR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 306
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_type_2_yr",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE_2YR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 307
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_type_votech",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE_VOCTECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 308
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_type_undecided",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 309
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_affil_public",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_AFFIL_PUBLIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 310
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_affil_pvt_nonrelig",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_AFFIL_PRIV_NOTRELIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 311
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_affil_relig",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_AFFIL_PRIV_RELIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 312
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_affil_undecided",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_AFFIL_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 313
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_size_lt_2k",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_LESS_2K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 314
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_size_2k_to_5k",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_2K_5K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 315
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_size_5k_to_10k",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_5K_10K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 316
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_size_10k_to_15k",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_10K-15K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 317
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_size_15k_to_20k",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_15K_20K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 318
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_size_gt_20k",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_MORE_20K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 319
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_size_undecided",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 320
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_setting_large_city",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_LGCITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 321
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_setting_medium_city",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_MEDCITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 322
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_setting_small_city",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_SMCITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 323
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_setting_suburb",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_SUBURB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 324
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_setting_rural",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_RURAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 325
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_setting_undecided",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 326
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_loc_close_to_home",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_NEARHOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 327
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_loc_home_st",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_HOMESTATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 328
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_loc_bordering_st",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_BORDERHOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 329
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_loc_beyond_st_border",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_BEYONDHOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 330
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_loc_outside_us",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_OUTSIDEUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 331
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_loc_undecided",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 332
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_gndr_sngl_type",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SEX_ALLONESEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 333
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_gndr_coed",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SEX_COED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 334
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_gndr_undecided",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SEX_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 335
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_housing_plans_home",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_HOUSING_HOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 336
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_housing_plans_oncampus",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_HOUSING_ONCAMPUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 337
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_housing_plans_offcampus",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_HOUSING_OFFCAMPUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 338
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_housing_plans_undecided",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_HOUSING_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 339
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "deg_goal_certificate",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_CERTIFICATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 340
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "deg_goal_assoc",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_ASSOCIATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 341
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "deg_goal_bach",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_BACHELORS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 342
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "deg_goal_masters",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_MASTERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 343
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "deg_goal_doctorate",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_DOCTORATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 344
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "deg_goal_other",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 345
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "deg_goal_undecided",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 346
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_finaid_ind",
				"otherPossibleNames": [],
				"logicalName": "FINANCIAL_AID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 347
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_job_parttime_ind",
				"otherPossibleNames": [],
				"logicalName": "PART_TIME_JOB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 348
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sdq_major_category_1st",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_FIRST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 349
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sdq_major_category_2nd",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_FIRST_CERTAINTY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 350
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "sdq_major_category_3rd",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_SECOND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 351
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_hnrs_or_ind_stdy",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_HONORS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 352
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_art",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 353
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_intramr_or_jv",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_INTRAMURAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 354
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_varsity_or_amat",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ATHLETICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 355
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_community_svc",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_COMMSERVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 356
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_dance",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_DANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 357
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_debate",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_DEBATESPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 358
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_ethnc_or_xcultr",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ETHNIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 359
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_frgn_exch",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_FOREIGN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 360
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_gov_or_politcal",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_GOVERNMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 361
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_jrnlsm_or_lit",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_LITERARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 362
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_rotc_or_jrotc",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ROTC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 363
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_music_instmt",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_INSTRUMENTALMUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 364
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_music_vocal",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_VOCALMUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 365
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_religious",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_RELIGIOUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 366
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_envrnmtl",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ENVIRONMENTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 367
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_drama",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_DRAMA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 368
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_coop_or_intrnshp",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_INTERNSHIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 369
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_deprtmntl",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_DEPARTMENTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 370
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_frat_srty_scl_clb",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_SOCIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 371
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "he_actvty_none",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_NONE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 372
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code1",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 373
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code2",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 374
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code3",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 375
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code4",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 376
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code5",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 377
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code6",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 378
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code7",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 379
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code8",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 380
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code9",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 381
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code10",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 382
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code11",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 383
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code12",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 384
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code13",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 385
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code14",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 386
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code15",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 387
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code16",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 388
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code17",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 389
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code18",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 390
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code19",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 391
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code20",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 392
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code21",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 393
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code22",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 394
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code23",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 395
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code24",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 396
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code25",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 397
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code26",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 398
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code27",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 399
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code28",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 400
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code29",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 401
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "college_code30",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 402
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "di_number",
				"otherPossibleNames": [],
				"logicalName": "FORM_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 403
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": -1.0
			},
			{
				"physicalName": "date_of_report",
				"otherPossibleNames": [],
				"logicalName": "REPORT_DATE",
				"formatMask": "MM/dd/yyyy",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 404
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": -1.0
			}
		]
	},
	"fileExtensions": [".csv"]
}