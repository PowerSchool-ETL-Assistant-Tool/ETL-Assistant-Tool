{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "quoteDelim": "\"",
    "fieldDelim": ",",
    "hasHeader": true,
    "formatName": "COGAT_2122_50COLS",
    "naturalKey": ["STUDENT_ID", "STUDENT_FIRST_NAME", "STUDENT_LAST_NAME", "DATE_TESTED","SCHOOL_NAME"],
    "fields": [
      {
        "physicalName": "Student ID",
        "logicalName": "STUDENT_ID",
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
        "physicalName": "Last Name",
        "logicalName": "STUDENT_LAST_NAME",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 2
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "First Name",
        "logicalName": "STUDENT_FIRST_NAME",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 3
        },
        "fieldLength": 500,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
       "physicalName": "School Name",
       "logicalName": "SCHOOL_NAME",
       "otherPossibleNames": [],
       "formatMask": null,
       "isFieldRequired": "N",
       "canBeNull": "Y",
       "fieldOffset": {
       "offsetStart": 0,
       "offsetEnd": 0,
       "columnNum": 4
       },
       "fieldLength": 500,
       "dataTypes": "STRING",
       "scale": 0
      },
      {
       "physicalName": "School Code",
       "logicalName": "SCHOOL_CODE",
       "otherPossibleNames": [],
       "formatMask": null,
       "isFieldRequired": "N",
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
        "physicalName": "Date of Birth",
        "logicalName": "DATE_OF_BIRTH",
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
        "physicalName": "Date Tested",
        "logicalName": "DATE_TESTED",
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
        "physicalName": "CogAT (GPR) V",
        "logicalName": "GRADE_PERCENTILE_RANK_VERBAL",
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
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CogAT (GPR) Q",
        "logicalName": "GRADE_PERCENTILE_RANK_QUANTITATIVE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 9
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CogAT (GPR) N",
        "logicalName": "GRADE_PERCENTILE_RANK_NONVERBAL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 10
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CogAT (GPR) VQN FULL",
        "logicalName": "GRADE_PERCENTILE_RANK_VQN_FULL",
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
        "physicalName": "CogAT (APR) V",
        "logicalName": "AGE_PERCENTILE_RANK_VERBAL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 12
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CogAT (APR) Q",
        "logicalName": "AGE_PERCENTILE_RANK_QUANTITATIVE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 13
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CogAT (APR) N",
        "logicalName": "AGE_PERCENTILE_RANK_NONVERBAL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 14
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CogAT (APR) VQN FULL",
        "logicalName": "AGE_PERCENTILE_RANK_VQN_FULL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 15
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CogAT (APR) VQN SCREENER ",
        "logicalName": "AGE_PERCENTILE_RANK_VQN_SCREENER",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 16
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CogAT (GPR) VQN SCREENER",
        "logicalName": "GRADE_PERCENTILE_RANK_VQN_SCREENER",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 17
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ITBS Reading",
        "logicalName": "ITBS_READING",
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
        "physicalName": "ITBS Math",
        "logicalName": "ITBS_MATH",
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
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ITBS Science",
        "logicalName": "ITBS_SCIENCE",
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
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ITBS S.S.",
        "logicalName": "ITBS_SS",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 21
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "QRI",
        "logicalName": "QRI",
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
        "physicalName": "TOMAGS",
        "logicalName": "TOMAGS",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 23
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS School General",
        "logicalName": "SIGS_SCHOOL_GENERAL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 24
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS School LA",
        "logicalName": "SIGS_SCHOOL_LA",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 25
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS School Math",
        "logicalName": "SIGS_SCHOOL_MATH",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 26
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS School Science",
        "logicalName": "SIGS_SCHOOL_SCIENCE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 27
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS School Social Studies",
        "logicalName": "SIGS_SCHOOL_SOCIAL_STUDIES",
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
        "physicalName": "SIGS School Creativity",
        "logicalName": "SIGS_SCHOOL_CREATIVITY",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 29
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS School Leadership",
        "logicalName": "SIGS_SCHOOL_LEADERSHIP",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 30
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS Home General",
        "logicalName": "SIGS_HOME_GENERAL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 31
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS Home LA",
        "logicalName": "SIGS_HOME_LA",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 32
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS Home Math",
        "logicalName": "SIGS_HOME_MATH",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 33
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS Home Science",
        "logicalName": "SIGS_HOME_SCIENCE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 34
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS Home Social Studies",
        "logicalName": "SIGS_HOME_SOCIAL_STUDIES",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 35
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS Creativity",
        "logicalName": "SIGS_CREATIVITY",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 36
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SIGS Leadership",
        "logicalName": "SIGS_LEADERSHIP",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 37
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WISC Verbal Comprehension",
        "logicalName": "WISC_VERBAL_COMPREHENSION",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 38
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WISC Visual Spatial",
        "logicalName": "WISC_VISUAL_SPATIAL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 39
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WISC Fluid Reasoning",
        "logicalName": "WISC_FLUID_REASONING",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 40
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WISC Working Memory",
        "logicalName": "WISC_WORKING_MEMORY",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 41
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WISC Processing Speed",
        "logicalName": "WISC_PROCESSING_SPEED",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 42
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WISC Full Scale IQ",
        "logicalName": "WISC_FULL_SCALE_IQ",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 43
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WPPSI Verbal Comprehension",
        "logicalName": "WPPSI_VERBAL_COMPREHENSION",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 44
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WPPSI Visual Spatial",
        "logicalName": "WPPSI_VISUAL_SPATIAL",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 45
        },
        "fieldLength": 0,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WPPSI Fluid Reasoning",
        "logicalName": "WPPSI_FLUID_REASONING",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 46
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WPPSI Working Memory",
        "logicalName": "WPPSI_WORKING_MEMORY",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 47
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WPPSI Processing Speed",
        "logicalName": "WPPSI_PROCESSING_SPEED",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 48
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "WPPSI  Full Scale IQ",
        "logicalName": "WPPSI_FULL_SCALE_IQ",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 49
        },
        "fieldLength": 10,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "PCA School Rating Scale",
        "logicalName": "PCA_SCHOOL_RATING_SCALE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 50
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "PCA Home Rating Scale",
        "logicalName": "PCA_HOME_RATING_SCALE",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 51
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "PCA Creativity Index",
        "logicalName": "PCA_CREATIVITY_INDEX",
        "otherPossibleNames": [],
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
          "columnNum": 52
        },
        "fieldLength": 2,
        "dataTypes": "STRING",
        "scale": 0
      }
    ]
  },
  "fileExtensions": [
    "csv"
  ]
}