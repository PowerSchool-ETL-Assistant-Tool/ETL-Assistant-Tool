{
    "encoding": "UTF-8",
    "fileExtensions": [
        ".csv"
    ],
    "format": {
        "@type": "Delimited",
        "formatName": "PSAT89_REDESIGN_DELIMITED_NEW_2018_2019_NEW",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "recordLength": "",
        "hasHeader": true,
        "naturalKey": [],
        "fields": [
            {
                "physicalName": "AI_CODE",
                "otherPossibleNames": [],
                "logicalName": "SCHOOL_VENDOR_ID",
                "formatMask": "null",
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
                "physicalName": "AI_NAME",
                "otherPossibleNames": [],
                "logicalName": "SCHOOL_NAME",
                "formatMask": "null",
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
                "physicalName": "NAME_LAST",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_LAST_NAME",
                "formatMask": "null",
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
                "physicalName": "NAME_FIRST",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_FIRST_NAME",
                "formatMask": "null",
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
                "physicalName": "NAME_MI",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_MIDDLE_NAME",
                "formatMask": "null",
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
                "physicalName": "SEX",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_GENDER_CODE",
                "formatMask": "null",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 6
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": ["M", "F", "A", "U"],
                "dataTypes": "STRING",
                "scale": null
            },
           {
                "physicalName": "BIRTH_DATE",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_DOB",
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
                "physicalName": "DISTRICT_STUDENT_ID",
                "otherPossibleNames": [],
                "logicalName": "DISTRICT_STUDENT_ID",
                "formatMask": "null",
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
            },
            {
                "physicalName": "LATEST_PSAT_DATE",
                "otherPossibleNames": [],
                "logicalName": "LATEST_PSAT_DATE",
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
                "physicalName": "LATEST_PSAT_GRADE",
                "otherPossibleNames": [],
                "logicalName": "LATEST_PSAT_GRADE",
                "formatMask": "null",
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
                "physicalName": "Current Grade",
                "otherPossibleNames": [],
                "logicalName": "CURRENT_GRADE",
                "formatMask": "null",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 11
                },
                "fieldLength": 10,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "LATEST_PSAT_TOTAL",
                "otherPossibleNames": [],
                "logicalName": "LATEST_PSAT_TOTAL",
                "formatMask": "null",
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
                "scale": null
            },
            {
                "physicalName": "LATEST_PSAT_EBRW",
                "otherPossibleNames": [],
                "logicalName": "LATEST_PSAT_EBRW",
                "formatMask": "null",
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
                "scale": null
            },
            {
                "physicalName": "LATEST_PSAT_MATH_SECTION",
                "otherPossibleNames": [],
                "logicalName": "LATEST_PSAT_MATH_SECTION",
                "formatMask": "null",
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
                "scale": null
            },
            {
                "physicalName": "LATEST_PSAT_READING",
                "otherPossibleNames": [],
                "logicalName": "LATEST_PSAT_READING",
                "formatMask": "null",
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
                "scale": null
            },
            {
                "physicalName": "LATEST_PSAT_WRIT_LANG",
                "otherPossibleNames": [],
                "logicalName": "LATEST_PSAT_WRIT_LANG",
                "formatMask": "null",
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
                "scale": null
            },
            {
                "physicalName": "LATEST_PSAT_MATH_TEST",
                "otherPossibleNames": [],
                "logicalName": "LATEST_PSAT_MATH_TEST",
                "formatMask": "null",
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
                "scale": null
            },
             {
                "physicalName": "REPORT_DATE",
                "otherPossibleNames": [],
                "logicalName": "REPORT_DATE",
                "formatMask": "yyyy-MM-dd",
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": "",
                    "offsetEnd": "",
                    "columnNum": 18
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