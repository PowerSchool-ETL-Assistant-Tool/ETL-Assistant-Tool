{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".txt"
  ],
  "format": {
    "@type": "Fixed Length",
    "formatName": "CAASPP_FIXED_LENGTH_363_COL",
    "recordLength": "4010",
    "hasHeader": true,
    "naturalKey": [],
    "fields": [
      {
        "physicalName": "Record Type",
        "otherPossibleNames": [],
        "logicalName": "RECORD_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 2,
          "columnNum": 2
        },
        "fieldLength": 500,
        "fieldPrecision": null,
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3,
          "offsetEnd": 12,
          "columnNum": 10
        },
        "fieldLength": 500,
        "fieldPrecision": null,
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
          "offsetStart": 13,
          "offsetEnd": 62,
          "columnNum": 3
        },
        "fieldLength": 50,
        "fieldPrecision": null,
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
          "offsetStart": 63,
          "offsetEnd": 92,
          "columnNum": 4
        },
        "fieldLength": 30,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Middle Name",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 93,
          "offsetEnd": 122,
          "columnNum": 5
        },
        "fieldLength": 30,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Date of Birth",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_DOB",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 123,
          "offsetEnd": 132,
          "columnNum": 6
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gender",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_GENDER_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 133,
          "offsetEnd": 133,
          "columnNum": 7
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 134,
          "offsetEnd": 136,
          "columnNum": 8
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 137,
          "offsetEnd": 138,
          "columnNum": 9
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS Grade",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 139,
          "offsetEnd": 140,
          "columnNum": 10
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Grade Assessed",
        "otherPossibleNames": [],
        "logicalName": "GRADE_ASSESSED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 141,
          "offsetEnd": 142,
          "columnNum": 11
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS District Code",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_DISTRICT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 143,
          "offsetEnd": 156,
          "columnNum": 12
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS District Name",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_DISTRICT_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 157,
          "offsetEnd": 256,
          "columnNum": 13
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 257,
          "offsetEnd": 270,
          "columnNum": 14
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS School Name",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_SCHOOL_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 271,
          "offsetEnd": 370,
          "columnNum": 15
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 371,
          "offsetEnd": 374,
          "columnNum": 16
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS Charter School Indicator",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 375,
          "offsetEnd": 376,
          "columnNum": 17
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS Special Education District of Accountability",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_SPECIAL_EDUCATION_ACCOUNTABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 377,
          "offsetEnd": 383,
          "columnNum": 18
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Section 504 Status",
        "otherPossibleNames": [],
        "logicalName": "PP_SECTION_504_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 384,
          "offsetEnd": 386,
          "columnNum": 19
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS Primary Disability Type",
        "otherPossibleNames": [],
        "logicalName": "PRIMARY_DISABILITY_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 387,
          "offsetEnd": 389,
          "columnNum": 20
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Primary Disability Type for Testing",
        "otherPossibleNames": [],
        "logicalName": "Primary Disability Type for Testing",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 390,
          "offsetEnd": 392,
          "columnNum": 21
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS IDEA Indicator",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_IDEA_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 393,
          "offsetEnd": 395,
          "columnNum": 22
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "IDEA Indicator for Testing",
        "otherPossibleNames": [],
        "logicalName": "PP_IDEA_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 396,
          "offsetEnd": 398,
          "columnNum": 23
        },
        "fieldLength": 3,
        "fieldPrecision": null,
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
          "offsetStart": 399,
          "offsetEnd": 400,
          "columnNum": 24
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL Status",
        "otherPossibleNames": [],
        "logicalName": "EP_LIMITED_ENGLISH_PROFICIENT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 402,
          "offsetEnd": 404,
          "columnNum": 25
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EL Entry Date",
        "otherPossibleNames": [],
        "logicalName": "EL_ENTRY_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 405,
          "offsetEnd": 414,
          "columnNum": 26
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RFEP Date",
        "otherPossibleNames": [],
        "logicalName": "LEP_EXIT_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 415,
          "offsetEnd": 424,
          "columnNum": 27
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "First Entry Date in US School",
        "otherPossibleNames": [],
        "logicalName": "FIRST_DATE_IN_US_SCHOOL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 425,
          "offsetEnd": 434,
          "columnNum": 28
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Enrollment Effective Date",
        "otherPossibleNames": [],
        "logicalName": "ENROLLMENT_EFFECTIVE_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 435,
          "offsetEnd": 444,
          "columnNum": 29
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "English Language Acquisition Status",
        "otherPossibleNames": [],
        "logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 445,
          "offsetEnd": 448,
          "columnNum": 30
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Language Code (CEDS)",
        "otherPossibleNames": [],
        "logicalName": "LANGUAGE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 449,
          "offsetEnd": 451,
          "columnNum": 31
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS Primary Language",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_PRIMARY_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 452,
          "offsetEnd": 453,
          "columnNum": 32
        },
        "fieldLength": 2,
        "fieldPrecision": null,
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
          "offsetStart": 454,
          "offsetEnd": 456,
          "columnNum": 33
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 457,
          "offsetEnd": 459,
          "columnNum": 34
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 460,
          "offsetEnd": 462,
          "columnNum": 35
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS Economic Disadvantage Status",
        "otherPossibleNames": [],
        "logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 463,
          "offsetEnd": 465,
          "columnNum": 36
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Economic Disadvantage Status for Testing",
        "otherPossibleNames": [],
        "logicalName": "ECONOMIC_DISADVANTAGE_TESTING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 466,
          "offsetEnd": 468,
          "columnNum": 37
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS NPS School Flag",
        "otherPossibleNames": [],
        "logicalName": "NPS_SCHOOL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 469,
          "offsetEnd": 469,
          "columnNum": 38
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hispanic or Latino",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC_OR_LATINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 470,
          "offsetEnd": 472,
          "columnNum": 39
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 473,
          "offsetEnd": 475,
          "columnNum": 40
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 476,
          "offsetEnd": 478,
          "columnNum": 41
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 479,
          "offsetEnd": 481,
          "columnNum": 42
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 482,
          "offsetEnd": 484,
          "columnNum": 43
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 485,
          "offsetEnd": 487,
          "columnNum": 44
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 488,
          "offsetEnd": 490,
          "columnNum": 45
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
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
          "offsetStart": 491,
          "offsetEnd": 493,
          "columnNum": 46
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Ethnicity",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_ETHNICITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 494,
          "offsetEnd": 496,
          "columnNum": 47
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Parent Education Level",
        "otherPossibleNames": [],
        "logicalName": "PARENT_EDUCATION_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 497,
          "offsetEnd": 498,
          "columnNum": 48
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 499,
          "offsetEnd": 499,
          "columnNum": 49
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity ID 1",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_ID_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 500,
          "offsetEnd": 515,
          "columnNum": 50
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity Testing Status 1",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_TESTING_STATUS_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 516,
          "offsetEnd": 516,
          "columnNum": 51
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity ID 2",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_ID_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 517,
          "offsetEnd": 532,
          "columnNum": 52
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity Testing Status 2",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_TESTING_STATUS_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 533,
          "offsetEnd": 533,
          "columnNum": 53
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity ID 3",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_ID_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 534,
          "offsetEnd": 549,
          "columnNum": 54
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity Testing Status 3",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_TESTING_STATUS_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 550,
          "offsetEnd": 550,
          "columnNum": 55
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity ID 4",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_ID_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 551,
          "offsetEnd": 566,
          "columnNum": 56
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity Testing Status 4",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_TESTING_STATUS_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 567,
          "offsetEnd": 567,
          "columnNum": 57
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Registration ID",
        "otherPossibleNames": [],
        "logicalName": "ENROLLMENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 568,
          "offsetEnd": 583,
          "columnNum": 58
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested LEA Name 1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_LEA_NAME_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 584,
          "offsetEnd": 683,
          "columnNum": 59
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested County-District Code 1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_COUNTY-DISTRICT_CODE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 684,
          "offsetEnd": 697,
          "columnNum": 60
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School Name 1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NAME_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 698,
          "offsetEnd": 797,
          "columnNum": 61
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School Code 1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_CODE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 698,
          "offsetEnd": 811,
          "columnNum": 62
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested Charter School Indicator 1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 812,
          "offsetEnd": 813,
          "columnNum": 63
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested Charter Code 1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_SCHOOL_CODE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 814,
          "offsetEnd": 817,
          "columnNum": 64
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School NPS Flag 1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NPS_FLAG_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 818,
          "offsetEnd": 818,
          "columnNum": 65
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Paper and Pencil Test Completion Date (Paper)",
        "otherPossibleNames": [],
        "logicalName": "PAPER_AND_PENCIL_TEST_COMPLETION_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 819,
          "offsetEnd": 828,
          "columnNum": 66
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested LEA Name 2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_LEA_NAME_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 829,
          "offsetEnd": 928,
          "columnNum": 67
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested County-District Code 2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_COUNTY-DISTRICT_CODE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 929,
          "offsetEnd": 942,
          "columnNum": 68
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School Name 2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NAME_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 943,
          "offsetEnd": 1042,
          "columnNum": 69
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School Code 2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_CODE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1043,
          "offsetEnd": 1056,
          "columnNum": 70
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested Charter School Indicator 2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1057,
          "offsetEnd": 4058,
          "columnNum": 71
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested Charter Code 2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_SCHOOL_CODE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1059,
          "offsetEnd": 1062,
          "columnNum": 72
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School NPS Flag 2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NPS_FLAG_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1063,
          "offsetEnd": 1063,
          "columnNum": 73
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested LEA Name 3",
        "otherPossibleNames": [],
        "logicalName": "TESTED_LEA_NAME_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1064,
          "offsetEnd": 1163,
          "columnNum": 74
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested County-District Code 3",
        "otherPossibleNames": [],
        "logicalName": "TESTED_COUNTY-DISTRICT_CODE_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1164,
          "offsetEnd": 1174,
          "columnNum": 75
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School Name 3",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NAME_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1178,
          "offsetEnd": 1277,
          "columnNum": 76
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School Code 3",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_CODE_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1278,
          "offsetEnd": 1291,
          "columnNum": 77
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested Charter School Indicator 3",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1292,
          "offsetEnd": 1293,
          "columnNum": 78
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested Charter Code 3",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_CODE_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1294,
          "offsetEnd": 1297,
          "columnNum": 79
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School NPS Flag 3",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NPS_FLAG_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1298,
          "offsetEnd": 1298,
          "columnNum": 80
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested LEA Name 4",
        "otherPossibleNames": [],
        "logicalName": "TESTED_LEA_NAME_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1299,
          "offsetEnd": 1398,
          "columnNum": 81
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested County-District Code 4",
        "otherPossibleNames": [],
        "logicalName": "TESTED_COUNTY-DISTRICT_CODE_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1399,
          "offsetEnd": 1412,
          "columnNum": 82
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School Name 4",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NAME_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1413,
          "offsetEnd": 1512,
          "columnNum": 83
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School Code 4",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_CODE_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1513,
          "offsetEnd": 1526,
          "columnNum": 84
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested Indicator 4",
        "otherPossibleNames": [],
        "logicalName": "TESTED_INDICATOR_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1527,
          "offsetEnd": 1528,
          "columnNum": 85
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested Charter Code 4",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_CODE_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1529,
          "offsetEnd": 1532,
          "columnNum": 86
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tested School NPS Flag 4",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NPS_FLAG_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1533,
          "offsetEnd": 1533,
          "columnNum": 87
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Start Date 1",
        "otherPossibleNames": [],
        "logicalName": "TEST_START_DATE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1534,
          "offsetEnd": 1534,
          "columnNum": 88
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Completion Date 1",
        "otherPossibleNames": [],
        "logicalName": "TEST_COMPLETION_DATE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1544,
          "offsetEnd": 1553,
          "columnNum": 89
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Start Date 2",
        "otherPossibleNames": [],
        "logicalName": "TEST_START_DATE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1554,
          "offsetEnd": 1563,
          "columnNum": 90
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Completion Date 2",
        "otherPossibleNames": [],
        "logicalName": "TEST_COMPLETION_DATE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1564,
          "offsetEnd": 1573,
          "columnNum": 91
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Start Date 3",
        "otherPossibleNames": [],
        "logicalName": "TEST_START_DATE_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1574,
          "offsetEnd": 1583,
          "columnNum": 92
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Completion Date 3",
        "otherPossibleNames": [],
        "logicalName": "TEST_COMPLETION_DATE_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1584,
          "offsetEnd": 1593,
          "columnNum": 93
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Start Date 4",
        "otherPossibleNames": [],
        "logicalName": "TEST_START_DATE_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1594,
          "offsetEnd": 1603,
          "columnNum": 94
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Completion Date 4",
        "otherPossibleNames": [],
        "logicalName": "TEST_COMPLETION_DATE_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1604,
          "offsetEnd": 1613,
          "columnNum": 95
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Final Tested LEA Name",
        "otherPossibleNames": [],
        "logicalName": "FINAL_TESTED_LEA_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1614,
          "offsetEnd": 1713,
          "columnNum": 96
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Final Tested County-District Code",
        "otherPossibleNames": [],
        "logicalName": "FINAL_TESTED_COUNTY-DISTRICT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1714,
          "offsetEnd": 1727,
          "columnNum": 97
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Final Tested School Name",
        "otherPossibleNames": [],
        "logicalName": "FINAL_TESTED_SCHOOL_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1728,
          "offsetEnd": 1827,
          "columnNum": 98
        },
        "fieldLength": 100,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Final Tested School Code",
        "otherPossibleNames": [],
        "logicalName": "FINAL_TESTED_SCHOOL_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1828,
          "offsetEnd": 1841,
          "columnNum": 99
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Final Tested Charter School Indicator",
        "otherPossibleNames": [],
        "logicalName": "FINAL_TESTED_CHARTER_SCHOOL_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1842,
          "offsetEnd": 1843,
          "columnNum": 100
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Final Tested Charter Code",
        "otherPossibleNames": [],
        "logicalName": "FINAL_TESTED_CHARTER_SCHOOL_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1844,
          "offsetEnd": 1847,
          "columnNum": 101
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Final Tested School NPS Flag",
        "otherPossibleNames": [],
        "logicalName": "FINAL_TESTED_SCHOOL_NPS_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1848,
          "offsetEnd": 1848,
          "columnNum": 102
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Final Test Completed Date",
        "otherPossibleNames": [],
        "logicalName": "FINAL_TEST_COMPLETED_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1849,
          "offsetEnd": 1858,
          "columnNum": 103
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Selected Start of Test Window 1",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1859,
          "offsetEnd": 1868,
          "columnNum": 104
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Selected End of Test Window 1",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1869,
          "offsetEnd": 1878,
          "columnNum": 105
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Selected Start of Test Window 2",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1879,
          "offsetEnd": 1888,
          "columnNum": 106
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Selected End of Test Window 2",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1889,
          "offsetEnd": 1898,
          "columnNum": 107
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Selected Start of Test Window 3",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1899,
          "offsetEnd": 1908,
          "columnNum": 108
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Selected End of Test Window 3",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1909,
          "offsetEnd": 1918,
          "columnNum": 109
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Selected Start of Test Window 4",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1919,
          "offsetEnd": 1928,
          "columnNum": 110
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Selected End of Test Window 4",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1929,
          "offsetEnd": 1938,
          "columnNum": 111
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Exit Code",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_EXIT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1939,
          "offsetEnd": 1942,
          "columnNum": 112
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Exit Withdrawal Date",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_EXIT_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1943,
          "offsetEnd": 1952,
          "columnNum": 113
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Removed from CALPADS File Date",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1953,
          "offsetEnd": 1962,
          "columnNum": 114
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ELAS Correction Code ǂ",
        "otherPossibleNames": [],
        "logicalName": "ELAS_CORRECTION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1963,
          "offsetEnd": 1963,
          "columnNum": 115
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAST Current Year Flag",
        "otherPossibleNames": [],
        "logicalName": "CAST_CURRENT_YEAR_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1964,
          "offsetEnd": 1964,
          "columnNum": 116
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAST Participated High School Grade",
        "otherPossibleNames": [],
        "logicalName": "CAST_PARTICIPATED_HIGH_SCHOOL_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1965,
          "offsetEnd": 1966,
          "columnNum": 117
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAST Participated NPS Flag",
        "otherPossibleNames": [],
        "logicalName": "CAST_PARTICIPATED_NPS_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1967,
          "offsetEnd": 1967,
          "columnNum": 118
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAST Participated District of Accountability",
        "otherPossibleNames": [],
        "logicalName": "CAST_PARTICIPATED_DISTRICT_OF_ACCOUNTABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1968,
          "offsetEnd": 1974,
          "columnNum": 119
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAST Last Science Class Flag",
        "otherPossibleNames": [],
        "logicalName": "CAST_LAST_SCIENCE_CLASS_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1975,
          "offsetEnd": 1975,
          "columnNum": 120
        },
        "fieldLength": 1,
        "fieldPrecision": null,
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
          "offsetStart": 1976,
          "offsetEnd": 1979,
          "columnNum": 121
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Attemptedness",
        "otherPossibleNames": [],
        "logicalName": "ATTEMPTEDNESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1980,
          "offsetEnd": 1980,
          "columnNum": 122
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Score Status",
        "otherPossibleNames": [],
        "logicalName": "SCORE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1981,
          "offsetEnd": 1981,
          "columnNum": 123
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Unlisted Resource Construct Change",
        "otherPossibleNames": [],
        "logicalName": "UNLISTED_RESOURCE_CONSTRUCT_CHANGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1982,
          "offsetEnd": 1982,
          "columnNum": 124
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Mode_Online or Paper",
        "otherPossibleNames": [],
        "logicalName": "TEST_MODE_ONLINE_OR_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1983,
          "offsetEnd": 1983,
          "columnNum": 125
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include Indicator",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1984,
          "offsetEnd": 1984,
          "columnNum": 126
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Remote Tester 1",
        "otherPossibleNames": [],
        "logicalName": "REMOTE_TESTER_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1985,
          "offsetEnd": 1985,
          "columnNum": 127
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Remote Tester 2",
        "otherPossibleNames": [],
        "logicalName": "REMOTE_TESTER_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1986,
          "offsetEnd": 1986,
          "columnNum": 128
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Remote Tester 3",
        "otherPossibleNames": [],
        "logicalName": "REMOTE_TESTER_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1987,
          "offsetEnd": 1987,
          "columnNum": 129
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Remote Tester 4",
        "otherPossibleNames": [],
        "logicalName": "REMOTE_TESTER_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1988,
          "offsetEnd": 1988,
          "columnNum": 130
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SSR Eligible",
        "otherPossibleNames": [],
        "logicalName": "SSR_ELIGIBLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1989,
          "offsetEnd": 1989,
          "columnNum": 131
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Score Available Date ǂ",
        "otherPossibleNames": [],
        "logicalName": "SCORE_AVAILABLE_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1990,
          "offsetEnd": 1999,
          "columnNum": 132
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Lexile or Quantile Measure",
        "otherPossibleNames": [],
        "logicalName": "LEXILE_QUANTILE_MEASURE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2000,
          "offsetEnd": 2005,
          "columnNum": 133
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2006,
          "offsetEnd": 2014,
          "columnNum": 134
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2015,
          "offsetEnd": 2021,
          "columnNum": 135
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score 1",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2022,
          "offsetEnd": 2023,
          "columnNum": 136
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score 2",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2024,
          "offsetEnd": 2025,
          "columnNum": 137
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score 3",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2026,
          "offsetEnd": 2027,
          "columnNum": 138
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score 4",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2028,
          "offsetEnd": 2029,
          "columnNum": 139
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2030,
          "offsetEnd": 2032,
          "columnNum": 140
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2033,
          "offsetEnd": 2034,
          "columnNum": 141
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2035,
          "offsetEnd": 2036,
          "columnNum": 142
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2037,
          "offsetEnd": 2038,
          "columnNum": 143
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2039,
          "offsetEnd": 2040,
          "columnNum": 144
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2041,
          "offsetEnd": 2042,
          "columnNum": 145
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2043,
          "offsetEnd": 2044,
          "columnNum": 146
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2045,
          "offsetEnd": 2049,
          "columnNum": 147
        },
        "fieldLength": 5,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2050,
          "offsetEnd": 2053,
          "columnNum": 148
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error Measurement \u2013 SEM",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2054,
          "offsetEnd": 2057,
          "columnNum": 149
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Smarter Scale Scores Error Bands \u2013 Min",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_MIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2058,
          "offsetEnd": 2061,
          "columnNum": 150
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Smarter Scale Scores Error Bands \u2013 Max",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_MAX",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2062,
          "offsetEnd": 2065,
          "columnNum": 151
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Levels",
        "otherPossibleNames": [],
        "logicalName": "ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2066,
          "offsetEnd": 2066,
          "columnNum": 152
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Domain 1 Level",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_1_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2067,
          "offsetEnd": 2067,
          "columnNum": 153
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Domain 2 Leve",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_2_LEVE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2068,
          "offsetEnd": 2068,
          "columnNum": 154
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Domain 3 Leve",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_3_LEVE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2069,
          "offsetEnd": 2069,
          "columnNum": 155
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Genre",
        "otherPossibleNames": [],
        "logicalName": "GENRE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2070,
          "offsetEnd": 2073,
          "columnNum": 156
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WER POR",
        "otherPossibleNames": [],
        "logicalName": "WER_POR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2074,
          "offsetEnd": 2074,
          "columnNum": 157
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WER DEV EEL",
        "otherPossibleNames": [],
        "logicalName": "WER_DEV_EEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2075,
          "offsetEnd": 2075,
          "columnNum": 158
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WER COV",
        "otherPossibleNames": [],
        "logicalName": "WER_COV",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2076,
          "offsetEnd": 2076,
          "columnNum": 159
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WER POR Condition Code",
        "otherPossibleNames": [],
        "logicalName": "WER_POR_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2077,
          "offsetEnd": 2077,
          "columnNum": 160
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WER DEV EEL Condition Code",
        "otherPossibleNames": [],
        "logicalName": "WER_DEV_EEL_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2078,
          "offsetEnd": 2078,
          "columnNum": 161
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WER COV Condition Code",
        "otherPossibleNames": [],
        "logicalName": "WER_COV_CONDITION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2079,
          "offsetEnd": 2079,
          "columnNum": 162
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EAP",
        "otherPossibleNames": [],
        "logicalName": "EAP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2080,
          "offsetEnd": 2080,
          "columnNum": 163
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Number of Items Attempted 1",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2081,
          "offsetEnd": 2083,
          "columnNum": 164
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Number of Items Attempted 2",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2084,
          "offsetEnd": 2086,
          "columnNum": 165
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Number of Items Attempted 3",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2087,
          "offsetEnd": 2089,
          "columnNum": 166
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Number of Items Attempted 4",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2090,
          "offsetEnd": 2092,
          "columnNum": 167
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodations Available Indicator",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATIONS_AVAILABLE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2093,
          "offsetEnd": 2095,
          "columnNum": 168
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Designated Support Available Indicator",
        "otherPossibleNames": [],
        "logicalName": "DESIGNATED_SUPPORT_AVALIABLE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2096,
          "offsetEnd": 2098,
          "columnNum": 169
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 1 \u2013 American Sign Language (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_AMERICAN_SIGN_LANGUAGE_ONLINE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2099,
          "offsetEnd": 2106,
          "columnNum": 170
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 2 \u2013 American Sign Language (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_AMERICAN_SIGN_LANGUAGE_ONLINE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2107,
          "offsetEnd": 2114,
          "columnNum": 171
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 1 \u2013 Audio Transcript (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_AUDIO_TRANSCRIPT_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2115,
          "offsetEnd": 2130,
          "columnNum": 172
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 2 \u2013 Audio Transcript (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_AUDIO_TRANSCRIPT_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2131,
          "offsetEnd": 2146,
          "columnNum": 173
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 1 \u2013 Braille (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_BRAILLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2147,
          "offsetEnd": 2157,
          "columnNum": 174
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 2 \u2013 Braille (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_BRAILLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2158,
          "offsetEnd": 2168,
          "columnNum": 175
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 1 \u2013 Closed Captioning (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_CLOSED_CAPTIONING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2169,
          "offsetEnd": 2182,
          "columnNum": 176
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 2 \u2013 Closed Captioning (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_CLOSED_CAPTIONING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2183,
          "offsetEnd": 2196,
          "columnNum": 177
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 1 \u2013 Speech\u0002to-Text (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_SPEECH_TEXT_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2197,
          "offsetEnd": 2211,
          "columnNum": 178
        },
        "fieldLength": 15,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 2 \u2013 Speech\u0002to-Text (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_SPEECH_TEXT_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2212,
          "offsetEnd": 2226,
          "columnNum": 179
        },
        "fieldLength": 15,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 1 \u2013 Text-to\u0002Speech Passages (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_TEXT_TO_SPEECH_PASSAGES_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2227,
          "offsetEnd": 2238,
          "columnNum": 180
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Accommodation 2 \u2013 Text-to\u0002Speech Passages (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_TEXT_TO_SPEECH_PASSAGES_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2239,
          "offsetEnd": 2250,
          "columnNum": 181
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 100s Number Table (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_NUMBER_TABLE_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2251,
          "offsetEnd": 2260,
          "columnNum": 182
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 100s Number Table (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_NUMBER_TABLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2261,
          "offsetEnd": 2270,
          "columnNum": 183
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Abacus (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_ABACUS_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2271,
          "offsetEnd": 2280,
          "columnNum": 184
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Abacus (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_ABACUS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2281,
          "offsetEnd": 2290,
          "columnNum": 185
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 3 \u2013 Abacus (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_3_ABACUS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2291,
          "offsetEnd": 2300,
          "columnNum": 186
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 4 \u2013 Abacus (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_4_ABACUS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2301,
          "offsetEnd": 2310,
          "columnNum": 187
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Additional Instructional Supports for Alternate Assessments (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_ADDITIONAL_INSTRUCTIONAL_SUPPORTS_FOR_ALTERNATE_ASSESSMENTS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2311,
          "offsetEnd": 2323,
          "columnNum": 188
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Additional Instructional Supports for Alternate Assessments (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_ADDITIONAL_INSTRUCTIONAL_SUPPORTS_FOR_ALTERNATE_ASSESSMENTS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2324,
          "offsetEnd": 2336,
          "columnNum": 189
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 3 \u2013 Additional Instructional Supports for Alternate Assessments (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_3_ADDITIONAL_INSTRUCTIONAL_SUPPORTS_FOR_ALTERNATE_ASSESSMENTS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2337,
          "offsetEnd": 2349,
          "columnNum": 190
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 4 \u2013 Additional Instructional Supports for Alternate Assessments (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_4_ADDITIONAL_INSTRUCTIONAL_SUPPORTS_FOR_ALTERNATE_ASSESSMENTS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2350,
          "offsetEnd": 2362,
          "columnNum": 191
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Alternate Response Options (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_ALTERNATE_RESPONSE_OPTIONS_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2363,
          "offsetEnd": 2368,
          "columnNum": 192
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Alternate Response Options (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_ALTERNATE_RESPONSE_OPTIONS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2369,
          "offsetEnd": 2374,
          "columnNum": 193
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 3 \u2013 Alternate Response Options (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_3_ALTERNATE_RESPONSE_OPTIONS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2375,
          "offsetEnd": 2380,
          "columnNum": 194
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 4 \u2013 Alternate Response Options (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_4_ALTERNATE_RESPONSE_OPTIONS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2381,
          "offsetEnd": 2386,
          "columnNum": 195
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation \u2013 Braille (Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_BRAILLE_(PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2387,
          "offsetEnd": 2397,
          "columnNum": 196
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Calculator (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_CALCULATOR_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2398,
          "offsetEnd": 2405,
          "columnNum": 197
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Calculator (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_CALCULATOR_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2406,
          "offsetEnd": 2413,
          "columnNum": 198
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation (Paper) \u2013 Large-Print special form",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_(PAPER)_LARGE-PRINT_SPECIAL_FORM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2414,
          "offsetEnd": 2419,
          "columnNum": 199
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Multiplication Table (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_MULTIPLICATION_TABLE_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2420,
          "offsetEnd": 2425,
          "columnNum": 200
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Multiplication Table (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_MULTIPLICATION_TABLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2426,
          "offsetEnd": 2431,
          "columnNum": 201
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Print on Demand (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_PRINT_ON_DEMAND_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2432,
          "offsetEnd": 2456,
          "columnNum": 202
        },
        "fieldLength": 25,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Print on Demand (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_PRINT_ON_DEMAND_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2457,
          "offsetEnd": 2481,
          "columnNum": 203
        },
        "fieldLength": 25,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 3 \u2013 Print on Demand (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_3_PRINT_ON_DEMAND_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2082,
          "offsetEnd": 2506,
          "columnNum": 204
        },
        "fieldLength": 25,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 4 \u2013 Print on Demand (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_4_PRINT_ON_DEMAND_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2507,
          "offsetEnd": 2531,
          "columnNum": 205
        },
        "fieldLength": 25,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Read Aloud Passages (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_READ_ALOUD_PASSAGES_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2532,
          "offsetEnd": 2545,
          "columnNum": 206
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Scribe (Writing) (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_SCRIBE_(WRITING)_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2546,
          "offsetEnd": 2561,
          "columnNum": 207
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Scribe (Writing) (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_SCRIBE_(WRITING)_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2562,
          "offsetEnd": 2577,
          "columnNum": 208
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Speech-to-Text (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_SPEECH_TO_TEXT_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2578,
          "offsetEnd": 2584,
          "columnNum": 209
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Speech-to-Text (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_SPEECH_TO_TEXT_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2585,
          "offsetEnd": 2591,
          "columnNum": 210
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Unlisted Resources (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_UNLISTED_RESOURCES_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2592,
          "offsetEnd": 2609,
          "columnNum": 211
        },
        "fieldLength": 18,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Unlisted Resources (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_UNLISTED_RESOURCES_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2610,
          "offsetEnd": 2627,
          "columnNum": 212
        },
        "fieldLength": 18,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 3 \u2013 Unlisted Resources (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_3_UNLISTED_RESOURCES_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2628,
          "offsetEnd": 2645,
          "columnNum": 213
        },
        "fieldLength": 18,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 4 \u2013 Unlisted Resources (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_4_UNLISTED_RESOURCES_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2646,
          "offsetEnd": 2663,
          "columnNum": 214
        },
        "fieldLength": 18,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 1 \u2013 Word Prediction (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_WORD_PREDICTION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2664,
          "offsetEnd": 2675,
          "columnNum": 215
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Accommodation 2 \u2013 Word Prediction (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_WORD_PREDICTION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2676,
          "offsetEnd": 2687,
          "columnNum": 216
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Color Contrast (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_CONTRAST_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2688,
          "offsetEnd": 2706,
          "columnNum": 217
        },
        "fieldLength": 19,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Color Contrast (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_CONTRAST_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2707,
          "offsetEnd": 2725,
          "columnNum": 218
        },
        "fieldLength": 19,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 3 \u2013 Color Contrast (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_COLOR_CONTRAST_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2726,
          "offsetEnd": 2744,
          "columnNum": 219
        },
        "fieldLength": 19,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 4 \u2013 Color Contrast (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_COLOR_CONTRAST_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2745,
          "offsetEnd": 2763,
          "columnNum": 220
        },
        "fieldLength": 19,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Masking (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MASKING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2764,
          "offsetEnd": 2775,
          "columnNum": 221
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Masking (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_MASKING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2776,
          "offsetEnd": 2787,
          "columnNum": 222
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 3 \u2013 Masking (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_MASKING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2788,
          "offsetEnd": 2799,
          "columnNum": 223
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 4 \u2013 Masking (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_MASKING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2800,
          "offsetEnd": 2811,
          "columnNum": 224
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Mouse Pointer (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MOUSE_POINTER_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2812,
          "offsetEnd": 2827,
          "columnNum": 225
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Mouse Pointer (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_MOUSE_POINTER_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2828,
          "offsetEnd": 2843,
          "columnNum": 226
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 3 \u2013 Mouse Pointer (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_MOUSE_POINTER_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2844,
          "offsetEnd": 2859,
          "columnNum": 227
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 4 \u2013 Mouse Pointer (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_MOUSE_POINTER_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2860,
          "offsetEnd": 2875,
          "columnNum": 228
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Permissive Mode (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_PERMISSIVE_MODE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2876,
          "offsetEnd": 2882,
          "columnNum": 229
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Permissive Mode (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_PERMISSIVE_MODE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2883,
          "offsetEnd": 2889,
          "columnNum": 230
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 3 \u2013 Permissive Mode (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_PERMISSIVE_MODE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2890,
          "offsetEnd": 2896,
          "columnNum": 231
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 4 \u2013 Permissive Mode (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_PERMISSIVE_MODE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2897,
          "offsetEnd": 2903,
          "columnNum": 232
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Print Size (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_PRINT_SIZE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2904,
          "offsetEnd": 2912,
          "columnNum": 233
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Print Size (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_PRINT_SIZE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2913,
          "offsetEnd": 2921,
          "columnNum": 234
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 3 \u2013 Print Size (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_PRINT_SIZE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2922,
          "offsetEnd": 2930,
          "columnNum": 235
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 4 \u2013 Print Size (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_PRINT_SIZE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2931,
          "offsetEnd": 2939,
          "columnNum": 236
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Stacked Translations and Translated Test Directions (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2940,
          "offsetEnd": 2942,
          "columnNum": 237
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Stacked Translations and Translated Test Directions (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2943,
          "offsetEnd": 2945,
          "columnNum": 238
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Streamline (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_STREAMLINE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2946,
          "offsetEnd": 2953,
          "columnNum": 239
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Streamline (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_STREAMLINE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2954,
          "offsetEnd": 2961,
          "columnNum": 240
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 3 \u2013 Streamline (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_STREAMLINE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2962,
          "offsetEnd": 2969,
          "columnNum": 241
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 4 \u2013 Streamline (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_STREAMLINE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2970,
          "offsetEnd": 2977,
          "columnNum": 242
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Text to Speech (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TEXT_TO_SPEECH_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2978,
          "offsetEnd": 3002,
          "columnNum": 243
        },
        "fieldLength": 25,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Text to Speech (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TEXT_TO_SPEECH_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3003,
          "offsetEnd": 3027,
          "columnNum": 244
        },
        "fieldLength": 25,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Translations (Glossary) (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TRANSLATIONS_(GLOSSARY)_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3028,
          "offsetEnd": 3065,
          "columnNum": 245
        },
        "fieldLength": 38,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Translations (Glossary) (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TRANSLATIONS_(GLOSSARY)_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3066,
          "offsetEnd": 3103,
          "columnNum": 246
        },
        "fieldLength": 38,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 1 \u2013 Turn off Universal Tools (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TURN_OFF_UNIVERSAL_TOOLS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3104,
          "offsetEnd": 3106,
          "columnNum": 247
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 2 \u2013 Turn off Universal Tools (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TURN_OFF_UNIVERSAL_TOOLS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3107,
          "offsetEnd": 3109,
          "columnNum": 248
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 3 \u2013 Turn off Universal Tools (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_3_TURN_OFF_UNIVERSAL_TOOLS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3110,
          "offsetEnd": 3112,
          "columnNum": 249
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded Designated Support 4 \u2013 Turn off Universal Tools (Online)",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_4_TURN_OFF_UNIVERSAL_TOOLS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3113,
          "offsetEnd": 3115,
          "columnNum": 250
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 100s Number Table (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_100S_NUMBER_TABLE_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3116,
          "offsetEnd": 3126,
          "columnNum": 251
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 100s Number Table (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_100S_NUMBER_TABLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3127,
          "offsetEnd": 3137,
          "columnNum": 252
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 100s Number Table (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_100S_NUMBER_TABLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3138,
          "offsetEnd": 3148,
          "columnNum": 253
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 100s Number Table (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_100S_NUMBER_TABLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3149,
          "offsetEnd": 3159,
          "columnNum": 254
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Amplification (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_AMPLIFICATION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3160,
          "offsetEnd": 3171,
          "columnNum": 255
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Amplification (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_AMPLIFICATION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3172,
          "offsetEnd": 3183,
          "columnNum": 256
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Amplification (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_AMPLIFICATION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3184,
          "offsetEnd": 3195,
          "columnNum": 257
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Amplification (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_AMPLIFICATION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3196,
          "offsetEnd": 3207,
          "columnNum": 258
        },
        "fieldLength": 12,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Bilingual Dictionary (Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_BILINGUAL_DICTIONARY_(PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3208,
          "offsetEnd": 3214,
          "columnNum": 259
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Bilingual Dictionary (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_BILINGUAL_DICTIONARY_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3215,
          "offsetEnd": 3221,
          "columnNum": 260
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Calculator (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_CALCULATOR_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3222,
          "offsetEnd": 3230,
          "columnNum": 261
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Color Contrast (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_CONTRAST_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3231,
          "offsetEnd": 3237,
          "columnNum": 262
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Color Contrast (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_CONTRAST_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3238,
          "offsetEnd": 3244,
          "columnNum": 263
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Color Contrast (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_COLOR_CONTRAST_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3245,
          "offsetEnd": 3251,
          "columnNum": 264
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Color Contrast (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_COLOR_CONTRAST_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3252,
          "offsetEnd": 3259,
          "columnNum": 265
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Color Overlay (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_OVERLAY_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3259,
          "offsetEnd": 3265,
          "columnNum": 266
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Color Overlay (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_OVERLAY_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3266,
          "offsetEnd": 3272,
          "columnNum": 267
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Magnification (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_MAGNIFICATION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3273,
          "offsetEnd": 3280,
          "columnNum": 268
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Magnification (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_MAGNIFICATION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3281,
          "offsetEnd": 3288,
          "columnNum": 269
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Magnification (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_MAGNIFICATION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3289,
          "offsetEnd": 3296,
          "columnNum": 270
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Magnification (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_MAGNIFICATION_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3297,
          "offsetEnd": 3304,
          "columnNum": 271
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Medical Supports (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_MEDICAL_SUPPORTS_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3305,
          "offsetEnd": 3315,
          "columnNum": 272
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Medical Supports (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_MEDICAL_SUPPORTS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3316,
          "offsetEnd": 3326,
          "columnNum": 273
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Medical Supports (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_MEDICAL_SUPPORTS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3327,
          "offsetEnd": 3337,
          "columnNum": 274
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Medical Supports (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_MEDICAL_SUPPORTS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3338,
          "offsetEnd": 3348,
          "columnNum": 275
        },
        "fieldLength": 11,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Multiplication Table (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_MULTIPLICATION_TABLE_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3349,
          "offsetEnd": 3355,
          "columnNum": 276
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Multiplication Table (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_MULTIPLICATION_TABLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3356,
          "offsetEnd": 3362,
          "columnNum": 277
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Multiplication Table (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_MULTIPLICATION_TABLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3363,
          "offsetEnd": 3369,
          "columnNum": 278
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Multiplication Table (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_MULTIPLICATION_TABLE_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3370,
          "offsetEnd": 3376,
          "columnNum": 279
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Noise Buffers (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_NOISE_BUFFERS_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3377,
          "offsetEnd": 3389,
          "columnNum": 280
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Noise Buffers (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_NOISE_BUFFERS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3390,
          "offsetEnd": 3402,
          "columnNum": 281
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Noise Buffers (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_NOISE_BUFFERS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3403,
          "offsetEnd": 3415,
          "columnNum": 282
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Noise Buffers (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_NOISE_BUFFERS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3416,
          "offsetEnd": 3428,
          "columnNum": 283
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Read Aloud Items (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_READ_ALOUD_ITEMS_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3429,
          "offsetEnd": 3449,
          "columnNum": 284
        },
        "fieldLength": 21,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Read Aloud Items (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_READ_ALOUD_ITEMS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3450,
          "offsetEnd": 3470,
          "columnNum": 285
        },
        "fieldLength": 21,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Read Aloud Items (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_READ_ALOUD_ITEMS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3471,
          "offsetEnd": 3491,
          "columnNum": 286
        },
        "fieldLength": 21,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Read Aloud Items (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_READ_ALOUD_ITEMS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3492,
          "offsetEnd": 3512,
          "columnNum": 287
        },
        "fieldLength": 21,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Read Aloud in Spanish (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_READ_ALOUD_IN_SPANISH_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3513,
          "offsetEnd": 3537,
          "columnNum": 288
        },
        "fieldLength": 25,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Read Aloud in Spanish (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_READ_ALOUD_IN_SPANISH_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3538,
          "offsetEnd": 3562,
          "columnNum": 289
        },
        "fieldLength": 25,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Science Charts (State Approved) (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_SCIENCE_CHARTS_(STATE_APPROVED)_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3563,
          "offsetEnd": 3575,
          "columnNum": 290
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Scribe Items (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_SCRIBE_ITEMS_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3576,
          "offsetEnd": 3588,
          "columnNum": 291
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Scribe Items (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_SCRIBE_ITEMS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3589,
          "offsetEnd": 3601,
          "columnNum": 292
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Scribe Items (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_SCRIBE_ITEMS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3602,
          "offsetEnd": 3614,
          "columnNum": 293
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Scribe Items (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_SCRIBE_ITEMS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3615,
          "offsetEnd": 3627,
          "columnNum": 294
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Separate Setting (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_SEPARATE_SETTING_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3628,
          "offsetEnd": 3634,
          "columnNum": 295
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Separate Setting (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_SEPARATE_SETTING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3635,
          "offsetEnd": 3641,
          "columnNum": 296
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Separate Setting (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_SEPARATE_SETTING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3642,
          "offsetEnd": 3648,
          "columnNum": 297
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Separate Setting (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_SEPARATE_SETTING_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3649,
          "offsetEnd": 3655,
          "columnNum": 298
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Simplified Test Directions (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_SIMPLIFIED_TEST_DIRECTIONS_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3656,
          "offsetEnd": 3668,
          "columnNum": 299
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Simplified Test Directions (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_SIMPLIFIED_TEST_DIRECTIONS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3669,
          "offsetEnd": 3681,
          "columnNum": 300
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 3 \u2013 Simplified Test Directions (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_3_SIMPLIFIED_TEST_DIRECTIONS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3682,
          "offsetEnd": 3694,
          "columnNum": 301
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 4 \u2013 Simplified Test Directions (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_4_SIMPLIFIED_TEST_DIRECTIONS_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3695,
          "offsetEnd": 3707,
          "columnNum": 302
        },
        "fieldLength": 13,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 1 \u2013 Translated Test Directions (PDF on CAASPP.org) (Online or Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_TRANSLATED_TEST_DIRECTIONS_(PDF_ON_CAASPP.ORG)_(ONLINE_OR_PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3708,
          "offsetEnd": 3722,
          "columnNum": 303
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Support 2 \u2013 Translated Test Directions (PDF on CAASPP.org) (Online)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_TRANSLATED_TEST_DIRECTIONS_(PDF_ON_CAASPP.ORG)_(ONLINE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3723,
          "offsetEnd": 3736,
          "columnNum": 304
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Embedded Designated Supports \u2013 Translations (Glossary) (Paper)",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORTS_TRANSLATIONS_(GLOSSARY)_(PAPER)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3737,
          "offsetEnd": 3775,
          "columnNum": 305
        },
        "fieldLength": 39,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SSR Eligible Current Year Minus 1",
        "otherPossibleNames": [],
        "logicalName": "SSR_ELIGIBLE_CURRENT_YEAR_MINUS_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3776,
          "offsetEnd": 3776,
          "columnNum": 306
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Grade Assessed",
        "otherPossibleNames": [],
        "logicalName": "GRADE_ASSESSED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3777,
          "offsetEnd": 3778,
          "columnNum": 307
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3779,
          "offsetEnd": 3786,
          "columnNum": 308
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error Measurement_SEM Current Year Minus 1",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3787,
          "offsetEnd": 3790,
          "columnNum": 309
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score Current Year Minus 1",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_CURRENT_YEAR_MINUS_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3791,
          "offsetEnd": 3794,
          "columnNum": 310
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Levels Current Year Minus 1",
        "otherPossibleNames": [],
        "logicalName": "ACHIEVEMENT_LEVELS_CURRENT_YEAR_MINUS_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3795,
          "offsetEnd": 3795,
          "columnNum": 311
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Condition Code Current Year Minus 1",
        "otherPossibleNames": [],
        "logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3796,
          "offsetEnd": 3799,
          "columnNum": 312
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3800,
          "offsetEnd": 3802,
          "columnNum": 313
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3803,
          "offsetEnd": 3804,
          "columnNum": 314
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3805,
          "offsetEnd": 3806,
          "columnNum": 315
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3807,
          "offsetEnd": 3808,
          "columnNum": 316
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3809,
          "offsetEnd": 3810,
          "columnNum": 317
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3811,
          "offsetEnd": 3812,
          "columnNum": 318
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3813,
          "offsetEnd": 3814,
          "columnNum": 319
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3815,
          "offsetEnd": 3816,
          "columnNum": 320
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3817,
          "offsetEnd": 3818,
          "columnNum": 321
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3819,
          "offsetEnd": 3820,
          "columnNum": 322
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3821,
          "offsetEnd": 3822,
          "columnNum": 323
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SSR Eligible Current Year Minus 2",
        "otherPossibleNames": [],
        "logicalName": "SSR_ELIGIBLE_CURRENT_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3823,
          "offsetEnd": 3823,
          "columnNum": 324
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Grade Assessed Current Year Minus 2",
        "otherPossibleNames": [],
        "logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3824,
          "offsetEnd": 3825,
          "columnNum": 325
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3826,
          "offsetEnd": 3833,
          "columnNum": 326
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error Measurement_SEM Current Year Minus 2",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3834,
          "offsetEnd": 3837,
          "columnNum": 327
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score Current Year Minus 2",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_CURRENT_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3838,
          "offsetEnd": 3841,
          "columnNum": 328
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Levels Year Minus 2",
        "otherPossibleNames": [],
        "logicalName": "ACHIEVEMENT_LEVELS_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3842,
          "offsetEnd": 3842,
          "columnNum": 329
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Condition Code Current Year Minus 2",
        "otherPossibleNames": [],
        "logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3843,
          "offsetEnd": 3846,
          "columnNum": 330
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
     {
       "physicalName": "Blank",
       "otherPossibleNames": [],
       "logicalName": "BLANK27",
       "formatMask": null,
       "isFieldRequired": "Y",
       "canBeNull": "Y",
       "fieldOffset": {
         "offsetStart": 3847,
         "offsetEnd": 3848,
         "columnNum": 331
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
     {
       "physicalName": "Blank",
       "otherPossibleNames": [],
       "logicalName": "BLANK28",
       "formatMask": null,
       "isFieldRequired": "Y",
       "canBeNull": "Y",
       "fieldOffset": {
         "offsetStart": 3849,
         "offsetEnd": 3850,
         "columnNum": 332
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
    {
       "physicalName": "Blank",
       "otherPossibleNames": [],
       "logicalName": "BLANK29",
       "formatMask": null,
       "isFieldRequired": "Y",
       "canBeNull": "Y",
       "fieldOffset": {
         "offsetStart": 3851,
         "offsetEnd": 3852,
         "columnNum": 333
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
     {
       "physicalName": "Blank",
       "otherPossibleNames": [],
       "logicalName": "BLANK30",
       "formatMask": null,
       "isFieldRequired": "Y",
       "canBeNull": "Y",
       "fieldOffset": {
         "offsetStart": 3853,
         "offsetEnd": 3854,
         "columnNum": 334
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
     {
       "physicalName": "Blank",
       "otherPossibleNames": [],
       "logicalName": "BLANK31",
       "formatMask": null,
       "isFieldRequired": "Y",
       "canBeNull": "Y",
       "fieldOffset": {
         "offsetStart": 3855,
         "offsetEnd": 3856,
         "columnNum": 335
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
     {
       "physicalName": "Blank",
       "otherPossibleNames": [],
       "logicalName": "BLANK32",
       "formatMask": null,
       "isFieldRequired": "Y",
       "canBeNull": "Y",
       "fieldOffset": {
         "offsetStart": 3857,
         "offsetEnd": 3858,
         "columnNum": 336
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
     {
       "physicalName": "Blank",
       "otherPossibleNames": [],
       "logicalName": "BLANK33",
       "formatMask": null,
       "isFieldRequired": "Y",
       "canBeNull": "Y",
       "fieldOffset": {
         "offsetStart": 3859,
         "offsetEnd": 3860,
         "columnNum": 337
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
     {
       "physicalName": "Blank",
       "otherPossibleNames": [],
       "logicalName": "BLANK34",
       "formatMask": null,
       "isFieldRequired": "Y",
       "canBeNull": "Y",
       "fieldOffset": {
         "offsetStart": 3861,
         "offsetEnd": 3862,
         "columnNum": 338
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
     {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK35",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3863,
          "offsetEnd": 3864,
          "columnNum": 339
         },
         "fieldLength": 500,
         "fieldPrecision": null,
         "expectedValues": [],
         "dataTypes": "STRING",
         "scale": null
       },
      {
        "physicalName": "2",
        "otherPossibleNames": [],
        "logicalName": "BLANK36",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 340
         },
         "fieldLength": 500,
         "fieldPrecision": null,
         "expectedValues": [],
         "dataTypes": "STRING",
         "scale": null
       },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK37",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3865,
          "offsetEnd": 3869,
          "columnNum": 341
         },
         "fieldLength": 5,
         "fieldPrecision": null,
         "expectedValues": [],
         "dataTypes": "STRING",
         "scale": null
       },
      {
        "physicalName": "SSR Eligible Minus 3",
        "otherPossibleNames": [],
        "logicalName": "SSR_ELIGIBLE_MINUS_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3870,
          "offsetEnd": 3870,
          "columnNum": 342
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Grade Assessed Current Year Minus 3",
        "otherPossibleNames": [],
        "logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3871,
          "offsetEnd": 3872,
          "columnNum": 343
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK38",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3873,
          "offsetEnd": 3880,
          "columnNum": 344
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard Error Measurement_SEM Current Year Minus 3",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3881,
          "offsetEnd": 3884,
          "columnNum": 345
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale Score Current Year Minus 3",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_CURRENT_YEAR_MINUS_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3885,
          "offsetEnd": 3888,
          "columnNum": 346
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Achievement Levels Year Minus 3",
        "otherPossibleNames": [],
        "logicalName": "ACHIEVEMENT_LEVELS_YEAR_MINUS_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3889,
          "offsetEnd": 3889,
          "columnNum": 347
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Condition Code Current Year Minus 3",
        "otherPossibleNames": [],
        "logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3890,
          "offsetEnd": 3893,
          "columnNum": 348
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK39",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3894,
          "offsetEnd": 3895,
          "columnNum": 349
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK40",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3896,
          "offsetEnd": 3897,
          "columnNum": 350
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK41",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3898,
          "offsetEnd": 3899,
          "columnNum": 351
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK42",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3900,
          "offsetEnd": 3901,
          "columnNum": 352
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK43",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3902,
          "offsetEnd": 3903,
          "columnNum": 353
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK44",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3904,
          "offsetEnd": 3905,
          "columnNum": 354
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK45",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3906,
          "offsetEnd": 3907,
          "columnNum": 355
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK46",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3908,
          "offsetEnd": 3909,
          "columnNum": 356
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK47",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3910,
          "offsetEnd": 3911,
          "columnNum": 357
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK48",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3912,
          "offsetEnd": 3913,
          "columnNum": 358
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK49",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3914,
          "offsetEnd": 3915,
          "columnNum": 359
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK50",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3916,
          "offsetEnd": 3932,
          "columnNum": 360
        },
        "fieldLength": 17,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "UIN (Unique Identification Number)",
        "otherPossibleNames": [],
        "logicalName": "UIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3933,
          "offsetEnd": 3948,
          "columnNum": 361
        },
        "fieldLength": 16,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK51",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3949,
          "offsetEnd": 4008,
          "columnNum": 362
        },
        "fieldLength": 60,
        "fieldPrecision": null,
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
          "offsetStart": 4009,
          "offsetEnd": 4010,
          "columnNum": 363
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  }
}