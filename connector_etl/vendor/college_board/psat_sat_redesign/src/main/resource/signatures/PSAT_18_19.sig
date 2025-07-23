{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv"
  ],
  "format": {
    "@type": "Delimited",
    "formatName": "PSAT_18_19",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "recordLength": "",
    "hasHeader": true,
    "naturalKey": ["STATE_STUDENT_ID","TEST_ASSESSMENT","GRADE"],
    "fields": [
      {
        "physicalName": "Student ID",
        "otherPossibleNames": [],
        "logicalName": "STATE_STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 1
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Student Name",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Home School",
        "otherPossibleNames": [],
        "logicalName": "HOME_SCHOOL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Testing School",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_VENDOR_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Birthdate",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_DOB",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Test Taken/To Be Taken",
        "otherPossibleNames": [],
        "logicalName": "TEST_ASSESSMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Grade at the time of testing",
        "otherPossibleNames": [],
        "logicalName": "GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Composite Score",
        "otherPossibleNames": [],
        "logicalName": "LATEST_TEST_ASSESSMENT_TOTAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Reading and Writing Score",
        "otherPossibleNames": [],
        "logicalName": "LATEST_TEST_ASSESSMENT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Math Score",
        "otherPossibleNames": [],
        "logicalName": "LATEST_TEST_ASSESSMENT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Essay Reading Subscore",
        "otherPossibleNames": [],
        "logicalName": "LATEST_TEST_ASSESSMENT_ESSAY_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Essay Abalysis Subscore",
        "otherPossibleNames": [],
        "logicalName": "LATEST_TEST_ASSESSMENT_ESSAY_ANALYSIS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Essay Writing Subscore",
        "otherPossibleNames": [],
        "logicalName": "LATEST_TEST_ASSESSMENT_ESSAY_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Student Canceled Scores",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_CANCELED_SCORES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Invalidated Scores",
        "otherPossibleNames": [],
        "logicalName": "INVALIDATED_SCORES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Reason for no valid test attempt",
        "otherPossibleNames": [],
        "logicalName": "REASON_FOR_NO_VALID_TEST_ATTEMPT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "suppressed scores",
        "otherPossibleNames": [],
        "logicalName": "SUPPRESSED_SCORES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Error Code",
        "otherPossibleNames": [],
        "logicalName": "ERROR_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ELA Performance Level",
        "otherPossibleNames": [],
        "logicalName": "PERFORMANCE_TEST_ASSESSMENT_EBRW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Math Performance Level",
        "otherPossibleNames": [],
        "logicalName": "PERFORMANCE_TEST_ASSESSMENT_MATH_SECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      }
    ]
  }
}