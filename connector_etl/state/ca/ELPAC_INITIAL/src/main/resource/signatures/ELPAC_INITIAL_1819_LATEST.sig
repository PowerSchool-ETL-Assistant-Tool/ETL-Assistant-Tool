{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"formatName": "ELPAC_INITIAL_1819_LATEST",
		"quoteDelim": "\"",
		"fieldDelim": "^",
		"hasHeader": true,
		"naturalKey": ["STUDENT_LOCAL_ID", "TESTING_COMPLETED_DATE"],
		"fields": [
  {
    "physicalName": "Assessment Type",
    "otherPossibleNames": [],
    "logicalName": "ASSESSMENT_TYPE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 1
    },
    "fieldLength": 50,
    "expectedValues": ["IA", "IE", "22"],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "UIN (Unique Identification Number)",
    "otherPossibleNames": [],
    "logicalName": "UIN",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 2
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Blank 1",
    "otherPossibleNames": [],
    "logicalName": "BLANK_1",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 3
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Blank 2",
    "otherPossibleNames": [],
    "logicalName": "BLANK_2",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 4
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Statewide Student Identifier (SSID)",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_STATE_ID",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 5
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Student ID Number (Local ID)",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_LOCAL_ID",
    "formatMask": "",
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
    "scale": 0
  },
  {
    "physicalName": "Optional-Local Use",
    "otherPossibleNames": [],
    "logicalName": "OPTIONAL_LOCAL_USE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 7
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Student Last Name",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_LAST_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 8
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Student First Name ",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_FIRST_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 9
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Student Middle Name ",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_MIDDLE_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 10
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Date of Birth",
    "otherPossibleNames": [],
    "logicalName": "DATE_OF_BIRTH",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 11
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "Gender",
    "otherPossibleNames": [],
    "logicalName": "GENDER",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 12
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "CALPADS Grade ",
    "otherPossibleNames": [],
    "logicalName": "CALPADS_GRADE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 13
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Grade Assessed ",
    "otherPossibleNames": [],
    "logicalName": "GRADE_ASSESSED",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 14
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "CALPADS District Code ",
    "otherPossibleNames": [],
    "logicalName": "CALPADS_DISTRICT_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 15
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "CALPADS School Code",
    "otherPossibleNames": [],
    "logicalName": "CALPADS_SCHOOL_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 16
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "CALPADS Charter Code",
    "otherPossibleNames": [],
    "logicalName": "CALPADS_CHARTER_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 17
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "CALPADS Charter School  Indicator",
    "otherPossibleNames": [],
    "logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 18
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Special Education District of Accountability",
    "otherPossibleNames": [],
    "logicalName": "SPECIAL_EDUCATION_DISTRICT_OF_ACCOUNTABILITY",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 19
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "NPS School Flag",
    "otherPossibleNames": [],
    "logicalName": "NPS_SCHOOL_FLAG",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 20
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Section 504 Status",
    "otherPossibleNames": [],
    "logicalName": "SECTION_504_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 21
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "IDEA Indicator",
    "otherPossibleNames": [],
    "logicalName": "IDEA_INDICATOR",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 22
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Primary Disability Type",
    "otherPossibleNames": [],
    "logicalName": "PRIMARY_DISABILITY_TYPE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 23
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Migrant Status",
    "otherPossibleNames": [],
    "logicalName": "MIGRANT_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 24
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "EL Entry Date",
    "otherPossibleNames": [],
    "logicalName": "EL_ENTRY_DATE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 25
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "EL Exit Date",
    "otherPossibleNames": [],
    "logicalName": "EL_EXIT_DATE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 26
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "EnglishLearnerStatus",
    "otherPossibleNames": [],
    "logicalName": "ENGLISH_LEARNER_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 27
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "First Entry Date in US School",
    "otherPossibleNames": [],
    "logicalName": "FIRST_ENTRY_DATE_IN_US_SCHOOL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 28
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "English Language Acquisition Status ",
    "otherPossibleNames": [],
    "logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 29
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Primary Language",
    "otherPossibleNames": [],
    "logicalName": "PRIMARY_LANGUAGE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 30
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Language Code (CEDS)",
    "otherPossibleNames": [],
    "logicalName": "LANGUAGE_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 31
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Military Status",
    "otherPossibleNames": [],
    "logicalName": "MILITARY_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 32
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Foster Status",
    "otherPossibleNames": [],
    "logicalName": "FOSTER_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 33
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Homeless Status",
    "otherPossibleNames": [],
    "logicalName": "HOMELESS_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 34
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Economic Disadvantage Status",
    "otherPossibleNames": [],
    "logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 35
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Hispanic or Latino ",
    "otherPossibleNames": [],
    "logicalName": "HISPANIC_OR_LATINO",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 36
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "American Indian or Alaska Native",
    "otherPossibleNames": [],
    "logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 37
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Asian  ",
    "otherPossibleNames": [],
    "logicalName": "ASIAN_",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 38
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Black or African American",
    "otherPossibleNames": [],
    "logicalName": "BLACK_OR_AFRICAN_AMERICAN",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 39
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "White",
    "otherPossibleNames": [],
    "logicalName": "WHITE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 40
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Native Hawaiian or Other Pacific Islander",
    "otherPossibleNames": [],
    "logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 41
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Filipino",
    "otherPossibleNames": [],
    "logicalName": "FILIPINO",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 42
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Two or More Races",
    "otherPossibleNames": [],
    "logicalName": "TWO_OR_MORE_RACES",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 43
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Reporting Ethnicity",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_ETHNICITY",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 44
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Parent Education Level ",
    "otherPossibleNames": [],
    "logicalName": "PARENT_EDUCATION_LEVEL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 45
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Tested LEA Name ",
    "otherPossibleNames": [],
    "logicalName": "TESTED_LEA_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 46
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Tested County-District Code ",
    "otherPossibleNames": [],
    "logicalName": "TESTED_COUNTY_DISTRICT_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 47
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Tested School Name",
    "otherPossibleNames": [],
    "logicalName": "TESTED_SCHOOL_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 48
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Tested School Code",
    "otherPossibleNames": [],
    "logicalName": "TESTED_SCHOOL_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 49
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Tested Charter School Code ",
    "otherPossibleNames": [],
    "logicalName": "TESTED_CHARTER_SCHOOL_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 50
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Testing Completed Date",
    "otherPossibleNames": [],
    "logicalName": "TESTING_COMPLETED_DATE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 51
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "Student Exit Code ",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_EXIT_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 52
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Student Exit Withdrawal Date ",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_EXIT_WITHDRAWAL_DATE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 53
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "Student Removed from CALPADS File Date",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 54
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "Condition Code",
    "otherPossibleNames": [],
    "logicalName": "CONDITION_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 55
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Attemptedness ",
    "otherPossibleNames": [],
    "logicalName": "ATTEMPTEDNESS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 56
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Include Indicator ",
    "otherPossibleNames": [],
    "logicalName": "INCLUDE_INDICATOR",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 57
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Blank 3",
    "otherPossibleNames": [],
    "logicalName": "BLANK_3",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 58
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Blank 4",
    "otherPossibleNames": [],
    "logicalName": "BLANK_4",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 59
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Blank 5",
    "otherPossibleNames": [],
    "logicalName": "BLANK_5",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 60
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Blank 6",
    "otherPossibleNames": [],
    "logicalName": "BLANK_6",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 61
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Overall Scale Score",
    "otherPossibleNames": [],
    "logicalName": "OVERALL_SCALE_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 62
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Overall Performance Level ",
    "otherPossibleNames": [],
    "logicalName": "OVERALL_PERFORMANCE_LEVEL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 63
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Oral Language Scale Score",
    "otherPossibleNames": [],
    "logicalName": "ORAL_LANGUAGE_SCALE_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 64
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Standard Error of Measurement - CSEM (Oral Language)",
    "otherPossibleNames": [],
    "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_ORAL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 65
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Oral Language Performance Level",
    "otherPossibleNames": [],
    "logicalName": "ORAL_LANGUAGE_PERFORMANCE_LEVEL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 66
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Written Language Scale Score",
    "otherPossibleNames": [],
    "logicalName": "WRITTEN_LANGUAGE_SCALE_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 67
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Standard Error of Measurement - CSEM (Written Language)",
    "otherPossibleNames": [],
    "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_WRITTEN",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 68
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Written Language Performance Level",
    "otherPossibleNames": [],
    "logicalName": "WRITTEN_LANGUAGE_PERFORMANCE_LEVEL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 69
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Listening Performance",
    "otherPossibleNames": [],
    "logicalName": "LISTENING_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 70
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Speaking Performance ",
    "otherPossibleNames": [],
    "logicalName": "SPEAKING_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 71
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reading Performance",
    "otherPossibleNames": [],
    "logicalName": "READING_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 72
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Writing Performance",
    "otherPossibleNames": [],
    "logicalName": "WRITING_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 73
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Braille Accommodation",
    "otherPossibleNames": [],
    "logicalName": "BRAILLE_ACCOMMODATION",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 74
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Accommodations - Listening",
    "otherPossibleNames": [],
    "logicalName": "ACCOMMODATIONS_LISTENING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 75
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Accommodations - Speaking",
    "otherPossibleNames": [],
    "logicalName": "ACCOMMODATIONS_SPEAKING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 76
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Accommodations - Reading",
    "otherPossibleNames": [],
    "logicalName": "ACCOMMODATIONS_READING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 77
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Accommodations - Writing",
    "otherPossibleNames": [],
    "logicalName": "ACCOMMODATIONS_WRITING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 78
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Alternate Assessment - Listening",
    "otherPossibleNames": [],
    "logicalName": "ALTERNATE_ASSESSMENT_LISTENING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 79
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Alternate Assessment - Speaking",
    "otherPossibleNames": [],
    "logicalName": "ALTERNATE_ASSESSMENT_SPEAKING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 80
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Alternate Assessment - Reading",
    "otherPossibleNames": [],
    "logicalName": "ALTERNATE_ASSESSMENT_READING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 81
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Alternate Assessment - Writing",
    "otherPossibleNames": [],
    "logicalName": "ALTERNATE_ASSESSMENT_WRITING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 82
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Testing Irregularities - Listening",
    "otherPossibleNames": [],
    "logicalName": "TESTING_IRREGULARITIES_LISTENING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 83
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Testing Irregularities - Speaking",
    "otherPossibleNames": [],
    "logicalName": "TESTING_IRREGULARITIES_SPEAKING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 84
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Testing Irregularities - Reading",
    "otherPossibleNames": [],
    "logicalName": "TESTING_IRREGULARITIES_READING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 85
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Testing Irregularities - Writing",
    "otherPossibleNames": [],
    "logicalName": "TESTING_IRREGULARITIES_WRITING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 86
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Contractor Directed (Exempt) - Listening",
    "otherPossibleNames": [],
    "logicalName": "CONTRACTOR_DIRECTED_(EXEMPT)_LISTENING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 87
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Contractor Directed (Exempt) - Speaking",
    "otherPossibleNames": [],
    "logicalName": "CONTRACTOR_DIRECTED_(EXEMPT)_SPEAKING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 88
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Contractor Directed (Exempt) - Reading",
    "otherPossibleNames": [],
    "logicalName": "CONTRACTOR_DIRECTED_(EXEMPT)_READING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 89
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Contractor Directed (Exempt) - Writing",
    "otherPossibleNames": [],
    "logicalName": "CONTRACTOR_DIRECTED_(EXEMPT)_WRITING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 90
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Student Address Line 1",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_ADDRESS_LINE_1",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 91
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Student Address Line 2",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_ADDRESS_LINE_2",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 92
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Student Address City",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_ADDRESS_CITY",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 93
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Student State Name",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_STATE_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 94
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "Student Zip Code",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_ZIP_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 95
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "Score Available Date",
    "otherPossibleNames": [],
    "logicalName": "SCORE_AVAILABLE_DATE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 96
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "Tested Status",
    "otherPossibleNames": [],
    "logicalName": "TESTED_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 97
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Report Created Date",
    "otherPossibleNames": [],
    "logicalName": "REPORT_CREATED_DATE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 98
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "DATE",
    "scale": 0
  },
  {
    "physicalName": "End of Record",
    "otherPossibleNames": [],
    "logicalName": "END_OF_RECORD",
    "formatMask": "",
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
    "scale": 0
  }
]
	},
	"fileExtensions": [".csv"]
}