{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".txt"
  ],
  "format": {
    "@type": "Delimited",
    "formatName": "ELPAC_INITIAL_23_24_FW_288",
    "quoteDelim": "\"",
    "fieldDelim": "\t",
    "recordLength": "",
    "hasHeader": true,
    "naturalKey": ["UIN","SSID","ELENTRYDATE"],
    "fields": [
      {
        "physicalName": "RecordType",
        "otherPossibleNames": ["Record Type"],
        "logicalName": "ASSESSMENT_TYPE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 1,
          "offsetEnd": 2,
          "columnNum": 1
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "UIN",
        "otherPossibleNames": ["UIN (Unique Identification Number)"],
        "logicalName": "UIN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 3,
          "offsetEnd": 18,
          "columnNum": 2
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 19,
          "offsetEnd": 34,
          "columnNum": 3
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SSID",
        "otherPossibleNames": ["Statewide Student Identifier (SSID)"],
        "logicalName": "STUDENT_STATE_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 35,
          "offsetEnd": 44,
          "columnNum": 4
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "LocalStudentID",
        "otherPossibleNames": ["Student ID Number (Local ID)"],
        "logicalName": "STUDENT_LOCAL_ID",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 45,
          "offsetEnd": 59,
          "columnNum": 5
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "StudentLastName",
        "otherPossibleNames": [" Student Last Name"],
        "logicalName": "STUDENT_LAST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 60,
          "offsetEnd": 109,
          "columnNum": 6
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentFirstName",
        "otherPossibleNames": ["Student First Name"],
        "logicalName": "STUDENT_FIRST_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 110,
          "offsetEnd": 139,
          "columnNum": 7
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentMiddleName",
        "otherPossibleNames": ["Student Middle Name"],
        "logicalName": "STUDENT_MIDDLE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 140,
          "offsetEnd": 169,
          "columnNum": 8
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 170,
          "offsetEnd": 171,
          "columnNum": 9
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "DateofBirthforTesting",
        "otherPossibleNames": ["Date of Birth"],
        "logicalName": "DATE_OF_BIRTH",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 172,
          "offsetEnd": 181,
          "columnNum": 10
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Gender",
        "otherPossibleNames": [],
        "logicalName": "STUDENT_GENDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 182,
          "offsetEnd": 182,
          "columnNum": 11
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CALPADSGrade",
        "otherPossibleNames": ["CALPADS Grade"],
        "logicalName": "CALPADS_GRADE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 183,
          "offsetEnd": 184,
          "columnNum": 12
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "GradeAssessed",
        "otherPossibleNames": ["Grade Assessed"],
        "logicalName": "GRADE_ASSESSED",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 185,
          "offsetEnd": 186,
          "columnNum": 13
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 187,
          "offsetEnd": 189,
          "columnNum": 14
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CALPADSDistrictCode",
        "otherPossibleNames": ["CALPADS District Code"],
        "logicalName": "CALPADS_DISTRICT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 190,
          "offsetEnd": 203,
          "columnNum": 15
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "CALPADSSchoolCode",
        "otherPossibleNames": ["CALPADS School Code"],
        "logicalName": "CALPADS_SCHOOL_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 204,
          "offsetEnd": 217,
          "columnNum": 16
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "CALPADSCharterCode",
        "otherPossibleNames": ["CALPADS Charter Code"],
        "logicalName": "CALPADS_CHARTER_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 218,
          "offsetEnd": 221,
          "columnNum": 17
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "CALPADSCharterSchoolIndicator",
        "otherPossibleNames": ["CALPADS Charter School Indicator"],
        "logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 222,
          "offsetEnd": 223,
          "columnNum": 18
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SPEDACCTDist",
        "otherPossibleNames": ["Special Education District of Accountability"],
        "logicalName": "SPECIAL_EDUCATION_DISTRICT_OF_ACCOUNTABILITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 224,
          "offsetEnd": 230,
          "columnNum": 19
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "CALPADSNPSSchoolFlag",
        "otherPossibleNames": ["NPS School Flag"],
        "logicalName": "NPS_SCHOOL_FLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 231,
          "offsetEnd": 231,
          "columnNum": 20
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Section504Status",
        "otherPossibleNames": ["Section 504 Status"],
        "logicalName": "SECTION_504_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 232,
          "offsetEnd": 234,
          "columnNum": 21
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CALPADSIDEAIndicator",
        "otherPossibleNames": ["IDEA Indicator"],
        "logicalName": "IDEA_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 235,
          "offsetEnd": 237,
          "columnNum": 22
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "PrimaryDisabilityType",
        "otherPossibleNames": ["CALPADS Primary Disability Type"],
        "logicalName": "PRIMARY_DISABILITY_TYPE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 238,
          "offsetEnd": 240,
          "columnNum": 23
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "MigrantStatus",
        "otherPossibleNames": ["Migrant Status"],
        "logicalName": "MIGRANT_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 241,
          "offsetEnd": 243,
          "columnNum": 24
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ELEntryDate",
        "otherPossibleNames": ["EL Entry Date"],
        "logicalName": "EL_ENTRY_DATE",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 244,
          "offsetEnd": 253,
          "columnNum": 25
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FirstEntryDateInUSSchool",
        "otherPossibleNames": ["First Entry Date in US School"],
        "logicalName": "FIRST_ENTRY_DATE_IN_US_SCHOOL",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 254,
          "offsetEnd": 263,
          "columnNum": 26
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CalculatedELAS",
        "otherPossibleNames": ["Calculated English Language Acquisition Status"],
        "logicalName": "CALCULATED_ENGLISH_LANGUAGE_ACQUISITION_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 264,
          "offsetEnd": 267,
          "columnNum": 27
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EnrollmentEffectiveDate",
        "otherPossibleNames": ["Enrollment Effective Date"],
        "logicalName": "ENROLLMENT_EFFECTIVE_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 268,
          "offsetEnd": 277,
          "columnNum": 28
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ELASforTesting",
        "otherPossibleNames": ["English Language Acquisition Status"],
        "logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 278,
          "offsetEnd": 280,
          "columnNum": 29
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "PrimaryLanguageforTesting",
        "otherPossibleNames": ["Primary Language"],
        "logicalName": "LANGUAGE_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 281,
          "offsetEnd": 283,
          "columnNum": 30
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "CEDSLanguageCode",
        "otherPossibleNames": ["Language Code (CEDS)"],
        "logicalName": "LANGUAGE_CODE_CEDS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 284,
          "offsetEnd": 286,
          "columnNum": 31
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "MilitaryStatus",
        "otherPossibleNames": ["Military Status"],
        "logicalName": "MILITARY_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 287,
          "offsetEnd": 289,
          "columnNum": 32
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FosterStatus",
        "otherPossibleNames": ["Foster Status"],
        "logicalName": "FOSTER_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 290,
          "offsetEnd": 292,
          "columnNum": 33
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "HomelessStatus",
        "otherPossibleNames": ["Homeless Status"],
        "logicalName": "HOMELESS_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 293,
          "offsetEnd": 295,
          "columnNum": 34
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EconomicDisadvantageStatus",
        "otherPossibleNames": ["CALPADS Economic Disadvantage Status"],
        "logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 296,
          "offsetEnd": 298,
          "columnNum": 35
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "HispanicorLatino",
        "otherPossibleNames": ["Hispanic or Latino"],
        "logicalName": "HISPANIC_OR_LATINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 299,
          "offsetEnd": 301,
          "columnNum": 36
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "AmericanIndianorAlaskaNative",
        "otherPossibleNames": ["American Indian or Alaska Native"],
        "logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 302,
          "offsetEnd": 304,
          "columnNum": 37
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Asian",
        "otherPossibleNames": [],
        "logicalName": "ASIAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 305,
          "offsetEnd": 307,
          "columnNum": 38
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "BlackorAfricanAmerican",
        "otherPossibleNames": ["Black or African American"],
        "logicalName": "BLACK_OR_AFRICAN_AMERICAN",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 308,
          "offsetEnd": 310,
          "columnNum": 39
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "White",
        "otherPossibleNames": [],
        "logicalName": "WHITE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 311,
          "offsetEnd": 313,
          "columnNum": 40
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "HawaiianorOtherPacificIslander",
        "otherPossibleNames": ["Native Hawaiian or Other Pacific Islander"],
        "logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 314,
          "offsetEnd": 316,
          "columnNum": 41
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Filipino",
        "otherPossibleNames": [],
        "logicalName": "FILIPINO",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 317,
          "offsetEnd": 319,
          "columnNum": 42
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TwoorMoreRaces",
        "otherPossibleNames": ["Two or More Races"],
        "logicalName": "TWO_OR_MORE_RACES",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 320,
          "offsetEnd": 322,
          "columnNum": 43
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ReportingEthnicity",
        "otherPossibleNames": ["Reporting Ethnicity"],
        "logicalName": "REPORTING_ETHNICITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 323,
          "offsetEnd": 325,
          "columnNum": 44
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "ParentEducationLevel",
        "otherPossibleNames": ["Parent Education Level"],
        "logicalName": "PARENT_EDUCATION_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 326,
          "offsetEnd": 327,
          "columnNum": 45
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "StudentAddressLine1",
        "otherPossibleNames": ["Student Address Line 1"],
        "logicalName": "STUDENT_ADDRESS_LINE_1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 328,
          "offsetEnd": 387,
          "columnNum": 46
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentAddressLine2",
        "otherPossibleNames": ["Student Address Line 2"],
        "logicalName": "STUDENT_ADDRESS_LINE_2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 388,
          "offsetEnd": 447,
          "columnNum": 47
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentAddressCityName",
        "otherPossibleNames": ["Student Address City"],
        "logicalName": "STUDENT_ADDRESS_CITY",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 448,
          "offsetEnd": 507,
          "columnNum": 48
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentAddressStateName",
        "otherPossibleNames": ["Student State Name"],
        "logicalName": "STUDENT_STATE_NAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 508,
          "offsetEnd": 513,
          "columnNum": 49
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentAddressZipCode",
        "otherPossibleNames": ["Student Zip Code"],
        "logicalName": "STUDENT_ZIP_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 514,
          "offsetEnd": 525,
          "columnNum": 50
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "ScoreAvailableDate",
        "otherPossibleNames": ["Score Available Date"],
        "logicalName": "SCORE_AVAILABLE_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 526,
          "offsetEnd": 535,
          "columnNum": 51
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedStatus",
        "otherPossibleNames": ["Tested Status"],
        "logicalName": "TESTED_STATUS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 536,
          "offsetEnd": 536,
          "columnNum": 52
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedDistrictName1",
        "otherPossibleNames": ["Tested LEA Name 1—Listening"],
        "logicalName": "TESTED_LEA_NAME_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 537,
          "offsetEnd": 636,
          "columnNum": 53
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedDistrictCode1",
        "otherPossibleNames": ["Tested County-District Code 1—Listening"],
        "logicalName": "TESTED_COUNTY_DISTRICT_CODE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 637,
          "offsetEnd": 650,
          "columnNum": 54
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolName1",
        "otherPossibleNames": ["Tested School Name 1—Listening"],
        "logicalName": "TESTED_SCHOOL_NAME_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 651,
          "offsetEnd": 750,
          "columnNum": 55
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolCode1",
        "otherPossibleNames": ["Tested School Code 1—Listening"],
        "logicalName": "TESTED_SCHOOL_CODE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 751,
          "offsetEnd": 764,
          "columnNum": 56
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolIndicator1",
        "otherPossibleNames": ["Tested Charter School Indicator 1—Listening"],
        "logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 765,
          "offsetEnd": 766,
          "columnNum": 57
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedCharterCode1",
        "otherPossibleNames": ["Tested Charter School Code 1—Listening"],
        "logicalName": "TESTED_CHARTER_SCHOOL_CODE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 767,
          "offsetEnd": 770,
          "columnNum": 58
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolNPSFlag1",
        "otherPossibleNames": ["Tested School NPS Flag 1—Listening"],
        "logicalName": "TESTED_SCHOOL_NPS_FLAG_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 771,
          "offsetEnd": 771,
          "columnNum": 59
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestStartDate1",
        "otherPossibleNames": ["Test Start Date 1—Listening"],
        "logicalName": "TESTING_START_DATE_LISTENING",
        "formatMask": "yyyy-MM-dd",
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 772,
          "offsetEnd": 781,
          "columnNum": 60
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestCompletedDate1",
        "otherPossibleNames": ["Testing Completed Date 1—Listening"],
        "logicalName": "TESTING_COMPLETED_DATE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 782,
          "offsetEnd": 791,
          "columnNum": 61
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedDistrictName2",
        "otherPossibleNames": ["Tested LEA Name 2—Speaking"],
        "logicalName": "TESTED_LEA_NAME_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 792,
          "offsetEnd": 891,
          "columnNum": 62
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedDistrictCode2",
        "otherPossibleNames": ["Tested County-District Code 2—Speaking"],
        "logicalName": "TESTED_COUNTY_DISTRICT_CODE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 892,
          "offsetEnd": 905,
          "columnNum": 63
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolName2",
        "otherPossibleNames": ["Tested School Name 2—Speaking"],
        "logicalName": "TESTED_SCHOOL_NAME_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 906,
          "offsetEnd": 1005,
          "columnNum": 64
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolCode2",
        "otherPossibleNames": ["Tested School Code 2—Speaking"],
        "logicalName": "TESTED_SCHOOL_CODE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1006,
          "offsetEnd": 1019,
          "columnNum": 65
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedCharterSchoolIndicator2",
        "otherPossibleNames": ["Tested Charter School Indicator 2—Speaking"],
        "logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1020,
          "offsetEnd": 1021,
          "columnNum": 66
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedCharterCode2",
        "otherPossibleNames": ["Tested Charter School Code 2—Speaking"],
        "logicalName": "TESTED_CHARTER_SCHOOL_CODE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1022,
          "offsetEnd": 1025,
          "columnNum": 67
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolSchoolNPSFlag2",
        "otherPossibleNames": ["Tested School NPS Flag 2—Speaking"],
        "logicalName": "TESTED_SCHOOL_NPS_FLAG_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1026,
          "offsetEnd": 1026,
          "columnNum": 68
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestStartDate2",
        "otherPossibleNames": ["Test Start Date 2—Speaking"],
        "logicalName": "TESTING_START_DATE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1027,
          "offsetEnd": 1036,
          "columnNum": 69
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestCompletedDate2",
        "otherPossibleNames": ["Testing Completed Date 2—Speaking"],
        "logicalName": "TESTING_COMPLETED_DATE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1037,
          "offsetEnd": 1046,
          "columnNum": 70
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedDistrictName3",
        "otherPossibleNames": ["Tested LEA Name 3—Reading"],
        "logicalName": "TESTED_LEA_NAME_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1047,
          "offsetEnd": 1146,
          "columnNum": 71
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedDistrictCode3",
        "otherPossibleNames": ["Tested County-District Code 3—Reading"],
        "logicalName": "TESTED_COUNTY_DISTRICT_CODE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1147,
          "offsetEnd": 1160,
          "columnNum": 72
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolName3",
        "otherPossibleNames": ["Tested School Name 3—Reading"],
        "logicalName": "TESTED_SCHOOL_NAME_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1161,
          "offsetEnd": 1260,
          "columnNum": 73
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolCode3",
        "otherPossibleNames": ["Tested School Code 3—Reading"],
        "logicalName": "TESTED_SCHOOL_CODE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1261,
          "offsetEnd": 1274,
          "columnNum": 74
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedCharterSchoolIndicator3",
        "otherPossibleNames": ["Tested Charter School Indicator 3—Reading"],
        "logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1275,
          "offsetEnd": 1276,
          "columnNum": 75
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedCharterCode3",
        "otherPossibleNames": ["Tested Charter School Code 3—Reading"],
        "logicalName": "TESTED_CHARTER_SCHOOL_CODE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1277,
          "offsetEnd": 1280,
          "columnNum": 76
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolNPSFlag3",
        "otherPossibleNames": ["Tested School NPS Flag 3—Reading"],
        "logicalName": "TESTED_SCHOOL_NPS_FLAG_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1281,
          "offsetEnd": 1281,
          "columnNum": 77
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestStartDate3",
        "otherPossibleNames": ["Test Start Date 3—Reading"],
        "logicalName": "TESTING_START_DATE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1282,
          "offsetEnd": 1291,
          "columnNum": 78
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestCompletedDate3",
        "otherPossibleNames": ["Testing Completed Date 3—Reading"],
        "logicalName": "TESTING_COMPLETED_DATE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1292,
          "offsetEnd": 1301,
          "columnNum": 79
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedDistrictName4",
        "otherPossibleNames": ["Tested LEA Name 4—Writing"],
        "logicalName": "TESTED_LEA_NAME_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1302,
          "offsetEnd": 1401,
          "columnNum": 80
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedDistrictCode4",
        "otherPossibleNames": ["Tested County-District Code 4—Writing"],
        "logicalName": "TESTED_COUNTY_DISTRICT_CODE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1402,
          "offsetEnd": 1415,
          "columnNum": 81
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolName4",
        "otherPossibleNames": ["Tested School Name 4—Writing"],
        "logicalName": "TESTED_SCHOOL_NAME_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1416,
          "offsetEnd": 1515,
          "columnNum": 82
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolCode4",
        "otherPossibleNames": ["Tested School Code 4—Writing"],
        "logicalName": "TESTED_SCHOOL_CODE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1516,
          "offsetEnd": 1529,
          "columnNum": 83
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedCharterSchoolIndicator4",
        "otherPossibleNames": ["Tested Charter School Indicator 4—Writing"],
        "logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1530,
          "offsetEnd": 1531,
          "columnNum": 84
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedCharterCode4",
        "otherPossibleNames": ["Tested Charter School Code 4—Writing"],
        "logicalName": "TESTED_CHARTER_SCHOOL_CODE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1532,
          "offsetEnd": 1535,
          "columnNum": 85
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestedSchoolNPSFlag4",
        "otherPossibleNames": ["Tested School NPS Flag 4—Writing"],
        "logicalName": "TESTED_SCHOOL_NPS_FLAG_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1536,
          "offsetEnd": 1536,
          "columnNum": 86
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestStartDate4",
        "otherPossibleNames": ["Test Start Date 4—Writing"],
        "logicalName": "TESTING_START_DATE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1537,
          "offsetEnd": 1546,
          "columnNum": 87
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestCompletedDate4",
        "otherPossibleNames": ["Testing Completed Date 4—Writing"],
        "logicalName": "TESTING_COMPLETED_DATE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1547,
          "offsetEnd": 1557,
          "columnNum": 88
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FinalTestedDistrictName",
        "otherPossibleNames": ["Final Tested LEA Name"],
        "logicalName": "FINALTESTEDDISTRICTNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1558,
          "offsetEnd": 1657,
          "columnNum": 89
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FinalTestedDistrictCode",
        "otherPossibleNames": ["Final Tested County-District Code"],
        "logicalName": "FINALTESTEDDISTRICTCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1658,
          "offsetEnd": 1671,
          "columnNum": 90
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FinalTestedSchoolName",
        "otherPossibleNames": ["Final Tested School Name"],
        "logicalName": "FINALTESTEDSCHOOLNAME",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1672,
          "offsetEnd": 1771,
          "columnNum": 91
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FinalTestedSchoolCode",
        "otherPossibleNames": ["Final Tested School Code"],
        "logicalName": "FINALTESTEDSCHOOLCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1772,
          "offsetEnd": 1785,
          "columnNum": 92
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FinalTestedCharterSchoolIndicator",
        "otherPossibleNames": ["Final Tested Charter School Indicator"],
        "logicalName": "FINALTESTEDCHARTERSCHOOLINDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1786,
          "offsetEnd": 1787,
          "columnNum": 93
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FinalTestedCharterCode",
        "otherPossibleNames": ["Final Tested Charter Code"],
        "logicalName": "FINALTESTEDCHARTERCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1788,
          "offsetEnd": 1791,
          "columnNum": 94
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FinalTestedSchoolNPSFlag",
        "otherPossibleNames": ["Final Tested School NPS Flag"],
        "logicalName": "FINALTESTEDSCHOOLNPSFLAG",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1792,
          "offsetEnd": 1792,
          "columnNum": 95
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "FinalTestCompletedDate",
        "otherPossibleNames": ["Final Test Completed Date"],
        "logicalName": "FINALTESTCOMPLETEDDATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1793,
          "offsetEnd": 1802,
          "columnNum": 96
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OpportunityID1",
        "otherPossibleNames": ["Opportunity ID—Listening"],
        "logicalName": "OPPORTUNITY_ID_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1803,
          "offsetEnd": 1818,
          "columnNum": 97
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OpportunityTestingStatus1",
        "otherPossibleNames": ["Opportunity Testing Status—Listening"],
        "logicalName": "OPPORTUNITY_TESTING_STATUS_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1819,
          "offsetEnd": 1819,
          "columnNum": 98
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OpportunityID2",
        "otherPossibleNames": ["Opportunity ID—Speaking"],
        "logicalName": "OPPORTUNITY_ID_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1820,
          "offsetEnd": 1835,
          "columnNum": 99
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OpportunityTestingStatus2",
        "otherPossibleNames": ["Opportunity Testing Status—Speaking"],
        "logicalName": "OPPORTUNITY_TESTING_STATUS_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1836,
          "offsetEnd": 1836,
          "columnNum": 100
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OpportunityID3",
        "otherPossibleNames": ["Opportunity ID—Reading"],
        "logicalName": "OPPORTUNITY_ID_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1837,
          "offsetEnd": 1852,
          "columnNum": 101
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OpportunityTestingStatus3",
        "otherPossibleNames": ["Opportunity Testing Status—Reading"],
        "logicalName": "OPPORTUNITY_TESTING_STATUS_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1853,
          "offsetEnd": 1853,
          "columnNum": 102
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OpportunityID4",
        "otherPossibleNames": ["Opportunity ID—Writing"],
        "logicalName": "OPPORTUNITY_ID_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1854,
          "offsetEnd": 1869,
          "columnNum": 103
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OpportunityTestingStatus4",
        "otherPossibleNames": ["Opportunity Testing Status—Writing"],
        "logicalName": "OPPORTUNITY_TESTING_STATUS_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1870,
          "offsetEnd": 1870,
          "columnNum": 104
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentExitCode",
        "otherPossibleNames": ["Student Exit Code"],
        "logicalName": "STUDENT_EXIT_CODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1871,
          "offsetEnd": 1874,
          "columnNum": 105
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentExitWithdrawalDate",
        "otherPossibleNames": ["Student Exit Withdrawal Date"],
        "logicalName": "STUDENT_EXIT_WITHDRAWAL_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1875,
          "offsetEnd": 1884,
          "columnNum": 106
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "StudentRemovedCALPADSFileDate",
        "otherPossibleNames": ["Student Removed from CALPADS File Date"],
        "logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1885,
          "offsetEnd": 1894,
          "columnNum": 107
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ELASCorrectionCode",
        "otherPossibleNames": ["ELAS Correction Code"],
        "logicalName": "ELASCORRECTIONCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1895,
          "offsetEnd": 1895,
          "columnNum": 108
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ConditionCode",
        "otherPossibleNames": [" Condition Code"],
        "logicalName": "CONDITIONCODE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1896,
          "offsetEnd": 1898,
          "columnNum": 109
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Attemptedness",
        "otherPossibleNames": [],
        "logicalName": "ATTEMPTEDNESS",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1899,
          "offsetEnd": 1899,
          "columnNum": 110
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "IncludeIndicator",
        "otherPossibleNames": ["Include Indicator"],
        "logicalName": "INCLUDE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1900,
          "offsetEnd": 1900,
          "columnNum": 111
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "UnlistedResource1",
        "otherPossibleNames": ["Unlisted Resources—Listening"],
        "logicalName": "UNLISTED_RESOURCES_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1901,
          "offsetEnd": 1901,
          "columnNum": 112
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "UnlistedResource2",
        "otherPossibleNames": ["Unlisted Resources—Speaking"],
        "logicalName": "UNLISTED_RESOURCES_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1902,
          "offsetEnd": 1902,
          "columnNum": 113
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "UnlistedResource3",
        "otherPossibleNames": ["Unlisted Resources—Reading"],
        "logicalName": "UNLISTED_RESOURCES_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1903,
          "offsetEnd": 1903,
          "columnNum": 114
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "UnlistedResource4",
        "otherPossibleNames": ["Unlisted Resources—Writing"],
        "logicalName": "UNLISTED_RESOURCES_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1904,
          "offsetEnd": 1904,
          "columnNum": 115
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "SSREligible",
        "otherPossibleNames": ["SSR Eligible"],
        "logicalName": "SSRELIGIBLE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1905,
          "offsetEnd": 1905,
          "columnNum": 116
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RemoteTester1",
        "otherPossibleNames": ["Remote Tester 1—Listening"],
        "logicalName": "RemoteTester1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1906,
          "offsetEnd": 1906,
          "columnNum": 117
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RemoteTester2",
        "otherPossibleNames": ["Remote Tester 2—Speaking"],
        "logicalName": "RemoteTester2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1907,
          "offsetEnd": 1907,
          "columnNum": 118
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RemoteTester3",
        "otherPossibleNames": ["Remote Tester 3—Reading"],
        "logicalName": "RemoteTester3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1908,
          "offsetEnd": 1908,
          "columnNum": 119
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RemoteTester4",
        "otherPossibleNames": ["Remote Tester 4—Writing"],
        "logicalName": "RemoteTester4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1909,
          "offsetEnd": 1909,
          "columnNum": 120
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ForceComplete",
        "otherPossibleNames": ["Force Complete"],
        "logicalName": "ForceComplete",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1910,
          "offsetEnd": 1910,
          "columnNum": 121
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestMode1",
        "otherPossibleNames": ["Test Mode—Listening"],
        "logicalName": "TEST_MODE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1911,
          "offsetEnd": 1911,
          "columnNum": 122
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestMode2",
        "otherPossibleNames": ["Test Mode—Speaking"],
        "logicalName": "TEST_MODE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1912,
          "offsetEnd": 1912,
          "columnNum": 123
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestMode3",
        "otherPossibleNames": ["Test Mode—Reading"],
        "logicalName": "TEST_MODE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1913,
          "offsetEnd": 1913,
          "columnNum": 124
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "TestMode4",
        "otherPossibleNames": ["Test Mode—Writing"],
        "logicalName": "TEST_MODE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1914,
          "offsetEnd": 1914,
          "columnNum": 125
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "Blank",
        "otherPossibleNames": [],
        "logicalName": "BLANK",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1915,
          "offsetEnd": 1917,
          "columnNum": 126
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RawScore1",
        "otherPossibleNames": ["Raw Score1—Listening"],
        "logicalName": "LISTENING_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1918,
          "offsetEnd": 1919,
          "columnNum": 127
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RawScore2",
        "otherPossibleNames": ["Raw Score2—Speaking"],
        "logicalName": "SPEAKING_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1920,
          "offsetEnd": 1921,
          "columnNum": 128
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RawScore3",
        "otherPossibleNames": ["Raw Score3—Reading"],
        "logicalName": "READING_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1922,
          "offsetEnd": 1923,
          "columnNum": 129
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "RawScore4",
        "otherPossibleNames": ["Raw Score4—Writing"],
        "logicalName": "WRITING_RAW_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1924,
          "offsetEnd": 1925,
          "columnNum": 130
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OverallScaleScore",
        "otherPossibleNames": ["Overall Scale Score"],
        "logicalName": "OVERALL_SCALE_SCORE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1926,
          "offsetEnd": 1929,
          "columnNum": 131
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "OverallPL",
        "otherPossibleNames": ["Overall Performance Level"],
        "logicalName": "OVERALL_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1930,
          "offsetEnd": 1969,
          "columnNum": 132
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "OralLanguagePL",
        "otherPossibleNames": ["Oral Language Performance Level"],
        "logicalName": "ORAL_LANGUAGE_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 1970,
          "offsetEnd": 2001,
          "columnNum": 133
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "WrittenLanguagePL",
        "otherPossibleNames": ["Written Language Performance Level"],
        "logicalName": "WRITTEN_LANGUAGE_PERFORMANCE_LEVEL",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2002,
          "offsetEnd": 2033,
          "columnNum": 134
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "INTEGER",
        "scale": 0
      },
      {
        "physicalName": "DomainEx1",
        "otherPossibleNames": ["Domain Exemption 1"],
        "logicalName": "LISTENING_DOMAIN_EXEMPTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2034,
          "offsetEnd": 2034,
          "columnNum": 135
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "DomainEx2",
        "otherPossibleNames": ["Domain Exemption 2"],
        "logicalName": "SPEAKING_DOMAIN_EXEMPTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2035,
          "offsetEnd": 2035,
          "columnNum": 136
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "DomainEx3",
        "otherPossibleNames": ["Domain Exemption 3"],
        "logicalName": "READING_DOMAIN_EXEMPTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2036,
          "offsetEnd": 2036,
          "columnNum": 137
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "DomainEx4",
        "otherPossibleNames": ["Domain Exemption 4"],
        "logicalName": "WRITING_DOMAIN_EXEMPTION",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2037,
          "offsetEnd": 2037,
          "columnNum": 138
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ItemsAttempted1",
        "otherPossibleNames": ["Number of Items Attempted 1"],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2038,
          "offsetEnd": 2039,
          "columnNum": 139
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ItemsAttempted2",
        "otherPossibleNames": ["Number of Items Attempted 2"],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2040,
          "offsetEnd": 2041,
          "columnNum": 140
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ItemsAttempted3",
        "otherPossibleNames": ["Number of Items Attempted 3"],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2042,
          "offsetEnd": 2043,
          "columnNum": 141
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ItemsAttempted4",
        "otherPossibleNames": ["Number of Items Attempted 4"],
        "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED-WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2044,
          "offsetEnd": 2045,
          "columnNum": 142
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "AccommodationsIndicator",
        "otherPossibleNames": ["Accommodations Available Indicator"],
        "logicalName": "ACCOMMODATIONS_AVAILABLE_INDICATOR_",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2046,
          "offsetEnd": 2048,
          "columnNum": 143
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "DesignatedSupportIndicator",
        "otherPossibleNames": ["Designated Support Available Indicator"],
        "logicalName": "DESIGNATED_SUPPORT_AVAILABLE_INDICATOR",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2049,
          "offsetEnd": 2051,
          "columnNum": 144
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAAmericanSignLanguage1",
        "otherPossibleNames": ["Embedded Accommodations—American Sign Language (Online) (Listening)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-AMERICAN_SIGN_LANGUAGE_ONLINE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2052,
          "offsetEnd": 2059,
          "columnNum": 145
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAAmericanSignLanguage2",
        "otherPossibleNames": ["Embedded Accommodations—American Sign Language (Online) (Speaking)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-AMERICAN_SIGN_LANGUAGE_ONLINE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2060,
          "offsetEnd": 2067,
          "columnNum": 146
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAAudioScript1",
        "otherPossibleNames": ["Embedded Accommodations—Audio Transcript (Online) (Listening)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2068,
          "offsetEnd": 2083,
          "columnNum": 147
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAAudioScript2",
        "otherPossibleNames": ["Embedded Accommodations—Audio Transcript (Online) (Speaking)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2084,
          "offsetEnd": 2099,
          "columnNum": 148
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAAudioScript3",
        "otherPossibleNames": ["Embedded Accommodations—Audio Transcript (Online) (Reading)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2100,
          "offsetEnd": 2115,
          "columnNum": 149
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAAudioScript4",
        "otherPossibleNames": ["Embedded Accommodations—Audio Transcript (Online) (Writing)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-AUDIO_TRANSCRIPT_ONLINE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2116,
          "offsetEnd": 2131,
          "columnNum": 150
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EABraille1",
        "otherPossibleNames": ["Embedded Accommodations—Braille (Online) (Listening)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2132,
          "offsetEnd": 2142,
          "columnNum": 151
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EABraille2",
        "otherPossibleNames": ["Embedded Accommodations—Braille (Online) (Speaking)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2143,
          "offsetEnd": 2153,
          "columnNum": 152
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EABraille3",
        "otherPossibleNames": ["Embedded Accommodations—Braille (Online) (Reading)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2154,
          "offsetEnd": 2164,
          "columnNum": 153
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EABraille4",
        "otherPossibleNames": ["Embedded Accommodations—Braille (Online) (Writing)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-BRAILLE_ONLINE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2165,
          "offsetEnd": 2175,
          "columnNum": 154
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAClosedCaptioning1",
        "otherPossibleNames": ["Embedded Accommodations—Closed Captioning (Online) (Listening)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2176,
          "offsetEnd": 2189,
          "columnNum": 155
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAClosedCaptioning2",
        "otherPossibleNames": ["Embedded Accommodations—Closed Captioning (Online) (Speaking)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2190,
          "offsetEnd": 2203,
          "columnNum": 156
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAClosedCaptioning3",
        "otherPossibleNames": ["Embedded Accommodations—Closed Captioning (Online) (Reading)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_READING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2204,
          "offsetEnd": 2217,
          "columnNum": 157
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EAClosedCaptioning4",
        "otherPossibleNames": ["Embedded Accommodations—Closed Captioning (Online) (Writing)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-CLOSED_CAPTIONING_ONLINE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2218,
          "offsetEnd": 2231,
          "columnNum": 158
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EATexttoSpeech1",
        "otherPossibleNames": ["Embedded Accommodations—Text-to-Speech (Online) (Listening"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_LISTENING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2232,
          "offsetEnd": 2256,
          "columnNum": 159
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EATexttoSpeech2",
        "otherPossibleNames": ["Embedded Accommodations—Text-to-Speech (Online) (Speaking"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_SPEAKING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2257,
          "offsetEnd": 2281,
          "columnNum": 160
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EATexttoSpeech4",
        "otherPossibleNames": ["Embedded Accommodations—Text-to-Speech (Online) (Writing)"],
        "logicalName": "EMBEDDED_ACCOMMODATIONS-TEXT-TO-SPEECH_ONLINE_WRITING",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2282,
          "offsetEnd": 2306,
          "columnNum": 161
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EASpeechtoText1",
        "otherPossibleNames": ["Embedded Accommodations 1—Speech-to-Text (Online)"],
        "logicalName": "EASPEECHTOTEXT1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2307,
          "offsetEnd": 2321,
          "columnNum": 162
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EASpeechtoText2",
        "otherPossibleNames": ["Embedded Accommodations 2—Speech-to-Text (Online)"],
        "logicalName": "EASPEECHTOTEXT2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2322,
          "offsetEnd": 2336,
          "columnNum": 163
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EASpeechtoText3",
        "otherPossibleNames": ["Embedded Accommodations 3—Speech-to-Text (Online)"],
        "logicalName": "EASPEECHTOTEXT3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2337,
          "offsetEnd": 2351,
          "columnNum": 164
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EASpeechtoText4",
        "otherPossibleNames": ["Embedded Accommodations 4—Speech-to-Text (Online)"],
        "logicalName": "EASPEECHTOTEXT4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2352,
          "offsetEnd": 2366,
          "columnNum": 165
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAdditionalInstructionalSupports1",
        "otherPossibleNames": ["Non-Embedded Accommodations 1—Additional Instructional Supports and Resources for Alternate Assessments (Online)"],
        "logicalName": "NEAADDITIONALINSTRUCTIONALSUPPORTS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2367,
          "offsetEnd": 2379,
          "columnNum": 166
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAlternateResponseOptions1",
        "otherPossibleNames": ["Non-Embedded Accommodations—Alternate Response Options (Online or Paper) (Listening)"],
        "logicalName": "NEAALTERNATERESPONSEOPTIONS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2380,
          "offsetEnd": 2385,
          "columnNum": 167
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAlternateResponseOptions2",
        "otherPossibleNames": ["Non-Embedded Accommodations—Alternate Response Options (Online or Paper) (Speaking)"],
        "logicalName": "NEAALTERNATERESPONSEOPTIONS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2386,
          "offsetEnd": 2391,
          "columnNum": 168
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAlternateResponseOptions3",
        "otherPossibleNames": ["Non-Embedded Accommodations—Alternate Response Options (Online or Paper) (Reading)"],
        "logicalName": "NEAALTERNATERESPONSEOPTIONS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2392,
          "offsetEnd": 2397,
          "columnNum": 169
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAlternateResponseOptions4",
        "otherPossibleNames": [" Non-Embedded Accommodations—Alternate Response Options (Online or Paper) (Writing)"],
        "logicalName": "NEAALTERNATERESPONSEOPTIONS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2398,
          "offsetEnd": 2403,
          "columnNum": 170
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAManuallyCodedEnglish1",
        "otherPossibleNames": ["Non-Embedded Accommodations—ASL or Manually Coded English (Online or Paper) (Listening)"],
        "logicalName": "NEAMANUALLYCODEDENGLISH1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2404,
          "offsetEnd": 2427,
          "columnNum": 171
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAManuallyCodedEnglish2",
        "otherPossibleNames": ["Non-Embedded Accommodations—ASL or Manually Coded English (Online or Paper) (Speaking)"],
        "logicalName": "NEAMANUALLYCODEDENGLISH2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2428,
          "offsetEnd": 2451,
          "columnNum": 172
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAudioScript1",
        "otherPossibleNames": ["Non-Embedded Accommodations—Audio Transcript (Paper) (Listening)"],
        "logicalName": "NEAAUDIOSCRIPT1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2452,
          "offsetEnd": 2467,
          "columnNum": 173
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAudioScript2",
        "otherPossibleNames": ["Non-Embedded Accommodations—Audio Transcript (Paper) (Speaking)"],
        "logicalName": "NEAAUDIOSCRIPT2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2468,
          "offsetEnd": 2483,
          "columnNum": 174
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAudioScript3",
        "otherPossibleNames": ["Non-Embedded Accommodations—Audio Transcript (Paper) (Reading)"],
        "logicalName": "NEAAUDIOSCRIPT3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2484,
          "offsetEnd": 2499,
          "columnNum": 175
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAAudioScript4",
        "otherPossibleNames": ["Non-Embedded Accommodations—Audio Transcript (Paper) (Writing)"],
        "logicalName": "NEAAUDIOSCRIPT4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2500,
          "offsetEnd": 2515,
          "columnNum": 176
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEABreaks1",
        "otherPossibleNames": ["Non-Embedded Accommodations—Breaks (Online or Paper) (Listening)"],
        "logicalName": "NEABREAKS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2516,
          "offsetEnd": 2525,
          "columnNum": 177
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEABreaks2",
        "otherPossibleNames": ["Non-Embedded Accommodations—Breaks (Online or Paper) (Speaking)"],
        "logicalName": "NEABREAKS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2526,
          "offsetEnd": 2535,
          "columnNum": 178
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEABreaks3",
        "otherPossibleNames": ["Non-Embedded Accommodations—Breaks (Online or Paper) (Reading)"],
        "logicalName": "NEABREAKS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2536,
          "offsetEnd": 2545,
          "columnNum": 179
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEABreaks4",
        "otherPossibleNames": ["Non-Embedded Accommodations—Breaks (Online or Paper) (Writing)"],
        "logicalName": "NEABREAKS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2546,
          "offsetEnd": 2555,
          "columnNum": 180
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEABraille1",
        "otherPossibleNames": ["Non-Embedded Accommodations—Braille (Online or Paper) (Listening)"],
        "logicalName": "NEABRAILLE1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2556,
          "offsetEnd": 2566,
          "columnNum": 181
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEABraille2",
        "otherPossibleNames": ["Non-Embedded Accommodations—Braille (Online or Paper) (Speaking)"],
        "logicalName": "NEABRAILLE2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2567,
          "offsetEnd": 2577,
          "columnNum": 182
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEABraille3",
        "otherPossibleNames": ["Non-Embedded Accommodations—Braille (Online or Paper) (Reading)"],
        "logicalName": "NEABRAILLE3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2578,
          "offsetEnd": 2588,
          "columnNum": 183
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEABraille4",
        "otherPossibleNames": ["Non-Embedded Accommodations—Braille (Online or Paper) (Writing)"],
        "logicalName": "NEABRAILLE4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2589,
          "offsetEnd": 2599,
          "columnNum": 184
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAScribe1",
        "otherPossibleNames": ["Non-Embedded Accommodations—Scribe Items (Online or Paper) (Listening)"],
        "logicalName": "NEASCRIBE1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2600,
          "offsetEnd": 2615,
          "columnNum": 185
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAScribe2",
        "otherPossibleNames": ["Non-Embedded Accommodations—Scribe Items (Online or Paper) (Speaking)"],
        "logicalName": "NEASCRIBE2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2616,
          "offsetEnd": 2631,
          "columnNum": 186
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAScribe3",
        "otherPossibleNames": ["Non-Embedded Accommodations—Scribe Items (Online or Paper) (Reading)"],
        "logicalName": "NEASCRIBE3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2632,
          "offsetEnd": 2647,
          "columnNum": 187
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAScribe4",
        "otherPossibleNames": ["Non-Embedded Accommodations—Scribe Items (Online or Paper) (Writing)"],
        "logicalName": "NEASCRIBE4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2648,
          "offsetEnd": 2663,
          "columnNum": 188
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEASpeechtoText1",
        "otherPossibleNames": ["Non-Embedded Accommodations—Speech-to-text (Online or Paper) (Listening)"],
        "logicalName": "NEASPEECHTOTEXT1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2664,
          "offsetEnd": 2670,
          "columnNum": 189
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEASpeechtoText2",
        "otherPossibleNames": ["Non-Embedded Accommodations—Speech-to-text (Online or Paper) (Speaking)"],
        "logicalName": "NEASPEECHTOTEXT2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2671,
          "offsetEnd": 2677,
          "columnNum": 190
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEASpeechtoText3",
        "otherPossibleNames": ["Non-Embedded Accommodations—Speech-to-text (Online or Paper) (Reading)"],
        "logicalName": "NEASPEECHTOTEXT3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2678,
          "offsetEnd": 2684,
          "columnNum": 191
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEASpeechtoText4",
        "otherPossibleNames": ["Non-Embedded Accommodations—Speech-to-text (Online or Paper) (Writing)"],
        "logicalName": "NEASPEECHTOTEXT4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2685,
          "offsetEnd": 2691,
          "columnNum": 192
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEALargeVersionsofPaper1",
        "otherPossibleNames": ["Non-Embedded Accommodations—Large Versions of a Paper-Pencil Test (Paper) (Listening)"],
        "logicalName": "NEALARGEVERSIONSOFPAPER1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2692,
          "offsetEnd": 2697,
          "columnNum": 193
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEALargeVersionsofPaper2",
        "otherPossibleNames": ["Non-Embedded Accommodations—Large Versions of a Paper-Pencil Test (Paper) (Speaking)"],
        "logicalName": "NEALARGEVERSIONSOFPAPER2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2698,
          "offsetEnd": 2703,
          "columnNum": 194
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEALargeVersionsofPaper3",
        "otherPossibleNames": ["Non-Embedded Accommodations—Large Versions of a Paper-Pencil Test (Paper) (Reading)"],
        "logicalName": "NEALARGEVERSIONSOFPAPER3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2704,
          "offsetEnd": 2709,
          "columnNum": 195
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEALargeVersionsofPaper4",
        "otherPossibleNames": ["Non-Embedded Accommodations—Large Versions of a Paper-Pencil Test (Paper) (Writing)"],
        "logicalName": "NEALARGEVERSIONSOFPAPER4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2710,
          "offsetEnd": 2715,
          "columnNum": 196
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAUnlistedResources1",
        "otherPossibleNames": ["Non-Embedded Accommodation—Unlisted Resources (Online or Paper) (Listening)"],
        "logicalName": "NEAUNLISTED_RESOURCES1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2716,
          "offsetEnd": 2733,
          "columnNum": 197
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAUnlistedResources2",
        "otherPossibleNames": ["Non-Embedded Accommodation—Unlisted Resources (Online or Paper) (Speaking)"],
        "logicalName": "NEAUNLISTED_RESOURCES2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2734,
          "offsetEnd": 2751,
          "columnNum": 198
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAUnlistedResources3",
        "otherPossibleNames": ["Non-Embedded Accommodation—Unlisted Resources (Online or Paper) (Reading)"],
        "logicalName": "NEAUNLISTED_RESOURCES3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2752,
          "offsetEnd": 2769,
          "columnNum": 199
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAUnlistedResources4",
        "otherPossibleNames": ["Non-Embedded Accommodation—Unlisted Resources (Online or Paper) (Writing)"],
        "logicalName": "NEAUNLISTED_RESOURCES4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2770,
          "offsetEnd": 2787,
          "columnNum": 200
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAWordProcessor1",
        "otherPossibleNames": ["Non-Embedded Accommodations—Word Processor (Paper) (Listening)"],
        "logicalName": "NEAWORDPROCESSOR1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2788,
          "offsetEnd": 2793,
          "columnNum": 201
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAWordProcessor2",
        "otherPossibleNames": ["Non-Embedded Accommodations—Word Processor (Paper) (Speaking)"],
        "logicalName": "NEAWORDPROCESSOR2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2794,
          "offsetEnd": 2799,
          "columnNum": 202
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAWordProcessor3",
        "otherPossibleNames": ["Non-Embedded Accommodations—Word Processor (Paper) (Reading)"],
        "logicalName": "NEAWORDPROCESSOR3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2800,
          "offsetEnd": 2805,
          "columnNum": 203
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEAWordProcessor4",
        "otherPossibleNames": ["Non-Embedded Accommodations—Word Processor (Paper) (Writing)"],
        "logicalName": "NEAWORDPROCESSOR4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2806,
          "offsetEnd": 2811,
          "columnNum": 204
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSColorContrast1",
        "otherPossibleNames": ["Embedded Designated Supports—Color Contrast (Online) (Listening)"],
        "logicalName": "EDSCOLORCONTRAST1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2812,
          "offsetEnd": 2830,
          "columnNum": 205
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSColorContrast2",
        "otherPossibleNames": ["Embedded Designated Supports—Color Contrast (Online) (Speaking)"],
        "logicalName": "EDSCOLORCONTRAST2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2831,
          "offsetEnd": 2849,
          "columnNum": 206
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSColorContrast3",
        "otherPossibleNames": ["Embedded Designated Supports—Color Contrast (Online) (Reading)"],
        "logicalName": "EDSCOLORCONTRAST3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2850,
          "offsetEnd": 2868,
          "columnNum": 207
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSColorContrast4",
        "otherPossibleNames": ["Embedded Designated Supports—Color Contrast (Online) (Writing)"],
        "logicalName": "EDSCOLORCONTRAST4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2869,
          "offsetEnd": 2887,
          "columnNum": 208
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSMousePointer1",
        "otherPossibleNames": ["Embedded Designated Supports—Mouse Pointer (Size and Color) (Online) (Listening)"],
        "logicalName": "EDSMOUSEPOINTER1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2888,
          "offsetEnd": 2903,
          "columnNum": 209
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSMousePointer2",
        "otherPossibleNames": ["Embedded Designated Supports—Mouse Pointer (Size and Color) (Online) (Speaking)"],
        "logicalName": "EDSMOUSEPOINTER2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2904,
          "offsetEnd": 2919,
          "columnNum": 210
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSMousePointer3",
        "otherPossibleNames": ["Embedded Designated Supports—Mouse Pointer (Size and Color) (Online) (Reading)"],
        "logicalName": "EDSMOUSEPOINTER3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2920,
          "offsetEnd": 2935,
          "columnNum": 211
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSMousePointer4",
        "otherPossibleNames": ["Embedded Designated Supports—Mouse Pointer (Size and Color) (Online) (Writing)"],
        "logicalName": "EDSMOUSEPOINTER4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2936,
          "offsetEnd": 2951,
          "columnNum": 212
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSMasking1",
        "otherPossibleNames": ["Embedded Designated Supports—Masking (Online) (Listening)"],
        "logicalName": "EDSMASKING1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2952,
          "offsetEnd": 2963,
          "columnNum": 213
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSMasking2",
        "otherPossibleNames": ["Embedded Designated Supports—Masking (Online) (Speaking)"],
        "logicalName": "EDSMASKING2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2964,
          "offsetEnd": 2975,
          "columnNum": 214
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSMasking3",
        "otherPossibleNames": ["Embedded Designated Supports—Masking (Online) (Reading)"],
        "logicalName": "EDSMASKING3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2976,
          "offsetEnd": 2987,
          "columnNum": 215
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSMasking4",
        "otherPossibleNames": ["Embedded Designated Supports—Masking (Online) (Writing)"],
        "logicalName": "EDSMASKING4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 2988,
          "offsetEnd": 2999,
          "columnNum": 216
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPauseorReplayAudio1",
        "otherPossibleNames": ["Embedded Designated Supports—Pause or Replay Audio - Listening Domain (Online)"],
        "logicalName": "EDSPAUSEORREPLAYAUDIO1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3000,
          "offsetEnd": 3008,
          "columnNum": 217
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPauseorReplayAudio2",
        "otherPossibleNames": ["Embedded Designated Supports—Pause or Replay Audio - Speaking Domain (Online)"],
        "logicalName": "EDSPAUSEORREPLAYAUDIO2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3009,
          "offsetEnd": 3017,
          "columnNum": 218
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPermissiveMode1",
        "otherPossibleNames": ["Embedded Designated Supports—Permissive Mode (Online) (Listening)"],
        "logicalName": "EDSPERMISSIVEMODE1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3018,
          "offsetEnd": 3024,
          "columnNum": 219
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPermissiveMode2",
        "otherPossibleNames": ["Embedded Designated Supports—Permissive Mode (Online) (Speaking)"],
        "logicalName": "EDSPERMISSIVEMODE2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3025,
          "offsetEnd": 3031,
          "columnNum": 220
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPermissiveMode3",
        "otherPossibleNames": ["Embedded Designated Supports—Permissive Mode (Online) (Reading)"],
        "logicalName": "EDSPERMISSIVEMODE3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3032,
          "offsetEnd": 3038,
          "columnNum": 221
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPermissiveMode4",
        "otherPossibleNames": ["Embedded Designated Supports—Permissive Mode (Online) (Writing)"],
        "logicalName": "EDSPERMISSIVEMODE4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3039,
          "offsetEnd": 3045,
          "columnNum": 222
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPrintSize1",
        "otherPossibleNames": [" Embedded Designated Supports—Print Size (Online) (Listening)"],
        "logicalName": "EDSPRINTSIZE1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3046,
          "offsetEnd": 3054,
          "columnNum": 223
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPrintSize2",
        "otherPossibleNames": ["Embedded Designated Supports—Print Size (Online) (Speaking)"],
        "logicalName": "EDSPRINTSIZE2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3055,
          "offsetEnd": 3063,
          "columnNum": 224
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPrintSize3",
        "otherPossibleNames": ["Embedded Designated Supports—Print Size (Online) (Reading)"],
        "logicalName": "EDSPRINTSIZE3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3064,
          "offsetEnd": 3072,
          "columnNum": 225
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSPrintSize4",
        "otherPossibleNames": ["Embedded Designated Supports—Print Size (Online) (Writing)"],
        "logicalName": "EDSPRINTSIZE4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3073,
          "offsetEnd": 3081,
          "columnNum": 226
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSStreamline1",
        "otherPossibleNames": ["Embedded Designated Supports—Streamline (Online) (Listening)"],
        "logicalName": "EDSSTREAMLINE1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3082,
          "offsetEnd": 3089,
          "columnNum": 227
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSStreamline2",
        "otherPossibleNames": ["Embedded Designated Supports—Streamline (Online) (Speaking)"],
        "logicalName": "EDSSTREAMLINE2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3090,
          "offsetEnd": 3097,
          "columnNum": 228
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSStreamline3",
        "otherPossibleNames": ["Embedded Designated Supports—Streamline (Online) (Reading)"],
        "logicalName": "EDSSTREAMLINE3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3098,
          "offsetEnd": 3105,
          "columnNum": 229
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSStreamline4",
        "otherPossibleNames": ["Embedded Designated Supports—Streamline (Online) (Writing)"],
        "logicalName": "EDSSTREAMLINE4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3106,
          "offsetEnd": 3113,
          "columnNum": 230
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSTurnOffAnyUniversalTool1",
        "otherPossibleNames": ["Embedded Designated Supports—Turn Off Any Universal Tool(s) (Online) (Listening)"],
        "logicalName": "EDSTURNOFFANYUNIVERSALTOOL1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3114,
          "offsetEnd": 3120,
          "columnNum": 231
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSTurnOffAnyUniversalTool2",
        "otherPossibleNames": ["Embedded Designated Supports—Turn Off Any Universal Tool(s) (Online) (Speaking)"],
        "logicalName": "EDSTURNOFFANYUNIVERSALTOOL2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3121,
          "offsetEnd": 3127,
          "columnNum": 232
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSTurnOffAnyUniversalTool3",
        "otherPossibleNames": ["Embedded Designated Supports—Turn Off Any Universal Tool(s) (Online) (Reading)"],
        "logicalName": "EDSTURNOFFANYUNIVERSALTOOL3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3128,
          "offsetEnd": 3134,
          "columnNum": 233
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EDSTurnOffAnyUniversalTool4",
        "otherPossibleNames": ["Embedded Designated Supports—Turn Off Any Universal Tool(s) (Online) (Writing)"],
        "logicalName": "EDSTURNOFFANYUNIVERSALTOOL4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3135,
          "offsetEnd": 3141,
          "columnNum": 234
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSAmplification1",
        "otherPossibleNames": ["Embedded Designated Supports — Amplification (Online or Paper) (Listening)"],
        "logicalName": "NEDSAMPLIFICATION1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3142,
          "offsetEnd": 3153,
          "columnNum": 235
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSAmplification2",
        "otherPossibleNames": ["Non-Embedded Designated Supports — Amplification (Online or Paper) (Speaking)"],
        "logicalName": "NEDSAMPLIFICATION2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3154,
          "offsetEnd": 3165,
          "columnNum": 236
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSAmplification3",
        "otherPossibleNames": ["Non-Embedded Designated Supports — Amplification (Online or Paper) (Reading)"],
        "logicalName": "NEDSAMPLIFICATION3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3166,
          "offsetEnd": 3177,
          "columnNum": 237
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSAmplification4",
        "otherPossibleNames": ["Non-Embedded Designated Supports — Amplification (Online or Paper) (Writing)"],
        "logicalName": "NEDSAMPLIFICATION4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3178,
          "offsetEnd": 3189,
          "columnNum": 238
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSColorContrast1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Color Contrast (Online) (Listening)"],
        "logicalName": "NEDSCOLORCONTRAST1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3190,
          "offsetEnd": 3196,
          "columnNum": 239
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSColorContrast2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Color Contrast (Online) (Speaking)"],
        "logicalName": "NEDSCOLORCONTRAST2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3197,
          "offsetEnd": 3203,
          "columnNum": 240
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSColorContrast3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Color Contrast (Online) (Reading)"],
        "logicalName": "NEDSCOLORCONTRAST3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3204,
          "offsetEnd": 3210,
          "columnNum": 241
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSColorContrast4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Color Contrast (Online) (Writing)"],
        "logicalName": "NEDSCOLORCONTRAST4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3211,
          "offsetEnd": 3217,
          "columnNum": 242
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSColorOverlay1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Color Overlay (Online or Paper) (Listening)"],
        "logicalName": "NEDSCOLOROVERLAY1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3218,
          "offsetEnd": 3224,
          "columnNum": 243
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSColorOverlay2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Color Overlay (Online or Paper) (Speaking)"],
        "logicalName": "NEDSCOLOROVERLAY2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3225,
          "offsetEnd": 3231,
          "columnNum": 244
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSColorOverlay3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Color Overlay (Online or Paper) (Reading)"],
        "logicalName": "NEDSCOLOROVERLAY3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3232,
          "offsetEnd": 3238,
          "columnNum": 245
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSColorOverlay4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Color Overlay (Online or Paper) (Writing)"],
        "logicalName": "NEDSCOLOROVERLAY4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3239,
          "offsetEnd": 3245,
          "columnNum": 246
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSInterfaceAssistant1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Designated Interface Assistant (Online) (Listening)"],
        "logicalName": "NEDSINTERFACEASSISTANT1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3246,
          "offsetEnd": 3253,
          "columnNum": 247
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSInterfaceAssistant2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Designated Interface Assistant (Online) (Speaking)"],
        "logicalName": "NEDSINTERFACEASSISTANT2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3254,
          "offsetEnd": 3261,
          "columnNum": 248
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSInterfaceAssistant3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Designated Interface Assistant (Online) (Reading)"],
        "logicalName": "NEDSINTERFACEASSISTANT3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3262,
          "offsetEnd": 3269,
          "columnNum": 249
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSInterfaceAssistant4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Designated Interface Assistant (Online) (Writing)"],
        "logicalName": "NEDSINTERFACEASSISTANT4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3270,
          "offsetEnd": 3277,
          "columnNum": 250
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMagnification1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Magnification (Online or Paper) (Listening)"],
        "logicalName": "NEDSMAGNIFICATION1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3278,
          "offsetEnd": 3285,
          "columnNum": 251
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMagnification2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Magnification (Online or Paper) (Speaking)"],
        "logicalName": "NEDSMAGNIFICATION2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3286,
          "offsetEnd": 3293,
          "columnNum": 252
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMagnification3",
        "otherPossibleNames": [" Non-Embedded Designated Supports—Magnification (Online or Paper) (Reading)"],
        "logicalName": "NEDSMAGNIFICATION3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3294,
          "offsetEnd": 3301,
          "columnNum": 253
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMagnification4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Magnification (Online or Paper) (Writing)"],
        "logicalName": "NEDSMAGNIFICATION4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3302,
          "offsetEnd": 3309,
          "columnNum": 254
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMasking1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Masking (Paper) (Listening)"],
        "logicalName": "NEDSMASKING1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3310,
          "offsetEnd": 3322,
          "columnNum": 255
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMasking2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Masking (Paper) (Speaking)"],
        "logicalName": "NEDSMASKING2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3323,
          "offsetEnd": 3335,
          "columnNum": 256
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMasking3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Masking (Paper) (Reading)"],
        "logicalName": "NEDSMASKING3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3336,
          "offsetEnd": 3348,
          "columnNum": 257
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMasking4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Masking (Paper) (Writing)"],
        "logicalName": "NEDSMASKING4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3349,
          "offsetEnd": 3361,
          "columnNum": 258
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMedicalSupports1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Medical Supports (Online or Paper) (Listening)"],
        "logicalName": "NEDSMEDICALSUPPORTS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3362,
          "offsetEnd": 3372,
          "columnNum": 259
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMedicalSupports2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Medical Supports (Online or Paper) (Speaking)"],
        "logicalName": "NEDSMEDICALSUPPORTS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3373,
          "offsetEnd": 3383,
          "columnNum": 260
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMedicalSupports3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Medical Supports (Online or Paper) (Reading)"],
        "logicalName": "NEDSMEDICALSUPPORTS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3384,
          "offsetEnd": 3394,
          "columnNum": 261
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSMedicalSupports4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Medical Supports (Online or Paper) (Writing)"],
        "logicalName": "NEDSMEDICALSUPPORTS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3395,
          "offsetEnd": 3405,
          "columnNum": 262
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSNoiseBuffers1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Noise Buffers (Online or Paper) (Listening)"],
        "logicalName": "NEDSNOISEBUFFERS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3406,
          "offsetEnd": 3418,
          "columnNum": 263
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSNoiseBuffers2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Noise Buffers (Online or Paper) (Speaking)"],
        "logicalName": "NEDSNOISEBUFFERS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3419,
          "offsetEnd": 3431,
          "columnNum": 264
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSNoiseBuffers3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Noise Buffers (Online or Paper) (Reading)"],
        "logicalName": "NEDSNOISEBUFFERS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3432,
          "offsetEnd": 3444,
          "columnNum": 265
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSNoiseBuffers4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Noise Buffers (Online or Paper) (Writing)"],
        "logicalName": "NEDSNOISEBUFFERS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3445,
          "offsetEnd": 3457,
          "columnNum": 266
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSPrintonDemand1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Print on demand (Online) (Listening)"],
        "logicalName": "NEDSPRINTONDEMAND1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3458,
          "offsetEnd": 3482,
          "columnNum": 267
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSPrintonDemand2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Print on demand (Online) (Speaking)"],
        "logicalName": "NEDSPRINTONDEMAND2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3483,
          "offsetEnd": 3507,
          "columnNum": 268
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSPrintonDemand3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Print on demand (Online) (Reading)"],
        "logicalName": "NEDSPRINTONDEMAND3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3508,
          "offsetEnd": 3532,
          "columnNum": 269
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSPrintonDemand4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Print on demand (Online) (Writing)"],
        "logicalName": "NEDSPRINTONDEMAND4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3533,
          "offsetEnd": 3557,
          "columnNum": 270
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSPauseorReplayAudio1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Pause or Replay Audio (Paper) (Listening)"],
        "logicalName": "NEDSPAUSEORREPLAYAUDIO1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3558,
          "offsetEnd": 3566,
          "columnNum": 271
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSPauseorReplayAudio2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Pause or Replay Audio (Paper) (Speaking)"],
        "logicalName": "NEDSPAUSEORREPLAYAUDIO2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3567,
          "offsetEnd": 3575,
          "columnNum": 272
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSReadAloudItems1",
        "otherPossibleNames": ["Non-Embedded Designated Supports 1—Read-Aloud Items (Online)"],
        "logicalName": "NEDSREADALOUDITEMS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3576,
          "offsetEnd": 3588,
          "columnNum": 273
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSReadAloudItems4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Read-Aloud Items (Online or Paper) (Writing)"],
        "logicalName": "NEDSREADALOUDITEMS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3589,
          "offsetEnd": 3601,
          "columnNum": 274
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSSeparateSetting1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Separate Setting (Online) (Listening)"],
        "logicalName": "NEDSSEPARATESETTING1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3602,
          "offsetEnd": 3608,
          "columnNum": 275
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSSeparateSetting2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Separate Setting (Online) (Speaking)"],
        "logicalName": "NEDSSEPARATESETTING2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3609,
          "offsetEnd": 3615,
          "columnNum": 276
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSSeparateSetting3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Separate Setting (Online) (Reading)"],
        "logicalName": "NEDSSEPARATESETTING3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3616,
          "offsetEnd": 3622,
          "columnNum": 277
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSSeparateSetting4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Separate Setting (Online) (Writing)"],
        "logicalName": "NEDSSEPARATESETTING4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3623,
          "offsetEnd": 3629,
          "columnNum": 278
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSSimplifiedTestDirections1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Simplified Test Directions (Online or Paper) (Listening)"],
        "logicalName": "NEDSSIMPLIFIEDTESTDIRECTIONS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3630,
          "offsetEnd": 3642,
          "columnNum": 279
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSSimplifiedTestDirections2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Simplified Test Directions (Online or Paper) (Speaking)"],
        "logicalName": "NEDSSIMPLIFIEDTESTDIRECTIONS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3643,
          "offsetEnd": 3655,
          "columnNum": 280
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSSimplifiedTestDirections3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Simplified Test Directions (Online or Paper) (Reading)"],
        "logicalName": "NEDSSIMPLIFIEDTESTDIRECTIONS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3656,
          "offsetEnd": 3668,
          "columnNum": 281
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSSimplifiedTestDirections4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Simplified Test Directions (Online or Paper) (Writing)"],
        "logicalName": "NEDSSIMPLIFIEDTESTDIRECTIONS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3669,
          "offsetEnd": 3681,
          "columnNum": 282
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSTranslatedTestDirections1",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Translated Test Directions (including ASL) (Online or Paper) (Listening)"],
        "logicalName": "NEDSTRANSLATEDTESTDIRECTIONS1",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3682,
          "offsetEnd": 3696,
          "columnNum": 283
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSTranslatedTestDirections2",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Translated Test Directions (including ASL) (Online or Paper) (Speaking)"],
        "logicalName": "NEDSTRANSLATEDTESTDIRECTIONS2",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3697,
          "offsetEnd": 3711,
          "columnNum": 284
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSTranslatedTestDirections3",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Translated Test Directions (including ASL) (Online or Paper) (Reading)"],
        "logicalName": "NEDSTRANSLATEDTESTDIRECTIONS3",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3712,
          "offsetEnd": 3726,
          "columnNum": 285
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "NEDSTranslatedTestDirections4",
        "otherPossibleNames": ["Non-Embedded Designated Supports—Translated Test Directions (including ASL) (Online or Paper) (Writing)"],
        "logicalName": "NEDSTRANSLATEDTESTDIRECTIONS4",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3727,
          "offsetEnd": 3741,
          "columnNum": 286
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "ReportCreatedDate",
        "otherPossibleNames": ["Report Created Date"],
        "logicalName": "REPORTCREATEDDATE",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3742,
          "offsetEnd": 3751,
          "columnNum": 287
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      },
      {
        "physicalName": "EndofRecord",
        "otherPossibleNames": ["End of Record"],
        "logicalName": "ENDOFRECORD",
        "formatMask": null,
        "isFieldRequired": "Y",
        "canBeNull": "Y",
        "fieldOffset": {
          "offsetStart": 3752,
          "offsetEnd": 3753,
          "columnNum": 288
        },
        "fieldLength": 500,
        "fieldPrecision": null,
        "expectedValues": [],
        "dataTypes": "STRING",
        "scale": 0
      }
    ]
  }
}