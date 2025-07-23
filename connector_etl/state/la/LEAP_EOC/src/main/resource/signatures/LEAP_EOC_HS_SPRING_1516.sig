{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "LEAP_EOC_HS_SPRING_1516",
    "quoteDelim": "\"",
    "fieldDelim": null,
    "hasHeader": true,
    "naturalKey": ["LASID", "TEST_DATE_MONTH", "TEST_DATE_YEAR"],
    "fields": [{
      "physicalName": "Student EOC permanent ID",
      "otherPossibleNames": [],
      "logicalName": "LASID",
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
        "expectedValues": ["1", "2", "3", "4", "5", "6", ""],
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
        "logicalName": "STUDENT_MIDDLE_INITIAL.",
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
        "physicalName": "Louisiana Secure identifier",
        "otherPossibleNames": [],
        "logicalName": "LOUISIANA_SECURE_IDENTIFIER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 218,
          "offsetEnd": 227,
          "columnNum": 20
        },
        "fieldLength": 10,
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
          "offsetStart": 228,
          "offsetEnd": 234,
          "columnNum": 21
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Birth Day",
        "otherPossibleNames": [],
        "logicalName": "DOB_-_DAY",
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
        "logicalName": "DOB_-_MONTH",
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
        "logicalName": "DOB_-_YEAR",
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
        "dataTypes": "STRING",
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
        "physicalName": "Filler ",
        "otherPossibleNames": [],
        "logicalName": "FILLER_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 246,
          "offsetEnd": 246,
          "columnNum": 27
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
          "columnNum": 28
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
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
        "expectedValues": ["0", "1", "2"],
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
        "dataTypes": "STRING",
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
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "District Reporting Code",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_REPORTING_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 305,
          "offsetEnd": 307,
          "columnNum": 63
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "District Merge Code",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_MERGE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 308,
          "offsetEnd": 308,
          "columnNum": 64
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
          "offsetStart": 309,
          "offsetEnd": 316,
          "columnNum": 65
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 317,
          "offsetEnd": 318,
          "columnNum": 66
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
          "columnNum": 67
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
          "columnNum": 68
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
          "columnNum": 69
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
          "columnNum": 70
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
          "columnNum": 71
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
          "columnNum": 72
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
          "columnNum": 73
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
          "columnNum": 74
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
          "columnNum": 75
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
          "columnNum": 76
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
          "columnNum": 77
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
          "columnNum": 78
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
          "offsetStart": 499,
          "offsetEnd": 511,
          "columnNum": 79
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
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 83
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
          "offsetStart": 518,
          "offsetEnd": 520,
          "columnNum": 84
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form",
        "otherPossibleNames": [],
        "logicalName": "ALL_MC_ITEMS_ON_THE_TEST_FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 521,
          "offsetEnd": 580,
          "columnNum": 85
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item scores",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_SCORES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 581,
          "offsetEnd": 590,
          "columnNum": 86
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item score sources",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_SCORE_SOURCES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 591,
          "offsetEnd": 595,
          "columnNum": 87
        },
        "fieldLength": 5,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar condition codes",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 596,
          "offsetEnd": 605,
          "columnNum": 88
        },
        "fieldLength": 10,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item parts",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM__PARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 606,
          "offsetEnd": 627,
          "columnNum": 89
        },
        "fieldLength": 22,
        "expectedValues": ["NE", "IS", "RF", "BL", ""],
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
          "columnNum": 90
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
          "columnNum": 91
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 634,
          "offsetEnd": 636,
          "columnNum": 92
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
          "columnNum": 93
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
          "columnNum": 94
        },
        "fieldLength": 1,
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
          "offsetStart": 641,
          "offsetEnd": 650,
          "columnNum": 95
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
          "columnNum": 96
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "columnNum": 97
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
          "columnNum": 98
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
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
          "offsetStart": 654,
          "offsetEnd": 654,
          "columnNum": 99
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
          "columnNum": 100
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 656,
          "offsetEnd": 656,
          "columnNum": 101
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
          "columnNum": 102
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
          "columnNum": 103
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
          "columnNum": 104
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
          "columnNum": 105
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
          "columnNum": 106
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
          "columnNum": 107
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
          "columnNum": 108
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Algebra points earned",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 694,
          "offsetEnd": 695,
          "columnNum": 109
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Algebra percent correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 696,
          "offsetEnd": 698,
          "columnNum": 110
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
          "offsetStart": 699,
          "offsetEnd": 700,
          "columnNum": 111
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
          "offsetStart": 701,
          "offsetEnd": 703,
          "columnNum": 112
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Number & Quantity / Statistics & Probability points earned",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 704,
          "offsetEnd": 705,
          "columnNum": 113
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number & Quantity / Statistics & Probability percent correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_&_QUANTITY_STATISTICS_&_PROBABILITY_PERCENT_CORRECT_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 706,
          "offsetEnd": 708,
          "columnNum": 114
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
          "offsetStart": 709,
          "offsetEnd": 710,
          "columnNum": 115
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
          "offsetStart": 711,
          "offsetEnd": 713,
          "columnNum": 116
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
          "columnNum": 117
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
          "columnNum": 118
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
          "columnNum": 119
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
          "columnNum": 120
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
          "columnNum": 121
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
          "columnNum": 122
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
          "columnNum": 123
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 738,
          "offsetEnd": 739,
          "columnNum": 124
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
          "columnNum": 125
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
          "columnNum": 126
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
          "columnNum": 127
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
          "columnNum": 128
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
          "columnNum": 129
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
          "columnNum": 130
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
          "columnNum": 131
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
          "columnNum": 132
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
          "columnNum": 133
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
          "columnNum": 134
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
          "columnNum": 135
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
          "columnNum": 136
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
          "columnNum": 137
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
          "columnNum": 138
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 139
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 141
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
          "offsetStart": 939,
          "offsetEnd": 941,
          "columnNum": 142
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form",
        "otherPossibleNames": [],
        "logicalName": "ALL_MC_ITEMS_ON_THE_TEST_FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 942,
          "offsetEnd": 1009,
          "columnNum": 143
        },
        "fieldLength": 68,
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
          "columnNum": 144
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
          "columnNum": 145
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 3",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1014,
          "offsetEnd": 1014,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 4",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1015,
          "offsetEnd": 1015,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 5",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1016,
          "offsetEnd": 1016,
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 6",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1017,
          "offsetEnd": 1017,
          "columnNum": 149
        },
        "fieldLength": 1,
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
          "offsetStart": 1018,
          "offsetEnd": 1019,
          "columnNum": 150
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
          "columnNum": 151
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
          "columnNum": 152
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT", ""],
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
          "columnNum": 153
        },
        "fieldLength": 2,
        "expectedValues": ["BL", "RF", "NE", "IS", ""],
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
          "columnNum": 154
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
          "columnNum": 155
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
          "columnNum": 156
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1054,
          "offsetEnd": 1056,
          "columnNum": 157
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
          "columnNum": 158
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
          "columnNum": 159
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
          "columnNum": 160
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
          "columnNum": 161
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
          "columnNum": 162
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
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P"],
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
          "offsetStart": 1074,
          "offsetEnd": 1074,
          "columnNum": 164
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
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1076,
          "offsetEnd": 1076,
          "columnNum": 166
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
          "columnNum": 167
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
          "columnNum": 168
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
          "columnNum": 169
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
          "columnNum": 170
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
          "offsetStart": 1088,
          "offsetEnd": 1104,
          "columnNum": 171
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
          "columnNum": 172
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
          "columnNum": 173
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
          "columnNum": 174
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing and Language Conventions points earned",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1114,
          "offsetEnd": 1115,
          "columnNum": 175
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing and Language Conventions percent correct",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1116,
          "offsetEnd": 1118,
          "columnNum": 176
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading points earned",
        "otherPossibleNames": [],
        "logicalName": "READING_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1119,
          "offsetEnd": 1120,
          "columnNum": 177
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading percent correct",
        "otherPossibleNames": [],
        "logicalName": "READING_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1121,
          "offsetEnd": 1123,
          "columnNum": 178
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Research points earned",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1124,
          "offsetEnd": 1125,
          "columnNum": 179
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Research percent correct",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_PERCENT_CORRECT_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1126,
          "offsetEnd": 1128,
          "columnNum": 180
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
          "offsetStart": 1129,
          "offsetEnd": 1130,
          "columnNum": 181
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
          "offsetStart": 1131,
          "offsetEnd": 1133,
          "columnNum": 182
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
          "offsetStart": 1134,
          "offsetEnd": 1135,
          "columnNum": 183
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
          "offsetStart": 1136,
          "offsetEnd": 1138,
          "columnNum": 184
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
          "columnNum": 185
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
          "columnNum": 186
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
          "columnNum": 187
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
          "columnNum": 188
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
          "columnNum": 189
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1157,
          "offsetEnd": 1158,
          "columnNum": 190
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
          "columnNum": 191
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
          "columnNum": 192
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
          "columnNum": 193
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
          "columnNum": 194
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
          "columnNum": 195
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
          "columnNum": 196
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
          "columnNum": 197
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
          "columnNum": 198
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
          "columnNum": 199
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
          "columnNum": 200
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
          "columnNum": 201
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
          "columnNum": 202
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
          "columnNum": 203
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
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 205
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 207
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
          "offsetStart": 1358,
          "offsetEnd": 1360,
          "columnNum": 208
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form",
        "otherPossibleNames": [],
        "logicalName": "ALL_MC_ITEMS_ON_THE_TEST_FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1361,
          "offsetEnd": 1420,
          "columnNum": 209
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item scores",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_SCORES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1421,
          "offsetEnd": 1430,
          "columnNum": 210
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item score sources",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_SCORE_SOURCES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1431,
          "offsetEnd": 1435,
          "columnNum": 211
        },
        "fieldLength": 5,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar condition codes",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1436,
          "offsetEnd": 1445,
          "columnNum": 212
        },
        "fieldLength": 10,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item parts",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_PARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1446,
          "offsetEnd": 1467,
          "columnNum": 213
        },
        "fieldLength": 22,
        "expectedValues": ["NE", "IS", "RF", "BL", ""],
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
          "columnNum": 214
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
          "columnNum": 215
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
          "columnNum": 216
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Percent correct GEOM",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1477,
          "offsetEnd": 1479,
          "columnNum": 217
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
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": ["N", "P", "R"],
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
          "offsetStart": 1481,
          "offsetEnd": 1490,
          "columnNum": 219
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
          "columnNum": 220
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
          "columnNum": 221
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
          "columnNum": 222
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
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
          "offsetStart": 1494,
          "offsetEnd": 1494,
          "columnNum": 223
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
          "columnNum": 224
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1496,
          "offsetEnd": 1496,
          "columnNum": 225
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
          "columnNum": 226
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
          "columnNum": 227
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
          "columnNum": 228
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Level GEOM",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL__GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1508,
          "offsetEnd": 1524,
          "columnNum": 229
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
          "columnNum": 230
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
          "columnNum": 231
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
          "columnNum": 232
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Congruence points earned",
        "otherPossibleNames": [],
        "logicalName": "CONGRUENCE_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1534,
          "offsetEnd": 1535,
          "columnNum": 233
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Congruence percent correct",
        "otherPossibleNames": [],
        "logicalName": "CONGRUENCE_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1536,
          "offsetEnd": 1538,
          "columnNum": 234
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Similarity, Right Triangles, & Trigonometry  points earned",
        "otherPossibleNames": [],
        "logicalName": "SIMILARITY_RIGHT_TRIANGLES_&_TRIGONOMETRY_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1539,
          "offsetEnd": 1540,
          "columnNum": 235
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Similarity, Right Triangles, & Trigonometry  percent correct",
        "otherPossibleNames": [],
        "logicalName": "SIMILARITY_RIGHT_TRIANGLES_&_TRIGONOMETRY_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1541,
          "offsetEnd": 1543,
          "columnNum": 236
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Circles / Expressing Geometric Properties with Equations points earned",
        "otherPossibleNames": [],
        "logicalName": "CIRCLES_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1544,
          "offsetEnd": 1545,
          "columnNum": 237
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Circles / Expressing Geometric Properties with Equations percent correct",
        "otherPossibleNames": [],
        "logicalName": "CIRCLES_EXPRESSING_GEOMETRIC_PROPERTIES_WITH_EQUATIONS_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1546,
          "offsetEnd": 1548,
          "columnNum": 238
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Geometric Measurement & Dimension / Modeling with Geometry points earned",
        "otherPossibleNames": [],
        "logicalName": "GEOMETRIC_MEASUREMENT_&_DIMENSION_MODELING_WITH_GEOMETRY_RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1549,
          "offsetEnd": 1550,
          "columnNum": 239
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Geometric Measurement & Dimension / Modeling with Geometry percent correct",
        "otherPossibleNames": [],
        "logicalName": "GEOMETRIC_MEASUREMENT_&_DIMENSION_MODELING_WITH_GEOMETRY_PERCENT_CORRECT_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1551,
          "offsetEnd": 1553,
          "columnNum": 240
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
          "columnNum": 241
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
          "columnNum": 242
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
          "columnNum": 243
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
          "columnNum": 244
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
          "columnNum": 245
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
          "columnNum": 246
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
          "columnNum": 247
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1577,
          "offsetEnd": 1578,
          "columnNum": 248
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
          "columnNum": 249
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
          "columnNum": 250
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
          "columnNum": 251
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
          "columnNum": 252
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
          "columnNum": 253
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
          "columnNum": 254
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
          "columnNum": 255
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
          "columnNum": 256
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
          "columnNum": 257
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
          "columnNum": 258
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
          "columnNum": 259
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
          "columnNum": 260
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
          "columnNum": 261
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
          "columnNum": 262
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 263
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 264
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 265
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
          "offsetStart": 1778,
          "offsetEnd": 1780,
          "columnNum": 266
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form",
        "otherPossibleNames": [],
        "logicalName": "ALL_MC_ITEMS_ON_THE_TEST_FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1781,
          "offsetEnd": 1840,
          "columnNum": 267
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item scores",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_SCORES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1841,
          "offsetEnd": 1850,
          "columnNum": 268
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item score sources",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_SCORE_SOURCES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1851,
          "offsetEnd": 1855,
          "columnNum": 269
        },
        "fieldLength": 5,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questar condition codes",
        "otherPossibleNames": [],
        "logicalName": "QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1856,
          "offsetEnd": 1865,
          "columnNum": 270
        },
        "fieldLength": 10,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item parts",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_PARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1866,
          "offsetEnd": 1887,
          "columnNum": 271
        },
        "fieldLength": 22,
        "expectedValues": ["NE", "IS", "RF", "BL", ""],
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
          "columnNum": 272
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
          "columnNum": 273
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1894,
          "offsetEnd": 1896,
          "columnNum": 274
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
          "columnNum": 275
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
          "columnNum": 276
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
          "columnNum": 277
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
          "columnNum": 278
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
          "columnNum": 279
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
          "columnNum": 280
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
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
          "offsetStart": 1914,
          "offsetEnd": 1914,
          "columnNum": 281
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
          "columnNum": 282
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1916,
          "offsetEnd": 1916,
          "columnNum": 283
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
          "columnNum": 284
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
          "columnNum": 285
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
          "columnNum": 286
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
          "columnNum": 287
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
          "columnNum": 288
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
          "columnNum": 289
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
          "columnNum": 290
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Science as Inquiry (strand 1)  points earned",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1954,
          "offsetEnd": 1955,
          "columnNum": 291
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Science as Inquiry (strand 1)  percent correct",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1956,
          "offsetEnd": 1958,
          "columnNum": 292
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Life Science (strand 3) points earned",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1959,
          "offsetEnd": 1960,
          "columnNum": 293
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Life Science (strand 3) percent correct",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1961,
          "offsetEnd": 1963,
          "columnNum": 294
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Earth and Space Science (strand 4)  points earned",
        "otherPossibleNames": [],
        "logicalName": "EARTH_AND_SPACE_SCIENCE_RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1964,
          "offsetEnd": 1965,
          "columnNum": 295
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Earth and Space Science (strand 4) percent correct",
        "otherPossibleNames": [],
        "logicalName": "EARTH_AND_SPACE_SCIENCE_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1966,
          "offsetEnd": 1968,
          "columnNum": 296
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
          "columnNum": 297
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
          "columnNum": 298
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
          "columnNum": 299
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
          "columnNum": 300
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
          "columnNum": 301
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1988,
          "offsetEnd": 1989,
          "columnNum": 302
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
          "columnNum": 303
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
          "columnNum": 304
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
          "columnNum": 305
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
          "columnNum": 306
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
          "columnNum": 307
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
          "columnNum": 308
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
          "columnNum": 309
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
          "columnNum": 310
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
          "columnNum": 311
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
          "columnNum": 312
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
          "columnNum": 313
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
          "columnNum": 314
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
          "columnNum": 315
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
          "columnNum": 316
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 317
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 318
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 319
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
          "offsetStart": 2189,
          "offsetEnd": 2191,
          "columnNum": 320
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form",
        "otherPossibleNames": [],
        "logicalName": "ALL_MC_ITEMS_ON_THE_TEST_FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2192,
          "offsetEnd": 2259,
          "columnNum": 321
        },
        "fieldLength": 68,
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
          "columnNum": 322
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
          "columnNum": 323
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 3",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2264,
          "offsetEnd": 2264,
          "columnNum": 324
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 4",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2265,
          "offsetEnd": 2265,
          "columnNum": 325
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 5",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2266,
          "offsetEnd": 2266,
          "columnNum": 326
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WP item - dimension 6",
        "otherPossibleNames": [],
        "logicalName": "WP_ITEM_-_DIMENSION_6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2267,
          "offsetEnd": 2267,
          "columnNum": 327
        },
        "fieldLength": 1,
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
          "offsetStart": 2268,
          "offsetEnd": 2269,
          "columnNum": 328
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
          "columnNum": 329
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
          "columnNum": 330
        },
        "fieldLength": 2,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT", ""],
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
          "columnNum": 331
        },
        "fieldLength": 2,
        "expectedValues": ["NE", "IS", "RF", "BL", ""],
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
          "columnNum": 332
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
          "columnNum": 333
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
          "columnNum": 334
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2304,
          "offsetEnd": 2306,
          "columnNum": 335
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
          "columnNum": 336
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
          "columnNum": 337
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
          "columnNum": 338
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
          "columnNum": 339
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
          "columnNum": 340
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
          "columnNum": 341
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
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
          "offsetStart": 2324,
          "offsetEnd": 2324,
          "columnNum": 342
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
          "columnNum": 343
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2326,
          "offsetEnd": 2326,
          "columnNum": 344
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
          "columnNum": 345
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
          "columnNum": 346
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
          "columnNum": 347
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
          "columnNum": 348
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
          "columnNum": 349
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
          "columnNum": 350
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
          "columnNum": 351
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing and Language Conventions points earned",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2364,
          "offsetEnd": 2365,
          "columnNum": 352
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing and Language Conventions percent correct",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2366,
          "offsetEnd": 2368,
          "columnNum": 353
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading points earned",
        "otherPossibleNames": [],
        "logicalName": "READING_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2369,
          "offsetEnd": 2370,
          "columnNum": 354
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading percent correct",
        "otherPossibleNames": [],
        "logicalName": "READING_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2371,
          "offsetEnd": 2373,
          "columnNum": 355
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Research points earned",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2374,
          "offsetEnd": 2375,
          "columnNum": 356
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Research percent correct",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2376,
          "offsetEnd": 2378,
          "columnNum": 357
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
          "offsetStart": 2379,
          "offsetEnd": 2380,
          "columnNum": 358
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
          "offsetStart": 2381,
          "offsetEnd": 2383,
          "columnNum": 359
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
          "columnNum": 360
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
          "columnNum": 361
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
          "columnNum": 362
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
          "columnNum": 363
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
          "columnNum": 364
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
          "columnNum": 365
        },
        "fieldLength": 2,
        "expectedValues": ["E", "G", "F", "NI"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Content",
        "otherPossibleNames": [],
        "logicalName": "CONTENT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2400,
          "offsetEnd": 2401,
          "columnNum": 366
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
          "columnNum": 367
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
          "columnNum": 368
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
          "columnNum": 369
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
          "columnNum": 370
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
          "columnNum": 371
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
          "columnNum": 372
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
          "columnNum": 373
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
          "columnNum": 374
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
          "columnNum": 375
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
          "columnNum": 376
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
          "columnNum": 377
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
          "columnNum": 378
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
          "columnNum": 379
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
          "columnNum": 380
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 381
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 382
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 2598,
          "offsetEnd": 2600,
          "columnNum": 383
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
          "offsetStart": 2601,
          "offsetEnd": 2603,
          "columnNum": 384
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "All MC items on the test form",
        "otherPossibleNames": [],
        "logicalName": "ALL_MC_ITEMS_ON_THE_TEST_FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2604,
          "offsetEnd": 2663,
          "columnNum": 385
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item scores",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_SCORES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2664,
          "offsetEnd": 2673,
          "columnNum": 386
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item score sources",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_SCORE_SOURCES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2674,
          "offsetEnd": 2678,
          "columnNum": 387
        },
        "fieldLength": 5,
        "expectedValues": ["H", "A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CR item Questar condition codes",
        "otherPossibleNames": [],
        "logicalName": "CR_ITEM_QUESTAR_CONDITION_CODES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2679,
          "offsetEnd": 2688,
          "columnNum": 388
        },
        "fieldLength": 10,
        "expectedValues": ["IL", "NE", "IS", "RF", "OT", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Automated Scoring code for CR item parts",
        "otherPossibleNames": [],
        "logicalName": "AUTOMATED_SCORING_CODE_FOR_CR_ITEM_PARTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2689,
          "offsetEnd": 2710,
          "columnNum": 389
        },
        "fieldLength": 22,
        "expectedValues": ["NE", "IS", "RF", "BL", ""],
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
          "columnNum": 390
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
          "columnNum": 391
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Test Score",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2717,
          "offsetEnd": 2719,
          "columnNum": 392
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
          "offsetStart": 2720,
          "offsetEnd": 2722,
          "columnNum": 393
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
          "columnNum": 394
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
          "columnNum": 395
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
          "columnNum": 396
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
          "columnNum": 397
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "STRING",
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
          "columnNum": 398
        },
        "fieldLength": 1,
        "expectedValues": ["I", "R", "P", ""],
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
          "offsetStart": 2737,
          "offsetEnd": 2737,
          "columnNum": 399
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
          "columnNum": 400
        },
        "fieldLength": 1,
        "expectedValues": ["E", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Pending Void",
        "otherPossibleNames": [],
        "logicalName": "PENDING_VOID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2739,
          "offsetEnd": 2739,
          "columnNum": 401
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
          "columnNum": 402
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
          "columnNum": 403
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
          "columnNum": 404
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
          "columnNum": 405
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
          "columnNum": 406
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
          "columnNum": 407
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
          "columnNum": 408
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Western Expansion to Progressivism - Standard 2 - points earned",
        "otherPossibleNames": [],
        "logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2777,
          "offsetEnd": 2778,
          "columnNum": 409
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Western Expansion to Progressivism - Standard 2 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2779,
          "offsetEnd": 2781,
          "columnNum": 410
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Isolationism through the Great War - Standard 3 - points earned",
        "otherPossibleNames": [],
        "logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2782,
          "offsetEnd": 2783,
          "columnNum": 411
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Isolationism through the Great War - Standard 3 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2784,
          "offsetEnd": 2786,
          "columnNum": 412
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Becoming a World Power through World War II - Standard 4 - points earned",
        "otherPossibleNames": [],
        "logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2787,
          "offsetEnd": 2788,
          "columnNum": 413
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Becoming a World Power through World War II - Standard 4 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2789,
          "offsetEnd": 2791,
          "columnNum": 414
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Cold War Era - Standard 5 - points earned",
        "otherPossibleNames": [],
        "logicalName": "COLD_WAR_ERA_-_STANDARD_5_-_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2792,
          "offsetEnd": 2793,
          "columnNum": 415
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Cold War Era - Standard 5 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "COLD_WAR_ERA_-_STANDARD_5_-_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2794,
          "offsetEnd": 2796,
          "columnNum": 416
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "The Modern Age - Standard 6 - points earned",
        "otherPossibleNames": [],
        "logicalName": "THE_MODERN_AGE_-_STANDARD_6_-_RAW_SCORE_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2797,
          "offsetEnd": 2798,
          "columnNum": 417
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "The Modern Age - Standard 6 - percent correct",
        "otherPossibleNames": [],
        "logicalName": "THE_MODERN_AGE_-_STANDARD_6_-_PERCENT_CORRECT_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2799,
          "offsetEnd": 2801,
          "columnNum": 418
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
          "columnNum": 419
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
          "columnNum": 420
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
          "columnNum": 421
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
          "columnNum": 422
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
          "columnNum": 423
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