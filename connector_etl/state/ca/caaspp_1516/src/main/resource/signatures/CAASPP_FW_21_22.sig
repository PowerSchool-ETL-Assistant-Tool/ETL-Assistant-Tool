 {
 	"encoding": "UTF-8",
 	"format": {
 		"@type": "Fixed Length",
 		"formatName": "CAASPP_FW_21_22",
 		"recordLength": 4036,
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
 				"logicalName": "DOB",
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
 				"logicalName": "STUDENT_GENDER",
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
 				"otherPossibleNames": ["BLANK"],
 				"logicalName": "BLANK_1",
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
 				"otherPossibleNames": ["BLANK"],
 				"logicalName": "BLANK_2",
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
 				"physicalName": "CALPADS District Name",
 				"otherPossibleNames": [],
 				"logicalName": "CALPADS_DISTRICT_NAME",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 157,
 					"offsetEnd": 256,
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
 				"physicalName": "CALPADS School Name",
 				"otherPossibleNames": [],
 				"logicalName": "CALPADS_SCHOOL_NAME",
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
 				"physicalName": "CALPADS Special Education District of Accountability",
 				"otherPossibleNames": [],
 				"logicalName": "CALPADS_SPECIAL_EDUCATION_ACCOUNTABILITY",
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
 				"logicalName": "SECTION_504_STATUS",
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
 				"physicalName": "CALPADS Primary Disability Type",
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
 				"logicalName": "PRIMARY_DISABILITY_TYPE_FOR_TESTING",
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
 				"physicalName": "CALPADS IDEA Indicator",
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
 				"logicalName": "IDEA_INDICATOR_TESTING",
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
 				"logicalName": "EL_STATUS",
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
 				"physicalName": "EL Entry Date",
 				"otherPossibleNames": [],
 				"logicalName": "EL_ENTRY_DATE",
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
 				"logicalName": "RFEP_DATE",
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
 				"physicalName": "Enrollment Effective Date",
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
 				"physicalName": "CALPADS Primary Language",
 				"otherPossibleNames": [],
 				"logicalName": "CALPADS_PRIMARY_LANGUAGE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 452,
 					"offsetEnd": 453,
 					"columnNum": 32
 				},
 				"fieldLength": 2,
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
 					"offsetStart": 454,
 					"offsetEnd": 456,
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
 					"offsetStart": 457,
 					"offsetEnd": 459,
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
 					"offsetStart": 460,
 					"offsetEnd": 462,
 					"columnNum": 35
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "CALPADS Economic Disadvantage Status",
 				"otherPossibleNames": [],
 				"logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 463,
 					"offsetEnd": 465,
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
 					"offsetStart": 466,
 					"offsetEnd": 468,
 					"columnNum": 37
 				},
 				"fieldLength": 3,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "CALPADS NPS School Flag",
 				"otherPossibleNames": [],
 				"logicalName": "NPS_SCHOOL_FLAG",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 469,
 					"offsetEnd": 469,
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
 					"offsetStart": 470,
 					"offsetEnd": 472,
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
 					"offsetStart": 473,
 					"offsetEnd": 475,
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
 					"offsetStart": 476,
 					"offsetEnd": 478,
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
 					"offsetStart": 479,
 					"offsetEnd": 481,
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
 					"offsetStart": 482,
 					"offsetEnd": 484,
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
 					"offsetStart": 485,
 					"offsetEnd": 487,
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
 					"offsetStart": 488,
 					"offsetEnd": 490,
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
 					"offsetStart": 491,
 					"offsetEnd": 493,
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
 					"offsetStart": 494,
 					"offsetEnd": 496,
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
 					"offsetStart": 497,
 					"offsetEnd": 498,
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
 				"logicalName": "BLANK_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 499,
 					"offsetEnd": 499,
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
 					"offsetStart": 500,
 					"offsetEnd": 515,
 					"columnNum": 50
 				},
 				"fieldLength": 16,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Opportunity Testing Status 1",
 				"otherPossibleNames": [],
 				"logicalName": "OPPORTUNITY_TESTING_STATUS_1",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 516,
 					"offsetEnd": 516,
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
 					"offsetStart": 517,
 					"offsetEnd": 532,
 					"columnNum": 52
 				},
 				"fieldLength": 16,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Opportunity Testing Status 2",
 				"otherPossibleNames": [],
 				"logicalName": "OPPORTUNITY_TESTING_STATUS_2",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 533,
 					"offsetEnd": 533,
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
 					"offsetStart": 534,
 					"offsetEnd": 549,
 					"columnNum": 54
 				},
 				"fieldLength": 16,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Opportunity Testing Status 3",
 				"otherPossibleNames": [],
 				"logicalName": "OPPORTUNITY_TESTING_STATUS_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 550,
 					"offsetEnd": 550,
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
 					"offsetStart": 551,
 					"offsetEnd": 566,
 					"columnNum": 56
 				},
 				"fieldLength": 16,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Opportunity Testing Status 4",
 				"otherPossibleNames": [],
 				"logicalName": "OPPORTUNITY_TESTING_STATUS_4",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 567,
 					"offsetEnd": 567,
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
 				"logicalName": "TEST_REGISTRATION_ID",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 568,
 					"offsetEnd": 583,
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
 					"offsetStart": 584,
 					"offsetEnd": 683,
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
 					"offsetStart": 684,
 					"offsetEnd": 697,
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
 					"offsetStart": 698,
 					"offsetEnd": 797,
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
 					"offsetStart": 798,
 					"offsetEnd": 811,
 					"columnNum": 62
 				},
 				"fieldLength": 14,
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
 					"offsetStart": 812,
 					"offsetEnd": 813,
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
 					"offsetStart": 814,
 					"offsetEnd": 817,
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
 					"offsetStart": 818,
 					"offsetEnd": 818,
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
 					"offsetStart": 819,
 					"offsetEnd": 828,
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
 					"offsetStart": 829,
 					"offsetEnd": 928,
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
 					"offsetStart": 929,
 					"offsetEnd": 942,
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
 					"offsetStart": 943,
 					"offsetEnd": 1042,
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
 					"offsetStart": 1043,
 					"offsetEnd": 1056,
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
 					"offsetStart": 1057,
 					"offsetEnd": 1058,
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
 				"logicalName": "TESTED_CHARTER_CODE_2",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1059,
 					"offsetEnd": 1062,
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
 					"offsetStart": 1063,
 					"offsetEnd": 1063,
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
 					"offsetStart": 1064,
 					"offsetEnd": 1163,
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
 					"offsetStart": 1164,
 					"offsetEnd": 1177,
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
 					"offsetStart": 1178,
 					"offsetEnd": 1277,
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
 					"offsetStart": 1278,
 					"offsetEnd": 1291,
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
 					"offsetStart": 1292,
 					"offsetEnd": 1293,
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
 				"logicalName": "TESTED_CHARTER_CODE_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1294,
 					"offsetEnd": 1297,
 					"columnNum": 79
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Tested School NPS 3",
 				"otherPossibleNames": [],
 				"logicalName": "TESTED_SCHOOL_NPS_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1298,
 					"offsetEnd": 1298,
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
 					"offsetStart": 1299,
 					"offsetEnd": 1398,
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
 					"offsetStart": 1399,
 					"offsetEnd": 1412,
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
 					"offsetStart": 1413,
 					"offsetEnd": 1512,
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
 					"offsetStart": 1513,
 					"offsetEnd": 1526,
 					"columnNum": 84
 				},
 				"fieldLength": 14,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Tested Indicator 4",
 				"otherPossibleNames": [],
 				"logicalName": "TESTED_INDICATOR_4",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1527,
 					"offsetEnd": 1528,
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
 				"logicalName": "TESTED_CHARTER_CODE_4",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1529,
 					"offsetEnd": 1532,
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
 					"offsetStart": 1533,
 					"offsetEnd": 1533,
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
 					"offsetStart": 1534,
 					"offsetEnd": 1543,
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
 					"offsetStart": 1544,
 					"offsetEnd": 1553,
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
 					"offsetStart": 1554,
 					"offsetEnd": 1563,
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
 					"offsetStart": 1564,
 					"offsetEnd": 1573,
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
 					"offsetStart": 1574,
 					"offsetEnd": 1583,
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
 					"offsetStart": 1584,
 					"offsetEnd": 1593,
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
 					"offsetStart": 1594,
 					"offsetEnd": 1603,
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
 					"offsetStart": 1604,
 					"offsetEnd": 1613,
 					"columnNum": 95
 				},
 				"fieldLength": 10,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Final Tested LEA Name",
 				"otherPossibleNames": [],
 				"logicalName": "FINAL_TESTED_LEA_NAME",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1614,
 					"offsetEnd": 1713,
 					"columnNum": 96
 				},
 				"fieldLength": 100,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Final Tested County-District Code",
 				"otherPossibleNames": [],
 				"logicalName": "FINAL_TESTED_COUNTY_DISTRICT_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1714,
 					"offsetEnd": 1727,
 					"columnNum": 97
 				},
 				"fieldLength": 14,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Final Tested School Name",
 				"otherPossibleNames": [],
 				"logicalName": "FINAL_TESTED_SCHOOL_NAME",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1728,
 					"offsetEnd": 1827,
 					"columnNum": 98
 				},
 				"fieldLength": 100,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Final Tested School Code",
 				"otherPossibleNames": [],
 				"logicalName": "FINAL_TESTED_SCHOOL_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1828,
 					"offsetEnd": 1841,
 					"columnNum": 99
 				},
 				"fieldLength": 14,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Final Tested Charter School Indicator",
 				"otherPossibleNames": [],
 				"logicalName": "FINAL_TESTED_CHARTER_SCHOOL_INDICATOR",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1842,
 					"offsetEnd": 1843,
 					"columnNum": 100
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Final Tested Charter Code",
 				"otherPossibleNames": [],
 				"logicalName": "FINAL_TESTED_CHARTER_SCHOOL_CODE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1844,
 					"offsetEnd": 1847,
 					"columnNum": 101
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Final Tested School NPS Flag",
 				"otherPossibleNames": [],
 				"logicalName": "FINAL_TESTED_SCHOOL_NPS_FLAG",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1848,
 					"offsetEnd": 1848,
 					"columnNum": 102
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Final Test Completed Date",
 				"otherPossibleNames": [],
 				"logicalName": "FINAL_TEST_COMPLETED_DATE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1849,
 					"offsetEnd": 1858,
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
 				"logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW_1",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1859,
 					"offsetEnd": 1868,
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
 				"logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW_1",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1869,
 					"offsetEnd": 1878,
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
 					"offsetStart": 1879,
 					"offsetEnd": 1888,
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
 					"offsetStart": 1889,
 					"offsetEnd": 1898,
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
 					"offsetStart": 1899,
 					"offsetEnd": 1908,
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
 					"offsetStart": 1909,
 					"offsetEnd": 1918,
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
 					"offsetStart": 1919,
 					"offsetEnd": 1928,
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
 					"offsetStart": 1929,
 					"offsetEnd": 1938,
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
 					"offsetStart": 1939,
 					"offsetEnd": 1942,
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
 					"offsetStart": 1943,
 					"offsetEnd": 1952,
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
 					"offsetStart": 1953,
 					"offsetEnd": 1962,
 					"columnNum": 114
 				},
 				"fieldLength": 10,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "CAST Current Year Flag ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "CAST_CURRENT_YEAR_FLAG_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1963,
 					"offsetEnd": 1963,
 					"columnNum": 115
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "CAST Participated High School Grade ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "CAST_PARTICIPATED_HIGH_SCHOOL_GRADE_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1964,
 					"offsetEnd": 1965,
 					"columnNum": 116
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "CAST Participated NPS Flag ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "CAST_PARTICIPATED_NPS_FLAG_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1966,
 					"offsetEnd": 1966,
 					"columnNum": 117
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
           	{
 				"physicalName": "CAST Participated District of Accountability ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "CAST_PARTICIPATED_DISTRICT_OF_ACCOUNTABILITY_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1967,
 					"offsetEnd": 1973,
 					"columnNum": 118
 				},
 				"fieldLength": 7,
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
 					"offsetStart": 1974,
 					"offsetEnd": 1974,
 					"columnNum": 119
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
 					"offsetStart": 1975,
 					"offsetEnd": 1978,
 					"columnNum": 120
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
 					"offsetStart": 1979,
 					"offsetEnd": 1979,
 					"columnNum": 121
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
 					"offsetStart": 1980,
 					"offsetEnd": 1980,
 					"columnNum": 122
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
 					"offsetStart": 1981,
 					"offsetEnd": 1981,
 					"columnNum": 123
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
 					"offsetStart": 1982,
 					"offsetEnd": 1982,
 					"columnNum": 124
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
 					"offsetStart": 1983,
 					"offsetEnd": 1983,
 					"columnNum": 125
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Remote Tester 1",
 				"otherPossibleNames": [],
 				"logicalName": "REMOTE_TESTER_1",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1984,
 					"offsetEnd": 1984,
 					"columnNum": 126
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Remote Tester 2",
 				"otherPossibleNames": [],
 				"logicalName": "REMOTE_TESTER_2",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1985,
 					"offsetEnd": 1985,
 					"columnNum": 127
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Remote Tester 3",
 				"otherPossibleNames": [],
 				"logicalName": "REMOTE_TESTER_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1986,
 					"offsetEnd": 1986,
 					"columnNum": 128
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Remote Tester 4",
 				"otherPossibleNames": [],
 				"logicalName": "REMOTE_TESTER_4",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1987,
 					"offsetEnd": 1987,
 					"columnNum": 129
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "SSR Eligible",
 				"otherPossibleNames": [],
 				"logicalName": "SSR_ELIGIBLE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1988,
 					"offsetEnd": 1988,
 					"columnNum": 130
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Lexile or Quantile Measure",
 				"otherPossibleNames": [],
 				"logicalName": "LEXILE_QUANTILE_MEASURE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1989,
 					"offsetEnd": 1994,
 					"columnNum": 131
 				},
 				"fieldLength": 6,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_4",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 1995,
 					"offsetEnd": 2002,
 					"columnNum": 132
 				},
 				"fieldLength": 8,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_5",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2003,
 					"offsetEnd": 2010,
 					"columnNum": 133
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
 					"offsetStart": 2011,
 					"offsetEnd": 2012,
 					"columnNum": 134
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
 					"offsetStart": 2013,
 					"offsetEnd": 2014,
 					"columnNum": 135
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
 					"offsetStart": 2015,
 					"offsetEnd": 2016,
 					"columnNum": 136
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
 					"offsetStart": 2017,
 					"offsetEnd": 2018,
 					"columnNum": 137
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_6",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2019,
 					"offsetEnd": 2038,
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
 				"logicalName": "BLANK_7",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2019,
 					"offsetEnd": 2038,
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
 				"logicalName": "BLANK_8",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2019,
 					"offsetEnd": 2038,
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
 				"logicalName": "BLANK_9",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2019,
 					"offsetEnd": 2038,
 					"columnNum": 141
 				},
 				"fieldLength": 19,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_10",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2019,
 					"offsetEnd": 2038,
 					"columnNum": 142
 				},
 				"fieldLength": 19,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_11",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2019,
 					"offsetEnd": 2038,
 					"columnNum": 143
 				},
 				"fieldLength": 19,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_12",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2019,
 					"offsetEnd": 2038,
 					"columnNum": 144
 				},
 				"fieldLength": 19,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_13",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2019,
 					"offsetEnd": 2038,
 					"columnNum": 145
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
 					"offsetStart": 2039,
 					"offsetEnd": 2042,
 					"columnNum": 146
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
 					"offsetStart": 2043,
 					"offsetEnd": 2046,
 					"columnNum": 147
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Smarter Scale Scores Error Bands – Min",
 				"otherPossibleNames": [],
 				"logicalName": "SMARTER_SCALE_SCORE_MIN",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2047,
 					"offsetEnd": 2050,
 					"columnNum": 148
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Smarter Scale Scores Error Bands – Max",
 				"otherPossibleNames": [],
 				"logicalName": "SMARTER_SCALE_SCORE_MAX",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2051,
 					"offsetEnd": 2054,
 					"columnNum": 149
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
 					"offsetStart": 2055,
 					"offsetEnd": 2055,
 					"columnNum": 150
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
 					"offsetStart": 2056,
 					"offsetEnd": 2056,
 					"columnNum": 151
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
 					"offsetStart": 2057,
 					"offsetEnd": 2057,
 					"columnNum": 152
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
 					"offsetStart": 2058,
 					"offsetEnd": 2058,
 					"columnNum": 153
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
 					"offsetStart": 2059,
 					"offsetEnd": 2062,
 					"columnNum": 154
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
 					"offsetStart": 2063,
 					"offsetEnd": 2063,
 					"columnNum": 155
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
 					"offsetStart": 2064,
 					"offsetEnd": 2064,
 					"columnNum": 156
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
 					"offsetStart": 2065,
 					"offsetEnd": 2065,
 					"columnNum": 157
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "WER POR Condition Code ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "WER_POR_CONDITION_CODE_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2066,
 					"offsetEnd": 2066,
 					"columnNum": 158
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "WER DEV EEL Condition Code ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "WER_DEV_EEL_CONDITION_CODE_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2067,
 					"offsetEnd": 2067,
 					"columnNum": 159
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "WER COV Condition Code ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "WER_COV_CONDITION_CODE_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2068,
 					"offsetEnd": 2068,
 					"columnNum": 160
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "EAP",
 				"otherPossibleNames": [],
 				"logicalName": "EAP",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2069,
 					"offsetEnd": 2069,
 					"columnNum": 161
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
 					"offsetStart": 2070,
 					"offsetEnd": 2072,
 					"columnNum": 162
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
 					"offsetStart": 2073,
 					"offsetEnd": 2075,
 					"columnNum": 163
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
 					"offsetStart": 2076,
 					"offsetEnd": 2078,
 					"columnNum": 164
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
 					"offsetStart": 2079,
 					"offsetEnd": 2081,
 					"columnNum": 165
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
 					"offsetStart": 2082,
 					"offsetEnd": 2084,
 					"columnNum": 166
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
 					"offsetStart": 2085,
 					"offsetEnd": 2087,
 					"columnNum": 167
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
 					"offsetStart": 2088,
 					"offsetEnd": 2095,
 					"columnNum": 168
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
 					"offsetStart": 2096,
 					"offsetEnd": 2103,
 					"columnNum": 169
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
 					"offsetStart": 2104,
 					"offsetEnd": 2119,
 					"columnNum": 170
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
 					"offsetStart": 2120,
 					"offsetEnd": 2135,
 					"columnNum": 171
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
 					"offsetStart": 2136,
 					"offsetEnd": 2146,
 					"columnNum": 172
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
 					"offsetStart": 2147,
 					"offsetEnd": 2157,
 					"columnNum": 173
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
 					"offsetStart": 2158,
 					"offsetEnd": 2171,
 					"columnNum": 174
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
 					"offsetStart": 2172,
 					"offsetEnd": 2185,
 					"columnNum": 175
 				},
 				"fieldLength": 14,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Embedded Accommodation 1 – Speech-to-Text (Online) ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "EMBEDDED_ACCOMMODATION_1_SPEECH_TO_TEXT_(ONLINE)_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2186,
 					"offsetEnd": 2200,
 					"columnNum": 176
 				},
 				"fieldLength": 15,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Embedded Accommodation 2 – Speech-to-Text (Online) ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "EMBEDDED_ACCOMMODATION_2_SPEECH_TO_TEXT_(ONLINE)_ǂ",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2201,
 					"offsetEnd": 2215,
 					"columnNum": 177
 				},
 				"fieldLength": 15,
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
 					"offsetStart": 2216,
 					"offsetEnd": 2227,
 					"columnNum": 178
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
 					"offsetStart": 2228,
 					"offsetEnd": 2239,
 					"columnNum": 179
 				},
 				"fieldLength": 12,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Accommodation 1 – 100s Number Table (Online or Paper)",
 				"otherPossibleNames": [],
 				"logicalName": "NON_EMBEDDED_ACCOMMODATION_1__100S_NUMBER_TABLE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2240,
 					"offsetEnd": 2249,
 					"columnNum": 180
 				},
 				"fieldLength": 10,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Accommodation 2 – 100s Number Table (Online)",
 				"otherPossibleNames": [],
 				"logicalName": "NON_EMBEDDED_ACCOMMODATION_2__100S_NUMBER_TABLE",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 2250,
 					"offsetEnd": 2259,
 					"columnNum": 181
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
 					"offsetStart": 2260,
 					"offsetEnd": 2269,
 					"columnNum": 182
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
 					"offsetStart": 2270,
 					"offsetEnd": 2279,
 					"columnNum": 183
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
 					"offsetStart": 2280,
 					"offsetEnd": 2289,
 					"columnNum": 184
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
 					"offsetStart": 2290,
 					"offsetEnd": 2299,
 					"columnNum": 185
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
 					"offsetStart": 2300,
 					"offsetEnd": 2312,
 					"columnNum": 186
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
 					"offsetStart": 2313,
 					"offsetEnd": 2325,
 					"columnNum": 187
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
 					"offsetStart": 2326,
 					"offsetEnd": 2338,
 					"columnNum": 188
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
 					"offsetStart": 2339,
 					"offsetEnd": 2351,
 					"columnNum": 189
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
 					"offsetStart": 2352,
 					"offsetEnd": 2357,
 					"columnNum": 190
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
 					"offsetStart": 2358,
 					"offsetEnd": 2363,
 					"columnNum": 191
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
 					"offsetStart": 2364,
 					"offsetEnd": 2369,
 					"columnNum": 192
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
 					"offsetStart": 2370,
 					"offsetEnd": 2375,
 					"columnNum": 193
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
 					"offsetStart": 2376,
 					"offsetEnd": 2386,
 					"columnNum": 194
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
 					"offsetStart": 2387,
 					"offsetEnd": 2394,
 					"columnNum": 195
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
 					"offsetStart": 2395,
 					"offsetEnd": 2402,
 					"columnNum": 196
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
 					"offsetStart": 2403,
 					"offsetEnd": 2408,
 					"columnNum": 197
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
 					"offsetStart": 2409,
 					"offsetEnd": 2414,
 					"columnNum": 198
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
 					"offsetStart": 2415,
 					"offsetEnd": 2420,
 					"columnNum": 199
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
 					"offsetStart": 2421,
 					"offsetEnd": 2445,
 					"columnNum": 200
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
 					"offsetStart": 2446,
 					"offsetEnd": 2470,
 					"columnNum": 201
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
 					"offsetStart": 2471,
 					"offsetEnd": 2495,
 					"columnNum": 202
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
 					"offsetStart": 2496,
 					"offsetEnd": 2520,
 					"columnNum": 203
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
 					"offsetStart": 2521,
 					"offsetEnd": 2534,
 					"columnNum": 204
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
 					"offsetStart": 2535,
 					"offsetEnd": 2550,
 					"columnNum": 205
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
 					"offsetStart": 2551,
 					"offsetEnd": 2566,
 					"columnNum": 206
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
 					"offsetStart": 2567,
 					"offsetEnd": 2573,
 					"columnNum": 207
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
 					"offsetStart": 2574,
 					"offsetEnd":  2580,
 					"columnNum": 208
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
 					"offsetStart": 2581,
 					"offsetEnd": 2598,
 					"columnNum": 209
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
 					"offsetStart": 2599,
 					"offsetEnd": 2616,
 					"columnNum": 210
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
 					"offsetStart": 2617,
 					"offsetEnd": 2634,
 					"columnNum": 211
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
 					"offsetStart": 2635,
 					"offsetEnd": 2652,
 					"columnNum": 212
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
 					"offsetStart": 2653,
 					"offsetEnd": 2664,
 					"columnNum": 213
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
 					"offsetStart": 2665,
 					"offsetEnd": 2676,
 					"columnNum": 214
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
 					"offsetStart": 2677,
 					"offsetEnd": 2688,
 					"columnNum": 215
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
 					"offsetStart": 2689,
 					"offsetEnd": 2700,
 					"columnNum": 216
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
 					"offsetStart": 2701,
 					"offsetEnd": 2719,
 					"columnNum": 217
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
 					"offsetStart": 2720,
 					"offsetEnd": 2738,
 					"columnNum": 218
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
 					"offsetStart": 2739,
 					"offsetEnd": 2757,
 					"columnNum": 219
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
 					"offsetStart": 2758,
 					"offsetEnd": 2776,
 					"columnNum": 220
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
 					"offsetStart": 2777,
 					"offsetEnd": 2788,
 					"columnNum": 221
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
 					"offsetStart": 2789,
 					"offsetEnd": 2800,
 					"columnNum": 222
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
 					"offsetStart": 2801,
 					"offsetEnd": 2812,
 					"columnNum": 223
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
 					"offsetStart": 2813,
 					"offsetEnd": 2824,
 					"columnNum": 224
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
 					"offsetStart": 2825,
 					"offsetEnd": 2840,
 					"columnNum": 225
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
 					"offsetStart": 2841,
 					"offsetEnd": 2856,
 					"columnNum": 226
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
 					"offsetStart": 2857,
 					"offsetEnd": 2872,
 					"columnNum": 227
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
 					"offsetStart": 2873,
 					"offsetEnd": 2888,
 					"columnNum": 228
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
 					"offsetStart": 2889,
 					"offsetEnd": 2895,
 					"columnNum": 229
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
 					"offsetStart": 2896,
 					"offsetEnd": 2902,
 					"columnNum": 230
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
 					"offsetStart": 2903,
 					"offsetEnd": 2909,
 					"columnNum": 231
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
 					"offsetStart": 2910,
 					"offsetEnd": 2916,
 					"columnNum": 232
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
 					"offsetStart": 2917,
 					"offsetEnd": 2925,
 					"columnNum": 233
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
 					"offsetStart": 2926,
 					"offsetEnd": 2934,
 					"columnNum": 234
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
 					"offsetStart": 2935,
 					"offsetEnd": 2943,
 					"columnNum": 235
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
 					"offsetStart": 2944,
 					"offsetEnd": 2952,
 					"columnNum": 236
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
 					"offsetStart": 2953,
 					"offsetEnd": 2955,
 					"columnNum": 237
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
 					"offsetStart": 2956,
 					"offsetEnd": 2958,
 					"columnNum": 238
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
 					"offsetStart": 2959,
 					"offsetEnd": 2966,
 					"columnNum": 239
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
 					"offsetStart": 2967,
 					"offsetEnd": 2974,
 					"columnNum": 240
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
 					"offsetStart": 2975,
 					"offsetEnd": 2982,
 					"columnNum": 241
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
 					"offsetStart": 2983,
 					"offsetEnd": 2990,
 					"columnNum": 242
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
 					"offsetStart": 2991,
 					"offsetEnd": 3015,
 					"columnNum": 243
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
 					"offsetStart": 3016,
 					"offsetEnd": 3040,
 					"columnNum": 244
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
 					"offsetStart": 3041,
 					"offsetEnd": 3078,
 					"columnNum": 245
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
 					"offsetStart": 3079,
 					"offsetEnd": 3116,
 					"columnNum": 246
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
 					"offsetStart": 3117,
 					"offsetEnd": 3119,
 					"columnNum": 247
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
 					"offsetStart": 3120,
 					"offsetEnd": 3122,
 					"columnNum": 248
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
 					"offsetStart": 3123,
 					"offsetEnd": 3125,
 					"columnNum": 249
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
 					"offsetStart": 3126,
 					"offsetEnd": 3128,
 					"columnNum": 250
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
 					"offsetStart": 3129,
 					"offsetEnd": 3139,
 					"columnNum": 251
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
 					"offsetStart": 3140,
 					"offsetEnd": 3150,
 					"columnNum": 252
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
 					"offsetStart": 3151,
 					"offsetEnd": 3161,
 					"columnNum": 253
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
 					"offsetStart": 3162,
 					"offsetEnd": 3172,
 					"columnNum": 254
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
 					"offsetStart": 3173,
 					"offsetEnd": 3184,
 					"columnNum": 255
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
 					"offsetStart": 3185,
 					"offsetEnd": 3196,
 					"columnNum": 256
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
 					"offsetStart": 3197,
 					"offsetEnd": 3208,
 					"columnNum": 257
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
 					"offsetStart": 3209,
 					"offsetEnd": 3220,
 					"columnNum": 258
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
 					"offsetStart": 3221,
 					"offsetEnd": 3227,
 					"columnNum": 259
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
 					"offsetStart": 3228,
 					"offsetEnd": 3234,
 					"columnNum": 260
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
 					"offsetStart": 3235,
 					"offsetEnd": 3243,
 					"columnNum": 261
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
 					"offsetStart": 3244,
 					"offsetEnd": 3250,
 					"columnNum": 262
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
 					"offsetStart": 3251,
 					"offsetEnd": 3257,
 					"columnNum": 263
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
 					"offsetStart": 3258,
 					"offsetEnd": 3264,
 					"columnNum": 264
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
 					"offsetStart": 3265,
 					"offsetEnd": 3271,
 					"columnNum": 265
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
 					"offsetStart": 3272,
 					"offsetEnd": 3278,
 					"columnNum": 266
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
 					"offsetStart": 3279,
 					"offsetEnd": 3285,
 					"columnNum": 267
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
 					"offsetStart": 3286,
 					"offsetEnd": 3292,
 					"columnNum": 268
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
 					"offsetStart": 3293,
 					"offsetEnd": 3299,
 					"columnNum": 269
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
 					"offsetStart": 3300,
 					"offsetEnd": 3307,
 					"columnNum": 270
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
 					"offsetStart": 3308,
 					"offsetEnd": 3315,
 					"columnNum": 271
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
 					"offsetStart": 3316,
 					"offsetEnd": 3323,
 					"columnNum": 272
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
 					"offsetStart": 3324,
 					"offsetEnd": 3331,
 					"columnNum": 273
 				},
 				"fieldLength": 8,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 1 – Medical Supports (Online or Paper)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MEDICAL_SUPPORT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3332,
 					"offsetEnd": 3342,
 					"columnNum": 274
 				},
 				"fieldLength": 11,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 2 – Medical Supports (Online)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MEDICAL_SUPPORT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3343,
 					"offsetEnd": 3353,
 					"columnNum": 275
 				},
 				"fieldLength": 275,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 3 – Medical Supports (Online)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__MEDICAL_SUPPORT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3354,
 					"offsetEnd": 3364,
 					"columnNum": 276
 				},
 				"fieldLength": 276,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 4 – Medical Supports (Online)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__MEDICAL_SUPPORT",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3365,
 					"offsetEnd": 3375,
 					"columnNum": 277
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
 					"offsetStart": 3376,
 					"offsetEnd": 3382,
 					"columnNum": 278
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
 					"offsetStart": 3383,
 					"offsetEnd": 3389,
 					"columnNum": 279
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
 					"offsetStart": 3390,
 					"offsetEnd": 3396,
 					"columnNum": 280
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
 					"offsetStart": 3397,
 					"offsetEnd": 3403,
 					"columnNum": 281
 				},
 				"fieldLength": 7,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 1 – Noise Buffers (Online or Paper)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__NOISE_BUFFERS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3404,
 					"offsetEnd": 3416,
 					"columnNum": 282
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
 					"offsetStart": 3417,
 					"offsetEnd": 3429,
 					"columnNum": 283
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
 					"offsetStart": 3430,
 					"offsetEnd": 3442,
 					"columnNum": 284
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
 					"offsetStart": 3443,
 					"offsetEnd": 3455,
 					"columnNum": 285
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
 					"offsetStart": 3456,
 					"offsetEnd": 3476,
 					"columnNum": 286
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
 					"offsetStart": 3477,
 					"offsetEnd": 3497,
 					"columnNum": 287
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
 					"offsetStart": 3498,
 					"offsetEnd": 3518,
 					"columnNum": 288
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
 					"offsetStart": 3519,
 					"offsetEnd": 3539,
 					"columnNum": 289
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
 					"offsetStart": 3540,
 					"offsetEnd": 3564,
 					"columnNum": 290
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
 					"offsetStart": 3565,
 					"offsetEnd": 3589,
 					"columnNum": 291
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
 					"offsetStart": 3590,
 					"offsetEnd": 3602,
 					"columnNum": 292
 				},
 				"fieldLength": 13,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 1 –Scribe Items (Online or Paper)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SCRIBE_ITEMS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3603,
 					"offsetEnd": 3615,
 					"columnNum": 293
 				},
 				"fieldLength": 13,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 2 – Scribe Items (Online)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SCRIBE_ITEMS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3616,
 					"offsetEnd": 3628,
 					"columnNum": 294
 				},
 				"fieldLength": 13,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 3 – Scribe Items (Online)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__SCRIBE_ITEMS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3629,
 					"offsetEnd": 3641,
 					"columnNum": 295
 				},
 				"fieldLength": 13,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 4 – Scribe Items (Online)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4__SCRIBE_ITEMS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3642,
 					"offsetEnd": 3654,
 					"columnNum": 296
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
 					"offsetStart": 3655,
 					"offsetEnd": 3661,
 					"columnNum": 297
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
 					"offsetStart": 3662,
 					"offsetEnd": 3668,
 					"columnNum": 298
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
 					"offsetStart": 3669,
 					"offsetEnd": 3675,
 					"columnNum": 299
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
 					"offsetStart": 3676,
 					"offsetEnd": 3682,
 					"columnNum": 300
 				},
 				"fieldLength": 7,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 1 – Simplified Test Directions (Online or Paper)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1_SIMPLIFIED_TEST_DIRECTIONS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3683,
 					"offsetEnd": 3695,
 					"columnNum": 301
 				},
 				"fieldLength": 13,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 2 – Simplified Test Directions (Online)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2_SIMPLIFIED_TEST_DIRECTIONS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3696,
 					"offsetEnd": 3708,
 					"columnNum": 302
 				},
 				"fieldLength": 13,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 3 – Simplified Test Directions (Online) ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3_SIMPLIFIED_TEST_DIRECTIONS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3709,
 					"offsetEnd": 3721,
 					"columnNum": 303
 				},
 				"fieldLength": 13,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 4 – Simplified Test Directions (Online) ǂ",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_4_SIMPLIFIED_TEST_DIRECTIONS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3722,
 					"offsetEnd": 3734,
 					"columnNum": 304
 				},
 				"fieldLength": 13,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Support 1 – Translated Test Directions (PDF on CAASPP.org) (Online or Paper)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATED_TEST_DIRECTIONS",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3735,
 					"offsetEnd": 3749,
 					"columnNum": 305
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
 					"offsetStart": 3750,
 					"offsetEnd": 3763,
 					"columnNum": 306
 				},
 				"fieldLength": 14,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Non-Embedded Designated Supports – Translations (Glossary)(Paper)",
 				"otherPossibleNames": [],
 				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__TRANSLATIONS_GLOSSARY",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3764,
 					"offsetEnd": 3801,
 					"columnNum": 307
 				},
 				"fieldLength": 38,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "SSR Eligible Current Year Minus 1",
 				"otherPossibleNames": [],
 				"logicalName": "SSR_ELIGIBLE_MINUS_1",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3802,
 					"offsetEnd": 3802,
 					"columnNum": 308
 				},
 				"fieldLength": 1,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Grade Assessed",
 				"otherPossibleNames": [],
 				"logicalName": "GRADE_ASSESSED_1",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3803,
 					"offsetEnd": 3804,
 					"columnNum": 309
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_14",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3805,
 					"offsetEnd": 3812,
 					"columnNum": 310
 				},
 				"fieldLength": 8,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Standard Error Measurement—SEM Current Year Minus 1",
 				"otherPossibleNames": [],
 				"logicalName": "STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_1",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3813,
 					"offsetEnd": 3816,
 					"columnNum": 311
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
 					"offsetStart": 3817,
 					"offsetEnd": 3820,
 					"columnNum": 312
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Achievement Levels Current Year Minus 1",
 				"otherPossibleNames": [],
 				"logicalName": "ACHIEVEMENT_LEVEL_MINUS_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3821,
 					"offsetEnd": 3821,
 					"columnNum": 313
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
 					"offsetStart": 3822,
 					"offsetEnd": 3825,
 					"columnNum": 314
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_15",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
 					"columnNum": 315
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_16",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
 					"columnNum": 316
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_17",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
 					"columnNum": 317
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_18",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
 					"columnNum": 318
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_19",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
 					"columnNum": 319
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_20",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
 					"columnNum": 320
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_21",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
 					"columnNum": 321
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_22",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
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
 				"logicalName": "BLANK_23",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
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
 				"logicalName": "BLANK_24",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
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
 				"logicalName": "BLANK_25",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3826,
 					"offsetEnd": 3848,
 					"columnNum": 325
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "SSR Eligible Minus 2",
 				"otherPossibleNames": [],
 				"logicalName": "SSR_ELIGIBLE_MINUS_2",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3849,
 					"offsetEnd": 3849,
 					"columnNum": 326
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
 					"offsetStart": 3850,
 					"offsetEnd": 3851,
 					"columnNum": 327
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_26",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3852,
 					"offsetEnd": 3859,
 					"columnNum": 328
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
 					"offsetStart": 3860,
 					"offsetEnd": 3863,
 					"columnNum": 329
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
 					"offsetStart": 3864,
 					"offsetEnd": 3867,
 					"columnNum": 330
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Achievement Levels Year Minus 2",
 				"otherPossibleNames": [],
 				"logicalName": "ACHIEVEMENT_LEVEL_MINUS_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3868,
 					"offsetEnd": 3868,
 					"columnNum": 331
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
 					"offsetStart": 3869,
 					"offsetEnd": 3872,
 					"columnNum": 332
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_27",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 333
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_28",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 334
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_29",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 335
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_30",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 336
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_31",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 337
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_32",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 338
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_33",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 339
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_34",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 340
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_35",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 341
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_36",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 342
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_37",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3873,
 					"offsetEnd": 3895,
 					"columnNum": 343
 				},
 				"fieldLength": 23,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "SSR Eligible Minus 3",
 				"otherPossibleNames": [],
 				"logicalName": "SSR_ELIGIBLE_MINUS_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3896,
 					"offsetEnd": 3896,
 					"columnNum": 344
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
 					"offsetStart": 3897,
 					"offsetEnd": 3898,
 					"columnNum": 345
 				},
 				"fieldLength": 2,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_38",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3899,
 					"offsetEnd": 3906,
 					"columnNum": 346
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
 					"offsetStart": 3907,
 					"offsetEnd": 3910,
 					"columnNum": 347
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
 					"offsetStart": 3911,
 					"offsetEnd": 3914,
 					"columnNum": 348
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Achievement Levels Year Minus 3",
 				"otherPossibleNames": [],
 				"logicalName": "ACHIEVEMENT_LEVEL_MINUS_3",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3915,
 					"offsetEnd": 3915,
 					"columnNum": 349
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
 					"offsetStart": 3916,
 					"offsetEnd": 3919,
 					"columnNum": 350
 				},
 				"fieldLength": 4,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_39",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 351
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_40",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 352
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_41",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 353
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_42",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 354
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_43",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 355
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_44",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 356
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_45",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 357
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_46",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 358
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_47",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 359
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_48",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 360
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_49",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 361
 				},
 				"fieldLength": 36,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_50",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3851,
 					"offsetEnd": 3958,
 					"columnNum": 362
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
 					"offsetStart": 3959,
 					"offsetEnd": 3974,
 					"columnNum": 363
 				},
 				"fieldLength": 16,
 				"expectedValues": [],
 				"dataTypes": "STRING",
 				"scale": 0.0
 			},
 			{
 				"physicalName": "Blank",
 				"otherPossibleNames": [],
 				"logicalName": "BLANK_51",
 				"formatMask": null,
 				"isFieldRequired": "Y",
 				"canBeNull": "Y",
 				"fieldOffset": {
 					"offsetStart": 3975,
 					"offsetEnd": 4034,
 					"columnNum": 364
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
 					"offsetStart": 4035,
 					"offsetEnd": 4036,
 					"columnNum": 365
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