{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv"
  ],
  "format": {
    "@type": "Delimited",
    "formatName": "CHECK_IN",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "recordLength": "",
    "hasHeader": true,
    "naturalKey": ["STUDENT_LOCAL_ID","SCHOOL_VENDOR_ID","STUDENT_FIRST_NAME","STUDENT_LAST_NAME","TEST_ADMIN_DATE","SCORE","PERCENT_CORRECT"],
    "fields": [
      {
        "physicalName": "Last Name",
        "otherPossibleNames": ["LastName"],
        "logicalName": "STUDENT_LAST_NAME",
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
        "scale": null
      },
      {
        "physicalName": "First Name",
        "otherPossibleNames": ["FirstName"],
        "logicalName": "STUDENT_FIRST_NAME",
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
        "scale": null
      },
      {
        "physicalName": "LEA School",
        "otherPossibleNames": ["LEA School Code","LEASchool","LEASchCode", "LEA Sch Code"],
        "logicalName": "SCHOOL_VENDOR_ID",
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
        "scale": null
      },
      {
        "physicalName": "Test Date",
        "otherPossibleNames": ["TestDate","TestDates", "Test Date ","Test Dates"],
        "logicalName": "TEST_ADMIN_DATE",
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
        "scale": null
      },
      {
        "physicalName": "ID Number",
        "otherPossibleNames": ["IDNumber","PowerSchool ID"],
        "logicalName": "STUDENT_LOCAL_ID",
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
        "scale": null
      },
      {
        "physicalName": "Score",
        "otherPossibleNames": [],
        "logicalName": "SCORE",
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
        "scale": null
      },
      {
        "physicalName": "Percent Correct",
        "otherPossibleNames": [],
        "logicalName": "PERCENT_CORRECT",
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
        "scale": null
      },
      {
        "physicalName": "Course Subject",
        "otherPossibleNames": [],
        "logicalName": "COURSE_SUBJECT",
        "formatMask": null,
        "isFieldRequired": "N",
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
        "scale": null
      }
    ]
  }
}