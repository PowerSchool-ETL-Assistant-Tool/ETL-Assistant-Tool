{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv"
  ],
  "format": {
    "@type": "Delimited",
    "hasHeader": true,
    "fieldDelim": ",",
    "quoteDelim": "\"",
    "formatName": "FSA_3_8",
    "naturalKey": [
      "FLEID", "LAST_NAME", "FIRST_NAME",  "SUBJECT", "SCALE_SCORE"
    ],
    "fields": [
      {
        "physicalName": "Year",
        "logicalName": "YEAR",
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
        "physicalName": "Subject",
        "logicalName": "SUBJECT",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Administration",
        "logicalName": "ADMINISTRATION",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
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
          "columnNum": 4
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "District Name",
        "logicalName": "DISTRICT_NAME",
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
        "physicalName": "School",
        "logicalName": "SCHOOL",
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
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "School Name",
        "logicalName": "SCHOOL_NAME",
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
        "physicalName": "Grade",
        "logicalName": "GRADE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "LastName",
        "logicalName": "LAST_NAME",
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
        "physicalName": "FirstName",
        "logicalName": "FIRST_NAME",
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
        "physicalName": "MI",
        "logicalName": "MI",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FLEID",
        "logicalName": "FLEID",
        "otherPossibleNames": ["StudentID"],
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
        "physicalName": "Scale Score",
        "logicalName": "SCALE_SCORE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Pass",
        "logicalName": "PASS",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Score Flag Reading",
        "logicalName": "SCORE_FLAG_READING",
        "otherPossibleNames": [
          "Score Flag"
        ],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Score Flag Writing",
        "logicalName": "SCORE_FLAG_WRITING",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Score Flag",
        "logicalName": "SCORE_FLAG",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RptStatus",
        "logicalName": "RPT_STATUS",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Condition Code",
        "logicalName": "CONDITION_CODE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Performance Level",
        "logicalName": "PERFORMANCE_LEVEL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Earn1/PtPos1",
        "logicalName": "EARN1_PTPOS1",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 21
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Earn2/PtPos2",
        "logicalName": "EARN2_PTPOS2",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 22
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Earn3/PtPos3",
        "logicalName": "EARN3_PTPOS3",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 23
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Earn4/PtPos4",
        "logicalName": "EARN4_PTPOS4",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Earn5/PtPos5",
        "logicalName": "EARN5_PTPOS5",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Earn_WD1/PtPos_WD1",
        "logicalName": "EARN_WD1_PTPOS_WD1",
        "otherPossibleNames": ["Earn_WD1/Ptpos_WD1"],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 26
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Earn_WD2/PtPos_WD2",
        "logicalName": "EARN_WD2_PTPOS_WD2",
        "otherPossibleNames": ["Earn_WD2/Ptpos_WD2"],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 27
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Earn_WD3/PtPos_WD3",
        "logicalName": "EARN_WD3_PTPOS_WD3",
        "otherPossibleNames": ["Earn_WD3/Ptpos_WD3"],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 28
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ScoreFlag",
        "logicalName": "SCORE_FLAG",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RetakerStatus",
        "logicalName": "RETAKER_STATUS",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CoreTestForm",
        "logicalName": "CORE_TEST_FORM",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 31
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Student Grade",
        "logicalName": "STUDENT_GRADE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 32
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Filler",
        "logicalName": "FILLER",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 33
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Filler.1",
        "logicalName": "FILLER_1",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 34
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Unnamed: 23",
        "logicalName": "UNNAMED_23",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 35
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      }
    ]
  }
}