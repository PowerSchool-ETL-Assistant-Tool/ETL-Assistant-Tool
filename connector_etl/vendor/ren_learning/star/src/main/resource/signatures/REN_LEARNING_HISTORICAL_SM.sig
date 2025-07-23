{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "REN_LEARNING_HISTORICAL_SM",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "hasHeader": true,
    "naturalKey": ["STUDENT_LOCAL_ID"],
    "fields": [{
      "physicalName": "StudentLocalID",
      "otherPossibleNames": [],
      "logicalName": "STUDENT_LOCAL_ID",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "N",
      "fieldOffset": {
        "offsetStart": 0,
        "offsetEnd": 0,
        "columnNum": 1
      },
      "fieldLength": 0,
      "expectedValues": [],
      "dataTypes": "STRING",
      "scale": null
    },
      {
        "physicalName": "StudentStateID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_STATE_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentFirst",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentMiddle",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_NAME",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentLast",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "Gender",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_GENDER_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 6
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BirthDate",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_BIRTHDATE",
        "formatMask": "MM/dd/yyyy",
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Ethnicity",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_RACE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CurrentGrade",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_GRADE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DistrictStateID",
        "otherPossibleNames": [],
        "logicalName": "DISTRICT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SchoolLocalID",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_LOCAL_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SchoolStateID",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_STATE_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SchoolName",
        "otherPossibleNames": [],
        "logicalName": "SCHOOL_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CourseNumber",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CourseName",
        "otherPossibleNames": [],
        "logicalName": "COURSE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ClassNumber",
        "otherPossibleNames": [],
        "logicalName": "CLASS_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherLocalID",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LOCAL_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherStateID",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_STATE_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherFirst",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_FIRST ",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherMiddle",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_MIDDLE ",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherLast",
        "otherPossibleNames": [],
        "logicalName": "TEACHER_LAST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 21
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentAssessmentID",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_ASSESSMENT_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 22
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "AssessmentDate",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMIN_DATE",
        "formatMask": "MM/dd/yyyy HH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 23
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "GradePlacement",
        "otherPossibleNames": [],
        "logicalName": "GRADE_PLACEMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 0,
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
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 0,
        "expectedValues": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "ScaledScore",
        "otherPossibleNames": [],
        "logicalName": "SCALED_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 26
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SEM",
        "otherPossibleNames": [],
        "logicalName": "SEM",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 27
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RaschScore",
        "otherPossibleNames": [],
        "logicalName": "RASCH_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 28
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 4.0
      },
      {
        "physicalName": "GradeEquivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADE_EQUIVALENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 1.0
      },
      {
        "physicalName": "PercentileRank",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILE_RANK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NormalCurveEquivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMAL_CURVE_EQUIVALENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 31
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 1.0
      },
      {
        "physicalName": "TotalTime",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_TIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 32
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TotalDuration",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_DURATION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 33
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TotalCorrect",
        "otherPossibleNames": [],
        "logicalName": "TOTAL_CORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 34
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 2.0
      },
      {
        "physicalName": "AssessmentNumber",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 35
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TestType",
        "otherPossibleNames": [],
        "logicalName": "TEST_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 36
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WindowName",
        "otherPossibleNames": [],
        "logicalName": "WINDOW_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 37
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WindowStart",
        "otherPossibleNames": [],
        "logicalName": "WINDOW_START",
        "formatMask": "MM/dd/yyyy HH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 38
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "WindowEnd",
        "otherPossibleNames": [],
        "logicalName": "WINDOW_END",
        "formatMask": "MM/dd/yyyy HH:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 39
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "ScreeningCategoryGroupAdjustment",
        "otherPossibleNames": [],
        "logicalName": "SCREENING_CATEGORY_GROUP_ADJUSTMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 40
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateBenchmarkName",
        "otherPossibleNames": [],
        "logicalName": "STATE_BENCHMARK_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 41
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateBenchmarkCategoryAdjustment",
        "otherPossibleNames": [],
        "logicalName": "STATE_BENCHMARK_CATEGORY_ADJUSTMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 42
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateBenchmarkCategoryGroupAdjustment",
        "otherPossibleNames": [],
        "logicalName": "STATE_BENCHMARK_CATEGORY_GROUP_ADJUSTMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 43
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TestStatus",
        "otherPossibleNames": [],
        "logicalName": "TEST_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 44
        },
        "fieldLength": 0,
        "expectedValues": ["Active", "Deactivated"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DeactivationReason",
        "otherPossibleNames": [],
        "logicalName": "DEACTIVATION_REASON",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 45
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GlobalWindow",
        "otherPossibleNames": [],
        "logicalName": "GLOBAL_WINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 46
        },
        "fieldLength": 0,
        "expectedValues": ["Fall", "Winter", "Spring"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ProbableTestType",
        "otherPossibleNames": [],
        "logicalName": "PROBABLE_TEST_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 47
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "FallWinterSGP",
        "otherPossibleNames": [],
        "logicalName": "FALL_WINTER_SGP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 48
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "WinterSpringSGP",
        "otherPossibleNames": [],
        "logicalName": "WINTER_SPRING_SGP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 49
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "FallSpringSGP",
        "otherPossibleNames": [],
        "logicalName": "FALL_SPRING_SGP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 50
        },
        "fieldLength": 0,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}