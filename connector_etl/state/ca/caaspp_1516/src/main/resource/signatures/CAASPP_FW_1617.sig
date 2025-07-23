{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "CAASPP_FW_1617",
		"recordLength": 2101,
		"naturalKey": [],
		"fields": [{
				"physicalName": "Record Type",
				"otherPossibleNames": [],
				"logicalName": "RECORD_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 2,
					"columnNum": 1
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08"],
				"dataTypes": "INTEGER",
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
				"physicalName": "Statewide Student Identifier (SSID)",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 19,
					"offsetEnd": 28,
					"columnNum": 3
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
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
					"offsetStart": 29,
					"offsetEnd": 78,
					"columnNum": 4
				},
				"fieldLength": 50,
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
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 79,
					"offsetEnd": 108,
					"columnNum": 5
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Middle Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 109,
					"offsetEnd": 138,
					"columnNum": 6
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Date of Birth",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 139,
					"offsetEnd": 148,
					"columnNum": 7
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Date of Birth - Year",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB_YEAR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 139,
					"offsetEnd": 142,
					"columnNum": 8
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Date of Birth - Month",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB_MONTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 144,
					"offsetEnd": 145,
					"columnNum": 9
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Date of Birth - Day",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_DOB_DAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 147,
					"offsetEnd": 148,
					"columnNum": 10
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 149,
					"offsetEnd": 154,
					"columnNum": 11
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADS Grade",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 155,
					"offsetEnd": 156,
					"columnNum": 12
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "KN", "UE", "US"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADS District Code",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 157,
					"offsetEnd": 170,
					"columnNum": 13
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
					"offsetStart": 171,
					"offsetEnd": 184,
					"columnNum": 14
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
					"offsetStart": 185,
					"offsetEnd": 188,
					"columnNum": 15
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "County/District Code of Accountability",
				"otherPossibleNames": [],
				"logicalName": "COUNTY_DISTRICT_CODE_OF_ACCOUNTABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 189,
					"offsetEnd": 195,
					"columnNum": 16
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Section 504 Status",
				"otherPossibleNames": [],
				"logicalName": "PP_SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 196,
					"offsetEnd": 198,
					"columnNum": 17
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
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
					"offsetStart": 199,
					"offsetEnd": 201,
					"columnNum": 18
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IDEA Indicator",
				"otherPossibleNames": [],
				"logicalName": "PP_IDEA_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 202,
					"offsetEnd": 204,
					"columnNum": 19
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MigrantStatus",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 205,
					"offsetEnd": 207,
					"columnNum": 20
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEP (Limited English Proficient) Status",
				"otherPossibleNames": [],
				"logicalName": "LEP_LIMITED_ENGLISH_PROFICIENT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 208,
					"offsetEnd": 210,
					"columnNum": 21
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LEP (Limited English Proficient) Entry Date",
				"otherPossibleNames": [],
				"logicalName": "LEP_ENTRY_DATE",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 211,
					"offsetEnd": 220,
					"columnNum": 22
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "RFEP Date",
				"otherPossibleNames": [],
				"logicalName": "LEP_EXIT_DATE",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 221,
					"offsetEnd": 230,
					"columnNum": 23
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "First Entry Date in US School",
				"otherPossibleNames": [],
				"logicalName": "FIRST_DATE_IN_US_SCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 231,
					"offsetEnd": 240,
					"columnNum": 24
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English Language Acquisition Status",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 241,
					"offsetEnd": 244,
					"columnNum": 25
				},
				"fieldLength": 4,
				"expectedValues": ["EO  ", "IFEP", "EL  ", "RFEP", "TBD "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Language Code",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 245,
					"offsetEnd": 247,
					"columnNum": 26
				},
				"fieldLength": 3,
				"expectedValues": [],
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
					"offsetStart": 248,
					"offsetEnd": 250,
					"columnNum": 27
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
				"dataTypes": "STRING",
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
					"offsetStart": 251,
					"offsetEnd": 251,
					"columnNum": 28
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N "],
				"dataTypes": "STRING",
				"scale": null
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
					"columnNum": 29
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
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
					"offsetStart": 255,
					"offsetEnd": 257,
					"columnNum": 30
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
				"dataTypes": "STRING",
				"scale": null
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
					"columnNum": 31
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
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
					"offsetStart": 261,
					"offsetEnd": 263,
					"columnNum": 32
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
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
					"offsetStart": 264,
					"offsetEnd": 266,
					"columnNum": 33
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
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
					"offsetStart": 267,
					"offsetEnd": 269,
					"columnNum": 34
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
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
					"offsetStart": 270,
					"offsetEnd": 272,
					"columnNum": 35
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
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
					"offsetStart": 273,
					"offsetEnd": 275,
					"columnNum": 36
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
				"dataTypes": "STRING",
				"scale": null
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
					"columnNum": 37
				},
				"fieldLength": 3,
				"expectedValues": ["100", "200", "600", "400", "500", "300", "700", "800"],
				"dataTypes": "INTEGER",
				"scale": null
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
					"columnNum": 38
				},
				"fieldLength": 2,
				"expectedValues": ["10", "11", "12", "13", "14", "15"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 281,
					"offsetEnd": 281,
					"columnNum": 39
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
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
					"columnNum": 40
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
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
					"columnNum": 41
				},
				"fieldLength": 1,
				"expectedValues": ["C", "E", "I"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity ID 2",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 299,
					"offsetEnd": 314,
					"columnNum": 42
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
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
					"columnNum": 43
				},
				"fieldLength": 1,
				"expectedValues": ["C", "E", "I"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Grade Assessed",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 316,
					"offsetEnd": 317,
					"columnNum": 44
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Test Registration ID",
				"otherPossibleNames": [],
				"logicalName": "ENROLLMENT_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 318,
					"offsetEnd": 333,
					"columnNum": 45
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested LEA Name 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 334,
					"offsetEnd": 433,
					"columnNum": 46
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested County/District Code 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 434,
					"offsetEnd": 447,
					"columnNum": 47
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested School Name 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 448,
					"offsetEnd": 547,
					"columnNum": 48
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Code 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 548,
					"offsetEnd": 561,
					"columnNum": 49
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Directly Funded Indicator 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 562,
					"offsetEnd": 563,
					"columnNum": 50
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Code 1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 564,
					"offsetEnd": 567,
					"columnNum": 51
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Paper and Pencil Test Completion Date (PAPER)",
				"otherPossibleNames": [],
				"logicalName": "PAPER_AND_PENCIL_TEST_COMPLETION_DATE",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 568,
					"offsetEnd": 577,
					"columnNum": 52
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Scanned Date (PAPER)",
				"otherPossibleNames": [],
				"logicalName": "SCANNED_DATE",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 578,
					"offsetEnd": 587,
					"columnNum": 53
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Tested LEA Name 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 588,
					"offsetEnd": 687,
					"columnNum": 54
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested County/District Code 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 688,
					"offsetEnd": 701,
					"columnNum": 55
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested School Name 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 702,
					"offsetEnd": 801,
					"columnNum": 56
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Code 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 802,
					"offsetEnd": 815,
					"columnNum": 57
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Directly Funded Indicator 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 816,
					"offsetEnd": 817,
					"columnNum": 58
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Code 2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 818,
					"offsetEnd": 821,
					"columnNum": 59
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Test Start Date 1",
				"otherPossibleNames": [],
				"logicalName": "TEST_START_DATE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 822,
					"offsetEnd": 831,
					"columnNum": 60
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Completion Date 1",
				"otherPossibleNames": [],
				"logicalName": "TEST_COMPLETION_DATE_1",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 832,
					"offsetEnd": 841,
					"columnNum": 61
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Test Start Date 2",
				"otherPossibleNames": [],
				"logicalName": "TEST_START_DATE_2",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 842,
					"offsetEnd": 851,
					"columnNum": 62
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Test Completion Date 2",
				"otherPossibleNames": [],
				"logicalName": "TEST_COMPLETION_DATE_2",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 852,
					"offsetEnd": 861,
					"columnNum": 63
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "School Selected Start of Test Window 1",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 862,
					"offsetEnd": 871,
					"columnNum": 64
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "School Selected End of Test Window 1",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 872,
					"offsetEnd": 881,
					"columnNum": 65
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "School Selected Start of Test Window 2",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW_2",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 882,
					"offsetEnd": 891,
					"columnNum": 66
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "School Selected End of Test Window 2",
				"otherPossibleNames": [],
				"logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW_2",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 892,
					"offsetEnd": 901,
					"columnNum": 67
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Student Exit Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 902,
					"offsetEnd": 905,
					"columnNum": 68
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Exit Withdrawal date",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_DATE",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 906,
					"offsetEnd": 915,
					"columnNum": 69
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Student removed from CALPADS file date",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
				"formatMask": "YYYY-MM-DD",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 916,
					"offsetEnd": 925,
					"columnNum": 70
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "DATE",
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
					"offsetStart": 926,
					"offsetEnd": 929,
					"columnNum": 71
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Attemptedness",
				"otherPossibleNames": [],
				"logicalName": "ATTEMPTEDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 930,
					"offsetEnd": 930,
					"columnNum": 72
				},
				"fieldLength": 1,
				"expectedValues": ["N", "P", "Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Score Status",
				"otherPossibleNames": [],
				"logicalName": "SCORE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 931,
					"offsetEnd": 931,
					"columnNum": 73
				},
				"fieldLength": 1,
				"expectedValues": ["I", "V"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unlisted Resource Construct Change",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCE_CONSTRUCT_CHANGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 932,
					"offsetEnd": 932,
					"columnNum": 74
				},
				"fieldLength": 1,
				"expectedValues": ["Y", "N "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Mode - Online or Paper",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_ONLINE_OR_PAPER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 933,
					"offsetEnd": 933,
					"columnNum": 75
				},
				"fieldLength": 1,
				"expectedValues": ["O", "P"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Include Indicator",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 934,
					"offsetEnd": 934,
					"columnNum": 76
				},
				"fieldLength": 1,
				"expectedValues": ["N", "E", "T", "R", "Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 935,
					"offsetEnd": 942,
					"columnNum": 77
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Raw Score",
				"otherPossibleNames": [],
				"logicalName": "RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 943,
					"offsetEnd": 944,
					"columnNum": 78
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 945,
					"offsetEnd": 948,
					"columnNum": 79
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Smarter Claim 1 Performance Level",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_CLAIM_1_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 949,
					"offsetEnd": 949,
					"columnNum": 80
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "9"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 950,
					"offsetEnd": 953,
					"columnNum": 81
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Smarter Claim 2 Performance Level",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_CLAIM_2_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 954,
					"offsetEnd": 954,
					"columnNum": 82
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "9"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 955,
					"offsetEnd": 958,
					"columnNum": 83
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Smarter Claim 3 Performance Level",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_CLAIM_3_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 959,
					"offsetEnd": 959,
					"columnNum": 84
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "9"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 960,
					"offsetEnd": 963,
					"columnNum": 85
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Smarter Claim 4 Performance Level",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_CLAIM_4_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 964,
					"offsetEnd": 964,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3", "9"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "ScaleScore",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 965,
					"offsetEnd": 968,
					"columnNum": 87
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Smarter Standard Error Measurement - SEM",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 969,
					"offsetEnd": 972,
					"columnNum": 88
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Smarter Scale Scores Error Bands- Min",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_MIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 973,
					"offsetEnd": 976,
					"columnNum": 89
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Smarter Scale Scores Error Bands- Max",
				"otherPossibleNames": [],
				"logicalName": "STANDARD_ERROR_MEASUREMENT_MAX",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 977,
					"offsetEnd": 980,
					"columnNum": 90
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Performance Level",
				"otherPossibleNames": [],
				"logicalName": "PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 981,
					"offsetEnd": 981,
					"columnNum": 91
				},
				"fieldLength": 1,
				"expectedValues": ["5", "4", "3", "2", "1", "9"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Achievement Levels",
				"otherPossibleNames": [],
				"logicalName": "ACHIEVEMENT_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 982,
					"offsetEnd": 982,
					"columnNum": 92
				},
				"fieldLength": 1,
				"expectedValues": ["4", "3", "2", "1", "9"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "EAP - Student Authorized ETS to Release Results to CSU and / or California Community Colleges",
				"otherPossibleNames": [],
				"logicalName": "EAP_STUDENT_AUTHORIZED_ETS_TO_RELEASE_RESULTS_TO_COLLEGES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 983,
					"offsetEnd": 983,
					"columnNum": 93
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Accommodations Available Indicator",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATIONS_AVAILABLE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 984,
					"offsetEnd": 984,
					"columnNum": 94
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No  "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 1 - American Sign Language (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_AMERICAN_SIGN_LANGUAGE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 987,
					"offsetEnd": 994,
					"columnNum": 95
				},
				"fieldLength": 8,
				"expectedValues": ["TDS_ASL1"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 1 - Braille (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 995,
					"offsetEnd": 1005,
					"columnNum": 96
				},
				"fieldLength": 11,
				"expectedValues": ["ENU-Braille"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 1 - Closed Captioning (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_CLOSED_CAPTIONING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1006,
					"offsetEnd": 1019,
					"columnNum": 97
				},
				"fieldLength": 14,
				"expectedValues": ["TDS_ClosedCap1"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 1 - Streamlined (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_STREAMLINED_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1020,
					"offsetEnd": 1027,
					"columnNum": 98
				},
				"fieldLength": 8,
				"expectedValues": ["TDS_SLM1"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 1 - Text-to-Speech Passages (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_1_TEXTTOSPEECH_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1028,
					"offsetEnd": 1039,
					"columnNum": 99
				},
				"fieldLength": 12,
				"expectedValues": ["TDS_TTS_Stim"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 2 - American Sign Language (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_AMERICAN_SIGN_LANGUAGE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1040,
					"offsetEnd": 1047,
					"columnNum": 100
				},
				"fieldLength": 8,
				"expectedValues": ["TDS_ASL1"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 2 - Braille (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1048,
					"offsetEnd": 1058,
					"columnNum": 101
				},
				"fieldLength": 11,
				"expectedValues": ["ENU-Braille"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 2 - Streamline (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1059,
					"offsetEnd": 1066,
					"columnNum": 102
				},
				"fieldLength": 8,
				"expectedValues": ["TDS_SLM1"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodation 2 - Text-to-Speech Passages (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATION_2_TEXTTOSPEECH_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1067,
					"offsetEnd": 1078,
					"columnNum": 103
				},
				"fieldLength": 12,
				"expectedValues": ["TDS_TTS_Stim"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1- Abacus (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1079,
					"offsetEnd": 1088,
					"columnNum": 104
				},
				"fieldLength": 10,
				"expectedValues": ["NEA_Abacus"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1- Additional Instructional Supportsfor Alternate Assessments",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1089,
					"offsetEnd": 1101,
					"columnNum": 105
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1- Alternate Response Options (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1102,
					"offsetEnd": 1107,
					"columnNum": 106
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1- Calculator (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_CALCULATOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1108,
					"offsetEnd": 1115,
					"columnNum": 107
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1- Mathematics Tools",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_MATHEMATICS_TOOLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1116,
					"offsetEnd": 1128,
					"columnNum": 108
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1- Multiplication Table",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1129,
					"offsetEnd": 1134,
					"columnNum": 109
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1- Print on Demand",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1135,
					"offsetEnd": 1159,
					"columnNum": 110
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 - Read Aloud Passages (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__READ_ALOUD_PASSAGES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1160,
					"offsetEnd": 1173,
					"columnNum": 111
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 - Scribe (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__SCRIBE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1174,
					"offsetEnd": 1189,
					"columnNum": 112
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 - Speech-to-Text",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__SPEECHTOTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1190,
					"offsetEnd": 1196,
					"columnNum": 113
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1 - 100's Number Table",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1__100'S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1197,
					"offsetEnd": 1206,
					"columnNum": 114
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 1- Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_1_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1207,
					"offsetEnd": 1224,
					"columnNum": 115
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- Abacus (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_ABACUS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1225,
					"offsetEnd": 1234,
					"columnNum": 116
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- Alternate Response Options (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1235,
					"offsetEnd": 1240,
					"columnNum": 117
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- Calculator (Online",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_CALCULATOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1241,
					"offsetEnd": 1248,
					"columnNum": 118
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- Multiplication Table",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1249,
					"offsetEnd": 1254,
					"columnNum": 119
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- Print on Demand",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_PRINT_ON_DEMAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1255,
					"offsetEnd": 1279,
					"columnNum": 120
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- Scribe (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_SCRIBE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1280,
					"offsetEnd": 1295,
					"columnNum": 121
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- Speech-to-Text",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_SPEECHTOTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1296,
					"offsetEnd": 1302,
					"columnNum": 122
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- Unlisted Resources (Online)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1303,
					"offsetEnd": 1320,
					"columnNum": 123
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation 2- 100's Number Table",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_2_100'S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1321,
					"offsetEnd": 1330,
					"columnNum": 124
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 1- Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1331,
					"offsetEnd": 1349,
					"columnNum": 125
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 1- Masking (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1350,
					"offsetEnd": 1361,
					"columnNum": 126
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 1- Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1362,
					"offsetEnd": 1368,
					"columnNum": 127
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 1 - Print Size",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1369,
					"offsetEnd": 1377,
					"columnNum": 128
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 1 - Stacked Translations and Translated Test Directions (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1378,
					"offsetEnd": 1380,
					"columnNum": 129
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 1 - Text to Speech (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1381,
					"offsetEnd": 1405,
					"columnNum": 130
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 1 - Translations (Glossary) (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATIONS_GLOSSARY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1406,
					"offsetEnd": 1443,
					"columnNum": 131
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 1- Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1444,
					"offsetEnd": 1446,
					"columnNum": 132
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 2- Color Contrast (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1447,
					"offsetEnd": 1465,
					"columnNum": 133
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 2 - Masking (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1466,
					"offsetEnd": 1477,
					"columnNum": 134
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 2 - Permissive Mode (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1478,
					"offsetEnd": 1484,
					"columnNum": 135
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 2 - Print Size",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__PRINT_SIZE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1485,
					"offsetEnd": 1493,
					"columnNum": 136
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 2 - Stacked Translations and Translated Test Directions (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1494,
					"offsetEnd": 1496,
					"columnNum": 137
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 2 - Text to Speech (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1497,
					"offsetEnd": 1521,
					"columnNum": 138
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 2 - Translations (Glossary) (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__TRANSLATIONS_GLOSSARY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1522,
					"offsetEnd": 1559,
					"columnNum": 139
				},
				"fieldLength": 38,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Support 2- Turn off Universal Tools (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1560,
					"offsetEnd": 1562,
					"columnNum": 140
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Color Contrast",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1563,
					"offsetEnd": 1569,
					"columnNum": 141
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Color Overlay",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1570,
					"offsetEnd": 1576,
					"columnNum": 142
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Magnification",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1577,
					"offsetEnd": 1584,
					"columnNum": 143
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Noise Buffers",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1585,
					"offsetEnd": 1597,
					"columnNum": 144
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Read Aloud - Items",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__READ_ALOUD__ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1598,
					"offsetEnd": 1618,
					"columnNum": 145
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Read Aloud in Spanish",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__READ_ALOUD_IN_SPANISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1619,
					"offsetEnd": 1643,
					"columnNum": 146
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Scribe Items (Non-Writing)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1644,
					"offsetEnd": 1659,
					"columnNum": 147
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Separate Setting",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1660,
					"offsetEnd": 1666,
					"columnNum": 148
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Simplified Test Directions",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SIMPLIFIED_TEST_DIRECTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1667,
					"offsetEnd": 1679,
					"columnNum": 149
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 1 - Translated Test Directions (PDF by Smarter Balanced)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATED_TEST_DIRECTIONS_PDF_BY_SMARTER_BALANCED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1680,
					"offsetEnd": 1693,
					"columnNum": 150
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Bilingual Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__BILINGUAL_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1694,
					"offsetEnd": 1700,
					"columnNum": 151
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Color Contrast",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__COLOR_CONTRAST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1701,
					"offsetEnd": 1707,
					"columnNum": 152
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Color Overlay",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__COLOR_OVERLAY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1708,
					"offsetEnd": 1714,
					"columnNum": 153
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Magnification",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MAGNIFICATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1715,
					"offsetEnd": 1722,
					"columnNum": 154
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Noise Buffers",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__NOISE_BUFFERS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1723,
					"offsetEnd": 1735,
					"columnNum": 155
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Read Aloud – Items",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__READ_ALOUD_–_ITEMS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1736,
					"offsetEnd": 1756,
					"columnNum": 156
				},
				"fieldLength": 21,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Read Aloud in Spanish",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__READ_ALOUD_IN_SPANISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1757,
					"offsetEnd": 1781,
					"columnNum": 157
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Scribe Items (Non-Writing)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SCRIBE_ITEMS_NONWRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1782,
					"offsetEnd": 1797,
					"columnNum": 158
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Separate Setting",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2_SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1798,
					"offsetEnd": 1804,
					"columnNum": 159
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Simplified Test Directions",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SIMPLIFIED_TEST_DIRECTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1805,
					"offsetEnd": 1817,
					"columnNum": 160
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Support 2 - Translated Test Directions (PDF by Smarter Balanced)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__TRANSLATED_TEST_DIRECTIONS_PDF_BY_SMARTER_BALANCED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1818,
					"offsetEnd": 1831,
					"columnNum": 161
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Abacus",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__ABACUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1832,
					"offsetEnd": 1832,
					"columnNum": 162
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Alternate Response",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__ALTERNATE_RESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1833,
					"offsetEnd": 1833,
					"columnNum": 163
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - American Sign Language",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__AMERICAN_SIGN_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1834,
					"offsetEnd": 1834,
					"columnNum": 164
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Braille",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__BRAILLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1835,
					"offsetEnd": 1835,
					"columnNum": 165
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Calculator",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__CALCULATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1836,
					"offsetEnd": 1836,
					"columnNum": 166
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Large-print",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__LARGEPRINT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1837,
					"offsetEnd": 1837,
					"columnNum": 167
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation -Multiplication Table",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_MULTIPLICATION_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1838,
					"offsetEnd": 1838,
					"columnNum": 168
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1839,
					"offsetEnd": 1839,
					"columnNum": 169
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Read Aloud Passages",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__READ_ALOUD_PASSAGES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1840,
					"offsetEnd": 1840,
					"columnNum": 170
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Scribe",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__SCRIBE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1841,
					"offsetEnd": 1841,
					"columnNum": 171
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Speech-to-Text",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__SPEECHTOTEXT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1842,
					"offsetEnd": 1842,
					"columnNum": 172
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Student tested during more than one day for the test or test part that was to be administered in a single setting",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__STUDENT_TESTED_DURING_MORE_THAN_ONE_DAY_FOR_THE_TEST_OR_TEST_PART_THAT_WAS_TO_BE_ADMINISTERED_IN_A_SINGLE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1843,
					"offsetEnd": 1843,
					"columnNum": 173
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - Transfer responses to test booklet or answer booklet",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__TRANSFER_RESPONSES_TO_TEST_BOOKLET_OR_ANSWER_BOOKLET",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1844,
					"offsetEnd": 1844,
					"columnNum": 174
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation (Paper) - 100s Number Table",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__100S_NUMBER_TABLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1845,
					"offsetEnd": 1845,
					"columnNum": 175
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper) - Bilingual Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__BILINGUAL_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1846,
					"offsetEnd": 1846,
					"columnNum": 176
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper) - Read Aloud",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__READ_ALOUD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1847,
					"offsetEnd": 1847,
					"columnNum": 177
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper) - Scribe",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SCRIBE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1848,
					"offsetEnd": 1848,
					"columnNum": 178
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper) - Separate Setting",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SEPARATE_SETTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1849,
					"offsetEnd": 1849,
					"columnNum": 179
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper) - Simplified TestDirections",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SIMPLIFIED_TESTDIRECTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1850,
					"offsetEnd": 1850,
					"columnNum": 180
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper) - Stacked Translation",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__STACKED_TRANSLATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1851,
					"offsetEnd": 1851,
					"columnNum": 181
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper) - TranslatedTest Directions",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__TRANSLATEDTEST_DIRECTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1852,
					"offsetEnd": 1852,
					"columnNum": 182
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports (Paper) - Translations (Glossary)",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__TRANSLATIONS_GLOSSARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1853,
					"offsetEnd": 1888,
					"columnNum": 183
				},
				"fieldLength": 36,
				"expectedValues": ["TDS_WL_Glossary                       ", "TDS_WL_ArabicGloss                    ", "TDS_WL_CantoneseGloss                 ", "TDS_WL_ESNGlossary                    ", "TDS_WL_KoreanGloss                    ", "TDS_WL_MandarinGloss                  ", "TDS_WL_PunjabiGloss                   ", "TDS_WL_RussianGloss                   ", "TDS_WL_TagalGloss                     ", "TDS_WL_UkrainianGloss                 ", "TDS_WL_VietnameseGloss                ", "TDS_WL_ArabicGloss&TDS_WL_Glossary    ", "TDS_WL_CantoneseGloss&TDS_WL_Glossary ", "TDS_WL_ESNGlossary&TDS_WL_Glossary    ", "TDS_WL_KoreanGloss&TDS_WL_Glossary    ", "TDS_WL_MandarinGloss&TDS_WL_Glossary  ", "TDS_WL_PunjabiGloss&TDS_WL_Glossary   ", "TDS_WL_RussianGloss&TDS_WL_Glossary   ", "TDS_WL_TagalGloss&TDS_WL_Glossary     ", "TDS_WL_UkrainianGloss&TDS_WL_Glossary ", "TDS_WL_VietnameseGloss&TDS_WL_Glossary"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-embedded Universal Tools (Paper) - Breaks",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_UNIVERSAL_TOOLS_PAPER__BREAKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1889,
					"offsetEnd": 1889,
					"columnNum": 184
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-embedded Universal Tools (Paper) - English Dictionary",
				"otherPossibleNames": [],
				"logicalName": "NONEMBEDDED_UNIVERSAL_TOOLS_PAPER__ENGLISH_DICTIONARY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1890,
					"offsetEnd": 1890,
					"columnNum": 185
				},
				"fieldLength": 1,
				"expectedValues": ["Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1891,
					"offsetEnd": 1891,
					"columnNum": 186
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Number of Items attempted 1",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1892,
					"offsetEnd": 1894,
					"columnNum": 187
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Number of Items attempted 2",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1895,
					"offsetEnd": 1897,
					"columnNum": 188
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Grade Assessed Current Year minus 1",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1898,
					"offsetEnd": 1899,
					"columnNum": 189
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1900,
					"offsetEnd": 1907,
					"columnNum": 190
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Smarter Standard Error Measurement - SEM Current Year minus 1",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1908,
					"offsetEnd": 1911,
					"columnNum": 191
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Scores Current Year minus 1",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1912,
					"offsetEnd": 1915,
					"columnNum": 192
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Condition Code Current Year minus 1",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1916,
					"offsetEnd": 1919,
					"columnNum": 193
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1920,
					"offsetEnd": 1923,
					"columnNum": 194
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1924,
					"offsetEnd": 1924,
					"columnNum": 195
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1925,
					"offsetEnd": 1928,
					"columnNum": 196
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1929,
					"offsetEnd": 1929,
					"columnNum": 197
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1930,
					"offsetEnd": 1933,
					"columnNum": 198
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1934,
					"offsetEnd": 1934,
					"columnNum": 199
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1935,
					"offsetEnd": 1938,
					"columnNum": 200
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1939,
					"offsetEnd": 1939,
					"columnNum": 201
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Grade Assessed Current Year minus 2",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1940,
					"offsetEnd": 1941,
					"columnNum": 202
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1942,
					"offsetEnd": 1949,
					"columnNum": 203
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Smarter Standard Error Measurement - SEM Current Year minus 2",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT__SEM_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1950,
					"offsetEnd": 1953,
					"columnNum": 204
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Scores Current Year minus 2",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1954,
					"offsetEnd": 1957,
					"columnNum": 205
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Condition Code Current Year minus 2",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1958,
					"offsetEnd": 1961,
					"columnNum": 206
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1962,
					"offsetEnd": 1965,
					"columnNum": 207
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1966,
					"offsetEnd": 1966,
					"columnNum": 208
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1967,
					"offsetEnd": 1970,
					"columnNum": 209
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1971,
					"offsetEnd": 1971,
					"columnNum": 210
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1972,
					"offsetEnd": 1975,
					"columnNum": 211
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1976,
					"offsetEnd": 1976,
					"columnNum": 212
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1977,
					"offsetEnd": 1980,
					"columnNum": 213
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1981,
					"offsetEnd": 1981,
					"columnNum": 214
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Grade Assessed Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1982,
					"offsetEnd": 1983,
					"columnNum": 215
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1984,
					"offsetEnd": 1991,
					"columnNum": 216
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Smarter Standard Error Measurement - SEM Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT__SEM_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1992,
					"offsetEnd": 1995,
					"columnNum": 217
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Scale Scores Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1996,
					"offsetEnd": 1999,
					"columnNum": 218
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Condition Code Current Year minus 3",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2000,
					"offsetEnd": 2003,
					"columnNum": 219
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2004,
					"offsetEnd": 2007,
					"columnNum": 220
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2008,
					"offsetEnd": 2008,
					"columnNum": 221
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2009,
					"offsetEnd": 2012,
					"columnNum": 222
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2013,
					"offsetEnd": 2013,
					"columnNum": 223
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2014,
					"offsetEnd": 2017,
					"columnNum": 224
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2018,
					"offsetEnd": 2018,
					"columnNum": 225
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2019,
					"offsetEnd": 2022,
					"columnNum": 226
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2023,
					"offsetEnd": 2023,
					"columnNum": 227
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2024,
					"offsetEnd": 2039,
					"columnNum": 228
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2040,
					"offsetEnd": 2099,
					"columnNum": 229
				},
				"fieldLength": 60,
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
					"offsetStart": 2100,
					"offsetEnd": 2101,
					"columnNum": 230
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".txt"]
}