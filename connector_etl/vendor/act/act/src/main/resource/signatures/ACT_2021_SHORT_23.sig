{
    "encoding": "UTF-8",
    "fileExtensions": [
        ".csv"
    ],
    "format": {
        "@type": "Delimited",
        "formatName": "ACT_2021_SHORT_23",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "recordLength": "",
        "hasHeader": true,
        "naturalKey": [
            "TEST_DATE",
            "STUDENT_FIRST_NAME",
            "STUDENT_MIDDLE_INITIAL",
            "STUDENT_LAST_NAME",
            "STUDENT_EXPANDED_BIRTHDATE_STR"
        ],
        "fields": [
            {
                "physicalName": "ACT ID",
                "otherPossibleNames": [],
                "logicalName": "ACT_ID",
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
                "physicalName": "Last Name",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_LAST_NAME",
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
                "physicalName": "First Name",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_FIRST_NAME",
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
                "physicalName": "Middle Initial",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_MIDDLE_INITIAL",
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
                "physicalName": "State ID",
                "otherPossibleNames": [],
                "logicalName": "STATE_STUDENT_ID_VERSION_1",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 5
                },
                "fieldLength": 15,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Local ID",
                "otherPossibleNames": [],
                "logicalName": "LOCAL_ID",
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
                "physicalName": "Test Date",
                "otherPossibleNames": [],
                "logicalName": "TEST_DATE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 7
                },
                "fieldLength": 12,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "Test Location",
                "otherPossibleNames": [],
                "logicalName": "TEST_LOCATION",
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
                "physicalName": "School Name",
                "otherPossibleNames": [],
                "logicalName": "SCHOOL_NAME",
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
                "physicalName": "School Code",
                "otherPossibleNames": [],
                "logicalName": "SCHOOL_CODE",
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
                "physicalName": "DOB",
                "otherPossibleNames": [],
                "logicalName": "STUDENT_EXPANDED_BIRTHDATE_STR",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 11
                },
                "fieldLength": 12,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "DATE",
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
                    "columnNum": 12
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "ACT composite score",
                "otherPossibleNames": [],
                "logicalName": "COMPOSITE_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 13
                },
                "fieldLength": 5,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "ACT math score",
                "otherPossibleNames": [],
                "logicalName": "MATH_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 14
                },
                "fieldLength": 5,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "ACT science score",
                "otherPossibleNames": [],
                "logicalName": "SCIENCE_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 15
                },
                "fieldLength": 5,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "ACT STEM score",
                "otherPossibleNames": [],
                "logicalName": "STEM_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 16
                },
                "fieldLength": 5,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "ACT English score",
                "otherPossibleNames": [],
                "logicalName": "ENGLISH_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 17
                },
                "fieldLength": 5,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "ACT reading score",
                "otherPossibleNames": [],
                "logicalName": "READING_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 18
                },
                "fieldLength": 5,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "ACT writing score",
                "otherPossibleNames": [],
                "logicalName": "WRITING_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 19
                },
                "fieldLength": 5,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "ACT English language arts score",
                "otherPossibleNames": [],
                "logicalName": "ELA_SCALED_SCORE",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 20
                },
                "fieldLength": 5,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "INTEGER",
                "scale": null
            },
            {
                "physicalName": "State Org Number",
                "otherPossibleNames": [],
                "logicalName": "STATE_ORG_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 21
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "District Org Number",
                "otherPossibleNames": [],
                "logicalName": "DISTRICT_ORG_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 22
                },
                "fieldLength": 500,
                "fieldPrecision": null,
                "expectedValues": [],
                "dataTypes": "STRING",
                "scale": null
            },
            {
                "physicalName": "School Org Number",
                "otherPossibleNames": [],
                "logicalName": "SCHOOL_ORG_NUMBER",
                "formatMask": null,
                "isFieldRequired": "Y",
                "canBeNull": "Y",
                "fieldOffset": {
                    "offsetStart": 0,
                    "offsetEnd": 0,
                    "columnNum": 23
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