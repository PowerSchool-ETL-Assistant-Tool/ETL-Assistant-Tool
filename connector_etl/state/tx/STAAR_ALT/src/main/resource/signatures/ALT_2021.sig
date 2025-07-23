{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "ALT_2021",
    "recordLength": 4000,
    "naturalKey": [
      "ADMINISTRATION_DATE",
      "LOCAL_STUDENT_ID",
      "FIRST_NAME",
      "MIDDLE_INITIAL",
      "LAST_NAME",
      "DATE_OF_BIRTH",
      "SCORE_CODE_INFORMATION_READING",
      "SCORE_CODE_INFORMATION_MATHEMATICS",
      "SCORE_CODE_INFORMATION_WRITING",
      "SCORE_CODE_INFORMATION_SOCIAL_STUDIES",
      "SCORE_CODE_INFORMATION_SCIENCE"
    ],
    "fields": [
      {
        "physicalName": "ADMINISTRATION DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_DATE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 4,
          "columnNum": 1
        },
        "fieldLength": 4,
        "expectedValues": [
          "0418",
          "0518",
          "0618",
          "0421"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GRADE LEVEL",
        "otherPossibleNames": [],
        "logicalName": "GRADE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5,
          "offsetEnd": 6,
          "columnNum": 2
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ESC REGION NUMBER",
        "otherPossibleNames": [],
        "logicalName": "ESC_REGION_NUMBER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 7,
          "offsetEnd": 8,
          "columnNum": 3
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "COUNTY-DISTRICT-CAMPUS NUMBER",
        "otherPossibleNames": [],
        "logicalName": "COUNTY_DISTRICT_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 9,
          "offsetEnd": 17,
          "columnNum": 4
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DISTRICT-NAME",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_NAME",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 18,
          "offsetEnd": 32,
          "columnNum": 5
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CAMPUS-NAME",
        "otherPossibleNames": [],
        "logicalName": "CAMPUS_NAME",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 33,
          "offsetEnd": 47,
          "columnNum": 6
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAST-NAME",
        "otherPossibleNames": [],
        "logicalName": "LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 48,
          "offsetEnd": 62,
          "columnNum": 7
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FIRST-NAME",
        "otherPossibleNames": [],
        "logicalName": "FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 63,
          "offsetEnd": 72,
          "columnNum": 8
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MIDDLE INITIAL",
        "otherPossibleNames": [],
        "logicalName": "MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 73,
          "offsetEnd": 73,
          "columnNum": 9
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STUDENT-ID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 74,
          "offsetEnd": 82,
          "columnNum": 10
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SEX-CODE",
        "otherPossibleNames": [],
        "logicalName": "SEX_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 83,
          "offsetEnd": 83,
          "columnNum": 11
        },
        "fieldLength": 1,
        "expectedValues": [
          "M",
          "F"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DATE-OF-BIRTH",
        "otherPossibleNames": [],
        "logicalName": "DATE_OF_BIRTH",
        "formatMask": "MMDDYYYY",
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 84,
          "offsetEnd": 91,
          "columnNum": 12
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 92,
          "offsetEnd": 92,
          "columnNum": 13
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HISPANIC-LATINO-CODE",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC_LATINO_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 93,
          "offsetEnd": 93,
          "columnNum": 14
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AMERICAN-INDIAN-ALASKA-NATIVE-CODE",
        "otherPossibleNames": [],
        "logicalName": "AMERICAN_INDIAN_ALASKA_NATIVE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 94,
          "offsetEnd": 94,
          "columnNum": 15
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ASIAN-CODE",
        "otherPossibleNames": [],
        "logicalName": "ASIAN_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 95,
          "offsetEnd": 95,
          "columnNum": 16
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLACK-AFRICAN-AMERICAN-CODE",
        "otherPossibleNames": [],
        "logicalName": "BLACK_AFRICAN_AMERICAN_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 96,
          "offsetEnd": 96,
          "columnNum": 17
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NATIVE-HAWAIIAN-PACIFIC-ISLANDER-CODE",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_HAWAIIAN_PACIFIC_ISLANDER_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 97,
          "offsetEnd": 97,
          "columnNum": 18
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WHITE-CODE",
        "otherPossibleNames": [],
        "logicalName": "WHITE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 98,
          "offsetEnd": 98,
          "columnNum": 19
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ETHNICITY/RACE REPORTING CATEGORY",
        "otherPossibleNames": [],
        "logicalName": "ETHNICITY/RACE_REPORTING_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 99,
          "offsetEnd": 99,
          "columnNum": 20
        },
        "fieldLength": 1,
        "expectedValues": [
          "H",
          "I",
          "A",
          "B",
          "P",
          "W",
          "T",
          "N"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ECONOMIC-DISADVANTAGE-CODE",
        "otherPossibleNames": [],
        "logicalName": "ECONOMIC_DISADVANTAGE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 100,
          "offsetEnd": 100,
          "columnNum": 21
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "9",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TITLE-I-PART-A-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "TITLE_I_PART_A_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 101,
          "offsetEnd": 101,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": [
          "6",
          "7",
          "8",
          "9",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MIGRANT-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "MIGRANT_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 102,
          "offsetEnd": 102,
          "columnNum": 23
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 103,
          "offsetEnd": 106,
          "columnNum": 24
        },
        "fieldLength": 4,
        "expectedValues": [
          "C",
          "F",
          "S",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "LEP_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 107,
          "offsetEnd": 107,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": [
          "2",
          "3",
          "4",
          "5",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BILINGUAL-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "BILINGUAL_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 108,
          "offsetEnd": 108,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": [
          "2",
          "3",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ESL-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "ESL_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 109,
          "offsetEnd": 109,
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 110,
          "offsetEnd": 110,
          "columnNum": 28
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SPECIAL-ED-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "SPECIAL_ED_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 111,
          "offsetEnd": 111,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 112,
          "offsetEnd": 116,
          "columnNum": 30
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GIFTED-TALENTED-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "GIFTED_TALENTED_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 117,
          "offsetEnd": 117,
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AT-RISK-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "AT_RISK_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 118,
          "offsetEnd": 118,
          "columnNum": 32
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 119,
          "offsetEnd": 122,
          "columnNum": 33
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LOCAL-STUDENT-ID",
        "otherPossibleNames": [],
        "logicalName": "LOCAL_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 123,
          "offsetEnd": 131,
          "columnNum": 34
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 132,
          "offsetEnd": 143,
          "columnNum": 35
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FALL 2020 TSDS PEIMS COUNTY-DISTRICT-CAMPUS NUMBER",
        "otherPossibleNames": [],
        "logicalName": "FALL_2020_TSDS_PEIMS_COUNTY_DISTRICT_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 144,
          "offsetEnd": 152,
          "columnNum": 36
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FALL 2020 TSDS PEIMS CRISIS CODE",
        "otherPossibleNames": [],
        "logicalName": "FALL_2020_TSDS_PEIMS_CRISIS_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 153,
          "offsetEnd": 154,
          "columnNum": 37
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FALL 2020 TSDS PEIMS STUDENT ATTRIBUTION CODE",
        "otherPossibleNames": [],
        "logicalName": "FALL_2020_TSDS_PEIMS_STUDENT_ATTRIBUTION_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 155,
          "offsetEnd": 156,
          "columnNum": 38
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STUDENT PORTAL UNIQUE ACCESS CODE",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_PORTAL_UNIQUE_ACCESS_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 157,
          "offsetEnd": 162,
          "columnNum": 39
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MIGRANT STUDENT IN TEXAS MIGRANT INTERSTATE PROGRAM (TMIP)",
        "otherPossibleNames": [],
        "logicalName": "MIGRANT_STUDENT_IN_TEXAS_MIGRANT_INTERSTATE_PROGRAM",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 163,
          "offsetEnd": 163,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FALL 2020 TSDS PEIMS DYSLEXIA-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "FALL_TSDS_DYSLEXIA_CDE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 164,
          "offsetEnd": 164,
          "columnNum": 41
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FALL 2020 TSDS PEIMS MILITARY-CONNECTED-STUDENT-CODE",
        "otherPossibleNames": [],
        "logicalName": "FALL_2020_TSDS_PEIMS_MILITARY_CONNECTED_STUDENT_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 165,
          "offsetEnd": 165,
          "columnNum": 42
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FALL 2020 TSDS PEIMS FOSTER-CARE-INDICATOR-CODE",
        "otherPossibleNames": [],
        "logicalName": "FALL_PEIMS_FST_CARE_CD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 166,
          "offsetEnd": 166,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CLASS GROUP NAME",
        "otherPossibleNames": [],
        "logicalName": "GROUP_NAME",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 167,
          "offsetEnd": 186,
          "columnNum": 44
        },
        "fieldLength": 20,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 187,
          "offsetEnd": 189,
          "columnNum": 45
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NEW TO TEXAS",
        "otherPossibleNames": [],
        "logicalName": "NEW_TO_TEXAS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 190,
          "offsetEnd": 190,
          "columnNum": 46
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TX-UNIQUE-STUDENT-ID",
        "otherPossibleNames": [],
        "logicalName": "TSDS_SYSTEM_UNIQUE_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 191,
          "offsetEnd": 200,
          "columnNum": 47
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LOCAL_USE_READING",
        "otherPossibleNames": [],
        "logicalName": "LOCAL_USE_READING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 201,
          "offsetEnd": 204,
          "columnNum": 48
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LOCAL_USE_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "LOCAL_USE_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 205,
          "offsetEnd": 208,
          "columnNum": 49
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LOCAL_USE_WRITING",
        "otherPossibleNames": [],
        "logicalName": "LOCAL_USE_WRITING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 209,
          "offsetEnd": 212,
          "columnNum": 50
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LOCAL_USE_SOCIAL_STUDIES",
        "otherPossibleNames": [],
        "logicalName": "LOCAL_USE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 213,
          "offsetEnd": 216,
          "columnNum": 51
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LOCAL_USE_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "LOCAL_USE_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 217,
          "offsetEnd": 220,
          "columnNum": 52
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AGENCY_USE_READING",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_READING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 221,
          "offsetEnd": 225,
          "columnNum": 53
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AGENCY_USE_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 226,
          "offsetEnd": 230,
          "columnNum": 54
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AGENCY_USE_WRITING",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_WRITING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 231,
          "offsetEnd": 235,
          "columnNum": 55
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AGENCY_USE_SOCIAL_STUDIES",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 236,
          "offsetEnd": 240,
          "columnNum": 56
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AGENCY_USE_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 241,
          "offsetEnd": 245,
          "columnNum": 57
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 246,
          "offsetEnd": 350,
          "columnNum": 58
        },
        "fieldLength": 105,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCORE_CODE_INFORMATION_READING",
        "otherPossibleNames": [],
        "logicalName": "SCORE_CODE_INFORMATION_READING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 351,
          "offsetEnd": 351,
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": [
          "A",
          "D",
          "M",
          "N",
          "O",
          "P",
          "W",
          "*",
          "S"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCORE_CODE_INFORMATION_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "SCORE_CODE_INFORMATION_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 352,
          "offsetEnd": 352,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": [
          "A",
          "D",
          "M",
          "N",
          "O",
          "P",
          "W",
          "*",
          "S"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCORE_CODE_INFORMATION_WRITING",
        "otherPossibleNames": [],
        "logicalName": "SCORE_CODE_INFORMATION_WRITING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 353,
          "offsetEnd": 353,
          "columnNum": 61
        },
        "fieldLength": 1,
        "expectedValues": [
          "A",
          "D",
          "M",
          "N",
          "O",
          "P",
          "W",
          "*",
          "S"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCORE_CODE_INFORMATION_SOCIAL_STUDIES",
        "otherPossibleNames": [],
        "logicalName": "SCORE_CODE_INFORMATION_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 354,
          "offsetEnd": 354,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": [
          "A",
          "D",
          "M",
          "N",
          "O",
          "P",
          "W",
          "*",
          "S"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCORE_CODE_INFORMATION_SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "SCORE_CODE_INFORMATION_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 355,
          "offsetEnd": 355,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": [
          "A",
          "D",
          "M",
          "N",
          "O",
          "P",
          "W",
          "*",
          "S"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 356,
          "offsetEnd": 400,
          "columnNum": 64
        },
        "fieldLength": 45,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING REPORTING CATEGORY SCORES",
        "otherPossibleNames": [],
        "logicalName": "READING_REPORTING_CATEGORY_SCORES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 401,
          "offsetEnd": 406,
          "columnNum": 65
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING RAW SCORE",
        "otherPossibleNames": [],
        "logicalName": "READING_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 407,
          "offsetEnd": 408,
          "columnNum": 66
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING SCALE SCORE",
        "otherPossibleNames": [],
        "logicalName": "READING_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 409,
          "offsetEnd": 412,
          "columnNum": 67
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 413,
          "offsetEnd": 413,
          "columnNum": 68
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING TEST VERSION",
        "otherPossibleNames": [],
        "logicalName": "READING_TEST_VERSION",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 414,
          "offsetEnd": 414,
          "columnNum": 69
        },
        "fieldLength": 1,
        "expectedValues": [
          "T"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 415,
          "offsetEnd": 415,
          "columnNum": 70
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING TRANSLATED STUDENT MATERIALS",
        "otherPossibleNames": [],
        "logicalName": "READING_TRANSLATED_STUDENT_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 416,
          "offsetEnd": 416,
          "columnNum": 71
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 417,
          "offsetEnd": 423,
          "columnNum": 72
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE IN READING",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE_IN_READING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 424,
          "offsetEnd": 424,
          "columnNum": 73
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LEVEL III: ACCOMPLISHED ACADEMIC PERFORMANCE IN READING",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE_IN_READING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 425,
          "offsetEnd": 425,
          "columnNum": 74
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STAAR ALTERNATE 2 READING PROGRESS MEASURE",
        "otherPossibleNames": [],
        "logicalName": "READING_STAAR_PROGRESS_MEASURE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 426,
          "offsetEnd": 426,
          "columnNum": 75
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 427,
          "offsetEnd": 428,
          "columnNum": 76
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING_ON TRACK TO LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE",
        "otherPossibleNames": [],
        "logicalName": "READING_ON_TRACK_TO_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 429,
          "offsetEnd": 429,
          "columnNum": 77
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_PREVIOUS-YEAR ADMINISTRATION DATE",
        "otherPossibleNames": [],
        "logicalName": "READING_PREVIOUS_YEAR_ADMINISTRATION_DATE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 430,
          "offsetEnd": 433,
          "columnNum": 78
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING_PREVIOUS-YEAR SCALE SCORE",
        "otherPossibleNames": [],
        "logicalName": "READING_PREVIOUS_YEAR_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 434,
          "offsetEnd": 437,
          "columnNum": 79
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 438,
          "offsetEnd": 439,
          "columnNum": 80
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING_PREVIOUS-YEAR SCORE CODE",
        "otherPossibleNames": [],
        "logicalName": "READING_PREVIOUS_YEAR_SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 440,
          "offsetEnd": 440,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING_PREVIOUS-YEAR LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE",
        "otherPossibleNames": [],
        "logicalName": "READING_PREVIOUS_YEAR_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 441,
          "offsetEnd": 441,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_PREVIOUS-YEAR LEVEL III: ACCOMPLISHED ACADEMIC PERFORMANCE",
        "otherPossibleNames": [],
        "logicalName": "READING_PREVIOUS_YEAR_LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 442,
          "offsetEnd": 442,
          "columnNum": 83
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_PREVIOUS-YEAR TESTED GRADE",
        "otherPossibleNames": [],
        "logicalName": "READING_PREVIOUS_YEAR_TESTED_GRADE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 443,
          "offsetEnd": 444,
          "columnNum": 84
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 445,
          "offsetEnd": 450,
          "columnNum": 85
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 451,
          "offsetEnd": 470,
          "columnNum": 86
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 471,
          "offsetEnd": 502,
          "columnNum": 87
        },
        "fieldLength": 32,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 503,
          "offsetEnd": 522,
          "columnNum": 88
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 523,
          "offsetEnd": 650,
          "columnNum": 89
        },
        "fieldLength": 128,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING_Color or Highlight",
        "otherPossibleNames": [],
        "logicalName": "READING_COLOR_OR_HIGHLIGHT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 651,
          "offsetEnd": 651,
          "columnNum": 90
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Color Overlays",
        "otherPossibleNames": [],
        "logicalName": "READING_COLOR_OVERLAYS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 652,
          "offsetEnd": 652,
          "columnNum": 91
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 653,
          "offsetEnd": 653,
          "columnNum": 92
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "READING_Photographs or Objects",
        "otherPossibleNames": [],
        "logicalName": "READING_PHOTOGRAPHS_OR_OBJECTS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 654,
          "offsetEnd": 654,
          "columnNum": 93
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Textured Materials",
        "otherPossibleNames": [],
        "logicalName": "READING_TEXTURED_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 655,
          "offsetEnd": 655,
          "columnNum": 94
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Demonstrate",
        "otherPossibleNames": [],
        "logicalName": "READING_DEMONSTRATE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 656,
          "offsetEnd": 656,
          "columnNum": 95
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Raise or Darken Outline",
        "otherPossibleNames": [],
        "logicalName": "READING_RAISE_OR_DARKEN_OUTLINE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 657,
          "offsetEnd": 657,
          "columnNum": 96
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Enlarge",
        "otherPossibleNames": [],
        "logicalName": "READING_ENLARGE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 658,
          "offsetEnd": 658,
          "columnNum": 97
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Braille",
        "otherPossibleNames": [],
        "logicalName": "READING_BRAILLE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 659,
          "offsetEnd": 659,
          "columnNum": 98
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Describe Images",
        "otherPossibleNames": [],
        "logicalName": "READING_DESCRIBE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 660,
          "offsetEnd": 660,
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Provide Images or Text Separately",
        "otherPossibleNames": [],
        "logicalName": "READING_PROVIDE_IMAGES_OR_TEXT_SEPARATELY",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 661,
          "offsetEnd": 661,
          "columnNum": 100
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Isolate Images",
        "otherPossibleNames": [],
        "logicalName": "READING_ISOLATE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 662,
          "offsetEnd": 662,
          "columnNum": 101
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Picture Representations",
        "otherPossibleNames": [],
        "logicalName": "READING_PICTURE_REPRESENTATIONS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 663,
          "offsetEnd": 663,
          "columnNum": 102
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Reread Text",
        "otherPossibleNames": [],
        "logicalName": "READING_REREAD_TEXT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 664,
          "offsetEnd": 664,
          "columnNum": 103
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "otherPossibleNames": [],
        "logicalName": "READING_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 665,
          "offsetEnd": 665,
          "columnNum": 104
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "READING_Provide Structured Reminders",
        "otherPossibleNames": [],
        "logicalName": "READING_PROVIDE_STRUCTURED_REMINDERS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 666,
          "offsetEnd": 666,
          "columnNum": 105
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 667,
          "offsetEnd": 750,
          "columnNum": 106
        },
        "fieldLength": 84,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS REPORTING CATEGORY SCORES",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_REPORTING_CATEGORY_SCORES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 751,
          "offsetEnd": 758,
          "columnNum": 107
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 759,
          "offsetEnd": 760,
          "columnNum": 108
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS RAW SCORE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 761,
          "offsetEnd": 762,
          "columnNum": 109
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS SCALE SCORE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 763,
          "offsetEnd": 766,
          "columnNum": 110
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 767,
          "offsetEnd": 767,
          "columnNum": 111
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS TEST VERSION",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_TEST_VERSION",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 768,
          "offsetEnd": 768,
          "columnNum": 112
        },
        "fieldLength": 1,
        "expectedValues": [
          "T"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 769,
          "offsetEnd": 769,
          "columnNum": 113
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS TRANSLATED STUDENT MATERIALS",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_TRANSLATED_STUDENT_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 770,
          "offsetEnd": 770,
          "columnNum": 114
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 771,
          "offsetEnd": 777,
          "columnNum": 115
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE IN MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE_IN_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 778,
          "offsetEnd": 778,
          "columnNum": 116
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LEVEL III: ACCOMPLISHED ACADEMIC PERFORMANCE IN MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE_IN_MATHEMATICS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 779,
          "offsetEnd": 779,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "STAAR ALTERNATE 2 MATHEMATICS PROGRESS MEASURE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_STAAR_PROGRESS_MEASURE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 780,
          "offsetEnd": 780,
          "columnNum": 118
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [
          "1",
          "2",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 781,
          "offsetEnd": 781,
          "columnNum": 119
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_ON TRACK TO LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_ON_TRACK_TO_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 782,
          "offsetEnd": 782,
          "columnNum": 120
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_PREVIOUS-YEAR ADMINISTRATION DATE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PREVIOUS_YEAR_ADMINISTRATION_DATE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 783,
          "offsetEnd": 786,
          "columnNum": 121
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_PREVIOUS-YEAR SCALE SCORE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PREVIOUS_YEAR_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 787,
          "offsetEnd": 790,
          "columnNum": 122
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 791,
          "offsetEnd": 792,
          "columnNum": 123
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_PREVIOUS-YEAR SCORE CODE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PREVIOUS_YEAR_SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 793,
          "offsetEnd": 793,
          "columnNum": 124
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_PREVIOUS-YEAR LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PREVIOUS_YEAR_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 794,
          "offsetEnd": 794,
          "columnNum": 125
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_PREVIOUS-YEAR LEVEL III: ACCOMPLISHED ACADEMIC PERFORMANCE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PREVIOUS_YEAR_LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 795,
          "offsetEnd": 795,
          "columnNum": 126
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_PREVIOUS-YEAR TESTED GRADE",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PREVIOUS_YEAR_TESTED_GRADE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 796,
          "offsetEnd": 797,
          "columnNum": 127
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 798,
          "offsetEnd": 800,
          "columnNum": 128
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 801,
          "offsetEnd": 820,
          "columnNum": 129
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 821,
          "offsetEnd": 856,
          "columnNum": 130
        },
        "fieldLength": 36,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 857,
          "offsetEnd": 876,
          "columnNum": 131
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 877,
          "offsetEnd": 1000,
          "columnNum": 132
        },
        "fieldLength": 124,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Color or Highlight",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_COLOR_OR_HIGHLIGHT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1001,
          "offsetEnd": 1001,
          "columnNum": 133
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Color Overlays",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_COLOR_OVERLAYS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1002,
          "offsetEnd": 1002,
          "columnNum": 134
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1003,
          "offsetEnd": 1003,
          "columnNum": 135
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Photographs or Objects",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PHOTOGRAPHS_OR_OBJECTS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1004,
          "offsetEnd": 1004,
          "columnNum": 136
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Textured Materials",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_TEXTURED_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1005,
          "offsetEnd": 1005,
          "columnNum": 137
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Demonstrate",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_DEMONSTRATE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1006,
          "offsetEnd": 1006,
          "columnNum": 138
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Raise or Darken Outline",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_RAISE_OR_DARKEN_OUTLINE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1007,
          "offsetEnd": 1007,
          "columnNum": 139
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Enlarge",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_ENLARGE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1008,
          "offsetEnd": 1008,
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Braille",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_BRAILLE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1009,
          "offsetEnd": 1009,
          "columnNum": 141
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Describe Images",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_DESCRIBE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1010,
          "offsetEnd": 1010,
          "columnNum": 142
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Provide Images or Text Separately",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PROVIDE_IMAGES_OR_TEXT_SEPARATELY",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1011,
          "offsetEnd": 1011,
          "columnNum": 143
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Isolate Images",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_ISOLATE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1012,
          "offsetEnd": 1012,
          "columnNum": 144
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Picture Representations",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PICTURE_REPRESENTATIONS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1013,
          "offsetEnd": 1013,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Reread Text",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_REREAD_TEXT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1014,
          "offsetEnd": 1014,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1015,
          "offsetEnd": 1015,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MATHEMATICS_Provide Structured Reminders",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICS_PROVIDE_STRUCTURED_REMINDERS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1016,
          "offsetEnd": 1016,
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1017,
          "offsetEnd": 1100,
          "columnNum": 149
        },
        "fieldLength": 84,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WRITING REPORTING CATEGORY SCORES",
        "otherPossibleNames": [],
        "logicalName": "WRITING_REPORTING_CATEGORY_SCORES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1101,
          "offsetEnd": 1106,
          "columnNum": 150
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WRITING RAW SCORE",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1107,
          "offsetEnd": 1108,
          "columnNum": 151
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING SCALE SCORE",
        "otherPossibleNames": [],
        "logicalName": "WRITING_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1109,
          "offsetEnd": 1112,
          "columnNum": 152
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1113,
          "offsetEnd": 1113,
          "columnNum": 153
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WRITING TEST VERSION",
        "otherPossibleNames": [],
        "logicalName": "WRITING_TEST_VERSION",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1114,
          "offsetEnd": 1114,
          "columnNum": 154
        },
        "fieldLength": 1,
        "expectedValues": [
          "T"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1115,
          "offsetEnd": 1115,
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WRITING TRANSLATED STUDENT MATERIALS",
        "otherPossibleNames": [],
        "logicalName": "WRITING_TRANSLATED_STUDENT_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1116,
          "offsetEnd": 1116,
          "columnNum": 156
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1117,
          "offsetEnd": 1123,
          "columnNum": 157
        },
        "fieldLength": 7,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE IN WRITING",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE_IN_WRITING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1124,
          "offsetEnd": 1124,
          "columnNum": 158
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEVEL III: ACCOMPLISHED ACADEMIC PERFORMANCE IN WRITING",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE_IN_WRITING",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1125,
          "offsetEnd": 1125,
          "columnNum": 159
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1126,
          "offsetEnd": 1200,
          "columnNum": 160
        },
        "fieldLength": 75,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1201,
          "offsetEnd": 1220,
          "columnNum": 161
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1221,
          "offsetEnd": 1240,
          "columnNum": 162
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1241,
          "offsetEnd": 1260,
          "columnNum": 163
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1261,
          "offsetEnd": 1400,
          "columnNum": 164
        },
        "fieldLength": 140,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WRITING_Color or Highlight",
        "otherPossibleNames": [],
        "logicalName": "WRITING_COLOR_OR_HIGHLIGHT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1401,
          "offsetEnd": 1401,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Color Overlays",
        "otherPossibleNames": [],
        "logicalName": "WRITING_COLOR_OVERLAYS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1402,
          "offsetEnd": 1402,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1403,
          "offsetEnd": 1403,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WRITING_Photographs or Objects",
        "otherPossibleNames": [],
        "logicalName": "WRITING_PHOTOGRAPHS_OR_OBJECTS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1404,
          "offsetEnd": 1404,
          "columnNum": 168
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Textured Materials",
        "otherPossibleNames": [],
        "logicalName": "WRITING_TEXTURED_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1405,
          "offsetEnd": 1405,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Demonstrate",
        "otherPossibleNames": [],
        "logicalName": "WRITING_DEMONSTRATE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1406,
          "offsetEnd": 1406,
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Raise or Darken Outline",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RAISE_OR_DARKEN_OUTLINE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1407,
          "offsetEnd": 1407,
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Enlarge",
        "otherPossibleNames": [],
        "logicalName": "WRITING_ENLARGE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1408,
          "offsetEnd": 1408,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Braille",
        "otherPossibleNames": [],
        "logicalName": "WRITING_BRAILLE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1409,
          "offsetEnd": 1409,
          "columnNum": 173
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Describe Images",
        "otherPossibleNames": [],
        "logicalName": "WRITING_DESCRIBE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1410,
          "offsetEnd": 1410,
          "columnNum": 174
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Provide Images or Text Separately",
        "otherPossibleNames": [],
        "logicalName": "WRITING_PROVIDE_IMAGES_OR_TEXT_SEPARATELY",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1411,
          "offsetEnd": 1411,
          "columnNum": 175
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Isolate Images",
        "otherPossibleNames": [],
        "logicalName": "WRITING_ISOLATE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1412,
          "offsetEnd": 1412,
          "columnNum": 176
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Picture Representations",
        "otherPossibleNames": [],
        "logicalName": "WRITING_PICTURE_REPRESENTATIONS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1413,
          "offsetEnd": 1413,
          "columnNum": 177
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Reread Text",
        "otherPossibleNames": [],
        "logicalName": "WRITING_REREAD_TEXT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1414,
          "offsetEnd": 1414,
          "columnNum": 178
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "otherPossibleNames": [],
        "logicalName": "WRITING_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1415,
          "offsetEnd": 1415,
          "columnNum": 179
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WRITING_Provide Structured Reminders",
        "otherPossibleNames": [],
        "logicalName": "WRITING_PROVIDE_STRUCTURED_REMINDERS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1416,
          "offsetEnd": 1416,
          "columnNum": 180
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1417,
          "offsetEnd": 1500,
          "columnNum": 181
        },
        "fieldLength": 84,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SOCIAL STUDIES REPORTING CATEGORY SCORES",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_REPORTING_CATEGORY_SCORES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1501,
          "offsetEnd": 1508,
          "columnNum": 182
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SOCIAL STUDIES RAW SCORE",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1509,
          "offsetEnd": 1510,
          "columnNum": 183
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SOCIAL STUDIES SCALE SCORE",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1511,
          "offsetEnd": 1514,
          "columnNum": 184
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1515,
          "offsetEnd": 1515,
          "columnNum": 185
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SOCIAL STUDIES TEST VERSION",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_TEST_VERSION",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1516,
          "offsetEnd": 1516,
          "columnNum": 186
        },
        "fieldLength": 1,
        "expectedValues": [
          "T"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1519,
          "offsetEnd": 1525,
          "columnNum": 187
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE IN SOCIAL STUDIES",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE_IN_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1526,
          "offsetEnd": 1526,
          "columnNum": 188
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LEVEL III: ACCOMPLISHED ACADEMIC PERFORMANCE IN SOCIAL STUDIES",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE_IN_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1527,
          "offsetEnd": 1527,
          "columnNum": 189
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1528,
          "offsetEnd": 1600,
          "columnNum": 190
        },
        "fieldLength": 73,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1601,
          "offsetEnd": 1620,
          "columnNum": 191
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1621,
          "offsetEnd": 1652,
          "columnNum": 192
        },
        "fieldLength": 32,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1653,
          "offsetEnd": 1672,
          "columnNum": 193
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1673,
          "offsetEnd": 1800,
          "columnNum": 194
        },
        "fieldLength": 128,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Color or Highlight",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_COLOR_OR_HIGHLIGHT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1801,
          "offsetEnd": 1801,
          "columnNum": 195
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Color Overlays",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_COLOR_OVERLAYS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1802,
          "offsetEnd": 1802,
          "columnNum": 196
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1803,
          "offsetEnd": 1803,
          "columnNum": 197
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Photographs or Objects",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_PHOTOGRAPHS_OR_OBJECTS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1804,
          "offsetEnd": 1804,
          "columnNum": 198
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Textured Materials",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_TEXTURED_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1805,
          "offsetEnd": 1805,
          "columnNum": 199
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Demonstrate",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_DEMONSTRATE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1806,
          "offsetEnd": 1806,
          "columnNum": 200
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Raise or Darken Outline",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_RAISE_OR_DARKEN_OUTLINE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1807,
          "offsetEnd": 1807,
          "columnNum": 201
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Enlarge",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_ENLARGE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1808,
          "offsetEnd": 1808,
          "columnNum": 202
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Braille",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_BRAILLE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1809,
          "offsetEnd": 1809,
          "columnNum": 203
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Describe Images",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_DESCRIBE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1810,
          "offsetEnd": 1810,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Provide Images or Text Separately",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_PROVIDE_IMAGES_OR_TEXT_SEPARATELY",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1811,
          "offsetEnd": 1811,
          "columnNum": 205
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Isolate Images",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_ISOLATE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1812,
          "offsetEnd": 1812,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Picture Representations",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_PICTURE_REPRESENTATIONS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1813,
          "offsetEnd": 1813,
          "columnNum": 207
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Reread Text",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_REREAD_TEXT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1814,
          "offsetEnd": 1814,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1815,
          "offsetEnd": 1815,
          "columnNum": 209
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SOCIAL_STUDIES_Provide Structured Reminders",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_PROVIDE_STRUCTURED_REMINDERS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1816,
          "offsetEnd": 1816,
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1817,
          "offsetEnd": 1900,
          "columnNum": 211
        },
        "fieldLength": 84,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCIENCE REPORTING CATEGORY SCORES",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_REPORTING_CATEGORY_SCORES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1901,
          "offsetEnd": 1908,
          "columnNum": 212
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCIENCE RAW SCORE",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1909,
          "offsetEnd": 1910,
          "columnNum": 213
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCIENCE SCALE SCORE",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1911,
          "offsetEnd": 1914,
          "columnNum": 214
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1915,
          "offsetEnd": 1915,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCIENCE TEST VERSION",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_TEST_VERSION",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1916,
          "offsetEnd": 1916,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": [
          "T"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1917,
          "offsetEnd": 1917,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCIENCE TRANSLATED STUDENT MATERIALS",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_TRANSLATED_STUDENT_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1918,
          "offsetEnd": 1918,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1919,
          "offsetEnd": 1925,
          "columnNum": 219
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEVEL II: SATISFACTORY ACADEMIC PERFORMANCE IN SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE_IN_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1926,
          "offsetEnd": 1926,
          "columnNum": 220
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LEVEL III: ACCOMPLISHED ACADEMIC PERFORMANCE IN SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE_IN_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1927,
          "offsetEnd": 1927,
          "columnNum": 221
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1928,
          "offsetEnd": 2000,
          "columnNum": 222
        },
        "fieldLength": 73,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2001,
          "offsetEnd": 2020,
          "columnNum": 223
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2021,
          "offsetEnd": 2054,
          "columnNum": 224
        },
        "fieldLength": 34,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2055,
          "offsetEnd": 2074,
          "columnNum": 225
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2075,
          "offsetEnd": 2200,
          "columnNum": 226
        },
        "fieldLength": 126,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Color or Highlight",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_COLOR_OR_HIGHLIGHT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2201,
          "offsetEnd": 2201,
          "columnNum": 227
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Color Overlays",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_COLOR_OVERLAYS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2202,
          "offsetEnd": 2202,
          "columnNum": 228
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2203,
          "offsetEnd": 2203,
          "columnNum": 229
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Photographs or Objects",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_PHOTOGRAPHS_OR_OBJECTS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2204,
          "offsetEnd": 2204,
          "columnNum": 230
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Textured Materials",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_TEXTURED_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2205,
          "offsetEnd": 2205,
          "columnNum": 231
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Demonstrate",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_DEMONSTRATE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2206,
          "offsetEnd": 2206,
          "columnNum": 232
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Raise or Darken Outline",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_RAISE_OR_DARKEN_OUTLINE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2207,
          "offsetEnd": 2207,
          "columnNum": 233
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Enlarge",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_ENLARGE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2208,
          "offsetEnd": 2208,
          "columnNum": 234
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Braille",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_BRAILLE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2209,
          "offsetEnd": 2209,
          "columnNum": 235
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Describe Images",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_DESCRIBE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2210,
          "offsetEnd": 2210,
          "columnNum": 236
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Provide Images or Text Separately",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_PROVIDE_IMAGES_OR_TEXT_SEPARATELY",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2211,
          "offsetEnd": 2211,
          "columnNum": 237
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Isolate Images",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_ISOLATE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2212,
          "offsetEnd": 2212,
          "columnNum": 238
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Picture Representations",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_PICTURE_REPRESENTATIONS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2213,
          "offsetEnd": 2213,
          "columnNum": 239
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Reread Text",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_REREAD_TEXT",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2214,
          "offsetEnd": 2214,
          "columnNum": 240
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_USE_CALCULATOR_MANIPULATIVES_OR_MATH_TOOLS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2215,
          "offsetEnd": 2215,
          "columnNum": 241
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SCIENCE_Provide Structured Reminders",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_PROVIDE_STRUCTURED_REMINDERS",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2216,
          "offsetEnd": 2216,
          "columnNum": 242
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "0"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2217,
          "offsetEnd": 2530,
          "columnNum": 243
        },
        "fieldLength": 314,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_READING_HISTORY_County-District-Campus Number",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_READING_HISTORY_COUNTY_DISTRICT_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2531,
          "offsetEnd": 2539,
          "columnNum": 244
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2540,
          "offsetEnd": 2541,
          "columnNum": 245
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_READING_HISTORY_Score Code",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_READING_HISTORY_SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2542,
          "offsetEnd": 2542,
          "columnNum": 246
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_READING_HISTORY_Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_READING_HISTORY_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2543,
          "offsetEnd": 2543,
          "columnNum": 247
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_READING_HISTORY_Level III: Accomplished Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_READING_HISTORY_LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2544,
          "offsetEnd": 2544,
          "columnNum": 248
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_READING_HISTORY_Scale Score",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_READING_HISTORY_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2545,
          "offsetEnd": 2548,
          "columnNum": 249
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_READING_HISTORY_Tested Grade",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_READING_HISTORY_TESTED_GRADE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2549,
          "offsetEnd": 2550,
          "columnNum": 250
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2551,
          "offsetEnd": 2552,
          "columnNum": 251
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_READING_HISTORY_On Track To Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_READING_HISTORY_ON_TRACK_TO_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2553,
          "offsetEnd": 2553,
          "columnNum": 252
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_READING_HISTORY_STAAR Alternate 2 Progress Measure",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_READING_HISTORY_STAAR_ALTERNATE_2_PROGRESS_MEASURE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2554,
          "offsetEnd": 2554,
          "columnNum": 253
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2555,
          "offsetEnd": 2650,
          "columnNum": 254
        },
        "fieldLength": 96,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_County-District-Campus Number",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_COUNTY_DISTRICT_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2651,
          "offsetEnd": 2659,
          "columnNum": 255
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2660,
          "offsetEnd": 2661,
          "columnNum": 256
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_Score Code",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2662,
          "offsetEnd": 2662,
          "columnNum": 257
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2663,
          "offsetEnd": 2663,
          "columnNum": 258
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_Level III: Accomplished Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2664,
          "offsetEnd": 2664,
          "columnNum": 259
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_Scale Score",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2665,
          "offsetEnd": 2668,
          "columnNum": 260
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_Tested Grade",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_TESTED_GRADE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2669,
          "offsetEnd": 2670,
          "columnNum": 261
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2671,
          "offsetEnd": 2672,
          "columnNum": 262
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_On Track To Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_ON_TRACK_TO_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2673,
          "offsetEnd": 2673,
          "columnNum": 263
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_STAAR Alternate 2 Progress Measure",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_MATHEMATICS_HISTORY_STAAR_ALTERNATE_2_PROGRESS_MEASURE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2674,
          "offsetEnd": 2674,
          "columnNum": 264
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2675,
          "offsetEnd": 2740,
          "columnNum": 265
        },
        "fieldLength": 66,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_WRITING_HISTORY_County-District-Campus Number",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_COUNTY_DISTRICT_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2741,
          "offsetEnd": 2749,
          "columnNum": 266
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2750,
          "offsetEnd": 2751,
          "columnNum": 267
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_WRITING_HISTORY_Score Code",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2752,
          "offsetEnd": 2752,
          "columnNum": 268
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_WRITING_HISTORY_Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2753,
          "offsetEnd": 2753,
          "columnNum": 269
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_WRITING_HISTORY_Level III: Accomplished Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2754,
          "offsetEnd": 2754,
          "columnNum": 270
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_WRITING_HISTORY_Scale Score",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2755,
          "offsetEnd": 2758,
          "columnNum": 271
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_WRITING_HISTORY_Tested Grade",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_WRITING_HISTORY_TESTED_GRADE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2759,
          "offsetEnd": 2760,
          "columnNum": 272
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2761,
          "offsetEnd": 2770,
          "columnNum": 273
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_County-District-Campus Number",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_COUNTY_DISTRICT_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2771,
          "offsetEnd": 2779,
          "columnNum": 274
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2780,
          "offsetEnd": 2781,
          "columnNum": 275
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_Score Code",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2782,
          "offsetEnd": 2782,
          "columnNum": 276
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2783,
          "offsetEnd": 2783,
          "columnNum": 277
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_Level III: Accomplished Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2784,
          "offsetEnd": 2784,
          "columnNum": 278
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_Scale Score",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2785,
          "offsetEnd": 2788,
          "columnNum": 279
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_Tested Grade",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SOCIAL_STUDIES_HISTORY_TESTED_GRADE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2789,
          "offsetEnd": 2790,
          "columnNum": 280
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2791,
          "offsetEnd": 2800,
          "columnNum": 281
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_County-District-Campus Number",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_COUNTY_DISTRICT_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2801,
          "offsetEnd": 2809,
          "columnNum": 282
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2810,
          "offsetEnd": 2811,
          "columnNum": 283
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_Score Code",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2812,
          "offsetEnd": 2812,
          "columnNum": 284
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_LEVEL_II:_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2813,
          "offsetEnd": 2813,
          "columnNum": 285
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_Level III: Accomplished Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_LEVEL_III:_ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2814,
          "offsetEnd": 2814,
          "columnNum": 286
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_Scale Score",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2815,
          "offsetEnd": 2818,
          "columnNum": 287
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_Tested Grade",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SCIENCE_HISTORY_TESTED_GRADE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2819,
          "offsetEnd": 2820,
          "columnNum": 288
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLANK",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2821,
          "offsetEnd": 3999,
          "columnNum": 289
        },
        "fieldLength": 1179,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PERIOD",
        "otherPossibleNames": [],
        "logicalName": "PERIOD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4000,
          "offsetEnd": 4000,
          "columnNum": 290
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [
    ".txt"
  ]
}