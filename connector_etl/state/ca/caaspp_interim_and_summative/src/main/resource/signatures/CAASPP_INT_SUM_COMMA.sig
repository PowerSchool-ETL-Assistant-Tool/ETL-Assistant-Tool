{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "CAASPP_INT_SUM_COMMA",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "hasHeader": true,
    "naturalKey": ["STUDENTIDENTIFIER", "SUBMITDATETIME", "TESTSESSIONID", "SUBJECT","ASSESSMENTNAME"],
    "fields": [{
      "physicalName": "DistrictId",
      "otherPossibleNames": [],
      "logicalName": "DISTRICTID",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "Y",
      "fieldOffset": {
        "offsetStart": 0,
        "offsetEnd": 0,
        "columnNum": 1
      },
      "fieldLength": 15,
      "expectedValues": [],
      "dataTypes": "INTEGER",
      "scale": null
    },
      {
        "physicalName": "DistrictName",
        "otherPossibleNames": [],
        "logicalName": "DISTRICTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 80,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NcesId",
        "otherPossibleNames": [],
        "logicalName": "NCESID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SchoolId",
        "otherPossibleNames": [],
        "logicalName": "SCHOOLID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SchoolName",
        "otherPossibleNames": [],
        "logicalName": "SCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 80,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentIdentifier",
        "otherPossibleNames": [],
        "logicalName": "STUDENTIDENTIFIER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FirstName",
        "otherPossibleNames": [],
        "logicalName": "FIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
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
        "physicalName": "LastOrSurname",
        "otherPossibleNames": [],
        "logicalName": "LASTORSURNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SubmitDateTime",
        "otherPossibleNames": [],
        "logicalName": "SUBMITDATETIME",
        "formatMask": "yyyy-MM-dd HH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 26,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "SchoolYear",
        "otherPossibleNames": [],
        "logicalName": "SCHOOLYEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestSessionId",
        "otherPossibleNames": [],
        "logicalName": "TESTSESSIONID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 11,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AssessmentType",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENTTYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 7,
        "expectedValues": ["Interim"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AssessmentSubType",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENTSUBTYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 3,
        "expectedValues": ["IAB", "ICA"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AssessmentName",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 80,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Subject",
        "otherPossibleNames": [],
        "logicalName": "SUBJECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 4,
        "expectedValues": ["ELA", "Math"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GradeLevelWhenAssessed",
        "otherPossibleNames": [],
        "logicalName": "GRADELEVELWHENASSESSED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 2,
        "expectedValues": ["02", "03", "04", "05", "06", "07", "08", "KG"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Completeness",
        "otherPossibleNames": [],
        "logicalName": "COMPLETENESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 8,
        "expectedValues": ["Complete", "Partial"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AdministrationCondition",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATIONCONDITION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 2,
        "expectedValues": ["NS", "SD", "Valid"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ScaleScoreAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "SCALESCOREACHIEVEMENTLEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALESCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ScaleScoreStandardError",
        "otherPossibleNames": [],
        "logicalName": "SCALESCORESTANDARDERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 21
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Claim1ScoreAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "CLAIM1SCOREACHIEVEMENTLEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Claim2ScoreAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "CLAIM2SCOREACHIEVEMENTLEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 23
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Claim3ScoreAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "CLAIM3SCOREACHIEVEMENTLEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Claim4ScoreAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "CLAIM4SCOREACHIEVEMENTLEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Claim5ScoreAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "CLAIM5SCOREACHIEVEMENTLEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Claim6ScoreAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "CLAIM6SCOREACHIEVEMENTLEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Sex",
        "otherPossibleNames": [],
        "logicalName": "SEX",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 28
        },
        "fieldLength": 10,
        "expectedValues": ["Male", "Female", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MigrantStatus",
        "otherPossibleNames": [],
        "logicalName": "MIGRANTSTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 3,
        "expectedValues": ["No", "Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Section504Status",
        "otherPossibleNames": [],
        "logicalName": "SECTION504STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 3,
        "expectedValues": ["No", "Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "IDEAIndicator",
        "otherPossibleNames": [],
        "logicalName": "IDEAINDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 31
        },
        "fieldLength": 3,
        "expectedValues": ["No", "Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEPStatus",
        "otherPossibleNames": [],
        "logicalName": "LEPSTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 32
        },
        "fieldLength": 3,
        "expectedValues": ["No", "Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EnglishLanguageAcquisitionStatus",
        "otherPossibleNames": [],
        "logicalName": "ENGLISHLANGUAGEACQUISITIONSTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 33
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EnglishLanguageAcquisitionStatusStartDate",
        "otherPossibleNames": [],
        "logicalName": "ENGLISHLANGUAGEACQUISITIONSTATUSSTARTDATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 34
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HispanicOrLatinoEthnicity",
        "otherPossibleNames": [],
        "logicalName": "HISPANICORLATINOETHNICITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 35
        },
        "fieldLength": 3,
        "expectedValues": ["Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AmericanIndianOrAlaskaNative",
        "otherPossibleNames": [],
        "logicalName": "AMERICANINDIANORALASKANATIVE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 36
        },
        "fieldLength": 3,
        "expectedValues": ["Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Asian",
        "otherPossibleNames": [],
        "logicalName": "ASIAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 37
        },
        "fieldLength": 3,
        "expectedValues": ["Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BlackOrAfricanAmerican",
        "otherPossibleNames": [],
        "logicalName": "BLACKORAFRICANAMERICAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 38
        },
        "fieldLength": 3,
        "expectedValues": ["Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "White",
        "otherPossibleNames": [],
        "logicalName": "WHITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 39
        },
        "fieldLength": 3,
        "expectedValues": ["Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NativeHawaiianOrOtherPacificIslander",
        "otherPossibleNames": [],
        "logicalName": "NATIVEHAWAIIANOROTHERPACIFICISLANDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 40
        },
        "fieldLength": 3,
        "expectedValues": ["Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TwoOrMoreRaces",
        "otherPossibleNames": [],
        "logicalName": "TWOORMORERACES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 41
        },
        "fieldLength": 3,
        "expectedValues": ["Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Filipino",
        "otherPossibleNames": [],
        "logicalName": "FILIPINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 42
        },
        "fieldLength": 3,
        "expectedValues": ["Yes", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AssignedAccommodationList",
        "otherPossibleNames": [],
        "logicalName": "ASSIGNEDACCOMMODATIONLIST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 43
        },
        "fieldLength": 80,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}