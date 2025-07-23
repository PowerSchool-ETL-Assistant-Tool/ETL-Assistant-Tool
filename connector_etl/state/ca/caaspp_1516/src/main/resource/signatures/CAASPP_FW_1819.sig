{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "CAASPP_FW_1819",
		"recordLength": 2873,
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
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08"],
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
					"offsetEnd": 138,
					"columnNum": 7
				},
				"fieldLength": 6,
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
					"columnNum": 8
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "KN", "UE", "US"],
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
					"columnNum": 9
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
					"columnNum": 10
				},
				"fieldLength": 14,
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
					"offsetStart": 157,
					"offsetEnd": 170,
					"columnNum": 11
				},
				"fieldLength": 14,
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
					"offsetStart": 171,
					"offsetEnd": 174,
					"columnNum": 12
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CALPADS Charter School  Indicator",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 175,
					"offsetEnd": 176,
					"columnNum": 13
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
					"offsetStart": 177,
					"offsetEnd": 183,
					"columnNum": 14
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
					"offsetStart": 184,
					"offsetEnd": 186,
					"columnNum": 15
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Primary Disability Type",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_DISABILITY_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 187,
					"offsetEnd": 189,
					"columnNum": 16
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "IDEA Indicator",
				"otherPossibleNames": [],
				"logicalName": "PP_IDEA_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 190,
					"offsetEnd": 192,
					"columnNum": 17
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
					"offsetStart": 193,
					"offsetEnd": 195,
					"columnNum": 18
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
					"offsetStart": 196,
					"offsetEnd": 198,
					"columnNum": 19
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
					"offsetStart": 199,
					"offsetEnd": 208,
					"columnNum": 20
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
					"offsetStart": 209,
					"offsetEnd": 218,
					"columnNum": 21
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
					"offsetStart": 219,
					"offsetEnd": 228,
					"columnNum": 22
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "English Language Acquisition Status",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 229,
					"offsetEnd": 232,
					"columnNum": 23
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
					"offsetStart": 233,
					"offsetEnd": 235,
					"columnNum": 24
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
					"offsetStart": 236,
					"offsetEnd": 238,
					"columnNum": 25
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
					"offsetStart": 239,
					"offsetEnd": 241,
					"columnNum": 26
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
					"offsetStart": 242,
					"offsetEnd": 244,
					"columnNum": 27
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
					"offsetStart": 245,
					"offsetEnd": 247,
					"columnNum": 28
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Economic Disadvantage Status",
				"otherPossibleNames": [],
				"logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 248,
					"offsetEnd": 250,
					"columnNum": 29
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
					"offsetStart": 251,
					"offsetEnd": 251,
					"columnNum": 30
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
					"offsetStart": 252,
					"offsetEnd": 254,
					"columnNum": 31
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
					"offsetStart": 255,
					"offsetEnd": 257,
					"columnNum": 32
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
					"offsetStart": 258,
					"offsetEnd": 260,
					"columnNum": 33
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
					"offsetStart": 261,
					"offsetEnd": 263,
					"columnNum": 34
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
					"offsetStart": 264,
					"offsetEnd": 266,
					"columnNum": 35
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
					"offsetStart": 267,
					"offsetEnd": 269,
					"columnNum": 36
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
					"offsetStart": 270,
					"offsetEnd": 272,
					"columnNum": 37
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Two or More Races",
				"otherPossibleNames": [],
				"logicalName": "TWO_OR_MORE_RACES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 273,
					"offsetEnd": 275,
					"columnNum": 38
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
					"offsetStart": 276,
					"offsetEnd": 278,
					"columnNum": 39
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
					"offsetStart": 279,
					"offsetEnd": 280,
					"columnNum": 40
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank1",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 281,
					"offsetEnd": 281,
					"columnNum": 41
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
					"offsetStart": 282,
					"offsetEnd": 297,
					"columnNum": 42
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
					"offsetStart": 298,
					"offsetEnd": 298,
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": ["C", "E", "I"],
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
					"offsetStart": 290,
					"offsetEnd": 314,
					"columnNum": 44
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
					"offsetStart": 315,
					"offsetEnd": 315,
					"columnNum": 45
				},
				"fieldLength": 1,
				"expectedValues": ["C", "E", "I"],
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
					"offsetStart": 316,
					"offsetEnd": 331,
					"columnNum": 46
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
					"offsetStart": 332,
					"offsetEnd": 332,
					"columnNum": 47
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
					"offsetStart": 333,
					"offsetEnd": 348,
					"columnNum": 48
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
					"offsetStart": 349,
					"offsetEnd": 448,
					"columnNum": 49
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
					"offsetStart": 449,
					"offsetEnd": 462,
					"columnNum": 50
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
					"offsetStart": 463,
					"offsetEnd": 562,
					"columnNum": 51
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
					"offsetStart": 563,
					"offsetEnd": 576,
					"columnNum": 52
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
					"offsetStart": 577,
					"offsetEnd": 578,
					"columnNum": 53
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter School Code 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 579,
					"offsetEnd": 582,
					"columnNum": 54
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
					"offsetStart": 583,
					"offsetEnd": 583,
					"columnNum": 55
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Paper and Pencil Test Completion Date  (PAPER)",
				"otherPossibleNames": [],
				"logicalName": "PAPER_AND_PENCIL_TEST_COMPLETION_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 584,
					"offsetEnd": 593,
					"columnNum": 56
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
					"offsetStart": 594,
					"offsetEnd": 693,
					"columnNum": 57
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
					"offsetStart": 694,
					"offsetEnd": 707,
					"columnNum": 58
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
					"offsetStart": 708,
					"offsetEnd": 807,
					"columnNum": 59
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
					"offsetStart": 808,
					"offsetEnd": 821,
					"columnNum": 60
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
					"offsetStart": 822,
					"offsetEnd": 823,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter School Code 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 824,
					"offsetEnd": 827,
					"columnNum": 62
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
					"offsetStart": 828,
					"offsetEnd": 828,
					"columnNum": 63
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
					"offsetStart": 829,
					"offsetEnd": 928,
					"columnNum": 64
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
					"offsetStart": 929,
					"offsetEnd": 942,
					"columnNum": 65
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
					"offsetStart": 943,
					"offsetEnd": 1042,
					"columnNum": 66
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
					"offsetStart": 1043,
					"offsetEnd": 1056,
					"columnNum": 67
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
					"offsetStart": 1057,
					"offsetEnd": 1058,
					"columnNum": 68
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Tested Charter School Code 3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1059,
					"offsetEnd": 1062,
					"columnNum": 69
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
					"offsetStart": 1063,
					"offsetEnd": 1063,
					"columnNum": 70
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
					"offsetStart": 1064,
					"offsetEnd": 1073,
					"columnNum": 71
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
					"offsetStart": 1074,
					"offsetEnd": 1083,
					"columnNum": 72
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
					"offsetStart": 1084,
					"offsetEnd": 1093,
					"columnNum": 73
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
					"offsetStart": 1094,
					"offsetEnd": 1103,
					"columnNum": 74
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
					"offsetStart": 1104,
					"offsetEnd": 1113,
					"columnNum": 75
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
					"offsetStart": 1114,
					"offsetEnd": 1123,
					"columnNum": 76
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
					"offsetStart": 1124,
					"offsetEnd": 1133,
					"columnNum": 77
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
					"offsetStart": 1134,
					"offsetEnd": 1143,
					"columnNum": 78
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
					"offsetStart": 1144,
					"offsetEnd": 1153,
					"columnNum": 79
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
					"offsetStart": 1154,
					"offsetEnd": 1163,
					"columnNum": 80
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
					"offsetStart": 1164,
					"offsetEnd": 1173,
					"columnNum": 81
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
					"offsetStart": 1174,
					"offsetEnd": 1183,
					"columnNum": 82
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
					"offsetStart": 1184,
					"offsetEnd": 1187,
					"columnNum": 83
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
					"offsetStart": 1188,
					"offsetEnd": 1197,
					"columnNum": 84
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
					"offsetStart": 1198,
					"offsetEnd": 1207,
					"columnNum": 85
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
					"offsetStart": 1208,
					"offsetEnd": 1208,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CAA Science Percent Correct",
				"otherPossibleNames": ["Blank2"],
				"logicalName": "CAA_SCIENCE_PRECENT_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1209,
					"offsetEnd": 1211,
					"columnNum": 87
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "CAA Science Preliminary Indicator",
				"otherPossibleNames": ["Blank3"],
				"logicalName": "CAA_SCIENCE_PRELIMINARY_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1212,
					"offsetEnd": 1212,
					"columnNum": 88
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
					"offsetStart": 1213,
					"offsetEnd": 1216,
					"columnNum": 89
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
					"offsetStart": 1217,
					"offsetEnd": 1217,
					"columnNum": 90
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
					"offsetStart": 1218,
					"offsetEnd": 1218,
					"columnNum": 91
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Unlisted Resources Construct Change",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCE_CONSTRUCT_CHANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1219,
					"offsetEnd": 1219,
					"columnNum": 92
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Test Mode  –   Online or Paper",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_ONLINE_OR_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1220,
					"offsetEnd": 1220,
					"columnNum": 93
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
					"offsetStart": 1221,
					"offsetEnd": 1221,
					"columnNum": 94
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank4",
				"otherPossibleNames": [],
				"logicalName": "BLANK4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1222,
					"offsetEnd": 1229,
					"columnNum": 95
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Raw Score",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1230,
					"offsetEnd": 1231,
					"columnNum": 96
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank5",
				"otherPossibleNames": [],
				"logicalName": "BLANK5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1232,
					"offsetEnd": 1235,
					"columnNum": 97
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Claim 1 Performance Level",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_CLAIM_1_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1236,
					"offsetEnd": 1236,
					"columnNum": 98
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank6",
				"otherPossibleNames": [],
				"logicalName": "BLANK6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1237,
					"offsetEnd": 1240,
					"columnNum": 99
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Claim 2 Performance Level",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_CLAIM_2_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1241,
					"offsetEnd": 1241,
					"columnNum": 100
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank7",
				"otherPossibleNames": [],
				"logicalName": "BLANK7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1242,
					"offsetEnd": 1245,
					"columnNum": 101
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Claim 3 Performance Level",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_CLAIM_3_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1246,
					"offsetEnd": 1246,
					"columnNum": 102
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank8",
				"otherPossibleNames": [],
				"logicalName": "BLANK8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1247,
					"offsetEnd": 1250,
					"columnNum": 103
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Claim 4 Performance Level",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_CLAIM_4_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1251,
					"offsetEnd": 1251,
					"columnNum": 104
				},
				"fieldLength": 1,
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
					"offsetStart": 1252,
					"offsetEnd": 1255,
					"columnNum": 105
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Standard Error Measurement  –  SEM",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1256,
					"offsetEnd": 1259,
					"columnNum": 106
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Scale Scores Error Bands  –  Min",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_MIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1260,
					"offsetEnd": 1263,
					"columnNum": 107
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Scale Scores Error Bands  –  Max",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_MAX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1264,
					"offsetEnd": 1267,
					"columnNum": 108
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
					"offsetStart": 1268,
					"offsetEnd": 1268,
					"columnNum": 109
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
					"offsetStart": 1269,
					"offsetEnd": 1269,
					"columnNum": 110
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
					"offsetStart": 1270,
					"offsetEnd": 1270,
					"columnNum": 111
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
					"offsetStart": 1271,
					"offsetEnd": 1271,
					"columnNum": 112
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
					"offsetStart": 1272,
					"offsetEnd": 1275,
					"columnNum": 113
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
					"offsetStart": 1276,
					"offsetEnd": 1276,
					"columnNum": 114
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
					"offsetStart": 1277,
					"offsetEnd": 1277,
					"columnNum": 115
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
					"offsetStart": 1278,
					"offsetEnd": 1278,
					"columnNum": 116
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
					"offsetStart": 1279,
					"offsetEnd": 1279,
					"columnNum": 117
				},
				"fieldLength": 1,
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
					"offsetStart": 1280,
					"offsetEnd": 1282,
					"columnNum": 118
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
					"offsetStart": 1283,
					"offsetEnd": 1285,
					"columnNum": 119
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1  –  American Sign Language (Online)(Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_AMERICAN_SIGN_LANGUAGE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1286,
					"offsetEnd": 1293,
					"columnNum": 120
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1  –  Audio Transcript (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_AUDIO_TRANSCRIPT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1294,
					"offsetEnd": 1309,
					"columnNum": 121
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1  –  Braille (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1310,
					"offsetEnd": 1320,
					"columnNum": 122
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1  –  Closed Captioning (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_CLOSED_CAPTIONING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1321,
					"offsetEnd": 1334,
					"columnNum": 123
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 1  –  Text-to-Speech Passages (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_TEXTTOSPEECH_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1335,
					"offsetEnd": 1346,
					"columnNum": 124
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 2  –  American Sign Language (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_AMERICAN_SIGN_LANGUAGE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1347,
					"offsetEnd": 1354,
					"columnNum": 125
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 2  –  Braille (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1355,
					"offsetEnd": 1365,
					"columnNum": 126
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Accommodation 2  –  Text-to-Speech Passages (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_TEXTTOSPEECH_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1366,
					"offsetEnd": 1377,
					"columnNum": 127
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1  –  Abacus (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1378,
					"offsetEnd": 1387,
					"columnNum": 128
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1   –  Additional Instructional Supports for Alternate Assessments (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1388,
					"offsetEnd": 1400,
					"columnNum": 129
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1   –  Alternate Response Options (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1401,
					"offsetEnd": 1406,
					"columnNum": 130
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1  –  Calculator (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_CALCULATOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1407,
					"offsetEnd": 1414,
					"columnNum": 131
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1  –  Multiplication Table  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1415,
					"offsetEnd": 1420,
					"columnNum": 132
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1   –  Print on Demand (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1421,
					"offsetEnd": 1445,
					"columnNum": 133
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1  - Read Aloud Passages (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__READ_ALOUD_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1446,
					"offsetEnd": 1459,
					"columnNum": 134
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1   –  Scribe (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__SCRIBE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1460,
					"offsetEnd": 1475,
					"columnNum": 135
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1   –  Speech-to-Text (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__SPEECHTOTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1476,
					"offsetEnd": 1482,
					"columnNum": 136
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1  –  100s Number Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__100'S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1483,
					"offsetEnd": 1492,
					"columnNum": 137
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1  –  Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1493,
					"offsetEnd": 1510,
					"columnNum": 138
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 1  –  Word Prediction (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_WORD_PREDICTION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1511,
					"offsetEnd": 1522,
					"columnNum": 139
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2  –  Abacus (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1523,
					"offsetEnd": 1532,
					"columnNum": 140
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2   –  Additional Instructional Supports for Alternate Assessments (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1533,
					"offsetEnd": 1545,
					"columnNum": 141
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2   –  Alternate Response Options (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1546,
					"offsetEnd": 1551,
					"columnNum": 142
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2  –  Calculator (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_CALCULATOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1552,
					"offsetEnd": 1559,
					"columnNum": 143
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2  –  Multiplication Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1560,
					"offsetEnd": 1565,
					"columnNum": 144
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2   –  Print on Demand (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1566,
					"offsetEnd": 1590,
					"columnNum": 145
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2   –  Scribe (Writing) (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_SCRIBE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1591,
					"offsetEnd": 1606,
					"columnNum": 146
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2   –  Speech-to-Text  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_SPEECHTOTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1607,
					"offsetEnd": 1613,
					"columnNum": 147
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2   –  Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1614,
					"offsetEnd": 1631,
					"columnNum": 148
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2  –  Word Prediction (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_WORD_PREDICTION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1632,
					"offsetEnd": 1643,
					"columnNum": 149
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 2  –  100s Number Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_100'S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1644,
					"offsetEnd": 1653,
					"columnNum": 150
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3  –  Abacus (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1654,
					"offsetEnd": 1663,
					"columnNum": 151
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3   –  Additional Instructional Supports for Alternate Assessments (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1664,
					"offsetEnd": 1676,
					"columnNum": 152
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3   –  Alternate Response Options (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1677,
					"offsetEnd": 1682,
					"columnNum": 153
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3   –  Print on Demand (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1683,
					"offsetEnd": 1707,
					"columnNum": 154
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3  –  Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1708,
					"offsetEnd": 1725,
					"columnNum": 155
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation 3  –  Word Prediction (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_3_WORD_PREDICTION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1726,
					"offsetEnd": 1737,
					"columnNum": 156
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1738,
					"offsetEnd": 1756,
					"columnNum": 157
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Masking (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1757,
					"offsetEnd": 1768,
					"columnNum": 158
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Mouse Pointer (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1769,
					"offsetEnd": 1784,
					"columnNum": 159
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1785,
					"offsetEnd": 1791,
					"columnNum": 160
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Print Size",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1792,
					"offsetEnd": 1800,
					"columnNum": 161
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1 - Stacked Translations and Translated Test Directions (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1801,
					"offsetEnd": 1803,
					"columnNum": 162
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Streamline(Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1804,
					"offsetEnd": 1811,
					"columnNum": 163
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Text to Speech (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1812,
					"offsetEnd": 1836,
					"columnNum": 164
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Translations (Glossary) (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATIONS_GLOSSARY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1837,
					"offsetEnd": 1874,
					"columnNum": 165
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 1  –  Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1875,
					"offsetEnd": 1877,
					"columnNum": 166
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1878,
					"offsetEnd": 1896,
					"columnNum": 167
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Masking (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1897,
					"offsetEnd": 1908,
					"columnNum": 168
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1909,
					"offsetEnd": 1915,
					"columnNum": 169
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Mouse Pointer (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1916,
					"offsetEnd": 1931,
					"columnNum": 170
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Print Size (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1932,
					"offsetEnd": 1940,
					"columnNum": 171
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Streamline (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1941,
					"offsetEnd": 1948,
					"columnNum": 172
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Stacked Translations and Translated Test Directions (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1949,
					"offsetEnd": 1951,
					"columnNum": 173
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Text to Speech (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1952,
					"offsetEnd": 1976,
					"columnNum": 174
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Translations (Glossary) (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__TRANSLATIONS_GLOSSARY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1977,
					"offsetEnd": 2014,
					"columnNum": 175
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 2  –  Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2015,
					"offsetEnd": 2017,
					"columnNum": 176
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3  –  Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2018,
					"offsetEnd": 2036,
					"columnNum": 177
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 –  Masking (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3__MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2037,
					"offsetEnd": 2048,
					"columnNum": 178
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3  –  Mouse Pointer (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2049,
					"offsetEnd": 2064,
					"columnNum": 179
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3  –  Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3__PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2065,
					"offsetEnd": 2071,
					"columnNum": 180
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3  –  Print Size",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2072,
					"offsetEnd": 2080,
					"columnNum": 181
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3 –  Streamline (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2081,
					"offsetEnd": 2088,
					"columnNum": 182
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Embedded Designated Support 3  –  Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2089,
					"offsetEnd": 2091,
					"columnNum": 183
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Amplification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__AMPLIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2092,
					"offsetEnd": 2103,
					"columnNum": 184
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Bilingual Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__BILINGUAL_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2104,
					"offsetEnd": 2110,
					"columnNum": 185
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Calculator (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2111,
					"offsetEnd": 2119,
					"columnNum": 186
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Color Contrast  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2120,
					"offsetEnd": 2126,
					"columnNum": 187
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Color Overlay (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2127,
					"offsetEnd": 2133,
					"columnNum": 188
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Magnification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2134,
					"offsetEnd": 2141,
					"columnNum": 189
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Medical Device (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MEDICAL_DEVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2142,
					"offsetEnd": 2152,
					"columnNum": 190
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Multiplication Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2153,
					"offsetEnd": 2159,
					"columnNum": 191
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Noise Buffers (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2160,
					"offsetEnd": 2172,
					"columnNum": 192
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Read Aloud Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__READ_ALOUD__ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2173,
					"offsetEnd": 2193,
					"columnNum": 193
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Read Aloud in Spanish (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__READ_ALOUD_IN_SPANISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2194,
					"offsetEnd": 2218,
					"columnNum": 194
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  – Science Charts (State Approved) (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SCIENCE_CHARTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2219,
					"offsetEnd": 2231,
					"columnNum": 195
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Scribe Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2232,
					"offsetEnd": 2244,
					"columnNum": 196
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Separate Setting  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2245,
					"offsetEnd": 2251,
					"columnNum": 197
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Simplified Test Directions  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2252,
					"offsetEnd": 2264,
					"columnNum": 198
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  Translated Test Directions (PDF on CAASPP.org) (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATED_TEST_DIRECTIONS_PDF_BY_SMARTER_BALANCED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2265,
					"offsetEnd": 2278,
					"columnNum": 199
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 1  –  100s Number table  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2279,
					"offsetEnd": 2289,
					"columnNum": 200
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Amplification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__AMPLIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2290,
					"offsetEnd": 2301,
					"columnNum": 201
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Bilingual Dictionary (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__BILINGUAL_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2302,
					"offsetEnd": 2308,
					"columnNum": 202
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2309,
					"offsetEnd": 2315,
					"columnNum": 203
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Color Overlay (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2316,
					"offsetEnd": 2322,
					"columnNum": 204
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Magnification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2323,
					"offsetEnd": 2330,
					"columnNum": 205
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Medical Device (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MEDICAL_DEVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2331,
					"offsetEnd": 2341,
					"columnNum": 206
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Multiplication Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2342,
					"offsetEnd": 2348,
					"columnNum": 207
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Noise Buffers (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2349,
					"offsetEnd": 2361,
					"columnNum": 208
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Read Aloud Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__READ_ALOUD_–_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2362,
					"offsetEnd": 2382,
					"columnNum": 209
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Read Aloud in Spanish (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__READ_ALOUD_IN_SPANISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2383,
					"offsetEnd": 2407,
					"columnNum": 210
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Scribe Items  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2408,
					"offsetEnd": 2420,
					"columnNum": 211
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Separate Setting (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2_SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2421,
					"offsetEnd": 2427,
					"columnNum": 212
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Simplified Test Directions (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SIMPLIFIED_TEST_DIRECTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2428,
					"offsetEnd": 2440,
					"columnNum": 213
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  Translated Test Directions (PDF on CAASPP.org) (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__TRANSLATED_TEST_DIRECTIONS_PDF_BY_SMARTER_BALANCED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2441,
					"offsetEnd": 2454,
					"columnNum": 214
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 2  –  100s Number table  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2455,
					"offsetEnd": 2465,
					"columnNum": 215
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Amplification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__AMPLIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2466,
					"offsetEnd": 2477,
					"columnNum": 216
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Color Contrast  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2478,
					"offsetEnd": 2484,
					"columnNum": 217
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Color Overlay (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2485,
					"offsetEnd": 2491,
					"columnNum": 218
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Magnification (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2492,
					"offsetEnd": 2499,
					"columnNum": 219
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Medical Device (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__MEDICAL_DEVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2500,
					"offsetEnd": 2510,
					"columnNum": 220
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Multiplication Table (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2511,
					"offsetEnd": 2517,
					"columnNum": 221
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Noise Buffers (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2518,
					"offsetEnd": 2530,
					"columnNum": 222
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Read Aloud Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__READ_ALOUD_–_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2531,
					"offsetEnd": 2551,
					"columnNum": 223
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  Scribe Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2552,
					"offsetEnd": 2564,
					"columnNum": 224
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3 –  Separate Setting (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3_SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2565,
					"offsetEnd": 2571,
					"columnNum": 225
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Support 3  –  100s Number table  (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_3__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2572,
					"offsetEnd": 2582,
					"columnNum": 226
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper)  –  Abacus",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__ABACUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2583,
					"offsetEnd": 2583,
					"columnNum": 227
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper)  –  Alternate Response Options",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__ALTERNATE_RESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2584,
					"offsetEnd": 2584,
					"columnNum": 228
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation  (Paper)  –  Braille",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2585,
					"offsetEnd": 2585,
					"columnNum": 229
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation  (Paper)  –  Calculator",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2586,
					"offsetEnd": 2586,
					"columnNum": 230
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation  (Paper)  –  Large-print",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__LARGEPRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2587,
					"offsetEnd": 2587,
					"columnNum": 231
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) –  Multiplication Table",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2588,
					"offsetEnd": 2588,
					"columnNum": 232
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper)  –  Read Aloud Passages",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__READ_ALOUD_PASSAGES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2589,
					"offsetEnd": 2589,
					"columnNum": 233
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Scribe",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__SCRIBE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2590,
					"offsetEnd": 2590,
					"columnNum": 234
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation  (Paper)  –  Speech-to-Text",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__SPEECHTOTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2591,
					"offsetEnd": 2591,
					"columnNum": 235
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper)  –  100s Number Table",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2592,
					"offsetEnd": 2592,
					"columnNum": 236
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper)  –  Bilingual Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__BILINGUAL_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2593,
					"offsetEnd": 2593,
					"columnNum": 237
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper)  –  Medical Device",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__MEDICAL_DEVICE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2594,
					"offsetEnd": 2594,
					"columnNum": 238
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports  (Paper)  –  Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2595,
					"offsetEnd": 2595,
					"columnNum": 239
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports  (Paper)  –  Scribe",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SCRIBE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2596,
					"offsetEnd": 2596,
					"columnNum": 240
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports  (Paper)  –  Separate Setting",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2597,
					"offsetEnd": 2597,
					"columnNum": 241
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper)  –  Simplified Test Directions",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SIMPLIFIED_TESTDIRECTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2598,
					"offsetEnd": 2598,
					"columnNum": 242
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper)  –  Translated Test Directions",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__TRANSLATEDTEST_DIRECTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2599,
					"offsetEnd": 2599,
					"columnNum": 243
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper)  –  Translations (Glossary)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__TRANSLATIONS_GLOSSARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2600,
					"offsetEnd": 2635,
					"columnNum": 244
				},
				"fieldLength": 36,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Non-embedded Universal Tools (Paper)  –  English Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_UNIVERSAL_TOOLS_PAPER__ENGLISH_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2636,
					"offsetEnd": 2636,
					"columnNum": 245
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number of Items attempted 1",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2637,
					"offsetEnd": 2639,
					"columnNum": 246
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number of Items attempted 2",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2640,
					"offsetEnd": 2642,
					"columnNum": 247
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Number of Items attempted 3",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2643,
					"offsetEnd": 2645,
					"columnNum": 248
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Assessed Current Year minus 1",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2646,
					"offsetEnd": 2647,
					"columnNum": 249
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank9",
				"otherPossibleNames": [],
				"logicalName": "BLANK9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2648,
					"offsetEnd": 2655,
					"columnNum": 250
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Standard Error Measurement  - SEM Current Year minus 1",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2656,
					"offsetEnd": 2659,
					"columnNum": 251
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Scores Current Year minus 1",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2660,
					"offsetEnd": 2663,
					"columnNum": 252
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Condition Code Current Year minus 1",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2664,
					"offsetEnd": 2667,
					"columnNum": 253
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank10",
				"otherPossibleNames": [],
				"logicalName": "BLANK10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2668,
					"offsetEnd": 2671,
					"columnNum": 254
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank11",
				"otherPossibleNames": [],
				"logicalName": "BLANK11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2672,
					"offsetEnd": 2674,
					"columnNum": 255
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank12",
				"otherPossibleNames": [],
				"logicalName": "BLANK12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2675,
					"offsetEnd": 2675,
					"columnNum": 256
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank13",
				"otherPossibleNames": [],
				"logicalName": "BLANK13",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2676,
					"offsetEnd": 2678,
					"columnNum": 257
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank14",
				"otherPossibleNames": [],
				"logicalName": "BLANK14",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2679,
					"offsetEnd": 2679,
					"columnNum": 258
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank15",
				"otherPossibleNames": [],
				"logicalName": "BLANK15",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2680,
					"offsetEnd": 2682,
					"columnNum": 259
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank16",
				"otherPossibleNames": [],
				"logicalName": "BLANK16",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2683,
					"offsetEnd": 2683,
					"columnNum": 260
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank17",
				"otherPossibleNames": [],
				"logicalName": "BLANK17",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2684,
					"offsetEnd": 2687,
					"columnNum": 261
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Grade Assessed Current Year minus 2",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2688,
					"offsetEnd": 2689,
					"columnNum": 262
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank18",
				"otherPossibleNames": [],
				"logicalName": "BLANK18",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2690,
					"offsetEnd": 2697,
					"columnNum": 263
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Standard Error Measurement   –  SEM Current Year minus 2",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT__SEM_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2698,
					"offsetEnd": 2701,
					"columnNum": 264
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Score Current Year minus 2",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2702,
					"offsetEnd": 2705,
					"columnNum": 265
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Condition Code Current Year minus 2",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2706,
					"offsetEnd": 2709,
					"columnNum": 266
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank19",
				"otherPossibleNames": [],
				"logicalName": "BLANK19",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2710,
					"offsetEnd": 2711,
					"columnNum": 267
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank20",
				"otherPossibleNames": [],
				"logicalName": "BLANK20",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2712,
					"offsetEnd": 2715,
					"columnNum": 268
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank21",
				"otherPossibleNames": [],
				"logicalName": "BLANK21",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2716,
					"offsetEnd": 2716,
					"columnNum": 269
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank22",
				"otherPossibleNames": [],
				"logicalName": "BLANK22",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2717,
					"offsetEnd": 2720,
					"columnNum": 270
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank23",
				"otherPossibleNames": [],
				"logicalName": "BLANK23",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2721,
					"offsetEnd": 2721,
					"columnNum": 271
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank24",
				"otherPossibleNames": [],
				"logicalName": "BLANK24",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2722,
					"offsetEnd": 2725,
					"columnNum": 272
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank25",
				"otherPossibleNames": [],
				"logicalName": "BLANK25",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2726,
					"offsetEnd": 2726,
					"columnNum": 273
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank26",
				"otherPossibleNames": [],
				"logicalName": "BLANK26",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2727,
					"offsetEnd": 2729,
					"columnNum": 274
				},
				"fieldLength": 3,
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
					"offsetStart": 2730,
					"offsetEnd": 2731,
					"columnNum": 275
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank27",
				"otherPossibleNames": [],
				"logicalName": "BLANK27",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2732,
					"offsetEnd": 2739,
					"columnNum": 276
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Smarter Standard Error Measurement   –  SEM Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT__SEM_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2740,
					"offsetEnd": 2743,
					"columnNum": 277
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Scale Score Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2744,
					"offsetEnd": 2747,
					"columnNum": 278
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Condition Code Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2748,
					"offsetEnd": 2751,
					"columnNum": 279
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank28",
				"otherPossibleNames": [],
				"logicalName": "BLANK28",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2752,
					"offsetEnd": 2752,
					"columnNum": 280
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank29",
				"otherPossibleNames": [],
				"logicalName": "BLANK29",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2753,
					"offsetEnd": 2756,
					"columnNum": 281
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank30",
				"otherPossibleNames": [],
				"logicalName": "BLANK30",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2757,
					"offsetEnd": 2757,
					"columnNum": 282
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank31",
				"otherPossibleNames": [],
				"logicalName": "BLANK31",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2758,
					"offsetEnd": 2761,
					"columnNum": 283
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank32",
				"otherPossibleNames": [],
				"logicalName": "BLANK32",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2762,
					"offsetEnd": 2762,
					"columnNum": 284
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank33",
				"otherPossibleNames": [],
				"logicalName": "BLANK33",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2763,
					"offsetEnd": 2766,
					"columnNum": 285
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank34",
				"otherPossibleNames": [],
				"logicalName": "BLANK34",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2767,
					"offsetEnd": 2767,
					"columnNum": 286
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank35",
				"otherPossibleNames": [],
				"logicalName": "BLANK35",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2768,
					"offsetEnd": 2771,
					"columnNum": 287
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Growth Score",
				"otherPossibleNames": [],
				"logicalName": "GROWTH_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2772,
					"offsetEnd": 2779,
					"columnNum": 288
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank36",
				"otherPossibleNames": [],
				"logicalName": "BLANK36",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2780,
					"offsetEnd": 2795,
					"columnNum": 289
				},
				"fieldLength": 16,
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
					"offsetStart": 2796,
					"offsetEnd": 2811,
					"columnNum": 290
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": 0.0
			},
			{
				"physicalName": "Blank37",
				"otherPossibleNames": [],
				"logicalName": "BLANK37",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2812,
					"offsetEnd": 2871,
					"columnNum": 291
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
					"offsetStart": 2872,
					"offsetEnd": 2873,
					"columnNum": 292
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