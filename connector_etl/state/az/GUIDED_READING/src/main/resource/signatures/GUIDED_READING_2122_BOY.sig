{
    "encoding": "UTF-8",
    "fileExtensions": [
        ".csv"
    ],
    "format": {
        "@type": "Delimited",
        "formatName": "GUIDED_READING_2122_BOY",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "recordLength": "",
        "hasHeader": true,
        "naturalKey": [
            "STUDENT_ID","SCHOOL_NAME"
        ],
        "fields": [
            {
                "physicalName": "School Name",
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
                "scale": null
            },
            {
                "physicalName": "PERM ID",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_ID",
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
                "physicalName": "Grade",
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
                "fieldLength": 2,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": 0.0
            },
            {
                "physicalName": "BOY",
                "otherPossibleNames": [],
                "logicalName": "ENGLISH_BEG",
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
              "physicalName": "MID",
              "otherPossibleNames": [],
              "logicalName": "ENGLISH_MID",
              "formatMask": null,
              "isFieldRequired": "N",
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
               "physicalName": "EOY",
               "otherPossibleNames": [],
               "logicalName": "ENGLISH_END",
               "formatMask": null,
               "isFieldRequired": "N",
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
           }
        ]
    }
}