{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "ELPAC_INITIAL_2021",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"naturalKey": ["STUDENT_LOCAL_ID", "TESTING_COMPLETED_DATE_LISTENING", "TESTING_COMPLETED_DATE_READING", "TESTING_COMPLETED_DATE_SPEAKING", "TESTING_COMPLETED_DATE_WRITING"],
		"fields": [{
				"physicalName": "Assessment Type",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 0,
				"expectedValues": ["IE"],
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Middle Name ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 0,
				"expectedValues": ["Female", "Male","M","F"],
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 0,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 2",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_DISABILITY_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Enrollment Effective Date",
				"otherPossibleNames": [],
				"logicalName": "ENROLLMENT_EFFECTIVE_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 500,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 0,
				"expectedValues": ["Yes", "No"],
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 0,
				"expectedValues": ["Yes", "No"],
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 0,
				"expectedValues": ["Yes", "No"],
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 0,
				"expectedValues": ["Yes", "No"],
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 0,
				"expectedValues": ["10", "11", "12", "13", "14", "15"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested LEA Name 1-Listening ",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested County-District Code 1-Listening",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Name 1-Listening",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Code 1-Listening",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Indicator 1-Listening",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Code 1-Listening",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School NPS Flag 1-Listening",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Start Date 1-Listening",
				"otherPossibleNames": [],
				"logicalName": "TESTING_START_DATE_LISTENING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Completed Date 1-Listening",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_LISTENING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested LEA Name 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested County-District Code 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Name 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Code 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Indicator 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Code 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School NPS Flag 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Start Date 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTING_START_DATE_SPEAKING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Completed Date 2-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_SPEAKING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested LEA Name 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested County-District Code 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Name 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Code 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Indicator 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Code 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School NPS Flag 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Start Date 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTING_START_DATE_READING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Completed Date 3-Reading",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_READING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested LEA Name 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested County-District Code 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Name 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School Code 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Indicator 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Code 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested School NPS Flag 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Start Date 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTING_START_DATE_WRITING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Testing Completed Date 4-Writing",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_WRITING",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity ID-Listening",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity Testing Status-Listening",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity ID-Speaking",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity Testing Status-Speaking",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity ID-Reading",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity Testing Status-Reading",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity ID-Writing",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Opportunity Testing Status-Writing",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Exit Code ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Exit Withdrawal Date ",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_WITHDRAWAL_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Include Indicator ",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 0,
				"expectedValues": ["N", "T", "Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unlisted Resources-Listening",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCES_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unlisted Resources-Speaking",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCES_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unlisted Resources-Reading",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCES_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Unlisted Resources-Writing",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCES_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Mode-Listening",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Mode-Speaking",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Mode-Reading",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test Mode-Writing",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 3",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 4",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 5",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 6",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 0,
				"expectedValues": [1, 2, 3, 4],
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 0,
				"expectedValues": [1, 2, 3, 4],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Calculated English Language Acquisition Status",
				"otherPossibleNames": [],
				"logicalName": "CALCULATED_ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Alternate Assessment-Listening",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Alternate Assessment-Speaking",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Alternate Assessment- Reading",
				"otherPossibleNames": [],
				"logicalName": "READING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Alternate Assessment-Writing",
				"otherPossibleNames": [],
				"logicalName": "WRITING_ALTERNATE_ASSESSMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain Exemption-Listening",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_DOMAIN_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain Exemption-Speaking",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_DOMAIN_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain Exemption-Reading",
				"otherPossibleNames": [],
				"logicalName": "READING_DOMAIN_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Domain Exemption-Writing",
				"otherPossibleNames": [],
				"logicalName": "WRITING_DOMAIN_EXEMPTION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Accommodations Available Indicator ",
				"otherPossibleNames": [],
				"logicalName": "ACCOMMODATIONS_AVAILABLE_INDICATOR_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Designated Support Available Indicator",
				"otherPossibleNames": [],
				"logicalName": "DESIGNATED_SUPPORT_AVAILABLE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-American Sign Language (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AMERICAN_SIGN_LANGUAGE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-American Sign Language (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AMERICAN_SIGN_LANGUAGE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 121
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Audio Transcript (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Audio Transcript (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 123
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Audio Transcript (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 124
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Audio Transcript (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 125
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Braille (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 126
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Braille (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Braille (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Braille (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Closed Captioning (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Closed Captioning (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Closed Captioning (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Closed Captioning (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Text-to-Speech (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Text-to-Speech (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Accommodations-Text-to-Speech (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Alternate Response Options (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ALTERNATE_RESPONSE_OPTIONS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Alternate Response Options (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ALTERNATE_RESPONSE_OPTIONS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Alternate Response Options (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ALTERNATE_RESPONSE_OPTIONS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Alternate Response Options (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ALTERNATE_RESPONSE_OPTIONS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-ASL or Manually Coded English (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ASL_OR_MANUALLY_CODED_ENGLISH_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-ASL or Manually Coded English (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ASL_OR_MANUALLY_CODED_ENGLISH_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-ASL or Manually Coded English (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ASL_OR_MANUALLY_CODED_ENGLISH_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-ASL or Manually Coded English (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-ASL_OR_MANUALLY_CODED_ENGLISH_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Audio Transcript  (Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT__PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Audio Transcript  (Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT__PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Audio Transcript  (Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT__PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Audio Transcript  (Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT__PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Breaks (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BREAKS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Breaks (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BREAKS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Breaks (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BREAKS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Breaks (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BREAKS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Braille (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Braille (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 154
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Braille (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 155
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Braille (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 156
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Scribe Items (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SCRIBE_ITEMS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 157
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Scribe Items (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SCRIBE_ITEMS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 158
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Scribe Items (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SCRIBE_ITEMS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 159
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Scribe Items (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SCRIBE_ITEMS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 160
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Speech-to-text (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SPEECH-TO-TEXT_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 161
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Speech-to-text (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SPEECH-TO-TEXT_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 162
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Speech-to-text (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SPEECH-TO-TEXT_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 163
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Speech-to-text (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-SPEECH-TO-TEXT_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 164
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Large Versions of a Paper-Pencil Test (Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-LARGE_VERSIONS_OF_A_PAPER-PENCIL_TEST_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 165
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Large Versions of a Paper-Pencil Test (Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-LARGE_VERSIONS_OF_A_PAPER-PENCIL_TEST_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 166
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Large Versions of a Paper-Pencil Test (Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-LARGE_VERSIONS_OF_A_PAPER-PENCIL_TEST_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 167
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Large Versions of a Paper-Pencil Test (Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-LARGE_VERSIONS_OF_A_PAPER-PENCIL_TEST_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 168
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation-Unlisted Resources (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATION-UNLISTED_RESOURCES_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 169
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation-Unlisted Resources (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATION-UNLISTED_RESOURCES_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 170
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation-Unlisted Resources (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATION-UNLISTED_RESOURCES_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 171
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodation-Unlisted Resources (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATION-UNLISTED_RESOURCES_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 172
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Word Processor (Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-WORD_PROCESSOR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 173
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Word Processor (Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-WORD_PROCESSOR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 174
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Word Processor (Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-WORD_PROCESSOR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 175
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Accommodations-Word Processor (Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_ACCOMMODATIONS-WORD_PROCESSOR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 176
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Color Contrast (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 177
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Color Contrast (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 178
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Color Contrast (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 179
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Color Contrast (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 180
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Mouse Pointer (Size and Color) (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MOUSE_POINTER_SIZE_AND_COLOR_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 181
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Mouse Pointer (Size and Color) (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MOUSE_POINTER_SIZE_AND_COLOR_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 182
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Mouse Pointer (Size and Color) (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MOUSE_POINTER_SIZE_AND_COLOR_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 183
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Mouse Pointer (Size and Color) (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MOUSE_POINTER_SIZE_AND_COLOR_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 184
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Masking (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MASKING_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 185
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Masking (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MASKING_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 186
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Masking (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MASKING_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 187
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Masking (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-MASKING_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 188
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Pause or Replay Audio - Listening Domain (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PAUSE_OR_REPLAY_AUDIO_-_LISTENING_DOMAIN_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 189
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Pause or Replay Audio - Speaking Domain (Online)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PAUSE_OR_REPLAY_AUDIO_-_SPEAKING_DOMAIN_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 190
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Permissive Mode (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PERMISSIVE_MODE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 191
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Permissive Mode (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PERMISSIVE_MODE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 192
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Permissive Mode (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PERMISSIVE_MODE_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 193
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Permissive Mode (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PERMISSIVE_MODE_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 194
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Print Size (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PRINT_SIZE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 195
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Print Size (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PRINT_SIZE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 196
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Print Size (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PRINT_SIZE_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 197
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Print Size (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-PRINT_SIZE_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 198
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Streamline (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-STREAMLINE_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 199
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Streamline (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-STREAMLINE_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 200
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Streamline (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-STREAMLINE_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 201
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Streamline (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-STREAMLINE_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 202
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Turn Off Any Universal Tool(s) (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 203
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Turn Off Any Universal Tool(s) (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 204
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Turn Off Any Universal Tool(s) (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 205
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Embedded Designated Supports-Turn Off Any Universal Tool(s) (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "EMBEDDED_DESIGNATED_SUPPORTS-TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 206
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports - Amplification (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS_-_AMPLIFICATION_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 207
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports - Amplification (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS_-_AMPLIFICATION_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 208
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports - Amplification (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS_-_AMPLIFICATION_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 209
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports - Amplification  (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS_-_AMPLIFICATION__ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 210
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Color Contrast (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 211
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Color Contrast (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 212
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Color Contrast (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 213
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Color Contrast (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_CONTRAST_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 214
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Color Overlay (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_OVERLAY_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 215
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Color Overlay (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_OVERLAY_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 216
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Color Overlay (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_OVERLAY_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 217
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Color Overlay (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-COLOR_OVERLAY_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 218
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Designated Interface Assistant (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-DESIGNATED_INTERFACE_ASSISTANT_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 219
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Designated Interface Assistant (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-DESIGNATED_INTERFACE_ASSISTANT_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 220
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Designated Interface Assistant (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-DESIGNATED_INTERFACE_ASSISTANT_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 221
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Designated Interface Assistant (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-DESIGNATED_INTERFACE_ASSISTANT_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 222
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Magnification (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MAGNIFICATION_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 223
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Magnification (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MAGNIFICATION_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 224
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Magnification (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MAGNIFICATION_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 225
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Magnification (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MAGNIFICATION_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 226
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Masking (Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MASKING_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 227
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Masking (Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MASKING_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 228
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Masking (Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MASKING_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 229
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Masking (Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MASKING_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 230
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Medical Supports (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MEDICAL_SUPPORTS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 231
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Medical Supports (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MEDICAL_SUPPORTS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 232
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Medical Supports (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MEDICAL_SUPPORTS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 233
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Medical Supports (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-MEDICAL_SUPPORTS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 234
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Noise Buffers (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-NOISE_BUFFERS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 235
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Noise Buffers (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-NOISE_BUFFERS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 236
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Noise Buffers (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-NOISE_BUFFERS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 237
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Noise Buffers (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-NOISE_BUFFERS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 238
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Print on demand (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PRINT_ON_DEMAND_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 239
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Print on demand (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PRINT_ON_DEMAND_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 240
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Print on demand (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PRINT_ON_DEMAND_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 241
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Print on demand (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PRINT_ON_DEMAND_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 242
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Pause or Replay Audio (Paper) (Listening) ",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PAUSE_OR_REPLAY_AUDIO_PAPER_LISTENING_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 243
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Pause or Replay Audio (Paper) (Speaking) ",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-PAUSE_OR_REPLAY_AUDIO_PAPER_SPEAKING_",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 244
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Read-Aloud Items (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-READ-ALOUD_ITEMS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 245
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Separate Setting (Online) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SEPARATE_SETTING_ONLINE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 246
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Separate Setting (Online) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SEPARATE_SETTING_ONLINE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 247
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Separate Setting (Online) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SEPARATE_SETTING_ONLINE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 248
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Separate Setting (Online) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SEPARATE_SETTING_ONLINE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 249
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Simplified Test Directions (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SIMPLIFIED_TEST_DIRECTIONS_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 250
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Simplified Test Directions (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SIMPLIFIED_TEST_DIRECTIONS_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 251
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Simplified Test Directions (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SIMPLIFIED_TEST_DIRECTIONS_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 252
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Simplified Test Directions (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-SIMPLIFIED_TEST_DIRECTIONS_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 253
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Translated Test Directions (including ASL) (Online or Paper) (Listening)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-TRANSLATED_TEST_DIRECTIONS_INCLUDING_ASL_ONLINE_OR_PAPER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 254
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Translated Test Directions (including ASL) (Online or Paper) (Speaking)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-TRANSLATED_TEST_DIRECTIONS_INCLUDING_ASL_ONLINE_OR_PAPER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 255
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Translated Test Directions (including ASL) (Online or Paper) (Reading)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-TRANSLATED_TEST_DIRECTIONS_INCLUDING_ASL_ONLINE_OR_PAPER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 256
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Non-Embedded Designated Supports-Translated Test Directions (including ASL) (Online or Paper) (Writing)",
				"otherPossibleNames": [],
				"logicalName": "NON-EMBEDDED_DESIGNATED_SUPPORTS-TRANSLATED_TEST_DIRECTIONS_INCLUDING_ASL_ONLINE_OR_PAPER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 257
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Number of Items Attempted-Listening",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 258
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Number of Items Attempted-Speaking",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 259
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Number of Items Attempted-Reading",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 260
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Number of Items Attempted-Writing",
				"otherPossibleNames": [],
				"logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 261
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 7",
				"otherPossibleNames": [],
				"logicalName": "BLANK_7",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 262
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank 8",
				"otherPossibleNames": [],
				"logicalName": "BLANK_8",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 263
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 264
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 265
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Address City",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 266
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student State Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 267
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Zip Code",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ZIP_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 268
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Score Available Date",
				"otherPossibleNames": [],
				"logicalName": "SCORE_AVAILABLE_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 269
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 270
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 271
				},
				"fieldLength": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 272
				},
				"fieldLength": 0,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".csv"]
}