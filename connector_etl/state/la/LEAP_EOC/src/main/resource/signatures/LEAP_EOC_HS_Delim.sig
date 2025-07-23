{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "LEAP_EOC_HS_Delim",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "recordLength": "",
    "hasHeader": true,
    "naturalKey": [
      "LASID",
      "TEST_ALGI",
      "TEST_ENGII",
      "TEST_GEOM",
      "TEST_BIO",
      "TEST_ENGIII",
      "TEST_ENGI",
      "TEST_USHIST_2025"
    ],
    "fields": [
      {
        "physicalName": "AdministrationYear",
        "otherPossibleNames": [],
        "logicalName": "TEST_DATE_YEAR",
        "formatMask": "yyyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 4,
          "columnNum": 1
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AdministrationMonth",
        "otherPossibleNames": [],
        "logicalName": "TEST_DATE_MONTH",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5,
          "offsetEnd": 6,
          "columnNum": 2
        },
        "fieldLength": 2,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SchoolSystem",
        "otherPossibleNames": [],
        "logicalName": "SCHOOLSYSTEM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 7,
          "offsetEnd": 9,
          "columnNum": 3
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SchoolSystemName",
        "otherPossibleNames": [],
        "logicalName": "SCHOOLSYSTEMNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 13,
          "offsetEnd": 52,
          "columnNum": 4
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SchoolCode",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 10,
          "offsetEnd": 12,
          "columnNum": 5
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SchoolName",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 53,
          "offsetEnd": 92,
          "columnNum": 6
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LASID",
        "otherPossibleNames": [],
        "logicalName": "LASID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 154,
          "offsetEnd": 163,
          "columnNum": 7
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "LastName",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 118,
          "offsetEnd": 137,
          "columnNum": 8
        },
        "fieldLength": 20,
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
          "offsetStart": 138,
          "offsetEnd": 152,
          "columnNum": 9
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MiddleInitial",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_INITIAL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 153,
          "offsetEnd": 153,
          "columnNum": 10
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DOB",
        "otherPossibleNames": [],
        "logicalName": "DOB",
        "formatMask": "MMddyyyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 170,
          "offsetEnd": 177,
          "columnNum": 11
        },
        "fieldLength": 8,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Grade",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 178,
          "offsetEnd": 179,
          "columnNum": 12
        },
        "fieldLength": 2,
        "expectedValues": [
          "06",
          "07",
          "08",
          "T9",
          "09",
          "10",
          "11",
          "12"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gender",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 192,
          "offsetEnd": 192,
          "columnNum": 13
        },
        "fieldLength": 1,
        "expectedValues": [
          "M",
          "F"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "EthnicityRace",
        "otherPossibleNames": [],
        "logicalName": "SUMMARIZED_ETHNICITY_RACE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 213,
          "offsetEnd": 213,
          "columnNum": 14
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          "7"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EducationClassification",
        "otherPossibleNames": [],
        "logicalName": "EDUCATIONCLASSIFICATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 195,
          "offsetEnd": 195,
          "columnNum": 15
        },
        "fieldLength": 1,
        "expectedValues": [
          "0",
          "1",
          "2"
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ExceptionalityCode",
        "otherPossibleNames": [],
        "logicalName": "EXCEPTIONALITYCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 203,
          "offsetEnd": 204,
          "columnNum": 16
        },
        "fieldLength": 2,
        "expectedValues": [
          "01",
          "02",
          "03",
          "04",
          "05",
          "06",
          "07",
          "08",
          "09",
          "10",
          "11",
          "12",
          "13",
          "14",
          "15",
          "16",
          "17",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "EconomicallyDisadvantaged",
        "otherPossibleNames": [],
        "logicalName": "ECONOMICALLY_DISADVANTAGED_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 193,
          "offsetEnd": 193,
          "columnNum": 17
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LEP",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_LEP_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 197,
          "offsetEnd": 198,
          "columnNum": 18
        },
        "fieldLength": 3,
        "expectedValues": [
          "Yes",
          "No"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Section504",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_SECTION_504_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 201,
          "offsetEnd": 201,
          "columnNum": 19
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Migrant",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 194,
          "offsetEnd": 194,
          "columnNum": 20
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CareerDiplomaPathwayTrack",
        "otherPossibleNames": [],
        "logicalName": "CAREERDIPLOMAPATHWAYTRACK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 215,
          "offsetEnd": 215,
          "columnNum": 21
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "HomelessFlag",
        "otherPossibleNames": [],
        "logicalName": "REPORTING_HOMELESS_(MCKINNEY-VENTO)_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 214,
          "offsetEnd": 214,
          "columnNum": 22
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CharterSchoolType",
        "otherPossibleNames": [],
        "logicalName": "CHARTERSCHOOLTYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 101,
          "offsetEnd": 101,
          "columnNum": 23
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "MilitaryAffiliated",
        "otherPossibleNames": [],
        "logicalName": "MILITARY_AFFILIATED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 223,
          "offsetEnd": 223,
          "columnNum": 24
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FosterCare",
        "otherPossibleNames": [],
        "logicalName": "FOSTER_CARE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 224,
          "offsetEnd": 224,
          "columnNum": 25
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALLEAP2025Test",
        "otherPossibleNames": [],
        "logicalName": "TEST_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 235,
          "offsetEnd": 239,
          "columnNum": 26
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALAdministrativeError",
        "otherPossibleNames": [],
        "logicalName": "ALADMINISTRATIVEERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 234,
          "offsetEnd": 234,
          "columnNum": 27
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALCourseName",
        "otherPossibleNames": [],
        "logicalName": "ALCOURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 332,
          "offsetEnd": 361,
          "columnNum": 28
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALClassSection",
        "otherPossibleNames": [],
        "logicalName": "ALCLASSSECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 362,
          "offsetEnd": 381,
          "columnNum": 29
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALTeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "ALTEACHERLASTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 246,
          "offsetEnd": 265,
          "columnNum": 30
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALTeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "ALTEACHERFIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 266,
          "offsetEnd": 280,
          "columnNum": 31
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALTestingStatus",
        "otherPossibleNames": [],
        "logicalName": "STATUS_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 573,
          "offsetEnd": 573,
          "columnNum": 32
        },
        "fieldLength": 1,
        "expectedValues": [
          "I",
          "R",
          "P",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALVoidFlag",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 572,
          "offsetEnd": 572,
          "columnNum": 33
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALRawScore",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 472,
          "offsetEnd": 474,
          "columnNum": 34
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 478,
          "offsetEnd": 480,
          "columnNum": 35
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 481,
          "offsetEnd": 483,
          "columnNum": 36
        },
        "fieldLength": 3,
        "expectedValues": [
          "UNS",
          "APP",
          "BAS",
          "MAS",
          "ADV",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ALMajorContentRating",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 511,
          "offsetEnd": 511,
          "columnNum": 37
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALInterpretingFunctionsRating",
        "otherPossibleNames": [],
        "logicalName": "INTERPRETING_FUNCTIONS_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 545,
          "offsetEnd": 545,
          "columnNum": 38
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALSolvingAlgebraicallyRating",
        "otherPossibleNames": [],
        "logicalName": "SOLVING_ALGEBRAICALLY_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 553,
          "offsetEnd": 553,
          "columnNum": 39
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALSolvingGraphicallyRateofChangeRating",
        "otherPossibleNames": [],
        "logicalName": "SOLVING_GRAPHICALLY/RATE_OF_CHANGE_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 561,
          "offsetEnd": 561,
          "columnNum": 40
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALAdditionalAndSupportingContentRating",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 519,
          "offsetEnd": 519,
          "columnNum": 41
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALExpressingMathematicalReasoningRating",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 527,
          "offsetEnd": 527,
          "columnNum": 42
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ALModelingAndApplicationRating",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_RATING_ALGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 535,
          "offsetEnd": 535,
          "columnNum": 43
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER1",
        "otherPossibleNames": [],
        "logicalName": "FILLER1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 44
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER2",
        "otherPossibleNames": [],
        "logicalName": "FILLER2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 45
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2LEAP2025Test",
        "otherPossibleNames": [],
        "logicalName": "TEST_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 930,
          "offsetEnd": 934,
          "columnNum": 46
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2AdministrativeError",
        "otherPossibleNames": [],
        "logicalName": "E2ADMINISTRATIVEERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 929,
          "offsetEnd": 929,
          "columnNum": 47
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2CourseName",
        "otherPossibleNames": [],
        "logicalName": "E2COURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1027,
          "offsetEnd": 1056,
          "columnNum": 48
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2ClassSection",
        "otherPossibleNames": [],
        "logicalName": "E2CLASSSECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1057,
          "offsetEnd": 1076,
          "columnNum": 49
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2TeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "E2TEACHERLASTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 941,
          "offsetEnd": 960,
          "columnNum": 50
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2TeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "E2TEACHERFIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 961,
          "offsetEnd": 975,
          "columnNum": 51
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2TestingStatus",
        "otherPossibleNames": [],
        "logicalName": "STATUS_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1294,
          "offsetEnd": 1294,
          "columnNum": 52
        },
        "fieldLength": 1,
        "expectedValues": [
          "I",
          "R",
          "P",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2VoidFlag",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1293,
          "offsetEnd": 1293,
          "columnNum": 53
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2RawScore",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1167,
          "offsetEnd": 1169,
          "columnNum": 54
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2ScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1173,
          "offsetEnd": 1175,
          "columnNum": 55
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2AchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1176,
          "offsetEnd": 1178,
          "columnNum": 56
        },
        "fieldLength": 3,
        "expectedValues": [
          "UNS",
          "APP",
          "BAS",
          "MAS",
          "ADV",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E2ReadingPerformanceRating",
        "otherPossibleNames": [],
        "logicalName": "READING_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1266,
          "offsetEnd": 1266,
          "columnNum": 57
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2ReadingLiteraryTextRating",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1206,
          "offsetEnd": 1206,
          "columnNum": 58
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2ReadingInformationalTextRating",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1214,
          "offsetEnd": 1222,
          "columnNum": 59
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2ReadingVocabularyTextRating",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1222,
          "offsetEnd": 1222,
          "columnNum": 60
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2WritingPerformanceRating",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1274,
          "offsetEnd": 1274,
          "columnNum": 61
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2WrittenExpressionRating",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1230,
          "offsetEnd": 1230,
          "columnNum": 62
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E2WrittenKnowledgeAndUseofLanguageConventionsRating",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_RATING_ENGII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1238,
          "offsetEnd": 1238,
          "columnNum": 63
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER3",
        "otherPossibleNames": [],
        "logicalName": "FILLER3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 64
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER4",
        "otherPossibleNames": [],
        "logicalName": "FILLER4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 65
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMLEAP2025Test",
        "otherPossibleNames": [],
        "logicalName": "TEST_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1659,
          "offsetEnd": 1663,
          "columnNum": 66
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMAdministrativeError",
        "otherPossibleNames": [],
        "logicalName": "GMADMINISTRATIVEERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1658,
          "offsetEnd": 1658,
          "columnNum": 67
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMCourseName",
        "otherPossibleNames": [],
        "logicalName": "GMCOURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1756,
          "offsetEnd": 1785,
          "columnNum": 68
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMClassSection",
        "otherPossibleNames": [],
        "logicalName": "GMCLASSSECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1786,
          "offsetEnd": 1805,
          "columnNum": 69
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMTeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "GMTEACHERLASTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1670,
          "offsetEnd": 1689,
          "columnNum": 70
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMTeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "GMTEACHERFIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1690,
          "offsetEnd": 1704,
          "columnNum": 71
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMTestingStatus",
        "otherPossibleNames": [],
        "logicalName": "STATUS_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1986,
          "offsetEnd": 1986,
          "columnNum": 72
        },
        "fieldLength": 1,
        "expectedValues": [
          "I",
          "R",
          "P",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMVoidFlag",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1985,
          "offsetEnd": 1985,
          "columnNum": 73
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GMRawScore",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1895,
          "offsetEnd": 1897,
          "columnNum": 74
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GMScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1901,
          "offsetEnd": 1903,
          "columnNum": 75
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GMAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1904,
          "offsetEnd": 1906,
          "columnNum": 76
        },
        "fieldLength": 3,
        "expectedValues": [
          "UNS",
          "APP",
          "BAS",
          "MAS",
          "ADV",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GMMajorContentRating",
        "otherPossibleNames": [],
        "logicalName": "MAJOR_CONTENT_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1934,
          "offsetEnd": 1934,
          "columnNum": 77
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GMCongruenceTransformationsSimilarityRating",
        "otherPossibleNames": [],
        "logicalName": "CONGRUENCE_TRANSFORMATIONS/SIMILARITY_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1967,
          "offsetEnd": 1967,
          "columnNum": 78
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GMSimilarityInTrigonometryModelingAndApplyingRating",
        "otherPossibleNames": [],
        "logicalName": "SIMILARITY_IN_TRIGONOMETRY/MODELING_&_APPLYING_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1975,
          "offsetEnd": 1975,
          "columnNum": 79
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GMAdditionalAndSupportingContentRating",
        "otherPossibleNames": [],
        "logicalName": "ADDITIONAL_&_SUPPORTING_CONTENT_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1942,
          "offsetEnd": 1942,
          "columnNum": 80
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GMExpressingMathematicalReasoningRating",
        "otherPossibleNames": [],
        "logicalName": "EXPRESSING_MATHEMATICAL_REASONING_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1950,
          "offsetEnd": 1950,
          "columnNum": 81
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GMModelingAndApplicationRating",
        "otherPossibleNames": [],
        "logicalName": "MODELING_&_APPLICATION_RATING_GEOM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1958,
          "offsetEnd": 1958,
          "columnNum": 82
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER5",
        "otherPossibleNames": [],
        "logicalName": "FILLER5",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 83
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLEOCTest",
        "otherPossibleNames": [],
        "logicalName": "TEST_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2343,
          "offsetEnd": 2347,
          "columnNum": 84
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLAdministrativeError",
        "otherPossibleNames": [],
        "logicalName": "BLADMINISTRATIVEERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2342,
          "offsetEnd": 2342,
          "columnNum": 85
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLCourseName",
        "otherPossibleNames": [],
        "logicalName": "BLCOURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2440,
          "offsetEnd": 2469,
          "columnNum": 86
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLClassSection",
        "otherPossibleNames": [],
        "logicalName": "BLCLASSSECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2470,
          "offsetEnd": 2489,
          "columnNum": 87
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLTeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "BLTEACHERLASTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2354,
          "offsetEnd": 2373,
          "columnNum": 88
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLTeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "BLTEACHERFIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2374,
          "offsetEnd": 2388,
          "columnNum": 89
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLTestingStatus",
        "otherPossibleNames": [],
        "logicalName": "STATUS_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2655,
          "offsetEnd": 2655,
          "columnNum": 90
        },
        "fieldLength": 15,
        "expectedValues": [
          "Initial",
          "Passed",
          "Retest",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLVoidFlag",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2654,
          "offsetEnd": 2654,
          "columnNum": 91
        },
        "fieldLength": 3,
        "expectedValues": [
          "Yes",
          "No",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLRawScore",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2579,
          "offsetEnd": 2581,
          "columnNum": 92
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2585,
          "offsetEnd": 2587,
          "columnNum": 93
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2588,
          "offsetEnd": 2589,
          "columnNum": 94
        },
        "fieldLength": 500,
        "expectedValues": [
          "Approaching Basic",
          "Basic",
          "Mastery",
          "Unsatisfactory",
          "Advanced",
          "Needs Improvement",
          "Fair",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BLScienceAsInquiryPercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "SCIENCE_AS_INQUIRY_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2616,
          "offsetEnd": 2618,
          "columnNum": 95
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLLifeSciencePercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "LIFE_SCIENCE_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2621,
          "offsetEnd": 2623,
          "columnNum": 96
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "BLEarthAndSpaceSciencePercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "EARTH_AND_SPACE_SCIENCE_PERCENT_CORRECT_BIO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2626,
          "offsetEnd": 2628,
          "columnNum": 97
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER6",
        "otherPossibleNames": [],
        "logicalName": "FILLER6",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 98
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER7",
        "otherPossibleNames": [],
        "logicalName": "FILLER7",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 99
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3EOCTest",
        "otherPossibleNames": [],
        "logicalName": "TEST_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3020,
          "offsetEnd": 3024,
          "columnNum": 100
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3AdministrativeError",
        "otherPossibleNames": [],
        "logicalName": "E3ADMINISTRATIVEERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3019,
          "offsetEnd": 3019,
          "columnNum": 101
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N"
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3CourseName",
        "otherPossibleNames": [],
        "logicalName": "E3COURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3117,
          "offsetEnd": 3146,
          "columnNum": 102
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3ClassSection",
        "otherPossibleNames": [],
        "logicalName": "E3CLASSSECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3147,
          "offsetEnd": 3166,
          "columnNum": 103
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3TeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "E3TEACHERLASTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3031,
          "offsetEnd": 3050,
          "columnNum": 104
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3TeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "E3TEACHERFIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3051,
          "offsetEnd": 3065,
          "columnNum": 105
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3TestingStatus",
        "otherPossibleNames": [],
        "logicalName": "STATUS_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3332,
          "offsetEnd": 3332,
          "columnNum": 106
        },
        "fieldLength": 1,
        "expectedValues": [
          "I",
          "R",
          "P",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3VoidFlag",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3331,
          "offsetEnd": 3331,
          "columnNum": 107
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E3RawScore",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3256,
          "offsetEnd": 3258,
          "columnNum": 108
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E3ScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3262,
          "offsetEnd": 3264,
          "columnNum": 109
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E3AchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3265,
          "offsetEnd": 3266,
          "columnNum": 110
        },
        "fieldLength": 3,
        "expectedValues": [
          "E",
          "G",
          "F",
          "NI",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3Writing_LanguageConventionsPercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "WRITING_AND_LANGUAGE_CONVENTIONS_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3293,
          "offsetEnd": 3295,
          "columnNum": 111
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3ReadingPercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "READING_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3298,
          "offsetEnd": 3300,
          "columnNum": 112
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E3ResearchPercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "RESEARCH_PERCENT_CORRECT_ENGIII",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3303,
          "offsetEnd": 3305,
          "columnNum": 113
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER8",
        "otherPossibleNames": [],
        "logicalName": "FILLER8",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 114
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER9",
        "otherPossibleNames": [],
        "logicalName": "FILLER9",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 115
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1LEAP2025Test",
        "otherPossibleNames": [],
        "logicalName": "TEST_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5049,
          "offsetEnd": 5053,
          "columnNum": 116
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1AdministrativeError",
        "otherPossibleNames": [],
        "logicalName": "E1ADMINISTRATIVEERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5048,
          "offsetEnd": 5048,
          "columnNum": 117
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1CourseName",
        "otherPossibleNames": [],
        "logicalName": "E1COURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5146,
          "offsetEnd": 5175,
          "columnNum": 118
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1ClassSection",
        "otherPossibleNames": [],
        "logicalName": "E1CLASSSECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5176,
          "offsetEnd": 5195,
          "columnNum": 119
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1TeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "E1TEACHERLASTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5060,
          "offsetEnd": 5079,
          "columnNum": 120
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1TeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "E1TEACHERFIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5080,
          "offsetEnd": 5094,
          "columnNum": 121
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1TestingStatus",
        "otherPossibleNames": [],
        "logicalName": "STATUS_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5422,
          "offsetEnd": 5422,
          "columnNum": 122
        },
        "fieldLength": 1,
        "expectedValues": [
          "I",
          "R",
          "P",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1VoidFlag",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5421,
          "offsetEnd": 5421,
          "columnNum": 123
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1RawScore",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5285,
          "offsetEnd": 5287,
          "columnNum": 124
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1ScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5291,
          "offsetEnd": 5293,
          "columnNum": 125
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1AchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5294,
          "offsetEnd": 5296,
          "columnNum": 126
        },
        "fieldLength": 3,
        "expectedValues": [
          "UNS",
          "APP",
          "BAS",
          "MAS",
          "ADV",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "E1ReadingPerformanceRating",
        "otherPossibleNames": [],
        "logicalName": "READING_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5384,
          "offsetEnd": 5384,
          "columnNum": 127
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1ReadingLiteraryTextRating",
        "otherPossibleNames": [],
        "logicalName": "READING_LITERARY_TEXT_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5324,
          "offsetEnd": 5324,
          "columnNum": 128
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1ReadingInformationalTextRating",
        "otherPossibleNames": [],
        "logicalName": "READING_INFORMATIONAL_TEXT_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5332,
          "offsetEnd": 5332,
          "columnNum": 129
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1ReadingVocabularyTextRating",
        "otherPossibleNames": [],
        "logicalName": "READING_VOCABULARY_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5340,
          "offsetEnd": 5340,
          "columnNum": 130
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1WritingPerformanceRating",
        "otherPossibleNames": [],
        "logicalName": "WRITING_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5392,
          "offsetEnd": 5392,
          "columnNum": 131
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1WrittenExpressionRating",
        "otherPossibleNames": [],
        "logicalName": "WRITTEN_EXPRESSION_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5348,
          "offsetEnd": 5348,
          "columnNum": 132
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "E1WrittenKnowledgeAndUseofLanguageConventionsRating",
        "otherPossibleNames": [],
        "logicalName": "KNOWLEDGE_&_USE_OF_LANGUAGE_CONVENTIONS_RATING_ENGI",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 5356,
          "offsetEnd": 5356,
          "columnNum": 133
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER10",
        "otherPossibleNames": [],
        "logicalName": "FILLER10",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 134
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER11",
        "otherPossibleNames": [],
        "logicalName": "FILLER11",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 135
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USEOCTest",
        "otherPossibleNames": [],
        "logicalName": "TEST_USEOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 136
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USEAdministrativeError",
        "otherPossibleNames": [],
        "logicalName": "USEADMINISTRATIVEERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 137
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USECourseName",
        "otherPossibleNames": [],
        "logicalName": "USECOURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 138
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USEClassSection",
        "otherPossibleNames": [],
        "logicalName": "USECLASSSECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 139
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USETeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "USETEACHERLASTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 140
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USETeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "USLTEACHERFIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 141
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USETestingStatus",
        "otherPossibleNames": [],
        "logicalName": "STATUS_USEOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 142
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USEVoidFlag",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_USEOC",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 143
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USERawScore",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 144
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USEScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 145
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USEAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 146
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USEWesternExpansionToProgressivismPercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_PERCENT_-_CORRECT_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 147
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USEIsolationismThroughTheGreatWarPercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_PERCENT_-_CORRECT_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 148
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USEBecomingAWorldPowerThroughWorldWarIIPercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_PERCENT_-_CORRECT_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 149
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USEColdWarEraPercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "USECOLDWARERA_-_PERCENT_-_CORRECT_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 150
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USETheModernAgePercentCorrect",
        "otherPossibleNames": [],
        "logicalName": "USETHEMODERNAGE_-_PERCENT_-_CORRECT_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 151
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FILLER12",
        "otherPossibleNames": [],
        "logicalName": "FILLER12",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 152
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FILLER13",
        "otherPossibleNames": [],
        "logicalName": "FILLER13",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 153
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLEAP2025Test",
        "otherPossibleNames": [],
        "logicalName": "TEST_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4378,
          "offsetEnd": 4382,
          "columnNum": 154
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLAdministrativeError",
        "otherPossibleNames": [],
        "logicalName": "USLADMINISTRATIVEERROR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4377,
          "offsetEnd": 4377,
          "columnNum": 155
        },
        "fieldLength": 1,
        "expectedValues": [
          "Y",
          "N",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLCourseName",
        "otherPossibleNames": [],
        "logicalName": "USLCOURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4475,
          "offsetEnd": 4504,
          "columnNum": 156
        },
        "fieldLength": 30,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLClassSection",
        "otherPossibleNames": [],
        "logicalName": "USLCLASSSECTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4505,
          "offsetEnd": 4524,
          "columnNum": 157
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLTeacherLastName",
        "otherPossibleNames": [],
        "logicalName": "USLTEACHERLASTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4389,
          "offsetEnd": 4408,
          "columnNum": 158
        },
        "fieldLength": 20,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLTeacherFirstName",
        "otherPossibleNames": [],
        "logicalName": "USLTEACHERFIRSTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4409,
          "offsetEnd": 4423,
          "columnNum": 159
        },
        "fieldLength": 15,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLTestingStatus",
        "otherPossibleNames": [],
        "logicalName": "STATUS_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4690,
          "offsetEnd": 4690,
          "columnNum": 160
        },
        "fieldLength": 1,
        "expectedValues": [
          "I",
          "R",
          "P",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLVoidFlag",
        "otherPossibleNames": [],
        "logicalName": "VOID_FLAG_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4689,
          "offsetEnd": 4689,
          "columnNum": 161
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USLRawScore",
        "otherPossibleNames": [],
        "logicalName": "RAW_SCORE_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4614,
          "offsetEnd": 4616,
          "columnNum": 162
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USLScaleScore",
        "otherPossibleNames": [],
        "logicalName": "SCALE_SCORE_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4620,
          "offsetEnd": 4622,
          "columnNum": 163
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USLAchievementLevel",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_ACHIEVEMENT_LEVEL_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4623,
          "offsetEnd": 4625,
          "columnNum": 164
        },
        "fieldLength": 3,
        "expectedValues": [
          "UNS",
          "APP",
          "BAS",
          "MAS",
          "ADV",
          ""
        ],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "USLWesternExpansionToProgressivismStandard2Rating",
        "otherPossibleNames": [],
        "logicalName": "WESTERN_EXPANSION_TO_PROGRESSIVISM_-_STANDARD_2_-_RATING_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4654,
          "offsetEnd": 4654,
          "columnNum": 165
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USLIsolationismThroughGreatWarStandard3Rating",
        "otherPossibleNames": [],
        "logicalName": "ISOLATIONISM_THROUGH_THE_GREAT_WAR_-_STANDARD_3_-_RATING_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4660,
          "offsetEnd": 4660,
          "columnNum": 166
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USLBecomingWorldPowerThroughWorldWarIIStandard4Rating",
        "otherPossibleNames": [],
        "logicalName": "BECOMING_A_WORLD_POWER_THROUGH_WORLD_WAR_II_-_STANDARD_4_-_RATING_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4666,
          "offsetEnd": 4666,
          "columnNum": 167
        },
        "fieldLength": 1,
        "expectedValues": [
          "1",
          "2",
          "3",
          ""
        ],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USLColdWarEraStandard5Rating",
        "otherPossibleNames": [],
        "logicalName": "USLCOLDWARERASTANDARD5_RATING_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4672,
          "offsetEnd": 4672,
          "columnNum": 168
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "USLTheModernAgeStandard6Rating",
        "otherPossibleNames": [],
        "logicalName": "USLTHEMODERNAGESTANDARD6_RATING_USHIST_2025",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 4672,
          "offsetEnd": 4672,
          "columnNum": 168
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
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
          "offsetStart": 1,
          "offsetEnd": 1,
          "columnNum": 190
        },
        "fieldLength": 1,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      }
    ]
  },
  "fileExtensions": [
    ".csv"
  ]
}