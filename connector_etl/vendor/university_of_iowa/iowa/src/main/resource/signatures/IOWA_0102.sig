{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "IOWA_0102",
    "quoteDelim": "\"",
    "fieldDelim": null,
    "hasHeader": true,
    "naturalKey": ["TEST_NAME", "STUDENT_ID_NUMBER", "DATE_TESTED"],
    "fields": [{
      "physicalName": "Order #",
      "otherPossibleNames": [],
      "logicalName": "ORDER_#",
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
        "physicalName": "Suborder #",
        "otherPossibleNames": [],
        "logicalName": "SUBORDER_#",
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
        "physicalName": "Norms",
        "otherPossibleNames": [],
        "logicalName": "NORMS",
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
        "physicalName": "4 Character Acronym",
        "otherPossibleNames": [],
        "logicalName": "4_CHARACTER_ACRONYM",
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
        "physicalName": "3-Digit Reference Number",
        "otherPossibleNames": [],
        "logicalName": "3-DIGIT_REFERENCE_NUMBER",
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
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Integrated Writing",
        "otherPossibleNames": [],
        "logicalName": "INTEGRATED_WRITING",
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
        "expectedValues": ["001", "002"],
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
        "physicalName": "Enrolled Grade",
        "otherPossibleNames": [],
        "logicalName": "ENROLLED_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 282,
          "offsetEnd": 284,
          "columnNum": 34
        },
        "fieldLength": 3,
        "expectedValues": ["001", "002", "003"],
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
        "physicalName": "Filler",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
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
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Bar Code Number",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_BAR_CODE_NUMBER",
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
        "physicalName": "A",
        "otherPossibleNames": [],
        "logicalName": "A",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 318,
          "offsetEnd": 319,
          "columnNum": 39
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "B",
        "otherPossibleNames": [],
        "logicalName": "B",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 320,
          "offsetEnd": 321,
          "columnNum": 40
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "C",
        "otherPossibleNames": [],
        "logicalName": "C",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 322,
          "offsetEnd": 323,
          "columnNum": 41
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "D",
        "otherPossibleNames": [],
        "logicalName": "D",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 324,
          "offsetEnd": 325,
          "columnNum": 42
        },
        "fieldLength": 2,
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
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
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
          "columnNum": 44
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "9"],
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
          "columnNum": 45
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Exclusion from all group averagesbased on test accommodations",
        "otherPossibleNames": [],
        "logicalName": "EXCLUSION_FROM_ALL_GROUP_AVERAGESBASED_ON_TEST_ACCOMMODATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 329,
          "offsetEnd": 329,
          "columnNum": 46
        },
        "fieldLength": 1,
        "expectedValues": ["9", ""],
        "dataTypes": "INTEGER",
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
          "columnNum": 47
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 48
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 49
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
          "offsetEnd": 344,
          "columnNum": 50
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Louisiana Generated ID (Gen ID)",
        "otherPossibleNames": [],
        "logicalName": "LOUISIANA_GENERATED_ID_(GEN_ID)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 345,
          "offsetEnd": 353,
          "columnNum": 51
        },
        "fieldLength": 9,
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
          "offsetStart": 354,
          "offsetEnd": 354,
          "columnNum": 52
        },
        "fieldLength": 1,
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
          "columnNum": 53
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
          "columnNum": 54
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
          "columnNum": 55
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
          "columnNum": 56
        },
        "fieldLength": 2,
        "expectedValues": ["03", "05", "06", "07", "08", "09", "OP"],
        "dataTypes": "STRING",
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
          "columnNum": 57
        },
        "fieldLength": 2,
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
          "offsetStart": 367,
          "offsetEnd": 367,
          "columnNum": 58
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": ["M", "L"],
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
          "columnNum": 60
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 372,
          "offsetEnd": 373,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 374,
          "offsetEnd": 375,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 376,
          "offsetEnd": 377,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 378,
          "offsetEnd": 379,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 380,
          "offsetEnd": 381,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 382,
          "offsetEnd": 383,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 384,
          "offsetEnd": 385,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 386,
          "offsetEnd": 387,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 388,
          "offsetEnd": 389,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 390,
          "offsetEnd": 391,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 392,
          "offsetEnd": 393,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 394,
          "offsetEnd": 395,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 396,
          "offsetEnd": 397,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 398,
          "offsetEnd": 399,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 400,
          "offsetEnd": 401,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 402,
          "offsetEnd": 403,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 404,
          "offsetEnd": 405,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 406,
          "offsetEnd": 407,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 408,
          "offsetEnd": 409,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 410,
          "offsetEnd": 411,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_ATTEMPTED_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 412,
          "offsetEnd": 413,
          "columnNum": 82
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
          "columnNum": 83
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
          "columnNum": 84
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
          "columnNum": 85
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
          "columnNum": 86
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 424,
          "offsetEnd": 425,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 426,
          "offsetEnd": 427,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 428,
          "offsetEnd": 429,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 430,
          "offsetEnd": 431,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 432,
          "offsetEnd": 433,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 434,
          "offsetEnd": 435,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 436,
          "offsetEnd": 437,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 438,
          "offsetEnd": 439,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 440,
          "offsetEnd": 441,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 442,
          "offsetEnd": 443,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 444,
          "offsetEnd": 445,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 446,
          "offsetEnd": 447,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 448,
          "offsetEnd": 449,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 450,
          "offsetEnd": 451,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 452,
          "offsetEnd": 453,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 454,
          "offsetEnd": 455,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 456,
          "offsetEnd": 457,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 458,
          "offsetEnd": 459,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 460,
          "offsetEnd": 461,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 462,
          "offsetEnd": 463,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 464,
          "offsetEnd": 465,
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
        "logicalName": "NUMBER_OF_TEST_ITEMS_CORRECT_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 466,
          "offsetEnd": 467,
          "columnNum": 109
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
          "columnNum": 110
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
          "columnNum": 111
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
          "columnNum": 112
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
          "columnNum": 113
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
          "columnNum": 114
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
        "logicalName": "GRADE_EQUIVALENT_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 481,
          "offsetEnd": 483,
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
        "logicalName": "GRADE_EQUIVALENT_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 484,
          "offsetEnd": 486,
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
        "logicalName": "GRADE_EQUIVALENT_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 487,
          "offsetEnd": 489,
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
        "logicalName": "GRADE_EQUIVALENT_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 490,
          "offsetEnd": 492,
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
        "logicalName": "GRADE_EQUIVALENT_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 493,
          "offsetEnd": 495,
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
        "logicalName": "GRADE_EQUIVALENT_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 496,
          "offsetEnd": 498,
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
        "logicalName": "GRADE_EQUIVALENT_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 499,
          "offsetEnd": 501,
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
        "logicalName": "GRADE_EQUIVALENT_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 502,
          "offsetEnd": 504,
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
        "logicalName": "GRADE_EQUIVALENT_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 505,
          "offsetEnd": 507,
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
        "logicalName": "GRADE_EQUIVALENT_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 508,
          "offsetEnd": 510,
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
        "logicalName": "GRADE_EQUIVALENT_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 511,
          "offsetEnd": 513,
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
        "logicalName": "GRADE_EQUIVALENT_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 514,
          "offsetEnd": 516,
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
        "logicalName": "GRADE_EQUIVALENT_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 517,
          "offsetEnd": 519,
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
        "logicalName": "GRADE_EQUIVALENT_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 520,
          "offsetEnd": 522,
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
        "logicalName": "GRADE_EQUIVALENT_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 523,
          "offsetEnd": 525,
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
        "logicalName": "GRADE_EQUIVALENT_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 526,
          "offsetEnd": 528,
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
        "logicalName": "GRADE_EQUIVALENT_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 529,
          "offsetEnd": 531,
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
        "logicalName": "GRADE_EQUIVALENT_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 532,
          "offsetEnd": 534,
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
        "logicalName": "GRADE_EQUIVALENT_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 535,
          "offsetEnd": 537,
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
        "logicalName": "GRADE_EQUIVALENT_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 538,
          "offsetEnd": 540,
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
        "logicalName": "GRADE_EQUIVALENT_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 541,
          "offsetEnd": 543,
          "columnNum": 136
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
          "columnNum": 137
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
          "columnNum": 138
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
          "columnNum": 139
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
          "columnNum": 140
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
        "logicalName": "STANDARD_SCORE_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 559,
          "offsetEnd": 561,
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
        "logicalName": "STANDARD_SCORE_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 562,
          "offsetEnd": 564,
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
        "logicalName": "STANDARD_SCORE_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 565,
          "offsetEnd": 567,
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
        "logicalName": "STANDARD_SCORE_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 568,
          "offsetEnd": 570,
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
        "logicalName": "STANDARD_SCORE_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 571,
          "offsetEnd": 573,
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
        "logicalName": "STANDARD_SCORE_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 574,
          "offsetEnd": 576,
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
        "logicalName": "STANDARD_SCORE_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 577,
          "offsetEnd": 579,
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
        "logicalName": "STANDARD_SCORE_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 580,
          "offsetEnd": 582,
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
        "logicalName": "STANDARD_SCORE_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 583,
          "offsetEnd": 585,
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
        "logicalName": "STANDARD_SCORE_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 586,
          "offsetEnd": 588,
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
        "logicalName": "STANDARD_SCORE_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 589,
          "offsetEnd": 591,
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
        "logicalName": "STANDARD_SCORE_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 592,
          "offsetEnd": 594,
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
        "logicalName": "STANDARD_SCORE_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 595,
          "offsetEnd": 597,
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
        "logicalName": "STANDARD_SCORE_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 598,
          "offsetEnd": 600,
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
        "logicalName": "STANDARD_SCORE_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 601,
          "offsetEnd": 603,
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
        "logicalName": "STANDARD_SCORE_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 604,
          "offsetEnd": 606,
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
        "logicalName": "STANDARD_SCORE_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 607,
          "offsetEnd": 609,
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
        "logicalName": "STANDARD_SCORE_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 610,
          "offsetEnd": 612,
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
        "logicalName": "STANDARD_SCORE_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 613,
          "offsetEnd": 615,
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
        "logicalName": "STANDARD_SCORE_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 616,
          "offsetEnd": 618,
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
        "logicalName": "STANDARD_SCORE_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 619,
          "offsetEnd": 621,
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
        "logicalName": "STANDARD_SCORE_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 622,
          "offsetEnd": 624,
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
        "logicalName": "STANDARD_SCORE_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 625,
          "offsetEnd": 627,
          "columnNum": 164
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
          "columnNum": 165
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
          "columnNum": 166
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
          "columnNum": 167
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
          "columnNum": 168
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 640,
          "offsetEnd": 641,
          "columnNum": 169
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 642,
          "offsetEnd": 643,
          "columnNum": 170
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 644,
          "offsetEnd": 645,
          "columnNum": 171
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 646,
          "offsetEnd": 647,
          "columnNum": 172
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 648,
          "offsetEnd": 649,
          "columnNum": 173
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 650,
          "offsetEnd": 651,
          "columnNum": 174
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 652,
          "offsetEnd": 653,
          "columnNum": 175
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 654,
          "offsetEnd": 655,
          "columnNum": 176
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 656,
          "offsetEnd": 657,
          "columnNum": 177
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 658,
          "offsetEnd": 659,
          "columnNum": 178
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 660,
          "offsetEnd": 661,
          "columnNum": 179
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 662,
          "offsetEnd": 663,
          "columnNum": 180
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 664,
          "offsetEnd": 665,
          "columnNum": 181
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 666,
          "offsetEnd": 667,
          "columnNum": 182
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 668,
          "offsetEnd": 669,
          "columnNum": 183
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 670,
          "offsetEnd": 671,
          "columnNum": 184
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 672,
          "offsetEnd": 673,
          "columnNum": 185
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 674,
          "offsetEnd": 675,
          "columnNum": 186
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 676,
          "offsetEnd": 677,
          "columnNum": 187
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 678,
          "offsetEnd": 679,
          "columnNum": 188
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 680,
          "offsetEnd": 681,
          "columnNum": 189
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 682,
          "offsetEnd": 683,
          "columnNum": 190
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 684,
          "offsetEnd": 685,
          "columnNum": 191
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 686,
          "offsetEnd": 687,
          "columnNum": 192
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 688,
          "offsetEnd": 689,
          "columnNum": 193
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 690,
          "offsetEnd": 691,
          "columnNum": 194
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National PR Ranks",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_PR_RANKS_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 692,
          "offsetEnd": 693,
          "columnNum": 195
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_01",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 694,
          "offsetEnd": 694,
          "columnNum": 196
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 695,
          "offsetEnd": 695,
          "columnNum": 197
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 696,
          "offsetEnd": 696,
          "columnNum": 198
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 697,
          "offsetEnd": 697,
          "columnNum": 199
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 698,
          "offsetEnd": 698,
          "columnNum": 200
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 699,
          "offsetEnd": 699,
          "columnNum": 201
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 700,
          "offsetEnd": 700,
          "columnNum": 202
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 701,
          "columnNum": 203
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 702,
          "offsetEnd": 702,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 703,
          "offsetEnd": 703,
          "columnNum": 205
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 704,
          "offsetEnd": 704,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 705,
          "offsetEnd": 705,
          "columnNum": 207
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 706,
          "offsetEnd": 706,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 707,
          "offsetEnd": 707,
          "columnNum": 209
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 708,
          "offsetEnd": 708,
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 709,
          "offsetEnd": 709,
          "columnNum": 211
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 710,
          "offsetEnd": 710,
          "columnNum": 212
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 711,
          "offsetEnd": 711,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 712,
          "offsetEnd": 712,
          "columnNum": 214
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 713,
          "offsetEnd": 713,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 714,
          "offsetEnd": 714,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 715,
          "offsetEnd": 715,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 716,
          "offsetEnd": 716,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 717,
          "offsetEnd": 717,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 718,
          "offsetEnd": 718,
          "columnNum": 220
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 719,
          "offsetEnd": 719,
          "columnNum": 221
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "National Stanine",
        "otherPossibleNames": [],
        "logicalName": "NATIONAL_STANINE_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 720,
          "offsetEnd": 720,
          "columnNum": 222
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
        "logicalName": "EXTRA_PR_1_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 723,
          "offsetEnd": 724,
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
        "logicalName": "EXTRA_PR_1_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 725,
          "offsetEnd": 726,
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
        "logicalName": "EXTRA_PR_1_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 727,
          "offsetEnd": 728,
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
        "logicalName": "EXTRA_PR_1_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 729,
          "offsetEnd": 730,
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
        "logicalName": "EXTRA_PR_1_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 731,
          "offsetEnd": 732,
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
        "logicalName": "EXTRA_PR_1_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 733,
          "offsetEnd": 734,
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
        "logicalName": "EXTRA_PR_1_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 735,
          "offsetEnd": 736,
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
        "logicalName": "EXTRA_PR_1_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 737,
          "offsetEnd": 738,
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
        "logicalName": "EXTRA_PR_1_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 739,
          "offsetEnd": 740,
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
        "logicalName": "EXTRA_PR_1_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 741,
          "offsetEnd": 742,
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
        "logicalName": "EXTRA_PR_1_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 743,
          "offsetEnd": 744,
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
        "logicalName": "EXTRA_PR_1_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 745,
          "offsetEnd": 746,
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
        "logicalName": "EXTRA_PR_1_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 747,
          "offsetEnd": 748,
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
        "logicalName": "EXTRA_PR_1_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 749,
          "offsetEnd": 750,
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
        "logicalName": "EXTRA_PR_1_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 751,
          "offsetEnd": 752,
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
        "logicalName": "EXTRA_PR_1_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 753,
          "offsetEnd": 754,
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
        "logicalName": "EXTRA_PR_1_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 755,
          "offsetEnd": 756,
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
        "logicalName": "EXTRA_PR_1_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 757,
          "offsetEnd": 758,
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
        "logicalName": "EXTRA_PR_1_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 759,
          "offsetEnd": 760,
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
        "logicalName": "EXTRA_PR_1_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 761,
          "offsetEnd": 762,
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
        "logicalName": "EXTRA_PR_1_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 763,
          "offsetEnd": 764,
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
        "logicalName": "EXTRA_PR_1_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 765,
          "offsetEnd": 766,
          "columnNum": 245
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
          "columnNum": 246
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
          "columnNum": 247
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
          "columnNum": 248
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
          "columnNum": 249
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
        "logicalName": "EXTRA_STANINE_1_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 776,
          "offsetEnd": 776,
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
        "logicalName": "EXTRA_STANINE_1_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 777,
          "offsetEnd": 777,
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
        "logicalName": "EXTRA_STANINE_1_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 778,
          "offsetEnd": 778,
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
        "logicalName": "EXTRA_STANINE_1_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 779,
          "offsetEnd": 779,
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
        "logicalName": "EXTRA_STANINE_1_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 780,
          "offsetEnd": 780,
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
        "logicalName": "EXTRA_STANINE_1_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 781,
          "offsetEnd": 781,
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
        "logicalName": "EXTRA_STANINE_1_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 782,
          "offsetEnd": 782,
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
        "logicalName": "EXTRA_STANINE_1_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 783,
          "offsetEnd": 783,
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
        "logicalName": "EXTRA_STANINE_1_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 784,
          "offsetEnd": 784,
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
        "logicalName": "EXTRA_STANINE_1_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 785,
          "offsetEnd": 785,
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
        "logicalName": "EXTRA_STANINE_1_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 786,
          "offsetEnd": 786,
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
        "logicalName": "EXTRA_STANINE_1_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 787,
          "offsetEnd": 787,
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
        "logicalName": "EXTRA_STANINE_1_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 788,
          "offsetEnd": 788,
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
        "logicalName": "EXTRA_STANINE_1_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 789,
          "offsetEnd": 789,
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
        "logicalName": "EXTRA_STANINE_1_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 790,
          "offsetEnd": 790,
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
        "logicalName": "EXTRA_STANINE_1_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 791,
          "offsetEnd": 791,
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
        "logicalName": "EXTRA_STANINE_1_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 792,
          "offsetEnd": 792,
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
        "logicalName": "EXTRA_STANINE_1_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 793,
          "offsetEnd": 793,
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
        "logicalName": "EXTRA_STANINE_1_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 794,
          "offsetEnd": 794,
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
        "logicalName": "EXTRA_STANINE_1_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 795,
          "offsetEnd": 795,
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
        "logicalName": "EXTRA_STANINE_1_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 796,
          "offsetEnd": 796,
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
        "logicalName": "EXTRA_STANINE_1_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 797,
          "offsetEnd": 797,
          "columnNum": 272
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
          "columnNum": 273
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
          "columnNum": 274
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
          "columnNum": 275
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
          "columnNum": 276
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
          "columnNum": 277
        },
        "fieldLength": 80,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_02",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 885,
          "offsetEnd": 886,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_03",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 887,
          "offsetEnd": 888,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_04",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 889,
          "offsetEnd": 890,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_05",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 891,
          "offsetEnd": 892,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_06",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 893,
          "offsetEnd": 894,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_07",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 895,
          "offsetEnd": 896,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_08",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 897,
          "offsetEnd": 898,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_09",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 899,
          "offsetEnd": 900,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 901,
          "offsetEnd": 902,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 903,
          "offsetEnd": 904,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 905,
          "offsetEnd": 906,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 907,
          "offsetEnd": 908,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 909,
          "offsetEnd": 910,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 911,
          "offsetEnd": 912,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 913,
          "offsetEnd": 914,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 915,
          "offsetEnd": 916,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 917,
          "offsetEnd": 918,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 919,
          "offsetEnd": 920,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 921,
          "offsetEnd": 922,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 923,
          "offsetEnd": 924,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 925,
          "offsetEnd": 926,
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
        "logicalName": "NORMAL_CURVE_EQUIVALENT_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 927,
          "offsetEnd": 928,
          "columnNum": 300
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
          "columnNum": 301
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
          "columnNum": 302
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
          "columnNum": 303
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
          "columnNum": 304
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Item Responses",
        "otherPossibleNames": [],
        "logicalName": "ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 937,
          "offsetEnd": 1486,
          "columnNum": 305
        },
        "fieldLength": 550,
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
          "offsetStart": 1487,
          "offsetEnd": 1548,
          "columnNum": 306
        },
        "fieldLength": 62,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Questionnaire Item Responses",
        "otherPossibleNames": [],
        "logicalName": "QUESTIONNAIRE_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1549,
          "offsetEnd": 1592,
          "columnNum": 307
        },
        "fieldLength": 44,
        "expectedValues": ["1", "2", "3", "4", "5", "6", "7", "8", "0", "9"],
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
          "offsetStart": 1593,
          "offsetEnd": 1600,
          "columnNum": 308
        },
        "fieldLength": 8,
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
          "columnNum": 309
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
          "offsetEnd": 1607,
          "columnNum": 310
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student’s Current Math Teacher",
        "otherPossibleNames": [],
        "logicalName": "STUDENT’S_CURRENT_MATH_TEACHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1608,
          "offsetEnd": 1612,
          "columnNum": 311
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
          "offsetStart": 1613,
          "offsetEnd": 1613,
          "columnNum": 312
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student’s Current Science Teacher",
        "otherPossibleNames": [],
        "logicalName": "STUDENT’S_CURRENT_SCIENCE_TEACHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1614,
          "offsetEnd": 1618,
          "columnNum": 313
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
          "offsetStart": 1619,
          "offsetEnd": 1619,
          "columnNum": 314
        },
        "fieldLength": 1,
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
          "columnNum": 315
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
          "columnNum": 316
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Special Education Classification",
        "otherPossibleNames": [],
        "logicalName": "SPECIAL_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1629,
          "offsetEnd": 1629,
          "columnNum": 317
        },
        "fieldLength": 1,
        "expectedValues": ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R"],
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
          "offsetStart": 1630,
          "offsetEnd": 1630,
          "columnNum": 318
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
          "columnNum": 319
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
          "columnNum": 320
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
          "columnNum": 321
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
          "columnNum": 322
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
          "columnNum": 323
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
          "columnNum": 324
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
          "columnNum": 325
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1638,
          "offsetEnd": 1638,
          "columnNum": 326
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
          "offsetStart": 1639,
          "offsetEnd": 1639,
          "columnNum": 327
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Tests Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "ITBS_TESTS_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1640,
          "offsetEnd": 1640,
          "columnNum": 328
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITED tests SS or SC Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "ITED_TESTS_SS_OR_SC_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1641,
          "offsetEnd": 1641,
          "columnNum": 329
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
          "columnNum": 330
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
          "columnNum": 331
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
          "offsetStart": 1644,
          "offsetEnd": 1644,
          "columnNum": 332
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
          "columnNum": 333
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
          "columnNum": 334
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
          "columnNum": 335
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
          "columnNum": 336
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
          "offsetStart": 1649,
          "offsetEnd": 1649,
          "columnNum": 337
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
          "columnNum": 338
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1651,
          "offsetEnd": 1651,
          "columnNum": 339
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
          "offsetStart": 1652,
          "offsetEnd": 1652,
          "columnNum": 340
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Tests Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "ITBS_TESTS_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1653,
          "offsetEnd": 1653,
          "columnNum": 341
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITED tests SS or SC Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "ITED_TESTS_SS_OR_SC_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1654,
          "offsetEnd": 1654,
          "columnNum": 342
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
          "columnNum": 343
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
          "columnNum": 344
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
          "columnNum": 345
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
          "columnNum": 346
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Admin",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1659,
          "offsetEnd": 1659,
          "columnNum": 347
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
          "offsetStart": 1660,
          "offsetEnd": 1660,
          "columnNum": 348
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)**",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1661,
          "offsetEnd": 1661,
          "columnNum": 349
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
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
          "offsetStart": 1662,
          "offsetEnd": 1662,
          "columnNum": 350
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1663,
          "offsetEnd": 1663,
          "columnNum": 351
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1664,
          "offsetEnd": 1664,
          "columnNum": 352
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1665,
          "offsetEnd": 1665,
          "columnNum": 353
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1666,
          "offsetEnd": 1666,
          "columnNum": 354
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1667,
          "offsetEnd": 1667,
          "columnNum": 355
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1668,
          "offsetEnd": 1668,
          "columnNum": 356
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1669,
          "offsetEnd": 1669,
          "columnNum": 357
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1670,
          "offsetEnd": 1670,
          "columnNum": 358
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1671,
          "offsetEnd": 1671,
          "columnNum": 359
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1672,
          "offsetEnd": 1672,
          "columnNum": 360
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1673,
          "offsetEnd": 1673,
          "columnNum": 361
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1674,
          "offsetEnd": 1674,
          "columnNum": 362
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1675,
          "offsetEnd": 1675,
          "columnNum": 363
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1676,
          "offsetEnd": 1676,
          "columnNum": 364
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1677,
          "offsetEnd": 1677,
          "columnNum": 365
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1678,
          "offsetEnd": 1678,
          "columnNum": 366
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1679,
          "offsetEnd": 1679,
          "columnNum": 367
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1680,
          "offsetEnd": 1680,
          "columnNum": 368
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AbsenceVoiding",
        "otherPossibleNames": [],
        "logicalName": "ABSENCEVOIDING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1681,
          "offsetEnd": 1681,
          "columnNum": 369
        },
        "fieldLength": 1,
        "expectedValues": ["A", "V", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading/Vocabulary Voided",
        "otherPossibleNames": [],
        "logicalName": "READING/VOCABULARY_VOIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1682,
          "offsetEnd": 1682,
          "columnNum": 370
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Language Erasure Analysis Voided",
        "otherPossibleNames": [],
        "logicalName": "LANGUAGE_ERASURE_ANALYSIS_VOIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1683,
          "offsetEnd": 1683,
          "columnNum": 371
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Math Erasure Analysis Voided",
        "otherPossibleNames": [],
        "logicalName": "MATH_ERASURE_ANALYSIS_VOIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1684,
          "offsetEnd": 1684,
          "columnNum": 372
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Social Studies Erasure Analysis Voided",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_ERASURE_ANALYSIS_VOIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1685,
          "offsetEnd": 1685,
          "columnNum": 373
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Science Erasure Analysis Voided",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_ERASURE_ANALYSIS_VOIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1686,
          "offsetEnd": 1686,
          "columnNum": 374
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Source of Info Erasure Analysis Voided",
        "otherPossibleNames": [],
        "logicalName": "SOURCE_OF_INFO_ERASURE_ANALYSIS_VOIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1687,
          "offsetEnd": 1687,
          "columnNum": 375
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Math Comp/Literary Materials Erasure Analysis Voided",
        "otherPossibleNames": [],
        "logicalName": "MATH_COMP/LITERARY_MATERIALS_ERASURE_ANALYSIS_VOIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1688,
          "offsetEnd": 1688,
          "columnNum": 376
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Additional LEP Accommodation ITBS Tests Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_LEP_ACCOMMODATION_ITBS_TESTS_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1689,
          "offsetEnd": 1689,
          "columnNum": 377
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Additional LEP Accommodation ITED Tests SS or SC Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_LEP_ACCOMMODATION_ITED_TESTS_SS_OR_SC_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1690,
          "offsetEnd": 1690,
          "columnNum": 378
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
          "offsetStart": 1691,
          "offsetEnd": 1795,
          "columnNum": 379
        },
        "fieldLength": 105,
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
          "columnNum": 380
        },
        "fieldLength": 5,
        "expectedValues": [],
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
          "offsetStart": 1801,
          "offsetEnd": 1820,
          "columnNum": 381
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
          "offsetStart": 1821,
          "offsetEnd": 1835,
          "columnNum": 382
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEA Code/School Code",
        "otherPossibleNames": [],
        "logicalName": "LEA_CODE/SCHOOL_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1836,
          "offsetEnd": 1841,
          "columnNum": 383
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
          "offsetStart": 1842,
          "offsetEnd": 1844,
          "columnNum": 384
        },
        "fieldLength": 3,
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
          "offsetStart": 1845,
          "offsetEnd": 1852,
          "columnNum": 385
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "State ID Number",
        "otherPossibleNames": [],
        "logicalName": "STATE_ID_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1853,
          "offsetEnd": 1861,
          "columnNum": 386
        },
        "fieldLength": 9,
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
          "offsetStart": 1862,
          "offsetEnd": 1862,
          "columnNum": 387
        },
        "fieldLength": 1,
        "expectedValues": ["F", "M"],
        "dataTypes": "STRING",
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
          "offsetStart": 1863,
          "offsetEnd": 1863,
          "columnNum": 388
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Title 1 Reading 1",
        "otherPossibleNames": [],
        "logicalName": "TITLE_1_READING_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1864,
          "offsetEnd": 1864,
          "columnNum": 389
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Title 1 Math",
        "otherPossibleNames": [],
        "logicalName": "TITLE_1_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1865,
          "offsetEnd": 1865,
          "columnNum": 390
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
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
          "offsetStart": 1866,
          "offsetEnd": 1866,
          "columnNum": 391
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "9"],
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
          "offsetStart": 1867,
          "offsetEnd": 1867,
          "columnNum": 392
        },
        "fieldLength": 2,
        "expectedValues": ["1", "2"],
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
          "offsetStart": 1868,
          "offsetEnd": 1869,
          "columnNum": 393
        },
        "fieldLength": 2,
        "expectedValues": ["03", "05", "06", "07", "08", "09", "OP"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LDE-Generated ID",
        "otherPossibleNames": [],
        "logicalName": "LDE-GENERATED_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1870,
          "offsetEnd": 1878,
          "columnNum": 394
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NCS barcode number",
        "otherPossibleNames": [],
        "logicalName": "NCS_BARCODE_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1879,
          "offsetEnd": 1887,
          "columnNum": 395
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LEA name",
        "otherPossibleNames": [],
        "logicalName": "LEA_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1888,
          "offsetEnd": 1912,
          "columnNum": 396
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School/Site Name",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL/SITE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1913,
          "offsetEnd": 1958,
          "columnNum": 397
        },
        "fieldLength": 46,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Form Origin",
        "otherPossibleNames": [],
        "logicalName": "FORM_ORIGIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1959,
          "offsetEnd": 1959,
          "columnNum": 398
        },
        "fieldLength": 1,
        "expectedValues": ["P", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LaSip Math Teacher",
        "otherPossibleNames": [],
        "logicalName": "LASIP_MATH_TEACHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1960,
          "offsetEnd": 1964,
          "columnNum": 399
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LaSip Science Teacher",
        "otherPossibleNames": [],
        "logicalName": "LASIP_SCIENCE_TEACHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1965,
          "offsetEnd": 1969,
          "columnNum": 400
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 1970,
          "offsetEnd": 1971,
          "columnNum": 401
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Alternate School/Site Code",
        "otherPossibleNames": [],
        "logicalName": "ALTERNATE_SCHOOL/SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1972,
          "offsetEnd": 1977,
          "columnNum": 402
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Exclude Field",
        "otherPossibleNames": [],
        "logicalName": "EXCLUDE_FIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1978,
          "offsetEnd": 1978,
          "columnNum": 403
        },
        "fieldLength": 1,
        "expectedValues": ["9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Special Education Indicator",
        "otherPossibleNames": [],
        "logicalName": "SPECIAL_EDUCATION_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1979,
          "offsetEnd": 1979,
          "columnNum": 404
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Special Education Classification",
        "otherPossibleNames": [],
        "logicalName": "SPECIAL_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1980,
          "offsetEnd": 1980,
          "columnNum": 405
        },
        "fieldLength": 1,
        "expectedValues": ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R"],
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
          "offsetStart": 1981,
          "offsetEnd": 1981,
          "columnNum": 406
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
          "offsetStart": 1982,
          "offsetEnd": 1982,
          "columnNum": 407
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
          "offsetStart": 1983,
          "offsetEnd": 1983,
          "columnNum": 408
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
          "offsetStart": 1984,
          "offsetEnd": 1984,
          "columnNum": 409
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Assistive Technology**",
        "otherPossibleNames": [],
        "logicalName": "ASSISTIVE_TECHNOLOGY**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1985,
          "offsetEnd": 1985,
          "columnNum": 410
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
          "offsetStart": 1986,
          "offsetEnd": 1986,
          "columnNum": 411
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
          "offsetStart": 1987,
          "offsetEnd": 1987,
          "columnNum": 412
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
          "offsetStart": 1988,
          "offsetEnd": 1988,
          "columnNum": 413
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1989,
          "offsetEnd": 1989,
          "columnNum": 414
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
          "offsetStart": 1990,
          "offsetEnd": 1990,
          "columnNum": 415
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "For 2001, this will have the same value as field 1640",
        "otherPossibleNames": [],
        "logicalName": "FOR_2001,_THIS_WILL_HAVE_THE_SAME_VALUE_AS_FIELD_1640",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1991,
          "offsetEnd": 1991,
          "columnNum": 416
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
          "offsetStart": 1992,
          "offsetEnd": 1992,
          "columnNum": 417
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Section 504 Indicator",
        "otherPossibleNames": [],
        "logicalName": "SECTION_504_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1993,
          "offsetEnd": 1993,
          "columnNum": 418
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 1994,
          "offsetEnd": 1994,
          "columnNum": 419
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
          "offsetStart": 1995,
          "offsetEnd": 1995,
          "columnNum": 420
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
          "offsetStart": 1996,
          "offsetEnd": 1996,
          "columnNum": 421
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
          "offsetStart": 1997,
          "offsetEnd": 1997,
          "columnNum": 422
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Assistive Technology**",
        "otherPossibleNames": [],
        "logicalName": "ASSISTIVE_TECHNOLOGY**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1998,
          "offsetEnd": 1998,
          "columnNum": 423
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
          "offsetStart": 1999,
          "offsetEnd": 1999,
          "columnNum": 424
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
          "offsetStart": 2000,
          "offsetEnd": 2000,
          "columnNum": 425
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Transferred Answers**",
        "otherPossibleNames": [],
        "logicalName": "TRANSFERRED_ANSWERS**",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2001,
          "offsetEnd": 2001,
          "columnNum": 426
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2002,
          "offsetEnd": 2002,
          "columnNum": 427
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
          "offsetStart": 2003,
          "offsetEnd": 2003,
          "columnNum": 428
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "For 2001, this will have the same value as field 1653",
        "otherPossibleNames": [],
        "logicalName": "FOR_2001,_THIS_WILL_HAVE_THE_SAME_VALUE_AS_FIELD_1653",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2004,
          "offsetEnd": 2004,
          "columnNum": 429
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
          "offsetStart": 2005,
          "offsetEnd": 2005,
          "columnNum": 430
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP Indicator",
        "otherPossibleNames": [],
        "logicalName": "LEP_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2006,
          "offsetEnd": 2006,
          "columnNum": 431
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 2007,
          "offsetEnd": 2007,
          "columnNum": 432
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
          "offsetStart": 2008,
          "offsetEnd": 2008,
          "columnNum": 433
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual/Small Group Admin",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL/SMALL_GROUP_ADMIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2009,
          "offsetEnd": 2009,
          "columnNum": 434
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
          "offsetStart": 2010,
          "offsetEnd": 2010,
          "columnNum": 435
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2011,
          "offsetEnd": 2011,
          "columnNum": 436
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered by ESL Teacher or Individual Providing Language Services For 2001 on",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER_OR_INDIVIDUAL_PROVIDING_LANGUAGE_SERVICES_FOR_2001_ON",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2012,
          "offsetEnd": 2012,
          "columnNum": 437
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Vocabulary(SS) ITED Test V (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_VOCABULARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2013,
          "offsetEnd": 2015,
          "columnNum": 438
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Reading Comprehension (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_READING_COMPREHENSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2016,
          "offsetEnd": 2018,
          "columnNum": 439
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Reading Total (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_READING_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2019,
          "offsetEnd": 2021,
          "columnNum": 440
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Spelling (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_SPELLING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2022,
          "offsetEnd": 2024,
          "columnNum": 441
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Capitalization (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_CAPITALIZATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2025,
          "offsetEnd": 2027,
          "columnNum": 442
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Punctuation (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_PUNCTUATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2028,
          "offsetEnd": 2030,
          "columnNum": 443
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Usage and Expression (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_USAGE_AND_EXPRESSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2031,
          "offsetEnd": 2033,
          "columnNum": 444
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS LanguageTotal (SS)",
        "otherPossibleNames": [],
        "logicalName": "ITBS_LANGUAGETOTAL_(SS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2034,
          "offsetEnd": 2036,
          "columnNum": 445
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Int Writing Adv Skills (SS) ITED Expression Adv Skills (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_ITBS_INT_WRITING_ADV_SKILLS_ITED_EXPRESSION_ADV_SKILLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2037,
          "offsetEnd": 2039,
          "columnNum": 446
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Int Writing Totals (SS) ITED Test E (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_ITBS_WRITING_TOTAL_ITED_TEST_E",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2040,
          "offsetEnd": 2042,
          "columnNum": 447
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Concepts & Est (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_MATH_CONCEPTS_&_EST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2043,
          "offsetEnd": 2045,
          "columnNum": 448
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Probs/Data Interp (SS)ITED Quant Thinking Skills (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_ITBS_MATH_PROB_DATA_INT_ITED_QUANT_THINKING_SKILLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2046,
          "offsetEnd": 2048,
          "columnNum": 449
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Total (SS) ITED Test Q (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_ITBS_MATH_TOTAL_ITED_TEST_Q",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2049,
          "offsetEnd": 2051,
          "columnNum": 450
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Core Battery (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_CORE_BATTERY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2052,
          "offsetEnd": 2054,
          "columnNum": 451
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Social Studies (SS) ITED Test SS (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_ITBS_SOCIAL_STUDIES_ITED_TEST_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2055,
          "offsetEnd": 2057,
          "columnNum": 452
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Science (SS) ITED Test SC (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_ITBS_SCIENCE_ITED_TEST_SC_GRD_OP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2058,
          "offsetEnd": 2060,
          "columnNum": 453
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Maps and Diagrams (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_MAPS_AND_DIAGRAMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2061,
          "offsetEnd": 2063,
          "columnNum": 454
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Reference Materials (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_REFERENCE_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2064,
          "offsetEnd": 2066,
          "columnNum": 455
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Sources of Info Total (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_SOURCES_OF_INFO_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2067,
          "offsetEnd": 2069,
          "columnNum": 456
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Composite (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_COMPOSITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2070,
          "offsetEnd": 2072,
          "columnNum": 457
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Computation (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_MATH_COMPUTATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2073,
          "offsetEnd": 2075,
          "columnNum": 458
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Vocabulary (Index) ITED Test V (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_VOCABULARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2076,
          "offsetEnd": 2081,
          "columnNum": 459
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Reading Comprehension (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_READING_COMPREHENSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2082,
          "offsetEnd": 2087,
          "columnNum": 460
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Reading Total (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_READING_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2088,
          "offsetEnd": 2093,
          "columnNum": 461
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spelling (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SPELLING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2094,
          "offsetEnd": 2099,
          "columnNum": 462
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Capitalization (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_CAPITALIZATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2100,
          "offsetEnd": 2105,
          "columnNum": 463
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Punctuation (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_PUNCTUATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2106,
          "offsetEnd": 2111,
          "columnNum": 464
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Usage and Expression (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_USAGE_AND_EXPRESSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2112,
          "offsetEnd": 2117,
          "columnNum": 465
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Language Total (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_LANGUAGE_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2118,
          "offsetEnd": 2123,
          "columnNum": 466
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Int Writing Adv Skills (Index)ITED Express Adv Skills (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_ITBS_INT_WRITING_ADV_SKILLS_ITED_EXPRESSION_ADV_SKILLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2124,
          "offsetEnd": 2129,
          "columnNum": 467
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Int Writing Totals (Index) ITED Test E (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_ITBS_WRITING_TOTAL_ITED_TEST_E",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2130,
          "offsetEnd": 2135,
          "columnNum": 468
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Concpts & Est (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_MATH_CONCEPTS_&_EST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2136,
          "offsetEnd": 2141,
          "columnNum": 469
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Probs/Data Int (Index) ITED Quant Think Skills (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_ITBS_MATH_PROB_DATA_INT_ITED_QUANT_THINKING_SKILLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2142,
          "offsetEnd": 2147,
          "columnNum": 470
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Total (Index) ITED Test Q (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_ITBS_MATH_TOTAL_ITED_TEST_Q",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2148,
          "offsetEnd": 2153,
          "columnNum": 471
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Core Battery (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_CORE_BATTERY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2154,
          "offsetEnd": 2159,
          "columnNum": 472
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Social Studies (Index) ITED Test SS (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_ITBS_SOCIAL_STUDIES_ITED_TEST_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2160,
          "offsetEnd": 2165,
          "columnNum": 473
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Science (SS) ITED Test SC (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_ITBS_SCIENCE_ITED_TEST_SC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2166,
          "offsetEnd": 2171,
          "columnNum": 474
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Maps and Diagrams (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_MAPS_AND_DIAGRAMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2172,
          "offsetEnd": 2177,
          "columnNum": 475
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Reference Materials (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_REFERENCE_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2178,
          "offsetEnd": 2183,
          "columnNum": 476
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Sources of Info Total (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_SOURCES_OF_INFO_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2184,
          "offsetEnd": 2189,
          "columnNum": 477
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Composite (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_COMPOSITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2190,
          "offsetEnd": 2195,
          "columnNum": 478
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Computation (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_MATH_COMPUTATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2196,
          "offsetEnd": 2201,
          "columnNum": 479
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Vocabulary(NPR) ITED Test V (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_VOCABULARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2202,
          "offsetEnd": 2203,
          "columnNum": 480
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Reading Comprehension (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_READING_COMPREHENSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2204,
          "offsetEnd": 2205,
          "columnNum": 481
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Reading Total (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_READING_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2206,
          "offsetEnd": 2207,
          "columnNum": 482
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spelling (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_SPELLING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2208,
          "offsetEnd": 2209,
          "columnNum": 483
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Capitalization (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_CAPITALIZATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2210,
          "offsetEnd": 2211,
          "columnNum": 484
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Punctuation (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_PUNCTUATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2212,
          "offsetEnd": 2213,
          "columnNum": 485
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Usage and Expression (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_USAGE_AND_EXPRESSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2214,
          "offsetEnd": 2215,
          "columnNum": 486
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Language Total (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_LANGUAGE_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2216,
          "offsetEnd": 2217,
          "columnNum": 487
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Int Writing Adv Skills (NPR))ITED Express Adv Skills (NPR))",
        "otherPossibleNames": [],
        "logicalName": "NPR_ITBS_INT_WRITING_ADV_SKILLS_ITED_EXPRESSION_ADV_SKILLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2218,
          "offsetEnd": 2219,
          "columnNum": 488
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Int Writing Totals (NPR)) ITED Test E (NPR))",
        "otherPossibleNames": [],
        "logicalName": "NPR_ITBS_WRITING_TOTAL_ITED_TEST_E",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2220,
          "offsetEnd": 2221,
          "columnNum": 489
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Concpts & Est (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_MATH_CONCEPTS_&_EST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2222,
          "offsetEnd": 2223,
          "columnNum": 490
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Probs/Data Int (NPR) ITED Quant Think Skills (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_ITBS_MATH_PROB_DATA_INT_ITED_QUANT_THINKING_SKILLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2224,
          "offsetEnd": 2225,
          "columnNum": 491
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Total (NPR) ITED Test Q (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_ITBS_MATH_TOTAL_ITED_TEST_Q",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2226,
          "offsetEnd": 2227,
          "columnNum": 492
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Core Battery (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_CORE_BATTERY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2228,
          "offsetEnd": 2229,
          "columnNum": 493
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Social Studies (NPR) ITED Test SS (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_ITBS_SOCIAL_STUDIES_ITED_TEST_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2230,
          "offsetEnd": 2231,
          "columnNum": 494
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Science (NPR) ITED Test SC (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_ITBS_SCIENCE_ITED_TEST_SC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2232,
          "offsetEnd": 2233,
          "columnNum": 495
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Maps and Diagrams (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_MAPS_AND_DIAGRAMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2234,
          "offsetEnd": 2235,
          "columnNum": 496
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Reference Materials (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_REFERENCE_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2236,
          "offsetEnd": 2237,
          "columnNum": 497
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Sources of Info Total (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_SOURCES_OF_INFO_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2238,
          "offsetEnd": 2239,
          "columnNum": 498
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Composite (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_COMPOSITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2240,
          "offsetEnd": 2241,
          "columnNum": 499
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Computation (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_MATH_COMPUTATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2242,
          "offsetEnd": 2243,
          "columnNum": 500
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Vocabulary(Sta9) ITED Test V (NPR)",
        "otherPossibleNames": [],
        "logicalName": "STA9_VOCABULARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2244,
          "offsetEnd": 2244,
          "columnNum": 501
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Reading Comprehension (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_READING_COMPREHENSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2245,
          "offsetEnd": 2245,
          "columnNum": 502
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Reading Total (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_READING_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2246,
          "offsetEnd": 2246,
          "columnNum": 503
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spelling (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_SPELLING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2247,
          "offsetEnd": 2247,
          "columnNum": 504
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Capitalization (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_CAPITALIZATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2248,
          "offsetEnd": 2248,
          "columnNum": 505
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Punctuation (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_PUNCTUATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2249,
          "offsetEnd": 2249,
          "columnNum": 506
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Usage and Expression (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_USAGE_AND_EXPRESSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2250,
          "offsetEnd": 2250,
          "columnNum": 507
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Language Total (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_LANGUAGE_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2251,
          "offsetEnd": 2251,
          "columnNum": 508
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Int Writing Adv Skills (Sta9) ITED Express Adv Skills (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_ITBS_INT_WRITING_ADV_SKILLS_ITED_EXPRESSION_ADV_SKILLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2252,
          "offsetEnd": 2252,
          "columnNum": 509
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Int Writing Totals (Sta9) ITED Test E (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_ITBS_WRITING_TOTAL_ITED_TEST_E",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2253,
          "offsetEnd": 2253,
          "columnNum": 510
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Concpts & Est (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_MATH_CONCEPTS_&_EST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2254,
          "offsetEnd": 2254,
          "columnNum": 511
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Probs/Data Int (Sta9) ITED Quant Think Skills (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_ITBS_MATH_PROB_DATA_INT_ITED_QUANT_THINKING_SKILLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2255,
          "offsetEnd": 2255,
          "columnNum": 512
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Total (Sta9) ITED Test Q (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_ITBS_MATH_TOTAL_ITED_TEST_Q",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2256,
          "offsetEnd": 2256,
          "columnNum": 513
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Core Battery (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_CORE_BATTERY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2257,
          "offsetEnd": 2257,
          "columnNum": 514
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Social Studies (Sta9) ITED Test SS (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_ITBS_SOCIAL_STUDIES_ITED_TEST_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2258,
          "offsetEnd": 2258,
          "columnNum": 515
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Science (Sta9) ITED Test SC (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_ITBS_SCIENCE_ITED_TEST_SC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2259,
          "offsetEnd": 2259,
          "columnNum": 516
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Maps and Diagrams (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_MAPS_AND_DIAGRAMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2260,
          "offsetEnd": 2260,
          "columnNum": 517
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Reference Materials (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_REFERENCE_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2261,
          "offsetEnd": 2261,
          "columnNum": 518
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Sources of Info Total (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_SOURCES_OF_INFO_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2262,
          "offsetEnd": 2262,
          "columnNum": 519
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS and ITED Composite (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_COMPOSITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2263,
          "offsetEnd": 2263,
          "columnNum": 520
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITBS Math Computation (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_MATH_COMPUTATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2264,
          "offsetEnd": 2264,
          "columnNum": 521
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITED Test L (SS)",
        "otherPossibleNames": [],
        "logicalName": "SS_TEST_L",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2265,
          "offsetEnd": 2267,
          "columnNum": 522
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITED Test L (Index)",
        "otherPossibleNames": [],
        "logicalName": "INDEX_TEST_L",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2268,
          "offsetEnd": 2273,
          "columnNum": 523
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITED Test L (NPR)",
        "otherPossibleNames": [],
        "logicalName": "NPR_TEST_L",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2274,
          "offsetEnd": 2275,
          "columnNum": 524
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ITED Test L (Sta9)",
        "otherPossibleNames": [],
        "logicalName": "STA9_TEST_L",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2276,
          "offsetEnd": 2276,
          "columnNum": 525
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Erasure Analysis Voiding For 2001 on",
        "otherPossibleNames": [],
        "logicalName": "ERASURE_ANALYSIS_VOIDING_FOR_2001_ON",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2277,
          "offsetEnd": 2277,
          "columnNum": 526
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
          "offsetStart": 2278,
          "offsetEnd": 2286,
          "columnNum": 527
        },
        "fieldLength": 9,
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
          "offsetStart": 2287,
          "offsetEnd": 2287,
          "columnNum": 528
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
          "offsetStart": 2288,
          "offsetEnd": 2288,
          "columnNum": 529
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
          "offsetStart": 2289,
          "offsetEnd": 2289,
          "columnNum": 530
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
          "offsetStart": 2290,
          "offsetEnd": 2290,
          "columnNum": 531
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
          "offsetStart": 2291,
          "offsetEnd": 2291,
          "columnNum": 532
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
          "offsetStart": 2292,
          "offsetEnd": 2292,
          "columnNum": 533
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
          "offsetStart": 2293,
          "offsetEnd": 2293,
          "columnNum": 534
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
          "offsetStart": 2294,
          "offsetEnd": 2294,
          "columnNum": 535
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
          "offsetStart": 2295,
          "offsetEnd": 2295,
          "columnNum": 536
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
          "offsetStart": 2296,
          "offsetEnd": 2296,
          "columnNum": 537
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
          "offsetStart": 2297,
          "offsetEnd": 2297,
          "columnNum": 538
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
          "offsetStart": 2298,
          "offsetEnd": 2298,
          "columnNum": 539
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
          "offsetStart": 2299,
          "offsetEnd": 2299,
          "columnNum": 540
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
          "offsetStart": 2300,
          "offsetEnd": 2300,
          "columnNum": 541
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
          "offsetStart": 2301,
          "offsetEnd": 2301,
          "columnNum": 542
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
          "offsetStart": 2302,
          "offsetEnd": 2302,
          "columnNum": 543
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
          "offsetStart": 2303,
          "offsetEnd": 2303,
          "columnNum": 544
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
          "offsetStart": 2304,
          "offsetEnd": 2304,
          "columnNum": 545
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
          "offsetStart": 2305,
          "offsetEnd": 2305,
          "columnNum": 546
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
          "offsetStart": 2306,
          "offsetEnd": 2307,
          "columnNum": 547
        },
        "fieldLength": 2,
        "expectedValues": [],
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
          "offsetStart": 2308,
          "offsetEnd": 2308,
          "columnNum": 548
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Field 4",
        "otherPossibleNames": [],
        "logicalName": "FIELD_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2309,
          "offsetEnd": 2311,
          "columnNum": 549
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Change Indicator",
        "otherPossibleNames": [],
        "logicalName": "CHANGE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2312,
          "offsetEnd": 2312,
          "columnNum": 550
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
          "offsetStart": 2313,
          "offsetEnd": 2600,
          "columnNum": 551
        },
        "fieldLength": 288,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}