{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "CAASPP_FW_1415",
    "recordLength": 1323,
    "fields": [
      {
        "physicalName": "RECORD_TYPE",
        "otherPossibleNames": [],
        "logicalName": "RECORD_TYPE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 2,
          "columnNum": 1
        },
        "fieldLength": 2,
        "expectedValues": [
          "01","02","03"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "UIN",
        "otherPossibleNames": [],
        "logicalName": "UIN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 3,
          "offsetEnd": 18,
          "columnNum": 2
        },
        "fieldLength": 16,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STUDENT_LAST_NAME",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 19,
          "offsetEnd": 68,
          "columnNum": 3
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STUDENT_FIRST_NAME",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 69,
          "offsetEnd": 98,
          "columnNum": 4
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STUDENT_MIDDLE_NAME",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_NAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 99,
          "offsetEnd": 128,
          "columnNum": 5
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CONFIRMATION_CODE",
        "otherPossibleNames": [],
        "logicalName": "CONFIRMATION_CODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 129,
          "offsetEnd": 158,
          "columnNum": 6
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STATEWIDE_STUDENT_IDENTIFIER_SSID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_STATE_ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 159,
          "offsetEnd": 168,
          "columnNum": 7
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STUDENT_DOB_YEAR",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_DOB_YEAR",
        "formatMask": "yyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 169,
          "offsetEnd": 172,
          "columnNum": 8
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "STUDENT_DOB_MONTH",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_DOB_MONTH",
        "formatMask": "MM",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 174,
          "offsetEnd": 175,
          "columnNum": 9
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "STUDENT_DOB_DAY",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_DOB_DAY",
        "formatMask": "dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 177,
          "offsetEnd": 178,
          "columnNum": 10
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "GENDER",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_GENDER_CODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 179,
          "offsetEnd": 179,
          "columnNum": 11
        },
        "fieldLength": 1,
        "expectedValues": ["M","F"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEA_NAME_ELA_PT",
        "otherPossibleNames": [],
        "logicalName": "LEA_NAME_ELA_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 185,
          "offsetEnd": 224,
          "columnNum": 12
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "DISTRICT_CODE_ELA_PT",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_CODE_ELA_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 225,
          "offsetEnd": 231,
          "columnNum": 13
        },
        "fieldLength": 7,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_NAME_ELA_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_PT_SCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 232,
          "offsetEnd": 271,
          "columnNum": 14
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_CODE_ELA_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_PT_SCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 272,
          "offsetEnd": 278,
          "columnNum": 15
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_ELA_PT",
        "otherPossibleNames": [],
        "logicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_ELA_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 279,
          "offsetEnd": 280,
          "columnNum": 16
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TEST_COMPLETION_DATE_ELA_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_PT_TESTDATE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 281,
          "offsetEnd": 288,
          "columnNum": 17
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEA_NAME_ELA_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "LEA_NAME_ELA_NON_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 289,
          "offsetEnd": 328,
          "columnNum": 18
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DISTRICT_CODE_ELA_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_CODE_ELA_NON_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 329,
          "offsetEnd": 335,
          "columnNum": 19
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_NAME_ELA_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_NONPT_SCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 336,
          "offsetEnd": 375,
          "columnNum": 20
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_CODE_ELA_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_NONPT_SCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 376,
          "offsetEnd": 382,
          "columnNum": 21
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_ELA_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_ELA_NON_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 383,
          "offsetEnd": 384,
          "columnNum": 22
        },
        "fieldLength": 2,
        "expectedValues": ["DF"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTING_COMPLETION_DATE_ELA_NON_PT ",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_NONPT_TESTDATE ",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 385,
          "offsetEnd": 392,
          "columnNum": 23
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "LEA_NAME_MATHEMATICS_PT",
        "otherPossibleNames": [],
        "logicalName": "LEA_NAME_MATHEMATICS_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 393,
          "offsetEnd":  432,
          "columnNum": 24
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DISTRICT_CODE_MATHEMATICS_PT",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_CODE_MATHEMATICS_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 433,
          "offsetEnd": 439,
          "columnNum": 25
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_NAME_MATHEMATICS_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_PT_SCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 440,
          "offsetEnd": 479,
          "columnNum": 26
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_CODE_MATHEMATICS_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_PT_SCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 480,
          "offsetEnd": 486,
          "columnNum": 27
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_MATHEMATICS_PT",
        "otherPossibleNames": [],
        "logicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_MATHEMATICS_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 487,
          "offsetEnd": 488,
          "columnNum": 28
        },
        "fieldLength": 2,
        "expectedValues": ["DF"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TEST_COMPLETION_DATE_MATHEMATICS_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_PT_TESTDATE",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 489,
          "offsetEnd": 496,
          "columnNum": 29
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "LEA_NAME_MATHEMATICS_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "LEA_NAME_MATHEMATICS_NON_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 497,
          "offsetEnd": 536,
          "columnNum": 30
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "DISTRICT_CODE_MATHEMATICS_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_CODE_MATHEMATICS_NON_PT",
        "formatMask": "yyyyMMdd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 537,
          "offsetEnd": 543,
          "columnNum": 31
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_NAME_MATHEMATICS_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_NONPT_SCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 544,
          "offsetEnd": 583,
          "columnNum": 32
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_CODE_MATHEMATICS_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_NONPT_SCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 584,
          "offsetEnd": 590,
          "columnNum": 33
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_MATHEMATICS_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_MATHEMATICS_NON_PT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 591,
          "offsetEnd": 592,
          "columnNum": 34
        },
        "fieldLength": 2,
        "expectedValues": ["DF"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTING_COMPLETION_DATE_MATHEMATICS_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_NONPT_TESTDATE",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 593,
          "offsetEnd": 600,
          "columnNum": 35
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "LEA_NAME_CST_CMA_CAPA",
        "otherPossibleNames": [],
        "logicalName": "LEA_NAME_CST_CMA_CAPA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 601,
          "offsetEnd": 640,
          "columnNum": 36
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DISTRICT_CODE_CST_CMA_CAPA",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_CODE_CST_CMA_CAPA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 641,
          "offsetEnd": 647,
          "columnNum": 37
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_NAME_CST_CMA_CAPA",
        "otherPossibleNames": [],
        "logicalName": "SCI_SCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 648,
          "offsetEnd": 687,
          "columnNum": 38
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_CODE_CST_CMA_CAPA",
        "otherPossibleNames": [],
        "logicalName": "SCI_SCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 688,
          "offsetEnd": 694,
          "columnNum": 39
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_CST_CMA_CAPA",
        "otherPossibleNames": [],
        "logicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_CST_CMA_CAPA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 695,
          "offsetEnd": 696,
          "columnNum": 40
        },
        "fieldLength": 2,
        "expectedValues": ["DF"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTING_DATE_CST_CMA_CAPA",
        "otherPossibleNames": [],
        "logicalName": "SCI_TESTDATE",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 697,
          "offsetEnd": 704,
          "columnNum": 41
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "LEA_NAME_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "LEA_NAME_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 705,
          "offsetEnd": 744,
          "columnNum": 42
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DISTRICT_CODE_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_CODE_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 745,
          "offsetEnd": 751,
          "columnNum": 43
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_NAME_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "RLA_SCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 752,
          "offsetEnd": 791,
          "columnNum": 44
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_CODE_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "RLA_SCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 792,
          "offsetEnd": 798,
          "columnNum": 45
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 799,
          "offsetEnd": 800,
          "columnNum": 46
        },
        "fieldLength": 2,
        "expectedValues": ["DF"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTING_DATE_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "RLA_TESTDATE",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 801,
          "offsetEnd": 808,
          "columnNum": 47
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ENROLLED_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ENROLLED_GRADE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 809,
          "offsetEnd": 810,
          "columnNum": 48
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GRADE_TESTED_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_GRADE_TESTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 811,
          "offsetEnd": 812,
          "columnNum": 49
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GRADE_TESTED_SMARTER_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_GRADE_TESTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 813,
          "offsetEnd": 814,
          "columnNum": 50
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GRADE_TESTED_CST_CMA_CAPA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "SCI_GRADE_TESTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 815,
          "offsetEnd": 816,
          "columnNum": 51
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GRADE_TESTED_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "RLA_GRADE_TESTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 817,
          "offsetEnd": 818,
          "columnNum": 52
        },
        "fieldLength": 2,
        "expectedValues": ["02","03","04","05","06","07","08","09","10","11"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAPA_LEVEL",
        "otherPossibleNames": [],
        "logicalName": "CAPA_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 819,
          "offsetEnd": 819,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","4","5"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "COUNTY_DISTRICT_OF_RESIDENCE",
        "otherPossibleNames": [],
        "logicalName": "COUNTY_DISTRICT_OF_RESIDENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 820,
          "offsetEnd": 826,
          "columnNum": 54
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DEMOGRAPHIC_INFORMATION_ONLY_TEST_NOT_TAKEN",
        "otherPossibleNames": [],
        "logicalName": "DEMOGRAPHIC_INFORMATION_ONLY_TEST_NOT_TAKEN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 827,
          "offsetEnd": 827,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ABS_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "ABS_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 828,
          "offsetEnd": 828,
          "columnNum": 56
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ABS_CST_CMA_CAPA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "ABS_CST_CMA_CAPA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 829,
          "offsetEnd": 829,
          "columnNum": 57
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "C_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "C_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 830,
          "offsetEnd": 830,
          "columnNum": 58
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "C_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "C_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 831,
          "offsetEnd": 831,
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "C_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "C_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 832,
          "offsetEnd": 832,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NTE_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NTE_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 833,
          "offsetEnd": 833,
          "columnNum": 61
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NTE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NTE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 834,
          "offsetEnd": 834,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NTE_CST_CMA_CAPA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NTE_CST_CMA_CAPA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 835,
          "offsetEnd": 835,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USA_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "USA_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 836,
          "offsetEnd": 836,
          "columnNum": 64
        },
        "fieldLength": 1,
        "expectedValues": ["1","2"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USA_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "USA_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 837,
          "offsetEnd": 837,
          "columnNum": 65
        },
        "fieldLength": 1,
        "expectedValues": ["1","2"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USA_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "USA_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 838,
          "offsetEnd": 838,
          "columnNum": 66
        },
        "fieldLength": 1,
        "expectedValues": ["1","2"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PGE_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "PGE_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 839,
          "offsetEnd": 839,
          "columnNum": 67
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PGE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "PGE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 840,
          "offsetEnd": 840,
          "columnNum": 68
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PGE_CST_CMA_CAPA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "PGE_CST_CMA_CAPA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 841,
          "offsetEnd": 841,
          "columnNum": 69
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "T_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "T_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 842,
          "offsetEnd": 842,
          "columnNum": 70
        },
        "fieldLength": 1,
        "expectedValues": ["Y","N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "T_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "T_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 843,
          "offsetEnd": 843,
          "columnNum": 71
        },
        "fieldLength": 1,
        "expectedValues": ["Y","N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "T_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "T_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 844,
          "offsetEnd": 844,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INC_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "INC_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 845,
          "offsetEnd": 845,
          "columnNum": 73
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INC_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "INC_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 846,
          "offsetEnd": 846,
          "columnNum": 74
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LOSS_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "LOSS_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 847,
          "offsetEnd": 847,
          "columnNum": 75
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LOSS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "LOSS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 848,
          "offsetEnd": 848,
          "columnNum": 76
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NE_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NE_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 849,
          "offsetEnd": 849,
          "columnNum": 77
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PP_SECTION_504_STATUS",
        "otherPossibleNames": [],
        "logicalName": "PP_SECTION_504_STATUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 850,
          "offsetEnd": 852,
          "columnNum": 78
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PP_IDEA_INDICATOR",
        "otherPossibleNames": [],
        "logicalName": "PP_IDEA_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 853,
          "offsetEnd": 855,
          "columnNum": 79
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_AMERICAN_SIGN_LANGUAGE_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_AMERICAN_SIGN_LANGUAGE_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 856,
          "offsetEnd": 856,
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_AMERICAN_SIGN_LANGUAGE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_AMERICAN_SIGN_LANGUAGE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 857,
          "offsetEnd": 857,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_BRAILLE_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_BRAILLE_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 858,
          "offsetEnd": 858,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_BRAILLE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_BRAILLE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 859,
          "offsetEnd": 859,
          "columnNum": 83
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_CLOSED_CAPTIONING_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_CLOSED_CAPTIONING_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 860,
          "offsetEnd": 860,
          "columnNum": 84
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_COLOR_CONTRAST_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_COLOR_CONTRAST_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 861,
          "offsetEnd": 862,
          "columnNum": 85
        },
        "fieldLength": 2,
        "expectedValues": ["D1","D2","D3","D4","D5"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_COLOR_CONTRAST_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_COLOR_CONTRAST_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 863,
          "offsetEnd": 864,
          "columnNum": 86
        },
        "fieldLength": 2,
        "expectedValues": ["D1","D2","D3","D4","D5"],
        "dataTypes": "STRING",
        "scale": null
      },

      {
        "physicalName": "ES_MASKING_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_MASKING_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 865,
          "offsetEnd": 865,
          "columnNum": 87
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_MASKING_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_MASKING_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 866,
          "offsetEnd": 866,
          "columnNum": 88
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_PERMISSIVE_MODE_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_PERMISSIVE_MODE_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 867,
          "offsetEnd": 867,
          "columnNum": 89
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_PERMISSIVE_MODE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_PERMISSIVE_MODE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 868,
          "offsetEnd": 868,
          "columnNum": 90
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_STREAMLINING_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_STREAMLINING_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 869,
          "offsetEnd": 869,
          "columnNum": 91
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_STREAMLINING_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_STREAMLINING_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 870,
          "offsetEnd": 870,
          "columnNum": 92
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_TEXT_TO_SPEECH_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_TEXT_TO_SPEECH_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 871,
          "offsetEnd": 872,
          "columnNum": 93
        },
        "fieldLength": 2,
        "expectedValues": ["D1","D2","D3","A1","A2","A3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_TEXT_TO_SPEECH_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_TEXT_TO_SPEECH_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 873,
          "offsetEnd": 874,
          "columnNum": 94
        },
        "fieldLength": 2,
        "expectedValues": ["D1","D2","D3","A1","A2","A3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_TRANSLATED_TEST_DIRECTIONS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_TRANSLATED_TEST_DIRECTIONS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 875,
          "offsetEnd": 875,
          "columnNum": 95
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_TRANSLATIONS_GLOSSARY_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_TRANSLATIONS_GLOSSARY_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 876,
          "offsetEnd": 878,
          "columnNum": 96
        },
        "fieldLength": 3,
        "expectedValues": ["D01","D02","D03","D04","D05","D06","D07","D08","D09","D10","D11","D12","D13","D14","D15","D16","D17","D18","D19","D20","D21","D22"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_TRANSLATIONS_STACKED_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_TRANSLATIONS_STACKED_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 879,
          "offsetEnd": 880,
          "columnNum": 97
        },
        "fieldLength": 2,
        "expectedValues": ["D1","D2","D3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_TURN_OFF_ANY_UNIVERSAL_TOOL_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "ES_TURN_OFF_ANY_UNIVERSAL_TOOL_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 881,
          "offsetEnd": 881,
          "columnNum": 98
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ES_TURN_OFF_ANY_UNIVERSAL_TOOL_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "ES_TURN_OFF_ANY_UNIVERSAL_TOOL_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 882,
          "offsetEnd": 882,
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ADMINISTRATION_MOST_BENEFICIAL_TIME_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_ADMINISTRATION_MOST_BENEFICIAL_TIME_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 883,
          "offsetEnd": 883,
          "columnNum": 100
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ADMINISTRATION_MOST_BENEFICIAL_TIME_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_ADMINISTRATION_MOST_BENEFICIAL_TIME_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 884,
          "offsetEnd": 884,
          "columnNum": 101
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ADMINISTRATION_MOST_BENEFICIAL_TIME_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_ADMINISTRATION_MOST_BENEFICIAL_TIME_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 885,
          "offsetEnd": 885,
          "columnNum": 102
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ADMINISTRATION_MOST_BENEFICIAL_TIME_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_ADMINISTRATION_MOST_BENEFICIAL_TIME_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 886,
          "offsetEnd": 886,
          "columnNum": 103
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ABACUS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_ABACUS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 887,
          "offsetEnd": 887,
          "columnNum": 104
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ABACUS_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_ABACUS_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 888,
          "offsetEnd": 888,
          "columnNum": 105
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ALTERNATE_RESPONSE_OPTIONS_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_ALTERNATE_RESPONSE_OPTIONS_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 889,
          "offsetEnd": 889,
          "columnNum": 106
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ALTERNATE_RESPONSE_OPTIONS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_ALTERNATE_RESPONSE_OPTIONS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 890,
          "offsetEnd": 890,
          "columnNum": 107
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_AMERICAN_SIGN_LANGUAGE_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_AMERICAN_SIGN_LANGUAGE_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 891,
          "offsetEnd": 891,
          "columnNum": 108
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_AMERICAN_SIGN_LANGUAGE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_AMERICAN_SIGN_LANGUAGE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 892,
          "offsetEnd": 892,
          "columnNum": 109
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_AMERICAN_SIGN_LANGUAGE_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_AMERICAN_SIGN_LANGUAGE_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 893,
          "offsetEnd": 893,
          "columnNum": 110
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_AMERICAN_SIGN_LANGUAGE_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_AMERICAN_SIGN_LANGUAGE_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 894,
          "offsetEnd": 894,
          "columnNum": 111
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_BILINGUAL_DICTIONARY_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_BILINGUAL_DICTIONARY_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 895,
          "offsetEnd": 895,
          "columnNum": 112
        },
        "fieldLength": 1,
        "expectedValues": ["D","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_BILINGUAL_DICTIONARY_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_BILINGUAL_DICTIONARY_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 896,
          "offsetEnd": 896,
          "columnNum": 113
        },
        "fieldLength": 1,
        "expectedValues": ["D","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_BILINGUAL_DICTIONARY_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_BILINGUAL_DICTIONARY_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 897,
          "offsetEnd": 897,
          "columnNum": 114
        },
        "fieldLength": 1,
        "expectedValues": ["D","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_BILINGUAL_DICTIONARY_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_BILINGUAL_DICTIONARY_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 898,
          "offsetEnd": 898,
          "columnNum": 115
        },
        "fieldLength": 1,
        "expectedValues": ["D","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_BRAILLE_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_BRAILLE_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 899,
          "offsetEnd": 899,
          "columnNum": 116
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_BRAILLE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_BRAILLE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 900,
          "offsetEnd": 900,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_BRAILLE_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_BRAILLE_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 901,
          "offsetEnd": 901,
          "columnNum": 118
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_BRAILLE_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_BRAILLE_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 902,
          "offsetEnd": 902,
          "columnNum": 119
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_CALCULATOR_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_CALCULATOR_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 903,
          "offsetEnd": 903,
          "columnNum": 120
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_CALCULATOR_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_CALCULATOR_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 904,
          "offsetEnd": 904,
          "columnNum": 121
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_COLOR_CONTRAST_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_COLOR_CONTRAST_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 905,
          "offsetEnd": 905,
          "columnNum": 122
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_COLOR_CONTRAST_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_COLOR_CONTRAST_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 906,
          "offsetEnd": 906,
          "columnNum": 123
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_COLOR_OVERLAY",
        "otherPossibleNames": [],
        "logicalName": "NES_COLOR_OVERLAY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 907,
          "offsetEnd": 907,
          "columnNum": 124
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_COLOR_OVERLAY",
        "otherPossibleNames": [],
        "logicalName": "NES_COLOR_OVERLAY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 908,
          "offsetEnd": 908,
          "columnNum": 125
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ENGLISH_DICTIONARY_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_ENGLISH_DICTIONARY_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 909,
          "offsetEnd": 909,
          "columnNum": 126
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ENGLISH_DICTIONARY_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_ENGLISH_DICTIONARY_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 910,
          "offsetEnd": 910,
          "columnNum": 127
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ENGLISH_DICTIONARY_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_ENGLISH_DICTIONARY_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 911,
          "offsetEnd": 911,
          "columnNum": 128
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_ENGLISH_DICTIONARY_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_ENGLISH_DICTIONARY_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 912,
          "offsetEnd": 912,
          "columnNum": 129
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_INDIVIDUALIZED_AID_NON_SPECIFIC_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_INDIVIDUALIZED_AID_NON_SPECIFIC_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 913,
          "offsetEnd": 913,
          "columnNum": 130
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_INDIVIDUALIZED_AID_NON_SPECIFIC_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_INDIVIDUALIZED_AID_NON_SPECIFIC_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 914,
          "offsetEnd": 914,
          "columnNum": 131
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_INDIVIDUALIZED_AID_NON_SPECIFIC_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_INDIVIDUALIZED_AID_NON_SPECIFIC_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 915,
          "offsetEnd": 915,
          "columnNum": 132
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_INDIVIDUALIZED_AID_NON_SPECIFIC_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_INDIVIDUALIZED_AID_NON_SPECIFIC_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 916,
          "offsetEnd": 916,
          "columnNum": 133
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_LARGE_PRINT_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_LARGE_PRINT_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 917,
          "offsetEnd": 917,
          "columnNum": 134
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_LARGE_PRINT_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_LARGE_PRINT_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 918,
          "offsetEnd": 918,
          "columnNum": 135
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_LARGE_PRINT_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_LARGE_PRINT_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 919,
          "offsetEnd": 919,
          "columnNum": 136
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_LARGE_PRINT_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_LARGE_PRINT_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 920,
          "offsetEnd": 920,
          "columnNum": 137
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_MAGNIFICATION_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_MAGNIFICATION_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 921,
          "offsetEnd": 921,
          "columnNum": 138
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_MAGNIFICATION_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_MAGNIFICATION_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 922,
          "offsetEnd": 922,
          "columnNum": 139
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_MAGNIFICATION_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_MAGNIFICATION_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 923,
          "offsetEnd": 923,
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_MAGNIFICATION_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_MAGNIFICATION_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 924,
          "offsetEnd": 924,
          "columnNum": 141
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_MATH_TOOLS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_MATH_TOOLS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 925,
          "offsetEnd": 925,
          "columnNum": 142
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_MULTIPLICATION_TABLE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_MULTIPLICATION_TABLE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 926,
          "offsetEnd": 926,
          "columnNum": 143
        },
        "fieldLength": 1,
        "expectedValues": ["A","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_NOISE_BUFFERS_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_NOISE_BUFFERS_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 927,
          "offsetEnd": 927,
          "columnNum": 144
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_NOISE_BUFFERS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_NOISE_BUFFERS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 928,
          "offsetEnd": 928,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_NOISE_BUFFERS_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_NOISE_BUFFERS_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 929,
          "offsetEnd": 929,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_NOISE_BUFFERS_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_NOISE_BUFFERS_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 930,
          "offsetEnd": 930,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_PRINT_ON_DEMAND_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_PRINT_ON_DEMAND_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 931,
          "offsetEnd": 932,
          "columnNum": 148
        },
        "fieldLength": 2,
        "expectedValues": ["A1","A2","A3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_PRINT_ON_DEMAND_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_PRINT_ON_DEMAND_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 933,
          "offsetEnd": 934,
          "columnNum": 149
        },
        "fieldLength": 2,
        "expectedValues": ["A1","A2","A3"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_READ_ALOUD_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_READ_ALOUD_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 935,
          "offsetEnd": 935,
          "columnNum": 150
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_READ_ALOUD_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_READ_ALOUD_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 936,
          "offsetEnd": 936,
          "columnNum": 151
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_READ_ALOUD_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_READ_ALOUD_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 937,
          "offsetEnd": 937,
          "columnNum": 152
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_READ_ALOUD_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_READ_ALOUD_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 938,
          "offsetEnd": 938,
          "columnNum": 153
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "NES_SCRIBE_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_SCRIBE_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 939,
          "offsetEnd": 939,
          "columnNum": 154
        },
        "fieldLength": 1,
        "expectedValues": ["D","A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SCRIBE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_SCRIBE_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 940,
          "offsetEnd": 940,
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": ["D","A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SCRIBE_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_SCRIBE_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 941,
          "offsetEnd": 941,
          "columnNum": 156
        },
        "fieldLength": 1,
        "expectedValues": ["D","A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SCRIBE_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_SCRIBE_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 942,
          "offsetEnd": 942,
          "columnNum": 157
        },
        "fieldLength": 1,
        "expectedValues": ["D","A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SEPARATE_SETTING_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_SEPARATE_SETTING_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 943,
          "offsetEnd": 943,
          "columnNum": 158
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SEPARATE_SETTING_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_SEPARATE_SETTING_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 944,
          "offsetEnd": 944,
          "columnNum": 159
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SEPARATE_SETTING_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_SEPARATE_SETTING_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 945,
          "offsetEnd": 945,
          "columnNum": 160
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SEPARATE_SETTING_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_SEPARATE_SETTING_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 946,
          "offsetEnd": 946,
          "columnNum": 161
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SPECIAL_LIGHTING_OR_ACOUSTICS_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_SPECIAL_LIGHTING_OR_ACOUSTICS_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 947,
          "offsetEnd": 947,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SPECIAL_LIGHTING_OR_ACOUSTICS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_SPECIAL_LIGHTING_OR_ACOUSTICS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 948,
          "offsetEnd": 948,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SPECIAL_LIGHTING_OR_ACOUSTICS_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_SPECIAL_LIGHTING_OR_ACOUSTICS_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 949,
          "offsetEnd": 949,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SPECIAL_LIGHTING_OR_ACOUSTICS_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_SPECIAL_LIGHTING_OR_ACOUSTICS_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 950,
          "offsetEnd": 950,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": ["D"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SPEECH_TO_TEXT_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_SPEECH_TO_TEXT_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 951,
          "offsetEnd": 951,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SPEECH_TO_TEXT_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_SPEECH_TO_TEXT_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 952,
          "offsetEnd": 952,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SPEECH_TO_TEXT_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_SPEECH_TO_TEXT_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 953,
          "offsetEnd": 953,
          "columnNum": 168
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_SPEECH_TO_TEXT_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_SPEECH_TO_TEXT_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 954,
          "offsetEnd": 954,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": ["A"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_THESAURUS_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_THESAURUS_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 955,
          "offsetEnd": 955,
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_THESAURUS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_THESAURUS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 956,
          "offsetEnd": 956,
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_THESAURUS_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_THESAURUS_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 957,
          "offsetEnd": 957,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_THESAURUS_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_THESAURUS_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 958,
          "offsetEnd": 958,
          "columnNum": 173
        },
        "fieldLength": 1,
        "expectedValues": ["I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_TRANSLATED_TEST_DIRECTIONS_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_TRANSLATED_TEST_DIRECTIONS_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 959,
          "offsetEnd": 959,
          "columnNum": 174
        },
        "fieldLength": 1,
        "expectedValues": ["D","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_TRANSLATED_TEST_DIRECTIONS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_TRANSLATED_TEST_DIRECTIONS_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 960,
          "offsetEnd": 960,
          "columnNum": 175
        },
        "fieldLength": 1,
        "expectedValues": ["D","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_TRANSLATED_TEST_DIRECTIONS_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_TRANSLATED_TEST_DIRECTIONS_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 961,
          "offsetEnd": 961,
          "columnNum": 176
        },
        "fieldLength": 1,
        "expectedValues": ["D","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_TRANSLATED_TEST_DIRECTIONS_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_TRANSLATED_TEST_DIRECTIONS_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 962,
          "offsetEnd": 962,
          "columnNum": 177
        },
        "fieldLength": 1,
        "expectedValues": ["D","I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_TRANSLATIONS_GLOSSARY_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "NES_TRANSLATIONS_GLOSSARY_SMARTER_BALANCED_FOR_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 963,
          "offsetEnd": 965,
          "columnNum": 178
        },
        "fieldLength": 3,
        "expectedValues": ["D01","D02","D03","D04","D05","D06","D07","D08","D09","D10","D11","D12","I01","I02","I03","I04","I05","I06","I07","I08","I09","I10","I11","I12"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_TRANSLATIONS_GLOSSARY_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "NES_TRANSLATIONS_GLOSSARY_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 966,
          "offsetEnd": 968,
          "columnNum": 179
        },
        "fieldLength": 3,
        "expectedValues": ["D01","D02","D03","D04","D05","D06","D07","D08","D09","D10","D11","D12","I01","I02","I03","I04","I05","I06","I07","I08","I09","I10","I11","I12"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_TRANSLATIONS_GLOSSARY_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "NES_TRANSLATIONS_GLOSSARY_CST_CMA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 969,
          "offsetEnd": 971,
          "columnNum": 180
        },
        "fieldLength": 3,
        "expectedValues": ["D01","D02","D03","D04","D05","D06","D07","D08","D09","D10","D11","D12","I01","I02","I03","I04","I05","I06","I07","I08","I09","I10","I11","I12"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NES_TRANSLATIONS_GLOSSARY_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "NES_TRANSLATIONS_GLOSSARY_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 972,
          "offsetEnd": 974,
          "columnNum": 181
        },
        "fieldLength": 3,
        "expectedValues": ["D01","D02","D03","D04","D05","D06","D07","D08","D09","D10","D11","D12","I01","I02","I03","I04","I05","I06","I07","I08","I09","I10","I11","I12"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ADULT_TESTING_IRREGULARITIES_COLUMN_1",
        "otherPossibleNames": [],
        "logicalName": "ADULT_TESTING_IRREGULARITIES_COLUMN_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 975,
          "offsetEnd": 975,
          "columnNum": 182
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ADULT_TESTING_IRREGULARITIES_COLUMN_2",
        "otherPossibleNames": [],
        "logicalName": "ADULT_TESTING_IRREGULARITIES_COLUMN_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 976,
          "offsetEnd": 976,
          "columnNum": 183
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ADULT_TESTING_IRREGULARITIES_COLUMN_3",
        "otherPossibleNames": [],
        "logicalName": "ADULT_TESTING_IRREGULARITIES_COLUMN_3",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 977,
          "offsetEnd": 977,
          "columnNum": 184
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ADULT_TESTING_IRREGULARITIES_COLUMN_4",
        "otherPossibleNames": [],
        "logicalName": "ADULT_TESTING_IRREGULARITIES_COLUMN_4",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 978,
          "offsetEnd": 978,
          "columnNum": 185
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INAPPROPRIATE_TEST_PREPARATION_COLUMN_1",
        "otherPossibleNames": [],
        "logicalName": "INAPPROPRIATE_TEST_PREPARATION_COLUMN_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 979,
          "offsetEnd": 979,
          "columnNum": 186
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INAPPROPRIATE_TEST_PREPARATION_COLUMN_2",
        "otherPossibleNames": [],
        "logicalName": "INAPPROPRIATE_TEST_PREPARATION_COLUMN_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 980,
          "offsetEnd": 980,
          "columnNum": 187
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INAPPROPRIATE_TEST_PREPARATION_COLUMN_3",
        "otherPossibleNames": [],
        "logicalName": "INAPPROPRIATE_TEST_PREPARATION_COLUMN_3",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 981,
          "offsetEnd": 981,
          "columnNum": 188
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INAPPROPRIATE_TEST_PREPARATION_COLUMN_4",
        "otherPossibleNames": [],
        "logicalName": "INAPPROPRIATE_TEST_PREPARATION_COLUMN_4",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 982,
          "offsetEnd": 982,
          "columnNum": 189
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ENGLISH_LANGUAGE_PROFICIENCY_LEVEL",
        "otherPossibleNames": [],
        "logicalName": "ENGLISH_LANGUAGE_PROFICIENCY_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 983,
          "offsetEnd": 1014,
          "columnNum": 190
        },
        "fieldLength": 32,
        "expectedValues": ["Advanced                        ",
                           "Beginning                       ",
                           "Early Advanced                  ",
                           "Early Intermediate              ",
                           "Intermediate                    "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MIGRANT_STATUS",
        "otherPossibleNames": [],
        "logicalName": "MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1015,
          "offsetEnd": 1017,
          "columnNum": 191
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP_LIMITED_ENGLISH_PROFICIENT_STATUS",
        "otherPossibleNames": [],
        "logicalName": "LEP_STATUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1018,
          "offsetEnd": 1020,
          "columnNum": 192
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP_ENTRY_DATE",
        "otherPossibleNames": [],
        "logicalName": "LEP_ENTRY_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1021,
          "offsetEnd": 1030,
          "columnNum": 193
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "LEP_EXIT_DATE",
        "otherPossibleNames": [],
        "logicalName": "LEP_EXIT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1031,
          "offsetEnd": 1040,
          "columnNum": 194
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "FIRST_DATE_IN_US_SCHOOL",
        "otherPossibleNames": [],
        "logicalName": "FIRST_DATE_IN_US_SCHOOL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1041,
          "offsetEnd": 1050,
          "columnNum": 195
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
        "otherPossibleNames": [],
        "logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1051,
          "offsetEnd": 1054,
          "columnNum": 196
        },
        "fieldLength": 4,
        "expectedValues": ["EO  ","IFEP","EL  ","RFEP","TBD "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LANGUAGE_CODE",
        "otherPossibleNames": [],
        "logicalName": "LANGUAGE_CODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1055,
          "offsetEnd": 1057,
          "columnNum": 197
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ECONOMIC_DISADVANTAGE_STATUS",
        "otherPossibleNames": [],
        "logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1058,
          "offsetEnd": 1060,
          "columnNum": 198
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PRIMARY_DISABILITY_TYPE",
        "otherPossibleNames": [],
        "logicalName": "PRIMARY_DISABILITY_TYPE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1061,
          "offsetEnd": 1063,
          "columnNum": 199
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NON_PUBLIC_NON_SECTARIAN_NPS_SCHOOL_CODE",
        "otherPossibleNames": [],
        "logicalName": "NON_PUBLIC_NON_SECTARIAN_NPS_SCHOOL_CODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1064,
          "offsetEnd": 1070,
          "columnNum": 200
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "HISPANIC_OR_LATINO",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC_OR_LATINO",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1071,
          "offsetEnd": 1073,
          "columnNum": 201
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
        "otherPossibleNames": [],
        "logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1074,
          "offsetEnd": 1076,
          "columnNum": 202
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ASIAN",
        "otherPossibleNames": [],
        "logicalName": "ASIAN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1077,
          "offsetEnd": 1079,
          "columnNum": 203
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1080,
          "offsetEnd": 1082,
          "columnNum": 204
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILIPINO",
        "otherPossibleNames": [],
        "logicalName": "FILIPINO",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1083,
          "offsetEnd": 1085,
          "columnNum": 205
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLACK_OR_AFRICAN_AMERICAN",
        "otherPossibleNames": [],
        "logicalName": "BLACK_OR_AFRICAN_AMERICAN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1086,
          "offsetEnd": 1088,
          "columnNum": 206
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WHITE",
        "otherPossibleNames": [],
        "logicalName": "WHITE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1089,
          "offsetEnd": 1091,
          "columnNum": 207
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TWO_OR_MORE_RACES",
        "otherPossibleNames": [],
        "logicalName": "TWO_OR_MORE_RACES",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1092,
          "offsetEnd": 1094,
          "columnNum": 208
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "REPORTING_ETHNICITY",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_ETHNICITY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1095,
          "offsetEnd": 1097,
          "columnNum": 209
        },
        "fieldLength": 3,
        "expectedValues": ["100","200","600","400","500","300","700","800"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PARENT_EDUCATION_LEVEL",
        "otherPossibleNames": [],
        "logicalName": "PARENT_EDUCATION_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1098,
          "offsetEnd": 1099,
          "columnNum": 210
        },
        "fieldLength": 2,
        "expectedValues": ["10","11","12","13","14","15"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NUMBER_ITEMS_ATTEMPTED_SMARTER_ELA_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_PT_ITEMS_ATTEMPTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1100,
          "offsetEnd": 1101,
          "columnNum": 211
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
                          ,"10","11","12","13","14","15","16","17","18","19"
                          ,"20","21","22","23","24","25","26","27","28","29"
                          ,"30","31","32","33","34","35","36","37","38","39"
                          ,"40","41","42","43","44","45","46","47","48","49"
                          ,"50","51","52","53","54","55","56","57","58","59"
                          ,"60","61","62","63","64","65","66","67","68","69"
                          ,"70","71","72","73","74","75","76","77","78","79"
                          ,"80","81","82","83","84","85","86","87","88","89"
                          ,"90","91","92","93","94","95","96","97","98","99"],

        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NUMBER_ITEMS_ATTEMPTED_SMARTER_ELA_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_NONPT_ITEMS_ATTEMPTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1102,
          "offsetEnd": 1103,
          "columnNum": 212
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
                          ,"10","11","12","13","14","15","16","17","18","19"
                          ,"20","21","22","23","24","25","26","27","28","29"
                          ,"30","31","32","33","34","35","36","37","38","39"
                          ,"40","41","42","43","44","45","46","47","48","49"
                          ,"50","51","52","53","54","55","56","57","58","59"
                          ,"60","61","62","63","64","65","66","67","68","69"
                          ,"70","71","72","73","74","75","76","77","78","79"
                          ,"80","81","82","83","84","85","86","87","88","89"
                          ,"90","91","92","93","94","95","96","97","98","99"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NUMBER_ITEMS_ATTEMPTED_SMARTER_MATHEMATICS_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_PT_ITEMS_ATTEMPTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1104,
          "offsetEnd": 1105,
          "columnNum": 213
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
                          ,"10","11","12","13","14","15","16","17","18","19"
                          ,"20","21","22","23","24","25","26","27","28","29"
                          ,"30","31","32","33","34","35","36","37","38","39"
                          ,"40","41","42","43","44","45","46","47","48","49"
                          ,"50","51","52","53","54","55","56","57","58","59"
                          ,"60","61","62","63","64","65","66","67","68","69"
                          ,"70","71","72","73","74","75","76","77","78","79"
                          ,"80","81","82","83","84","85","86","87","88","89"
                          ,"90","91","92","93","94","95","96","97","98","99"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NUMBER_ITEMS_ATTEMPTED_SMARTER_MATHEMATICS_NON_PT",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_NONPT_ITEMS_ATTEMPTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1106,
          "offsetEnd": 1107,
          "columnNum": 214
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
                          ,"10","11","12","13","14","15","16","17","18","19"
                          ,"20","21","22","23","24","25","26","27","28","29"
                          ,"30","31","32","33","34","35","36","37","38","39"
                          ,"40","41","42","43","44","45","46","47","48","49"
                          ,"50","51","52","53","54","55","56","57","58","59"
                          ,"60","61","62","63","64","65","66","67","68","69"
                          ,"70","71","72","73","74","75","76","77","78","79"
                          ,"80","81","82","83","84","85","86","87","88","89"
                          ,"90","91","92","93","94","95","96","97","98","99"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NUMBER_ITEMS_ATTEMPTED_CST_CMA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "SCI_ITEMS_ATTEMPTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1108,
          "offsetEnd": 1109,
          "columnNum": 215
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
                          ,"10","11","12","13","14","15","16","17","18","19"
                          ,"20","21","22","23","24","25","26","27","28","29"
                          ,"30","31","32","33","34","35","36","37","38","39"
                          ,"40","41","42","43","44","45","46","47","48","49"
                          ,"50","51","52","53","54","55","56","57","58","59"
                          ,"60","61","62","63","64","65","66","67","68","69"
                          ,"70","71","72","73","74","75","76","77","78","79"
                          ,"80","81","82","83","84","85","86","87","88","89"
                          ,"90","91","92","93","94","95","96","97","98","99"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NUMBER_ITEMS_ATTEMPTED_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "RLA_ITEMS_ATTEMPTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1110,
          "offsetEnd": 1111,
          "columnNum": 216
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
                          ,"10","11","12","13","14","15","16","17","18","19"
                          ,"20","21","22","23","24","25","26","27","28","29"
                          ,"30","31","32","33","34","35","36","37","38","39"
                          ,"40","41","42","43","44","45","46","47","48","49"
                          ,"50","51","52","53","54","55","56","57","58","59"
                          ,"60","61","62","63","64","65","66","67","68","69"
                          ,"70","71","72","73","74","75","76","77","78","79"
                          ,"80","81","82","83","84","85","86","87","88","89"
                          ,"90","91","92","93","94","95","96","97","98","99"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_ATTEMPTEDNESS_FLAG_SMARTER_ELA",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_ATTEMPTEDNESS_FLAG_SMARTER_ELA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1112,
          "offsetEnd": 1112,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": ["N","P","Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_ATTEMPTEDNESS_FLAG_SMARTER_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_ATTEMPTEDNESS_FLAG_SMARTER_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1113,
          "offsetEnd": 1113,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": ["N","P","Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_INVALIDATED_STATUS_FLAG_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_INVALID_STATUS_FLAG",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1114,
          "offsetEnd": 1114,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_INVALIDATED_STATUS_FLAG_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_INVALID_STATUS_FLAG",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1115,
          "offsetEnd": 1115,
          "columnNum": 220
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_TEST_DELIVERY_TYPE_SMARTER_BALANCED_FOR_ELA_CAT_OR_PAPER",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_TEST_DELIVERY_TYPE_SMARTER_BALANCED_FOR_ELA_CAT_OR_PAPER",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1116,
          "offsetEnd": 1116,
          "columnNum": 221
        },
        "fieldLength": 1,
        "expectedValues": ["C","P"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_TEST_DELIVERY_TYPE_SMARTER_BALANCED_FOR_MATHEMATICS_CAT_OR_PAPER",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_TEST_DELIVERY_TYPE_SMARTER_BALANCED_FOR_MATHEMATICS_CAT_OR_PAPER",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1117,
          "offsetEnd": 1117,
          "columnNum": 222
        },
        "fieldLength": 1,
        "expectedValues": ["C","P"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_TEST_RESULTS_REPORTED_CST_OR_CMA_SCIENCE_TEST_RESULTS_REPORTED",
        "otherPossibleNames": [],
        "logicalName": "SCI_RESULTSREPORTED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1118,
          "offsetEnd": 1118,
          "columnNum": 223
        },
        "fieldLength": 1,
        "expectedValues": ["1","2"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INCLUDE_INDICATOR_FOR_AGGREGATE_REPORTING_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_INDICATOR_FOR_AGGREGATE_REPORTING_SMARTER_BALANCED_FOR_ELA_STS_FOR_RLA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1119,
          "offsetEnd": 1119,
          "columnNum": 224
        },
        "fieldLength": 1,
        "expectedValues": ["Y","R","T","N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INCLUDE_INDICATOR_FOR_AGGREGATE_REPORTING_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_INDICATOR_FOR_AGGREGATE_REPORTING_SMARTER_BALANCED_FOR_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1120,
          "offsetEnd": 1120,
          "columnNum": 225
        },
        "fieldLength": 1,
        "expectedValues": ["Y","R","T","N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INCLUDE_INDICATOR_FOR_AGGREGATE_REPORTING_CST_CMA_CAPA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_INDICATOR_FOR_AGGREGATE_REPORTING_CST_CMA_CAPA_FOR_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1121,
          "offsetEnd": 1121,
          "columnNum": 226
        },
        "fieldLength": 1,
        "expectedValues": ["Y","R","T","N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER1",
        "otherPossibleNames": [],
        "logicalName": "FILLER1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "n",
        "fieldOffset": {
          "offsetStart": 1122,
          "offsetEnd": 1129,
          "columnNum": 227
        },
        "fieldLength": 8,
        "expectedValues": ["        "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER2",
        "otherPossibleNames": [],
        "logicalName": "FILLER2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "n",
        "fieldOffset": {
          "offsetStart": 1130,
          "offsetEnd": 1137,
          "columnNum": 228
        },
        "fieldLength": 8,
        "expectedValues": ["        "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORES_CST_CMA_CAPA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "SCI_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1138,
          "offsetEnd": 1139,
          "columnNum": 229
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
                          ,"10","11","12","13","14","15","16","17","18","19"
                          ,"20","21","22","23","24","25","26","27","28","29"
                          ,"30","31","32","33","34","35","36","37","38","39"
                          ,"40","41","42","43","44","45","46","47","48","49"
                          ,"50","51","52","53","54","55","56","57","58","59"
                          ,"60","61","62","63","64","65","66","67","68","69"
                          ,"70","71","72","73","74","75","76","77","78","79"
                          ,"80","81","82","83","84","85","86","87","88","89"
                          ,"90","91","92","93","94","95","96","97","98","99"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORES_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "RLA_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1140,
          "offsetEnd": 1141,
          "columnNum": 230
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
                          ,"10","11","12","13","14","15","16","17","18","19"
                          ,"20","21","22","23","24","25","26","27","28","29"
                          ,"30","31","32","33","34","35","36","37","38","39"
                          ,"40","41","42","43","44","45","46","47","48","49"
                          ,"50","51","52","53","54","55","56","57","58","59"
                          ,"60","61","62","63","64","65","66","67","68","69"
                          ,"70","71","72","73","74","75","76","77","78","79"
                          ,"80","81","82","83","84","85","86","87","88","89"
                          ,"90","91","92","93","94","95","96","97","98","99"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_FOR_ELA_CLAIM_PERFORMANCE_LEVEL_READING",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_FOR_ELA_CLAIM_PERFORMANCE_LEVEL_READING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1142,
          "offsetEnd": 1142,
          "columnNum": 231
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_FOR_ELA_CLAIM_PERFORMANCE_LEVEL_WRITING",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_FOR_ELA_CLAIM_PERFORMANCE_LEVEL_WRITING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1143,
          "offsetEnd": 1143,
          "columnNum": 232
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_FOR_ELA_CLAIM_PERFORMANCE_LEVEL_LISTENING",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_FOR_ELA_CLAIM_PERFORMANCE_LEVEL_LISTENING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1144,
          "offsetEnd": 1144,
          "columnNum": 233
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_FOR_ELA_CLAIM_PERFORMANCE_LEVEL_RESEARCH_INQUIRY",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_FOR_ELA_CLAIM_PERFORMANCE_LEVEL_RESEARCH_INQUIRY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1145,
          "offsetEnd": 1145,
          "columnNum": 234
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_FOR_MATHEMATICS_CLAIM_PERFORMANCE_LEVEL_CONCEPTS_PROCEDURES",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_FOR_MATHEMATICS_CLAIM_PERFORMANCE_LEVEL_CONCEPTS_PROCEDURES",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1146,
          "offsetEnd": 1146,
          "columnNum": 235
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_FOR_MATHEMATICS_CLAIM_PERFORMANCE_LEVEL_PROBLEM_SOLVING_MODELINGDATA",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_FOR_MATHEMATICS_CLAIM_PERFORMANCE_LEVEL_PROBLEM_SOLVING_MODELINGDATA",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1147,
          "offsetEnd": 1147,
          "columnNum": 236
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_FOR_MATHEMATICS_CLAIM_PERFORMANCE_LEVEL_COMMUNICATING_REASONING",
        "otherPossibleNames": [],
        "logicalName": "CAASPP_SMARTER_BALANCED_FOR_MATHEMATICS_CLAIM_PERFORMANCE_LEVEL_COMMUNICATING_REASONING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1148,
          "offsetEnd": 1148,
          "columnNum": 237
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCALE_SCORES_SMARTER_BALANCED_FOR_ELA",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1149,
          "offsetEnd": 1152,
          "columnNum": 238
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCALE_SCORES_SMARTER_BALANCED_FOR_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1153,
          "offsetEnd": 1156,
          "columnNum": 239
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCALE_SCORES_SMARTER_BALANCED_FOR_MATHEMATICS_CST_CMA_CAPA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "SCI_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1157,
          "offsetEnd": 1159,
          "columnNum": 240
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCALE_SCORES_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "RLA_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1160,
          "offsetEnd": 1162,
          "columnNum": 241
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_SCALE_SCORES_ERROR_BANDS_ELA_SEM",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_STANDARD_ERROR_MEASUREMENT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1163,
          "offsetEnd": 1166,
          "columnNum": 242
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_SCALE_SCORES_ERROR_BANDS_ELA_ERROR_BAND_MINIMUM",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_STANDARD_ERROR_BAND_MIN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1167,
          "offsetEnd": 1170,
          "columnNum": 243
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_SCALE_SCORES_ERROR_BANDS_ELA_ERROR_BAND_MAXIMUM",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_STANDARD_ERROR_BAND_MAX",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1171,
          "offsetEnd": 1174,
          "columnNum": 244
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_SCALE_SCORES_ERROR_BANDS_MATHEMATICS_SEM",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_STANDARD_ERROR_MEASUREMENT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1175,
          "offsetEnd": 1178,
          "columnNum": 245
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_SCALE_SCORES_ERROR_BANDS_MATHEMATICS_ERROR_BAND_MINIMUM",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_STANDARD_ERROR_BAND_MIN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1179,
          "offsetEnd": 1182,
          "columnNum": 246
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_SCALE_SCORES_ERROR_BANDS_MATHEMATICS_ERROR_BAND_MAXIMUM",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_STANDARD_ERROR_BAND_MAX",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1183,
          "offsetEnd": 1186,
          "columnNum": 247
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PERFORMANCE_LEVELS_STS_FOR_RLA",
        "otherPossibleNames": [],
        "logicalName": "RLA_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1187,
          "offsetEnd": 1187,
          "columnNum": 248
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","4","5","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PERFORMANCE_LEVELS_CST_CMA_CAPA_FOR_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "SCI_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1188,
          "offsetEnd": 1188,
          "columnNum": 249
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","4","5","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_ACHIEVEMENT_LEVELS_ELA",
        "otherPossibleNames": [],
        "logicalName": "SBAC_ELA_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1189,
          "offsetEnd": 1189,
          "columnNum": 250
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","4","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAASPP_SMARTER_BALANCED_ACHIEVEMENT_LEVELS_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "SBAC_MA_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1190,
          "offsetEnd": 1190,
          "columnNum": 251
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","4","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "VERSION_ASSIGNMENTS_FOR_CAASPP_PAPER_PENCIL_TESTS_CST_CMA_STS_GRADE_LEVEL_TEST",
        "otherPossibleNames": [],
        "logicalName": "VERSION_ASSIGNMENTS_FOR_CAASPP_PAPER_PENCIL_TESTS_CST_CMA_STS_GRADE_LEVEL_TEST",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1191,
          "offsetEnd": 1192,
          "columnNum": 252
        },
        "fieldLength": 2,
        "expectedValues": ["00","01","02","03","04","05","06","07","08","09"
        ,"10","11","12","13","14","15","16","17","18","19"
        ,"20","21","22","23","24","25","26","27","28","29"
        ,"30","31","32","33","34","35","36","37","38","39"
        ,"40","41","42","43","44","45","46","47","48","49"
        ,"50","51","52","53","54","55","56","57","58","59"
        ,"60","61","62","63","64","65","66","67","68","69"
        ,"70","71","72","73","74","75","76","77","78","79"
        ,"80","81","82","83","84","85","86","87","88","89"
        ,"90","91","92","93","94","95","96","97","98","99"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "VERSION_ASSIGNMENTS_FOR_CAASPP_PAPER_PENCIL_TESTS_EAP_ELA_RELEASE_RESULTS",
        "otherPossibleNames": [],
        "logicalName": "VERSION_ASSIGNMENTS_FOR_CAASPP_PAPER_PENCIL_TESTS_EAP_ELA_RELEASE_RESULTS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1193,
          "offsetEnd": 1193,
          "columnNum": 253
        },
        "fieldLength": 1,
        "expectedValues": ["1","2"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "VERSION_ASSIGNMENTS_FOR_CAASPP_PAPER_PENCIL_TESTS_EAP_MATHEMATICS_RELEASE_RESULTS",
        "otherPossibleNames": [],
        "logicalName": "VERSION_ASSIGNMENTS_FOR_CAASPP_PAPER_PENCIL_TESTS_EAP_MATHEMATICS_RELEASE_RESULTS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1194,
          "offsetEnd": 1194,
          "columnNum": 254
        },
        "fieldLength": 1,
        "expectedValues": ["1","2"],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [
    "txt"
  ]
}