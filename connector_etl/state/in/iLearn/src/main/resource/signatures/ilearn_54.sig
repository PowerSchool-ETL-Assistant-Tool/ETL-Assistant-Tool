{
	"encoding": "UTF-8",
	  "fileExtensions": [
        ".csv"
      ],
	"format": {
		"@type": "Delimited",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"formatName": "ilearn_54",
		"naturalKey": ["STUDENT_STATE_ID", "TEST_NAME", "STUDENT_GRADE_CODE", "OVERALL_SCALE_SCORE","SCHOOL_LOCAL_ID"],
		"fields": [
  {
    "physicalName": "Test Date",
    "otherPossibleNames": [],
    "logicalName": "TEST_ADMIN_DATE",
    "formatMask": "",
    "isFieldRequired": "N",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 1
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Student First Name",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_FIRST_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 1
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
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
      "columnNum": 2
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "STN",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_STATE_ID",
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
    "physicalName": "Student DOB",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_DOB",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 4
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
      "columnNum": 5
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Ethnicity",
    "otherPossibleNames": [],
    "logicalName": "ETHNICITY",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 6
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Special Education Status",
    "otherPossibleNames": [],
    "logicalName": "SPECIAL_EDUCATION_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 7
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Identified English Learner Status",
    "otherPossibleNames": [],
    "logicalName": "IDENTIFIED_ENGLISH_LEARNER_STATUS",
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
    "physicalName": "Section 504 Status",
    "otherPossibleNames": [],
    "logicalName": "SECTION_504_STATUS",
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
    "physicalName": "Socioeconomic Status",
    "otherPossibleNames": [],
    "logicalName": "SOCIOECONOMIC_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 10
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Enrolled Grade",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_GRADE_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 11
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Enrolled School",
    "otherPossibleNames": [],
    "logicalName": "SCHOOL_NAME",
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
    "physicalName": "Blank13",
    "otherPossibleNames": ["School ID"],
    "logicalName": "FILLER",
    "formatMask": "",
    "isFieldRequired": "N",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 13
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Enrolled School ID",
    "otherPossibleNames": [],
    "logicalName": "SCHOOL_LOCAL_ID",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 13
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Enrolled Corporation",
    "otherPossibleNames": [],
    "logicalName": "ENROLLED_CORPORATION",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 14
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Enrolled Corporation ID",
    "otherPossibleNames": [],
    "logicalName": "SCHOOL_STATE_ID",
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
    "physicalName": "Test name",
    "otherPossibleNames": [],
    "logicalName": "TEST_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 16
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Overall scale score",
    "otherPossibleNames": [],
    "logicalName": "OVERALL_SCALE_SCORE",
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
    "physicalName": "Overall proficiency level",
    "otherPossibleNames": [],
    "logicalName": "OVERALL_PROFICIENCY_LEVEL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 18
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Reported Lexile/Quantile Measure",
    "otherPossibleNames": [],
    "logicalName": "REPORTED_LEXILE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 19
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "College and Career Readiness Indicator",
    "otherPossibleNames": [],
    "logicalName": "COLLEGE_AND_CAREER_READINESS_INDICATOR",
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
    "physicalName": "Passing Status",
    "otherPossibleNames": [],
    "logicalName": "PASSING_STATUS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 21
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 1 Score",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_1_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 22
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 1 Performance",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_1_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 23
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 1 Percent Correct",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_1_PERCENT_CORRECT",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 24
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 2 Score",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_2_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 25
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 2 Performance",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_2_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 26
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 2 Percent Correct",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_2_PERCENT_CORRECT",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 27
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 3 Score",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_3_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 28
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 3 Performance",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_3_PERFORMANCE",
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
    "physicalName": "Reporting Category 3 Percent Correct",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_3_PERCENT_CORRECT",
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
    "physicalName": "Reporting Category 4 Score",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_4_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 31
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 4 Performance",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_4_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 32
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 4 Percent Correct",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_4_PERCENT_CORRECT",
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
    "physicalName": "Reporting Category 5 Score",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_5_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 34
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 5 Performance",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_5_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 35
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 5 Percent Correct",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_5_PERCENT_CORRECT",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 36
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 6 Score",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_6_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 37
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 6 Performance",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_6_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 38
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 6 Percent Correct",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_6_PERCENT_CORRECT",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 39
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 7 Score",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_7_SCORE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 40
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 7 Performance",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_7_PERFORMANCE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 41
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Reporting Category 7 Percent Correct",
    "otherPossibleNames": [],
    "logicalName": "REPORTING_CATEGORY_7_PERCENT_CORRECT",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 42
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Argumentative Organization/Purpose",
    "otherPossibleNames": [],
    "logicalName": "ARGUMENTATIVE_ORGANIZATION/PURPOSE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 43
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Argumentative Evidence/Development & Elaboration",
    "otherPossibleNames": [],
    "logicalName": "ARGUMENTATIVE_EVIDENCE/DEVELOPMENT_&_ELABORATION",
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
    "physicalName": "Argumentative Conventions",
    "otherPossibleNames": [],
    "logicalName": "ARGUMENTATIVE_CONVENTIONS",
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
    "physicalName": "Informative Organization/Purpose",
    "otherPossibleNames": [],
    "logicalName": "INFORMATIVE_ORGANIZATION/PURPOSE",
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
    "physicalName": "Informative Evidence/Development & Elaboration",
    "otherPossibleNames": [],
    "logicalName": "INFORMATIVE_EVIDENCE/DEVELOPMENT_&_ELABORATION",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 47
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Informative Conventions",
    "otherPossibleNames": [],
    "logicalName": "INFORMATIVE_CONVENTIONS",
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
    "physicalName": "Narrative Organization/Purpose",
    "otherPossibleNames": [],
    "logicalName": "NARRATIVE_ORGANIZATION/PURPOSE",
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
    "physicalName": "Narrative Evidence/Development & Elaboration",
    "otherPossibleNames": [],
    "logicalName": "NARRATIVE_EVIDENCE/DEVELOPMENT_&_ELABORATION",
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
    "physicalName": "Narrative Conventions",
    "otherPossibleNames": [],
    "logicalName": "NARRATIVE_CONVENTIONS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 51
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "Persuasive Organization/Purpose",
    "otherPossibleNames": [""],
    "logicalName": "PERSUASIVE_ORGANIZATION/PURPOSE",
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
    "physicalName": "Persuasive Evidence/Development & Elaboration",
    "otherPossibleNames": [],
    "logicalName": "PERSUASIVE_EVIDENCE/DEVELOPMENT_&_ELABORATION",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 53
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Persuasive Conventions",
    "otherPossibleNames": [],
    "logicalName": "PERSUASIVE_CONVENTIONS",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 54
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  }
]
  }
}