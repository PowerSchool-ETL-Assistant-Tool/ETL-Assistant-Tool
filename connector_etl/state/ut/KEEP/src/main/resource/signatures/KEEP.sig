{
    "encoding": "UTF-8",
    "fileExtensions": [
        ".csv"
    ],
    "format": {
        "@type": "Delimited",
        "formatName": "KEEP",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "recordLength": "",
        "hasHeader": true,
        "naturalKey": [
            "SSID","SCHOOL_ID","SUBJECT_AREA","SCORE"
        ],
        "fields": [
            {
                "physicalName": "schoolyear",
                "otherPossibleNames": [],
                "logicalName": "SCHOOL_YEAR",
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
                "physicalName": "compositeschoolid",
                "otherPossibleNames": [],
                "logicalName": "SCHOOL_ID",
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
                "physicalName": "institution_name",
                "otherPossibleNames": ["schoolname"],
                "logicalName": "SCHOOL_NAME",
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
                "physicalName": "ssid",
                "otherPossibleNames": [],
                "logicalName": "SSID",
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
                "physicalName": "studentid",
                "otherPossibleNames": [],
                "logicalName": "STUDENTID",
                "formatMask": null,
                "isFieldRequired": "N",
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
                "physicalName": "OEK",
                "otherPossibleNames": [],
                "logicalName": "OEK",
                "formatMask": null,
                "isFieldRequired": "N",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 5
                },
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "subjectarea",
                "otherPossibleNames": [],
                "logicalName": "SUBJECT_AREA",
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
                "physicalName": "score",
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
                "fieldLength": 3,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "performancelevel",
                "otherPossibleNames": [],
                "logicalName": "PERFORMANCE_LEVEL",
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
                "physicalName": "Gender",
                "otherPossibleNames": [],
                "logicalName": "GENDER",
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
            },
            {
                "physicalName": "EverLowIncome",
                "otherPossibleNames": [],
                "logicalName": "EVER_LOW_INCOME",
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
                "scale": null
            },
            {
                "physicalName": "EverSpecialEd",
                "otherPossibleNames": [],
                "logicalName": "EVER_SPECIAL_ED",
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
                "scale": null
            },
            {
                "physicalName": "Race",
                "otherPossibleNames": [],
                "logicalName": "RACE",
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
                "scale": null
            }
        ]
    }
}