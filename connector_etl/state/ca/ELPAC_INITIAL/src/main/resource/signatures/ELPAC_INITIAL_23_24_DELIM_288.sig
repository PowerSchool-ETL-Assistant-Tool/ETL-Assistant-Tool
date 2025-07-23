{
  "encoding": "UTF-8",
  "fileExtensions": [
    ".csv"
  ],
  "format": {
    "@type": "Delimited",
    "formatName": "ELPAC_INITIAL_23_24_DELIM_288",
    "quoteDelim": "\"",
    "fieldDelim": "^",
    "recordLength": "",
    "hasHeader": true,
    "naturalKey": ["UIN","STUDENT_STATE_ID"],
    "fields": [
      {
        "physicalName": "RecordType",
        "otherPossibleNames": ["Record Type"],
        "logicalName": "ASSESSMENT_TYPE",
        "formatMask": null,
        "isFieldRequired": "N",
        "canBeNull": "N",
        "fieldOffset": {
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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
          "offsetStart": 0,
          "offsetEnd": 0,
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