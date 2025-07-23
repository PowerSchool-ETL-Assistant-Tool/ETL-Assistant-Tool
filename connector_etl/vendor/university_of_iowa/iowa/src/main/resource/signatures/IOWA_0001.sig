{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "IOWA_0001",
    "quoteDelim": "\"",
    "fieldDelim": null,
    "hasHeader": true,
    "naturalKey": ["TEST_NAME", "STUDENT_ID_NUMBER", "DATE_TESTED"],
    "fields": [{
      "physicalName": "Order#",
      "otherPossibleNames": [],
      "logicalName": "ORDER#",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "Y",
      "fieldOffset": {
        "offsetStart": 1,
        "offsetEnd": 8,
        "columnNum": 1
      },
      "fieldLength": 8,
      "expectedValues": [],
      "dataTypes": "INTEGER",
      "scale": null
    },
      {
        "physicalName": "Suborder#",
        "otherPossibleNames": [],
        "logicalName": "SUBORDER#",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 9,
          "offsetEnd": 10,
          "columnNum": 2
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Order Name",
        "otherPossibleNames": [],
        "logicalName": "ORDER_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 11,
          "offsetEnd": 30,
          "columnNum": 3
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Date Tested",
        "otherPossibleNames": [],
        "logicalName": "DATE_TESTED",
        "formatMask": "MMddyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 31,
          "offsetEnd": 36,
          "columnNum": 4
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "DATE",
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
          "offsetStart": 37,
          "offsetEnd": 39,
          "columnNum": 5
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Semester",
        "otherPossibleNames": [],
        "logicalName": "SEMESTER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 40,
          "offsetEnd": 40,
          "columnNum": 6
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Date for Interpolated Norms",
        "otherPossibleNames": [],
        "logicalName": "DATE_FOR_INTERPOLATED_NORMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 41,
          "offsetEnd": 45,
          "columnNum": 7
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Norms: Year",
        "otherPossibleNames": [],
        "logicalName": "NORMS:_YEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 46,
          "offsetEnd": 47,
          "columnNum": 8
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
          "offsetStart": 48,
          "offsetEnd": 67,
          "columnNum": 9
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Main Score Achievement Indicator",
        "otherPossibleNames": [],
        "logicalName": "MAIN_SCORE_ACHIEVEMENT_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 68,
          "offsetEnd": 69,
          "columnNum": 10
        },
        "fieldLength": 2,
        "expectedValues": ["SS"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "4-Char Acronym",
        "otherPossibleNames": [],
        "logicalName": "4-CHAR_ACRONYM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 70,
          "offsetEnd": 73,
          "columnNum": 11
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "3-Digit Ref Number",
        "otherPossibleNames": [],
        "logicalName": "3-DIGIT_REF_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 74,
          "offsetEnd": 76,
          "columnNum": 12
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
          "offsetStart": 77,
          "offsetEnd": 83,
          "columnNum": 13
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Calculator Norms",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR_NORMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 84,
          "offsetEnd": 87,
          "columnNum": 14
        },
        "fieldLength": 4,
        "expectedValues": ["CALC"],
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
          "offsetStart": 88,
          "offsetEnd": 91,
          "columnNum": 15
        },
        "fieldLength": 4,
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
          "offsetStart": 92,
          "offsetEnd": 105,
          "columnNum": 16
        },
        "fieldLength": 14,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reserved",
        "otherPossibleNames": [],
        "logicalName": "RESERVED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 106,
          "offsetEnd": 113,
          "columnNum": 17
        },
        "fieldLength": 8,
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
          "offsetStart": 114,
          "offsetEnd": 133,
          "columnNum": 18
        },
        "fieldLength": 20,
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
          "offsetStart": 134,
          "offsetEnd": 136,
          "columnNum": 19
        },
        "fieldLength": 3,
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
          "offsetStart": 137,
          "offsetEnd": 139,
          "columnNum": 20
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
          "offsetStart": 140,
          "offsetEnd": 142,
          "columnNum": 21
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
          "offsetStart": 143,
          "offsetEnd": 186,
          "columnNum": 22
        },
        "fieldLength": 44,
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
          "offsetStart": 187,
          "offsetEnd": 206,
          "columnNum": 23
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Count",
        "otherPossibleNames": [],
        "logicalName": "CLASS_COUNT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 207,
          "offsetEnd": 209,
          "columnNum": 24
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Class Code",
        "otherPossibleNames": [],
        "logicalName": "CLASS_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 210,
          "offsetEnd": 214,
          "columnNum": 25
        },
        "fieldLength": 5,
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
          "offsetStart": 215,
          "offsetEnd": 250,
          "columnNum": 26
        },
        "fieldLength": 36,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Last",
        "otherPossibleNames": [],
        "logicalName": "LAST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 251,
          "offsetEnd": 261,
          "columnNum": 27
        },
        "fieldLength": 11,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "First",
        "otherPossibleNames": [],
        "logicalName": "FIRST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 262,
          "offsetEnd": 269,
          "columnNum": 28
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Sex",
        "otherPossibleNames": [],
        "logicalName": "SEX",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 270,
          "offsetEnd": 270,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["M", "F"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Date of Birth",
        "otherPossibleNames": [],
        "logicalName": "DATE_OF_BIRTH",
        "formatMask": "MMddyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 271,
          "offsetEnd": 274,
          "columnNum": 30
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Race/Ethnicity",
        "otherPossibleNames": [],
        "logicalName": "RACE/ETHNICITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 275,
          "offsetEnd": 275,
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Section 504 Student Designation",
        "otherPossibleNames": [],
        "logicalName": "SECTION_504_STUDENT_DESIGNATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 276,
          "offsetEnd": 278,
          "columnNum": 32
        },
        "fieldLength": 3,
        "expectedValues": ["002"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 279,
          "offsetEnd": 281,
          "columnNum": 33
        },
        "fieldLength": 3,
        "expectedValues": ["001", "002"],
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
          "offsetStart": 282,
          "offsetEnd": 284,
          "columnNum": 34
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Title I 285 Reading 286 Language 287 Math",
        "otherPossibleNames": [],
        "logicalName": "TITLE_I_285_READING_286_LANGUAGE_287_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 285,
          "offsetEnd": 287,
          "columnNum": 35
        },
        "fieldLength": 3,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student ID Number",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_ID_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 288,
          "offsetEnd": 297,
          "columnNum": 36
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Pre-CodediD",
        "otherPossibleNames": [],
        "logicalName": "PRE-CODEDID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 298,
          "offsetEnd": 307,
          "columnNum": 37
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Student Bar-Code Number",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_BAR-CODE_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 308,
          "offsetEnd": 317,
          "columnNum": 38
        },
        "fieldLength": 10,
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
          "offsetStart": 318,
          "offsetEnd": 325,
          "columnNum": 39
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student’s Education Classification",
        "otherPossibleNames": [],
        "logicalName": "STUDENT’S_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 326,
          "offsetEnd": 326,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": ["2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Free/Reduced Lunch",
        "otherPossibleNames": [],
        "logicalName": "FREE/REDUCED_LUNCH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 327,
          "offsetEnd": 327,
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Calculator Use",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR_USE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 328,
          "offsetEnd": 328,
          "columnNum": 42
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
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
          "offsetStart": 329,
          "offsetEnd": 329,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Age in Months",
        "otherPossibleNames": [],
        "logicalName": "AGE_IN_MONTHS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 330,
          "offsetEnd": 332,
          "columnNum": 44
        },
        "fieldLength": 3,
        "expectedValues": [],
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
          "offsetStart": 333,
          "offsetEnd": 336,
          "columnNum": 45
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Answer Document Code",
        "otherPossibleNames": [],
        "logicalName": "ANSWER_DOCUMENT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 337,
          "offsetEnd": 342,
          "columnNum": 46
        },
        "fieldLength": 6,
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
          "offsetStart": 343,
          "offsetEnd": 354,
          "columnNum": 47
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 355,
          "offsetEnd": 359,
          "columnNum": 48
        },
        "fieldLength": 5,
        "expectedValues": ["ITBS", "ITED"],
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
          "offsetStart": 360,
          "offsetEnd": 361,
          "columnNum": 49
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Combined Indicator",
        "otherPossibleNames": [],
        "logicalName": "COMBINED_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 362,
          "offsetEnd": 362,
          "columnNum": 50
        },
        "fieldLength": 1,
        "expectedValues": ["C"],
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
          "offsetStart": 363,
          "offsetEnd": 364,
          "columnNum": 51
        },
        "fieldLength": 2,
        "expectedValues": ["03", "04", "05", "06", "07", "08", "09"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Test Level",
        "otherPossibleNames": [],
        "logicalName": "TEST_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 365,
          "offsetEnd": 366,
          "columnNum": 52
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 367,
          "offsetEnd": 367,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": ["1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Test Form",
        "otherPossibleNames": [],
        "logicalName": "TEST_FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 368,
          "offsetEnd": 368,
          "columnNum": 54
        },
        "fieldLength": 1,
        "expectedValues": ["M"],
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
          "offsetStart": 369,
          "offsetEnd": 369,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 370,
          "offsetEnd": 371,
          "columnNum": 56
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 372,
          "offsetEnd": 373,
          "columnNum": 57
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 374,
          "offsetEnd": 375,
          "columnNum": 58
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 376,
          "offsetEnd": 377,
          "columnNum": 59
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 378,
          "offsetEnd": 379,
          "columnNum": 60
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 380,
          "offsetEnd": 381,
          "columnNum": 61
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 382,
          "offsetEnd": 383,
          "columnNum": 62
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 384,
          "offsetEnd": 385,
          "columnNum": 63
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 386,
          "offsetEnd": 387,
          "columnNum": 64
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 388,
          "offsetEnd": 389,
          "columnNum": 65
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 390,
          "offsetEnd": 391,
          "columnNum": 66
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 392,
          "offsetEnd": 393,
          "columnNum": 67
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 394,
          "offsetEnd": 395,
          "columnNum": 68
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 396,
          "offsetEnd": 397,
          "columnNum": 69
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 398,
          "offsetEnd": 399,
          "columnNum": 70
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 400,
          "offsetEnd": 401,
          "columnNum": 71
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 402,
          "offsetEnd": 403,
          "columnNum": 72
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 404,
          "offsetEnd": 405,
          "columnNum": 73
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 406,
          "offsetEnd": 407,
          "columnNum": 74
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 408,
          "offsetEnd": 409,
          "columnNum": 75
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 410,
          "offsetEnd": 411,
          "columnNum": 76
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 412,
          "offsetEnd": 413,
          "columnNum": 77
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 414,
          "offsetEnd": 415,
          "columnNum": 78
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 416,
          "offsetEnd": 417,
          "columnNum": 79
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 418,
          "offsetEnd": 419,
          "columnNum": 80
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 420,
          "offsetEnd": 421,
          "columnNum": 81
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Attempted",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 422,
          "offsetEnd": 423,
          "columnNum": 82
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 424,
          "offsetEnd": 425,
          "columnNum": 83
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 426,
          "offsetEnd": 427,
          "columnNum": 84
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 428,
          "offsetEnd": 429,
          "columnNum": 85
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 430,
          "offsetEnd": 431,
          "columnNum": 86
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 432,
          "offsetEnd": 433,
          "columnNum": 87
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 434,
          "offsetEnd": 435,
          "columnNum": 88
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 436,
          "offsetEnd": 437,
          "columnNum": 89
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 438,
          "offsetEnd": 439,
          "columnNum": 90
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 440,
          "offsetEnd": 441,
          "columnNum": 91
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 442,
          "offsetEnd": 443,
          "columnNum": 92
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 444,
          "offsetEnd": 445,
          "columnNum": 93
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 446,
          "offsetEnd": 447,
          "columnNum": 94
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 448,
          "offsetEnd": 449,
          "columnNum": 95
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 450,
          "offsetEnd": 451,
          "columnNum": 96
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 452,
          "offsetEnd": 453,
          "columnNum": 97
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 454,
          "offsetEnd": 455,
          "columnNum": 98
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 456,
          "offsetEnd": 457,
          "columnNum": 99
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 458,
          "offsetEnd": 459,
          "columnNum": 100
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 460,
          "offsetEnd": 461,
          "columnNum": 101
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 462,
          "offsetEnd": 463,
          "columnNum": 102
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 464,
          "offsetEnd": 465,
          "columnNum": 103
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 466,
          "offsetEnd": 467,
          "columnNum": 104
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 468,
          "offsetEnd": 469,
          "columnNum": 105
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 470,
          "offsetEnd": 471,
          "columnNum": 106
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 472,
          "offsetEnd": 473,
          "columnNum": 107
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 474,
          "offsetEnd": 475,
          "columnNum": 108
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Number of Test Items Correct",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 476,
          "offsetEnd": 477,
          "columnNum": 109
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 478,
          "offsetEnd": 480,
          "columnNum": 110
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 481,
          "offsetEnd": 483,
          "columnNum": 111
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 484,
          "offsetEnd": 486,
          "columnNum": 112
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 487,
          "offsetEnd": 489,
          "columnNum": 113
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 490,
          "offsetEnd": 492,
          "columnNum": 114
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 493,
          "offsetEnd": 495,
          "columnNum": 115
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 496,
          "offsetEnd": 498,
          "columnNum": 116
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 499,
          "offsetEnd": 501,
          "columnNum": 117
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 502,
          "offsetEnd": 504,
          "columnNum": 118
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 505,
          "offsetEnd": 507,
          "columnNum": 119
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 508,
          "offsetEnd": 510,
          "columnNum": 120
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 511,
          "offsetEnd": 513,
          "columnNum": 121
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 514,
          "offsetEnd": 516,
          "columnNum": 122
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 517,
          "offsetEnd": 519,
          "columnNum": 123
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 520,
          "offsetEnd": 522,
          "columnNum": 124
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 523,
          "offsetEnd": 525,
          "columnNum": 125
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 526,
          "offsetEnd": 528,
          "columnNum": 126
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 529,
          "offsetEnd": 531,
          "columnNum": 127
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 532,
          "offsetEnd": 534,
          "columnNum": 128
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 535,
          "offsetEnd": 537,
          "columnNum": 129
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 538,
          "offsetEnd": 540,
          "columnNum": 130
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 541,
          "offsetEnd": 543,
          "columnNum": 131
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 544,
          "offsetEnd": 546,
          "columnNum": 132
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 547,
          "offsetEnd": 549,
          "columnNum": 133
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 550,
          "offsetEnd": 552,
          "columnNum": 134
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 553,
          "offsetEnd": 555,
          "columnNum": 135
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Grade Equivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 556,
          "offsetEnd": 558,
          "columnNum": 136
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 559,
          "offsetEnd": 561,
          "columnNum": 138
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 562,
          "offsetEnd": 564,
          "columnNum": 139
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 565,
          "offsetEnd": 567,
          "columnNum": 140
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 568,
          "offsetEnd": 570,
          "columnNum": 141
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 571,
          "offsetEnd": 573,
          "columnNum": 142
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 574,
          "offsetEnd": 576,
          "columnNum": 143
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 577,
          "offsetEnd": 579,
          "columnNum": 144
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 580,
          "offsetEnd": 582,
          "columnNum": 145
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 583,
          "offsetEnd": 585,
          "columnNum": 146
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 586,
          "offsetEnd": 588,
          "columnNum": 147
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 589,
          "offsetEnd": 591,
          "columnNum": 148
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 592,
          "offsetEnd": 594,
          "columnNum": 149
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 595,
          "offsetEnd": 597,
          "columnNum": 150
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 598,
          "offsetEnd": 600,
          "columnNum": 151
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 601,
          "offsetEnd": 603,
          "columnNum": 152
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 604,
          "offsetEnd": 606,
          "columnNum": 153
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 607,
          "offsetEnd": 609,
          "columnNum": 154
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 610,
          "offsetEnd": 612,
          "columnNum": 155
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 613,
          "offsetEnd": 615,
          "columnNum": 156
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 616,
          "offsetEnd": 618,
          "columnNum": 157
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 619,
          "offsetEnd": 621,
          "columnNum": 158
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 622,
          "offsetEnd": 624,
          "columnNum": 159
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 625,
          "offsetEnd": 627,
          "columnNum": 160
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 628,
          "offsetEnd": 630,
          "columnNum": 161
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 631,
          "offsetEnd": 633,
          "columnNum": 162
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 634,
          "offsetEnd": 636,
          "columnNum": 163
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Score",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_SCORE_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 637,
          "offsetEnd": 639,
          "columnNum": 164
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 640,
          "offsetEnd": 641,
          "columnNum": 165
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 642,
          "offsetEnd": 643,
          "columnNum": 166
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 644,
          "offsetEnd": 645,
          "columnNum": 167
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 646,
          "offsetEnd": 647,
          "columnNum": 168
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 648,
          "offsetEnd": 649,
          "columnNum": 169
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 650,
          "offsetEnd": 651,
          "columnNum": 170
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 652,
          "offsetEnd": 653,
          "columnNum": 171
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 654,
          "offsetEnd": 655,
          "columnNum": 172
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 656,
          "offsetEnd": 657,
          "columnNum": 173
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 658,
          "offsetEnd": 659,
          "columnNum": 174
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 660,
          "offsetEnd": 661,
          "columnNum": 175
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 662,
          "offsetEnd": 663,
          "columnNum": 176
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 664,
          "offsetEnd": 665,
          "columnNum": 177
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 666,
          "offsetEnd": 667,
          "columnNum": 178
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 668,
          "offsetEnd": 669,
          "columnNum": 179
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 670,
          "offsetEnd": 671,
          "columnNum": 180
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 672,
          "offsetEnd": 673,
          "columnNum": 181
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 674,
          "offsetEnd": 675,
          "columnNum": 182
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 676,
          "offsetEnd": 677,
          "columnNum": 183
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 678,
          "offsetEnd": 679,
          "columnNum": 184
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 680,
          "offsetEnd": 681,
          "columnNum": 185
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 682,
          "offsetEnd": 683,
          "columnNum": 186
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 684,
          "offsetEnd": 685,
          "columnNum": 187
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 686,
          "offsetEnd": 687,
          "columnNum": 188
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 688,
          "offsetEnd": 689,
          "columnNum": 189
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 690,
          "offsetEnd": 691,
          "columnNum": 190
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 692,
          "offsetEnd": 693,
          "columnNum": 191
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 694,
          "offsetEnd": 694,
          "columnNum": 192
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 695,
          "offsetEnd": 695,
          "columnNum": 193
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 696,
          "offsetEnd": 696,
          "columnNum": 194
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 697,
          "offsetEnd": 697,
          "columnNum": 195
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 698,
          "offsetEnd": 698,
          "columnNum": 196
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 699,
          "offsetEnd": 699,
          "columnNum": 197
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 700,
          "offsetEnd": 700,
          "columnNum": 198
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 701,
          "columnNum": 199
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 702,
          "offsetEnd": 702,
          "columnNum": 200
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 703,
          "offsetEnd": 703,
          "columnNum": 201
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 704,
          "offsetEnd": 704,
          "columnNum": 202
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 705,
          "offsetEnd": 705,
          "columnNum": 203
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 706,
          "offsetEnd": 706,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 707,
          "offsetEnd": 707,
          "columnNum": 205
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 708,
          "offsetEnd": 708,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 709,
          "offsetEnd": 709,
          "columnNum": 207
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 710,
          "offsetEnd": 710,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 711,
          "offsetEnd": 711,
          "columnNum": 209
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 712,
          "offsetEnd": 712,
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 713,
          "offsetEnd": 713,
          "columnNum": 211
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 714,
          "offsetEnd": 714,
          "columnNum": 212
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 715,
          "offsetEnd": 715,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 716,
          "offsetEnd": 716,
          "columnNum": 214
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 717,
          "offsetEnd": 717,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 718,
          "offsetEnd": 718,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 719,
          "offsetEnd": 719,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stan me",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STAN_ME_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 720,
          "offsetEnd": 720,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 721,
          "offsetEnd": 722,
          "columnNum": 219
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 723,
          "offsetEnd": 724,
          "columnNum": 220
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 725,
          "offsetEnd": 726,
          "columnNum": 221
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 727,
          "offsetEnd": 728,
          "columnNum": 222
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 729,
          "offsetEnd": 730,
          "columnNum": 223
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 731,
          "offsetEnd": 732,
          "columnNum": 224
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 733,
          "offsetEnd": 734,
          "columnNum": 225
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 735,
          "offsetEnd": 736,
          "columnNum": 226
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 737,
          "offsetEnd": 738,
          "columnNum": 227
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 739,
          "offsetEnd": 740,
          "columnNum": 228
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 741,
          "offsetEnd": 742,
          "columnNum": 229
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 743,
          "offsetEnd": 744,
          "columnNum": 230
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 745,
          "offsetEnd": 746,
          "columnNum": 231
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 747,
          "offsetEnd": 748,
          "columnNum": 232
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 749,
          "offsetEnd": 750,
          "columnNum": 233
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 751,
          "offsetEnd": 752,
          "columnNum": 234
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 753,
          "offsetEnd": 754,
          "columnNum": 235
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 755,
          "offsetEnd": 756,
          "columnNum": 236
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 757,
          "offsetEnd": 758,
          "columnNum": 237
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 759,
          "offsetEnd": 760,
          "columnNum": 238
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 761,
          "offsetEnd": 762,
          "columnNum": 239
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 763,
          "offsetEnd": 764,
          "columnNum": 240
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 765,
          "offsetEnd": 766,
          "columnNum": 241
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 767,
          "offsetEnd": 768,
          "columnNum": 242
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 769,
          "offsetEnd": 770,
          "columnNum": 243
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 771,
          "offsetEnd": 772,
          "columnNum": 244
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra PR 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_PR_1_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 773,
          "offsetEnd": 774,
          "columnNum": 245
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 775,
          "offsetEnd": 775,
          "columnNum": 246
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 776,
          "offsetEnd": 776,
          "columnNum": 247
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 777,
          "offsetEnd": 777,
          "columnNum": 248
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 778,
          "offsetEnd": 778,
          "columnNum": 249
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 779,
          "offsetEnd": 779,
          "columnNum": 250
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 780,
          "offsetEnd": 780,
          "columnNum": 251
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 781,
          "offsetEnd": 781,
          "columnNum": 252
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 782,
          "offsetEnd": 782,
          "columnNum": 253
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 783,
          "offsetEnd": 783,
          "columnNum": 254
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 784,
          "offsetEnd": 784,
          "columnNum": 255
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 785,
          "offsetEnd": 785,
          "columnNum": 256
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 786,
          "offsetEnd": 786,
          "columnNum": 257
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 787,
          "offsetEnd": 787,
          "columnNum": 258
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 788,
          "offsetEnd": 788,
          "columnNum": 259
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 789,
          "offsetEnd": 789,
          "columnNum": 260
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 790,
          "offsetEnd": 790,
          "columnNum": 261
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 791,
          "offsetEnd": 791,
          "columnNum": 262
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 792,
          "offsetEnd": 792,
          "columnNum": 263
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 793,
          "offsetEnd": 793,
          "columnNum": 264
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 794,
          "offsetEnd": 794,
          "columnNum": 265
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 795,
          "offsetEnd": 795,
          "columnNum": 266
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 796,
          "offsetEnd": 796,
          "columnNum": 267
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 797,
          "offsetEnd": 797,
          "columnNum": 268
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 798,
          "offsetEnd": 798,
          "columnNum": 269
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 799,
          "offsetEnd": 799,
          "columnNum": 270
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 800,
          "offsetEnd": 800,
          "columnNum": 271
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Extra Stanine 1",
        "otherPossibleNames": [],
        "logicalName": "EXTRA_STANINE_1_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 801,
          "offsetEnd": 801,
          "columnNum": 272
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
          "offsetStart": 802,
          "offsetEnd": 882,
          "columnNum": 273
        },
        "fieldLength": 81,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 883,
          "offsetEnd": 884,
          "columnNum": 274
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 885,
          "offsetEnd": 886,
          "columnNum": 275
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 887,
          "offsetEnd": 888,
          "columnNum": 276
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 889,
          "offsetEnd": 890,
          "columnNum": 277
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 891,
          "offsetEnd": 892,
          "columnNum": 278
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 893,
          "offsetEnd": 894,
          "columnNum": 279
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 895,
          "offsetEnd": 896,
          "columnNum": 280
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 897,
          "offsetEnd": 898,
          "columnNum": 281
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 899,
          "offsetEnd": 900,
          "columnNum": 282
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 901,
          "offsetEnd": 902,
          "columnNum": 283
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 903,
          "offsetEnd": 904,
          "columnNum": 284
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 905,
          "offsetEnd": 906,
          "columnNum": 285
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 907,
          "offsetEnd": 908,
          "columnNum": 286
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 909,
          "offsetEnd": 910,
          "columnNum": 287
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 911,
          "offsetEnd": 912,
          "columnNum": 288
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 913,
          "offsetEnd": 914,
          "columnNum": 289
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 915,
          "offsetEnd": 916,
          "columnNum": 290
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 917,
          "offsetEnd": 918,
          "columnNum": 291
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 919,
          "offsetEnd": 920,
          "columnNum": 292
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 921,
          "offsetEnd": 922,
          "columnNum": 293
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 923,
          "offsetEnd": 924,
          "columnNum": 294
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 925,
          "offsetEnd": 926,
          "columnNum": 295
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 927,
          "offsetEnd": 928,
          "columnNum": 296
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 929,
          "offsetEnd": 930,
          "columnNum": 297
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 931,
          "offsetEnd": 932,
          "columnNum": 298
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 933,
          "offsetEnd": 934,
          "columnNum": 299
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Normal Curve Equivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 935,
          "offsetEnd": 936,
          "columnNum": 300
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
          "offsetStart": 937,
          "offsetEnd": 1600,
          "columnNum": 301
        },
        "fieldLength": 664,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Date of Birth",
        "otherPossibleNames": [],
        "logicalName": "DATE_OF_BIRTH",
        "formatMask": "MMddyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1601,
          "offsetEnd": 1606,
          "columnNum": 302
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "DATE",
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
          "offsetStart": 1607,
          "offsetEnd": 1609,
          "columnNum": 303
        },
        "fieldLength": 13,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Data",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1620,
          "offsetEnd": 1627,
          "columnNum": 304
        },
        "fieldLength": 8,
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
          "offsetStart": 1628,
          "offsetEnd": 1628,
          "columnNum": 305
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Special Education Classification ",
        "otherPossibleNames": [],
        "logicalName": "SPECIAL_EDUCATION_CLASSIFICATION_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1629,
          "offsetEnd": 1629,
          "columnNum": 306
        },
        "fieldLength": 1,
        "expectedValues": ["A", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N", "0", "P", "Q"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP Accommodation",
        "otherPossibleNames": [],
        "logicalName": "LEP_ACCOMMODATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1630,
          "offsetEnd": 1630,
          "columnNum": 307
        },
        "fieldLength": 1,
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
          "offsetStart": 1631,
          "offsetEnd": 1631,
          "columnNum": 308
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille**",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1632,
          "offsetEnd": 1632,
          "columnNum": 309
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1633,
          "offsetEnd": 1633,
          "columnNum": 310
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded**",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1634,
          "offsetEnd": 1634,
          "columnNum": 311
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time**",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1635,
          "offsetEnd": 1635,
          "columnNum": 312
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance**",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1636,
          "offsetEnd": 1636,
          "columnNum": 313
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1637,
          "offsetEnd": 1637,
          "columnNum": 314
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1638,
          "offsetEnd": 1638,
          "columnNum": 315
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Repeated Directions",
        "otherPossibleNames": [],
        "logicalName": "REPEATED_DIRECTIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1639,
          "offsetEnd": 1639,
          "columnNum": 316
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1640,
          "offsetEnd": 1640,
          "columnNum": 317
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1641,
          "offsetEnd": 1641,
          "columnNum": 318
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1642,
          "offsetEnd": 1642,
          "columnNum": 319
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1643,
          "offsetEnd": 1643,
          "columnNum": 320
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "No accommodations",
        "otherPossibleNames": [],
        "logicalName": "NO_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1644,
          "offsetEnd": 1644,
          "columnNum": 321
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Braille**",
        "otherPossibleNames": [],
        "logicalName": "BRAILLE**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1645,
          "offsetEnd": 1645,
          "columnNum": 322
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1646,
          "offsetEnd": 1646,
          "columnNum": 323
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded**",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1647,
          "offsetEnd": 1647,
          "columnNum": 324
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time**",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1648,
          "offsetEnd": 1648,
          "columnNum": 325
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Sign Language Assistance**",
        "otherPossibleNames": [],
        "logicalName": "SIGN_LANGUAGE_ASSISTANCE**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1649,
          "offsetEnd": 1649,
          "columnNum": 326
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1650,
          "offsetEnd": 1650,
          "columnNum": 327
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1651,
          "offsetEnd": 1651,
          "columnNum": 328
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Repeated Directions**",
        "otherPossibleNames": [],
        "logicalName": "REPEATED_DIRECTIONS**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1652,
          "offsetEnd": 1652,
          "columnNum": 329
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1653,
          "offsetEnd": 1653,
          "columnNum": 330
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "TEST_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1654,
          "offsetEnd": 1654,
          "columnNum": 331
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1655,
          "offsetEnd": 1655,
          "columnNum": 332
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1656,
          "offsetEnd": 1656,
          "columnNum": 333
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1657,
          "offsetEnd": 1657,
          "columnNum": 334
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time**",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1658,
          "offsetEnd": 1658,
          "columnNum": 335
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1659,
          "offsetEnd": 1659,
          "columnNum": 336
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Repeated Directions**",
        "otherPossibleNames": [],
        "logicalName": "REPEATED_DIRECTIONS**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1660,
          "offsetEnd": 1660,
          "columnNum": 337
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language using Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_USING_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1661,
          "offsetEnd": 1661,
          "columnNum": 338
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered by ESL Teacher or Individual providing Language Services",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1662,
          "offsetEnd": 1662,
          "columnNum": 339
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1663,
          "offsetEnd": 1663,
          "columnNum": 340
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1664,
          "offsetEnd": 1664,
          "columnNum": 341
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1665,
          "offsetEnd": 1665,
          "columnNum": 342
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1666,
          "offsetEnd": 1666,
          "columnNum": 343
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1667,
          "offsetEnd": 1667,
          "columnNum": 344
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1668,
          "offsetEnd": 1668,
          "columnNum": 345
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1669,
          "offsetEnd": 1669,
          "columnNum": 346
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1670,
          "offsetEnd": 1670,
          "columnNum": 347
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
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
          "offsetStart": 1671,
          "offsetEnd": 1671,
          "columnNum": 348
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1672,
          "offsetEnd": 1672,
          "columnNum": 349
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1673,
          "offsetEnd": 1673,
          "columnNum": 350
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1674,
          "offsetEnd": 1674,
          "columnNum": 351
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
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
          "offsetStart": 1675,
          "offsetEnd": 1675,
          "columnNum": 352
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Absence Voiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCE_VOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1676,
          "offsetEnd": 1676,
          "columnNum": 353
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CV Reading Test Level",
        "otherPossibleNames": [],
        "logicalName": "CV_READING_TEST_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1677,
          "offsetEnd": 1678,
          "columnNum": 354
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CY Language Test Level",
        "otherPossibleNames": [],
        "logicalName": "CY_LANGUAGE_TEST_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1679,
          "offsetEnd": 1680,
          "columnNum": 355
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CY Math Test Level",
        "otherPossibleNames": [],
        "logicalName": "CY_MATH_TEST_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1681,
          "offsetEnd": 1682,
          "columnNum": 356
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CY Reading total (SS)",
        "otherPossibleNames": [],
        "logicalName": "CY_READING_TOTAL_(SS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1683,
          "offsetEnd": 1685,
          "columnNum": 357
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CY Language Total (SS)",
        "otherPossibleNames": [],
        "logicalName": "CY_LANGUAGE_TOTAL_(SS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1686,
          "offsetEnd": 1688,
          "columnNum": 358
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CV Math Total (SS)",
        "otherPossibleNames": [],
        "logicalName": "CV_MATH_TOTAL_(SS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1689,
          "offsetEnd": 1691,
          "columnNum": 359
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PY Reading Total (SS)",
        "otherPossibleNames": [],
        "logicalName": "PY_READING_TOTAL_(SS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1692,
          "offsetEnd": 1694,
          "columnNum": 360
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PY Language otal (SS)",
        "otherPossibleNames": [],
        "logicalName": "PY_LANGUAGE_OTAL_(SS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1695,
          "offsetEnd": 1697,
          "columnNum": 361
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PY Math Total (SS)",
        "otherPossibleNames": [],
        "logicalName": "PY_MATH_TOTAL_(SS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1698,
          "offsetEnd": 1700,
          "columnNum": 362
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Nonexempt Totals Count",
        "otherPossibleNames": [],
        "logicalName": "NONEXEMPT_TOTALS_COUNT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1701,
          "offsetEnd": 1701,
          "columnNum": 363
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Average Progress",
        "otherPossibleNames": [],
        "logicalName": "AVERAGE_PROGRESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1702,
          "offsetEnd": 1704,
          "columnNum": 364
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Growth Index",
        "otherPossibleNames": [],
        "logicalName": "GROWTH_INDEX",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1705,
          "offsetEnd": 1707,
          "columnNum": 365
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CY Match Indicator",
        "otherPossibleNames": [],
        "logicalName": "CY_MATCH_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1708,
          "offsetEnd": 1708,
          "columnNum": 366
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PY Match Indicator",
        "otherPossibleNames": [],
        "logicalName": "PY_MATCH_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1709,
          "offsetEnd": 1709,
          "columnNum": 367
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PY Source Indicator",
        "otherPossibleNames": [],
        "logicalName": "PY_SOURCE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1710,
          "offsetEnd": 1712,
          "columnNum": 368
        },
        "fieldLength": 3,
        "expectedValues": ["OOL", "OL"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CV RT Form Origin",
        "otherPossibleNames": [],
        "logicalName": "CV_RT_FORM_ORIGIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1713,
          "offsetEnd": 1713,
          "columnNum": 369
        },
        "fieldLength": 1,
        "expectedValues": ["P", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CV LT Form Origin",
        "otherPossibleNames": [],
        "logicalName": "CV_LT_FORM_ORIGIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1714,
          "offsetEnd": 1714,
          "columnNum": 370
        },
        "fieldLength": 1,
        "expectedValues": ["P", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CV MT Form Origin",
        "otherPossibleNames": [],
        "logicalName": "CV_MT_FORM_ORIGIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1715,
          "offsetEnd": 1715,
          "columnNum": 371
        },
        "fieldLength": 1,
        "expectedValues": ["P", "M"],
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
          "offsetStart": 1716,
          "offsetEnd": 1795,
          "columnNum": 372
        },
        "fieldLength": 80,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reserved",
        "otherPossibleNames": [],
        "logicalName": "RESERVED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1796,
          "offsetEnd": 1800,
          "columnNum": 373
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}