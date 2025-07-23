{
    "encoding": "UTF-8",
    "format": {
      "@type": "Delimited",
      "formatName": "ACCESS_GROWTH_2",
      "quoteDelim": "\"",
      "fieldDelim": ",",
      "hasHeader": true,
          "naturalKey": ["TEST_RECORD_YEAR", "TEST_NAME", "REPORTING_DATA_SET", "SUBJECT", "SASID"],
          "fields": [{
                  "physicalName": "CDE_REPORTING_UNIT",
                  "otherPossibleNames": [],
                  "logicalName": "CDE_REPORTING_UNIT",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 1
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "REPORTING_YEAR",
                  "otherPossibleNames": [],
                  "logicalName": "REPORTING_YEAR",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 2
                  },
                  "fieldLength": 4,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "REPORTING_YEAR_SPAN",
                  "otherPossibleNames": [],
                  "logicalName": "REPORTING_YEAR_SPAN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 3
                  },
                  "fieldLength": 10,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "DIST_NUMBER",
                  "otherPossibleNames": [],
                  "logicalName": "DIST_NUMBER",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 4
                  },
                  "fieldLength": 20,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "DIST_NAME",
                  "otherPossibleNames": [],
                  "logicalName": "DIST_NAME",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 5
                  },
                  "fieldLength": 100,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "SCH_NUMBER",
                  "otherPossibleNames": [],
                  "logicalName": "SCH_NUMBER",
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
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "SCH_NAME",
                  "otherPossibleNames": [],
                  "logicalName": "SCH_NAME",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 7
                  },
                  "fieldLength": 100,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "REPORTING_DATA_SET",
                  "otherPossibleNames": [],
                  "logicalName": "REPORTING_DATA_SET",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 8
                  },
                  "fieldLength": 4,
                  "expectedValues": ["DIST", "SCH"],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "PERFORMANCE_INDICATOR",
                  "otherPossibleNames": [],
                  "logicalName": "PERFORMANCE_INDICATOR",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 9
                  },
                  "fieldLength": 10,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "SUBJECT",
                  "otherPossibleNames": [],
                  "logicalName": "SUBJECT",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 10
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "TEST_NAME",
                  "otherPossibleNames": [],
                  "logicalName": "TEST_NAME",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 11
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "TEST_RECORD_YEAR",
                  "otherPossibleNames": [],
                  "logicalName": "TEST_RECORD_YEAR",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 12
                  },
                  "fieldLength": 4,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "INCLUDED_PFWK_CALCS",
                  "otherPossibleNames": [],
                  "logicalName": "INCLUDED_PFWK_CALCS",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 13
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_NO_SGP_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_NO_SGP_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 14
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_NOT_CONTINUOUS_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_NOT_CONTINUOUS_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 15
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_TEST_INVALID_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_TEST_INVALID_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 16
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_EXPELLED_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_EXPELLED_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 17
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_GRADE_LEVEL_VOID_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_GRADE_LEVEL_VOID_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 18
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_DETENTION_FACILITY_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_DETENTION_FACILITY_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 19
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_HOME_OPTIONS_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_HOME_OPTIONS_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 20
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_OFF_GRADE_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_OFF_GRADE_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 21
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_DISTRICT_VOID_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_DISTRICT_VOID_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 22
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXCLUDED_ENGLISH_PROF_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXCLUDED_ENGLISH_PROF_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 23
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EMH_LEVEL",
                  "otherPossibleNames": [],
                  "logicalName": "EMH_LEVEL",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 24
                  },
                  "fieldLength": 30,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "GRADE_LEVEL",
                  "otherPossibleNames": [],
                  "logicalName": "GRADE_LEVEL",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 25
                  },
                  "fieldLength": 2,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "SASID",
                  "otherPossibleNames": [],
                  "logicalName": "SASID",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 26
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "LAST_NAME",
                  "otherPossibleNames": [],
                  "logicalName": "LAST_NAME",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 27
                  },
                  "fieldLength": 100,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "FIRST_NAME",
                  "otherPossibleNames": [],
                  "logicalName": "FIRST_NAME",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 28
                  },
                  "fieldLength": 100,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "MIDDLE_NAME",
                  "otherPossibleNames": [],
                  "logicalName": "MIDDLE_NAME",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 29
                  },
                  "fieldLength": 100,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "GENDER",
                  "otherPossibleNames": [],
                  "logicalName": "GENDER",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 30
                  },
                  "fieldLength": 1,
                  "expectedValues": ["F", "M", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "ETHNICITY_CODE",
                  "otherPossibleNames": [],
                  "logicalName": "ETHNICITY_CODE",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 31
                  },
                  "fieldLength": 1,
                  "expectedValues": ["1", "2", "3", "4", "5", "6", "7","01","02","03","04","05","06","07", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "MINORITY_YN",
                  "otherPossibleNames": [],
                  "logicalName": "MINORITY_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 32
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "LANG_PROF_CODE",
                  "otherPossibleNames": [],
                  "logicalName": "LANG_PROF_CODE",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 33
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "ELL_YN",
                  "otherPossibleNames": [],
                  "logicalName": "ELL_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 34
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "IEP_YN",
                  "otherPossibleNames": [],
                  "logicalName": "IEP_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 35
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "GIFTED_YN",
                  "otherPossibleNames": [],
                  "logicalName": "GIFTED_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 36
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "FRL_YN",
                  "otherPossibleNames": [],
                  "logicalName": "FRL_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 37
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "TITLE_I_YN",
                  "otherPossibleNames": [],
                  "logicalName": "TITLE_I_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 38
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "MIGRANT_YN",
                  "otherPossibleNames": [],
                  "logicalName": "MIGRANT_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 39
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "EXPELLED_YN",
                  "otherPossibleNames": [],
                  "logicalName": "EXPELLED_YN",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 40
                  },
                  "fieldLength": 1,
                  "expectedValues": ["Y", "N", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "DID_NOT_TEST_CODE",
                  "otherPossibleNames": [],
                  "logicalName": "DID_NOT_TEST_CODE",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 41
                  },
                  "fieldLength": 10,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "DID_NOT_TEST_TEXT",
                  "otherPossibleNames": [],
                  "logicalName": "DID_NOT_TEST_TEXT",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 42
                  },
                  "fieldLength": 200,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "CONTINUOUS_DISTRICT",
                  "otherPossibleNames": [],
                  "logicalName": "CONTINUOUS_DISTRICT",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 43
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "CONTINUOUS_SCHOOL",
                  "otherPossibleNames": [],
                  "logicalName": "CONTINUOUS_SCHOOL",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 44
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "SCALE_SCORE",
                  "otherPossibleNames": [],
                  "logicalName": "SCALE_SCORE",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 45
                  },
                  "fieldLength": 20,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "PROFICIENCY_LEVEL",
                  "otherPossibleNames": [],
                  "logicalName": "PROFICIENCY_LEVEL",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 46
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "AYFEP",
                  "otherPossibleNames": [],
                  "logicalName": "AYFEP",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 47
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "PRIOR_YR_SCALE_SCORE",
                  "otherPossibleNames": [],
                  "logicalName": "PRIOR_YR_SCALE_SCORE",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 48
                  },
                  "fieldLength": 20,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "PRIOR_YR_PROF_LEVEL",
                  "otherPossibleNames": [],
                  "logicalName": "PRIOR_YR_PROF_LEVEL",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 49
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "PRIOR_YR_AYFEP",
                  "otherPossibleNames": [],
                  "logicalName": "PRIOR_YR_AYFEP",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 50
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "PRIOR_YR_SCORE_HISTORY",
                  "otherPossibleNames": [],
                  "logicalName": "PRIOR_YR_SCORE_HISTORY",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 51
                  },
                  "fieldLength": 50,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "SGP",
                  "otherPossibleNames": [],
                  "logicalName": "SGP",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 52
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "AGP",
                  "otherPossibleNames": [],
                  "logicalName": "AGP",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 53
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "ON_TRACK_CATCH_UP_TO_L2",
                  "otherPossibleNames": [],
                  "logicalName": "ON_TRACK_CATCH_UP_TO_L2",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 54
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "ON_TRACK_CATCH_UP_TO_L3",
                  "otherPossibleNames": [],
                  "logicalName": "ON_TRACK_CATCH_UP_TO_L3",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 55
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "ON_TRACK_CATCH_UP_TO_L4",
                  "otherPossibleNames": [],
                  "logicalName": "ON_TRACK_CATCH_UP_TO_L4",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 56
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "ON_TRACK_KEEP_UP_AT_L4",
                  "otherPossibleNames": [],
                  "logicalName": "ON_TRACK_KEEP_UP_AT_L4",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 57
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "ON_TRACK_KEEP_UP_AT_L5",
                  "otherPossibleNames": [],
                  "logicalName": "ON_TRACK_KEEP_UP_AT_L5",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 58
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "CATCH_UP",
                  "otherPossibleNames": [],
                  "logicalName": "CATCH_UP",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 59
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "KEEP_UP",
                  "otherPossibleNames": [],
                  "logicalName": "KEEP_UP",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 60
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "ON_TRACK",
                  "otherPossibleNames": [],
                  "logicalName": "ON_TRACK",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 61
                  },
                  "fieldLength": 1,
                  "expectedValues": ["0", "1", " ", ""],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L2_TARGET_0",
                  "otherPossibleNames": [],
                  "logicalName": "L2_TARGET_0",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 62
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L3_TARGET_0",
                  "otherPossibleNames": [],
                  "logicalName": "L3_TARGET_0",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 63
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L4_TARGET_0",
                  "otherPossibleNames": [],
                  "logicalName": "L4_TARGET_0",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 64
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L5_TARGET_0",
                  "otherPossibleNames": [],
                  "logicalName": "L5_TARGET_0",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 65
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L6_TARGET_0",
                  "otherPossibleNames": [],
                  "logicalName": "L6_TARGET_0",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 66
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L2_TARGET_1",
                  "otherPossibleNames": [],
                  "logicalName": "L2_TARGET_1",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 67
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L3_TARGET_1",
                  "otherPossibleNames": [],
                  "logicalName": "L3_TARGET_1",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 68
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L4_TARGET_1",
                  "otherPossibleNames": [],
                  "logicalName": "L4_TARGET_1",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 69
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L5_TARGET_1",
                  "otherPossibleNames": [],
                  "logicalName": "L5_TARGET_1",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 70
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L6_TARGET_1",
                  "otherPossibleNames": [],
                  "logicalName": "L6_TARGET_1",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 71
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L2_TARGET_2",
                  "otherPossibleNames": [],
                  "logicalName": "L2_TARGET_2",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 72
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L3_TARGET_2",
                  "otherPossibleNames": [],
                  "logicalName": "L3_TARGET_2",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 73
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L4_TARGET_2",
                  "otherPossibleNames": [],
                  "logicalName": "L4_TARGET_2",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 74
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L5_TARGET_2",
                  "otherPossibleNames": [],
                  "logicalName": "L5_TARGET_2",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 75
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L6_TARGET_2",
                  "otherPossibleNames": [],
                  "logicalName": "L6_TARGET_2",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 76
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L2_TARGET_3",
                  "otherPossibleNames": [],
                  "logicalName": "L2_TARGET_3",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 77
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L3_TARGET_3",
                  "otherPossibleNames": [],
                  "logicalName": "L3_TARGET_3",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 78
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L4_TARGET_3",
                  "otherPossibleNames": [],
                  "logicalName": "L4_TARGET_3",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 79
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L5_TARGET_3",
                  "otherPossibleNames": [],
                  "logicalName": "L5_TARGET_3",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 80
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                  "physicalName": "L6_TARGET_3",
                  "otherPossibleNames": [],
                  "logicalName": "L6_TARGET_3",
                  "formatMask": null,
                  "isFieldRequired": "Y",
                  "canBeNull": "Y",
                  "fieldOffset": {
                      "offsetStart": 0,
                      "offsetEnd": 0,
                      "columnNum": 81
                  },
                  "fieldLength": 3,
                  "expectedValues": [],
                  "dataTypes": "STRING",
                  "scale": 0.0
              },
              {
                 "physicalName": "SGP_BASELINE",
                 "otherPossibleNames": [],
                 "logicalName": "SGP_BASELINE",
                 "formatMask": null,
                 "isFieldRequired": "N",
                 "canBeNull": "Y",
                 "fieldOffset": {
                     "offsetStart": 0,
                     "offsetEnd": 0,
                     "columnNum": 82
                 },
                 "fieldLength": 3,
                 "expectedValues": [],
                 "dataTypes": "STRING",
                 "scale": 0.0
               }
          ]
      },
      "fileExtensions": [".csv"]
  }