{
	"encoding": "UTF-8",
	"format": {
		"@type": "Fixed Length",
		"formatName": "ELPAC_FIXED_LENGTH_21_22",
		"recordLength": 4114,
		"naturalKey": ["STUDENT_LOCAL_ID", "TESTING_COMPLETED_DATE_FINAL"],
		"fields": [{
				"physicalName": "RecordType",
				"otherPossibleNames": [],
				"logicalName": "ASSESSMENT_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1,
					"offsetEnd": 2,
					"columnNum": 1
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UIN",
				"otherPossibleNames": [],
				"logicalName": "UIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3,
					"offsetEnd": 18,
					"columnNum": 2
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
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
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 35,
					"offsetEnd": 50,
					"columnNum": 4
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SSID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 51,
					"offsetEnd": 60,
					"columnNum": 5
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LocalStudentID",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LOCAL_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 61,
					"offsetEnd": 75,
					"columnNum": 6
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "LocalUse",
				"otherPossibleNames": [],
				"logicalName": "OPTIONAL-LOCAL_USE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 76,
					"offsetEnd": 90,
					"columnNum": 7
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentLastName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 91,
					"offsetEnd": 140,
					"columnNum": 8
				},
				"fieldLength": 50,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentFirstName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 141,
					"offsetEnd": 170,
					"columnNum": 9
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentMiddleName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 171,
					"offsetEnd": 200,
					"columnNum": 10
				},
				"fieldLength": 30,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 205,
					"columnNum": 11
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "BLANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 201,
					"offsetEnd": 205,
					"columnNum": 12
				},
				"fieldLength": 5,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DateofBirth",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 206,
					"offsetEnd": 215,
					"columnNum": 13
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DateofBirthforTesting",
				"otherPossibleNames": [],
				"logicalName": "DATE_OF_BIRTH_FOR_TESTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 216,
					"offsetEnd": 225,
					"columnNum": 14
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 226,
					"offsetEnd": 226,
					"columnNum": 15
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSGrade",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 227,
					"offsetEnd": 228,
					"columnNum": 16
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GradeAssessed",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 229,
					"offsetEnd": 230,
					"columnNum": 17
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSDistrictCode",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_DISTRICT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 231,
					"offsetEnd": 244,
					"columnNum": 18
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSDistrictName",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_DISTRICT_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 245,
					"offsetEnd": 344,
					"columnNum": 19
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSSchoolCode",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 345,
					"offsetEnd": 358,
					"columnNum": 20
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSSchoolName",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_SCHOOL_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 359,
					"offsetEnd": 458,
					"columnNum": 21
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSCharterCode",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_CHARTER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 459,
					"offsetEnd": 462,
					"columnNum": 22
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSCharterSchoolIndicator",
				"otherPossibleNames": [],
				"logicalName": "CALPADS_CHARTER_SCHOOL_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 463,
					"offsetEnd": 464,
					"columnNum": 23
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SPEDAcctDist",
				"otherPossibleNames": [],
				"logicalName": "SPECIAL_EDUCATION_DISTRICT_OF_ACCOUNTABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 465,
					"offsetEnd": 471,
					"columnNum": 24
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NPSSchoolFlag",
				"otherPossibleNames": [],
				"logicalName": "NPS_SCHOOL_FLAG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 472,
					"offsetEnd": 472,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Section504Status",
				"otherPossibleNames": [],
				"logicalName": "SECTION_504_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 473,
					"offsetEnd": 475,
					"columnNum": 26
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSIDEAIndicator",
				"otherPossibleNames": [],
				"logicalName": "IDEA_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 476,
					"offsetEnd": 478,
					"columnNum": 27
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IDEAIndicatorforTesting",
				"otherPossibleNames": [],
				"logicalName": "IDEA_INDICATOR_FOR_TESTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 479,
					"offsetEnd": 481,
					"columnNum": 28
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PrimaryDisabilityType",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_DISABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 482,
					"offsetEnd": 484,
					"columnNum": 29
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PrimaryDisabilityforTesting",
				"otherPossibleNames": [],
				"logicalName": "PRIMARY_DISABILITY_FOR_TESTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 485,
					"offsetEnd": 487,
					"columnNum": 30
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MigrantStatus",
				"otherPossibleNames": [],
				"logicalName": "MIGRANT_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 488,
					"offsetEnd": 490,
					"columnNum": 31
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELEntryDate",
				"otherPossibleNames": [],
				"logicalName": "EL_ENTRY_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 491,
					"offsetEnd": 500,
					"columnNum": 32
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELExitDate",
				"otherPossibleNames": [],
				"logicalName": "EL_EXIT_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 501,
					"offsetEnd": 510,
					"columnNum": 33
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELStatus",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LEARNER_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 511,
					"offsetEnd": 513,
					"columnNum": 34
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FirstEntryDateInUSSchool",
				"otherPossibleNames": [],
				"logicalName": "FIRST_ENTRY_DATE_IN_US_SCHOOL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 514,
					"offsetEnd": 523,
					"columnNum": 35
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELASforTesting",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_LANGUAGE_ACQUISITION_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 524,
					"offsetEnd": 525,
					"columnNum": 36
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CALPADSPrimaryLanguage",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 526,
					"offsetEnd": 527,
					"columnNum": 37
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PrimaryLanguageforTesting",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGE_CODE_FOR_TESTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 528,
					"offsetEnd": 529,
					"columnNum": 38
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CEDSLanguageCode",
				"otherPossibleNames": [],
				"logicalName": "LANGUAGE_CODE_CEDS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 530,
					"offsetEnd": 532,
					"columnNum": 39
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MilitaryStatus",
				"otherPossibleNames": [],
				"logicalName": "MILITARY_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 533,
					"offsetEnd": 535,
					"columnNum": 40
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FosterStatus",
				"otherPossibleNames": [],
				"logicalName": "FOSTER_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 536,
					"offsetEnd": 538,
					"columnNum": 41
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HomelessStatus",
				"otherPossibleNames": [],
				"logicalName": "HOMELESS_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 539,
					"offsetEnd": 541,
					"columnNum": 42
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EconomicDisadvantageStatus",
				"otherPossibleNames": [],
				"logicalName": "ECONOMIC_DISADVANTAGE_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 542,
					"offsetEnd": 544,
					"columnNum": 43
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EconomicDisadvantageTesting",
				"otherPossibleNames": [],
				"logicalName": "ECONOMIC_DISADVANTAGE_STATUS_FOR_TESTING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 545,
					"offsetEnd": 547,
					"columnNum": 44
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HispanicorLatino",
				"otherPossibleNames": [],
				"logicalName": "HISPANIC_OR_LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 548,
					"offsetEnd": 550,
					"columnNum": 45
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AmericanIndianorAlaskaNative",
				"otherPossibleNames": [],
				"logicalName": "AMERICAN_INDIAN_OR_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 551,
					"offsetEnd": 553,
					"columnNum": 46
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Asian",
				"otherPossibleNames": [],
				"logicalName": "ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 554,
					"offsetEnd": 556,
					"columnNum": 47
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "BlackorAfricanAmerican",
				"otherPossibleNames": [],
				"logicalName": "BLACK_OR_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 557,
					"offsetEnd": 559,
					"columnNum": 48
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "White",
				"otherPossibleNames": [],
				"logicalName": "WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 560,
					"offsetEnd": 562,
					"columnNum": 49
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HawaiianOrOtherPacificIslander",
				"otherPossibleNames": [],
				"logicalName": "NATIVE_HAWAIIAN_OR_OTHER_PACIFIC_ISLANDER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 563,
					"offsetEnd": 565,
					"columnNum": 50
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Filipino",
				"otherPossibleNames": [],
				"logicalName": "FILIPINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 566,
					"offsetEnd": 568,
					"columnNum": 51
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TwoorMoreRaces",
				"otherPossibleNames": [],
				"logicalName": "TWO_OR_MORE_RACES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 569,
					"offsetEnd": 571,
					"columnNum": 52
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReportingEthnicity",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_RACE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 572,
					"offsetEnd": 574,
					"columnNum": 53
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ParentEducationLevel",
				"otherPossibleNames": [],
				"logicalName": "PARENT_EDUCATION_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 575,
					"offsetEnd": 576,
					"columnNum": 54
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentAddressLine1",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_LINE_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 577,
					"offsetEnd": 636,
					"columnNum": 55
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentAddressLine2",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS_LINE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 637,
					"offsetEnd": 696,
					"columnNum": 56
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentAddressCityName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 697,
					"offsetEnd": 756,
					"columnNum": 57
				},
				"fieldLength": 60,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentAddressStateName",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 757,
					"offsetEnd": 762,
					"columnNum": 58
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentAddressZipCode",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_POSTAL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 763,
					"offsetEnd": 774,
					"columnNum": 59
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedStatus",
				"otherPossibleNames": [],
				"logicalName": "TESTED_STATUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 775,
					"offsetEnd": 775,
					"columnNum": 60
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ScoreAvailableDate",
				"otherPossibleNames": [],
				"logicalName": "SCORE_AVAILABLE_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 776,
					"offsetEnd": 785,
					"columnNum": 61
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictName1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 786,
					"offsetEnd": 885,
					"columnNum": 62
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictCode1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 886,
					"offsetEnd": 899,
					"columnNum": 63
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolName1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 900,
					"offsetEnd": 999,
					"columnNum": 64
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolCode1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1000,
					"offsetEnd": 1013,
					"columnNum": 65
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterSchoolIndicator1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1014,
					"offsetEnd": 1015,
					"columnNum": 66
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterCode1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1016,
					"offsetEnd": 1019,
					"columnNum": 67
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolNPSFlag1",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1020,
					"offsetEnd": 1020,
					"columnNum": 68
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStartDate1",
				"otherPossibleNames": [],
				"logicalName": "TESTING_START_DATE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1021,
					"offsetEnd": 1030,
					"columnNum": 69
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCompletedDate1",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1031,
					"offsetEnd": 1040,
					"columnNum": 70
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictName2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1041,
					"offsetEnd": 1140,
					"columnNum": 71
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictCode2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1141,
					"offsetEnd": 1154,
					"columnNum": 72
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolName2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1155,
					"offsetEnd": 1254,
					"columnNum": 73
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolCode2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1255,
					"offsetEnd": 1268,
					"columnNum": 74
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterSchoolIndicator2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1269,
					"offsetEnd": 1270,
					"columnNum": 75
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterCode2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1271,
					"offsetEnd": 1274,
					"columnNum": 76
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolNPSFlag2",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1275,
					"offsetEnd": 1275,
					"columnNum": 77
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStartDate2",
				"otherPossibleNames": [],
				"logicalName": "TESTING_START_DATE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1276,
					"offsetEnd": 1285,
					"columnNum": 78
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCompletedDate2",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1286,
					"offsetEnd": 1295,
					"columnNum": 79
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictName3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1296,
					"offsetEnd": 1395,
					"columnNum": 80
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictCode3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1396,
					"offsetEnd": 1409,
					"columnNum": 81
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolName3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1410,
					"offsetEnd": 1509,
					"columnNum": 82
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolCode3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1510,
					"offsetEnd": 1523,
					"columnNum": 83
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterSchoolIndicator3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1524,
					"offsetEnd": 1525,
					"columnNum": 84
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterCode3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1526,
					"offsetEnd": 1529,
					"columnNum": 85
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolNPSFlag3",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1530,
					"offsetEnd": 1530,
					"columnNum": 86
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStartDate3",
				"otherPossibleNames": [],
				"logicalName": "TESTING_START_DATE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1531,
					"offsetEnd": 1540,
					"columnNum": 87
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCompletedDate3",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1541,
					"offsetEnd": 1550,
					"columnNum": 88
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictName4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1551,
					"offsetEnd": 1650,
					"columnNum": 89
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedDistrictCode4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1651,
					"offsetEnd": 1664,
					"columnNum": 90
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolName4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1665,
					"offsetEnd": 1764,
					"columnNum": 91
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolCode4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1765,
					"offsetEnd": 1778,
					"columnNum": 92
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterSchoolIndicator4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1779,
					"offsetEnd": 1780,
					"columnNum": 93
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedCharterCode4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1781,
					"offsetEnd": 1784,
					"columnNum": 94
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestedSchoolNPSFlag4",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1785,
					"offsetEnd": 1785,
					"columnNum": 95
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestStartDate4",
				"otherPossibleNames": [],
				"logicalName": "TESTING_START_DATE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1786,
					"offsetEnd": 1795,
					"columnNum": 96
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestCompletedDate4",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1796,
					"offsetEnd": 1805,
					"columnNum": 97
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FinalTestedDistrictName",
				"otherPossibleNames": [],
				"logicalName": "TESTED_LEA_NAME_FINAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1806,
					"offsetEnd": 1905,
					"columnNum": 98
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FinalTestedDistrictCode",
				"otherPossibleNames": [],
				"logicalName": "TESTED_COUNTY_DISTRICT_CODE_FINAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1906,
					"offsetEnd": 1919,
					"columnNum": 99
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FinalTestedSchoolName",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NAME_FINAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 1920,
					"offsetEnd": 2019,
					"columnNum": 100
				},
				"fieldLength": 100,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FinalTestedSchoolCode",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_CODE_FINAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2020,
					"offsetEnd": 2033,
					"columnNum": 101
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FinalTestedCharterSchoolIndicator",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_INDICATOR_FINAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2034,
					"offsetEnd": 2035,
					"columnNum": 102
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FinalTestedCharterCode",
				"otherPossibleNames": [],
				"logicalName": "TESTED_CHARTER_SCHOOL_CODE_FINAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2036,
					"offsetEnd": 2039,
					"columnNum": 103
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FinalTestedSchoolNPSFlag",
				"otherPossibleNames": [],
				"logicalName": "TESTED_SCHOOL_NPS_FLAG_FINAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2040,
					"offsetEnd": 2040,
					"columnNum": 104
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "FinalTestCompletedDate",
				"otherPossibleNames": [],
				"logicalName": "TESTING_COMPLETED_DATE_FINAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2041,
					"offsetEnd": 2050,
					"columnNum": 105
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityID1",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2051,
					"offsetEnd": 2066,
					"columnNum": 106
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityTestingStatus1",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2067,
					"offsetEnd": 2067,
					"columnNum": 107
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityID2",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2068,
					"offsetEnd": 2083,
					"columnNum": 108
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityTestingStatus2",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2084,
					"offsetEnd": 2084,
					"columnNum": 109
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityID3",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2085,
					"offsetEnd": 2100,
					"columnNum": 110
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityTestingStatus3",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2101,
					"offsetEnd": 2101,
					"columnNum": 111
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityID4",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_ID_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2102,
					"offsetEnd": 2117,
					"columnNum": 112
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OpportunityTestingStatus4",
				"otherPossibleNames": [],
				"logicalName": "OPPORTUNITY_TESTING_STATUS_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2118,
					"offsetEnd": 2118,
					"columnNum": 113
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentExitCode",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2119,
					"offsetEnd": 2122,
					"columnNum": 114
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentExitWithdrawalDate",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_EXIT_WITHDRAWAL_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2123,
					"offsetEnd": 2132,
					"columnNum": 115
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StudentRemovedCALPADSFileDate",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_REMOVED_FROM_CALPADS_FILE_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2133,
					"offsetEnd": 2142,
					"columnNum": 116
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ConditionCode",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2143,
					"offsetEnd": 2145,
					"columnNum": 117
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Attemptedness",
				"otherPossibleNames": [],
				"logicalName": "ATTEMPTEDNESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2146,
					"offsetEnd": 2146,
					"columnNum": 118
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IncludeIndicator",
				"otherPossibleNames": [],
				"logicalName": "INCLUDE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2147,
					"offsetEnd": 2147,
					"columnNum": 119
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UnlistedResources1",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCES_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2148,
					"offsetEnd": 2148,
					"columnNum": 120
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UnlistedResources2",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCES_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2149,
					"offsetEnd": 2149,
					"columnNum": 121
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UnlistedResources3",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCES_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2150,
					"offsetEnd": 2150,
					"columnNum": 122
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "UnlistedResources4",
				"otherPossibleNames": [],
				"logicalName": "UNLISTED_RESOURCES_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2151,
					"offsetEnd": 2151,
					"columnNum": 123
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SSREligible",
				"otherPossibleNames": [],
				"logicalName": "SSR_ELIGIBLE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2152,
					"offsetEnd": 2152,
					"columnNum": 124
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemoteTester1",
				"otherPossibleNames": [],
				"logicalName": "REMOTE_TESTER_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2153,
					"offsetEnd": 2153,
					"columnNum": 125
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemoteTester2",
				"otherPossibleNames": [],
				"logicalName": "REMOTE_TESTER_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2154,
					"offsetEnd": 2154,
					"columnNum": 126
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemoteTester3",
				"otherPossibleNames": [],
				"logicalName": "REMOTE_TESTER_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2155,
					"offsetEnd": 2155,
					"columnNum": 127
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RemoteTester4",
				"otherPossibleNames": [],
				"logicalName": "REMOTE_TESTER_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2156,
					"offsetEnd": 2156,
					"columnNum": 128
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestMode1",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2157,
					"offsetEnd": 2157,
					"columnNum": 129
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestMode2",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2158,
					"offsetEnd": 2158,
					"columnNum": 130
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestMode3",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2159,
					"offsetEnd": 2159,
					"columnNum": 131
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "TestMode4",
				"otherPossibleNames": [],
				"logicalName": "TEST_MODE_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2160,
					"offsetEnd": 2160,
					"columnNum": 132
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ForceComplete",
				"otherPossibleNames": [],
				"logicalName": "FORCE_COMPLETE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2161,
					"offsetEnd": 2161,
					"columnNum": 133
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Blank",
				"otherPossibleNames": [],
				"logicalName": "Bkank",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2162,
					"offsetEnd": 2164,
					"columnNum": 134
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RawScore1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2165,
					"offsetEnd": 2166,
					"columnNum": 135
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RawScore2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2167,
					"offsetEnd": 2168,
					"columnNum": 136
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RawScore3",
				"otherPossibleNames": [],
				"logicalName": "READING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2169,
					"offsetEnd": 2170,
					"columnNum": 137
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "RawScore4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2171,
					"offsetEnd": 2172,
					"columnNum": 138
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallScaleScore",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2173,
					"offsetEnd": 2176,
					"columnNum": 139
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Percent Correct",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2177,
					"offsetEnd": 2179,
					"columnNum": 140
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguageScaleScore",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2180,
					"offsetEnd": 2183,
					"columnNum": 141
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguageScaleScore",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_SCALE_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2184,
					"offsetEnd": 2187,
					"columnNum": 142
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallPL",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2188,
					"offsetEnd": 2189,
					"columnNum": 143
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "PreliminaryIndicator",
				"otherPossibleNames": [],
				"logicalName": "PRELIMINARY_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2190,
					"offsetEnd": 2191,
					"columnNum": 144
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguagePL",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2192,
					"offsetEnd": 2193,
					"columnNum": 145
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguagePL",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2194,
					"offsetEnd": 2195,
					"columnNum": 146
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallScaleScoreCSEM",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_SCALE_SCORE_STANDARD_ERROR_OF_MEASUREMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2196,
					"offsetEnd": 2198,
					"columnNum": 147
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguageCSEM",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2199,
					"offsetEnd": 2201,
					"columnNum": 148
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguageCSEM",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2202,
					"offsetEnd": 2204,
					"columnNum": 149
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ListeningPL",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2205,
					"offsetEnd": 2206,
					"columnNum": 150
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SpeakingPL",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2207,
					"offsetEnd": 2208,
					"columnNum": 151
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReadingPL",
				"otherPossibleNames": [],
				"logicalName": "READING_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2209,
					"offsetEnd": 2210,
					"columnNum": 152
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WritingPL",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERFORMANCE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2211,
					"offsetEnd": 2212,
					"columnNum": 153
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DomainEx1",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_EXEMPTION_LISTENING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2213,
					"offsetEnd": 2213,
					"columnNum": 154
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DomainEx2",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_EXEMPTION_SPEAKING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2214,
					"offsetEnd": 2214,
					"columnNum": 155
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DomainEx3",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_EXEMPTION_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2215,
					"offsetEnd": 2215,
					"columnNum": 156
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DomainEx4",
				"otherPossibleNames": [],
				"logicalName": "DOMAIN_EXEMPTION_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2216,
					"offsetEnd": 2216,
					"columnNum": 157
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallNumberAnswered",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_NUMBER_ANSWERED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2217,
					"offsetEnd": 2219,
					"columnNum": 158
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ItemsAttempted1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NUMBER_OF_ITEMS_ATTEMPTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2220,
					"offsetEnd": 2222,
					"columnNum": 159
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ItemsAttempted2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NUMBER_OF_ITEMS_ATTEMPTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2223,
					"offsetEnd": 2225,
					"columnNum": 160
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ItemsAttempted3",
				"otherPossibleNames": [],
				"logicalName": "READING_NUMBER_OF_ITEMS_ATTEMPTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2226,
					"offsetEnd": 2228,
					"columnNum": 161
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ItemsAttempted4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NUMBER_OF_ITEMS_ATTEMPTED",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2229,
					"offsetEnd": 2231,
					"columnNum": 162
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AccommodationsIndicator",
				"otherPossibleNames": [],
				"logicalName": "ACCOMODATION_AVAILABLE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2232,
					"offsetEnd": 2234,
					"columnNum": 163
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DesignatedSupportIndicator",
				"otherPossibleNames": [],
				"logicalName": "DESIGNATED_SUPPORT_AVAILABLE_INDICATOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2235,
					"offsetEnd": 2237,
					"columnNum": 164
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAmericanSignLanguage1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_ACCOMODATION_AMERICAN_SIGN_LANGUAGE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2238,
					"offsetEnd": 2245,
					"columnNum": 165
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAmericanSignLanguage2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_ACCOMODATION_AMERICAN_SIGN_LANGUAGE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2246,
					"offsetEnd": 2253,
					"columnNum": 166
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAudioScript1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_ACCOMODATION_AUDIO_TRANSCRIPT_INCLUDES_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2254,
					"offsetEnd": 2269,
					"columnNum": 167
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAudioScript2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_ACCOMODATION_AUDIO_TRANSCRIPT_INCLUDES_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2270,
					"offsetEnd": 2285,
					"columnNum": 168
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAudioScript3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_ACCOMODATION_AUDIO_TRANSCRIPT_INCLUDES_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2286,
					"offsetEnd": 2301,
					"columnNum": 169
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAAudioScript4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_ACCOMODATION_AUDIO_TRANSCRIPT_INCLUDES_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2302,
					"offsetEnd": 2317,
					"columnNum": 170
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EABraille1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_ACCOMODATION_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2318,
					"offsetEnd": 2328,
					"columnNum": 171
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EABraille2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_ACCOMODATION_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2329,
					"offsetEnd": 2339,
					"columnNum": 172
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EABraille3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_ACCOMODATION_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2340,
					"offsetEnd": 2350,
					"columnNum": 173
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EABraille4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_ACCOMODATION_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2351,
					"offsetEnd": 2361,
					"columnNum": 174
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAClosedCaptioning1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_ACCOMODATION_CLOSED_CAPTIONING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2362,
					"offsetEnd": 2375,
					"columnNum": 175
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAClosedCaptioning2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_ACCOMODATION_CLOSED_CAPTIONING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2376,
					"offsetEnd": 2389,
					"columnNum": 176
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAClosedCaptioning3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_ACCOMODATION_CLOSED_CAPTIONING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2390,
					"offsetEnd": 2403,
					"columnNum": 177
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EAClosedCaptioning4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_ACCOMODATION_CLOSED_CAPTIONING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2404,
					"offsetEnd": 2417,
					"columnNum": 178
				},
				"fieldLength": 14,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EASpeechtoText1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_ACCOMODATION_SPEECH_TO_TEXT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2418,
					"offsetEnd": 2432,
					"columnNum": 179
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EASpeechtoText2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_ACCOMODATION_SPEECH_TO_TEXT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2433,
					"offsetEnd": 2447,
					"columnNum": 180
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EASpeechtoText3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_ACCOMODATION_SPEECH_TO_TEXT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2448,
					"offsetEnd": 2462,
					"columnNum": 181
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EASpeechtoText4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_ACCOMODATION_SPEECH_TO_TEXT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2463,
					"offsetEnd": 2477,
					"columnNum": 182
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EATexttoSpeech1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_ACCOMODATION_TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2478,
					"offsetEnd": 2502,
					"columnNum": 183
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EATexttoSpeech2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_ACCOMODATION_TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2503,
					"offsetEnd": 2527,
					"columnNum": 184
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EATexttoSpeech4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_ACCOMODATION_TEXT_TO_SPEECH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2528,
					"offsetEnd": 2552,
					"columnNum": 185
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAdditionalInstructionalSupports1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_INSTRUCTIONAL_SUPPORTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2553,
					"offsetEnd": 2565,
					"columnNum": 186
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAlternateResponseOptions1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2566,
					"offsetEnd": 2571,
					"columnNum": 187
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAlternateResponseOptions2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2572,
					"offsetEnd": 2577,
					"columnNum": 188
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAlternateResponseOptions3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2578,
					"offsetEnd": 2583,
					"columnNum": 189
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAlternateResponseOptions4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_ALTERNATE_RESPONSE_OPTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2584,
					"offsetEnd": 2589,
					"columnNum": 190
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAManuallyCodedEnglish1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_MANUALLY_CODED_ENGLISH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2590,
					"offsetEnd": 2613,
					"columnNum": 191
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAManuallyCodedEnglish2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_MANUALLY_CODED_ENGLISH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2614,
					"offsetEnd": 2637,
					"columnNum": 192
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAManuallyCodedEnglish3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_MANUALLY_CODED_ENGLISH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2638,
					"offsetEnd": 2661,
					"columnNum": 193
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAManuallyCodedEnglish4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_MANUALLY_CODED_ENGLISH_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2662,
					"offsetEnd": 2685,
					"columnNum": 194
				},
				"fieldLength": 24,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAudioScript1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_AUDIO_SCRIPT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2686,
					"offsetEnd": 2701,
					"columnNum": 195
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAudioScript2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_AUDIO_SCRIPT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2702,
					"offsetEnd": 2717,
					"columnNum": 196
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAudioScript3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_AUDIO_SCRIPT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2718,
					"offsetEnd": 2733,
					"columnNum": 197
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAAudioScript4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_AUDIO_SCRIPT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2734,
					"offsetEnd": 2749,
					"columnNum": 198
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABreaks1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_BREAKS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2750,
					"offsetEnd": 2759,
					"columnNum": 199
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABreaks2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_BREAKS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2760,
					"offsetEnd": 2769,
					"columnNum": 200
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABreaks3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_BREAKS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2770,
					"offsetEnd": 2779,
					"columnNum": 201
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABreaks4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_BREAKS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2780,
					"offsetEnd": 2789,
					"columnNum": 202
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABraille1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2790,
					"offsetEnd": 2800,
					"columnNum": 203
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABraille2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2801,
					"offsetEnd": 2811,
					"columnNum": 204
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABraille3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2812,
					"offsetEnd": 2822,
					"columnNum": 205
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEABraille4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_BRAILLE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2823,
					"offsetEnd": 2833,
					"columnNum": 206
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAScribe1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_SCRIBE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2834,
					"offsetEnd": 2849,
					"columnNum": 207
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAScribe2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_SCRIBE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2850,
					"offsetEnd": 2865,
					"columnNum": 208
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAScribe3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_SCRIBE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2866,
					"offsetEnd": 2881,
					"columnNum": 209
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAScribe4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_SCRIBE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2882,
					"offsetEnd": 2897,
					"columnNum": 210
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEASpeechtoText1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_SPEECH_TO_TEXT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2898,
					"offsetEnd": 2904,
					"columnNum": 211
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEASpeechtoText2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_SPEECH_TO_TEXT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2905,
					"offsetEnd": 2911,
					"columnNum": 212
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEASpeechtoText3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_SPEECH_TO_TEXT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2912,
					"offsetEnd": 2918,
					"columnNum": 213
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEASpeechtoText4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_SPEECH_TO_TEXT_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2919,
					"offsetEnd": 2925,
					"columnNum": 214
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEALargeVersionsofPaper1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_LARGE_PAPER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2926,
					"offsetEnd": 2931,
					"columnNum": 215
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEALargeVersionsofPaper2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_LARGE_PAPER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2932,
					"offsetEnd": 2937,
					"columnNum": 216
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEALargeVersionsofPaper3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_LARGE_PAPER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2938,
					"offsetEnd": 2943,
					"columnNum": 217
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEALargeVersionsofPaper4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_LARGE_PAPER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2944,
					"offsetEnd": 2949,
					"columnNum": 218
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAUnlisted Resources1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2950,
					"offsetEnd": 2967,
					"columnNum": 219
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAUnlisted Resources2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2968,
					"offsetEnd": 2985,
					"columnNum": 220
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAUnlisted Resources3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 2986,
					"offsetEnd": 3003,
					"columnNum": 221
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAUnlisted Resources4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_UNLISTED_RESOURCES_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3004,
					"offsetEnd": 3021,
					"columnNum": 222
				},
				"fieldLength": 18,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAWordProcessor1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_ACCOMODATION_WORD_PROCESSOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3022,
					"offsetEnd": 3027,
					"columnNum": 223
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAWordProcessor2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_ACCOMODATION_WORD_PROCESSOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3028,
					"offsetEnd": 3033,
					"columnNum": 224
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAWordProcessor3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_ACCOMODATION_WORD_PROCESSOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3034,
					"offsetEnd": 3039,
					"columnNum": 225
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEAWordProcessor4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_ACCOMODATION_WORD_PROCESSOR_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3040,
					"offsetEnd": 3045,
					"columnNum": 226
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSColorContrast1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_DESIGNED_SUPPORT_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3046,
					"offsetEnd": 3064,
					"columnNum": 227
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSColorContrast2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_DESIGNED_SUPPORT_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3065,
					"offsetEnd": 3083,
					"columnNum": 228
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSColorContrast3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_DESIGNED_SUPPORT_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3084,
					"offsetEnd": 3102,
					"columnNum": 229
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSColorContrast4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_DESIGNED_SUPPORT_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3103,
					"offsetEnd": 3121,
					"columnNum": 230
				},
				"fieldLength": 19,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMasking1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_DESIGNED_SUPPORT_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3122,
					"offsetEnd": 3133,
					"columnNum": 231
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMasking2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_DESIGNED_SUPPORT_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3134,
					"offsetEnd": 3145,
					"columnNum": 232
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMasking3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_DESIGNED_SUPPORT_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3146,
					"offsetEnd": 3157,
					"columnNum": 233
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMasking4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_DESIGNED_SUPPORT_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3158,
					"offsetEnd": 3169,
					"columnNum": 234
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMousePointer1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_DESIGNED_SUPPORT_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3170,
					"offsetEnd": 3185,
					"columnNum": 235
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMousePointer2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_DESIGNED_SUPPORT_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3186,
					"offsetEnd": 3201,
					"columnNum": 236
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMousePointer3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_DESIGNED_SUPPORT_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3202,
					"offsetEnd": 3217,
					"columnNum": 237
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSMousePointer4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_DESIGNED_SUPPORT_MOUSE_POINTER_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3218,
					"offsetEnd": 3233,
					"columnNum": 238
				},
				"fieldLength": 16,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPauseorReplayAudio1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_DESIGNED_PAUSE_AND_REPLAY_AUDIO_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3234,
					"offsetEnd": 3242,
					"columnNum": 239
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPauseorReplayAudio2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_DESIGNED_PAUSE_AND_REPLAY_AUDIO_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3243,
					"offsetEnd": 3251,
					"columnNum": 240
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPermissiveMode1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_DESIGNED_SUPPORT_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3252,
					"offsetEnd": 3258,
					"columnNum": 241
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPermissiveMode2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_DESIGNED_SUPPORT_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3259,
					"offsetEnd": 3265,
					"columnNum": 242
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPermissiveMode3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_DESIGNED_SUPPORT_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3266,
					"offsetEnd": 3272,
					"columnNum": 243
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPermissiveMode4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_DESIGNED_SUPPORT_PERMISSIVE_MODE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3273,
					"offsetEnd": 3279,
					"columnNum": 244
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPrintSize1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_DESIGNED_SUPPORT_PRINT_SIZE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3280,
					"offsetEnd": 3288,
					"columnNum": 245
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPrintSize2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_DESIGNED_SUPPORT_PRINT_SIZE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3289,
					"offsetEnd": 3297,
					"columnNum": 246
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPrintSize3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_DESIGNED_SUPPORT_PRINT_SIZE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3298,
					"offsetEnd": 3306,
					"columnNum": 247
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSPrintSize4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_DESIGNED_SUPPORT_PRINT_SIZE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3307,
					"offsetEnd": 3315,
					"columnNum": 248
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSStreamline1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_DESIGNED_SUPPORT_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3316,
					"offsetEnd": 3323,
					"columnNum": 249
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSStreamline2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_DESIGNED_SUPPORT_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3324,
					"offsetEnd": 3331,
					"columnNum": 250
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSStreamline3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_DESIGNED_SUPPORT_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3332,
					"offsetEnd": 3339,
					"columnNum": 251
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSStreamline4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_DESIGNED_SUPPORT_STREAMLINE_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3340,
					"offsetEnd": 3347,
					"columnNum": 252
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSTurnOffAnyUniversalTool1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_EMBEDDED_DESIGNED_SUPPORT_TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3348,
					"offsetEnd": 3354,
					"columnNum": 253
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSTurnOffAnyUniversalTool2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_EMBEDDED_DESIGNED_SUPPORT_TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3355,
					"offsetEnd": 3361,
					"columnNum": 254
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSTurnOffAnyUniversalTool3",
				"otherPossibleNames": [],
				"logicalName": "READING_EMBEDDED_DESIGNED_SUPPORT_TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3362,
					"offsetEnd": 3368,
					"columnNum": 255
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EDSTurnOffAnyUniversalTool4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_EMBEDDED_DESIGNED_SUPPORT_TURN_OFF_ANY_UNIVERSAL_TOOLS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3369,
					"offsetEnd": 3375,
					"columnNum": 256
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSAmplification1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_AMPLIFICATION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3376,
					"offsetEnd": 3387,
					"columnNum": 257
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSAmplification2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_AMPLIFICATION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3388,
					"offsetEnd": 3399,
					"columnNum": 258
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSAmplification3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_AMPLIFICATION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3400,
					"offsetEnd": 3411,
					"columnNum": 259
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSAmplification4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_AMPLIFICATION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3412,
					"offsetEnd": 3423,
					"columnNum": 260
				},
				"fieldLength": 12,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorContrast1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3424,
					"offsetEnd": 3430,
					"columnNum": 261
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorContrast2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3431,
					"offsetEnd": 3437,
					"columnNum": 262
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorContrast3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3438,
					"offsetEnd": 3444,
					"columnNum": 263
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorContrast4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_COLOR_CONTRAST_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3445,
					"offsetEnd": 3451,
					"columnNum": 264
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorOverlay1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_COLOR_OVERLAY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3452,
					"offsetEnd": 3458,
					"columnNum": 265
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorOverlay2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_COLOR_OVERLAY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3459,
					"offsetEnd": 3465,
					"columnNum": 266
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorOverlay3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_COLOR_OVERLAY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3466,
					"offsetEnd": 3472,
					"columnNum": 267
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSColorOverlay4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_COLOR_OVERLAY_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3473,
					"offsetEnd": 3479,
					"columnNum": 268
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSInterfaceAssistant1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_DIA_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3480,
					"offsetEnd": 3487,
					"columnNum": 269
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSInterfaceAssistant2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_DIA_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3488,
					"offsetEnd": 3495,
					"columnNum": 270
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSInterfaceAssistant3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_DIA_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3496,
					"offsetEnd": 3503,
					"columnNum": 271
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSInterfaceAssistant4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_DIA_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3504,
					"offsetEnd": 3511,
					"columnNum": 272
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMagnification1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_MAGNIFICATION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3512,
					"offsetEnd": 3519,
					"columnNum": 273
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMagnification2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_MAGNIFICATION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3520,
					"offsetEnd": 3527,
					"columnNum": 274
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMagnification3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_MAGNIFICATION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3528,
					"offsetEnd": 3535,
					"columnNum": 275
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMagnification4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_MAGNIFICATION_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3536,
					"offsetEnd": 3543,
					"columnNum": 276
				},
				"fieldLength": 8,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMasking1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3544,
					"offsetEnd": 3556,
					"columnNum": 277
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMasking2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3557,
					"offsetEnd": 3569,
					"columnNum": 278
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMasking3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3570,
					"offsetEnd": 3582,
					"columnNum": 279
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMasking4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_MASKING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3583,
					"offsetEnd": 3595,
					"columnNum": 280
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMedicalSupports1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_MEDICAL_SUPPORTS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3596,
					"offsetEnd": 3606,
					"columnNum": 281
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMedicalSupports2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_MEDICAL_SUPPORTS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3607,
					"offsetEnd": 3617,
					"columnNum": 282
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMedicalSupports3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_MEDICAL_SUPPORTS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3618,
					"offsetEnd": 3628,
					"columnNum": 283
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSMedicalSupports4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_MEDICAL_SUPPORTS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3629,
					"offsetEnd": 3639,
					"columnNum": 284
				},
				"fieldLength": 11,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSNoiseBuffers1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_NOISE_BUFFERS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3640,
					"offsetEnd": 3652,
					"columnNum": 285
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSNoiseBuffers2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_NOISE_BUFFERS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3653,
					"offsetEnd": 3665,
					"columnNum": 286
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSNoiseBuffers3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_NOISE_BUFFERS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3666,
					"offsetEnd": 3678,
					"columnNum": 287
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSNoiseBuffers4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_NOISE_BUFFERS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3679,
					"offsetEnd": 3691,
					"columnNum": 288
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPrintonDemand1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_PRINT_ON_DEMAND_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3692,
					"offsetEnd": 3716,
					"columnNum": 289
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPrintonDemand2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_PRINT_ON_DEMAND_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3717,
					"offsetEnd": 3741,
					"columnNum": 290
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPrintonDemand3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_PRINT_ON_DEMAND_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3742,
					"offsetEnd": 3766,
					"columnNum": 291
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPrintonDemand4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_PRINT_ON_DEMAND_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3767,
					"offsetEnd": 3791,
					"columnNum": 292
				},
				"fieldLength": 25,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPauseorReplayAudio1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_PAUSE_OR_REPLAY_AUDIO_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3792,
					"offsetEnd": 3800,
					"columnNum": 293
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPauseorReplayAudio2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_PAUSE_OR_REPLAY_AUDIO_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3801,
					"offsetEnd": 3809,
					"columnNum": 294
				},
				"fieldLength": 9,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPauseorReplayAudio1-Read-Aloud Items (Online)",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_PAUSE_OR_REPLAY_AUDIO_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3810,
					"offsetEnd": 3822,
					"columnNum": 295
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSPauseorReplayAudio4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_PAUSE_OR_REPLAY_AUDIO_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3823,
					"offsetEnd": 3835,
					"columnNum": 296
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSeparateSetting1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_SEPARATE_SETTING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3836,
					"offsetEnd": 3842,
					"columnNum": 297
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSeparateSetting2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_SEPARATE_SETTING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3843,
					"offsetEnd": 3849,
					"columnNum": 298
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSeparateSetting3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_SEPARATE_SETTING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3850,
					"offsetEnd": 3856,
					"columnNum": 299
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSeparateSetting4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_SEPARATE_SETTING_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3857,
					"offsetEnd": 3863,
					"columnNum": 300
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSimplifiedTestDirections1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_SIMPLIFIED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3864,
					"offsetEnd": 3876,
					"columnNum": 301
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSimplifiedTestDirections2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_SIMPLIFIED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3877,
					"offsetEnd": 3889,
					"columnNum": 302
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSimplifiedTestDirections3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_SIMPLIFIED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3890,
					"offsetEnd": 3902,
					"columnNum": 303
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSSimplifiedTestDirections4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_SIMPLIFIED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3903,
					"offsetEnd": 3915,
					"columnNum": 304
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSTranslatedTestDirections1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_NON_EMBEDDED_DESIGNED_SUPPORT_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3916,
					"offsetEnd": 3930,
					"columnNum": 305
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSTranslatedTestDirections2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_NON_EMBEDDED_DESIGNED_SUPPORT_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3931,
					"offsetEnd": 3945,
					"columnNum": 306
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSTranslatedTestDirections3",
				"otherPossibleNames": [],
				"logicalName": "READING_NON_EMBEDDED_DESIGNED_SUPPORT_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3946,
					"offsetEnd": 3960,
					"columnNum": 307
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "NEDSTranslatedTestDirections4",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NON_EMBEDDED_DESIGNED_SUPPORT_TRANSLATED_TEST_DIRECTIONS_ONLINE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3961,
					"offsetEnd": 3975,
					"columnNum": 308
				},
				"fieldLength": 15,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SSREligibleMinus1",
				"otherPossibleNames": [],
				"logicalName": "SSR_ELIGIBLE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3976,
					"offsetEnd": 3976,
					"columnNum": 309
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AttemptednessMinus1",
				"otherPossibleNames": [],
				"logicalName": "ATTEMPTEDNESS_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3977,
					"offsetEnd": 3977,
					"columnNum": 310
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GradeAssessedMinus1",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3978,
					"offsetEnd": 3979,
					"columnNum": 311
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ConditionCodeMinus1",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3980,
					"offsetEnd": 3982,
					"columnNum": 312
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ListeningRawScoreMinus1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_RAW_SCORE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3983,
					"offsetEnd": 3984,
					"columnNum": 313
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SpeakingRawScoreMinus1",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_RAW_SCORE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3985,
					"offsetEnd": 3986,
					"columnNum": 314
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReadingRawScoreMinus1",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3987,
					"offsetEnd": 3988,
					"columnNum": 315
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WritingRawScoreMinus1",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3989,
					"offsetEnd": 3990,
					"columnNum": 316
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallScaleScoreMinus1",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_SCALE_SCORE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3991,
					"offsetEnd": 3994,
					"columnNum": 317
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallPLMinus1",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_PERFORMANCE_LEVEL_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3995,
					"offsetEnd": 3996,
					"columnNum": 318
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguageScaleScoreMinus1",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_SCALE_SCORE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 3997,
					"offsetEnd": 4000,
					"columnNum": 319
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguageCSEMMinus1",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4001,
					"offsetEnd": 4003,
					"columnNum": 320
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguagePLMinus1",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_PERFORMANCE_LEVEL_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4004,
					"offsetEnd": 4005,
					"columnNum": 321
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguageScaleScoreMinus1",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_SCALE_SCORE_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4006,
					"offsetEnd": 4009,
					"columnNum": 322
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguageCSEMMinus1",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4010,
					"offsetEnd": 4012,
					"columnNum": 323
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguagePLMinus1",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_PERFORMANCE_LEVEL_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4013,
					"offsetEnd": 4014,
					"columnNum": 324
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ListeningPLMinus1",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_PERFORMANCE_LEVEL_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4015,
					"offsetEnd": 4016,
					"columnNum": 325
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SpeakingPLMinus1",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_PERFORMANCE_LEVEL_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4017,
					"offsetEnd": 4018,
					"columnNum": 326
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReadingPLMinus1",
				"otherPossibleNames": [],
				"logicalName": "READING_PERFORMANCE_LEVEL_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4019,
					"offsetEnd": 4020,
					"columnNum": 327
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WritingPLMinus1",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERFORMANCE_LEVEL_MINUS_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4021,
					"offsetEnd": 4022,
					"columnNum": 328
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SSREligibleMinus2",
				"otherPossibleNames": [],
				"logicalName": "SSR_ELIGIBLE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4023,
					"offsetEnd": 4023,
					"columnNum": 329
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AttemptednessMinus2",
				"otherPossibleNames": [],
				"logicalName": "ATTEMPTEDNESS_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4024,
					"offsetEnd": 4024,
					"columnNum": 330
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GradeAssessedMinus2",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4025,
					"offsetEnd": 4026,
					"columnNum": 331
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ConditionCodeMinus2",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4027,
					"offsetEnd": 4029,
					"columnNum": 332
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ListeningRawScoreMinus2",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_RAW_SCORE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4030,
					"offsetEnd": 4031,
					"columnNum": 333
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SpeakingRawScoreMinus2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_RAW_SCORE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4032,
					"offsetEnd": 4033,
					"columnNum": 334
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReadingRawScoreMinus2",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4034,
					"offsetEnd": 4035,
					"columnNum": 335
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WritingRawScoreMinus2",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4036,
					"offsetEnd": 4037,
					"columnNum": 336
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallScaleScoreMinus2",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_SCALE_SCORE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4038,
					"offsetEnd": 4041,
					"columnNum": 337
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallPLMinus2",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_PERFORMANCE_LEVEL_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4042,
					"offsetEnd": 4042,
					"columnNum": 338
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguageScaleScoreMinus2",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_SCALE_SCORE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4043,
					"offsetEnd": 4046,
					"columnNum": 339
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguageCSEMMinus2",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4047,
					"offsetEnd": 4049,
					"columnNum": 340
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguagePLMinus2",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_PERFORMANCE_LEVEL_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4050,
					"offsetEnd": 4050,
					"columnNum": 341
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguageScaleScoreMinus2",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_SCALE_SCORE_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4051,
					"offsetEnd": 4054,
					"columnNum": 342
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguageCSEMMinus2",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4055,
					"offsetEnd": 4057,
					"columnNum": 343
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguagePLMinus2",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_PERFORMANCE_LEVEL_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4058,
					"offsetEnd": 4058,
					"columnNum": 344
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ListeningPLMinus2",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_PERFORMANCE_LEVEL_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4059,
					"offsetEnd": 4059,
					"columnNum": 345
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SpeakingPLMinus2",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_PERFORMANCE_LEVEL_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4060,
					"offsetEnd": 4060,
					"columnNum": 346
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReadingPLMinus2",
				"otherPossibleNames": [],
				"logicalName": "READING_PERFORMANCE_LEVEL_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4061,
					"offsetEnd": 4061,
					"columnNum": 347
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WritingPLMinus2",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERFORMANCE_LEVEL_MINUS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4062,
					"offsetEnd": 4062,
					"columnNum": 348
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SSREligibleMinus3",
				"otherPossibleNames": [],
				"logicalName": "SSR_ELIGIBLE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4063,
					"offsetEnd": 4063,
					"columnNum": 349
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AttemptednessMinus3",
				"otherPossibleNames": [],
				"logicalName": "ATTEMPTEDNESS_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4064,
					"offsetEnd": 4064,
					"columnNum": 350
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "GradeAssessedMinus3",
				"otherPossibleNames": [],
				"logicalName": "GRADE_ASSESSED_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4065,
					"offsetEnd": 4066,
					"columnNum": 351
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ConditionCodeMinus3",
				"otherPossibleNames": [],
				"logicalName": "CONDITION_CODE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4067,
					"offsetEnd": 4069,
					"columnNum": 352
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ListeningRawScoreMinus3",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_RAW_SCORE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4070,
					"offsetEnd": 4071,
					"columnNum": 353
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SpeakingRawScoreMinus3",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_RAW_SCORE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4072,
					"offsetEnd": 4073,
					"columnNum": 354
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReadingRawScoreMinus3",
				"otherPossibleNames": [],
				"logicalName": "READING_RAW_SCORE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4074,
					"offsetEnd": 4075,
					"columnNum": 355
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WritingRawScoreMinus3",
				"otherPossibleNames": [],
				"logicalName": "WRITING_RAW_SCORE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4076,
					"offsetEnd": 4077,
					"columnNum": 356
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallScaleScoreMinus3",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_SCALE_SCORE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4078,
					"offsetEnd": 4081,
					"columnNum": 357
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OverallPLMinus3",
				"otherPossibleNames": [],
				"logicalName": "OVERALL_PERFORMANCE_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4082,
					"offsetEnd": 4082,
					"columnNum": 358
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguageScaleScoreMinus3",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_SCALE_SCORE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4083,
					"offsetEnd": 4086,
					"columnNum": 359
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguageCSEMMinus3",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4087,
					"offsetEnd": 4089,
					"columnNum": 360
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OralLanguagePLMinus3",
				"otherPossibleNames": [],
				"logicalName": "ORAL_LANGUAGE_PERFORMANCE_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4090,
					"offsetEnd": 4090,
					"columnNum": 361
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguageScaleScoreMinus3",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_SCALE_SCORE_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4091,
					"offsetEnd": 4094,
					"columnNum": 362
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguageCSEMMinus3",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_STANDARD_ERROR_OF_MEASUREMENT_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4095,
					"offsetEnd": 4097,
					"columnNum": 363
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WrittenLanguagePLMinus3",
				"otherPossibleNames": [],
				"logicalName": "WRITTEN_LANGUAGE_PERFORMANCE_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4098,
					"offsetEnd": 4098,
					"columnNum": 364
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ListeningPLMinus3",
				"otherPossibleNames": [],
				"logicalName": "LISTENING_PERFORMANCE_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4099,
					"offsetEnd": 4099,
					"columnNum": 365
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SpeakingPLMinus3",
				"otherPossibleNames": [],
				"logicalName": "SPEAKING_PERFORMANCE_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4100,
					"offsetEnd": 4100,
					"columnNum": 366
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReadingPLMinus3",
				"otherPossibleNames": [],
				"logicalName": "READING_PERFORMANCE_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4101,
					"offsetEnd": 4101,
					"columnNum": 367
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "WritingPLMinus3",
				"otherPossibleNames": [],
				"logicalName": "WRITING_PERFORMANCE_LEVEL_MINUS_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4102,
					"offsetEnd": 4102,
					"columnNum": 368
				},
				"fieldLength": 1,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ReportCreatedDate",
				"otherPossibleNames": [],
				"logicalName": "REPORT_CREATED_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4103,
					"offsetEnd": 4112,
					"columnNum": 369
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EndofRecord",
				"otherPossibleNames": [],
				"logicalName": "END_OF_RECORD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 4113,
					"offsetEnd": 4114,
					"columnNum": 370
				},
				"fieldLength": 2,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			}
		]
	},
	"fileExtensions": [".csv", ".txt", ".dat"]
}