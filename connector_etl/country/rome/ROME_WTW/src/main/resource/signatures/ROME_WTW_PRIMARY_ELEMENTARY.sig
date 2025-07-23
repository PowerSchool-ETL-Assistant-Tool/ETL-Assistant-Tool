{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "hasHeader": true,
    "formatName": "ROME_WTW_PRIMARY_ELEMENTARY",
    "naturalKey": ["STUDENT_ID","TEST_DATE"],
    "fields": [
      {
        "physicalName": "SchoolID",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "n",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 1
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Current Grade Level",
        "otherPossibleNames": [],
        "logicalName": "GRADE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Test Administered Grade Level",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMINISTERED_GRADE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Home_Room",
        "otherPossibleNames": [],
        "logicalName": "HOME_ROOM",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "First_Name",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Last_Name",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Student_Number",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_ID",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "n",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DOB",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_BIRTHDATE",
        "formatMask": "mm/dd/yyyy",
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administrated Period",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_PERIOD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Administrated Date",
        "otherPossibleNames": [],
        "logicalName": "TEST_DATE",
        "formatMask": "mm/yyyy",
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Assessment Level",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 20,
        "expectedValues": ["Primary", "Elementary", "Upper"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Words Spelled Correctly",
        "otherPossibleNames": [],
        "logicalName": "WORDS_SPELLED_CORRECTLY",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Feature Points",
        "otherPossibleNames": [],
        "logicalName": "FEATURE_POINTS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Total Points",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_POINTS",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Spelling Stage",
        "otherPossibleNames": [],
        "logicalName": "SPELLING_STAGE",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Proficiency Level",
        "otherPossibleNames": [],
        "logicalName": "PROFICIENCY_LEVEL",
        "formatMask": null,
        "isFieldRequired": "y",
        "canBeNull": "y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [
    "csv"
  ]
}