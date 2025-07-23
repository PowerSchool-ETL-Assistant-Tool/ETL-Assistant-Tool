{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv"
  ],
  "format": {
    "@type": "Delimited",
    "formatName": "18_19_MATH",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "recordLength": "",
    "hasHeader": true,
    "naturalKey": [
                   "SCHOOL_VENDOR_ID",
                   "STUDENT_LOCAL_ID",
                   "TESTDATE",
                   "TEST_ADMIN_DATE",
                   "STUDENT_FIRST_NAME",
                   "STUDENT_LAST_NAME",
                   "MATHROOMTEACHERLASTNAME",
                   "MATHROOMTEACHERFIRSTNAME",
                   "MATH"
    ],
    "fields": [
      {
        "physicalName": "TestDates",
        "otherPossibleNames": [],
        "logicalName": "TESTDATE",
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
        "physicalName": "DateCompleted",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMIN_DATE",
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
        "scale": 0
      },
      {
        "physicalName": "LEASchCode",
        "otherPossibleNames": [],
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
        "scale": 0
      },
      {
        "physicalName": "LastName",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
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
        "scale": 0
      },
      {
        "physicalName": "FirstName",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_FIRST_NAME",
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
        "scale": 0
      },
      {
        "physicalName": "IDNumber",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LOCAL_ID",
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
        "scale": 0
      },
      {
        "physicalName": "MathRoomTeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "MATHROOMTEACHERLASTNAME",
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
        "scale": 0
      },
      {
        "physicalName": "MathRoomTeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "MATHROOMTEACHERFIRSTNAME",
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
        "scale": 0
      },
      {
        "physicalName": "Math_Score",
        "otherPossibleNames": [],
        "logicalName": "MATH",
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
        "scale": 0
      },
      {
        "physicalName": "Calc Inactive",
        "otherPossibleNames": [],
        "logicalName": "MATH_CALC_INACTIVE",
        "formatMask": null,
        "isFieldRequired": "N",
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
        "scale": 0
      },
      {
        "physicalName": "Calc Active",
        "otherPossibleNames": [],
        "logicalName": "MATH_CALC_ACTIVE",
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
        "scale": 0
      },
      {
         "physicalName": "Ratios & Prop Relation",
         "logicalName": "RATIOS_AND_PROP_RELATION",
         "otherPossibleNames": [],
         "formatMask": null,
         "isFieldRequired": "N",
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
        "physicalName": "GriddedItems",
        "otherPossibleNames": [],
        "logicalName": "GRIDDLE_ITEMS",
        "formatMask": null,
        "isFieldRequired": "N",
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
        "scale": 0
      },
      {
         "physicalName": "Functions",
         "otherPossibleNames": ["Num Ops-Fractions"],
         "logicalName": "FUNCTIONS",
         "formatMask": null,
         "isFieldRequired": "N",
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
         "scale": 0
      },
      {
        "physicalName": "Operations-Alg Think",
        "otherPossibleNames": [],
        "logicalName": "OPERATION_ALG_THINK",
        "formatMask": null,
        "isFieldRequired": "N",
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
        "scale": 0
      },
      {
         "physicalName": "The Number System",
         "logicalName": "NUMBERS_SYSTEM",
         "otherPossibleNames": [],
         "formatMask": null,
         "isFieldRequired": "N",
         "canBeNull": "Y",
         "fieldOffset": {
           "offsetStart": 0,
           "offsetEnd": 0,
           "columnNum": 13
         },
         "fieldLength": 500,
         "dataTypes": "STRING",
         "scale": 0
      },
      {
        "physicalName": "Num Ops Base 10",
        "otherPossibleNames": [],
        "logicalName": "NUM_OPS_BASE_10",
        "formatMask": null,
        "isFieldRequired": "N",
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
        "scale": 0
      },
      {
         "physicalName": "Expressions & Equation",
         "logicalName": "EXPRESSIONS_AND_EQUATION",
         "otherPossibleNames": [],
         "formatMask": null,
         "isFieldRequired": "N",
         "canBeNull": "Y",
         "fieldOffset": {
           "offsetStart": 0,
           "offsetEnd": 0,
           "columnNum": 14
         },
         "fieldLength": 500,
         "dataTypes": "STRING",
         "scale": 0
      },
      {
         "physicalName": "Geometry",
         "logicalName": "GEOMETRY",
         "otherPossibleNames": [],
         "formatMask": null,
         "isFieldRequired": "N",
         "canBeNull": "Y",
         "fieldOffset": {
           "offsetStart": 0,
           "offsetEnd": 0,
           "columnNum": 14
         },
         "fieldLength": 500,
         "dataTypes": "STRING",
         "scale": 0
      },
      {
        "physicalName": "Measurement and Data",
        "otherPossibleNames": [],
        "logicalName": "MEASUREMENT_AND_DATA",
        "formatMask": null,
        "isFieldRequired": "N",
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
        "scale": 0
      },
      {
          "physicalName": "Stat & Probability",
          "otherPossibleNames": [],
          "logicalName": "STAT_AND_PROBABILITY",
          "formatMask": null,
          "isFieldRequired": "N",
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
          "scale": 0
      }
    ]
  }
}