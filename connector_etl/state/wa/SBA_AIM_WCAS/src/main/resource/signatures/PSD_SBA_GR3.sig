{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "fieldDelim": ",",
    "fields": [
      {
        "physicalName": "District Student ID",
        "logicalName": "DISTRICT_STUDENT_ID",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 1
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Test Date",
        "logicalName": "TESTSTART",
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
        "dataTypes": "DATETIME",
        "scale": 0
      },
      {
        "physicalName": "Attempted",
        "logicalName": "ATTEMPTED",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ScaleScore",
        "logicalName": "SCALESCORE",
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
        "physicalName": "Level",
        "logicalName": "LEVEL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "MetStandard",
        "logicalName": "METSTANDARD",
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
      }
    ],
    "hasHeader": true,
    "naturalKey": ["SSID"],
    "quoteDelim": "\"",
    "formatName": "PSD_SBA_GR3"
  },
  "fileExtensions": []
}