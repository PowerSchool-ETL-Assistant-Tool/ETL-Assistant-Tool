{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "ELPAC_FIXEDWIDTH_1819",
		"quoteDelim": "\"",
		"fieldDelim": "\t",
		"hasHeader": false,
		"recordLength": 896,
		"naturalKey": ["STUDENT_LOCAL_ID", "TESTING_COMPLETED_DATE"],
		"fields": [{
				"physicalName": "Assessment Type",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 2,
					"columnNum": 1
				},
				"fieldLength": 2,
				"expectedValues": ["SA", "IA"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UIN (Unique Identification Number)",
				"otherPossibleNames": [],
				"logicalName": "UIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 3,
					"offsetEnd": 18,
					"columnNum": 2
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Blank 1",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 19,
					"offsetEnd": 34,
					"columnNum": 3
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 2",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 35,
					"offsetEnd": 50,
					"columnNum": 4
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Statewide Student Identifier (SSID)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 51,
					"offsetEnd": 60,
					"columnNum": 5
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Student ID Number (Local ID)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LOCAL_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 61,
					"offsetEnd": 75,
					"columnNum": 6
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Optional-Local Use",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL-LOCAL_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 76,
					"offsetEnd": 85,
					"columnNum": 7
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Student Last Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 86,
					"offsetEnd": 135,
					"columnNum": 8
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student First Name ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 136,
					"offsetEnd": 165,
					"columnNum": 9
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Middle Name ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 166,
					"offsetEnd": 195,
					"columnNum": 10
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Date of Birth",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 196,
					"offsetEnd": 205,
					"columnNum": 11
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 206,
					"offsetEnd": 211,
					"columnNum": 12
				},
				"fieldLength": 6,
				"expectedValues": ["Female", "Male"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADS Grade ",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 212,
					"offsetEnd": 213,
					"columnNum": 13
				},
				"fieldLength": 2,
				"expectedValues": ["KN", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "UE", "US"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Grade Assessed ",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 214,
					"offsetEnd": 215,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": ["KN", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADS District Code ",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 216,
					"offsetEnd": 229,
					"columnNum": 15
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CALPADS School Code",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 230,
					"offsetEnd": 243,
					"columnNum": 16
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CALPADS Charter Code",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_CHARTER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 244,
					"offsetEnd": 247,
					"columnNum": 17
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "CALPADS Charter School  Indicator",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 248,
					"offsetEnd": 249,
					"columnNum": 18
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Special Education District of Accountability",
				"otherPossibleNames": [],
				"logicalName": "SPECIAL_EDUCATION_DISTRICT_OF_ACCOUNTABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 250,
					"offsetEnd": 256,
					"columnNum": 19
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "NPS School Flag",
				"otherPossibleNames": [],
				"logicalName": "NPS_SCHOOL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 257,
					"offsetEnd": 257,
					"columnNum": 20
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Section 504 Status",
				"otherPossibleNames": [],
				"logicalName": "SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 258,
					"offsetEnd": 260,
					"columnNum": 21
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IDEA Indicator",
				"otherPossibleNames": [],
				"logicalName": "IDEA_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 261,
					"offsetEnd": 263,
					"columnNum": 22
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Primary Disability Type",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_DISABILITY_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 264,
					"offsetEnd": 266,
					"columnNum": 23
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 267,
					"offsetEnd": 269,
					"columnNum": 24
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EL Entry Date",
				"otherPossibleNames": [],
				"logicalName": "EL_ENTRY_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 270,
					"offsetEnd": 279,
					"columnNum": 25
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EL Exit Date",
				"otherPossibleNames": [],
				"logicalName": "EL_EXIT_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 280,
					"offsetEnd": 289,
					"columnNum": 26
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EnglishLearnerStatus",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LEARNER_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 290,
					"offsetEnd": 292,
					"columnNum": 27
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "First Entry Date in US School",
				"otherPossibleNames": [],
				"logicalName": "FIRST_ENTRY_DATE_IN_US_SCHOOL",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 293,
					"offsetEnd": 302,
					"columnNum": 28
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English Language Acquisition Status ",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 303,
					"offsetEnd": 306,
					"columnNum": 29
				},
				"fieldLength": 4,
				"expectedValues": ["EO", "IFEP", "EL", "RFEP", "TBD"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Primary Language",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 307,
					"offsetEnd": 309,
					"columnNum": 30
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Code (CEDS)",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGE_CODE_CEDS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 310,
					"offsetEnd": 312,
					"columnNum": 31
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Military Status",
				"otherPossibleNames": [],
				"logicalName": "MILITARY_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 313,
					"offsetEnd": 315,
					"columnNum": 32
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Foster Status",
				"otherPossibleNames": [],
				"logicalName": "FOSTER_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 316,
					"offsetEnd": 318,
					"columnNum": 33
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Homeless Status",
				"otherPossibleNames": [],
				"logicalName": "HOMELESS_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 319,
					"offsetEnd": 321,
					"columnNum": 34
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No", ""],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Economic Disadvantage Status",
				"otherPossibleNames": [],
				"logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 322,
					"offsetEnd": 324,
					"columnNum": 35
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Hispanic or Latino ",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC_OR_LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 325,
					"offsetEnd": 327,
					"columnNum": 36
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "American Indian or Alaska Native",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 328,
					"offsetEnd": 330,
					"columnNum": 37
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Asian  ",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 331,
					"offsetEnd": 333,
					"columnNum": 38
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Black or African American",
				"otherPossibleNames": [],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 334,
					"offsetEnd": 336,
					"columnNum": 39
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "White",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 337,
					"offsetEnd": 339,
					"columnNum": 40
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Native Hawaiian or Other Pacific Islander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 340,
					"offsetEnd": 342,
					"columnNum": 41
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filipino",
				"otherPossibleNames": [],
				"logicalName": "FILIPINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 343,
					"offsetEnd": 345,
					"columnNum": 42
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Two or More Races",
				"otherPossibleNames": [],
				"logicalName": "TWO_OR_MORE_RACES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 346,
					"offsetEnd": 348,
					"columnNum": 43
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Reporting Ethnicity",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_RACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 349,
					"offsetEnd": 351,
					"columnNum": 44
				},
				"fieldLength": 3,
				"expectedValues": ["100", "200", "300", "400", "500", "600", "700", "800"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Parent Education Level ",
				"otherPossibleNames": [],
				"logicalName": "PARENT_EDUCATION_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 352,
					"offsetEnd": 353,
					"columnNum": 45
				},
				"fieldLength": 2,
				"expectedValues": ["10", "11", "12", "13", "14", "15"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested LEA Name ",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 354,
					"offsetEnd": 453,
					"columnNum": 46
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested County-District Code ",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 454,
					"offsetEnd": 467,
					"columnNum": 47
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested School Name",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 468,
					"offsetEnd": 567,
					"columnNum": 48
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Code",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 568,
					"offsetEnd": 581,
					"columnNum": 49
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Code ",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 582,
					"offsetEnd": 585,
					"columnNum": 50
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Testing Completed Date",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 586,
					"offsetEnd": 595,
					"columnNum": 51
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Exit Code ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 596,
					"offsetEnd": 599,
					"columnNum": 52
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Exit Withdrawal Date ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_WITHDRAWAL_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 600,
					"offsetEnd": 609,
					"columnNum": 53
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Removed from CALPADS File Date",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 610,
					"offsetEnd": 619,
					"columnNum": 54
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Condition Code",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 620,
					"offsetEnd": 623,
					"columnNum": 55
				},
				"fieldLength": 4,
				"expectedValues": ["NT", "ALT"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Attemptedness ",
				"otherPossibleNames": [],
				"logicalName": "ATTEMPTEDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 624,
					"offsetEnd": 624,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": ["N", "P", "Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Include Indicator ",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 625,
					"offsetEnd": 625,
					"columnNum": 57
				},
				"fieldLength": 1,
				"expectedValues": ["N", "T", "Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 3",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 626,
					"offsetEnd": 627,
					"columnNum": 58
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 4",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 628,
					"offsetEnd": 629,
					"columnNum": 59
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 5",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 630,
					"offsetEnd": 631,
					"columnNum": 60
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 6",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 632,
					"offsetEnd": 633,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Overall Scale Score",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 634,
					"offsetEnd": 637,
					"columnNum": 62
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Overall Performance Level ",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 638,
					"offsetEnd": 638,
					"columnNum": 63
				},
				"fieldLength": 1,
				"expectedValues": [1, 2, 3, 4],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Oral Language Scale Score",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 639,
					"offsetEnd": 642,
					"columnNum": 64
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Standard Error of Measurement - CSEM (Oral Language)",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 643,
					"offsetEnd": 645,
					"columnNum": 65
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Oral Language Performance Level",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 646,
					"offsetEnd": 646,
					"columnNum": 66
				},
				"fieldLength": 1,
				"expectedValues": [1, 2, 3, 4],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Written Language Scale Score",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 647,
					"offsetEnd": 650,
					"columnNum": 67
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Standard Error of Measurement - CSEM (Written Language)",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 651,
					"offsetEnd": 653,
					"columnNum": 68
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Written Language Performance Level",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 654,
					"offsetEnd": 654,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": [1, 2, 3, 4],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Listening Performance",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 655,
					"offsetEnd": 655,
					"columnNum": 70
				},
				"fieldLength": 1,
				"expectedValues": [1, 2, 3],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Speaking Performance ",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 656,
					"offsetEnd": 656,
					"columnNum": 71
				},
				"fieldLength": 1,
				"expectedValues": [1, 2, 3],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Reading Performance",
				"otherPossibleNames": [],
				"logicalName": "READING_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 657,
					"offsetEnd": 657,
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": [1, 2, 3],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Writing Performance",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 658,
					"offsetEnd": 658,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": [1, 2, 3],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Braille Accommodation",
				"otherPossibleNames": [],
				"logicalName": "BRAILLE_ACCOMMODATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 659,
					"offsetEnd": 659,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodations - Listening",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_ACCOMODATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 660,
					"offsetEnd": 660,
					"columnNum": 75
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodations - Speaking",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_ACCOMODATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 661,
					"offsetEnd": 661,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodations - Reading",
				"otherPossibleNames": [],
				"logicalName": "READING_ACCOMODATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 662,
					"offsetEnd": 662,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodations - Writing",
				"otherPossibleNames": [],
				"logicalName": "WRITING_ACCOMODATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 663,
					"offsetEnd": 663,
					"columnNum": 78
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Alternate Assessment - Listening",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 664,
					"offsetEnd": 664,
					"columnNum": 79
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Alternate Assessment - Speaking",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 665,
					"offsetEnd": 665,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Alternate Assessment - Reading",
				"otherPossibleNames": [],
				"logicalName": "READING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 666,
					"offsetEnd": 666,
					"columnNum": 81
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Alternate Assessment - Writing",
				"otherPossibleNames": [],
				"logicalName": "WRITING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 667,
					"offsetEnd": 667,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Irregularities - Listening",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_TESTING_IRREGULARITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 668,
					"offsetEnd": 668,
					"columnNum": 83
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Irregularities - Speaking",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_TESTING_IRREGULARITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 669,
					"offsetEnd": 669,
					"columnNum": 84
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Irregularities - Reading",
				"otherPossibleNames": [],
				"logicalName": "READING_TESTING_IRREGULARITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 670,
					"offsetEnd": 670,
					"columnNum": 85
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Irregularities - Writing",
				"otherPossibleNames": [],
				"logicalName": "WRITING_TESTING_IRREGULARITIES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 671,
					"offsetEnd": 671,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Contractor Directed (Exempt) - Listening",
				"otherPossibleNames": [],
				"logicalName": "CONTRACTOR_DIRECTED_EXEMPT_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 672,
					"offsetEnd": 672,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Contractor Directed (Exempt) - Speaking",
				"otherPossibleNames": [],
				"logicalName": "CONTRACTOR_DIRECTED_EXEMPT_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 673,
					"offsetEnd": 673,
					"columnNum": 88
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Contractor Directed (Exempt) - Reading",
				"otherPossibleNames": [],
				"logicalName": "CONTRACTOR_DIRECTED_EXEMPT_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 674,
					"offsetEnd": 674,
					"columnNum": 89
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Contractor Directed (Exempt) - Writing",
				"otherPossibleNames": [],
				"logicalName": "CONTRACTOR_DIRECTED_EXEMPT_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 675,
					"offsetEnd": 675,
					"columnNum": 90
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Address Line 1",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_LINE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 676,
					"offsetEnd": 735,
					"columnNum": 91
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Address Line 2",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_LINE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 736,
					"offsetEnd": 795,
					"columnNum": 92
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Address City",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 796,
					"offsetEnd": 855,
					"columnNum": 93
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student State Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 856,
					"offsetEnd": 861,
					"columnNum": 94
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Zip Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_POSTAL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 862,
					"offsetEnd": 873,
					"columnNum": 95
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Score Available Date",
				"otherPossibleNames": [],
				"logicalName": "SCORE_AVAILABLE_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 874,
					"offsetEnd": 883,
					"columnNum": 96
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Status",
				"otherPossibleNames": [],
				"logicalName": "TESTED_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 884,
					"offsetEnd": 884,
					"columnNum": 97
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Report Created Date",
				"otherPossibleNames": [],
				"logicalName": "REPORT_CREATED_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 885,
					"offsetEnd": 894,
					"columnNum": 98
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "End of Record",
				"otherPossibleNames": [],
				"logicalName": "END_OF_RECORD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 895,
					"offsetEnd": 896,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".dat", ".txt"]
}