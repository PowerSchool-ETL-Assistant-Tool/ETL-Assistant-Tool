{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "ILEAP_SPRING_1213_Fixed",
    "recordLength": 2271,
    "naturalKey": ["STATE_ID", "TEST_DATE_MONTH", "TEST_DATE_YEAR", "FILE_CREATION_DATE_AND_TIME_STAMP","DRC_UNIQUE_STUDENT_ID"],
    "fields": [{
      "physicalName": "Test Date Month",
      "otherPossibleNames": [],
      "logicalName": "TEST_DATE_MONTH",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "Y",
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3,
          "offsetEnd": 6,
          "columnNum": 2
        },
        "fieldLength": 4,
        "expectedValues": ["2013"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Straggler ",
        "otherPossibleNames": [],
        "logicalName": "STRAGGLER_",
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
        "physicalName": "Document Grade",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 94,
          "offsetEnd": 95,
          "columnNum": 8
        },
        "fieldLength": 2,
        "expectedValues": ["03", "05", "06", "07", ""],
        "dataTypes": "INTEGER",
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
          "offsetStart": 96,
          "offsetEnd": 107,
          "columnNum": 9
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 108,
          "offsetEnd": 115,
          "columnNum": 10
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
          "offsetStart": 116,
          "offsetEnd": 116,
          "columnNum": 11
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "State ID",
        "otherPossibleNames": [],
        "logicalName": "STATE_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 117,
          "offsetEnd": 125,
          "columnNum": 12
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 126,
          "offsetEnd": 134,
          "columnNum": 13
        },
        "fieldLength": 9,
        "expectedValues": [],
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
          "offsetStart": 135,
          "offsetEnd": 135,
          "columnNum": 14
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Scholarship Site Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_SCHOLARSHIP_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 136,
          "offsetEnd": 141,
          "columnNum": 15
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Residence_LEA",
        "otherPossibleNames": [],
        "logicalName": "LAP_RESIDENCE_LEA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 142,
          "offsetEnd": 144,
          "columnNum": 16
        },
        "fieldLength": 3,
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
        "physicalName": "Summarized Ethnicity/Race",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY/RACE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 154,
          "offsetEnd": 154,
          "columnNum": 21
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "6", "7", "I"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Lunch Status",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_LUNCH_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 155,
          "offsetEnd": 155,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "0", "9"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Free/Reduced Lunch",
        "otherPossibleNames": [],
        "logicalName": "LAP_FREE/REDUCED_LUNCH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 156,
          "offsetEnd": 156,
          "columnNum": 23
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "0", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Bubbled Lunch Status",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_LUNCH_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 157,
          "offsetEnd": 157,
          "columnNum": 24
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "0", "*", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Calculator Use (Math Test Only)",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_CALCULATOR_USE_(MATH_TEST_ONLY)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 158,
          "offsetEnd": 158,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 159,
          "offsetEnd": 159,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "0", ""],
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
          "offsetStart": 160,
          "offsetEnd": 161,
          "columnNum": 27
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", ""],
        "dataTypes": "INTEGER",
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
          "offsetStart": 162,
          "offsetEnd": 162,
          "columnNum": 28
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "INTEGER",
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
          "offsetStart": 163,
          "offsetEnd": 163,
          "columnNum": 29
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 164,
          "offsetEnd": 164,
          "columnNum": 30
        },
        "fieldLength": 1,
        "expectedValues": ["M", "F", ""],
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
          "offsetStart": 165,
          "offsetEnd": 165,
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": [],
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
        "expectedValues": ["D", "N", ""],
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
          "offsetStart": 167,
          "offsetEnd": 167,
          "columnNum": 33
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", ""],
        "dataTypes": "INTEGER",
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
          "offsetStart": 168,
          "offsetEnd": 168,
          "columnNum": 34
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "*", "-", ""],
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
          "offsetStart": 169,
          "offsetEnd": 169,
          "columnNum": 35
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP Section 504 Flag",
        "otherPossibleNames": [],
        "logicalName": "LAP_SECTION_504_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 170,
          "offsetEnd": 170,
          "columnNum": 36
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 171,
          "offsetEnd": 172,
          "columnNum": 37
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 173,
          "offsetEnd": 173,
          "columnNum": 38
        },
        "fieldLength": 1,
        "expectedValues": ["3", "5", "6", "7"],
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
          "offsetStart": 174,
          "offsetEnd": 175,
          "columnNum": 39
        },
        "fieldLength": 2,
        "expectedValues": ["03", "05", "06", "07", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Option Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_OPTION_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 176,
          "offsetEnd": 176,
          "columnNum": 40
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
          "offsetStart": 177,
          "offsetEnd": 177,
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "offsetStart": 178,
          "offsetEnd": 178,
          "columnNum": 42
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "*", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gifted ",
        "otherPossibleNames": [],
        "logicalName": "GIFTED_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 179,
          "offsetEnd": 179,
          "columnNum": 43
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
          "offsetStart": 180,
          "offsetEnd": 180,
          "columnNum": 44
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
          "offsetStart": 181,
          "offsetEnd": 181,
          "columnNum": 45
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
          "offsetStart": 182,
          "offsetEnd": 182,
          "columnNum": 46
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
          "offsetStart": 183,
          "offsetEnd": 183,
          "columnNum": 47
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
          "offsetStart": 184,
          "offsetEnd": 184,
          "columnNum": 48
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
          "offsetStart": 185,
          "offsetEnd": 185,
          "columnNum": 49
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
          "offsetStart": 186,
          "offsetEnd": 186,
          "columnNum": 50
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
          "offsetStart": 187,
          "offsetEnd": 187,
          "columnNum": 51
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
          "offsetStart": 188,
          "offsetEnd": 188,
          "columnNum": 52
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
          "offsetStart": 189,
          "offsetEnd": 189,
          "columnNum": 53
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
          "offsetStart": 190,
          "offsetEnd": 190,
          "columnNum": 54
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
          "offsetStart": 191,
          "offsetEnd": 191,
          "columnNum": 55
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
          "offsetStart": 192,
          "offsetEnd": 192,
          "columnNum": 56
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
          "offsetStart": 193,
          "offsetEnd": 193,
          "columnNum": 57
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
          "offsetStart": 194,
          "offsetEnd": 194,
          "columnNum": 58
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
          "offsetStart": 195,
          "offsetEnd": 195,
          "columnNum": 59
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
          "offsetStart": 196,
          "offsetEnd": 200,
          "columnNum": 60
        },
        "fieldLength": 5,
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
          "offsetStart": 201,
          "offsetEnd": 201,
          "columnNum": 61
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
          "offsetStart": 202,
          "offsetEnd": 202,
          "columnNum": 62
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
          "offsetStart": 203,
          "offsetEnd": 203,
          "columnNum": 63
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
          "offsetStart": 204,
          "offsetEnd": 204,
          "columnNum": 64
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
          "offsetStart": 205,
          "offsetEnd": 205,
          "columnNum": 65
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
          "offsetStart": 206,
          "offsetEnd": 206,
          "columnNum": 66
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 207,
          "offsetEnd": 207,
          "columnNum": 67
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
          "offsetStart": 208,
          "offsetEnd": 208,
          "columnNum": 68
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
          "offsetStart": 209,
          "offsetEnd": 209,
          "columnNum": 69
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 210,
          "offsetEnd": 210,
          "columnNum": 70
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
          "offsetStart": 211,
          "offsetEnd": 211,
          "columnNum": 71
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
          "offsetStart": 212,
          "offsetEnd": 216,
          "columnNum": 72
        },
        "fieldLength": 5,
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
          "offsetStart": 217,
          "offsetEnd": 217,
          "columnNum": 73
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
          "offsetStart": 218,
          "offsetEnd": 218,
          "columnNum": 74
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
          "offsetStart": 219,
          "offsetEnd": 219,
          "columnNum": 75
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
          "offsetStart": 220,
          "offsetEnd": 220,
          "columnNum": 76
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Provision of English Native Language Word-to-Word Dictionary (No Definitions)",
        "otherPossibleNames": [],
        "logicalName": "PROVISION_OF_ENGLISH_NATIVE_LANGUAGE_WORD-TO-WORD_DICTIONARY_(NO_DEFINITIONS)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 221,
          "offsetEnd": 221,
          "columnNum": 77
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
          "offsetStart": 222,
          "offsetEnd": 222,
          "columnNum": 78
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 223,
          "offsetEnd": 223,
          "columnNum": 79
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
          "offsetStart": 224,
          "offsetEnd": 228,
          "columnNum": 80
        },
        "fieldLength": 5,
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
          "offsetStart": 229,
          "offsetEnd": 229,
          "columnNum": 81
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
          "offsetStart": 230,
          "offsetEnd": 230,
          "columnNum": 82
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
          "offsetStart": 231,
          "offsetEnd": 231,
          "columnNum": 83
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
          "offsetStart": 232,
          "offsetEnd": 232,
          "columnNum": 84
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
          "offsetStart": 233,
          "offsetEnd": 233,
          "columnNum": 85
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
          "offsetStart": 234,
          "offsetEnd": 234,
          "columnNum": 86
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
          "offsetStart": 235,
          "offsetEnd": 235,
          "columnNum": 87
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Communication Assistance",
        "otherPossibleNames": [],
        "logicalName": "COMMUNICATION_ASSISTANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 236,
          "offsetEnd": 236,
          "columnNum": 88
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
          "offsetStart": 237,
          "offsetEnd": 237,
          "columnNum": 89
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
          "offsetStart": 238,
          "offsetEnd": 238,
          "columnNum": 90
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 239,
          "offsetEnd": 239,
          "columnNum": 91
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
          "offsetStart": 240,
          "offsetEnd": 240,
          "columnNum": 92
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
          "offsetStart": 241,
          "offsetEnd": 241,
          "columnNum": 93
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
          "offsetStart": 242,
          "offsetEnd": 244,
          "columnNum": 94
        },
        "fieldLength": 3,
        "expectedValues": [],
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
          "offsetStart": 245,
          "offsetEnd": 245,
          "columnNum": 95
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Bubbled Test Administrator Number",
        "otherPossibleNames": [],
        "logicalName": "BUBBLED_TEST_ADMINISTRATOR_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 246,
          "offsetEnd": 248,
          "columnNum": 96
        },
        "fieldLength": 3,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator Last Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 249,
          "offsetEnd": 268,
          "columnNum": 97
        },
        "fieldLength": 20,
        "expectedValues": ["1", "-", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administrator First Name",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATOR_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 269,
          "offsetEnd": 288,
          "columnNum": 98
        },
        "fieldLength": 20,
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
          "offsetStart": 289,
          "offsetEnd": 298,
          "columnNum": 99
        },
        "fieldLength": 10,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 299,
          "offsetEnd": 300,
          "columnNum": 100
        },
        "fieldLength": 2,
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
          "offsetStart": 301,
          "offsetEnd": 306,
          "columnNum": 101
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Special Education Exceptionality Category",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SPECIAL_EDUCATION_EXCEPTIONALITY_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 307,
          "offsetEnd": 308,
          "columnNum": 102
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "99", ""],
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
          "offsetStart": 309,
          "offsetEnd": 313,
          "columnNum": 103
        },
        "fieldLength": 5,
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
          "offsetStart": 314,
          "offsetEnd": 315,
          "columnNum": 104
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
          "offsetStart": 316,
          "offsetEnd": 317,
          "columnNum": 105
        },
        "fieldLength": 2,
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
          "offsetStart": 318,
          "offsetEnd": 322,
          "columnNum": 106
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Education Classification",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_EDUCATION_CLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 323,
          "offsetEnd": 323,
          "columnNum": 107
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2"],
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
          "offsetStart": 324,
          "offsetEnd": 324,
          "columnNum": 108
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized LEP Status",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_LEP_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 325,
          "offsetEnd": 325,
          "columnNum": 109
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
          "offsetStart": 326,
          "offsetEnd": 326,
          "columnNum": 110
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Section 504 Status",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_SECTION_504_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 327,
          "offsetEnd": 327,
          "columnNum": 111
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
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
          "offsetStart": 328,
          "offsetEnd": 328,
          "columnNum": 112
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 329,
          "offsetEnd": 329,
          "columnNum": 113
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
          "offsetStart": 330,
          "offsetEnd": 332,
          "columnNum": 114
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "English Language Arts Item Responses",
        "otherPossibleNames": [],
        "logicalName": "ENGLISH_LANGUAGE_ARTS_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 333,
          "offsetEnd": 812,
          "columnNum": 115
        },
        "fieldLength": 480,
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
          "offsetStart": 813,
          "offsetEnd": 962,
          "columnNum": 116
        },
        "fieldLength": 150,
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
          "offsetStart": 963,
          "offsetEnd": 1172,
          "columnNum": 117
        },
        "fieldLength": 210,
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
          "offsetStart": 1173,
          "offsetEnd": 1177,
          "columnNum": 118
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Science Item Responses",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1178,
          "offsetEnd": 1342,
          "columnNum": 119
        },
        "fieldLength": 165,
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
          "offsetStart": 1343,
          "offsetEnd": 1347,
          "columnNum": 120
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Social Studies Item Responses",
        "otherPossibleNames": [],
        "logicalName": "SOCIAL_STUDIES_ITEM_RESPONSES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1348,
          "offsetEnd": 1497,
          "columnNum": 121
        },
        "fieldLength": 150,
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
          "offsetStart": 1498,
          "offsetEnd": 1502,
          "columnNum": 122
        },
        "fieldLength": 5,
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
          "offsetStart": 1503,
          "offsetEnd": 1507,
          "columnNum": 123
        },
        "fieldLength": 5,
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
          "offsetStart": 1508,
          "offsetEnd": 1510,
          "columnNum": 124
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement of ELA",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_OF_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1511,
          "offsetEnd": 1513,
          "columnNum": 125
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Upper bound scaled score - ELA",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1514,
          "offsetEnd": 1516,
          "columnNum": 126
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower bound scaled score - ELA",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1517,
          "offsetEnd": 1519,
          "columnNum": 127
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
          "offsetStart": 1520,
          "offsetEnd": 1522,
          "columnNum": 128
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard 1: Read, comprehend, and respond",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_1_READ_COMPREHEND_AND_RESPOND_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1523,
          "offsetEnd": 1526,
          "columnNum": 129
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 2: Write competently",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_2_WRITE_COMPETENTLY_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1527,
          "offsetEnd": 1530,
          "columnNum": 130
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 3: Use conventions of language",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_3_USE_CONVENTIONS_OF_LANGUAGE_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1531,
          "offsetEnd": 1534,
          "columnNum": 131
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 4: Not assessed",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_4_NOT_ASSESSED_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1535,
          "offsetEnd": 1538,
          "columnNum": 132
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 5: Locate, select, and synthesize information",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_5_LOCATE_SELECT_AND_SYNTHESIZE_INFORMATION_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1539,
          "offsetEnd": 1542,
          "columnNum": 133
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 6: Read, analyze, and respond to literature",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_6_READ_ANALYZE_AND_RESPOND_TO_LITERATURE_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1543,
          "offsetEnd": 1546,
          "columnNum": 134
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 7: Apply reasoning and problem solving skills",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_7_APPLY_REASONING_AND_PROBLEM_SOLVING_SKILLS_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1547,
          "offsetEnd": 1550,
          "columnNum": 135
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1551,
          "offsetEnd": 1578,
          "columnNum": 136
        },
        "fieldLength": 28,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Dimension 1: Composing",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_1_COMPOSING_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1579,
          "offsetEnd": 1582,
          "columnNum": 137
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 2: Style/audience awareness",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_2_STYLE_AUDIENCE_AWARENESS_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1583,
          "offsetEnd": 1586,
          "columnNum": 138
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Total Score for Writing",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_SCORE_FOR_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1587,
          "offsetEnd": 1591,
          "columnNum": 139
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Non-Score Code for Writing",
        "otherPossibleNames": [],
        "logicalName": "NON-SCORE_CODE_FOR_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1592,
          "offsetEnd": 1592,
          "columnNum": 140
        },
        "fieldLength": 1,
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
          "offsetStart": 1593,
          "offsetEnd": 1597,
          "columnNum": 141
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spelling",
        "otherPossibleNames": [],
        "logicalName": "SPELLING_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1598,
          "offsetEnd": 1601,
          "columnNum": 142
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Capitalization",
        "otherPossibleNames": [],
        "logicalName": "CAPITALIZATION_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1602,
          "offsetEnd": 1605,
          "columnNum": 143
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Punctuation",
        "otherPossibleNames": [],
        "logicalName": "PUNCTUATION_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1606,
          "offsetEnd": 1609,
          "columnNum": 144
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Usage and Expression",
        "otherPossibleNames": [],
        "logicalName": "USAGE_AND_EXPRESSION_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1610,
          "offsetEnd": 1613,
          "columnNum": 145
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1614,
          "offsetEnd": 1618,
          "columnNum": 146
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1619,
          "offsetEnd": 1621,
          "columnNum": 147
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1622,
          "offsetEnd": 1625,
          "columnNum": 148
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1626,
          "offsetEnd": 1630,
          "columnNum": 149
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Raw Score Total - Reading Subscore",
        "otherPossibleNames": [],
        "logicalName": "READING_SUBSCORE_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1631,
          "offsetEnd": 1634,
          "columnNum": 150
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Scaled Score - Reading Subscore",
        "otherPossibleNames": [],
        "logicalName": "READING_SUBSCORE_SCALE_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1635,
          "offsetEnd": 1637,
          "columnNum": 151
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Assessment Achievement Level - Reading Subscore",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_READING_SUBSCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1638,
          "offsetEnd": 1640,
          "columnNum": 152
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
          "offsetStart": 1641,
          "offsetEnd": 1675,
          "columnNum": 153
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ELA Test Form",
        "otherPossibleNames": [],
        "logicalName": "TEST_FORM_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1676,
          "offsetEnd": 1676,
          "columnNum": 154
        },
        "fieldLength": 1,
        "expectedValues": ["A", "B", "C", "D", ""],
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
          "offsetStart": 1677,
          "offsetEnd": 1681,
          "columnNum": 155
        },
        "fieldLength": 5,
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
          "offsetStart": 1682,
          "offsetEnd": 1686,
          "columnNum": 156
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
          "offsetStart": 1687,
          "offsetEnd": 1689,
          "columnNum": 157
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement of Math",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_OF_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1690,
          "offsetEnd": 1692,
          "columnNum": 158
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Upper bound scaled score - Math",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1693,
          "offsetEnd": 1695,
          "columnNum": 159
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower bound scaled score - Math",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1696,
          "offsetEnd": 1698,
          "columnNum": 160
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
          "offsetStart": 1699,
          "offsetEnd": 1701,
          "columnNum": 161
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reporting Category: Fractions",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_FRACTIONS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1702,
          "offsetEnd": 1705,
          "columnNum": 162
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reporting Category: Measurement, Data, and Geometry",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_MEASUREMENT_DATA_AND_GEOMETRY_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1706,
          "offsetEnd": 1709,
          "columnNum": 163
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reporting Category: Multiplication and Division",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_MULTIPLICATION_AND_DIVISION_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1710,
          "offsetEnd": 1713,
          "columnNum": 164
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reporting Category: Number",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_NUMBER_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1714,
          "offsetEnd": 1717,
          "columnNum": 165
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reporting Category: Number and Operations",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_NUMBER_AND_OPERATIONS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1718,
          "offsetEnd": 1721,
          "columnNum": 166
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reporting Category: Number System",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_NUMBER_SYSTEM_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1722,
          "offsetEnd": 1725,
          "columnNum": 167
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Reporting Category: Ratio, Proportion, and Algebra",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_CATEGORY_RATIO_PROPORTION_AND_ALGEBRA_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1726,
          "offsetEnd": 1729,
          "columnNum": 168
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1730,
          "offsetEnd": 1730,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Subtest 1: Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1731,
          "offsetEnd": 1734,
          "columnNum": 170
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 2: Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_2_CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1735,
          "offsetEnd": 1738,
          "columnNum": 171
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1739,
          "offsetEnd": 1743,
          "columnNum": 172
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Math Test Form",
        "otherPossibleNames": [],
        "logicalName": "TEST_FORM_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1744,
          "offsetEnd": 1744,
          "columnNum": 173
        },
        "fieldLength": 1,
        "expectedValues": ["A", "B", "C", "D", ""],
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
          "offsetStart": 1745,
          "offsetEnd": 1749,
          "columnNum": 174
        },
        "fieldLength": 5,
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
          "offsetStart": 1750,
          "offsetEnd": 1754,
          "columnNum": 175
        },
        "fieldLength": 5,
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
          "offsetStart": 1755,
          "offsetEnd": 1757,
          "columnNum": 176
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement of Science",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_OF_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1758,
          "offsetEnd": 1760,
          "columnNum": 177
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Upper bound scaled score - Science",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1761,
          "offsetEnd": 1763,
          "columnNum": 178
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower bound scaled score - Science",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1764,
          "offsetEnd": 1766,
          "columnNum": 179
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
          "offsetStart": 1767,
          "offsetEnd": 1769,
          "columnNum": 180
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard 1: Science as Inquiry",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_1_SCIENCE_AS_INQUIRY_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1770,
          "offsetEnd": 1773,
          "columnNum": 181
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 2: Physical Science",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_2_PHYSICAL_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1774,
          "offsetEnd": 1777,
          "columnNum": 182
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 3: Life Science",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_3_LIFE_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1778,
          "offsetEnd": 1781,
          "columnNum": 183
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 4: Earth and Space Science",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_4_EARTH_AND_SPACE_SCIENCE_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1782,
          "offsetEnd": 1785,
          "columnNum": 184
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 5: Science and the Environment",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_5_SCIENCE_AND_THE_ENVIRONMENT_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1786,
          "offsetEnd": 1789,
          "columnNum": 185
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1790,
          "offsetEnd": 1801,
          "columnNum": 186
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Subtest 1: Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1802,
          "offsetEnd": 1805,
          "columnNum": 187
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1806,
          "offsetEnd": 1830,
          "columnNum": 188
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Science Test Form",
        "otherPossibleNames": [],
        "logicalName": "TEST_FORM_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1831,
          "offsetEnd": 1831,
          "columnNum": 189
        },
        "fieldLength": 1,
        "expectedValues": ["A", "B", "C", ""],
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
          "offsetStart": 1832,
          "offsetEnd": 1836,
          "columnNum": 190
        },
        "fieldLength": 5,
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
          "offsetStart": 1837,
          "offsetEnd": 1841,
          "columnNum": 191
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
          "offsetStart": 1842,
          "offsetEnd": 1844,
          "columnNum": 192
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard Error of Measurement of Social Studies",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_ERROR_OF_MEASUREMENT_OF_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1845,
          "offsetEnd": 1847,
          "columnNum": 193
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Upper bound scaled score - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SEM_HIGH_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1848,
          "offsetEnd": 1850,
          "columnNum": 194
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Lower bound scaled score - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SEM_LOW_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1851,
          "offsetEnd": 1853,
          "columnNum": 195
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
          "offsetStart": 1854,
          "offsetEnd": 1856,
          "columnNum": 196
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Standard 1: Geography",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_1_GEOGRAPHY_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1857,
          "offsetEnd": 1860,
          "columnNum": 197
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 2: Civics",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_2_CIVICS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1861,
          "offsetEnd": 1864,
          "columnNum": 198
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 3: Economics",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_3_ECONOMICS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1865,
          "offsetEnd": 1868,
          "columnNum": 199
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Standard 4: History",
        "otherPossibleNames": [],
        "logicalName": "STANDARD_4_HISTORY_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1869,
          "offsetEnd": 1872,
          "columnNum": 200
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1873,
          "offsetEnd": 1888,
          "columnNum": 201
        },
        "fieldLength": 16,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Subtest 1: Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_1_MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1889,
          "offsetEnd": 1892,
          "columnNum": 202
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1893,
          "offsetEnd": 1901,
          "columnNum": 203
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Social Studies Test Form",
        "otherPossibleNames": [],
        "logicalName": "TEST_FORM_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1902,
          "offsetEnd": 1902,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": ["A", "B", "C", ""],
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
          "offsetStart": 1903,
          "offsetEnd": 2017,
          "columnNum": 205
        },
        "fieldLength": 115,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - ELA",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2018,
          "offsetEnd": 2018,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Math",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2019,
          "offsetEnd": 2019,
          "columnNum": 207
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Language",
        "otherPossibleNames": [],
        "logicalName": "LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2020,
          "offsetEnd": 2020,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Reading",
        "otherPossibleNames": [],
        "logicalName": "READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2021,
          "offsetEnd": 2021,
          "columnNum": 209
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
          "offsetStart": 2022,
          "offsetEnd": 2033,
          "columnNum": 210
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_VOID_FLAG_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2034,
          "offsetEnd": 2034,
          "columnNum": 211
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_VOID_FLAG_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2035,
          "offsetEnd": 2035,
          "columnNum": 212
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_VOID_FLAG_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2036,
          "offsetEnd": 2036,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Summarized Void Flag - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_VOID_FLAG_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2037,
          "offsetEnd": 2037,
          "columnNum": 214
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
          "offsetStart": 2038,
          "offsetEnd": 2042,
          "columnNum": 215
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Plagiarism Void Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "PLAGIARISM_VOID_FLAG_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2043,
          "offsetEnd": 2043,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Plagiarism Void Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "PLAGIARISM_VOID_FLAG_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2044,
          "offsetEnd": 2044,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Plagiarism Void Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "PLAGIARISM_VOID_FLAG_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2045,
          "offsetEnd": 2045,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Plagiarism Void Flag - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "PLAGIARISM_VOID_FLAG_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2046,
          "offsetEnd": 2046,
          "columnNum": 219
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
          "offsetStart": 2047,
          "offsetEnd": 2051,
          "columnNum": 220
        },
        "fieldLength": 5,
        "expectedValues": [],
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
          "offsetStart": 2052,
          "offsetEnd": 2052,
          "columnNum": 221
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 2053,
          "offsetEnd": 2053,
          "columnNum": 222
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 2054,
          "offsetEnd": 2054,
          "columnNum": 223
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Include in N-counts - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "INCLUDE_IN_N-COUNTS_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2055,
          "offsetEnd": 2055,
          "columnNum": 224
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
          "offsetStart": 2056,
          "offsetEnd": 2060,
          "columnNum": 225
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag - ELA",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2061,
          "offsetEnd": 2061,
          "columnNum": 226
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag - Math",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2062,
          "offsetEnd": 2062,
          "columnNum": 227
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag - Science",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2063,
          "offsetEnd": 2063,
          "columnNum": 228
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Taken Flag - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "TEST_TAKEN_FLAG_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2064,
          "offsetEnd": 2064,
          "columnNum": 229
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
          "offsetStart": 2065,
          "offsetEnd": 2069,
          "columnNum": 230
        },
        "fieldLength": 5,
        "expectedValues": [],
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
          "offsetStart": 2070,
          "offsetEnd": 2071,
          "columnNum": 231
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Homeschool Flag",
        "otherPossibleNames": [],
        "logicalName": "HOMESCHOOL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2072,
          "offsetEnd": 2072,
          "columnNum": 232
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
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
          "offsetStart": 2073,
          "offsetEnd": 2073,
          "columnNum": 233
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", "4", "5"],
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
          "offsetStart": 2074,
          "offsetEnd": 2077,
          "columnNum": 234
        },
        "fieldLength": 4,
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
          "offsetStart": 2078,
          "offsetEnd": 2078,
          "columnNum": 235
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
          "offsetStart": 2079,
          "offsetEnd": 2079,
          "columnNum": 236
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
          "offsetStart": 2080,
          "offsetEnd": 2080,
          "columnNum": 237
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
          "offsetStart": 2081,
          "offsetEnd": 2081,
          "columnNum": 238
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
          "offsetStart": 2082,
          "offsetEnd": 2082,
          "columnNum": 239
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
          "offsetStart": 2083,
          "offsetEnd": 2083,
          "columnNum": 240
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
          "offsetStart": 2084,
          "offsetEnd": 2084,
          "columnNum": 241
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
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
          "offsetStart": 2085,
          "offsetEnd": 2085,
          "columnNum": 242
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
          "offsetStart": 2086,
          "offsetEnd": 2086,
          "columnNum": 243
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
          "offsetStart": 2087,
          "offsetEnd": 2087,
          "columnNum": 244
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
          "offsetStart": 2088,
          "offsetEnd": 2088,
          "columnNum": 245
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
          "offsetStart": 2089,
          "offsetEnd": 2089,
          "columnNum": 246
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
          "offsetStart": 2090,
          "offsetEnd": 2090,
          "columnNum": 247
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Labels",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LABELS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2091,
          "offsetEnd": 2091,
          "columnNum": 248
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
          "offsetStart": 2092,
          "offsetEnd": 2096,
          "columnNum": 249
        },
        "fieldLength": 5,
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
          "offsetStart": 2097,
          "offsetEnd": 2097,
          "columnNum": 250
        },
        "fieldLength": 1,
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
          "offsetStart": 2098,
          "offsetEnd": 2098,
          "columnNum": 251
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "School Roster - Science/Social Studies",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_ROSTER_-_SCIENCE/SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2099,
          "offsetEnd": 2099,
          "columnNum": 252
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Report",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_REPORT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2100,
          "offsetEnd": 2100,
          "columnNum": 253
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
          "offsetStart": 2101,
          "offsetEnd": 2101,
          "columnNum": 254
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student Label ",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LABEL_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2102,
          "offsetEnd": 2102,
          "columnNum": 255
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "offsetStart": 2103,
          "offsetEnd": 2103,
          "columnNum": 256
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
          "offsetStart": 2104,
          "offsetEnd": 2104,
          "columnNum": 257
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
          "offsetStart": 2105,
          "offsetEnd": 2105,
          "columnNum": 258
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
          "offsetStart": 2106,
          "offsetEnd": 2106,
          "columnNum": 259
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
          "offsetStart": 2107,
          "offsetEnd": 2107,
          "columnNum": 260
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
          "offsetStart": 2108,
          "offsetEnd": 2108,
          "columnNum": 261
        },
        "fieldLength": 1,
        "expectedValues": ["1", "-", ""],
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
          "offsetStart": 2109,
          "offsetEnd": 2109,
          "columnNum": 262
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2110,
          "offsetEnd": 2110,
          "columnNum": 263
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2111,
          "offsetEnd": 2111,
          "columnNum": 264
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2112,
          "offsetEnd": 2112,
          "columnNum": 265
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2113,
          "offsetEnd": 2113,
          "columnNum": 266
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2114,
          "offsetEnd": 2114,
          "columnNum": 267
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
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
          "offsetStart": 2115,
          "offsetEnd": 2123,
          "columnNum": 268
        },
        "fieldLength": 9,
        "expectedValues": [],
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
          "offsetStart": 2124,
          "offsetEnd": 2124,
          "columnNum": 269
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
          "offsetStart": 2125,
          "offsetEnd": 2126,
          "columnNum": 270
        },
        "fieldLength": 2,
        "expectedValues": [],
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
          "offsetStart": 2127,
          "offsetEnd": 2127,
          "columnNum": 271
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
          "offsetStart": 2128,
          "offsetEnd": 2129,
          "columnNum": 272
        },
        "fieldLength": 2,
        "expectedValues": [],
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
          "offsetStart": 2130,
          "offsetEnd": 2130,
          "columnNum": 273
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
          "offsetStart": 2131,
          "offsetEnd": 2132,
          "columnNum": 274
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Footnote: Test Security Violation (Void) - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "FOOTNOTE:_TEST_SECURITY_VIOLATION_(VOID)_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2133,
          "offsetEnd": 2133,
          "columnNum": 275
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - ELA",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2134,
          "offsetEnd": 2135,
          "columnNum": 276
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Math",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2136,
          "offsetEnd": 2137,
          "columnNum": 277
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Science",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2138,
          "offsetEnd": 2139,
          "columnNum": 278
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Updated Accountability Code - Social Studies ",
        "otherPossibleNames": [],
        "logicalName": "UPDATED_ACCOUNTABILITY_CODE_-_SOCIAL_STUDIES_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2140,
          "offsetEnd": 2141,
          "columnNum": 279
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Home-base Site District Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_HOME-BASE_SITE_DISTRICT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2142,
          "offsetEnd": 2144,
          "columnNum": 280
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LAP Home-base Site School Code",
        "otherPossibleNames": [],
        "logicalName": "LAP_HOME-BASE_SITE_SCHOOL_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2145,
          "offsetEnd": 2147,
          "columnNum": 281
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Assess Group Code",
        "otherPossibleNames": [],
        "logicalName": "ASSESS_GROUP_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2148,
          "offsetEnd": 2150,
          "columnNum": 282
        },
        "fieldLength": 3,
        "expectedValues": ["LEA", "LAB", "CHA", "TRI", "NPB", "STA", "BSE", "OJJ", "MAR", "RES", "NPS", "RLA", "RNO", "JUV", "RBR"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - ELA",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_-_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2151,
          "offsetEnd": 2153,
          "columnNum": 283
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - Math",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_-_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2154,
          "offsetEnd": 2156,
          "columnNum": 284
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - Science",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2157,
          "offsetEnd": 2159,
          "columnNum": 285
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Accountability Achievement Level - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "ACCOUNTABILITY_ACHIEVEMENT_LEVEL_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2160,
          "offsetEnd": 2162,
          "columnNum": 286
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Document Type Returned",
        "otherPossibleNames": [],
        "logicalName": "DOCUMENT_TYPE_RETURNED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2163,
          "offsetEnd": 2163,
          "columnNum": 287
        },
        "fieldLength": 1,
        "expectedValues": ["N", "M", "P", "O"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LAP LDE Unique ID (GUID)",
        "otherPossibleNames": [],
        "logicalName": "LAP_LDE_UNIQUE_ID_(GUID)",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2164,
          "offsetEnd": 2173,
          "columnNum": 288
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Batch Number",
        "otherPossibleNames": [],
        "logicalName": "BATCH_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2174,
          "offsetEnd": 2181,
          "columnNum": 289
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Serial Number",
        "otherPossibleNames": [],
        "logicalName": "SERIAL_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2182,
          "offsetEnd": 2187,
          "columnNum": 290
        },
        "fieldLength": 6,
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
          "offsetStart": 2188,
          "offsetEnd": 2197,
          "columnNum": 291
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Lithocode",
        "otherPossibleNames": [],
        "logicalName": "LITHOCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2198,
          "offsetEnd": 2204,
          "columnNum": 292
        },
        "fieldLength": 7,
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
          "offsetStart": 2205,
          "offsetEnd": 2205,
          "columnNum": 293
        },
        "fieldLength": 1,
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
          "offsetStart": 2206,
          "offsetEnd": 2211,
          "columnNum": 294
        },
        "fieldLength": 6,
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
          "offsetStart": 2212,
          "offsetEnd": 2218,
          "columnNum": 295
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Security Barcode Number",
        "otherPossibleNames": [],
        "logicalName": "SECURITY_BARCODE_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2219,
          "offsetEnd": 2226,
          "columnNum": 296
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Precoded Site Code",
        "otherPossibleNames": [],
        "logicalName": "PRECODED_SITE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2227,
          "offsetEnd": 2232,
          "columnNum": 297
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 2233,
          "offsetEnd": 2234,
          "columnNum": 298
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 2235,
          "offsetEnd": 2242,
          "columnNum": 299
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
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
          "offsetStart": 2243,
          "offsetEnd": 2252,
          "columnNum": 300
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 2253,
          "offsetEnd": 2271,
          "columnNum": 301
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