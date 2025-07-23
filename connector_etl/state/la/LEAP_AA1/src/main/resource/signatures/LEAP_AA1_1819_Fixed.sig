{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "LEAP_AA1_1819_Fixed",
    "recordLength": 1893,
    "naturalKey": ["LASID", "ASSESSMENT_ACHIEVEMENT_LEVEL_ELA", "ASSESSMENT_ACHIEVEMENT_LEVEL_MATH", "ASSESSMENT_ACHIEVEMENT_LEVEL_SCIENCE", ",TEST DATE MONTH", "TEST DATE YEAR"],
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
      "expectedValues": ["01","02","03","04","05","06","07","08","09","10","11","12"],
      "dataTypes": "INTEGER",
      "scale": null
    },
      {
        "physicalName": "Test Date Year",
        "otherPossibleNames": [],
        "logicalName": "TEST_DATE_YEAR",
        "formatMask": "YYYY",
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
        "dataTypes": "STRING",
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
        "expectedValues": ["03", "04", "05", "06", "07", "08", "09", "10", "11"],
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
        "expectedValues": [],
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
        "expectedValues": ["01","02","03","04","05","06","07","08","09","10","11","12"],
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
        "expectedValues": ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],
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
        "expectedValues": ["F", "I", "M"],
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
        "expectedValues": ["", "F", "M"],
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
          "offsetStart": 155,
          "offsetEnd": 155,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": ["", "F", "M"],
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
          "offsetStart": 156,
          "offsetEnd": 156,
          "columnNum": 23
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
          "offsetStart": 157,
          "offsetEnd": 157,
          "columnNum": 24
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
          "offsetStart": 158,
          "offsetEnd": 158,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 159,
          "offsetEnd": 159,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
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
          "offsetStart": 160,
          "offsetEnd": 160,
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1"],
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
          "offsetStart": 161,
          "offsetEnd": 161,
          "columnNum": 28
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
          "offsetStart": 162,
          "offsetEnd": 162,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "3", "4", "5"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 163,
          "offsetEnd": 163,
          "columnNum": 30
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
          "offsetStart": 164,
          "offsetEnd": 164,
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 165,
          "offsetEnd": 165,
          "columnNum": 32
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
          "offsetStart": 166,
          "offsetEnd": 166,
          "columnNum": 33
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
          "offsetStart": 167,
          "offsetEnd": 167,
          "columnNum": 34
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
          "offsetStart": 168,
          "offsetEnd": 168,
          "columnNum": 35
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
          "offsetStart": 169,
          "offsetEnd": 169,
          "columnNum": 36
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 170,
          "offsetEnd": 179,
          "columnNum": 37
        },
        "fieldLength": 10,
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
          "offsetStart": 180,
          "offsetEnd": 180,
          "columnNum": 38
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
          "offsetStart": 181,
          "offsetEnd": 181,
          "columnNum": 39
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
          "offsetStart": 182,
          "offsetEnd": 182,
          "columnNum": 40
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
          "offsetStart": 183,
          "offsetEnd": 183,
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": ["", "D", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 184,
          "offsetEnd": 193,
          "columnNum": 42
        },
        "fieldLength": 10,
        "expectedValues": [],
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
          "offsetStart": 194,
          "offsetEnd": 194,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Online Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ONLINE_ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 195,
          "offsetEnd": 195,
          "columnNum": 44
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 196,
          "offsetEnd": 196,
          "columnNum": 45
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
          "offsetStart": 197,
          "offsetEnd": 197,
          "columnNum": 46
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
          "offsetStart": 198,
          "offsetEnd": 198,
          "columnNum": 47
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 199,
          "offsetEnd": 203,
          "columnNum": 48
        },
        "fieldLength": 5,
        "expectedValues": [],
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
          "offsetStart": 204,
          "offsetEnd": 204,
          "columnNum": 49
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Online Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ONLINE_ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 205,
          "offsetEnd": 205,
          "columnNum": 50
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 206,
          "offsetEnd": 206,
          "columnNum": 51
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
          "offsetStart": 207,
          "offsetEnd": 207,
          "columnNum": 52
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
          "offsetStart": 208,
          "offsetEnd": 208,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 209,
          "offsetEnd": 213,
          "columnNum": 54
        },
        "fieldLength": 5,
        "expectedValues": [],
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
          "offsetStart": 214,
          "offsetEnd": 214,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Online Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ONLINE_ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 215,
          "offsetEnd": 215,
          "columnNum": 56
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 216,
          "offsetEnd": 216,
          "columnNum": 57
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
          "offsetStart": 217,
          "offsetEnd": 217,
          "columnNum": 58
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
          "offsetStart": 218,
          "offsetEnd": 218,
          "columnNum": 59
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
          "offsetStart": 219,
          "offsetEnd": 219,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 220,
          "offsetEnd": 224,
          "columnNum": 61
        },
        "fieldLength": 5,
        "expectedValues": [],
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
          "offsetStart": 225,
          "offsetEnd": 225,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Online Accommodated Paper",
        "otherPossibleNames": [],
        "logicalName": "ONLINE_ACCOMMODATED_PAPER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 226,
          "offsetEnd": 226,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
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
          "offsetStart": 227,
          "offsetEnd": 227,
          "columnNum": 64
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
          "offsetStart": 228,
          "offsetEnd": 228,
          "columnNum": 65
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
          "offsetStart": 229,
          "offsetEnd": 229,
          "columnNum": 66
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
          "offsetStart": 230,
          "offsetEnd": 230,
          "columnNum": 67
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 231,
          "offsetEnd": 235,
          "columnNum": 68
        },
        "fieldLength": 5,
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
          "offsetStart": 236,
          "offsetEnd": 236,
          "columnNum": 69
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
          "offsetStart": 237,
          "offsetEnd": 237,
          "columnNum": 70
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
          "offsetStart": 238,
          "offsetEnd": 238,
          "columnNum": 71
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 239,
          "offsetEnd": 239,
          "columnNum": 72
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
          "offsetStart": 240,
          "offsetEnd": 240,
          "columnNum": 73
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
          "offsetStart": 241,
          "offsetEnd": 250,
          "columnNum": 74
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
          "offsetStart": 251,
          "offsetEnd": 252,
          "columnNum": 75
        },
        "fieldLength": 2,
        "expectedValues": [],
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
          "offsetStart": 253,
          "offsetEnd": 253,
          "columnNum": 76
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
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 254,
          "offsetEnd": 262,
          "columnNum": 77
        },
        "fieldLength": 9,
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
          "offsetStart": 263,
          "offsetEnd": 263,
          "columnNum": 78
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
          "offsetStart": 264,
          "offsetEnd": 264,
          "columnNum": 79
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
          "offsetStart": 265,
          "offsetEnd": 265,
          "columnNum": 80
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
          "offsetStart": 266,
          "offsetEnd": 266,
          "columnNum": 81
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
          "offsetStart": 267,
          "offsetEnd": 267,
          "columnNum": 82
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
          "offsetStart": 268,
          "offsetEnd": 268,
          "columnNum": 83
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Moderate Mental Disability",
        "otherPossibleNames": [],
        "logicalName": "MODERATE_MENTAL_DISABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 269,
          "offsetEnd": 269,
          "columnNum": 84
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Severe Mental Disability",
        "otherPossibleNames": [],
        "logicalName": "SEVERE_MENTAL_DISABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 270,
          "offsetEnd": 270,
          "columnNum": 85
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
          "offsetStart": 271,
          "offsetEnd": 271,
          "columnNum": 86
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Multiple Disabilities",
        "otherPossibleNames": [],
        "logicalName": "MULTIPLE_DISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 272,
          "offsetEnd": 272,
          "columnNum": 87
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
          "offsetStart": 273,
          "offsetEnd": 273,
          "columnNum": 88
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
          "offsetStart": 274,
          "offsetEnd": 274,
          "columnNum": 89
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
          "offsetStart": 275,
          "offsetEnd": 275,
          "columnNum": 90
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
          "offsetStart": 276,
          "offsetEnd": 276,
          "columnNum": 91
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
          "offsetStart": 277,
          "offsetEnd": 277,
          "columnNum": 92
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
          "offsetStart": 278,
          "offsetEnd": 278,
          "columnNum": 93
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
          "offsetStart": 279,
          "offsetEnd": 279,
          "columnNum": 94
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
          "offsetStart": 280,
          "offsetEnd": 280,
          "columnNum": 95
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Other Health Impairment",
        "otherPossibleNames": [],
        "logicalName": "OTHER_HEALTH_IMPAIRMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 281,
          "offsetEnd": 281,
          "columnNum": 96
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Specific Learning Disability",
        "otherPossibleNames": [],
        "logicalName": "SPECIFIC_LEARNING_DISABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 282,
          "offsetEnd": 282,
          "columnNum": 97
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
          "offsetStart": 283,
          "offsetEnd": 283,
          "columnNum": 98
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
          "offsetStart": 284,
          "offsetEnd": 284,
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 285,
          "offsetEnd": 285,
          "columnNum": 100
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Task Descriptions",
        "otherPossibleNames": [],
        "logicalName": "TASK_DESCRIPTIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 286,
          "offsetEnd": 286,
          "columnNum": 101
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
          "offsetStart": 287,
          "offsetEnd": 287,
          "columnNum": 102
        },
        "fieldLength": 1,
        "expectedValues": ["", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 288,
          "offsetEnd": 302,
          "columnNum": 103
        },
        "fieldLength": 15,
        "expectedValues": [],
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
          "offsetStart": 303,
          "offsetEnd": 303,
          "columnNum": 104
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "-"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Task Descriptions",
        "otherPossibleNames": [],
        "logicalName": "TASK_DESCRIPTIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 304,
          "offsetEnd": 304,
          "columnNum": 105
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "-"],
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
          "offsetStart": 305,
          "offsetEnd": 305,
          "columnNum": 106
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "-"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 306,
          "offsetEnd": 320,
          "columnNum": 107
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 321,
          "offsetEnd": 322,
          "columnNum": 108
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
          "offsetStart": 323,
          "offsetEnd": 324,
          "columnNum": 109
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
          "offsetStart": 325,
          "offsetEnd": 326,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 327,
          "offsetEnd": 328,
          "columnNum": 111
        },
        "fieldLength": 2,
        "expectedValues": [],
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
          "offsetStart": 329,
          "offsetEnd": 330,
          "columnNum": 112
        },
        "fieldLength": 2,
        "expectedValues": ["", "01", "02"],
        "dataTypes": "STRING",
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
          "offsetStart": 331,
          "offsetEnd": 332,
          "columnNum": 113
        },
        "fieldLength": 2,
        "expectedValues": ["", "01", "02"],
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
          "offsetStart": 333,
          "offsetEnd": 333,
          "columnNum": 114
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 334,
          "offsetEnd": 334,
          "columnNum": 115
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2", "3"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 335,
          "offsetEnd": 335,
          "columnNum": 116
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 336,
          "offsetEnd": 336,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 337,
          "offsetEnd": 337,
          "columnNum": 118
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 338,
          "offsetEnd": 338,
          "columnNum": 119
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 339,
          "offsetEnd": 339,
          "columnNum": 120
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 340,
          "offsetEnd": 340,
          "columnNum": 121
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 341,
          "offsetEnd": 341,
          "columnNum": 122
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 342,
          "offsetEnd": 342,
          "columnNum": 123
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 343,
          "offsetEnd": 343,
          "columnNum": 124
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 344,
          "offsetEnd": 344,
          "columnNum": 125
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 345,
          "offsetEnd": 345,
          "columnNum": 126
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 346,
          "offsetEnd": 346,
          "columnNum": 127
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 347,
          "offsetEnd": 356,
          "columnNum": 128
        },
        "fieldLength": 10,
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
          "offsetStart": 357,
          "offsetEnd": 359,
          "columnNum": 129
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scaled Score - ELA",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 360,
          "offsetEnd": 363,
          "columnNum": 130
        },
        "fieldLength": 4,
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
          "offsetStart": 364,
          "offsetEnd": 364,
          "columnNum": 131
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 365,
          "offsetEnd": 420,
          "columnNum": 132
        },
        "fieldLength": 56,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading Foundational Set 1 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "READING_FOUNDATIONAL_SET_1_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 421,
          "offsetEnd": 421,
          "columnNum": 133
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reading Foundational Set 2 Raw Score",
        "otherPossibleNames": [],
        "logicalName": "READING_FOUNDATIONAL_SET_2_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 422,
          "offsetEnd": 422,
          "columnNum": 134
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Tier 1 Writing Prompt Raw Score",
        "otherPossibleNames": [],
        "logicalName": "TIER_1_WRITING_PROMPT_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 423,
          "offsetEnd": 423,
          "columnNum": 135
        },
        "fieldLength": 1,
        "expectedValues": ["", "0", "1", "2"],
        "dataTypes": "INTEGER",
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
          "offsetStart": 424,
          "offsetEnd": 427,
          "columnNum": 136
        },
        "fieldLength": 4,
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
          "offsetStart": 428,
          "offsetEnd": 431,
          "columnNum": 137
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 432,
          "offsetEnd": 441,
          "columnNum": 138
        },
        "fieldLength": 10,
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
          "offsetStart": 442,
          "offsetEnd": 444,
          "columnNum": 139
        },
        "fieldLength": 3,
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
          "offsetStart": 445,
          "offsetEnd": 448,
          "columnNum": 140
        },
        "fieldLength": 4,
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
          "offsetStart": 449,
          "offsetEnd": 449,
          "columnNum": 141
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 450,
          "offsetEnd": 529,
          "columnNum": 142
        },
        "fieldLength": 80,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 530,
          "offsetEnd": 533,
          "columnNum": 143
        },
        "fieldLength": 4,
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
          "offsetStart": 534,
          "offsetEnd": 537,
          "columnNum": 144
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 538,
          "offsetEnd": 547,
          "columnNum": 145
        },
        "fieldLength": 10,
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
          "offsetStart": 548,
          "offsetEnd": 549,
          "columnNum": 146
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scaled Score - Science",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 550,
          "offsetEnd": 552,
          "columnNum": 147
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
          "offsetStart": 553,
          "offsetEnd": 555,
          "columnNum": 148
        },
        "fieldLength": 3,
        "expectedValues": ["EST", "MST", "WST", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Earth, Space, and Environmental Science Raw Score",
        "otherPossibleNames": [],
        "logicalName": "EARTH_SPACE_AND_ENVIRONMENTAL_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 556,
          "offsetEnd": 557,
          "columnNum": 149
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Earth, Space, and Environmental Science Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "EARTH_SPACE_AND_ENVIRONMENTAL_SCIENCE_PERCENT_CORRECT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 558,
          "offsetEnd": 560,
          "columnNum": 150
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Life Science Raw Score",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 561,
          "offsetEnd": 562,
          "columnNum": 151
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Life Science Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_PERCENT_CORRECT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 563,
          "offsetEnd": 565,
          "columnNum": 152
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Physical Science Raw Score",
        "otherPossibleNames": [],
        "logicalName": "PHYSICAL_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 566,
          "offsetEnd": 567,
          "columnNum": 153
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Physical Science Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "PHYSICAL_SCIENCE_PERCENT_CORRECT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 568,
          "offsetEnd": 570,
          "columnNum": 154
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Science as Inquiry Raw Score",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 571,
          "offsetEnd": 572,
          "columnNum": 155
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Science as Inquiry Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_PERCENT_CORRECT_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 573,
          "offsetEnd": 575,
          "columnNum": 156
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 576,
          "offsetEnd": 578,
          "columnNum": 157
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
          "offsetStart": 579,
          "offsetEnd": 581,
          "columnNum": 158
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
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 582,
          "offsetEnd": 631,
          "columnNum": 159
        },
        "fieldLength": 50,
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
          "offsetStart": 632,
          "offsetEnd": 632,
          "columnNum": 160
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 633,
          "offsetEnd": 633,
          "columnNum": 161
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 634,
          "offsetEnd": 634,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Handscoring Complete - ELA",
        "otherPossibleNames": [],
        "logicalName": "HANDSCORING_COMPLETE_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 635,
          "offsetEnd": 635,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - ELA",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 636,
          "offsetEnd": 636,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Math",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 637,
          "offsetEnd": 637,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Science",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 638,
          "offsetEnd": 638,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 639,
          "offsetEnd": 658,
          "columnNum": 167
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Void Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 659,
          "offsetEnd": 659,
          "columnNum": 168
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Void Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 660,
          "offsetEnd": 660,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Void Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 661,
          "offsetEnd": 661,
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": ["", "1", "2", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 662,
          "offsetEnd": 663,
          "columnNum": 171
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 664,
          "offsetEnd": 665,
          "columnNum": 172
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 666,
          "offsetEnd": 667,
          "columnNum": 173
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
          "offsetStart": 668,
          "offsetEnd": 670,
          "columnNum": 174
        },
        "fieldLength": 3,
        "expectedValues": ["", "UNS", "BAS", "MAS", "ADV"],
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
          "offsetStart": 671,
          "offsetEnd": 673,
          "columnNum": 175
        },
        "fieldLength": 3,
        "expectedValues": ["", "UNS", "BAS", "MAS", "ADV"],
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
          "offsetStart": 674,
          "offsetEnd": 676,
          "columnNum": 176
        },
        "fieldLength": 3,
        "expectedValues": ["", "EST", "MST", "WST"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 677,
          "offsetEnd": 682,
          "columnNum": 177
        },
        "fieldLength": 6,
        "expectedValues": [],
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
          "offsetStart": 683,
          "offsetEnd": 688,
          "columnNum": 178
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site Code - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_-_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 689,
          "offsetEnd": 694,
          "columnNum": 179
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site Code - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_-_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 695,
          "offsetEnd": 700,
          "columnNum": 180
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Site Code - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "SITE_CODE_-_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 701,
          "offsetEnd": 706,
          "columnNum": 181
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Document Type Returned - Document 1 (ELA)",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_TYPE_RETURNED_-_DOCUMENT_1_(ELA)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 707,
          "offsetEnd": 707,
          "columnNum": 182
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "M", "P", "O", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Document Type Returned - Document 2 (Math)",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_TYPE_RETURNED_-_DOCUMENT_2_(MATH)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 708,
          "offsetEnd": 708,
          "columnNum": 183
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "M", "P", "O", "C"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Document Type Returned - Document 3 (Science)",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_TYPE_RETURNED_-_DOCUMENT_3_(SCIENCE)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 709,
          "offsetEnd": 709,
          "columnNum": 184
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
          "offsetStart": 710,
          "offsetEnd": 711,
          "columnNum": 185
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
          "offsetStart": 712,
          "offsetEnd": 712,
          "columnNum": 186
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
          "offsetStart": 713,
          "offsetEnd": 713,
          "columnNum": 187
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
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 714,
          "offsetEnd": 728,
          "columnNum": 188
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Lithocode - ELA",
        "otherPossibleNames": [],
        "logicalName": "LITHOCODE_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 729,
          "offsetEnd": 740,
          "columnNum": 189
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Launch Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "LAUNCH_FLAG_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 741,
          "offsetEnd": 741,
          "columnNum": 190
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetEnd": 747,
          "columnNum": 191
        },
        "fieldLength": 6,
        "expectedValues": ["", "1", "2", "1nv", "2nv"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 748,
          "offsetEnd": 752,
          "columnNum": 192
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Lithocode - Math",
        "otherPossibleNames": [],
        "logicalName": "LITHOCODE_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 753,
          "offsetEnd": 764,
          "columnNum": 193
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Launch Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "LAUNCH_FLAG_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 765,
          "offsetEnd": 765,
          "columnNum": 194
        },
        "fieldLength": 1,
        "expectedValues": ["", "N", "Y"],
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
          "offsetStart": 766,
          "offsetEnd": 771,
          "columnNum": 195
        },
        "fieldLength": 6,
        "expectedValues": ["", "1"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 772,
          "offsetEnd": 776,
          "columnNum": 196
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Batch Number - Science",
        "otherPossibleNames": [],
        "logicalName": "BATCH_NUMBER_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 777,
          "offsetEnd": 784,
          "columnNum": 197
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Serial Number - Science",
        "otherPossibleNames": [],
        "logicalName": "SERIAL_NUMBER_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 785,
          "offsetEnd": 790,
          "columnNum": 198
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lithocode - Science",
        "otherPossibleNames": [],
        "logicalName": "LITHOCODE_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 791,
          "offsetEnd": 802,
          "columnNum": 199
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Security Barcode Number - Science",
        "otherPossibleNames": [],
        "logicalName": "SECURITY_BARCODE_NUMBER_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 803,
          "offsetEnd": 810,
          "columnNum": 200
        },
        "fieldLength": 8,
        "expectedValues": [],
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
          "offsetStart": 811,
          "offsetEnd": 816,
          "columnNum": 201
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
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 817,
          "offsetEnd": 821,
          "columnNum": 202
        },
        "fieldLength": 5,
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
          "offsetStart": 822,
          "offsetEnd": 822,
          "columnNum": 203
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 823,
          "offsetEnd": 823,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 824,
          "offsetEnd": 824,
          "columnNum": 205
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 825,
          "offsetEnd": 825,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 826,
          "offsetEnd": 826,
          "columnNum": 207
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 827,
          "offsetEnd": 832,
          "columnNum": 208
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
          "offsetStart": 833,
          "offsetEnd": 833,
          "columnNum": 209
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 834,
          "offsetEnd": 834,
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 835,
          "offsetEnd": 835,
          "columnNum": 211
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 836,
          "offsetEnd": 836,
          "columnNum": 212
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
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
          "offsetStart": 837,
          "offsetEnd": 837,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 838,
          "offsetEnd": 847,
          "columnNum": 214
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Roster - ELA/Math",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_ROSTER_-_ELA/MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 848,
          "offsetEnd": 848,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Roster - Science",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_ROSTER_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 849,
          "offsetEnd": 849,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Report - ELA",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 850,
          "offsetEnd": 850,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Report - Math",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 851,
          "offsetEnd": 851,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Report - Science",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 852,
          "offsetEnd": 852,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Test Security Violation (Void) - ELA",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_TEST_SECURITY_VIOLATION_(VOID)_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 853,
          "offsetEnd": 853,
          "columnNum": 220
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Test Security Violation (Void) - Math",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_TEST_SECURITY_VIOLATION_(VOID)_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 854,
          "offsetEnd": 854,
          "columnNum": 221
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Test Security Violation (Void) - Science",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_TEST_SECURITY_VIOLATION_(VOID)_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 855,
          "offsetEnd": 855,
          "columnNum": 222
        },
        "fieldLength": 1,
        "expectedValues": ["N", "Y"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 856,
          "offsetEnd": 865,
          "columnNum": 223
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Number - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_NUMBER_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 866,
          "offsetEnd": 868,
          "columnNum": 224
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 869,
          "offsetEnd": 888,
          "columnNum": 225
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 889,
          "offsetEnd": 908,
          "columnNum": 226
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Number - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_NUMBER_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 909,
          "offsetEnd": 911,
          "columnNum": 227
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 912,
          "offsetEnd": 931,
          "columnNum": 228
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 932,
          "offsetEnd": 951,
          "columnNum": 229
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Number - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_NUMBER_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 952,
          "offsetEnd": 954,
          "columnNum": 230
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 955,
          "offsetEnd": 974,
          "columnNum": 231
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 975,
          "offsetEnd": 994,
          "columnNum": 232
        },
        "fieldLength": 20,
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
          "offsetStart": 995,
          "offsetEnd": 996,
          "columnNum": 233
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
          "offsetStart": 997,
          "offsetEnd": 1004,
          "columnNum": 234
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "ELA Item Responses",
        "otherPossibleNames": [],
        "logicalName": "ELA_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1005,
          "offsetEnd": 1229,
          "columnNum": 235
        },
        "fieldLength": 225,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ELA Survey Item Responses",
        "otherPossibleNames": [],
        "logicalName": "ELA_SURVEY_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1230,
          "offsetEnd": 1329,
          "columnNum": 236
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Math Item Responses",
        "otherPossibleNames": [],
        "logicalName": "MATH_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1330,
          "offsetEnd": 1529,
          "columnNum": 237
        },
        "fieldLength": 200,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Math Survey Item Responses",
        "otherPossibleNames": [],
        "logicalName": "MATH_SURVEY_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1530,
          "offsetEnd": 1629,
          "columnNum": 238
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
          "offsetStart": 1630,
          "offsetEnd": 1829,
          "columnNum": 239
        },
        "fieldLength": 200,
        "expectedValues": ["", "0", "1", "2", "-", "*"],
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
          "offsetStart": 1830,
          "offsetEnd": 1844,
          "columnNum": 240
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
          "offsetStart": 1845,
          "offsetEnd": 1864,
          "columnNum": 241
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
          "offsetStart": 1865,
          "offsetEnd": 1874,
          "columnNum": 242
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 1875,
          "offsetEnd": 1893,
          "columnNum": 243
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