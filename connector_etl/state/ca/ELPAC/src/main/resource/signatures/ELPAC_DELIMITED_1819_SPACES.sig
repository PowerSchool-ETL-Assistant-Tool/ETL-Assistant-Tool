{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "ELPAC_DELIMITED_1819_SPACES",
		"quoteDelim": "\"",
		"fieldDelim": "^",
		"hasHeader": true,
		"naturalKey": ["STUDENT_LOCAL_ID", "TESTING_COMPLETED_DATE"],
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student First Name",
				"otherPossibleNames": ["Student First Name "],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Middle Name",
				"otherPossibleNames": ["Student Middle Name "],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 2,
				"expectedValues": ["KN", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADS District Code",
				"otherPossibleNames": ["CALPADS District Code "],
				"logicalName": "CALPADS_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "English Language Acquisition Status",
				"otherPossibleNames": ["English Language Acquisition Status "],
				"logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Hispanic or Latino",
				"otherPossibleNames": ["Hispanic or Latino "],
				"logicalName": "HISPANIC_OR_LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 3,
				"expectedValues": ["Yes", "No"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Asian",
				"otherPossibleNames": ["Asian  ", "Asian "],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 3,
				"expectedValues": ["100", "200", "300", "400", "500", "600", "700", "800"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Parent Education Level",
				"otherPossibleNames": ["Parent Education Level "],
				"logicalName": "PARENT_EDUCATION_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 2,
				"expectedValues": ["10", "11", "12", "13", "14", "15"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested LEA Name",
				"otherPossibleNames": ["Tested LEA Name "],
				"logicalName": "TESTED_LEA_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Tested County-District Code",
				"otherPossibleNames": ["Tested County-District Code "],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Tested Charter School Code",
				"otherPossibleNames": ["Tested Charter School Code "],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Exit Code",
				"otherPossibleNames": ["Student Exit Code "],
				"logicalName": "STUDENT_EXIT_CODE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Student Exit Withdrawal Date",
				"otherPossibleNames": ["Student Exit Withdrawal Date "],
				"logicalName": "STUDENT_EXIT_WITHDRAWAL_DATE",
				"formatMask": "yyyy-MM-dd",
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 4,
				"expectedValues": ["NT", "ALT", "EXA"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Attemptedness",
				"otherPossibleNames": ["Attemptedness "],
				"logicalName": "ATTEMPTEDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 1,
				"expectedValues": ["N", "P", "Y"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Include Indicator",
				"otherPossibleNames": ["Include Indicator "],
				"logicalName": "INCLUDE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Overall Scale Score ",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
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
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".csv"]
}