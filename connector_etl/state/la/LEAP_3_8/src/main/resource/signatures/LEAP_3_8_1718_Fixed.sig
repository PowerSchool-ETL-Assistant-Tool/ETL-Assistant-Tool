{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "LEAP_3_8_1718_Fixed",
    "recordLength": 3046,
    "naturalKey": ["LASID", "TEST_DATE_MONTH", "TEST_DATE_YEAR", "FILE_CREATION_DATE_AND_TIME_STAMP","DRC_UNIQUE_STUDENT_ID"],
    "fields": [{
      "physicalName": "Test Date Month",
      "otherPossibleNames": [],
      "logicalName": "TEST_DATE_MONTH",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "N",
      "fieldOffset": {
        "offsetStart": 1,
        "offsetEnd": 2,
        "columnNum": 1
      },
      "fieldLength": 2,
      "expectedValues": [],
      "dataTypes": "INTEGER",
      "scale": null
    },
      {
        "physicalName": "Test Date Year",
        "otherPossibleNames": [],
        "logicalName": "TEST_DATE_YEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 3,
          "offsetEnd": 6,
          "columnNum": 2
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Straggler",
        "otherPossibleNames": [],
        "logicalName": "STRAGGLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 7,
          "offsetEnd": 7,
          "columnNum": 3
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 8,
          "offsetEnd": 10,
          "columnNum": 4
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
          "offsetStart": 11,
          "offsetEnd": 13,
          "columnNum": 5
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
          "offsetStart": 14,
          "offsetEnd": 53,
          "columnNum": 6
        },
        "fieldLength": 40,
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
          "offsetStart": 54,
          "offsetEnd": 93,
          "columnNum": 7
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Barcode/Student Precode Number",
        "otherPossibleNames": [],
        "logicalName": "BARCODE/STUDENT_PRECODE_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 94,
          "offsetEnd": 102,
          "columnNum": 8
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "DRC Unique Student ID",
        "otherPossibleNames": [],
        "logicalName": "DRC_UNIQUE_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 103,
          "offsetEnd": 108,
          "columnNum": 9
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Precoded Tester",
        "otherPossibleNames": [],
        "logicalName": "PRECODED_TESTER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 109,
          "offsetEnd": 109,
          "columnNum": 10
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Last Name",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 110,
          "offsetEnd": 121,
          "columnNum": 11
        },
        "fieldLength": 12,
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 122,
          "offsetEnd": 129,
          "columnNum": 12
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Middle Initial",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 130,
          "offsetEnd": 130,
          "columnNum": 13
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LASID",
        "otherPossibleNames": [],
        "logicalName": "LASID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 131,
          "offsetEnd": 140,
          "columnNum": 14
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Grade",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 141,
          "offsetEnd": 142,
          "columnNum": 15
        },
        "fieldLength": 2,
        "expectedValues": ["03", "04", "05", "06", "07", "08"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Grade Placement",
        "otherPossibleNames": [],
        "logicalName": "LAP_GRADE_PLACEMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 143,
          "offsetEnd": 144,
          "columnNum": 16
        },
        "fieldLength": 2,
        "expectedValues": ["03", "04", "05", "06", "07", "08"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized DOB Month",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_DOB_MONTH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 145,
          "offsetEnd": 146,
          "columnNum": 17
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized DOB Day",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_DOB_DAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 147,
          "offsetEnd": 148,
          "columnNum": 18
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized DOB Year",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_DOB_YEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 149,
          "offsetEnd": 152,
          "columnNum": 19
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Gender",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 153,
          "offsetEnd": 153,
          "columnNum": 20
        },
        "fieldLength": 1,
        "expectedValues": ["M", "F", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Gender",
        "otherPossibleNames": [],
        "logicalName": "LAP_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 154,
          "offsetEnd": 154,
          "columnNum": 21
        },
        "fieldLength": 1,
        "expectedValues": ["M", "F", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Ethnicity/Race",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY/RACE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 155,
          "offsetEnd": 155,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "6", "7", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Migrant Status",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 156,
          "offsetEnd": 156,
          "columnNum": 23
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Migrant Flag",
        "otherPossibleNames": [],
        "logicalName": "LAP_MIGRANT_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 157,
          "offsetEnd": 157,
          "columnNum": 24
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Economically Disadvantaged",
        "otherPossibleNames": [],
        "logicalName": "LAP_ECONOMICALLY_DISADVANTAGED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 158,
          "offsetEnd": 158,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": ["1", "0", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized McKinney-Vento Act (Homeless)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_MCKINNEY-VENTO_ACT_(HOMELESS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 159,
          "offsetEnd": 159,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP McKinney-Vento (Homeless) Flag",
        "otherPossibleNames": [],
        "logicalName": "LAP_MCKINNEY-VENTO_(HOMELESS)_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 160,
          "offsetEnd": 160,
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 161,
          "offsetEnd": 162,
          "columnNum": 28
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Twin Flag",
        "otherPossibleNames": [],
        "logicalName": "LAP_TWIN_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 163,
          "offsetEnd": 163,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP TDR Tester",
        "otherPossibleNames": [],
        "logicalName": "LAP_TDR_TESTER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 164,
          "offsetEnd": 164,
          "columnNum": 30
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Scholarship Student Flag",
        "otherPossibleNames": [],
        "logicalName": "LAP_SCHOLARSHIP_STUDENT_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 165,
          "offsetEnd": 165,
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP March Update Flag",
        "otherPossibleNames": [],
        "logicalName": "LAP_MARCH_UPDATE_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 166,
          "offsetEnd": 166,
          "columnNum": 32
        },
        "fieldLength": 1,
        "expectedValues": ["", "D", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Gender",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 167,
          "offsetEnd": 167,
          "columnNum": 33
        },
        "fieldLength": 1,
        "expectedValues": ["", "F", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Migrant Flag",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_MIGRANT_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 168,
          "offsetEnd": 168,
          "columnNum": 34
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT McKinney-Vento (Homeless) Flag",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_MCKINNEY-VENTO_(HOMELESS)_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 169,
          "offsetEnd": 169,
          "columnNum": 35
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Military Affiliation",
        "otherPossibleNames": [],
        "logicalName": "LAP_MILITARY_AFFILIATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 170,
          "offsetEnd": 170,
          "columnNum": 36
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Military Affiliation",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_MILITARY_AFFILIATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 171,
          "offsetEnd": 171,
          "columnNum": 37
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Military Affiliation",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_MILITARY_AFFILIATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 172,
          "offsetEnd": 172,
          "columnNum": 38
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Foster Care",
        "otherPossibleNames": [],
        "logicalName": "LAP_FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 173,
          "offsetEnd": 173,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Foster Care",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 174,
          "offsetEnd": 174,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Foster Care",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 175,
          "offsetEnd": 175,
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 176,
          "offsetEnd": 181,
          "columnNum": 42
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Gender",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 182,
          "offsetEnd": 182,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "*", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Migrant Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 183,
          "offsetEnd": 183,
          "columnNum": 44
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled McKinney-Vento Act (Homeless)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MCKINNEY-VENTO_ACT_(HOMELESS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 184,
          "offsetEnd": 184,
          "columnNum": 45
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Education Classification",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 185,
          "offsetEnd": 185,
          "columnNum": 46
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Optional Local Use",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_OPTIONAL_LOCAL_USE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 186,
          "offsetEnd": 195,
          "columnNum": 47
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Accountability Code",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 196,
          "offsetEnd": 197,
          "columnNum": 48
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Military Affiliated",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MILITARY_AFFILIATED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 198,
          "offsetEnd": 198,
          "columnNum": 49
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Foster Care",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 199,
          "offsetEnd": 199,
          "columnNum": 50
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 200,
          "offsetEnd": 206,
          "columnNum": 51
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hispanic/Latino",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC/LATINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 207,
          "offsetEnd": 207,
          "columnNum": 52
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "*", "-", ""],
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
          "offsetStart": 208,
          "offsetEnd": 208,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 209,
          "offsetEnd": 209,
          "columnNum": 54
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 210,
          "offsetEnd": 210,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 211,
          "offsetEnd": 211,
          "columnNum": 56
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 212,
          "offsetEnd": 212,
          "columnNum": 57
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gifted",
        "otherPossibleNames": [],
        "logicalName": "GIFTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 213,
          "offsetEnd": 213,
          "columnNum": 58
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Talented",
        "otherPossibleNames": [],
        "logicalName": "TALENTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 214,
          "offsetEnd": 214,
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Autism",
        "otherPossibleNames": [],
        "logicalName": "AUTISM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 215,
          "offsetEnd": 215,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Deafblindness",
        "otherPossibleNames": [],
        "logicalName": "DEAFBLINDNESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 216,
          "offsetEnd": 216,
          "columnNum": 61
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Developmental Delay",
        "otherPossibleNames": [],
        "logicalName": "DEVELOPMENTAL_DELAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 217,
          "offsetEnd": 217,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Emotional Disturbance",
        "otherPossibleNames": [],
        "logicalName": "EMOTIONAL_DISTURBANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 218,
          "offsetEnd": 218,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HI - Deaf",
        "otherPossibleNames": [],
        "logicalName": "HI_DEAF",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 219,
          "offsetEnd": 219,
          "columnNum": 64
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HI - Hard of Hearing",
        "otherPossibleNames": [],
        "logicalName": "HI_HARD_OF_HEARING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 220,
          "offsetEnd": 220,
          "columnNum": 65
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Mild Mental Disability",
        "otherPossibleNames": [],
        "logicalName": "MILD_MENTAL_DISABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 221,
          "offsetEnd": 221,
          "columnNum": 66
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Moderate Mental Disabilities",
        "otherPossibleNames": [],
        "logicalName": "MODERATE_MENTAL_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 222,
          "offsetEnd": 222,
          "columnNum": 67
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Orthopedic Impairment",
        "otherPossibleNames": [],
        "logicalName": "ORTHOPEDIC_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 223,
          "offsetEnd": 223,
          "columnNum": 68
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Other Health Impairments",
        "otherPossibleNames": [],
        "logicalName": "OTHER_HEALTH_IMPAIRMENTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 224,
          "offsetEnd": 224,
          "columnNum": 69
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Specific Learning Disabilities",
        "otherPossibleNames": [],
        "logicalName": "SPECIFIC_LEARNING_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 225,
          "offsetEnd": 225,
          "columnNum": 70
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Speech or Language Impairment",
        "otherPossibleNames": [],
        "logicalName": "SPEECH_OR_LANGUAGE_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 226,
          "offsetEnd": 226,
          "columnNum": 71
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Traumatic Brain Injury",
        "otherPossibleNames": [],
        "logicalName": "TRAUMATIC_BRAIN_INJURY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 227,
          "offsetEnd": 227,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Visual Impairment",
        "otherPossibleNames": [],
        "logicalName": "VISUAL_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 228,
          "offsetEnd": 228,
          "columnNum": 73
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 229,
          "offsetEnd": 229,
          "columnNum": 74
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 230,
          "offsetEnd": 230,
          "columnNum": 75
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human/Test Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN/TEST_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 231,
          "offsetEnd": 231,
          "columnNum": 76
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 232,
          "offsetEnd": 232,
          "columnNum": 77
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 233,
          "offsetEnd": 233,
          "columnNum": 78
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 234,
          "offsetEnd": 234,
          "columnNum": 79
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 235,
          "offsetEnd": 235,
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 236,
          "offsetEnd": 236,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 237,
          "offsetEnd": 237,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance Script",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_SCRIPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 238,
          "offsetEnd": 238,
          "columnNum": 83
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Online Accommodated Paper Test",
        "otherPossibleNames": [],
        "logicalName": "ONLINE_ACCOMMODATED_PAPER_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 239,
          "offsetEnd": 239,
          "columnNum": 84
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "UEB",
        "otherPossibleNames": [],
        "logicalName": "UEB",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 240,
          "offsetEnd": 240,
          "columnNum": 85
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 241,
          "offsetEnd": 241,
          "columnNum": 86
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 242,
          "offsetEnd": 242,
          "columnNum": 87
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Recorded Voice File",
        "otherPossibleNames": [],
        "logicalName": "RECORDED_VOICE_FILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 243,
          "offsetEnd": 243,
          "columnNum": 88
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 244,
          "offsetEnd": 244,
          "columnNum": 89
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 245,
          "offsetEnd": 245,
          "columnNum": 90
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 246,
          "offsetEnd": 246,
          "columnNum": 91
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 247,
          "offsetEnd": 247,
          "columnNum": 92
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 248,
          "offsetEnd": 248,
          "columnNum": 93
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 249,
          "offsetEnd": 249,
          "columnNum": 94
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 250,
          "offsetEnd": 250,
          "columnNum": 95
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 251,
          "offsetEnd": 251,
          "columnNum": 96
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 252,
          "offsetEnd": 252,
          "columnNum": 97
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 253,
          "offsetEnd": 253,
          "columnNum": 98
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 254,
          "offsetEnd": 254,
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Limited English Proficient (LEP) Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_LIMITED_ENGLISH_PROFICIENT_(LEP)_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 255,
          "offsetEnd": 255,
          "columnNum": 100
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 256,
          "offsetEnd": 256,
          "columnNum": 101
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 257,
          "offsetEnd": 257,
          "columnNum": 102
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 258,
          "offsetEnd": 258,
          "columnNum": 103
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 259,
          "offsetEnd": 259,
          "columnNum": 104
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 260,
          "offsetEnd": 260,
          "columnNum": 105
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 261,
          "offsetEnd": 261,
          "columnNum": 106
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 262,
          "offsetEnd": 263,
          "columnNum": 107
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Section 504 Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_SECTION_504_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 264,
          "offsetEnd": 264,
          "columnNum": 108
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 265,
          "offsetEnd": 265,
          "columnNum": 109
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 266,
          "offsetEnd": 266,
          "columnNum": 110
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 267,
          "offsetEnd": 267,
          "columnNum": 111
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 268,
          "offsetEnd": 268,
          "columnNum": 112
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 269,
          "offsetEnd": 269,
          "columnNum": 113
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 270,
          "offsetEnd": 270,
          "columnNum": 114
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 271,
          "offsetEnd": 271,
          "columnNum": 115
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 272,
          "offsetEnd": 272,
          "columnNum": 116
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 273,
          "offsetEnd": 273,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 274,
          "offsetEnd": 277,
          "columnNum": 118
        },
        "fieldLength": 4,
        "expectedValues": [],
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
          "offsetStart": 278,
          "offsetEnd": 278,
          "columnNum": 119
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 279,
          "offsetEnd": 283,
          "columnNum": 120
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 284,
          "offsetEnd": 284,
          "columnNum": 121
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 285,
          "offsetEnd": 285,
          "columnNum": 122
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 286,
          "offsetEnd": 286,
          "columnNum": 123
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 287,
          "offsetEnd": 287,
          "columnNum": 124
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 288,
          "offsetEnd": 288,
          "columnNum": 125
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 289,
          "offsetEnd": 289,
          "columnNum": 126
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 290,
          "offsetEnd": 290,
          "columnNum": 127
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 291,
          "offsetEnd": 291,
          "columnNum": 128
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 292,
          "offsetEnd": 292,
          "columnNum": 129
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 293,
          "offsetEnd": 293,
          "columnNum": 130
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance Scripts",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_SCRIPTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 294,
          "offsetEnd": 294,
          "columnNum": 131
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 295,
          "offsetEnd": 296,
          "columnNum": 132
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spanish Tester",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TESTER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 297,
          "offsetEnd": 297,
          "columnNum": 133
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Gender",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 298,
          "offsetEnd": 298,
          "columnNum": 134
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "-", "*", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Migrant Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 299,
          "offsetEnd": 299,
          "columnNum": 135
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled McKinney-Vento Act (Homeless)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MCKINNEY-VENTO_ACT_(HOMELESS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 300,
          "offsetEnd": 300,
          "columnNum": 136
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Education Classification",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 301,
          "offsetEnd": 301,
          "columnNum": 137
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Optional Local Use",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_OPTIONAL_LOCAL_USE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 302,
          "offsetEnd": 311,
          "columnNum": 138
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Accountability Code",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 312,
          "offsetEnd": 313,
          "columnNum": 139
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Military Affiliated",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MILITARY_AFFILIATED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 314,
          "offsetEnd": 314,
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Foster Care",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 315,
          "offsetEnd": 315,
          "columnNum": 141
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 316,
          "offsetEnd": 322,
          "columnNum": 142
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hispanic/Latino",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC/LATINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 323,
          "offsetEnd": 323,
          "columnNum": 143
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "-", "*", ""],
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
          "offsetStart": 324,
          "offsetEnd": 324,
          "columnNum": 144
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 325,
          "offsetEnd": 325,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 326,
          "offsetEnd": 326,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 327,
          "offsetEnd": 327,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 328,
          "offsetEnd": 328,
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gifted",
        "otherPossibleNames": [],
        "logicalName": "GIFTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 329,
          "offsetEnd": 329,
          "columnNum": 149
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Talented",
        "otherPossibleNames": [],
        "logicalName": "TALENTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 330,
          "offsetEnd": 330,
          "columnNum": 150
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Autism",
        "otherPossibleNames": [],
        "logicalName": "AUTISM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 331,
          "offsetEnd": 331,
          "columnNum": 151
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Deafblindness",
        "otherPossibleNames": [],
        "logicalName": "DEAFBLINDNESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 332,
          "offsetEnd": 332,
          "columnNum": 152
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Developmental Delay",
        "otherPossibleNames": [],
        "logicalName": "DEVELOPMENTAL_DELAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 333,
          "offsetEnd": 333,
          "columnNum": 153
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Emotional Disturbance",
        "otherPossibleNames": [],
        "logicalName": "EMOTIONAL_DISTURBANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 334,
          "offsetEnd": 334,
          "columnNum": 154
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HI - Deaf",
        "otherPossibleNames": [],
        "logicalName": "HI_DEAF",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 335,
          "offsetEnd": 335,
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HI - Hard of Hearing",
        "otherPossibleNames": [],
        "logicalName": "HI_HARD_OF_HEARING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 336,
          "offsetEnd": 336,
          "columnNum": 156
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Mild Mental Disability",
        "otherPossibleNames": [],
        "logicalName": "MILD_MENTAL_DISABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 337,
          "offsetEnd": 337,
          "columnNum": 157
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Moderate Mental Disabilities",
        "otherPossibleNames": [],
        "logicalName": "MODERATE_MENTAL_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 338,
          "offsetEnd": 338,
          "columnNum": 158
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Orthopedic Impairment",
        "otherPossibleNames": [],
        "logicalName": "ORTHOPEDIC_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 339,
          "offsetEnd": 339,
          "columnNum": 159
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Other Health Impairments",
        "otherPossibleNames": [],
        "logicalName": "OTHER_HEALTH_IMPAIRMENTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 340,
          "offsetEnd": 340,
          "columnNum": 160
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Specific Learning Disabilities",
        "otherPossibleNames": [],
        "logicalName": "SPECIFIC_LEARNING_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 341,
          "offsetEnd": 341,
          "columnNum": 161
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Speech or Language Impairment",
        "otherPossibleNames": [],
        "logicalName": "SPEECH_OR_LANGUAGE_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 342,
          "offsetEnd": 342,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Traumatic Brain Injury",
        "otherPossibleNames": [],
        "logicalName": "TRAUMATIC_BRAIN_INJURY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 343,
          "offsetEnd": 343,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Visual Impairment",
        "otherPossibleNames": [],
        "logicalName": "VISUAL_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 344,
          "offsetEnd": 344,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 345,
          "offsetEnd": 345,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 346,
          "offsetEnd": 346,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spanish Test",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 347,
          "offsetEnd": 347,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spanish Test Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST_TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 348,
          "offsetEnd": 348,
          "columnNum": 168
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human/Test Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN/TEST_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 349,
          "offsetEnd": 349,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 350,
          "offsetEnd": 350,
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 351,
          "offsetEnd": 351,
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 352,
          "offsetEnd": 352,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 353,
          "offsetEnd": 353,
          "columnNum": 173
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Calculator",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 354,
          "offsetEnd": 354,
          "columnNum": 174
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 355,
          "offsetEnd": 355,
          "columnNum": 175
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 356,
          "offsetEnd": 356,
          "columnNum": 176
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance Script",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_SCRIPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 357,
          "offsetEnd": 357,
          "columnNum": 177
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Online Accommodated Paper Test",
        "otherPossibleNames": [],
        "logicalName": "ONLINE_ACCOMMODATED_PAPER_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 358,
          "offsetEnd": 358,
          "columnNum": 178
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "UEB",
        "otherPossibleNames": [],
        "logicalName": "UEB",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 359,
          "offsetEnd": 359,
          "columnNum": 179
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 360,
          "offsetEnd": 360,
          "columnNum": 180
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 361,
          "offsetEnd": 361,
          "columnNum": 181
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Recorded Voice File",
        "otherPossibleNames": [],
        "logicalName": "RECORDED_VOICE_FILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 362,
          "offsetEnd": 362,
          "columnNum": 182
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 363,
          "offsetEnd": 363,
          "columnNum": 183
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 364,
          "offsetEnd": 364,
          "columnNum": 184
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 365,
          "offsetEnd": 365,
          "columnNum": 185
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 366,
          "offsetEnd": 366,
          "columnNum": 186
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 367,
          "offsetEnd": 367,
          "columnNum": 187
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 368,
          "offsetEnd": 368,
          "columnNum": 188
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 369,
          "offsetEnd": 369,
          "columnNum": 189
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 370,
          "offsetEnd": 370,
          "columnNum": 190
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 371,
          "offsetEnd": 371,
          "columnNum": 191
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 372,
          "offsetEnd": 372,
          "columnNum": 192
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 373,
          "offsetEnd": 373,
          "columnNum": 193
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
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
          "offsetStart": 374,
          "offsetEnd": 374,
          "columnNum": 194
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Limited English Proficient (LEP) Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_LIMITED_ENGLISH_PROFICIENT_(LEP)_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 375,
          "offsetEnd": 375,
          "columnNum": 195
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 376,
          "offsetEnd": 376,
          "columnNum": 196
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 377,
          "offsetEnd": 377,
          "columnNum": 197
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 378,
          "offsetEnd": 378,
          "columnNum": 198
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 379,
          "offsetEnd": 379,
          "columnNum": 199
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 380,
          "offsetEnd": 380,
          "columnNum": 200
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 381,
          "offsetEnd": 381,
          "columnNum": 201
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 382,
          "offsetEnd": 382,
          "columnNum": 202
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 383,
          "offsetEnd": 383,
          "columnNum": 203
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 384,
          "offsetEnd": 384,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Section 504 Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_SECTION_504_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 385,
          "offsetEnd": 385,
          "columnNum": 205
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 386,
          "offsetEnd": 386,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spanish Test",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 387,
          "offsetEnd": 387,
          "columnNum": 207
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 388,
          "offsetEnd": 388,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 389,
          "offsetEnd": 389,
          "columnNum": 209
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 390,
          "offsetEnd": 390,
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 391,
          "offsetEnd": 391,
          "columnNum": 211
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 392,
          "offsetEnd": 392,
          "columnNum": 212
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 393,
          "offsetEnd": 393,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 394,
          "offsetEnd": 394,
          "columnNum": 214
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 395,
          "offsetEnd": 395,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
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
          "offsetStart": 396,
          "offsetEnd": 396,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 397,
          "offsetEnd": 397,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 398,
          "offsetEnd": 398,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 399,
          "offsetEnd": 399,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 400,
          "offsetEnd": 400,
          "columnNum": 220
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 401,
          "offsetEnd": 403,
          "columnNum": 221
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 404,
          "offsetEnd": 404,
          "columnNum": 222
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spanish Test",
        "otherPossibleNames": [],
        "logicalName": "SPANISH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 405,
          "offsetEnd": 405,
          "columnNum": 223
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 406,
          "offsetEnd": 406,
          "columnNum": 224
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 407,
          "offsetEnd": 407,
          "columnNum": 225
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 408,
          "offsetEnd": 408,
          "columnNum": 226
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 409,
          "offsetEnd": 409,
          "columnNum": 227
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 410,
          "offsetEnd": 410,
          "columnNum": 228
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 411,
          "offsetEnd": 411,
          "columnNum": 229
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Calculator",
        "otherPossibleNames": [],
        "logicalName": "CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 412,
          "offsetEnd": 412,
          "columnNum": 230
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 413,
          "offsetEnd": 413,
          "columnNum": 231
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 414,
          "offsetEnd": 414,
          "columnNum": 232
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 415,
          "offsetEnd": 415,
          "columnNum": 233
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance Scripts",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_SCRIPTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 416,
          "offsetEnd": 416,
          "columnNum": 234
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Basic Calculator",
        "otherPossibleNames": [],
        "logicalName": "BASIC_CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 417,
          "offsetEnd": 417,
          "columnNum": 235
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Scientific Calculator",
        "otherPossibleNames": [],
        "logicalName": "SCIENTIFIC_CALCULATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 418,
          "offsetEnd": 418,
          "columnNum": 236
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 419,
          "offsetEnd": 419,
          "columnNum": 237
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Gender",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 420,
          "offsetEnd": 420,
          "columnNum": 238
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "*", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Migrant Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 421,
          "offsetEnd": 421,
          "columnNum": 239
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled McKinney-Vento Act (Homeless)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MCKINNEY-VENTO_ACT_(HOMELESS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 422,
          "offsetEnd": 422,
          "columnNum": 240
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Education Classification",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 423,
          "offsetEnd": 423,
          "columnNum": 241
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Optional Local Use",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_OPTIONAL_LOCAL_USE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 424,
          "offsetEnd": 433,
          "columnNum": 242
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Accountability Code",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 434,
          "offsetEnd": 435,
          "columnNum": 243
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Military Affiliated",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MILITARY_AFFILIATED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 436,
          "offsetEnd": 436,
          "columnNum": 244
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Foster Care",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 437,
          "offsetEnd": 437,
          "columnNum": 245
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 438,
          "offsetEnd": 445,
          "columnNum": 246
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hispanic/Latino",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC/LATINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 446,
          "offsetEnd": 446,
          "columnNum": 247
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "*", "-", ""],
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
          "offsetStart": 447,
          "offsetEnd": 447,
          "columnNum": 248
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 448,
          "offsetEnd": 448,
          "columnNum": 249
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 449,
          "offsetEnd": 449,
          "columnNum": 250
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 450,
          "offsetEnd": 450,
          "columnNum": 251
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 451,
          "offsetEnd": 451,
          "columnNum": 252
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gifted",
        "otherPossibleNames": [],
        "logicalName": "GIFTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 452,
          "offsetEnd": 452,
          "columnNum": 253
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Talented",
        "otherPossibleNames": [],
        "logicalName": "TALENTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 453,
          "offsetEnd": 453,
          "columnNum": 254
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Autism",
        "otherPossibleNames": [],
        "logicalName": "AUTISM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 454,
          "offsetEnd": 454,
          "columnNum": 255
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Deafblindness",
        "otherPossibleNames": [],
        "logicalName": "DEAFBLINDNESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 455,
          "offsetEnd": 455,
          "columnNum": 256
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Developmental Delay",
        "otherPossibleNames": [],
        "logicalName": "DEVELOPMENTAL_DELAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 456,
          "offsetEnd": 456,
          "columnNum": 257
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Emotional Disturbance",
        "otherPossibleNames": [],
        "logicalName": "EMOTIONAL_DISTURBANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 457,
          "offsetEnd": 457,
          "columnNum": 258
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HI-Deaf",
        "otherPossibleNames": [],
        "logicalName": "HI-DEAF",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 458,
          "offsetEnd": 458,
          "columnNum": 259
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HI-Hard of Hearing",
        "otherPossibleNames": [],
        "logicalName": "HI-HARD_OF_HEARING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 459,
          "offsetEnd": 459,
          "columnNum": 260
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Mild Mental Disability",
        "otherPossibleNames": [],
        "logicalName": "MILD_MENTAL_DISABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 460,
          "offsetEnd": 460,
          "columnNum": 261
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Moderate Mental Disabilities",
        "otherPossibleNames": [],
        "logicalName": "MODERATE_MENTAL_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 461,
          "offsetEnd": 461,
          "columnNum": 262
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Orthopedic Impairment",
        "otherPossibleNames": [],
        "logicalName": "ORTHOPEDIC_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 462,
          "offsetEnd": 462,
          "columnNum": 263
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Other Health Impairments",
        "otherPossibleNames": [],
        "logicalName": "OTHER_HEALTH_IMPAIRMENTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 463,
          "offsetEnd": 463,
          "columnNum": 264
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Specific Learning Disabilities",
        "otherPossibleNames": [],
        "logicalName": "SPECIFIC_LEARNING_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 464,
          "offsetEnd": 464,
          "columnNum": 265
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Speech or Language Impairment",
        "otherPossibleNames": [],
        "logicalName": "SPEECH_OR_LANGUAGE_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 465,
          "offsetEnd": 465,
          "columnNum": 266
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Traumatic Brain Injury",
        "otherPossibleNames": [],
        "logicalName": "TRAUMATIC_BRAIN_INJURY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 466,
          "offsetEnd": 466,
          "columnNum": 267
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Visual Impairment",
        "otherPossibleNames": [],
        "logicalName": "VISUAL_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 467,
          "offsetEnd": 467,
          "columnNum": 268
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 468,
          "offsetEnd": 468,
          "columnNum": 269
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 469,
          "offsetEnd": 469,
          "columnNum": 270
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human/Test Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN/TEST_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 470,
          "offsetEnd": 470,
          "columnNum": 271
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 471,
          "offsetEnd": 471,
          "columnNum": 272
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 472,
          "offsetEnd": 472,
          "columnNum": 273
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 473,
          "offsetEnd": 473,
          "columnNum": 274
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 474,
          "offsetEnd": 474,
          "columnNum": 275
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 475,
          "offsetEnd": 475,
          "columnNum": 276
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 476,
          "offsetEnd": 476,
          "columnNum": 277
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance Script",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_SCRIPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 477,
          "offsetEnd": 477,
          "columnNum": 278
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper Test",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 478,
          "offsetEnd": 478,
          "columnNum": 279
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "UEB",
        "otherPossibleNames": [],
        "logicalName": "UEB",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 479,
          "offsetEnd": 479,
          "columnNum": 280
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 480,
          "offsetEnd": 480,
          "columnNum": 281
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 481,
          "offsetEnd": 481,
          "columnNum": 282
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 482,
          "offsetEnd": 482,
          "columnNum": 283
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 483,
          "offsetEnd": 483,
          "columnNum": 284
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered by ESL Teacher",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 484,
          "offsetEnd": 484,
          "columnNum": 285
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Recorded Voice File",
        "otherPossibleNames": [],
        "logicalName": "RECORDED_VOICE_FILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 485,
          "offsetEnd": 485,
          "columnNum": 286
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 486,
          "offsetEnd": 486,
          "columnNum": 287
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 487,
          "offsetEnd": 487,
          "columnNum": 288
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 488,
          "offsetEnd": 488,
          "columnNum": 289
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 489,
          "offsetEnd": 489,
          "columnNum": 290
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 490,
          "offsetEnd": 490,
          "columnNum": 291
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 491,
          "offsetEnd": 491,
          "columnNum": 292
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 492,
          "offsetEnd": 492,
          "columnNum": 293
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Tests Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "TESTS_READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 493,
          "offsetEnd": 493,
          "columnNum": 294
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 494,
          "offsetEnd": 494,
          "columnNum": 295
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 495,
          "offsetEnd": 495,
          "columnNum": 296
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 496,
          "offsetEnd": 496,
          "columnNum": 297
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Limited English Proficient (LEP) Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_LIMITED_ENGLISH_PROFICIENT_(LEP)_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 497,
          "offsetEnd": 497,
          "columnNum": 298
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 498,
          "offsetEnd": 498,
          "columnNum": 299
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 499,
          "offsetEnd": 499,
          "columnNum": 300
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 500,
          "offsetEnd": 500,
          "columnNum": 301
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 501,
          "offsetEnd": 501,
          "columnNum": 302
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 502,
          "offsetEnd": 502,
          "columnNum": 303
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 503,
          "offsetEnd": 503,
          "columnNum": 304
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 504,
          "offsetEnd": 504,
          "columnNum": 305
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 505,
          "offsetEnd": 505,
          "columnNum": 306
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 506,
          "offsetEnd": 506,
          "columnNum": 307
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Section 504 Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_SECTION_504_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 507,
          "offsetEnd": 507,
          "columnNum": 308
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 508,
          "offsetEnd": 508,
          "columnNum": 309
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 509,
          "offsetEnd": 509,
          "columnNum": 310
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 510,
          "offsetEnd": 510,
          "columnNum": 311
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 511,
          "offsetEnd": 511,
          "columnNum": 312
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 512,
          "offsetEnd": 512,
          "columnNum": 313
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 513,
          "offsetEnd": 513,
          "columnNum": 314
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 514,
          "offsetEnd": 514,
          "columnNum": 315
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 515,
          "offsetEnd": 515,
          "columnNum": 316
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 516,
          "offsetEnd": 516,
          "columnNum": 317
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 517,
          "offsetEnd": 517,
          "columnNum": 318
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 518,
          "offsetEnd": 523,
          "columnNum": 319
        },
        "fieldLength": 6,
        "expectedValues": [],
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
          "offsetStart": 524,
          "offsetEnd": 524,
          "columnNum": 320
        },
        "fieldLength": 1,
        "expectedValues": ["1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 525,
          "offsetEnd": 525,
          "columnNum": 321
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud ",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 526,
          "offsetEnd": 526,
          "columnNum": 322
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 527,
          "offsetEnd": 527,
          "columnNum": 323
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 528,
          "offsetEnd": 528,
          "columnNum": 324
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 529,
          "offsetEnd": 529,
          "columnNum": 325
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 530,
          "offsetEnd": 530,
          "columnNum": 326
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 531,
          "offsetEnd": 531,
          "columnNum": 327
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 532,
          "offsetEnd": 532,
          "columnNum": 328
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 533,
          "offsetEnd": 533,
          "columnNum": 329
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance Scripts",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_SCRIPTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 534,
          "offsetEnd": 534,
          "columnNum": 330
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 535,
          "offsetEnd": 544,
          "columnNum": 331
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Gender",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 545,
          "offsetEnd": 545,
          "columnNum": 332
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "*", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Migrant Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 546,
          "offsetEnd": 546,
          "columnNum": 333
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled McKinney-Vento Act (Homeless)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MCKINNEY-VENTO_ACT_(HOMELESS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 547,
          "offsetEnd": 547,
          "columnNum": 334
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Education Classification",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 548,
          "offsetEnd": 548,
          "columnNum": 335
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Optional Local Use",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_OPTIONAL_LOCAL_USE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 549,
          "offsetEnd": 558,
          "columnNum": 336
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Accountability Code",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_ACCOUNTABILITY_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 559,
          "offsetEnd": 560,
          "columnNum": 337
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Military Affiliated",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_MILITARY_AFFILIATED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 561,
          "offsetEnd": 561,
          "columnNum": 338
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Foster Care",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 562,
          "offsetEnd": 562,
          "columnNum": 339
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 563,
          "offsetEnd": 570,
          "columnNum": 340
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Hispanic/Latino",
        "otherPossibleNames": [],
        "logicalName": "HISPANIC/LATINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 571,
          "offsetEnd": 571,
          "columnNum": 341
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "*", "-", ""],
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
          "offsetStart": 572,
          "offsetEnd": 572,
          "columnNum": 342
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 573,
          "offsetEnd": 573,
          "columnNum": 343
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 574,
          "offsetEnd": 574,
          "columnNum": 344
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 575,
          "offsetEnd": 575,
          "columnNum": 345
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 576,
          "offsetEnd": 576,
          "columnNum": 346
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gifted",
        "otherPossibleNames": [],
        "logicalName": "GIFTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 577,
          "offsetEnd": 577,
          "columnNum": 347
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Talented",
        "otherPossibleNames": [],
        "logicalName": "TALENTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 578,
          "offsetEnd": 578,
          "columnNum": 348
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Autism",
        "otherPossibleNames": [],
        "logicalName": "AUTISM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 579,
          "offsetEnd": 579,
          "columnNum": 349
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Deafblindness",
        "otherPossibleNames": [],
        "logicalName": "DEAFBLINDNESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 580,
          "offsetEnd": 580,
          "columnNum": 350
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Developmental Delay",
        "otherPossibleNames": [],
        "logicalName": "DEVELOPMENTAL_DELAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 581,
          "offsetEnd": 581,
          "columnNum": 351
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Emotional Disturbance",
        "otherPossibleNames": [],
        "logicalName": "EMOTIONAL_DISTURBANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 582,
          "offsetEnd": 582,
          "columnNum": 352
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HI-Deaf",
        "otherPossibleNames": [],
        "logicalName": "HI-DEAF",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 583,
          "offsetEnd": 583,
          "columnNum": 353
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HI-Hard of Hearing",
        "otherPossibleNames": [],
        "logicalName": "HI-HARD_OF_HEARING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 584,
          "offsetEnd": 584,
          "columnNum": 354
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Mild Mental Disability",
        "otherPossibleNames": [],
        "logicalName": "MILD_MENTAL_DISABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 585,
          "offsetEnd": 585,
          "columnNum": 355
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Moderate Mental Disabilities",
        "otherPossibleNames": [],
        "logicalName": "MODERATE_MENTAL_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 586,
          "offsetEnd": 586,
          "columnNum": 356
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Orthopedic Impairment",
        "otherPossibleNames": [],
        "logicalName": "ORTHOPEDIC_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 587,
          "offsetEnd": 587,
          "columnNum": 357
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Other Health Impairments",
        "otherPossibleNames": [],
        "logicalName": "OTHER_HEALTH_IMPAIRMENTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 588,
          "offsetEnd": 588,
          "columnNum": 358
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Specific Learning Disabilities",
        "otherPossibleNames": [],
        "logicalName": "SPECIFIC_LEARNING_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 589,
          "offsetEnd": 589,
          "columnNum": 359
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Speech or Language Impairment",
        "otherPossibleNames": [],
        "logicalName": "SPEECH_OR_LANGUAGE_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 590,
          "offsetEnd": 590,
          "columnNum": 360
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Traumatic Brain Injury",
        "otherPossibleNames": [],
        "logicalName": "TRAUMATIC_BRAIN_INJURY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 591,
          "offsetEnd": 591,
          "columnNum": 361
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Visual Impairment",
        "otherPossibleNames": [],
        "logicalName": "VISUAL_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 592,
          "offsetEnd": 592,
          "columnNum": 362
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 593,
          "offsetEnd": 593,
          "columnNum": 363
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 594,
          "offsetEnd": 594,
          "columnNum": 364
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human/Test Read Aloud",
        "otherPossibleNames": [],
        "logicalName": "HUMAN/TEST_READ_ALOUD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 595,
          "offsetEnd": 595,
          "columnNum": 365
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 596,
          "offsetEnd": 596,
          "columnNum": 366
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 597,
          "offsetEnd": 597,
          "columnNum": 367
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 598,
          "offsetEnd": 598,
          "columnNum": 368
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 599,
          "offsetEnd": 599,
          "columnNum": 369
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 600,
          "offsetEnd": 600,
          "columnNum": 370
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 601,
          "offsetEnd": 601,
          "columnNum": 371
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance Script",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_SCRIPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 602,
          "offsetEnd": 602,
          "columnNum": 372
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Online Accommodated Paper Test",
        "otherPossibleNames": [],
        "logicalName": "ONLINE_ACCOMMODATED_PAPER_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 603,
          "offsetEnd": 603,
          "columnNum": 373
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "UEB",
        "otherPossibleNames": [],
        "logicalName": "UEB",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 604,
          "offsetEnd": 604,
          "columnNum": 374
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 605,
          "offsetEnd": 605,
          "columnNum": 375
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 606,
          "offsetEnd": 606,
          "columnNum": 376
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 607,
          "offsetEnd": 607,
          "columnNum": 377
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 608,
          "offsetEnd": 608,
          "columnNum": 378
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered by ESL Teacher",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_BY_ESL_TEACHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 609,
          "offsetEnd": 609,
          "columnNum": 379
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Recorded Voice File",
        "otherPossibleNames": [],
        "logicalName": "RECORDED_VOICE_FILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 610,
          "offsetEnd": 610,
          "columnNum": 380
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 611,
          "offsetEnd": 611,
          "columnNum": 381
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 612,
          "offsetEnd": 612,
          "columnNum": 382
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 613,
          "offsetEnd": 613,
          "columnNum": 383
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 614,
          "offsetEnd": 614,
          "columnNum": 384
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 615,
          "offsetEnd": 615,
          "columnNum": 385
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 616,
          "offsetEnd": 616,
          "columnNum": 386
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 617,
          "offsetEnd": 617,
          "columnNum": 387
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 618,
          "offsetEnd": 618,
          "columnNum": 388
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 619,
          "offsetEnd": 619,
          "columnNum": 389
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 620,
          "offsetEnd": 620,
          "columnNum": 390
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 621,
          "offsetEnd": 621,
          "columnNum": 391
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 622,
          "offsetEnd": 622,
          "columnNum": 392
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Limited English Proficient (LEP) Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_LIMITED_ENGLISH_PROFICIENT_(LEP)_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 623,
          "offsetEnd": 623,
          "columnNum": 393
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 624,
          "offsetEnd": 624,
          "columnNum": 394
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 625,
          "offsetEnd": 625,
          "columnNum": 395
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 626,
          "offsetEnd": 626,
          "columnNum": 396
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English/Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH/NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 627,
          "offsetEnd": 627,
          "columnNum": 397
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 628,
          "offsetEnd": 628,
          "columnNum": 398
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 629,
          "offsetEnd": 629,
          "columnNum": 399
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 630,
          "offsetEnd": 630,
          "columnNum": 400
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 631,
          "offsetEnd": 631,
          "columnNum": 401
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 632,
          "offsetEnd": 632,
          "columnNum": 402
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Section 504 Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_SECTION_504_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 633,
          "offsetEnd": 633,
          "columnNum": 403
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 634,
          "offsetEnd": 634,
          "columnNum": 404
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 635,
          "offsetEnd": 635,
          "columnNum": 405
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 636,
          "offsetEnd": 636,
          "columnNum": 406
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 637,
          "offsetEnd": 637,
          "columnNum": 407
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 638,
          "offsetEnd": 638,
          "columnNum": 408
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 639,
          "offsetEnd": 639,
          "columnNum": 409
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Kurzweil",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_KURZWEIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 640,
          "offsetEnd": 640,
          "columnNum": 410
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Recorded Voice",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_RECORDED_VOICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 641,
          "offsetEnd": 641,
          "columnNum": 411
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Read Aloud Human Reader",
        "otherPossibleNames": [],
        "logicalName": "READ_ALOUD_HUMAN_READER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 642,
          "offsetEnd": 642,
          "columnNum": 412
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 643,
          "offsetEnd": 643,
          "columnNum": 413
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 644,
          "offsetEnd": 648,
          "columnNum": 414
        },
        "fieldLength": 5,
        "expectedValues": [],
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
          "offsetStart": 649,
          "offsetEnd": 649,
          "columnNum": 415
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 650,
          "offsetEnd": 654,
          "columnNum": 416
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Text-to-Speech",
        "otherPossibleNames": [],
        "logicalName": "TEXT-TO-SPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 655,
          "offsetEnd": 655,
          "columnNum": 417
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Human Read Aloud ",
        "otherPossibleNames": [],
        "logicalName": "HUMAN_READ_ALOUD_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 656,
          "offsetEnd": 656,
          "columnNum": 418
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Native Language Word-to-Word Dictionary",
        "otherPossibleNames": [],
        "logicalName": "NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 657,
          "offsetEnd": 657,
          "columnNum": 419
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Directions in Native Language",
        "otherPossibleNames": [],
        "logicalName": "DIRECTIONS_IN_NATIVE_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 658,
          "offsetEnd": 658,
          "columnNum": 420
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 659,
          "offsetEnd": 659,
          "columnNum": 421
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Answers Recorded",
        "otherPossibleNames": [],
        "logicalName": "ANSWERS_RECORDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 660,
          "offsetEnd": 660,
          "columnNum": 422
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Extended Time",
        "otherPossibleNames": [],
        "logicalName": "EXTENDED_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 661,
          "offsetEnd": 661,
          "columnNum": 423
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Individual or Small Group Administration",
        "otherPossibleNames": [],
        "logicalName": "INDIVIDUAL_OR_SMALL_GROUP_ADMINISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 662,
          "offsetEnd": 662,
          "columnNum": 424
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 663,
          "offsetEnd": 663,
          "columnNum": 425
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 664,
          "offsetEnd": 664,
          "columnNum": 426
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance Scripts",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE_SCRIPTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 665,
          "offsetEnd": 665,
          "columnNum": 427
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 666,
          "offsetEnd": 667,
          "columnNum": 428
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Education Classification Flag",
        "otherPossibleNames": [],
        "logicalName": "LAP_EDUCATION_CLASSIFICATION_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 668,
          "offsetEnd": 668,
          "columnNum": 429
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Education Classification Flag",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_EDUCATION_CLASSIFICATION_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 669,
          "offsetEnd": 669,
          "columnNum": 430
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 670,
          "offsetEnd": 670,
          "columnNum": 431
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Education Classification - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 671,
          "offsetEnd": 671,
          "columnNum": 432
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Education Classification - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 672,
          "offsetEnd": 672,
          "columnNum": 433
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Education Classification - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 673,
          "offsetEnd": 673,
          "columnNum": 434
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Education Classification - Document 4 (Social Studies)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_DOCUMENT_4_(SOCIAL_STUDIES)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 674,
          "offsetEnd": 674,
          "columnNum": 435
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Education Classification Flag",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 675,
          "offsetEnd": 675,
          "columnNum": 436
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Primary Exceptionality",
        "otherPossibleNames": [],
        "logicalName": "LAP_PRIMARY_EXCEPTIONALITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 676,
          "offsetEnd": 677,
          "columnNum": 437
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Exceptionality Category",
        "otherPossibleNames": [],
        "logicalName": "LAP_EXCEPTIONALITY_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 678,
          "offsetEnd": 679,
          "columnNum": 438
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Exceptionality Category",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_EXCEPTIONALITY_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 680,
          "offsetEnd": 681,
          "columnNum": 439
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 682,
          "offsetEnd": 683,
          "columnNum": 440
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 684,
          "offsetEnd": 685,
          "columnNum": 441
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 686,
          "offsetEnd": 687,
          "columnNum": 442
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category - Document 4 (Social Studies)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY_DOCUMENT_4_(SOCIAL_STUDIES)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 688,
          "offsetEnd": 689,
          "columnNum": 443
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP LEP Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_LEP_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 690,
          "offsetEnd": 691,
          "columnNum": 444
        },
        "fieldLength": 2,
        "expectedValues": ["", "01", "02"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "eDIRECT LEP Code",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_LEP_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 692,
          "offsetEnd": 693,
          "columnNum": 445
        },
        "fieldLength": 2,
        "expectedValues": ["", "01", "02"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized LEP Status - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_LEP_STATUS_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 694,
          "offsetEnd": 694,
          "columnNum": 446
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized LEP Status - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_LEP_STATUS_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 695,
          "offsetEnd": 695,
          "columnNum": 447
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized LEP Status - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_LEP_STATUS_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 696,
          "offsetEnd": 696,
          "columnNum": 448
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized LEP Status - Document 4 (Social Studies)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_LEP_STATUS_DOCUMENT_4_(SOCIAL_STUDIES)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 697,
          "offsetEnd": 697,
          "columnNum": 449
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized LEP Status ",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_LEP_STATUS_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 698,
          "offsetEnd": 698,
          "columnNum": 450
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP LEP Indicator Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_LEP_INDICATOR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 699,
          "offsetEnd": 699,
          "columnNum": 451
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Section 504 Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_SECTION_504_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 700,
          "offsetEnd": 700,
          "columnNum": 452
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Section 504 Code",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_SECTION_504_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 701,
          "columnNum": 453
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Section 504 Status - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SECTION_504_STATUS_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 702,
          "offsetEnd": 702,
          "columnNum": 454
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Section 504 Status - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SECTION_504_STATUS_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 703,
          "offsetEnd": 703,
          "columnNum": 455
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Section 504 Status - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SECTION_504_STATUS_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 704,
          "offsetEnd": 704,
          "columnNum": 456
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Section 504 Status - Document 4 (Social Studies)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SECTION_504_STATUS_DOCUMENT_4_(SOCIAL_STUDIES)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 705,
          "offsetEnd": 705,
          "columnNum": 457
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Section 504 Status ",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SECTION_504_STATUS_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 706,
          "offsetEnd": 706,
          "columnNum": 458
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Hispanic/Latino",
        "otherPossibleNames": [],
        "logicalName": "LAP_HISPANIC/LATINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 707,
          "offsetEnd": 707,
          "columnNum": 459
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Hispanic/Latino",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_HISPANIC/LATINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 708,
          "offsetEnd": 708,
          "columnNum": 460
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP American Indian or Alaska Native",
        "otherPossibleNames": [],
        "logicalName": "LAP_AMERICAN_INDIAN_OR_ALASKA_NATIVE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 709,
          "offsetEnd": 709,
          "columnNum": 461
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT American Indian or Alaska Native",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_AMERICAN_INDIAN_OR_ALASKA_NATIVE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 710,
          "offsetEnd": 710,
          "columnNum": 462
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Asian",
        "otherPossibleNames": [],
        "logicalName": "LAP_ASIAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 711,
          "offsetEnd": 711,
          "columnNum": 463
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Asian",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_ASIAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 712,
          "offsetEnd": 712,
          "columnNum": 464
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Black or African American",
        "otherPossibleNames": [],
        "logicalName": "LAP_BLACK_OR_AFRICAN_AMERICAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 713,
          "offsetEnd": 713,
          "columnNum": 465
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Black or African American",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_BLACK_OR_AFRICAN_AMERICAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 714,
          "offsetEnd": 714,
          "columnNum": 466
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Native Hawaiian or Other Pacific Islander",
        "otherPossibleNames": [],
        "logicalName": "LAP_NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 715,
          "offsetEnd": 715,
          "columnNum": 467
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT Native Hawaiian or Other Pacific Islander",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 716,
          "offsetEnd": 716,
          "columnNum": 468
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP White",
        "otherPossibleNames": [],
        "logicalName": "LAP_WHITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 717,
          "offsetEnd": 717,
          "columnNum": 469
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "eDIRECT White",
        "otherPossibleNames": [],
        "logicalName": "EDIRECT_WHITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 718,
          "offsetEnd": 718,
          "columnNum": 470
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Ethnicity/Race - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY/RACE_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 719,
          "offsetEnd": 719,
          "columnNum": 471
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5", "6", "7", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Ethnicity/Race - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY/RACE_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 720,
          "offsetEnd": 720,
          "columnNum": 472
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5", "6", "7", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Ethnicity/Race - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY/RACE_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 721,
          "offsetEnd": 721,
          "columnNum": 473
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5", "6", "7", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Ethnicity/Race - Document 4 (Social Studies)",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY/RACE_DOCUMENT_4_(SOCIAL_STUDIES)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 722,
          "offsetEnd": 722,
          "columnNum": 474
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5", "6", "7", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 723,
          "offsetEnd": 733,
          "columnNum": 475
        },
        "fieldLength": 11,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score Total - ELA",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 734,
          "offsetEnd": 738,
          "columnNum": 476
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scale Score - ELA",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 739,
          "offsetEnd": 741,
          "columnNum": 477
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Assessment Achievement Level - ELA",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 742,
          "offsetEnd": 744,
          "columnNum": 478
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", "INC", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Raw Score",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 745,
          "offsetEnd": 748,
          "columnNum": 479
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Rating",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_RATING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 749,
          "offsetEnd": 749,
          "columnNum": 480
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Literary Text Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_PERCENT_CORRECT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 750,
          "offsetEnd": 752,
          "columnNum": 481
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Raw Score",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 753,
          "offsetEnd": 756,
          "columnNum": 482
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Rating",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_RATING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 757,
          "offsetEnd": 757,
          "columnNum": 483
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Informational Text Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_PERCENT_CORRECT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 758,
          "offsetEnd": 760,
          "columnNum": 484
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Raw Score",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 761,
          "offsetEnd": 764,
          "columnNum": 485
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Rating",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_RATING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 765,
          "offsetEnd": 765,
          "columnNum": 486
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Vocabulary Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_PERCENT_CORRECT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 766,
          "offsetEnd": 768,
          "columnNum": 487
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Written Expression Raw Score",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 769,
          "offsetEnd": 772,
          "columnNum": 488
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Written Expression Rating",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_RATING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 773,
          "offsetEnd": 773,
          "columnNum": 489
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Written Expression Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_PERCENT_CORRECT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 774,
          "offsetEnd": 776,
          "columnNum": 490
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Raw Score",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 777,
          "offsetEnd": 780,
          "columnNum": 491
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Rating",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 781,
          "offsetEnd": 781,
          "columnNum": 492
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Knowledge & Use of Language Conventions Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 782,
          "offsetEnd": 784,
          "columnNum": 493
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 785,
          "offsetEnd": 804,
          "columnNum": 494
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Raw Score",
        "otherPossibleNames": [],
        "logicalName": "READING_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 805,
          "offsetEnd": 808,
          "columnNum": 495
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Rating ",
        "otherPossibleNames": [],
        "logicalName": "READING_RATING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 809,
          "offsetEnd": 809,
          "columnNum": 496
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "READING_PERCENT_CORRECT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 810,
          "offsetEnd": 812,
          "columnNum": 497
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing Raw Score",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 813,
          "offsetEnd": 816,
          "columnNum": 498
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing Rating",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RATING_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 817,
          "offsetEnd": 817,
          "columnNum": 499
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Writing Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "WRITING_PERCENT_CORRECT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 818,
          "offsetEnd": 820,
          "columnNum": 500
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 821,
          "offsetEnd": 840,
          "columnNum": 501
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SEM High ELA",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 841,
          "offsetEnd": 843,
          "columnNum": 502
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SEM Low ELA",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 844,
          "offsetEnd": 846,
          "columnNum": 503
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Points From Mastery",
        "otherPossibleNames": [],
        "logicalName": "POINTS_FROM_MASTERY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 847,
          "offsetEnd": 849,
          "columnNum": 504
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 850,
          "offsetEnd": 856,
          "columnNum": 505
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score Total - Math",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 857,
          "offsetEnd": 861,
          "columnNum": 506
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scaled Score - Math",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 862,
          "offsetEnd": 864,
          "columnNum": 507
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Assessment Achievement Level - Math",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 865,
          "offsetEnd": 867,
          "columnNum": 508
        },
        "fieldLength": 3,
        "expectedValues": ["", "UNS", "APP", "BAS", "MAS", "ADV", "INC"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Major Content Raw Score",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 868,
          "offsetEnd": 871,
          "columnNum": 509
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Rating",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_RATING_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 872,
          "offsetEnd": 872,
          "columnNum": 510
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_PERCENT_CORRECT_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 873,
          "offsetEnd": 875,
          "columnNum": 511
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Raw Score",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 876,
          "offsetEnd": 879,
          "columnNum": 512
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Rating",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 880,
          "offsetEnd": 880,
          "columnNum": 513
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Additional & Supporting Content Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_PERCENT_CORRECT_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 881,
          "offsetEnd": 883,
          "columnNum": 514
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Raw Score",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 884,
          "offsetEnd": 887,
          "columnNum": 515
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Rating",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 888,
          "offsetEnd": 888,
          "columnNum": 516
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Expressing Mathematical Reasoning Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_PERCENT_CORRECT_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 889,
          "offsetEnd": 891,
          "columnNum": 517
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Raw Score",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 892,
          "offsetEnd": 895,
          "columnNum": 518
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Rating",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_RATING_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 896,
          "offsetEnd": 896,
          "columnNum": 519
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Modeling & Application Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_PERCENT_CORRECT_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 897,
          "offsetEnd": 899,
          "columnNum": 520
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 1 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_1_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 900,
          "offsetEnd": 901,
          "columnNum": 521
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 1 Rating",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_1_RATING_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 902,
          "offsetEnd": 902,
          "columnNum": 522
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 1 Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_1_PERCENT_CORRECT_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 903,
          "offsetEnd": 905,
          "columnNum": 523
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 2 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_2_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 906,
          "offsetEnd": 907,
          "columnNum": 524
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 2 Rating",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_2_RATING_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 908,
          "offsetEnd": 908,
          "columnNum": 525
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 2 Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_2_PERCENT_CORRECT_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 909,
          "offsetEnd": 911,
          "columnNum": 526
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 3 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_3_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 912,
          "offsetEnd": 913,
          "columnNum": 527
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 3 Rating",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_3_RATING_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 914,
          "offsetEnd": 914,
          "columnNum": 528
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 3 Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_3_PERCENT_CORRECT_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 915,
          "offsetEnd": 917,
          "columnNum": 529
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 4 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_4_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 918,
          "offsetEnd": 919,
          "columnNum": 530
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 4 Rating",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_4_RATING_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 920,
          "offsetEnd": 920,
          "columnNum": 531
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Major Content Subcategory 4 Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_SUBCATEGORY_4_PERCENT_CORRECT_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 921,
          "offsetEnd": 923,
          "columnNum": 532
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SEM High Math",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 924,
          "offsetEnd": 926,
          "columnNum": 533
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SEM Low Math",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 927,
          "offsetEnd": 929,
          "columnNum": 534
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Points From Mastery",
        "otherPossibleNames": [],
        "logicalName": "POINTS_FROM_MASTERY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 930,
          "offsetEnd": 932,
          "columnNum": 535
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 933,
          "offsetEnd": 935,
          "columnNum": 536
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score Total - Science",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 936,
          "offsetEnd": 940,
          "columnNum": 537
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scale Score - Science",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 941,
          "offsetEnd": 943,
          "columnNum": 538
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Assessment Achievement Level - Science",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 944,
          "offsetEnd": 946,
          "columnNum": 539
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 947,
          "offsetEnd": 1020,
          "columnNum": 540
        },
        "fieldLength": 74,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SEM High Science",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1021,
          "offsetEnd": 1023,
          "columnNum": 541
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SEM Low Science",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1024,
          "offsetEnd": 1026,
          "columnNum": 542
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1027,
          "offsetEnd": 1056,
          "columnNum": 543
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score Total - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1057,
          "offsetEnd": 1061,
          "columnNum": 544
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scaled Score - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1062,
          "offsetEnd": 1064,
          "columnNum": 545
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Assessment Achievement Level - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1065,
          "offsetEnd": 1067,
          "columnNum": 546
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", "INC", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "History",
        "otherPossibleNames": [],
        "logicalName": "HISTORY_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1068,
          "offsetEnd": 1071,
          "columnNum": 547
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "History Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "HISTORY_PERCENT_CORRECT_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1072,
          "offsetEnd": 1074,
          "columnNum": 548
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "History Rating ",
        "otherPossibleNames": [],
        "logicalName": "HISTORY_RATING_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1075,
          "offsetEnd": 1075,
          "columnNum": 549
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Geography",
        "otherPossibleNames": [],
        "logicalName": "GEOGRAPHY_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1076,
          "offsetEnd": 1079,
          "columnNum": 550
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Geography Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "GEOGRAPHY_PERCENT_CORRECT_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1080,
          "offsetEnd": 1082,
          "columnNum": 551
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Geography Rating ",
        "otherPossibleNames": [],
        "logicalName": "GEOGRAPHY_RATING_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1083,
          "offsetEnd": 1083,
          "columnNum": 552
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Civics",
        "otherPossibleNames": [],
        "logicalName": "CIVICS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1084,
          "offsetEnd": 1087,
          "columnNum": 553
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Civics Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "CIVICS_PERCENT_CORRECT_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1088,
          "offsetEnd": 1090,
          "columnNum": 554
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Civics Rating ",
        "otherPossibleNames": [],
        "logicalName": "CIVICS_RATING_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1091,
          "offsetEnd": 1091,
          "columnNum": 555
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Economics",
        "otherPossibleNames": [],
        "logicalName": "ECONOMICS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1092,
          "offsetEnd": 1095,
          "columnNum": 556
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Economics Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "ECONOMICS_PERCENT_CORRECT_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1096,
          "offsetEnd": 1098,
          "columnNum": 557
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Economics Rating ",
        "otherPossibleNames": [],
        "logicalName": "ECONOMICS_RATING_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1099,
          "offsetEnd": 1099,
          "columnNum": 558
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1100,
          "offsetEnd": 1133,
          "columnNum": 559
        },
        "fieldLength": 34,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SEM High Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1134,
          "offsetEnd": 1136,
          "columnNum": 560
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SEM Low Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1137,
          "offsetEnd": 1139,
          "columnNum": 561
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1140,
          "offsetEnd": 1169,
          "columnNum": 562
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1170,
          "offsetEnd": 1170,
          "columnNum": 563
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1171,
          "offsetEnd": 1171,
          "columnNum": 564
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1172,
          "offsetEnd": 1172,
          "columnNum": 565
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1173,
          "offsetEnd": 1173,
          "columnNum": 566
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - ELA",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1174,
          "offsetEnd": 1174,
          "columnNum": 567
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Math",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1175,
          "offsetEnd": 1175,
          "columnNum": 568
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Science",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1176,
          "offsetEnd": 1176,
          "columnNum": 569
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1177,
          "offsetEnd": 1177,
          "columnNum": 570
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Handscoring Complete - ELA",
        "otherPossibleNames": [],
        "logicalName": "HANDSCORING_COMPLETE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1178,
          "offsetEnd": 1178,
          "columnNum": 571
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Handscoring Complete - Math",
        "otherPossibleNames": [],
        "logicalName": "HANDSCORING_COMPLETE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1179,
          "offsetEnd": 1179,
          "columnNum": 572
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Handscoring Complete - Science",
        "otherPossibleNames": [],
        "logicalName": "HANDSCORING_COMPLETE_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1180,
          "offsetEnd": 1180,
          "columnNum": 573
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Handscoring Complete - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "HANDSCORING_COMPLETE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1181,
          "offsetEnd": 1181,
          "columnNum": 574
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - ELA",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1182,
          "offsetEnd": 1182,
          "columnNum": 575
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Math",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1183,
          "offsetEnd": 1183,
          "columnNum": 576
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Science",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1184,
          "offsetEnd": 1184,
          "columnNum": 577
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1185,
          "offsetEnd": 1185,
          "columnNum": 578
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1186,
          "offsetEnd": 1205,
          "columnNum": 579
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_VOID_FLAG_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1206,
          "offsetEnd": 1206,
          "columnNum": 580
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_VOID_FLAG_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1207,
          "offsetEnd": 1207,
          "columnNum": 581
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_VOID_FLAG_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1208,
          "offsetEnd": 1208,
          "columnNum": 582
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_VOID_FLAG_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1209,
          "offsetEnd": 1209,
          "columnNum": 583
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1210,
          "offsetEnd": 1227,
          "columnNum": 584
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1228,
          "offsetEnd": 1229,
          "columnNum": 585
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1230,
          "offsetEnd": 1231,
          "columnNum": 586
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1232,
          "offsetEnd": 1233,
          "columnNum": 587
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 4 (Social Studies)",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_DOCUMENT_4_(SOCIAL_STUDIES)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1234,
          "offsetEnd": 1235,
          "columnNum": 588
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1236,
          "offsetEnd": 1238,
          "columnNum": 589
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1239,
          "offsetEnd": 1241,
          "columnNum": 590
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - Science",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1242,
          "offsetEnd": 1244,
          "columnNum": 591
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1245,
          "offsetEnd": 1247,
          "columnNum": 592
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1248,
          "offsetEnd": 1273,
          "columnNum": 593
        },
        "fieldLength": 26,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Mode - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_MODE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1274,
          "offsetEnd": 1274,
          "columnNum": 594
        },
        "fieldLength": 1,
        "expectedValues": ["", "P", "O"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Mode - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_MODE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1275,
          "offsetEnd": 1275,
          "columnNum": 595
        },
        "fieldLength": 1,
        "expectedValues": ["", "P", "O"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Mode - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_MODE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1276,
          "offsetEnd": 1276,
          "columnNum": 596
        },
        "fieldLength": 1,
        "expectedValues": ["", "P", "O"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Mode - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "TEST_MODE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1277,
          "offsetEnd": 1277,
          "columnNum": 597
        },
        "fieldLength": 1,
        "expectedValues": ["", "P", "O"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Site Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1278,
          "offsetEnd": 1283,
          "columnNum": 598
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site Code - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1284,
          "offsetEnd": 1289,
          "columnNum": 599
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site Code - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1290,
          "offsetEnd": 1295,
          "columnNum": 600
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site Code - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1296,
          "offsetEnd": 1301,
          "columnNum": 601
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site Code - Document 4 (Social Studies)",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_DOCUMENT_4_(SOCIAL_STUDIES)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1302,
          "offsetEnd": 1307,
          "columnNum": 602
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Document Type Returned - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_TYPE_RETURNED_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1308,
          "offsetEnd": 1308,
          "columnNum": 603
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "M", "P", "O", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Document Type Returned - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_TYPE_RETURNED_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1309,
          "offsetEnd": 1309,
          "columnNum": 604
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "M", "P", "O", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Document Type Returned - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_TYPE_RETURNED_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1310,
          "offsetEnd": 1310,
          "columnNum": 605
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "M", "P", "O", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Document Type Returned - Document 4 (Social Studies)",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_TYPE_RETURNED_DOCUMENT_4_(SOCIAL_STUDIES)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1311,
          "offsetEnd": 1311,
          "columnNum": 606
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "M", "P", "O", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Assess Group Type",
        "otherPossibleNames": [],
        "logicalName": "ASSESS_GROUP_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1312,
          "offsetEnd": 1313,
          "columnNum": 607
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Home Study/Nonpublic Flag",
        "otherPossibleNames": [],
        "logicalName": "HOME_STUDY/NONPUBLIC_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1314,
          "offsetEnd": 1314,
          "columnNum": 608
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Charter Type",
        "otherPossibleNames": [],
        "logicalName": "CHARTER_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1315,
          "offsetEnd": 1315,
          "columnNum": 609
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5", "6"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1316,
          "offsetEnd": 1335,
          "columnNum": 610
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Batch Number - ELA",
        "otherPossibleNames": [],
        "logicalName": "BATCH_NUMBER_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1336,
          "offsetEnd": 1343,
          "columnNum": 611
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Serial Number - ELA",
        "otherPossibleNames": [],
        "logicalName": "SERIAL_NUMBER_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1344,
          "offsetEnd": 1349,
          "columnNum": 612
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lithocode - ELA",
        "otherPossibleNames": [],
        "logicalName": "LITHOCODE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1350,
          "offsetEnd": 1361,
          "columnNum": 613
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Security Barcode Number - ELA",
        "otherPossibleNames": [],
        "logicalName": "SECURITY_BARCODE_NUMBER_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1362,
          "offsetEnd": 1369,
          "columnNum": 614
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Launch Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "LAUNCH_FLAG_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1370,
          "offsetEnd": 1370,
          "columnNum": 615
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 1371,
          "offsetEnd": 1376,
          "columnNum": 616
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1377,
          "offsetEnd": 1379,
          "columnNum": 617
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Batch Number - Math",
        "otherPossibleNames": [],
        "logicalName": "BATCH_NUMBER_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1380,
          "offsetEnd": 1387,
          "columnNum": 618
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Serial Number - Math",
        "otherPossibleNames": [],
        "logicalName": "SERIAL_NUMBER_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1388,
          "offsetEnd": 1393,
          "columnNum": 619
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lithocode - Math",
        "otherPossibleNames": [],
        "logicalName": "LITHOCODE_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1394,
          "offsetEnd": 1405,
          "columnNum": 620
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Security Barcode Number - Math",
        "otherPossibleNames": [],
        "logicalName": "SECURITY_BARCODE_NUMBER_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1406,
          "offsetEnd": 1413,
          "columnNum": 621
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Launch Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "LAUNCH_FLAG_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1414,
          "offsetEnd": 1414,
          "columnNum": 622
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 1415,
          "offsetEnd": 1420,
          "columnNum": 623
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1421,
          "offsetEnd": 1423,
          "columnNum": 624
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Batch Number - Science",
        "otherPossibleNames": [],
        "logicalName": "BATCH_NUMBER_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1424,
          "offsetEnd": 1431,
          "columnNum": 625
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Serial Number - Science",
        "otherPossibleNames": [],
        "logicalName": "SERIAL_NUMBER_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1432,
          "offsetEnd": 1437,
          "columnNum": 626
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lithocode - Science",
        "otherPossibleNames": [],
        "logicalName": "LITHOCODE_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1438,
          "offsetEnd": 1449,
          "columnNum": 627
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Security Barcode Number - Science",
        "otherPossibleNames": [],
        "logicalName": "SECURITY_BARCODE_NUMBER_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1450,
          "offsetEnd": 1457,
          "columnNum": 628
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Launch Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "LAUNCH_FLAG_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1458,
          "offsetEnd": 1458,
          "columnNum": 629
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 1459,
          "offsetEnd": 1464,
          "columnNum": 630
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1465,
          "offsetEnd": 1467,
          "columnNum": 631
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Batch Number - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "BATCH_NUMBER_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1468,
          "offsetEnd": 1475,
          "columnNum": 632
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Serial Number - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SERIAL_NUMBER_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1476,
          "offsetEnd": 1481,
          "columnNum": 633
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lithocode - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "LITHOCODE_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1482,
          "offsetEnd": 1493,
          "columnNum": 634
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Security Barcode Number - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SECURITY_BARCODE_NUMBER_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1494,
          "offsetEnd": 1501,
          "columnNum": 635
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Launch Flag - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "LAUNCH_FLAG_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1502,
          "offsetEnd": 1502,
          "columnNum": 636
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 1503,
          "offsetEnd": 1508,
          "columnNum": 637
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1509,
          "offsetEnd": 1511,
          "columnNum": 638
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Rollup to State",
        "otherPossibleNames": [],
        "logicalName": "ROLLUP_TO_STATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1512,
          "offsetEnd": 1512,
          "columnNum": 639
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in District Media Reports",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_DISTRICT_MEDIA_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1513,
          "offsetEnd": 1513,
          "columnNum": 640
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in School Media Reports",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_SCHOOL_MEDIA_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1514,
          "offsetEnd": 1514,
          "columnNum": 641
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarize to Assessment Group Code for district level reporting",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZE_TO_ASSESSMENT_GROUP_CODE_FOR_DISTRICT_LEVEL_REPORTING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1515,
          "offsetEnd": 1515,
          "columnNum": 642
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Show 'N/A' in place of district results on school reports",
        "otherPossibleNames": [],
        "logicalName": "SHOW_'N/A'_IN_PLACE_OF_DISTRICT_RESULTS_ON_SCHOOL_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1516,
          "offsetEnd": 1516,
          "columnNum": 643
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Schools summarized to LEA Code for district level reporting",
        "otherPossibleNames": [],
        "logicalName": "SCHOOLS_SUMMARIZED_TO_LEA_CODE_FOR_DISTRICT_LEVEL_REPORTING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1517,
          "offsetEnd": 1517,
          "columnNum": 644
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "District reports go to district",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_REPORTS_GO_TO_DISTRICT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1518,
          "offsetEnd": 1518,
          "columnNum": 645
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Site Report Code",
        "otherPossibleNames": [],
        "logicalName": "SITE_REPORT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1519,
          "offsetEnd": 1524,
          "columnNum": 646
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "District report goes to LDE",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_REPORT_GOES_TO_LDE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1525,
          "offsetEnd": 1525,
          "columnNum": 647
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Cleanup reports",
        "otherPossibleNames": [],
        "logicalName": "CLEANUP_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1526,
          "offsetEnd": 1526,
          "columnNum": 648
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summary Reports",
        "otherPossibleNames": [],
        "logicalName": "SUMMARY_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1527,
          "offsetEnd": 1527,
          "columnNum": 649
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Erasure Reports",
        "otherPossibleNames": [],
        "logicalName": "ERASURE_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1528,
          "offsetEnd": 1528,
          "columnNum": 650
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Roster Reports",
        "otherPossibleNames": [],
        "logicalName": "ROSTER_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1529,
          "offsetEnd": 1529,
          "columnNum": 651
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Reports",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORTS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1530,
          "offsetEnd": 1530,
          "columnNum": 652
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1531,
          "offsetEnd": 1537,
          "columnNum": 653
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Remediation Needed Flag",
        "otherPossibleNames": [],
        "logicalName": "REMEDIATION_NEEDED_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1538,
          "offsetEnd": 1538,
          "columnNum": 654
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Roster - ELA",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_ROSTER_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1539,
          "offsetEnd": 1539,
          "columnNum": 655
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Roster - Math",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_ROSTER_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1540,
          "offsetEnd": 1540,
          "columnNum": 656
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Roster - Science",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_ROSTER_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1541,
          "offsetEnd": 1541,
          "columnNum": 657
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Roster - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_ROSTER_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1542,
          "offsetEnd": 1542,
          "columnNum": 658
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Report - ELA",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1543,
          "offsetEnd": 1543,
          "columnNum": 659
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Report - Math",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1544,
          "offsetEnd": 1544,
          "columnNum": 660
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Report - Science",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1545,
          "offsetEnd": 1545,
          "columnNum": 661
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Report - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1546,
          "offsetEnd": 1546,
          "columnNum": 662
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Test Security Violation (Void) - ELA",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_TEST_SECURITY_VIOLATION_(VOID)_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1547,
          "offsetEnd": 1547,
          "columnNum": 663
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Test Security Violation (Void) - Math",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_TEST_SECURITY_VIOLATION_(VOID)_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1548,
          "offsetEnd": 1548,
          "columnNum": 664
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Test Security Violation (Void) - Science",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_TEST_SECURITY_VIOLATION_(VOID)_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1549,
          "offsetEnd": 1549,
          "columnNum": 665
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Test Security Violation (Void) - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_TEST_SECURITY_VIOLATION_(VOID)_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1550,
          "offsetEnd": 1550,
          "columnNum": 666
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1551,
          "offsetEnd": 1560,
          "columnNum": 667
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Number - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_NUMBER_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1561,
          "offsetEnd": 1563,
          "columnNum": 668
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1564,
          "offsetEnd": 1583,
          "columnNum": 669
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1584,
          "offsetEnd": 1603,
          "columnNum": 670
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Number - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_NUMBER_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1604,
          "offsetEnd": 1606,
          "columnNum": 671
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1607,
          "offsetEnd": 1626,
          "columnNum": 672
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1627,
          "offsetEnd": 1646,
          "columnNum": 673
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Number - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_NUMBER_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1647,
          "offsetEnd": 1649,
          "columnNum": 674
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1650,
          "offsetEnd": 1669,
          "columnNum": 675
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1670,
          "offsetEnd": 1689,
          "columnNum": 676
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Number - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_NUMBER_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1690,
          "offsetEnd": 1692,
          "columnNum": 677
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1693,
          "offsetEnd": 1712,
          "columnNum": 678
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1713,
          "offsetEnd": 1732,
          "columnNum": 679
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1733,
          "offsetEnd": 1782,
          "columnNum": 680
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Entry Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_ENTRY_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1783,
          "offsetEnd": 1784,
          "columnNum": 681
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Entry Date",
        "otherPossibleNames": [],
        "logicalName": "LAP_ENTRY_DATE",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1785,
          "offsetEnd": 1792,
          "columnNum": 682
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "ELA Operational Item Responses",
        "otherPossibleNames": [],
        "logicalName": "ELA_OPERATIONAL_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1793,
          "offsetEnd": 1992,
          "columnNum": 683
        },
        "fieldLength": 200,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ELA Field Test Item Responses",
        "otherPossibleNames": [],
        "logicalName": "ELA_FIELD_TEST_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1993,
          "offsetEnd": 2092,
          "columnNum": 684
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Math Operational Item Responses",
        "otherPossibleNames": [],
        "logicalName": "MATH_OPERATIONAL_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2093,
          "offsetEnd": 2292,
          "columnNum": 685
        },
        "fieldLength": 200,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Math Field Test Item Responses",
        "otherPossibleNames": [],
        "logicalName": "MATH_FIELD_TEST_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2293,
          "offsetEnd": 2392,
          "columnNum": 686
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Science Operational Item Responses",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_OPERATIONAL_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2393,
          "offsetEnd": 2442,
          "columnNum": 687
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Science Field Test Item Responses",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_FIELD_TEST_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2443,
          "offsetEnd": 2692,
          "columnNum": 688
        },
        "fieldLength": 250,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Social Studies Operational Item Responses",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_OPERATIONAL_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2693,
          "offsetEnd": 2922,
          "columnNum": 689
        },
        "fieldLength": 230,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Social Studies Field Test Item Responses",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_FIELD_TEST_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2923,
          "offsetEnd": 2982,
          "columnNum": 690
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Full Student First Name",
        "otherPossibleNames": [],
        "logicalName": "FULL_STUDENT_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2983,
          "offsetEnd": 2997,
          "columnNum": 691
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Full Student Last Name",
        "otherPossibleNames": [],
        "logicalName": "FULL_STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2998,
          "offsetEnd": 3017,
          "columnNum": 692
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "New LASID",
        "otherPossibleNames": [],
        "logicalName": "NEW_LASID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3018,
          "offsetEnd": 3027,
          "columnNum": 693
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "File Creation Date and Time Stamp",
        "otherPossibleNames": [],
        "logicalName": "FILE_CREATION_DATE_AND_TIME_STAMP",
        "formatMask": "yyyy-MM-dd HH:MM:SS",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3028,
          "offsetEnd": 3046,
          "columnNum": 694
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".txt"]
}