{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "LEAP_AA1_1415_Fixed",
    "recordLength": 703,
		"naturalKey": ["LASID", "DRC_UNIQUE_STUDENT_ID", "ASSESSMENT_ACHIEVEMENT_LEVEL_ELA", "ASSESSMENT_ACHIEVEMENT_LEVEL_MATH", "ASSESSMENT_ACHIEVEMENT_LEVEL_SCI", "TEST_DATE_MONTH", "TEST_DATE_YEAR"],
		"fields": [{
				"physicalName": "Test Date Month",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE_MONTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 2,
					"columnNum": 1
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Test Date Year",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3,
					"offsetEnd": 6,
					"columnNum": 2
				},
				"fieldLength": 4,
				"expectedValues": ["2015","2014","2013","2012","2011","2010"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Straggler",
				"otherPossibleNames": [],
				"logicalName": "STRAGGLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 7,
					"offsetEnd": 7,
					"columnNum": 3
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "District Code",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 8,
					"offsetEnd": 10,
					"columnNum": 4
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Code",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 11,
					"offsetEnd": 13,
					"columnNum": 5
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "District Name",
				"otherPossibleNames": [],
				"logicalName": "DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 14,
					"offsetEnd": 53,
					"columnNum": 6
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "School Name",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 54,
					"offsetEnd": 93,
					"columnNum": 7
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Assess Group Type",
				"otherPossibleNames": [],
				"logicalName": "ASSESS_GROUP_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 94,
					"offsetEnd": 95,
					"columnNum": 8
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Student Last Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 96,
					"offsetEnd": 107,
					"columnNum": 9
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student First Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 108,
					"offsetEnd": 115,
					"columnNum": 10
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Middle Initial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 116,
					"offsetEnd": 116,
					"columnNum": 11
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Louisiana Secure Identification Number (LASID)",
				"otherPossibleNames": [],
				"logicalName": "LASID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 117,
					"offsetEnd": 125,
					"columnNum": 12
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 126,
					"offsetEnd": 130,
					"columnNum": 13
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized Grade",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 131,
					"offsetEnd": 132,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": ["03", "04", "05", "06", "07", "08", "09", "10", "11"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 133,
					"offsetEnd": 134,
					"columnNum": 15
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized DOB Month",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_DOB_MONTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 135,
					"offsetEnd": 136,
					"columnNum": 16
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Summarized DOB Day",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_DOB_DAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 137,
					"offsetEnd": 138,
					"columnNum": 17
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Summarized DOB Year",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_DOB_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 139,
					"offsetEnd": 142,
					"columnNum": 18
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 143,
					"offsetEnd": 143,
					"columnNum": 19
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized Gender",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 144,
					"offsetEnd": 144,
					"columnNum": 20
				},
				"fieldLength": 1,
				"expectedValues": ["F", "M", "I"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 145,
					"offsetEnd": 145,
					"columnNum": 21
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized Ethnicity/Race",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_ETHNICITY/RACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 146,
					"offsetEnd": 146,
					"columnNum": 22
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", "6", "7", "I"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 147,
					"offsetEnd": 149,
					"columnNum": 23
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAP LEP Indicator Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_LEP_INDICATOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 150,
					"offsetEnd": 150,
					"columnNum": 24
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", ""],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 151,
					"offsetEnd": 153,
					"columnNum": 25
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized LEP Status",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_LEP_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 154,
					"offsetEnd": 154,
					"columnNum": 26
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAP Primary Exceptionality",
				"otherPossibleNames": [],
				"logicalName": "LAP_PRIMARY_EXCEPTIONALITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 155,
					"offsetEnd": 156,
					"columnNum": 27
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 157,
					"offsetEnd": 175,
					"columnNum": 28
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized Special Education Exceptionality Category",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 176,
					"offsetEnd": 177,
					"columnNum": 29
				},
				"fieldLength": 2,
				"expectedValues": ["03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "18", "20", "99", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Assistive Technology",
				"otherPossibleNames": [],
				"logicalName": "ASSISTIVE_TECHNOLOGY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 178,
					"offsetEnd": 178,
					"columnNum": 30
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Task Descriptions",
				"otherPossibleNames": [],
				"logicalName": "TASK_DESCRIPTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 179,
					"offsetEnd": 179,
					"columnNum": 31
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Other",
				"otherPossibleNames": [],
				"logicalName": "OTHER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 180,
					"offsetEnd": 180,
					"columnNum": 32
				},
				"fieldLength": 1,
				"expectedValues": ["1", "-", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 181,
					"offsetEnd": 182,
					"columnNum": 33
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 183,
					"offsetEnd": 183,
					"columnNum": 34
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Bubbled Optional Local Use",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_OPTIONAL_LOCAL_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 184,
					"offsetEnd": 193,
					"columnNum": 35
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Bubbled Test Administrator Number",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_TEST_ADMINISTRATOR_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 194,
					"offsetEnd": 196,
					"columnNum": 36
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 197,
					"offsetEnd": 236,
					"columnNum": 37
				},
				"fieldLength": 40,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Barcode/Student Precode Number",
				"otherPossibleNames": [],
				"logicalName": "BARCODE/STUDENT_PRECODE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 237,
					"offsetEnd": 245,
					"columnNum": 38
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAP Home-base Site District Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_HOME-BASE_SITE_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 246,
					"offsetEnd": 248,
					"columnNum": 39
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAP Home-base Site School Code",
				"otherPossibleNames": [],
				"logicalName": "LAP_HOME-BASE_SITE_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 249,
					"offsetEnd": 251,
					"columnNum": 40
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 252,
					"offsetEnd": 261,
					"columnNum": 41
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DRC Unique Student ID",
				"otherPossibleNames": [],
				"logicalName": "DRC_UNIQUE_STUDENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 262,
					"offsetEnd": 267,
					"columnNum": 42
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 268,
					"offsetEnd": 282,
					"columnNum": 43
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarized McKinney-Vento Act (Homeless)",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZED_MCKINNEY-VENTO_ACT_(HOMELESS)",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 283,
					"offsetEnd": 283,
					"columnNum": 44
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 284,
					"offsetEnd": 426,
					"columnNum": 45
				},
				"fieldLength": 143,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Raw Score Total - ELA",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 427,
					"offsetEnd": 428,
					"columnNum": 46
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scaled Score - ELA",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 429,
					"offsetEnd": 431,
					"columnNum": 47
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level - ELA",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 432,
					"offsetEnd": 434,
					"columnNum": 48
				},
				"fieldLength": 3,
				"expectedValues": ["EST", "MST", "WST", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Listening Raw Score - ELA",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 435,
					"offsetEnd": 436,
					"columnNum": 49
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Raw Score - ELA",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 437,
					"offsetEnd": 438,
					"columnNum": 50
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Using Information Resources Raw Score",
				"otherPossibleNames": [],
				"logicalName": "USING_INFORMATION_RESOURCES_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 439,
					"offsetEnd": 440,
					"columnNum": 51
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing Raw Score",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 441,
					"offsetEnd": 442,
					"columnNum": 52
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM High - ELA",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 443,
					"offsetEnd": 445,
					"columnNum": 53
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low - ELA",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 446,
					"offsetEnd": 448,
					"columnNum": 54
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 449,
					"offsetEnd": 452,
					"columnNum": 55
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Raw Score Total - Math",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 453,
					"offsetEnd": 454,
					"columnNum": 56
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scaled Score - Math",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 455,
					"offsetEnd": 457,
					"columnNum": 57
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level - Math",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 458,
					"offsetEnd": 460,
					"columnNum": 58
				},
				"fieldLength": 3,
				"expectedValues": ["EST", "MST", "WST", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Algebra and Patterns Raw Score MA",
				"otherPossibleNames": [],
				"logicalName": "ALGEBRA_AND_PATTERNS_RAW_SCORE_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 461,
					"offsetEnd": 462,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Data Raw Score MA",
				"otherPossibleNames": [],
				"logicalName": "DATA_RAW_SCORE_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 463,
					"offsetEnd": 464,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Measurement and Geometry Raw Score MA",
				"otherPossibleNames": [],
				"logicalName": "MEASUREMENT_AND_GEOMETRY_RAW_SCORE_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 465,
					"offsetEnd": 466,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Numbers Raw Score MA",
				"otherPossibleNames": [],
				"logicalName": "NUMBERS_RAW_SCORE_MA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 467,
					"offsetEnd": 468,
					"columnNum": 62
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM High MATH",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 469,
					"offsetEnd": 471,
					"columnNum": 63
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low MATH",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 472,
					"offsetEnd": 474,
					"columnNum": 64
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 475,
					"offsetEnd": 478,
					"columnNum": 65
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Raw Score Total - Science",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 479,
					"offsetEnd": 480,
					"columnNum": 66
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Scaled Score - Science",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 481,
					"offsetEnd": 483,
					"columnNum": 67
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Assessment Achievement Level - Science",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 484,
					"offsetEnd": 486,
					"columnNum": 68
				},
				"fieldLength": 3,
				"expectedValues": ["EST", "MST", "WST", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Earth, Space, and Environmental Science Raw Score SCI",
				"otherPossibleNames": [],
				"logicalName": "EARTH_SPACE_AND_ENVIRONMENTAL_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 487,
					"offsetEnd": 488,
					"columnNum": 69
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Life Science Raw Score SCI",
				"otherPossibleNames": [],
				"logicalName": "LIFE_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 489,
					"offsetEnd": 490,
					"columnNum": 70
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Physical Science Raw Score SCI",
				"otherPossibleNames": [],
				"logicalName": "PHYSICAL_SCIENCE_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 491,
					"offsetEnd": 492,
					"columnNum": 71
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Science as Inquiry Raw Score SCI",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_AS_INQUIRY_RAW_SCORE_SCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 493,
					"offsetEnd": 494,
					"columnNum": 72
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM High SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "SEM_HIGH_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 495,
					"offsetEnd": 497,
					"columnNum": 73
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "SEM Low SCIENCE",
				"otherPossibleNames": [],
				"logicalName": "SEM_LOW_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 498,
					"offsetEnd": 500,
					"columnNum": 74
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 501,
					"offsetEnd": 530,
					"columnNum": 75
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Included in N-Counts - ELA",
				"otherPossibleNames": [],
				"logicalName": "INCLUDED_IN_N-COUNTS_-_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 531,
					"offsetEnd": 531,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Included in N-Counts - Math",
				"otherPossibleNames": [],
				"logicalName": "INCLUDED_IN_N-COUNTS_-_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 532,
					"offsetEnd": 532,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Included in N-Counts - Science",
				"otherPossibleNames": [],
				"logicalName": "INCLUDED_IN_N-COUNTS_-_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 533,
					"offsetEnd": 533,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 534,
					"offsetEnd": 534,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Taken Flag - ELA",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 535,
					"offsetEnd": 535,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Taken Flag - Math",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 536,
					"offsetEnd": 536,
					"columnNum": 81
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Taken Flag - Science",
				"otherPossibleNames": [],
				"logicalName": "TEST_TAKEN_FLAG_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 537,
					"offsetEnd": 537,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Charter Type",
				"otherPossibleNames": [],
				"logicalName": "CHARTER_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 538,
					"offsetEnd": 538,
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "4", "5", "6", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 539,
					"offsetEnd": 549,
					"columnNum": 84
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rollup to State",
				"otherPossibleNames": [],
				"logicalName": "ROLLUP_TO_STATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 550,
					"offsetEnd": 550,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Summarize to Assess Group Code for District Level Reporting",
				"otherPossibleNames": [],
				"logicalName": "SUMMARIZE_TO_ASSESS_GROUP_CODE_FOR_DISTRICT_LEVEL_REPORTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 551,
					"offsetEnd": 551,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 552,
					"offsetEnd": 552,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Schools summarized to LEA Code for district level reporting",
				"otherPossibleNames": [],
				"logicalName": "SCHOOLS_SUMMARIZED_TO_LEA_CODE_FOR_DISTRICT_LEVEL_REPORTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 553,
					"offsetEnd": 553,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 554,
					"offsetEnd": 566,
					"columnNum": 89
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Bubbled Accountability Code ",
				"otherPossibleNames": [],
				"logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 567,
					"offsetEnd": 568,
					"columnNum": 90
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Updated Accountability Code - ELA",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 569,
					"offsetEnd": 570,
					"columnNum": 91
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Updated Accountability Code - Math",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 571,
					"offsetEnd": 572,
					"columnNum": 92
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Updated Accountability Code - Science",
				"otherPossibleNames": [],
				"logicalName": "UPDATED_ACCOUNTABILITY_CODE_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 573,
					"offsetEnd": 574,
					"columnNum": 93
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 575,
					"offsetEnd": 588,
					"columnNum": 94
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level - ELA",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ELA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 589,
					"offsetEnd": 591,
					"columnNum": 95
				},
				"fieldLength": 3,
				"expectedValues": ["EST", "MST", "WST", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level - Math",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 592,
					"offsetEnd": 594,
					"columnNum": 96
				},
				"fieldLength": 3,
				"expectedValues": ["EST", "MST", "WST", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accountability Achievement Level - Science",
				"otherPossibleNames": [],
				"logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_SCIENCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 595,
					"offsetEnd": 597,
					"columnNum": 97
				},
				"fieldLength": 3,
				"expectedValues": ["EST", "MST", "WST", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAP Scholarship Student Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_SCHOLARSHIP_STUDENT_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 598,
					"offsetEnd": 598,
					"columnNum": 98
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 599,
					"offsetEnd": 607,
					"columnNum": 99
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LAP Twin Flag",
				"otherPossibleNames": [],
				"logicalName": "LAP_TWIN_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 608,
					"offsetEnd": 608,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 609,
					"offsetEnd": 658,
					"columnNum": 101
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Precoded Site Code",
				"otherPossibleNames": [],
				"logicalName": "PRECODED_SITE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 659,
					"offsetEnd": 664,
					"columnNum": 102
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "FILLER",
				"otherPossibleNames": [],
				"logicalName": "FILLER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 665,
					"offsetEnd": 684,
					"columnNum": 103
				},
				"fieldLength": 20,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "File Creation Date and Time Stamp",
				"otherPossibleNames": [],
				"logicalName": "FILE_CREATION_DATE_AND_TIME_STAMP",
				"formatMask": "yyyy-MM-dd HH:MM:SS",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 685,
					"offsetEnd": 703,
					"columnNum": 104
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "DATETIME",
				"scale": null
			}
		]
	},
	"fileExtensions": [".dat"]
}