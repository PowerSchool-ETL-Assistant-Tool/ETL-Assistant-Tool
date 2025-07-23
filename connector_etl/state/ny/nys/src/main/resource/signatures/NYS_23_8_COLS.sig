{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv"
  ],
  "format": {
    "@type": "Delimited",
    "formatName": "NYS_23_8_COLS",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "recordLength": "",
    "hasHeader": true,
    "naturalKey": ["STUDENT_LOCAL_ID", "GRADE", "TEST_ADMINISTRATION_DATE"],
    "fields": [
      {
        "physicalName": "School",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_NAME",
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
        "physicalName": "Student_Name",
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
        "scale": null
      },
      {
        "physicalName": "Student_Number",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LOCAL_ID",
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
        "physicalName": "Grade_Level",
        "otherPossibleNames": [],
        "logicalName": "GRADE",
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
        "physicalName": "Item_Description",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_DESCRIPTION",
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
        "physicalName": "Test_Date",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTRATION_DATE",
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
        "physicalName": "Num_Score",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE",
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
        "physicalName": "Scale_Score_Num",
        "otherPossibleNames": [],
        "logicalName": "PERF_LEVEL",
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
        "scale": null
      }
    ]
  }
}