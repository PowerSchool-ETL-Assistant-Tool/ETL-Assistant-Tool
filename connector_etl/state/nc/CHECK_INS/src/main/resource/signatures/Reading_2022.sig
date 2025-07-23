{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv"
  ],
  "format": {
    "@type": "Delimited",
    "fieldDelim": ",",
    "quoteDelim": "\"",
    "formatName": "Reading_2022",
    "hasHeader": true,
    "naturalKey": [
      "SCHOOL_VENDOR_ID",
      "STUDENT_LOCAL_ID"
    ],
    "fields": [
      {
        "physicalName": "Year",
        "otherPossibleNames": [],
        "logicalName": "YEAR",
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
        "physicalName": "TestDate",
        "logicalName": "TESTDATE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "LEASchCode",
        "logicalName": "SCHOOL_VENDOR_ID",
        "otherPossibleNames": ["HdrSchoolName"],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "LastName",
        "logicalName": "STUDENT_LAST_NAME",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FirstName",
        "logicalName": "STUDENT_FIRST_NAME",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "IDNumber",
        "logicalName": "STUDENT_LOCAL_ID",
        "otherPossibleNames": [
          "StudentID"
        ],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ReadRoomTeacher",
        "logicalName": "TEACHER_NAME",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Read_Score",
        "logicalName": "READ",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Language",
        "logicalName": "LANGUAGE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Read Literature",
        "logicalName": "READ_LITERATURE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Read Information",
        "logicalName": "READ_INFORMATION",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      }
    ]
  }
}