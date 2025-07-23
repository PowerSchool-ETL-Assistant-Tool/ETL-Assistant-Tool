{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "SAT_REDESIGN_FIXEDWIDTH",
		"recordLength": 2601.0,
		"naturalKey": [],
		"fields": [{
				"physicalName": "AI_CODE",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 6,
					"columnNum": 1
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AI_NAME",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 7,
					"offsetEnd": 56,
					"columnNum": 2
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_1",
				"otherPossibleNames": [],
				"logicalName": "FILLER_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 57,
					"offsetEnd": 58,
					"columnNum": 3
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COHORT_YEAR",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 59,
					"offsetEnd": 62,
					"columnNum": 4
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DISTRICT_NAME",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 63,
					"offsetEnd": 112,
					"columnNum": 5
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NAME_LAST",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 113,
					"offsetEnd": 147,
					"columnNum": 6
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NAME_FIRST",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 148,
					"offsetEnd": 182,
					"columnNum": 7
				},
				"fieldLength": 35,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NAME_MI",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 183,
					"offsetEnd": 183,
					"columnNum": 8
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SEX",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 184,
					"offsetEnd": 184,
					"columnNum": 9
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_CUBAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_CUBAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 185,
					"offsetEnd": 185,
					"columnNum": 10
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_MEXICAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_MEXICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 186,
					"offsetEnd": 186,
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_PUERTORICAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_PUERTORICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 187,
					"offsetEnd": 187,
					"columnNum": 12
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_HISP_LAT",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_HISP_LAT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 188,
					"offsetEnd": 188,
					"columnNum": 13
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_NON_HISP_LAT",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_NON_HISP_LAT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 189,
					"offsetEnd": 189,
					"columnNum": 14
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_INDIAN_ALASKAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_INDIAN_ALASKAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 190,
					"offsetEnd": 190,
					"columnNum": 15
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_ASIAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 191,
					"offsetEnd": 191,
					"columnNum": 16
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_AFRICANAMERICAN",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_AFRICANAMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 192,
					"offsetEnd": 192,
					"columnNum": 17
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_HAWAIIAN_PI",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_HAWAIIAN_PI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 193,
					"offsetEnd": 193,
					"columnNum": 18
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_WHITE",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 194,
					"offsetEnd": 194,
					"columnNum": 19
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RACE_ETH_OTHER",
				"otherPossibleNames": [],
				"logicalName": "RACE_ETH_OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 195,
					"offsetEnd": 195,
					"columnNum": 20
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_2",
				"otherPossibleNames": [],
				"logicalName": "FILLER_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 196,
					"offsetEnd": 200,
					"columnNum": 21
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DERIVED_AGGREGATE_RACE_ETH",
				"otherPossibleNames": [],
				"logicalName": "DERIVED_AGGREGATE_RACE_ETH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 202,
					"columnNum": 22
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "BIRTH_DATE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 203,
					"offsetEnd": 212,
					"columnNum": 23
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_3",
				"otherPossibleNames": [],
				"logicalName": "FILLER_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 213,
					"offsetEnd": 221,
					"columnNum": 24
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CB_ID",
				"otherPossibleNames": [],
				"logicalName": "CB_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 222,
					"offsetEnd": 233,
					"columnNum": 25
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SECONDARY_ID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 234,
					"offsetEnd": 263,
					"columnNum": 26
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADDRESS_LINE1",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_LINE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 264,
					"offsetEnd": 313,
					"columnNum": 27
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADDRESS_LINE2",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_LINE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 314,
					"offsetEnd": 363,
					"columnNum": 28
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADDRESS_CITY",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 364,
					"offsetEnd": 413,
					"columnNum": 29
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADDRESS_STATE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 414,
					"offsetEnd": 415,
					"columnNum": 30
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADDRESS_ZIP",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_ZIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 416,
					"offsetEnd": 432,
					"columnNum": 31
				},
				"fieldLength": 17,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADDRESS_COUNTY",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_COUNTY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 433,
					"offsetEnd": 437,
					"columnNum": 32
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADDRESS_COUNTRY",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_COUNTRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 438,
					"offsetEnd": 439,
					"columnNum": 33
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADDRESS_PROVINCE",
				"otherPossibleNames": [],
				"logicalName": "ADDRESS_PROVINCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 440,
					"offsetEnd": 479,
					"columnNum": 34
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FOREIGN_ADDRESS",
				"otherPossibleNames": [],
				"logicalName": "FOREIGN_ADDRESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 480,
					"offsetEnd": 480,
					"columnNum": 35
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PHONE",
				"otherPossibleNames": [],
				"logicalName": "PHONE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 481,
					"offsetEnd": 504,
					"columnNum": 36
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EMAIL",
				"otherPossibleNames": [],
				"logicalName": "EMAIL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 505,
					"offsetEnd": 632,
					"columnNum": 37
				},
				"fieldLength": 128,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HOMESCHOOL",
				"otherPossibleNames": [],
				"logicalName": "HOMESCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 633,
					"offsetEnd": 633,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "STUDENT_SEARCH_SERVICE",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_SEARCH_SERVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 634,
					"offsetEnd": 634,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PROJ_GRAD_DATE",
				"otherPossibleNames": [],
				"logicalName": "PROJ_GRAD_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 635,
					"offsetEnd": 641,
					"columnNum": 40
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "SAA",
				"otherPossibleNames": [],
				"logicalName": "SAA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 642,
					"offsetEnd": 642,
					"columnNum": 41
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_REGISTRATION_NUM",
				"otherPossibleNames": [],
				"logicalName": "LATEST_REGISTRATION_NUM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 643,
					"offsetEnd": 657,
					"columnNum": 42
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_MAKE_UP",
				"otherPossibleNames": [],
				"logicalName": "LATEST_MAKE_UP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 658,
					"offsetEnd": 658,
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_ASSESSMENT_DATE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_ASSESSMENT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 659,
					"offsetEnd": 668,
					"columnNum": 44
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_GRADE_LEVEL",
				"otherPossibleNames": [],
				"logicalName": "LATEST_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 669,
					"offsetEnd": 670,
					"columnNum": 45
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_REVISED",
				"otherPossibleNames": [],
				"logicalName": "LATEST_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 671,
					"offsetEnd": 671,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 672,
					"offsetEnd": 675,
					"columnNum": 47
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 676,
					"offsetEnd": 678,
					"columnNum": 48
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 679,
					"offsetEnd": 681,
					"columnNum": 49
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_READING",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 682,
					"offsetEnd": 683,
					"columnNum": 50
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 684,
					"offsetEnd": 685,
					"columnNum": 51
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 686,
					"offsetEnd": 689,
					"columnNum": 52
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 690,
					"offsetEnd": 691,
					"columnNum": 53
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 692,
					"offsetEnd": 693,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 694,
					"offsetEnd": 695,
					"columnNum": 55
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 696,
					"offsetEnd": 697,
					"columnNum": 56
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 698,
					"offsetEnd": 699,
					"columnNum": 57
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 700,
					"offsetEnd": 701,
					"columnNum": 58
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 702,
					"offsetEnd": 703,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 704,
					"offsetEnd": 705,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 706,
					"offsetEnd": 707,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_ESSAY_READING",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 708,
					"offsetEnd": 708,
					"columnNum": 62
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_ESSAY_ANALYSIS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_ANALYSIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 709,
					"offsetEnd": 709,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_ESSAY_WRITING",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 710,
					"offsetEnd": 710,
					"columnNum": 64
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_4",
				"otherPossibleNames": [],
				"logicalName": "FILLER_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 711,
					"offsetEnd": 713,
					"columnNum": 65
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_CRITICAL_READING",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 714,
					"offsetEnd": 716,
					"columnNum": 66
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_MATH",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 717,
					"offsetEnd": 719,
					"columnNum": 67
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_WRITING",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 720,
					"offsetEnd": 722,
					"columnNum": 68
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_ESSAY",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 723,
					"offsetEnd": 724,
					"columnNum": 69
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SAT_ESSAY_MC",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 725,
					"offsetEnd": 726,
					"columnNum": 70
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_5",
				"otherPossibleNames": [],
				"logicalName": "FILLER_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 727,
					"offsetEnd": 738,
					"columnNum": 71
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_6",
				"otherPossibleNames": [],
				"logicalName": "FILLER_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 739,
					"offsetEnd": 742,
					"columnNum": 72
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 743,
					"offsetEnd": 744,
					"columnNum": 73
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 745,
					"offsetEnd": 746,
					"columnNum": 74
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 747,
					"offsetEnd": 748,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_READING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 749,
					"offsetEnd": 750,
					"columnNum": 76
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 751,
					"offsetEnd": 752,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 753,
					"offsetEnd": 754,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 755,
					"offsetEnd": 756,
					"columnNum": 79
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 757,
					"offsetEnd": 758,
					"columnNum": 80
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 759,
					"offsetEnd": 760,
					"columnNum": 81
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 761,
					"offsetEnd": 762,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 763,
					"offsetEnd": 764,
					"columnNum": 83
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 765,
					"offsetEnd": 766,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 767,
					"offsetEnd": 768,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 769,
					"offsetEnd": 770,
					"columnNum": 86
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_SAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 771,
					"offsetEnd": 772,
					"columnNum": 87
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_CBSNATION_SAT_CRITICAL_READING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 773,
					"offsetEnd": 774,
					"columnNum": 88
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_CBSNATION_SAT_MATH",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 775,
					"offsetEnd": 776,
					"columnNum": 89
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_CBSNATION_SAT_WRITING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSNATION_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 777,
					"offsetEnd": 778,
					"columnNum": 90
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_7",
				"otherPossibleNames": [],
				"logicalName": "FILLER_7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 779,
					"offsetEnd": 780,
					"columnNum": 91
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_8",
				"otherPossibleNames": [],
				"logicalName": "FILLER_8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 781,
					"offsetEnd": 784,
					"columnNum": 92
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 785,
					"offsetEnd": 786,
					"columnNum": 93
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 787,
					"offsetEnd": 788,
					"columnNum": 94
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 789,
					"offsetEnd": 790,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_READING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 791,
					"offsetEnd": 792,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 793,
					"offsetEnd": 794,
					"columnNum": 97
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 795,
					"offsetEnd": 796,
					"columnNum": 98
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 797,
					"offsetEnd": 798,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 799,
					"offsetEnd": 800,
					"columnNum": 100
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 801,
					"offsetEnd": 802,
					"columnNum": 101
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 803,
					"offsetEnd": 804,
					"columnNum": 102
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 805,
					"offsetEnd": 806,
					"columnNum": 103
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 807,
					"offsetEnd": 808,
					"columnNum": 104
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 809,
					"offsetEnd": 810,
					"columnNum": 105
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 811,
					"offsetEnd": 812,
					"columnNum": 106
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_SAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 813,
					"offsetEnd": 814,
					"columnNum": 107
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_CBSSTATE_SAT_CRITICAL_READING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSSTATE_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 815,
					"offsetEnd": 816,
					"columnNum": 108
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_CBSSTATE_SAT_MATH",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSSTATE_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 817,
					"offsetEnd": 818,
					"columnNum": 109
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_CBSSTATE_SAT_WRITING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_CBSSTATE_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 819,
					"offsetEnd": 820,
					"columnNum": 110
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_9",
				"otherPossibleNames": [],
				"logicalName": "FILLER_9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 821,
					"offsetEnd": 822,
					"columnNum": 111
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_10",
				"otherPossibleNames": [],
				"logicalName": "FILLER_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 823,
					"offsetEnd": 826,
					"columnNum": 112
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EBRW_CCR_BENCHMARK",
				"otherPossibleNames": [],
				"logicalName": "EBRW_CCR_BENCHMARK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 827,
					"offsetEnd": 827,
					"columnNum": 113
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CCR_BENCHMARK",
				"otherPossibleNames": [],
				"logicalName": "MATH_CCR_BENCHMARK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 828,
					"offsetEnd": 828,
					"columnNum": 114
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_11",
				"otherPossibleNames": [],
				"logicalName": "FILLER_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 829,
					"offsetEnd": 829,
					"columnNum": 115
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_12",
				"otherPossibleNames": [],
				"logicalName": "FILLER_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 830,
					"offsetEnd": 830,
					"columnNum": 116
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_13",
				"otherPossibleNames": [],
				"logicalName": "FILLER_13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 831,
					"offsetEnd": 831,
					"columnNum": 117
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_14",
				"otherPossibleNames": [],
				"logicalName": "FILLER_14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 832,
					"offsetEnd": 832,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_15",
				"otherPossibleNames": [],
				"logicalName": "FILLER_15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 833,
					"offsetEnd": 833,
					"columnNum": 119
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_16",
				"otherPossibleNames": [],
				"logicalName": "FILLER_16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 834,
					"offsetEnd": 834,
					"columnNum": 120
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NUM_READING_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_READING_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 835,
					"offsetEnd": 836,
					"columnNum": 121
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 837,
					"offsetEnd": 837,
					"columnNum": 122
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 838,
					"offsetEnd": 838,
					"columnNum": 123
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 839,
					"offsetEnd": 839,
					"columnNum": 124
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 840,
					"offsetEnd": 840,
					"columnNum": 125
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 841,
					"offsetEnd": 841,
					"columnNum": 126
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 842,
					"offsetEnd": 842,
					"columnNum": 127
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 843,
					"offsetEnd": 843,
					"columnNum": 128
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 844,
					"offsetEnd": 844,
					"columnNum": 129
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS9",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 845,
					"offsetEnd": 845,
					"columnNum": 130
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS10",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 846,
					"offsetEnd": 846,
					"columnNum": 131
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS11",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 847,
					"offsetEnd": 847,
					"columnNum": 132
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS12",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 848,
					"offsetEnd": 848,
					"columnNum": 133
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS13",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 849,
					"offsetEnd": 849,
					"columnNum": 134
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS14",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 850,
					"offsetEnd": 850,
					"columnNum": 135
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS15",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 851,
					"offsetEnd": 851,
					"columnNum": 136
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS16",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 852,
					"offsetEnd": 852,
					"columnNum": 137
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS17",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 853,
					"offsetEnd": 853,
					"columnNum": 138
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS18",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 854,
					"offsetEnd": 854,
					"columnNum": 139
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS19",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 855,
					"offsetEnd": 855,
					"columnNum": 140
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS20",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 856,
					"offsetEnd": 856,
					"columnNum": 141
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS21",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 857,
					"offsetEnd": 857,
					"columnNum": 142
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS22",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 858,
					"offsetEnd": 858,
					"columnNum": 143
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS23",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 859,
					"offsetEnd": 859,
					"columnNum": 144
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS24",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 860,
					"offsetEnd": 860,
					"columnNum": 145
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS25",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 861,
					"offsetEnd": 861,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS26",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 862,
					"offsetEnd": 862,
					"columnNum": 147
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS27",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 863,
					"offsetEnd": 863,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS28",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 864,
					"offsetEnd": 864,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS29",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 865,
					"offsetEnd": 865,
					"columnNum": 150
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS30",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 866,
					"offsetEnd": 866,
					"columnNum": 151
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS31",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS31",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 867,
					"offsetEnd": 867,
					"columnNum": 152
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS32",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS32",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 868,
					"offsetEnd": 868,
					"columnNum": 153
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS33",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS33",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 869,
					"offsetEnd": 869,
					"columnNum": 154
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS34",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS34",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 870,
					"offsetEnd": 870,
					"columnNum": 155
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS35",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS35",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 871,
					"offsetEnd": 871,
					"columnNum": 156
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS36",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS36",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 872,
					"offsetEnd": 872,
					"columnNum": 157
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS37",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS37",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 873,
					"offsetEnd": 873,
					"columnNum": 158
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS38",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS38",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 874,
					"offsetEnd": 874,
					"columnNum": 159
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS39",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS39",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 875,
					"offsetEnd": 875,
					"columnNum": 160
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS40",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS40",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 876,
					"offsetEnd": 876,
					"columnNum": 161
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS41",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS41",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 877,
					"offsetEnd": 877,
					"columnNum": 162
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS42",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS42",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 878,
					"offsetEnd": 878,
					"columnNum": 163
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS43",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS43",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 879,
					"offsetEnd": 879,
					"columnNum": 164
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS44",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS44",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 880,
					"offsetEnd": 880,
					"columnNum": 165
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS45",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS45",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 881,
					"offsetEnd": 881,
					"columnNum": 166
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS46",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS46",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 882,
					"offsetEnd": 882,
					"columnNum": 167
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS47",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS47",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 883,
					"offsetEnd": 883,
					"columnNum": 168
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS48",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS48",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 884,
					"offsetEnd": 884,
					"columnNum": 169
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS49",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS49",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 885,
					"offsetEnd": 885,
					"columnNum": 170
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS50",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS50",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 886,
					"offsetEnd": 886,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS51",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS51",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 887,
					"offsetEnd": 887,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_ANS52",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_ANS52",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 888,
					"offsetEnd": 888,
					"columnNum": 173
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_CORRECT",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 889,
					"offsetEnd": 890,
					"columnNum": 174
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_INCORRECT",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_INCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 891,
					"offsetEnd": 892,
					"columnNum": 175
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "READING_QUES_OMIT",
				"otherPossibleNames": [],
				"logicalName": "READING_QUES_OMIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 893,
					"offsetEnd": 894,
					"columnNum": 176
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_17",
				"otherPossibleNames": [],
				"logicalName": "FILLER_17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 895,
					"offsetEnd": 899,
					"columnNum": 177
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NUM_WRITLANG_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_WRITLANG_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 900,
					"offsetEnd": 901,
					"columnNum": 178
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 902,
					"columnNum": 179
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 903,
					"offsetEnd": 903,
					"columnNum": 180
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 904,
					"offsetEnd": 904,
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 905,
					"offsetEnd": 905,
					"columnNum": 182
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 906,
					"offsetEnd": 906,
					"columnNum": 183
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 907,
					"offsetEnd": 907,
					"columnNum": 184
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 185
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 909,
					"offsetEnd": 909,
					"columnNum": 186
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS9",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 910,
					"offsetEnd": 910,
					"columnNum": 187
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS10",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 911,
					"offsetEnd": 911,
					"columnNum": 188
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS11",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 912,
					"offsetEnd": 912,
					"columnNum": 189
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS12",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 913,
					"offsetEnd": 913,
					"columnNum": 190
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS13",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 914,
					"offsetEnd": 914,
					"columnNum": 191
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS14",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 915,
					"offsetEnd": 915,
					"columnNum": 192
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS15",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 916,
					"offsetEnd": 916,
					"columnNum": 193
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS16",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 917,
					"offsetEnd": 917,
					"columnNum": 194
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS17",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 918,
					"offsetEnd": 918,
					"columnNum": 195
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS18",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 919,
					"offsetEnd": 919,
					"columnNum": 196
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS19",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 920,
					"offsetEnd": 920,
					"columnNum": 197
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS20",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 921,
					"offsetEnd": 921,
					"columnNum": 198
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS21",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 922,
					"offsetEnd": 922,
					"columnNum": 199
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS22",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 923,
					"offsetEnd": 923,
					"columnNum": 200
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS23",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 924,
					"offsetEnd": 924,
					"columnNum": 201
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS24",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 925,
					"offsetEnd": 925,
					"columnNum": 202
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS25",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 926,
					"offsetEnd": 926,
					"columnNum": 203
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS26",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 927,
					"offsetEnd": 927,
					"columnNum": 204
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS27",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 928,
					"offsetEnd": 928,
					"columnNum": 205
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS28",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 929,
					"offsetEnd": 929,
					"columnNum": 206
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS29",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 930,
					"offsetEnd": 930,
					"columnNum": 207
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS30",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 931,
					"offsetEnd": 931,
					"columnNum": 208
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS31",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS31",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 932,
					"offsetEnd": 932,
					"columnNum": 209
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS32",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS32",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 933,
					"offsetEnd": 933,
					"columnNum": 210
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS33",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS33",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 934,
					"offsetEnd": 934,
					"columnNum": 211
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS34",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS34",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 935,
					"offsetEnd": 935,
					"columnNum": 212
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS35",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS35",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 936,
					"offsetEnd": 936,
					"columnNum": 213
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS36",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS36",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 937,
					"offsetEnd": 937,
					"columnNum": 214
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS37",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS37",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 938,
					"offsetEnd": 938,
					"columnNum": 215
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS38",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS38",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 939,
					"offsetEnd": 939,
					"columnNum": 216
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS39",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS39",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 940,
					"offsetEnd": 940,
					"columnNum": 217
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS40",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS40",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 941,
					"offsetEnd": 941,
					"columnNum": 218
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS41",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS41",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 942,
					"offsetEnd": 942,
					"columnNum": 219
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS42",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS42",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 943,
					"offsetEnd": 943,
					"columnNum": 220
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS43",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS43",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 944,
					"offsetEnd": 944,
					"columnNum": 221
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_ANS44",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_ANS44",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 945,
					"offsetEnd": 945,
					"columnNum": 222
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_CORRECT",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 946,
					"offsetEnd": 947,
					"columnNum": 223
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_INCORRECT",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_INCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 948,
					"offsetEnd": 949,
					"columnNum": 224
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WRITLANG_QUES_OMIT",
				"otherPossibleNames": [],
				"logicalName": "WRITLANG_QUES_OMIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 950,
					"offsetEnd": 951,
					"columnNum": 225
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_18",
				"otherPossibleNames": [],
				"logicalName": "FILLER_18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 952,
					"offsetEnd": 956,
					"columnNum": 226
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NUM_MATH_NCMC_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_MATH_NCMC_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 957,
					"offsetEnd": 958,
					"columnNum": 227
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NUM_MATH_NCPR_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_MATH_NCPR_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 959,
					"offsetEnd": 959,
					"columnNum": 228
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 960,
					"offsetEnd": 960,
					"columnNum": 229
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 961,
					"offsetEnd": 961,
					"columnNum": 230
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 962,
					"offsetEnd": 962,
					"columnNum": 231
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 963,
					"offsetEnd": 963,
					"columnNum": 232
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 964,
					"offsetEnd": 964,
					"columnNum": 233
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 965,
					"offsetEnd": 965,
					"columnNum": 234
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 966,
					"offsetEnd": 966,
					"columnNum": 235
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 967,
					"offsetEnd": 967,
					"columnNum": 236
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS9",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 968,
					"offsetEnd": 968,
					"columnNum": 237
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS10",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 969,
					"offsetEnd": 969,
					"columnNum": 238
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS11",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 970,
					"offsetEnd": 970,
					"columnNum": 239
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS12",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 971,
					"offsetEnd": 971,
					"columnNum": 240
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS13",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 972,
					"offsetEnd": 972,
					"columnNum": 241
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS14",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 973,
					"offsetEnd": 973,
					"columnNum": 242
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCMC_QUES_ANS15",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCMC_QUES_ANS15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 974,
					"offsetEnd": 974,
					"columnNum": 243
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCPR_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCPR_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 975,
					"offsetEnd": 978,
					"columnNum": 244
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCPR_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCPR_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 979,
					"offsetEnd": 982,
					"columnNum": 245
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCPR_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCPR_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 983,
					"offsetEnd": 986,
					"columnNum": 246
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCPR_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCPR_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 987,
					"offsetEnd": 990,
					"columnNum": 247
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NCPR_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "MATH_NCPR_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 991,
					"offsetEnd": 994,
					"columnNum": 248
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NC_QUES_CORRECT",
				"otherPossibleNames": [],
				"logicalName": "MATH_NC_QUES_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 995,
					"offsetEnd": 996,
					"columnNum": 249
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NC_QUES_INCORRECT",
				"otherPossibleNames": [],
				"logicalName": "MATH_NC_QUES_INCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 997,
					"offsetEnd": 998,
					"columnNum": 250
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_NC_QUES_OMIT",
				"otherPossibleNames": [],
				"logicalName": "MATH_NC_QUES_OMIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 999,
					"offsetEnd": 1000,
					"columnNum": 251
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_19",
				"otherPossibleNames": [],
				"logicalName": "FILLER_19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1001,
					"offsetEnd": 1005,
					"columnNum": 252
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NUM_MATH_CMC_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_MATH_CMC_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1006,
					"offsetEnd": 1007,
					"columnNum": 253
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NUM_MATH_CPR_QUES",
				"otherPossibleNames": [],
				"logicalName": "NUM_MATH_CPR_QUES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1008,
					"offsetEnd": 1008,
					"columnNum": 254
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1009,
					"offsetEnd": 1009,
					"columnNum": 255
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1010,
					"offsetEnd": 1010,
					"columnNum": 256
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1011,
					"offsetEnd": 1011,
					"columnNum": 257
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1012,
					"offsetEnd": 1012,
					"columnNum": 258
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1013,
					"offsetEnd": 1013,
					"columnNum": 259
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1014,
					"offsetEnd": 1014,
					"columnNum": 260
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1015,
					"offsetEnd": 1015,
					"columnNum": 261
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1016,
					"offsetEnd": 1016,
					"columnNum": 262
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS9",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1017,
					"offsetEnd": 1017,
					"columnNum": 263
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS10",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1018,
					"offsetEnd": 1018,
					"columnNum": 264
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS11",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1019,
					"offsetEnd": 1019,
					"columnNum": 265
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS12",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1020,
					"offsetEnd": 1020,
					"columnNum": 266
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS13",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1021,
					"offsetEnd": 1021,
					"columnNum": 267
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS14",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1022,
					"offsetEnd": 1022,
					"columnNum": 268
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS15",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1023,
					"offsetEnd": 1023,
					"columnNum": 269
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS16",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1024,
					"offsetEnd": 1024,
					"columnNum": 270
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS17",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1025,
					"offsetEnd": 1025,
					"columnNum": 271
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS18",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1026,
					"offsetEnd": 1026,
					"columnNum": 272
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS19",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1027,
					"offsetEnd": 1027,
					"columnNum": 273
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS20",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1028,
					"offsetEnd": 1028,
					"columnNum": 274
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS21",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1029,
					"offsetEnd": 1029,
					"columnNum": 275
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS22",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1030,
					"offsetEnd": 1030,
					"columnNum": 276
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS23",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1031,
					"offsetEnd": 1031,
					"columnNum": 277
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS24",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1032,
					"offsetEnd": 1032,
					"columnNum": 278
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS25",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1033,
					"offsetEnd": 1033,
					"columnNum": 279
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS26",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1034,
					"offsetEnd": 1034,
					"columnNum": 280
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS27",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1035,
					"offsetEnd": 1035,
					"columnNum": 281
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS28",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1036,
					"offsetEnd": 1036,
					"columnNum": 282
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS29",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1037,
					"offsetEnd": 1037,
					"columnNum": 283
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CMC_QUES_ANS30",
				"otherPossibleNames": [],
				"logicalName": "MATH_CMC_QUES_ANS30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1038,
					"offsetEnd": 1038,
					"columnNum": 284
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS1",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1039,
					"offsetEnd": 1042,
					"columnNum": 285
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS2",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1043,
					"offsetEnd": 1046,
					"columnNum": 286
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS3",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1047,
					"offsetEnd": 1050,
					"columnNum": 287
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS4",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1051,
					"offsetEnd": 1054,
					"columnNum": 288
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS5",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1055,
					"offsetEnd": 1058,
					"columnNum": 289
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS6",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1059,
					"offsetEnd": 1062,
					"columnNum": 290
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS7",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1063,
					"offsetEnd": 1066,
					"columnNum": 291
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_CPR_QUES_ANS8",
				"otherPossibleNames": [],
				"logicalName": "MATH_CPR_QUES_ANS8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1067,
					"offsetEnd": 1070,
					"columnNum": 292
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_C_QUES_CORRECT",
				"otherPossibleNames": [],
				"logicalName": "MATH_C_QUES_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1071,
					"offsetEnd": 1072,
					"columnNum": 293
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_C_QUES_INCORRECT",
				"otherPossibleNames": [],
				"logicalName": "MATH_C_QUES_INCORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1073,
					"offsetEnd": 1074,
					"columnNum": 294
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MATH_C_QUES_OMIT",
				"otherPossibleNames": [],
				"logicalName": "MATH_C_QUES_OMIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1075,
					"offsetEnd": 1076,
					"columnNum": 295
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_20",
				"otherPossibleNames": [],
				"logicalName": "FILLER_20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1077,
					"offsetEnd": 1081,
					"columnNum": 296
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_REGISTRATION_NUM",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_REGISTRATION_NUM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1082,
					"offsetEnd": 1096,
					"columnNum": 297
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_MAKE_UP",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_MAKE_UP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1097,
					"offsetEnd": 1097,
					"columnNum": 298
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_ASSESSMENT_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_ASSESSMENT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1098,
					"offsetEnd": 1107,
					"columnNum": 299
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_GRADE_LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1108,
					"offsetEnd": 1109,
					"columnNum": 300
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1110,
					"offsetEnd": 1110,
					"columnNum": 301
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1111,
					"offsetEnd": 1114,
					"columnNum": 302
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1115,
					"offsetEnd": 1117,
					"columnNum": 303
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1118,
					"offsetEnd": 1120,
					"columnNum": 304
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1121,
					"offsetEnd": 1122,
					"columnNum": 305
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1123,
					"offsetEnd": 1124,
					"columnNum": 306
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1125,
					"offsetEnd": 1128,
					"columnNum": 307
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1129,
					"offsetEnd": 1130,
					"columnNum": 308
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1131,
					"offsetEnd": 1132,
					"columnNum": 309
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1133,
					"offsetEnd": 1134,
					"columnNum": 310
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1135,
					"offsetEnd": 1136,
					"columnNum": 311
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1137,
					"offsetEnd": 1138,
					"columnNum": 312
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1139,
					"offsetEnd": 1140,
					"columnNum": 313
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1141,
					"offsetEnd": 1142,
					"columnNum": 314
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1143,
					"offsetEnd": 1144,
					"columnNum": 315
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1145,
					"offsetEnd": 1146,
					"columnNum": 316
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_ESSAY_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_ESSAY_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1147,
					"offsetEnd": 1147,
					"columnNum": 317
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_ESSAY_ANALYSIS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_ESSAY_ANALYSIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1148,
					"offsetEnd": 1148,
					"columnNum": 318
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_ESSAY_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_ESSAY_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1149,
					"offsetEnd": 1149,
					"columnNum": 319
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_22",
				"otherPossibleNames": [],
				"logicalName": "FILLER_22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1150,
					"offsetEnd": 1152,
					"columnNum": 320
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_CRITICAL_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1153,
					"offsetEnd": 1155,
					"columnNum": 321
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1156,
					"offsetEnd": 1158,
					"columnNum": 322
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1159,
					"offsetEnd": 1161,
					"columnNum": 323
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_ESSAY",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1162,
					"offsetEnd": 1163,
					"columnNum": 324
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SAT_ESSAY_MC",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1164,
					"offsetEnd": 1165,
					"columnNum": 325
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_23",
				"otherPossibleNames": [],
				"logicalName": "FILLER_23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1166,
					"offsetEnd": 1177,
					"columnNum": 326
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_24",
				"otherPossibleNames": [],
				"logicalName": "FILLER_24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1178,
					"offsetEnd": 1181,
					"columnNum": 327
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_REGISTRATION_NUM",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_REGISTRATION_NUM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1182,
					"offsetEnd": 1196,
					"columnNum": 328
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_MAKE_UP",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_MAKE_UP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1197,
					"offsetEnd": 1197,
					"columnNum": 329
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_ASSESSMENT_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_ASSESSMENT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1198,
					"offsetEnd": 1207,
					"columnNum": 330
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_GRADE_LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1208,
					"offsetEnd": 1209,
					"columnNum": 331
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1210,
					"offsetEnd": 1210,
					"columnNum": 332
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1211,
					"offsetEnd": 1214,
					"columnNum": 333
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1215,
					"offsetEnd": 1217,
					"columnNum": 334
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1218,
					"offsetEnd": 1220,
					"columnNum": 335
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1221,
					"offsetEnd": 1222,
					"columnNum": 336
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1223,
					"offsetEnd": 1224,
					"columnNum": 337
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1225,
					"offsetEnd": 1228,
					"columnNum": 338
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1229,
					"offsetEnd": 1230,
					"columnNum": 339
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1231,
					"offsetEnd": 1232,
					"columnNum": 340
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1233,
					"offsetEnd": 1234,
					"columnNum": 341
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1235,
					"offsetEnd": 1236,
					"columnNum": 342
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1237,
					"offsetEnd": 1238,
					"columnNum": 343
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1239,
					"offsetEnd": 1240,
					"columnNum": 344
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1241,
					"offsetEnd": 1242,
					"columnNum": 345
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1243,
					"offsetEnd": 1244,
					"columnNum": 346
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1245,
					"offsetEnd": 1246,
					"columnNum": 347
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_ESSAY_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_ESSAY_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1247,
					"offsetEnd": 1247,
					"columnNum": 348
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_ESSAY_ANALYSIS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_ESSAY_ANALYSIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1248,
					"offsetEnd": 1248,
					"columnNum": 349
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_ESSAY_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_ESSAY_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1249,
					"offsetEnd": 1249,
					"columnNum": 350
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_25",
				"otherPossibleNames": [],
				"logicalName": "FILLER_25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1250,
					"offsetEnd": 1252,
					"columnNum": 351
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_CRITICAL_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1253,
					"offsetEnd": 1255,
					"columnNum": 352
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1256,
					"offsetEnd": 1258,
					"columnNum": 353
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1259,
					"offsetEnd": 1261,
					"columnNum": 354
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_ESSAY",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1262,
					"offsetEnd": 1263,
					"columnNum": 355
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SAT_ESSAY_MC",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1264,
					"offsetEnd": 1265,
					"columnNum": 356
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_26",
				"otherPossibleNames": [],
				"logicalName": "FILLER_26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1266,
					"offsetEnd": 1277,
					"columnNum": 357
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_27",
				"otherPossibleNames": [],
				"logicalName": "FILLER_27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1278,
					"offsetEnd": 1281,
					"columnNum": 358
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_REGISTRATION_NUM",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_REGISTRATION_NUM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1282,
					"offsetEnd": 1296,
					"columnNum": 359
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_MAKE_UP",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_MAKE_UP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1297,
					"offsetEnd": 1297,
					"columnNum": 360
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_ASSESSMENT_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_ASSESSMENT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1298,
					"offsetEnd": 1307,
					"columnNum": 361
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_GRADE_LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1308,
					"offsetEnd": 1309,
					"columnNum": 362
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1310,
					"offsetEnd": 1310,
					"columnNum": 363
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1311,
					"offsetEnd": 1314,
					"columnNum": 364
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1315,
					"offsetEnd": 1317,
					"columnNum": 365
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1318,
					"offsetEnd": 1320,
					"columnNum": 366
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1321,
					"offsetEnd": 1322,
					"columnNum": 367
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1323,
					"offsetEnd": 1324,
					"columnNum": 368
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1325,
					"offsetEnd": 1328,
					"columnNum": 369
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1329,
					"offsetEnd": 1330,
					"columnNum": 370
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1331,
					"offsetEnd": 1332,
					"columnNum": 371
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1333,
					"offsetEnd": 1334,
					"columnNum": 372
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1335,
					"offsetEnd": 1336,
					"columnNum": 373
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1337,
					"offsetEnd": 1338,
					"columnNum": 374
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1339,
					"offsetEnd": 1340,
					"columnNum": 375
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1341,
					"offsetEnd": 1342,
					"columnNum": 376
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1343,
					"offsetEnd": 1344,
					"columnNum": 377
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1345,
					"offsetEnd": 1346,
					"columnNum": 378
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_ESSAY_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_ESSAY_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1347,
					"offsetEnd": 1347,
					"columnNum": 379
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_ESSAY_ANALYSIS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_ESSAY_ANALYSIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1348,
					"offsetEnd": 1348,
					"columnNum": 380
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_ESSAY_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_ESSAY_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1349,
					"offsetEnd": 1349,
					"columnNum": 381
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_28",
				"otherPossibleNames": [],
				"logicalName": "FILLER_28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1350,
					"offsetEnd": 1352,
					"columnNum": 382
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_CRITICAL_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1353,
					"offsetEnd": 1355,
					"columnNum": 383
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1356,
					"offsetEnd": 1358,
					"columnNum": 384
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1359,
					"offsetEnd": 1361,
					"columnNum": 385
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_ESSAY",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1362,
					"offsetEnd": 1363,
					"columnNum": 386
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SAT_ESSAY_MC",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1364,
					"offsetEnd": 1365,
					"columnNum": 387
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_29",
				"otherPossibleNames": [],
				"logicalName": "FILLER_29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1366,
					"offsetEnd": 1377,
					"columnNum": 388
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_30",
				"otherPossibleNames": [],
				"logicalName": "FILLER_30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1378,
					"offsetEnd": 1381,
					"columnNum": 389
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_REGISTRATION_NUM",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_REGISTRATION_NUM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1382,
					"offsetEnd": 1396,
					"columnNum": 390
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_MAKE_UP",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_MAKE_UP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1397,
					"offsetEnd": 1397,
					"columnNum": 391
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_ASSESSMENT_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_ASSESSMENT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1398,
					"offsetEnd": 1407,
					"columnNum": 392
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_GRADE_LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1408,
					"offsetEnd": 1409,
					"columnNum": 393
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1410,
					"offsetEnd": 1410,
					"columnNum": 394
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1411,
					"offsetEnd": 1414,
					"columnNum": 395
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1415,
					"offsetEnd": 1417,
					"columnNum": 396
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1418,
					"offsetEnd": 1420,
					"columnNum": 397
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1421,
					"offsetEnd": 1422,
					"columnNum": 398
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1423,
					"offsetEnd": 1424,
					"columnNum": 399
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1425,
					"offsetEnd": 1428,
					"columnNum": 400
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1429,
					"offsetEnd": 1430,
					"columnNum": 401
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1431,
					"offsetEnd": 1432,
					"columnNum": 402
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1433,
					"offsetEnd": 1434,
					"columnNum": 403
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1435,
					"offsetEnd": 1436,
					"columnNum": 404
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1437,
					"offsetEnd": 1438,
					"columnNum": 405
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1439,
					"offsetEnd": 1440,
					"columnNum": 406
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1441,
					"offsetEnd": 1442,
					"columnNum": 407
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1443,
					"offsetEnd": 1444,
					"columnNum": 408
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1445,
					"offsetEnd": 1446,
					"columnNum": 409
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_ESSAY_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_ESSAY_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1447,
					"offsetEnd": 1447,
					"columnNum": 410
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_ESSAY_ANALYSIS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_ESSAY_ANALYSIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1448,
					"offsetEnd": 1448,
					"columnNum": 411
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_ESSAY_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_ESSAY_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1449,
					"offsetEnd": 1449,
					"columnNum": 412
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_31",
				"otherPossibleNames": [],
				"logicalName": "FILLER_31",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1450,
					"offsetEnd": 1452,
					"columnNum": 413
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_CRITICAL_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1453,
					"offsetEnd": 1455,
					"columnNum": 414
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1456,
					"offsetEnd": 1458,
					"columnNum": 415
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1459,
					"offsetEnd": 1461,
					"columnNum": 416
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_ESSAY",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1462,
					"offsetEnd": 1463,
					"columnNum": 417
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SAT_ESSAY_MC",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1464,
					"offsetEnd": 1465,
					"columnNum": 418
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_32",
				"otherPossibleNames": [],
				"logicalName": "FILLER_32",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1466,
					"offsetEnd": 1477,
					"columnNum": 419
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_33",
				"otherPossibleNames": [],
				"logicalName": "FILLER_33",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1478,
					"offsetEnd": 1481,
					"columnNum": 420
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_REGISTRATION_NUM",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_REGISTRATION_NUM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1482,
					"offsetEnd": 1496,
					"columnNum": 421
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_MAKE_UP",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_MAKE_UP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1497,
					"offsetEnd": 1497,
					"columnNum": 422
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_ASSESSMENT_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_ASSESSMENT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1498,
					"offsetEnd": 1507,
					"columnNum": 423
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_GRADE_LEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1508,
					"offsetEnd": 1509,
					"columnNum": 424
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1510,
					"offsetEnd": 1510,
					"columnNum": 425
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1511,
					"offsetEnd": 1514,
					"columnNum": 426
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1515,
					"offsetEnd": 1517,
					"columnNum": 427
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1518,
					"offsetEnd": 1520,
					"columnNum": 428
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1521,
					"offsetEnd": 1522,
					"columnNum": 429
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1523,
					"offsetEnd": 1524,
					"columnNum": 430
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1525,
					"offsetEnd": 1528,
					"columnNum": 431
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1529,
					"offsetEnd": 1530,
					"columnNum": 432
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1531,
					"offsetEnd": 1532,
					"columnNum": 433
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1533,
					"offsetEnd": 1534,
					"columnNum": 434
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1535,
					"offsetEnd": 1536,
					"columnNum": 435
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1537,
					"offsetEnd": 1538,
					"columnNum": 436
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1539,
					"offsetEnd": 1540,
					"columnNum": 437
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1541,
					"offsetEnd": 1542,
					"columnNum": 438
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1543,
					"offsetEnd": 1544,
					"columnNum": 439
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1545,
					"offsetEnd": 1546,
					"columnNum": 440
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_ESSAY_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_ESSAY_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1547,
					"offsetEnd": 1547,
					"columnNum": 441
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_ESSAY_ANALYSIS",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_ESSAY_ANALYSIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1548,
					"offsetEnd": 1548,
					"columnNum": 442
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_ESSAY_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_ESSAY_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1549,
					"offsetEnd": 1549,
					"columnNum": 443
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_34",
				"otherPossibleNames": [],
				"logicalName": "FILLER_34",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1550,
					"offsetEnd": 1552,
					"columnNum": 444
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_CRITICAL_READING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_CRITICAL_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1553,
					"offsetEnd": 1555,
					"columnNum": 445
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_MATH",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1556,
					"offsetEnd": 1558,
					"columnNum": 446
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_WRITING",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1559,
					"offsetEnd": 1561,
					"columnNum": 447
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_ESSAY",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_ESSAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1562,
					"offsetEnd": 1563,
					"columnNum": 448
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SAT_ESSAY_MC",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SAT_ESSAY_MC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1564,
					"offsetEnd": 1565,
					"columnNum": 449
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_35",
				"otherPossibleNames": [],
				"logicalName": "FILLER_35",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1566,
					"offsetEnd": 1577,
					"columnNum": 450
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_36",
				"otherPossibleNames": [],
				"logicalName": "FILLER_36",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1578,
					"offsetEnd": 1581,
					"columnNum": 451
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_DATE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1582,
					"offsetEnd": 1591,
					"columnNum": 452
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_GRADELEVEL",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_GRADELEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1592,
					"offsetEnd": 1593,
					"columnNum": 453
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_REVISED",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1594,
					"offsetEnd": 1594,
					"columnNum": 454
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST1_ID",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1595,
					"offsetEnd": 1596,
					"columnNum": 455
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST1_SCORE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1597,
					"offsetEnd": 1599,
					"columnNum": 456
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST1_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1600,
					"offsetEnd": 1601,
					"columnNum": 457
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST1_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1602,
					"offsetEnd": 1603,
					"columnNum": 458
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST1_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1604,
					"offsetEnd": 1605,
					"columnNum": 459
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST2_ID",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1606,
					"offsetEnd": 1607,
					"columnNum": 460
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST2_SCORE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1608,
					"offsetEnd": 1610,
					"columnNum": 461
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST2_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1611,
					"offsetEnd": 1612,
					"columnNum": 462
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST2_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1613,
					"offsetEnd": 1614,
					"columnNum": 463
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST2_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1615,
					"offsetEnd": 1616,
					"columnNum": 464
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST3_ID",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1617,
					"offsetEnd": 1618,
					"columnNum": 465
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST3_SCORE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1619,
					"offsetEnd": 1621,
					"columnNum": 466
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST3_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1622,
					"offsetEnd": 1623,
					"columnNum": 467
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST3_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1624,
					"offsetEnd": 1625,
					"columnNum": 468
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_SUBJ_TEST3_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "LATEST_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1626,
					"offsetEnd": 1627,
					"columnNum": 469
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1628,
					"offsetEnd": 1637,
					"columnNum": 470
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_GRADELEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_GRADELEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1638,
					"offsetEnd": 1639,
					"columnNum": 471
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1640,
					"offsetEnd": 1640,
					"columnNum": 472
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST1_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1641,
					"offsetEnd": 1642,
					"columnNum": 473
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST1_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1643,
					"offsetEnd": 1645,
					"columnNum": 474
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST1_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1646,
					"offsetEnd": 1647,
					"columnNum": 475
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST1_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1648,
					"offsetEnd": 1649,
					"columnNum": 476
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST1_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1650,
					"offsetEnd": 1651,
					"columnNum": 477
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST2_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1652,
					"offsetEnd": 1653,
					"columnNum": 478
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST2_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1654,
					"offsetEnd": 1656,
					"columnNum": 479
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST2_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1657,
					"offsetEnd": 1658,
					"columnNum": 480
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST2_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1659,
					"offsetEnd": 1660,
					"columnNum": 481
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST2_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1661,
					"offsetEnd": 1662,
					"columnNum": 482
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST3_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1663,
					"offsetEnd": 1664,
					"columnNum": 483
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST3_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1665,
					"offsetEnd": 1667,
					"columnNum": 484
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST3_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1668,
					"offsetEnd": 1669,
					"columnNum": 485
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST3_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1670,
					"offsetEnd": 1671,
					"columnNum": 486
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN2_SUBJ_TEST3_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1672,
					"offsetEnd": 1673,
					"columnNum": 487
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1674,
					"offsetEnd": 1683,
					"columnNum": 488
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_GRADELEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_GRADELEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1684,
					"offsetEnd": 1685,
					"columnNum": 489
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1686,
					"offsetEnd": 1686,
					"columnNum": 490
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST1_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1687,
					"offsetEnd": 1688,
					"columnNum": 491
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST1_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1689,
					"offsetEnd": 1691,
					"columnNum": 492
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST1_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1692,
					"offsetEnd": 1693,
					"columnNum": 493
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST1_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1694,
					"offsetEnd": 1695,
					"columnNum": 494
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST1_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1696,
					"offsetEnd": 1697,
					"columnNum": 495
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST2_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1698,
					"offsetEnd": 1699,
					"columnNum": 496
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST2_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1700,
					"offsetEnd": 1702,
					"columnNum": 497
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST2_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1703,
					"offsetEnd": 1704,
					"columnNum": 498
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST2_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1705,
					"offsetEnd": 1706,
					"columnNum": 499
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST2_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1707,
					"offsetEnd": 1708,
					"columnNum": 500
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST3_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1709,
					"offsetEnd": 1710,
					"columnNum": 501
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST3_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1711,
					"offsetEnd": 1713,
					"columnNum": 502
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST3_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1714,
					"offsetEnd": 1715,
					"columnNum": 503
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST3_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1716,
					"offsetEnd": 1717,
					"columnNum": 504
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN3_SUBJ_TEST3_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1718,
					"offsetEnd": 1719,
					"columnNum": 505
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1720,
					"offsetEnd": 1729,
					"columnNum": 506
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_GRADELEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_GRADELEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1730,
					"offsetEnd": 1731,
					"columnNum": 507
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1732,
					"offsetEnd": 1732,
					"columnNum": 508
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST1_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1733,
					"offsetEnd": 1734,
					"columnNum": 509
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST1_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1735,
					"offsetEnd": 1737,
					"columnNum": 510
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST1_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1738,
					"offsetEnd": 1739,
					"columnNum": 511
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST1_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1740,
					"offsetEnd": 1741,
					"columnNum": 512
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST1_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1742,
					"offsetEnd": 1743,
					"columnNum": 513
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST2_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1744,
					"offsetEnd": 1745,
					"columnNum": 514
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST2_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1746,
					"offsetEnd": 1748,
					"columnNum": 515
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST2_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1749,
					"offsetEnd": 1750,
					"columnNum": 516
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST2_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1751,
					"offsetEnd": 1752,
					"columnNum": 517
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST2_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1753,
					"offsetEnd": 1754,
					"columnNum": 518
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST3_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1755,
					"offsetEnd": 1756,
					"columnNum": 519
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST3_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1757,
					"offsetEnd": 1759,
					"columnNum": 520
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST3_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1760,
					"offsetEnd": 1761,
					"columnNum": 521
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST3_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1762,
					"offsetEnd": 1763,
					"columnNum": 522
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN4_SUBJ_TEST3_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1764,
					"offsetEnd": 1765,
					"columnNum": 523
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1766,
					"offsetEnd": 1775,
					"columnNum": 524
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_GRADELEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_GRADELEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1776,
					"offsetEnd": 1777,
					"columnNum": 525
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1778,
					"offsetEnd": 1778,
					"columnNum": 526
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST1_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1779,
					"offsetEnd": 1780,
					"columnNum": 527
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST1_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1781,
					"offsetEnd": 1783,
					"columnNum": 528
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST1_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1784,
					"offsetEnd": 1785,
					"columnNum": 529
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST1_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1786,
					"offsetEnd": 1787,
					"columnNum": 530
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST1_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1788,
					"offsetEnd": 1789,
					"columnNum": 531
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST2_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1790,
					"offsetEnd": 1791,
					"columnNum": 532
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST2_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1792,
					"offsetEnd": 1794,
					"columnNum": 533
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST2_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1795,
					"offsetEnd": 1796,
					"columnNum": 534
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST2_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1797,
					"offsetEnd": 1798,
					"columnNum": 535
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST2_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1799,
					"offsetEnd": 1800,
					"columnNum": 536
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST3_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1801,
					"offsetEnd": 1802,
					"columnNum": 537
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST3_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1803,
					"offsetEnd": 1805,
					"columnNum": 538
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST3_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1806,
					"offsetEnd": 1807,
					"columnNum": 539
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST3_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1808,
					"offsetEnd": 1809,
					"columnNum": 540
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN5_SUBJ_TEST3_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1810,
					"offsetEnd": 1811,
					"columnNum": 541
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_DATE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1812,
					"offsetEnd": 1821,
					"columnNum": 542
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_GRADELEVEL",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_GRADELEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1822,
					"offsetEnd": 1823,
					"columnNum": 543
				},
				"fieldLength": 2,
				"expectedValues": ["1", "2", "4", "5", "6", "7", "8", "10", "11", "12", "13"],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_REVISED",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_REVISED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1824,
					"offsetEnd": 1824,
					"columnNum": 544
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST1_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1825,
					"offsetEnd": 1826,
					"columnNum": 545
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST1_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1827,
					"offsetEnd": 1829,
					"columnNum": 546
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST1_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1830,
					"offsetEnd": 1831,
					"columnNum": 547
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST1_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1832,
					"offsetEnd": 1833,
					"columnNum": 548
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST1_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1834,
					"offsetEnd": 1835,
					"columnNum": 549
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST2_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1836,
					"offsetEnd": 1837,
					"columnNum": 550
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST2_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1838,
					"offsetEnd": 1840,
					"columnNum": 551
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST2_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1841,
					"offsetEnd": 1842,
					"columnNum": 552
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST2_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1843,
					"offsetEnd": 1844,
					"columnNum": 553
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST2_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1845,
					"offsetEnd": 1846,
					"columnNum": 554
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST3_ID",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1847,
					"offsetEnd": 1848,
					"columnNum": 555
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST3_SCORE",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1849,
					"offsetEnd": 1851,
					"columnNum": 556
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST3_SUBSCR1",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1852,
					"offsetEnd": 1853,
					"columnNum": 557
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST3_SUBSCR2",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1854,
					"offsetEnd": 1855,
					"columnNum": 558
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ADMIN6_SUBJ_TEST3_SUBSCR3",
				"otherPossibleNames": [],
				"logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1856,
					"offsetEnd": 1857,
					"columnNum": 559
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ1_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ1_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1858,
					"offsetEnd": 1859,
					"columnNum": 560
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ1_SUBSCR1_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ1_SUBSCR1_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1860,
					"offsetEnd": 1861,
					"columnNum": 561
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ1_SUBSCR2_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ1_SUBSCR2_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1862,
					"offsetEnd": 1863,
					"columnNum": 562
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ1_SUBSCR3_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ1_SUBSCR3_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1864,
					"offsetEnd": 1865,
					"columnNum": 563
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ2_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ2_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1866,
					"offsetEnd": 1867,
					"columnNum": 564
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ2_SUBSCR1_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ2_SUBSCR1_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1868,
					"offsetEnd": 1869,
					"columnNum": 565
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ2_SUBSCR2_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ2_SUBSCR2_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1870,
					"offsetEnd": 1871,
					"columnNum": 566
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ2_SUBSCR3_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ2_SUBSCR3_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1872,
					"offsetEnd": 1873,
					"columnNum": 567
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ3_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ3_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1874,
					"offsetEnd": 1875,
					"columnNum": 568
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ3_SUBSCR1_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ3_SUBSCR1_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1876,
					"offsetEnd": 1877,
					"columnNum": 569
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ3_SUBSCR2_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ3_SUBSCR2_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1878,
					"offsetEnd": 1879,
					"columnNum": 570
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SUBJ3_SUBSCR3_PERCENTILE",
				"otherPossibleNames": [],
				"logicalName": "SUBJ3_SUBSCR3_PERCENTILE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1880,
					"offsetEnd": 1881,
					"columnNum": 571
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_37",
				"otherPossibleNames": [],
				"logicalName": "FILLER_37",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1882,
					"offsetEnd": 1891,
					"columnNum": 572
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_38",
				"otherPossibleNames": [],
				"logicalName": "FILLER_38",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1892,
					"offsetEnd": 1901,
					"columnNum": 573
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SELF_ASSMT_DATE",
				"otherPossibleNames": [],
				"logicalName": "SELF_ASSMT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1902,
					"offsetEnd": 1911,
					"columnNum": 574
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "GPA",
				"otherPossibleNames": [],
				"logicalName": "GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1912,
					"offsetEnd": 1913,
					"columnNum": 575
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HS_RANK",
				"otherPossibleNames": [],
				"logicalName": "HS_RANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1914,
					"offsetEnd": 1914,
					"columnNum": 576
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FIRST_LANG",
				"otherPossibleNames": [],
				"logicalName": "FIRST_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1915,
					"offsetEnd": 1915,
					"columnNum": 577
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "BEST_LANG",
				"otherPossibleNames": [],
				"logicalName": "BEST_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1916,
					"offsetEnd": 1916,
					"columnNum": 578
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CITIZENSHIP",
				"otherPossibleNames": [],
				"logicalName": "CITIZENSHIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1917,
					"offsetEnd": 1917,
					"columnNum": 579
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_39",
				"otherPossibleNames": [],
				"logicalName": "FILLER_39",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1918,
					"offsetEnd": 1920,
					"columnNum": 580
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AVG_GRD_ARTMUSIC",
				"otherPossibleNames": [],
				"logicalName": "AVG_GRD_ARTMUSIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1921,
					"offsetEnd": 1922,
					"columnNum": 581
				},
				"fieldLength": 2,
				"expectedValues": ["2", "5", "8", "11", "13", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AVG_GRD_ENGLISH",
				"otherPossibleNames": [],
				"logicalName": "AVG_GRD_ENGLISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1923,
					"offsetEnd": 1924,
					"columnNum": 582
				},
				"fieldLength": 2,
				"expectedValues": ["2", "5", "8", "11", "13", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AVG_GRD_LANGUAGE",
				"otherPossibleNames": [],
				"logicalName": "AVG_GRD_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1925,
					"offsetEnd": 1926,
					"columnNum": 583
				},
				"fieldLength": 2,
				"expectedValues": ["2", "5", "8", "11", "13", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AVG_GRD_MATH",
				"otherPossibleNames": [],
				"logicalName": "AVG_GRD_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1927,
					"offsetEnd": 1928,
					"columnNum": 584
				},
				"fieldLength": 2,
				"expectedValues": ["2", "5", "8", "11", "13", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AVG_GRD_NATSCI",
				"otherPossibleNames": [],
				"logicalName": "AVG_GRD_NATSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1929,
					"offsetEnd": 1930,
					"columnNum": 585
				},
				"fieldLength": 2,
				"expectedValues": ["2", "5", "8", "11", "13", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AVG_GRD_SOCSCI",
				"otherPossibleNames": [],
				"logicalName": "AVG_GRD_SOCSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1931,
					"offsetEnd": 1932,
					"columnNum": 586
				},
				"fieldLength": 2,
				"expectedValues": ["2", "5", "8", "11", "13", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ART",
				"otherPossibleNames": [],
				"logicalName": "HSD_ART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1933,
					"offsetEnd": 1934,
					"columnNum": 587
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ART",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1935,
					"offsetEnd": 1935,
					"columnNum": 588
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ENG",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1936,
					"offsetEnd": 1937,
					"columnNum": 589
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ENG",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ENG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1938,
					"offsetEnd": 1938,
					"columnNum": 590
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_FORLANG",
				"otherPossibleNames": [],
				"logicalName": "HSD_FORLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1939,
					"offsetEnd": 1940,
					"columnNum": 591
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_FORLANG",
				"otherPossibleNames": [],
				"logicalName": "HONORS_FORLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1941,
					"offsetEnd": 1941,
					"columnNum": 592
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_MATH",
				"otherPossibleNames": [],
				"logicalName": "HSD_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1942,
					"offsetEnd": 1943,
					"columnNum": 593
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_MATH",
				"otherPossibleNames": [],
				"logicalName": "HONORS_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1944,
					"offsetEnd": 1944,
					"columnNum": 594
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_NATSCI",
				"otherPossibleNames": [],
				"logicalName": "HSD_NATSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1945,
					"offsetEnd": 1946,
					"columnNum": 595
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_NATSCI",
				"otherPossibleNames": [],
				"logicalName": "HONORS_NATSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1947,
					"offsetEnd": 1947,
					"columnNum": 596
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_SOCSCI",
				"otherPossibleNames": [],
				"logicalName": "HSD_SOCSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1948,
					"offsetEnd": 1949,
					"columnNum": 597
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_SOCSCI",
				"otherPossibleNames": [],
				"logicalName": "HONORS_SOCSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1950,
					"offsetEnd": 1950,
					"columnNum": 598
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_CHIN",
				"otherPossibleNames": [],
				"logicalName": "HSD_CHIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1951,
					"offsetEnd": 1952,
					"columnNum": 599
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_CHIN",
				"otherPossibleNames": [],
				"logicalName": "HONORS_CHIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1953,
					"offsetEnd": 1953,
					"columnNum": 600
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_FRENCH",
				"otherPossibleNames": [],
				"logicalName": "HSD_FRENCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1954,
					"offsetEnd": 1955,
					"columnNum": 601
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_FRENCH",
				"otherPossibleNames": [],
				"logicalName": "HONORS_FRENCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1956,
					"offsetEnd": 1956,
					"columnNum": 602
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_GERM",
				"otherPossibleNames": [],
				"logicalName": "HSD_GERM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1957,
					"offsetEnd": 1958,
					"columnNum": 603
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_GERM",
				"otherPossibleNames": [],
				"logicalName": "HONORS_GERM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1959,
					"offsetEnd": 1959,
					"columnNum": 604
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_GREEK",
				"otherPossibleNames": [],
				"logicalName": "HSD_GREEK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1960,
					"offsetEnd": 1961,
					"columnNum": 605
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_GREEK",
				"otherPossibleNames": [],
				"logicalName": "HONORS_GREEK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1962,
					"offsetEnd": 1962,
					"columnNum": 606
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_HEBR",
				"otherPossibleNames": [],
				"logicalName": "HSD_HEBR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1963,
					"offsetEnd": 1964,
					"columnNum": 607
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_HEBR",
				"otherPossibleNames": [],
				"logicalName": "HONORS_HEBR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1965,
					"offsetEnd": 1965,
					"columnNum": 608
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ITALIAN",
				"otherPossibleNames": [],
				"logicalName": "HSD_ITALIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1966,
					"offsetEnd": 1967,
					"columnNum": 609
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ITALIAN",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ITALIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1968,
					"offsetEnd": 1968,
					"columnNum": 610
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_JAP",
				"otherPossibleNames": [],
				"logicalName": "HSD_JAP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1969,
					"offsetEnd": 1970,
					"columnNum": 611
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_JAP",
				"otherPossibleNames": [],
				"logicalName": "HONORS_JAP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1971,
					"offsetEnd": 1971,
					"columnNum": 612
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_KOR",
				"otherPossibleNames": [],
				"logicalName": "HSD_KOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1972,
					"offsetEnd": 1973,
					"columnNum": 613
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_KOR",
				"otherPossibleNames": [],
				"logicalName": "HONORS_KOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1974,
					"offsetEnd": 1974,
					"columnNum": 614
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_LATIN",
				"otherPossibleNames": [],
				"logicalName": "HSD_LATIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1975,
					"offsetEnd": 1976,
					"columnNum": 615
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_LATIN",
				"otherPossibleNames": [],
				"logicalName": "HONORS_LATIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1977,
					"offsetEnd": 1977,
					"columnNum": 616
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_RUSSN",
				"otherPossibleNames": [],
				"logicalName": "HSD_RUSSN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1978,
					"offsetEnd": 1979,
					"columnNum": 617
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_RUSSN",
				"otherPossibleNames": [],
				"logicalName": "HONORS_RUSSN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1980,
					"offsetEnd": 1980,
					"columnNum": 618
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_SPAN",
				"otherPossibleNames": [],
				"logicalName": "HSD_SPAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1981,
					"offsetEnd": 1982,
					"columnNum": 619
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_SPAN",
				"otherPossibleNames": [],
				"logicalName": "HONORS_SPAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1983,
					"offsetEnd": 1983,
					"columnNum": 620
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_OTHLANG",
				"otherPossibleNames": [],
				"logicalName": "HSD_OTHLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1984,
					"offsetEnd": 1985,
					"columnNum": 621
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_OTHLANG",
				"otherPossibleNames": [],
				"logicalName": "HONORS_OTHLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1986,
					"offsetEnd": 1986,
					"columnNum": 622
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_PREALG",
				"otherPossibleNames": [],
				"logicalName": "HSD_PREALG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1987,
					"offsetEnd": 1988,
					"columnNum": 623
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_PREALG",
				"otherPossibleNames": [],
				"logicalName": "HONORS_PREALG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1989,
					"offsetEnd": 1989,
					"columnNum": 624
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ALGI",
				"otherPossibleNames": [],
				"logicalName": "HSD_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1990,
					"offsetEnd": 1991,
					"columnNum": 625
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ALGI",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ALGI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1992,
					"offsetEnd": 1992,
					"columnNum": 626
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ALGII",
				"otherPossibleNames": [],
				"logicalName": "HSD_ALGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1993,
					"offsetEnd": 1994,
					"columnNum": 627
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ALGII",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ALGII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1995,
					"offsetEnd": 1995,
					"columnNum": 628
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_GEOM",
				"otherPossibleNames": [],
				"logicalName": "HSD_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1996,
					"offsetEnd": 1997,
					"columnNum": 629
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_GEOM",
				"otherPossibleNames": [],
				"logicalName": "HONORS_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1998,
					"offsetEnd": 1998,
					"columnNum": 630
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_TRIG",
				"otherPossibleNames": [],
				"logicalName": "HSD_TRIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1999,
					"offsetEnd": 2000,
					"columnNum": 631
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_TRIG",
				"otherPossibleNames": [],
				"logicalName": "HONORS_TRIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2001,
					"offsetEnd": 2001,
					"columnNum": 632
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_PRECALC",
				"otherPossibleNames": [],
				"logicalName": "HSD_PRECALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2002,
					"offsetEnd": 2003,
					"columnNum": 633
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_PRECALC",
				"otherPossibleNames": [],
				"logicalName": "HONORS_PRECALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2004,
					"offsetEnd": 2004,
					"columnNum": 634
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_CALC",
				"otherPossibleNames": [],
				"logicalName": "HSD_CALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2005,
					"offsetEnd": 2006,
					"columnNum": 635
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_CALC",
				"otherPossibleNames": [],
				"logicalName": "HONORS_CALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2007,
					"offsetEnd": 2007,
					"columnNum": 636
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_INTMATH",
				"otherPossibleNames": [],
				"logicalName": "HSD_INTMATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2008,
					"offsetEnd": 2009,
					"columnNum": 637
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_INTMATH",
				"otherPossibleNames": [],
				"logicalName": "HONORS_INTMATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2010,
					"offsetEnd": 2010,
					"columnNum": 638
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_STAT",
				"otherPossibleNames": [],
				"logicalName": "HSD_STAT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2011,
					"offsetEnd": 2012,
					"columnNum": 639
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_STAT",
				"otherPossibleNames": [],
				"logicalName": "HONORS_STAT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2013,
					"offsetEnd": 2013,
					"columnNum": 640
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_COMPSCI",
				"otherPossibleNames": [],
				"logicalName": "HSD_COMPSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2014,
					"offsetEnd": 2015,
					"columnNum": 641
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_COMPSCI",
				"otherPossibleNames": [],
				"logicalName": "HONORS_COMPSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2016,
					"offsetEnd": 2016,
					"columnNum": 642
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_OTHRMATH",
				"otherPossibleNames": [],
				"logicalName": "HSD_OTHRMATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2017,
					"offsetEnd": 2018,
					"columnNum": 643
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_OTHRMATH",
				"otherPossibleNames": [],
				"logicalName": "HONORS_OTHRMATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2019,
					"offsetEnd": 2019,
					"columnNum": 644
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_AMLIT",
				"otherPossibleNames": [],
				"logicalName": "HSD_AMLIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2020,
					"offsetEnd": 2021,
					"columnNum": 645
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_AMLIT",
				"otherPossibleNames": [],
				"logicalName": "HONORS_AMLIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2022,
					"offsetEnd": 2022,
					"columnNum": 646
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_BRITLIT",
				"otherPossibleNames": [],
				"logicalName": "HSD_BRITLIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2023,
					"offsetEnd": 2024,
					"columnNum": 647
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_BRITLIT",
				"otherPossibleNames": [],
				"logicalName": "HONORS_BRITLIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2025,
					"offsetEnd": 2025,
					"columnNum": 648
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_COMP",
				"otherPossibleNames": [],
				"logicalName": "HSD_COMP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2026,
					"offsetEnd": 2027,
					"columnNum": 649
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_COMP",
				"otherPossibleNames": [],
				"logicalName": "HONORS_COMP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2028,
					"offsetEnd": 2028,
					"columnNum": 650
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ENGLANG",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENGLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2029,
					"offsetEnd": 2030,
					"columnNum": 651
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ENGLANG",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ENGLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2031,
					"offsetEnd": 2031,
					"columnNum": 652
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_LITOTHR",
				"otherPossibleNames": [],
				"logicalName": "HSD_LITOTHR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2032,
					"offsetEnd": 2033,
					"columnNum": 653
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_LITOTHR",
				"otherPossibleNames": [],
				"logicalName": "HONORS_LITOTHR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2034,
					"offsetEnd": 2034,
					"columnNum": 654
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_JOURN",
				"otherPossibleNames": [],
				"logicalName": "HSD_JOURN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2035,
					"offsetEnd": 2036,
					"columnNum": 655
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_JOURN",
				"otherPossibleNames": [],
				"logicalName": "HONORS_JOURN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2037,
					"offsetEnd": 2037,
					"columnNum": 656
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_CREATIVEWR",
				"otherPossibleNames": [],
				"logicalName": "HSD_CREATIVEWR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2038,
					"offsetEnd": 2039,
					"columnNum": 657
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_CREATIVEWR",
				"otherPossibleNames": [],
				"logicalName": "HONORS_CREATIVEWR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2040,
					"offsetEnd": 2040,
					"columnNum": 658
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_COMM",
				"otherPossibleNames": [],
				"logicalName": "HSD_COMM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2041,
					"offsetEnd": 2042,
					"columnNum": 659
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_COMM",
				"otherPossibleNames": [],
				"logicalName": "HONORS_COMM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2043,
					"offsetEnd": 2043,
					"columnNum": 660
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_PUBSPK",
				"otherPossibleNames": [],
				"logicalName": "HSD_PUBSPK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2044,
					"offsetEnd": 2045,
					"columnNum": 661
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_PUBSPK",
				"otherPossibleNames": [],
				"logicalName": "HONORS_PUBSPK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2046,
					"offsetEnd": 2046,
					"columnNum": 662
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ENGSECLANG",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENGSECLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2047,
					"offsetEnd": 2048,
					"columnNum": 663
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ENGSECLANG",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ENGSECLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2049,
					"offsetEnd": 2049,
					"columnNum": 664
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_BIO",
				"otherPossibleNames": [],
				"logicalName": "HSD_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2050,
					"offsetEnd": 2051,
					"columnNum": 665
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_BIO",
				"otherPossibleNames": [],
				"logicalName": "HONORS_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2052,
					"offsetEnd": 2052,
					"columnNum": 666
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_CHEM",
				"otherPossibleNames": [],
				"logicalName": "HSD_CHEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2053,
					"offsetEnd": 2054,
					"columnNum": 667
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_CHEM",
				"otherPossibleNames": [],
				"logicalName": "HONORS_CHEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2055,
					"offsetEnd": 2055,
					"columnNum": 668
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ENVSCI",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENVSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2056,
					"offsetEnd": 2057,
					"columnNum": 669
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ENVSCI",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ENVSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2058,
					"offsetEnd": 2058,
					"columnNum": 670
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_PHYS",
				"otherPossibleNames": [],
				"logicalName": "HSD_PHYS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2059,
					"offsetEnd": 2060,
					"columnNum": 671
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_PHYS",
				"otherPossibleNames": [],
				"logicalName": "HONORS_PHYS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2061,
					"offsetEnd": 2061,
					"columnNum": 672
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ENGINEER",
				"otherPossibleNames": [],
				"logicalName": "HSD_ENGINEER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2062,
					"offsetEnd": 2063,
					"columnNum": 673
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ENGINEER",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ENGINEER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2064,
					"offsetEnd": 2064,
					"columnNum": 674
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_OTHRSCI",
				"otherPossibleNames": [],
				"logicalName": "HSD_OTHRSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2065,
					"offsetEnd": 2066,
					"columnNum": 675
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_OTHRSCI",
				"otherPossibleNames": [],
				"logicalName": "HONORS_OTHRSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2067,
					"offsetEnd": 2067,
					"columnNum": 676
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_USHIST",
				"otherPossibleNames": [],
				"logicalName": "HSD_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2068,
					"offsetEnd": 2069,
					"columnNum": 677
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_USHIST",
				"otherPossibleNames": [],
				"logicalName": "HONORS_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2070,
					"offsetEnd": 2070,
					"columnNum": 678
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_USGVT",
				"otherPossibleNames": [],
				"logicalName": "HSD_USGVT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2071,
					"offsetEnd": 2072,
					"columnNum": 679
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_USGVT",
				"otherPossibleNames": [],
				"logicalName": "HONORS_USGVT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2073,
					"offsetEnd": 2073,
					"columnNum": 680
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_EURHIST",
				"otherPossibleNames": [],
				"logicalName": "HSD_EURHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2074,
					"offsetEnd": 2075,
					"columnNum": 681
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_EURHIST",
				"otherPossibleNames": [],
				"logicalName": "HONORS_EURHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2076,
					"offsetEnd": 2076,
					"columnNum": 682
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_WRLDHIST",
				"otherPossibleNames": [],
				"logicalName": "HSD_WRLDHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2077,
					"offsetEnd": 2078,
					"columnNum": 683
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_WRLDHIST",
				"otherPossibleNames": [],
				"logicalName": "HONORS_WRLDHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2079,
					"offsetEnd": 2079,
					"columnNum": 684
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ANCNTHIST",
				"otherPossibleNames": [],
				"logicalName": "HSD_ANCNTHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2080,
					"offsetEnd": 2081,
					"columnNum": 685
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ANCNTHIST",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ANCNTHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2082,
					"offsetEnd": 2082,
					"columnNum": 686
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_ECON",
				"otherPossibleNames": [],
				"logicalName": "HSD_ECON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2083,
					"offsetEnd": 2084,
					"columnNum": 687
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_ECON",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ECON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2085,
					"offsetEnd": 2085,
					"columnNum": 688
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_GEOGR",
				"otherPossibleNames": [],
				"logicalName": "HSD_GEOGR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2086,
					"offsetEnd": 2087,
					"columnNum": 689
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_GEOGR",
				"otherPossibleNames": [],
				"logicalName": "HONORS_GEOGR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2088,
					"offsetEnd": 2088,
					"columnNum": 690
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_PSYCH",
				"otherPossibleNames": [],
				"logicalName": "HSD_PSYCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2089,
					"offsetEnd": 2090,
					"columnNum": 691
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_PSYCH",
				"otherPossibleNames": [],
				"logicalName": "HONORS_PSYCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2091,
					"offsetEnd": 2091,
					"columnNum": 692
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_SOCIOLOGY",
				"otherPossibleNames": [],
				"logicalName": "HSD_SOCIOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2092,
					"offsetEnd": 2093,
					"columnNum": 693
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_SOCIOLOGY",
				"otherPossibleNames": [],
				"logicalName": "HONORS_SOCIOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2094,
					"offsetEnd": 2094,
					"columnNum": 694
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HSD_OTHRSOCSCI",
				"otherPossibleNames": [],
				"logicalName": "HSD_OTHRSOCSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2095,
					"offsetEnd": 2096,
					"columnNum": 695
				},
				"fieldLength": 2,
				"expectedValues": ["1 ", "2 ", "4 ", "6 ", "8 ", "10", "11","  "],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HONORS_OTHRSOCSCI",
				"otherPossibleNames": [],
				"logicalName": "HONORS_OTHRSOCSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2097,
					"offsetEnd": 2097,
					"columnNum": 696
				},
				"fieldLength": 1,
				"expectedValues": ["Y", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_40",
				"otherPossibleNames": [],
				"logicalName": "FILLER_40",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2098,
					"offsetEnd": 2112,
					"columnNum": 697
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_NONE",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_NONE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2113,
					"offsetEnd": 2114,
					"columnNum": 698
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_ACTING",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_ACTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2115,
					"offsetEnd": 2116,
					"columnNum": 699
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_HISTORY",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_HISTORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2117,
					"offsetEnd": 2118,
					"columnNum": 700
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_DANCE",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_DANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2119,
					"offsetEnd": 2120,
					"columnNum": 701
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_DRAMA",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_DRAMA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2121,
					"offsetEnd": 2122,
					"columnNum": 702
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_MUSIC",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_MUSIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2123,
					"offsetEnd": 2124,
					"columnNum": 703
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_INST_VOCAL",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_INST_VOCAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2125,
					"offsetEnd": 2126,
					"columnNum": 704
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_FILM",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_FILM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2127,
					"offsetEnd": 2128,
					"columnNum": 705
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EXPERIENCE_ARTMUSIC_ART",
				"otherPossibleNames": [],
				"logicalName": "EXPERIENCE_ARTMUSIC_ART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2129,
					"offsetEnd": 2130,
					"columnNum": 706
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY_PARTICIPATION",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY_PARTICIPATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2131,
					"offsetEnd": 2131,
					"columnNum": 707
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY1",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2132,
					"offsetEnd": 2133,
					"columnNum": 708
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY1_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2134,
					"offsetEnd": 2134,
					"columnNum": 709
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY1_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2135,
					"offsetEnd": 2135,
					"columnNum": 710
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY1_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2136,
					"offsetEnd": 2136,
					"columnNum": 711
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY1_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2137,
					"offsetEnd": 2137,
					"columnNum": 712
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY1_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY1_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2138,
					"offsetEnd": 2138,
					"columnNum": 713
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY2",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2139,
					"offsetEnd": 2140,
					"columnNum": 714
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY2_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2141,
					"offsetEnd": 2141,
					"columnNum": 715
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY2_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2142,
					"offsetEnd": 2142,
					"columnNum": 716
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY2_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2143,
					"offsetEnd": 2143,
					"columnNum": 717
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY2_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2144,
					"offsetEnd": 2144,
					"columnNum": 718
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY2_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY2_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2145,
					"offsetEnd": 2145,
					"columnNum": 719
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY3",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2146,
					"offsetEnd": 2147,
					"columnNum": 720
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY3_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2148,
					"offsetEnd": 2148,
					"columnNum": 721
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY3_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2149,
					"offsetEnd": 2149,
					"columnNum": 722
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY3_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2150,
					"offsetEnd": 2150,
					"columnNum": 723
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY3_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2151,
					"offsetEnd": 2151,
					"columnNum": 724
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY3_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY3_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2152,
					"offsetEnd": 2152,
					"columnNum": 725
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY4",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2153,
					"offsetEnd": 2154,
					"columnNum": 726
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY4_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2155,
					"offsetEnd": 2155,
					"columnNum": 727
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY4_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2156,
					"offsetEnd": 2156,
					"columnNum": 728
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY4_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2157,
					"offsetEnd": 2157,
					"columnNum": 729
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY4_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2158,
					"offsetEnd": 2158,
					"columnNum": 730
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY4_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY4_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2159,
					"offsetEnd": 2159,
					"columnNum": 731
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY5",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2160,
					"offsetEnd": 2161,
					"columnNum": 732
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY5_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2162,
					"offsetEnd": 2162,
					"columnNum": 733
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY5_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2163,
					"offsetEnd": 2163,
					"columnNum": 734
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY5_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2164,
					"offsetEnd": 2164,
					"columnNum": 735
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY5_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2165,
					"offsetEnd": 2165,
					"columnNum": 736
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY5_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY5_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2166,
					"offsetEnd": 2166,
					"columnNum": 737
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY6",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2167,
					"offsetEnd": 2168,
					"columnNum": 738
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY6_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2169,
					"offsetEnd": 2169,
					"columnNum": 739
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY6_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2170,
					"offsetEnd": 2170,
					"columnNum": 740
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY6_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2171,
					"offsetEnd": 2171,
					"columnNum": 741
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY6_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2172,
					"offsetEnd": 2172,
					"columnNum": 742
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY6_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY6_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2173,
					"offsetEnd": 2173,
					"columnNum": 743
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY7",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2174,
					"offsetEnd": 2175,
					"columnNum": 744
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY7_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2176,
					"offsetEnd": 2176,
					"columnNum": 745
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY7_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2177,
					"offsetEnd": 2177,
					"columnNum": 746
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY7_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2178,
					"offsetEnd": 2178,
					"columnNum": 747
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY7_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2179,
					"offsetEnd": 2179,
					"columnNum": 748
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY7_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY7_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2180,
					"offsetEnd": 2180,
					"columnNum": 749
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY8",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2181,
					"offsetEnd": 2182,
					"columnNum": 750
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY8_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2183,
					"offsetEnd": 2183,
					"columnNum": 751
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY8_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2184,
					"offsetEnd": 2184,
					"columnNum": 752
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY8_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2185,
					"offsetEnd": 2185,
					"columnNum": 753
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY8_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2186,
					"offsetEnd": 2186,
					"columnNum": 754
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY8_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY8_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2187,
					"offsetEnd": 2187,
					"columnNum": 755
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY9",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2188,
					"offsetEnd": 2189,
					"columnNum": 756
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY9_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2190,
					"offsetEnd": 2190,
					"columnNum": 757
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY9_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2191,
					"offsetEnd": 2191,
					"columnNum": 758
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY9_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2192,
					"offsetEnd": 2192,
					"columnNum": 759
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY9_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2193,
					"offsetEnd": 2193,
					"columnNum": 760
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY9_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY9_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2194,
					"offsetEnd": 2194,
					"columnNum": 761
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY10",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2195,
					"offsetEnd": 2196,
					"columnNum": 762
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY10_9TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_9TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2197,
					"offsetEnd": 2197,
					"columnNum": 763
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY10_10TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_10TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2198,
					"offsetEnd": 2198,
					"columnNum": 764
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY10_11TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_11TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2199,
					"offsetEnd": 2199,
					"columnNum": 765
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY10_12TH",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_12TH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2200,
					"offsetEnd": 2200,
					"columnNum": 766
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "ACTIVITY10_OFFICER_AWARD",
				"otherPossibleNames": [],
				"logicalName": "ACTIVITY10_OFFICER_AWARD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2201,
					"offsetEnd": 2201,
					"columnNum": 767
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SPORTS_PARTICIPATION",
				"otherPossibleNames": [],
				"logicalName": "SPORTS_PARTICIPATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2202,
					"offsetEnd": 2202,
					"columnNum": 768
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SPORT1",
				"otherPossibleNames": [],
				"logicalName": "SPORT1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2203,
					"offsetEnd": 2204,
					"columnNum": 769
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SPORT2",
				"otherPossibleNames": [],
				"logicalName": "SPORT2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2205,
					"offsetEnd": 2206,
					"columnNum": 770
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SPORT3",
				"otherPossibleNames": [],
				"logicalName": "SPORT3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2207,
					"offsetEnd": 2208,
					"columnNum": 771
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SPORT4",
				"otherPossibleNames": [],
				"logicalName": "SPORT4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2209,
					"offsetEnd": 2210,
					"columnNum": 772
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SPORT5",
				"otherPossibleNames": [],
				"logicalName": "SPORT5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2211,
					"offsetEnd": 2212,
					"columnNum": 773
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SPORT6",
				"otherPossibleNames": [],
				"logicalName": "SPORT6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2213,
					"offsetEnd": 2214,
					"columnNum": 774
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_41",
				"otherPossibleNames": [],
				"logicalName": "FILLER_41",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2215,
					"offsetEnd": 2224,
					"columnNum": 775
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_TYPE_4YR",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE_4YR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2225,
					"offsetEnd": 2225,
					"columnNum": 776
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_TYPE_2YR",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE_2YR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2226,
					"offsetEnd": 2226,
					"columnNum": 777
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_TYPE_VOCTECH",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE_VOCTECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2227,
					"offsetEnd": 2227,
					"columnNum": 778
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_TYPE_UNDECIDED",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_TYPE_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2228,
					"offsetEnd": 2228,
					"columnNum": 779
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_AFFIL_PUBLIC",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_AFFIL_PUBLIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2229,
					"offsetEnd": 2229,
					"columnNum": 780
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_AFFIL_PRIV_NOTRELIG",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_AFFIL_PRIV_NOTRELIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2230,
					"offsetEnd": 2230,
					"columnNum": 781
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_AFFIL_PRIV_RELIG",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_AFFIL_PRIV_RELIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2231,
					"offsetEnd": 2231,
					"columnNum": 782
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_AFFIL_UNDECIDED",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_AFFIL_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2232,
					"offsetEnd": 2232,
					"columnNum": 783
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SIZE_LESS_2K",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_LESS_2K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2233,
					"offsetEnd": 2233,
					"columnNum": 784
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SIZE_2K_5K",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_2K_5K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2234,
					"offsetEnd": 2234,
					"columnNum": 785
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SIZE_5K_10K",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_5K_10K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2235,
					"offsetEnd": 2235,
					"columnNum": 786
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SIZE_10K-15K",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_10K-15K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2236,
					"offsetEnd": 2236,
					"columnNum": 787
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SIZE_15K_20K",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_15K_20K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2237,
					"offsetEnd": 2237,
					"columnNum": 788
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SIZE_MORE_20K",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_MORE_20K",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2238,
					"offsetEnd": 2238,
					"columnNum": 789
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SIZE_UNDECIDED",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SIZE_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2239,
					"offsetEnd": 2239,
					"columnNum": 790
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SET_LGCITY",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_LGCITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2240,
					"offsetEnd": 2240,
					"columnNum": 791
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SET_MEDCITY",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_MEDCITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2241,
					"offsetEnd": 2241,
					"columnNum": 792
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SET_SMCITY",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_SMCITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2242,
					"offsetEnd": 2242,
					"columnNum": 793
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SET_SUBURB",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_SUBURB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2243,
					"offsetEnd": 2243,
					"columnNum": 794
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SET_RURAL",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_RURAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2244,
					"offsetEnd": 2244,
					"columnNum": 795
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SET_UNDECIDED",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SET_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2245,
					"offsetEnd": 2245,
					"columnNum": 796
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_LOC_NEARHOME",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_NEARHOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2246,
					"offsetEnd": 2246,
					"columnNum": 797
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_LOC_HOMESTATE",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_HOMESTATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2247,
					"offsetEnd": 2247,
					"columnNum": 798
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_LOC_BORDERHOME",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_BORDERHOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2248,
					"offsetEnd": 2248,
					"columnNum": 799
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_LOC_BEYONDHOME",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_BEYONDHOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2249,
					"offsetEnd": 2249,
					"columnNum": 800
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_LOC_OUTSIDEUS",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_OUTSIDEUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2250,
					"offsetEnd": 2250,
					"columnNum": 801
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_LOC_UNDECIDED",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_LOC_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2251,
					"offsetEnd": 2251,
					"columnNum": 802
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SEX_ALLONESEX",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SEX_ALLONESEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2252,
					"offsetEnd": 2252,
					"columnNum": 803
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SEX_COED",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SEX_COED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2253,
					"offsetEnd": 2253,
					"columnNum": 804
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_SEX_UNDECIDED",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_SEX_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2254,
					"offsetEnd": 2254,
					"columnNum": 805
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_HOUSING_HOME",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_HOUSING_HOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2255,
					"offsetEnd": 2255,
					"columnNum": 806
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_HOUSING_ONCAMPUS",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_HOUSING_ONCAMPUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2256,
					"offsetEnd": 2256,
					"columnNum": 807
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_HOUSING_OFFCAMPUS",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_HOUSING_OFFCAMPUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2257,
					"offsetEnd": 2257,
					"columnNum": 808
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_HOUSING_UNDECIDED",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_HOUSING_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2258,
					"offsetEnd": 2258,
					"columnNum": 809
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_42",
				"otherPossibleNames": [],
				"logicalName": "FILLER_42",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2259,
					"offsetEnd": 2260,
					"columnNum": 810
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DEGREE_CERTIFICATE",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_CERTIFICATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2261,
					"offsetEnd": 2262,
					"columnNum": 811
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DEGREE_ASSOCIATE",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_ASSOCIATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2263,
					"offsetEnd": 2264,
					"columnNum": 812
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DEGREE_BACHELORS",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_BACHELORS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2265,
					"offsetEnd": 2266,
					"columnNum": 813
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DEGREE_MASTERS",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_MASTERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2267,
					"offsetEnd": 2268,
					"columnNum": 814
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DEGREE_DOCTORATE",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_DOCTORATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2269,
					"offsetEnd": 2270,
					"columnNum": 815
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DEGREE_OTHER",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2271,
					"offsetEnd": 2272,
					"columnNum": 816
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "DEGREE_UNDECIDED",
				"otherPossibleNames": [],
				"logicalName": "DEGREE_UNDECIDED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2273,
					"offsetEnd": 2274,
					"columnNum": 817
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FINANCIAL_AID",
				"otherPossibleNames": [],
				"logicalName": "FINANCIAL_AID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2275,
					"offsetEnd": 2275,
					"columnNum": 818
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PART_TIME_JOB",
				"otherPossibleNames": [],
				"logicalName": "PART_TIME_JOB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2276,
					"offsetEnd": 2276,
					"columnNum": 819
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MAJOR_FIRST",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_FIRST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2277,
					"offsetEnd": 2283,
					"columnNum": 820
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MAJOR_FIRST_CERTAINTY",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_FIRST_CERTAINTY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2284,
					"offsetEnd": 2284,
					"columnNum": 821
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MAJOR_SECOND",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_SECOND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2285,
					"offsetEnd": 2291,
					"columnNum": 822
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "MAJOR_THIRD",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_THIRD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2292,
					"offsetEnd": 2298,
					"columnNum": 823
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP",
				"otherPossibleNames": [],
				"logicalName": "AP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2299,
					"offsetEnd": 2299,
					"columnNum": 824
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_43",
				"otherPossibleNames": [],
				"logicalName": "FILLER_43",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2300,
					"offsetEnd": 2306,
					"columnNum": 825
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_HONORS",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_HONORS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2307,
					"offsetEnd": 2308,
					"columnNum": 826
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_ART",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2309,
					"offsetEnd": 2310,
					"columnNum": 827
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_INTRAMURAL",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_INTRAMURAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2311,
					"offsetEnd": 2312,
					"columnNum": 828
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_ATHLETICS",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ATHLETICS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2313,
					"offsetEnd": 2314,
					"columnNum": 829
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_COMMSERVICE",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_COMMSERVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2315,
					"offsetEnd": 2316,
					"columnNum": 830
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_DANCE",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_DANCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2317,
					"offsetEnd": 2318,
					"columnNum": 831
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_DEBATESPEAKING",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_DEBATESPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2319,
					"offsetEnd": 2320,
					"columnNum": 832
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_ETHNIC",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ETHNIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2321,
					"offsetEnd": 2322,
					"columnNum": 833
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_FOREIGN",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_FOREIGN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2323,
					"offsetEnd": 2324,
					"columnNum": 834
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_GOVERNMENT",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_GOVERNMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2325,
					"offsetEnd": 2326,
					"columnNum": 835
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_LITERARY",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_LITERARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2327,
					"offsetEnd": 2328,
					"columnNum": 836
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_ROTC",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ROTC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2329,
					"offsetEnd": 2330,
					"columnNum": 837
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_INSTRUMENTALMUS",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_INSTRUMENTALMUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2331,
					"offsetEnd": 2332,
					"columnNum": 838
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_VOCALMUS",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_VOCALMUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2333,
					"offsetEnd": 2334,
					"columnNum": 839
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_RELIGIOUS",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_RELIGIOUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2335,
					"offsetEnd": 2336,
					"columnNum": 840
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_ENVIRONMENTAL",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_ENVIRONMENTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2337,
					"offsetEnd": 2338,
					"columnNum": 841
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_DRAMA",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_DRAMA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2339,
					"offsetEnd": 2340,
					"columnNum": 842
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_INTERNSHIP",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_INTERNSHIP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2341,
					"offsetEnd": 2342,
					"columnNum": 843
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_DEPARTMENTAL",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_DEPARTMENTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2343,
					"offsetEnd": 2344,
					"columnNum": 844
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_SOCIAL",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_SOCIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2345,
					"offsetEnd": 2346,
					"columnNum": 845
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_ACTIVITY_NONE",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_ACTIVITY_NONE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2347,
					"offsetEnd": 2348,
					"columnNum": 846
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_CODE1",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2349,
					"offsetEnd": 2354,
					"columnNum": 847
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_NAME1",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2355,
					"offsetEnd": 2404,
					"columnNum": 848
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_CODE2",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2405,
					"offsetEnd": 2410,
					"columnNum": 849
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_NAME2",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2411,
					"offsetEnd": 2460,
					"columnNum": 850
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_CODE3",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2461,
					"offsetEnd": 2466,
					"columnNum": 851
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_NAME3",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2467,
					"offsetEnd": 2516,
					"columnNum": 852
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_CODE4",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_CODE4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2517,
					"offsetEnd": 2522,
					"columnNum": 853
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "COLLEGE_NAME4",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2523,
					"offsetEnd": 2572,
					"columnNum": 854
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RECORD_NUM",
				"otherPossibleNames": [],
				"logicalName": "RECORD_NUM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2573,
					"offsetEnd": 2574,
					"columnNum": 855
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FORM_CODE",
				"otherPossibleNames": [],
				"logicalName": "FORM_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2575,
					"offsetEnd": 2581,
					"columnNum": 856
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "REPORT_DATE",
				"otherPossibleNames": [],
				"logicalName": "REPORT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2582,
					"offsetEnd": 2591,
					"columnNum": 857
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_44",
				"otherPossibleNames": [],
				"logicalName": "FILLER_44",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2592,
					"offsetEnd": 2601,
					"columnNum": 858
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": [".txt"]
}