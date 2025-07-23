{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "CAASPP_FW_1516",
    "recordLength": 1893,
    "naturalKey": [],
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
          "01","02","03","04","05","06","07","08"
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
        "physicalName": "STUDENT_STATE_ID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_STATE_ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 19,
          "offsetEnd": 28,
          "columnNum": 3
        },
        "fieldLength": 10,
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
          "offsetStart": 29,
          "offsetEnd": 78,
          "columnNum": 4
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
          "offsetStart": 79,
          "offsetEnd": 108,
          "columnNum": 5
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
          "offsetStart": 109,
          "offsetEnd": 138,
          "columnNum": 6
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STUDENT_LOCAL_ID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LOCAL_ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 139,
          "offsetEnd": 168,
          "columnNum": 7
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STUDENT_SMARTER_ID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_SMARTER_ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 169,
          "offsetEnd": 208,
          "columnNum": 8
        },
        "fieldLength": 40,
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
          "offsetStart": 209,
          "offsetEnd": 212,
          "columnNum": 9
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
          "offsetStart": 214,
          "offsetEnd": 215,
          "columnNum": 10
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
          "offsetStart": 217,
          "offsetEnd": 218,
          "columnNum": 11
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
          "offsetStart": 219,
          "offsetEnd": 219,
          "columnNum": 12
        },
        "fieldLength": 1,
        "expectedValues": ["M","F"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS_GRADE",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_GRADE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 225,
          "offsetEnd": 226,
          "columnNum": 13
        },
        "fieldLength": 2,
        "expectedValues": ["01","02","03","04","05","06","07","08","09","10","11","12","KN","UE","US"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS_DISTRICT_CODE",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_DISTRICT_CODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 227,
          "offsetEnd": 240,
          "columnNum": 14
        },
        "fieldLength": 14,
        "expectedValues": [ ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CALPADS_SCHOOL_CODE",
        "otherPossibleNames": [],
        "logicalName": "CALPADS_SCHOOL_CODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 241,
          "offsetEnd": 254,
          "columnNum": 15
        },
        "fieldLength": 14,
        "expectedValues": [],
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
          "offsetStart": 255,
          "offsetEnd": 261,
          "columnNum": 16
        },
        "fieldLength": 7,
        "expectedValues": ["       "],
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
          "offsetStart": 262,
          "offsetEnd": 264,
          "columnNum": 17
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
          "offsetStart": 265,
          "offsetEnd": 267,
          "columnNum": 18
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
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
          "offsetStart": 268,
          "offsetEnd": 285,
          "columnNum": 19
        },
        "fieldLength": 18,
        "expectedValues": ["Advanced          ",
                           "Beginning         ",
                           "Early Advanced    ",
                           "Early Intermediate",
                           "Intermediate      "],
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
          "offsetStart": 286,
          "offsetEnd": 288,
          "columnNum": 20
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP_LIMITED_ENGLISH_PROFICIENT_STATUS",
        "otherPossibleNames": [],
        "logicalName": "LEP_LIMITED_ENGLISH_PROFICIENT_STATUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 289,
          "offsetEnd": 291,
          "columnNum": 21
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
          "offsetStart": 292,
          "offsetEnd": 301,
          "columnNum": 22
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
          "offsetStart": 302,
          "offsetEnd": 311,
          "columnNum": 23
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
          "offsetStart": 312,
          "offsetEnd": 321,
          "columnNum": 24
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
          "offsetStart": 322,
          "offsetEnd": 325,
          "columnNum": 25
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
          "offsetStart": 326,
          "offsetEnd": 328,
          "columnNum": 26
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
          "offsetStart": 329,
          "offsetEnd": 331,
          "columnNum": 27
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
          "offsetStart": 332,
          "offsetEnd": 334,
          "columnNum": 28
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NPS_SCHOOL_FLAG",
        "otherPossibleNames": [],
        "logicalName": "NPS_SCHOOL_FLAG",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 335,
          "offsetEnd": 335,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["Y","N"],
        "dataTypes": "STRING",
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
          "offsetStart": 336,
          "offsetEnd": 338,
          "columnNum": 30
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
          "offsetStart": 339,
          "offsetEnd": 341,
          "columnNum": 31
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
          "offsetStart": 342,
          "offsetEnd": 344,
          "columnNum": 32
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
          "offsetStart": 345,
          "offsetEnd": 347,
          "columnNum": 33
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
          "offsetStart": 348,
          "offsetEnd": 350,
          "columnNum": 34
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
          "offsetStart": 351,
          "offsetEnd": 353,
          "columnNum": 35
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
          "offsetStart": 354,
          "offsetEnd": 356,
          "columnNum": 36
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
          "offsetStart": 357,
          "offsetEnd": 359,
          "columnNum": 37
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
          "offsetStart": 360,
          "offsetEnd": 362,
          "columnNum": 38
        },
        "fieldLength": 3,
        "expectedValues": ["100","200","600","400","500","300","700","800"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 363,
          "offsetEnd": 364,
          "columnNum": 39
        },
        "fieldLength": 2,
        "expectedValues": ["10","11","12","13","14","15"],
        "dataTypes": "INTEGER",
        "scale": null
      }
      ,
      {
        "physicalName": "OPPORTUNITY_ID_1",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_ID_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 365,
          "offsetEnd": 380,
          "columnNum": 40
        },
        "fieldLength": 16,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "OPPORTUNITY_ID_2",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_ID_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 381,
          "offsetEnd": 396,
          "columnNum": 41
        },
        "fieldLength": 16,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "GRADE_ASSESSED",
        "otherPossibleNames": [],
        "logicalName": "GRADE_ASSESSED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 397,
          "offsetEnd": 398,
          "columnNum": 42
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
          "offsetStart": 399,
          "offsetEnd": 399,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","4","5"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ENROLLMENT_ID",
        "otherPossibleNames": [],
        "logicalName": "ENROLLMENT_ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 400,
          "offsetEnd": 415,
          "columnNum": 44
        },
        "fieldLength": 16,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_LEA_NAME_1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_LEA_NAME_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 416,
          "offsetEnd": 515,
          "columnNum": 45
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_COUNTY_DISTRICT_CODE_1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_COUNTY_DISTRICT_CODE_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 516,
          "offsetEnd": 529,
          "columnNum": 46
        },
        "fieldLength": 14,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_SCHOOL_NAME_1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NAME_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 530,
          "offsetEnd": 629,
          "columnNum": 47
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_SCHOOL_CODE_1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_CODE_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 630,
          "offsetEnd": 643,
          "columnNum": 48
        },
        "fieldLength": 14,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_1",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 644,
          "offsetEnd": 645,
          "columnNum": 49
        },
        "fieldLength": 2,
        "expectedValues": ["DF"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PAPER_AND_PENCIL_TEST_COMPLETION_DATE",
        "otherPossibleNames": [],
        "logicalName": "PAPER_AND_PENCIL_TEST_COMPLETION_DATE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 646,
          "offsetEnd": 655,
          "columnNum": 50
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCANNED_DATE",
        "otherPossibleNames": [],
        "logicalName": "SCANNED_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 656,
          "offsetEnd": 665,
          "columnNum": 51
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      }
      ,
      {
        "physicalName": "TESTED_LEA_NAME_2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_LEA_NAME_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 666,
          "offsetEnd": 765,
          "columnNum": 52
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_COUNTY_DISTRICT_CODE_2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_COUNTY_DISTRICT_CODE_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 766,
          "offsetEnd": 779,
          "columnNum": 53
        },
        "fieldLength": 14,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_SCHOOL_NAME_2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_NAME_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 780,
          "offsetEnd": 879,
          "columnNum": 54
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_SCHOOL_CODE_2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_SCHOOL_CODE_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 880,
          "offsetEnd": 893,
          "columnNum": 55
        },
        "fieldLength": 14,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TESTED_CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_2",
        "otherPossibleNames": [],
        "logicalName": "TESTED_CHARTER_SCHOOL_DIRECTLY_FUNDED_INDICATOR_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 894,
          "offsetEnd": 895,
          "columnNum": 56
        },
        "fieldLength": 2,
        "expectedValues": ["DF"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TEST_START_DATE_AND_TIME_1",
        "otherPossibleNames": [],
        "logicalName": "TEST_START_DATE_1",
        "formatMask": "yyyy-MM-dd:hh:mm",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 896,
          "offsetEnd": 913,
          "columnNum": 57
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "TEST_COMPLETION_DATE_AND_TIME_1",
        "otherPossibleNames": [],
        "logicalName": "TEST_COMPLETION_DATE_1",
        "formatMask": "yyyy-MM-dd:hh:mm",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 914,
          "offsetEnd": 931,
          "columnNum": 58
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "TEST_START_DATE_AND_TIME_2",
        "otherPossibleNames": [],
        "logicalName": "TEST_START_DATE_2",
        "formatMask": "yyyy-MM-dd:hh:mm",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 932,
          "offsetEnd": 949,
          "columnNum": 59
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "TEST_COMPLETION_DATE_AND_TIME_2",
        "otherPossibleNames": [],
        "logicalName": "TEST_COMPLETION_DATE_2",
        "formatMask": "yyyy-MM-dd:hh:mm",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 950,
          "offsetEnd": 967,
          "columnNum": 60
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 968,
          "offsetEnd": 977,
          "columnNum": 61
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 978,
          "offsetEnd": 987,
          "columnNum": 62
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "STUDENT_EXIT_DATE",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_EXIT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 988,
          "offsetEnd": 997,
          "columnNum": 63
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "STUDENT_CONDITION_CODE",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_CONDITION_CODE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 998,
          "offsetEnd": 1001,
          "columnNum": 64
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
      ,
      {
        "physicalName": "ATTEMPTEDNESS",
        "otherPossibleNames": [],
        "logicalName": "ATTEMPTEDNESS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1002,
          "offsetEnd": 1002,
          "columnNum": 65
        },
        "fieldLength": 1,
        "expectedValues": ["N","P","Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCORE_STATUS",
        "otherPossibleNames": [],
        "logicalName": "SCORE_STATUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1003,
          "offsetEnd": 1003,
          "columnNum": 66
        },
        "fieldLength": 1,
        "expectedValues": ["I","V"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TEST_MODE_ONLINE_OR_PAPER",
        "otherPossibleNames": [],
        "logicalName": "TEST_MODE_ONLINE_OR_PAPER",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1004,
          "offsetEnd": 1004,
          "columnNum": 67
        },
        "fieldLength": 1,
        "expectedValues": ["O","P"],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "INCLUDE_INDICATOR",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1005,
          "offsetEnd": 1005,
          "columnNum": 68
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "INCLUDE_INDICATOR",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1005,
          "offsetEnd": 1005,
          "columnNum": 69
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 1006,
          "offsetEnd": 1013,
          "columnNum": 70
        },
        "fieldLength": 8,
        "expectedValues": ["        "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RAW_SCORE",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1014,
          "offsetEnd": 1015,
          "columnNum": 71
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
        "physicalName": "Smarter_Claim_1_Performance_Level",
        "otherPossibleNames": [],
        "logicalName": "SMARTER_CLAIM_1_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1016,
          "offsetEnd": 1016,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Smarter_Claim_2_Performance_Level",
        "otherPossibleNames": [],
        "logicalName": "SMARTER_CLAIM_2_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1017,
          "offsetEnd": 1017,
          "columnNum": 73
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Smarter_Claim_3_Performance_Level",
        "otherPossibleNames": [],
        "logicalName": "SMARTER_CLAIM_3_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1018,
          "offsetEnd": 1018,
          "columnNum": 74
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Smarter_Claim_4_Performance_Level",
        "otherPossibleNames": [],
        "logicalName": "SMARTER_CLAIM_4_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1019,
          "offsetEnd": 1019,
          "columnNum": 75
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","9"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scale_Score",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1020,
          "offsetEnd": 1023,
          "columnNum": 76
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Smarter_Standard_Error_Measurement_SEM",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_SCORE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1024,
          "offsetEnd": 1027,
          "columnNum": 77
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Smarter_Scale_Scores_Error_Bands_Min",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_MIN",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1028,
          "offsetEnd": 1031,
          "columnNum": 78
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Smarter_Scale_Scores_Error_Bands_Max",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_MEASUREMENT_MAX",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1032,
          "offsetEnd": 1035,
          "columnNum": 79
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Performance_Level",
        "otherPossibleNames": [],
        "logicalName": "PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1036,
          "offsetEnd": 1036,
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","4","5","9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ACHIEVEMENT_LEVEL",
        "otherPossibleNames": [],
        "logicalName": "ACHIEVEMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1037,
          "offsetEnd": 1037,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": ["1","2","3","4","9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EAP_Student_Authorized_ETS_to_Release_Results_to_Colleges",
        "otherPossibleNames": [],
        "logicalName": "EAP_STUDENT_AUTHORIZED_ETS_TO_RELEASE_RESULTS_TO_COLLEGES",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1038,
          "offsetEnd": 1038,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": ["1","2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Accommodations Available Indicator",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATIONS_AVAILABLE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1039,
          "offsetEnd": 1041,
          "columnNum": 83
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_1_American_Sign_Language",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_AMERICAN_SIGN_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1042,
          "offsetEnd": 1049,
          "columnNum": 84
        },
        "fieldLength": 8,
        "expectedValues": ["TDS_ASL1"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_1_Language",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1050,
          "offsetEnd": 1060,
          "columnNum": 85
        },
        "fieldLength": 11,
        "expectedValues": ["ENU        "
                          ,"ENU-Braille"
                          ,"ESN        "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_1_Closed_Captioning",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_CLOSED_CAPTIONING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1061,
          "offsetEnd": 1074,
          "columnNum": 86
        },
        "fieldLength": 14,
        "expectedValues": ["TDS_ClosedCap1"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_1_Streamlined",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_STREAMLINED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1075,
          "offsetEnd": 1082,
          "columnNum": 87
        },
        "fieldLength": 8,
        "expectedValues": ["TDS_SLM1"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_1_Text_to_Speech",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_1_TEXT_TO_SPEECH",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1083,
          "offsetEnd": 1107,
          "columnNum": 88
        },
        "fieldLength": 25,
        "expectedValues": ["TDS_TTS_Stim             "
                          ,"TDS_TTS_Item             "
                          ,"TDS_TTS_Stim&TDS_TTS_Item"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_1_Color_Choices",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_CHOICES",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1108,
          "offsetEnd": 1126,
          "columnNum": 89
        },
        "fieldLength": 19,
        "expectedValues": ["TDS_CCInvert       "
                          ,"TDS_CCMagenta      "
                          ,"TDS_CCMedGrayLtGray"
                          ,"TDS_CCYellowB      "
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_1_Masking",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MASKING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1127,
          "offsetEnd": 1138,
          "columnNum": 90
        },
        "fieldLength": 12,
        "expectedValues": ["TDS_Masking1"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_1_Translations_Glossary",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TRANSLATIONS_GLOSSARY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1139,
          "offsetEnd": 1176,
          "columnNum": 91
        },
        "fieldLength": 38,
        "expectedValues": ["TDS_WL_Glossary                       "
                          ,"TDS_WL_ArabicGloss                    "
                          ,"TDS_WL_CantoneseGloss                 "
                          ,"TDS_WL_ESNGlossary                    "
                          ,"TDS_WL_KoreanGloss                    "
                          ,"TDS_WL_MandarinGloss                  "
                          ,"TDS_WL_PunjabiGloss                   "
                          ,"TDS_WL_RussianGloss                   "
                          ,"TDS_WL_TagalGloss                     "
                          ,"TDS_WL_UkrainianGloss                 "
                          ,"TDS_WL_VietnameseGloss                "
                          ,"TDS_WL_ArabicGloss&TDS_WL_Glossary    "
                          ,"TDS_WL_CantoneseGloss&TDS_WL_Glossary "
                          ,"TDS_WL_ESNGlossary&TDS_WL_Glossary    "
                          ,"TDS_WL_KoreanGloss&TDS_WL_Glossary    "
                          ,"TDS_WL_MandarinGloss&TDS_WL_Glossary  "
                          ,"TDS_WL_PunjabiGloss&TDS_WL_Glossary   "
                          ,"TDS_WL_RussianGloss&TDS_WL_Glossary   "
                          ,"TDS_WL_TagalGloss&TDS_WL_Glossary     "
                          ,"TDS_WL_UkrainianGloss&TDS_WL_Glossary "
                          ,"TDS_WL_VietnameseGloss&TDS_WL_Glossary"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_1_Print_Size",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_PRINT_SIZE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1177,
          "offsetEnd": 1185,
          "columnNum": 92
        },
        "fieldLength": 9,
        "expectedValues": ["TDS_PS_L1",
                           "TDS_PS_L2",
                           "TDS_PS_L3",
                           "TDS_PS_L4"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Print_on_Demand",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_PRINT_ON_DEMAND",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1186,
          "offsetEnd": 1210,
          "columnNum": 93
        },
        "fieldLength": 25,
        "expectedValues": ["TDS_PoD_Stim             ",
                           "TDS_PoD_Item             ",
                           "TDS_PoD_Stim&TDS_PoD_Item"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_1_Permissive_Mode",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_PERMISSIVE_MODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1211,
          "offsetEnd": 1217,
          "columnNum": 94
        },
        "fieldLength": 7,
        "expectedValues": ["TDS_PM1"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_1_Turn_off_Universal_Tools",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TURN_OFF_UNIVERSAL_TOOLS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1218,
          "offsetEnd": 1220,
          "columnNum": 95
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Alternate_Response_Options",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_ALTERNATE_RESPONSE_OPTIONS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1221,
          "offsetEnd": 1226,
          "columnNum": 96
        },
        "fieldLength": 6,
        "expectedValues": ["NEA_AR"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Read_Aloud",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1227,
          "offsetEnd": 1240,
          "columnNum": 97
        },
        "fieldLength": 14,
        "expectedValues": ["NEA_RA_Stimuli"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Unlisted_Resources",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_UNLISTED_RESOURCES",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1241,
          "offsetEnd": 1258,
          "columnNum": 98
        },
        "fieldLength": 18,
        "expectedValues": ["NEA_IndividualAids"],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Non_Embedded_Accommodation_1_Scribe",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_SCRIBE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1259,
          "offsetEnd": 1274,
          "columnNum": 99
        },
        "fieldLength": 16,
        "expectedValues": ["NEA_SC_WritItems"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Speech_to_Text",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_SPEECH_TO_TEXT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1275,
          "offsetEnd": 1281,
          "columnNum": 100
        },
        "fieldLength": 7,
        "expectedValues": ["NEA_STT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Additional_Alternate_Assessment_Resources",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_ADDITIONAL_ALTERNATE_ASSESSMENT_RESOURCES",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1282,
          "offsetEnd": 1294,
          "columnNum": 101
        },
        "fieldLength": 13,
        "expectedValues": ["NEA_AddAltRSC"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Abacus",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_ABACUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1295,
          "offsetEnd": 1304,
          "columnNum": 102
        },
        "fieldLength": 10,
        "expectedValues": ["NEA_Abacus"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Calculator",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1305,
          "offsetEnd": 1312,
          "columnNum": 103
        },
        "fieldLength": 8,
        "expectedValues": ["NEA_Calc"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_1_Multiplication_Table",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_1_MULTIPLICATION_TABLE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1313,
          "offsetEnd": 1318,
          "columnNum": 104
        },
        "fieldLength": 6,
        "expectedValues": ["NEA_MT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Bilingual_Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_BILINGUAL_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1319,
          "offsetEnd": 1325,
          "columnNum": 105
        },
        "fieldLength": 7,
        "expectedValues": ["NEDS_BD"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Color_Contrast",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_CONTRAST",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1326,
          "offsetEnd": 1332,
          "columnNum": 106
        },
        "fieldLength": 7,
        "expectedValues": ["NEDS_CC"],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Color_Overlay",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_OVERLAY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1333,
          "offsetEnd": 1339,
          "columnNum": 107
        },
        "fieldLength": 7,
        "expectedValues": ["NEDS_CO"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Magnification",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_MAGNIFICATION",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1340,
          "offsetEnd": 1347,
          "columnNum": 108
        },
        "fieldLength": 8,
        "expectedValues": ["NEDS_Mag"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Noise_Buffers",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_NOISE_BUFFERS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1348,
          "offsetEnd": 1359,
          "columnNum": 109
        },
        "fieldLength": 12,
        "expectedValues": ["NEA_NoiseBuf"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Read_Aloud_Items_Stimuli",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_READ_ALOUD_ITEMS_STIMULI",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1360,
          "offsetEnd": 1380,
          "columnNum": 110
        },
        "fieldLength": 21,
        "expectedValues": ["NEDS_RA_Items        "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Read_Aloud_Items_Stimuli_Spanish",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_READ_ALOUD_ITEMS_STIMULI_SPANISH",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1381,
          "offsetEnd": 1405,
          "columnNum": 111
        },
        "fieldLength": 25,
        "expectedValues": ["NEDS_RA_Stimuli_ESN      "
                          ,"NEDS_RA_Items_ESN        "
                          ,"NEDS_RA_Items_Stimuli_ESN"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Scribe_Items_Non_Writing",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_SCRIBE_ITEMS_NON_WRITING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1406,
          "offsetEnd": 1421,
          "columnNum": 112
        },
        "fieldLength": 16,
        "expectedValues": ["NEDS_SC_Items   "],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Separate_Setting",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_SEPARATE_SETTING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1422,
          "offsetEnd": 1428,
          "columnNum": 113
        },
        "fieldLength": 7,
        "expectedValues": ["NEDS_SS"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_1_Translated_Test_Directions",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_1_TRANSLATED_TEST_DIRECTIONS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1429,
          "offsetEnd": 1442,
          "columnNum": 114
        },
        "fieldLength": 14,
        "expectedValues": ["NEDS_TransDirs"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_2_American_Sign_Language",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_AMERICAN_SIGN_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1443,
          "offsetEnd": 1450,
          "columnNum": 115
        },
        "fieldLength": 8,
        "expectedValues": ["TDS_ASL1"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_2_Language",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1451,
          "offsetEnd": 1461,
          "columnNum": 116
        },
        "fieldLength": 11,
        "expectedValues": ["ENU        "
                          ,"ENU-Braille"
                          ,"ESN        "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_2_Closed_Captioning",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_CLOSED_CAPTIONING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1462,
          "offsetEnd": 1475,
          "columnNum": 117
        },
        "fieldLength": 14,
        "expectedValues": ["TDS_ClosedCap1"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Accommodation_2_Streamlined",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_STREAMLINED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1476,
          "offsetEnd": 1483,
          "columnNum": 118
        },
        "fieldLength": 8,
        "expectedValues": ["TDS_SLM1"],
        "dataTypes": "STRING",
        "scale": null
      }, {
        "physicalName": "Embedded_Accommodation_2_Text_to_Speech",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_ACCOMMODATION_2_TEXT_TO_SPEECH",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1484,
          "offsetEnd": 1508,
          "columnNum": 119
        },
        "fieldLength": 25,
        "expectedValues": ["TDS_TTS_Stim             "
                          ,"TDS_TTS_Item             "
                          ,"TDS_TTS_Stim&TDS_TTS_Item"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_2_Color_Choices",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_CHOICES",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1509,
          "offsetEnd": 1527,
          "columnNum": 120
        },
        "fieldLength": 19,
        "expectedValues": ["TDS_CCInvert       "
                          ,"TDS_CCMagenta      "
                          ,"TDS_CCMedGrayLtGray"
                          ,"TDS_CCYellowB      "
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_2_Masking",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_MASKING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1528,
          "offsetEnd": 1539,
          "columnNum": 121
        },
        "fieldLength": 12,
        "expectedValues": [
          "TDS_Masking1"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_2_Translations_Glossary",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TRANSLATIONS_GLOSSARY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1540,
          "offsetEnd": 1577,
          "columnNum": 122
        },
        "fieldLength": 38,
        "expectedValues": ["TDS_WL_Glossary                       "
                          ,"TDS_WL_ArabicGloss                    "
                          ,"TDS_WL_CantoneseGloss                 "
                          ,"TDS_WL_ESNGlossary                    "
                          ,"TDS_WL_KoreanGloss                    "
                          ,"TDS_WL_MandarinGloss                  "
                          ,"TDS_WL_PunjabiGloss                   "
                          ,"TDS_WL_RussianGloss                   "
                          ,"TDS_WL_TagalGloss                     "
                          ,"TDS_WL_UkrainianGloss                 "
                          ,"TDS_WL_VietnameseGloss                "
                          ,"TDS_WL_ArabicGloss&TDS_WL_Glossary    "
                          ,"TDS_WL_CantoneseGloss&TDS_WL_Glossary "
                          ,"TDS_WL_ESNGlossary&TDS_WL_Glossary    "
                          ,"TDS_WL_KoreanGloss&TDS_WL_Glossary    "
                          ,"TDS_WL_MandarinGloss&TDS_WL_Glossary  "
                          ,"TDS_WL_PunjabiGloss&TDS_WL_Glossary   "
                          ,"TDS_WL_RussianGloss&TDS_WL_Glossary   "
                          ,"TDS_WL_TagalGloss&TDS_WL_Glossary     "
                          ,"TDS_WL_UkrainianGloss&TDS_WL_Glossary "
                          ,"TDS_WL_VietnameseGloss&TDS_WL_Glossary"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_2_Print_Size",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_PRINT_SIZE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1578,
          "offsetEnd": 1586,
          "columnNum": 123
        },
        "fieldLength": 9,
        "expectedValues": ["TDS_PS_L1",
                           "TDS_PS_L2",
                           "TDS_PS_L3",
                           "TDS_PS_L4"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_2_Print_on_Demand",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_PRINT_ON_DEMAND",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1587,
          "offsetEnd": 1611,
          "columnNum": 124
        },
        "fieldLength": 25,
        "expectedValues": ["TDS_PoD_Stim             ",
                           "TDS_PoD_Item             ",
                           "TDS_PoD_Stim&TDS_PoD_Item"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_2_Permissive_Mode",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_PERMISSIVE_MODE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1612,
          "offsetEnd": 1618,
          "columnNum": 125
        },
        "fieldLength": 7,
        "expectedValues": ["TDS_PM1"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Embedded_Designated_Support_2_Turn_off_Universal_Tools",
        "otherPossibleNames": [],
        "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TURN_OFF_UNIVERSAL_TOOLS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1619,
          "offsetEnd": 1621,
          "columnNum": 126
        },
        "fieldLength": 3,
        "expectedValues": ["Yes","No "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_2_Alternate_Response_Options",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_ALTERNATE_RESPONSE_OPTIONS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1622,
          "offsetEnd": 1627,
          "columnNum": 127
        },
        "fieldLength": 6,
        "expectedValues": ["NEA_AR"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_2_Unlisted_Resources",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_UNLISTED_RESOURCES",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1628,
          "offsetEnd": 1645,
          "columnNum": 128
        },
        "fieldLength": 18,
        "expectedValues": ["NEA_IndividualAids"],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Non_Embedded_Accommodation_2_Scribe",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_SCRIBE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1646,
          "offsetEnd": 1661,
          "columnNum": 129
        },
        "fieldLength": 16,
        "expectedValues": ["NEA_SC_WritItems"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_2_Speech_to_Text",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_SPEECH_TO_TEXT",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1662,
          "offsetEnd": 1668,
          "columnNum": 130
        },
        "fieldLength": 7,
        "expectedValues": ["NEA_STT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_2_Abacus",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_ABACUS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1669,
          "offsetEnd": 1678,
          "columnNum": 131
        },
        "fieldLength": 10,
        "expectedValues": ["NEA_Abacus"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_2_Calculator",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1679,
          "offsetEnd": 1686,
          "columnNum": 132
        },
        "fieldLength": 8,
        "expectedValues": ["NEA_Calc"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_2_Multiplication_Table",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_2_MULTIPLICATION_TABLE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1687,
          "offsetEnd": 1692,
          "columnNum": 133
        },
        "fieldLength": 6,
        "expectedValues": ["NEA_MT"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Bilingual_Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_BILINGUAL_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1693,
          "offsetEnd": 1699,
          "columnNum": 134
        },
        "fieldLength": 7,
        "expectedValues": ["NEDS_BD"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Color_Contrast",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_CONTRAST",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1700,
          "offsetEnd": 1706,
          "columnNum": 135
        },
        "fieldLength": 7,
        "expectedValues": ["NEDS_CC"],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Color_Overlay",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_OVERLAY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1707,
          "offsetEnd": 1713,
          "columnNum": 136
        },
        "fieldLength": 7,
        "expectedValues": ["NEDS_CO"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Magnification",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_MAGNIFICATION",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1714,
          "offsetEnd": 1721,
          "columnNum": 137
        },
        "fieldLength": 8,
        "expectedValues": ["NEDS_Mag"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Noise_Buffers",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_NOISE_BUFFERS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1722,
          "offsetEnd": 1733,
          "columnNum": 138
        },
        "fieldLength": 12,
        "expectedValues": ["NEA_NoiseBuf"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Read_Aloud_Items_Stimuli",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_READ_ALOUD_ITEMS_STIMULI",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1734,
          "offsetEnd": 1754,
          "columnNum": 139
        },
        "fieldLength": 21,
        "expectedValues": ["NEDS_RA_Items        "],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Read_Aloud_Items_Stimuli_Spanish",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_READ_ALOUD_ITEMS_STIMULI_SPANISH",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1755,
          "offsetEnd": 1779,
          "columnNum": 111
        },
        "fieldLength": 140,
        "expectedValues": ["NEDS_RA_Stimuli_ESN      "
                          ,"NEDS_RA_Items_ESN        "
                          ,"NEDS_RA_Items_Stimuli_ESN"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Scribe_Items_Non_Writing",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_SCRIBE_ITEMS_NON_WRITING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1780,
          "offsetEnd": 1795,
          "columnNum": 141
        },
        "fieldLength": 16,
        "expectedValues": ["NEDS_SC_Items   "],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Separate_Setting",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_SEPARATE_SETTING",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1796,
          "offsetEnd": 1802,
          "columnNum": 142
        },
        "fieldLength": 7,
        "expectedValues": ["NEDS_SS"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Designated_Support_2_Translated_Test_Directions",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_DESIGNATED_SUPPORT_2_TRANSLATED_TEST_DIRECTIONS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1803,
          "offsetEnd": 1816,
          "columnNum": 143
        },
        "fieldLength": 14,
        "expectedValues": [
          "NEDS_TransDirs"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_Paper_Abacus_for_answer_documents_circle_X_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_PAPER_ABACUS_FOR_ANSWER_DOCUMENTS_CIRCLE_X_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1817,
          "offsetEnd": 1817,
          "columnNum": 144
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_Paper_Alternate_Response_Options_for_answer_documents_circle_F_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_PAPER_ALTERNATE_RESPONSE_OPTIONS_FOR_ANSWER_DOCUMENTS_CIRCLE_F_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1818,
          "offsetEnd": 1818,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_Paper_Braille_for_answer_documents_circle_G_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_PAPER_BRAILLE_FOR_ANSWER_DOCUMENTS_CIRCLE_G_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1819,
          "offsetEnd": 1819,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_Paper_Calculator_for_answer_documents_circle_Q_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_PAPER_CALCULATOR_FOR_ANSWER_DOCUMENTS_CIRCLE_Q_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1820,
          "offsetEnd": 1820,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_Paper_Multiplication_Table_for_answer_documents_circle_R_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_PAPER_MULTIPLICATION_TABLE_FOR_ANSWER_DOCUMENTS_CIRCLE_R_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1821,
          "offsetEnd": 1821,
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Supports_Paper_Read_Aloud_for_answer_documents_circle_Z_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_SUPPORTS_PAPER_READ_ALOUD_FOR_ANSWER_DOCUMENTS_CIRCLE_Z_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1822,
          "offsetEnd": 1822,
          "columnNum": 149
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Supports_Paper_Scribe_for_answer_documents_circle_C_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_SUPPORTS_PAPER_SCRIBE_FOR_ANSWER_DOCUMENTS_CIRCLE_C_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1823,
          "offsetEnd": 1823,
          "columnNum": 150
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Non_Embedded_Accommodation_Paper_Speech_to_Text_for_answer_documents_circle_U_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_PAPER_SPEECH_TO_TEXT_FOR_ANSWER_DOCUMENTS_CIRCLE_U_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1824,
          "offsetEnd": 1824,
          "columnNum": 151
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Supports_Paper_Separate_Setting_for_answer_documents_circle_L_or_M_inbox_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_SUPPORTS_PAPER_SEPARATE_SETTING_FOR_ANSWER_DOCUMENTS_CIRCLE_L_OR_M_INBOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1825,
          "offsetEnd": 1825,
          "columnNum": 152
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Accommodation_Paper_Large_print_for_answer_documents_circle_H_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_ACCOMMODATION_PAPER_LARGE_PRINT_FOR_ANSWER_DOCUMENTS_CIRCLE_H_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1826,
          "offsetEnd": 1826,
          "columnNum": 153
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Supports_Paper_Bilingual_Dictionary_for_answer_documents_circle_D_in_box_A3_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_SUPPORTS_PAPER_BILINGUAL_DICTIONARY_FOR_ANSWER_DOCUMENTS_CIRCLE_D_IN_BOX_A3_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1827,
          "offsetEnd": 1827,
          "columnNum": 154
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Supports_Paper_Translated_Test_Directions_answer_documents_circle_A_in_box_A4_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_SUPPORTS_PAPER_TRANSLATED_TEST_DIRECTIONS_ANSWER_DOCUMENTS_CIRCLE_A_IN_BOX_A4_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1828,
          "offsetEnd": 1828,
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non_Embedded_Supports_Paper_Translations_Glossary_answer_documents_circle_D_in_box_A4_was_marked",
        "otherPossibleNames": [],
        "logicalName": "NON_EMBEDDED_SUPPORTS_PAPER_TRANSLATIONS_GLOSSARY_ANSWER_DOCUMENTS_CIRCLE_D_IN_BOX_A4_WAS_MARKED",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1829,
          "offsetEnd": 1829,
          "columnNum": 156
        },
        "fieldLength": 1,
        "expectedValues": ["Y"],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Number_of_Items_attempted_1",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1830,
          "offsetEnd": 1832,
          "columnNum": 157
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ,
      {
        "physicalName": "Number_of_Items_attempted_2",
        "otherPossibleNames": [],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1833,
          "offsetEnd": 1835,
          "columnNum": 158
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler4",
        "otherPossibleNames": [],
        "logicalName": "Filler4",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "n",
        "fieldOffset": {
          "offsetStart": 1836,
          "offsetEnd": 1843,
          "columnNum": 159
        },
        "fieldLength": 8,
        "expectedValues": ["        "],
        "dataTypes": "STRING",
        "scale": null
      } ,
      {
        "physicalName": "Smarter_Standard_Error_Measurement_SEM_Current_Year_minus_1",
        "otherPossibleNames": [],
        "logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1844,
          "offsetEnd": 1847,
          "columnNum": 160
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      } ,
      {
        "physicalName": "Scale_Scores_Current_Year_minus_1",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1848,
          "offsetEnd": 1851,
          "columnNum": 161
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Condition_Code_Current_Year_minus_1",
        "otherPossibleNames": [],
        "logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_1",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1852,
          "offsetEnd": 1855,
          "columnNum": 162
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler5",
        "otherPossibleNames": [],
        "logicalName": "Filler5",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "n",
        "fieldOffset": {
          "offsetStart": 1856,
          "offsetEnd": 1863,
          "columnNum": 159
        },
        "fieldLength": 8,
        "expectedValues": ["        "],
        "dataTypes": "STRING",
        "scale": null
      }, {
        "physicalName": "Smarter_Standard_Error_Measurement_SEM_Current_Year_minus_2",
        "otherPossibleNames": [],
        "logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1864,
          "offsetEnd": 1867,
          "columnNum": 160
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      } ,
      {
        "physicalName": "Scale_Scores_Current_Year_minus_2",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1868,
          "offsetEnd": 1871,
          "columnNum": 161
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Condition_Code_Current_Year_minus_2",
        "otherPossibleNames": [],
        "logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_2",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 1872,
          "offsetEnd": 1875,
          "columnNum": 162
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filler6",
        "otherPossibleNames": [],
        "logicalName": "Filler6",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "n",
        "fieldOffset": {
          "offsetStart": 1876,
          "offsetEnd": 1891,
          "columnNum": 159
        },
        "fieldLength": 16,
        "expectedValues": ["                "],
        "dataTypes": "STRING",
        "scale": null
      },{
        "physicalName": "END_OF_RECORD",
        "otherPossibleNames": [],
        "logicalName": "END_OF_RECORD",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "n",
        "fieldOffset": {
          "offsetStart": 1892,
          "offsetEnd": 1893,
          "columnNum": 162
        },
        "fieldLength": 2,
        "expectedValues": ["ZZ"],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [
    "txt"
  ]
}
