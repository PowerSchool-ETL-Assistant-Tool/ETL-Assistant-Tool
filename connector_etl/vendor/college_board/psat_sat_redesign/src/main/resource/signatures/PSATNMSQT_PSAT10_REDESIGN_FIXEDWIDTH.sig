{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "PSATNMSQT_PSAT10_REDESIGN_FIXEDWIDTH",
		"recordLength": 1227,
		"naturalKey": ["STUDENT_VENDOR_ID"],
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
				"physicalName": "OPTIONAL_CODE",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL_CODE",
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
				"physicalName": "FILLER_1",
				"otherPossibleNames": [],
				"logicalName": "FILLER_1",
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
				"physicalName": "FILLER_2",
				"otherPossibleNames": [],
				"logicalName": "FILLER_2",
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
				"physicalName": "FILLER_3",
				"otherPossibleNames": [],
				"logicalName": "FILLER_3",
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
				"physicalName": "GRAD_DATE",
				"otherPossibleNames": [],
				"logicalName": "GRAD_DATE",
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
				"physicalName": "LATEST_ACCESS_CD",
				"otherPossibleNames": [],
				"logicalName": "LATEST_ACCESS_CD",
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
				"physicalName": "FILLER_4",
				"otherPossibleNames": [],
				"logicalName": "FILLER_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 658,
					"offsetEnd": 662,
					"columnNum": 43
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NATIONAL_MERIT",
				"otherPossibleNames": [],
				"logicalName": "NATIONAL_MERIT",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 663,
					"offsetEnd": 663,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "DATE",
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
					"offsetStart": 664,
					"offsetEnd": 664,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_DATE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 665,
					"offsetEnd": 674,
					"columnNum": 46
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_GRADE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 675,
					"offsetEnd": 676,
					"columnNum": 47
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 677,
					"offsetEnd": 680,
					"columnNum": 48
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 681,
					"offsetEnd": 683,
					"columnNum": 49
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 684,
					"offsetEnd": 686,
					"columnNum": 50
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_READING",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 687,
					"offsetEnd": 688,
					"columnNum": 51
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 689,
					"offsetEnd": 690,
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 691,
					"offsetEnd": 694,
					"columnNum": 53
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 695,
					"offsetEnd": 696,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 697,
					"offsetEnd": 698,
					"columnNum": 55
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 699,
					"offsetEnd": 700,
					"columnNum": 56
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 701,
					"offsetEnd": 702,
					"columnNum": 57
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 703,
					"offsetEnd": 704,
					"columnNum": 58
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 705,
					"offsetEnd": 706,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 707,
					"offsetEnd": 708,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 709,
					"offsetEnd": 710,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "LATEST_PSAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "LATEST_PSAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 711,
					"offsetEnd": 712,
					"columnNum": 62
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
					"offsetStart": 713,
					"offsetEnd": 719,
					"columnNum": 63
				},
				"fieldLength": 7,
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
					"offsetStart": 720,
					"offsetEnd": 721,
					"columnNum": 64
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
					"offsetStart": 722,
					"offsetEnd": 723,
					"columnNum": 65
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
					"offsetStart": 724,
					"offsetEnd": 725,
					"columnNum": 66
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
					"offsetStart": 726,
					"offsetEnd": 727,
					"columnNum": 67
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
					"offsetStart": 728,
					"offsetEnd": 729,
					"columnNum": 68
				},
				"fieldLength": 2,
				"expectedValues": [],
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
					"offsetStart": 730,
					"offsetEnd": 731,
					"columnNum": 69
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SELECTION_INDEX",
				"otherPossibleNames": [],
				"logicalName": "SELECTION_INDEX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 732,
					"offsetEnd": 734,
					"columnNum": 70
				},
				"fieldLength": 3,
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
					"offsetStart": 735,
					"offsetEnd": 736,
					"columnNum": 71
				},
				"fieldLength": 2,
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
					"offsetStart": 737,
					"offsetEnd": 752,
					"columnNum": 72
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 753,
					"offsetEnd": 754,
					"columnNum": 73
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 755,
					"offsetEnd": 756,
					"columnNum": 74
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 757,
					"offsetEnd": 758,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_READING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 759,
					"offsetEnd": 760,
					"columnNum": 76
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 761,
					"offsetEnd": 762,
					"columnNum": 77
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 763,
					"offsetEnd": 764,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 765,
					"offsetEnd": 766,
					"columnNum": 79
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 767,
					"offsetEnd": 768,
					"columnNum": 80
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 769,
					"offsetEnd": 770,
					"columnNum": 81
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 771,
					"offsetEnd": 772,
					"columnNum": 82
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 773,
					"offsetEnd": 774,
					"columnNum": 83
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 775,
					"offsetEnd": 776,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 777,
					"offsetEnd": 778,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 779,
					"offsetEnd": 780,
					"columnNum": 86
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATREP_PSAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATREP_PSAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 781,
					"offsetEnd": 782,
					"columnNum": 87
				},
				"fieldLength": 2,
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
					"offsetStart": 783,
					"offsetEnd": 784,
					"columnNum": 88
				},
				"fieldLength": 2,
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
					"offsetStart": 785,
					"offsetEnd": 788,
					"columnNum": 89
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_TOTAL",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_TOTAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 789,
					"offsetEnd": 790,
					"columnNum": 90
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_EBRW",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_EBRW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 791,
					"offsetEnd": 792,
					"columnNum": 91
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_MATH_SECTION",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_MATH_SECTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 793,
					"offsetEnd": 794,
					"columnNum": 92
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_READING",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 795,
					"offsetEnd": 796,
					"columnNum": 93
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_WRIT_LANG",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_WRIT_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 797,
					"offsetEnd": 798,
					"columnNum": 94
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_MATH_TEST",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_MATH_TEST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 799,
					"offsetEnd": 800,
					"columnNum": 95
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_SCI_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_SCI_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 801,
					"offsetEnd": 802,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_HIST_SOCST_CROSS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_HIST_SOCST_CROSS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 803,
					"offsetEnd": 804,
					"columnNum": 97
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_WORDS_CONTEXT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_WORDS_CONTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 805,
					"offsetEnd": 806,
					"columnNum": 98
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_COMM_EVIDENCE",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_COMM_EVIDENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 807,
					"offsetEnd": 808,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_EXPR_IDEAS",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_EXPR_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 809,
					"offsetEnd": 810,
					"columnNum": 100
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_ENG_CONVENT",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_ENG_CONVENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 811,
					"offsetEnd": 812,
					"columnNum": 101
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_HEART_ALGEBRA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_HEART_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 813,
					"offsetEnd": 814,
					"columnNum": 102
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_ADV_MATH",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_ADV_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 815,
					"offsetEnd": 816,
					"columnNum": 103
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "PERCENTILE_NATUSER_PSAT_PROBSLV_DATA",
				"otherPossibleNames": [],
				"logicalName": "PERCENTILE_NATUSER_PSAT_PROBSLV_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 817,
					"offsetEnd": 818,
					"columnNum": 104
				},
				"fieldLength": 2,
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
					"offsetStart": 819,
					"offsetEnd": 820,
					"columnNum": 105
				},
				"fieldLength": 2,
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
					"offsetStart": 821,
					"offsetEnd": 824,
					"columnNum": 106
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
					"offsetStart": 825,
					"offsetEnd": 825,
					"columnNum": 107
				},
				"fieldLength": 1,
				"expectedValues": [],
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
					"offsetStart": 826,
					"offsetEnd": 826,
					"columnNum": 108
				},
				"fieldLength": 1,
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
					"offsetStart": 827,
					"offsetEnd": 827,
					"columnNum": 109
				},
				"fieldLength": 1,
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
					"offsetStart": 828,
					"offsetEnd": 828,
					"columnNum": 110
				},
				"fieldLength": 1,
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
					"offsetStart": 829,
					"offsetEnd": 829,
					"columnNum": 111
				},
				"fieldLength": 1,
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
					"offsetStart": 830,
					"offsetEnd": 830,
					"columnNum": 112
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_21",
				"otherPossibleNames": [],
				"logicalName": "FILLER_21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 831,
					"offsetEnd": 831,
					"columnNum": 113
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
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
					"offsetStart": 832,
					"offsetEnd": 832,
					"columnNum": 114
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
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
					"offsetStart": 833,
					"offsetEnd": 834,
					"columnNum": 115
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
					"offsetStart": 835,
					"offsetEnd": 835,
					"columnNum": 116
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
					"offsetStart": 836,
					"offsetEnd": 836,
					"columnNum": 117
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
					"offsetStart": 837,
					"offsetEnd": 837,
					"columnNum": 118
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
					"offsetStart": 838,
					"offsetEnd": 838,
					"columnNum": 119
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
					"offsetStart": 839,
					"offsetEnd": 839,
					"columnNum": 120
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
					"offsetStart": 840,
					"offsetEnd": 840,
					"columnNum": 121
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
					"offsetStart": 841,
					"offsetEnd": 841,
					"columnNum": 122
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
					"offsetStart": 842,
					"offsetEnd": 842,
					"columnNum": 123
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
					"offsetStart": 843,
					"offsetEnd": 843,
					"columnNum": 124
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
					"offsetStart": 844,
					"offsetEnd": 844,
					"columnNum": 125
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
					"offsetStart": 845,
					"offsetEnd": 845,
					"columnNum": 126
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
					"offsetStart": 846,
					"offsetEnd": 846,
					"columnNum": 127
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
					"offsetStart": 847,
					"offsetEnd": 847,
					"columnNum": 128
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
					"offsetStart": 848,
					"offsetEnd": 848,
					"columnNum": 129
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
					"offsetStart": 849,
					"offsetEnd": 849,
					"columnNum": 130
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
					"offsetStart": 850,
					"offsetEnd": 850,
					"columnNum": 131
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
					"offsetStart": 851,
					"offsetEnd": 851,
					"columnNum": 132
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
					"offsetStart": 852,
					"offsetEnd": 852,
					"columnNum": 133
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
					"offsetStart": 853,
					"offsetEnd": 853,
					"columnNum": 134
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
					"offsetStart": 854,
					"offsetEnd": 854,
					"columnNum": 135
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
					"offsetStart": 855,
					"offsetEnd": 855,
					"columnNum": 136
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
					"offsetStart": 856,
					"offsetEnd": 856,
					"columnNum": 137
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
					"offsetStart": 857,
					"offsetEnd": 857,
					"columnNum": 138
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
					"offsetStart": 858,
					"offsetEnd": 858,
					"columnNum": 139
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
					"offsetStart": 859,
					"offsetEnd": 859,
					"columnNum": 140
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
					"offsetStart": 860,
					"offsetEnd": 860,
					"columnNum": 141
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
					"offsetStart": 861,
					"offsetEnd": 861,
					"columnNum": 142
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
					"offsetStart": 862,
					"offsetEnd": 862,
					"columnNum": 143
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
					"offsetStart": 863,
					"offsetEnd": 863,
					"columnNum": 144
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
					"offsetStart": 864,
					"offsetEnd": 864,
					"columnNum": 145
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
					"offsetStart": 865,
					"offsetEnd": 865,
					"columnNum": 146
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
					"offsetStart": 866,
					"offsetEnd": 866,
					"columnNum": 147
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
					"offsetStart": 867,
					"offsetEnd": 867,
					"columnNum": 148
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
					"offsetStart": 868,
					"offsetEnd": 868,
					"columnNum": 149
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
					"offsetStart": 869,
					"offsetEnd": 869,
					"columnNum": 150
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
					"offsetStart": 870,
					"offsetEnd": 870,
					"columnNum": 151
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
					"offsetStart": 871,
					"offsetEnd": 871,
					"columnNum": 152
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
					"offsetStart": 872,
					"offsetEnd": 872,
					"columnNum": 153
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
					"offsetStart": 873,
					"offsetEnd": 873,
					"columnNum": 154
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
					"offsetStart": 874,
					"offsetEnd": 874,
					"columnNum": 155
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
					"offsetStart": 875,
					"offsetEnd": 875,
					"columnNum": 156
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
					"offsetStart": 876,
					"offsetEnd": 876,
					"columnNum": 157
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
					"offsetStart": 877,
					"offsetEnd": 877,
					"columnNum": 158
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
					"offsetStart": 878,
					"offsetEnd": 878,
					"columnNum": 159
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
					"offsetStart": 879,
					"offsetEnd": 879,
					"columnNum": 160
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
					"offsetStart": 880,
					"offsetEnd": 880,
					"columnNum": 161
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
					"offsetStart": 881,
					"offsetEnd": 881,
					"columnNum": 162
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
					"offsetStart": 882,
					"offsetEnd": 883,
					"columnNum": 163
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
					"offsetStart": 884,
					"offsetEnd": 885,
					"columnNum": 164
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
					"offsetStart": 886,
					"offsetEnd": 887,
					"columnNum": 165
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
					"offsetStart": 888,
					"offsetEnd": 892,
					"columnNum": 166
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
					"offsetStart": 893,
					"offsetEnd": 894,
					"columnNum": 167
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
					"offsetStart": 895,
					"offsetEnd": 895,
					"columnNum": 168
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
					"offsetStart": 896,
					"offsetEnd": 896,
					"columnNum": 169
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
					"offsetStart": 897,
					"offsetEnd": 897,
					"columnNum": 170
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
					"offsetStart": 898,
					"offsetEnd": 898,
					"columnNum": 171
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
					"offsetStart": 899,
					"offsetEnd": 899,
					"columnNum": 172
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
					"offsetStart": 900,
					"offsetEnd": 900,
					"columnNum": 173
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
					"offsetStart": 901,
					"offsetEnd": 901,
					"columnNum": 174
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
					"offsetStart": 902,
					"offsetEnd": 902,
					"columnNum": 175
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
					"offsetStart": 903,
					"offsetEnd": 903,
					"columnNum": 176
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
					"offsetStart": 904,
					"offsetEnd": 904,
					"columnNum": 177
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
					"offsetStart": 905,
					"offsetEnd": 905,
					"columnNum": 178
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
					"offsetStart": 906,
					"offsetEnd": 906,
					"columnNum": 179
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
					"offsetStart": 907,
					"offsetEnd": 907,
					"columnNum": 180
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
					"offsetStart": 908,
					"offsetEnd": 908,
					"columnNum": 181
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
					"offsetStart": 909,
					"offsetEnd": 909,
					"columnNum": 182
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
					"offsetStart": 910,
					"offsetEnd": 910,
					"columnNum": 183
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
					"offsetStart": 911,
					"offsetEnd": 911,
					"columnNum": 184
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
					"offsetStart": 912,
					"offsetEnd": 912,
					"columnNum": 185
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
					"offsetStart": 913,
					"offsetEnd": 913,
					"columnNum": 186
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
					"offsetStart": 914,
					"offsetEnd": 914,
					"columnNum": 187
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
					"offsetStart": 915,
					"offsetEnd": 915,
					"columnNum": 188
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
					"offsetStart": 916,
					"offsetEnd": 916,
					"columnNum": 189
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
					"offsetStart": 917,
					"offsetEnd": 917,
					"columnNum": 190
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
					"offsetStart": 918,
					"offsetEnd": 918,
					"columnNum": 191
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
					"offsetStart": 919,
					"offsetEnd": 919,
					"columnNum": 192
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
					"offsetStart": 920,
					"offsetEnd": 920,
					"columnNum": 193
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
					"offsetStart": 921,
					"offsetEnd": 921,
					"columnNum": 194
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
					"offsetStart": 922,
					"offsetEnd": 922,
					"columnNum": 195
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
					"offsetStart": 923,
					"offsetEnd": 923,
					"columnNum": 196
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
					"offsetStart": 924,
					"offsetEnd": 924,
					"columnNum": 197
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
					"offsetStart": 925,
					"offsetEnd": 925,
					"columnNum": 198
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
					"offsetStart": 926,
					"offsetEnd": 926,
					"columnNum": 199
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
					"offsetStart": 927,
					"offsetEnd": 927,
					"columnNum": 200
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
					"offsetStart": 928,
					"offsetEnd": 928,
					"columnNum": 201
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
					"offsetStart": 929,
					"offsetEnd": 929,
					"columnNum": 202
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
					"offsetStart": 930,
					"offsetEnd": 930,
					"columnNum": 203
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
					"offsetStart": 931,
					"offsetEnd": 931,
					"columnNum": 204
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
					"offsetStart": 932,
					"offsetEnd": 932,
					"columnNum": 205
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
					"offsetStart": 933,
					"offsetEnd": 933,
					"columnNum": 206
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
					"offsetStart": 934,
					"offsetEnd": 934,
					"columnNum": 207
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
					"offsetStart": 935,
					"offsetEnd": 935,
					"columnNum": 208
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
					"offsetStart": 936,
					"offsetEnd": 936,
					"columnNum": 209
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
					"offsetStart": 937,
					"offsetEnd": 937,
					"columnNum": 210
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
					"offsetStart": 938,
					"offsetEnd": 938,
					"columnNum": 211
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
					"offsetStart": 939,
					"offsetEnd": 940,
					"columnNum": 212
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
					"offsetStart": 941,
					"offsetEnd": 942,
					"columnNum": 213
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
					"offsetStart": 943,
					"offsetEnd": 944,
					"columnNum": 214
				},
				"fieldLength": 2,
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
					"offsetStart": 945,
					"offsetEnd": 949,
					"columnNum": 215
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
					"offsetStart": 950,
					"offsetEnd": 951,
					"columnNum": 216
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
					"offsetStart": 952,
					"offsetEnd": 952,
					"columnNum": 217
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
					"offsetStart": 953,
					"offsetEnd": 953,
					"columnNum": 218
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
					"offsetStart": 954,
					"offsetEnd": 954,
					"columnNum": 219
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
					"offsetStart": 955,
					"offsetEnd": 955,
					"columnNum": 220
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
					"offsetStart": 956,
					"offsetEnd": 956,
					"columnNum": 221
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
					"offsetStart": 957,
					"offsetEnd": 957,
					"columnNum": 222
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
					"offsetStart": 958,
					"offsetEnd": 958,
					"columnNum": 223
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
					"offsetStart": 959,
					"offsetEnd": 959,
					"columnNum": 224
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
					"offsetStart": 960,
					"offsetEnd": 960,
					"columnNum": 225
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
					"offsetStart": 961,
					"offsetEnd": 961,
					"columnNum": 226
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
					"offsetStart": 962,
					"offsetEnd": 962,
					"columnNum": 227
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
					"offsetStart": 963,
					"offsetEnd": 963,
					"columnNum": 228
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
					"offsetStart": 964,
					"offsetEnd": 964,
					"columnNum": 229
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
					"offsetStart": 965,
					"offsetEnd": 965,
					"columnNum": 230
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
					"offsetStart": 966,
					"offsetEnd": 966,
					"columnNum": 231
				},
				"fieldLength": 1,
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
					"offsetStart": 967,
					"offsetEnd": 967,
					"columnNum": 232
				},
				"fieldLength": 1,
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
					"offsetStart": 968,
					"offsetEnd": 968,
					"columnNum": 233
				},
				"fieldLength": 1,
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
					"offsetStart": 969,
					"offsetEnd": 981,
					"columnNum": 234
				},
				"fieldLength": 13,
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
					"offsetStart": 982,
					"offsetEnd": 983,
					"columnNum": 235
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
					"offsetStart": 984,
					"offsetEnd": 985,
					"columnNum": 236
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
					"offsetStart": 986,
					"offsetEnd": 987,
					"columnNum": 237
				},
				"fieldLength": 2,
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
					"offsetStart": 988,
					"offsetEnd": 992,
					"columnNum": 238
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
					"offsetStart": 993,
					"offsetEnd": 994,
					"columnNum": 239
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
					"offsetStart": 995,
					"offsetEnd": 995,
					"columnNum": 240
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
					"offsetStart": 996,
					"offsetEnd": 996,
					"columnNum": 241
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
					"offsetStart": 997,
					"offsetEnd": 997,
					"columnNum": 242
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
					"offsetStart": 998,
					"offsetEnd": 998,
					"columnNum": 243
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
					"offsetStart": 999,
					"offsetEnd": 999,
					"columnNum": 244
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
					"offsetStart": 1000,
					"offsetEnd": 1000,
					"columnNum": 245
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
					"offsetStart": 1001,
					"offsetEnd": 1001,
					"columnNum": 246
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
					"offsetStart": 1002,
					"offsetEnd": 1002,
					"columnNum": 247
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
					"offsetStart": 1003,
					"offsetEnd": 1003,
					"columnNum": 248
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
					"offsetStart": 1004,
					"offsetEnd": 1004,
					"columnNum": 249
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
					"offsetStart": 1005,
					"offsetEnd": 1005,
					"columnNum": 250
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
					"offsetStart": 1006,
					"offsetEnd": 1006,
					"columnNum": 251
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
					"offsetStart": 1007,
					"offsetEnd": 1007,
					"columnNum": 252
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
					"offsetStart": 1008,
					"offsetEnd": 1008,
					"columnNum": 253
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
					"offsetStart": 1009,
					"offsetEnd": 1009,
					"columnNum": 254
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
					"offsetStart": 1010,
					"offsetEnd": 1010,
					"columnNum": 255
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
					"offsetStart": 1011,
					"offsetEnd": 1011,
					"columnNum": 256
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
					"offsetStart": 1012,
					"offsetEnd": 1012,
					"columnNum": 257
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
					"offsetStart": 1013,
					"offsetEnd": 1013,
					"columnNum": 258
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
					"offsetStart": 1014,
					"offsetEnd": 1014,
					"columnNum": 259
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
					"offsetStart": 1015,
					"offsetEnd": 1015,
					"columnNum": 260
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
					"offsetStart": 1016,
					"offsetEnd": 1016,
					"columnNum": 261
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
					"offsetStart": 1017,
					"offsetEnd": 1017,
					"columnNum": 262
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
					"offsetStart": 1018,
					"offsetEnd": 1018,
					"columnNum": 263
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
					"offsetStart": 1019,
					"offsetEnd": 1019,
					"columnNum": 264
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
					"offsetStart": 1020,
					"offsetEnd": 1020,
					"columnNum": 265
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
					"offsetStart": 1021,
					"offsetEnd": 1021,
					"columnNum": 266
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
					"offsetStart": 1022,
					"offsetEnd": 1022,
					"columnNum": 267
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
					"offsetStart": 1023,
					"offsetEnd": 1023,
					"columnNum": 268
				},
				"fieldLength": 1,
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
					"offsetStart": 1024,
					"offsetEnd": 1024,
					"columnNum": 269
				},
				"fieldLength": 1,
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
					"offsetStart": 1025,
					"offsetEnd": 1025,
					"columnNum": 270
				},
				"fieldLength": 1,
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
					"offsetStart": 1026,
					"offsetEnd": 1038,
					"columnNum": 271
				},
				"fieldLength": 13,
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
					"offsetStart": 1039,
					"offsetEnd": 1040,
					"columnNum": 272
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
					"offsetStart": 1041,
					"offsetEnd": 1042,
					"columnNum": 273
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
					"offsetStart": 1043,
					"offsetEnd": 1044,
					"columnNum": 274
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
					"offsetStart": 1045,
					"offsetEnd": 1049,
					"columnNum": 275
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_ARTHIS",
				"otherPossibleNames": [],
				"logicalName": "AP_ARTHIS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1050,
					"offsetEnd": 1050,
					"columnNum": 276
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_BIO",
				"otherPossibleNames": [],
				"logicalName": "AP_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1051,
					"offsetEnd": 1051,
					"columnNum": 277
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_CALC",
				"otherPossibleNames": [],
				"logicalName": "AP_CALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1052,
					"offsetEnd": 1052,
					"columnNum": 278
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_CHEM",
				"otherPossibleNames": [],
				"logicalName": "AP_CHEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1053,
					"offsetEnd": 1053,
					"columnNum": 279
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_COMPGOVPOL",
				"otherPossibleNames": [],
				"logicalName": "AP_COMPGOVPOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1054,
					"offsetEnd": 1054,
					"columnNum": 280
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_COMPSCI",
				"otherPossibleNames": [],
				"logicalName": "AP_COMPSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1055,
					"offsetEnd": 1055,
					"columnNum": 281
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_ENGLANG",
				"otherPossibleNames": [],
				"logicalName": "AP_ENGLANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1056,
					"offsetEnd": 1056,
					"columnNum": 282
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_ENGLIT",
				"otherPossibleNames": [],
				"logicalName": "AP_ENGLIT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1057,
					"offsetEnd": 1057,
					"columnNum": 283
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_ENVSCI",
				"otherPossibleNames": [],
				"logicalName": "AP_ENVSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1058,
					"offsetEnd": 1058,
					"columnNum": 284
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_EURHIST",
				"otherPossibleNames": [],
				"logicalName": "AP_EURHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1059,
					"offsetEnd": 1059,
					"columnNum": 285
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_HUMGEO",
				"otherPossibleNames": [],
				"logicalName": "AP_HUMGEO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1060,
					"offsetEnd": 1060,
					"columnNum": 286
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_MACECON",
				"otherPossibleNames": [],
				"logicalName": "AP_MACECON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1061,
					"offsetEnd": 1061,
					"columnNum": 287
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_MICECON",
				"otherPossibleNames": [],
				"logicalName": "AP_MICECON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1062,
					"offsetEnd": 1062,
					"columnNum": 288
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_MUSIC",
				"otherPossibleNames": [],
				"logicalName": "AP_MUSIC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1063,
					"offsetEnd": 1063,
					"columnNum": 289
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_PHYSI",
				"otherPossibleNames": [],
				"logicalName": "AP_PHYSI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1064,
					"offsetEnd": 1064,
					"columnNum": 290
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_PHYSII",
				"otherPossibleNames": [],
				"logicalName": "AP_PHYSII",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1065,
					"offsetEnd": 1065,
					"columnNum": 291
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_PHYSMECH",
				"otherPossibleNames": [],
				"logicalName": "AP_PHYSMECH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1066,
					"offsetEnd": 1066,
					"columnNum": 292
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_PHYSMAG",
				"otherPossibleNames": [],
				"logicalName": "AP_PHYSMAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1067,
					"offsetEnd": 1067,
					"columnNum": 293
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_PSYCH",
				"otherPossibleNames": [],
				"logicalName": "AP_PSYCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1068,
					"offsetEnd": 1068,
					"columnNum": 294
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_STAT",
				"otherPossibleNames": [],
				"logicalName": "AP_STAT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1069,
					"offsetEnd": 1069,
					"columnNum": 295
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_USGOVPOL",
				"otherPossibleNames": [],
				"logicalName": "AP_USGOVPOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1070,
					"offsetEnd": 1070,
					"columnNum": 296
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_USHIST",
				"otherPossibleNames": [],
				"logicalName": "AP_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1071,
					"offsetEnd": 1071,
					"columnNum": 297
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "AP_WRLDHIST",
				"otherPossibleNames": [],
				"logicalName": "AP_WRLDHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1072,
					"offsetEnd": 1072,
					"columnNum": 298
				},
				"fieldLength": 1,
				"expectedValues": ["P", "S", ""],
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
					"offsetStart": 1073,
					"offsetEnd": 1082,
					"columnNum": 299
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
					"offsetStart": 1083,
					"offsetEnd": 1084,
					"columnNum": 300
				},
				"fieldLength": 2,
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
					"offsetStart": 1085,
					"offsetEnd": 1086,
					"columnNum": 301
				},
				"fieldLength": 2,
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
					"offsetStart": 1087,
					"offsetEnd": 1087,
					"columnNum": 302
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
					"offsetStart": 1088,
					"offsetEnd": 1090,
					"columnNum": 303
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "HS_STUDENT",
				"otherPossibleNames": [],
				"logicalName": "HS_STUDENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1091,
					"offsetEnd": 1091,
					"columnNum": 304
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "YRS_9TO12",
				"otherPossibleNames": [],
				"logicalName": "YRS_9TO12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1092,
					"offsetEnd": 1092,
					"columnNum": 305
				},
				"fieldLength": 1,
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
					"offsetStart": 1093,
					"offsetEnd": 1096,
					"columnNum": 306
				},
				"fieldLength": 4,
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
					"offsetStart": 1097,
					"offsetEnd": 1100,
					"columnNum": 307
				},
				"fieldLength": 4,
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
					"offsetStart": 1101,
					"offsetEnd": 1104,
					"columnNum": 308
				},
				"fieldLength": 4,
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
					"offsetStart": 1105,
					"offsetEnd": 1108,
					"columnNum": 309
				},
				"fieldLength": 4,
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
					"offsetStart": 1109,
					"offsetEnd": 1112,
					"columnNum": 310
				},
				"fieldLength": 4,
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
					"offsetStart": 1113,
					"offsetEnd": 1116,
					"columnNum": 311
				},
				"fieldLength": 4,
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
					"offsetStart": 1117,
					"offsetEnd": 1120,
					"columnNum": 312
				},
				"fieldLength": 4,
				"expectedValues": [],
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
					"offsetStart": 1121,
					"offsetEnd": 1124,
					"columnNum": 313
				},
				"fieldLength": 4,
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
					"offsetStart": 1125,
					"offsetEnd": 1128,
					"columnNum": 314
				},
				"fieldLength": 4,
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
					"offsetStart": 1129,
					"offsetEnd": 1132,
					"columnNum": 315
				},
				"fieldLength": 4,
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
					"offsetStart": 1133,
					"offsetEnd": 1136,
					"columnNum": 316
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
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
					"offsetStart": 1137,
					"offsetEnd": 1140,
					"columnNum": 317
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_45",
				"otherPossibleNames": [],
				"logicalName": "FILLER_45",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1141,
					"offsetEnd": 1144,
					"columnNum": 318
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_46",
				"otherPossibleNames": [],
				"logicalName": "FILLER_46",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1145,
					"offsetEnd": 1148,
					"columnNum": 319
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_47",
				"otherPossibleNames": [],
				"logicalName": "FILLER_47",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1149,
					"offsetEnd": 1152,
					"columnNum": 320
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_48",
				"otherPossibleNames": [],
				"logicalName": "FILLER_48",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1153,
					"offsetEnd": 1156,
					"columnNum": 321
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_49",
				"otherPossibleNames": [],
				"logicalName": "FILLER_49",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1157,
					"offsetEnd": 1160,
					"columnNum": 322
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_50",
				"otherPossibleNames": [],
				"logicalName": "FILLER_50",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1161,
					"offsetEnd": 1164,
					"columnNum": 323
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_51",
				"otherPossibleNames": [],
				"logicalName": "FILLER_51",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1165,
					"offsetEnd": 1168,
					"columnNum": 324
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_52",
				"otherPossibleNames": [],
				"logicalName": "FILLER_52",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1169,
					"offsetEnd": 1172,
					"columnNum": 325
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_53",
				"otherPossibleNames": [],
				"logicalName": "FILLER_53",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1173,
					"offsetEnd": 1176,
					"columnNum": 326
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_54",
				"otherPossibleNames": [],
				"logicalName": "FILLER_54",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1177,
					"offsetEnd": 1180,
					"columnNum": 327
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_55",
				"otherPossibleNames": [],
				"logicalName": "FILLER_55",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1181,
					"offsetEnd": 1184,
					"columnNum": 328
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_56",
				"otherPossibleNames": [],
				"logicalName": "FILLER_56",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1185,
					"offsetEnd": 1188,
					"columnNum": 329
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_57",
				"otherPossibleNames": [],
				"logicalName": "FILLER_57",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1189,
					"offsetEnd": 1192,
					"columnNum": 330
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_58",
				"otherPossibleNames": [],
				"logicalName": "FILLER_58",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1193,
					"offsetEnd": 1196,
					"columnNum": 331
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "FILLER_59",
				"otherPossibleNames": [],
				"logicalName": "FILLER_59",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1197,
					"offsetEnd": 1200,
					"columnNum": 332
				},
				"fieldLength": 4,
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
					"offsetStart": 1201,
					"offsetEnd": 1207,
					"columnNum": 333
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
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1208,
					"offsetEnd": 1217,
					"columnNum": 334
				},
				"fieldLength": 10,
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
					"offsetStart": 1218,
					"offsetEnd": 1227,
					"columnNum": 335
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