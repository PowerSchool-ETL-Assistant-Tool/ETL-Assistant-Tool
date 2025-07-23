{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "SAT_REDESIGN_DELIMITED_GENDER_2020_ALT",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "hasHeader": true,
    "naturalKey": [],
    "fields": [{
      "physicalName": "AI_CODE",
      "otherPossibleNames": [],
      "logicalName": "SCHOOL_VENDOR_ID",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "Y",
      "fieldOffset": {
        "offsetStart": 0,
        "offsetEnd": 0,
        "columnNum": 1
      },
      "fieldLength": 6,
      "expectedValues": [],
      "dataTypes": "STRING",
      "scale": -1.0
    },
      {
        "physicalName": "AI_NAME",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_1",
        "otherPossibleNames": [],
        "logicalName": "FILLER_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COHORT_YEAR",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_YEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DISTRICT_NAME",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NAME_LAST",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NAME_FIRST",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NAME_MI",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "GENDER",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_GENDER_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 1,
        "expectedValues": ["M", "F"],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_CUBAN",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_CUBAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_MEXICAN",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_MEXICAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_PUERTORICAN",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_PUERTORICAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_HISP_LAT",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_HISP_LAT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_NON_HISP_LAT",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_NON_HISP_LAT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_INDIAN_ALASKAN",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_INDIAN_ALASKAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_ASIAN",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_ASIAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_AFRICANAMERICAN",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_AFRICANAMERICAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_HAWAIIAN_PI",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_HAWAIIAN_PI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_WHITE",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_WHITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RACE_ETH_OTHER",
        "otherPossibleNames": [],
        "logicalName": "RACE_ETH_OTHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_2",
        "otherPossibleNames": [],
        "logicalName": "FILLER_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 21
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DERIVED_AGGREGATE_RACE_ETH",
        "otherPossibleNames": [],
        "logicalName": "DERIVED_AGGREGATE_RACE_ETH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 22
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "BIRTH_DATE",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_DOB",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 23
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_3",
        "otherPossibleNames": [],
        "logicalName": "FILLER_3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "CB_ID",
        "otherPossibleNames": [],
        "logicalName": "CB_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SECONDARY_ID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_VENDOR_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 26
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADDRESS_LINE1",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_ADDRESS_LINE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 27
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADDRESS_LINE2",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_ADDRESS_LINE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 28
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADDRESS_CITY",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_CITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADDRESS_STATE",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_STATE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADDRESS_ZIP",
        "otherPossibleNames": [],
        "logicalName": "ADDRESS_ZIP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 31
        },
        "fieldLength": 17,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADDRESS_COUNTY",
        "otherPossibleNames": [],
        "logicalName": "ADDRESS_COUNTY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 32
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADDRESS_COUNTRY",
        "otherPossibleNames": [],
        "logicalName": "ADDRESS_COUNTRY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 33
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADDRESS_PROVINCE",
        "otherPossibleNames": [],
        "logicalName": "ADDRESS_PROVINCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 34
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FOREIGN_ADDRESS",
        "otherPossibleNames": [],
        "logicalName": "FOREIGN_ADDRESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 35
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PHONE",
        "otherPossibleNames": [],
        "logicalName": "PHONE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 36
        },
        "fieldLength": 24,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EMAIL",
        "otherPossibleNames": [],
        "logicalName": "EMAIL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 37
        },
        "fieldLength": 128,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HOMESCHOOL",
        "otherPossibleNames": [],
        "logicalName": "HOMESCHOOL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 38
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDENT_SEARCH_SERVICE",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_SEARCH_SERVICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "GRAD_DATE",
        "otherPossibleNames": [],
        "logicalName": "PROJ_GRAD_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 40
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "SAA",
        "otherPossibleNames": [],
        "logicalName": "SAA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_REGISTRATION_NUM",
        "otherPossibleNames": [],
        "logicalName": "LATEST_REGISTRATION_NUM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 42
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_MAKE_UP",
        "otherPossibleNames": [],
        "logicalName": "LATEST_MAKE_UP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_DATE",
        "otherPossibleNames": [],
        "logicalName": "LATEST_ASSESSMENT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 44
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_GRADE",
        "otherPossibleNames": [],
        "logicalName": "LATEST_GRADE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 45
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_REVISED",
        "otherPossibleNames": [],
        "logicalName": "LATEST_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 46
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_TOTAL",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 47
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_EBRW",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 48
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_MATH_SECTION",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 49
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_READING",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 50
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_WRIT_LANG",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_WRIT_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 51
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_MATH_TEST",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_MATH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 52
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_SCI_CROSS",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_SCI_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 53
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_HIST_SOCST_CROSS",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_HIST_SOCST_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 54
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_WORDS_CONTEXT",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_WORDS_CONTEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 55
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_COMM_EVIDENCE",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_COMM_EVIDENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 56
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_EXPR_IDEAS",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_EXPR_IDEAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 57
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_ENG_CONVENT",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_ENG_CONVENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 58
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_HEART_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_HEART_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 59
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_ADV_MATH",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_ADV_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 60
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_PROBSLV_DATA",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_PROBSLV_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 61
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_ESSAY_READING",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_ESSAY_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_ESSAY_ANALYSIS",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_ESSAY_ANALYSIS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_ESSAY_WRITING",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_ESSAY_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 64
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_4",
        "otherPossibleNames": [],
        "logicalName": "FILLER_4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 65
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_CRITICAL_READING",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_CRITICAL_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 66
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_MATH",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 67
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_WRITING",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 68
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_ESSAY",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_ESSAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 69
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SAT_ESSAY_MC",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SAT_ESSAY_MC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 70
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_5",
        "otherPossibleNames": [],
        "logicalName": "FILLER_5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 71
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_6",
        "otherPossibleNames": [],
        "logicalName": "FILLER_6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 72
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_TOTAL",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 73
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_EBRW",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 74
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_MATH_SECTION",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 75
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_READING",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 76
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_WRIT_LANG",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_WRIT_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 77
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_MATH_TEST",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_MATH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 78
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_SCI_CROSS",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_SCI_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 79
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_HIST_SOCST_CROSS",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_HIST_SOCST_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 80
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_WORDS_CONTEXT",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_WORDS_CONTEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 81
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_COMM_EVIDENCE",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_COMM_EVIDENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 82
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_EXPR_IDEAS",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_EXPR_IDEAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 83
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_ENG_CONVENT",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_ENG_CONVENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 84
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_HEART_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_HEART_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 85
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_ADV_MATH",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_ADV_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 86
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATREP_SAT_PROBSLV_DATA",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATREP_SAT_PROBSLV_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 87
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_CBSNATION_SAT_CRITICAL_READING",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_CBSNATION_SAT_CRITICAL_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 88
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_CBSNATION_SAT_MATH",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_CBSNATION_SAT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 89
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_CBSNATION_SAT_WRITING",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_CBSNATION_SAT_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 90
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_7",
        "otherPossibleNames": [],
        "logicalName": "FILLER_7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 91
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_8",
        "otherPossibleNames": [],
        "logicalName": "FILLER_8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 92
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_TOTAL",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 93
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_EBRW",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 94
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_MATH_SECTION",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 95
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_READING",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 96
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_WRIT_LANG",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_WRIT_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 97
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_MATH_TEST",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_MATH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 98
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_SCI_CROSS",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_SCI_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 99
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_HIST_SOCST_CROSS",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_HIST_SOCST_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 100
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_WORDS_CONTEXT",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_WORDS_CONTEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 101
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_COMM_EVIDENCE",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_COMM_EVIDENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 102
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_EXPR_IDEAS",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_EXPR_IDEAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 103
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_ENG_CONVENT",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_ENG_CONVENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 104
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_HEART_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_HEART_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 105
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_ADV_MATH",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_ADV_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 106
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_NATUSER_SAT_PROBSLV_DATA",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_NATUSER_SAT_PROBSLV_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 107
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_CBSSTATE_SAT_CRITICAL_READING",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_CBSSTATE_SAT_CRITICAL_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 108
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_CBSSTATE_SAT_MATH",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_CBSSTATE_SAT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 109
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_CBSSTATE_SAT_WRITING",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_CBSSTATE_SAT_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_9",
        "otherPossibleNames": [],
        "logicalName": "FILLER_9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 111
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_10",
        "otherPossibleNames": [],
        "logicalName": "FILLER_10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 112
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EBRW_CCR_BENCHMARK",
        "otherPossibleNames": [],
        "logicalName": "EBRW_CCR_BENCHMARK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 113
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CCR_BENCHMARK",
        "otherPossibleNames": [],
        "logicalName": "MATH_CCR_BENCHMARK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 114
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_11",
        "otherPossibleNames": [],
        "logicalName": "FILLER_11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 115
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_12",
        "otherPossibleNames": [],
        "logicalName": "FILLER_12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 116
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_13",
        "otherPossibleNames": [],
        "logicalName": "FILLER_13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_14",
        "otherPossibleNames": [],
        "logicalName": "FILLER_14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 118
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_15",
        "otherPossibleNames": [],
        "logicalName": "FILLER_15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 119
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_16",
        "otherPossibleNames": [],
        "logicalName": "FILLER_16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 120
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NUM_READING_QUES",
        "otherPossibleNames": [],
        "logicalName": "NUM_READING_QUES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 121
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS1",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 122
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS2",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 123
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS3",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 124
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS4",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 125
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS5",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 126
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS6",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 127
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS7",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 128
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS8",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 129
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS9",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 130
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS10",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 131
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS11",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 132
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS12",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 133
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS13",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 134
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS14",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 135
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS15",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 136
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS16",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 137
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS17",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 138
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS18",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 139
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS19",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 140
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS20",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 141
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS21",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 142
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS22",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 143
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS23",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 144
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS24",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 145
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS25",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 146
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS26",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 147
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS27",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 148
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS28",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 149
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS29",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 150
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS30",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 151
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS31",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS31",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 152
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS32",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS32",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 153
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS33",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS33",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 154
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS34",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS34",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS35",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS35",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 156
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS36",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS36",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 157
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS37",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS37",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 158
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS38",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS38",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 159
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS39",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS39",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 160
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS40",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS40",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 161
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS41",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS41",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS42",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS42",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS43",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS43",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS44",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS44",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS45",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS45",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS46",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS46",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS47",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS47",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 168
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS48",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS48",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 169
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS49",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS49",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 170
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS50",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS50",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 171
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS51",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS51",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_ANS52",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_ANS52",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 173
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_CORRECT",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 174
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_INCORRECT",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_INCORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 175
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "READING_QUES_OMIT",
        "otherPossibleNames": [],
        "logicalName": "READING_QUES_OMIT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 176
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_17",
        "otherPossibleNames": [],
        "logicalName": "FILLER_17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 177
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NUM_WRITLANG_QUES",
        "otherPossibleNames": [],
        "logicalName": "NUM_WRITLANG_QUES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 178
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS1",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 179
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS2",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 180
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS3",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 181
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS4",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 182
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS5",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 183
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS6",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 184
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS7",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 185
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS8",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 186
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS9",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 187
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS10",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 188
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS11",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 189
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS12",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 190
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS13",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 191
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS14",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 192
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS15",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 193
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS16",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 194
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS17",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 195
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS18",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 196
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS19",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 197
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS20",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 198
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS21",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 199
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS22",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 200
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS23",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 201
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS24",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 202
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS25",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 203
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS26",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 204
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS27",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 205
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS28",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 206
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS29",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 207
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS30",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 208
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS31",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS31",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 209
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS32",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS32",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 210
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS33",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS33",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 211
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS34",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS34",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 212
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS35",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS35",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 213
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS36",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS36",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 214
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS37",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS37",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 215
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS38",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS38",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 216
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS39",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS39",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 217
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS40",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS40",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 218
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS41",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS41",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 219
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS42",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS42",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 220
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS43",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS43",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 221
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_ANS44",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_ANS44",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 222
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_CORRECT",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 223
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_INCORRECT",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_INCORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 224
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "WRITLANG_QUES_OMIT",
        "otherPossibleNames": [],
        "logicalName": "WRITLANG_QUES_OMIT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 225
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_18",
        "otherPossibleNames": [],
        "logicalName": "FILLER_18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 226
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NUM_MATH_NCMC_QUES",
        "otherPossibleNames": [],
        "logicalName": "NUM_MATH_NCMC_QUES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 227
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NUM_MATH_NCPR_QUES",
        "otherPossibleNames": [],
        "logicalName": "NUM_MATH_NCPR_QUES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 228
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS1",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 229
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS2",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 230
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS3",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 231
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS4",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 232
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS5",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 233
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS6",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 234
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS7",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 235
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS8",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 236
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS9",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 237
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS10",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 238
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS11",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 239
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS12",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 240
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS13",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 241
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS14",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 242
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCMC_QUES_ANS15",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCMC_QUES_ANS15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 243
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCPR_QUES_ANS1",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCPR_QUES_ANS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 244
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCPR_QUES_ANS2",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCPR_QUES_ANS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 245
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCPR_QUES_ANS3",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCPR_QUES_ANS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 246
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCPR_QUES_ANS4",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCPR_QUES_ANS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 247
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NCPR_QUES_ANS5",
        "otherPossibleNames": [],
        "logicalName": "MATH_NCPR_QUES_ANS5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 248
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NC_QUES_CORRECT",
        "otherPossibleNames": [],
        "logicalName": "MATH_NC_QUES_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 249
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NC_QUES_INCORRECT",
        "otherPossibleNames": [],
        "logicalName": "MATH_NC_QUES_INCORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 250
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_NC_QUES_OMIT",
        "otherPossibleNames": [],
        "logicalName": "MATH_NC_QUES_OMIT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 251
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_19",
        "otherPossibleNames": [],
        "logicalName": "FILLER_19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 252
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NUM_MATH_CMC_QUES",
        "otherPossibleNames": [],
        "logicalName": "NUM_MATH_CMC_QUES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 253
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "NUM_MATH_CPR_QUES",
        "otherPossibleNames": [],
        "logicalName": "NUM_MATH_CPR_QUES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 254
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS1",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 255
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS2",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 256
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS3",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 257
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS4",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 258
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS5",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 259
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS6",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 260
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS7",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 261
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS8",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 262
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS9",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 263
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS10",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 264
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS11",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 265
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS12",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 266
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS13",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 267
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS14",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS14",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 268
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS15",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS15",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 269
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS16",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS16",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 270
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS17",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS17",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 271
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS18",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS18",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 272
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS19",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS19",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 273
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS20",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 274
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS21",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS21",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 275
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS22",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 276
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS23",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 277
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS24",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 278
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS25",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 279
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS26",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 280
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS27",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 281
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS28",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 282
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS29",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 283
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CMC_QUES_ANS30",
        "otherPossibleNames": [],
        "logicalName": "MATH_CMC_QUES_ANS30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 284
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CPR_QUES_ANS1",
        "otherPossibleNames": [],
        "logicalName": "MATH_CPR_QUES_ANS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 285
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CPR_QUES_ANS2",
        "otherPossibleNames": [],
        "logicalName": "MATH_CPR_QUES_ANS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 286
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CPR_QUES_ANS3",
        "otherPossibleNames": [],
        "logicalName": "MATH_CPR_QUES_ANS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 287
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CPR_QUES_ANS4",
        "otherPossibleNames": [],
        "logicalName": "MATH_CPR_QUES_ANS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 288
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CPR_QUES_ANS5",
        "otherPossibleNames": [],
        "logicalName": "MATH_CPR_QUES_ANS5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 289
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CPR_QUES_ANS6",
        "otherPossibleNames": [],
        "logicalName": "MATH_CPR_QUES_ANS6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 290
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CPR_QUES_ANS7",
        "otherPossibleNames": [],
        "logicalName": "MATH_CPR_QUES_ANS7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 291
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_CPR_QUES_ANS8",
        "otherPossibleNames": [],
        "logicalName": "MATH_CPR_QUES_ANS8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 292
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_C_QUES_CORRECT",
        "otherPossibleNames": [],
        "logicalName": "MATH_C_QUES_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 293
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_C_QUES_INCORRECT",
        "otherPossibleNames": [],
        "logicalName": "MATH_C_QUES_INCORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 294
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MATH_C_QUES_OMIT",
        "otherPossibleNames": [],
        "logicalName": "MATH_C_QUES_OMIT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 295
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_20",
        "otherPossibleNames": [],
        "logicalName": "FILLER_20",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 296
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_REGISTRATION_NUM",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_REGISTRATION_NUM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 297
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_MAKE_UP",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_MAKE_UP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 298
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_ASSESSMENT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 299
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_GRADE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 300
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 301
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_TOTAL",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 302
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_EBRW",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 303
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_MATH_SECTION",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 304
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 305
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_WRIT_LANG",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_WRIT_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 306
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_MATH_TEST",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_MATH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 307
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_SCI_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_SCI_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 308
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_HIST_SOCST_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_HIST_SOCST_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 309
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_WORDS_CONTEXT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_WORDS_CONTEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 310
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_COMM_EVIDENCE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_COMM_EVIDENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 311
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_EXPR_IDEAS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_EXPR_IDEAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 312
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_ENG_CONVENT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_ENG_CONVENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 313
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_HEART_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_HEART_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 314
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_ADV_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_ADV_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 315
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_PROBSLV_DATA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_PROBSLV_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 316
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_ESSAY_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_ESSAY_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 317
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_ESSAY_ANALYSIS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_ESSAY_ANALYSIS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 318
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_ESSAY_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_ESSAY_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 319
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_22",
        "otherPossibleNames": [],
        "logicalName": "FILLER_22",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 320
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_CRITICAL_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_CRITICAL_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 321
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 322
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 323
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_ESSAY",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_ESSAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 324
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SAT_ESSAY_MC",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SAT_ESSAY_MC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 325
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_23",
        "otherPossibleNames": [],
        "logicalName": "FILLER_23",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 326
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_24",
        "otherPossibleNames": [],
        "logicalName": "FILLER_24",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 327
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_REGISTRATION_NUM",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_REGISTRATION_NUM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 328
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_MAKE_UP",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_MAKE_UP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 329
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_ASSESSMENT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 330
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_GRADE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 331
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 332
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_TOTAL",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 333
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_EBRW",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 334
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_MATH_SECTION",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 335
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 336
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_WRIT_LANG",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_WRIT_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 337
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_MATH_TEST",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_MATH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 338
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_SCI_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_SCI_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 339
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_HIST_SOCST_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_HIST_SOCST_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 340
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_WORDS_CONTEXT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_WORDS_CONTEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 341
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_COMM_EVIDENCE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_COMM_EVIDENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 342
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_EXPR_IDEAS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_EXPR_IDEAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 343
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_ENG_CONVENT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_ENG_CONVENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 344
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_HEART_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_HEART_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 345
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_ADV_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_ADV_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 346
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_PROBSLV_DATA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_PROBSLV_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 347
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_ESSAY_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_ESSAY_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 348
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_ESSAY_ANALYSIS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_ESSAY_ANALYSIS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 349
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_ESSAY_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_ESSAY_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 350
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_25",
        "otherPossibleNames": [],
        "logicalName": "FILLER_25",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 351
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_CRITICAL_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_CRITICAL_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 352
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 353
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 354
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_ESSAY",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_ESSAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 355
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SAT_ESSAY_MC",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SAT_ESSAY_MC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 356
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_26",
        "otherPossibleNames": [],
        "logicalName": "FILLER_26",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 357
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_27",
        "otherPossibleNames": [],
        "logicalName": "FILLER_27",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 358
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_REGISTRATION_NUM",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_REGISTRATION_NUM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 359
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_MAKE_UP",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_MAKE_UP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 360
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_ASSESSMENT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 361
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_GRADE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 362
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 363
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_TOTAL",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 364
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_EBRW",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 365
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_MATH_SECTION",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 366
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 367
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_WRIT_LANG",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_WRIT_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 368
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_MATH_TEST",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_MATH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 369
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_SCI_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_SCI_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 370
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_HIST_SOCST_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_HIST_SOCST_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 371
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_WORDS_CONTEXT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_WORDS_CONTEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 372
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_COMM_EVIDENCE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_COMM_EVIDENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 373
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_EXPR_IDEAS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_EXPR_IDEAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 374
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_ENG_CONVENT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_ENG_CONVENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 375
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_HEART_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_HEART_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 376
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_ADV_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_ADV_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 377
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_PROBSLV_DATA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_PROBSLV_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 378
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_ESSAY_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_ESSAY_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 379
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_ESSAY_ANALYSIS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_ESSAY_ANALYSIS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 380
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_ESSAY_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_ESSAY_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 381
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_28",
        "otherPossibleNames": [],
        "logicalName": "FILLER_28",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 382
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_CRITICAL_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_CRITICAL_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 383
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 384
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 385
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_ESSAY",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_ESSAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 386
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SAT_ESSAY_MC",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SAT_ESSAY_MC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 387
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_29",
        "otherPossibleNames": [],
        "logicalName": "FILLER_29",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 388
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_30",
        "otherPossibleNames": [],
        "logicalName": "FILLER_30",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 389
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_REGISTRATION_NUM",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_REGISTRATION_NUM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 390
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_MAKE_UP",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_MAKE_UP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 391
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_ASSESSMENT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 392
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_GRADE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 393
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 394
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_TOTAL",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 395
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_EBRW",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 396
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_MATH_SECTION",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 397
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 398
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_WRIT_LANG",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_WRIT_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 399
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_MATH_TEST",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_MATH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 400
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_SCI_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_SCI_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 401
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_HIST_SOCST_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_HIST_SOCST_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 402
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_WORDS_CONTEXT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_WORDS_CONTEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 403
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_COMM_EVIDENCE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_COMM_EVIDENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 404
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_EXPR_IDEAS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_EXPR_IDEAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 405
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_ENG_CONVENT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_ENG_CONVENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 406
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_HEART_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_HEART_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 407
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_ADV_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_ADV_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 408
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_PROBSLV_DATA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_PROBSLV_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 409
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_ESSAY_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_ESSAY_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 410
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_ESSAY_ANALYSIS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_ESSAY_ANALYSIS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 411
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_ESSAY_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_ESSAY_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 412
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_31",
        "otherPossibleNames": [],
        "logicalName": "FILLER_31",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 413
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_CRITICAL_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_CRITICAL_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 414
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 415
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 416
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_ESSAY",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_ESSAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 417
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SAT_ESSAY_MC",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SAT_ESSAY_MC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 418
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_32",
        "otherPossibleNames": [],
        "logicalName": "FILLER_32",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 419
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_33",
        "otherPossibleNames": [],
        "logicalName": "FILLER_33",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 420
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_REGISTRATION_NUM",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_REGISTRATION_NUM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 421
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_MAKE_UP",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_MAKE_UP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 422
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_ASSESSMENT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 423
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_GRADE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 424
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 425
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_TOTAL",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 426
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_EBRW",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 427
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_MATH_SECTION",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 428
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 429
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_WRIT_LANG",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_WRIT_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 430
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_MATH_TEST",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_MATH_TEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 431
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_SCI_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_SCI_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 432
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_HIST_SOCST_CROSS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_HIST_SOCST_CROSS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 433
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_WORDS_CONTEXT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_WORDS_CONTEXT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 434
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_COMM_EVIDENCE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_COMM_EVIDENCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 435
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_EXPR_IDEAS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_EXPR_IDEAS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 436
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_ENG_CONVENT",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_ENG_CONVENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 437
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_HEART_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_HEART_ALGEBRA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 438
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_ADV_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_ADV_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 439
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_PROBSLV_DATA",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_PROBSLV_DATA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 440
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_ESSAY_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_ESSAY_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 441
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_ESSAY_ANALYSIS",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_ESSAY_ANALYSIS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 442
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_ESSAY_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_ESSAY_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 443
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_34",
        "otherPossibleNames": [],
        "logicalName": "FILLER_34",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 444
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_CRITICAL_READING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_CRITICAL_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 445
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_MATH",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 446
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_WRITING",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 447
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_ESSAY",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_ESSAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 448
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SAT_ESSAY_MC",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SAT_ESSAY_MC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 449
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_35",
        "otherPossibleNames": [],
        "logicalName": "FILLER_35",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 450
        },
        "fieldLength": 12,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_36",
        "otherPossibleNames": [],
        "logicalName": "FILLER_36",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 451
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_DATE",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 452
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_GRADE",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_GRADELEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 453
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_REVISED",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 454
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_1_ID",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST1_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 455
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_1_SCORE",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST1_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 456
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_1_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST1_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 457
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_1_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST1_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 458
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_1_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST1_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 459
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_2_ID",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST2_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 460
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_2_SCORE",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST2_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 461
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_2_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST2_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 462
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_2_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST2_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 463
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_2_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST2_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 464
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_3_ID",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST3_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 465
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_3_SCORE",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST3_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 466
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_3_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST3_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 467
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_3_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST3_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 468
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "LATEST_SUBJ_3_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "LATEST_SUBJ_TEST3_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 469
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 470
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_GRADELEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 471
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 472
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_1_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST1_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 473
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_1_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST1_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 474
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_1_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 475
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_1_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 476
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_1_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST1_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 477
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_2_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST2_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 478
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_2_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST2_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 479
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_2_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 480
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_2_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 481
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_2_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST2_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 482
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_3_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST3_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 483
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_3_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST3_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 484
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_3_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 485
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_3_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 486
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN2_SUBJ_3_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN2_SUBJ_TEST3_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 487
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 488
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_GRADELEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 489
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 490
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_1_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST1_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 491
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_1_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST1_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 492
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_1_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 493
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_1_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 494
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_1_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST1_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 495
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_2_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST2_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 496
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_2_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST2_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 497
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_2_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 498
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_2_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 499
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_2_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST2_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 500
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_3_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST3_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 501
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_3_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST3_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 502
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_3_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 503
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_3_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 504
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN3_SUBJ_3_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN3_SUBJ_TEST3_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 505
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 506
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_GRADELEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 507
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 508
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_1_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST1_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 509
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_1_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST1_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 510
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_1_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 511
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_1_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 512
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_1_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST1_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 513
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_2_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST2_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 514
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_2_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST2_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 515
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_2_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 516
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_2_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 517
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_2_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST2_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 518
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_3_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST3_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 519
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_3_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST3_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 520
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_3_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 521
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_3_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 522
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN4_SUBJ_3_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN4_SUBJ_TEST3_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 523
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 524
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_GRADELEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 525
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 526
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_1_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST1_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 527
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_1_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST1_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 528
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_1_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 529
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_1_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 530
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_1_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST1_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 531
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_2_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST2_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 532
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_2_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST2_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 533
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_2_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 534
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_2_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 535
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_2_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST2_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 536
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_3_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST3_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 537
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_3_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST3_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 538
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_3_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 539
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_3_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 540
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN5_SUBJ_3_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN5_SUBJ_TEST3_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 541
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_DATE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 542
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_GRADE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_GRADELEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 543
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_REVISED",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_REVISED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 544
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_1_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST1_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 545
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_1_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST1_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 546
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_1_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 547
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_1_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 548
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_1_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST1_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 549
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_2_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST2_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 550
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_2_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST2_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 551
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_2_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 552
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_2_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 553
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_2_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST2_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 554
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_3_ID",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST3_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 555
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_3_SCORE",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST3_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 556
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_3_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 557
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_3_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 558
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ADMIN6_SUBJ_3_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "ADMIN6_SUBJ_TEST3_SUBSCR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 559
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_1",
        "otherPossibleNames": [],
        "logicalName": "SUBJ1_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 560
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_1_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "SUBJ1_SUBSCR1_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 561
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_1_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "SUBJ1_SUBSCR2_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 562
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_1_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "SUBJ1_SUBSCR3_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 563
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_2",
        "otherPossibleNames": [],
        "logicalName": "SUBJ2_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 564
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_2_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "SUBJ2_SUBSCR1_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 565
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_2_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "SUBJ2_SUBSCR2_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 566
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_2_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "SUBJ2_SUBSCR3_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 567
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_3",
        "otherPossibleNames": [],
        "logicalName": "SUBJ3_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 568
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_3_SUBSC1",
        "otherPossibleNames": [],
        "logicalName": "SUBJ3_SUBSCR1_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 569
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_3_SUBSC2",
        "otherPossibleNames": [],
        "logicalName": "SUBJ3_SUBSCR2_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 570
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PERCENTILE_SUBJ_3_SUBSC3",
        "otherPossibleNames": [],
        "logicalName": "SUBJ3_SUBSCR3_PERCENTILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 571
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_37",
        "otherPossibleNames": [],
        "logicalName": "FILLER_37",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 572
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_38",
        "otherPossibleNames": [],
        "logicalName": "FILLER_38",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 573
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_DATE",
        "otherPossibleNames": [],
        "logicalName": "SELF_ASSMT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 574
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_GPA",
        "otherPossibleNames": [],
        "logicalName": "GPA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 575
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_RANK",
        "otherPossibleNames": [],
        "logicalName": "HS_RANK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 576
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_FIRST_LANG",
        "otherPossibleNames": [],
        "logicalName": "FIRST_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 577
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_BEST_LANG",
        "otherPossibleNames": [],
        "logicalName": "BEST_LANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 578
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_45",
        "otherPossibleNames": ["FILLER_45"],
        "logicalName": "CITIZENSHIP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 579
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_39",
        "otherPossibleNames": [],
        "logicalName": "FILLER_39",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 580
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_AVG_ARTS",
        "otherPossibleNames": [],
        "logicalName": "AVG_GRD_ARTMUSIC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 581
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_AVG_ENGLISH",
        "otherPossibleNames": [],
        "logicalName": "AVG_GRD_ENGLISH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 582
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_AVG_FOREIGN_LANG",
        "otherPossibleNames": [],
        "logicalName": "AVG_GRD_LANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 583
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_AVG_MATH",
        "otherPossibleNames": [],
        "logicalName": "AVG_GRD_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 584
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_AVG_NATSCI",
        "otherPossibleNames": [],
        "logicalName": "AVG_GRD_NATSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 585
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SDQ_AVG_SOCIALSCI_HIST",
        "otherPossibleNames": [],
        "logicalName": "AVG_GRD_SOCSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 586
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ARTS",
        "otherPossibleNames": [],
        "logicalName": "HSD_ART",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 587
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ARTS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ART",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 588
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ENGLISH",
        "otherPossibleNames": [],
        "logicalName": "HSD_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 589
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ENGLISH",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ENG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 590
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_FOREIGN AND CLASSICAL LANGUAGES",
        "otherPossibleNames": [],
        "logicalName": "HSD_FORLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 591
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_FOREIGN AND CLASSICAL LANGUAGE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_FORLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 592
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "HSD_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 593
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_MATHEMATICS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_MATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 594
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_NATURAL SCIENCES",
        "otherPossibleNames": [],
        "logicalName": "HSD_NATSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 595
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_NATURAL SCIENCES",
        "otherPossibleNames": [],
        "logicalName": "HONORS_NATSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 596
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_SOCIAL SCIENCES AND HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HSD_SOCSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 597
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_SOCIAL SCIENCES AND HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_SOCSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 598
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_CHINESE",
        "otherPossibleNames": [],
        "logicalName": "HSD_CHIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 599
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_CHINESE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_CHIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 600
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_FRENCH",
        "otherPossibleNames": [],
        "logicalName": "HSD_FRENCH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 601
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_FRENCH",
        "otherPossibleNames": [],
        "logicalName": "HONORS_FRENCH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 602
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_GERMAN",
        "otherPossibleNames": [],
        "logicalName": "HSD_GERM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 603
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_GERMAN",
        "otherPossibleNames": [],
        "logicalName": "HONORS_GERM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 604
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_GREEK",
        "otherPossibleNames": [],
        "logicalName": "HSD_GREEK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 605
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_GREEK",
        "otherPossibleNames": [],
        "logicalName": "HONORS_GREEK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 606
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_HEBREW",
        "otherPossibleNames": [],
        "logicalName": "HSD_HEBR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 607
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_HEBREW",
        "otherPossibleNames": [],
        "logicalName": "HONORS_HEBR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 608
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ITALIAN",
        "otherPossibleNames": [],
        "logicalName": "HSD_ITALIAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 609
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ITALIAN",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ITALIAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 610
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_JAPANESE",
        "otherPossibleNames": [],
        "logicalName": "HSD_JAP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 611
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_JAPANESE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_JAP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 612
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_KOREAN",
        "otherPossibleNames": [],
        "logicalName": "HSD_KOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 613
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_KOREAN",
        "otherPossibleNames": [],
        "logicalName": "HONORS_KOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 614
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_LATIN",
        "otherPossibleNames": [],
        "logicalName": "HSD_LATIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 615
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_LATIN",
        "otherPossibleNames": [],
        "logicalName": "HONORS_LATIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 616
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_RUSSIAN",
        "otherPossibleNames": [],
        "logicalName": "HSD_RUSSN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 617
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_RUSSIAN",
        "otherPossibleNames": [],
        "logicalName": "HONORS_RUSSN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 618
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_SPANISH",
        "otherPossibleNames": [],
        "logicalName": "HSD_SPAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 619
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_SPANISH",
        "otherPossibleNames": [],
        "logicalName": "HONORS_SPAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 620
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_OTHER LANGUAGE COURSE",
        "otherPossibleNames": [],
        "logicalName": "HSD_OTHLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 621
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_OTHER LANGUAGE COURSE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_OTHLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 622
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_PREALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "HSD_PREALG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 623
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_PREALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "HONORS_PREALG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 624
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "HSD_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 625
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ALGEBRA",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 626
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ALGEBRA II",
        "otherPossibleNames": [],
        "logicalName": "HSD_ALGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 627
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ALGEBRA II",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ALGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 628
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_GEOMETRY",
        "otherPossibleNames": [],
        "logicalName": "HSD_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 629
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_GEOMETRY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 630
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_TRIGONOMETRY",
        "otherPossibleNames": [],
        "logicalName": "HSD_TRIG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 631
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_TRIGONOMETRY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_TRIG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 632
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_PRECALCULUS",
        "otherPossibleNames": [],
        "logicalName": "HSD_PRECALC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 633
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_PRECALCULUS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_PRECALC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 634
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_CALCULUS",
        "otherPossibleNames": [],
        "logicalName": "HSD_CALC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 635
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_CALCULUS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_CALC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 636
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_INTEGRATED MATH PROGRAM",
        "otherPossibleNames": [],
        "logicalName": "HSD_INTMATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 637
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_INTEGRATED MATH PROGRAM",
        "otherPossibleNames": [],
        "logicalName": "HONORS_INTMATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 638
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_STATISTICS",
        "otherPossibleNames": [],
        "logicalName": "HSD_STAT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 639
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_STATISTICS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_STAT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 640
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_COMPSCI",
        "otherPossibleNames": [],
        "logicalName": "HSD_COMPSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 641
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_COMPSCI",
        "otherPossibleNames": [],
        "logicalName": "HONORS_COMPSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 642
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_OTHER MATH COURSE",
        "otherPossibleNames": [],
        "logicalName": "HSD_OTHRMATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 643
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_OTHER MATH COURSE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_OTHRMATH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 644
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_AMERICAN LITERATURE",
        "otherPossibleNames": [],
        "logicalName": "HSD_AMLIT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 645
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_AMERICAN LITERATURE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_AMLIT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 646
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_BRITISH LITERATURE",
        "otherPossibleNames": [],
        "logicalName": "HSD_BRITLIT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 647
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_BRITISH LITERATURE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_BRITLIT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 648
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_COMPOSITION",
        "otherPossibleNames": [],
        "logicalName": "HSD_COMP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 649
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_COMPOSITION",
        "otherPossibleNames": [],
        "logicalName": "HONORS_COMP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 650
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ENGLISH LANGUAGE ARTS",
        "otherPossibleNames": [],
        "logicalName": "HSD_ENGLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 651
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ENGLISH LANGUAGE ARTS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ENGLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 652
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_LITERATURE(OTHER THAN U.S. OR BRITISH)",
        "otherPossibleNames": [],
        "logicalName": "HSD_LITOTHR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 653
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_LITERATURE(OTHER THAN U.S. OR BRITISH)",
        "otherPossibleNames": [],
        "logicalName": "HONORS_LITOTHR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 654
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_JOURNALISM",
        "otherPossibleNames": [],
        "logicalName": "HSD_JOURN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 655
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_JOURNALISM",
        "otherPossibleNames": [],
        "logicalName": "HONORS_JOURN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 656
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_CREATIVE WRITING",
        "otherPossibleNames": [],
        "logicalName": "HSD_CREATIVEWR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 657
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_CREATIVE WRITING",
        "otherPossibleNames": [],
        "logicalName": "HONORS_CREATIVEWR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 658
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_COMMUNICATIONS",
        "otherPossibleNames": [],
        "logicalName": "HSD_COMM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 659
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_COMMUNICATIONS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_COMM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 660
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_PUBLIC SPEAKING",
        "otherPossibleNames": [],
        "logicalName": "HSD_PUBSPK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 661
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_PUBLIC SPEAKING",
        "otherPossibleNames": [],
        "logicalName": "HONORS_PUBSPK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 662
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ENGLISH AS A SECOND LANGUAGE",
        "otherPossibleNames": [],
        "logicalName": "HSD_ENGSECLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 663
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ENGLISH AS A SECOND LANGUAGE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ENGSECLANG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 664
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_BIOLOGY",
        "otherPossibleNames": [],
        "logicalName": "HSD_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 665
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_BIOLOGY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 666
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_CHEMISTRY",
        "otherPossibleNames": [],
        "logicalName": "HSD_CHEM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 667
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_CHEMISTRY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_CHEM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 668
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ENVIRONMENTALEARTH OR SPACE SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "HSD_ENVSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 669
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ENVIRONMENTALEARTH OR SPACE SCIENCE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ENVSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 670
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_PHYSICS",
        "otherPossibleNames": [],
        "logicalName": "HSD_PHYS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 671
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_PHYSICS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_PHYS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 672
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ENGINEERING",
        "otherPossibleNames": [],
        "logicalName": "HSD_ENGINEER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 673
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ENGINEERING",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ENGINEER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 674
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_OTHER SCIENCE COURSE",
        "otherPossibleNames": [],
        "logicalName": "HSD_OTHRSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 675
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_OTHER SCIENCE COURSE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_OTHRSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 676
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_U.S. HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HSD_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 677
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_U.S. HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_USHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 678
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_U.S. GOV'T/CIVICS",
        "otherPossibleNames": [],
        "logicalName": "HSD_USGVT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 679
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_U.S. GOV'T/CIVICS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_USGVT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 680
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_EUROPEAN HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HSD_EURHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 681
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_EUROPEAN HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_EURHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 682
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_WORLD HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HSD_WRLDHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 683
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_WORLD HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_WRLDHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 684
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ANCIENT HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HSD_ANCNTHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 685
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ANCIENT HISTORY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ANCNTHIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 686
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_ECONOMICS",
        "otherPossibleNames": [],
        "logicalName": "HSD_ECON",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 687
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_ECONOMICS",
        "otherPossibleNames": [],
        "logicalName": "HONORS_ECON",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 688
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_GEOGRAPHY",
        "otherPossibleNames": [],
        "logicalName": "HSD_GEOGR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 689
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_GEOGRAPHY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_GEOGR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 690
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_PSYCHOLOGY",
        "otherPossibleNames": [],
        "logicalName": "HSD_PSYCH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 691
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_PSYCHOLOGY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_PSYCH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 692
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_SOCIOLOGY",
        "otherPossibleNames": [],
        "logicalName": "HSD_SOCIOLOGY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 693
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_SOCIOLOGY",
        "otherPossibleNames": [],
        "logicalName": "HONORS_SOCIOLOGY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 694
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STUDY_DURATION_OTHER SOCIAL SCIENCE OR HISTORY COURSE",
        "otherPossibleNames": [],
        "logicalName": "HSD_OTHRSOCSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 695
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "HONORS_OTHER SOCIAL SCIENCE OR HISTORY COURSE",
        "otherPossibleNames": [],
        "logicalName": "HONORS_OTHRSOCSCI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 696
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_40",
        "otherPossibleNames": [],
        "logicalName": "FILLER_40",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 697
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_NONE",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_NONE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 698
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_ACTING",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_ACTING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 699
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_HISTORY",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_HISTORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 700
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_DANCE",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_DANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 701
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_DRAMA",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_DRAMA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 702
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_MUSIC",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_MUSIC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 703
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_INST_VOCAL",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_INST_VOCAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 704
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_FILM",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_FILM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 705
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "EXPERIENCE_ARTMUSIC_ART",
        "otherPossibleNames": [],
        "logicalName": "EXPERIENCE_ARTMUSIC_ART",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 706
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY_PARTICIPATION",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY_PARTICIPATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 707
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY1",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 708
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY1_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY1_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 709
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY1_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY1_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 710
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY1_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY1_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 711
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY1_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY1_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 712
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY1_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY1_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 713
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY2",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 714
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY2_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY2_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 715
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY2_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY2_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 716
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY2_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY2_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 717
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY2_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY2_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 718
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY2_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY2_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 719
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY3",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 720
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY3_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY3_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 721
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY3_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY3_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 722
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY3_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY3_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 723
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY3_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY3_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 724
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY3_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY3_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 725
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY4",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 726
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY4_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY4_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 727
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY4_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY4_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 728
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY4_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY4_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 729
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY4_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY4_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 730
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY4_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY4_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 731
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY5",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 732
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY5_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY5_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 733
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY5_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY5_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 734
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY5_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY5_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 735
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY5_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY5_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 736
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY5_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY5_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 737
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY6",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 738
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY6_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY6_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 739
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY6_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY6_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 740
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY6_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY6_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 741
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY6_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY6_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 742
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY6_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY6_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 743
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY7",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 744
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY7_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY7_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 745
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY7_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY7_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 746
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY7_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY7_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 747
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY7_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY7_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 748
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY7_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY7_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 749
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY8",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 750
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY8_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY8_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 751
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY8_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY8_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 752
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY8_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY8_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 753
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY8_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY8_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 754
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY8_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY8_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 755
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY9",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 756
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY9_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY9_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 757
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY9_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY9_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 758
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY9_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY9_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 759
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY9_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY9_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 760
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY9_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY9_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 761
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY10",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 762
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY10_9TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY10_9TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 763
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY10_10TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY10_10TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 764
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY10_11TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY10_11TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 765
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY10_12TH",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY10_12TH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 766
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "ACTIVITY10_OFFICER_AWARD",
        "otherPossibleNames": [],
        "logicalName": "ACTIVITY10_OFFICER_AWARD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 767
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SPORTS_PARTICIPATION",
        "otherPossibleNames": [],
        "logicalName": "SPORTS_PARTICIPATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 768
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SPORT1",
        "otherPossibleNames": [],
        "logicalName": "SPORT1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 769
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SPORT2",
        "otherPossibleNames": [],
        "logicalName": "SPORT2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 770
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SPORT3",
        "otherPossibleNames": [],
        "logicalName": "SPORT3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 771
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SPORT4",
        "otherPossibleNames": [],
        "logicalName": "SPORT4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 772
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SPORT5",
        "otherPossibleNames": [],
        "logicalName": "SPORT5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 773
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "SPORT6",
        "otherPossibleNames": [],
        "logicalName": "SPORT6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 774
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_41",
        "otherPossibleNames": [],
        "logicalName": "FILLER_41",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 775
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_TYPE_4YR",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_TYPE_4YR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 776
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_TYPE_2YR",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_TYPE_2YR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 777
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_TYPE_VOCTECH",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_TYPE_VOCTECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 778
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_TYPE_UNDECIDED",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_TYPE_UNDECIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 779
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_AFFIL_PUBLIC",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_AFFIL_PUBLIC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 780
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_AFFIL_PRIV_NOTRELIG",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_AFFIL_PRIV_NOTRELIG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 781
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_AFFIL_PRIV_RELIG",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_AFFIL_PRIV_RELIG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 782
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_AFFIL_UNDECIDED",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_AFFIL_UNDECIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 783
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SIZE_LESS_2K",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SIZE_LESS_2K",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 784
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SIZE_2K_5K",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SIZE_2K_5K",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 785
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SIZE_5K_10K",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SIZE_5K_10K",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 786
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SIZE_10K-15K",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SIZE_10K-15K",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 787
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SIZE_15K_20K",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SIZE_15K_20K",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 788
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SIZE_MORE_20K",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SIZE_MORE_20K",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 789
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SIZE_UNDECIDED",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SIZE_UNDECIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 790
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SET_LGCITY",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SET_LGCITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 791
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SET_MEDCITY",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SET_MEDCITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 792
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SET_SMCITY",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SET_SMCITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 793
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SET_SUBURB",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SET_SUBURB",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 794
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SET_RURAL",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SET_RURAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 795
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SET_UNDECIDED",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SET_UNDECIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 796
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_LOC_NEARHOME",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_LOC_NEARHOME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 797
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_LOC_HOMESTATE",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_LOC_HOMESTATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 798
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_LOC_BORDERHOME",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_LOC_BORDERHOME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 799
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_LOC_BEYONDHOME",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_LOC_BEYONDHOME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 800
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_LOC_OUTSIDEUS",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_LOC_OUTSIDEUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 801
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_LOC_UNDECIDED",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_LOC_UNDECIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 802
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SEX_ALLONESEX",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SEX_ALLONESEX",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 803
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SEX_COED",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SEX_COED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 804
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_SEX_UNDECIDED",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_SEX_UNDECIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 805
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_HOUSING_HOME",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_HOUSING_HOME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 806
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_HOUSING_ONCAMPUS",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_HOUSING_ONCAMPUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 807
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_HOUSING_OFFCAMPUS",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_HOUSING_OFFCAMPUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 808
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_HOUSING_UNDECIDED",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_HOUSING_UNDECIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 809
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_42",
        "otherPossibleNames": [],
        "logicalName": "FILLER_42",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 810
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DEGREE_CERTIFICATE",
        "otherPossibleNames": [],
        "logicalName": "DEGREE_CERTIFICATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 811
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DEGREE_ASSOCIATE",
        "otherPossibleNames": [],
        "logicalName": "DEGREE_ASSOCIATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 812
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DEGREE_BACHELORS",
        "otherPossibleNames": [],
        "logicalName": "DEGREE_BACHELORS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 813
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DEGREE_MASTERS",
        "otherPossibleNames": [],
        "logicalName": "DEGREE_MASTERS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 814
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DEGREE_DOCTORATE",
        "otherPossibleNames": [],
        "logicalName": "DEGREE_DOCTORATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 815
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DEGREE_OTHER",
        "otherPossibleNames": [],
        "logicalName": "DEGREE_OTHER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 816
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DEGREE_UNDECIDED",
        "otherPossibleNames": [],
        "logicalName": "DEGREE_UNDECIDED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 817
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FINANCIAL_AID",
        "otherPossibleNames": [],
        "logicalName": "FINANCIAL_AID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 818
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "PART_TIME_JOB",
        "otherPossibleNames": [],
        "logicalName": "PART_TIME_JOB",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 819
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MAJOR_FIRST",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_FIRST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 820
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MAJOR_FIRST_CERTAINTY",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_FIRST_CERTAINTY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 821
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MAJOR_SECOND",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_SECOND",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 822
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "MAJOR_THIRD",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_THIRD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 823
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "AP",
        "otherPossibleNames": [],
        "logicalName": "AP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 824
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_43",
        "otherPossibleNames": [],
        "logicalName": "FILLER_43",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 825
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_HONORS",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_HONORS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 826
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_ART",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_ART",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 827
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_INTRAMURAL",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_INTRAMURAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 828
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_ATHLETICS",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_ATHLETICS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 829
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_COMMSERVICE",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_COMMSERVICE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 830
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_DANCE",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_DANCE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 831
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_DEBATESPEAKING",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_DEBATESPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 832
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_ETHNIC",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_ETHNIC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 833
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_FOREIGN",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_FOREIGN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 834
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_GOVERNMENT",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_GOVERNMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 835
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_LITERARY",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_LITERARY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 836
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_ROTC",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_ROTC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 837
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_INSTRUMENTALMUS",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_INSTRUMENTALMUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 838
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_VOCALMUS",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_VOCALMUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 839
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_RELIGIOUS",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_RELIGIOUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 840
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_ENVIRONMENTAL",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_ENVIRONMENTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 841
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_DRAMA",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_DRAMA",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 842
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_INTERNSHIP",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_INTERNSHIP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 843
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_DEPARTMENTAL",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_DEPARTMENTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 844
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_SOCIAL",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_SOCIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 845
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_ACTIVITY_NONE",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_ACTIVITY_NONE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 846
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_CODE1",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_CODE1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 847
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_NAME1",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_NAME1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 848
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_CODE2",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_CODE2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 849
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_NAME2",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_NAME2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 850
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_CODE3",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_CODE3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 851
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_NAME3",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_NAME3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 852
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_CODE4",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_CODE4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 853
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "COLLEGE_NAME4",
        "otherPossibleNames": [],
        "logicalName": "COLLEGE_NAME4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 854
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "RECORD_NUM",
        "otherPossibleNames": [],
        "logicalName": "RECORD_NUM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 855
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "FORM_CODE",
        "otherPossibleNames": [],
        "logicalName": "FORM_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 856
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "REPORT_DATE",
        "otherPossibleNames": [],
        "logicalName": "REPORT_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 857
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": -1.0
      },
      {
        "physicalName": "FILLER_44",
        "otherPossibleNames": [],
        "logicalName": "FILLER_44",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 858
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "DISTRICT_STUDENT_ID",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 859
        },
        "fieldLength": 500,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      },
      {
        "physicalName": "STATE_STUDENT_ID",
        "otherPossibleNames": [],
        "logicalName": "STATE_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 860
        },
        "fieldLength": 500,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": -1.0
      }
    ]
  },
  "fileExtensions": [".csv"]
}