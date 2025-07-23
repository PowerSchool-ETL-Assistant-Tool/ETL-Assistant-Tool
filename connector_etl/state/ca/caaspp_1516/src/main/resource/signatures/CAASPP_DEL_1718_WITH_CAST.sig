{
  "encoding": "UTF-8",
  "format": {
    "@type": "Delimited",
    "formatName": "CAASPP_DEL_1718_WITH_CAST",
    "quoteDelim": "\"",
    "fieldDelim": "^",
    "hasHeader": true,
    "naturalKey": [],
    "fields": [
  {
    "physicalName": "RecordType",
    "otherPossibleNames": ["RecordType"],
    "logicalName": "RECORD_TYPE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 1
    },
    "fieldLength": 2,
    "expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08"],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Statewide_Student_Identifier(SSID)",
    "otherPossibleNames": ["Statewide_Student_Identifier(SSID)"],
    "logicalName": "STUDENT_STATE_ID",
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
    "physicalName": "Student_Last_Name",
    "otherPossibleNames": ["Student_Last_Name"],
    "logicalName": "STUDENT_LAST_NAME",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 3
    },
    "fieldLength": 50,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Student_First_Name",
    "otherPossibleNames": ["Student_First_Name"],
    "logicalName": "STUDENT_FIRST_NAME",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 4
    },
    "fieldLength": 30,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Student_Middle_Name",
    "otherPossibleNames": ["Student_Middle_Name"],
    "logicalName": "STUDENT_MIDDLE_NAME",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 5
    },
    "fieldLength": 30,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "DateofBirth",
    "otherPossibleNames": ["DateofBirth"],
    "logicalName": "STUDENT_DOB",
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
    "physicalName": "Gender",
    "otherPossibleNames": ["Gender"],
    "logicalName": "STUDENT_GENDER_CODE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 7
    },
    "fieldLength": 6,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "CALPADS Grade",
    "otherPossibleNames": ["CALPADS Grade"],
    "logicalName": "CALPADS_GRADE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 8
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
      "KN",
      "UE",
      "US"
    ],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Grade Assessed",
    "otherPossibleNames": ["Grade Assessed"],
    "logicalName": "GRADE_ASSESSED",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 9
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "CALPADSDistrictCode",
    "otherPossibleNames": ["CALPADSDistrictCode"],
    "logicalName": "CALPADS_DISTRICT_CODE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 10
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "CALPADSSchoolCode",
    "otherPossibleNames": ["CALPADSSchoolCode"],
    "logicalName": "CALPADS_SCHOOL_CODE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 11
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "CALPADSCharterCode",
    "otherPossibleNames": ["CALPADSCharterCode"],
    "logicalName": "CALPADS_CHARTER_CODE",
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
    "scale": null
  },
  {
    "physicalName": "CALPADS Charter School  Indicator",
    "otherPossibleNames": ["CALPADS Charter School  Indicator"],
    "logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 13
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "County/District CodeofAccountability",
    "otherPossibleNames": ["County/District CodeofAccountability"],
    "logicalName": "CALPADS_CODE_OF_ACCOUNTABILITY",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 14
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Section504Status",
    "otherPossibleNames": ["Section504Status"],
    "logicalName": "PP_SECTION_504_STATUS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 15
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "PrimaryDisabilityType",
    "otherPossibleNames": ["PrimaryDisabilityType"],
    "logicalName": "PRIMARY_DISABILITY_TYPE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 16
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "IDEAIndicator",
    "otherPossibleNames": ["IDEAIndicator"],
    "logicalName": "PP_IDEA_INDICATOR",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 17
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "MigrantStatus",
    "otherPossibleNames": ["MigrantStatus"],
    "logicalName": "MIGRANT_STATUS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 18
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "LEP(Limited English Proficient)Status",
    "otherPossibleNames": ["LEP(Limited English Proficient)Status"],
    "logicalName": "LEP_LIMITED_ENGLISH_PROFICIENT_STATUS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 19
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "LEP(Limited English Proficient)EntryDate",
    "otherPossibleNames": ["LEP(Limited English Proficient)EntryDate"],
    "logicalName": "LEP_ENTRY_DATE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 20
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "RFEPDate",
    "otherPossibleNames": ["RFEPDate"],
    "logicalName": "LEP_EXIT_DATE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 21
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "FirstEntryDateinUSSchool",
    "otherPossibleNames": ["FirstEntryDateinUSSchool"],
    "logicalName": "FIRST_DATE_IN_US_SCHOOL",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 22
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EnglishLanguageAcquisitionStatus",
    "otherPossibleNames": ["EnglishLanguageAcquisitionStatus"],
    "logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 23
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "LanguageCode",
    "otherPossibleNames": ["LanguageCode"],
    "logicalName": "LANGUAGE_CODE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 24
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EconomicDisadvantageStatus",
    "otherPossibleNames": ["EconomicDisadvantageStatus"],
    "logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 25
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "NPSSchoolFlag",
    "otherPossibleNames": ["NPSSchoolFlag"],
    "logicalName": "NPS_SCHOOL_FLAG",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 26
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "HispanicorLatino",
    "otherPossibleNames": ["HispanicorLatino"],
    "logicalName": "HISPANIC_OR_LATINO",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 27
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "AmericanIndianorAlaskaNative",
    "otherPossibleNames": ["AmericanIndianorAlaskaNative"],
    "logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
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
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Asian",
    "otherPossibleNames": ["Asian"],
    "logicalName": "ASIAN",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 29
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "NativeHawaiianorOtherPacificIslander",
    "otherPossibleNames": ["NativeHawaiianorOtherPacificIslander"],
    "logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 30
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Filipino",
    "otherPossibleNames": ["Filipino"],
    "logicalName": "FILIPINO",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 31
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "BlackorAfricanAmerican",
    "otherPossibleNames": ["BlackorAfricanAmerican"],
    "logicalName": "BLACK_OR_AFRICAN_AMERICAN",
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
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "White",
    "otherPossibleNames": ["White"],
    "logicalName": "WHITE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 33
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TwoorMoreRaces",
    "otherPossibleNames": ["TwoorMoreRaces"],
    "logicalName": "TWO_OR_MORE_RACES",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 34
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "ReportingEthnicity",
    "otherPossibleNames": ["ReportingEthnicity"],
    "logicalName": "REPORTING_ETHNICITY",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 35
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "ParentEducationLevel",
    "otherPossibleNames": ["ParentEducationLevel"],
    "logicalName": "PARENT_EDUCATION_LEVEL",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 36
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank1",
    "otherPossibleNames": ["Blank1"],
    "logicalName": "BLANK",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 37
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "OpportunityID1",
    "otherPossibleNames": ["OpportunityID1"],
    "logicalName": "OPPORTUNITY_ID_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 38
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Opportunity1Testing Status",
    "otherPossibleNames": ["Opportunity1Testing Status"],
    "logicalName": "OPPORTUNITY_TESTING_STATUS_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 39
    },
    "fieldLength": 1,
    "expectedValues": ["C", "E", "I"],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "OpportunityID2",
    "otherPossibleNames": ["OpportunityID2"],
    "logicalName": "OPPORTUNITY_ID_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 40
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Opportunity2Testing Status",
    "otherPossibleNames": ["Opportunity2Testing Status"],
    "logicalName": "OPPORTUNITY_TESTING_STATUS_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 41
    },
    "fieldLength": 1,
    "expectedValues": ["C", "E", "I"],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Opportunity ID 3",
    "otherPossibleNames": ["Opportunity ID 3"],
    "logicalName": "OPPORTUNITY_ID_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 42
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Opportunity 3 Testing Status",
    "otherPossibleNames": ["Opportunity 3 Testing Status"],
    "logicalName": "OPPORTUNITY_TESTING_STATUS_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 43
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestRegistrationID",
    "otherPossibleNames": ["TestRegistrationID"],
    "logicalName": "ENROLLMENT_ID",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 44
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedLEAName1",
    "otherPossibleNames": ["TestedLEAName1"],
    "logicalName": "TESTED_LEA_NAME_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 45
    },
    "fieldLength": 100,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedCounty/DistrictCode1",
    "otherPossibleNames": ["TestedCounty/DistrictCode1"],
    "logicalName": "TESTED_COUNTY_DISTRICT_CODE_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 46
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedSchoolName1",
    "otherPossibleNames": ["TestedSchoolName1"],
    "logicalName": "TESTED_SCHOOL_NAME_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 47
    },
    "fieldLength": 100,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedSchoolCode1",
    "otherPossibleNames": ["TestedSchoolCode1"],
    "logicalName": "TESTED_SCHOOL_CODE_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 48
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested Charter School Indicator 1",
    "otherPossibleNames": ["Tested Charter School Indicator 1"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 49
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedCharterSchoolCode1",
    "otherPossibleNames": ["TestedCharterSchoolCode1"],
    "logicalName": "TESTED_CHARTER_SCHOOL_CODE_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 50
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested School NPS Flag 1",
    "otherPossibleNames": ["Tested School NPS Flag 1"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 51
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "PaperandPencilTestCompletionDate(PAPER)",
    "otherPossibleNames": ["PaperandPencilTestCompletionDate(PAPER)"],
    "logicalName": "PAPER_AND_PENCIL_TEST_COMPLETION_DATE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 52
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedLEAName2",
    "otherPossibleNames": ["TestedLEAName2"],
    "logicalName": "TESTED_LEA_NAME_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 53
    },
    "fieldLength": 100,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedCounty/DistrictCode2",
    "otherPossibleNames": ["TestedCounty/DistrictCode2"],
    "logicalName": "TESTED_LEA_NAME_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 54
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedSchoolName2",
    "otherPossibleNames": ["TestedSchoolName2"],
    "logicalName": "TESTED_SCHOOL_NAME_2",
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
    "physicalName": "TestedSchoolCode2",
    "otherPossibleNames": ["TestedSchoolCode2"],
    "logicalName": "TESTED_SCHOOL_CODE_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 56
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested Charter School Indicator 2",
    "otherPossibleNames": ["Tested Charter School Indicator 2"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 57
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestedCharterSchoolCode2",
    "otherPossibleNames": ["TestedCharterSchoolCode2"],
    "logicalName": "TESTED_CHARTER_SCHOOL_CODE_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 58
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested School NPS Flag 2",
    "otherPossibleNames": ["Tested School NPS Flag 2"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 59
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested LEA Name 3",
    "otherPossibleNames": ["Tested LEA Name 3"],
    "logicalName": "TESTED_LEA_NAME_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 60
    },
    "fieldLength": 100,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested County/District Code 3",
    "otherPossibleNames": ["Tested County/District Code 3"],
    "logicalName": "TESTED_COUNTY_DISTRICT_CODE_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 61
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested School Name 3",
    "otherPossibleNames": ["Tested School Name 3"],
    "logicalName": "TESTED_SCHOOL_NAME_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 62
    },
    "fieldLength": 100,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested School Code 3",
    "otherPossibleNames": ["Tested School Code 3"],
    "logicalName": "TESTED_SCHOOL_CODE_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 63
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested Charter School Indicator 3",
    "otherPossibleNames": ["Tested Charter School Indicator 3"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 64
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested Charter School Code 3",
    "otherPossibleNames": ["Tested Charter School Code 3"],
    "logicalName": "TESTED_CHARTER_SCHOOL_CODE_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 65
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Tested School NPS Flag 3",
    "otherPossibleNames": ["Tested School NPS Flag 3"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 66
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestStartDate1",
    "otherPossibleNames": ["TestStartDate1"],
    "logicalName": "TEST_START_DATE_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 67
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestCompletionDate1",
    "otherPossibleNames": ["TestCompletionDate1"],
    "logicalName": "TEST_COMPLETION_DATE_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 68
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestStartDate2",
    "otherPossibleNames": ["TestStartDate2"],
    "logicalName": "TEST_START_DATE_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 69
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestCompletionDate2",
    "otherPossibleNames": ["TestCompletionDate2"],
    "logicalName": "TEST_COMPLETION_DATE_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 70
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Test Start Date 3",
    "otherPossibleNames": ["Test Start Date 3"],
    "logicalName": "TEST_START_DATE_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 71
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Test Completion Date 3",
    "otherPossibleNames": ["Test Completion Date 3"],
    "logicalName": "TEST_COMPLETION_DATE_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 72
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SchoolSelectedStartofTestWindow1",
    "otherPossibleNames": ["SchoolSelectedStartofTestWindow1"],
    "logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 73
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SchoolSelectedEndofTestWindow1",
    "otherPossibleNames": ["SchoolSelectedEndofTestWindow1"],
    "logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 74
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SchoolSelectedStartofTestWindow2",
    "otherPossibleNames": ["SchoolSelectedStartofTestWindow2"],
    "logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 75
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SchoolSelectedEndofTestWindow2",
    "otherPossibleNames": ["SchoolSelectedEndofTestWindow2"],
    "logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 76
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "School Selected Start of Test Window 3",
    "otherPossibleNames": ["School Selected Start of Test Window 3"],
    "logicalName": "SCHOOL_SELECTED_START_OF_TEST_WINDOW_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 77
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "School Selected End of Test Window 3",
    "otherPossibleNames": ["School Selected End of Test Window 3"],
    "logicalName": "SCHOOL_SELECTED_END_OF_TEST_WINDOW_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 78
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "StudentExitCode",
    "otherPossibleNames": ["StudentExitCode"],
    "logicalName": "STUDENT_EXIT_CODE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 79
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "StudentExitWithdrawaldate",
    "otherPossibleNames": ["StudentExitWithdrawaldate"],
    "logicalName": "STUDENT_EXIT_DATE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 80
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "StudentremovedfromCALPADSfiledate",
    "otherPossibleNames": ["StudentremovedfromCALPADSfiledate"],
    "logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 81
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "CAST Last Science Class flag",
    "otherPossibleNames": ["CAST Last Science Class flag"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 82
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "CAST Percent of Points Earned",
    "otherPossibleNames": ["CAST Percent of Points Earned"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 83
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "CAST Preliminary Indicator ",
    "otherPossibleNames": ["CAST Preliminary Indicator "],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 84
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "ConditionCode",
    "otherPossibleNames": ["ConditionCode"],
    "logicalName": "CONDITION_CODE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 85
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Attemptedness",
    "otherPossibleNames": ["Attemptedness"],
    "logicalName": "ATTEMPTEDNESS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 86
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "ScoreStatus",
    "otherPossibleNames": ["ScoreStatus"],
    "logicalName": "SCORE_STATUS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 87
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "UnlistedResourcesConstructChange",
    "otherPossibleNames": ["UnlistedResourcesConstructChange"],
    "logicalName": "UNLISTED_RESOURCE_CONSTRUCT_CHANGE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 88
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "TestMode-OnlineorPaper",
    "otherPossibleNames": ["TestMode–OnlineorPaper"],
    "logicalName": "TEST_MODE_ONLINE_OR_PAPER",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 89
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "IncludeIndicator",
    "otherPossibleNames": ["IncludeIndicator"],
    "logicalName": "INCLUDE_INDICATOR",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 90
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank2",
    "otherPossibleNames": ["Blank2"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 91
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "RawScore",
    "otherPossibleNames": ["RawScore"],
    "logicalName": "RAW_SCORE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 92
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank3",
    "otherPossibleNames": ["Blank3"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 93
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SmarterClaim1PerformanceLevel",
    "otherPossibleNames": ["SmarterClaim1PerformanceLevel"],
    "logicalName": "SMARTER_CLAIM_1_PERFORMANCE_LEVEL",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 94
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank4",
    "otherPossibleNames": ["Blank4"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 95
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SmarterClaim2PerformanceLevel",
    "otherPossibleNames": ["SmarterClaim2PerformanceLevel"],
    "logicalName": "SMARTER_CLAIM_2_PERFORMANCE_LEVEL",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 96
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank5",
    "otherPossibleNames": ["Blank5"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 97
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SmarterClaim3PerformanceLevel",
    "otherPossibleNames": ["SmarterClaim3PerformanceLevel"],
    "logicalName": "SMARTER_CLAIM_3_PERFORMANCE_LEVEL",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 98
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank6",
    "otherPossibleNames": ["Blank6"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 99
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SmarterClaim4PerformanceLevel",
    "otherPossibleNames": ["SmarterClaim4PerformanceLevel"],
    "logicalName": "SMARTER_CLAIM_4_PERFORMANCE_LEVEL",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 100
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "ScaleScore",
    "otherPossibleNames": ["ScaleScore"],
    "logicalName": "SCALE_SCORE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 101
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SmarterStandardErrorMeasurement-SEM",
    "otherPossibleNames": ["SmarterStandardErrorMeasurement–SEM"],
    "logicalName": "STANDARD_ERROR_MEASUREMENT_SCORE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 102
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SmarterScaleScoresErrorBands-Min",
    "otherPossibleNames": ["SmarterScaleScoresErrorBands–Min"],
    "logicalName": "STANDARD_ERROR_MEASUREMENT_MIN",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 103
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "SmarterScaleScoresErrorBands-Max",
    "otherPossibleNames": ["SmarterScaleScoresErrorBands–Max"],
    "logicalName": "STANDARD_ERROR_MEASUREMENT_MAX",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 104
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "PerformanceLevel",
    "otherPossibleNames": ["PerformanceLevel"],
    "logicalName": "PERFORMANCE_LEVEL",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 105
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "AchievementLevels",
    "otherPossibleNames": ["AchievementLevels"],
    "logicalName": "ACHIEVEMENT_LEVEL",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 106
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EAP-StudentAuthorizedETStoReleaseResultstoCSUand/orCaliforniaCommunityColleges",
    "otherPossibleNames": [
      "EAP–StudentAuthorizedETStoReleaseResultstoCSUand/orCaliforniaCommunityColleges"
    ],
    "logicalName": "EAP_STUDENT_AUTHORIZED_ETS_TO_RELEASE_RESULTS_TO_COLLEGES",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 107
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "AccommodationsAvailableIndicator",
    "otherPossibleNames": ["AccommodationsAvailableIndicator"],
    "logicalName": "ACCOMMODATIONS_AVAILABLE_INDICATOR",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 108
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Designated Support Available Indicator",
    "otherPossibleNames": ["Designated Support Available Indicator"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 109
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EmbeddedAccommodation1-AmericanSignLanguage(Online)",
    "otherPossibleNames": [
      "EmbeddedAccommodation1–AmericanSignLanguage(Online)"
    ],
    "logicalName": "EMBEDDED_ACCOMMODATION_1_AMERICAN_SIGN_LANGUAGE_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 110
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Accommodation 1  -  Audio Transcript (Online)",
    "otherPossibleNames": [
      "Embedded Accommodation 1  –  Audio Transcript (Online)"
    ],
    "logicalName": "EMBEDDED_ACCOMMODATION_1_AUDIO_TRANSCRIPT_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 111
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EmbeddedAccommodation1-Braille(Online)",
    "otherPossibleNames": ["EmbeddedAccommodation1–Braille(Online)"],
    "logicalName": "EMBEDDED_ACCOMMODATION_1_BRAILLE_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 112
    },
    "fieldLength": 11,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EmbeddedAccommodation1-ClosedCaptioning(Online)",
    "otherPossibleNames": ["EmbeddedAccommodation1–ClosedCaptioning(Online)"],
    "logicalName": "EMBEDDED_ACCOMMODATION_1_CLOSED_CAPTIONING_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 113
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EmbeddedAccommodation1-Streamline(Online)",
    "otherPossibleNames": ["EmbeddedAccommodation1–Streamline(Online)"],
    "logicalName": "EMBEDDED_ACCOMMODATION_1_STREAMLINED_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 114
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EmbeddedAccommodation1-Text-to-SpeechPassages(Online)",
    "otherPossibleNames": [
      "EmbeddedAccommodation1–Text-to-SpeechPassages(Online)"
    ],
    "logicalName": "EMBEDDED_ACCOMMODATION_1_TEXTTOSPEECH_PASSAGES_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 115
    },
    "fieldLength": 12,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Accommodation 2- American Sign Language (Online)",
    "otherPossibleNames": [
      "Embedded Accommodation 2– American Sign Language (Online)"
    ],
    "logicalName": "EMBEDDED_ACCOMMODATION_2_AMERICAN_SIGN_LANGUAGE_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 116
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "EmbeddedAccommodation2-Braille(Online)",
    "otherPossibleNames": ["EmbeddedAccommodation2–Braille(Online)"],
    "logicalName": "EMBEDDED_ACCOMMODATION_2_BRAILLE_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 117
    },
    "fieldLength": 11,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Accommodation 2 - Streamline (Online)",
    "otherPossibleNames": ["Embedded Accommodation 2 – Streamline (Online)"],
    "logicalName": "EMBEDDED_ACCOMMODATION_2_STREAMLINE_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 118
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Accommodation 2 - Text-to-Speech Passages (Online)",
    "otherPossibleNames": [
      "Embedded Accommodation 2 – Text-to-Speech Passages (Online)"
    ],
    "logicalName": "EMBEDDED_ACCOMMODATION_2_TEXTTOSPEECH_PASSAGES_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 119
    },
    "fieldLength": 12,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1 - Abacus (Online)",
    "otherPossibleNames": ["Non–Embedded Accommodation 1 - Abacus (Online)"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1_ABACUS_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 120
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1  - Additional Instructional Supports for Alternate Assessments",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1  - Additional Instructional Supports for Alternate Assessments"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1_ADDITIONAL_INSTRUCTIONAL_SUPPORTSFOR_ALTERNATE_ASSESSMENTS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 121
    },
    "fieldLength": 13,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1  - Alternate Response Options (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1  - Alternate Response Options (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 122
    },
    "fieldLength": 6,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1 - Calculator (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1 - Calculator (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1_CALCULATOR_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 123
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1  -  Multiplication Table  (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1  -  Multiplication Table  (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1_MULTIPLICATION_TABLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 124
    },
    "fieldLength": 6,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1   -  Print on Demand (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1   -  Print on Demand (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1_PRINT_ON_DEMAND",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 125
    },
    "fieldLength": 25,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1  - Read Aloud Passages (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1  - Read Aloud Passages (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1__READ_ALOUD_PASSAGES_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 126
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1  - Scribe (Writing)",
    "otherPossibleNames": ["Non–Embedded Accommodation 1  - Scribe (Writing)"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1__SCRIBE_WRITING",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 127
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1   -  Speech-to-Text  (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1   -  Speech-to-Text  (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1__SPEECHTOTEXT",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 128
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1  -  100s Number Table (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1  -  100s Number Table (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1__100'S_NUMBER_TABLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 129
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1 - Unlisted Resources (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1 - Unlisted Resources (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1_UNLISTED_RESOURCES_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 130
    },
    "fieldLength": 18,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 1  -  Word Prediction (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 1  -  Word Prediction (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_1_WORD_PREDICTION_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 131
    },
    "fieldLength": 12,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2 - Abacus (Online)",
    "otherPossibleNames": ["Non–Embedded Accommodation 2 - Abacus (Online)"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_ABACUS_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 132
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2  - Alternate Response Options (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 2  - Alternate Response Options (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 133
    },
    "fieldLength": 6,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2 - Calculator (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 2 - Calculator (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_CALCULATOR_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 134
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2  -  Multiplication Table (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 2  -  Multiplication Table (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_MULTIPLICATION_TABLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 135
    },
    "fieldLength": 6,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2   -  Print on Demand (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 2   -  Print on Demand (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_PRINT_ON_DEMAND",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 136
    },
    "fieldLength": 25,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2  - Scribe (Writing)",
    "otherPossibleNames": ["Non–Embedded Accommodation 2  - Scribe (Writing)"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_SCRIBE_WRITING",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 137
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2   -  Speech-to-Text  (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 2   -  Speech-to-Text  (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_SPEECHTOTEXT",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 138
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2  - Unlisted Resources (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 2  - Unlisted Resources (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_UNLISTED_RESOURCES_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 139
    },
    "fieldLength": 18,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2  -  Word Prediction (Online) ",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 2  -  Word Prediction (Online) "
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_WORD_PREDICTION_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 140
    },
    "fieldLength": 12,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation 2  -  100s Number Table (Online)",
    "otherPossibleNames": [
      "Non–Embedded Accommodation 2  -  100s Number Table (Online)"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_2_100'S_NUMBER_TABLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 141
    },
    "fieldLength": 10,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1 - Color Contrast (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 1 – Color Contrast (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_COLOR_CONTRAST_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 142
    },
    "fieldLength": 19,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1 - Masking (Online)",
    "otherPossibleNames": ["Embedded Designated Support 1 – Masking (Online)"],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MASKING_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 143
    },
    "fieldLength": 12,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1  -  Mouse Pointer (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 1  –  Mouse Pointer (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_MOUSE_POINTER_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 144
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1 - Permissive Mode (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 1 – Permissive Mode (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_PERMISSIVE_MODE_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 145
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1 - Print Size",
    "otherPossibleNames": ["Embedded Designated Support 1 – Print Size"],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__PRINT_SIZE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 146
    },
    "fieldLength": 9,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1 - Stacked Translations and Translated Test Directions (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 1 – Stacked Translations and Translated Test Directions (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 147
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1 - Text to Speech (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 1 – Text to Speech (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__TEXT_TO_SPEECH_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 148
    },
    "fieldLength": 25,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1 - Translations (Glossary) (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 1 – Translations (Glossary) (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATIONS_GLOSSARY_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 149
    },
    "fieldLength": 38,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 1 - Turn off Universal Tools (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 1 – Turn off Universal Tools (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_1_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
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
    "physicalName": "Embedded Designated Support 2 - Color Contrast (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 2 – Color Contrast (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_COLOR_CONTRAST_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 151
    },
    "fieldLength": 19,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 2 - Masking (Online)",
    "otherPossibleNames": ["Embedded Designated Support 2 – Masking (Online)"],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__MASKING_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 152
    },
    "fieldLength": 12,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 2 - Permissive Mode (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 2 – Permissive Mode (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__PERMISSIVE_MODE_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 153
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 2  -  Mouse Pointer (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 2  –  Mouse Pointer (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_MOUSE_POINTER_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 154
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 2  -  Print Size (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 2  –  Print Size (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__PRINT_SIZE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 155
    },
    "fieldLength": 9,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 2 - Stacked Translations and Translated Test Directions (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 2 – Stacked Translations and Translated Test Directions (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__STACKED_TRANSLATIONS_AND_TRANSLATED_TEST_DIRECTIONS_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 156
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 2 - Text to Speech (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 2 – Text to Speech (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__TEXT_TO_SPEECH_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 157
    },
    "fieldLength": 25,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 2 - Translations (Glossary) (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 2 – Translations (Glossary) (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2__TRANSLATIONS_GLOSSARY_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 158
    },
    "fieldLength": 38,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Embedded Designated Support 2 - Turn off Universal Tools (Online)",
    "otherPossibleNames": [
      "Embedded Designated Support 2 – Turn off Universal Tools (Online)"
    ],
    "logicalName": "EMBEDDED_DESIGNATED_SUPPORT_2_TURN_OFF_UNIVERSAL_TOOLS_ONLINE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 159
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Amplification (Online) ",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Amplification (Online) "
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__AMPLIFICATION",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 160
    },
    "fieldLength": 12,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Calculator (Online) ",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Calculator (Online) "
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__CALCULATOR",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 161
    },
    "fieldLength": 9,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Color Contrast  (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Color Contrast  (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__COLOR_CONTRAST",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 162
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Color Overlay (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Color Overlay (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__COLOR_OVERLAY",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 163
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Magnification (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Magnification (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MAGNIFICATION",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 164
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Multiplication Table (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Multiplication Table (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__MULTIPLICATION_TABLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 165
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Noise Buffers (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Noise Buffers (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__NOISE_BUFFERS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 166
    },
    "fieldLength": 13,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Read Aloud Items (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Read Aloud Items (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__READ_ALOUD__ITEMS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 167
    },
    "fieldLength": 21,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Read Aloud in Spanish (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Read Aloud in Spanish (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__READ_ALOUD_IN_SPANISH",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 168
    },
    "fieldLength": 25,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  - Science Charts (State Approved) (Online) ",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  - Science Charts (State Approved) (Online) "
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SCIENCE_CHARTS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 169
    },
    "fieldLength": 13,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Scribe Items (Non-Writing) (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Scribe Items (Non-Writing) (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SCRIBE_ITEMS_NONWRITING",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 170
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Separate Setting  (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Separate Setting  (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SEPARATE_SETTING",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 171
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Simplified Test Directions  (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Simplified Test Directions  (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__SEPARATE_SETTING",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 172
    },
    "fieldLength": 13,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  Translated Test Directions (PDF on CAASPP.org) (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  Translated Test Directions (PDF on CAASPP.org) (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__TRANSLATED_TEST_DIRECTIONS_PDF_BY_SMARTER_BALANCED",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 173
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 1  -  100s Number table  (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 1  -  100s Number table  (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_1__100S_NUMBER_TABLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 174
    },
    "fieldLength": 11,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Amplification (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Amplification (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__AMPLIFICATION",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 175
    },
    "fieldLength": 12,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Bilingual Dictionary (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Bilingual Dictionary (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__BILINGUAL_DICTIONARY",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 176
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Color Contrast (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Color Contrast (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__COLOR_CONTRAST",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 177
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Color Overlay (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Color Overlay (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__COLOR_OVERLAY",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 178
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Magnification (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Magnification (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__MAGNIFICATION",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 179
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Noise Buffers (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Noise Buffers (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__NOISE_BUFFERS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 180
    },
    "fieldLength": 13,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Read Aloud Items (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Read Aloud Items (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__READ_ALOUD_-_ITEMS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 181
    },
    "fieldLength": 21,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Read Aloud in Spanish (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Read Aloud in Spanish (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__READ_ALOUD_IN_SPANISH",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 182
    },
    "fieldLength": 25,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Scribe Items (Non-Writing) (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Scribe Items (Non-Writing) (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SCRIBE_ITEMS_NONWRITING",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 183
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Separate Setting (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Separate Setting (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2_SEPARATE_SETTING",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 184
    },
    "fieldLength": 7,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Simplified Test Directions (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Simplified Test Directions (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__SIMPLIFIED_TEST_DIRECTIONS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 185
    },
    "fieldLength": 13,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Support 2  -  Translated Test Directions (PDF on CAASPP.org) (Online)",
    "otherPossibleNames": [
      "Non–Embedded Designated Support 2  -  Translated Test Directions (PDF on CAASPP.org) (Online)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORT_2__TRANSLATED_TEST_DIRECTIONS_PDF_BY_SMARTER_BALANCED",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 186
    },
    "fieldLength": 14,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation (Paper) - Abacus",
    "otherPossibleNames": ["Non–Embedded Accommodation (Paper) - Abacus"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__ABACUS",
    "formatMask": null,
    "isFieldRequired": "Y",
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
    "physicalName": "Non-Embedded Accommodation (Paper) - Alternate Response",
    "otherPossibleNames": [
      "Non–Embedded Accommodation (Paper) - Alternate Response"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__ALTERNATE_RESPONSE",
    "formatMask": null,
    "isFieldRequired": "Y",
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
    "physicalName": "Non-Embedded Accommodation  (Paper) - Braille",
    "otherPossibleNames": ["Non–Embedded Accommodation  (Paper) - Braille"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__BRAILLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 190
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation  (Paper) - Calculator",
    "otherPossibleNames": ["Non–Embedded Accommodation  (Paper) - Calculator"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__CALCULATOR",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 191
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation  (Paper) - Large-print",
    "otherPossibleNames": ["Non–Embedded Accommodation  (Paper) - Large-print"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__LARGEPRINT",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 192
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation (Paper) -  Multiplication Table",
    "otherPossibleNames": [
      "Non–Embedded Accommodation (Paper) -  Multiplication Table"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_MULTIPLICATION_TABLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 193
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation (Paper)  -  Read Aloud Passages",
    "otherPossibleNames": [
      "Non–Embedded Accommodation (Paper)  -  Read Aloud Passages"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__READ_ALOUD_PASSAGES",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 195
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation (Paper) - Scribe",
    "otherPossibleNames": ["Non–Embedded Accommodation (Paper) - Scribe"],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__SCRIBE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 196
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation  (Paper) - Speech-to-Text",
    "otherPossibleNames": [
      "Non–Embedded Accommodation  (Paper) - Speech-to-Text"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__SPEECHTOTEXT",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 197
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Accommodation (Paper)  -  100s Number Table",
    "otherPossibleNames": [
      "Non–Embedded Accommodation (Paper)  -  100s Number Table"
    ],
    "logicalName": "NONEMBEDDED_ACCOMMODATION_PAPER__100S_NUMBER_TABLE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 198
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Supports (Paper)  -  Bilingual Dictionary",
    "otherPossibleNames": [
      "Non–Embedded Designated Supports (Paper)  -  Bilingual Dictionary"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__BILINGUAL_DICTIONARY",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 199
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Supports  (Paper) - Read Aloud",
    "otherPossibleNames": [
      "Non–Embedded Designated Supports  (Paper) - Read Aloud"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__READ_ALOUD",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 200
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Supports  (Paper) - Scribe",
    "otherPossibleNames": [
      "Non–Embedded Designated Supports  (Paper) - Scribe"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SCRIBE",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 201
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Supports  (Paper) - Separate Setting",
    "otherPossibleNames": [
      "Non–Embedded Designated Supports  (Paper) - Separate Setting"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SEPARATE_SETTING",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 202
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Supports (Paper) - Simplified Test Directions",
    "otherPossibleNames": [
      "Non–Embedded Designated Supports (Paper) - Simplified Test Directions"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__SIMPLIFIED_TESTDIRECTIONS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 203
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Supports (Paper) - Translated Test Directions",
    "otherPossibleNames": [
      "Non–Embedded Designated Supports (Paper) - Translated Test Directions"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__TRANSLATEDTEST_DIRECTIONS",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 205
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-Embedded Designated Supports (Paper) - Translations (Glossary)",
    "otherPossibleNames": [
      "Non–Embedded Designated Supports (Paper) - Translations (Glossary)"
    ],
    "logicalName": "NONEMBEDDED_DESIGNATED_SUPPORTS_PAPER__TRANSLATIONS_GLOSSARY",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 206
    },
    "fieldLength": 36,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Non-embedded Universal Tools (Paper) - English Dictionary",
    "otherPossibleNames": [
      "Non–embedded Universal Tools (Paper) - English Dictionary"
    ],
    "logicalName": "NONEMBEDDED_UNIVERSAL_TOOLS_PAPER__ENGLISH_DICTIONARY",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 207
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Number of Items attempted 1",
    "otherPossibleNames": ["Number of Items attempted 1"],
    "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 208
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Number of Items attempted 2",
    "otherPossibleNames": ["Number of Items attempted 2"],
    "logicalName": "NUMBER_OF_ITEMS_ATTEMPTED_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 209
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Grade Assessed Current Year minus 1",
    "otherPossibleNames": ["Grade Assessed Current Year minus 1"],
    "logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 210
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank7",
    "otherPossibleNames": ["Blank7"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 211
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Smarter Standard Error Measurement  - SEM Current Year minus 1",
    "otherPossibleNames": [
      "Smarter Standard Error Measurement  – SEM Current Year minus 1"
    ],
    "logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT_SEM_CURRENT_YEAR_MINUS_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 212
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Scale Scores Current Year minus 1",
    "otherPossibleNames": ["Scale Scores Current Year minus 1"],
    "logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 213
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Condition Code Current Year minus 1",
    "otherPossibleNames": ["Condition Code Current Year minus 1"],
    "logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_1",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 214
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank8",
    "otherPossibleNames": ["Blank8"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 215
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank9",
    "otherPossibleNames": ["Blank9"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 216
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank10",
    "otherPossibleNames": ["Blank10"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 217
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank11",
    "otherPossibleNames": ["Blank11"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 218
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank12",
    "otherPossibleNames": ["Blank12"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 219
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank13",
    "otherPossibleNames": ["Blank13"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 220
    },
    "fieldLength": 3,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank14",
    "otherPossibleNames": ["Blank14"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 221
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank15",
    "otherPossibleNames": ["Blank15"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 222
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Grade Assessed Current Year minus 2",
    "otherPossibleNames": ["Grade Assessed Current Year minus 2"],
    "logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 223
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank16",
    "otherPossibleNames": ["Blank16"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 224
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Smarter Standard Error Measurement  - SEM Current Year minus 2",
    "otherPossibleNames": [
      "Smarter Standard Error Measurement  – SEM Current Year minus 2"
    ],
    "logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT__SEM_CURRENT_YEAR_MINUS_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 225
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Scale Scores Current Year minus 2",
    "otherPossibleNames": ["Scale Scores Current Year minus 2"],
    "logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 226
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Condition Code Current Year minus 2",
    "otherPossibleNames": ["Condition Code Current Year minus 2"],
    "logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_2",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 227
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank17",
    "otherPossibleNames": ["Blank17"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 228
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank18",
    "otherPossibleNames": ["Blank18"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 229
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank19",
    "otherPossibleNames": ["Blank19"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 230
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank20",
    "otherPossibleNames": ["Blank20"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 231
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank21",
    "otherPossibleNames": ["Blank21"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 232
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank22",
    "otherPossibleNames": ["Blank22"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 233
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank23",
    "otherPossibleNames": ["Blank23"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 234
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank24",
    "otherPossibleNames": ["Blank24"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 235
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Grade Assessed Current Year minus 3",
    "otherPossibleNames": ["Grade Assessed Current Year minus 3"],
    "logicalName": "GRADE_ASSESSED_CURRENT_YEAR_MINUS_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 236
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank25",
    "otherPossibleNames": ["Blank25"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 237
    },
    "fieldLength": 8,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Smarter Standard Error Measurement  - SEM Current Year minus 3",
    "otherPossibleNames": [
      "Smarter Standard Error Measurement  – SEM Current Year minus 3"
    ],
    "logicalName": "SMARTER_STANDARD_ERROR_MEASUREMENT__SEM_CURRENT_YEAR_MINUS_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 238
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Scale Scores Current Year minus 3",
    "otherPossibleNames": ["Scale Scores Current Year minus 3"],
    "logicalName": "SCALE_SCORES_CURRENT_YEAR_MINUS_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 239
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Condition Code Current Year minus 3",
    "otherPossibleNames": ["Condition Code Current Year minus 3"],
    "logicalName": "CONDITION_CODE_CURRENT_YEAR_MINUS_3",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 240
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank26",
    "otherPossibleNames": ["Blank26"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 241
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank27",
    "otherPossibleNames": ["Blank27"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 242
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank28",
    "otherPossibleNames": ["Blank28"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 243
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank29",
    "otherPossibleNames": ["Blank29"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 244
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank30",
    "otherPossibleNames": ["Blank30"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 245
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank31",
    "otherPossibleNames": ["Blank31"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 246
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank32",
    "otherPossibleNames": ["Blank32"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 247
    },
    "fieldLength": 1,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank33",
    "otherPossibleNames": ["Blank33"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 248
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank34",
    "otherPossibleNames": ["Blank34"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 249
    },
    "fieldLength": 4,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "UIN (Unique Identification Number)",
    "otherPossibleNames": ["UIN (Unique Identification Number)"],
    "logicalName": "UIN",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 250
    },
    "fieldLength": 16,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "Blank35",
    "otherPossibleNames": ["Blank35"],
    "logicalName": "null",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 251
    },
    "fieldLength": 60,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  },
  {
    "physicalName": "End of Record",
    "otherPossibleNames": ["End of Record"],
    "logicalName": "END_OF_RECORD",
    "formatMask": null,
    "isFieldRequired": "Y",
    "canBeNull": "Y",
    "fieldOffset": {
      "offsetStart": 0,
      "offsetEnd": 0,
      "columnNum": 252
    },
    "fieldLength": 2,
    "expectedValues": [],
    "dataTypes": "STRING",
    "scale": null
  }
]

  },
  "fileExtensions": [".csv"]
}