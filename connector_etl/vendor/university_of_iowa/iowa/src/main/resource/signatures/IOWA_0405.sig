{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "IOWA_0405",
    "quoteDelim": "\"",
    "fieldDelim": null,
    "hasHeader": true,
    "naturalKey": ["TEST", "STUDENT_ID", "DATE_TESTED"],
    "fields": [{
      "physicalName": "Order Number",
      "otherPossibleNames": [],
      "logicalName": "ORDER_NUMBER",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "Y",
      "fieldOffset": {
        "offsetStart": 1,
        "offsetEnd": 30,
        "columnNum": 1
      },
      "fieldLength": 30,
      "expectedValues": [],
      "dataTypes": "INTEGER",
      "scale": null
    },
      {
        "physicalName": "Test",
        "otherPossibleNames": [],
        "logicalName": "TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 31,
          "offsetEnd": 38,
          "columnNum": 2
        },
        "fieldLength": 8,
        "expectedValues": ["ITBS", "ITED"],
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
          "offsetStart": 39,
          "offsetEnd": 68,
          "columnNum": 3
        },
        "fieldLength": 30,
        "expectedValues": [],
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
          "offsetStart": 69,
          "offsetEnd": 71,
          "columnNum": 4
        },
        "fieldLength": 3,
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
          "offsetStart": 72,
          "offsetEnd": 101,
          "columnNum": 5
        },
        "fieldLength": 30,
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
          "offsetStart": 102,
          "offsetEnd": 104,
          "columnNum": 6
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Name",
        "otherPossibleNames": [],
        "logicalName": "CLASS_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 105,
          "offsetEnd": 134,
          "columnNum": 7
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Grade - Assessment",
        "otherPossibleNames": [],
        "logicalName": "GRADE_-_ASSESSMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 135,
          "offsetEnd": 136,
          "columnNum": 8
        },
        "fieldLength": 2,
        "expectedValues": ["03", "05", "06", "07", "08", "09", "OP"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Grade Option",
        "otherPossibleNames": [],
        "logicalName": "GRADE_OPTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 137,
          "offsetEnd": 137,
          "columnNum": 9
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Date Tested",
        "otherPossibleNames": [],
        "logicalName": "DATE_TESTED",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 138,
          "offsetEnd": 145,
          "columnNum": 10
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
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
          "offsetStart": 146,
          "offsetEnd": 165,
          "columnNum": 11
        },
        "fieldLength": 20,
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
          "offsetStart": 166,
          "offsetEnd": 185,
          "columnNum": 12
        },
        "fieldLength": 20,
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
          "offsetStart": 186,
          "offsetEnd": 186,
          "columnNum": 13
        },
        "fieldLength": 1,
        "expectedValues": ["F", "M", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Date of Birth",
        "otherPossibleNames": [],
        "logicalName": "DATE_OF_BIRTH",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 187,
          "offsetEnd": 194,
          "columnNum": 14
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Student ID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 195,
          "offsetEnd": 203,
          "columnNum": 15
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Louisiana Gen ID",
        "otherPossibleNames": [],
        "logicalName": "LOUISIANA_GEN_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 204,
          "offsetEnd": 212,
          "columnNum": 16
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Ethnicity",
        "otherPossibleNames": [],
        "logicalName": "ETHNICITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 213,
          "offsetEnd": 213,
          "columnNum": 17
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "9"],
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
          "offsetStart": 214,
          "offsetEnd": 226,
          "columnNum": 18
        },
        "fieldLength": 13,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Battery",
        "otherPossibleNames": [],
        "logicalName": "BATTERY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 227,
          "offsetEnd": 227,
          "columnNum": 19
        },
        "fieldLength": 1,
        "expectedValues": ["C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Level",
        "otherPossibleNames": [],
        "logicalName": "LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 228,
          "offsetEnd": 229,
          "columnNum": 20
        },
        "fieldLength": 2,
        "expectedValues": ["09", "11", "12", "13"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 230,
          "offsetEnd": 231,
          "columnNum": 21
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Norm Year",
        "otherPossibleNames": [],
        "logicalName": "NORM_YEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 232,
          "offsetEnd": 233,
          "columnNum": 22
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Interpolated Norms",
        "otherPossibleNames": [],
        "logicalName": "INTERPOLATED_NORMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 234,
          "offsetEnd": 238,
          "columnNum": 23
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Norms",
        "otherPossibleNames": [],
        "logicalName": "TEST_NORMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 239,
          "offsetEnd": 239,
          "columnNum": 24
        },
        "fieldLength": 1,
        "expectedValues": ["B", "R"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Calculator Used",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR_USED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 240,
          "offsetEnd": 240,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": ["1", "0"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Age in Years/Months",
        "otherPossibleNames": [],
        "logicalName": "AGE_IN_YEARS/MONTHS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 241,
          "offsetEnd": 244,
          "columnNum": 26
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LaSIP Math Teacher",
        "otherPossibleNames": [],
        "logicalName": "LASIP_MATH_TEACHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 245,
          "offsetEnd": 249,
          "columnNum": 27
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LaSIP Science Teacher",
        "otherPossibleNames": [],
        "logicalName": "LASIP_SCIENCE_TEACHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 250,
          "offsetEnd": 254,
          "columnNum": 28
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Combined Ed Classification",
        "otherPossibleNames": [],
        "logicalName": "COMBINED_ED_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 255,
          "offsetEnd": 255,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Special Education Exceptionality Categories",
        "otherPossibleNames": [],
        "logicalName": "SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 256,
          "offsetEnd": 257,
          "columnNum": 30
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Special Ed Accommodations",
        "otherPossibleNames": [],
        "logicalName": "SPECIAL_ED_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 258,
          "offsetEnd": 269,
          "columnNum": 31
        },
        "fieldLength": 12,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 270,
          "offsetEnd": 288,
          "columnNum": 32
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Section 504",
        "otherPossibleNames": [],
        "logicalName": "SECTION_504",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 289,
          "offsetEnd": 289,
          "columnNum": 33
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Section 504 Accommodations",
        "otherPossibleNames": [],
        "logicalName": "SECTION_504_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 290,
          "offsetEnd": 300,
          "columnNum": 34
        },
        "fieldLength": 11,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 301,
          "offsetEnd": 319,
          "columnNum": 35
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Limited English Proficient",
        "otherPossibleNames": [],
        "logicalName": "LIMITED_ENGLISH_PROFICIENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 320,
          "offsetEnd": 320,
          "columnNum": 36
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Limited English Proficient Accommodations",
        "otherPossibleNames": [],
        "logicalName": "LIMITED_ENGLISH_PROFICIENT_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 321,
          "offsetEnd": 327,
          "columnNum": 37
        },
        "fieldLength": 7,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 328,
          "offsetEnd": 350,
          "columnNum": 38
        },
        "fieldLength": 23,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Free Lunch",
        "otherPossibleNames": [],
        "logicalName": "FREE_LUNCH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 351,
          "offsetEnd": 351,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Title I",
        "otherPossibleNames": [],
        "logicalName": "TITLE_I",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 352,
          "offsetEnd": 352,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 353,
          "offsetEnd": 412,
          "columnNum": 41
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_01",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 413,
          "offsetEnd": 414,
          "columnNum": 42
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_02",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 415,
          "offsetEnd": 416,
          "columnNum": 43
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_03",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 417,
          "offsetEnd": 418,
          "columnNum": 44
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_04",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 419,
          "offsetEnd": 420,
          "columnNum": 45
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_05",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 421,
          "offsetEnd": 422,
          "columnNum": 46
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_06",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 423,
          "offsetEnd": 424,
          "columnNum": 47
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_07",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 425,
          "offsetEnd": 426,
          "columnNum": 48
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_08",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 427,
          "offsetEnd": 428,
          "columnNum": 49
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_09",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 429,
          "offsetEnd": 430,
          "columnNum": 50
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_10",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 431,
          "offsetEnd": 432,
          "columnNum": 51
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_11",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 433,
          "offsetEnd": 434,
          "columnNum": 52
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_12",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 435,
          "offsetEnd": 436,
          "columnNum": 53
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_13",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 437,
          "offsetEnd": 438,
          "columnNum": 54
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_14",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 439,
          "offsetEnd": 440,
          "columnNum": 55
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_15",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 441,
          "offsetEnd": 442,
          "columnNum": 56
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_16",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 443,
          "offsetEnd": 444,
          "columnNum": 57
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_17",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 445,
          "offsetEnd": 446,
          "columnNum": 58
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_18",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 447,
          "offsetEnd": 448,
          "columnNum": 59
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_19",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 449,
          "offsetEnd": 450,
          "columnNum": 60
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_20",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 451,
          "offsetEnd": 452,
          "columnNum": 61
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_21",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 453,
          "offsetEnd": 454,
          "columnNum": 62
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_22",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 455,
          "offsetEnd": 456,
          "columnNum": 63
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_23",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 457,
          "offsetEnd": 458,
          "columnNum": 64
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_24",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 459,
          "offsetEnd": 460,
          "columnNum": 65
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_25",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 461,
          "offsetEnd": 462,
          "columnNum": 66
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_26",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 463,
          "offsetEnd": 464,
          "columnNum": 67
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_27",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 465,
          "offsetEnd": 466,
          "columnNum": 68
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_28",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 467,
          "offsetEnd": 468,
          "columnNum": 69
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_29",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 469,
          "offsetEnd": 470,
          "columnNum": 70
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE_30",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 471,
          "offsetEnd": 472,
          "columnNum": 71
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_01",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 473,
          "offsetEnd": 475,
          "columnNum": 72
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_02",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 476,
          "offsetEnd": 478,
          "columnNum": 73
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_03",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 479,
          "offsetEnd": 481,
          "columnNum": 74
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_04",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 482,
          "offsetEnd": 484,
          "columnNum": 75
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_05",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 485,
          "offsetEnd": 487,
          "columnNum": 76
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_06",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 488,
          "offsetEnd": 490,
          "columnNum": 77
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_07",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 491,
          "offsetEnd": 493,
          "columnNum": 78
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_08",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 494,
          "offsetEnd": 496,
          "columnNum": 79
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_09",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 497,
          "offsetEnd": 499,
          "columnNum": 80
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_10",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 500,
          "offsetEnd": 502,
          "columnNum": 81
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_11",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 503,
          "offsetEnd": 505,
          "columnNum": 82
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_12",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 506,
          "offsetEnd": 508,
          "columnNum": 83
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_13",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 509,
          "offsetEnd": 511,
          "columnNum": 84
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_14",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 512,
          "offsetEnd": 514,
          "columnNum": 85
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_15",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 515,
          "offsetEnd": 517,
          "columnNum": 86
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_16",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 518,
          "offsetEnd": 520,
          "columnNum": 87
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_17",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 521,
          "offsetEnd": 523,
          "columnNum": 88
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_18",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 524,
          "offsetEnd": 526,
          "columnNum": 89
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_19",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 527,
          "offsetEnd": 529,
          "columnNum": 90
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_20",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 530,
          "offsetEnd": 532,
          "columnNum": 91
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_21",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 533,
          "offsetEnd": 535,
          "columnNum": 92
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_22",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 536,
          "offsetEnd": 538,
          "columnNum": 93
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_23",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 539,
          "offsetEnd": 541,
          "columnNum": 94
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_24",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 542,
          "offsetEnd": 544,
          "columnNum": 95
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_25",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 545,
          "offsetEnd": 547,
          "columnNum": 96
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_26",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 548,
          "offsetEnd": 550,
          "columnNum": 97
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_27",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 551,
          "offsetEnd": 553,
          "columnNum": 98
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_28",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 554,
          "offsetEnd": 556,
          "columnNum": 99
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_29",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 557,
          "offsetEnd": 559,
          "columnNum": 100
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STANDARD_SCORE_30",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 560,
          "offsetEnd": 562,
          "columnNum": 101
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_01",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 563,
          "offsetEnd": 564,
          "columnNum": 102
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_02",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 565,
          "offsetEnd": 566,
          "columnNum": 103
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_03",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 567,
          "offsetEnd": 568,
          "columnNum": 104
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_04",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 569,
          "offsetEnd": 570,
          "columnNum": 105
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_05",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 571,
          "offsetEnd": 572,
          "columnNum": 106
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_06",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 573,
          "offsetEnd": 574,
          "columnNum": 107
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_07",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 575,
          "offsetEnd": 576,
          "columnNum": 108
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_08",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 577,
          "offsetEnd": 578,
          "columnNum": 109
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_09",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 579,
          "offsetEnd": 580,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_10",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 581,
          "offsetEnd": 582,
          "columnNum": 111
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_11",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 583,
          "offsetEnd": 584,
          "columnNum": 112
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_12",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 585,
          "offsetEnd": 586,
          "columnNum": 113
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_13",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 587,
          "offsetEnd": 588,
          "columnNum": 114
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_14",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 589,
          "offsetEnd": 590,
          "columnNum": 115
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_15",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 591,
          "offsetEnd": 592,
          "columnNum": 116
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_16",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 593,
          "offsetEnd": 594,
          "columnNum": 117
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_17",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 595,
          "offsetEnd": 596,
          "columnNum": 118
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_18",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 597,
          "offsetEnd": 598,
          "columnNum": 119
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_19",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 599,
          "offsetEnd": 600,
          "columnNum": 120
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_20",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 601,
          "offsetEnd": 602,
          "columnNum": 121
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_21",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 603,
          "offsetEnd": 604,
          "columnNum": 122
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_22",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 605,
          "offsetEnd": 606,
          "columnNum": 123
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_23",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 607,
          "offsetEnd": 608,
          "columnNum": 124
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_24",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 609,
          "offsetEnd": 610,
          "columnNum": 125
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_25",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 611,
          "offsetEnd": 612,
          "columnNum": 126
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_26",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 613,
          "offsetEnd": 614,
          "columnNum": 127
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_27",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 615,
          "offsetEnd": 616,
          "columnNum": 128
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_28",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 617,
          "offsetEnd": 618,
          "columnNum": 129
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_29",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 619,
          "offsetEnd": 620,
          "columnNum": 130
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_PERCENTILE_RANK_30",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PERCENTILE_RANK_30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 621,
          "offsetEnd": 622,
          "columnNum": 131
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_01",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 623,
          "offsetEnd": 624,
          "columnNum": 132
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_02",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 625,
          "offsetEnd": 626,
          "columnNum": 133
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_03",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 627,
          "offsetEnd": 628,
          "columnNum": 134
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_04",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 629,
          "offsetEnd": 630,
          "columnNum": 135
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_05",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 631,
          "offsetEnd": 632,
          "columnNum": 136
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_06",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 633,
          "offsetEnd": 634,
          "columnNum": 137
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_07",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 635,
          "offsetEnd": 636,
          "columnNum": 138
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_08",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 637,
          "offsetEnd": 638,
          "columnNum": 139
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_09",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 639,
          "offsetEnd": 640,
          "columnNum": 140
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_10",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 641,
          "offsetEnd": 642,
          "columnNum": 141
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_11",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 643,
          "offsetEnd": 644,
          "columnNum": 142
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_12",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 645,
          "offsetEnd": 646,
          "columnNum": 143
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_13",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 647,
          "offsetEnd": 648,
          "columnNum": 144
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_14",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 649,
          "offsetEnd": 650,
          "columnNum": 145
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_15",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 651,
          "offsetEnd": 652,
          "columnNum": 146
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_16",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 653,
          "offsetEnd": 654,
          "columnNum": 147
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_17",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 655,
          "offsetEnd": 656,
          "columnNum": 148
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_18",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 657,
          "offsetEnd": 658,
          "columnNum": 149
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_19",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 659,
          "offsetEnd": 660,
          "columnNum": 150
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_20",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 661,
          "offsetEnd": 662,
          "columnNum": 151
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_21",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 663,
          "offsetEnd": 664,
          "columnNum": 152
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_22",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 665,
          "offsetEnd": 666,
          "columnNum": 153
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_23",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 667,
          "offsetEnd": 668,
          "columnNum": 154
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_24",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 669,
          "offsetEnd": 670,
          "columnNum": 155
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_25",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 671,
          "offsetEnd": 672,
          "columnNum": 156
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_26",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 673,
          "offsetEnd": 674,
          "columnNum": 157
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_27",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 675,
          "offsetEnd": 676,
          "columnNum": 158
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_28",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 677,
          "offsetEnd": 678,
          "columnNum": 159
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_29",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 679,
          "offsetEnd": 680,
          "columnNum": 160
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCE_SCORE_30",
        "otherPossibleNames": [],
        "logicalName": "NCE_SCORE_30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 681,
          "offsetEnd": 682,
          "columnNum": 161
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_01",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 683,
          "offsetEnd": 683,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_02",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 684,
          "offsetEnd": 684,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_03",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 685,
          "offsetEnd": 685,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_04",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 686,
          "offsetEnd": 686,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_05",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 687,
          "offsetEnd": 687,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_06",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 688,
          "offsetEnd": 688,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_07",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 689,
          "offsetEnd": 689,
          "columnNum": 168
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_08",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 690,
          "offsetEnd": 690,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_09",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 691,
          "offsetEnd": 691,
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_10",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 692,
          "offsetEnd": 692,
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_11",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 693,
          "offsetEnd": 693,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_12",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 694,
          "offsetEnd": 694,
          "columnNum": 173
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_13",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 695,
          "offsetEnd": 695,
          "columnNum": 174
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_14",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 696,
          "offsetEnd": 696,
          "columnNum": 175
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_15",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 697,
          "offsetEnd": 697,
          "columnNum": 176
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_16",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 698,
          "offsetEnd": 698,
          "columnNum": 177
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_17",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 699,
          "offsetEnd": 699,
          "columnNum": 178
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_18",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 700,
          "offsetEnd": 700,
          "columnNum": 179
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_19",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 701,
          "columnNum": 180
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_20",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 702,
          "offsetEnd": 702,
          "columnNum": 181
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_21",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 703,
          "offsetEnd": 703,
          "columnNum": 182
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_22",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 704,
          "offsetEnd": 704,
          "columnNum": 183
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_23",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 705,
          "offsetEnd": 705,
          "columnNum": 184
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_24",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 706,
          "offsetEnd": 706,
          "columnNum": 185
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_25",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 707,
          "offsetEnd": 707,
          "columnNum": 186
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_26",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 708,
          "offsetEnd": 708,
          "columnNum": 187
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_27",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 709,
          "offsetEnd": 709,
          "columnNum": 188
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_28",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 710,
          "offsetEnd": 710,
          "columnNum": 189
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_29",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 711,
          "offsetEnd": 711,
          "columnNum": 190
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIONAL_STANINE_SCORE_30",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_SCORE_30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 712,
          "offsetEnd": 712,
          "columnNum": 191
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PR Valid Flag",
        "otherPossibleNames": [],
        "logicalName": "PR_VALID_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 713,
          "offsetEnd": 742,
          "columnNum": 192
        },
        "fieldLength": 30,
        "expectedValues": ["0", "1", ""],
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
          "offsetStart": 743,
          "offsetEnd": 922,
          "columnNum": 193
        },
        "fieldLength": 180,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Predicted SAT Verbal High",
        "otherPossibleNames": [],
        "logicalName": "PREDICTED_SAT_VERBAL_HIGH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 923,
          "offsetEnd": 925,
          "columnNum": 194
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Predicted SAT Verbal Low",
        "otherPossibleNames": [],
        "logicalName": "PREDICTED_SAT_VERBAL_LOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 926,
          "offsetEnd": 928,
          "columnNum": 195
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Predicted SAT Math High",
        "otherPossibleNames": [],
        "logicalName": "PREDICTED_SAT_MATH_HIGH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 929,
          "offsetEnd": 931,
          "columnNum": 196
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Predicted SAT Math Low",
        "otherPossibleNames": [],
        "logicalName": "PREDICTED_SAT_MATH_LOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 932,
          "offsetEnd": 934,
          "columnNum": 197
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Predicted ACT High",
        "otherPossibleNames": [],
        "logicalName": "PREDICTED_ACT_HIGH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 935,
          "offsetEnd": 937,
          "columnNum": 198
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Predicted ACT Low",
        "otherPossibleNames": [],
        "logicalName": "PREDICTED_ACT_LOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 938,
          "offsetEnd": 940,
          "columnNum": 199
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Item Responses 1-220",
        "otherPossibleNames": [],
        "logicalName": "ITEM_RESPONSES_1-220",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 941,
          "offsetEnd": 1160,
          "columnNum": 200
        },
        "fieldLength": 220,
        "expectedValues": ["A", "B", "C", "D", "E", "1", "2", "3", "4", "5", "*", "0"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item Responses 221-440",
        "otherPossibleNames": [],
        "logicalName": "ITEM_RESPONSES_221-440",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1161,
          "offsetEnd": 1380,
          "columnNum": 201
        },
        "fieldLength": 220,
        "expectedValues": ["A", "B", "C", "D", "E", "1", "2", "3", "4", "5", "*", "0"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Item Responses 441-660",
        "otherPossibleNames": [],
        "logicalName": "ITEM_RESPONSES_441-660",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1381,
          "offsetEnd": 1600,
          "columnNum": 202
        },
        "fieldLength": 220,
        "expectedValues": ["A", "B", "C", "D", "E", "1", "2", "3", "4", "5", "*", "0"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Optional Coding G Value",
        "otherPossibleNames": [],
        "logicalName": "OPTIONAL_CODING_G_VALUE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1601,
          "offsetEnd": 1602,
          "columnNum": 203
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Optional Coding H Value",
        "otherPossibleNames": [],
        "logicalName": "OPTIONAL_CODING_H_VALUE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1603,
          "offsetEnd": 1604,
          "columnNum": 204
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Optional Coding I Value",
        "otherPossibleNames": [],
        "logicalName": "OPTIONAL_CODING_I_VALUE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1605,
          "offsetEnd": 1606,
          "columnNum": 205
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Optional Coding J Value",
        "otherPossibleNames": [],
        "logicalName": "OPTIONAL_CODING_J_VALUE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1607,
          "offsetEnd": 1608,
          "columnNum": 206
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Accountability Code",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1609,
          "offsetEnd": 1610,
          "columnNum": 207
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Routing Site Code",
        "otherPossibleNames": [],
        "logicalName": "ROUTING_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1611,
          "offsetEnd": 1616,
          "columnNum": 208
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Index Scores",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SCORES_RT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1617,
          "offsetEnd": 1622,
          "columnNum": 209
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Index Scores",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SCORES_LT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1623,
          "offsetEnd": 1628,
          "columnNum": 210
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Index Scores",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SCORES_MT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1629,
          "offsetEnd": 1634,
          "columnNum": 211
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Index Scores",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SCORES_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1635,
          "offsetEnd": 1640,
          "columnNum": 212
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Index Scores",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SCORES_SC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1641,
          "offsetEnd": 1646,
          "columnNum": 213
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Index Scores",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SCORES_ST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1647,
          "offsetEnd": 1652,
          "columnNum": 214
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Index Scores",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SCORES_CC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1653,
          "offsetEnd": 1658,
          "columnNum": 215
        },
        "fieldLength": 6,
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
          "offsetStart": 1659,
          "offsetEnd": 1796,
          "columnNum": 216
        },
        "fieldLength": 138,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Erasure Analysis Voiding Flag",
        "otherPossibleNames": [],
        "logicalName": "ERASURE_ANALYSIS_VOIDING_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1797,
          "offsetEnd": 1802,
          "columnNum": 217
        },
        "fieldLength": 6,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 1803,
          "offsetEnd": 1826,
          "columnNum": 218
        },
        "fieldLength": 24,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1827,
          "offsetEnd": 1856,
          "columnNum": 219
        },
        "fieldLength": 30,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Testing Attendance",
        "otherPossibleNames": [],
        "logicalName": "TESTING_ATTENDANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1857,
          "offsetEnd": 1873,
          "columnNum": 220
        },
        "fieldLength": 17,
        "expectedValues": ["0", "1"],
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
          "offsetStart": 1874,
          "offsetEnd": 1889,
          "columnNum": 221
        },
        "fieldLength": 16,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "District Void Flag",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_VOID_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1890,
          "offsetEnd": 1919,
          "columnNum": 222
        },
        "fieldLength": 30,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form Type",
        "otherPossibleNames": [],
        "logicalName": "FORM_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1920,
          "offsetEnd": 1920,
          "columnNum": 223
        },
        "fieldLength": 1,
        "expectedValues": ["P", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Duplicate Resolution Flag",
        "otherPossibleNames": [],
        "logicalName": "DUPLICATE_RESOLUTION_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1921,
          "offsetEnd": 1921,
          "columnNum": 224
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precoded Free/Reduced Lunch",
        "otherPossibleNames": [],
        "logicalName": "PRECODED_FREE/REDUCED_LUNCH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1922,
          "offsetEnd": 1922,
          "columnNum": 225
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "I", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precode Ed Classification",
        "otherPossibleNames": [],
        "logicalName": "PRECODE_ED_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1923,
          "offsetEnd": 1923,
          "columnNum": 226
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Precode Primary Exceptionality",
        "otherPossibleNames": [],
        "logicalName": "PRECODE_PRIMARY_EXCEPTIONALITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1924,
          "offsetEnd": 1925,
          "columnNum": 227
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Precode Exceptionality Categories",
        "otherPossibleNames": [],
        "logicalName": "PRECODE_EXCEPTIONALITY_CATEGORIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1926,
          "offsetEnd": 1927,
          "columnNum": 228
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Precode Limited English Proficient",
        "otherPossibleNames": [],
        "logicalName": "PRECODE_LIMITED_ENGLISH_PROFICIENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1928,
          "offsetEnd": 1929,
          "columnNum": 229
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Precode District Name",
        "otherPossibleNames": [],
        "logicalName": "PRECODE_DISTRICT_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1930,
          "offsetEnd": 1974,
          "columnNum": 230
        },
        "fieldLength": 45,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precode School Name",
        "otherPossibleNames": [],
        "logicalName": "PRECODE_SCHOOL_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1975,
          "offsetEnd": 2020,
          "columnNum": 231
        },
        "fieldLength": 46,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 2021,
          "offsetEnd": 2022,
          "columnNum": 232
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precode Grade Placement",
        "otherPossibleNames": [],
        "logicalName": "PRECODE_GRADE_PLACEMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2023,
          "offsetEnd": 2024,
          "columnNum": 233
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Precode Option Flag",
        "otherPossibleNames": [],
        "logicalName": "PRECODE_OPTION_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2025,
          "offsetEnd": 2025,
          "columnNum": 234
        },
        "fieldLength": 1,
        "expectedValues": ["", "2", "3"],
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
          "offsetStart": 2026,
          "offsetEnd": 2125,
          "columnNum": 235
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hand-griddedClassification Education",
        "otherPossibleNames": [],
        "logicalName": "HAND-GRIDDEDCLASSIFICATION_EDUCATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2126,
          "offsetEnd": 2126,
          "columnNum": 236
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "*"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hand-gridded Special Education Exceptionality Categories",
        "otherPossibleNames": [],
        "logicalName": "HAND-GRIDDED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2127,
          "offsetEnd": 2144,
          "columnNum": 237
        },
        "fieldLength": 18,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hand-gridded Limited English Proficient",
        "otherPossibleNames": [],
        "logicalName": "HAND-GRIDDED_LIMITED_ENGLISH_PROFICIENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2145,
          "offsetEnd": 2145,
          "columnNum": 238
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "*"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Included in Group Averages",
        "otherPossibleNames": [],
        "logicalName": "INCLUDED_IN_GROUP_AVERAGES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2146,
          "offsetEnd": 2146,
          "columnNum": 239
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "District Entity Flag",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_ENTITY_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2147,
          "offsetEnd": 2149,
          "columnNum": 240
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Missing Document Flag",
        "otherPossibleNames": [],
        "logicalName": "MISSING_DOCUMENT_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2150,
          "offsetEnd": 2150,
          "columnNum": 241
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Add Report Flag",
        "otherPossibleNames": [],
        "logicalName": "ADD_REPORT_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2151,
          "offsetEnd": 2151,
          "columnNum": 242
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", "S"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RPC_ID",
        "otherPossibleNames": [],
        "logicalName": "RPC_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2152,
          "offsetEnd": 2160,
          "columnNum": 243
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Barcode Number",
        "otherPossibleNames": [],
        "logicalName": "BARCODE_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2161,
          "offsetEnd": 2170,
          "columnNum": 244
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}