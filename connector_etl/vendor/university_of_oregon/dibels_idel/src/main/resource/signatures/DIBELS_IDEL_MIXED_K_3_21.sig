{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv",
    ".txt"
  ],
  "format": {
    "@type": "Delimited",
    "fieldDelim": ",",
    "quoteDelim": "\"",
    "naturalKey": [
      "STUDENT_LOCAL_ID",
      "ASSESSMENT_DATES"
    ],
    "hasHeader": true,
    "formatName": "DIBELS_IDEL_MIXED_K_3_21",
    "fields": [
      {
        "physicalName": "Last",
        "logicalName": "STUDENT_LAST_NAME",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 1
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "First",
        "logicalName": "STUDENT_FIRST_NAME",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
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
        "physicalName": "Student_ID",
        "logicalName": "STUDENT_LOCAL_ID",
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
        "physicalName": "Secondary_ID",
        "logicalName": "SECONDARY_ID",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 4
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Birth_Date",
        "logicalName": "STUDENT_BIRTHDATE",
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
        "dataTypes": "DATETIME",
        "scale": 0
      },
      {
        "physicalName": "Race_Ethnicity",
        "logicalName": "RACE_ETHNICITY",
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
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Gender",
        "logicalName": "GENDER",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 7
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Free_Reduced_Lunch",
        "logicalName": "FREE_REDUCED_LUNCH",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 8
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Special_Education",
        "logicalName": "SPECIAL_EDUCATION",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Disability_Status_Spec_Ed_Category_Services_Provided",
        "logicalName": "DISABILITY_STATUS_SPEC_ED_CATEGORY_SERVICES_PROVIDED",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Additional_Codes",
        "logicalName": "ADDITIONAL_CODES",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 11
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "DIBELS_Approved_Accommodations",
        "logicalName": "DIBELS_APPROVED_ACCOMMODATIONS",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Year_3rd",
        "logicalName": "YEAR_3RD",
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
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "School_3rd",
        "logicalName": "SCHOOL_3RD",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "School_Institutional_ID_3rd",
        "logicalName": "SCHOOL_INSTITUTIONAL_ID_3RD",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Class_3rd",
        "logicalName": "CLASS_3RD",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Secondary_Class_3rd",
        "logicalName": "SECONDARY_CLASS_3RD",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
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
        "physicalName": "Teacher_3rd",
        "logicalName": "TEACHER_3RD",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 18
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Month",
        "logicalName": "MONTH",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 19
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Week",
        "logicalName": "WEEK",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 20
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Assessment",
        "logicalName": "ASSESSMENT",
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
        "physicalName": "Measure",
        "logicalName": "MEASURE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 22
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Grade Level",
        "logicalName": "GRADE_LEVEL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 23
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Score",
        "logicalName": "SCORE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Phase Line",
        "logicalName": "PHASE_LINE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 2,
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Phase Note",
        "logicalName": "PHASE_NOTE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
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
        "physicalName": "Assessment Dates",
        "logicalName": "ASSESSMENT_DATES",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 27
        },
        "fieldLength": 500,
        "dataTypes": "DATETIME",
        "scale": 0
      },
      {
        "physicalName": "UID",
        "logicalName": "UID",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 28
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "School_UID_3",
        "logicalName": "SCHOOL_UID_3",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "District_UID",
        "logicalName": "DISTRICT_UID",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      }
    ]
  }
}