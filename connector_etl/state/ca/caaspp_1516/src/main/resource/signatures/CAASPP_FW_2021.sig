{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "CAASPP_FW_2021",
		"recordLength": 3964,
		"naturalKey": [],
		"fields": [{
				"physicalName": "Record Type",
				"otherPossibleNames": [],
				"logicalName": "RECORD_TYPE",
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
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Statewide Student Identifier (SSID)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3,
					"offsetEnd": 12,
					"columnNum": 2
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Last Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 13,
					"offsetEnd": 62,
					"columnNum": 3
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student First Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 63,
					"offsetEnd": 92,
					"columnNum": 4
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Middle Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 93,
					"offsetEnd": 122,
					"columnNum": 5
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Date of Birth",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 123,
					"offsetEnd": 132,
					"columnNum": 6
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 133,
					"offsetEnd": 133,
					"columnNum": 7
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 134,
					"offsetEnd": 138,
					"columnNum": 8
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 134,
					"offsetEnd": 138,
					"columnNum": 9
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS Grade",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 139,
					"offsetEnd": 140,
					"columnNum": 10
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Assessed",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 141,
					"offsetEnd": 142,
					"columnNum": 11
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS District Code",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 143,
					"offsetEnd": 156,
					"columnNum": 12
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS District Name ǂ",
				"otherPossibleNames": [],
				"logicalName": "CALPADS District Name ǂ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 157,
					"offsetEnd": 157,
					"columnNum": 13
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS School Code",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 257,
					"offsetEnd": 270,
					"columnNum": 14
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS School Name ǂ",
				"otherPossibleNames": [],
				"logicalName": "CALPADS School Name ǂ",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 271,
					"offsetEnd": 370,
					"columnNum": 15
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS Charter Code",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_CHARTER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 371,
					"offsetEnd": 374,
					"columnNum": 16
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS Charter School Indicator",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 375,
					"offsetEnd": 376,
					"columnNum": 17
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "County/District Code of Accountability",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_CODE_OF_ACCOUNTABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 377,
					"offsetEnd": 383,
					"columnNum": 18
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Section 504 Status",
				"otherPossibleNames": [],
				"logicalName": "PP_SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 384,
					"offsetEnd": 386,
					"columnNum": 19
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS Primary Disability Type ǂ",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_DISABILITY_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 387,
					"offsetEnd": 389,
					"columnNum": 20
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Primary Disability Type for Testing",
				"otherPossibleNames": [],
				"logicalName": "Primary Disability Type for Testing",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 390,
					"offsetEnd": 392,
					"columnNum": 21
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS IDEA Indicator ǂ",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_IDEA_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 393,
					"offsetEnd": 395,
					"columnNum": 22
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "IDEA Indicator for Testing ",
				"otherPossibleNames": [],
				"logicalName": "PP_IDEA_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 396 ,
					"offsetEnd": 398,
					"columnNum": 23
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Migrant Status",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 399,
					"offsetEnd": 401,
					"columnNum": 24
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EL Status",
				"otherPossibleNames": [],
				"logicalName": "LEP_LIMITED_ENGLISH_PROFICIENT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 402,
					"offsetEnd": 404,
					"columnNum": 25
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EL ID Date",
				"otherPossibleNames": [],
				"logicalName": "LEP_ENTRY_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 405,
					"offsetEnd": 414,
					"columnNum": 26
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "RFEP Date",
				"otherPossibleNames": [],
				"logicalName": "LEP_EXIT_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 415,
					"offsetEnd": 424,
					"columnNum": 27
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "First Entry Date in US School",
				"otherPossibleNames": [],
				"logicalName": "FIRST_DATE_IN_US_SCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 425,
					"offsetEnd": 434,
					"columnNum": 28
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Enrollment Effective Date ǂ",
				"otherPossibleNames": [],
				"logicalName": "ENROLLMENT_EFFECTIVE_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 435,
					"offsetEnd": 444,
					"columnNum": 29
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "English Language Acquisition Status (ELAS)",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 445,
					"offsetEnd": 448,
					"columnNum": 30
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Language Code (CEDS)",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 449,
					"offsetEnd": 451,
					"columnNum": 31
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Primary Language",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 452,
					"offsetEnd": 454,
					"columnNum": 32
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Military Status",
				"otherPossibleNames": [],
				"logicalName": "MILITARY_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 455,
					"offsetEnd": 457,
					"columnNum": 33
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Foster Status",
				"otherPossibleNames": [],
				"logicalName": "FOSTER_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 458,
					"offsetEnd": 460,
					"columnNum": 34
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Homeless Status",
				"otherPossibleNames": [],
				"logicalName": "HOMELESS_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 461,
					"offsetEnd": 463,
					"columnNum": 35
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS Economic Disadvantage Status ǂ",
				"otherPossibleNames": [],
				"logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 464,
					"offsetEnd": 466,
					"columnNum": 36
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Economic Disadvantage Status for Testing",
				"otherPossibleNames": [],
				"logicalName": "ECONOMIC_DISADVANTAGE_TESTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 467,
					"offsetEnd": 469,
					"columnNum": 37
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "NPS School Flag",
				"otherPossibleNames": [],
				"logicalName": "NPS_SCHOOL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 470,
					"offsetEnd": 470,
					"columnNum": 38
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Hispanic or Latino",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC_OR_LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 471,
					"offsetEnd": 473,
					"columnNum": 39
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "American Indian or Alaska Native",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 474,
					"offsetEnd": 476,
					"columnNum": 40
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Asian",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 477,
					"offsetEnd": 479,
					"columnNum": 41
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Native Hawaiian or Other Pacific Islander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 480,
					"offsetEnd": 482,
					"columnNum": 42
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Filipino",
				"otherPossibleNames": [],
				"logicalName": "FILIPINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 483,
					"offsetEnd": 485,
					"columnNum": 43
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Black or African American",
				"otherPossibleNames": [],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 486,
					"offsetEnd": 488,
					"columnNum": 44
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "White",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 489,
					"offsetEnd": 491,
					"columnNum": 45
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Two or More Races ",
				"otherPossibleNames": [],
				"logicalName": "TWO_OR_MORE_RACES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 492,
					"offsetEnd": 494,
					"columnNum": 46
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Reporting Ethnicity",
				"otherPossibleNames": [],
				"logicalName": "REPORTING_ETHNICITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 495,
					"offsetEnd": 497,
					"columnNum": 47
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Parent Education Level",
				"otherPossibleNames": [],
				"logicalName": "PARENT_EDUCATION_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 498,
					"offsetEnd": 499,
					"columnNum": 48
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 500,
					"offsetEnd": 500,
					"columnNum": 49
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Opportunity ID 1",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 501,
					"offsetEnd": 516,
					"columnNum": 50
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Opportunity 1 Testing Status",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 517,
					"offsetEnd": 517,
					"columnNum": 51
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Opportunity ID 2",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 518,
					"offsetEnd": 533,
					"columnNum": 52
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Opportunity 2 Testing Status",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 534,
					"offsetEnd": 534,
					"columnNum": 53
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Opportunity ID 3",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 535,
					"offsetEnd": 550,
					"columnNum": 54
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Opportunity 3 Testing Status",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 551,
					"offsetEnd": 551,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Opportunity ID 4",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 552,
					"offsetEnd": 567,
					"columnNum": 56
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Opportunity 4 Testing Status",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 568,
					"offsetEnd": 568,
					"columnNum": 57
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Registration ID",
				"otherPossibleNames": [],
				"logicalName": "ENROLLMENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 569,
					"offsetEnd": 584,
					"columnNum": 58
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested LEA Name 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 585,
					"offsetEnd": 684,
					"columnNum": 59
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested County/District Code 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 685,
					"offsetEnd": 698,
					"columnNum": 60
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School Name 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 699,
					"offsetEnd": 798,
					"columnNum": 61
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School Code 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 799,
					"offsetEnd": 812,
					"columnNum": 14
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter School Indicator 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 813,
					"offsetEnd": 814,
					"columnNum": 63
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter Code 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 815,
					"offsetEnd": 818,
					"columnNum": 64
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School NPS Flag 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 819,
					"offsetEnd": 819,
					"columnNum": 65
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Paper and Pencil Test Completion Date (Paper)",
				"otherPossibleNames": [],
				"logicalName": "PAPER_AND_PENCIL_TEST_COMPLETION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 820,
					"offsetEnd": 829,
					"columnNum": 66
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested LEA Name 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 830,
					"offsetEnd": 929,
					"columnNum": 67
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested County/District Code 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 930,
					"offsetEnd": 943,
					"columnNum": 68
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School Name 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 944,
					"offsetEnd": 1043,
					"columnNum": 69
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School Code 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1044,
					"offsetEnd": 1057,
					"columnNum": 70
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter School Indicator 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1058,
					"offsetEnd": 1059,
					"columnNum": 71
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter Code 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1060,
					"offsetEnd": 1063,
					"columnNum": 72
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School NPS Flag 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1064,
					"offsetEnd": 1064,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested LEA Name 3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1065,
					"offsetEnd": 1164,
					"columnNum": 74
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested County/District Code 3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1165,
					"offsetEnd": 1178,
					"columnNum": 75
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School Name 3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1179,
					"offsetEnd": 1278,
					"columnNum": 76
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School Code 3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1279,
					"offsetEnd": 1292,
					"columnNum": 77
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter School Indicator 3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1293,
					"offsetEnd": 1294,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter Code 3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1295,
					"offsetEnd": 1298,
					"columnNum": 79
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School NPS Flag 3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1299,
					"offsetEnd": 1299,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested LEA Name 4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1300,
					"offsetEnd": 1399,
					"columnNum": 81
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested County/District Code 4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1400,
					"offsetEnd": 1413,
					"columnNum": 82
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School Name 4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1414,
					"offsetEnd": 1513,
					"columnNum": 83
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School Code 4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1514,
					"offsetEnd": 1527,
					"columnNum": 84
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter School Indicator 4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1528,
					"offsetEnd": 1529,
					"columnNum": 85
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter Code 4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1530,
					"offsetEnd": 1533,
					"columnNum": 86
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested School NPS Flag 4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1534,
					"offsetEnd": 1534,
					"columnNum": 87
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Start Date 1",
				"otherPossibleNames": [],
				"logicalName": "TEST_START_DATE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1535,
					"offsetEnd": 1544,
					"columnNum": 88
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Completion Date 1",
				"otherPossibleNames": [],
				"logicalName": "TEST_COMPLETION_DATE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1545,
					"offsetEnd": 1554,
					"columnNum": 89
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Start Date 2",
				"otherPossibleNames": [],
				"logicalName": "TEST_START_DATE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1555,
					"offsetEnd": 1564,
					"columnNum": 90
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Completion Date 2",
				"otherPossibleNames": [],
				"logicalName": "TEST_COMPLETION_DATE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1565,
					"offsetEnd": 1574,
					"columnNum": 91
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Start Date 3",
				"otherPossibleNames": [],
				"logicalName": "TEST_START_DATE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1575,
					"offsetEnd": 1584,
					"columnNum": 92
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Completion Date 3",
				"otherPossibleNames": [],
				"logicalName": "TEST_COMPLETION_DATE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1585,
					"offsetEnd": 1594,
					"columnNum": 93
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Start Date 4",
				"otherPossibleNames": [],
				"logicalName": "TEST_START_DATE_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1595,
					"offsetEnd": 1604,
					"columnNum": 94
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Completion Date 4",
				"otherPossibleNames": [],
				"logicalName": "TEST_COMPLETION_DATE_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1605,
					"offsetEnd": 1614,
					"columnNum": 95
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Final Tested LEA Name ǂ",
				"otherPossibleNames": [],
				"logicalName": "FINAL_TESTED_LEA_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1615,
					"offsetEnd": 1714,
					"columnNum": 96
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Final Tested CountyDistrict Code ǂ",
				"otherPossibleNames": [],
				"logicalName": "FINAL_TESTED_COUNTY_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1715,
					"offsetEnd": 1728,
					"columnNum": 97
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Final Tested School Name ǂ",
				"otherPossibleNames": [],
				"logicalName": "FINAL_TESTED_SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1729,
					"offsetEnd": 1828,
					"columnNum": 98
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Final Tested School Code ǂ",
				"otherPossibleNames": [],
				"logicalName": "FINAL_TESTED_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1829,
					"offsetEnd": 1842,
					"columnNum": 99
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Final Tested Charter School Indicator ǂ",
				"otherPossibleNames": [],
				"logicalName": "FINAL_TESTED_CHARTER_SCHOOL_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1843,
					"offsetEnd": 1844,
					"columnNum": 100
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Final Tested Charter Code ǂ",
				"otherPossibleNames": [],
				"logicalName": "FINAL_TESTED_CHARTER_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1845,
					"offsetEnd": 1848,
					"columnNum": 101
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Final Tested School NPS Flag ǂ",
				"otherPossibleNames": [],
				"logicalName": "FINAL_TESTED_SCHOOL_NPS_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1849,
					"offsetEnd": 1849,
					"columnNum": 102
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Final Test Completed Date ǂ",
				"otherPossibleNames": [],
				"logicalName": "FINAL_TEST_COMPLETION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1850,
					"offsetEnd": 1859,
					"columnNum": 103
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Selected Start of Test Window 1",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1860,
					"offsetEnd": 1869,
					"columnNum": 104
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Selected End of Test Window 1",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1870,
					"offsetEnd": 1879,
					"columnNum": 105
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Selected Start of Test Window 2",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1880,
					"offsetEnd": 1889,
					"columnNum": 106
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Selected End of Test Window 2",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1890,
					"offsetEnd": 1899,
					"columnNum": 107
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Selected Start of Test Window 3",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1900,
					"offsetEnd": 1909,
					"columnNum": 108
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Selected End of Test Window 3",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1910,
					"offsetEnd": 1919,
					"columnNum": 109
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Selected Start of Test Window 4",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1920,
					"offsetEnd": 1929,
					"columnNum": 110
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "School Selected End of Test Window 4",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1930,
					"offsetEnd": 1939,
					"columnNum": 111
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Exit Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1940,
					"offsetEnd": 1943,
					"columnNum": 112
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Exit Withdrawal Date",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1944,
					"offsetEnd": 1953,
					"columnNum": 113
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Student Removed from CALPADS File Date",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1954,
					"offsetEnd": 1963 ,
					"columnNum": 114
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CAST Last Science Class Flag",
				"otherPossibleNames": [],
				"logicalName": "CAST_LAST_SCIENCE_CLASS_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1964,
					"offsetEnd": 1964,
					"columnNum": 115
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Condition Code",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1965,
					"offsetEnd": 1968,
					"columnNum": 116
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Attemptedness",
				"otherPossibleNames": [],
				"logicalName": "ATTEMPTEDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1969,
					"offsetEnd": 1969,
					"columnNum": 117
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Score Status",
				"otherPossibleNames": [],
				"logicalName": "SCORE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1970,
					"offsetEnd": 1970,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Unlisted Resource Construct Change",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCE_CONSTRUCT_CHANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1971,
					"offsetEnd": 1971,
					"columnNum": 119
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Mode—Online or Paper",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_ONLINE_OR_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1972,
					"offsetEnd": 1972,
					"columnNum": 120
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Include Indicator",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1973,
					"offsetEnd": 1973,
					"columnNum": 121
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Remote Tester 1 ǂ",
				"otherPossibleNames": [],
				"logicalName": "REMOTE_TESTER_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1974,
					"offsetEnd": 1974,
					"columnNum": 122
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Remote Tester 2 ǂ",
				"otherPossibleNames": [],
				"logicalName": "REMOTE_TESTER_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1975,
					"offsetEnd": 1975,
					"columnNum": 123
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Remote Tester 3 ǂ",
				"otherPossibleNames": [],
				"logicalName": "REMOTE_TESTER_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1976,
					"offsetEnd": 1976,
					"columnNum": 124
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Remote Tester 4 ǂ",
				"otherPossibleNames": [],
				"logicalName": "REMOTE_TESTER_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1977,
					"offsetEnd": 1977,
					"columnNum": 125
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SSR Eligible ǂ",
				"otherPossibleNames": [],
				"logicalName": "SSR_ELIGIBLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1978,
					"offsetEnd": 1978,
					"columnNum": 126
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Lexile or Quantile Measure ǂ",
				"otherPossibleNames": [],
				"logicalName": "LEXILE_QUANTILE_MEASURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1979,
					"offsetEnd": 1984,
					"columnNum": 127
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1985,
					"offsetEnd": 1992,
					"columnNum": 128
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1993,
					"offsetEnd": 2000,
					"columnNum": 129
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score 1",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2001,
					"offsetEnd": 2002,
					"columnNum": 130
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score 2",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2003,
					"offsetEnd": 2004,
					"columnNum": 131
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score 3",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2005,
					"offsetEnd": 2006,
					"columnNum": 132
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score 4",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2007,
					"offsetEnd": 2008,
					"columnNum": 133
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2028,
					"columnNum": 134
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2028,
					"columnNum": 135
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2028,
					"columnNum": 136
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2028,
					"columnNum": 137
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2028,
					"columnNum": 138
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2028,
					"columnNum": 139
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2028,
					"columnNum": 140
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2028,
					"columnNum": 141
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Score",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2029,
					"offsetEnd": 2032,
					"columnNum": 142
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Error Measurement – SEM",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2033,
					"offsetEnd": 2036,
					"columnNum": 143
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Scale Scores Error Bands – Min",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_MIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2037,
					"offsetEnd": 2040,
					"columnNum": 144
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Scale Scores Error Bands – Max",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_MAX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2041,
					"offsetEnd": 2044,
					"columnNum": 145
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Achievement Levels",
				"otherPossibleNames": [],
				"logicalName": "ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2045,
					"offsetEnd": 2045,
					"columnNum": 146
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Domain 1 Level",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_1_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2046,
					"offsetEnd": 2046,
					"columnNum": 147
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Domain 2 Level",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_2_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2047,
					"offsetEnd": 2047,
					"columnNum": 148
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Domain 3 Level",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_3_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2048,
					"offsetEnd": 2048,
					"columnNum": 149
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Genre",
				"otherPossibleNames": [],
				"logicalName": "GENRE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2049,
					"offsetEnd": 2052,
					"columnNum": 150
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WER POR",
				"otherPossibleNames": [],
				"logicalName": "WER_POR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2053,
					"offsetEnd": 2053,
					"columnNum": 151
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WER DEV EEL",
				"otherPossibleNames": [],
				"logicalName": "WER_DEV_EEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2054,
					"offsetEnd": 2054,
					"columnNum": 152
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "WER COV",
				"otherPossibleNames": [],
				"logicalName": "WER_COV",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2055,
					"offsetEnd": 2055,
					"columnNum": 153
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "EAP",
				"otherPossibleNames": [],
				"logicalName": "EAP_STUDENT_AUTHORIZED_ETS_TO_RELEASE_RESULTS_TO_COLLEGES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2056,
					"offsetEnd": 2056,
					"columnNum": 154
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number of Items Attempted 1",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2057,
					"offsetEnd": 2059,
					"columnNum": 155
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number of Items Attempted 2",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2060,
					"offsetEnd": 2062,
					"columnNum": 156
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number of Items Attempted 3",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2063,
					"offsetEnd": 2065,
					"columnNum": 157
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number of Items Attempted 4",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2066,
					"offsetEnd": 2068,
					"columnNum": 158
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Accommodations Available Indicator",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATIONS_AVAILABLE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2069,
					"offsetEnd": 2071,
					"columnNum": 159
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Designated Support Available Indicator",
				"otherPossibleNames": [],
				"logicalName": "DESIGNATED_SUPPORT_AVALIABLE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2072,
					"offsetEnd": 2074,
					"columnNum": 160
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1 – American Sign Language (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_AMERICAN_SIGN_LANGUAGE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2075,
					"offsetEnd": 2082,
					"columnNum": 161
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 2 – American Sign Language (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_AMERICAN_SIGN_LANGUAGE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2083,
					"offsetEnd": 2090,
					"columnNum": 162
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1 – Audio Transcript (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_AUDIO_TRANSCRIPT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2091,
					"offsetEnd": 2106,
					"columnNum": 163
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 2 – Audio Transcript (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_AUDIO_TRANSCRIPT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2107,
					"offsetEnd": 2122,
					"columnNum": 164
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1 – Braille (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2123,
					"offsetEnd": 2133,
					"columnNum": 165
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 2 – Braille (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2134,
					"offsetEnd": 2144,
					"columnNum": 166
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1 – Closed Captioning (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_CLOSED_CAPTIONING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2145,
					"offsetEnd": 2158,
					"columnNum": 167
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 2 – Closed Captioning (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_CLOSED_CAPTIONING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2159,
					"offsetEnd": 2172,
					"columnNum": 168
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1 – Text-to-Speech Passages (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_TEXTTOSPEECH_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2173,
					"offsetEnd": 2184,
					"columnNum": 169
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 2 – Text-to-Speech Passages (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_TEXTTOSPEECH_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2185,
					"offsetEnd": 2196,
					"columnNum": 170
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – 100s Number Table (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2197,
					"offsetEnd": 2206,
					"columnNum": 171
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – 100s Number Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2207,
					"offsetEnd": 2216,
					"columnNum": 172
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Abacus (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2217,
					"offsetEnd": 2226,
					"columnNum": 173
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Abacus (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2227,
					"offsetEnd": 2236,
					"columnNum": 174
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3 – Abacus (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2237,
					"offsetEnd": 2246,
					"columnNum": 175
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 4 – Abacus (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_4_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2247,
					"offsetEnd": 2256,
					"columnNum": 176
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Additional Instructional Supports for Alternate Assessments (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2257,
					"offsetEnd": 2269,
					"columnNum": 177
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Additional Instructional Supports for Alternate Assessments (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2270,
					"offsetEnd": 2282,
					"columnNum": 178
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3 – Additional Instructional Supports for Alternate Assessments (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2283,
					"offsetEnd": 2295,
					"columnNum": 179
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 4 – Additional Instructional Supports for Alternate Assessments (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_4_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2296,
					"offsetEnd": 2308,
					"columnNum": 180
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Alternate Response Options (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2309,
					"offsetEnd": 2314,
					"columnNum": 181
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Alternate Response Options (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2315,
					"offsetEnd": 2320,
					"columnNum": 182
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3 – Alternate Response Options (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2321,
					"offsetEnd": 2326,
					"columnNum": 183
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 4 – Alternate Response Options (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_4_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2327,
					"offsetEnd": 2332,
					"columnNum": 184
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation – Braille (Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_BRAILLE_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2333,
					"offsetEnd": 2343,
					"columnNum": 185
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Calculator (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_CALCULATOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2344,
					"offsetEnd": 2351,
					"columnNum": 186
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Calculator (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_CALCULATOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2352,
					"offsetEnd": 2359,
					"columnNum": 187
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) – Large-Print special form",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_LARGE_PRINT_SPECIAL_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2360,
					"offsetEnd": 2365,
					"columnNum": 188
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Multiplication Table (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2366,
					"offsetEnd": 2371,
					"columnNum": 189
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Multiplication Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2372,
					"offsetEnd": 2377,
					"columnNum": 190
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Print on Demand (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2378,
					"offsetEnd": 2402,
					"columnNum": 191
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Print on Demand (Online) ",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2403,
					"offsetEnd": 2427,
					"columnNum": 192
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3 – Print on Demand (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2428,
					"offsetEnd": 2452,
					"columnNum": 193
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 4 – Print on Demand (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_4_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2453,
					"offsetEnd": 2477,
					"columnNum": 194
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Read Aloud Passages (Online or Paper) ",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__READ_ALOUD_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2478,
					"offsetEnd": 2491,
					"columnNum": 195
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Scribe (Writing) (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__SCRIBE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2492,
					"offsetEnd": 2507,
					"columnNum": 196
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Scribe (Writing) (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2__SCRIBE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2508,
					"offsetEnd": 2523,
					"columnNum": 197
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Speech-to-Text (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__SPEECHTOTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2524,
					"offsetEnd": 2530,
					"columnNum": 198
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Speech-to-Text (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2__SPEECHTOTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2531,
					"offsetEnd":  2537,
					"columnNum": 199
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2538,
					"offsetEnd": 2555,
					"columnNum": 200
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2556,
					"offsetEnd": 2573,
					"columnNum": 201
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3 – Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2574,
					"offsetEnd": 2591,
					"columnNum": 202
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 4 – Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_4_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2592,
					"offsetEnd": 2609,
					"columnNum": 203
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 – Word Prediction (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_WORD_PREDICTION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2610,
					"offsetEnd": 2621,
					"columnNum": 204
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2 – Word Prediction (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_WORD_PREDICTION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2622,
					"offsetEnd": 2633,
					"columnNum": 205
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3 – Word Prediction (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_WORD_PREDICTION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2634,
					"offsetEnd": 2645,
					"columnNum": 206
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 4 – Word Prediction (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_4_WORD_PREDICTION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2646,
					"offsetEnd": 2657,
					"columnNum": 207
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2658,
					"offsetEnd": 2676,
					"columnNum": 208
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_CONTRAST_ONLINE–_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2677,
					"offsetEnd": 2695,
					"columnNum": 209
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 – Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2696,
					"offsetEnd": 2714,
					"columnNum": 210
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 4 – Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2715,
					"offsetEnd": 2733,
					"columnNum": 211
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Masking (Online) ",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2734,
					"offsetEnd": 2745,
					"columnNum": 212
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Masking (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2746,
					"offsetEnd": 2757,
					"columnNum": 213
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 – Masking (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2758,
					"offsetEnd": 2769,
					"columnNum": 214
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 4 – Masking(Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2770,
					"offsetEnd": 2781,
					"columnNum": 215
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Mouse Pointer(Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2782,
					"offsetEnd": 2797,
					"columnNum": 216
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Mouse Pointer (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2798,
					"offsetEnd": 2813,
					"columnNum": 217
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 – Mouse Pointer(Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2814,
					"offsetEnd": 2829,
					"columnNum": 218
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 4 – Mouse Pointer (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2830,
					"offsetEnd": 2845,
					"columnNum": 219
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2846,
					"offsetEnd": 2852,
					"columnNum": 220
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2853,
					"offsetEnd": 2859,
					"columnNum": 221
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 – Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2860,
					"offsetEnd": 2866,
					"columnNum": 222
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 4 – Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2867,
					"offsetEnd": 2873,
					"columnNum": 223
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Print Size (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2874,
					"offsetEnd": 2882,
					"columnNum": 224
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Print Size (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2883,
					"offsetEnd": 2891,
					"columnNum": 225
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 – Print Size (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2892,
					"offsetEnd": 2900,
					"columnNum": 226
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 4 – Print Size (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2901,
					"offsetEnd": 2909,
					"columnNum": 227
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Stacked Translations and Translated Test Directions (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2910,
					"offsetEnd": 2912,
					"columnNum": 228
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Stacked Translations and Translated Test Directions (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2913,
					"offsetEnd": 2915,
					"columnNum": 229
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Streamline (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2916,
					"offsetEnd": 2923,
					"columnNum": 230
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Streamline (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2924,
					"offsetEnd": 2931,
					"columnNum": 231
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 – Streamline (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2932,
					"offsetEnd": 2939,
					"columnNum": 232
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 4 – Streamline (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2940,
					"offsetEnd": 2947,
					"columnNum": 233
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Text to Speech (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2948,
					"offsetEnd": 2972,
					"columnNum": 234
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Text to Speech (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2973,
					"offsetEnd": 2997,
					"columnNum": 235
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Translations (Glossary) (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATIONS_GLOSSARY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2998,
					"offsetEnd": 3035,
					"columnNum": 236
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Translations (Glossary) (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__TRANSLATIONS_GLOSSARY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3036,
					"offsetEnd": 3073,
					"columnNum": 237
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 – Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3074,
					"offsetEnd": 3076,
					"columnNum": 238
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2 – Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3077,
					"offsetEnd": 3079,
					"columnNum": 239
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 – Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3080,
					"offsetEnd": 3082,
					"columnNum": 240
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 4 – Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3083,
					"offsetEnd": 3085,
					"columnNum": 241
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – 100s Number Table (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3086,
					"offsetEnd": 3096,
					"columnNum": 242
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – 100s Number Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3097,
					"offsetEnd": 3107,
					"columnNum": 243
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – 100s Number Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3108,
					"offsetEnd": 3118,
					"columnNum": 244
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – 100s Number Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3119,
					"offsetEnd": 3129,
					"columnNum": 245
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Amplification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__AMPLIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3130,
					"offsetEnd": 3141,
					"columnNum": 246
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Amplification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__AMPLIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3142,
					"offsetEnd": 3153,
					"columnNum": 247
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Amplification (Online) ",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__AMPLIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3154,
					"offsetEnd": 3165,
					"columnNum": 248
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Amplification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__AMPLIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3166,
					"offsetEnd": 3177,
					"columnNum": 249
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Bilingual Dictionary (Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__BILINGUAL_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3178,
					"offsetEnd": 3184,
					"columnNum": 250
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Bilingual Dictionary (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__BILINGUAL_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3185,
					"offsetEnd": 3191,
					"columnNum": 251
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Calculator (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3192,
					"offsetEnd": 3200,
					"columnNum": 252
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3201,
					"offsetEnd": 3207,
					"columnNum": 253
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3208,
					"offsetEnd": 3214,
					"columnNum": 254
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3215,
					"offsetEnd": 3221,
					"columnNum": 255
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3222,
					"offsetEnd": 3228,
					"columnNum": 256
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Color Overlay (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3229,
					"offsetEnd": 3235,
					"columnNum": 257
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Color Overlay (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3236,
					"offsetEnd": 3242,
					"columnNum": 258
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Color Overlay (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3243,
					"offsetEnd": 3249,
					"columnNum": 259
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Color Overlay (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3250,
					"offsetEnd": 3256,
					"columnNum": 260
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Magnification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3257,
					"offsetEnd": 3264,
					"columnNum": 261
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Magnification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3265,
					"offsetEnd": 3272,
					"columnNum": 262
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Magnification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3273,
					"offsetEnd": 3280,
					"columnNum": 263
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Magnification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3281,
					"offsetEnd": 3288,
					"columnNum": 264
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Medical Supports (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MEDICAL_DEVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3289,
					"offsetEnd": 3299,
					"columnNum": 265
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Medical Supports (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MEDICAL_DEVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3300,
					"offsetEnd": 3310,
					"columnNum": 266
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Medical Supports (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__MEDICAL_DEVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3311,
					"offsetEnd": 3321,
					"columnNum": 267
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Medical Supports (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__MEDICAL_DEVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3322,
					"offsetEnd": 3332,
					"columnNum": 268
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Multiplication Table (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3333,
					"offsetEnd": 3339,
					"columnNum": 269
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Multiplication Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3340,
					"offsetEnd": 3346,
					"columnNum": 270
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Multiplication Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3347,
					"offsetEnd": 3353,
					"columnNum": 271
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Multiplication Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3354,
					"offsetEnd": 3360,
					"columnNum": 272
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Noise Buffers (Online orPaper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3361,
					"offsetEnd": 3373,
					"columnNum": 273
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Noise Buffers (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3374,
					"offsetEnd": 3386,
					"columnNum": 274
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Noise Buffers (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3387,
					"offsetEnd": 3399,
					"columnNum": 275
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Noise Buffers (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3400,
					"offsetEnd": 3412,
					"columnNum": 276
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Read Aloud Items (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__READ_ALOUD_-_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3413,
					"offsetEnd": 3433,
					"columnNum": 277
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Read Aloud Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__READ_ALOUD_-_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3434,
					"offsetEnd": 3454,
					"columnNum": 278
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Read Aloud Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__READ_ALOUD_-_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3455,
					"offsetEnd": 3475,
					"columnNum": 279
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Read Aloud Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__READ_ALOUD_-_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3476,
					"offsetEnd": 3496,
					"columnNum": 280
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Read Aloud in Spanish (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__READ_ALOUD_IN_SPANISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3497,
					"offsetEnd": 3521,
					"columnNum": 281
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Read Aloud in Spanish (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__READ_ALOUD_IN_SPANISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3522,
					"offsetEnd": 3546,
					"columnNum": 282
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 –Science Charts (StateApproved) (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SCIENCE_CHARTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3547,
					"offsetEnd": 3559,
					"columnNum": 283
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 –Scribe Items (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3560,
					"offsetEnd": 3572,
					"columnNum": 284
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Scribe Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3573,
					"offsetEnd": 3585,
					"columnNum": 285
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Scribe Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3586,
					"offsetEnd": 3598,
					"columnNum": 286
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Scribe Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3599,
					"offsetEnd": 3611,
					"columnNum": 287
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Separate Setting (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3612,
					"offsetEnd": 3618,
					"columnNum": 288
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Separate Setting (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3619,
					"offsetEnd": 3625,
					"columnNum": 289
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 – Separate Setting (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3626,
					"offsetEnd": 3632,
					"columnNum": 290
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 4 – Separate Setting (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3633,
					"offsetEnd": 3639,
					"columnNum": 291
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Simplified Test Directions (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3640,
					"offsetEnd": 3652,
					"columnNum": 292
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 – Simplified Test Directions (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3653,
					"offsetEnd": 3665,
					"columnNum": 293
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Translated Test Directions (PDF on CAASPP.org) (Online or Paper)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATED_TEST_DIRECTIONS_PDF_BY_SMARTER_BALANCED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3666,
					"offsetEnd": 3680,
					"columnNum": 294
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 – Translated Test Directions (PDF on CAASPP.org) (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATED_TEST_DIRECTIONS_PDF_BY_SMARTER_BALANCED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3681,
					"offsetEnd": 3694,
					"columnNum": 295
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports – Translations (Glossary)(Paper) ǂ",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__TRANSLATIONS_GLOSSARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3695,
					"offsetEnd": 3732,
					"columnNum": 296
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SSR Eligible Minus 1 ǂ",
				"otherPossibleNames": [],
				"logicalName": "SSR_ELIGIBLE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3733,
					"offsetEnd": 3733,
					"columnNum": 297
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Assessed Current Year Minus 1",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3734,
					"offsetEnd": 3735,
					"columnNum": 298
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3736,
					"offsetEnd": 3743,
					"columnNum": 299
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Error Measurement—SEM Current Year Minus 1",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3744,
					"offsetEnd": 3747,
					"columnNum": 300
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Score Current Year Minus 1",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3748,
					"offsetEnd": 3751,
					"columnNum": 301
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Achievement Levels Current Year Minus 1 ǂ",
				"otherPossibleNames": [],
				"logicalName": "ACHIEVEMENT_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3752,
					"offsetEnd": 3752,
					"columnNum": 302
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Condition Code Current Year Minus 1",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3753,
					"offsetEnd": 3756,
					"columnNum": 303
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 304
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 305
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 306
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 307
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 308
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 309
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 310
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 311
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 312
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 313
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3757,
					"offsetEnd": 3779,
					"columnNum": 314
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SSR Eligible Minus 2 ǂ",
				"otherPossibleNames": [],
				"logicalName": "SSR_ELIGIBLE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3780,
					"offsetEnd": 3780,
					"columnNum": 315
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Assessed Current Year Minus 2",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3781,
					"offsetEnd": 3782,
					"columnNum": 316
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3783,
					"offsetEnd": 3790,
					"columnNum": 317
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Error Measurement—SEM Current Year Minus 2",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT__SEM_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3791,
					"offsetEnd": 3794,
					"columnNum": 318
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Scores Current Year Minus 2",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3795,
					"offsetEnd": 3798,
					"columnNum": 319
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Achievement Levels Year Minus 2 ǂ",
				"otherPossibleNames": [],
				"logicalName": "ACHIEVEMENT_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3799,
					"offsetEnd": 3799,
					"columnNum": 320
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Condition Code Current Year Minus 2",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3780,
					"offsetEnd": 3803,
					"columnNum": 321
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 322
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 323
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 324
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 325
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 326
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 327
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 328
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 329
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 330
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 331
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3804,
					"offsetEnd": 3826,
					"columnNum": 332
				},
				"fieldLength": 23,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "SSR Eligible Minus 3 ǂ",
				"otherPossibleNames": [],
				"logicalName": "SSR_ELIGIBLE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3827,
					"offsetEnd": 3827,
					"columnNum": 333
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Assessed Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3828,
					"offsetEnd": 3829,
					"columnNum": 334
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3830,
					"offsetEnd": 3837,
					"columnNum": 335
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Standard Error Measurement—SEM Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT__SEM_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3838,
					"offsetEnd": 3841,
					"columnNum": 336
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Scores Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3842,
					"offsetEnd": 3845,
					"columnNum": 337
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Achievement Levels Year Minus 3 ǂ",
				"otherPossibleNames": [],
				"logicalName": "ACHIEVEMENT_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3846,
					"offsetEnd": 3846,
					"columnNum": 338
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Condition Code Current Year Minus 3",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3847,
					"offsetEnd": 3850,
					"columnNum": 339
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 340
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 341
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 342
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 343
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 344
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 345
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 346
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 347
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3851,
					"offsetEnd": 3886,
					"columnNum": 348
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "UIN (Unique Identification Number)",
				"otherPossibleNames": [],
				"logicalName": "UIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3887,
					"offsetEnd": 3902,
					"columnNum": 349
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Blank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3903,
					"offsetEnd": 3962,
					"columnNum": 350
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "End of Record",
				"otherPossibleNames": [],
				"logicalName": "END_OF_RECORD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3963,
					"offsetEnd": 3964,
					"columnNum": 351
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			}
		]
	},
	"fileExtensions": [".txt",".dat"]
}