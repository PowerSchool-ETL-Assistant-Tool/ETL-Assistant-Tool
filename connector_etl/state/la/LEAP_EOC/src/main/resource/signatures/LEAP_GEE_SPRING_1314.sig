{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "LEAP_GEE_SPRING_1314",
    "quoteDelim": "\"",
    "fieldDelim": null,
    "hasHeader": true,
    "naturalKey": ["STATE_ID", "TEST_DATE_MONTH", "TEST_DATE_YEAR","DRC_UNIQUE_STUDENT_ID"],
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
        "expectedValues": [],
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
        "physicalName": "Summarized Grade",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 94,
          "offsetEnd": 95,
          "columnNum": 8
        },
        "fieldLength": 2,
        "expectedValues": ["04", "08", "11", "12", "HS"],
        "dataTypes": "STRING",
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
        "physicalName": "State ID",
        "otherPossibleNames": [],
        "logicalName": "STATE_ID",
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
          "offsetEnd": 136,
          "columnNum": 13
        },
        "fieldLength": 11,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precoded ELA",
        "otherPossibleNames": [],
        "logicalName": "PRECODED_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 137,
          "offsetEnd": 137,
          "columnNum": 14
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precoded Math",
        "otherPossibleNames": [],
        "logicalName": "PRECODED_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 138,
          "offsetEnd": 138,
          "columnNum": 15
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precoded Science",
        "otherPossibleNames": [],
        "logicalName": "PRECODED_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 139,
          "offsetEnd": 139,
          "columnNum": 16
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precoded Social Studies",
        "otherPossibleNames": [],
        "logicalName": "PRECODED_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 140,
          "offsetEnd": 140,
          "columnNum": 17
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
          "offsetStart": 141,
          "offsetEnd": 144,
          "columnNum": 18
        },
        "fieldLength": 4,
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
          "offsetStart": 145,
          "offsetEnd": 146,
          "columnNum": 19
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
          "offsetStart": 147,
          "offsetEnd": 148,
          "columnNum": 20
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
          "offsetStart": 149,
          "offsetEnd": 152,
          "columnNum": 21
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 153,
          "offsetEnd": 153,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": ["M", "F", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Ethnicity/Race",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY_RACE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 154,
          "offsetEnd": 154,
          "columnNum": 23
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "6", "7", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Lunch Status",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_LUNCH_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 155,
          "offsetEnd": 155,
          "columnNum": 24
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "0", "9"],
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
          "offsetStart": 156,
          "offsetEnd": 159,
          "columnNum": 25
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Attended Remediation - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_ATTENDED_REMEDIATION_-_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 160,
          "offsetEnd": 160,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Attended Remediation - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_ATTENDED_REMEDIATION_-_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 161,
          "offsetEnd": 161,
          "columnNum": 27
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
          "offsetStart": 162,
          "offsetEnd": 171,
          "columnNum": 28
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEAP Promotional Status",
        "otherPossibleNames": [],
        "logicalName": "LEAP_PROMOTIONAL_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 172,
          "offsetEnd": 172,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEAP Remediation Eligibility",
        "otherPossibleNames": [],
        "logicalName": "LEAP_REMEDIATION_ELIGIBILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 173,
          "offsetEnd": 173,
          "columnNum": 30
        },
        "fieldLength": 1,
        "expectedValues": ["E", "M", "B", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEAP Summer Test Eligibility",
        "otherPossibleNames": [],
        "logicalName": "LEAP_SUMMER_TEST_ELIGIBILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 174,
          "offsetEnd": 174,
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": ["E", "M", "B", "N"],
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
          "offsetStart": 175,
          "offsetEnd": 178,
          "columnNum": 32
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Migrant Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 179,
          "offsetEnd": 179,
          "columnNum": 33
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
          "offsetStart": 180,
          "offsetEnd": 183,
          "columnNum": 34
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized McKinney-Vento Act (Homeless)",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_HOMELESS_(MCKINNEY-VENTO)_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 184,
          "offsetEnd": 184,
          "columnNum": 35
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
          "offsetStart": 185,
          "offsetEnd": 187,
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
          "offsetStart": 188,
          "offsetEnd": 202,
          "columnNum": 37
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Calculator Use (Math Only)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_CALCULATOR_USE_(MATH_ONLY)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 203,
          "offsetEnd": 203,
          "columnNum": 38
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
          "offsetStart": 204,
          "offsetEnd": 272,
          "columnNum": 39
        },
        "fieldLength": 69,
        "expectedValues": [],
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
          "offsetStart": 273,
          "offsetEnd": 282,
          "columnNum": 40
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Bubbled Accountability Code",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 283,
          "offsetEnd": 284,
          "columnNum": 41
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
          "offsetStart": 285,
          "offsetEnd": 290,
          "columnNum": 42
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Subjects for LEAP Tutoring",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_SUBJECTS_FOR_LEAP_TUTORING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 291,
          "offsetEnd": 291,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", ""],
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
          "offsetStart": 292,
          "offsetEnd": 331,
          "columnNum": 44
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Calculator Use (Math Only)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_CALCULATOR_USE_(MATH_ONLY)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 332,
          "offsetEnd": 332,
          "columnNum": 45
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
          "offsetStart": 333,
          "offsetEnd": 401,
          "columnNum": 46
        },
        "fieldLength": 69,
        "expectedValues": [],
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
          "offsetStart": 402,
          "offsetEnd": 411,
          "columnNum": 47
        },
        "fieldLength": 10,
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
          "offsetStart": 412,
          "offsetEnd": 460,
          "columnNum": 48
        },
        "fieldLength": 49,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Calculator Use (Math Only)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_CALCULATOR_USE_(MATH_ONLY)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 461,
          "offsetEnd": 461,
          "columnNum": 49
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
          "offsetStart": 462,
          "offsetEnd": 520,
          "columnNum": 50
        },
        "fieldLength": 59,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Subjects for LEAP Tutoring",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_SUBJECTS_FOR_LEAP_TUTORING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 521,
          "offsetEnd": 521,
          "columnNum": 51
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Bubbled Accountability Code",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 522,
          "offsetEnd": 523,
          "columnNum": 52
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
          "offsetStart": 524,
          "offsetEnd": 530,
          "columnNum": 53
        },
        "fieldLength": 7,
        "expectedValues": [],
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
          "offsetStart": 531,
          "offsetEnd": 540,
          "columnNum": 54
        },
        "fieldLength": 10,
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
          "offsetStart": 541,
          "offsetEnd": 1571,
          "columnNum": 55
        },
        "fieldLength": 1031,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score Total - ELA",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1572,
          "offsetEnd": 1576,
          "columnNum": 56
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scaled Score - ELA",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1577,
          "offsetEnd": 1579,
          "columnNum": 57
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Assessment Achievement Level - ELA",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1580,
          "offsetEnd": 1582,
          "columnNum": 58
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", "INC", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard 1: Read, comprehend, and respond / Test Session: Reading and Responding",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_1_READ_COMPREHEND_AND_RESPOND_TEST_SESSION_READING_AND_RESPONDING_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1583,
          "offsetEnd": 1586,
          "columnNum": 59
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 2: Write competently / Test Session: Research to Build Knowledge",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_2_WRITE_COMPETENTLY_TEST_SESSION_RESEARCH_TO_BUILD_KNOWLEDGE_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1587,
          "offsetEnd": 1590,
          "columnNum": 60
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 3: Use conventions of language / Test Session: Writing",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_3_USE_CONVENTIONS_OF_LANGUAGE_TEST_SESSION_WRITING_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1591,
          "offsetEnd": 1594,
          "columnNum": 61
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 4: Not assessed / Test Session: Language",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_4_NOT_ASSESSED_TEST_SESSION_LANGUAGE_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1595,
          "offsetEnd": 1598,
          "columnNum": 62
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 5: Locate, select, and synthesize information",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_5_LOCATE_SELECT_AND_SYNTHESIZE_INFORMATION_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1599,
          "offsetEnd": 1602,
          "columnNum": 63
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 6: Read, analyze, and respond to literature",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_6_READ_ANALYZE_AND_RESPOND_TO_LITERATURE_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1603,
          "offsetEnd": 1606,
          "columnNum": 64
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 7: Apply reasoning and problem-solving skills",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_7_APPLY_REASONING_AND_PROBLEM_SOLVING_SKILLS_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1607,
          "offsetEnd": 1610,
          "columnNum": 65
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
          "offsetStart": 1611,
          "offsetEnd": 1614,
          "columnNum": 66
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Subtest 1: Writing",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_1_WRITING_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1615,
          "offsetEnd": 1618,
          "columnNum": 67
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 2: Using Information Resources",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_2_USING_INFORMATION_RESOURCES_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1619,
          "offsetEnd": 1622,
          "columnNum": 68
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 3: Reading and Responding",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_3_READING_AND_RESPONDING_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1623,
          "offsetEnd": 1626,
          "columnNum": 69
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 4: Proofreading",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_4_PROOFREADING_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1627,
          "offsetEnd": 1630,
          "columnNum": 70
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
          "offsetStart": 1631,
          "offsetEnd": 1638,
          "columnNum": 71
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Dimension 1: Composing",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_1_COMPOSING_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1639,
          "offsetEnd": 1642,
          "columnNum": 72
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 2: Style/audience awareness",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_2_STYLE_AUDIENCE_AWARENESS_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1643,
          "offsetEnd": 1646,
          "columnNum": 73
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 3: Sentence formation",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_3_SENTENCE_FORMATION_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1647,
          "offsetEnd": 1650,
          "columnNum": 74
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 4: Usage",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_4_USAGE_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1651,
          "offsetEnd": 1654,
          "columnNum": 75
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 5: Mechanics",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_5_MECHANICS_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1655,
          "offsetEnd": 1658,
          "columnNum": 76
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 6: Spelling",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_6_SPELLING_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1659,
          "offsetEnd": 1662,
          "columnNum": 77
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
          "offsetStart": 1663,
          "offsetEnd": 1670,
          "columnNum": 78
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total Score for Writing",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_SCORE_FOR_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1671,
          "offsetEnd": 1675,
          "columnNum": 79
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Non-Score Code for Writing",
        "otherPossibleNames": [],
        "logicalName": "NON-SCORE_CODE_FOR_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1676,
          "offsetEnd": 1676,
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "6", "7", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1677,
          "offsetEnd": 1679,
          "columnNum": 81
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1680,
          "offsetEnd": 1683,
          "columnNum": 82
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
          "offsetStart": 1684,
          "offsetEnd": 1690,
          "columnNum": 83
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ELA Auto Rescore Flag",
        "otherPossibleNames": [],
        "logicalName": "ELA_AUTO_RESCORE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1691,
          "offsetEnd": 1691,
          "columnNum": 84
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
          "offsetStart": 1692,
          "offsetEnd": 1692,
          "columnNum": 85
        },
        "fieldLength": 1,
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
          "offsetStart": 1693,
          "offsetEnd": 1697,
          "columnNum": 86
        },
        "fieldLength": 5,
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
          "offsetStart": 1698,
          "offsetEnd": 1700,
          "columnNum": 87
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
          "offsetStart": 1701,
          "offsetEnd": 1703,
          "columnNum": 88
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", "INC", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard 1: Number and number relations / Domain: Operations and Algebraic Thinking",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_1_NUMBER_AND_NUMBER_RELATIONS_DOMAIN_OPERATIONS_AND_ALGEBRAIC_THINKING_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1704,
          "offsetEnd": 1707,
          "columnNum": 89
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 2: Algebra / Domain: Number and Operations in Base Ten",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_2_ALGEBRA_DOMAIN_NUMBER_AND_OPERATIONS_IN_BASE_TEN_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1708,
          "offsetEnd": 1711,
          "columnNum": 90
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 3: Measurement / Domain: Number and Operations—Fractions",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_3_MEASUREMENT_DOMAIN_NUMBER_AND_OPERATIONS_FRACTIONS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1712,
          "offsetEnd": 1715,
          "columnNum": 91
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 4: Geometry / Domain: Measurement and Data",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_4_GEOMETRY_DOMAIN_MEASUREMENT_AND_DATA_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1716,
          "offsetEnd": 1719,
          "columnNum": 92
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 5: Data analysis, probability, & discrete math / Domain: Geometry",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_5_DATA_ANALYSIS_PROBABILITY_&_DISCRETE_MATH_DOMAIN_GEOMETRY_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1720,
          "offsetEnd": 1723,
          "columnNum": 93
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 6: Patterns, Relations, & Functions / Domain: Number System / Expressions and Equations",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_6_PATTERNS_RELATIONS_&_FUNCTIONS_DOMAIN_NUMBER_SYSTEM_EXPRESSIONS_AND_EQUATIONS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1724,
          "offsetEnd": 1727,
          "columnNum": 94
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Functions",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_FUNCTIONS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1728,
          "offsetEnd": 1731,
          "columnNum": 95
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Statistics and Probability",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_STATISTICS_AND_PROBABILITY_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1732,
          "offsetEnd": 1735,
          "columnNum": 96
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 1: Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1736,
          "offsetEnd": 1739,
          "columnNum": 97
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 2: Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_2_CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1740,
          "offsetEnd": 1743,
          "columnNum": 98
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
          "offsetStart": 1744,
          "offsetEnd": 1811,
          "columnNum": 99
        },
        "fieldLength": 68,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Math Auto Rescore Flag",
        "otherPossibleNames": [],
        "logicalName": "MATH_AUTO_RESCORE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1812,
          "offsetEnd": 1812,
          "columnNum": 100
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
          "offsetStart": 1813,
          "offsetEnd": 1813,
          "columnNum": 101
        },
        "fieldLength": 1,
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
          "offsetStart": 1814,
          "offsetEnd": 1818,
          "columnNum": 102
        },
        "fieldLength": 5,
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
          "offsetStart": 1819,
          "offsetEnd": 1821,
          "columnNum": 103
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
          "offsetStart": 1822,
          "offsetEnd": 1824,
          "columnNum": 104
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", "INC", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard 1: Science as Inquiry",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_1_SCIENCE_AS_INQUIRY_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1825,
          "offsetEnd": 1828,
          "columnNum": 105
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 2: Physical Science",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_2_PHYSICAL_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1829,
          "offsetEnd": 1832,
          "columnNum": 106
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 3: Life Science",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_3_LIFE_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1833,
          "offsetEnd": 1836,
          "columnNum": 107
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 4: Earth and Space Science",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_4_EARTH_AND_SPACE_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1837,
          "offsetEnd": 1840,
          "columnNum": 108
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 5: Science and the Environment",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_5_SCIENCE_AND_THE_ENVIRONMENT_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1841,
          "offsetEnd": 1844,
          "columnNum": 109
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
          "offsetStart": 1845,
          "offsetEnd": 1856,
          "columnNum": 110
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Subtest 1: Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1857,
          "offsetEnd": 1860,
          "columnNum": 111
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 2: Short Answer Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_2_SHORT_ANSWER_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1861,
          "offsetEnd": 1864,
          "columnNum": 112
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 3: Task Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_3_TASK_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1865,
          "offsetEnd": 1868,
          "columnNum": 113
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
          "offsetStart": 1869,
          "offsetEnd": 1922,
          "columnNum": 114
        },
        "fieldLength": 54,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1923,
          "offsetEnd": 1925,
          "columnNum": 115
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1926,
          "offsetEnd": 1929,
          "columnNum": 116
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
          "offsetStart": 1930,
          "offsetEnd": 1932,
          "columnNum": 117
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Science Auto Rescore Flag",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AUTO_RESCORE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1933,
          "offsetEnd": 1933,
          "columnNum": 118
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
          "offsetStart": 1934,
          "offsetEnd": 1934,
          "columnNum": 119
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score Total - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1935,
          "offsetEnd": 1939,
          "columnNum": 120
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scaled Score - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1940,
          "offsetEnd": 1942,
          "columnNum": 121
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Assessment Achievement Level - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1943,
          "offsetEnd": 1945,
          "columnNum": 122
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", "INC", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard 1: Geography",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_1_GEOGRAPHY_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1946,
          "offsetEnd": 1949,
          "columnNum": 123
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 2: Civics",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_2_CIVICS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1950,
          "offsetEnd": 1953,
          "columnNum": 124
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 3: Economics",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_3_ECONOMICS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1954,
          "offsetEnd": 1957,
          "columnNum": 125
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 4: History",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_4_HISTORY_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1958,
          "offsetEnd": 1961,
          "columnNum": 126
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
          "offsetStart": 1962,
          "offsetEnd": 1977,
          "columnNum": 127
        },
        "fieldLength": 16,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Subtest 1: Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1978,
          "offsetEnd": 1981,
          "columnNum": 128
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 2: Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_2_CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1982,
          "offsetEnd": 1985,
          "columnNum": 129
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 3: Task Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_3_TASK_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1986,
          "offsetEnd": 1989,
          "columnNum": 130
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1990,
          "offsetEnd": 1992,
          "columnNum": 131
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1993,
          "offsetEnd": 1996,
          "columnNum": 132
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
          "offsetStart": 1997,
          "offsetEnd": 2053,
          "columnNum": 133
        },
        "fieldLength": 57,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Social Studies Auto Rescore Flag",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_AUTO_RESCORE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2054,
          "offsetEnd": 2054,
          "columnNum": 134
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
          "offsetStart": 2055,
          "offsetEnd": 2055,
          "columnNum": 135
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Test Taken Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_TEST_TAKEN_FLAG_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2056,
          "offsetEnd": 2056,
          "columnNum": 136
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Test Taken Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_TEST_TAKEN_FLAG_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2057,
          "offsetEnd": 2057,
          "columnNum": 137
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Test Taken Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_TEST_TAKEN_FLAG_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2058,
          "offsetEnd": 2058,
          "columnNum": 138
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Test Taken Flag - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_TEST_TAKEN_FLAG_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2059,
          "offsetEnd": 2059,
          "columnNum": 139
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - ELA",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2060,
          "offsetEnd": 2060,
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Math",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2061,
          "offsetEnd": 2061,
          "columnNum": 141
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Science",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2062,
          "offsetEnd": 2062,
          "columnNum": 142
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2063,
          "offsetEnd": 2063,
          "columnNum": 143
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
          "offsetStart": 2064,
          "offsetEnd": 2073,
          "columnNum": 144
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2074,
          "offsetEnd": 2074,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2075,
          "offsetEnd": 2075,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2076,
          "offsetEnd": 2076,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2077,
          "offsetEnd": 2077,
          "columnNum": 148
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
          "offsetStart": 2078,
          "offsetEnd": 2091,
          "columnNum": 149
        },
        "fieldLength": 14,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - ELA",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2092,
          "offsetEnd": 2092,
          "columnNum": 150
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Math",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2093,
          "offsetEnd": 2093,
          "columnNum": 151
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Science",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2094,
          "offsetEnd": 2094,
          "columnNum": 152
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2095,
          "offsetEnd": 2095,
          "columnNum": 153
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
          "offsetStart": 2096,
          "offsetEnd": 2104,
          "columnNum": 154
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Education Classification",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2105,
          "offsetEnd": 2105,
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 2106,
          "offsetEnd": 2107,
          "columnNum": 156
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
          "offsetStart": 2108,
          "offsetEnd": 2114,
          "columnNum": 157
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized LEP Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_LEP_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2115,
          "offsetEnd": 2115,
          "columnNum": 158
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
          "offsetStart": 2116,
          "offsetEnd": 2117,
          "columnNum": 159
        },
        "fieldLength": 2,
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
          "offsetStart": 2118,
          "offsetEnd": 2118,
          "columnNum": 160
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
          "offsetStart": 2119,
          "offsetEnd": 2124,
          "columnNum": 161
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Section 504 Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_SECTION_504_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2125,
          "offsetEnd": 2125,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Testing Status - ELA",
        "otherPossibleNames": [],
        "logicalName": "TESTING_STATUS_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2126,
          "offsetEnd": 2126,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["P", "I", "R", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Testing Status - Math",
        "otherPossibleNames": [],
        "logicalName": "TESTING_STATUS_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2127,
          "offsetEnd": 2127,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": ["P", "I", "R", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Testing Status - Science",
        "otherPossibleNames": [],
        "logicalName": "TESTING_STATUS_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2128,
          "offsetEnd": 2128,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": ["P", "I", "R", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Testing Status - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "TESTING_STATUS_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2129,
          "offsetEnd": 2129,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": ["P", "I", "R", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Option Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_OPTION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2130,
          "offsetEnd": 2130,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": ["1", "4", "5", "6", "7", "8", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Initial Tester for the most recent Spring test",
        "otherPossibleNames": [],
        "logicalName": "INITIAL_TESTER_FOR_THE_MOST_RECENT_SPRING_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2131,
          "offsetEnd": 2131,
          "columnNum": 168
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2132,
          "offsetEnd": 2133,
          "columnNum": 169
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Home Study/Nonpublic Flag",
        "otherPossibleNames": [],
        "logicalName": "HOME_STUDY/NONPUBLIC_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2134,
          "offsetEnd": 2134,
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Repeating Grade",
        "otherPossibleNames": [],
        "logicalName": "REPEATING_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2135,
          "offsetEnd": 2135,
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2136,
          "offsetEnd": 2136,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", ""],
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
          "offsetStart": 2137,
          "offsetEnd": 2229,
          "columnNum": 173
        },
        "fieldLength": 93,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Accountability Code from Spring - ELA",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_FROM_SPRING_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2230,
          "offsetEnd": 2231,
          "columnNum": 174
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Accountability Code from Spring - Math",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_FROM_SPRING_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2232,
          "offsetEnd": 2233,
          "columnNum": 175
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Accountability Code from Spring - Science",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_FROM_SPRING_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2234,
          "offsetEnd": 2235,
          "columnNum": 176
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Accountability Code from Spring - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ACCOUNTABILITY_CODE_FROM_SPRING_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2236,
          "offsetEnd": 2237,
          "columnNum": 177
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 1",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2238,
          "offsetEnd": 2239,
          "columnNum": 178
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 2",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2240,
          "offsetEnd": 2241,
          "columnNum": 179
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 3",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2242,
          "offsetEnd": 2243,
          "columnNum": 180
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
          "offsetStart": 2244,
          "offsetEnd": 2245,
          "columnNum": 181
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Accountability Code - ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2246,
          "offsetEnd": 2247,
          "columnNum": 182
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Accountability Code - Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2248,
          "offsetEnd": 2249,
          "columnNum": 183
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Accountability Code - Science",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2250,
          "offsetEnd": 2251,
          "columnNum": 184
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Accountability Code - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2252,
          "offsetEnd": 2253,
          "columnNum": 185
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
          "offsetStart": 2254,
          "offsetEnd": 2254,
          "columnNum": 186
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2255,
          "offsetEnd": 2257,
          "columnNum": 187
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
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
          "offsetStart": 2258,
          "offsetEnd": 2260,
          "columnNum": 188
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
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
          "offsetStart": 2261,
          "offsetEnd": 2263,
          "columnNum": 189
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2264,
          "offsetEnd": 2266,
          "columnNum": 190
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
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
          "offsetStart": 2267,
          "offsetEnd": 2270,
          "columnNum": 191
        },
        "fieldLength": 4,
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
          "offsetStart": 2271,
          "offsetEnd": 2273,
          "columnNum": 192
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 2274,
          "offsetEnd": 2276,
          "columnNum": 193
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 2277,
          "offsetEnd": 2277,
          "columnNum": 194
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Scholarship Site Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_SCHOLARSHIP_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2278,
          "offsetEnd": 2283,
          "columnNum": 195
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
          "offsetStart": 2284,
          "offsetEnd": 2286,
          "columnNum": 196
        },
        "fieldLength": 3,
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
          "offsetStart": 2287,
          "offsetEnd": 2287,
          "columnNum": 197
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
          "offsetStart": 2288,
          "offsetEnd": 2602,
          "columnNum": 198
        },
        "fieldLength": 315,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precoded Site code",
        "otherPossibleNames": [],
        "logicalName": "PRECODED_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2603,
          "offsetEnd": 2608,
          "columnNum": 199
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Site code - Document 1",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_-_DOCUMENT_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2609,
          "offsetEnd": 2614,
          "columnNum": 200
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site code - Document 2",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_-_DOCUMENT_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2615,
          "offsetEnd": 2620,
          "columnNum": 201
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site code - Document 3",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_-_DOCUMENT_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2621,
          "offsetEnd": 2626,
          "columnNum": 202
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
          "offsetStart": 2627,
          "offsetEnd": 2732,
          "columnNum": 203
        },
        "fieldLength": 106,
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
          "offsetStart": 2733,
          "offsetEnd": 2733,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in District Media Reports",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_DISTRICT_MEDIA_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2734,
          "offsetEnd": 2734,
          "columnNum": 205
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in School Media Reports",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_SCHOOL_MEDIA_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2735,
          "offsetEnd": 2735,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarize to Assessment Group Code for district level reporting",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZE_TO_ASSESSMENT_GROUP_CODE_FOR_DISTRICT_LEVEL_REPORTING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2736,
          "offsetEnd": 2736,
          "columnNum": 207
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
          "offsetStart": 2737,
          "offsetEnd": 2737,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 2738,
          "offsetEnd": 2738,
          "columnNum": 209
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
          "offsetStart": 2739,
          "offsetEnd": 2741,
          "columnNum": 210
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summary Reports",
        "otherPossibleNames": [],
        "logicalName": "SUMMARY_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2742,
          "offsetEnd": 2742,
          "columnNum": 211
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
          "offsetStart": 2743,
          "offsetEnd": 2788,
          "columnNum": 212
        },
        "fieldLength": 46,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Partial Score - ELA",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_PARTIAL_SCORE_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2789,
          "offsetEnd": 2789,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Eligible for Appeal - ELA",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_ELIGIBLE_FOR_APPEAL_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2790,
          "offsetEnd": 2790,
          "columnNum": 214
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Retesting Subject - ELA",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_RETESTING_SUBJECT_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2791,
          "offsetEnd": 2791,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Passed, Summer remediation is optional - ELA",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_PASSED,_SUMMER_REMEDIATION_IS_OPTIONAL_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2792,
          "offsetEnd": 2792,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote/Verbiage: Previously Passed Subject - ELA",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE/VERBIAGE:_PREVIOUSLY_PASSED_SUBJECT_-_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2793,
          "offsetEnd": 2793,
          "columnNum": 217
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
          "offsetStart": 2794,
          "offsetEnd": 2798,
          "columnNum": 218
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Partial Score - Math",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_PARTIAL_SCORE_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2799,
          "offsetEnd": 2799,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Eligible for Appeal - Math",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_ELIGIBLE_FOR_APPEAL_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2800,
          "offsetEnd": 2800,
          "columnNum": 220
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Retesting Subject - Math",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_RETESTING_SUBJECT_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2801,
          "offsetEnd": 2801,
          "columnNum": 221
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Passed, Summer remediation is optional - Math",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_PASSED,_SUMMER_REMEDIATION_IS_OPTIONAL_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2802,
          "offsetEnd": 2802,
          "columnNum": 222
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote/Verbiage: Previously Passed Subject - Math",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE/VERBIAGE:_PREVIOUSLY_PASSED_SUBJECT_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2803,
          "offsetEnd": 2803,
          "columnNum": 223
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
          "offsetStart": 2804,
          "offsetEnd": 2810,
          "columnNum": 224
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Retesting Subject - Science",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_RETESTING_SUBJECT_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2811,
          "offsetEnd": 2811,
          "columnNum": 225
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
          "offsetStart": 2812,
          "offsetEnd": 2812,
          "columnNum": 226
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote/Verbiage: Previously Passed Subject - Science",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE/VERBIAGE:_PREVIOUSLY_PASSED_SUBJECT_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2813,
          "offsetEnd": 2813,
          "columnNum": 227
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
          "offsetStart": 2814,
          "offsetEnd": 2820,
          "columnNum": 228
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Retesting Subject - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_RETESTING_SUBJECT_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2821,
          "offsetEnd": 2821,
          "columnNum": 229
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
          "offsetStart": 2822,
          "offsetEnd": 2822,
          "columnNum": 230
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote/Verbiage: Previously Passed Subject - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE/VERBIAGE:_PREVIOUSLY_PASSED_SUBJECT_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2823,
          "offsetEnd": 2823,
          "columnNum": 231
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
          "offsetStart": 2824,
          "offsetEnd": 2826,
          "columnNum": 232
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Test Administrator Number - Document 1",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_TEST_ADMINISTRATOR_NUMBER_-_DOCUMENT_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2827,
          "offsetEnd": 2829,
          "columnNum": 233
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
          "offsetStart": 2830,
          "offsetEnd": 2869,
          "columnNum": 234
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Test Administrator Number - Document 2",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_TEST_ADMINISTRATOR_NUMBER_-_DOCUMENT_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2870,
          "offsetEnd": 2872,
          "columnNum": 235
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
          "offsetStart": 2873,
          "offsetEnd": 2912,
          "columnNum": 236
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Test Administrator Number - Document 3",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_TEST_ADMINISTRATOR_NUMBER_-_DOCUMENT_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2913,
          "offsetEnd": 2915,
          "columnNum": 237
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
          "offsetStart": 2916,
          "offsetEnd": 3007,
          "columnNum": 238
        },
        "fieldLength": 92,
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
          "offsetStart": 3008,
          "offsetEnd": 3013,
          "columnNum": 239
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP LDE Unique ID (GUID)",
        "otherPossibleNames": [],
        "logicalName": "LAP_LDE_UNIQUE_ID_(GUID)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3014,
          "offsetEnd": 3023,
          "columnNum": 240
        },
        "fieldLength": 10,
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
          "offsetStart": 3024,
          "offsetEnd": 3102,
          "columnNum": 241
        },
        "fieldLength": 79,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Subject for LEAP Tutoring",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SUBJECT_FOR_LEAP_TUTORING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3103,
          "offsetEnd": 3103,
          "columnNum": 242
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Previously Attempted Tests - ELA/Math",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_PREVIOUSLY_ATTEMPTED_TESTS_-_ELA/MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3104,
          "offsetEnd": 3104,
          "columnNum": 243
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Previously Attempted Tests - SCI/SOC",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_PREVIOUSLY_ATTEMPTED_TESTS_-_SCI/SOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3105,
          "offsetEnd": 3105,
          "columnNum": 244
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category - English Language Arts",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_ENGLISH_LANGUAGE_ARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3106,
          "offsetEnd": 3107,
          "columnNum": 245
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "99", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category - Mathematics",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3108,
          "offsetEnd": 3109,
          "columnNum": 246
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "99", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category - Science",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3110,
          "offsetEnd": 3111,
          "columnNum": 247
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "99", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3112,
          "offsetEnd": 3113,
          "columnNum": 248
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "99", ""],
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
          "offsetStart": 3114,
          "offsetEnd": 3121,
          "columnNum": 249
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3122,
          "offsetEnd": 3122,
          "columnNum": 250
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3123,
          "offsetEnd": 3123,
          "columnNum": 251
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Large Print",
        "otherPossibleNames": [],
        "logicalName": "LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3124,
          "offsetEnd": 3124,
          "columnNum": 252
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3125,
          "offsetEnd": 3125,
          "columnNum": 253
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3126,
          "offsetEnd": 3126,
          "columnNum": 254
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3127,
          "offsetEnd": 3127,
          "columnNum": 255
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3128,
          "offsetEnd": 3128,
          "columnNum": 256
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3129,
          "offsetEnd": 3129,
          "columnNum": 257
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3130,
          "offsetEnd": 3130,
          "columnNum": 258
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3131,
          "offsetEnd": 3131,
          "columnNum": 259
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3132,
          "offsetEnd": 3132,
          "columnNum": 260
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3133,
          "offsetEnd": 3133,
          "columnNum": 261
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3134,
          "offsetEnd": 3134,
          "columnNum": 262
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3135,
          "offsetEnd": 3135,
          "columnNum": 263
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3136,
          "offsetEnd": 3136,
          "columnNum": 264
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3137,
          "offsetEnd": 3137,
          "columnNum": 265
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3138,
          "offsetEnd": 3138,
          "columnNum": 266
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3139,
          "offsetEnd": 3139,
          "columnNum": 267
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3140,
          "offsetEnd": 3140,
          "columnNum": 268
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Large Print",
        "otherPossibleNames": [],
        "logicalName": "LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3141,
          "offsetEnd": 3141,
          "columnNum": 269
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3142,
          "offsetEnd": 3142,
          "columnNum": 270
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3143,
          "offsetEnd": 3143,
          "columnNum": 271
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3144,
          "offsetEnd": 3144,
          "columnNum": 272
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3145,
          "offsetEnd": 3145,
          "columnNum": 273
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3146,
          "offsetEnd": 3146,
          "columnNum": 274
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3147,
          "offsetEnd": 3147,
          "columnNum": 275
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3148,
          "offsetEnd": 3148,
          "columnNum": 276
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3149,
          "offsetEnd": 3149,
          "columnNum": 277
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3150,
          "offsetEnd": 3150,
          "columnNum": 278
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3151,
          "offsetEnd": 3151,
          "columnNum": 279
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Large Print",
        "otherPossibleNames": [],
        "logicalName": "LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3152,
          "offsetEnd": 3152,
          "columnNum": 280
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3153,
          "offsetEnd": 3153,
          "columnNum": 281
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3154,
          "offsetEnd": 3154,
          "columnNum": 282
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3155,
          "offsetEnd": 3155,
          "columnNum": 283
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3156,
          "offsetEnd": 3156,
          "columnNum": 284
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3157,
          "offsetEnd": 3157,
          "columnNum": 285
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3158,
          "offsetEnd": 3158,
          "columnNum": 286
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3159,
          "offsetEnd": 3159,
          "columnNum": 287
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3160,
          "offsetEnd": 3160,
          "columnNum": 288
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3161,
          "offsetEnd": 3161,
          "columnNum": 289
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3162,
          "offsetEnd": 3162,
          "columnNum": 290
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3163,
          "offsetEnd": 3163,
          "columnNum": 291
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3164,
          "offsetEnd": 3164,
          "columnNum": 292
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3165,
          "offsetEnd": 3165,
          "columnNum": 293
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3166,
          "offsetEnd": 3166,
          "columnNum": 294
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3167,
          "offsetEnd": 3167,
          "columnNum": 295
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3168,
          "offsetEnd": 3168,
          "columnNum": 296
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Large Print",
        "otherPossibleNames": [],
        "logicalName": "LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3169,
          "offsetEnd": 3169,
          "columnNum": 297
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3170,
          "offsetEnd": 3170,
          "columnNum": 298
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3171,
          "offsetEnd": 3171,
          "columnNum": 299
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3172,
          "offsetEnd": 3172,
          "columnNum": 300
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3173,
          "offsetEnd": 3173,
          "columnNum": 301
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3174,
          "offsetEnd": 3174,
          "columnNum": 302
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3175,
          "offsetEnd": 3175,
          "columnNum": 303
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3176,
          "offsetEnd": 3176,
          "columnNum": 304
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3177,
          "offsetEnd": 3177,
          "columnNum": 305
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3178,
          "offsetEnd": 3178,
          "columnNum": 306
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3179,
          "offsetEnd": 3179,
          "columnNum": 307
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Large Print",
        "otherPossibleNames": [],
        "logicalName": "LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3180,
          "offsetEnd": 3180,
          "columnNum": 308
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3181,
          "offsetEnd": 3181,
          "columnNum": 309
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3182,
          "offsetEnd": 3182,
          "columnNum": 310
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3183,
          "offsetEnd": 3183,
          "columnNum": 311
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3184,
          "offsetEnd": 3184,
          "columnNum": 312
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3185,
          "offsetEnd": 3185,
          "columnNum": 313
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3186,
          "offsetEnd": 3186,
          "columnNum": 314
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3187,
          "offsetEnd": 3187,
          "columnNum": 315
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3188,
          "offsetEnd": 3188,
          "columnNum": 316
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3189,
          "offsetEnd": 3189,
          "columnNum": 317
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3190,
          "offsetEnd": 3190,
          "columnNum": 318
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3191,
          "offsetEnd": 3191,
          "columnNum": 319
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3192,
          "offsetEnd": 3192,
          "columnNum": 320
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3193,
          "offsetEnd": 3193,
          "columnNum": 321
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3194,
          "offsetEnd": 3194,
          "columnNum": 322
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3195,
          "offsetEnd": 3195,
          "columnNum": 323
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3196,
          "offsetEnd": 3196,
          "columnNum": 324
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Large Print",
        "otherPossibleNames": [],
        "logicalName": "LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3197,
          "offsetEnd": 3197,
          "columnNum": 325
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3198,
          "offsetEnd": 3198,
          "columnNum": 326
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3199,
          "offsetEnd": 3199,
          "columnNum": 327
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3200,
          "offsetEnd": 3200,
          "columnNum": 328
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3201,
          "offsetEnd": 3201,
          "columnNum": 329
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3202,
          "offsetEnd": 3202,
          "columnNum": 330
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3203,
          "offsetEnd": 3203,
          "columnNum": 331
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3204,
          "offsetEnd": 3204,
          "columnNum": 332
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3205,
          "offsetEnd": 3205,
          "columnNum": 333
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3206,
          "offsetEnd": 3206,
          "columnNum": 334
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3207,
          "offsetEnd": 3207,
          "columnNum": 335
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Large Print",
        "otherPossibleNames": [],
        "logicalName": "LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3208,
          "offsetEnd": 3208,
          "columnNum": 336
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3209,
          "offsetEnd": 3209,
          "columnNum": 337
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3210,
          "offsetEnd": 3210,
          "columnNum": 338
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3211,
          "offsetEnd": 3211,
          "columnNum": 339
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3212,
          "offsetEnd": 3212,
          "columnNum": 340
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3213,
          "offsetEnd": 3213,
          "columnNum": 341
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3214,
          "offsetEnd": 3214,
          "columnNum": 342
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3215,
          "offsetEnd": 3215,
          "columnNum": 343
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3216,
          "offsetEnd": 3216,
          "columnNum": 344
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3217,
          "offsetEnd": 3217,
          "columnNum": 345
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3218,
          "offsetEnd": 3218,
          "columnNum": 346
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3219,
          "offsetEnd": 3219,
          "columnNum": 347
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3220,
          "offsetEnd": 3220,
          "columnNum": 348
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3221,
          "offsetEnd": 3221,
          "columnNum": 349
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3222,
          "offsetEnd": 3222,
          "columnNum": 350
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3223,
          "offsetEnd": 3223,
          "columnNum": 351
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3224,
          "offsetEnd": 3224,
          "columnNum": 352
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Large Print",
        "otherPossibleNames": [],
        "logicalName": "LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3225,
          "offsetEnd": 3225,
          "columnNum": 353
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3226,
          "offsetEnd": 3226,
          "columnNum": 354
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3227,
          "offsetEnd": 3227,
          "columnNum": 355
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3228,
          "offsetEnd": 3228,
          "columnNum": 356
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3229,
          "offsetEnd": 3229,
          "columnNum": 357
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3230,
          "offsetEnd": 3230,
          "columnNum": 358
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3231,
          "offsetEnd": 3231,
          "columnNum": 359
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud (Exception: ELA Reading & Responding)",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_(EXCEPTION:_ELA_READING_&_RESPONDING)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3232,
          "offsetEnd": 3232,
          "columnNum": 360
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 3233,
          "offsetEnd": 3233,
          "columnNum": 361
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
          "offsetStart": 3234,
          "offsetEnd": 3253,
          "columnNum": 362
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
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3254,
          "offsetEnd": 3272,
          "columnNum": 363
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": "yyyy-MM-dd HH:MM:SS",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3273,
          "offsetEnd": 3273,
          "columnNum": 364
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}