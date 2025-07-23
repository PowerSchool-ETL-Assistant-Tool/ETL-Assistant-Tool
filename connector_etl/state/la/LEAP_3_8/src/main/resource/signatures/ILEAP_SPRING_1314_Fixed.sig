{
  "encoding": "UTF-8",
  "format": {
    "@type": "Fixed Length",
    "formatName": "ILEAP_SPRING_1314_Fixed",
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
        "expectedValues": ["2014"],
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
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
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
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
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
        "dataTypes": "STRING",
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
        "physicalName": "FILLER",
        "otherPossibleNames": [],
        "logicalName": "FILLER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 156,
          "offsetEnd": 157,
          "columnNum": 23
        },
        "fieldLength": 2,
        "expectedValues": [],
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
          "columnNum": 24
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
          "offsetStart": 159,
          "offsetEnd": 161,
          "columnNum": 25
        },
        "fieldLength": 3,
        "expectedValues": [],
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
          "offsetStart": 162,
          "offsetEnd": 162,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3", ""],
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
          "offsetStart": 163,
          "offsetEnd": 164,
          "columnNum": 27
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
          "offsetStart": 165,
          "offsetEnd": 165,
          "columnNum": 28
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
          "offsetStart": 166,
          "offsetEnd": 170,
          "columnNum": 29
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
          "offsetStart": 171,
          "offsetEnd": 172,
          "columnNum": 30
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
          "columnNum": 31
        },
        "fieldLength": 1,
        "expectedValues": ["3", "5", "6", "7", ""],
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
          "offsetStart": 174,
          "offsetEnd": 175,
          "columnNum": 32
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 33
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
          "offsetEnd": 200,
          "columnNum": 34
        },
        "fieldLength": 24,
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
          "columnNum": 35
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
          "columnNum": 36
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
          "columnNum": 37
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
          "columnNum": 38
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
          "columnNum": 39
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
          "columnNum": 40
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
          "columnNum": 41
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
          "columnNum": 42
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
          "columnNum": 43
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
          "columnNum": 44
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
          "columnNum": 45
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
          "offsetEnd": 217,
          "columnNum": 46
        },
        "fieldLength": 6,
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
          "offsetStart": 218,
          "offsetEnd": 218,
          "columnNum": 47
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
          "columnNum": 48
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
          "columnNum": 49
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
          "columnNum": 50
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
          "columnNum": 51
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
          "columnNum": 52
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
          "offsetEnd": 229,
          "columnNum": 53
        },
        "fieldLength": 6,
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
          "offsetStart": 230,
          "offsetEnd": 230,
          "columnNum": 54
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
          "columnNum": 55
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
          "columnNum": 56
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
          "columnNum": 57
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
          "columnNum": 58
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
          "columnNum": 59
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
          "columnNum": 60
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
          "columnNum": 61
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
          "columnNum": 62
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
          "columnNum": 63
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
          "columnNum": 64
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
          "offsetStart": 241,
          "offsetEnd": 245,
          "columnNum": 65
        },
        "fieldLength": 5,
        "expectedValues": [],
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
          "columnNum": 66
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
          "offsetStart": 249,
          "offsetEnd": 288,
          "columnNum": 67
        },
        "fieldLength": 40,
        "expectedValues": [],
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
          "columnNum": 68
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
          "offsetStart": 299,
          "offsetEnd": 300,
          "columnNum": 69
        },
        "fieldLength": 2,
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
          "offsetStart": 301,
          "offsetEnd": 306,
          "columnNum": 70
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
          "columnNum": 71
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
          "columnNum": 72
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
          "columnNum": 73
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
          "offsetStart": 316,
          "offsetEnd": 322,
          "columnNum": 74
        },
        "fieldLength": 7,
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
          "columnNum": 75
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
          "columnNum": 76
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
          "columnNum": 77
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
          "columnNum": 78
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
          "columnNum": 79
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
          "columnNum": 80
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
          "columnNum": 81
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
          "offsetEnd": 1502,
          "columnNum": 82
        },
        "fieldLength": 1173,
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
          "columnNum": 83
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
          "columnNum": 84
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
          "offsetStart": 1511,
          "offsetEnd": 1519,
          "columnNum": 85
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 86
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Session: Reading and Responding",
        "otherPossibleNames": [],
        "logicalName": "TEST_SESSION_READING_AND_RESPONDING_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1523,
          "offsetEnd": 1526,
          "columnNum": 87
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Test Session: Research to Build Knowledge",
        "otherPossibleNames": [],
        "logicalName": "TEST_SESSION_RESEARCH_TO_BUILD_KNOWLEDGE_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1527,
          "offsetEnd": 1530,
          "columnNum": 88
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Test Session: Writing",
        "otherPossibleNames": [],
        "logicalName": "TEST_SESSION_WRITING_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1531,
          "offsetEnd": 1534,
          "columnNum": 89
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Test Session: Language",
        "otherPossibleNames": [],
        "logicalName": "TEST_SESSION_LANGUAGE_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1535,
          "offsetEnd": 1538,
          "columnNum": 90
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
          "offsetStart": 1539,
          "offsetEnd": 1562,
          "columnNum": 91
        },
        "fieldLength": 24,
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
          "offsetStart": 1563,
          "offsetEnd": 1566,
          "columnNum": 92
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
          "offsetStart": 1567,
          "offsetEnd": 1570,
          "columnNum": 93
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 3: Sentence formation",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_3_SENTENCE_FORMATION_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1571,
          "offsetEnd": 1574,
          "columnNum": 94
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 4: Usage",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_4_USAGE_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1575,
          "offsetEnd": 1578,
          "columnNum": 95
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 5: Mechanics",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_5_MECHANICS_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1579,
          "offsetEnd": 1582,
          "columnNum": 96
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Dimension 6: Spelling",
        "otherPossibleNames": [],
        "logicalName": "DIMENSION_6_SPELLING_RAW_SCORE_ELA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1583,
          "offsetEnd": 1586,
          "columnNum": 97
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
          "columnNum": 98
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
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", "6", "7", ""],
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
          "offsetEnd": 1618,
          "columnNum": 100
        },
        "fieldLength": 26,
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
          "columnNum": 101
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
          "columnNum": 102
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
          "offsetEnd": 1661,
          "columnNum": 103
        },
        "fieldLength": 36,
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
          "offsetStart": 1662,
          "offsetEnd": 1666,
          "columnNum": 104
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
          "offsetStart": 1667,
          "offsetEnd": 1669,
          "columnNum": 105
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
          "offsetStart": 1670,
          "offsetEnd": 1678,
          "columnNum": 106
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "offsetStart": 1679,
          "offsetEnd": 1681,
          "columnNum": 107
        },
        "fieldLength": 3,
        "expectedValues": ["UNS", "APP", "BAS", "MAS", "ADV", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Domain: Operations and Algebraic Thinking",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_OPERATIONS_AND_ALGEBRAIC_THINKING_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1682,
          "offsetEnd": 1685,
          "columnNum": 108
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Number and Operations in Base Ten",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_NUMBER_AND_OPERATIONS_IN_BASE_TEN_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1686,
          "offsetEnd": 1689,
          "columnNum": 109
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Number and Operations—Fractions",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_NUMBER_AND_OPERATIONS_FRACTIONS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1690,
          "offsetEnd": 1693,
          "columnNum": 110
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Measurement and Data",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_MEASUREMENT_AND_DATA_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1694,
          "offsetEnd": 1697,
          "columnNum": 111
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Geometry",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_GEOMETRY_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1698,
          "offsetEnd": 1701,
          "columnNum": 112
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Ratios and Proportional Relationships",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_RATIOS_AND_PROPORTIONAL_RELATIONSHIPS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1702,
          "offsetEnd": 1705,
          "columnNum": 113
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: The Number System",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_THE_NUMBER_SYSTEM_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1706,
          "offsetEnd": 1709,
          "columnNum": 114
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Expressions and Equations",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_EXPRESSIONS_AND_EQUATIONS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1710,
          "offsetEnd": 1713,
          "columnNum": 115
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Domain: Statistics and Probability",
        "otherPossibleNames": [],
        "logicalName": "DOMAIN_STATISTICS_AND_PROBABILITY_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1714,
          "offsetEnd": 1717,
          "columnNum": 116
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Combined Domain: Number and Operations",
        "otherPossibleNames": [],
        "logicalName": "COMBINED_DOMAIN_NUMBER_AND_OPERATIONS_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1718,
          "offsetEnd": 1721,
          "columnNum": 117
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Combined Domain: Geometry / Measurement and Data",
        "otherPossibleNames": [],
        "logicalName": "COMBINED_DOMAIN_GEOMETRY_MEASUREMENT_AND_DATA_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1722,
          "offsetEnd": 1725,
          "columnNum": 118
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Combined Domain: Operations in Base Ten / Algebraic Thinking",
        "otherPossibleNames": [],
        "logicalName": "COMBINED_DOMAIN_OPERATIONS_IN_BASE_TEN_ALGEBRAIC_THINKING_RAW_SCORE_MA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1726,
          "offsetEnd": 1729,
          "columnNum": 119
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
          "columnNum": 120
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
          "columnNum": 121
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
          "columnNum": 122
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
          "offsetEnd": 1749,
          "columnNum": 123
        },
        "fieldLength": 11,
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
          "columnNum": 124
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
          "columnNum": 125
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
          "offsetStart": 1758,
          "offsetEnd": 1766,
          "columnNum": 126
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 127
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
          "columnNum": 128
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
          "columnNum": 129
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
          "columnNum": 130
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
          "columnNum": 131
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
          "columnNum": 132
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
          "columnNum": 133
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
          "columnNum": 134
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 2: Task Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_2_TASK_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1806,
          "offsetEnd": 1809,
          "columnNum": 135
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1810,
          "offsetEnd": 1812,
          "columnNum": 136
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_SCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1813,
          "offsetEnd": 1816,
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
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1817,
          "offsetEnd": 1836,
          "columnNum": 138
        },
        "fieldLength": 20,
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
          "columnNum": 139
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
          "columnNum": 140
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
          "offsetStart": 1845,
          "offsetEnd": 1853,
          "columnNum": 141
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 142
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
          "columnNum": 143
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
          "columnNum": 144
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
          "columnNum": 145
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
          "columnNum": 146
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
          "columnNum": 147
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
          "columnNum": 148
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subtest 2: Task Items",
        "otherPossibleNames": [],
        "logicalName": "SUBTEST_2_TASK_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1893,
          "offsetEnd": 1896,
          "columnNum": 149
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
          "offsetStart": 1897,
          "offsetEnd": 1902,
          "columnNum": 150
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Multiple-Choice Items",
        "otherPossibleNames": [],
        "logicalName": "MULTIPLE_CHOICE_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1903,
          "offsetEnd": 1905,
          "columnNum": 151
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Constructed-Response Items",
        "otherPossibleNames": [],
        "logicalName": "CONSTRUCTED_RESPONSE_ITEMS_RAW_SCORE_SS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1906,
          "offsetEnd": 1909,
          "columnNum": 152
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
          "offsetStart": 1910,
          "offsetEnd": 2017,
          "columnNum": 153
        },
        "fieldLength": 108,
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
          "columnNum": 154
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
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Science",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_-_SCIENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2020,
          "offsetEnd": 2020,
          "columnNum": 156
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MC / CR Taken - Social Studies",
        "otherPossibleNames": [],
        "logicalName": "MC_/_CR_TAKEN_-_SOCIAL_STUDIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2021,
          "offsetEnd": 2021,
          "columnNum": 157
        },
        "fieldLength": 1,
        "expectedValues": ["0", "1", "2", "3"],
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
          "offsetStart": 2022,
          "offsetEnd": 2033,
          "columnNum": 158
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
          "columnNum": 159
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
          "columnNum": 160
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
          "columnNum": 161
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
          "columnNum": 162
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
          "offsetEnd": 2051,
          "columnNum": 163
        },
        "fieldLength": 14,
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
          "columnNum": 164
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
          "columnNum": 165
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
          "columnNum": 166
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
          "columnNum": 167
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
          "columnNum": 168
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
          "columnNum": 169
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
          "columnNum": 170
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
          "columnNum": 171
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
          "columnNum": 172
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
          "columnNum": 173
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
          "columnNum": 174
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
          "columnNum": 175
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
          "columnNum": 176
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
          "offsetStart": 2074,
          "offsetEnd": 2077,
          "columnNum": 177
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
          "columnNum": 178
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
          "columnNum": 179
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
          "columnNum": 180
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
          "columnNum": 181
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
          "offsetStart": 2082,
          "offsetEnd": 2082,
          "columnNum": 182
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "columnNum": 183
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
          "offsetStart": 2084,
          "offsetEnd": 2086,
          "columnNum": 184
        },
        "fieldLength": 3,
        "expectedValues": [],
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
          "columnNum": 185
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
          "columnNum": 186
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
          "offsetStart": 2089,
          "offsetEnd": 2133,
          "columnNum": 187
        },
        "fieldLength": 45,
        "expectedValues": [],
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
          "columnNum": 188
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
          "columnNum": 189
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
          "columnNum": 190
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
          "columnNum": 191
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
          "columnNum": 192
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
          "columnNum": 193
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
          "columnNum": 194
        },
        "fieldLength": 3,
        "expectedValues": ["LEA", "LAB", "CHA", "TRI", "NPB", "STA", "BSE", "OJJ", "MAR", "RES", "NPS", "RLA", "RNO", "JUV", "RBR"],
        "dataTypes": "STRING",
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
          "offsetStart": 2151,
          "offsetEnd": 2153,
          "columnNum": 195
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
          "offsetStart": 2154,
          "offsetEnd": 2156,
          "columnNum": 196
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
          "offsetStart": 2157,
          "offsetEnd": 2159,
          "columnNum": 197
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
          "offsetStart": 2160,
          "offsetEnd": 2162,
          "columnNum": 198
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
          "offsetStart": 2163,
          "offsetEnd": 2163,
          "columnNum": 199
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "columnNum": 200
        },
        "fieldLength": 10,
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
          "offsetStart": 2174,
          "offsetEnd": 2205,
          "columnNum": 201
        },
        "fieldLength": 32,
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
          "columnNum": 202
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
          "offsetEnd": 2226,
          "columnNum": 203
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
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
          "columnNum": 204
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
          "offsetStart": 2233,
          "offsetEnd": 2252,
          "columnNum": 205
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "File Creation Date and Time Stamp",
        "otherPossibleNames": [],
        "logicalName": "FILE_CREATION_DATE_AND_TIME_STAMP",
        "formatMask": "yyyy-MM-dd MM:DD:SS",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2253,
          "offsetEnd": 2271,
          "columnNum": 206
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