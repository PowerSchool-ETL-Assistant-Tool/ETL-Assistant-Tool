{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv"
  ],
  "format": {
    "@type": "Delimited",
    "fieldDelim": ",",
    "quoteDelim": "\"",
    "formatName": "SC_PASS",
    "hasHeader": true,
    "naturalKey": [
      "STATE_ID", "POWERSCH"
    ],
    "fields": [
      {
        "physicalName": "Year",
        "logicalName": "YEAR",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 1
        },
        "fieldLength": 10,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "District",
        "logicalName": "DISTRICT",
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
        "physicalName": "Origin School",
        "logicalName": "ORIGIN_SCHOOL",
        "otherPossibleNames": [],
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
        "physicalName": "Origin School SIDN",
        "logicalName": "ORIGIN_SCHOOL_SIDN",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Fall Assign School",
        "logicalName": "FALL_ASSIGN_SCHOOL",
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
        "physicalName": "Fall Assign SIDN",
        "logicalName": "FALL_ASSIGN_SIDN",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Grade",
        "logicalName": "GRADE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Last Name",
        "logicalName": "LAST_NAME",
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
        "physicalName": "First Name",
        "logicalName": "FIRST_NAME",
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
        "physicalName": "MI",
        "logicalName": "MI",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "PowerSch#",
        "logicalName": "POWERSCH",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 10,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "State ID",
        "logicalName": "STATE_ID",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Birth Date",
        "logicalName": "BIRTH_DATE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 500,
        "dataTypes": "DATETIME",
        "scale": 0
      },
      {
        "physicalName": "Gender",
        "logicalName": "GENDER",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Ethnicity/Race",
        "logicalName": "RACE_ETHNICITY",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Sp Ed",
        "logicalName": "SP_ED",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Science Scale Score",
        "logicalName": "SCIENCE_SCALE_SCORE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 10,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Science Perf Level",
        "logicalName": "SCIENCE_PERF_LEVEL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Social Studies Scale Score",
        "logicalName": "SOCIALSTUDIES_SCALE_SCORE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 10,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Social Studies Perf Level",
        "logicalName": "SOCIALSTUDIES_PERF_LEVEL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      }
    ]
  }
}