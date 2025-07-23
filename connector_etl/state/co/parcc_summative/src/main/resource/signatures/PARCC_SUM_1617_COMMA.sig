{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "PARCC_SUM_1617_COMMA",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "hasHeader": true,
    "naturalKey": ["ASSESSMENT_YEAR", "ASSESSMENTGRADE", "STUDENTTESTUUID", "STATE_STUDENT_IDENTIFIER", "SUBJECT", "TESTCODE"],
    "fields": [{
      "physicalName": "StateAbbreviation",
      "otherPossibleNames": [],
      "logicalName": "STATEABBREVIATION",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "Y",
      "fieldOffset": {
        "offsetStart": 0,
        "offsetEnd": 0,
        "columnNum": 1
      },
      "fieldLength": 2,
      "expectedValues": ["CO"],
      "dataTypes": "STRING",
      "scale": null
    },
      {
        "physicalName": "TestingDistrictCode",
        "otherPossibleNames": [],
        "logicalName": "TESTINGDISTRICTCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestingSchoolCode",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SCHOOL_CODE",
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
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ResponsibleDistrictCode",
        "otherPossibleNames": [],
        "logicalName": "RESPONSIBLEDISTRICTCODE",
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
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ResponsibleSchoolCode",
        "otherPossibleNames": [],
        "logicalName": "RESPONSIBLESCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateStudentIdentifier",
        "otherPossibleNames": ["stateStudentIdentifier"],
        "logicalName": "STATE_STUDENT_IDENTIFIER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LocalStudentIdentifier",
        "otherPossibleNames": [],
        "logicalName": "LOCALSTUDENTIDENTIFIER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PARCCStudentIdentifier",
        "otherPossibleNames": [],
        "logicalName": "PARCCSTUDENTIDENTIFIER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 36,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LastOrSurname",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
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
          "columnNum": 10
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MiddleName",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Birthdate",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_BIRTHDATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
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
          "columnNum": 13
        },
        "fieldLength": 1,
        "expectedValues": ["F", "M"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateField1",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD1",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "GradeLevelWhenAssessed",
        "otherPossibleNames": [],
        "logicalName": "GRADE_LEVEL_WHEN_ASSESSED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 2,
        "expectedValues": ["03", "04", "05", "06", "07", "08", "09"],
        "dataTypes": "INTEGER",
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
          "columnNum": 16
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AmericanIndianOrAlaskaNative",
        "otherPossibleNames": ["AmericanIndianOrAlaskaNative "],
        "logicalName": "AMERICANINDIANORALASKANATIVE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 18
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 19
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 20
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 21
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField1",
        "otherPossibleNames": ["FillerField"],
        "logicalName": "FILLERFIELD1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": [],
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
          "columnNum": 23
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EnglishLearnerEL",
        "otherPossibleNames": [],
        "logicalName": "ENGLISHLEARNEREL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TitleIIILimitedEnglishProficientParticipationStatus",
        "otherPossibleNames": [],
        "logicalName": "TITLEIIILIMITEDENGLISHPROFICIENTPARTICIPATIONSTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", "X"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GiftedandTalented",
        "otherPossibleNames": [],
        "logicalName": "GIFTEDANDTALENTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
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
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EconomicDisadvantageStatus",
        "otherPossibleNames": [],
        "logicalName": "ECONOMICDISADVANTAGESTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 28
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentWithDisabilities",
        "otherPossibleNames": ["StudentWithDisabilities "],
        "logicalName": "STUDENTWITHDISABILITIES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 3,
        "expectedValues": ["IEP", "504", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PrimaryDisabilityType",
        "otherPossibleNames": [],
        "logicalName": "PRIMARYDISABILITYTYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 3,
        "expectedValues": ["AUT", "DB", "DD", "EMN", "HI", "ID", "MD", "NC", "OI", "OHI", "SLD", "SLI", "TBI", "VI", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateField2",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 31
        },
        "fieldLength": 20,
        "expectedValues": ["0", "3", "4", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateField3",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 32
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateField4",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 33
        },
        "fieldLength": 20,
        "expectedValues": ["0", "1", "2", "3", "4", "5", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StateField5",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 34
        },
        "fieldLength": 20,
        "expectedValues": ["0", "1", "2", "3", "4", "5", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StateField6",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 35
        },
        "fieldLength": 20,
        "expectedValues": ["0", "1", "2", "3", "4", "5", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StateField7",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 36
        },
        "fieldLength": 20,
        "expectedValues": ["0", "1", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StateField8",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 37
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateField9",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 38
        },
        "fieldLength": 20,
        "expectedValues": ["0", "1", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StateField10",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 39
        },
        "fieldLength": 20,
        "expectedValues": ["0", "1", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StateField11",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 40
        },
        "fieldLength": 20,
        "expectedValues": ["0", "1", "-"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StateField12",
        "otherPossibleNames": [],
        "logicalName": "STATEFIELD12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 41
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField2",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 42
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ClassName",
        "otherPossibleNames": [],
        "logicalName": "CLASSNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 43
        },
        "fieldLength": 45,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestAdministrator",
        "otherPossibleNames": [],
        "logicalName": "TESTADMINISTRATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 44
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StaffMemberIdentifier",
        "otherPossibleNames": [],
        "logicalName": "STAFFMEMBERIDENTIFIER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 45
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestCode",
        "otherPossibleNames": [],
        "logicalName": "TESTCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 46
        },
        "fieldLength": 5,
        "expectedValues": ["MAT03", "MAT04", "MAT05", "MAT06", "MAT07", "MAT08", "ALG01", "ALG02", "GEO01", "MAT1I", "MAT2I", "MAT3I", "ELA03", "ELA04", "ELA05", "ELA06", "ELA07", "ELA08", "ELA09", "ELA10", "ELA11"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 47
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Retest",
        "otherPossibleNames": [],
        "logicalName": "RETEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 48
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["ELAccommodation"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 49
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FrequentBreaks",
        "otherPossibleNames": [],
        "logicalName": "FREQUENTBREAKS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 50
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SeparateAlternateLocation",
        "otherPossibleNames": [],
        "logicalName": "SEPARATEALTERNATELOCATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 51
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SmallTestingGroup",
        "otherPossibleNames": [],
        "logicalName": "SMALLTESTINGGROUP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 52
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SpecializedEquipmentOrFurniture",
        "otherPossibleNames": [],
        "logicalName": "SPECIALIZEDEQUIPMENTORFURNITURE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SpecifiedAreaOrSetting",
        "otherPossibleNames": [],
        "logicalName": "SPECIFIEDAREAORSETTING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 54
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TimeOfDay",
        "otherPossibleNames": [],
        "logicalName": "TIMEOFDAY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 55
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AnswerMasking",
        "otherPossibleNames": [],
        "logicalName": "ANSWERMASKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 56
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentReadsAssessmentAloudToThemselves",
        "otherPossibleNames": ["FillerField"],
        "logicalName": "STUDENTREADSASSESSMENTALOUDTOTHEMSELVES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 57
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ColorContrast",
        "otherPossibleNames": [],
        "logicalName": "COLORCONTRAST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 58
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ASLVideo",
        "otherPossibleNames": [],
        "logicalName": "ASLVIDEO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AssistiveTechnologyScreenReader",
        "otherPossibleNames": [],
        "logicalName": "ASSISTIVETECHNOLOGYSCREENREADER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AssistiveTechnologyNonScreenReader",
        "otherPossibleNames": [],
        "logicalName": "ASSISTIVETECHNOLOGYNONSCREENREADER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 61
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ClosedCaptioningForELAL",
        "otherPossibleNames": [],
        "logicalName": "CLOSEDCAPTIONINGFORELAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RefreshableBrailleDisplayForELAL",
        "otherPossibleNames": [],
        "logicalName": "REFRESHABLEBRAILLEDISPLAYFORELAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AlternateRepresentationPaperTest",
        "otherPossibleNames": [],
        "logicalName": "ALTERNATEREPRESENTATIONPAPERTEST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 64
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LargePrint",
        "otherPossibleNames": [],
        "logicalName": "LARGEPRINT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 65
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BrailleWithTactileGraphics",
        "otherPossibleNames": [],
        "logicalName": "BRAILLEWITHTACTILEGRAPHICS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 66
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FillerField4",
        "otherPossibleNames": ["StudentReadsAssessmentAloudToThemselves"],
        "logicalName": "FILLERFIELD4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 67
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HumanSignerForTestDirections",
        "otherPossibleNames": [],
        "logicalName": "HUMANSIGNERFORTESTDIRECTIONS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 68
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AnswersRecordedInTestBook",
        "otherPossibleNames": [],
        "logicalName": "ANSWERSRECORDEDINTESTBOOK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 69
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BrailleResponse",
        "otherPossibleNames": [],
        "logicalName": "BRAILLERESPONSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 70
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "CalculationDeviceAndMathematicsTools",
        "otherPossibleNames": [],
        "logicalName": "CALCULATIONDEVICEANDMATHEMATICSTOOLS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 71
        },
        "fieldLength": 1,
        "expectedValues": ["C", "T", "D", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ELALConstructedResponse",
        "otherPossibleNames": [],
        "logicalName": "ELALCONSTRUCTEDRESPONSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 72
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ELALSelectedResponseOrTechnologyEnhancedItems",
        "otherPossibleNames": [],
        "logicalName": "ELALSELECTEDRESPONSEORTECHNOLOGYENHANCEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 73
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MathematicsResponse",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICSRESPONSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 74
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "MonitorTestResponse",
        "otherPossibleNames": [],
        "logicalName": "MONITORTESTRESPONSE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 75
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WordPredictionForELAL",
        "otherPossibleNames": ["WordPrediction"],
        "logicalName": "WORDPREDICTIONFORELAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 76
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AdministrationDirectionsClarifiedinStudentsNativeLanguage",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATIONDIRECTIONSCLARIFIEDINSTUDENTSNATIVELANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 77
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AdministrationDirectionsReadAloudinStudentsNativeLanguage",
        "otherPossibleNames": [],
        "logicalName": "ADMINISTRATIONDIRECTIONSREADALOUDINSTUDENTSNATIVELANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 78
        },
        "fieldLength": 3,
        "expectedValues": ["ARA", "CHI", "HAT", "NAV", "POL", "POR", "RUS", "SPA", "URD", "VIE", "HT", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MathematicsResponseEL",
        "otherPossibleNames": [],
        "logicalName": "MATHEMATICSRESPONSEEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 79
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SpanishTransadaptationOfTheMathematicsAssessment",
        "otherPossibleNames": ["TranslationOfTheMathematicsAssessment"],
        "logicalName": "SPANISHTRANSADAPTATIONOFTHEMATHEMATICSASSESSMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 80
        },
        "fieldLength": 3,
        "expectedValues": ["SPA", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WordtoWordDictionaryEnglishNativeLanguage",
        "otherPossibleNames": [],
        "logicalName": "WORDTOWORDDICTIONARYENGLISHNATIVELANGUAGE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TextToSpeech",
        "otherPossibleNames": [],
        "logicalName": "TEXTTOSPEECH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 82
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "HumanReaderOrHumanSigner",
        "otherPossibleNames": [],
        "logicalName": "HUMANREADERORHUMANSIGNER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 83
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "UniqueAccommodation",
        "otherPossibleNames": [],
        "logicalName": "UNIQUEACCOMMODATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 84
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EmergencyAccommodation",
        "otherPossibleNames": [],
        "logicalName": "EMERGENCYACCOMMODATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 85
        },
        "fieldLength": 2,
        "expectedValues": ["01", "99", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ExtendedTime",
        "otherPossibleNames": [],
        "logicalName": "EXTENDEDTIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 86
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentTestUUID",
        "otherPossibleNames": [],
        "logicalName": "STUDENTTESTUUID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 87
        },
        "fieldLength": 36,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "PaperFormID",
        "otherPossibleNames": [],
        "logicalName": "PAPERFORMID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 88
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "OnlineFormID",
        "otherPossibleNames": [],
        "logicalName": "ONLINEFORMID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 89
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestStatus",
        "otherPossibleNames": [],
        "logicalName": "TESTSTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 90
        },
        "fieldLength": 7,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TotalTestItems",
        "otherPossibleNames": [],
        "logicalName": "TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 91
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestAttemptednessFlag",
        "otherPossibleNames": [],
        "logicalName": "TESTATTEMPTEDNESSFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 92
        },
        "fieldLength": 1,
        "expectedValues": ["Y", "N", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TotalTestItemsAttempted",
        "otherPossibleNames": [],
        "logicalName": "TOTALTESTITEMSATTEMPTED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 93
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperSection1TotalTestItems",
        "otherPossibleNames": ["PaperUnit1TotalTestItems"],
        "logicalName": "PAPERSECTION1TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 94
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperSection1NumberofAttemptedItems",
        "otherPossibleNames": [],
        "logicalName": "PAPERSECTION1NUMBEROFATTEMPTEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 95
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperSection2TotalTestItems",
        "otherPossibleNames": [],
        "logicalName": "PAPERSECTION2TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 96
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperSection2NumberofAttemptedItems",
        "otherPossibleNames": [],
        "logicalName": "PAPERSECTION2NUMBEROFATTEMPTEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 97
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperSection3TotalTestItems",
        "otherPossibleNames": [],
        "logicalName": "PAPERSECTION3TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 98
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperSection3NumberofAttemptedItems",
        "otherPossibleNames": [],
        "logicalName": "PAPERSECTION3NUMBEROFATTEMPTEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 99
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperSection4TotalTestItems",
        "otherPossibleNames": [],
        "logicalName": "PAPERSECTION4TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 100
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperSection4NumberofAttemptedItems",
        "otherPossibleNames": [],
        "logicalName": "PAPERSECTION4NUMBEROFATTEMPTEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 101
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StudentUnit1TestUUID",
        "otherPossibleNames": [],
        "logicalName": "STUDENTUNIT1TESTUUID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 102
        },
        "fieldLength": 36,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Unit1FormID",
        "otherPossibleNames": [],
        "logicalName": "UNIT1FORMID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 103
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Unit1TotalTestItems",
        "otherPossibleNames": [],
        "logicalName": "UNIT1TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 104
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Unit1NumberofAttemptedItems",
        "otherPossibleNames": [],
        "logicalName": "UNIT1NUMBEROFATTEMPTEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 105
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StudentUnit2TestUUID",
        "otherPossibleNames": [],
        "logicalName": "STUDENTUNIT2TESTUUID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 106
        },
        "fieldLength": 36,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Unit2FormID",
        "otherPossibleNames": [],
        "logicalName": "UNIT2FORMID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 107
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Unit2TotalTestItems",
        "otherPossibleNames": [],
        "logicalName": "UNIT2TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 108
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Unit2NumberOfAttemptedItems",
        "otherPossibleNames": [],
        "logicalName": "UNIT2NUMBEROFATTEMPTEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 109
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StudentUnit3TestUUID",
        "otherPossibleNames": [],
        "logicalName": "STUDENTUNIT3TESTUUID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 110
        },
        "fieldLength": 36,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Unit3FormID",
        "otherPossibleNames": [],
        "logicalName": "UNIT3FORMID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 111
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Unit3TotalTestItems",
        "otherPossibleNames": [],
        "logicalName": "UNIT3TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 112
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Unit3NumberOfAttemptedItems",
        "otherPossibleNames": [],
        "logicalName": "UNIT3NUMBEROFATTEMPTEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 113
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "StudentUnit4TestUUID",
        "otherPossibleNames": [],
        "logicalName": "STUDENTUNIT4TESTUUID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 114
        },
        "fieldLength": 36,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Unit4FormID",
        "otherPossibleNames": [],
        "logicalName": "UNIT4FORMID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 115
        },
        "fieldLength": 18,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Unit4TotalTestItems",
        "otherPossibleNames": [],
        "logicalName": "UNIT4TOTALTESTITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 116
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Unit4NumberofAttemptedItems",
        "otherPossibleNames": [],
        "logicalName": "UNIT4NUMBEROFATTEMPTEDITEMS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 117
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NotTestedCode",
        "otherPossibleNames": [],
        "logicalName": "NOTTESTEDCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 118
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "NotTestedReason",
        "otherPossibleNames": [],
        "logicalName": "NOTTESTEDREASON",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 119
        },
        "fieldLength": 2,
        "expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "VoidScoreCode",
        "otherPossibleNames": [],
        "logicalName": "VOIDSCORECODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 120
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "VoidScoreReason",
        "otherPossibleNames": [],
        "logicalName": "VOIDSCOREREASON",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 121
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ShipReportDistrictCode",
        "otherPossibleNames": [],
        "logicalName": "SHIPREPORTDISTRICTCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 122
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ShipReportSchoolCode",
        "otherPossibleNames": [],
        "logicalName": "SHIPREPORTSCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 123
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SummativeFlag",
        "otherPossibleNames": ["Summative Flag"],
        "logicalName": "SUMMATIVEFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 124
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MultipleTestRegistration",
        "otherPossibleNames": [],
        "logicalName": "MULTIPLETESTREGISTRATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 125
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "RosterFlag",
        "otherPossibleNames": [],
        "logicalName": "ROSTERFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 126
        },
        "fieldLength": 1,
        "expectedValues": ["Y", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ReportSuppressionCode",
        "otherPossibleNames": [],
        "logicalName": "REPORTSUPPRESSIONCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 127
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "06", "10", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ReportSuppressionAction",
        "otherPossibleNames": [],
        "logicalName": "REPORTSUPPRESSIONACTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 128
        },
        "fieldLength": 2,
        "expectedValues": ["02", "03", "05", "06", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "PaperAttemptCreateDate",
        "otherPossibleNames": ["AttemptCreateDate"],
        "logicalName": "PAPERATTEMPTCREATEDATE",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 129
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "Unit1OnlineTestStartDateTime",
        "otherPossibleNames": [],
        "logicalName": "UNIT1ONLINETESTSTARTDATETIME",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 130
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "Unit1OnlineTestEndDateTime",
        "otherPossibleNames": [],
        "logicalName": "UNIT1ONLINETESTENDDATETIME",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 131
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "Unit2OnlineTestStartDateTime",
        "otherPossibleNames": [],
        "logicalName": "UNIT2ONLINETESTSTARTDATETIME",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 132
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "Unit2OnlineTestEndDateTime",
        "otherPossibleNames": [],
        "logicalName": "UNIT2ONLINETESTENDDATETIME",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 133
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "Unit3OnlineTestStartDateTime",
        "otherPossibleNames": [],
        "logicalName": "UNIT3ONLINETESTSTARTDATETIME",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 134
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "Unit3OnlineTestEndDateTime",
        "otherPossibleNames": [],
        "logicalName": "UNIT3ONLINETESTENDDATETIME",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 135
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "Unit4OnlineTestStartDateTime",
        "otherPossibleNames": [],
        "logicalName": "UNIT4ONLINETESTSTARTDATETIME",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 136
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "Unit4OnlineTestEndDateTime",
        "otherPossibleNames": [],
        "logicalName": "UNIT4ONLINETESTENDDATETIME",
        "formatMask": "yyyy-MM-ddTHH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 137
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "AssessmentYear",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_YEAR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 138
        },
        "fieldLength": 9,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AssessmentGrade",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 139
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "columnNum": 140
        },
        "fieldLength": 35,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FederalRaceEthnicity",
        "otherPossibleNames": [],
        "logicalName": "FEDERALRACEETHNICITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 141
        },
        "fieldLength": 2,
        "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "00"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Period",
        "otherPossibleNames": [],
        "logicalName": "PERIOD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 142
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestingOrganizationalType",
        "otherPossibleNames": [],
        "logicalName": "TESTINGORGANIZATIONALTYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 143
        },
        "fieldLength": 2,
        "expectedValues": ["03", "04"],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestingDistrictName",
        "otherPossibleNames": [],
        "logicalName": "TESTINGDISTRICTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 144
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestingSchoolName",
        "otherPossibleNames": [],
        "logicalName": "TESTING_SCHOOL_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 145
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ResponsibleOrganizationalType",
        "otherPossibleNames": ["ResponsibleOrganizationCodeType"],
        "logicalName": "RESPONSIBLEORGANIZATIONALTYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 146
        },
        "fieldLength": 2,
        "expectedValues": ["03", "04"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ResponsibleDistrictName",
        "otherPossibleNames": [],
        "logicalName": "RESPONSIBLEDISTRICTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 147
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ResponsibleSchoolName",
        "otherPossibleNames": [],
        "logicalName": "RESPONSIBLESCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 148
        },
        "fieldLength": 60,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 149
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 150
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 151
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 152
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 153
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 154
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_OVERALL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 155
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestCSEMProbableRange",
        "otherPossibleNames": [],
        "logicalName": "CSEM_RANGE_OVERALL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 156
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestPerformanceLevel",
        "otherPossibleNames": [],
        "logicalName": "PERFORMANCE_LEVEL_OVERALL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 157
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", "4", "5", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestReadingScaleScore",
        "otherPossibleNames": [],
        "logicalName": "TEST_READING_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 158
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestReadingCSEM",
        "otherPossibleNames": [],
        "logicalName": "TEST_READING_CSEM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 159
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestWritingScaleScore",
        "otherPossibleNames": [],
        "logicalName": "TEST_WRITING_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 160
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestWritingCSEM",
        "otherPossibleNames": [],
        "logicalName": "TEST_WRITING_CSEM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 161
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Subclaim1Category",
        "otherPossibleNames": [],
        "logicalName": "SUBCLAIM_1_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 162
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subclaim2Category",
        "otherPossibleNames": [],
        "logicalName": "SUBCLAIM_2_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 163
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subclaim3Category",
        "otherPossibleNames": [],
        "logicalName": "SUBCLAIM_3_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 164
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subclaim4Category",
        "otherPossibleNames": [],
        "logicalName": "SUBCLAIM_4_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "Subclaim5Category",
        "otherPossibleNames": [],
        "logicalName": "SUBCLAIM_5_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": ["1", "2", "3", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FillerField5",
        "otherPossibleNames": ["Subclaim6Category"],
        "logicalName": "SUBCLAIM_6_CATEGORY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 168
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 169
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentGrowthPercentileComparedtoCrossState",
        "otherPossibleNames": ["Filler"],
        "logicalName": "STUDENT_GROWTH_PERCENTILE_COMPARED_TO_CROSS_STATE_OVERALL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 170
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": ["Filler"],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 171
        },
        "fieldLength": 11,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestScoreComplete",
        "otherPossibleNames": [],
        "logicalName": "SCORE_COMPLETE_OVERALL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 172
        },
        "fieldLength": 1,
        "expectedValues": ["1", "0", ""],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 173
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 174
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CO Percentile Rank",
        "otherPossibleNames": [],
        "logicalName": "CO_PERCENTILE_RANK_OVERALL",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 175
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 176
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 177
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 178
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 179
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 180
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 181
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 182
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 183
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 184
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 185
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 186
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 187
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 188
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField7",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD7",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 189
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 190
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 191
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FillerField",
        "otherPossibleNames": [],
        "logicalName": "FILLERFIELD",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 192
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}