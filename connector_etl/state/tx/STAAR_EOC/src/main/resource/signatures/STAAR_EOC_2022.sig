{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "STAAR_EOC_2022",
    "recordLength": 2000,
    "naturalKey": ["ADMINISTRATION_DATE", "TEST_VERSION", "END_OF_COURSE_CODE", "LOCAL_STUDENT_ID", "FIRST_NAME", "MIDDLE_INITIAL", "LAST_NAME","RAW_SCORE"],
    "fields": [
      {
        "physicalName": "Administration Date",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATION_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 4,
          "columnNum": 1
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [
         "1517","1518","1519","1520","1521","1522"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Grade-Level-Code",
        "otherPossibleNames": [],
        "logicalName": "GRADE_LEVEL_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 5,
          "offsetEnd": 6,
          "columnNum": 2
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": ["09", "10", "11", "12"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ESC Region Number",
        "otherPossibleNames": [],
        "logicalName": "ESC_REGION_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 7,
          "offsetEnd": 8,
          "columnNum": 3
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "County-District-Campus Number",
        "otherPossibleNames": [],
        "logicalName": "COUNTY_DISTRICT_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 9,
          "offsetEnd": 17,
          "columnNum": 4
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "District-Name",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 18,
          "offsetEnd": 32,
          "columnNum": 5
        },
        "fieldLength": 15,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Campus-Name",
        "otherPossibleNames": [],
        "logicalName": "CAMPUS_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 33,
          "offsetEnd": 47,
          "columnNum": 6
        },
        "fieldLength": 15,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Last-Name",
        "otherPossibleNames": [],
        "logicalName": "LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 48,
          "offsetEnd": 62,
          "columnNum": 7
        },
        "fieldLength": 15,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "First-Name",
        "otherPossibleNames": [],
        "logicalName": "FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 63,
          "offsetEnd": 72,
          "columnNum": 8
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Middle Initial",
        "otherPossibleNames": [],
        "logicalName": "MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 73,
          "offsetEnd": 73,
          "columnNum": 9
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student-ID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 74,
          "offsetEnd": 82,
          "columnNum": 10
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Sex-Code",
        "otherPossibleNames": [],
        "logicalName": "SEX_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 83,
          "offsetEnd": 83,
          "columnNum": 11
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": ["M","F"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Date-of-birth",
        "otherPossibleNames": [],
        "logicalName": "DATE_OF_BIRTH",
        "formatMask": "MMDDYYYY",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 84,
          "offsetEnd": 91,
          "columnNum": 12
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 92,
          "offsetEnd": 92,
          "columnNum": 13
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hispanic-Latino-Code",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC_LATINO_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 93,
          "offsetEnd": 93,
          "columnNum": 14
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "American Indian-Alaska-Native-Code",
        "otherPossibleNames": [],
        "logicalName": "AMERICAN_INDIAN_ALASKA_NATIVE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 94,
          "offsetEnd": 94,
          "columnNum": 15
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Asian-Code",
        "otherPossibleNames": [],
        "logicalName": "ASIAN_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 95,
          "offsetEnd": 95,
          "columnNum": 16
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Black-African American Code",
        "otherPossibleNames": [],
        "logicalName": "BLACK_AFRICAN_AMERICAN_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 96,
          "offsetEnd": 96,
          "columnNum": 17
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native-Hawaiian-Pacific-Islander-Code",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_HAWAIIAN_PACIFIC_ISLANDER_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 97,
          "offsetEnd": 97,
          "columnNum": 18
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "White Code",
        "otherPossibleNames": [],
        "logicalName": "WHITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 98,
          "offsetEnd": 98,
          "columnNum": 19
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Ethnicity/Race Reporting Category",
        "otherPossibleNames": [],
        "logicalName": "ETHNICITY_RACE_REPORTING_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 99,
          "offsetEnd": 99,
          "columnNum": 20
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Economic-Disadvantage-Code",
        "otherPossibleNames": [],
        "logicalName": "ECONOMIC_DISADVANTAGE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 100,
          "offsetEnd": 100,
          "columnNum": 21
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Title-I-Part-A-Indicator-Code",
        "otherPossibleNames": [],
        "logicalName": "TITLE_I_PART_A_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 101,
          "offsetEnd": 101,
          "columnNum": 22
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Migrant-Indicator-Code",
        "otherPossibleNames": [],
        "logicalName": "MIGRANT_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 102,
          "offsetEnd": 102,
          "columnNum": 23
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
        "logicalName": "BLANK_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 103,
          "offsetEnd": 106,
          "columnNum": 24
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Emergent Bilingual Indicator Code",
        "otherPossibleNames": [],
        "logicalName": "LEP_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 107,
          "offsetEnd": 107,
          "columnNum": 25
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bilingual-Indicator Code",
        "otherPossibleNames": [],
        "logicalName": "BILINGUAL_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 108,
          "offsetEnd": 108,
          "columnNum": 26
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ESL-Indicator-Code",
        "otherPossibleNames": [],
        "logicalName": "ESL_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 109,
          "offsetEnd": 109,
          "columnNum": 27
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
        "logicalName": "BLANK_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 110,
          "offsetEnd": 110,
          "columnNum": 28
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Special-Ed-Indicator-Code",
        "otherPossibleNames": [],
        "logicalName": "SPECIAL_ED_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 111,
          "offsetEnd": 111,
          "columnNum": 29
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
        "logicalName": "BLANK_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 112,
          "offsetEnd": 116,
          "columnNum": 30
        },
        "fieldLength": 5,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gifted-Talented-Indicator-Code",
        "otherPossibleNames": [],
        "logicalName": "GIFTED_TALENTED_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 117,
          "offsetEnd": 117,
          "columnNum": 31
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "At-Risk-Indicator-Code",
        "otherPossibleNames": [],
        "logicalName": "AT_RISK_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 118,
          "offsetEnd": 118,
          "columnNum": 32
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
        "logicalName": "BLANK_5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 119,
          "offsetEnd": 122,
          "columnNum": 33
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Local-Student-ID",
        "otherPossibleNames": [],
        "logicalName": "LOCAL_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 123,
          "offsetEnd": 131,
          "columnNum": 34
        },
        "fieldLength": 9,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Result ID",
        "otherPossibleNames": [],
        "logicalName": "TEST_RESULT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 132,
          "offsetEnd": 140,
          "columnNum": 35
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
        "logicalName": "BLANK_6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 141,
          "offsetEnd": 143,
          "columnNum": 36
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Fall 2021 TSDS PEIMS County-District Campus Number",
        "otherPossibleNames": [],
        "logicalName": "FALL_PEIMS_CAMPUS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 144,
          "offsetEnd": 152,
          "columnNum": 37
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
        "logicalName": "BLANK_7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 153,
          "offsetEnd": 154,
          "columnNum": 38
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Fall 2021 TSDS PEIMS Student Attribution Code",
        "otherPossibleNames": [],
        "logicalName": "FALL_PEIMS_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 155,
          "offsetEnd": 156,
          "columnNum": 39
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Portal Unique Access Code",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_PORTAL_ACCESS_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 157,
          "offsetEnd": 162,
          "columnNum": 40
        },
        "fieldLength": 6,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Migrant Student in Texas Migrant Interstate Program (TMIP)",
        "otherPossibleNames": [],
        "logicalName": "MIGRANT_STUDENT_IN_TEXAS_MIGRANT_INTERSTATE_PROGRAM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 163,
          "offsetEnd": 163,
          "columnNum": 41
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
        "logicalName": "BLANK_8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 164,
          "offsetEnd": 164,
          "columnNum": 42
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Fall 2021 TSDS PEIMS Military-Connected-Student-Code",
        "otherPossibleNames": [],
        "logicalName": "FALL_2021_TSDS_PEIMS_MILITARY_CONNECTED_STUDENT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 165,
          "offsetEnd": 165,
          "columnNum": 43
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Fall 2021 TSDS PEIMS Foster Care Indicator",
        "otherPossibleNames": [],
        "logicalName": "FALL_2021_TSDS_PEIMS_FOSTER_CARE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 166,
          "offsetEnd": 166,
          "columnNum": 44
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
        "logicalName": "BLANK_9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 167,
          "offsetEnd": 186,
          "columnNum": 45
        },
        "fieldLength": 20,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Fall 2021 TSDS PEIMS Dyslexia-Indicator-Code",
        "otherPossibleNames": [],
        "logicalName": "FALL_2021_TSDS_PEIMS_DYSLEXIA_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 187,
          "offsetEnd": 187,
          "columnNum": 46
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
        "logicalName": "BLANK_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 188,
          "offsetEnd": 189,
          "columnNum": 47
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "New to Texas",
        "otherPossibleNames": [],
        "logicalName": "NEW_TO_TEXAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 190,
          "offsetEnd": 190,
          "columnNum": 48
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TX Unique Student-ID",
        "otherPossibleNames": [],
        "logicalName": "TX_UNIQUE_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 191,
          "offsetEnd": 200,
          "columnNum": 49
        },
        "fieldLength": 10,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "End-of-Course Code",
        "otherPossibleNames": [],
        "logicalName": "END_OF_COURSE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 201,
          "offsetEnd": 202,
          "columnNum": 50
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Local Use",
        "otherPossibleNames": [],
        "logicalName": "LOCAL_USE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 203,
          "offsetEnd": 206,
          "columnNum": 51
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
        "logicalName": "BLANK_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 207,
          "offsetEnd": 214,
          "columnNum": 52
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Agency Use A",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_A",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 215,
          "offsetEnd": 215,
          "columnNum": 53
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Agency Use B",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_B",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 216,
          "offsetEnd": 216,
          "columnNum": 54
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Agency Use C",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_C",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 217,
          "offsetEnd": 217,
          "columnNum": 55
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Agency Use D",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_D",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 218,
          "offsetEnd": 218,
          "columnNum": 56
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Agency Use E",
        "otherPossibleNames": [],
        "logicalName": "AGENCY_USE_E",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 219,
          "offsetEnd": 219,
          "columnNum": 57
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
        "logicalName": "BLANK_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 220,
          "offsetEnd": 290,
          "columnNum": 58
        },
        "fieldLength": 71,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Score Code",
        "otherPossibleNames": [],
        "logicalName": "SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 291,
          "offsetEnd": 291,
          "columnNum": 59
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": ["A","M","N","O","S"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 292,
          "offsetEnd": 305,
          "columnNum": 60
        },
        "fieldLength": 14,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Version",
        "otherPossibleNames": [],
        "logicalName": "TEST_VERSION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 306,
          "offsetEnd": 306,
          "columnNum": 61
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [
          "T"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 307,
          "offsetEnd": 307,
          "columnNum": 62
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Translated Student Materials",
        "otherPossibleNames": [],
        "logicalName": "TRANSLATED_STUDENT_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 308,
          "offsetEnd": 308,
          "columnNum": 63
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
        "logicalName": "BLANK_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 309,
          "offsetEnd": 350,
          "columnNum": 64
        },
        "fieldLength": 42,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 1 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_1_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 351,
          "offsetEnd": 352,
          "columnNum": 65
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 2 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_2_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 353,
          "offsetEnd": 354,
          "columnNum": 66
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 3 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_3_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 355,
          "offsetEnd": 356,
          "columnNum": 67
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 4 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_4_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 357,
          "offsetEnd": 358,
          "columnNum": 68
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 5 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_5_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 359,
          "offsetEnd": 360,
          "columnNum": 69
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category 6 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_6_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 361,
          "offsetEnd": 362,
          "columnNum": 70
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
        "logicalName": "BLANK_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 363,
          "offsetEnd": 364,
          "columnNum": 71
        },
        "fieldLength": 2,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 365,
          "offsetEnd": 366,
          "columnNum": 72
        },
        "fieldLength": 2,
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
          "offsetStart": 367,
          "offsetEnd": 370,
          "columnNum": 73
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
        "logicalName": "BLANK_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 371,
          "offsetEnd": 389,
          "columnNum": 74
        },
        "fieldLength": 19,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 390,
          "offsetEnd": 390,
          "columnNum": 75
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Level III: Accomplished Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 391,
          "offsetEnd": 391,
          "columnNum": 76
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
        "logicalName": "BLANK_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 392,
          "offsetEnd": 399,
          "columnNum": 77
        },
        "fieldLength": 8,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "STAAR Alternate 2 Progress Measure",
        "otherPossibleNames": [],
        "logicalName": "STAAR_ALTERNATE_2_PROGRESS_MEASURE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 400,
          "offsetEnd": 400,
          "columnNum": 78
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "On Track to Level II: Satisfactory Academic Performance (English I)",
        "otherPossibleNames": [],
        "logicalName": "SATISFACTORY_ACADEMIC_PERFORMANCE_(ENGLISH_I)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 401,
          "offsetEnd": 401,
          "columnNum": 79
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Previous-Year Administration Date",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_ADMINISTRATION_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 402,
          "offsetEnd": 405,
          "columnNum": 80
        },
        "fieldLength": 4,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Previous-Year Scale Score",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 406,
          "offsetEnd": 409,
          "columnNum": 81
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
        "logicalName": "BLANK_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 410,
          "offsetEnd": 410,
          "columnNum": 82
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Previous-Year Score Code",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_SCORE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 411,
          "offsetEnd": 411,
          "columnNum": 83
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
        "logicalName": "BLANK_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 412,
          "offsetEnd": 412,
          "columnNum": 84
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Previous-Year Level II: Satisfactory Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_LEVEL_II_SATISFACTORY_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 413,
          "offsetEnd": 413,
          "columnNum": 85
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Previous-Year Level III: Accomplished Academic Performance",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_LEVEL_III_ACCOMPLISHED_ACADEMIC_PERFORMANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 414,
          "offsetEnd": 414,
          "columnNum": 86
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Previous-Year Tested Grade/Course",
        "otherPossibleNames": [],
        "logicalName": "PREVIOUS_YEAR_TESTED_GRADE_COURSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 415,
          "offsetEnd": 416,
          "columnNum": 87
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
        "logicalName": "BLANK_21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 417,
          "offsetEnd": 700,
          "columnNum": 88
        },
        "fieldLength": 284,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Color or Highlight",
        "otherPossibleNames": [],
        "logicalName": "COLOR_OR_HIGHLIGHT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 701,
          "columnNum": 89
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Color Overlays",
        "otherPossibleNames": [],
        "logicalName": "COLOR_OVERLAYS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 702,
          "offsetEnd": 702,
          "columnNum": 90
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
        "logicalName": "BLANK_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 703,
          "offsetEnd": 703,
          "columnNum": 91
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Photographs or Objects",
        "otherPossibleNames": [],
        "logicalName": "PHOTOGRAPHS_OR_OBJECTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 704,
          "offsetEnd": 704,
          "columnNum": 92
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Textured Materials",
        "otherPossibleNames": [],
        "logicalName": "TEXTURED_MATERIALS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 705,
          "offsetEnd": 705,
          "columnNum": 93
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Demonstrate",
        "otherPossibleNames": [],
        "logicalName": "DEMONSTRATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 706,
          "offsetEnd": 706,
          "columnNum": 94
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raise or Darken Outline",
        "otherPossibleNames": [],
        "logicalName": "RAISE_OR_DARKEN_OUTLINE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 707,
          "offsetEnd": 707,
          "columnNum": 95
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Enlarge",
        "otherPossibleNames": [],
        "logicalName": "ENLARGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 708,
          "offsetEnd": 708,
          "columnNum": 96
        },
        "fieldLength": 1,
        "fieldPrecision": null,
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
          "offsetStart": 709,
          "offsetEnd": 709,
          "columnNum": 97
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Describe Images",
        "otherPossibleNames": [],
        "logicalName": "DESCRIBE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 710,
          "offsetEnd": 710,
          "columnNum": 98
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provide Images or Text Separately",
        "otherPossibleNames": [],
        "logicalName": "PROVIDE_IMAGES_OR_TEXT_SEPARATELY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 711,
          "offsetEnd": 711,
          "columnNum": 99
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Isolate Images",
        "otherPossibleNames": [],
        "logicalName": "ISOLATE_IMAGES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 712,
          "offsetEnd": 712,
          "columnNum": 100
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Picture Representations",
        "otherPossibleNames": [],
        "logicalName": "PICTURE_REPRESENTATIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 713,
          "offsetEnd": 713,
          "columnNum": 101
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reread Text",
        "otherPossibleNames": [],
        "logicalName": "REREAD_TEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 714,
          "offsetEnd": 714,
          "columnNum": 102
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Use Calculator, Manipulatives, or Math Tools",
        "otherPossibleNames": [],
        "logicalName": "USE_CALCULATOR__MANIPULATIVES__OR_MATH_TOOLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 715,
          "offsetEnd": 715,
          "columnNum": 103
        },
        "fieldLength": 1,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provide Structured Reminders",
        "otherPossibleNames": [],
        "logicalName": "PROVIDE_STRUCTURED_REMINDERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 716,
          "offsetEnd": 716,
          "columnNum": 104
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
        "logicalName": "BLANK_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 717,
          "offsetEnd": 1622,
          "columnNum": 105
        },
        "fieldLength": 906,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Fall 2021 TSDS PEIMS Crisis Code 1",
        "otherPossibleNames": [],
        "logicalName": "FALL_2021_TSDS_PEIMS_CRISIS_CODE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1623,
          "offsetEnd": 1625,
          "columnNum": 106
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Fall 2021 TSDS PEIMS Crisis Code 2",
        "otherPossibleNames": [],
        "logicalName": "FALL_2021_TSDS_PEIMS_CRISIS_CODE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1626,
          "offsetEnd": 1628,
          "columnNum": 107
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Fall 2021 TSDS PEIMS Crisis Code 3",
        "otherPossibleNames": [],
        "logicalName": "FALL_2021_TSDS_PEIMS_CRISIS_CODE_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1629,
          "offsetEnd": 1631,
          "columnNum": 108
        },
        "fieldLength": 3,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Opportunity Key",
        "otherPossibleNames": [],
        "logicalName": "OPPORTUNITY_KEY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1632,
          "offsetEnd": 1667,
          "columnNum": 109
        },
        "fieldLength": 36,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Non-Participant Online Refusal",
        "otherPossibleNames": [],
        "logicalName": "NON_PARTICIPANT_ONLINE_REFUSAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1668,
          "offsetEnd": 1668,
          "columnNum": 110
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
        "logicalName": "BLANK_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1669,
          "offsetEnd": 1999,
          "columnNum": 111
        },
        "fieldLength": 331,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Period",
        "otherPossibleNames": [],
        "logicalName": "PERIOD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2000,
          "offsetEnd": 2000,
          "columnNum": 112
        },
        "fieldLength": 1,
        "fieldPrecision": null,
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