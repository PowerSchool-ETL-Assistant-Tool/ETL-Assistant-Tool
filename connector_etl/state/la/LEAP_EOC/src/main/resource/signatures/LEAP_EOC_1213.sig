{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "LEAP_EOC_1213",
    "quoteDelim": "\"",
    "fieldDelim": null,
    "hasHeader": true,
    "naturalKey": ["STATE_ID", "TEST_DATE_MONTH", "TEST_DATE_YEAR"],
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
      "dataTypes": "INTEGER",
      "scale": null
    },
      {
        "physicalName": "Test Date-Month",
        "otherPossibleNames": [],
        "logicalName": "TEST_DATE_MONTH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
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
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 13,
          "offsetEnd": 16,
          "columnNum": 3
        },
        "fieldLength": 4,
        "expectedValues": [],
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
        "dataTypes": "INTEGER",
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
        "physicalName": "District Name",
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
        "expectedValues": ["LAB", "CHA", "TRI", "NPB", "STA", "BSE", "OJJ", "MAR", "RLA", "RNO", "LEA", "RES", "JUV", "RBR", "NPS"],
        "dataTypes": "STRING",
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
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transfer within Administration Flag",
        "otherPossibleNames": [],
        "logicalName": "TRANSFER_WITHIN_ADMINISTRATION_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 136,
          "offsetEnd": 136,
          "columnNum": 11
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
        "expectedValues": ["", "1", "2", "3", "4", "5"],
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
        "physicalName": "Admin Error Administration",
        "otherPossibleNames": [],
        "logicalName": "ADMIN_ERROR_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 144,
          "offsetEnd": 144,
          "columnNum": 14
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 145,
          "offsetEnd": 146,
          "columnNum": 15
        },
        "fieldLength": 2,
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
          "columnNum": 16
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
          "columnNum": 17
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
          "columnNum": 18
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Suffix",
        "otherPossibleNames": [],
        "logicalName": "SUFFIX",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 208,
          "offsetEnd": 217,
          "columnNum": 19
        },
        "fieldLength": 10,
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
          "offsetStart": 218,
          "offsetEnd": 226,
          "columnNum": 20
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EOC ID",
        "otherPossibleNames": [],
        "logicalName": "EOC_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 227,
          "offsetEnd": 234,
          "columnNum": 21
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Birth Day",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_DOB_DAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 235,
          "offsetEnd": 236,
          "columnNum": 22
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Birth Month",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_DOB_MONTH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 237,
          "offsetEnd": 238,
          "columnNum": 23
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Birth Year",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_DOB_YEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 239,
          "offsetEnd": 242,
          "columnNum": 24
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade",
        "otherPossibleNames": [],
        "logicalName": "GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 243,
          "offsetEnd": 244,
          "columnNum": 25
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Gender",
        "otherPossibleNames": [],
        "logicalName": "GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 245,
          "offsetEnd": 245,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["M", "F"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Ethnicity-old",
        "otherPossibleNames": [],
        "logicalName": "ETHNICITY-OLD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 246,
          "offsetEnd": 246,
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lunch Status",
        "otherPossibleNames": [],
        "logicalName": "LUNCH_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 247,
          "offsetEnd": 247,
          "columnNum": 28
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2"],
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
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Education Classification",
        "otherPossibleNames": [],
        "logicalName": "EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 249,
          "offsetEnd": 249,
          "columnNum": 30
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LEP Status",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_LEP_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 250,
          "offsetEnd": 251,
          "columnNum": 31
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02"],
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
          "columnNum": 32
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Exceptionality Code ",
        "otherPossibleNames": [],
        "logicalName": "EXCEPTIONALITY_CODE_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 253,
          "offsetEnd": 254,
          "columnNum": 33
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
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
          "columnNum": 34
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
          "columnNum": 35
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
          "columnNum": 36
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
          "columnNum": 37
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
          "columnNum": 38
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
          "columnNum": 39
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
          "columnNum": 40
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
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 42
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
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 265,
          "offsetEnd": 277,
          "columnNum": 44
        },
        "fieldLength": 13,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 answers recorded",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 278,
          "offsetEnd": 278,
          "columnNum": 45
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 individual small group administration",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_INDIVIDUAL_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 279,
          "offsetEnd": 279,
          "columnNum": 46
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 assistive technology",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_ASSISTIVE_TECHNOLOGY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 280,
          "offsetEnd": 280,
          "columnNum": 47
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 communication assistance",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 281,
          "offsetEnd": 281,
          "columnNum": 48
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 extended time",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 282,
          "offsetEnd": 282,
          "columnNum": 49
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 test read aloud",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_TEST_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 283,
          "offsetEnd": 283,
          "columnNum": 50
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 transferred answers",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_TRANSFERRED_ANSWERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 284,
          "offsetEnd": 284,
          "columnNum": 51
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 large print",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_LARGE_PRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 285,
          "offsetEnd": 285,
          "columnNum": 52
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 Braille",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_BRAILLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 286,
          "offsetEnd": 286,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 other",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_OTHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 287,
          "offsetEnd": 287,
          "columnNum": 54
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SP-S504 No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "SP-S504_NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 288,
          "offsetEnd": 288,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP extended time",
        "otherPossibleNames": [],
        "logicalName": "LEP_EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 289,
          "offsetEnd": 289,
          "columnNum": 56
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP individual small group administration",
        "otherPossibleNames": [],
        "logicalName": "LEP_INDIVIDUAL_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 290,
          "offsetEnd": 290,
          "columnNum": 57
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP English/Native language word-to-word dictionary",
        "otherPossibleNames": [],
        "logicalName": "LEP_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 291,
          "offsetEnd": 291,
          "columnNum": 58
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP test administered by ESL teacher or individual providing language services",
        "otherPossibleNames": [],
        "logicalName": "LEP_TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 292,
          "offsetEnd": 292,
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP test read aloud ",
        "otherPossibleNames": [],
        "logicalName": "LEP_TEST_READ_ALOUD_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 293,
          "offsetEnd": 293,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP No Accommodations",
        "otherPossibleNames": [],
        "logicalName": "LEP_NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 294,
          "offsetEnd": 294,
          "columnNum": 61
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "columnNum": 62
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 305,
          "offsetEnd": 316,
          "columnNum": 63
        },
        "fieldLength": 12,
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
          "offsetStart": 317,
          "offsetEnd": 318,
          "columnNum": 64
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 319,
          "offsetEnd": 320,
          "columnNum": 65
        },
        "fieldLength": 2,
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
          "columnNum": 66
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
          "columnNum": 67
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
          "columnNum": 68
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 389,
          "offsetEnd": 389,
          "columnNum": 69
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
          "columnNum": 70
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
          "columnNum": 71
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 450,
          "offsetEnd": 450,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 451,
          "offsetEnd": 452,
          "columnNum": 73
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
          "columnNum": 74
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_CODE/SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 478,
          "offsetEnd": 497,
          "columnNum": 75
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 498,
          "offsetEnd": 498,
          "columnNum": 76
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 499,
          "offsetEnd": 511,
          "columnNum": 77
        },
        "fieldLength": 13,
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
          "columnNum": 78
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 79
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 515,
          "offsetEnd": 520,
          "columnNum": 81
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 1 – Item 25",
        "otherPossibleNames": [],
        "logicalName": "ITEM_1_–_ITEM_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 521,
          "offsetEnd": 545,
          "columnNum": 82
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 29 – Item 53 ",
        "otherPossibleNames": [],
        "logicalName": "ITEM_29_–_ITEM_53 ",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 546,
          "offsetEnd": 570,
          "columnNum": 83
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 571,
          "offsetEnd": 580,
          "columnNum": 84
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 581,
          "offsetEnd": 582,
          "columnNum": 85
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CR item - 28",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 583,
          "offsetEnd": 584,
          "columnNum": 86
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 585,
          "offsetEnd": 590,
          "columnNum": 87
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26 source",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26_SOURCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 591,
          "offsetEnd": 591,
          "columnNum": 88
        },
        "fieldLength": 1,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 28 source",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28_SOURCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 592,
          "offsetEnd": 592,
          "columnNum": 89
        },
        "fieldLength": 1,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 593,
          "offsetEnd": 595,
          "columnNum": 90
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26 Questar condition code",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26_QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 596,
          "offsetEnd": 597,
          "columnNum": 91
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 28 Questar condition code",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28_QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 598,
          "offsetEnd": 599,
          "columnNum": 92
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 26 - part 1",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_26_-_PART_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 600,
          "offsetEnd": 601,
          "columnNum": 93
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 26 - part 2",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_26_-_PART_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 602,
          "offsetEnd": 603,
          "columnNum": 94
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 28 - part 1",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_28_-_PART_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 604,
          "offsetEnd": 605,
          "columnNum": 95
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 28 - part 2",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_28_-_PART_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 606,
          "offsetEnd": 607,
          "columnNum": 96
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 608,
          "offsetEnd": 627,
          "columnNum": 97
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 628,
          "offsetEnd": 630,
          "columnNum": 98
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 631,
          "offsetEnd": 633,
          "columnNum": 99
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_TEST_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 634,
          "offsetEnd": 636,
          "columnNum": 100
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 637,
          "offsetEnd": 639,
          "columnNum": 101
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 102
        },
        "fieldLength": 1,
        "expectedValues": ["N", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 641,
          "offsetEnd": 650,
          "columnNum": 103
        },
        "fieldLength": 10,
        "expectedValues": [],
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
          "columnNum": 104
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 105
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
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
          "columnNum": 106
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Year Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_YEAR_RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 654,
          "offsetEnd": 654,
          "columnNum": 107
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
          "columnNum": 108
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
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
          "columnNum": 109
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 657,
          "offsetEnd": 663,
          "columnNum": 110
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
          "columnNum": 111
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 667,
          "offsetEnd": 667,
          "columnNum": 112
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
          "columnNum": 113
        },
        "fieldLength": 17,
        "expectedValues": ["Excellent", "Good", "Fair", "Needs Improvement"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 685,
          "offsetEnd": 687,
          "columnNum": 114
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "columnNum": 115
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
          "columnNum": 116
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressions and Equations points earned",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSIONS_AND_EQUATIONS_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 694,
          "offsetEnd": 695,
          "columnNum": 117
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressions and Equations percent correct",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSIONS_AND_EQUATIONS_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 696,
          "offsetEnd": 698,
          "columnNum": 118
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Linear Relationships points earned",
        "otherPossibleNames": [],
        "logicalName": "LINEAR_RELATIONSHIPS_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 699,
          "offsetEnd": 700,
          "columnNum": 119
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Linear Relationships percent correct",
        "otherPossibleNames": [],
        "logicalName": "LINEAR_RELATIONSHIPS_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 703,
          "columnNum": 120
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Functions points earned",
        "otherPossibleNames": [],
        "logicalName": "FUNCTIONS_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 704,
          "offsetEnd": 705,
          "columnNum": 121
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Functions percent correct",
        "otherPossibleNames": [],
        "logicalName": "FUNCTIONS_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 706,
          "offsetEnd": 708,
          "columnNum": 122
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Number System, Measurement, and Data points earned",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_SYSTEM_MEASUREMENT_AND_DATA_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 709,
          "offsetEnd": 710,
          "columnNum": 123
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number System, Measurement, and Data percent correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_SYSTEM_MEASUREMENT_AND_DATA_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 711,
          "offsetEnd": 713,
          "columnNum": 124
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 714,
          "offsetEnd": 715,
          "columnNum": 125
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 716,
          "offsetEnd": 718,
          "columnNum": 126
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 719,
          "offsetEnd": 720,
          "columnNum": 127
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 721,
          "offsetEnd": 724,
          "columnNum": 128
        },
        "fieldLength": 4,
        "expectedValues": [],
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
          "columnNum": 129
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ACH._LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 728,
          "offsetEnd": 729,
          "columnNum": 130
        },
        "fieldLength": 2,
        "expectedValues": ["E", "G", "F", "NI"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 730,
          "offsetEnd": 737,
          "columnNum": 131
        },
        "fieldLength": 8,
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
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 740,
          "offsetEnd": 741,
          "columnNum": 133
        },
        "fieldLength": 2,
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
          "columnNum": 134
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
          "columnNum": 135
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
          "columnNum": 136
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 810,
          "offsetEnd": 810,
          "columnNum": 137
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
          "columnNum": 138
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
          "columnNum": 139
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 871,
          "offsetEnd": 871,
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 872,
          "offsetEnd": 873,
          "columnNum": 141
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
          "columnNum": 142
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_CODE/SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 899,
          "offsetEnd": 918,
          "columnNum": 143
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 919,
          "offsetEnd": 919,
          "columnNum": 144
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 920,
          "offsetEnd": 932,
          "columnNum": 145
        },
        "fieldLength": 13,
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
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 936,
          "offsetEnd": 941,
          "columnNum": 149
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 2 – Item 57",
        "otherPossibleNames": [],
        "logicalName": "ITEM_2_–_ITEM_57",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 942,
          "offsetEnd": 997,
          "columnNum": 150
        },
        "fieldLength": 56,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 998,
          "offsetEnd": 1009,
          "columnNum": 151
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 1",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1010,
          "offsetEnd": 1011,
          "columnNum": 152
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 2",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1012,
          "offsetEnd": 1013,
          "columnNum": 153
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1014,
          "offsetEnd": 1019,
          "columnNum": 154
        },
        "fieldLength": 6,
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
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar Condition Code",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1021,
          "offsetEnd": 1022,
          "columnNum": 156
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for WP",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_WP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1023,
          "offsetEnd": 1024,
          "columnNum": 157
        },
        "fieldLength": 2,
        "expectedValues": ["BL", "RF", "NE", "IS"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1025,
          "offsetEnd": 1047,
          "columnNum": 158
        },
        "fieldLength": 23,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1048,
          "offsetEnd": 1050,
          "columnNum": 159
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1051,
          "offsetEnd": 1053,
          "columnNum": 160
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_TEST_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1054,
          "offsetEnd": 1056,
          "columnNum": 161
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1057,
          "offsetEnd": 1059,
          "columnNum": 162
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
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["N", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1061,
          "offsetEnd": 1070,
          "columnNum": 164
        },
        "fieldLength": 10,
        "expectedValues": [],
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
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
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
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School year Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_YEAR_RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1074,
          "offsetEnd": 1074,
          "columnNum": 168
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
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
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
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": ["W", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1078,
          "offsetEnd": 1083,
          "columnNum": 172
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
          "columnNum": 173
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1087,
          "offsetEnd": 1087,
          "columnNum": 174
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
          "columnNum": 175
        },
        "fieldLength": 17,
        "expectedValues": ["Excellent", "Good", "Fair", "Needs Improvement"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1105,
          "offsetEnd": 1107,
          "columnNum": 176
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "columnNum": 177
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
          "columnNum": 178
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing (Standard 2) points earned",
        "otherPossibleNames": [],
        "logicalName": "WRITING_STANDARD_2_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1114,
          "offsetEnd": 1115,
          "columnNum": 179
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing (Standard 2) percent correct",
        "otherPossibleNames": [],
        "logicalName": "WRITING_STANDARD_2_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1116,
          "offsetEnd": 1118,
          "columnNum": 180
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Proofreading (Standard 3) points earned",
        "otherPossibleNames": [],
        "logicalName": "PROOFREADING_STANDARD_3_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1119,
          "offsetEnd": 1120,
          "columnNum": 181
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Proofreading (Standard 3) percent correct",
        "otherPossibleNames": [],
        "logicalName": "PROOFREADING_STANDARD_3_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1121,
          "offsetEnd": 1123,
          "columnNum": 182
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading & Responding (Standards1&6) points earned",
        "otherPossibleNames": [],
        "logicalName": "READING_&_RESPONDING_STANDARDS1&6_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1124,
          "offsetEnd": 1125,
          "columnNum": 183
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading & Responding (Standards1&6) percent correct",
        "otherPossibleNames": [],
        "logicalName": "READING_&_RESPONDING_STANDARDS1&6_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1126,
          "offsetEnd": 1128,
          "columnNum": 184
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading & Responding (Standard 7) points earned",
        "otherPossibleNames": [],
        "logicalName": "READING_&_RESPONDING_STANDARD_7_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1129,
          "offsetEnd": 1130,
          "columnNum": 185
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading & Responding (Standard 7) percent correct",
        "otherPossibleNames": [],
        "logicalName": "READING_&_RESPONDING_STANDARD_7_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1131,
          "offsetEnd": 1133,
          "columnNum": 186
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Using Information Resources (Standard 5) points earned",
        "otherPossibleNames": [],
        "logicalName": "USING_INFORMATION_RESOURCES_STANDARD_5_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1134,
          "offsetEnd": 1135,
          "columnNum": 187
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Using Information Resources (Standard 5) percent correct",
        "otherPossibleNames": [],
        "logicalName": "USING_INFORMATION_RESOURCES_STANDARD_5_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1136,
          "offsetEnd": 1138,
          "columnNum": 188
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1139,
          "offsetEnd": 1140,
          "columnNum": 189
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1141,
          "offsetEnd": 1144,
          "columnNum": 190
        },
        "fieldLength": 4,
        "expectedValues": [],
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
          "columnNum": 191
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ACH._LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1148,
          "offsetEnd": 1149,
          "columnNum": 192
        },
        "fieldLength": 2,
        "expectedValues": ["E", "G", "F", "NI"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1150,
          "offsetEnd": 1156,
          "columnNum": 193
        },
        "fieldLength": 7,
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
          "offsetStart": 1157,
          "offsetEnd": 1158,
          "columnNum": 194
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1159,
          "offsetEnd": 1160,
          "columnNum": 195
        },
        "fieldLength": 2,
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
          "columnNum": 196
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
          "columnNum": 197
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
          "columnNum": 198
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1229,
          "offsetEnd": 1229,
          "columnNum": 199
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
          "columnNum": 200
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
          "columnNum": 201
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1290,
          "offsetEnd": 1290,
          "columnNum": 202
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1291,
          "offsetEnd": 1292,
          "columnNum": 203
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
          "columnNum": 204
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_CODE/SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1318,
          "offsetEnd": 1337,
          "columnNum": 205
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1338,
          "offsetEnd": 1338,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1339,
          "offsetEnd": 1351,
          "columnNum": 207
        },
        "fieldLength": 13,
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
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 209
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1355,
          "offsetEnd": 1360,
          "columnNum": 211
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 1 – Item 25",
        "otherPossibleNames": [],
        "logicalName": "ITEM_1_–_ITEM_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1361,
          "offsetEnd": 1385,
          "columnNum": 212
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 29 – Item 53 ",
        "otherPossibleNames": [],
        "logicalName": "ITEM_29_–_ITEM_53 ",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1386,
          "offsetEnd": 1410,
          "columnNum": 213
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1411,
          "offsetEnd": 1420,
          "columnNum": 214
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1421,
          "offsetEnd": 1422,
          "columnNum": 215
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CR item - 28",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1423,
          "offsetEnd": 1424,
          "columnNum": 216
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1425,
          "offsetEnd": 1430,
          "columnNum": 217
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26 source",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26_SOURCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1431,
          "offsetEnd": 1431,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 28 source",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28_SOURCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1432,
          "offsetEnd": 1432,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1433,
          "offsetEnd": 1435,
          "columnNum": 220
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26 Questar condition code",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26_QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1436,
          "offsetEnd": 1437,
          "columnNum": 221
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 28 Questar condition code",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28_QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1438,
          "offsetEnd": 1439,
          "columnNum": 222
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 26 - part 1",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_26_-_PART_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1440,
          "offsetEnd": 1441,
          "columnNum": 223
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 26 - part 2",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_26_-_PART_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1442,
          "offsetEnd": 1443,
          "columnNum": 224
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 28 - part 1",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_28_-_PART_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1444,
          "offsetEnd": 1445,
          "columnNum": 225
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 28 - part 2",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_28_-_PART_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1446,
          "offsetEnd": 1447,
          "columnNum": 226
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1448,
          "offsetEnd": 1467,
          "columnNum": 227
        },
        "fieldLength": 20,
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
          "columnNum": 228
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
          "columnNum": 229
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_TEST_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1474,
          "offsetEnd": 1476,
          "columnNum": 230
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1477,
          "offsetEnd": 1479,
          "columnNum": 231
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 232
        },
        "fieldLength": 1,
        "expectedValues": ["N", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1481,
          "offsetEnd": 1490,
          "columnNum": 233
        },
        "fieldLength": 10,
        "expectedValues": [],
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
          "columnNum": 234
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 235
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
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
          "columnNum": 236
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Year Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_YEAR_RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1494,
          "offsetEnd": 1494,
          "columnNum": 237
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
          "columnNum": 238
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
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
          "columnNum": 239
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1497,
          "offsetEnd": 1503,
          "columnNum": 240
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
          "columnNum": 241
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1507,
          "offsetEnd": 1507,
          "columnNum": 242
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
          "columnNum": 243
        },
        "fieldLength": 17,
        "expectedValues": ["Excellent", "Good", "Fair", "Needs Improvement"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1525,
          "offsetEnd": 1527,
          "columnNum": 244
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "columnNum": 245
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
          "columnNum": 246
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Geometry points earned",
        "otherPossibleNames": [],
        "logicalName": "GEOMETRY_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1534,
          "offsetEnd": 1535,
          "columnNum": 247
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Geometry percent correct",
        "otherPossibleNames": [],
        "logicalName": "GEOMETRY_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1536,
          "offsetEnd": 1538,
          "columnNum": 248
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Proportion and Algebra points earned",
        "otherPossibleNames": [],
        "logicalName": "PROPORTION_AND_ALGEBRA_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1539,
          "offsetEnd": 1540,
          "columnNum": 249
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Proportion and Algebra percent correct",
        "otherPossibleNames": [],
        "logicalName": "PROPORTION_AND_ALGEBRA_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1541,
          "offsetEnd": 1543,
          "columnNum": 250
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Measurement and Data points earned",
        "otherPossibleNames": [],
        "logicalName": "MEASUREMENT_AND_DATA_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1544,
          "offsetEnd": 1545,
          "columnNum": 251
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Measurement and Data percent correct",
        "otherPossibleNames": [],
        "logicalName": "MEASUREMENT_AND_DATA_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1546,
          "offsetEnd": 1548,
          "columnNum": 252
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1549,
          "offsetEnd": 1550,
          "columnNum": 253
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1551,
          "offsetEnd": 1553,
          "columnNum": 254
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1554,
          "offsetEnd": 1555,
          "columnNum": 255
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1556,
          "offsetEnd": 1558,
          "columnNum": 256
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1559,
          "offsetEnd": 1560,
          "columnNum": 257
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1561,
          "offsetEnd": 1564,
          "columnNum": 258
        },
        "fieldLength": 4,
        "expectedValues": [],
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
          "columnNum": 259
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ACH._LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1568,
          "offsetEnd": 1569,
          "columnNum": 260
        },
        "fieldLength": 2,
        "expectedValues": ["E", "G", "F", "NI"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1570,
          "offsetEnd": 1576,
          "columnNum": 261
        },
        "fieldLength": 7,
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
          "offsetStart": 1577,
          "offsetEnd": 1578,
          "columnNum": 262
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1579,
          "offsetEnd": 1580,
          "columnNum": 263
        },
        "fieldLength": 2,
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
          "columnNum": 264
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
          "columnNum": 265
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
          "columnNum": 266
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1649,
          "offsetEnd": 1649,
          "columnNum": 267
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
          "columnNum": 268
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
          "columnNum": 269
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1710,
          "offsetEnd": 1710,
          "columnNum": 270
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1711,
          "offsetEnd": 1712,
          "columnNum": 271
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
          "columnNum": 272
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_CODE/SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1738,
          "offsetEnd": 1757,
          "columnNum": 273
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1758,
          "offsetEnd": 1758,
          "columnNum": 274
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1759,
          "offsetEnd": 1771,
          "columnNum": 275
        },
        "fieldLength": 13,
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
          "columnNum": 276
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 277
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 278
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1775,
          "offsetEnd": 1780,
          "columnNum": 279
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 1 – Item 25",
        "otherPossibleNames": [],
        "logicalName": "ITEM_1_–_ITEM_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1781,
          "offsetEnd": 1805,
          "columnNum": 280
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 29 – Item 53 ",
        "otherPossibleNames": [],
        "logicalName": "ITEM_29_–_ITEM_53 ",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1806,
          "offsetEnd": 1830,
          "columnNum": 281
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1831,
          "offsetEnd": 1840,
          "columnNum": 282
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1841,
          "offsetEnd": 1842,
          "columnNum": 283
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CR item - 28",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1843,
          "offsetEnd": 1844,
          "columnNum": 284
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1845,
          "offsetEnd": 1850,
          "columnNum": 285
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26 source",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26_SOURCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1851,
          "offsetEnd": 1851,
          "columnNum": 286
        },
        "fieldLength": 1,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 28 source",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28_SOURCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1852,
          "offsetEnd": 1852,
          "columnNum": 287
        },
        "fieldLength": 1,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1853,
          "offsetEnd": 1855,
          "columnNum": 288
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26 Questar condition code",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26_QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1856,
          "offsetEnd": 1857,
          "columnNum": 289
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 28 Questar condition code",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28_QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1858,
          "offsetEnd": 1859,
          "columnNum": 290
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 26 - part 1",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_26_-_PART_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1860,
          "offsetEnd": 1861,
          "columnNum": 291
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 26 - part 2",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_26_-_PART_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1862,
          "offsetEnd": 1863,
          "columnNum": 292
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 28 - part 1",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_28_-_PART_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1864,
          "offsetEnd": 1865,
          "columnNum": 293
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 28 - part 2",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_28_-_PART_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1866,
          "offsetEnd": 1867,
          "columnNum": 294
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1868,
          "offsetEnd": 1887,
          "columnNum": 295
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1888,
          "offsetEnd": 1890,
          "columnNum": 296
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1891,
          "offsetEnd": 1893,
          "columnNum": 297
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_TEST_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1894,
          "offsetEnd": 1896,
          "columnNum": 298
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1897,
          "offsetEnd": 1899,
          "columnNum": 299
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 300
        },
        "fieldLength": 1,
        "expectedValues": ["N", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1901,
          "offsetEnd": 1910,
          "columnNum": 301
        },
        "fieldLength": 10,
        "expectedValues": [],
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
          "columnNum": 302
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 303
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
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
          "columnNum": 304
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Year Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_YEAR_RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1914,
          "offsetEnd": 1914,
          "columnNum": 305
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
          "columnNum": 306
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
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
          "columnNum": 307
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1917,
          "offsetEnd": 1923,
          "columnNum": 308
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
          "columnNum": 309
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1927,
          "offsetEnd": 1927,
          "columnNum": 310
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
          "columnNum": 311
        },
        "fieldLength": 17,
        "expectedValues": ["Excellent", "Good", "Fair", "Needs Improvement"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1945,
          "offsetEnd": 1947,
          "columnNum": 312
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "columnNum": 313
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
          "columnNum": 314
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Science as Inquiry (strand 1) points earned",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_STRAND_1_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1954,
          "offsetEnd": 1955,
          "columnNum": 315
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Science as Inquiry (strand 1) percent correct",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_STRAND_1_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1956,
          "offsetEnd": 1958,
          "columnNum": 316
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Life Science (strand 3) points earned",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_STRAND_3_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1959,
          "offsetEnd": 1960,
          "columnNum": 317
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Life Science (strand 3) percent correct",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_STRAND_3_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1961,
          "offsetEnd": 1963,
          "columnNum": 318
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Earth and Space Science (strand 4) points earned",
        "otherPossibleNames": [],
        "logicalName": "EARTH_AND_SPACE_SCIENCE_STRAND_4_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1964,
          "offsetEnd": 1965,
          "columnNum": 319
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Earth and Space Science (strand 4) percent correct",
        "otherPossibleNames": [],
        "logicalName": "EARTH_AND_SPACE_SCIENCE_STRAND_4_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1966,
          "offsetEnd": 1968,
          "columnNum": 320
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1969,
          "offsetEnd": 1970,
          "columnNum": 321
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1971,
          "offsetEnd": 1974,
          "columnNum": 322
        },
        "fieldLength": 4,
        "expectedValues": [],
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
          "columnNum": 323
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ACH._LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1978,
          "offsetEnd": 1979,
          "columnNum": 324
        },
        "fieldLength": 2,
        "expectedValues": ["E", "G", "F", "NI"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1980,
          "offsetEnd": 1987,
          "columnNum": 325
        },
        "fieldLength": 8,
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
          "offsetStart": 1988,
          "offsetEnd": 1989,
          "columnNum": 326
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1990,
          "offsetEnd": 1991,
          "columnNum": 327
        },
        "fieldLength": 2,
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
          "columnNum": 328
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
          "columnNum": 329
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
          "columnNum": 330
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2060,
          "offsetEnd": 2060,
          "columnNum": 331
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
          "columnNum": 332
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
          "columnNum": 333
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2121,
          "offsetEnd": 2121,
          "columnNum": 334
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2122,
          "offsetEnd": 2123,
          "columnNum": 335
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
          "columnNum": 336
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_CODE/SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2149,
          "offsetEnd": 2168,
          "columnNum": 337
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2169,
          "offsetEnd": 2169,
          "columnNum": 338
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2170,
          "offsetEnd": 2182,
          "columnNum": 339
        },
        "fieldLength": 13,
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
          "columnNum": 340
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 341
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 342
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2186,
          "offsetEnd": 2191,
          "columnNum": 343
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 2 – Item 57",
        "otherPossibleNames": [],
        "logicalName": "ITEM_2_–_ITEM_57",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2192,
          "offsetEnd": 2247,
          "columnNum": 344
        },
        "fieldLength": 56,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2248,
          "offsetEnd": 2259,
          "columnNum": 345
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 1",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2260,
          "offsetEnd": 2261,
          "columnNum": 346
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 2",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2262,
          "offsetEnd": 2263,
          "columnNum": 347
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2264,
          "offsetEnd": 2269,
          "columnNum": 348
        },
        "fieldLength": 6,
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
          "columnNum": 349
        },
        "fieldLength": 1,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar Condition Code",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2271,
          "offsetEnd": 2272,
          "columnNum": 350
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for WP",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_WP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2273,
          "offsetEnd": 2274,
          "columnNum": 351
        },
        "fieldLength": 2,
        "expectedValues": ["BL", "RF", "NE", "IS"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2275,
          "offsetEnd": 2297,
          "columnNum": 352
        },
        "fieldLength": 23,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2298,
          "offsetEnd": 2300,
          "columnNum": 353
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2301,
          "offsetEnd": 2303,
          "columnNum": 354
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_TEST_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2304,
          "offsetEnd": 2306,
          "columnNum": 355
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2307,
          "offsetEnd": 2309,
          "columnNum": 356
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
          "offsetStart": 2310,
          "offsetEnd": 2310,
          "columnNum": 357
        },
        "fieldLength": 1,
        "expectedValues": ["N", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2311,
          "offsetEnd": 2320,
          "columnNum": 358
        },
        "fieldLength": 10,
        "expectedValues": [],
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
          "columnNum": 359
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 360
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
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
          "columnNum": 361
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School year Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_YEAR_RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2324,
          "offsetEnd": 2324,
          "columnNum": 362
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
          "columnNum": 363
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
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
          "columnNum": 364
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2327,
          "offsetEnd": 2333,
          "columnNum": 365
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
          "columnNum": 366
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2337,
          "offsetEnd": 2337,
          "columnNum": 367
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
          "columnNum": 368
        },
        "fieldLength": 17,
        "expectedValues": ["Excellent", "Good", "Fair", "Needs Improvement"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2355,
          "offsetEnd": 2357,
          "columnNum": 369
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "columnNum": 370
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
          "columnNum": 371
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing - Standard 2 - points earned",
        "otherPossibleNames": [],
        "logicalName": "WRITING_STANDARD_2_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2364,
          "offsetEnd": 2365,
          "columnNum": 372
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing - Standard 2 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "WRITING_STANDARD_2_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2366,
          "offsetEnd": 2368,
          "columnNum": 373
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Proofreading - Standard 3 - points earned",
        "otherPossibleNames": [],
        "logicalName": "PROOFREADING_STANDARD_3_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2369,
          "offsetEnd": 2370,
          "columnNum": 374
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Proofreading - Standard 3 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "PROOFREADING_STANDARD_3_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2371,
          "offsetEnd": 2373,
          "columnNum": 375
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading & Responding - Standards 1 & 7 - points earned",
        "otherPossibleNames": [],
        "logicalName": "READING_&_RESPONDING_STANDARDS_1_&_7_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2374,
          "offsetEnd": 2375,
          "columnNum": 376
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading & Responding - Standards 1 & 7 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "READING_&_RESPONDING_STANDARDS_1_&_7_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2376,
          "offsetEnd": 2378,
          "columnNum": 377
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Using Information Resources - Standard 5 - points earned",
        "otherPossibleNames": [],
        "logicalName": "USING_INFORMATION_RESOURCES_STANDARD_5_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2379,
          "offsetEnd": 2380,
          "columnNum": 378
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Using Information Resources - Standard 5 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "USING_INFORMATION_RESOURCES_STANDARD_5_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2381,
          "offsetEnd": 2383,
          "columnNum": 379
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2384,
          "offsetEnd": 2385,
          "columnNum": 380
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2386,
          "offsetEnd": 2388,
          "columnNum": 381
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2389,
          "offsetEnd": 2390,
          "columnNum": 382
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2391,
          "offsetEnd": 2394,
          "columnNum": 383
        },
        "fieldLength": 4,
        "expectedValues": [],
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
          "offsetStart": 2395,
          "offsetEnd": 2397,
          "columnNum": 384
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ACH._LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2398,
          "offsetEnd": 2399,
          "columnNum": 385
        },
        "fieldLength": 2,
        "expectedValues": ["E", "G", "F", "NI"],
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
          "offsetStart": 2400,
          "offsetEnd": 2401,
          "columnNum": 386
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2402,
          "offsetEnd": 2403,
          "columnNum": 387
        },
        "fieldLength": 2,
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
          "offsetStart": 2404,
          "offsetEnd": 2411,
          "columnNum": 388
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
          "offsetStart": 2412,
          "offsetEnd": 2441,
          "columnNum": 389
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
          "offsetStart": 2442,
          "offsetEnd": 2471,
          "columnNum": 390
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Teacher Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2472,
          "offsetEnd": 2472,
          "columnNum": 391
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
          "offsetStart": 2473,
          "offsetEnd": 2502,
          "columnNum": 392
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
          "offsetStart": 2503,
          "offsetEnd": 2532,
          "columnNum": 393
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Middle Init.",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_MIDDLE_INIT.",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2533,
          "offsetEnd": 2533,
          "columnNum": 394
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Period",
        "otherPossibleNames": [],
        "logicalName": "CLASS_PERIOD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2534,
          "offsetEnd": 2535,
          "columnNum": 395
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
          "offsetStart": 2536,
          "offsetEnd": 2560,
          "columnNum": 396
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code/Section",
        "otherPossibleNames": [],
        "logicalName": "CLASS_CODE/SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2561,
          "offsetEnd": 2580,
          "columnNum": 397
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Type",
        "otherPossibleNames": [],
        "logicalName": "CLASS_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2581,
          "offsetEnd": 2581,
          "columnNum": 398
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2582,
          "offsetEnd": 2594,
          "columnNum": 399
        },
        "fieldLength": 13,
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
          "offsetStart": 2595,
          "offsetEnd": 2595,
          "columnNum": 400
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2596,
          "offsetEnd": 2596,
          "columnNum": 401
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2597,
          "offsetEnd": 2597,
          "columnNum": 402
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2598,
          "offsetEnd": 2603,
          "columnNum": 403
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 1 – Item 25",
        "otherPossibleNames": [],
        "logicalName": "ITEM_1_–_ITEM_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2604,
          "offsetEnd": 2628,
          "columnNum": 404
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item 29 – Item 53 ",
        "otherPossibleNames": [],
        "logicalName": "ITEM_29_–_ITEM_53 ",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2629,
          "offsetEnd": 2653,
          "columnNum": 405
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2654,
          "offsetEnd": 2663,
          "columnNum": 406
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2664,
          "offsetEnd": 2665,
          "columnNum": 407
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CR item - 28",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2666,
          "offsetEnd": 2667,
          "columnNum": 408
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2668,
          "offsetEnd": 2673,
          "columnNum": 409
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26 source",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26_SOURCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2674,
          "offsetEnd": 2674,
          "columnNum": 410
        },
        "fieldLength": 1,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 28 source",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28_SOURCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2675,
          "offsetEnd": 2675,
          "columnNum": 411
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2676,
          "offsetEnd": 2678,
          "columnNum": 412
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 26 Questar condition code",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_26_QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2679,
          "offsetEnd": 2680,
          "columnNum": 413
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item - 28 Questar condition code",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_-_28_QUESTAR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2681,
          "offsetEnd": 2682,
          "columnNum": 414
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 26 - part 1",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_26_-_PART_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2683,
          "offsetEnd": 2684,
          "columnNum": 415
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 26 - part 2",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_26_-_PART_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2685,
          "offsetEnd": 2686,
          "columnNum": 416
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 28 - part 1",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_28_-_PART_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2687,
          "offsetEnd": 2688,
          "columnNum": 417
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item 28 - part 2",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_28_-_PART_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2689,
          "offsetEnd": 2690,
          "columnNum": 418
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2691,
          "offsetEnd": 2710,
          "columnNum": 419
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total MC Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_MC_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2711,
          "offsetEnd": 2713,
          "columnNum": 420
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total CR Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CR_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2714,
          "offsetEnd": 2716,
          "columnNum": 421
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_TEST_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2717,
          "offsetEnd": 2719,
          "columnNum": 422
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2720,
          "offsetEnd": 2722,
          "columnNum": 423
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 2723,
          "offsetEnd": 2723,
          "columnNum": 424
        },
        "fieldLength": 1,
        "expectedValues": ["N", "P", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2724,
          "offsetEnd": 2733,
          "columnNum": 425
        },
        "fieldLength": 10,
        "expectedValues": [],
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
          "offsetStart": 2734,
          "offsetEnd": 2734,
          "columnNum": 426
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 2735,
          "offsetEnd": 2735,
          "columnNum": 427
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
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
          "offsetStart": 2736,
          "offsetEnd": 2736,
          "columnNum": 428
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Year Retest Flag",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_YEAR_RETEST_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2737,
          "offsetEnd": 2737,
          "columnNum": 429
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
          "offsetStart": 2738,
          "offsetEnd": 2738,
          "columnNum": 430
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
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
          "offsetStart": 2739,
          "offsetEnd": 2739,
          "columnNum": 431
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2740,
          "offsetEnd": 2746,
          "columnNum": 432
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
          "offsetStart": 2747,
          "offsetEnd": 2749,
          "columnNum": 433
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2750,
          "offsetEnd": 2750,
          "columnNum": 434
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
          "offsetStart": 2751,
          "offsetEnd": 2767,
          "columnNum": 435
        },
        "fieldLength": 17,
        "expectedValues": ["Excellent", "Good", "Fair", "Needs Improvement"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2768,
          "offsetEnd": 2770,
          "columnNum": 436
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 2771,
          "offsetEnd": 2773,
          "columnNum": 437
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
          "offsetStart": 2774,
          "offsetEnd": 2776,
          "columnNum": 438
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "content standard 1 points earned",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_1_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2777,
          "offsetEnd": 2778,
          "columnNum": 439
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "content standard 1 percent correct",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_1_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2779,
          "offsetEnd": 2781,
          "columnNum": 440
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "content standard 2 points earned",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_2_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2782,
          "offsetEnd": 2783,
          "columnNum": 441
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "content standard 2 percent correct",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_2_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2784,
          "offsetEnd": 2786,
          "columnNum": 442
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "content standard 3 points earned",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_3_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2787,
          "offsetEnd": 2788,
          "columnNum": 443
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "content standard 3 percent correct",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_3_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2789,
          "offsetEnd": 2791,
          "columnNum": 444
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "content standard 4 points earned",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_4_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2792,
          "offsetEnd": 2793,
          "columnNum": 445
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "content standard 4 percent correct",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_4_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2794,
          "offsetEnd": 2796,
          "columnNum": 446
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "content standard 5 points earned",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_5_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2797,
          "offsetEnd": 2798,
          "columnNum": 447
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "content standard 5 percent correct",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_STANDARD_5_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2799,
          "offsetEnd": 2801,
          "columnNum": 448
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administration month of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_MONTH_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2802,
          "offsetEnd": 2803,
          "columnNum": 449
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Administration year of previous highest score",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_YEAR_OF_PREVIOUS_HIGHEST_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2804,
          "offsetEnd": 2807,
          "columnNum": 450
        },
        "fieldLength": 4,
        "expectedValues": [],
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
          "offsetStart": 2808,
          "offsetEnd": 2810,
          "columnNum": 451
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Highest previous ach. Level",
        "otherPossibleNames": [],
        "logicalName": "HIGHEST_PREVIOUS_ACH._LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2811,
          "offsetEnd": 2812,
          "columnNum": 452
        },
        "fieldLength": 2,
        "expectedValues": ["E", "G", "F", "NI"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2813,
          "offsetEnd": 2819,
          "columnNum": 453
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}