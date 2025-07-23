{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "COPY_REN_LEARNING_1819_SR",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "hasHeader": true,
    "naturalKey": ["STUDENTLOCALID", "STUDENTASSESSMENTID", "TEST_ADMIN_DATE", "ASSESSMENT_NUMBER", "TEST_TYPE"],
    "fields": [{
      "physicalName": "StudentLocalID",
      "otherPossibleNames": [],
      "logicalName": "STUDENTLOCALID",
      "formatMask": null,
      "isFieldRequired": "Y",
      "canBeNull": "Y",
      "fieldOffset": {
        "offsetStart": 0,
        "offsetEnd": 0,
        "columnNum": 1
      },
      "fieldLength": 10,
      "expectedValues": [],
      "dataTypes": "STRING",
      "scale": null
    },
      {
        "physicalName": "StudentStateID",
        "otherPossibleNames": [],
        "logicalName": "STUDENTSTATEID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 10,
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentMiddle",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_MIDDLE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 25,
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 5
        },
        "fieldLength": 40,
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
          "columnNum": 6
        },
        "fieldLength": 1,
        "expectedValues": ["F", "M", "U"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "BirthDate",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_BIRTHDATE",
        "formatMask": "MM/dd/yyyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "Ethnicity",
        "otherPossibleNames": [],
        "logicalName": "ETHNICITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CurrentGrade",
        "otherPossibleNames": [],
        "logicalName": "CURRENTGRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 1,
        "expectedValues": ["K", "1", "2", "3", "4", "5", "6", "7", "8"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentStatus",
        "otherPossibleNames": [],
        "logicalName": "STUDENTSTATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 10,
        "expectedValues": ["Active", "Inactive"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DistrictStateID",
        "otherPossibleNames": [],
        "logicalName": "DISTRICTSTATEID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SchoolLocalID",
        "otherPossibleNames": [],
        "logicalName": "SCHOOLLOCALID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SchoolStateID",
        "otherPossibleNames": [],
        "logicalName": "SCHOOLSTATEID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 10,
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
          "columnNum": 14
        },
        "fieldLength": 80,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CourseNumber",
        "otherPossibleNames": [],
        "logicalName": "COURSENUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CourseName",
        "otherPossibleNames": [],
        "logicalName": "COURSENAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ClassNumber",
        "otherPossibleNames": [],
        "logicalName": "CLASSNUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 50,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherLocalID",
        "otherPossibleNames": [],
        "logicalName": "TEACHERLOCALID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherStateID",
        "otherPossibleNames": [],
        "logicalName": "TEACHERSTATEID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherFirst",
        "otherPossibleNames": [],
        "logicalName": "TEACHERFIRST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherMiddle",
        "otherPossibleNames": [],
        "logicalName": "TEACHERMIDDLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 21
        },
        "fieldLength": 25,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "TeacherLast",
        "otherPossibleNames": [],
        "logicalName": "TEACHERLAST",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 22
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StudentAssessmentID",
        "otherPossibleNames": [],
        "logicalName": "STUDENTASSESSMENTID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 23
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "AssessmentDate",
        "otherPossibleNames": [],
        "logicalName": "TEST_ADMIN_DATE",
        "formatMask": "MM/dd/yy hh:mm:ss",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 19,
        "expectedValues": [],
        "dataTypes": "DATETIME",
        "scale": null
      },
      {
        "physicalName": "GradePlacement",
        "otherPossibleNames": [],
        "logicalName": "GRADEPLACEMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
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
          "columnNum": 26
        },
        "fieldLength": 1,
        "expectedValues": ["K", "1", "2", "3", "4", "5", "6", "7", "8"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ScaledScore",
        "otherPossibleNames": [],
        "logicalName": "SCALEDSCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 27
        },
        "fieldLength": 4,
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 28
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "RaschScore",
        "otherPossibleNames": [],
        "logicalName": "RASCHSCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
        "scale": null
      },
      {
        "physicalName": "UniversalScore",
        "otherPossibleNames": [],
        "logicalName": "UNIVERSALSCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "GradeEquivalent",
        "otherPossibleNames": [],
        "logicalName": "GRADEEQUIVALENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 31
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
        "scale": null
      },
      {
        "physicalName": "PercentileRank",
        "otherPossibleNames": [],
        "logicalName": "PERCENTILERANK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 32
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "NormalCurveEquivalent",
        "otherPossibleNames": [],
        "logicalName": "NORMALCURVEEQUIVALENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 33
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
        "scale": null
      },
      {
        "physicalName": "IRL",
        "otherPossibleNames": [],
        "logicalName": "IRL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 34
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
        "scale": null
      },
      {
        "physicalName": "ORF",
        "otherPossibleNames": [],
        "logicalName": "ORF",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 35
        },
        "fieldLength": 6,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
        "scale": null
      },
      {
        "physicalName": "LowerZPD",
        "otherPossibleNames": [],
        "logicalName": "LOWERZPD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 36
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
        "scale": null
      },
      {
        "physicalName": "UpperZPD",
        "otherPossibleNames": [],
        "logicalName": "UPPERZPD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 37
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
        "scale": null
      },
      {
        "physicalName": "Lexile",
        "otherPossibleNames": [],
        "logicalName": "LEXILE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 38
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "LowerLexileZPD",
        "otherPossibleNames": [],
        "logicalName": "LOWERLEXILEZPD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 39
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "UpperLexileZPD",
        "otherPossibleNames": [],
        "logicalName": "UPPERLEXILEZPD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 40
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "SectionATime",
        "otherPossibleNames": [],
        "logicalName": "SECTIONATIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 41
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "SectionBTime",
        "otherPossibleNames": [],
        "logicalName": "SECTIONBTIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 42
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TotalTime",
        "otherPossibleNames": [],
        "logicalName": "TOTALTIME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 43
        },
        "fieldLength": 4,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      },
      {
        "physicalName": "TotalCorrect",
        "otherPossibleNames": [],
        "logicalName": "TOTALCORRECT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 44
        },
        "fieldLength": 5,
        "expectedValues": [],
        "dataTypes": "DECIMAL",
        "scale": null
      },
      {
        "physicalName": "AssessmentNumber",
        "otherPossibleNames": [],
        "logicalName": "ASSESSMENT_NUMBER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 45
        },
        "fieldLength": 3,
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
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 46
        },
        "fieldLength": 25,
        "expectedValues": ["Enterprise"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WindowName",
        "otherPossibleNames": [],
        "logicalName": "WINDOWNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 47
        },
        "fieldLength": 15,
        "expectedValues": ["", "Fall", "Late Fall", "Spring", "Winter"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "WindowStart",
        "otherPossibleNames": [],
        "logicalName": "WINDOWSTART",
        "formatMask": "MM/dd/yyyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 48
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "WindowEnd",
        "otherPossibleNames": [],
        "logicalName": "WINDOWEND",
        "formatMask": "MM/dd/yyyy",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 49
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "DATE",
        "scale": null
      },
      {
        "physicalName": "ScreeningCategoryGroupAdjustment",
        "otherPossibleNames": [],
        "logicalName": "SCREENINGCATEGORYGROUPADJUSTMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 50
        },
        "fieldLength": 40,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateBenchmarkName",
        "otherPossibleNames": [],
        "logicalName": "STATEBENCHMARKNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 51
        },
        "fieldLength": 10,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateBenchmarkCategoryAdjustment",
        "otherPossibleNames": [],
        "logicalName": "STATEBENCHMARKCATEGORYADJUSTMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 52
        },
        "fieldLength": 10,
        "expectedValues": ["Level 1", "Level 2", "Level 3", "Level 4", ""],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "StateBenchmarkCategoryGroupAdjustment",
        "otherPossibleNames": [],
        "logicalName": "STATEBENCHMARKCATEGORYGROUPADJUSTMENT",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 53
        },
        "fieldLength": 40,
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
          "columnNum": 54
        },
        "fieldLength": 15,
        "expectedValues": ["Active", "Deactivated"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "DeactivationReason",
        "otherPossibleNames": [],
        "logicalName": "DEACTIVATIONREASON",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 55
        },
        "fieldLength": 100,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "GlobalWindow",
        "otherPossibleNames": [],
        "logicalName": "GLOBALWINDOW",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 56
        },
        "fieldLength": 10,
        "expectedValues": ["Fall", "Spring", "Winter"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "ProbableTestType",
        "otherPossibleNames": [],
        "logicalName": "PROBABLETESTTYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 57
        },
        "fieldLength": 2,
        "expectedValues": ["PM", "BM"],
        "dataTypes": "STRING",
        "scale": null
      },
      {
        "physicalName": "CurrentSGP",
        "otherPossibleNames": [],
        "logicalName": "CURRENTSGP",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 58
        },
        "fieldLength": 3,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": null
      }
    ]
  },
  "fileExtensions": [".csv"]
}
