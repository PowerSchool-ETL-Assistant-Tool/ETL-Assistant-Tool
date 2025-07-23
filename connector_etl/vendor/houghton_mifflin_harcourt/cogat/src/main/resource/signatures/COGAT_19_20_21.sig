{
      "encoding": "UTF-8",
      "format": {
        "@type": "Delimited",
        "quoteDelim": "\"",
        "fieldDelim": ",",
        "hasHeader": true,
        "formatName": "COGAT_19_20_21",
		"naturalKey": ["STUDENT_ID", "STUDENT_FIRST_NAME", "STUDENT_LAST_NAME", "DATE_OF_BIRTH"],
		"fields": [
  {
    "physicalName": "DISTRICT_SCHOOL_ID",
    "otherPossibleNames": [],
    "logicalName": "DISTRICT_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 1
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "MARSS",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_ID",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 2
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "STATE_SCHOOL_ID",
    "otherPossibleNames": [],
    "logicalName": "STATE_SCHOOL_ID",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 3
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "DistrictName",
    "otherPossibleNames": [],
    "logicalName": "DISTRICT",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 4
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "BuildingID",
    "otherPossibleNames": [],
    "logicalName": "BUILDING_CODE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 5
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "TEST_STUDENT_GRADE",
    "otherPossibleNames": [],
    "logicalName": "CLASS_GRADE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 6
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "TEST_TEACHER",
    "otherPossibleNames": [],
    "logicalName": "TEST_TEACHER",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 7
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "STUDENT_LAST_NAME",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_LAST_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 8
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "STUDENT_FIRST_NAME",
    "otherPossibleNames": [],
    "logicalName": "STUDENT_FIRST_NAME",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 9
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "STUDENT_BIRTHDATE_STR",
    "otherPossibleNames": [],
    "logicalName": "DATE_OF_BIRTH",
    "formatMask": "",
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
    "scale": 0
  },
  {
    "physicalName": "TestDate",
    "otherPossibleNames": [],
    "logicalName": "DATE_TESTED",
    "formatMask": "",
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
    "scale": 0
  },
  {
    "physicalName": "Season",
    "otherPossibleNames": [],
    "logicalName": "SEASON",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 12
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "CogATLevel",
    "otherPossibleNames": [],
    "logicalName": "LEVEL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 13
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "STUDENT_RACE_CAODE",
    "otherPossibleNames": ["STUDENT_RACE_CODE","XTBL_TEST_ADMIN.STUDENT_RACE_CODE"],
    "logicalName": "ETHNICITY_STRING",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 14
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "Gender",
    "otherPossibleNames": ["STUDENT_GENDER_CODE"],
    "logicalName": "GENDER",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 15
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": 0
  },
  {
    "physicalName": "VERBAL_VerbalRS",
    "otherPossibleNames": [],
    "logicalName": "RAW_SCORE_VERBAL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 16
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "QUANTITATIVE_QuantitativeRS",
    "otherPossibleNames": [],
    "logicalName": "RAW_SCORE_QUANTITATIVE",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 17
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "NONVERBAL_NonverbalRS",
    "otherPossibleNames": [],
    "logicalName": "RAW_SCORE_NONVERBAL",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 18
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "COMPOSITE_TotalScreeningRS",
    "otherPossibleNames": [],
    "logicalName": "RAW_SCORE_VQN",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 19
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "UNIVERSAL_SCALE_SCORE_TotalUSS",
    "otherPossibleNames": [],
    "logicalName": "UNIVERSAL_SCALE_SCORE_VQN",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 20
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  },
  {
    "physicalName": "LOCAL_PERCENTILE_RANK_TotalLPR",
    "otherPossibleNames": [],
    "logicalName": "LOCAL_PERCENTILE_RANK_VQN",
    "formatMask": "",
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 21
    },
    "fieldLength": 5,
    "expectedValues": [],
    "dataTypes": "INTEGER",
    "scale": 0
  }
]},
	"fileExtensions": ["csv"]
}
