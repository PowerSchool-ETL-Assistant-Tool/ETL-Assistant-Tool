{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "LEAP_EOC_Historical_1516_Fixed",
    "recordLength": 3768,
    "naturalKey": ["LASID", "TEST_DATE_MONTH", "TEST_DATE_YEAR","DRC_UNIQUE_STUDENT_ID"],
    "fields": [{
      "physicalName": "Student EOC permanent ID",
      "otherPossibleNames": [],
      "logicalName": "STUDENT_EOC_PERMANENT_ID",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "Y",
      "fieldOffset": {
        "offsetStart": 1,
        "offsetEnd": 10,
        "columnNum": 1
      },
      "fieldLength": 10,
      "expectedValues": [],
      "dataTypes": "STRING",
      "scale": null
    },
      {
        "physicalName": "Test Date-Month",
        "otherPossibleNames": [],
        "logicalName": "TEST_DATE_MONTH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 11,
          "offsetEnd": 12,
          "columnNum": 2
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Test Date-Year",
        "otherPossibleNames": [],
        "logicalName": "TEST_DATE_YEAR",
        "formatMask": "YYYY",
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 13,
          "offsetEnd": 16,
          "columnNum": 3
        },
        "fieldLength": 4,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Merge ID",
        "otherPossibleNames": [],
        "logicalName": "MERGE_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 17,
          "offsetEnd": 25,
          "columnNum": 4
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School System Code",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 26,
          "offsetEnd": 28,
          "columnNum": 5
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
          "offsetStart": 29,
          "offsetEnd": 31,
          "columnNum": 6
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School System Name",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 32,
          "offsetEnd": 81,
          "columnNum": 7
        },
        "fieldLength": 50,
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
          "offsetStart": 82,
          "offsetEnd": 131,
          "columnNum": 8
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Type",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 132,
          "offsetEnd": 134,
          "columnNum": 9
        },
        "fieldLength": 3,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Transfer Flag",
        "otherPossibleNames": [],
        "logicalName": "TRANSFER_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 135,
          "offsetEnd": 135,
          "columnNum": 10
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transfer within Administration Flag",
        "otherPossibleNames": [],
        "logicalName": "TRANSFER_ADMIN_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 136,
          "offsetEnd": 136,
          "columnNum": 11
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Charter School Type",
        "otherPossibleNames": [],
        "logicalName": "CHARTER_SCHOOL_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 137,
          "offsetEnd": 137,
          "columnNum": 12
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5", "6"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Home base school site code",
        "otherPossibleNames": [],
        "logicalName": "HOME_BASE_SCHOOL_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 138,
          "offsetEnd": 143,
          "columnNum": 13
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Admin Error Administration (Prior to 2017)",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION_2017",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 144,
          "offsetEnd": 144,
          "columnNum": 14
        },
        "fieldLength": 1,
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
          "offsetStart": 145,
          "offsetEnd": 145,
          "columnNum": 15
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
          "offsetStart": 146,
          "offsetEnd": 146,
          "columnNum": 16
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Last Name",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 147,
          "offsetEnd": 176,
          "columnNum": 17
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "First Name",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 177,
          "offsetEnd": 206,
          "columnNum": 18
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 207,
          "offsetEnd": 207,
          "columnNum": 19
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Suffix",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_SUFFIX",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 208,
          "offsetEnd": 217,
          "columnNum": 20
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LASID/StateID",
        "otherPossibleNames": [],
        "logicalName": "LASID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 218,
          "offsetEnd": 227,
          "columnNum": 21
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EOC ID",
        "otherPossibleNames": [],
        "logicalName": "DRC_UNIQUE_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 228,
          "offsetEnd": 234,
          "columnNum": 22
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Birth Day",
        "otherPossibleNames": [],
        "logicalName": "DOB_-_MONTH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 235,
          "offsetEnd": 236,
          "columnNum": 23
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Birth Month",
        "otherPossibleNames": [],
        "logicalName": "DOB_-_DAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 237,
          "offsetEnd": 238,
          "columnNum": 24
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Birth Year",
        "otherPossibleNames": [],
        "logicalName": "DOB_-_YEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 239,
          "offsetEnd": 242,
          "columnNum": 25
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 243,
          "offsetEnd": 244,
          "columnNum": 26
        },
        "fieldLength": 2,
        "expectedValues": ["06", "07", "08", "09", "10", "11", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Gender",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 245,
          "offsetEnd": 245,
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": ["F", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 246",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 246,
          "offsetEnd": 246,
          "columnNum": 28
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Economically Disadvantaged Status",
        "otherPossibleNames": [],
        "logicalName": "ECONOMICALLY_DISADVANTAGED_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 247,
          "offsetEnd": 247,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Migrant Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 248,
          "offsetEnd": 248,
          "columnNum": 30
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Education Classification",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 249,
          "offsetEnd": 249,
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EL Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_LEP_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 250,
          "offsetEnd": 251,
          "columnNum": 32
        },
        "fieldLength": 2,
        "expectedValues": ["1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Section 504 Code",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_SECTION_504_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 252,
          "offsetEnd": 252,
          "columnNum": 33
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Exceptionality Code ",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_EXCEPTIONALITY_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 253,
          "offsetEnd": 254,
          "columnNum": 34
        },
        "fieldLength": 2,
        "expectedValues": ["", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Hispanic",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 255,
          "offsetEnd": 255,
          "columnNum": 35
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 256,
          "offsetEnd": 256,
          "columnNum": 36
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 257,
          "offsetEnd": 257,
          "columnNum": 37
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Black",
        "otherPossibleNames": [],
        "logicalName": "BLACK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 258,
          "offsetEnd": 258,
          "columnNum": 38
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Hawaiian or other Pacific Islander",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 259,
          "offsetEnd": 259,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 260,
          "offsetEnd": 260,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Homeless Flag",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_HOMELESS_(MCKINNEY-VENTO)_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 261,
          "offsetEnd": 261,
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Career Diploma Pathway/Track",
        "otherPossibleNames": [],
        "logicalName": "CAREER_DIPLOMA_PATHWAY/TRACK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 262,
          "offsetEnd": 262,
          "columnNum": 42
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Ethnicity/Race as reported",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY_RACE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 263,
          "offsetEnd": 263,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "6", "7"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scholarship Student Flag",
        "otherPossibleNames": [],
        "logicalName": "SCHOLARSHIP_STUDENT_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 264,
          "offsetEnd": 264,
          "columnNum": 44
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Military Affiliated",
        "otherPossibleNames": [],
        "logicalName": "MILITARY_AFFILIATED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 265,
          "offsetEnd": 265,
          "columnNum": 45
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Foster Care",
        "otherPossibleNames": [],
        "logicalName": "FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 266,
          "offsetEnd": 266,
          "columnNum": 46
        },
        "fieldLength": 1,
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
          "offsetStart": 267,
          "offsetEnd": 277,
          "columnNum": 47
        },
        "fieldLength": 11,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 278,
          "offsetEnd": 278,
          "columnNum": 48
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Individual Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-INDIVIDUAL_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 279,
          "offsetEnd": 279,
          "columnNum": 49
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Assistive Technology",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-ASSISTIVE_TECHNOLOGY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 280,
          "offsetEnd": 280,
          "columnNum": 50
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 281,
          "offsetEnd": 281,
          "columnNum": 51
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Extended Time",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 282,
          "offsetEnd": 282,
          "columnNum": 52
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Test Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-TEST_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 283,
          "offsetEnd": 283,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Transferred Answers",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 284,
          "offsetEnd": 284,
          "columnNum": 54
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-LargePrint",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-LARGEPRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 285,
          "offsetEnd": 285,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Braille",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 286,
          "offsetEnd": 286,
          "columnNum": 56
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-Other",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-OTHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 287,
          "offsetEnd": 287,
          "columnNum": 57
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504-No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "SP-S504-NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 288,
          "offsetEnd": 288,
          "columnNum": 58
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL extended time",
        "otherPossibleNames": [],
        "logicalName": "EL_EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 289,
          "offsetEnd": 289,
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL individual small group administration",
        "otherPossibleNames": [],
        "logicalName": "EL_INDIVIDUAL_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 290,
          "offsetEnd": 290,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL English/Native language word-to-word dictionary",
        "otherPossibleNames": [],
        "logicalName": "EL_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 291,
          "offsetEnd": 291,
          "columnNum": 61
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL test administered by ESL teacher or individual providing language services",
        "otherPossibleNames": [],
        "logicalName": "EL_TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 292,
          "offsetEnd": 292,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL test read aloud ",
        "otherPossibleNames": [],
        "logicalName": "EL_TEST_READ_ALOUD_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 293,
          "offsetEnd": 293,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "EL_NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 294,
          "offsetEnd": 294,
          "columnNum": 64
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GUI ID",
        "otherPossibleNames": [],
        "logicalName": "GUI_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 295,
          "offsetEnd": 304,
          "columnNum": 65
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": " School System Reporting Code",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SYSTEM_REPORTING_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 305,
          "offsetEnd": 310,
          "columnNum": 66
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School System Merge Code",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SYSTEM_MERGE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 311,
          "offsetEnd": 311,
          "columnNum": 67
        },
        "fieldLength": 1,
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
          "offsetStart": 312,
          "offsetEnd": 316,
          "columnNum": 68
        },
        "fieldLength": 5,
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
          "offsetStart": 317,
          "offsetEnd": 318,
          "columnNum": 69
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Admin Error Administration",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 319,
          "offsetEnd": 319,
          "columnNum": 70
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
          "offsetStart": 320,
          "offsetEnd": 320,
          "columnNum": 71
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form",
        "otherPossibleNames": [],
        "logicalName": "FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 321,
          "offsetEnd": 328,
          "columnNum": 72
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 329,
          "offsetEnd": 358,
          "columnNum": 73
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher First Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 359,
          "offsetEnd": 388,
          "columnNum": 74
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 389,
          "offsetEnd": 389,
          "columnNum": 75
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 390,
          "offsetEnd": 419,
          "columnNum": 76
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 420,
          "offsetEnd": 449,
          "columnNum": 77
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 450,
          "offsetEnd": 450,
          "columnNum": 78
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period ALGI",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 451,
          "offsetEnd": 452,
          "columnNum": 79
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Course Name",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 453,
          "offsetEnd": 477,
          "columnNum": 80
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 478,
          "offsetEnd": 497,
          "columnNum": 81
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type ALGI",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 498,
          "offsetEnd": 498,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content ALGI",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 499,
          "offsetEnd": 506,
          "columnNum": 83
        },
        "fieldLength": 8,
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
          "offsetStart": 507,
          "offsetEnd": 511,
          "columnNum": 84
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 1 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_1_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 512,
          "offsetEnd": 512,
          "columnNum": 85
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 2 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_2_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 513,
          "offsetEnd": 513,
          "columnNum": 86
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 3 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_3_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 514,
          "offsetEnd": 514,
          "columnNum": 87
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Code ALGI",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 515,
          "offsetEnd": 517,
          "columnNum": 88
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Session 4 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_4_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 518,
          "offsetEnd": 518,
          "columnNum": 89
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 519,
          "offsetEnd": 520,
          "columnNum": 90
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form (consult test map for details of test form structure).",
        "otherPossibleNames": [],
        "logicalName": "MC_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 521,
          "offsetEnd": 580,
          "columnNum": 91
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item scores - two bytes per score up to five scores.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 581,
          "offsetEnd": 590,
          "columnNum": 92
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item score sources - one byte per score source, up to five score sources.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS_SOURCES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 591,
          "offsetEnd": 595,
          "columnNum": 93
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar condition codes - two bytes per code, up to five codes.",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 596,
          "offsetEnd": 605,
          "columnNum": 94
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item  parts - two bytes per CR item part code, up to 11 CR item part codes.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS_PARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 606,
          "offsetEnd": 627,
          "columnNum": 95
        },
        "fieldLength": 22,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 628,
          "offsetEnd": 630,
          "columnNum": 96
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 631,
          "offsetEnd": 633,
          "columnNum": 97
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 634,
          "offsetEnd": 636,
          "columnNum": 98
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 637,
          "offsetEnd": 639,
          "columnNum": 99
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reportable status",
        "otherPossibleNames": [],
        "logicalName": "REPORTABLE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 640,
          "offsetEnd": 640,
          "columnNum": 100
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "P", "R"],
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
          "offsetStart": 641,
          "offsetEnd": 649,
          "columnNum": 101
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Launch Flag",
        "otherPossibleNames": [],
        "logicalName": "TEST_LAUNCH_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 650,
          "offsetEnd": 650,
          "columnNum": 102
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Valid Attempt ALGI",
        "otherPossibleNames": [],
        "logicalName": "TEST_VALID_ATTEMPT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 651,
          "offsetEnd": 651,
          "columnNum": 103
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void Flag ALGI",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 652,
          "offsetEnd": 652,
          "columnNum": 104
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 653,
          "offsetEnd": 653,
          "columnNum": 105
        },
        "fieldLength": 1,
        "expectedValues": ["", "I", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 654",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 654,
          "offsetEnd": 654,
          "columnNum": 106
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Eligible Flag",
        "otherPossibleNames": [],
        "logicalName": "ELIGIBLE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 655,
          "offsetEnd": 655,
          "columnNum": 107
        },
        "fieldLength": 1,
        "expectedValues": ["", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void ALGI",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 656,
          "offsetEnd": 656,
          "columnNum": 108
        },
        "fieldLength": 1,
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
          "offsetStart": 657,
          "offsetEnd": 663,
          "columnNum": 109
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 664,
          "offsetEnd": 666,
          "columnNum": 110
        },
        "fieldLength": 3,
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
          "offsetStart": 667,
          "offsetEnd": 667,
          "columnNum": 111
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Level ALGI",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 668,
          "offsetEnd": 684,
          "columnNum": 112
        },
        "fieldLength": 17,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement ALGI",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 685,
          "offsetEnd": 687,
          "columnNum": 113
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Upper CI ALGI",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 688,
          "offsetEnd": 690,
          "columnNum": 114
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower CI ALGI",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 691,
          "offsetEnd": 693,
          "columnNum": 115
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Algebra points earned ALGI",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 694,
          "offsetEnd": 695,
          "columnNum": 116
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Algebra percent correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 696,
          "offsetEnd": 698,
          "columnNum": 117
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Functions points earned ALGI",
        "otherPossibleNames": [],
        "logicalName": "FUNCTIONS_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 699,
          "offsetEnd": 700,
          "columnNum": 118
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Functions percent correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "FUNCTIONS_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 703,
          "columnNum": 119
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Number & Quantity / Statistics & Probability points earned ALGI",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 704,
          "offsetEnd": 705,
          "columnNum": 120
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number & Quantity / Statistics & Probability percent correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 706,
          "offsetEnd": 708,
          "columnNum": 121
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 709",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 709,
          "offsetEnd": 710,
          "columnNum": 122
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 711",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 711,
          "offsetEnd": 713,
          "columnNum": 123
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 714",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 714,
          "offsetEnd": 715,
          "columnNum": 124
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 716",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 716,
          "offsetEnd": 718,
          "columnNum": 125
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 719,
          "offsetEnd": 720,
          "columnNum": 126
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 721,
          "offsetEnd": 724,
          "columnNum": 127
        },
        "fieldLength": 4,
        "expectedValues": ["", "05", "06", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous scale score",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 725,
          "offsetEnd": 727,
          "columnNum": 128
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 728,
          "offsetEnd": 730,
          "columnNum": 129
        },
        "fieldLength": 3,
        "expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void for Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 731,
          "offsetEnd": 731,
          "columnNum": 130
        },
        "fieldLength": 1,
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
          "offsetStart": 732,
          "offsetEnd": 737,
          "columnNum": 131
        },
        "fieldLength": 6,
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
          "offsetStart": 738,
          "offsetEnd": 739,
          "columnNum": 132
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Admin Error Administration",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 740,
          "offsetEnd": 740,
          "columnNum": 133
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
          "offsetStart": 741,
          "offsetEnd": 741,
          "columnNum": 134
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form",
        "otherPossibleNames": [],
        "logicalName": "FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 742,
          "offsetEnd": 749,
          "columnNum": 135
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 750,
          "offsetEnd": 779,
          "columnNum": 136
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher First Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 780,
          "offsetEnd": 809,
          "columnNum": 137
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 810,
          "offsetEnd": 810,
          "columnNum": 138
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 811,
          "offsetEnd": 840,
          "columnNum": 139
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 841,
          "offsetEnd": 870,
          "columnNum": 140
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 871,
          "offsetEnd": 871,
          "columnNum": 141
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period ENGII",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 872,
          "offsetEnd": 873,
          "columnNum": 142
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Course Name",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 874,
          "offsetEnd": 898,
          "columnNum": 143
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 899,
          "offsetEnd": 918,
          "columnNum": 144
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type ENGII",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 919,
          "offsetEnd": 919,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content ENGII",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 920,
          "offsetEnd": 927,
          "columnNum": 146
        },
        "fieldLength": 8,
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
          "offsetStart": 928,
          "offsetEnd": 932,
          "columnNum": 147
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 1 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_1_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 933,
          "offsetEnd": 933,
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 2 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_2_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 934,
          "offsetEnd": 934,
          "columnNum": 149
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 3 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_3_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 935,
          "offsetEnd": 935,
          "columnNum": 150
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Code ENGII",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 936,
          "offsetEnd": 938,
          "columnNum": 151
        },
        "fieldLength": 3,
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
          "offsetStart": 939,
          "offsetEnd": 941,
          "columnNum": 152
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form (consult test map for details of test form structure).",
        "otherPossibleNames": [],
        "logicalName": "MC_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 942,
          "offsetEnd": 1009,
          "columnNum": 153
        },
        "fieldLength": 68,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 1",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1010,
          "offsetEnd": 1011,
          "columnNum": 154
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 2",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1012,
          "offsetEnd": 1013,
          "columnNum": 155
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 3",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1014,
          "offsetEnd": 1014,
          "columnNum": 156
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 4",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1015,
          "offsetEnd": 1015,
          "columnNum": 157
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 5",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1016,
          "offsetEnd": 1016,
          "columnNum": 158
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 6",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1017,
          "offsetEnd": 1017,
          "columnNum": 159
        },
        "fieldLength": 1,
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
          "offsetStart": 1018,
          "offsetEnd": 1019,
          "columnNum": 160
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Source code",
        "otherPossibleNames": [],
        "logicalName": "SOURCE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1020,
          "offsetEnd": 1020,
          "columnNum": 161
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar Condition Code",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1021,
          "offsetEnd": 1022,
          "columnNum": 162
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for WP",
        "otherPossibleNames": [],
        "logicalName": "WP_SCORING_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1023,
          "offsetEnd": 1024,
          "columnNum": 163
        },
        "fieldLength": 2,
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
          "offsetStart": 1025,
          "offsetEnd": 1047,
          "columnNum": 164
        },
        "fieldLength": 23,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1048,
          "offsetEnd": 1050,
          "columnNum": 165
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1051,
          "offsetEnd": 1053,
          "columnNum": 166
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1054,
          "offsetEnd": 1056,
          "columnNum": 167
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1057,
          "offsetEnd": 1059,
          "columnNum": 168
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reportable Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTABLE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1060,
          "offsetEnd": 1060,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "P", "R"],
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
          "offsetStart": 1061,
          "offsetEnd": 1069,
          "columnNum": 170
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Launch Flag",
        "otherPossibleNames": [],
        "logicalName": "TEST_LAUNCH_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1070,
          "offsetEnd": 1070,
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Valid Attempt ENGII",
        "otherPossibleNames": [],
        "logicalName": "TEST_VALID_ATTEMPT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1071,
          "offsetEnd": 1071,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void Flag ENGII",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1072,
          "offsetEnd": 1072,
          "columnNum": 173
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1073,
          "offsetEnd": 1073,
          "columnNum": 174
        },
        "fieldLength": 1,
        "expectedValues": ["", "I", "P", "R"],
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
          "offsetStart": 1074,
          "offsetEnd": 1074,
          "columnNum": 175
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Eligible Flag",
        "otherPossibleNames": [],
        "logicalName": "ELIGIBLE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1075,
          "offsetEnd": 1075,
          "columnNum": 176
        },
        "fieldLength": 1,
        "expectedValues": ["", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void ENGII",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1076,
          "offsetEnd": 1076,
          "columnNum": 177
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Waiver Flag",
        "otherPossibleNames": [],
        "logicalName": "WAIVER_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1077,
          "offsetEnd": 1077,
          "columnNum": 178
        },
        "fieldLength": 1,
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
          "offsetStart": 1078,
          "offsetEnd": 1083,
          "columnNum": 179
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1084,
          "offsetEnd": 1086,
          "columnNum": 180
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
          "offsetStart": 1087,
          "offsetEnd": 1087,
          "columnNum": 181
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Level ENGII",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1088,
          "offsetEnd": 1104,
          "columnNum": 182
        },
        "fieldLength": 17,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement ENGII",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1105,
          "offsetEnd": 1107,
          "columnNum": 183
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Upper CI ENGII",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1108,
          "offsetEnd": 1110,
          "columnNum": 184
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower CI ENGII",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1111,
          "offsetEnd": 1113,
          "columnNum": 185
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing and Language Conventions points earned ENGII",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1114,
          "offsetEnd": 1115,
          "columnNum": 186
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing and Language Conventions percent correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1116,
          "offsetEnd": 1118,
          "columnNum": 187
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading points earned ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1119,
          "offsetEnd": 1120,
          "columnNum": 188
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading percent correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1121,
          "offsetEnd": 1123,
          "columnNum": 189
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Research points earned ENGII",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1124,
          "offsetEnd": 1125,
          "columnNum": 190
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Research percent correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1126,
          "offsetEnd": 1128,
          "columnNum": 191
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 1129",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1129,
          "offsetEnd": 1130,
          "columnNum": 192
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 1131",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1131,
          "offsetEnd": 1133,
          "columnNum": 193
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 1134",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1134,
          "offsetEnd": 1135,
          "columnNum": 194
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 1136",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1136,
          "offsetEnd": 1138,
          "columnNum": 195
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1139,
          "offsetEnd": 1140,
          "columnNum": 196
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1141,
          "offsetEnd": 1144,
          "columnNum": 197
        },
        "fieldLength": 4,
        "expectedValues": ["", "05", "06", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous scale score",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1145,
          "offsetEnd": 1147,
          "columnNum": 198
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1148,
          "offsetEnd": 1150,
          "columnNum": 199
        },
        "fieldLength": 3,
        "expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void for Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1151,
          "offsetEnd": 1151,
          "columnNum": 200
        },
        "fieldLength": 1,
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
          "offsetStart": 1152,
          "offsetEnd": 1156,
          "columnNum": 201
        },
        "fieldLength": 5,
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
          "offsetStart": 1157,
          "offsetEnd": 1158,
          "columnNum": 202
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Admin Error Administration",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1159,
          "offsetEnd": 1159,
          "columnNum": 203
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 1160,
          "offsetEnd": 1160,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form",
        "otherPossibleNames": [],
        "logicalName": "FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1161,
          "offsetEnd": 1168,
          "columnNum": 205
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1169,
          "offsetEnd": 1198,
          "columnNum": 206
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher First Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1199,
          "offsetEnd": 1228,
          "columnNum": 207
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1229,
          "offsetEnd": 1229,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1230,
          "offsetEnd": 1259,
          "columnNum": 209
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1260,
          "offsetEnd": 1289,
          "columnNum": 210
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1290,
          "offsetEnd": 1290,
          "columnNum": 211
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period GEOM",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1291,
          "offsetEnd": 1292,
          "columnNum": 212
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Course Name",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1293,
          "offsetEnd": 1317,
          "columnNum": 213
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1318,
          "offsetEnd": 1337,
          "columnNum": 214
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type GEOM",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1338,
          "offsetEnd": 1338,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content GEOM",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1339,
          "offsetEnd": 1346,
          "columnNum": 216
        },
        "fieldLength": 8,
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
          "offsetStart": 1347,
          "offsetEnd": 1351,
          "columnNum": 217
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 1 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_1_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1352,
          "offsetEnd": 1352,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 2 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_2_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1353,
          "offsetEnd": 1353,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 3 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_3_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1354,
          "offsetEnd": 1354,
          "columnNum": 220
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Code GEOM",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1355,
          "offsetEnd": 1357,
          "columnNum": 221
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Session 4 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_4_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1358,
          "offsetEnd": 1358,
          "columnNum": 222
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 1359,
          "offsetEnd": 1360,
          "columnNum": 223
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form (consult test map for details of test form structure).",
        "otherPossibleNames": [],
        "logicalName": "MC_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1361,
          "offsetEnd": 1420,
          "columnNum": 224
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item scores - two bytes per score up to five scores.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1421,
          "offsetEnd": 1430,
          "columnNum": 225
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item score sources - one byte per score source, up to five score sources.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS_SOURCES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1431,
          "offsetEnd": 1435,
          "columnNum": 226
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar condition codes - two bytes per code, up to five codes.",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1436,
          "offsetEnd": 1445,
          "columnNum": 227
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item  parts - two bytes per CR item part code, up to 11 CR item part codes.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_PARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1446,
          "offsetEnd": 1467,
          "columnNum": 228
        },
        "fieldLength": 22,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1468,
          "offsetEnd": 1470,
          "columnNum": 229
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1471,
          "offsetEnd": 1473,
          "columnNum": 230
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1474,
          "offsetEnd": 1476,
          "columnNum": 231
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1477,
          "offsetEnd": 1479,
          "columnNum": 232
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reportable status",
        "otherPossibleNames": [],
        "logicalName": "REPORTABLE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1480,
          "offsetEnd": 1480,
          "columnNum": 233
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "P", "R"],
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
          "offsetStart": 1481,
          "offsetEnd": 1489,
          "columnNum": 234
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Launch Flag",
        "otherPossibleNames": [],
        "logicalName": "TEST_LAUNCH_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1490,
          "offsetEnd": 1490,
          "columnNum": 235
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Valid Attempt GEOM",
        "otherPossibleNames": [],
        "logicalName": "TEST_VALID_ATTEMPT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1491,
          "offsetEnd": 1491,
          "columnNum": 236
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void Flag GEOM",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1492,
          "offsetEnd": 1492,
          "columnNum": 237
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1493,
          "offsetEnd": 1493,
          "columnNum": 238
        },
        "fieldLength": 1,
        "expectedValues": ["", "I", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 1494",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1494,
          "offsetEnd": 1494,
          "columnNum": 239
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Eligible Flag",
        "otherPossibleNames": [],
        "logicalName": "ELIGIBLE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1495,
          "offsetEnd": 1495,
          "columnNum": 240
        },
        "fieldLength": 1,
        "expectedValues": ["", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void GEOM",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1496,
          "offsetEnd": 1496,
          "columnNum": 241
        },
        "fieldLength": 1,
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
          "offsetStart": 1497,
          "offsetEnd": 1503,
          "columnNum": 242
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score GEOM",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1504,
          "offsetEnd": 1506,
          "columnNum": 243
        },
        "fieldLength": 3,
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
          "offsetStart": 1507,
          "offsetEnd": 1507,
          "columnNum": 244
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Level GEOM",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1508,
          "offsetEnd": 1524,
          "columnNum": 245
        },
        "fieldLength": 17,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement GEOM",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1525,
          "offsetEnd": 1527,
          "columnNum": 246
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Upper CI GEOM",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1528,
          "offsetEnd": 1530,
          "columnNum": 247
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower CI GEOM",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1531,
          "offsetEnd": 1533,
          "columnNum": 248
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Congruence points earned GEOM",
        "otherPossibleNames": [],
        "logicalName": "CONGRUENCE_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1534,
          "offsetEnd": 1535,
          "columnNum": 249
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Congruence percent correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "CONGRUENCE_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1536,
          "offsetEnd": 1538,
          "columnNum": 250
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Similarity, Right Triangles, & Trigonometry  points earned GEOM",
        "otherPossibleNames": [],
        "logicalName": "SIMILARITY_RIGHT_TRIANGLES_&_TRIGONOMETRY_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1539,
          "offsetEnd": 1540,
          "columnNum": 251
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Similarity, Right Triangles, & Trigonometry  percent correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "SIMILARITY_RIGHT_TRIANGLES_&_TRIGONOMETRY_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1541,
          "offsetEnd": 1543,
          "columnNum": 252
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Circles / Expressing Geometric Properties with Equations points earned GEOM",
        "otherPossibleNames": [],
        "logicalName": "CIRCLES_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1544,
          "offsetEnd": 1545,
          "columnNum": 253
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Circles / Expressing Geometric Properties with Equations percent correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "CIRCLES_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1546,
          "offsetEnd": 1548,
          "columnNum": 254
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Geometric Measurement & Dimension / Modeling with Geometry points earned GEOM",
        "otherPossibleNames": [],
        "logicalName": "GEOMETRIC_MEASUREMENT_&_DIMENSION_MODELING_WITH_GEOMETRY_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1549,
          "offsetEnd": 1550,
          "columnNum": 255
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Geometric Measurement & Dimension / Modeling with Geometry percent correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "GEOMETRIC_MEASUREMENT_&_DIMENSION_MODELING_WITH_GEOMETRY_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1551,
          "offsetEnd": 1553,
          "columnNum": 256
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 1554",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1554,
          "offsetEnd": 1555,
          "columnNum": 257
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 1556",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1556,
          "offsetEnd": 1558,
          "columnNum": 258
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1559,
          "offsetEnd": 1560,
          "columnNum": 259
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1561,
          "offsetEnd": 1564,
          "columnNum": 260
        },
        "fieldLength": 4,
        "expectedValues": ["", "05", "06", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous scale score",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1565,
          "offsetEnd": 1567,
          "columnNum": 261
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1568,
          "offsetEnd": 1570,
          "columnNum": 262
        },
        "fieldLength": 3,
        "expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void for Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1571,
          "offsetEnd": 1571,
          "columnNum": 263
        },
        "fieldLength": 1,
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
          "offsetStart": 1572,
          "offsetEnd": 1575,
          "columnNum": 264
        },
        "fieldLength": 4,
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
          "offsetStart": 1576,
          "offsetEnd": 1578,
          "columnNum": 265
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Admin Error Administration",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1579,
          "offsetEnd": 1579,
          "columnNum": 266
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
          "offsetStart": 1580,
          "offsetEnd": 1580,
          "columnNum": 267
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form",
        "otherPossibleNames": [],
        "logicalName": "FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1581,
          "offsetEnd": 1588,
          "columnNum": 268
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1589,
          "offsetEnd": 1618,
          "columnNum": 269
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher First Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1619,
          "offsetEnd": 1648,
          "columnNum": 270
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1649,
          "offsetEnd": 1649,
          "columnNum": 271
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1650,
          "offsetEnd": 1679,
          "columnNum": 272
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1680,
          "offsetEnd": 1709,
          "columnNum": 273
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1710,
          "offsetEnd": 1710,
          "columnNum": 274
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period BIO",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1711,
          "offsetEnd": 1712,
          "columnNum": 275
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Course Name",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1713,
          "offsetEnd": 1737,
          "columnNum": 276
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1738,
          "offsetEnd": 1757,
          "columnNum": 277
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type BIO",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1758,
          "offsetEnd": 1758,
          "columnNum": 278
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content BIO",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1759,
          "offsetEnd": 1766,
          "columnNum": 279
        },
        "fieldLength": 8,
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
          "offsetStart": 1767,
          "offsetEnd": 1771,
          "columnNum": 280
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 1 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_1_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1772,
          "offsetEnd": 1772,
          "columnNum": 281
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 2 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_2_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1773,
          "offsetEnd": 1773,
          "columnNum": 282
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 3 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_3_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1774,
          "offsetEnd": 1774,
          "columnNum": 283
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Code BIO",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1775,
          "offsetEnd": 1777,
          "columnNum": 284
        },
        "fieldLength": 3,
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
          "offsetStart": 1778,
          "offsetEnd": 1780,
          "columnNum": 285
        },
        "fieldLength": 3,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form (consult test map for details of test form structure).",
        "otherPossibleNames": [],
        "logicalName": "MC_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1781,
          "offsetEnd": 1840,
          "columnNum": 286
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item scores - two bytes per score up to five scores.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1841,
          "offsetEnd": 1850,
          "columnNum": 287
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item score sources - one byte per score source, up to five score sources.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS_SOURCES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1851,
          "offsetEnd": 1855,
          "columnNum": 288
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar condition codes - two bytes per code, up to five codes.",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1856,
          "offsetEnd": 1865,
          "columnNum": 289
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item  parts - two bytes per CR item part code, up to 11 CR item part codes.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS_PARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1866,
          "offsetEnd": 1887,
          "columnNum": 290
        },
        "fieldLength": 22,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score BIO",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1888,
          "offsetEnd": 1890,
          "columnNum": 291
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score (Item 28) BIO",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1891,
          "offsetEnd": 1893,
          "columnNum": 292
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score BIO",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1894,
          "offsetEnd": 1896,
          "columnNum": 293
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct BIO",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1897,
          "offsetEnd": 1899,
          "columnNum": 294
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reportable status",
        "otherPossibleNames": [],
        "logicalName": "REPORTABLE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1900,
          "offsetEnd": 1900,
          "columnNum": 295
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "P", "R"],
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
          "offsetStart": 1901,
          "offsetEnd": 1909,
          "columnNum": 296
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Launch Flag",
        "otherPossibleNames": [],
        "logicalName": "TEST_LAUNCH_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1910,
          "offsetEnd": 1910,
          "columnNum": 297
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Valid Attempt BIO",
        "otherPossibleNames": [],
        "logicalName": "TEST_VALID_ATTEMPT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1911,
          "offsetEnd": 1911,
          "columnNum": 298
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void Flag BIO",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1912,
          "offsetEnd": 1912,
          "columnNum": 299
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1913,
          "offsetEnd": 1913,
          "columnNum": 300
        },
        "fieldLength": 1,
        "expectedValues": ["", "I", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 1914",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1914,
          "offsetEnd": 1914,
          "columnNum": 301
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Eligible Flag",
        "otherPossibleNames": [],
        "logicalName": "ELIGIBLE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1915,
          "offsetEnd": 1915,
          "columnNum": 302
        },
        "fieldLength": 1,
        "expectedValues": ["", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void BIO",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1916,
          "offsetEnd": 1916,
          "columnNum": 303
        },
        "fieldLength": 1,
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
          "offsetStart": 1917,
          "offsetEnd": 1923,
          "columnNum": 304
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score BIO",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1924,
          "offsetEnd": 1926,
          "columnNum": 305
        },
        "fieldLength": 3,
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
          "offsetStart": 1927,
          "offsetEnd": 1927,
          "columnNum": 306
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Level BIO",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1928,
          "offsetEnd": 1944,
          "columnNum": 307
        },
        "fieldLength": 17,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement BIO",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1945,
          "offsetEnd": 1947,
          "columnNum": 308
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Upper CI BIO",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1948,
          "offsetEnd": 1950,
          "columnNum": 309
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower CI BIO",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1951,
          "offsetEnd": 1953,
          "columnNum": 310
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Science as Inquiry (strand 1)  points earned BIO",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1954,
          "offsetEnd": 1955,
          "columnNum": 311
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Science as Inquiry (strand 1)  percent correct BIO",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1956,
          "offsetEnd": 1958,
          "columnNum": 312
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Life Science (strand 3) points earned BIO",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1959,
          "offsetEnd": 1960,
          "columnNum": 313
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Life Science (strand 3) percent correct BIO",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1961,
          "offsetEnd": 1963,
          "columnNum": 314
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Earth and Space Science (strand 4)  points earned BIO",
        "otherPossibleNames": [],
        "logicalName": "EARTH_AND_SPACE_SCIENCE_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1964,
          "offsetEnd": 1965,
          "columnNum": 315
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Earth and Space Science (strand 4) percent correct BIO",
        "otherPossibleNames": [],
        "logicalName": "EARTH_AND_SPACE_SCIENCE_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1966,
          "offsetEnd": 1968,
          "columnNum": 316
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1969,
          "offsetEnd": 1970,
          "columnNum": 317
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1971,
          "offsetEnd": 1974,
          "columnNum": 318
        },
        "fieldLength": 4,
        "expectedValues": ["", "05", "06", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous scale score",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1975,
          "offsetEnd": 1977,
          "columnNum": 319
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1978,
          "offsetEnd": 1980,
          "columnNum": 320
        },
        "fieldLength": 3,
        "expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void for Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1981,
          "offsetEnd": 1981,
          "columnNum": 321
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 1Investigate Rating",
        "otherPossibleNames": [],
        "logicalName": "INVESTIGATE_RATING_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1982,
          "offsetEnd": 1982,
          "columnNum": 322
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 2Evaluate Rating",
        "otherPossibleNames": [],
        "logicalName": "EVALUATE_RATING_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1983,
          "offsetEnd": 1983,
          "columnNum": 323
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 3Reason Scientifically Rating",
        "otherPossibleNames": [],
        "logicalName": "REASON_SCIENTIFICALLY_RATING_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1984,
          "offsetEnd": 1984,
          "columnNum": 324
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 4 Rating (FILLER)",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1985,
          "offsetEnd": 1985,
          "columnNum": 325
        },
        "fieldLength": 1,
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
          "offsetStart": 1986,
          "offsetEnd": 1987,
          "columnNum": 326
        },
        "fieldLength": 2,
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
          "offsetStart": 1988,
          "offsetEnd": 1989,
          "columnNum": 327
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Admin Error Administration",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1990,
          "offsetEnd": 1990,
          "columnNum": 328
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
          "offsetStart": 1991,
          "offsetEnd": 1991,
          "columnNum": 329
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form",
        "otherPossibleNames": [],
        "logicalName": "FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1992,
          "offsetEnd": 1999,
          "columnNum": 330
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2000,
          "offsetEnd": 2029,
          "columnNum": 331
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher First Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2030,
          "offsetEnd": 2059,
          "columnNum": 332
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2060,
          "offsetEnd": 2060,
          "columnNum": 333
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2061,
          "offsetEnd": 2090,
          "columnNum": 334
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2091,
          "offsetEnd": 2120,
          "columnNum": 335
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2121,
          "offsetEnd": 2121,
          "columnNum": 336
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period ENGIII",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2122,
          "offsetEnd": 2123,
          "columnNum": 337
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Course Name",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2124,
          "offsetEnd": 2148,
          "columnNum": 338
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2149,
          "offsetEnd": 2168,
          "columnNum": 339
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type ENGIII",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2169,
          "offsetEnd": 2169,
          "columnNum": 340
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content ENGIII",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2170,
          "offsetEnd": 2177,
          "columnNum": 341
        },
        "fieldLength": 8,
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
          "offsetStart": 2178,
          "offsetEnd": 2182,
          "columnNum": 342
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 1 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_1_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2183,
          "offsetEnd": 2183,
          "columnNum": 343
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 2 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_2_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2184,
          "offsetEnd": 2184,
          "columnNum": 344
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 3 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_3_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2185,
          "offsetEnd": 2185,
          "columnNum": 345
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Code ENGIII",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2186,
          "offsetEnd": 2188,
          "columnNum": 346
        },
        "fieldLength": 3,
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
          "offsetStart": 2189,
          "offsetEnd": 2191,
          "columnNum": 347
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form (consult test map for details of test form structure).",
        "otherPossibleNames": [],
        "logicalName": "MC_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2192,
          "offsetEnd": 2259,
          "columnNum": 348
        },
        "fieldLength": 68,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 1",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2260,
          "offsetEnd": 2261,
          "columnNum": 349
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 2",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2262,
          "offsetEnd": 2263,
          "columnNum": 350
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 3",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2264,
          "offsetEnd": 2264,
          "columnNum": 351
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 4",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2265,
          "offsetEnd": 2265,
          "columnNum": 352
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 5",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2266,
          "offsetEnd": 2266,
          "columnNum": 353
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 6",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_DIM_6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2267,
          "offsetEnd": 2267,
          "columnNum": 354
        },
        "fieldLength": 1,
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
          "offsetStart": 2268,
          "offsetEnd": 2269,
          "columnNum": 355
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Source code",
        "otherPossibleNames": [],
        "logicalName": "SOURCE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2270,
          "offsetEnd": 2270,
          "columnNum": 356
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar Condition Code",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2271,
          "offsetEnd": 2272,
          "columnNum": 357
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for WP",
        "otherPossibleNames": [],
        "logicalName": "WP_SCORING_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2273,
          "offsetEnd": 2274,
          "columnNum": 358
        },
        "fieldLength": 2,
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
          "offsetStart": 2275,
          "offsetEnd": 2297,
          "columnNum": 359
        },
        "fieldLength": 23,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score ENGIII",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2298,
          "offsetEnd": 2300,
          "columnNum": 360
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score ENGIII",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2301,
          "offsetEnd": 2303,
          "columnNum": 361
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score ENGIII",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2304,
          "offsetEnd": 2306,
          "columnNum": 362
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct ENGIII",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2307,
          "offsetEnd": 2309,
          "columnNum": 363
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reportable Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTABLE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2310,
          "offsetEnd": 2310,
          "columnNum": 364
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "P", "R"],
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
          "offsetStart": 2311,
          "offsetEnd": 2319,
          "columnNum": 365
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Launch Flag",
        "otherPossibleNames": [],
        "logicalName": "TEST_LAUNCH_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2320,
          "offsetEnd": 2320,
          "columnNum": 366
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Valid Attempt ENGIII",
        "otherPossibleNames": [],
        "logicalName": "TEST_VALID_ATTEMPT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2321,
          "offsetEnd": 2321,
          "columnNum": 367
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void Flag ENGIII",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2322,
          "offsetEnd": 2322,
          "columnNum": 368
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2323,
          "offsetEnd": 2323,
          "columnNum": 369
        },
        "fieldLength": 1,
        "expectedValues": ["", "I", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2324",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2324,
          "offsetEnd": 2324,
          "columnNum": 370
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Eligible Flag",
        "otherPossibleNames": [],
        "logicalName": "ELIGIBLE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2325,
          "offsetEnd": 2325,
          "columnNum": 371
        },
        "fieldLength": 1,
        "expectedValues": ["", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void ENGIII",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2326,
          "offsetEnd": 2326,
          "columnNum": 372
        },
        "fieldLength": 1,
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
          "offsetStart": 2327,
          "offsetEnd": 2333,
          "columnNum": 373
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score ENGIII",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2334,
          "offsetEnd": 2336,
          "columnNum": 374
        },
        "fieldLength": 3,
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
          "offsetStart": 2337,
          "offsetEnd": 2337,
          "columnNum": 375
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Level ENGIII",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2338,
          "offsetEnd": 2354,
          "columnNum": 376
        },
        "fieldLength": 17,
        "expectedValues": ["E", "G", "F", "NI", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement ENGIII",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2355,
          "offsetEnd": 2357,
          "columnNum": 377
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Upper CI ENGIII",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2358,
          "offsetEnd": 2360,
          "columnNum": 378
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower CI ENGIII",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2361,
          "offsetEnd": 2363,
          "columnNum": 379
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing and Language Conventions points earned ENGIII",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2364,
          "offsetEnd": 2365,
          "columnNum": 380
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing and Language Conventions percent correct ENGIII",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2366,
          "offsetEnd": 2368,
          "columnNum": 381
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading points earned ENGIII",
        "otherPossibleNames": [],
        "logicalName": "READING_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2369,
          "offsetEnd": 2370,
          "columnNum": 382
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading percent correct ENGIII",
        "otherPossibleNames": [],
        "logicalName": "READING_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2371,
          "offsetEnd": 2373,
          "columnNum": 383
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Research points earned ENGIII",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2374,
          "offsetEnd": 2375,
          "columnNum": 384
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Research percent correct ENGIII",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2376,
          "offsetEnd": 2378,
          "columnNum": 385
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2379",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2379,
          "offsetEnd": 2380,
          "columnNum": 386
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2381",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2381,
          "offsetEnd": 2383,
          "columnNum": 387
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2384",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2384,
          "offsetEnd": 2385,
          "columnNum": 388
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2386",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2386,
          "offsetEnd": 2388,
          "columnNum": 389
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2389,
          "offsetEnd": 2390,
          "columnNum": 390
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2391,
          "offsetEnd": 2394,
          "columnNum": 391
        },
        "fieldLength": 4,
        "expectedValues": ["", "05", "06", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous scale score",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2391,
          "offsetEnd": 2397,
          "columnNum": 392
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2395,
          "offsetEnd": 2400,
          "columnNum": 393
        },
        "fieldLength": 3,
        "expectedValues": ["E", "G", "F", "NI", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void for Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2398,
          "offsetEnd": 2401,
          "columnNum": 394
        },
        "fieldLength": 1,
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
          "offsetStart": 2402,
          "offsetEnd": 2404,
          "columnNum": 395
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Admin Error Administration",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2405,
          "offsetEnd": 2405,
          "columnNum": 396
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form",
        "otherPossibleNames": [],
        "logicalName": "FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2406,
          "offsetEnd": 2413,
          "columnNum": 397
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2414,
          "offsetEnd": 2443,
          "columnNum": 398
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher First Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2444,
          "offsetEnd": 2473,
          "columnNum": 399
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2474,
          "offsetEnd": 2474,
          "columnNum": 400
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2475,
          "offsetEnd": 2504,
          "columnNum": 401
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2505,
          "offsetEnd": 2534,
          "columnNum": 402
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2535,
          "offsetEnd": 2535,
          "columnNum": 403
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period USHIST",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2536,
          "offsetEnd": 2537,
          "columnNum": 404
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Course Name",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2538,
          "offsetEnd": 2562,
          "columnNum": 405
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2563,
          "offsetEnd": 2582,
          "columnNum": 406
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type USHIST",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2583,
          "offsetEnd": 2583,
          "columnNum": 407
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content USHIST",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2584,
          "offsetEnd": 2591,
          "columnNum": 408
        },
        "fieldLength": 8,
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
          "offsetStart": 2592,
          "offsetEnd": 2595,
          "columnNum": 409
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 1 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_1_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2596,
          "offsetEnd": 2596,
          "columnNum": 410
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 2 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_2_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2597,
          "offsetEnd": 2597,
          "columnNum": 411
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 3/3A Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_3_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2598,
          "offsetEnd": 2598,
          "columnNum": 412
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 3B Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_3B_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2599,
          "offsetEnd": 2599,
          "columnNum": 413
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Code USHIST",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2600,
          "offsetEnd": 2602,
          "columnNum": 414
        },
        "fieldLength": 3,
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
          "offsetStart": 2603,
          "offsetEnd": 2605,
          "columnNum": 415
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form (consult test map for details of test form structure).",
        "otherPossibleNames": [],
        "logicalName": "MC_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2606,
          "offsetEnd": 2665,
          "columnNum": 416
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item scores - two bytes per score up to five scores.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2666,
          "offsetEnd": 2675,
          "columnNum": 417
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item score sources - one byte per score source, up to five score sources.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS_SOURCES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2676,
          "offsetEnd": 2680,
          "columnNum": 418
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar condition codes - two bytes per code, up to five codes.",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2681,
          "offsetEnd": 2690,
          "columnNum": 419
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item  parts - two bytes per CR item part code, up to 11 CR item part codes.",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEMS_PARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2691,
          "offsetEnd": 2712,
          "columnNum": 420
        },
        "fieldLength": 22,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score USHIST",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2713,
          "offsetEnd": 2715,
          "columnNum": 421
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score (Item 31) USHIST",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2716,
          "offsetEnd": 2718,
          "columnNum": 422
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score USHIST",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2719,
          "offsetEnd": 2721,
          "columnNum": 423
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct USHIST",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2722,
          "offsetEnd": 2724,
          "columnNum": 424
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reportable status",
        "otherPossibleNames": [],
        "logicalName": "REPORTABLE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2725,
          "offsetEnd": 2725,
          "columnNum": 425
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "P", "R"],
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
          "offsetStart": 2726,
          "offsetEnd": 2734,
          "columnNum": 426
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Launch Flag",
        "otherPossibleNames": [],
        "logicalName": "TEST_LAUNCH_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2735,
          "offsetEnd": 2735,
          "columnNum": 427
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Valid Attempt USHIST",
        "otherPossibleNames": [],
        "logicalName": "TEST_VALID_ATTEMPT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2736,
          "offsetEnd": 2736,
          "columnNum": 428
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void Flag USHIST",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2737,
          "offsetEnd": 2737,
          "columnNum": 429
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2738,
          "offsetEnd": 2738,
          "columnNum": 430
        },
        "fieldLength": 1,
        "expectedValues": ["", "I", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2739",
        "otherPossibleNames": [],
        "logicalName": "RETIRED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2739,
          "offsetEnd": 2739,
          "columnNum": 431
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Eligible Flag",
        "otherPossibleNames": [],
        "logicalName": "ELIGIBLE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2740,
          "offsetEnd": 2740,
          "columnNum": 432
        },
        "fieldLength": 1,
        "expectedValues": ["", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void USHIST",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2741,
          "offsetEnd": 2741,
          "columnNum": 433
        },
        "fieldLength": 1,
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
          "offsetStart": 2742,
          "offsetEnd": 2748,
          "columnNum": 434
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score USHIST",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2749,
          "offsetEnd": 2751,
          "columnNum": 435
        },
        "fieldLength": 3,
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
          "offsetStart": 2752,
          "offsetEnd": 2752,
          "columnNum": 436
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Level USHIST",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2753,
          "offsetEnd": 2769,
          "columnNum": 437
        },
        "fieldLength": 17,
        "expectedValues": ["E", "G", "F", "NI", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement USHIST",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2770,
          "offsetEnd": 2772,
          "columnNum": 438
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Upper CI USHIST",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2773,
          "offsetEnd": 2775,
          "columnNum": 439
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower CI USHIST",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2776,
          "offsetEnd": 2778,
          "columnNum": 440
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Western Expansion to Progressivism - Standard 2 - points earned USHIST",
        "otherPossibleNames": [],
        "logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_RAW_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2779,
          "offsetEnd": 2780,
          "columnNum": 441
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Western Expansion to Progressivism - Standard 2 - percent correct USHIST",
        "otherPossibleNames": [],
        "logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2781,
          "offsetEnd": 2783,
          "columnNum": 442
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Isolationism through the Great War - Standard 3 - points earned USHIST",
        "otherPossibleNames": [],
        "logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2784,
          "offsetEnd": 2785,
          "columnNum": 443
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Isolationism through the Great War - Standard 3 - percent correct USHIST",
        "otherPossibleNames": [],
        "logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2786,
          "offsetEnd": 2788,
          "columnNum": 444
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Becoming a World Power through World War II - Standard 4 - points earned USHIST",
        "otherPossibleNames": [],
        "logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2789,
          "offsetEnd": 2790,
          "columnNum": 445
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Becoming a World Power through World War II - Standard 4 - percent correct USHIST",
        "otherPossibleNames": [],
        "logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2791,
          "offsetEnd": 2793,
          "columnNum": 446
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Cold War Era and The Modern Age - Standard 5 and 6 - points earned",
        "otherPossibleNames": [],
        "logicalName": "COLD_WAR_ERA_-_STANDARD_5_-_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2794,
          "offsetEnd": 2795,
          "columnNum": 447
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Cold War Era and The Modern Age - Standard 5 and 6 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "COLD_WAR_ERA_-_STANDARD_5_-_PERCENT_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2796,
          "offsetEnd": 2798,
          "columnNum": 448
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "The Modern Age - Standard 6 -points earned",
        "otherPossibleNames": [],
        "logicalName": "THE_MODERN_AGE_-_STANDARD_6_-_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2799,
          "offsetEnd": 2800,
          "columnNum": 449
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "The Modern Age - Standard 6 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "THE_MODERN_AGE_-_STANDARD_6_-_PERCENT_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2801,
          "offsetEnd": 2803,
          "columnNum": 450
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2804,
          "offsetEnd": 2805,
          "columnNum": 451
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2806,
          "offsetEnd": 2809,
          "columnNum": 452
        },
        "fieldLength": 4,
        "expectedValues": ["", "05", "06", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous scale score",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2810,
          "offsetEnd": 2812,
          "columnNum": 453
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2813,
          "offsetEnd": 2815,
          "columnNum": 454
        },
        "fieldLength": 3,
        "expectedValues": ["E", "G", "F", "NI", "UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void for Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2816,
          "offsetEnd": 2816,
          "columnNum": 455
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Western Expansion to Progressivism - Standard 2 - Rating USHIST",
        "otherPossibleNames": [],
        "logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_RATING_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2817,
          "offsetEnd": 2817,
          "columnNum": 456
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Isolationism through the Great War - Standard 3 - Rating USHIST",
        "otherPossibleNames": [],
        "logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_RATING_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2818,
          "offsetEnd": 2818,
          "columnNum": 457
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Becoming a World Power through World War II - Standard 4 - Rating USHIST",
        "otherPossibleNames": [],
        "logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_RATING_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2819,
          "offsetEnd": 2819,
          "columnNum": 458
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Cold War Era and The Modern Age - Standard 5 and 6 - Rating USHIST",
        "otherPossibleNames": [],
        "logicalName": "COLD_WAR_ERA_-_STANDARD_5_-_RATING_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2820,
          "offsetEnd": 2820,
          "columnNum": 459
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "The Modern Age - Standard 6 - Rating USHIST",
        "otherPossibleNames": [],
        "logicalName": "THE_MODERN_AGE_-_STANDARD_6_-_RATING_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2821,
          "offsetEnd": 2821,
          "columnNum": 460
        },
        "fieldLength": 1,
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
          "offsetStart": 2822,
          "offsetEnd": 2823,
          "columnNum": 461
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2824,
          "offsetEnd": 2824,
          "columnNum": 462
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spanish Test",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2825,
          "offsetEnd": 2825,
          "columnNum": 463
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2826",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEXT_TO_SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2826,
          "offsetEnd": 2826,
          "columnNum": 464
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2827,
          "offsetEnd": 2827,
          "columnNum": 465
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2828,
          "offsetEnd": 2828,
          "columnNum": 466
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2829,
          "offsetEnd": 2829,
          "columnNum": 467
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2830,
          "offsetEnd": 2830,
          "columnNum": 468
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2831,
          "offsetEnd": 2831,
          "columnNum": 469
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2832,
          "offsetEnd": 2832,
          "columnNum": 470
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2833,
          "offsetEnd": 2833,
          "columnNum": 471
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2834,
          "offsetEnd": 2834,
          "columnNum": 472
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Calculator",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2835,
          "offsetEnd": 2835,
          "columnNum": 473
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scientific Calculator",
        "otherPossibleNames": [],
        "logicalName": "SCIENTIFIC_CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2836,
          "offsetEnd": 2836,
          "columnNum": 474
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Graphing Calculator",
        "otherPossibleNames": [],
        "logicalName": "GRAPHING_CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2837,
          "offsetEnd": 2837,
          "columnNum": 475
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 2838,
          "offsetEnd": 2838,
          "columnNum": 476
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2839,
          "offsetEnd": 2839,
          "columnNum": 477
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2840,
          "offsetEnd": 2857,
          "columnNum": 478
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2858,
          "offsetEnd": 2858,
          "columnNum": 479
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2859",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2859,
          "offsetEnd": 2859,
          "columnNum": 480
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2860",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2860,
          "offsetEnd": 2860,
          "columnNum": 481
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 2861,
          "offsetEnd": 2861,
          "columnNum": 482
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2862,
          "offsetEnd": 2862,
          "columnNum": 483
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2863,
          "offsetEnd": 2863,
          "columnNum": 484
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2864,
          "offsetEnd": 2864,
          "columnNum": 485
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2865,
          "offsetEnd": 2865,
          "columnNum": 486
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2866,
          "offsetEnd": 2866,
          "columnNum": 487
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
          "offsetStart": 2867,
          "offsetEnd": 2867,
          "columnNum": 488
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
          "offsetStart": 2868,
          "offsetEnd": 2868,
          "columnNum": 489
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2869",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2869,
          "offsetEnd": 2869,
          "columnNum": 490
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
          "offsetStart": 2870,
          "offsetEnd": 2870,
          "columnNum": 491
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2871,
          "offsetEnd": 2871,
          "columnNum": 492
        },
        "fieldLength": 1,
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
          "offsetStart": 2872,
          "offsetEnd": 2891,
          "columnNum": 493
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2892,
          "offsetEnd": 2892,
          "columnNum": 494
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spanish Test",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2893,
          "offsetEnd": 2893,
          "columnNum": 495
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2894",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEXT_TO_SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2894,
          "offsetEnd": 2894,
          "columnNum": 496
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2895,
          "offsetEnd": 2895,
          "columnNum": 497
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2896,
          "offsetEnd": 2896,
          "columnNum": 498
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2897,
          "offsetEnd": 2897,
          "columnNum": 499
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2898,
          "offsetEnd": 2898,
          "columnNum": 500
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2899,
          "offsetEnd": 2899,
          "columnNum": 501
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2900,
          "offsetEnd": 2900,
          "columnNum": 502
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2901,
          "offsetEnd": 2901,
          "columnNum": 503
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2902,
          "offsetEnd": 2902,
          "columnNum": 504
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Calculator",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2903,
          "offsetEnd": 2903,
          "columnNum": 505
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scientific Calculator",
        "otherPossibleNames": [],
        "logicalName": "SCIENTIFIC_CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2904,
          "offsetEnd": 2904,
          "columnNum": 506
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Graphing Calculator",
        "otherPossibleNames": [],
        "logicalName": "GRAPHING_CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2905,
          "offsetEnd": 2905,
          "columnNum": 507
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 2906,
          "offsetEnd": 2906,
          "columnNum": 508
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2907,
          "offsetEnd": 2907,
          "columnNum": 509
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2908,
          "offsetEnd": 2925,
          "columnNum": 510
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2926,
          "offsetEnd": 2926,
          "columnNum": 511
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2927",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2927,
          "offsetEnd": 2927,
          "columnNum": 512
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2928",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEXT_TO_SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2928,
          "offsetEnd": 2928,
          "columnNum": 513
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2929,
          "offsetEnd": 2929,
          "columnNum": 514
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2930,
          "offsetEnd": 2930,
          "columnNum": 515
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2931,
          "offsetEnd": 2931,
          "columnNum": 516
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2932,
          "offsetEnd": 2932,
          "columnNum": 517
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2933,
          "offsetEnd": 2933,
          "columnNum": 518
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2934,
          "offsetEnd": 2934,
          "columnNum": 519
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2935,
          "offsetEnd": 2935,
          "columnNum": 520
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2936,
          "offsetEnd": 2936,
          "columnNum": 521
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2937",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2937,
          "offsetEnd": 2937,
          "columnNum": 522
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2938,
          "offsetEnd": 2938,
          "columnNum": 523
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2939,
          "offsetEnd": 2939,
          "columnNum": 524
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2940,
          "offsetEnd": 2959,
          "columnNum": 525
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2960,
          "offsetEnd": 2960,
          "columnNum": 526
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2961",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2961,
          "offsetEnd": 2961,
          "columnNum": 527
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2962",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2962,
          "offsetEnd": 2962,
          "columnNum": 528
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 2963,
          "offsetEnd": 2963,
          "columnNum": 529
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2964,
          "offsetEnd": 2964,
          "columnNum": 530
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2965,
          "offsetEnd": 2965,
          "columnNum": 531
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2966,
          "offsetEnd": 2966,
          "columnNum": 532
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2967,
          "offsetEnd": 2967,
          "columnNum": 533
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2968,
          "offsetEnd": 2968,
          "columnNum": 534
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
          "offsetStart": 2969,
          "offsetEnd": 2969,
          "columnNum": 535
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
          "offsetStart": 2970,
          "offsetEnd": 2970,
          "columnNum": 536
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2971",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2971,
          "offsetEnd": 2971,
          "columnNum": 537
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
          "offsetStart": 2972,
          "offsetEnd": 2972,
          "columnNum": 538
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2973,
          "offsetEnd": 2973,
          "columnNum": 539
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
          "offsetStart": 2974,
          "offsetEnd": 2976,
          "columnNum": 540
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2977,
          "offsetEnd": 2977,
          "columnNum": 541
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2978",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2978,
          "offsetEnd": 2978,
          "columnNum": 542
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2979",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEXT_TO_SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2979,
          "offsetEnd": 2979,
          "columnNum": 543
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2980,
          "offsetEnd": 2980,
          "columnNum": 544
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2981,
          "offsetEnd": 2981,
          "columnNum": 545
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2982,
          "offsetEnd": 2982,
          "columnNum": 546
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2983,
          "offsetEnd": 2983,
          "columnNum": 547
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2984,
          "offsetEnd": 2984,
          "columnNum": 548
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2985,
          "offsetEnd": 2985,
          "columnNum": 549
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2986,
          "offsetEnd": 2986,
          "columnNum": 550
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2987,
          "offsetEnd": 2987,
          "columnNum": 551
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2988",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2988,
          "offsetEnd": 2988,
          "columnNum": 552
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2989,
          "offsetEnd": 2989,
          "columnNum": 553
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2990,
          "offsetEnd": 2990,
          "columnNum": 554
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 2991,
          "offsetEnd": 2993,
          "columnNum": 555
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2994,
          "offsetEnd": 2994,
          "columnNum": 556
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2995",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2995,
          "offsetEnd": 2995,
          "columnNum": 557
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 2996",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2996,
          "offsetEnd": 2996,
          "columnNum": 558
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 2997,
          "offsetEnd": 2997,
          "columnNum": 559
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2998,
          "offsetEnd": 2998,
          "columnNum": 560
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2999,
          "offsetEnd": 2999,
          "columnNum": 561
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3000,
          "offsetEnd": 3000,
          "columnNum": 562
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3001,
          "offsetEnd": 3001,
          "columnNum": 563
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3002,
          "offsetEnd": 3002,
          "columnNum": 564
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
          "offsetStart": 3003,
          "offsetEnd": 3003,
          "columnNum": 565
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
          "offsetStart": 3004,
          "offsetEnd": 3004,
          "columnNum": 566
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retired Field 3005",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3005,
          "offsetEnd": 3005,
          "columnNum": 567
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
          "offsetStart": 3006,
          "offsetEnd": 3006,
          "columnNum": 568
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3007,
          "offsetEnd": 3007,
          "columnNum": 569
        },
        "fieldLength": 1,
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
          "offsetStart": 3008,
          "offsetEnd": 3027,
          "columnNum": 570
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3028,
          "offsetEnd": 3030,
          "columnNum": 571
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level ENGII",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3031,
          "offsetEnd": 3033,
          "columnNum": 572
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level GEOM",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3034,
          "offsetEnd": 3036,
          "columnNum": 573
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level BIO",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3037,
          "offsetEnd": 3039,
          "columnNum": 574
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level ENGIII",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3040,
          "offsetEnd": 3042,
          "columnNum": 575
        },
        "fieldLength": 3,
        "expectedValues": ["EXC", "GOD", "FAI", "NIP", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level USHIST",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3043,
          "offsetEnd": 3045,
          "columnNum": 576
        },
        "fieldLength": 3,
        "expectedValues": ["EXC", "GOD", "FAI", "NIP", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Algebra I Enroll Flag",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_I_ENROLL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3046,
          "offsetEnd": 3046,
          "columnNum": 577
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "English II Enroll Flag",
        "otherPossibleNames": [],
        "logicalName": "ENGLISH_II_ENROLL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3047,
          "offsetEnd": 3047,
          "columnNum": 578
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Geometry Enroll Flag",
        "otherPossibleNames": [],
        "logicalName": "GEOMETRY_ENROLL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3048,
          "offsetEnd": 3048,
          "columnNum": 579
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Biology Enroll Flag",
        "otherPossibleNames": [],
        "logicalName": "BIOLOGY_ENROLL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3049,
          "offsetEnd": 3049,
          "columnNum": 580
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "English III Enroll Flag",
        "otherPossibleNames": [],
        "logicalName": "ENGLISH_III_ENROLL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3050,
          "offsetEnd": 3050,
          "columnNum": 581
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "US History Enroll Flag",
        "otherPossibleNames": [],
        "logicalName": "U.S._HISTORY_ENROLL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3051,
          "offsetEnd": 3051,
          "columnNum": 582
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Algebra I Cohort Flag",
        "otherPossibleNames": [],
        "logicalName": "ALGEBRA_I_COHORTFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3052,
          "offsetEnd": 3052,
          "columnNum": 583
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "English I Cohort Flag",
        "otherPossibleNames": [],
        "logicalName": "ENGLISH_I_COHORTFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3053,
          "offsetEnd": 3053,
          "columnNum": 584
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Algebra I Testing Site Code",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3054,
          "offsetEnd": 3059,
          "columnNum": 585
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "English II Testing Site Code",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3060,
          "offsetEnd": 3065,
          "columnNum": 586
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Geometry Testing Site Code",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3066,
          "offsetEnd": 3071,
          "columnNum": 587
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Biology Testing Site Code",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3072,
          "offsetEnd": 3077,
          "columnNum": 588
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "English III Testing Site Code",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3078,
          "offsetEnd": 3083,
          "columnNum": 589
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "US History Testing Site Code",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3084,
          "offsetEnd": 3089,
          "columnNum": 590
        },
        "fieldLength": 6,
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
          "offsetStart": 3090,
          "offsetEnd": 3109,
          "columnNum": 591
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Major Content Raw Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3110,
          "offsetEnd": 3113,
          "columnNum": 592
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Rating ALGI",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3114,
          "offsetEnd": 3114,
          "columnNum": 593
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Percent Correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3115,
          "offsetEnd": 3117,
          "columnNum": 594
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Raw Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3118,
          "offsetEnd": 3121,
          "columnNum": 595
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Rating ALGI",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3122,
          "offsetEnd": 3122,
          "columnNum": 596
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Percent Correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3123,
          "offsetEnd": 3125,
          "columnNum": 597
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Raw Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3126,
          "offsetEnd": 3129,
          "columnNum": 598
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Rating ALGI",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3130,
          "offsetEnd": 3130,
          "columnNum": 599
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Percent Correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3131,
          "offsetEnd": 3133,
          "columnNum": 600
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Raw Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3134,
          "offsetEnd": 3137,
          "columnNum": 601
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Rating ALGI",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3138,
          "offsetEnd": 3138,
          "columnNum": 602
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Percent Correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3139,
          "offsetEnd": 3141,
          "columnNum": 603
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Interpreting Functions Raw Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "INTERPRETING_FUNCTIONS_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3142,
          "offsetEnd": 3145,
          "columnNum": 604
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Interpreting Functions Rating ALGI",
        "otherPossibleNames": [],
        "logicalName": "INTERPRETING_FUNCTIONS_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3146,
          "offsetEnd": 3146,
          "columnNum": 605
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Interpreting Functions Percent Correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "INTERPRETING_FUNCTIONS_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3147,
          "offsetEnd": 3149,
          "columnNum": 606
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Solving Algebraically Raw Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "SOLVING_ALGEBRAICALLY_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3150,
          "offsetEnd": 3153,
          "columnNum": 607
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Solving Algebraically Rating ALGI",
        "otherPossibleNames": [],
        "logicalName": "SOLVING_ALGEBRAICALLY_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3154,
          "offsetEnd": 3154,
          "columnNum": 608
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Solving Algebraically Percent Correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "SOLVING_ALGEBRAICALLY_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3155,
          "offsetEnd": 3157,
          "columnNum": 609
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Solving Graphically/Rate of Change Raw Score ALGI",
        "otherPossibleNames": [],
        "logicalName": "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3158,
          "offsetEnd": 3161,
          "columnNum": 610
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Solving Graphically/Rate of Change Rating ALGI",
        "otherPossibleNames": [],
        "logicalName": "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3162,
          "offsetEnd": 3162,
          "columnNum": 611
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Solving Graphically/Rate of Change Percent Correct ALGI",
        "otherPossibleNames": [],
        "logicalName": "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3163,
          "offsetEnd": 3165,
          "columnNum": 612
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
          "offsetStart": 3166,
          "offsetEnd": 3185,
          "columnNum": 613
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Raw Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3186,
          "offsetEnd": 3189,
          "columnNum": 614
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Rating ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3190,
          "offsetEnd": 3190,
          "columnNum": 615
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Percent Correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3191,
          "offsetEnd": 3193,
          "columnNum": 616
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Raw Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3194,
          "offsetEnd": 3197,
          "columnNum": 617
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Rating ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3198,
          "offsetEnd": 3198,
          "columnNum": 618
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Percent Correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3199,
          "offsetEnd": 3201,
          "columnNum": 619
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Raw Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3202,
          "offsetEnd": 3205,
          "columnNum": 620
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Rating ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3206,
          "offsetEnd": 3206,
          "columnNum": 621
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Percent Correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3207,
          "offsetEnd": 3209,
          "columnNum": 622
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Written Expression Raw Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3210,
          "offsetEnd": 3213,
          "columnNum": 623
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Written Expression Rating ENGII",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3214,
          "offsetEnd": 3214,
          "columnNum": 624
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Written Expression Percent Correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3215,
          "offsetEnd": 3217,
          "columnNum": 625
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Raw Score ENGII",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3218,
          "offsetEnd": 3221,
          "columnNum": 626
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Rating ENGII",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3222,
          "offsetEnd": 3222,
          "columnNum": 627
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Percent Correct ENGII",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3223,
          "offsetEnd": 3225,
          "columnNum": 628
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
          "offsetStart": 3226,
          "offsetEnd": 3245,
          "columnNum": 629
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Raw Score ENGIII",
        "otherPossibleNames": [],
        "logicalName": "READING_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3246,
          "offsetEnd": 3249,
          "columnNum": 630
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Rating ENGIII",
        "otherPossibleNames": [],
        "logicalName": "READING_RATING_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3250,
          "offsetEnd": 3250,
          "columnNum": 631
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Percent Correct ENGIII",
        "otherPossibleNames": [],
        "logicalName": "READING_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3251,
          "offsetEnd": 3253,
          "columnNum": 632
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Writing Raw Score ENGIII",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3254,
          "offsetEnd": 3257,
          "columnNum": 633
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing Rating ENGIII",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RATING_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3258,
          "offsetEnd": 3258,
          "columnNum": 634
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Writing Percent Correct ENGIII",
        "otherPossibleNames": [],
        "logicalName": "WRITING_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3259,
          "offsetEnd": 3261,
          "columnNum": 635
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
          "offsetStart": 3262,
          "offsetEnd": 3281,
          "columnNum": 636
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Major Content Raw Score GEOM",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3282,
          "offsetEnd": 3285,
          "columnNum": 637
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Rating GEOM",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3286,
          "offsetEnd": 3286,
          "columnNum": 638
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Percent Correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3287,
          "offsetEnd": 3289,
          "columnNum": 639
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Raw Score GEOM",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3290,
          "offsetEnd": 3293,
          "columnNum": 640
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Rating GEOM",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3294,
          "offsetEnd": 3294,
          "columnNum": 641
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Percent Correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3295,
          "offsetEnd": 3297,
          "columnNum": 642
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Raw Score GEOM",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3298,
          "offsetEnd": 3301,
          "columnNum": 643
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Rating GEOM",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3302,
          "offsetEnd": 3302,
          "columnNum": 644
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Percent Correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3303,
          "offsetEnd": 3305,
          "columnNum": 645
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Raw Score GEOM",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3306,
          "offsetEnd": 3309,
          "columnNum": 646
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Rating GEOM",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3310,
          "offsetEnd": 3310,
          "columnNum": 647
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Percent Correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3311,
          "offsetEnd": 3313,
          "columnNum": 648
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
          "offsetStart": 3314,
          "offsetEnd": 3323,
          "columnNum": 649
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Congruence Transformations/Similarity Raw Score GEOM",
        "otherPossibleNames": [],
        "logicalName": "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3324,
          "offsetEnd": 3327,
          "columnNum": 650
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Congruence Transformations/Similarity Rating GEOM",
        "otherPossibleNames": [],
        "logicalName": "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3328,
          "offsetEnd": 3328,
          "columnNum": 651
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Congruence Transformations/Similarity Percent Correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3329,
          "offsetEnd": 3331,
          "columnNum": 652
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Similarity in Trigonometry/Modeling & Applying  Raw Score GEOM",
        "otherPossibleNames": [],
        "logicalName": "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3332,
          "offsetEnd": 3335,
          "columnNum": 653
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Similarity in Trigonometry/Modeling & Applying Rating GEOM",
        "otherPossibleNames": [],
        "logicalName": "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3336,
          "offsetEnd": 3336,
          "columnNum": 654
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Similarity in Trigonometry/Modeling & Applying Percent Correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3337,
          "offsetEnd": 3339,
          "columnNum": 655
        },
        "fieldLength": 3,
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
          "offsetStart": 3340,
          "offsetEnd": 3359,
          "columnNum": 656
        },
        "fieldLength": 20,
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
          "offsetStart": 3360,
          "offsetEnd": 3361,
          "columnNum": 657
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Admin Error Administration",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3362,
          "offsetEnd": 3362,
          "columnNum": 658
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
          "offsetStart": 3363,
          "offsetEnd": 3363,
          "columnNum": 659
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form",
        "otherPossibleNames": [],
        "logicalName": "FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3364,
          "offsetEnd": 3371,
          "columnNum": 660
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3372,
          "offsetEnd": 3401,
          "columnNum": 661
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher First Name",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3402,
          "offsetEnd": 3431,
          "columnNum": 662
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3432,
          "offsetEnd": 3432,
          "columnNum": 663
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3433,
          "offsetEnd": 3462,
          "columnNum": 664
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3463,
          "offsetEnd": 3492,
          "columnNum": 665
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3493,
          "offsetEnd": 3493,
          "columnNum": 666
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period ENGI",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3494,
          "offsetEnd": 3495,
          "columnNum": 667
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Course Name",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3496,
          "offsetEnd": 3520,
          "columnNum": 668
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3521,
          "offsetEnd": 3540,
          "columnNum": 669
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Testing Site Code",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3541,
          "offsetEnd": 3546,
          "columnNum": 670
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "English I Enroll Flag",
        "otherPossibleNames": [],
        "logicalName": "ENGLISH_I_ENROLL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3547,
          "offsetEnd": 3547,
          "columnNum": 671
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content ENGI",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3548,
          "offsetEnd": 3555,
          "columnNum": 672
        },
        "fieldLength": 8,
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
          "offsetStart": 3556,
          "offsetEnd": 3560,
          "columnNum": 673
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 1 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_1_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3561,
          "offsetEnd": 3561,
          "columnNum": 674
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 2 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_2_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3562,
          "offsetEnd": 3562,
          "columnNum": 675
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Session 3 Completed",
        "otherPossibleNames": [],
        "logicalName": "SESSION_3_COMPLETED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3563,
          "offsetEnd": 3563,
          "columnNum": 676
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Code ENGI",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3564,
          "offsetEnd": 3566,
          "columnNum": 677
        },
        "fieldLength": 3,
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
          "offsetStart": 3567,
          "offsetEnd": 3586,
          "columnNum": 678
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3587,
          "offsetEnd": 3589,
          "columnNum": 679
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3590,
          "offsetEnd": 3592,
          "columnNum": 680
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3593,
          "offsetEnd": 3595,
          "columnNum": 681
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct ENGI",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3596,
          "offsetEnd": 3598,
          "columnNum": 682
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reportable Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTABLE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3599,
          "offsetEnd": 3599,
          "columnNum": 683
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level ENGI",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3600,
          "offsetEnd": 3602,
          "columnNum": 684
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
          "offsetStart": 3603,
          "offsetEnd": 3611,
          "columnNum": 685
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Launch Flag",
        "otherPossibleNames": [],
        "logicalName": "TEST_LAUNCH_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3612,
          "offsetEnd": 3612,
          "columnNum": 686
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Valid Attempt ENGI",
        "otherPossibleNames": [],
        "logicalName": "TEST_VALID_ATTEMPT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3613,
          "offsetEnd": 3613,
          "columnNum": 687
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void Flag ENGI",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3614,
          "offsetEnd": 3614,
          "columnNum": 688
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3615,
          "offsetEnd": 3615,
          "columnNum": 689
        },
        "fieldLength": 1,
        "expectedValues": ["", "I", "P", "R"],
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
          "offsetStart": 3616,
          "offsetEnd": 3616,
          "columnNum": 690
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Eligible Flag",
        "otherPossibleNames": [],
        "logicalName": "ELIGIBLE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3617,
          "offsetEnd": 3617,
          "columnNum": 691
        },
        "fieldLength": 1,
        "expectedValues": ["", "E"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void ENGI",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3618,
          "offsetEnd": 3618,
          "columnNum": 692
        },
        "fieldLength": 1,
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
          "offsetStart": 3619,
          "offsetEnd": 3624,
          "columnNum": 693
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3625,
          "offsetEnd": 3627,
          "columnNum": 694
        },
        "fieldLength": 3,
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
          "offsetStart": 3628,
          "offsetEnd": 3628,
          "columnNum": 695
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Level ENGI",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3629,
          "offsetEnd": 3631,
          "columnNum": 696
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement ENGI",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3632,
          "offsetEnd": 3634,
          "columnNum": 697
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Upper CI ENGI",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3635,
          "offsetEnd": 3637,
          "columnNum": 698
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower CI ENGI",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3638,
          "offsetEnd": 3640,
          "columnNum": 699
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Raw Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3641,
          "offsetEnd": 3644,
          "columnNum": 700
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Rating ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3645,
          "offsetEnd": 3645,
          "columnNum": 701
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Percent Correct ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_PERCENT_CORRECT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3646,
          "offsetEnd": 3648,
          "columnNum": 702
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Raw Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3649,
          "offsetEnd": 3652,
          "columnNum": 703
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Rating ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3653,
          "offsetEnd": 3653,
          "columnNum": 704
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Percent Correct ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_PERCENT_CORRECT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3654,
          "offsetEnd": 3656,
          "columnNum": 705
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Raw Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3657,
          "offsetEnd": 3660,
          "columnNum": 706
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Rating ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3661,
          "offsetEnd": 3661,
          "columnNum": 707
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Percent Correct ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_PERCENT_CORRECT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3662,
          "offsetEnd": 3664,
          "columnNum": 708
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Written Expression Raw Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3665,
          "offsetEnd": 3668,
          "columnNum": 709
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Written Expression Rating ENGI",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3669,
          "offsetEnd": 3669,
          "columnNum": 710
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Written Expression Percent Correct ENGI",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_PERCENT_CORRECT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3670,
          "offsetEnd": 3672,
          "columnNum": 711
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Raw Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3673,
          "offsetEnd": 3676,
          "columnNum": 712
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Rating ENGI",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3677,
          "offsetEnd": 3677,
          "columnNum": 713
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Percent Correct ENGI",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3678,
          "offsetEnd": 3680,
          "columnNum": 714
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
          "offsetStart": 3681,
          "offsetEnd": 3700,
          "columnNum": 715
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Raw Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3701,
          "offsetEnd": 3704,
          "columnNum": 716
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Rating ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3705,
          "offsetEnd": 3705,
          "columnNum": 717
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Percent Correct ENGI",
        "otherPossibleNames": [],
        "logicalName": "READING_PERCENT_CORRECT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3706,
          "offsetEnd": 3708,
          "columnNum": 718
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Writing Raw Score ENGI",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3709,
          "offsetEnd": 3712,
          "columnNum": 719
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing Rating ENGI",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3713,
          "offsetEnd": 3713,
          "columnNum": 720
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing Percent Correct ENGI",
        "otherPossibleNames": [],
        "logicalName": "WRITING_PERCENT_CORRECT_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3714,
          "offsetEnd": 3716,
          "columnNum": 721
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
          "offsetStart": 3717,
          "offsetEnd": 3736,
          "columnNum": 722
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3737,
          "offsetEnd": 3738,
          "columnNum": 723
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3739,
          "offsetEnd": 3742,
          "columnNum": 724
        },
        "fieldLength": 4,
        "expectedValues": ["", "05", "06", "12"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous scale score",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3743,
          "offsetEnd": 3745,
          "columnNum": 725
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ASSESSMENT_ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3746,
          "offsetEnd": 3748,
          "columnNum": 726
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void for Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUSLY_VOIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3749,
          "offsetEnd": 3749,
          "columnNum": 727
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "File Creation Date and Time Stamp",
        "otherPossibleNames": [],
        "logicalName": "DATE_AND_TIME_STAMP",
        "formatMask": "yyyy-MM-dd HH:MM:SS",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3750,
          "offsetEnd": 3768,
          "columnNum": 728
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}